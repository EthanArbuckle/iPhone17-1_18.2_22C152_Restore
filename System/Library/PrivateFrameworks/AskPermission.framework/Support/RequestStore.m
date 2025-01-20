@interface RequestStore
- (NSString)fileName;
- (OS_dispatch_queue)fileAccessQueue;
- (RequestStore)initWithFileName:(id)a3;
- (id)_filePath;
- (id)_pathWithFileName:(id)a3;
- (id)_retrieveFile;
- (id)items;
- (void)_deleteFile;
- (void)_storeFileWithItems:(id)a3;
- (void)clearCache;
- (void)setFileName:(id)a3;
- (void)storeItems:(id)a3;
@end

@implementation RequestStore

- (RequestStore)initWithFileName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RequestStore;
  v6 = [(RequestStore *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileName, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.AskPermission.RequestStore", 0);
    fileAccessQueue = v7->_fileAccessQueue;
    v7->_fileAccessQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)clearCache
{
  v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[APLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Clearing cache", buf, 0xCu);
  }
  v6 = [(RequestStore *)self fileAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AF74;
  block[3] = &unk_1000385F0;
  block[4] = self;
  dispatch_async(v6, block);
}

- (id)items
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10001B184;
  v15 = sub_10001B194;
  id v16 = 0;
  v3 = [(RequestStore *)self fileAccessQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B19C;
  v10[3] = &unk_100038640;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v3, v10);

  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (id)objc_opt_class();
    id v7 = [(id)v12[5] count];
    *(_DWORD *)buf = 138543618;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching items. Count: %lu", buf, 0x16u);
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)storeItems:(id)a3
{
  id v4 = a3;
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Storing items to disk.", buf, 0xCu);
  }
  id v8 = [(RequestStore *)self fileAccessQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B364;
  v10[3] = &unk_100038668;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)_deleteFile
{
  v3 = [(RequestStore *)self fileAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(RequestStore *)self fileName];
  id v5 = [(RequestStore *)self _pathWithFileName:v4];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v7 = [(RequestStore *)self _filePath];
    id v20 = 0;
    [v6 removeItemAtPath:v7 error:&v20];
    id v8 = v20;

    uint64_t v9 = +[APLogConfig sharedDaemonConfig];
    v10 = v9;
    if (v8)
    {
      if (!v9)
      {
        v10 = +[APLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v22 = v12;
      __int16 v23 = 2114;
      id v24 = v8;
      id v13 = v12;
      v14 = "%{public}@: Error deleting file. Error: %{public}@";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
    }
    else
    {
      if (!v9)
      {
        v10 = +[APLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      __int16 v19 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v22 = v19;
      id v13 = v19;
      v14 = "%{public}@: Deleted file succesfully";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);

LABEL_16:
    goto LABEL_17;
  }
  id v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  v10 = [v8 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = (id)objc_opt_class();
    id v18 = v22;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get file path. File already deleted.", buf, 0xCu);
  }
LABEL_17:
}

- (id)_filePath
{
  v3 = [(RequestStore *)self fileName];
  id v4 = [(RequestStore *)self _pathWithFileName:v3];

  return v4;
}

- (id)_pathWithFileName:(id)a3
{
  id v3 = a3;
  id v4 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v5 = [v4 firstObject];

  id v6 = [v5 stringByAppendingPathComponent:@"AskPermission"];
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

  if (v8) {
    goto LABEL_12;
  }
  uint64_t v9 = +[APLogConfig sharedDaemonConfig];
  if (!v9)
  {
    uint64_t v9 = +[APLogConfig sharedConfig];
  }
  v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = (id)objc_opt_class();
    id v11 = v22;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Directory path doesn't exist", buf, 0xCu);
  }
  v12 = +[NSFileManager defaultManager];
  id v20 = 0;
  [v12 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v13 = v20;

  if (!v13)
  {
LABEL_12:
    id v18 = [v6 stringByAppendingPathComponent:v3];
  }
  else
  {
    v14 = +[APLogConfig sharedDaemonConfig];
    if (!v14)
    {
      v14 = +[APLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v22 = v16;
      __int16 v23 = 2114;
      id v24 = v13;
      id v17 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create directory path. Error: %{public}@", buf, 0x16u);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)_storeFileWithItems:(id)a3
{
  id v4 = a3;
  id v5 = [(RequestStore *)self fileAccessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(RequestStore *)self _filePath];

  if (v6)
  {
    id v26 = 0;
    id v7 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v26];
    id v8 = v26;
    if (!v7)
    {
      id v13 = +[APLogConfig sharedDaemonConfig];
      if (!v13)
      {
        id v13 = +[APLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v22 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        id v30 = v8;
        id v23 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error serializing items. Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_22;
    }
    uint64_t v9 = [(RequestStore *)self _filePath];
    id v25 = v8;
    unsigned __int8 v10 = [v7 writeToFile:v9 options:1 error:&v25];
    id v11 = v25;

    uint64_t v12 = +[APLogConfig sharedDaemonConfig];
    id v13 = (void *)v12;
    if (v10)
    {
      if (!v12)
      {
        id v13 = +[APLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v28 = v15;
      id v16 = v15;
      id v17 = "%{public}@: Stored file succesfully";
      id v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      uint32_t v20 = 12;
    }
    else
    {
      if (!v12)
      {
        id v13 = +[APLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      id v24 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v28 = v24;
      __int16 v29 = 2114;
      id v30 = v11;
      id v16 = v24;
      id v17 = "%{public}@: Error storing file. Error: %{public}@";
      id v18 = v14;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 22;
    }
    _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, v20);

LABEL_21:
    id v8 = v11;
LABEL_22:

    goto LABEL_23;
  }
  id v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    id v8 = +[APLogConfig sharedConfig];
  }
  id v7 = [v8 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = (id)objc_opt_class();
    id v21 = v28;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get file path", buf, 0xCu);
  }
LABEL_23:
}

- (id)_retrieveFile
{
  id v3 = [(RequestStore *)self fileAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(RequestStore *)self _filePath];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSData);
    id v6 = [(RequestStore *)self _filePath];
    id v26 = 0;
    id v7 = [v5 initWithContentsOfFile:v6 options:0 error:&v26];
    id v8 = v26;

    uint64_t v9 = +[APLogConfig sharedDaemonConfig];
    id v10 = (id)v9;
    if (v7)
    {
      if (!v9)
      {
        id v10 = +[APLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v28 = v12;
        id v13 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved file succesfully", buf, 0xCu);
      }
      id v25 = v8;
      id v10 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v25];
      id v14 = v25;

      if (v14)
      {
        v15 = +[APLogConfig sharedDaemonConfig];
        if (!v15)
        {
          v15 = +[APLogConfig sharedConfig];
        }
        id v16 = [v15 OSLogObject];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v28 = v17;
          id v18 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Error decoding file", buf, 0xCu);
        }
        os_log_type_t v19 = 0;
        id v8 = v14;
      }
      else
      {
        id v10 = v10;
        id v8 = 0;
        os_log_type_t v19 = v10;
      }
    }
    else
    {
      if (!v9)
      {
        id v10 = +[APLogConfig sharedConfig];
      }
      id v21 = [v10 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v28 = v22;
        __int16 v29 = 2114;
        id v30 = v8;
        id v23 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving file. Error: %{public}@", buf, 0x16u);
      }
      os_log_type_t v19 = 0;
    }
  }
  else
  {
    id v8 = +[APLogConfig sharedDaemonConfig];
    if (!v8)
    {
      id v8 = +[APLogConfig sharedConfig];
    }
    id v7 = [v8 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = (id)objc_opt_class();
      id v20 = v28;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get file path", buf, 0xCu);
    }
    os_log_type_t v19 = 0;
  }

  return v19;
}

- (OS_dispatch_queue)fileAccessQueue
{
  return self->_fileAccessQueue;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_fileAccessQueue, 0);
}

@end