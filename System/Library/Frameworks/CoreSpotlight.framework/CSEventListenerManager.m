@interface CSEventListenerManager
- (CSEventListenerManager)initWithIndexType:(int)a3 indexPath:(id)a4 eventListener:(id)a5;
- (id)description;
- (void)_cleanupJournalsWithEvent:(id)a3;
- (void)_loadJournals;
- (void)dealloc;
- (void)dropAssertions:(id)a3;
- (void)processJournals;
- (void)registerJournalWithIno:(id)a3 journalIno:(unint64_t)a4 dev:(int)a5 journalNumber:(unint64_t)a6 journalCookie:(id)a7;
- (void)runThrottledTaskAsync;
- (void)sortJournals;
- (void)startUp;
- (void)takeAssertions:(id)a3;
@end

@implementation CSEventListenerManager

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = sub_100005F74(self->_indexType);
  eventListener = self->_eventListener;
  if (eventListener) {
    delegate = eventListener->_delegate;
  }
  else {
    delegate = 0;
  }
  v8 = [(CSEventListenerDelegate *)delegate taskName];
  id v9 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p; %s %@ fd:%d>",
         v4,
         self,
         v5,
         v8,
         self->_folderFd);

  return v9;
}

- (void)_cleanupJournalsWithEvent:(id)a3
{
  id v4 = a3;
  p_journalQueueLock = &self->_journalQueueLock;
  pthread_rwlock_rdlock(&self->_journalQueueLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (self) {
    journalQueue = self->_journalQueue;
  }
  else {
    journalQueue = 0;
  }
  v6 = journalQueue;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        if (v11) {
          v12 = (const char *)v11[13];
        }
        else {
          v12 = 0;
        }
        v13 = (const char *)sub_10000F9A4((uint64_t)v4);
        if (!strcmp(v12, v13))
        {
          if (v11)
          {
            if (v11[17] >= v11[16])
            {
              unint64_t v17 = v11[9];
              if (v17 < sub_10000F9B0((uint64_t)v4))
              {
                uint64_t v18 = v11[16];
LABEL_20:
                [v11 markComplete:v18 processingDone:1];
              }
            }
          }
          else if (sub_10000F9B0((uint64_t)v4))
          {
            uint64_t v18 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          [v11 markComplete:-1 processingDone:1];
          v14 = sub_100050698();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            if (v11)
            {
              uint64_t v15 = v11[13];
              uint64_t v16 = v11[9];
            }
            else
            {
              uint64_t v15 = 0;
              uint64_t v16 = 0;
            }
            *(_DWORD *)buf = 136315650;
            uint64_t v26 = v15;
            __int16 v27 = 2048;
            uint64_t v28 = v16;
            __int16 v29 = 2112;
            id v30 = v4;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "### cleanup journal [cookie:%s jno:%llu] due to cookie mismatch with the event message recieved [%@]", buf, 0x20u);
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v19 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
      id v8 = v19;
    }
    while (v19);
  }

  pthread_rwlock_unlock(p_journalQueueLock);
}

- (void)processJournals
{
  p_journalQueueLock = &self->_journalQueueLock;
  pthread_rwlock_rdlock(&self->_journalQueueLock);
  uint64_t v4 = [(NSMutableArray *)self->_journalQueue firstObject];
  id v5 = [(NSMutableArray *)self->_journalQueue count];
  pthread_rwlock_unlock(p_journalQueueLock);
  if (!v4)
  {
LABEL_29:
    long long v23 = sub_100050698();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [(NSMutableArray *)self->_journalQueue count];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "### no journals available - %@, queue size = %lu", buf, 0x16u);
    }
    else
    {

      if (!self)
      {
        uint64_t v16 = 0;
        v25 = 0;
LABEL_34:
        +[CSEventListenerTasksManager eventListenerJobEnd:[(CSEventListener *)v25 eventType]];
        goto LABEL_35;
      }
    }
    v25 = self->_eventListener;
    uint64_t v16 = v25;
    if (v25) {
      v25 = (CSEventListener *)v25->_delegate;
    }
    goto LABEL_34;
  }
  while (([(id)v4 isComplete] & 1) != 0)
  {
    if (v5 == (id)1 && !*(unsigned char *)(v4 + 9))
    {

      goto LABEL_29;
    }
LABEL_11:
    if (*(unsigned char *)(v4 + 11))
    {
      pthread_rwlock_wrlock(&self->_journalMapLock);
      [(NSMutableDictionary *)self->_journalMap removeObjectForKey:*(void *)(v4 + 64)];
      pthread_rwlock_unlock(&self->_journalMapLock);
    }
    [(id)v4 cooldown];
    pthread_rwlock_wrlock(p_journalQueueLock);
    [(NSMutableArray *)self->_journalQueue removeObjectAtIndex:0];
    [(id)v4 deleteFiles];
    pthread_rwlock_unlock(p_journalQueueLock);
    +[SKGUpdaterStore flushAndCommitAll];
    uint64_t v9 = sub_100050698();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "### finished %@ - %@", buf, 0x16u);
    }

    pthread_rwlock_rdlock(p_journalQueueLock);
    uint64_t v10 = [(NSMutableArray *)self->_journalQueue firstObject];

    id v5 = [(NSMutableArray *)self->_journalQueue count];
    pthread_rwlock_unlock(p_journalQueueLock);
    uint64_t v4 = v10;
    if (!v10) {
      goto LABEL_29;
    }
  }
  [(id)v4 warmup];
  if (*(unsigned char *)(v4 + 12)) {
    goto LABEL_20;
  }
  BOOL v6 = *(_DWORD *)(v4 + 56) < 10;
  id v7 = sub_100050698();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (!v6)
  {
    if (v8)
    {
      uint64_t v11 = *(void *)(v4 + 96);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "### Unable to warmup %@ - %s, deleting it.", buf, 0x16u);
    }

    goto LABEL_11;
  }
  if (v8) {
    sub_1000A1424(v4, (uint64_t)self, v7);
  }

LABEL_20:
  v12 = +[NSString stringWithFormat:@"processJournals %@", self];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v36 = sub_100012694;
  v37 = sub_100012568;
  id v38 = 0;
  id v13 = v12;
  [v13 UTF8String];
  id v38 = (id)os_transaction_create();
  v14 = sub_100050698();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v31 = 138412546;
    v32 = self;
    __int16 v33 = 2112;
    uint64_t v34 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "### batch start %@ - %@", v31, 0x16u);
  }

  queue = self->_queue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100011D8C;
  v30[3] = &unk_1000DB240;
  v30[4] = self;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100011FAC;
  v29[3] = &unk_1000DB268;
  v29[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000CF40;
  v26[3] = &unk_1000DB290;
  v26[4] = self;
  uint64_t v16 = (CSEventListener *)(id)v4;
  __int16 v27 = v16;
  uint64_t v28 = buf;
  if (([(CSEventListener *)v16 processNext:queue startingBatch:v30 endingBatch:v29 completion:v26] & 1) == 0)
  {
    sub_1000579BC(self, 44);
    unint64_t v17 = sub_100050698();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [(NSMutableArray *)self->_journalQueue count];
      *(_DWORD *)v31 = 138412546;
      v32 = self;
      __int16 v33 = 2048;
      uint64_t v34 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "### not processing journals anymore - %@ , queue size = %lu", v31, 0x16u);
    }

    id v19 = self->_eventListener;
    v20 = v19;
    if (v19) {
      delegate = v19->_delegate;
    }
    else {
      delegate = 0;
    }
    long long v22 = delegate;
    +[CSEventListenerTasksManager eventListenerJobEnd:[(CSEventListenerDelegate *)v22 eventType]];
  }
  _Block_object_dispose(buf, 8);

LABEL_35:
}

- (void)_loadJournals
{
  int folderFd = self->_folderFd;
  bzero(buf, 0x400uLL);
  BOOL v4 = fcntl(folderFd, 50, buf) == -1 || buf[0] == 0;
  if (v4 || (id v5 = opendir((const char *)buf)) == 0)
  {
    i = 0;
  }
  else
  {
    BOOL v6 = v5;
    id v7 = readdir(v5);
    for (i = 0; v7; id v7 = readdir(v6))
    {
      if ((v7->d_type | 2) == 0xA || v7->d_namlen > 0xFEu)
      {
        d_name = v7->d_name;
        if (!strncmp(v7->d_name, "evt_", 4uLL))
        {
          uint64_t v10 = strrchr(d_name, 46);
          uint64_t v11 = v10;
          if (!v10 || (v12 = v10 + 1, !v11[1]) || !strncmp(v12, "journal", 7uLL))
          {
            memset(v55, 0, 255);
            __strncpy_chk();
            id v13 = +[NSString stringWithUTF8String:v55];
            if (i)
            {
              [i addObject:v13];
            }
            else
            {
              i = +[NSMutableArray arrayWithObject:v13];
            }
          }
        }
      }
    }
    closedir(v6);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = i;
  id v49 = [v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v49)
  {
    char v47 = 0;
    uint64_t v48 = *(void *)v51;
    p_journalQueueLock = &self->_journalQueueLock;
    id obj = v14;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(CSEventListenerManager **)(*((void *)&v50 + 1) + 8 * (void)v15);
        unint64_t v17 = [(CSEventListenerManager *)v16 componentsSeparatedByString:@"_"];
        if ([v17 count] != (id)5)
        {
          id v18 = sub_100050698();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CSEventListenerManager#_loadJournals invalid journalName %@", buf, 0xCu);
          }
        }
        id v19 = objc_alloc_init((Class)NSNumberFormatter);
        v20 = [v17 objectAtIndexedSubscript:4];
        long long v21 = [v20 componentsSeparatedByString:@"."];
        long long v22 = [v21 objectAtIndexedSubscript:0];
        long long v23 = [v19 numberFromString:v22];

        id v24 = [v23 unsignedLongLongValue];
        v25 = [v17 objectAtIndexedSubscript:2];
        uint64_t v26 = [CSJournalProcessor alloc];
        if (self) {
          uint64_t v27 = self->_folderFd;
        }
        else {
          uint64_t v27 = 0;
        }
        uint64_t v28 = [(CSJournalProcessor *)v26 initWithParentFd:v27 eventListener:self->_eventListener indexType:self->_indexType journalNumber:v24 journalCookie:v25 name:v16];
        id v30 = v28;
        if (v28)
        {
          objc_setProperty_nonatomic_copy(v28, v29, &stru_1000DB1D8, 168);
          pthread_rwlock_wrlock(&self->_journalMapLock);
          key = v30->_key;
          v32 = self->_journalMap;
          __int16 v33 = [(NSMutableDictionary *)v32 objectForKeyedSubscript:key];

          p_journalMapLock = &self->_journalMapLock;
          if (!v33)
          {
            v35 = v30->_key;
            v36 = self->_journalMap;
            [(NSMutableDictionary *)v36 setObject:v30 forKeyedSubscript:v35];

            pthread_rwlock_unlock(&self->_journalMapLock);
            pthread_rwlock_wrlock(p_journalQueueLock);
            [(NSMutableArray *)self->_journalQueue addObject:v30];
            p_journalMapLock = &self->_journalQueueLock;
          }
          pthread_rwlock_unlock(p_journalMapLock);
          char v47 = 1;
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v49 != v15);
      id v14 = obj;
      id v37 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      id v49 = v37;
    }
    while (v37);

    if (v47)
    {
      [(CSEventListenerManager *)self sortJournals];
      pthread_rwlock_rdlock(p_journalQueueLock);
      id v38 = (char *)[(NSMutableArray *)self->_journalQueue count];
      if (v38)
      {
        v39 = v38;
        for (j = 0; j != v39; ++j)
        {
          if (self) {
            journalQueue = self->_journalQueue;
          }
          else {
            journalQueue = 0;
          }
          v42 = journalQueue;
          v43 = [(NSMutableArray *)v42 objectAtIndexedSubscript:j];

          [v43 markComplete:0 processingDone:0];
          v44 = sub_100050698();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v57 = self;
            __int16 v58 = 2112;
            v59 = v43;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "### loaded %@ - %@ ", buf, 0x16u);
          }
        }
      }
      pthread_rwlock_unlock(p_journalQueueLock);
      id v14 = obj;
    }
  }
  else
  {
  }
}

- (void)sortJournals
{
  p_journalQueueLock = &self->_journalQueueLock;
  pthread_rwlock_wrlock(&self->_journalQueueLock);
  if (self) {
    journalQueue = self->_journalQueue;
  }
  else {
    journalQueue = 0;
  }
  if ((unint64_t)[(NSMutableArray *)journalQueue count] >= 2)
  {
    if (self) {
      id v5 = self->_journalQueue;
    }
    else {
      id v5 = 0;
    }
    [(NSMutableArray *)v5 sortUsingComparator:&stru_1000DB218];
  }

  pthread_rwlock_unlock(p_journalQueueLock);
}

- (CSEventListenerManager)initWithIndexType:(int)a3 indexPath:(id)a4 eventListener:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (id *)a5;
  v43.receiver = self;
  v43.super_class = (Class)CSEventListenerManager;
  uint64_t v10 = [(CSEventListenerManager *)&v43 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_21;
  }
  v10->_indexType = a3;
  objc_storeStrong((id *)&v10->_eventListener, a5);
  v11->_int folderFd = -1;
  v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 fileExistsAtPath:v8];

  if (!v13)
  {
LABEL_20:

    uint64_t v11 = 0;
    goto LABEL_21;
  }
  id v14 = v8;
  int v15 = open((const char *)[v14 fileSystemRepresentation], 0x8000);
  v11->_int folderFd = v15;
  if (v15 == -1)
  {
    id v38 = sub_100050698();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1000A1388((uint64_t)v14, v38);
    }

    goto LABEL_20;
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  *(_OWORD *)__str = 0u;
  long long v49 = 0u;
  if (v9)
  {
    id v16 = [v9[1] taskName];
    unint64_t v17 = (const char *)[v16 UTF8String];

    id v18 = sub_100005F74(a3);
    snprintf(__str, 0x100uLL, "com.apple.spotlight.indexevents.%s.%s.queue", v18, v17);
    id v19 = v9[1];
  }
  else
  {
    id v40 = [0 taskName];
    v41 = (const char *)[v40 UTF8String];

    v42 = sub_100005F74(a3);
    snprintf(__str, 0x100uLL, "com.apple.spotlight.indexevents.%s.%s.queue", v42, v41);
    id v19 = 0;
  }
  if ([v19 eventType] == 1
    && (+[SKGSystemListener sharedProcessorListener],
        v20 = objc_claimAutoreleasedReturnValue(),
        unsigned int v21 = [v20 enableEmbeddingsHigherQoS],
        v20,
        v21))
  {
    long long v22 = sub_100050698();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      if (v9) {
        id v23 = v9[1];
      }
      else {
        id v23 = 0;
      }
      unsigned int v24 = [v23 eventType];
      *(_DWORD *)buf = 67109376;
      unsigned int v45 = v24;
      __int16 v46 = 1024;
      int v47 = a3;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "### Using QOS_CLASS_UTILITY for eventType: %u indexType: %u", buf, 0xEu);
    }

    dispatch_qos_class_t v25 = QOS_CLASS_UTILITY;
  }
  else
  {
    dispatch_qos_class_t v25 = 5;
  }
  uint64_t v26 = dispatch_queue_attr_make_with_overcommit();
  uint64_t v27 = dispatch_queue_attr_make_with_autorelease_frequency(v26, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v28 = dispatch_queue_attr_make_with_qos_class(v27, v25, 0);

  dispatch_queue_t v29 = dispatch_queue_create(__str, v28);
  queue = v11->_queue;
  v11->_queue = (OS_dispatch_queue *)v29;

  if (v9) {
    id v31 = v9[1];
  }
  else {
    id v31 = 0;
  }
  v11->_throttled = !+[CSEventListenerTasksManager alwaysAllowed:](CSEventListenerTasksManager, "alwaysAllowed:", [v31 eventType]);
  uint64_t v32 = objc_opt_new();
  journalMap = v11->_journalMap;
  v11->_journalMap = (NSMutableDictionary *)v32;

  uint64_t v34 = objc_opt_new();
  journalQueue = v11->_journalQueue;
  v11->_journalQueue = (NSMutableArray *)v34;

  pthread_rwlock_init(&v11->_journalMapLock, 0);
  pthread_rwlock_init(&v11->_journalQueueLock, 0);
  v11->_isAssertionsAllowed = (a3 - 1) < 2;
  v36 = [[CSThresholdedTrigger alloc] initWithCountThreshold:1000 timeInterval:900.0];
  thresholdTrigger = v11->_thresholdTrigger;
  v11->_thresholdTrigger = v36;

LABEL_21:
  return v11;
}

- (void)runThrottledTaskAsync
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000575E0;
  block[3] = &unk_1000DA128;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startUp
{
  sub_100034E44();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057798;
  block[3] = &unk_1000DA128;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  int folderFd = self->_folderFd;
  if (folderFd != -1)
  {
    close(folderFd);
    self->_int folderFd = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSEventListenerManager;
  [(CSEventListenerManager *)&v4 dealloc];
}

- (void)registerJournalWithIno:(id)a3 journalIno:(unint64_t)a4 dev:(int)a5 journalNumber:(unint64_t)a6 journalCookie:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a7;
  long long v45 = 0u;
  memset(v46, 0, sizeof(v46));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)__str = 0u;
  snprintf(__str, 0xFFuLL, "/.vol/%u/%llu", v9, a4);
  id v14 = +[NSString stringWithUTF8String:__str];
  pthread_rwlock_wrlock(&self->_journalMapLock);
  if (self) {
    journalMap = self->_journalMap;
  }
  else {
    journalMap = 0;
  }
  p_isa = [(NSMutableDictionary *)journalMap objectForKeyedSubscript:v14];
  pthread_rwlock_unlock(&self->_journalMapLock);
  if (!p_isa)
  {
    id v30 = [CSJournalProcessor alloc];
    id v31 = v12;
    unint64_t v17 = a6;
    if (self) {
      uint64_t folderFd = self->_folderFd;
    }
    else {
      uint64_t folderFd = 0;
    }
    eventListener = self->_eventListener;
    uint64_t indexType = self->_indexType;
    id v29 = v13;
    id v21 = [v13 UTF8String];
    id v22 = [v31 UTF8String];
    id v23 = [(CSJournalProcessor *)v30 initWithParentFd:folderFd eventListener:eventListener key:v14 indexType:indexType journalIno:a4 dev:v9 journalNumber:v17 journalCookie:v21 journalName:v22];
    if (v23)
    {
      p_isa = &v23->super.isa;
      objc_setProperty_nonatomic_copy(v23, v24, &stru_1000DB2B0, 168);
      pthread_rwlock_wrlock(&self->_journalMapLock);
      uint64_t v25 = p_isa[8];
      uint64_t v26 = self->_journalMap;
      [(NSMutableDictionary *)v26 setObject:p_isa forKeyedSubscript:v25];

      pthread_rwlock_unlock(&self->_journalMapLock);
      pthread_rwlock_wrlock(&self->_journalQueueLock);
      uint64_t v27 = self->_journalQueue;
      [(NSMutableArray *)v27 setObject:p_isa atIndexedSubscript:[(NSMutableArray *)v27 count]];

      pthread_rwlock_unlock(&self->_journalQueueLock);
    }
    else
    {
      uint64_t v28 = sub_100050698();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000A14A0();
      }

      p_isa = 0;
    }
    id v12 = v31;
    id v13 = v29;
  }
}

- (void)takeAssertions:(id)a3
{
  id v4 = a3;
  if (self->_isAssertionsAllowed)
  {
    p_journalQueueLock = &self->_journalQueueLock;
    pthread_rwlock_rdlock(&self->_journalQueueLock);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = self->_journalQueue;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      uint64_t v9 = &xmmword_1000B69D0;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v10);
          if (v11) {
            uint64_t v12 = v11[12];
          }
          else {
            uint64_t v12 = 0;
          }
          id v13 = +[NSString stringWithUTF8String:v12];
          if (([v4 containsObject:v13] & 1) == 0)
          {
            int v14 = [v11 retainJournalFd];
            if (v14 == -1)
            {
              int v15 = sub_100050698();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v30 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "### Unable to take assertion on %@, fd = -1", buf, 0xCu);
              }
            }
            else
            {
              long long v24 = *v9;
              if (fcntl(v14, 108, &v24, p_journalQueueLock) < 0)
              {
                id v16 = v9;
                unint64_t v17 = sub_100050698();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  int v23 = *__error();
                  id v18 = __error();
                  id v19 = strerror(*v18);
                  *(_DWORD *)buf = 138412802;
                  id v30 = v13;
                  __int16 v31 = 1024;
                  int v32 = v23;
                  __int16 v33 = 2080;
                  long long v34 = v19;
                  _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "### Unable to take assertion on %@: %d(%s)", buf, 0x1Cu);
                }

                uint64_t v9 = v16;
              }
              else
              {
                [v4 addObject:v13];
              }
              [v11 releaseJournalFd];
            }
          }

          uint64_t v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        id v20 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v25 objects:v35 count:16];
        id v7 = v20;
      }
      while (v20);
    }

    pthread_rwlock_unlock(p_journalQueueLock);
  }
  else
  {
    id v21 = sub_100050698();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000A1684();
    }
  }
}

- (void)dropAssertions:(id)a3
{
  id v4 = a3;
  if (self->_isAssertionsAllowed)
  {
    p_journalQueueLock = &self->_journalQueueLock;
    pthread_rwlock_rdlock(&self->_journalQueueLock);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = self->_journalQueue;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v9);
          if (v10) {
            uint64_t v11 = v10[12];
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = +[NSString stringWithUTF8String:v11];
          if (([v4 containsObject:v12] & 1) == 0)
          {
            int v13 = [v10 retainJournalFd];
            if (v13 == -1)
            {
              int v14 = sub_100050698();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                long long v27 = v12;
                _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "### Unable to take assertion on %@, fd = -1", buf, 0xCu);
              }
            }
            else
            {
              if (fcntl(v13, 109, 0, p_journalQueueLock) < 0)
              {
                int v15 = sub_100050698();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  int v16 = *__error();
                  unint64_t v17 = __error();
                  id v18 = strerror(*v17);
                  *(_DWORD *)buf = 138412802;
                  long long v27 = v12;
                  __int16 v28 = 1024;
                  int v29 = v16;
                  __int16 v30 = 2080;
                  __int16 v31 = v18;
                  _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "### Unable to drop assertion on %@: %d(%s)", buf, 0x1Cu);
                }
              }
              else
              {
                [v4 addObject:v12];
              }
              [v10 releaseJournalFd];
            }
          }

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
        id v7 = v19;
      }
      while (v19);
    }

    pthread_rwlock_unlock(p_journalQueueLock);
  }
  else
  {
    id v20 = sub_100050698();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000A16FC();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdTrigger, 0);
  objc_storeStrong((id *)&self->_journalQueue, 0);
  objc_storeStrong((id *)&self->_journalMap, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end