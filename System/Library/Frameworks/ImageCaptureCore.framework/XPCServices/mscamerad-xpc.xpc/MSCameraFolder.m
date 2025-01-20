@interface MSCameraFolder
- (BOOL)reflightRequested;
- (BOOL)validAVAsset:(id)a3;
- (MSCameraFolder)initWithFSURL:(id)a3 name:(id)a4 parent:(id)a5 device:(id)a6;
- (NSMutableArray)content;
- (NSMutableIndexSet)contentIndex;
- (OS_dispatch_queue)reflightQueue;
- (OS_dispatch_source)reflightTimer;
- (id)createAssetFromURL:(id)a3 notify:(BOOL)a4 preflight:(BOOL)a5;
- (id)createValidAssetFromURL:(id)a3 attemptCount:(unsigned int)a4 notify:(BOOL)a5 preflight:(BOOL)a6;
- (id)folderMatchingPath:(id)a3;
- (id)mediaItemType;
- (id)newItemWithFSURL:(id)a3 name:(id)a4 notify:(BOOL)a5 fullMetadata:(BOOL)a6;
- (unsigned)reflightCount;
- (void)cancelReflight;
- (void)clearDevice;
- (void)dealloc;
- (void)enumerateContentWithOptions:(id)a3;
- (void)issueReflight;
- (void)reflightSync;
- (void)setReflightCount:(unsigned int)a3;
- (void)setReflightQueue:(id)a3;
- (void)setReflightRequested:(BOOL)a3;
- (void)setReflightTimer:(id)a3;
@end

@implementation MSCameraFolder

- (void)issueReflight
{
  v3 = [(MSCameraItem *)self device];
  unsigned int v4 = [v3 reflightPaused];

  if (v4)
  {
    __ICOSLogCreate();
    v5 = [(MSCameraItem *)self name];
    if ((unint64_t)[v5 length] >= 0x15)
    {
      v6 = -[NSObject substringWithRange:](v5, "substringWithRange:", 0, 18);
      uint64_t v7 = [v6 stringByAppendingString:@".."];

      v5 = v7;
    }
    v8 = +[NSString stringWithFormat:@"Device Paused Reflight"];
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v5;
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      id v31 = [v10 UTF8String];
      __int16 v32 = 2114;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
LABEL_16:

    return;
  }
  v12 = [(MSCameraFolder *)self reflightTimer];

  if (!v12)
  {
    __ICOSLogCreate();
    v13 = [(MSCameraItem *)self name];
    if ((unint64_t)[v13 length] >= 0x15)
    {
      v14 = objc_msgSend(v13, "substringWithRange:", 0, 18);
      uint64_t v15 = [v14 stringByAppendingString:@".."];

      v13 = (void *)v15;
    }
    v16 = +[NSString stringWithFormat:@"Reflight Timer Started"];
    v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v13;
      v19 = v17;
      *(_DWORD *)buf = 136446466;
      id v31 = [v18 UTF8String];
      __int16 v32 = 2114;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    v20 = [(MSCameraFolder *)self reflightQueue];
    dispatch_source_t v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v20);
    [(MSCameraFolder *)self setReflightTimer:v21];

    v22 = [(MSCameraFolder *)self reflightQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F338;
    block[3] = &unk_100034A78;
    block[4] = self;
    dispatch_async(v22, block);

    v23 = [(MSCameraFolder *)self reflightTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001F4D0;
    handler[3] = &unk_100034A78;
    handler[4] = self;
    dispatch_source_set_event_handler(v23, handler);

    v24 = [(MSCameraFolder *)self reflightTimer];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001F748;
    v27[3] = &unk_100034A78;
    v27[4] = self;
    dispatch_source_set_cancel_handler(v24, v27);

    v25 = [(MSCameraFolder *)self reflightTimer];
    dispatch_time_t v26 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v25, v26, 0x77359400uLL, 0x5F5E100uLL);

    v5 = [(MSCameraFolder *)self reflightTimer];
    dispatch_activate(v5);
    goto LABEL_16;
  }

  [(MSCameraFolder *)self setReflightRequested:1];
}

- (void)reflightSync
{
  v3 = [(MSCameraFolder *)self reflightTimer];

  if (!v3)
  {
    __ICOSLogCreate();
    unsigned int v4 = [(MSCameraItem *)self name];
    if ((unint64_t)[v4 length] >= 0x15)
    {
      v5 = objc_msgSend(v4, "substringWithRange:", 0, 18);
      uint64_t v6 = [v5 stringByAppendingString:@".."];

      unsigned int v4 = (void *)v6;
    }
    uint64_t v7 = +[NSString stringWithFormat:@"Reflight Timer Started"];
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v4;
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      id v19 = [v9 UTF8String];
      __int16 v20 = 2114;
      dispatch_source_t v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    v11 = [(MSCameraFolder *)self reflightQueue];
    dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v11);
    [(MSCameraFolder *)self setReflightTimer:v12];

    v13 = [(MSCameraFolder *)self reflightTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001FB24;
    handler[3] = &unk_100034A78;
    handler[4] = self;
    dispatch_source_set_event_handler(v13, handler);

    v14 = [(MSCameraFolder *)self reflightTimer];
    dispatch_time_t v15 = dispatch_time(0, 0);
    dispatch_source_set_timer(v14, v15, 0x77359400uLL, 0x5F5E100uLL);

    v16 = [(MSCameraFolder *)self reflightTimer];
    dispatch_activate(v16);
  }
}

- (MSCameraFolder)initWithFSURL:(id)a3 name:(id)a4 parent:(id)a5 device:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MSCameraFolder;
  dispatch_source_t v12 = [(MSCameraItem *)&v30 initWithFSURL:v10 name:v11 parent:a5 device:a6];
  if (v12)
  {
    v13 = v12;
    v14 = [(MSCameraItem *)v12 info];
    [v14 setAssociationType:1];

    if (!a5)
    {
      dispatch_time_t v15 = [(MSCameraItem *)v13 info];
      [v15 setParentObject:4294967294];
    }
    id v16 = +[NSString stringWithFormat:@"%@-reflightQueue", v11];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    [(MSCameraFolder *)v13 setReflightQueue:v17];

    id v18 = [v10 path];
    -[MSCameraItem setFilesystemChangeDescriptor:](v13, "setFilesystemChangeDescriptor:", open((const char *)[v18 UTF8String], 0x8000));
    if ([(MSCameraItem *)v13 filesystemChangeDescriptor] == -1)
    {
      v23 = 0;
    }
    else
    {
      dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, [(MSCameraItem *)v13 filesystemChangeDescriptor], 0x17FuLL, (dispatch_queue_t)&_dispatch_main_q);
      [(MSCameraItem *)v13 setFilesystemChangeSource:v19];
      __int16 v20 = [(MSCameraItem *)v13 filesystemChangeSource];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10001FFF4;
      handler[3] = &unk_100034A78;
      dispatch_source_t v21 = v13;
      v29 = v21;
      dispatch_source_set_event_handler(v20, handler);

      v22 = [(MSCameraItem *)v21 filesystemChangeSource];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100020060;
      v26[3] = &unk_100034A78;
      v23 = v21;
      v27 = v23;
      dispatch_source_set_cancel_handler(v22, v26);

      v24 = [(MSCameraItem *)v23 filesystemChangeSource];
      dispatch_resume(v24);

      v13 = (MSCameraFolder *)v19;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)cancelReflight
{
  v3 = [(MSCameraFolder *)self reflightTimer];

  if (v3)
  {
    unsigned int v4 = [(MSCameraFolder *)self reflightTimer];
    dispatch_source_cancel(v4);
  }
}

- (id)mediaItemType
{
  return @"folder";
}

- (void)clearDevice
{
}

- (void)dealloc
{
  [(MSCameraItem *)self cancelSource];
  [(MSCameraFolder *)self cancelReflight];
  [(MSCameraFolder *)self clearDevice];
  v3.receiver = self;
  v3.super_class = (Class)MSCameraFolder;
  [(MSCameraItem *)&v3 dealloc];
}

- (void)enumerateContentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(33, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020224;
  v7[3] = &unk_100034A50;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)createAssetFromURL:(id)a3 notify:(BOOL)a4 preflight:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 path];
  id v10 = [v9 lastPathComponent];
  id v11 = [v10 pathExtension];
  dispatch_source_t v12 = [v11 lowercaseString];
  unsigned __int8 v13 = [v12 isEqualToString:@"mov"];

  if (v13)
  {
    id v14 = [(MSCameraFolder *)self createValidAssetFromURL:v8 attemptCount:20 notify:v6 preflight:v5];
  }
  else
  {
    dispatch_time_t v15 = [v8 path];
    id v16 = [v15 lastPathComponent];
    id v14 = [(MSCameraFolder *)self newItemWithFSURL:v8 name:v16 notify:v6 fullMetadata:1];

    if (!v14)
    {
      __ICOSLogCreate();
      dispatch_queue_t v17 = [(MSCameraItem *)self name];
      if ((unint64_t)[v17 length] >= 0x15)
      {
        id v18 = objc_msgSend(v17, "substringWithRange:", 0, 18);
        uint64_t v19 = [v18 stringByAppendingString:@".."];

        dispatch_queue_t v17 = (void *)v19;
      }
      __int16 v20 = [v8 path];
      dispatch_source_t v21 = [v20 lastPathComponent];
      v22 = +[NSString stringWithFormat:@"--> Disappeared: %@", v21];

      v23 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v17;
        v25 = v23;
        *(_DWORD *)buf = 136446466;
        id v28 = [v24 UTF8String];
        __int16 v29 = 2114;
        objc_super v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }

  return v14;
}

- (id)createValidAssetFromURL:(id)a3 attemptCount:(unsigned int)a4 notify:(BOOL)a5 preflight:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  unsigned int v11 = [(MSCameraFolder *)self validAVAsset:v10];
  if (v8 && !v11)
  {
    dispatch_source_t v12 = +[NSNumber numberWithUnsignedInt:v8];
    dispatch_time_t v13 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002186C;
    block[3] = &unk_100034D80;
    v42 = v12;
    v43 = self;
    id v44 = v10;
    BOOL v45 = v6;
    id v14 = v12;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);

    dispatch_time_t v15 = v42;
LABEL_4:

    id v16 = 0;
    goto LABEL_19;
  }
  if (v11)
  {
    __ICOSLogCreate();
    id v17 = [(MSCameraItem *)self name];
    if ((unint64_t)[v17 length] >= 0x15)
    {
      id v18 = objc_msgSend(v17, "substringWithRange:", 0, 18);
      uint64_t v19 = [v18 stringByAppendingString:@".."];

      id v17 = (id)v19;
    }
    __int16 v20 = [v10 path];
    dispatch_source_t v21 = [v20 lastPathComponent];
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[decoded]-> 🟢 Retried: %@, Total Retry Time: %d(ms), Notify: %d", v21, (100 * (20 - v8)), v7);

    v23 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v8 == 20) {
    goto LABEL_16;
  }
  __ICOSLogCreate();
  id v17 = [(MSCameraItem *)self name];
  if ((unint64_t)[v17 length] >= 0x15)
  {
    id v24 = objc_msgSend(v17, "substringWithRange:", 0, 18);
    uint64_t v25 = [v24 stringByAppendingString:@".."];

    id v17 = (id)v25;
  }
  dispatch_time_t v26 = [v10 path];
  v27 = [v26 lastPathComponent];
  v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[not decoded]-> 🔴 Retried: %@, Total Retry Time: %d(ms)", v27, (100 * (20 - v8)));

  v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
LABEL_14:
    id v17 = v17;
    id v28 = v23;
    *(_DWORD *)buf = 136446466;
    id v47 = [v17 UTF8String];
    __int16 v48 = 2114;
    v49 = v22;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_15:

LABEL_16:
  if (v6)
  {
    __int16 v29 = [(MSCameraItem *)self device];
    [v29 incrementPreflightObjectCount:1];

    objc_super v30 = [(MSCameraItem *)self device];
    [v30 notifyDeviceReadyPreflightCount];
  }
  id v31 = [v10 path];
  __int16 v32 = [v31 lastPathComponent];
  id v16 = [(MSCameraFolder *)self newItemWithFSURL:v10 name:v32 notify:v7 fullMetadata:v8 == 20];

  if (!v16)
  {
    __ICOSLogCreate();
    id v14 = [(MSCameraItem *)self name];
    if ((unint64_t)[v14 length] >= 0x15)
    {
      v34 = objc_msgSend(v14, "substringWithRange:", 0, 18);
      uint64_t v35 = [v34 stringByAppendingString:@".."];

      id v14 = (id)v35;
    }
    v36 = [v10 path];
    v37 = [v36 lastPathComponent];
    dispatch_time_t v15 = +[NSString stringWithFormat:@"--> Disappeared: %@", v37];

    v38 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v14;
      v39 = v38;
      id v40 = [v14 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v47 = v40;
      __int16 v48 = 2114;
      v49 = v15;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    goto LABEL_4;
  }
LABEL_19:

  return v16;
}

- (BOOL)validAVAsset:(id)a3
{
  id v3 = a3;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  memset(&v18, 0, sizeof(v18));
  id v4 = [v3 path];
  int v5 = lstat((const char *)[v4 UTF8String], &v18);
  off_t st_size = v18.st_size;

  if (!v5 && st_size >= 1)
  {
    BOOL v7 = [v3 lastPathComponent];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = +[NSMutableArray array];
    id v10 = [objc_alloc((Class)AVURLAsset) initWithURL:v3 options:0];
    [v9 addObject:@"tracks"];
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100021BC0;
      v13[3] = &unk_100034858;
      id v14 = v10;
      id v15 = v7;
      id v17 = &v19;
      id v16 = v8;
      [v14 loadValuesAsynchronouslyForKeys:v9 completionHandler:v13];
    }
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  char v11 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (id)newItemWithFSURL:(id)a3 name:(id)a4 notify:(BOOL)a5 fullMetadata:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_source_t v12 = [MSCameraFile alloc];
  dispatch_time_t v13 = [(MSCameraItem *)self device];
  id v14 = [(MSCameraFile *)v12 initWithFSURL:v11 name:v10 parent:self device:v13 fullMetadata:v6];

  if (v14)
  {
    __ICOSLogCreate();
    id v15 = +[NSString stringWithFormat:@"File queued: %@\n", v14];
    id v16 = [v15 description];
    id v17 = +[NSString stringWithFormat:@"%@", v16];

    if (__ICLogTypeEnabled(4))
    {
      stat v18 = _gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }

    uint64_t v19 = [(MSCameraItem *)self device];
    [v19 addCameraFileToIndex:v14];

    if (v7)
    {
      CFStringRef v29 = @"ICMSObjectInfoArray";
      __int16 v20 = [(MSCameraItem *)v14 info];
      uint64_t v21 = [v20 content];
      id v28 = v21;
      char v22 = +[NSArray arrayWithObjects:&v28 count:1];
      objc_super v30 = v22;
      v23 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

      id v24 = [(MSCameraItem *)self device];
      uint64_t v25 = [(MSCameraItem *)self device];
      dispatch_time_t v26 = [v25 allConnections];
      [v24 sendAddedItemsNotification:v23 toConnections:v26];
    }
  }
  return v14;
}

- (id)folderMatchingPath:(id)a3
{
  id v4 = [a3 pathComponents];
  int v5 = +[NSMutableArray arrayWithArray:v4];

  if ([v5 count] == (id)1)
  {
    BOOL v6 = [(MSCameraItem *)self name];
    BOOL v7 = [v5 objectAtIndexedSubscript:0];
    unsigned int v8 = [v6 isEqualToString:v7];

    id v9 = 0;
    if (v8) {
      id v9 = self;
    }
  }
  else
  {
    [v5 removeObjectAtIndex:0];
    id v10 = +[NSString pathWithComponents:v5];
    id v9 = [(MSCameraFolder *)self folderMatchingPath:v10];
  }

  return v9;
}

- (NSMutableArray)content
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (NSMutableIndexSet)contentIndex
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 168, 1);
}

- (OS_dispatch_queue)reflightQueue
{
  return self->_reflightQueue;
}

- (void)setReflightQueue:(id)a3
{
}

- (OS_dispatch_source)reflightTimer
{
  return self->_reflightTimer;
}

- (void)setReflightTimer:(id)a3
{
}

- (BOOL)reflightRequested
{
  return self->_reflightRequested;
}

- (void)setReflightRequested:(BOOL)a3
{
  self->_reflightRequested = a3;
}

- (unsigned)reflightCount
{
  return self->_reflightCount;
}

- (void)setReflightCount:(unsigned int)a3
{
  self->_reflightCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reflightTimer, 0);
  objc_storeStrong((id *)&self->_reflightQueue, 0);
  objc_storeStrong((id *)&self->_contentIndex, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end