@interface MFMailPurgeableStorageMonitor
- (MFMailPurgeableStorage)purgeableStorage;
- (MFMailPurgeableStorageMonitor)initWithPurgeableStorage:(id)a3;
- (__CFString)serviceName;
- (void)_schedulePushPurgeableSpaceUpdate;
- (void)dealloc;
- (void)pushPurgeableStateUpdate;
- (void)setPurgeableStorage:(id)a3;
@end

@implementation MFMailPurgeableStorageMonitor

- (void)dealloc
{
  xpc_activity_unregister("com.apple.MobileMail.pushPurgeableSpaceUpdate");
  v3.receiver = self;
  v3.super_class = (Class)MFMailPurgeableStorageMonitor;
  [(MFMailPurgeableStorageMonitor *)&v3 dealloc];
}

- (MFMailPurgeableStorageMonitor)initWithPurgeableStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailPurgeableStorageMonitor;
  v6 = [(MFMailPurgeableStorageMonitor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_serviceName = @"com.apple.mobilemail.CacheDelete";
    objc_storeStrong((id *)&v6->_purgeableStorage, a3);
    [(MFMailPurgeableStorageMonitor *)v7 _schedulePushPurgeableSpaceUpdate];
  }

  return v7;
}

- (void)_schedulePushPurgeableSpaceUpdate
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100075958;
  v3[3] = &unk_10013AD80;
  v3[4] = self;
  v2 = objc_retainBlock(v3);
  ef_xpc_activity_register();
}

- (void)pushPurgeableStateUpdate
{
  if (![(MFMailPurgeableStorageMonitor *)self serviceName])
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MFMailPurgeableStorageMonitor.m" lineNumber:76 description:@"Should have a service name"];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v17 = sub_100075CBC;
  v18 = &unk_10013B160;
  v19 = self;
  v20 = &v21;
  v4 = v16;
  uint64_t v5 = mach_absolute_time();
  v17((uint64_t)v4);
  uint64_t v6 = mach_absolute_time();
  if (qword_10016BB78 != -1) {
    dispatch_once(&qword_10016BB78, &stru_10013C708);
  }
  uint64_t v8 = dword_10016BB70;
  unint64_t v7 = *(unsigned int *)algn_10016BB74;

  objc_super v9 = +[NSByteCountFormatter stringFromByteCount:v22[3] countStyle:0];
  v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MFMailPurgeableStorageMonitor *)self serviceName];
    *(_DWORD *)buf = 138412802;
    v28 = v11;
    __int16 v29 = 2112;
    v30 = v9;
    __int16 v31 = 2048;
    double v32 = (double)((v6 - v5) * v8 / v7) / 1000000000.0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#CacheDelete %@ pushed non-purgeable amount change: %@ – (Duration: %.2fs)", buf, 0x20u);
  }

  v25[0] = @"CACHE_DELETE_ID";
  v26[0] = [(MFMailPurgeableStorageMonitor *)self serviceName];
  v25[1] = @"CACHE_DELETE_VOLUME";
  v12 = +[NSFileManager mf_defaultVolumeMountPoint];
  v26[1] = v12;
  v25[2] = @"CACHE_DELETE_NONPURGEABLE_AMOUNT";
  v13 = +[NSNumber numberWithUnsignedLongLong:v22[3]];
  v25[3] = @"CACHE_DELETE_URGENCY";
  v26[2] = v13;
  v26[3] = &off_1001462C0;
  v14 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];

  CacheDeleteUpdatePurgeable();
  _Block_object_dispose(&v21, 8);
}

- (MFMailPurgeableStorage)purgeableStorage
{
  return self->_purgeableStorage;
}

- (void)setPurgeableStorage:(id)a3
{
}

- (__CFString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
}

@end