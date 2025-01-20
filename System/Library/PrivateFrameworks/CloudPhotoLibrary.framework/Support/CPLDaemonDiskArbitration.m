@interface CPLDaemonDiskArbitration
- (BOOL)isRootVolume;
- (CPLDaemonDiskArbitration)initWithVolumeURL:(id)a3 queue:(id)a4;
- (NSURL)volumeURL;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)redactedDescription;
- (void)addVolumeUnmountObserver:(id)a3;
- (void)removeVolumeUnmountObserver:(id)a3;
@end

@implementation CPLDaemonDiskArbitration

- (CPLDaemonDiskArbitration)initWithVolumeURL:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CPLDaemonDiskArbitration;
  v8 = [(CPLDaemonDiskArbitration *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = +[NSHashTable weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    v12 = (NSURL *)[v6 copy];
    volumeURL = v9->_volumeURL;
    v9->_volumeURL = v12;

    v14 = [(NSURL *)v9->_volumeURL path];
    v9->_isRootVolume = [v14 isEqualToString:@"/"];

    objc_storeStrong((id *)&v9->_queue, a4);
    if (!_CPLSilentLogging)
    {
      if (qword_1002CE4A0 != -1) {
        dispatch_once(&qword_1002CE4A0, &stru_1002772F8);
      }
      v15 = qword_1002CE4A8;
      if (os_log_type_enabled((os_log_t)qword_1002CE4A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initialized Volume Unmount Monitor %@", buf, 0xCu);
      }
    }
  }

  return v9;
}

- (void)addVolumeUnmountObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeVolumeUnmountObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSURL *)self->_volumeURL path];
  id v6 = [v3 initWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  if (self->_isRootVolume) {
    id v5 = "Root Volume";
  }
  else {
    id v5 = "External Volume";
  }
  id v6 = [v3 initWithFormat:@"<%@ %s>", v4, v5];
  return v6;
}

- (NSURL)volumeURL
{
  return self->_volumeURL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isRootVolume
{
  return self->_isRootVolume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_volumeURL, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end