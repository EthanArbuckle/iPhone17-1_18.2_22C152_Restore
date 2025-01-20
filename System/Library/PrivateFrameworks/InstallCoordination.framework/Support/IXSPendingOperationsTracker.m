@interface IXSPendingOperationsTracker
+ (id)sharedInstance;
- (BOOL)_deserializeKeyedArchiveFromData:(id)a3 atURL:(id)a4;
- (BOOL)_deserializePlistFormatFromData:(id)a3 atURL:(id)a4;
- (IXSPendingOperationsTracker)init;
- (IXSPendingOperationsTracker)initWithSentinelPathOverride:(id)a3;
- (NSMutableSet)pendingOperationIdentities;
- (NSSet)pendingWorkIdentities;
- (NSURL)sentinelPath;
- (OS_dispatch_queue)internalQueue;
- (void)_deserializePendingOperationIdentities;
- (void)_onQueue_writePendingWork;
- (void)beginPendingOperationForIdentity:(id)a3;
- (void)clearAllPendingOperations;
- (void)endPendingOperationForIdentity:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setPendingOperationIdentities:(id)a3;
@end

@implementation IXSPendingOperationsTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A0C0;
  block[3] = &unk_1000E8C70;
  block[4] = a1;
  if (qword_100109EF0 != -1) {
    dispatch_once(&qword_100109EF0, block);
  }
  v2 = (void *)qword_100109EE8;

  return v2;
}

- (NSURL)sentinelPath
{
  sentinelPath = self->_sentinelPath;
  if (sentinelPath)
  {
    v3 = sentinelPath;
  }
  else
  {
    v4 = +[IXGlobalConfiguration sharedInstance];
    v5 = [v4 dataDirectoryAbortingOnError];

    v3 = [v5 URLByAppendingPathComponent:@"PendingWork.plist" isDirectory:0];
  }

  return v3;
}

- (BOOL)_deserializePlistFormatFromData:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v16 = 0;
  v7 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:&v16];
  id v8 = v16;
  if (!v7)
  {
    v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100091864();
    }
    goto LABEL_8;
  }
  objc_opt_class();
  v9 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  v10 = [v9 objectForKeyedSubscript:@"BundleIDs"];
  if (v10 && (objc_opt_class(), sub_100082AC8(v10)))
  {
    v11 = +[IXApplicationIdentity identitiesForBundleIdentifiers:v10];
    v12 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v11];
    pendingOperationIdentities = self->_pendingOperationIdentities;
    self->_pendingOperationIdentities = v12;

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

LABEL_11:
  return v14;
}

- (BOOL)_deserializeKeyedArchiveFromData:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = 0;
  id v8 = +[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:objc_opt_class() fromData:v7 error:&v13];

  id v9 = v13;
  if (v8)
  {
    v10 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v8];
    p_super = &self->_pendingOperationIdentities->super.super;
    self->_pendingOperationIdentities = v10;
  }
  else
  {
    p_super = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_1000918FC((uint64_t)v6, (uint64_t)v9, p_super);
    }
  }

  return v8 != 0;
}

- (void)_deserializePendingOperationIdentities
{
  v3 = [(IXSPendingOperationsTracker *)self sentinelPath];
  id v13 = 0;
  v4 = +[NSData dataWithContentsOfURL:v3 options:3 error:&v13];
  id v5 = v13;
  id v6 = v5;
  if (!v4)
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:NSCocoaErrorDomain])
    {
      id v8 = [v6 code];

      if (v8 == (id)260)
      {
        id v9 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "-[IXSPendingOperationsTracker _deserializePendingOperationIdentities]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: No pending work found", buf, 0xCu);
        }
LABEL_12:

LABEL_13:
        v10 = (NSMutableSet *)objc_opt_new();
        pendingOperationIdentities = self->_pendingOperationIdentities;
        self->_pendingOperationIdentities = v10;

        v12 = +[IXFileManager defaultManager];
        [v12 removeItemAtURL:v3 error:0];

        goto LABEL_14;
      }
    }
    else
    {
    }
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100091994();
    }
    goto LABEL_12;
  }
  if (![(IXSPendingOperationsTracker *)self _deserializePlistFormatFromData:v4 atURL:v3]&& ![(IXSPendingOperationsTracker *)self _deserializeKeyedArchiveFromData:v4 atURL:v3])
  {
    goto LABEL_13;
  }
LABEL_14:
}

- (IXSPendingOperationsTracker)init
{
  return [(IXSPendingOperationsTracker *)self initWithSentinelPathOverride:0];
}

- (IXSPendingOperationsTracker)initWithSentinelPathOverride:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXSPendingOperationsTracker;
  id v6 = [(IXSPendingOperationsTracker *)&v11 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.installcoordinationd.pending_operations", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_sentinelPath, a3);
    [(IXSPendingOperationsTracker *)v6 _deserializePendingOperationIdentities];
  }

  return v6;
}

- (void)_onQueue_writePendingWork
{
  v3 = [(IXSPendingOperationsTracker *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(IXSPendingOperationsTracker *)self sentinelPath];
  id v5 = [(IXSPendingOperationsTracker *)self pendingOperationIdentities];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(IXSPendingOperationsTracker *)self pendingOperationIdentities];
    dispatch_queue_t v8 = [v7 allObjects];
    id v23 = 0;
    id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v23];
    id v10 = v23;

    if (v9)
    {
      id v22 = v10;
      unsigned __int8 v11 = [v9 writeToURL:v4 options:268435457 error:&v22];
      id v12 = v22;

      if (v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100091B44();
      }
      id v10 = v12;
    }
    else
    {
      id v13 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100091AC4((uint64_t)v10, v13, v16, v17, v18, v19, v20, v21);
      }
    }

    id v12 = v10;
    goto LABEL_13;
  }
  BOOL v14 = +[IXFileManager defaultManager];
  id v24 = 0;
  uint64_t v15 = [v14 removeItemAtURL:v4 error:&v24];
  id v12 = v24;

  if ((v15 & 1) == 0)
  {
    id v9 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100091A2C();
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)beginPendingOperationForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSPendingOperationsTracker *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A97C;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)endPendingOperationForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSPendingOperationsTracker *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003AB70;
  v7[3] = &unk_1000E8E08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSSet)pendingWorkIdentities
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10003ADCC;
  unsigned __int8 v11 = sub_10003ADDC;
  id v12 = 0;
  v3 = [(IXSPendingOperationsTracker *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003ADE4;
  v6[3] = &unk_1000E90A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)clearAllPendingOperations
{
  v3 = [(IXSPendingOperationsTracker *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AED0;
  block[3] = &unk_1000E8FA8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSMutableSet)pendingOperationIdentities
{
  return self->_pendingOperationIdentities;
}

- (void)setPendingOperationIdentities:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperationIdentities, 0);

  objc_storeStrong((id *)&self->_sentinelPath, 0);
}

@end