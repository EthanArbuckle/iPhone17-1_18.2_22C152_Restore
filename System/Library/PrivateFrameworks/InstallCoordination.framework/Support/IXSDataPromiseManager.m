@interface IXSDataPromiseManager
+ (NSURL)saveDir;
+ (id)savePathForPromise:(id)a3;
+ (id)sharedInstance;
- (IXSDataPromiseManager)init;
- (NSMutableDictionary)uuidToPromiseMap;
- (OS_dispatch_queue)queue;
- (id)_promiseForUUID:(id)a3 ofType:(Class)a4 useQueue:(BOOL)a5;
- (id)promiseForUUID:(id)a3;
- (id)promiseForUUID:(id)a3 ofType:(Class)a4;
- (void)_onQueue_restoreSavedPromises;
- (void)cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:(id)a3 withReason:(id)a4 client:(unint64_t)a5;
- (void)clearAllPromisesForCreator:(unint64_t)a3;
- (void)decommissionPromise:(id)a3;
- (void)enumeratePromises:(id)a3;
- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5;
- (void)promise:(id)a3 didUpdateProgress:(double)a4;
- (void)promiseDidBegin:(id)a3;
- (void)promiseDidComplete:(id)a3;
- (void)promiseDidReset:(id)a3;
- (void)registerPromise:(id)a3;
@end

@implementation IXSDataPromiseManager

+ (id)savePathForPromise:(id)a3
{
  id v4 = a3;
  v5 = [a1 saveDir];
  v6 = [v4 uniqueIdentifier];

  v7 = +[NSString stringWithFormat:@"%@.plist", v6];
  v8 = [v5 URLByAppendingPathComponent:v7 isDirectory:0];

  return v8;
}

+ (NSURL)saveDir
{
  v2 = +[IXGlobalConfiguration sharedInstance];
  v3 = [v2 dataDirectoryAbortingOnError];

  id v4 = [v3 URLByAppendingPathComponent:@"DataPromises" isDirectory:1];

  return (NSURL *)v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000686F4;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109FB0 != -1) {
    dispatch_once(&qword_100109FB0, block);
  }
  v2 = (void *)qword_100109FA8;

  return v2;
}

- (IXSDataPromiseManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)IXSDataPromiseManager;
  v2 = [(IXSDataPromiseManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.installcoordinationd.IXSDataPromiseManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = [(IXSDataPromiseManager *)v2 queue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100068824;
    v8[3] = &unk_1000E8FA8;
    v9 = v2;
    sub_100066F24(v6, v8);
  }
  return v2;
}

- (void)_onQueue_restoreSavedPromises
{
  v2 = [(IXSDataPromiseManager *)self queue];
  dispatch_assert_queue_V2(v2);

  v44 = [(id)objc_opt_class() saveDir];
  v3 = +[IXFileManager defaultManager];
  id v60 = 0;
  v45 = [v3 urlsForItemsInDirectoryAtURL:v44 ignoringSymlinks:1 error:&v60];
  id v4 = v60;

  if (v45)
  {
    v5 = (NSMutableDictionary *)objc_opt_new();
    uuidToPromiseMap = self->_uuidToPromiseMap;
    self->_uuidToPromiseMap = v5;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v45;
    id v7 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (!v7) {
      goto LABEL_31;
    }
    uint64_t v48 = *(void *)v57;
    while (1)
    {
      id v49 = v7;
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v57 != v48) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v11 = [v9 lastPathComponent];
        unsigned __int8 v12 = [v11 hasPrefix:@"."];

        if ((v12 & 1) == 0)
        {
          id v55 = v4;
          v13 = +[NSData dataWithContentsOfURL:v9 options:3 error:&v55];
          id v14 = v55;

          if (v13)
          {
            id v15 = objc_alloc((Class)NSKeyedUnarchiver);
            id v54 = v14;
            id v16 = [v15 initForReadingFromData:v13 error:&v54];
            id v4 = v54;

            if (v16)
            {
              v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
              v18 = [v16 decodeObjectOfClasses:v17 forKey:NSKeyedArchiveRootObjectKey];
              v19 = v18;
              if (v18)
              {
                v20 = [v18 uniqueIdentifier];

                if (v20)
                {
                  v21 = self->_uuidToPromiseMap;
                  v22 = [v19 uniqueIdentifier];
                  [(NSMutableDictionary *)v21 setObject:v19 forKeyedSubscript:v22];
                }
                else
                {
                  v22 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    v30 = [v9 lastPathComponent];
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
                    __int16 v63 = 2112;
                    v64 = v30;
                    __int16 v65 = 2112;
                    id v66 = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Somehow got promise without unique identifier from %@: %@", buf, 0x20u);
                  }
                }
                int v24 = 0;
LABEL_26:

                [v16 finishDecoding];
                if (v24)
                {
LABEL_27:
                  v25 = +[IXFileManager defaultManager];
                  [v25 removeItemAtURL:v9 error:0];
                }
                goto LABEL_29;
              }
              v22 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v28 = [v9 path];
                v29 = [v16 error];
                *(_DWORD *)buf = 136315650;
                v62 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
                __int16 v63 = 2112;
                v64 = v28;
                __int16 v65 = 2112;
                id v66 = v29;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to decode promise from %@: %@", buf, 0x20u);
              }
              v19 = 0;
            }
            else
            {
              v22 = sub_100004B28((uint64_t)off_100109BB8);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v27 = [v9 path];
                *(_DWORD *)buf = 136315650;
                v62 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
                __int16 v63 = 2112;
                v64 = v27;
                __int16 v65 = 2112;
                id v66 = v4;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to create unarchiver for promise at %@ : %@", buf, 0x20u);
              }
              v19 = 0;
              v17 = 0;
            }
            int v24 = 1;
            goto LABEL_26;
          }
          v23 = sub_100004B28((uint64_t)off_100109BB8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v26 = [v9 path];
            *(_DWORD *)buf = 136315650;
            v62 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
            __int16 v63 = 2112;
            v64 = v26;
            __int16 v65 = 2112;
            id v66 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize promise at %@ : %@", buf, 0x20u);
          }
          id v16 = 0;
          v17 = 0;
          v19 = 0;
          id v4 = v14;
          goto LABEL_27;
        }
LABEL_29:
      }
      id v7 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (!v7)
      {
LABEL_31:

        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_1000691DC;
        v53[3] = &unk_1000EAD58;
        v53[4] = self;
        v31 = objc_retainBlock(v53);
        v32 = [(IXSDataPromiseManager *)self uuidToPromiseMap];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1000691F0;
        v51[3] = &unk_1000EAD80;
        v33 = v31;
        id v52 = v33;
        [v32 enumerateKeysAndObjectsUsingBlock:v51];

        goto LABEL_43;
      }
    }
  }
  v34 = [v4 domain];
  if ([v34 isEqualToString:NSPOSIXErrorDomain])
  {
    BOOL v35 = [v4 code] == (id)2;

    if (v35)
    {
      v36 = +[IXFileManager defaultManager];
      id v50 = v4;
      unsigned __int8 v37 = [v36 createDirectoryAtURL:v44 withIntermediateDirectories:1 mode:493 class:4 error:&v50];
      id v38 = v50;

      if ((v37 & 1) == 0)
      {
        v39 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [v44 path];
          *(_DWORD *)buf = 136315650;
          v62 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
          __int16 v63 = 2112;
          v64 = v40;
          __int16 v65 = 2112;
          id v66 = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s: Failed to create promise save directory at %@: %@", buf, 0x20u);
        }
      }
      id v4 = v38;
      goto LABEL_43;
    }
  }
  else
  {
  }
  v41 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v62 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
    __int16 v63 = 2112;
    v64 = v44;
    __int16 v65 = 2112;
    id v66 = v4;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: Failed to get list of saved promises from %@ : %@", buf, 0x20u);
  }

LABEL_43:
  if (!self->_uuidToPromiseMap)
  {
    v42 = (NSMutableDictionary *)objc_opt_new();
    v43 = self->_uuidToPromiseMap;
    self->_uuidToPromiseMap = v42;
  }
}

- (id)_promiseForUUID:(id)a3 ofType:(Class)a4 useQueue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5)
  {
    v9 = [(IXSDataPromiseManager *)self promiseForUUID:v8];
  }
  else
  {
    objc_super v10 = [(IXSDataPromiseManager *)self uuidToPromiseMap];
    v9 = [v10 objectForKey:v8];

    if (([v9 isTracked] & 1) == 0)
    {
LABEL_9:

      v9 = 0;
      goto LABEL_10;
    }
  }
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = NSStringFromClass(a4);
      v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      int v16 = 136315906;
      v17 = "-[IXSDataPromiseManager _promiseForUUID:ofType:useQueue:]";
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v12;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Found promise for UUID %@ but it was not of class %@, was %@", (uint8_t *)&v16, 0x2Au);
    }
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

- (id)promiseForUUID:(id)a3 ofType:(Class)a4
{
  return [(IXSDataPromiseManager *)self _promiseForUUID:a3 ofType:a4 useQueue:1];
}

- (id)promiseForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000695AC;
  int v16 = sub_1000695BC;
  id v17 = 0;
  BOOL v5 = [(IXSDataPromiseManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000695C4;
  block[3] = &unk_1000E90F0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)registerPromise:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IXSDataPromiseManager *)self queue];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1000697C8;
  uint64_t v12 = &unk_1000E8E08;
  v13 = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(v5, &v9);

  id v7 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(v6, "uniqueIdentifier", v9, v10, v11, v12, v13);
    *(_DWORD *)buf = 136315650;
    int v16 = "-[IXSDataPromiseManager registerPromise:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Registered promise %@ for UUID %@", buf, 0x20u);
  }
}

- (void)enumeratePromises:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IXSDataPromiseManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006999C;
  v7[3] = &unk_1000E9948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)decommissionPromise:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(IXSDataPromiseManager *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100069B64;
    v6[3] = &unk_1000E8E08;
    v6[4] = self;
    id v7 = v4;
    sub_100066F24(v5, v6);
  }
}

- (void)clearAllPromisesForCreator:(unint64_t)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000695AC;
  int v24 = sub_1000695BC;
  id v25 = 0;
  BOOL v5 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = IXStringForClientID(a3);
    *(_DWORD *)buf = 136315394;
    v28 = "-[IXSDataPromiseManager clearAllPromisesForCreator:]";
    __int16 v29 = 2112;
    v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Clearing all promises for creator %@", buf, 0x16u);
  }
  id v7 = [(IXSDataPromiseManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069EC0;
  block[3] = &unk_1000E90A8;
  block[4] = self;
  void block[5] = &v20;
  dispatch_sync(v7, block);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)v21[5];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        if (!a3 || [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) creatorIdentifier] == (id)a3)
        {
          v13 = [v12 accessQueue];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100069F28;
          v14[3] = &unk_1000E8FA8;
          v14[4] = v12;
          dispatch_sync(v13, v14);
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:(id)a3 withReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(IXSDataPromiseManager *)self promiseForUUID:a3];
  uint64_t v10 = v9;
  if (v9)
  {
    v11 = [v9 accessQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006A0CC;
    v12[3] = &unk_1000E9408;
    v12[4] = self;
    id v13 = v10;
    id v14 = v8;
    unint64_t v15 = a5;
    dispatch_sync(v11, v12);
  }
}

- (void)promiseDidBegin:(id)a3
{
  id v3 = a3;
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[IXSDataPromiseManager promiseDidBegin:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Unowned promise began: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)promiseDidComplete:(id)a3
{
  id v3 = a3;
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[IXSDataPromiseManager promiseDidComplete:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Unowned promise completed: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)promiseDidReset:(id)a3
{
  id v3 = a3;
  id v4 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[IXSDataPromiseManager promiseDidReset:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Unowned promise reset: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)promise:(id)a3 didUpdateProgress:(double)a4
{
  id v5 = a3;
  id v6 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    id v8 = "-[IXSDataPromiseManager promise:didUpdateProgress:]";
    __int16 v9 = 2048;
    double v10 = a4;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Unowned promise update progress to %f : %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    __int16 v11 = "-[IXSDataPromiseManager promise:didCancelForReason:client:]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Unowned promise %@ canceled for reason: %@ client: %lu", (uint8_t *)&v10, 0x2Au);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)uuidToPromiseMap
{
  return self->_uuidToPromiseMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToPromiseMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end