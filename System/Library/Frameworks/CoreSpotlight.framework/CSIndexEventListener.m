@interface CSIndexEventListener
+ (id)indexEventListenerForType:(int)a3 allowCreate:(BOOL)a4;
- (CSIndexEventListener)initWithType:(int)a3;
- (id)description;
- (void)handleDeviceLocking;
- (void)handleDeviceUnlocked;
- (void)handleMessage:(id)a3;
- (void)lostConnection;
- (void)processJournalsOnStartupForJournalsPath:(id)a3;
@end

@implementation CSIndexEventListener

- (void)handleMessage:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  int v6 = v4[3];
  switch(v6)
  {
    case 3:
      v7 = +[SKGActivityJournal sharedJournal];
      v8 = v7;
      uint64_t v9 = 41;
      break;
    case 2:
      v7 = +[SKGActivityJournal sharedJournal];
      v8 = v7;
      uint64_t v9 = 42;
      break;
    case 1:
      v7 = +[SKGActivityJournal sharedJournal];
      v8 = v7;
      uint64_t v9 = 40;
      break;
    default:
      goto LABEL_9;
  }
  [v7 addEventWithTime:v9];

LABEL_9:
  if (v5[3] != 1)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_17;
  }
  v10 = dispatch_group_create();
  unint64_t v11 = 0;
  if (!self) {
    goto LABEL_14;
  }
LABEL_11:
  for (i = self->_managers; [(NSArray *)i count] > v11; i = 0)
  {
    dispatch_group_enter(v10);
    ++v11;
    if (self) {
      goto LABEL_11;
    }
LABEL_14:
    ;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B6C;
  block[3] = &unk_1000DAEB0;
  v21 = v5;
  v22 = self;
  dispatch_group_notify(v10, queue, block);

LABEL_17:
  v14 = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100066614;
  v17[3] = &unk_1000DB6E0;
  v17[4] = self;
  id v18 = v5;
  v19 = v10;
  v15 = v10;
  v16 = v5;
  dispatch_async(v14, v17);
}

+ (id)indexEventListenerForType:(int)a3 allowCreate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  int v6 = (CSIndexEventListener *)qword_1000F9108[a3];
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v4;
  }
  if (!v7)
  {
    uint64_t v8 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000F9138);
    int v6 = (CSIndexEventListener *)qword_1000F9108[v5];
    if (!v6)
    {
      uint64_t v9 = [[CSIndexEventListener alloc] initWithType:v5];
      id v10 = qword_1000F9108[v8];
      qword_1000F9108[v8] = v9;

      int v6 = v9;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000F9138);
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 initWithFormat:@"<%@:%p; %s>", v4, self, sub_100005F74(self->_indexType)];

  return v5;
}

- (CSIndexEventListener)initWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v42.receiver = self;
  v42.super_class = (Class)CSIndexEventListener;
  uint64_t v4 = [(CSIndexEventListener *)&v42 init];
  id v5 = v4;
  if (v4)
  {
    v4->_indexType = v3;
    memset(__str, 0, sizeof(__str));
    int v6 = sub_100005F74(v3);
    snprintf((char *)__str, 0x100uLL, "com.apple.spotlight.eventlistener.%s.queue", v6);
    BOOL v7 = dispatch_queue_attr_make_with_overcommit();
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

    v34 = v9;
    dispatch_queue_t v10 = dispatch_queue_create((const char *)__str, v9);
    queue = v5->_queue;
    v36 = v5;
    v5->_queue = (OS_dispatch_queue *)v10;

    v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [(id)qword_1000F90F0 count]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = (id)qword_1000F90F0;
    id v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          id v18 = sub_10000D688(v17);
          unsigned int v19 = [v18 supportsCSIndexType:v3];

          if (v19)
          {
            v20 = sub_100034DE0();
            uint64_t v21 = sub_10000D688(v17);
            v22 = [(id)v21 taskName];
            v23 = [v20 stringByAppendingFormat:@"/%@/%s", v22, sub_100005F74(v36->_indexType)];

            v24 = +[NSFileManager defaultManager];
            LOBYTE(v21) = [v24 fileExistsAtPath:v23];

            if ((v21 & 1) == 0)
            {
              v25 = +[NSFileManager defaultManager];
              id v37 = 0;
              unsigned __int8 v26 = [v25 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:&v37];
              id v27 = v37;

              if ((v26 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v44 = v27;
                __int16 v45 = 2112;
                v46 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "### Error %@ creating %@", buf, 0x16u);
              }
            }
            v28 = [[CSEventListenerManager alloc] initWithIndexType:v3 indexPath:v23 eventListener:v17];
            if (v28) {
              [v35 addObject:v28];
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
    }

    id v5 = v36;
    if ([v35 count])
    {
      v29 = (NSArray *)[v35 copy];
      managers = v36->_managers;
      v36->_managers = v29;
    }
    v31 = sub_10000F1EC();
    v32 = objc_msgSend(v31, "stringByAppendingFormat:", @"/%s", sub_100005F74(v36->_indexType));
    [(CSIndexEventListener *)v36 processJournalsOnStartupForJournalsPath:v32];
  }
  return v5;
}

- (void)processJournalsOnStartupForJournalsPath:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v91 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### CSIndexEventListener(%@) processJournalsOnStartupForJournalsPath", buf, 0xCu);
  }
  id v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v58 = v4;
    id v61 = v4;
    int v7 = open((const char *)[v61 fileSystemRepresentation], 0x8000);
    if (v7 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A1FC4((uint64_t)v61);
      }
    }
    else
    {
      int v8 = v7;
      bzero(buf, 0x400uLL);
      uint64_t v9 = 0;
      if (fcntl(v8, 50, buf) != -1 && buf[0])
      {
        dispatch_queue_t v10 = opendir((const char *)buf);
        if (v10)
        {
          unint64_t v11 = v10;
          id v12 = readdir(v10);
          uint64_t v9 = 0;
          if (v12)
          {
            id v13 = CSFlightTag_ptr;
            do
            {
              if ((v12->d_type | 2) == 0xA || v12->d_namlen > 0xFEu)
              {
                d_name = v12->d_name;
                if (!strncmp(v12->d_name, "skg_events", 0xAuLL) && !strstr(d_name, "toc"))
                {
                  uint64_t v15 = v13;
                  v16 = strrchr(d_name, 46);
                  uint64_t v17 = v16;
                  if (v16 && (id v18 = v16 + 1, v17[1]) && strncmp(v18, "journal", 7uLL))
                  {
                    id v13 = v15;
                  }
                  else
                  {
                    long long v88 = 0u;
                    memset(v89, 0, sizeof(v89));
                    long long v86 = 0u;
                    long long v87 = 0u;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v82 = 0u;
                    long long v83 = 0u;
                    long long v80 = 0u;
                    long long v81 = 0u;
                    long long v78 = 0u;
                    long long v79 = 0u;
                    long long v77 = 0u;
                    memset(v76, 0, sizeof(v76));
                    __strncpy_chk();
                    if (v9)
                    {
                      unsigned int v19 = +[NSString stringWithUTF8String:v76];
                      [v9 addObject:v19];
                      id v13 = v15;
                    }
                    else
                    {
                      id v13 = v15;
                      v20 = v15[46];
                      unsigned int v19 = +[NSString stringWithUTF8String:v76];
                      uint64_t v9 = [v20 arrayWithObject:v19];
                    }
                  }
                }
              }
              id v12 = readdir(v11);
            }
            while (v12);
          }
          closedir(v11);
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obj = v9;
      id v62 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v62)
      {
        uint64_t v60 = *(void *)v70;
        uint64_t v21 = &_os_log_default;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v70 != v60) {
              objc_enumerationMutation(obj);
            }
            uint64_t v66 = v22;
            v23 = *(void **)(*((void *)&v69 + 1) + 8 * v22);
            v24 = [v23 componentsSeparatedByString:@"_"];
            uint64_t v25 = [v61 stringByAppendingFormat:@"/%@.journal", v23];
            if ([v24 count] != (id)6 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1000A2064(v73, (uint64_t)v23, &v74);
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v91 = self;
              __int16 v92 = 2112;
              uint64_t v93 = v25;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "### CSIndexEventListener(%@) processJournalsOnStartupForJournalsPath registering journal with managers: %@", buf, 0x16u);
            }
            id v63 = (id)v25;
            unsigned __int8 v26 = v21;
            id v27 = objc_alloc_init((Class)NSNumberFormatter);
            v28 = [v24 objectAtIndexedSubscript:6];
            v29 = [v28 componentsSeparatedByString:@"."];
            v30 = [v29 objectAtIndexedSubscript:0];
            v31 = [v27 numberFromString:v30];

            v64 = v31;
            id v32 = [v31 unsignedLongLongValue];
            v33 = [v24 objectAtIndexedSubscript:2];
            id v34 = objc_alloc_init((Class)NSNumberFormatter);
            v35 = [v24 objectAtIndexedSubscript:3];
            v36 = [v34 numberFromString:v35];
            id v37 = [v36 intValue];

            id v38 = objc_alloc_init((Class)NSNumberFormatter);
            long long v39 = [v24 objectAtIndexedSubscript:4];
            long long v40 = [v38 numberFromString:v39];
            id v41 = [v40 unsignedLongLongValue];

            v65 = v24;
            objc_super v42 = [v24 objectAtIndexedSubscript:5];
            bzero(buf, 0x400uLL);
            LODWORD(v39) = self->_indexType;
            id v68 = v33;
            v43 = (const char *)[v68 UTF8String];
            id v67 = v42;
            sub_10000F060((int)v39, v43, (const char *)[v67 UTF8String], (uint64_t)v32, (int)v37, (char *)buf);
            if ([(NSArray *)self->_managers count])
            {
              uint64_t v44 = 0;
              while (1)
              {
                __int16 v45 = [(NSArray *)self->_managers objectAtIndexedSubscript:v44];
                v46 = sub_10000F9B0((uint64_t)v45);
                v47 = sub_10000D688((uint64_t)v46);
                unsigned __int8 v48 = [v47 isAcceptingJournals];

                if (v48) {
                  break;
                }
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = [(NSArray *)self->_managers objectAtIndexedSubscript:v44];
                  *(_DWORD *)v76 = 138412546;
                  *(void *)&v76[4] = self;
                  *(_WORD *)&v76[12] = 2112;
                  *(void *)&v76[14] = v49;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "### processJournalsOnStartupForJournalsPath %@ Not accepting journals at the moment for manager %@", v76, 0x16u);
                  goto LABEL_45;
                }
LABEL_46:
                if (++v44 >= [(NSArray *)self->_managers count]) {
                  goto LABEL_47;
                }
              }
              v49 = [(NSArray *)self->_managers objectAtIndexedSubscript:v44];
              [v49 registerJournalWithIno:v67 journalIno:v41 dev:v37 journalNumber:v32 journalCookie:v68];
LABEL_45:

              goto LABEL_46;
            }
LABEL_47:
            id v50 = v63;
            int v51 = unlink((const char *)[v50 UTF8String]);
            uint64_t v21 = v26;
            v52 = v26;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              if (v51 == -1) {
                int v51 = *__error();
              }
              id v53 = [v50 UTF8String];
              *(_DWORD *)v76 = 67109634;
              *(_DWORD *)&v76[4] = v51;
              *(_WORD *)&v76[8] = 2112;
              *(void *)&v76[10] = self;
              *(_WORD *)&v76[18] = 2080;
              *(void *)&v76[20] = v53;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "### unlink journal (%d) %@ - %s ", v76, 0x1Cu);
            }

            int v54 = unlink((const char *)buf);
            v55 = v26;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              if (v54 == -1) {
                int v54 = *__error();
              }
              *(_DWORD *)v76 = 67109634;
              *(_DWORD *)&v76[4] = v54;
              *(_WORD *)&v76[8] = 2112;
              *(void *)&v76[10] = self;
              *(_WORD *)&v76[18] = 2080;
              *(void *)&v76[20] = buf;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "### unlink toc (%d) %@ - %s ", v76, 0x1Cu);
            }

            uint64_t v22 = v66 + 1;
          }
          while ((id)(v66 + 1) != v62);
          id v62 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        }
        while (v62);
      }

      if ([(NSArray *)self->_managers count])
      {
        unint64_t v56 = 0;
        do
        {
          v57 = [(NSArray *)self->_managers objectAtIndexedSubscript:v56];
          [v57 startUp];

          ++v56;
        }
        while (v56 < [(NSArray *)self->_managers count]);
      }

      id v4 = v58;
    }
  }
}

- (void)lostConnection
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006675C;
  block[3] = &unk_1000DA128;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleDeviceLocking
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000668D4;
  block[3] = &unk_1000DA128;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleDeviceUnlocked
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000669F8;
  block[3] = &unk_1000DA128;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end