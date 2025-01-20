@interface MSCameraDevice
- (BOOL)acceptConnection:(id)a3;
- (BOOL)beingEjected;
- (BOOL)catalogingDone;
- (BOOL)deleteFile:(id)a3;
- (BOOL)eject;
- (BOOL)filledStorageCache;
- (BOOL)prioritizeSpeed;
- (BOOL)reflightPaused;
- (BOOL)removeCameraItemFromIndex:(unint64_t)a3;
- (ICOrderedMediaSet)indexedMediaSet;
- (MSCameraDevice)initWithDeviceContext:(id)a3;
- (NSMutableArray)mediaPaths;
- (NSURL)url;
- (OS_dispatch_source)reflightPauseSource;
- (id)cameraFileWithObjectID:(unint64_t)a3;
- (id)cameraFolderWithObjectID:(unint64_t)a3;
- (id)cameraItemWithObjectID:(unint64_t)a3;
- (id)copyIndexedFoldersAndFiles;
- (id)copyIndexedFoldersAndFilesURLs;
- (id)filesystemPath;
- (id)indexedFiles;
- (id)indexedFolders;
- (id)name;
- (id)reflight:(char *)a3 error:(id *)a4;
- (int)enumeratedItemCount;
- (int)preflightCount;
- (unint64_t)itemsInFolder:(id)a3;
- (void)addCameraFileToIndex:(id)a3;
- (void)addCameraFolderToIndex:(id)a3;
- (void)dealloc;
- (void)enumerateContentWithOptions:(id)a3;
- (void)incrementPreflightObjectCount:(int)a3;
- (void)notifyDeviceReadyObjectCount;
- (void)notifyDeviceReadyPreflightCount;
- (void)pauseReflight;
- (void)preflight;
- (void)preflight:(char *)a3;
- (void)reflight;
- (void)removeCameraFileFromIndex:(unint64_t)a3;
- (void)removeCameraFolderFromIndex:(unint64_t)a3;
- (void)requestDeleteObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestDownloadObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestFingerprintForObjectHandle:(id)a3 withReply:(id)a4;
- (void)requestMetadataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestReadDataFromObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)requestRefreshObjectHandleInfo:(id)a3 withReply:(id)a4;
- (void)requestSecurityScopedURLForObjectHandle:(id)a3 withReply:(id)a4;
- (void)requestStartUsingDeviceWithReply:(id)a3;
- (void)requestThumbnailDataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)sendContentsNotification:(id)a3;
- (void)setCatalogingDone:(BOOL)a3;
- (void)setFilledStorageCache:(BOOL)a3;
- (void)setIndexedMediaSet:(id)a3;
- (void)setMediaPaths:(id)a3;
- (void)setPreflightCount:(int)a3;
- (void)setPrioritizeSpeed:(BOOL)a3;
- (void)setReflightPauseSource:(id)a3;
- (void)setUrl:(id)a3;
- (void)updateCatalogingDone;
- (void)updateEnumeratedItemCountWithDelta:(int)a3;
@end

@implementation MSCameraDevice

- (MSCameraDevice)initWithDeviceContext:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSCameraDevice;
  v5 = [(ICRemoteCameraDevice *)&v21 initWithDeviceContext:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ICDevicePrimaryIdentifier"];
    uint64_t v7 = +[NSURL fileURLWithPath:v6];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    v5->_filledStorageCache = 0;
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mediaPaths = v5->_mediaPaths;
    v5->_mediaPaths = v9;

    atomic_store(0, (unsigned int *)&v5->_preflightCount);
    v5->_prioritizeSpeed = 0;
    v11 = [[ICOrderedMediaSet alloc] initWithTypes:&off_10003DCC0];
    indexedMediaSet = v5->_indexedMediaSet;
    v5->_indexedMediaSet = v11;

    v5->_mediaLock._os_unfair_lock_opaque = 0;
    v13 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v13 setObject:@"sdcard" forKeyedSubscript:@"ICDeviceSystemSymbolName"];

    v14 = [v4 objectForKeyedSubscript:@"ICDeviceName"];
    v15 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v15 setObject:v14 forKeyedSubscript:@"ICDeviceName"];

    v16 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v16 setObject:&__kCFBooleanFalse forKeyedSubscript:@"ICDeviceAllowsSyncingClock"];

    v17 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v17 setObject:@"ICTransportTypeMassStorage" forKeyedSubscript:@"ICDeviceTransportType"];

    v18 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v18 setObject:@"Camera" forKeyedSubscript:@"ICDeviceType"];

    v19 = [(ICRemoteCameraDevice *)v5 cameraDictionary];
    [v19 setObject:@"Camera" forKeyedSubscript:@"ICDeviceProductKind"];
  }
  return v5;
}

- (void)dealloc
{
  self->_filledStorageCache = 0;
  __ICOSLogCreate();
  v3 = @"mscameradevice";
  if ((unint64_t)[@"mscameradevice" length] >= 0x15)
  {
    id v4 = objc_msgSend(@"mscameradevice", "substringWithRange:", 0, 18);
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = [(MSCameraDevice *)self url];
  v6 = [v5 lastPathComponent];
  uint64_t v7 = +[NSString stringWithFormat:@"%s: %@", "Deallocated", v6];

  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v3;
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v22 = [(__CFString *)v9 UTF8String];
    __int16 v23 = 2114;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  v11 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
  [v11 cancelAllOperations];

  v12 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
  [v12 waitUntilAllOperationsAreFinished];

  [(MSCameraDevice *)self setUrl:0];
  v13 = [(ICRemoteCameraDevice *)self listener];

  if (v13)
  {
    v14 = [(ICRemoteCameraDevice *)self listener];
    [v14 invalidate];

    v15 = [(ICRemoteCameraDevice *)self listener];
    [v15 setDelegate:0];
  }
  reflightPauseSource = self->_reflightPauseSource;
  if (reflightPauseSource)
  {
    dispatch_source_cancel(reflightPauseSource);
    v17 = self->_reflightPauseSource;
    self->_reflightPauseSource = 0;
  }
  v18 = [(MSCameraDevice *)self indexedMediaSet];
  [v18 performSelector:@"clearDevice" onTypes:&off_10003DCD8];

  v19 = [(MSCameraDevice *)self indexedMediaSet];
  [v19 performSelector:@"cancelSource" onTypes:&off_10003DCF0];

  v20.receiver = self;
  v20.super_class = (Class)MSCameraDevice;
  [(ICRemoteCameraDevice *)&v20 dealloc];
}

- (void)requestStartUsingDeviceWithReply:(id)a3
{
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10000CBFC;
  v9 = &unk_100034928;
  v10 = self;
  id v11 = a3;
  id v4 = v11;
  v5 = +[NSBlockOperation blockOperationWithBlock:&v6];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v5, v6, v7, v8, v9, v10);
}

- (void)requestMetadataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10000D448;
  v15 = &unk_1000349C0;
  v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  id v11 = +[NSBlockOperation blockOperationWithBlock:&v12];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);
}

- (void)requestThumbnailDataForObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10000D758;
  v15 = &unk_1000349C0;
  v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  id v11 = +[NSBlockOperation blockOperationWithBlock:&v12];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);
}

- (void)requestDownloadObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000DA3C;
  uint64_t v13 = &unk_100034928;
  id v14 = a4;
  id v15 = a5;
  id v7 = v15;
  id v8 = v14;
  id v9 = +[NSBlockOperation blockOperationWithBlock:&v10];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v9, v10, v11, v12, v13);
}

- (void)requestReadDataFromObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10000DBE0;
  id v15 = &unk_1000349C0;
  v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v8 = v19;
  id v9 = v18;
  id v10 = v17;
  uint64_t v11 = +[NSBlockOperation blockOperationWithBlock:&v12];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);
}

- (void)requestDeleteObjectHandle:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[NSXPCConnection currentConnection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000DDE0;
  v16[3] = &unk_1000349E8;
  v16[4] = self;
  id v17 = v8;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v10;
  id v18 = v9;
  id v11 = v19;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = +[NSBlockOperation blockOperationWithBlock:v16];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v15];
}

- (void)requestSecurityScopedURLForObjectHandle:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSXPCConnection currentConnection];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10000E3FC;
  id v15 = &unk_1000349C0;
  v16 = self;
  id v17 = v6;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v7;
  id v8 = v7;
  id v9 = v18;
  id v10 = v6;
  id v11 = +[NSBlockOperation blockOperationWithBlock:&v12];
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v11, v12, v13, v14, v15, v16);
}

- (void)requestFingerprintForObjectHandle:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E8AC;
  v9[3] = &unk_100034950;
  v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  id v6 = v11;
  id v7 = v10;
  id v8 = +[NSBlockOperation blockOperationWithBlock:v9];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v8];
}

- (void)requestRefreshObjectHandleInfo:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000EAA4;
  v9[3] = &unk_100034950;
  v9[4] = self;
  id v10 = a3;
  id v11 = a4;
  id v6 = v11;
  id v7 = v10;
  id v8 = +[NSBlockOperation blockOperationWithBlock:v9];
  [(ICRemoteCameraDevice *)self addInteractiveOperation:v8];
}

- (id)filesystemPath
{
  v2 = [(ICRemoteCameraDevice *)self cameraDictionary];
  v3 = [v2 objectForKeyedSubscript:@"ICDeviceVolumePath"];

  return v3;
}

- (unint64_t)itemsInFolder:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v26 = v3;
  v5 = +[NSURL fileURLWithPath:v3];
  NSURLResourceKey v38 = NSURLContentModificationDateKey;
  id v6 = +[NSArray arrayWithObjects:&v38 count:1];
  id v7 = [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:4 error:0];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v14 = +[NSFileManager defaultManager];
        NSURLResourceKey v36 = NSURLContentModificationDateKey;
        id v15 = +[NSArray arrayWithObjects:&v36 count:1];
        v16 = [v14 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:v15 options:4 error:0];

        id v17 = [v16 count];
        __ICOSLogCreate();
        id v18 = @"content";
        if ((unint64_t)[@"content" length] >= 0x15)
        {
          id v19 = objc_msgSend(@"content", "substringWithRange:", 0, 18);
          id v18 = [v19 stringByAppendingString:@".."];
        }
        v10 += (unint64_t)v17;
        id v20 = +[NSString stringWithFormat:@"[%05lu] - %@", v10, v13];
        objc_super v21 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = v18;
          __int16 v23 = v21;
          id v24 = [(__CFString *)v22 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v33 = v24;
          __int16 v34 = 2114;
          v35 = v20;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)updateCatalogingDone
{
}

- (void)sendContentsNotification:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_10000F040;
  id v9 = &unk_100034A50;
  unint64_t v10 = self;
  id v11 = a3;
  id v4 = v11;
  v5 = +[NSBlockOperation blockOperationWithBlock:&v6];
  -[ICRemoteCameraDevice addInitiatedOperation:](self, "addInitiatedOperation:", v5, v6, v7, v8, v9, v10);
}

- (void)updateEnumeratedItemCountWithDelta:(int)a3
{
  self->_enumeratedCount += a3;
}

- (int)enumeratedItemCount
{
  return self->_enumeratedCount;
}

- (id)name
{
  v2 = [(ICRemoteCameraDevice *)self cameraDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"ICDeviceName"];

  return v3;
}

- (void)preflight:(char *)a3
{
  uint64_t v4 = +[NSString stringWithUTF8String:a3];
  v5 = +[NSFileManager defaultManager];
  v63 = (void *)v4;
  id v6 = +[NSURL fileURLWithPath:v4];
  NSURLResourceKey v86 = NSURLContentModificationDateKey;
  uint64_t v7 = +[NSArray arrayWithObjects:&v86 count:1];
  id v8 = [v5 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v7 options:4 error:0];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v76;
    uint64_t v64 = *(void *)v76;
    do
    {
      id v12 = 0;
      id v65 = v10;
      do
      {
        if (*(void *)v76 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v12);
        id v14 = [v13 lastPathComponent];
        if (sub_100012F74([v14 UTF8String], (uint64_t)objc_msgSend(v14, "length"), 1))
        {
          id v67 = v14;
          v68 = v12;
          [(MSCameraDevice *)self incrementPreflightObjectCount:1];
          id v15 = +[NSFileManager defaultManager];
          v84[0] = NSURLContentModificationDateKey;
          v84[1] = NSURLFileSizeKey;
          v16 = +[NSArray arrayWithObjects:v84 count:2];
          id v17 = [v15 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:v16 options:4 error:0];

          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v18 = v17;
          id v19 = [v18 countByEnumeratingWithState:&v71 objects:v83 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v69 = 0;
            uint64_t v21 = *(void *)v72;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v72 != v21) {
                  objc_enumerationMutation(v18);
                }
                __int16 v23 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                id v24 = [v23 lastPathComponent];
                if (!sub_100012F74([v24 UTF8String], (uint64_t)objc_msgSend(v24, "length"), 0)) {
                  goto LABEL_14;
                }
                v25 = [v23 path];
                v26 = [v25 lastPathComponent];
                v27 = [v26 pathExtension];
                [v27 lowercaseString];
                id v28 = v24;
                id v29 = v20;
                uint64_t v30 = v21;
                long long v31 = self;
                id v33 = v32 = v18;
                unsigned __int8 v70 = [v33 isEqualToString:@"mov"];

                id v18 = v32;
                self = v31;
                uint64_t v21 = v30;
                id v20 = v29;
                id v24 = v28;

                if ((v70 & 1) == 0)
                {
                  [(MSCameraDevice *)self incrementPreflightObjectCount:1];
                  uint64_t v69 = (v69 + 1);
                }
                else
                {
LABEL_14:
                  __ICOSLogCreate();
                  __int16 v34 = [(MSCameraDevice *)self name];
                  if ((unint64_t)[v34 length] >= 0x15)
                  {
                    v35 = objc_msgSend(v34, "substringWithRange:", 0, 18);
                    uint64_t v36 = [v35 stringByAppendingString:@".."];

                    __int16 v34 = (void *)v36;
                  }
                  v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"!DCF File: [%16s]", [v24 UTF8String]);
                  NSURLResourceKey v38 = (void *)_gICOSLog;
                  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                  {
                    id v39 = v34;
                    v40 = v38;
                    id v41 = [v39 UTF8String];
                    *(_DWORD *)buf = 136446466;
                    id v80 = v41;
                    __int16 v81 = 2114;
                    v82 = v37;
                    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
                  }
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v71 objects:v83 count:16];
            }
            while (v20);
          }
          else
          {
            uint64_t v69 = 0;
          }

          __ICOSLogCreate();
          v48 = [(MSCameraDevice *)self name];
          if ((unint64_t)[v48 length] >= 0x15)
          {
            v49 = objc_msgSend(v48, "substringWithRange:", 0, 18);
            uint64_t v50 = [v49 stringByAppendingString:@".."];

            v48 = (void *)v50;
          }
          id v10 = v65;
          id v14 = v67;
          v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"🗂 Folder Added - %04d - [%8s]", 1, [v67 UTF8String]);
          v52 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v53 = v48;
            v54 = v52;
            id v55 = [v53 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v80 = v55;
            __int16 v81 = 2114;
            v82 = v51;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          __ICOSLogCreate();
          v44 = [(MSCameraDevice *)self name];
          id v12 = v68;
          if ((unint64_t)[v44 length] >= 0x15)
          {
            v56 = objc_msgSend(v44, "substringWithRange:", 0, 18);
            uint64_t v57 = [v56 stringByAppendingString:@".."];

            v44 = (void *)v57;
          }
          v58 = +[NSString stringWithFormat:@"🗳 Files Added  - %04d", v69];
          v59 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = v44;
            v61 = v59;
            id v62 = [v60 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v80 = v62;
            __int16 v81 = 2114;
            v82 = v58;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          uint64_t v11 = v64;
        }
        else
        {
          __ICOSLogCreate();
          id v18 = [(MSCameraDevice *)self name];
          if ((unint64_t)[v18 length] >= 0x15)
          {
            v42 = objc_msgSend(v18, "substringWithRange:", 0, 18);
            uint64_t v43 = [v42 stringByAppendingString:@".."];

            id v18 = (id)v43;
          }
          v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"!DCF Folder: [%16s]", [v14 UTF8String]);
          v45 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = v18;
            v46 = v45;
            id v47 = [v18 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v80 = v47;
            __int16 v81 = 2114;
            v82 = v44;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }

        id v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v10);
  }
}

- (void)preflight
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(MSCameraDevice *)self mediaPaths];
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [(MSCameraDevice *)self incrementPreflightObjectCount:1];
        __ICOSLogCreate();
        id v8 = [(MSCameraDevice *)self name];
        if ((unint64_t)[v8 length] >= 0x15)
        {
          id v9 = objc_msgSend(v8, "substringWithRange:", 0, 18);
          uint64_t v10 = [v9 stringByAppendingString:@".."];

          id v8 = (void *)v10;
        }
        id v11 = v7;
        id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"🗄 Store Added  - %04d - [%8s]", 1, [v11 UTF8String]);
        uint64_t v13 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v8;
          id v15 = v13;
          id v16 = [v14 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v26 = v16;
          __int16 v27 = 2114;
          id v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        id v17 = [(ICRemoteCameraDevice *)self cameraDictionary];
        id v18 = [v17 objectForKeyedSubscript:@"ICDeviceVolumePath"];

        id v19 = [v18 stringByAppendingPathComponent:v11];
        -[MSCameraDevice preflight:](self, "preflight:", [v19 fileSystemRepresentation]);
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v4);
  }

  [(MSCameraDevice *)self notifyDeviceReadyPreflightCount];
}

- (void)notifyDeviceReadyPreflightCount
{
  uint64_t v3 = [(MSCameraDevice *)self preflightCount];
  v17[0] = @"ICDeviceStatus";
  v17[1] = @"ICANumberOfPreflightObjectsKey";
  v18[0] = @"ICDeviceIsReady";
  id v4 = +[NSNumber numberWithUnsignedInteger:v3];
  v18[1] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v6 = [(ICRemoteCameraDevice *)self allConnections];
  [(ICRemoteCameraDevice *)self sendStatusNotification:v5 toConnections:v6];

  __ICOSLogCreate();
  uint64_t v7 = @"notifyDeviceReady";
  if ((unint64_t)[@"notifyDeviceReady" length] >= 0x15)
  {
    id v8 = objc_msgSend(@"notifyDeviceReady", "substringWithRange:", 0, 18);
    uint64_t v7 = [v8 stringByAppendingString:@".."];
  }
  id v9 = +[NSString stringWithFormat:@"%lu Preflighted", v3];
  uint64_t v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v7;
    id v12 = v10;
    *(_DWORD *)buf = 136446466;
    id v14 = [(__CFString *)v11 UTF8String];
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (void)notifyDeviceReadyObjectCount
{
  uint64_t v3 = [(MSCameraDevice *)self indexedMediaSet];
  id v4 = [v3 mediaItemCount];

  v18[0] = @"ICDeviceStatus";
  v18[1] = @"ICANumberOfPreflightObjectsKey";
  v19[0] = @"ICDeviceIsReady";
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:v4];
  v19[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  uint64_t v7 = [(ICRemoteCameraDevice *)self allConnections];
  [(ICRemoteCameraDevice *)self sendStatusNotification:v6 toConnections:v7];

  __ICOSLogCreate();
  id v8 = @"notifyDeviceReady";
  if ((unint64_t)[@"notifyDeviceReady" length] >= 0x15)
  {
    id v9 = objc_msgSend(@"notifyDeviceReady", "substringWithRange:", 0, 18);
    id v8 = [v9 stringByAppendingString:@".."];
  }
  uint64_t v10 = +[NSString stringWithFormat:@"%lu Preflighted", v4];
  id v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v8;
    uint64_t v13 = v11;
    *(_DWORD *)buf = 136446466;
    id v15 = [(__CFString *)v12 UTF8String];
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (id)reflight:(char *)a3 error:(id *)a4
{
  uint64_t v5 = +[NSMutableArray array];
  uint64_t v6 = +[NSString stringWithUTF8String:a3];
  uint64_t v7 = +[NSFileManager defaultManager];
  v35 = (void *)v6;
  id v8 = +[NSURL fileURLWithPath:v6];
  NSURLResourceKey v51 = NSURLContentModificationDateKey;
  id v9 = +[NSArray arrayWithObjects:&v51 count:1];
  uint64_t v10 = [v7 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v9 options:4 error:0];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v45;
    uint64_t v36 = *(void *)v45;
    id v37 = v11;
    while (2)
    {
      id v15 = 0;
      id v38 = v13;
      do
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v15);
        id v17 = [v16 lastPathComponent];
        if (sub_100012F74([v17 UTF8String], (uint64_t)objc_msgSend(v17, "length"), 1))
        {
          [v5 addObject:v16];
          id v18 = +[NSFileManager defaultManager];
          NSURLResourceKey v49 = NSURLContentModificationDateKey;
          id v19 = +[NSArray arrayWithObjects:&v49 count:1];
          id v20 = [v18 contentsOfDirectoryAtURL:v16 includingPropertiesForKeys:v19 options:4 error:a4];

          if (*a4)
          {
            __ICOSLogCreate();
            id v29 = v17;
            uint64_t v30 = v29;
            if ((unint64_t)[v29 length] >= 0x15)
            {
              long long v31 = objc_msgSend(v29, "substringWithRange:", 0, 18);
              uint64_t v30 = [v31 stringByAppendingString:@".."];
            }
            id v32 = +[NSString stringWithFormat:@"contentsOfDirectoryAtURL Returned Error: %@", *a4];
            id v33 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
              sub_100024E40(v30, v33);
            }

            id v28 = 0;
            goto LABEL_26;
          }
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v21 = v20;
          id v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v41;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                id v27 = [v26 lastPathComponent];
                if (sub_100012F74([v27 UTF8String], (uint64_t)objc_msgSend(v27, "length"), 0)) {
                  [v5 addObject:v26];
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v23);
          }

          uint64_t v14 = v36;
          id v11 = v37;
          id v13 = v38;
        }

        id v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [v11 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v28 = v5;
LABEL_26:

  return v28;
}

- (void)reflight
{
  if ([(MSCameraDevice *)self filledStorageCache]
    && ![(MSCameraDevice *)self reflightPaused])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010B68;
    v10[3] = &unk_100034A78;
    v10[4] = self;
    uint64_t v3 = +[NSBlockOperation blockOperationWithBlock:v10];
    [(ICRemoteCameraDevice *)self addInitiatedOperation:v3];
  }
  else
  {
    __ICOSLogCreate();
    uint64_t v3 = [(MSCameraDevice *)self name];
    if ((unint64_t)[v3 length] >= 0x15)
    {
      id v4 = objc_msgSend(v3, "substringWithRange:", 0, 18);
      uint64_t v5 = [v4 stringByAppendingString:@".."];

      uint64_t v3 = (void *)v5;
    }
    uint64_t v6 = +[NSString stringWithFormat:@"Reflight Cancelled - enumerating[%d], paused[%d]", [(MSCameraDevice *)self filledStorageCache] ^ 1, [(MSCameraDevice *)self reflightPaused]];
    uint64_t v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v3;
      id v9 = v7;
      *(_DWORD *)buf = 136446466;
      id v12 = [v8 UTF8String];
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

- (void)enumerateContentWithOptions:(id)a3
{
  id v31 = a3;
  id v4 = [v31 objectForKeyedSubscript:@"ICEnumerationPrioritizeSpeed"];
  if ([v4 BOOLValue]) {
    -[MSCameraDevice setPrioritizeSpeed:](self, "setPrioritizeSpeed:", [v4 BOOLValue]);
  }
  if ([(MSCameraDevice *)self filledStorageCache])
  {
    [(MSCameraDevice *)self notifyDeviceReadyObjectCount];
    uint64_t v5 = +[NSXPCConnection currentConnection];
    __ICOSLogCreate();
    uint64_t v6 = @"enumerateContent";
    if ((unint64_t)[@"enumerateContent" length] >= 0x15)
    {
      uint64_t v7 = objc_msgSend(@"enumerateContent", "substringWithRange:", 0, 18);
      uint64_t v6 = [v7 stringByAppendingString:@".."];
    }
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Requested From:%d", [v5 processIdentifier]);
    id v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v6;
      id v11 = v9;
      *(_DWORD *)buf = 136446466;
      id v37 = [(__CFString *)v10 UTF8String];
      __int16 v38 = 2114;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(MSCameraDevice *)self sendContentsNotification:v5];
  }
  else
  {
    [(MSCameraDevice *)self preflight];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v5 = [(MSCameraDevice *)self mediaPaths];
    id v12 = [v5 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v12)
    {
      id v13 = v12;
      id v29 = v4;
      id obj = v5;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(obj);
          }
          __int16 v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v17 = [(ICRemoteCameraDevice *)self cameraDictionary];
          id v18 = [v17 objectForKeyedSubscript:@"ICDeviceVolumePath"];
          id v19 = [v18 stringByAppendingPathComponent:v16];

          id v20 = [MSCameraFolder alloc];
          id v21 = +[NSURL fileURLWithPath:v19 isDirectory:1];
          id v22 = [v16 lastPathComponent];
          id v23 = [(MSCameraFolder *)v20 initWithFSURL:v21 name:v22 parent:0 device:self];

          if (v23)
          {
            [(MSCameraDevice *)self addCameraFolderToIndex:v23];
            CFStringRef v41 = @"ICMSObjectInfoArray";
            uint64_t v24 = [(MSCameraItem *)v23 info];
            v25 = [v24 content];
            long long v40 = v25;
            id v26 = +[NSArray arrayWithObjects:&v40 count:1];
            long long v42 = v26;
            id v27 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

            id v28 = [(ICRemoteCameraDevice *)self allConnections];
            [(ICRemoteCameraDevice *)self sendAddedItemsNotification:v27 toConnections:v28];

            [(MSCameraFolder *)v23 enumerateContentWithOptions:v31];
          }
        }
        uint64_t v5 = obj;
        id v13 = [obj countByEnumeratingWithState:&v32 objects:v43 count:16];
      }
      while (v13);
      id v4 = v29;
    }
  }

  [(MSCameraDevice *)self setFilledStorageCache:1];
}

- (BOOL)eject
{
  return 1;
}

- (void)pauseReflight
{
  uint64_t v3 = [(ICRemoteCameraDevice *)self deviceOperationQueue];
  id v4 = [v3 underlyingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011CFC;
  block[3] = &unk_100034A78;
  block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)reflightPaused
{
  v2 = [(MSCameraDevice *)self reflightPauseSource];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)deleteFile:(id)a3
{
  id v4 = a3;
  [(MSCameraDevice *)self pauseReflight];
  if ([v4 locked]) {
    goto LABEL_4;
  }
  id v5 = [v4 path];
  if (!unlink((const char *)[v5 fileSystemRepresentation]))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v5 lastPathComponent];
      id v9 = [v8 stringByDeletingPathExtension];
      uint64_t v10 = [v9 stringByAppendingPathComponent:@"THM"];

      id v11 = [v5 stringByDeletingLastPathComponent];
      id v12 = [v11 stringByAppendingPathComponent:v10];

      if (v12) {
        unlink((const char *)[v12 fileSystemRepresentation]);
      }
    }
    goto LABEL_10;
  }
  int v6 = *__error();

  if (v6 == 2)
  {
LABEL_10:
    -[MSCameraDevice removeCameraFileFromIndex:](self, "removeCameraFileFromIndex:", [v4 objHandle]);
    BOOL v7 = 1;
    goto LABEL_11;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (void)addCameraFileToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(MSCameraDevice *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (void)addCameraFolderToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(MSCameraDevice *)self indexedMediaSet];
  [v5 addMediaItemToIndex:v4];
}

- (id)cameraFileWithObjectID:(unint64_t)a3
{
  id v4 = [(MSCameraDevice *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:&off_10003DD08];

  return v5;
}

- (id)cameraFolderWithObjectID:(unint64_t)a3
{
  id v4 = [(MSCameraDevice *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:&off_10003DD20];

  return v5;
}

- (id)cameraItemWithObjectID:(unint64_t)a3
{
  id v4 = [(MSCameraDevice *)self indexedMediaSet];
  id v5 = [v4 mediaItemWithHandle:a3 inTypes:0];

  return v5;
}

- (void)removeCameraFileFromIndex:(unint64_t)a3
{
  id v5 = [(MSCameraDevice *)self cameraFileWithObjectID:a3];
  if (v5)
  {
    id v4 = [(MSCameraDevice *)self indexedMediaSet];
    [v4 removeMediaItemFromIndex:v5];

    [(MSCameraDevice *)self updateEnumeratedItemCountWithDelta:0xFFFFFFFFLL];
    [(MSCameraDevice *)self incrementPreflightObjectCount:0xFFFFFFFFLL];
  }
}

- (void)removeCameraFolderFromIndex:(unint64_t)a3
{
  id v4 = [(MSCameraDevice *)self cameraFolderWithObjectID:a3];
  if (v4)
  {
    id v6 = v4;
    [v4 cancelSource];
    id v5 = [(MSCameraDevice *)self indexedMediaSet];
    [v5 removeMediaItemFromIndex:v6];

    [(MSCameraDevice *)self updateEnumeratedItemCountWithDelta:0xFFFFFFFFLL];
    id v4 = v6;
  }
}

- (BOOL)removeCameraItemFromIndex:(unint64_t)a3
{
  id v5 = -[MSCameraDevice cameraItemWithObjectID:](self, "cameraItemWithObjectID:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MSCameraDevice *)self removeCameraFolderFromIndex:a3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    [(MSCameraDevice *)self removeCameraFileFromIndex:a3];
  }
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

- (id)copyIndexedFoldersAndFiles
{
  BOOL v3 = [(MSCameraDevice *)self indexedMediaSet];
  id v4 = [v3 arrayForType:@"file"];

  id v5 = [(MSCameraDevice *)self indexedMediaSet];
  BOOL v6 = [v5 arrayForType:@"folder"];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  [v7 addObjectsFromArray:v6];
  [v7 addObjectsFromArray:v4];

  return v7;
}

- (id)indexedFiles
{
  v2 = [(MSCameraDevice *)self indexedMediaSet];
  BOOL v3 = [v2 arrayForType:@"file"];

  return v3;
}

- (id)indexedFolders
{
  v2 = [(MSCameraDevice *)self indexedMediaSet];
  BOOL v3 = [v2 arrayForType:@"folder"];

  return v3;
}

- (id)copyIndexedFoldersAndFilesURLs
{
  v2 = [(MSCameraDevice *)self indexedMediaSet];
  BOOL v3 = [v2 arrayForType:@"file"];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v11 = [v10 path];
        id v12 = +[NSURL fileURLWithPath:v11];

        id v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 objHandle]);
        objc_setAssociatedObject(v12, "ICObjectHandle", v13, (void *)0x303);

        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  id v27 = v5;

  uint64_t v14 = [(MSCameraDevice *)self indexedMediaSet];
  id v15 = [v14 arrayForType:@"folder"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        id v22 = [v21 path];
        id v23 = +[NSURL fileURLWithPath:v22];

        uint64_t v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v21 objHandle]);
        objc_setAssociatedObject(v23, "ICObjectHandle", v24, (void *)0x303);

        [v4 addObject:v23];
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  return v4;
}

- (BOOL)beingEjected
{
  return 0;
}

- (BOOL)acceptConnection:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSCameraDevice;
  if (![(ICRemoteCameraDevice *)&v15 acceptConnection:v4])
  {
    v14.receiver = self;
    v14.super_class = (Class)MSCameraDevice;
    if (![(ICRemoteCameraDevice *)&v14 evaulateCommonTCC:v4])
    {
      BOOL v12 = 0;
      goto LABEL_10;
    }
    __ICOSLogCreate();
    id v5 = @"TCC Access";
    if ((unint64_t)[@"TCC Access" length] >= 0x15)
    {
      id v6 = objc_msgSend(@"TCC Access", "substringWithRange:", 0, 18);
      id v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"Access has been granted"];
    uint64_t v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v5;
      uint64_t v10 = v8;
      id v11 = [(__CFString *)v9 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (void)incrementPreflightObjectCount:(int)a3
{
}

- (BOOL)catalogingDone
{
  return self->_catalogingDone;
}

- (void)setCatalogingDone:(BOOL)a3
{
  self->_catalogingDone = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int)preflightCount
{
  return atomic_load((unsigned int *)&self->_preflightCount);
}

- (void)setPreflightCount:(int)a3
{
}

- (BOOL)prioritizeSpeed
{
  return self->_prioritizeSpeed;
}

- (void)setPrioritizeSpeed:(BOOL)a3
{
  self->_prioritizeSpeed = a3;
}

- (OS_dispatch_source)reflightPauseSource
{
  return self->_reflightPauseSource;
}

- (void)setReflightPauseSource:(id)a3
{
}

- (ICOrderedMediaSet)indexedMediaSet
{
  return self->_indexedMediaSet;
}

- (void)setIndexedMediaSet:(id)a3
{
}

- (NSMutableArray)mediaPaths
{
  return self->_mediaPaths;
}

- (void)setMediaPaths:(id)a3
{
}

- (BOOL)filledStorageCache
{
  return self->_filledStorageCache;
}

- (void)setFilledStorageCache:(BOOL)a3
{
  self->_filledStorageCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaPaths, 0);
  objc_storeStrong((id *)&self->_indexedMediaSet, 0);
  objc_storeStrong((id *)&self->_reflightPauseSource, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end