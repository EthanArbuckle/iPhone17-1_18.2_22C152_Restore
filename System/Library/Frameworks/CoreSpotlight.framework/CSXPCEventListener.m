@interface CSXPCEventListener
+ (id)sharedInstance;
+ (void)disable;
+ (void)initialize;
- (BOOL)handleMessage:(id)a3 connection:(id)a4;
- (CSXPCEventListener)init;
- (id)description;
- (int)embeddingsJobCount;
- (int)keyphrasesJobCount;
- (int)preExtractionJobCount;
- (int)priorityJobCount;
- (void)handleDeviceLocking;
- (void)handleDeviceUnlocked;
- (void)handleEmbeddingsTaskScheduling;
- (void)handleKeyphrasesTaskScheduling;
- (void)handlePreExtractionTaskScheduling;
- (void)handlePriorityTaskScheduling;
- (void)lostConnection:(id)a3 error:(id)a4;
- (void)startWithEventListeners:(id)a3;
- (void)updatePathSet:(id)a3 withFilesAtPath:(id)a4 shouldRemove:(BOOL)a5;
@end

@implementation CSXPCEventListener

- (BOOL)handleMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  v6 = [[CSEventMessage alloc] initWithMessage:v5];
  v7 = v6;
  if (v6 && (v6->_event - 1) < 4)
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008AA8;
    v11[3] = &unk_1000DAEB0;
    v12 = v6;
    id v13 = v5;
    dispatch_async(queue, v11);

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### invalid event %@ - %@", buf, 0x16u);
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (id)sharedInstance
{
  return (id)qword_1000F90F8;
}

- (id)description
{
  id v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"<%@:%p; started:%d >",
         objc_opt_class(),
         self,
         self->_started);

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)qword_1000F90F8;
    qword_1000F90F8 = v2;
  }
}

+ (void)disable
{
  uint64_t v2 = sub_10000F2B8();
  v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];

  if (v3)
  {
    v4 = [v3 URLByDeletingLastPathComponent];
    id v5 = +[NSFileManager defaultManager];
    v6 = [v4 path];
    unsigned int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [v4 path];
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### disable root path %@", buf, 0xCu);
      }
      BOOL v9 = +[NSFileManager defaultManager];
      id v12 = 0;
      unsigned __int8 v10 = [v9 removeItemAtURL:v4 error:&v12];
      id v11 = v12;

      if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A1EEC((uint64_t)v4, (uint64_t)v11);
      }
    }
    else
    {
      id v11 = 0;
    }
  }
}

- (void)updatePathSet:(id)a3 withFilesAtPath:(id)a4 shouldRemove:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  id v18 = a4;
  v20 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:");
  v8 = +[NSFileManager defaultManager];
  BOOL v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLIsRegularFileKey, 0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100063FD0;
  v26[3] = &unk_1000D9A08;
  v26[4] = &v27;
  v19 = [v8 enumeratorAtURL:v20 includingPropertiesForKeys:v9 options:4 errorHandler:v26];

  if (*((unsigned char *)v28 + 24))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v19;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v13);
          id v21 = 0;
          [v14 getResourceValue:&v21 forKey:NSURLIsRegularFileKey error:0];
          id v15 = v21;
          if ([v15 BOOLValue])
          {
            __int16 v16 = [v14 URLByDeletingLastPathComponent];
            v17 = [v16 path];
            if (v5) {
              [v7 removeObject:v17];
            }
            else {
              [v7 addObject:v17];
            }
          }
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v11);
    }
  }
  _Block_object_dispose(&v27, 8);
}

- (void)startWithEventListeners:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100064098;
  v5[3] = &unk_1000DAEB0;
  v5[4] = self;
  id v6 = a3;
  uint64_t v3 = qword_1000F9100;
  id v4 = v6;
  if (v3 != -1) {
    dispatch_once(&qword_1000F9100, v5);
  }
}

- (CSXPCEventListener)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSXPCEventListener;
  uint64_t v2 = [(CSXPCEventListener *)&v10 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_initially_inactive(0);
    id v4 = dispatch_queue_attr_make_with_overcommit();
    BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.spotlight.eventlistener.queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)lostConnection:(id)a3 error:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### lost connection - %@", (uint8_t *)&v5, 0xCu);
  }
  dispatch_async((dispatch_queue_t)self->_queue, &stru_1000DB7D8);
}

- (void)handleDeviceLocking
{
}

- (void)handleDeviceUnlocked
{
}

- (int)embeddingsJobCount
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    uint64_t v4 = +[CSIndexEventListener indexEventListenerForType:v2 allowCreate:0];
    int v5 = (id *)v4;
    if (v4 && [*(id *)(v4 + 24) count])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = v5[3];
        v8 = [v7 objectAtIndexedSubscript:v6];
        if (sub_1000578F8((BOOL)v8))
        {
          BOOL v9 = [v5[3] objectAtIndexedSubscript:v6];
          objc_super v10 = sub_10000F9B0((uint64_t)v9);
          id v11 = sub_10000D688((uint64_t)v10);
          unsigned int v12 = [v11 eventType];

          if (v12 == 1) {
            ++v3;
          }
        }
        else
        {
        }
        ++v6;
      }
      while (v6 < (unint64_t)[v5[3] count]);
    }

    ++v2;
  }
  while (v2 != 6);
  return v3;
}

- (void)handleEmbeddingsTaskScheduling
{
}

- (int)keyphrasesJobCount
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    uint64_t v4 = +[CSIndexEventListener indexEventListenerForType:v2 allowCreate:0];
    int v5 = (id *)v4;
    if (v4 && [*(id *)(v4 + 24) count])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = v5[3];
        v8 = [v7 objectAtIndexedSubscript:v6];
        if (sub_1000578F8((BOOL)v8))
        {
          BOOL v9 = [v5[3] objectAtIndexedSubscript:v6];
          objc_super v10 = sub_10000F9B0((uint64_t)v9);
          id v11 = sub_10000D688((uint64_t)v10);
          unsigned int v12 = [v11 eventType];

          if (v12 == 2) {
            ++v3;
          }
        }
        else
        {
        }
        ++v6;
      }
      while (v6 < (unint64_t)[v5[3] count]);
    }

    ++v2;
  }
  while (v2 != 6);
  return v3;
}

- (void)handleKeyphrasesTaskScheduling
{
}

- (int)preExtractionJobCount
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    uint64_t v4 = +[CSIndexEventListener indexEventListenerForType:v2 allowCreate:0];
    int v5 = (id *)v4;
    if (v4 && [*(id *)(v4 + 24) count])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = [v5[3] objectAtIndexedSubscript:v6];
        v8 = sub_10000F9B0((uint64_t)v7);
        BOOL v9 = sub_10000D688((uint64_t)v8);
        unsigned int v10 = [v9 eventType];

        id v11 = [v5[3] objectAtIndexedSubscript:v6];
        if (sub_1000578F8((BOOL)v11))
        {

          if ((v10 & 0xFFFFFFFE) == 6) {
            ++v3;
          }
        }
        else
        {
        }
        ++v6;
      }
      while (v6 < (unint64_t)[v5[3] count]);
    }

    ++v2;
  }
  while (v2 != 6);
  return v3;
}

- (void)handlePreExtractionTaskScheduling
{
}

- (int)priorityJobCount
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    uint64_t v4 = +[CSIndexEventListener indexEventListenerForType:v2 allowCreate:0];
    int v5 = (id *)v4;
    if (v4 && [*(id *)(v4 + 24) count])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = v5[3];
        v8 = [v7 objectAtIndexedSubscript:v6];
        if (sub_1000578F8((BOOL)v8))
        {
          BOOL v9 = [v5[3] objectAtIndexedSubscript:v6];
          unsigned int v10 = sub_10000F9B0((uint64_t)v9);
          id v11 = sub_10000D688((uint64_t)v10);
          unsigned int v12 = [v11 eventType];

          if (!v12) {
            ++v3;
          }
        }
        else
        {
        }
        ++v6;
      }
      while (v6 < (unint64_t)[v5[3] count]);
    }

    ++v2;
  }
  while (v2 != 6);
  return v3;
}

- (void)handlePriorityTaskScheduling
{
}

- (void).cxx_destruct
{
}

@end