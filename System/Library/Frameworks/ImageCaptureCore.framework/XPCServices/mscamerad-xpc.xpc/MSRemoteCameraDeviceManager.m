@interface MSRemoteCameraDeviceManager
- (BOOL)startMSDeviceNotifications;
- (MSRemoteCameraDeviceManager)init;
- (NSDictionary)deviceMatchingInfo;
- (NSMutableArray)mountURLs;
- (NSMutableDictionary)domainsByURLEnabled;
- (id)monitoringContext;
- (void)dealloc;
- (void)ejectDevice:(id)a3 withReply:(id)a4;
- (void)processAddedURLs:(id)a3;
- (void)processMountURLs:(id)a3;
- (void)processRemovedURLs:(id)a3;
- (void)setDeviceMatchingInfo:(id)a3;
- (void)setDomainsByURLEnabled:(id)a3;
- (void)setMonitoringContext:(id)a3;
- (void)setMountURLs:(id)a3;
- (void)updatedWithAddedMountPoints:(id)a3 andRemovedMountPoints:(id)a4;
@end

@implementation MSRemoteCameraDeviceManager

- (MSRemoteCameraDeviceManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSRemoteCameraDeviceManager;
  v2 = [(ICRemoteCameraDeviceManager *)&v10 initManaging:@"MSCameraDevice" systemDaemon:0];
  v3 = v2;
  if (v2)
  {
    id monitoringContext = v2->_monitoringContext;
    v2->_id monitoringContext = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    domainsByURLEnabled = v3->_domainsByURLEnabled;
    v3->_domainsByURLEnabled = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mountURLs = v3->_mountURLs;
    v3->_mountURLs = v7;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_monitoringContext)
  {
    +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:");
    id monitoringContext = self->_monitoringContext;
    self->_id monitoringContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MSRemoteCameraDeviceManager;
  [(ICRemoteCameraDeviceManager *)&v4 dealloc];
}

- (BOOL)startMSDeviceNotifications
{
  if (!self->_deviceMatchingInfo)
  {
    v3 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/Frameworks/ImageCaptureCore.framework/DeviceMatchingInfo.plist"];
    deviceMatchingInfo = self->_deviceMatchingInfo;
    self->_deviceMatchingInfo = v3;
  }
  __ICOSLogCreate();
  v5 = @"FPProviderDomain";
  if ((unint64_t)[@"FPProviderDomain" length] >= 0x15)
  {
    v6 = objc_msgSend(@"FPProviderDomain", "substringWithRange:", 0, 18);
    v5 = [v6 stringByAppendingString:@".."];
  }
  v7 = +[NSString stringWithFormat:@"%@", @"Begin monitoring live-files"];
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v5;
    objc_super v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v16 = [(__CFString *)v9 UTF8String];
    __int16 v17 = 2114;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002339C;
  v14[3] = &unk_100034DA8;
  v14[4] = self;
  v11 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:v14];
  id monitoringContext = self->_monitoringContext;
  self->_id monitoringContext = v11;

  return self->_monitoringContext != 0;
}

- (void)processMountURLs:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MSRemoteCameraDeviceManager *)v5 mountURLs];
  v7 = +[NSMutableArray array];
  v8 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (([v4 containsObject:v13] & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
        if ((objc_msgSend(v9, "containsObject:", v18, (void)v19) & 1) == 0) {
          [v8 addObject:v18];
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  [(MSRemoteCameraDeviceManager *)v5 processRemovedURLs:v7];
  [(MSRemoteCameraDeviceManager *)v5 processAddedURLs:v8];
  [(MSRemoteCameraDeviceManager *)v5 setMountURLs:v14];

  objc_sync_exit(v5);
}

- (void)processRemovedURLs:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v7) path];
        id v9 = +[NSString stringWithFormat:@"/private%@/", v8];

        id v10 = [(MSRemoteCameraDeviceManager *)self domainsByURLEnabled];
        uint64_t v11 = +[NSURL fileURLWithPath:v9];
        v12 = [v10 objectForKeyedSubscript:v11];

        uint64_t v13 = [v12 objectForKeyedSubscript:@"ICProviderEnabled"];
        LODWORD(v11) = [v13 BOOLValue];

        if (v11)
        {
          id v14 = +[NSURL fileURLWithPath:v9];
          long long v23 = v14;
          id v15 = +[NSArray arrayWithObjects:&v23 count:1];
          [(MSRemoteCameraDeviceManager *)self updatedWithAddedMountPoints:0 andRemovedMountPoints:v15];
        }
        uint64_t v16 = [(MSRemoteCameraDeviceManager *)self domainsByURLEnabled];
        __int16 v17 = +[NSURL fileURLWithPath:v9];
        [v16 removeObjectForKey:v17];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)processAddedURLs:(id)a3
{
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v75 = *(void *)v89;
    v74 = self;
    do
    {
      uint64_t v6 = 0;
      id v70 = v5;
      do
      {
        if (*(void *)v89 != v75) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v88 + 1) + 8 * (void)v6);
        id v87 = 0;
        v8 = +[FPProviderDomain providerDomainForURL:v7 error:&v87];
        id v9 = v87;
        if (v8)
        {
          v79 = [v8 identifier];
          uint64_t v78 = [v8 providerDisplayName];
          id v10 = [v7 path];
          uint64_t v11 = +[NSString stringWithFormat:@"/private%@", v10];

          unsigned int v12 = sub_100022358(v11, 0, self->_deviceMatchingInfo);
          __ICOSLogCreate();
          uint64_t v13 = @"-> Photos";
          if ((unint64_t)[@"-> Photos" length] >= 0x15)
          {
            id v14 = objc_msgSend(@"-> Photos", "substringWithRange:", 0, 18);
            uint64_t v13 = [v14 stringByAppendingString:@".."];
          }
          unsigned int v77 = v12;
          CFStringRef v15 = @"🆘";
          if (v12) {
            CFStringRef v15 = @"✅";
          }
          CFStringRef v76 = v15;
          uint64_t v16 = +[NSString stringWithFormat:@"%@ : %@", v15, v11];
          __int16 v17 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = v13;
            long long v19 = v17;
            id v20 = [(__CFString *)v18 UTF8String];
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = v20;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v16;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          id v21 = v11;
          int v22 = open((const char *)[v21 UTF8String], 0x8000);
          if (v22 != -1)
          {
            int v23 = v22;
            dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v22, 0x17FuLL, (dispatch_queue_t)&_dispatch_main_q);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_100024520;
            handler[3] = &unk_100034808;
            long long v25 = v24;
            v84 = v25;
            v85 = self;
            id v26 = v21;
            id v86 = v26;
            dispatch_source_set_event_handler(v25, handler);
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472;
            v81[2] = sub_100024814;
            v81[3] = &unk_100034DC8;
            int v82 = v23;
            dispatch_source_set_cancel_handler(v25, v81);
            __src[0] = 0;
            __src[1] = 0;
            unint64_t v80 = 0;
            if (!v79) {
              goto LABEL_22;
            }
            id v27 = [(__CFString *)v79 smallestEncoding];
            [(__CFString *)v79 length];
            v28 = (char *)[(__CFString *)v79 length] - 16;
            [(__CFString *)v79 length];
            if (!-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v79, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 16, &v80, v27, 1, v28, 16, 0))goto LABEL_22; {
            UInt8 byte15 = 0;
            }
            UInt8 v30 = 0;
            UInt8 v31 = 0;
            UInt8 v32 = 0;
            UInt8 v33 = 0;
            UInt8 v34 = 0;
            UInt8 v35 = 0;
            UInt8 v36 = 0;
            UInt8 byte7 = 0;
            UInt8 v38 = 0;
            UInt8 v39 = 0;
            UInt8 v40 = 0;
            UInt8 v41 = 0;
            UInt8 v42 = 0;
            UInt8 v43 = 0;
            UInt8 v44 = 0;
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            int v45 = 16 - v80;
            if (v80 >= 0x10) {
              int v45 = 0;
            }
            if (v45 <= 15)
            {
              memcpy(&buf[v45], __src, (15 - v45) + 1);
              UInt8 v44 = buf[0];
              UInt8 v43 = buf[1];
              UInt8 v42 = buf[2];
              UInt8 v41 = buf[3];
              UInt8 v40 = buf[4];
              UInt8 v39 = buf[5];
              UInt8 v38 = buf[6];
              UInt8 byte7 = buf[7];
              UInt8 v36 = buf[8];
              UInt8 v35 = buf[9];
              UInt8 v34 = buf[10];
              UInt8 v33 = buf[11];
              UInt8 v32 = buf[12];
              UInt8 v31 = buf[13];
              UInt8 v30 = buf[14];
              UInt8 byte15 = buf[15];
            }
            CFUUIDRef v46 = CFUUIDCreateWithBytes(kCFAllocatorDefault, v44, v43, v42, v41, v40, v39, v38, byte7, v36, v35, v34, v33, v32, v31, v30, byte15);
            if (!v46 || (CFUUIDRef v47 = v46, v48 = CFUUIDCreateString(kCFAllocatorDefault, v46), CFRelease(v47), !v48))
            {
LABEL_22:
              v49 = +[NSUUID UUID];
              v50 = [v49 UUIDString];
              CFStringRef v48 = (CFStringRef)[v50 copy];
            }
            id v73 = v9;
            v51 = +[NSMutableDictionary dictionary];
            [v51 setObject:v25 forKeyedSubscript:@"ICProviderChangeSource"];
            v52 = +[NSNumber numberWithBool:v77];
            [v51 setObject:v52 forKeyedSubscript:@"ICProviderEnabled"];

            [v51 setObject:v78 forKeyedSubscript:@"ICDeviceName"];
            v72 = (__CFString *)v48;
            [v51 setObject:v48 forKeyedSubscript:@"ICDeviceMSUUID"];
            v53 = [(MSRemoteCameraDeviceManager *)v74 domainsByURLEnabled];
            v54 = +[NSURL fileURLWithPath:v26];
            [v53 setObject:v51 forKeyedSubscript:v54];

            v55 = +[NSMutableDictionary dictionary];
            v56 = +[NSURL fileURLWithPath:v26];
            [v55 setObject:v51 forKeyedSubscript:v56];

            __ICOSLogCreate();
            v57 = @"-> Photos";
            if ((unint64_t)[@"-> Photos" length] >= 0x15)
            {
              v58 = objc_msgSend(@"-> Photos", "substringWithRange:", 0, 18);
              v57 = [v58 stringByAppendingString:@".."];
            }
            v59 = +[NSString stringWithFormat:@"%@ : %@", v76, v26];
            v60 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v61 = v57;
              v62 = v60;
              id v63 = [(__CFString *)v61 UTF8String];
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = v63;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v59;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            id v9 = v73;
            self = v74;
            if (v77) {
              [(MSRemoteCameraDeviceManager *)v74 updatedWithAddedMountPoints:v55 andRemovedMountPoints:0];
            }
            dispatch_resume(v25);

            id v5 = v70;
          }

          v65 = (void *)v78;
          v64 = v79;
        }
        else
        {
          __ICOSLogCreate();
          v64 = @"FPProvider";
          if ((unint64_t)[@"FPProvider" length] >= 0x15)
          {
            v66 = objc_msgSend(@"FPProvider", "substringWithRange:", 0, 18);
            v64 = [v66 stringByAppendingString:@".."];
          }
          v65 = +[NSString stringWithFormat:@"providerDomain returned nil -- error: %@", v9];
          v67 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
          {
            v64 = v64;
            v68 = v67;
            id v69 = [(__CFString *)v64 UTF8String];
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = v69;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v65;
            _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);
          }
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      id v5 = [obj countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v5);
  }
}

- (void)updatedWithAddedMountPoints:(id)a3 andRemovedMountPoints:(id)a4
{
  id v36 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v44;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        __ICOSLogCreate();
        id v10 = @"MS Media";
        if ((unint64_t)[@"MS Media" length] >= 0x15)
        {
          uint64_t v11 = objc_msgSend(@"MS Media", "substringWithRange:", 0, 18);
          id v10 = [v11 stringByAppendingString:@".."];
        }
        unsigned int v12 = [v9 lastPathComponent];
        uint64_t v13 = +[NSString stringWithFormat:@"Removed: %@", v12];

        id v14 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v15 = v10;
          uint64_t v16 = v14;
          id v17 = [(__CFString *)v15 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v49 = v17;
          __int16 v50 = 2114;
          v51 = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        uint64_t v18 = [v9 path];
        [(ICRemoteCameraDeviceManager *)self notifyClientDeviceRemoved:v18];
      }
      id v6 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v6);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v33 = [v36 allKeys];
  id v37 = [v33 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v40;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v33);
        }
        id v20 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        id v21 = [v36 objectForKeyedSubscript:v20];
        int v22 = [v21 objectForKeyedSubscript:@"ICDeviceName"];
        int v23 = [v21 objectForKeyedSubscript:@"ICDeviceMSUUID"];
        __ICOSLogCreate();
        dispatch_source_t v24 = @"MS Media";
        if ((unint64_t)[@"MS Media" length] >= 0x15)
        {
          long long v25 = objc_msgSend(@"MS Media", "substringWithRange:", 0, 18);
          dispatch_source_t v24 = [v25 stringByAppendingString:@".."];
        }
        id v26 = [v20 lastPathComponent];
        id v27 = +[NSString stringWithFormat:@"Added: %@:%@", v22, v26];

        v28 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v24;
          UInt8 v30 = v28;
          id v31 = [(__CFString *)v29 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v49 = v31;
          __int16 v50 = 2114;
          v51 = v27;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        UInt8 v32 = [v20 path];
        [(ICRemoteCameraDeviceManager *)self notifyClientDeviceAdded:v32 uuidString:v23 deviceName:v22];
      }
      id v37 = [v33 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v37);
  }
}

- (void)ejectDevice:(id)a3 withReply:(id)a4
{
}

- (id)monitoringContext
{
  return self->_monitoringContext;
}

- (void)setMonitoringContext:(id)a3
{
}

- (NSDictionary)deviceMatchingInfo
{
  return self->_deviceMatchingInfo;
}

- (void)setDeviceMatchingInfo:(id)a3
{
}

- (NSMutableDictionary)domainsByURLEnabled
{
  return self->_domainsByURLEnabled;
}

- (void)setDomainsByURLEnabled:(id)a3
{
}

- (NSMutableArray)mountURLs
{
  return self->_mountURLs;
}

- (void)setMountURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountURLs, 0);
  objc_storeStrong((id *)&self->_domainsByURLEnabled, 0);
  objc_storeStrong((id *)&self->_deviceMatchingInfo, 0);

  objc_storeStrong(&self->_monitoringContext, 0);
}

@end