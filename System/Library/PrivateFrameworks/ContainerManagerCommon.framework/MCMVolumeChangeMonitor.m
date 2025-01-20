@interface MCMVolumeChangeMonitor
- (BOOL)started;
- (MCMVolumeChangeMonitor)initWithWorkloop:(id)a3 mountPointURL:(id)a4;
- (NSHashTable)observers;
- (NSURL)mountPointURL;
- (OS_dispatch_queue)notificationQueue;
- (id)_volumesToMonitor;
- (unint64_t)_changeEventStart:(unint64_t)a3 end:(unint64_t)a4 targetActiveState:(unint64_t)a5 fromOldState:(unint64_t)a6 newState:(unint64_t)a7;
- (unint64_t)state;
- (void)_callbackWithVolume:(unsigned int)a3 notificationType:(unsigned int)a4 margs:(void *)a5;
- (void)_notifyObserver:(id)a3 events:(unint64_t)a4 newVolumeState:(unint64_t)a5;
- (void)_notifyObserversIfNeededWithOldState:(unint64_t)a3 newState:(unint64_t)a4;
- (void)_notifyObserversOfEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)start;
@end

@implementation MCMVolumeChangeMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_mountPointURL, 0);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (NSURL)mountPointURL
{
  return self->_mountPointURL;
}

- (id)_volumesToMonitor
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  mach_error_t BootDevice = APFSContainerGetBootDevice();
  if (BootDevice)
  {
    mach_error_t v4 = BootDevice;
    v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = mach_error_string(v4);
      _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "APFSContainerGetBootDevice failed; error = %s",
        buf,
        0xCu);
    }
  }
  else
  {
    uint64_t v17 = 0;
    v5 = 0;
    [v5 UTF8String];
    mach_error_t v6 = APFSVolumeRoleFind();
    if (v6)
    {
      mach_error_t v7 = v6;
      v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = mach_error_string(v7);
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "APFSVolumeRoleFind failed; error = %s", buf, 0xCu);
      }
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v8 = 0;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "substringFromIndex:", 5, v17);
            [v2 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v18 count:16];
        }
        while (v10);
      }
    }
  }

  if (![v2 count])
  {
    v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "No volumes to monitor", buf, 2u);
    }
  }
  v15 = objc_msgSend(v2, "copy", v17);

  return v15;
}

- (unint64_t)_changeEventStart:(unint64_t)a3 end:(unint64_t)a4 targetActiveState:(unint64_t)a5 fromOldState:(unint64_t)a6 newState:(unint64_t)a7
{
  if ((a7 & a5) != 0) {
    a4 = a3;
  }
  if (((a7 ^ a6) & a5) != 0) {
    return a4;
  }
  else {
    return 0;
  }
}

- (void)_notifyObserver:(id)a3 events:(unint64_t)a4 newVolumeState:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 volumeChangedDispatchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__MCMVolumeChangeMonitor__notifyObserver_events_newVolumeState___block_invoke;
  v10[3] = &unk_1E6A7FEF0;
  id v11 = v7;
  unint64_t v12 = a4;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(v8, v10);
}

uint64_t __64__MCMVolumeChangeMonitor__notifyObserver_events_newVolumeState___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  return [v2 volumeChangedWithEvents:v3 newVolumeState:v4];
}

- (void)_notifyObserversOfEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = [(MCMVolumeChangeMonitor *)self observers];
  objc_sync_enter(v7);
  v8 = [(MCMVolumeChangeMonitor *)self observers];
  id v9 = (void *)[v8 copy];

  objc_sync_exit(v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        [(MCMVolumeChangeMonitor *)self _notifyObserver:*(void *)(*((void *)&v15 + 1) + 8 * v13++) events:a3 newVolumeState:a4];
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v11);
  }
}

- (void)_notifyObserversIfNeededWithOldState:(unint64_t)a3 newState:(unint64_t)a4
{
  if (a3 != a4)
  {
    unint64_t v7 = [(MCMVolumeChangeMonitor *)self _changeEventStart:1 end:2 targetActiveState:1 fromOldState:a3 newState:a4];
    unint64_t v8 = [(MCMVolumeChangeMonitor *)self _changeEventStart:4 end:8 targetActiveState:2 fromOldState:a3 newState:a4] | v7;
    [(MCMVolumeChangeMonitor *)self _notifyObserversOfEvents:v8 newVolumeState:a4];
  }
}

- (void)_callbackWithVolume:(unsigned int)a3 notificationType:(unsigned int)a4 margs:(void *)a5
{
  mach_error_t v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(MCMVolumeChangeMonitor *)v6 state];
  uint64_t v8 = v7;
  unsigned int v9 = a4 + 536330234;
  unint64_t v10 = v7;
  switch(v9)
  {
    case 0u:
      unint64_t v10 = v7 | 1;
      break;
    case 1u:
      unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
      break;
    case 4u:
      unint64_t v10 = v7 | 2;
      break;
    case 5u:
      unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFDLL;
      break;
    default:
      break;
  }
  [(MCMVolumeChangeMonitor *)v6 setState:v10];
  objc_sync_exit(v6);

  [(MCMVolumeChangeMonitor *)v6 _notifyObserversIfNeededWithOldState:v8 newState:v10];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  io_object_t notifier = self->_notifier;
  if (notifier) {
    IOObjectRelease(notifier);
  }
  v4.receiver = self;
  v4.super_class = (Class)MCMVolumeChangeMonitor;
  [(MCMVolumeChangeMonitor *)&v4 dealloc];
}

- (void)start
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (![(MCMVolumeChangeMonitor *)self started])
  {
    [(MCMVolumeChangeMonitor *)self setStarted:1];
    uint64_t v3 = [(MCMVolumeChangeMonitor *)self _volumesToMonitor];
    mach_port_t v4 = *MEMORY[0x1E4F2EEF0];
    IONotificationPortRef v5 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
    if (!v5)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v36 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      int v33 = 134217984;
      uint64_t v34 = 0;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    mach_error_t v6 = v5;
    v27 = self;
    uint64_t v7 = [(MCMVolumeChangeMonitor *)self notificationQueue];
    v26 = v6;
    IONotificationPortSetDispatchQueue(v6, v7);

    uint64_t v8 = container_log_handle_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl(&dword_1D7739000, v8, OS_LOG_TYPE_DEFAULT, "Monitoring [%@]", buf, 0xCu);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v29 + 1) + 8 * i);
          CFDictionaryRef v15 = IOBSDNameMatching(v4, 0, (const char *)[v14 UTF8String]);
          io_service_t MatchingService = IOServiceGetMatchingService(v4, v15);
          if (MatchingService)
          {
            io_service_t v17 = MatchingService;
            if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
            {
              mach_error_t v18 = IOServiceAddInterestNotification(v26, v17, "IOGeneralInterest", (IOServiceInterestCallback)_MCMVolumeChangeMonitorCallback, v27, &v27->_notifier);
              uint64_t v19 = container_log_handle_for_category();
              long long v20 = v19;
              if (v18)
              {
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  long long v21 = mach_error_string(v18);
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v14;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = v21;
                  long long v22 = v20;
                  v23 = "failed to register volume interest notification for: %@ with error: %s";
                  uint32_t v24 = 22;
                  goto LABEL_20;
                }
              }
              else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v14;
                _os_log_impl(&dword_1D7739000, v20, OS_LOG_TYPE_DEFAULT, "registered volume interest notification for: %@", buf, 0xCu);
              }
            }
            else
            {
              long long v20 = container_log_handle_for_category();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v14;
                long long v22 = v20;
                v23 = "unable to monitor: %@ for freeze notifications, not an APFS volume";
                uint32_t v24 = 12;
LABEL_20:
                _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
              }
            }

            IOObjectRelease(v17);
            continue;
          }
          uint64_t v25 = container_log_handle_for_category();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "failed to find IOKit object for volume: %@", buf, 0xCu);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v11);
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  mach_port_t v4 = [(MCMVolumeChangeMonitor *)self observers];
  objc_sync_enter(v4);
  IONotificationPortRef v5 = [(MCMVolumeChangeMonitor *)self observers];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  mach_port_t v4 = [(MCMVolumeChangeMonitor *)self observers];
  objc_sync_enter(v4);
  IONotificationPortRef v5 = [(MCMVolumeChangeMonitor *)self observers];
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (MCMVolumeChangeMonitor)initWithWorkloop:(id)a3 mountPointURL:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCMVolumeChangeMonitor;
  uint64_t v8 = [(MCMVolumeChangeMonitor *)&v16 init];
  if (v8)
  {
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.volume_change_notification", v10, v6);
    notificationQueue = v8->_notificationQueue;
    v8->_notificationQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v13;

    objc_storeStrong((id *)&v8->_mountPointURL, a4);
    v8->_state = 0;
    v8->_io_object_t notifier = 0;
  }
  return v8;
}

@end