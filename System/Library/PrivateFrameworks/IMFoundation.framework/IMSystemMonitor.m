@interface IMSystemMonitor
+ (id)sharedInstance;
- (BOOL)_alreadyLocked_isSystemIdle;
- (BOOL)_deviceStillUnderFirstLock;
- (BOOL)_idleOverride;
- (BOOL)_isUnderDataProtectionLockForState:(int)a3;
- (BOOL)_underFirstLock;
- (BOOL)isActive;
- (BOOL)isBackingUp;
- (BOOL)isFastUserSwitched;
- (BOOL)isInBackground;
- (BOOL)isScreenLit;
- (BOOL)isScreenLocked;
- (BOOL)isScreenSaverActive;
- (BOOL)isSetup;
- (BOOL)isSystemIdle;
- (BOOL)isSystemLocked;
- (BOOL)isUnderDataProtectionLock;
- (BOOL)isUnderFirstDataProtectionLock;
- (BOOL)listeningForSetupAssistantNotifications;
- (BOOL)receivesMemoryWarnings;
- (BOOL)systemIsShuttingDown;
- (BOOL)systemIsSleeping;
- (BOOL)usesPowerNotifications;
- (BOOL)usesSystemIdleState;
- (BOOL)watchesDataProtectionLockState;
- (BOOL)watchesScreenLightState;
- (BOOL)watchesSystemLockState;
- (CUTDeferredTaskQueue)_postScreenLockedTask;
- (CUTDeferredTaskQueue)_postScreenSaverStartedTask;
- (IMDispatchTimer)_timer;
- (IMSystemMonitor)init;
- (NSDate)_idleStart;
- (NSDate)dateScreenLightLastChanged;
- (NSDate)dateSystemLockLastChanged;
- (NSHashTable)_earlyListeners;
- (NSHashTable)_listeners;
- (NSString)_userID;
- (double)_delayTime;
- (double)systemIdleTime;
- (int)_dataProtectionState;
- (int)userIdleToken;
- (int64_t)resignActiveCount;
- (os_unfair_lock_s)ivarLock;
- (void)_addEarlyListener:(id)a3;
- (void)_alreadyLocked_clearIdleTimer;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationDidRemoveDeactivationReason:(id)a3;
- (void)_applicationWillAddDeactivationReason:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_checkRestoredFromBackup;
- (void)_clearIdleTimer;
- (void)_deliverNotificationSelector:(SEL)a3;
- (void)_forceResumed;
- (void)_forceSuspended;
- (void)_notificationCenterDidDisappear:(id)a3;
- (void)_notificationCenterWillAppear:(id)a3;
- (void)_overrideAndDisableIdleTimer:(BOOL)a3;
- (void)_postScreenLocked;
- (void)_postScreenSaverStarted;
- (void)_receivedMemoryNotification;
- (void)_registerForRestoreNotifications;
- (void)_registerForSetupNotifications;
- (void)_removeEarlyListener:(id)a3;
- (void)_restoreDidStart;
- (void)_restoreDidStop;
- (void)_resume:(id)a3;
- (void)_resumeEventsOnly:(id)a3;
- (void)_screenLocked:(id)a3;
- (void)_screenSaverStarted:(id)a3;
- (void)_screenSaverStopped:(id)a3;
- (void)_screenUnlocked:(id)a3;
- (void)_setDataProtectionLockState:(int)a3;
- (void)_setIdleState:(BOOL)a3;
- (void)_setSystemLockState:(BOOL)a3;
- (void)_setSystemScreenState:(BOOL)a3;
- (void)_setupStateChanged;
- (void)_suspend:(id)a3;
- (void)_suspendEventsOnly:(id)a3;
- (void)_systemDidWake;
- (void)_systemWillShutdown;
- (void)_systemWillSleep;
- (void)_unregisterForRestoreNotifications;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setIsFastUserSwitched:(BOOL)a3;
- (void)setIvarLock:(os_unfair_lock_s)a3;
- (void)setListeningForSetupAssistantNotifications:(BOOL)a3;
- (void)setReceivesMemoryWarnings:(BOOL)a3;
- (void)setResignActiveCount:(int64_t)a3;
- (void)setUserIdleToken:(int)a3;
- (void)setUsesPowerNotifications:(BOOL)a3;
- (void)setWatchesDataProtectionLockState:(BOOL)a3;
- (void)setWatchesScreenLightState:(BOOL)a3;
- (void)setWatchesSystemLockState:(BOOL)a3;
- (void)set_dataProtectionState:(int)a3;
- (void)set_delayTime:(double)a3;
- (void)set_earlyListeners:(id)a3;
- (void)set_idleOverride:(BOOL)a3;
- (void)set_idleStart:(id)a3;
- (void)set_listeners:(id)a3;
- (void)set_timer:(id)a3;
- (void)set_underFirstLock:(BOOL)a3;
- (void)set_userID:(id)a3;
@end

@implementation IMSystemMonitor

- (BOOL)usesPowerNotifications
{
  v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_usesPowerNotifications;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Will enter foreground", v4, v5, v6, v7, v8, v14);
  }
  os_unfair_lock_lock(&self->_ivarLock);
  self->_inBackground = 0;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (objc_msgSend_usesPowerNotifications(self, v9, v10, v11)) {
    sub_1918B81F0();
  }
  objc_msgSend__deliverNotificationSelector_(self, v12, (uint64_t)sel_systemApplicationWillEnterForeground, v13);
}

- (void)_registerForRestoreNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1918B9620, @"FaceTimeRegistrationRestoredFromBackupNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)sub_1918B9630, @"com.apple.MobileSync.BackupAgent.RestoreStarted", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)sub_1918B969C, @"com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (IMSystemMonitor)init
{
  v63.receiver = self;
  v63.super_class = (Class)IMSystemMonitor;
  v2 = [(IMSystemMonitor *)&v63 init];
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
    char v3 = byte_1EB273C10;
    byte_1EB273C10 = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
    if ((v3 & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1918B9E40, @"com.apple.springboard.deviceWillShutDown", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      if (dword_1EB273740 == -1)
      {
        uint64_t v5 = im_primary_queue();
        dword_1EB273740 = IMDispatchForNotify("com.apple.mobile.data_eschaton", 0, v5, &unk_1EE230DD8);
      }
    }
    *(void *)&v2->_userIdleToken = 0xFFFFFFFFLL;
    id v6 = objc_alloc(MEMORY[0x1E4F28D30]);
    uint64_t v8 = objc_msgSend_initWithOptions_capacity_(v6, v7, 517, 0);
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F28D30]);
    uint64_t v12 = objc_msgSend_initWithOptions_capacity_(v10, v11, 517, 0);
    earlyListeners = v2->_earlyListeners;
    v2->_earlyListeners = (NSHashTable *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F59DF8]);
    v15 = im_primary_queue();
    uint64_t v17 = objc_msgSend_initWithCapacity_queue_block_(v14, v16, 1, (uint64_t)v15, &unk_1EE231058);
    postScreenLockedTask = v2->__postScreenLockedTask;
    v2->__postScreenLockedTask = (CUTDeferredTaskQueue *)v17;

    id v19 = objc_alloc(MEMORY[0x1E4F59DF8]);
    v20 = im_primary_queue();
    uint64_t v22 = objc_msgSend_initWithCapacity_queue_block_(v19, v21, 1, (uint64_t)v20, &unk_1EE231318);
    postScreenSaverStartedTask = v2->__postScreenSaverStartedTask;
    v2->__postScreenSaverStartedTask = (CUTDeferredTaskQueue *)v22;

    if (qword_1EB273C18 != -1) {
      dispatch_once(&qword_1EB273C18, &unk_1EE230E18);
    }
    if (qword_1EB273D30 && qword_1EB273D38)
    {
      v27 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
      objc_msgSend_addObserver_selector_name_object_(v27, v28, (uint64_t)v2, (uint64_t)sel__applicationDidEnterBackground_, qword_1EB273D30, 0);

      v32 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
      objc_msgSend_addObserver_selector_name_object_(v32, v33, (uint64_t)v2, (uint64_t)sel__applicationWillEnterForeground_, qword_1EB273D38, 0);
    }
    if (qword_1EB273D40 && qword_1EB273D48)
    {
      v34 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
      objc_msgSend_addObserver_selector_name_object_(v34, v35, (uint64_t)v2, (uint64_t)sel__suspend_, qword_1EB273D40, 0);

      v39 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v36, v37, v38);
      objc_msgSend_addObserver_selector_name_object_(v39, v40, (uint64_t)v2, (uint64_t)sel__resume_, qword_1EB273D48, 0);
    }
    if (qword_1EB273D20 && qword_1EB273D28)
    {
      v41 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
      objc_msgSend_addObserver_selector_name_object_(v41, v42, (uint64_t)v2, (uint64_t)sel__applicationDidBecomeActive_, qword_1EB273D20, 0);

      v46 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v43, v44, v45);
      objc_msgSend_addObserver_selector_name_object_(v46, v47, (uint64_t)v2, (uint64_t)sel__applicationWillResignActive_, qword_1EB273D28, 0);
    }
    if (qword_1EB273D50 && qword_1EB273D58)
    {
      v48 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
      objc_msgSend_addObserver_selector_name_object_(v48, v49, (uint64_t)v2, (uint64_t)sel__suspendEventsOnly_, qword_1EB273D50, 0);

      v53 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v50, v51, v52);
      objc_msgSend_addObserver_selector_name_object_(v53, v54, (uint64_t)v2, (uint64_t)sel__resumeEventsOnly_, qword_1EB273D58, 0);
    }
    if (qword_1EB273D60 && qword_1EB273D68)
    {
      v55 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v24, v25, v26);
      objc_msgSend_addObserver_selector_name_object_(v55, v56, (uint64_t)v2, (uint64_t)sel__applicationWillAddDeactivationReason_, qword_1EB273D60, 0);

      v60 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v57, v58, v59);
      objc_msgSend_addObserver_selector_name_object_(v60, v61, (uint64_t)v2, (uint64_t)sel__applicationDidRemoveDeactivationReason_, qword_1EB273D68, 0);
    }
    objc_msgSend__registerForRestoreNotifications(v2, v24, v25, v26);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1EB273CE0 != -1) {
    dispatch_once(&qword_1EB273CE0, &unk_1EE22FB38);
  }
  v2 = (void *)qword_1EB273C40;
  return v2;
}

- (BOOL)systemIsShuttingDown
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
  char v2 = byte_1E92DB584;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
  return v2;
}

- (void)addListener:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  if ((objc_msgSend_containsObject_(self->_listeners, v4, (uint64_t)v12, v5) & 1) == 0) {
    objc_msgSend_addObject_(self->_listeners, v6, (uint64_t)v12, v7);
  }
  if (self->_listeningForSetupAssistantNotifications)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();
    os_unfair_lock_unlock(&self->_ivarLock);
    if (v8) {
      objc_msgSend__registerForSetupNotifications(self, v9, v10, v11);
    }
  }
}

- (void)_deliverNotificationSelector:(SEL)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isActive(self, a2, (uint64_t)a3, v3))
  {
    os_unfair_lock_lock(&self->_ivarLock);
    v9 = objc_msgSend_allObjects(self->_earlyListeners, v6, v7, v8);
    os_unfair_lock_t lock = &self->_ivarLock;
    os_unfair_lock_unlock(&self->_ivarLock);
    id v10 = v9;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v46;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector())
          {
            if (_IMWillLog(@"SystemMonitor"))
            {
              id v19 = NSStringFromSelector(a3);
              _IMAlwaysLog(0, @"SystemMonitor", @"Delivering %@ to %@", v20, v21, v22, v23, v24, (char)v19);
            }
            objc_msgSend_performSelector_withObject_(v16, v18, (uint64_t)a3, 0);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v13);
    }

    os_unfair_lock_lock(lock);
    v28 = objc_msgSend_allObjects(self->_listeners, v25, v26, v27);
    os_unfair_lock_unlock(lock);
    id v29 = v28;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v46;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v29);
          }
          v35 = *(void **)(*((void *)&v45 + 1) + 8 * v34);
          if (objc_opt_respondsToSelector())
          {
            if (_IMWillLog(@"SystemMonitor"))
            {
              uint64_t v38 = NSStringFromSelector(a3);
              _IMAlwaysLog(0, @"SystemMonitor", @"Delivering %@ to %@", v39, v40, v41, v42, v43, (char)v38);
            }
            objc_msgSend_performSelector_withObject_(v35, v37, (uint64_t)a3, 0);
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v32);
    }
  }
}

- (BOOL)isActive
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  id v20 = a3;
  uint64_t v7 = objc_msgSend_userInfo(v20, v4, v5, v6);
  id v10 = objc_msgSend_objectForKey_(v7, v8, qword_1EB273D70, v9);

  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Will add deactivation reason %@", v13, v14, v15, v16, v17, (char)v10);
  }
  if (objc_msgSend_intValue(v10, v11, v12, v13) == 1) {
    objc_msgSend__notificationCenterWillAppear_(self, v18, (uint64_t)v20, v19);
  }
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  id v20 = a3;
  uint64_t v7 = objc_msgSend_userInfo(v20, v4, v5, v6);
  id v10 = objc_msgSend_objectForKey_(v7, v8, qword_1EB273D70, v9);

  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Did remove deactivation reason %@", v13, v14, v15, v16, v17, (char)v10);
  }
  if (objc_msgSend_intValue(v10, v11, v12, v13) == 1) {
    objc_msgSend__notificationCenterDidDisappear_(self, v18, (uint64_t)v20, v19);
  }
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3) {
    self->_active = 1;
  }
  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_suspend:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Suspended", v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidSuspend, v5);
}

- (void)_resumeEventsOnly:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"ResumedForEventsOnly", v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidResumeForEventsOnly, v5);
}

- (void)_resume:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Resumed", v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidResume, v5);
}

- (void)_applicationDidBecomeActive:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  int64_t resignActiveCount = self->_resignActiveCount;
  BOOL v6 = resignActiveCount < 1;
  int64_t v7 = resignActiveCount - 1;
  if (v6)
  {
LABEL_7:
    os_unfair_lock_unlock(p_ivarLock);
    return;
  }
  self->_int64_t resignActiveCount = v7;
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Became Active, new count %d", v8, v9, v10, v11, v12, self->_resignActiveCount);
  }
  if (self->_resignActiveCount)
  {
    if (_IMWillLog(@"SystemMonitor")) {
      _IMAlwaysLog(0, @"SystemMonitor", @"Not active yet, ignoring", v13, v14, v15, v16, v17, v20);
    }
    goto LABEL_7;
  }
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v18, (uint64_t)sel_systemApplicationDidBecomeActive, v19);
}

- (BOOL)watchesDataProtectionLockState
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_watchesDataProtectionLockState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)watchesScreenLightState
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_watchesScreenLightState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)watchesSystemLockState
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_watchesSystemLockState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)receivesMemoryWarnings
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_receivesMemoryWarnings;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)usesSystemIdleState
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_usesSystemIdleState;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (NSDate)dateScreenLightLastChanged
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  uint64_t v4 = self->_dateScreenLightLastChanged;
  os_unfair_lock_unlock(p_ivarLock);
  return v4;
}

- (NSDate)dateSystemLockLastChanged
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  uint64_t v4 = self->_dateSystemLockLastChanged;
  os_unfair_lock_unlock(p_ivarLock);
  return v4;
}

- (BOOL)systemIsSleeping
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_willSleep;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isScreenSaverActive
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_screensaverActive;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isBackingUp
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_backingUp;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isFastUserSwitched
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_switchedOut;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isScreenLit
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_screenLit;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isSystemLocked
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_systemLocked;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)isInBackground
{
  char v2 = self;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_inBackground;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)dealloc
{
  objc_msgSend__unregisterForRestoreNotifications(self, a2, v2, v3);
  objc_msgSend__unregisterForLoginWindowNotifications(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
  objc_msgSend_removeObserver_name_object_(v11, v12, (uint64_t)self, 0, 0);

  sub_1918B7AF4();
  objc_msgSend_invalidate(self->_timer, v13, v14, v15);
  v16.receiver = self;
  v16.super_class = (Class)IMSystemMonitor;
  [(IMSystemMonitor *)&v16 dealloc];
}

- (void)_systemDidWake
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_willSleep = 0;
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemDidWake, v5);
}

- (void)_systemWillSleep
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_willSleep = 1;
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemWillSleep, v5);
}

- (void)_postScreenLocked
{
  objc_msgSend_cancelPendingExecutions(self->__postScreenLockedTask, a2, v2, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screenLocked)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    self->_screenLocked = 1;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenLocked, v6);
  }
}

- (void)_screenLocked:(id)a3
{
  objc_msgSend_cancelPendingExecutions(self->__postScreenLockedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  BOOL screenLocked = self->_screenLocked;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (!screenLocked)
  {
    postScreenLockedTask = self->__postScreenLockedTask;
    objc_msgSend_enqueueExecutionWithTarget_afterDelay_(postScreenLockedTask, v6, (uint64_t)self, v7, 6.0);
  }
}

- (void)_screenUnlocked:(id)a3
{
  objc_msgSend_cancelPendingExecutions(self->__postScreenLockedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screenLocked)
  {
    self->_BOOL screenLocked = 0;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenUnlocked, v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (BOOL)isScreenLocked
{
  if (qword_1E92DB578 != -1) {
    dispatch_once(&qword_1E92DB578, &unk_1EE230D18);
  }
  uint64_t v4 = objc_msgSend_sharedInstance(IMSystemMonitor, a2, v2, v3);
  char isSystemLocked = objc_msgSend_isSystemLocked(v4, v5, v6, v7);

  return isSystemLocked;
}

- (void)_applicationWillResignActive:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  ++self->_resignActiveCount;
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Resign active, new count %d", v5, v6, v7, v8, v9, self->_resignActiveCount);
  }
  if (self->_resignActiveCount == 1)
  {
    os_unfair_lock_unlock(p_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v10, (uint64_t)sel_systemApplicationWillResignActive, v11);
  }
  else
  {
    if (_IMWillLog(@"SystemMonitor")) {
      _IMAlwaysLog(0, @"SystemMonitor", @"Already resigned active, ignoring", v12, v13, v14, v15, v16, v17);
    }
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)_suspendEventsOnly:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"SuspendedForEventsOnly", v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemApplicationDidSuspendForEventsOnly, v5);
}

- (void)_notificationCenterWillAppear:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Notification center will appear", v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_notificationCenterWillAppear, v5);
}

- (void)_notificationCenterDidDisappear:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Notification center did disappear", v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_notificationCenterDidDisappear, v5);
}

- (void)_postScreenSaverStarted
{
  objc_msgSend_cancelPendingExecutions(self->__postScreenSaverStartedTask, a2, v2, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screensaverActive)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    self->_screensaverActive = 1;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenSaverDidStart, v6);
  }
}

- (void)_screenSaverStopped:(id)a3
{
  objc_msgSend_cancelPendingExecutions(self->__postScreenSaverStartedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screensaverActive)
  {
    self->_screensaverActive = 0;
    os_unfair_lock_unlock(&self->_ivarLock);
    objc_msgSend__deliverNotificationSelector_(self, v5, (uint64_t)sel_screenSaverDidStop, v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (void)_screenSaverStarted:(id)a3
{
  objc_msgSend_cancelPendingExecutions(self->__postScreenSaverStartedTask, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_ivarLock);
  BOOL screensaverActive = self->_screensaverActive;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (!screensaverActive)
  {
    postScreenSaverStartedTask = self->__postScreenSaverStartedTask;
    objc_msgSend_enqueueExecutionWithTarget_afterDelay_(postScreenSaverStartedTask, v6, (uint64_t)self, v7, 5.0);
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Did enter background", v4, v5, v6, v7, v8, v14);
  }
  os_unfair_lock_lock(&self->_ivarLock);
  self->_inBackground = 1;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (objc_msgSend_usesPowerNotifications(self, v9, v10, v11)) {
    sub_1918B7AF4();
  }
  objc_msgSend__deliverNotificationSelector_(self, v12, (uint64_t)sel_systemApplicationDidEnterBackground, v13);
}

- (BOOL)_deviceStillUnderFirstLock
{
  return (int)MKBDeviceUnlockedSinceBoot() < 1;
}

- (void)_setDataProtectionLockState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_underFirstLock)
  {
    char Lock = objc_msgSend__deviceStillUnderFirstLock(self, v6, v7, v8);
    self->_underFirstchar Lock = Lock;
    os_unfair_lock_unlock(p_ivarLock);
    if ((Lock & 1) == 0) {
      objc_msgSend__deliverNotificationSelector_(self, v10, (uint64_t)sel_systemDidLeaveFirstDataProtectionLock, v11);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  os_unfair_lock_lock(p_ivarLock);
  uint64_t dataProtectionState = self->_dataProtectionState;
  if (dataProtectionState == v3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    int isUnderDataProtectionLockForState = objc_msgSend__isUnderDataProtectionLockForState_(self, v12, dataProtectionState, v13);
    self->_uint64_t dataProtectionState = v3;
    int v18 = objc_msgSend__isUnderDataProtectionLockForState_(self, v16, v3, v17);
    os_unfair_lock_unlock(p_ivarLock);
    if (isUnderDataProtectionLockForState != v18)
    {
      if (v18) {
        uint64_t v21 = sel_systemDidEnterDataProtectionLock;
      }
      else {
        uint64_t v21 = sel_systemDidLeaveDataProtectionLock;
      }
      objc_msgSend__deliverNotificationSelector_(self, v19, (uint64_t)v21, v20);
    }
  }
}

- (BOOL)isUnderDataProtectionLock
{
  uint64_t v2 = self;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = objc_msgSend__isUnderDataProtectionLockForState_(v2, v4, v2->_dataProtectionState, v5);
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)_isUnderDataProtectionLockForState:(int)a3
{
  return (a3 - 1) < 2;
}

- (BOOL)isUnderFirstDataProtectionLock
{
  uint64_t v2 = self;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = v2->_underFirstLock;
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (void)setWatchesDataProtectionLockState:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_watchesDataProtectionLockState)
  {
    self->_watchesDataProtectionLockState = 1;
    os_unfair_lock_unlock(p_ivarLock);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
    if (dword_1E92DA368 == -1)
    {
      uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v7 = dispatch_queue_create(0, v6);

      dword_1E92DA368 = IMDispatchForNotify((const char *)*MEMORY[0x1E4F78160], 0, v7, &unk_1EE230EF8);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
      uint64_t v11 = objc_msgSend_sharedInstance(IMSystemMonitor, v8, v9, v10);
      BOOL v12 = MKBGetDeviceLockState() != 0;
      objc_msgSend__setSystemLockState_(v11, v13, v12, v14);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
    }
    os_unfair_lock_lock(p_ivarLock);
    self->_uint64_t dataProtectionState = MKBGetDeviceLockState();
    self->_underFirstchar Lock = objc_msgSend__deviceStillUnderFirstLock(self, v15, v16, v17);
  }
  os_unfair_lock_unlock(p_ivarLock);
}

- (void)setWatchesSystemLockState:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_watchesSystemLockState)
  {
    self->_watchesSystemLockState = 1;
    os_unfair_lock_unlock(p_ivarLock);
    uint64_t v14 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
    if (dword_1E92DA320 == -1)
    {
      dispatch_queue_t v7 = im_primary_queue();
      im_notify_register_dispatch("com.apple.springboard.lockstate", &dword_1E92DA320, &v14, 1, v7, &unk_1EE230F38);

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
      uint64_t v11 = objc_msgSend_sharedInstance(IMSystemMonitor, v8, v9, v10);
      objc_msgSend__setSystemLockState_(v11, v12, v14 != 0, v13);

      return;
    }
    uint64_t v6 = (os_unfair_lock_s *)&unk_1EB273AD0;
  }
  else
  {
    uint64_t v6 = p_ivarLock;
  }
  os_unfair_lock_unlock(v6);
}

- (void)setWatchesScreenLightState:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_watchesScreenLightState)
  {
    self->_watchesScreenLightState = 1;
    os_unfair_lock_unlock(p_ivarLock);
    uint64_t v14 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
    if (dword_1E92DA324 == -1)
    {
      dispatch_queue_t v7 = im_primary_queue();
      im_notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &dword_1E92DA324, &v14, 1, v7, &unk_1EE230F58);

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
      uint64_t v11 = objc_msgSend_sharedInstance(IMSystemMonitor, v8, v9, v10);
      objc_msgSend__setSystemScreenState_(v11, v12, v14 == 0, v13);

      return;
    }
    uint64_t v6 = (os_unfair_lock_s *)&unk_1EB273AD0;
  }
  else
  {
    uint64_t v6 = p_ivarLock;
  }
  os_unfair_lock_unlock(v6);
}

- (void)setUsesPowerNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (v3 && !self->_usesPowerNotifications)
  {
    self->_usesPowerNotifications = 1;
    os_unfair_lock_unlock(p_ivarLock);
    sub_1918B81F0();
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (void)_setSystemScreenState:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_screenLit == v3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_screenLit = v3;
    uint64_t v6 = self->_dateScreenLightLastChanged;
    dispatch_queue_t v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    dateScreenLightLastChanged = self->_dateScreenLightLastChanged;
    self->_dateScreenLightLastChanged = v7;

    BOOL v9 = _IMWillLog(@"IMSystemMonitor");
    if (v3)
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        double v14 = fabs(v13);
        _IMAlwaysLog(0, @"IMSystemMonitor", @"Screen did light up (Was down for %f seconds)", v15, v16, v17, v18, v19, SLOBYTE(v14));
      }

      os_unfair_lock_unlock(p_ivarLock);
      uint64_t v22 = sel_systemScreenDidPowerUp;
    }
    else
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        double v24 = fabs(v23);
        _IMAlwaysLog(0, @"IMSystemMonitor", @"Screen did light down (Was lit for %f seconds)", v25, v26, v27, v28, v29, SLOBYTE(v24));
      }

      os_unfair_lock_unlock(p_ivarLock);
      uint64_t v22 = sel_systemScreenDidPowerDown;
    }
    objc_msgSend__deliverNotificationSelector_(self, v20, (uint64_t)v22, v21);
  }
}

- (void)_setSystemLockState:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_systemLocked == v3)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_systemLocked = v3;
    uint64_t v6 = self->_dateSystemLockLastChanged;
    dispatch_queue_t v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    dateSystemLockLastChanged = self->_dateSystemLockLastChanged;
    self->_dateSystemLockLastChanged = v7;

    BOOL v9 = _IMWillLog(@"IMSystemMonitor");
    if (v3)
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        double v14 = fabs(v13);
        _IMAlwaysLog(0, @"IMSystemMonitor", @"Screen did lock (Was unlocked for %f seconds)", v15, v16, v17, v18, v19, SLOBYTE(v14));
      }

      os_unfair_lock_unlock(p_ivarLock);
      uint64_t v22 = sel_systemDidLock;
    }
    else
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v6, v10, v11, v12);
        double v24 = fabs(v23);
        _IMAlwaysLog(0, @"IMSystemMonitor", @"Screen did unlock (Was locked for %f seconds)", v25, v26, v27, v28, v29, SLOBYTE(v24));
      }

      os_unfair_lock_unlock(p_ivarLock);
      uint64_t v22 = sel_systemDidUnlock;
    }
    objc_msgSend__deliverNotificationSelector_(self, v20, (uint64_t)v22, v21);
  }
}

- (void)_setIdleState:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (((self->_idleStart == 0) ^ v3))
  {
    if (_IMWillLog(@"Idle"))
    {
      double v14 = @"NO";
      if (v3) {
        double v14 = @"YES";
      }
      _IMAlwaysLog(0, @"Idle", @"No change system idle  (State: %@)", v9, v10, v11, v12, v13, (char)v14);
    }
LABEL_15:
    os_unfair_lock_unlock(p_ivarLock);
    return;
  }
  objc_msgSend__alreadyLocked_clearIdleTimer(self, v6, v7, v8);
  if (_IMWillLog(@"Idle"))
  {
    uint64_t v20 = @"NO";
    if (v3) {
      uint64_t v20 = @"YES";
    }
    _IMAlwaysLog(0, @"Idle", @"Setting system idle to be: %@", v15, v16, v17, v18, v19, (char)v20);
  }
  idleStart = self->_idleStart;
  self->_idleStart = 0;

  if (v3)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v26 = (NSDate *)objc_msgSend_initWithTimeIntervalSinceNow_(v22, v23, v24, v25, -self->_delayTime);
    uint64_t v27 = self->_idleStart;
    self->_idleStart = v26;
  }
  if (_IMWillLog(@"Idle")) {
    _IMAlwaysLog(0, @"Idle", @"Became idle at: %@", v30, v31, v32, v33, v34, (char)self->_idleStart);
  }
  if (self->_idleOverride) {
    goto LABEL_15;
  }
  int isSystemIdle = objc_msgSend__alreadyLocked_isSystemIdle(self, v28, v29, v30);
  os_unfair_lock_unlock(p_ivarLock);
  if (isSystemIdle) {
    uint64_t v38 = sel_systemDidBecomeIdle;
  }
  else {
    uint64_t v38 = sel_systemDidBecomeUnidle;
  }
  objc_msgSend__deliverNotificationSelector_(self, v36, (uint64_t)v38, v37);
}

- (void)_overrideAndDisableIdleTimer:(BOOL)a3
{
  BOOL v3 = a3;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (_IMWillLog(@"Idle"))
  {
    if (self->_idleOverride) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    _IMAlwaysLog(0, @"Idle", @"Old override %@ new override %@", v6, v7, v8, v9, v10, (char)v11);
  }
  if (self->_idleOverride == v3) {
    goto LABEL_7;
  }
  if (_IMWillLog(@"Idle"))
  {
    uint64_t v17 = @"NO";
    if (v3) {
      uint64_t v17 = @"YES";
    }
    _IMAlwaysLog(0, @"Idle", @"Setting idle override to: %@", v12, v13, v14, v15, v16, (char)v17);
  }
  idleStart = self->_idleStart;
  self->_idleOverride = v3;
  if (v3 && idleStart)
  {
    if (_IMWillLog(@"Idle")) {
      _IMAlwaysLog(0, @"Idle", @"  => Override enabled, and we were idle, telling people we're not", v19, v20, v21, v22, v23, v32);
    }
    os_unfair_lock_unlock(p_ivarLock);
    uint64_t v26 = sel_systemDidBecomeUnidle;
  }
  else
  {
    if (v3 || !idleStart)
    {
LABEL_7:
      os_unfair_lock_unlock(p_ivarLock);
      return;
    }
    if (_IMWillLog(@"Idle")) {
      _IMAlwaysLog(0, @"Idle", @"  => Override disabled, and we were idle, telling people we're idle now", v27, v28, v29, v30, v31, v32);
    }
    os_unfair_lock_unlock(p_ivarLock);
    uint64_t v26 = sel_systemDidBecomeIdle;
  }
  objc_msgSend__deliverNotificationSelector_(self, v24, (uint64_t)v26, v25);
}

- (void)_clearIdleTimer
{
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  objc_msgSend__alreadyLocked_clearIdleTimer(self, v4, v5, v6);
  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_alreadyLocked_clearIdleTimer
{
  if (self->_timer)
  {
    if (_IMWillLog(@"Idle")) {
      _IMAlwaysLog(0, @"Idle", @"Clearing idle timer", v5, v6, v7, v8, v9, v11);
    }
    objc_msgSend_invalidate(self->_timer, v3, v4, v5);
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (BOOL)isSystemIdle
{
  uint64_t v2 = self;
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  LOBYTE(v2) = objc_msgSend__alreadyLocked_isSystemIdle(v2, v4, v5, v6);
  os_unfair_lock_unlock(p_ivarLock);
  return (char)v2;
}

- (BOOL)_alreadyLocked_isSystemIdle
{
  return self->_idleStart && !self->_idleOverride;
}

- (double)systemIdleTime
{
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  objc_msgSend_timeIntervalSinceNow(self->_idleStart, v4, v5, v6);
  double v8 = v7;
  os_unfair_lock_unlock(p_ivarLock);
  return v8;
}

- (void)_systemWillShutdown
{
  objc_msgSend__deliverNotificationSelector_(self, a2, (uint64_t)sel_systemWillShutdown, v2);
}

- (void)_addEarlyListener:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock(&self->_ivarLock);
  if ((objc_msgSend_containsObject_(self->_earlyListeners, v4, (uint64_t)v12, v5) & 1) == 0) {
    objc_msgSend_addObject_(self->_earlyListeners, v6, (uint64_t)v12, v7);
  }
  if (self->_listeningForSetupAssistantNotifications)
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();
    os_unfair_lock_unlock(&self->_ivarLock);
    if (v8) {
      objc_msgSend__registerForSetupNotifications(self, v9, v10, v11);
    }
  }
}

- (void)_removeEarlyListener:(id)a3
{
  p_ivarchar Lock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  objc_msgSend_removeObject_(self->_earlyListeners, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)removeListener:(id)a3
{
  p_ivarchar Lock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  objc_msgSend_removeObject_(self->_listeners, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_checkRestoredFromBackup
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1918B9264;
  v2[3] = &unk_1E5723270;
  v2[4] = self;
  im_dispatch_after_primary_queue(v2, 5.0);
}

- (void)_restoreDidStart
{
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_backingUp = 1;
  os_unfair_lock_unlock(p_ivarLock);
  objc_msgSend__deliverNotificationSelector_(self, v4, (uint64_t)sel_systemDidStartBackup, v5);
}

- (void)_restoreDidStop
{
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  self->_backingUp = 0;
  os_unfair_lock_unlock(p_ivarLock);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1918B93B0;
  v4[3] = &unk_1E5723270;
  v4[4] = self;
  im_dispatch_after_primary_queue(v4, 5.0);
}

- (void)_setupStateChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1918B9430;
  v2[3] = &unk_1E5723270;
  v2[4] = self;
  im_dispatch_after_primary_queue(v2, 5.0);
}

- (void)_registerForSetupNotifications
{
  p_ivarchar Lock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (self->_listeningForSetupAssistantNotifications)
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    self->_listeningForSetupAssistantNotifications = 1;
    os_unfair_lock_unlock(p_ivarLock);
    if (qword_1E92DB000
      || ((uint64_t v4 = (void **)IMWeakLinkSymbol()) == 0 ? (v5 = 0) : (v5 = *v4),
          objc_storeStrong((id *)&qword_1E92DB000, v5),
          qword_1E92DB000))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1918B9560, (CFStringRef)qword_1E92DB000, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v8 = (const __CFString *)sub_1918B95CC();
    CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)sub_1918B9560, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_unregisterForRestoreNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)sub_1918B95CC();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"FaceTimeRegistrationRestoredFromBackupNotification", 0);
  uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, @"com.apple.MobileSync.BackupAgent.RestoreStarted", 0);
  uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, @"com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded", 0);
}

- (BOOL)isSetup
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_msgSend__registerForSetupNotifications(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_sharedInstance(IMLockdownManager, v4, v5, v6);
  char isVendorInstall = objc_msgSend_isVendorInstall(v7, v8, v9, v10);

  if (isVendorInstall) {
    return 1;
  }
  if (qword_1E92DAD98 != -1) {
    dispatch_once(&qword_1E92DAD98, &unk_1EE230738);
  }
  if (byte_1E92DB588 | byte_1E92DB589) {
    return 1;
  }
  if (qword_1E92DAD88 != -1) {
    dispatch_once(&qword_1E92DAD88, &unk_1EE2307B8);
  }
  if (qword_1E92DAD90 != -1) {
    dispatch_once(&qword_1E92DAD90, &unk_1EE2307D8);
  }
  int v12 = off_1E92DAD78();
  int v13 = off_1E92DAD80();
  char v14 = (v13 | v12) ^ 1;
  uint64_t v18 = objc_msgSend_registration(IMRGLog, v15, v16, v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = @"YES";
    if (v13 | v12) {
      uint64_t v20 = @"NO";
    }
    else {
      uint64_t v20 = @"YES";
    }
    if (v13) {
      uint64_t v21 = @"YES";
    }
    else {
      uint64_t v21 = @"NO";
    }
    int v23 = 138412802;
    uint64_t v24 = v20;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    if (v12) {
      uint64_t v19 = @"NO";
    }
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    _os_log_impl(&dword_191892000, v18, OS_LOG_TYPE_DEFAULT, "Done checking if device is setup {isSetup: %@, needsToRun: %@, tokenUpgradeDone: %@}", (uint8_t *)&v23, 0x20u);
  }

  return v14;
}

- (void)_forceResumed
{
  if (_IMWillLog(@"Daemon")) {
    _IMAlwaysLog(0, @"Daemon", @"Forcing resume notification", v3, v4, v5, v6, v7, v8);
  }
  MEMORY[0x1F4181798](self, sel__resume_, 0, v3);
}

- (void)_forceSuspended
{
  if (_IMWillLog(@"Daemon")) {
    _IMAlwaysLog(0, @"Daemon", @"Forcing suspend notification", v3, v4, v5, v6, v7, v8);
  }
  MEMORY[0x1F4181798](self, sel__suspend_, 0, v3);
}

- (void)_receivedMemoryNotification
{
  if (_IMWillLog(@"Daemon")) {
    _IMAlwaysLog(0, @"Daemon", @"Received memory warning, dispatching to listeners", v4, v5, v6, v7, v8, v9);
  }
  objc_msgSend__deliverNotificationSelector_(self, v3, (uint64_t)sel_systemDidEnterMemoryPressure, v4);
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
    if (!qword_1E92DB008)
    {
      uint64_t v4 = im_primary_queue();
      dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 2uLL, v4);
      uint64_t v6 = (void *)qword_1E92DB008;
      qword_1E92DB008 = (uint64_t)v5;

      dispatch_source_set_event_handler((dispatch_source_t)qword_1E92DB008, &unk_1EE230838);
      dispatch_resume((dispatch_object_t)qword_1E92DB008);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
    os_unfair_lock_lock(&self->_ivarLock);
    self->_receivesMemoryWarnings = 1;
    os_unfair_lock_unlock(&self->_ivarLock);
  }
}

- (int)_dataProtectionState
{
  return self->_dataProtectionState;
}

- (void)set_dataProtectionState:(int)a3
{
  self->_uint64_t dataProtectionState = a3;
}

- (BOOL)_underFirstLock
{
  return self->_underFirstLock;
}

- (void)set_underFirstLock:(BOOL)a3
{
  self->_underFirstchar Lock = a3;
}

- (void)setIsFastUserSwitched:(BOOL)a3
{
  self->_switchedOut = a3;
}

- (NSHashTable)_listeners
{
  return self->_listeners;
}

- (void)set_listeners:(id)a3
{
}

- (NSDate)_idleStart
{
  return self->_idleStart;
}

- (void)set_idleStart:(id)a3
{
}

- (IMDispatchTimer)_timer
{
  return self->_timer;
}

- (void)set_timer:(id)a3
{
}

- (NSString)_userID
{
  return self->_userID;
}

- (void)set_userID:(id)a3
{
}

- (double)_delayTime
{
  return self->_delayTime;
}

- (void)set_delayTime:(double)a3
{
  self->_delayTime = a3;
}

- (BOOL)_idleOverride
{
  return self->_idleOverride;
}

- (void)set_idleOverride:(BOOL)a3
{
  self->_idleOverride = a3;
}

- (NSHashTable)_earlyListeners
{
  return self->_earlyListeners;
}

- (void)set_earlyListeners:(id)a3
{
}

- (int)userIdleToken
{
  return self->_userIdleToken;
}

- (void)setUserIdleToken:(int)a3
{
  self->_userIdleToken = a3;
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarchar Lock = a3;
}

- (int64_t)resignActiveCount
{
  return self->_resignActiveCount;
}

- (void)setResignActiveCount:(int64_t)a3
{
  self->_int64_t resignActiveCount = a3;
}

- (BOOL)listeningForSetupAssistantNotifications
{
  return self->_listeningForSetupAssistantNotifications;
}

- (void)setListeningForSetupAssistantNotifications:(BOOL)a3
{
  self->_listeningForSetupAssistantNotifications = a3;
}

- (CUTDeferredTaskQueue)_postScreenLockedTask
{
  return self->__postScreenLockedTask;
}

- (CUTDeferredTaskQueue)_postScreenSaverStartedTask
{
  return self->__postScreenSaverStartedTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__postScreenSaverStartedTask, 0);
  objc_storeStrong((id *)&self->__postScreenLockedTask, 0);
  objc_storeStrong((id *)&self->_earlyListeners, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_dateSystemLockLastChanged, 0);
  objc_storeStrong((id *)&self->_dateScreenLightLastChanged, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_idleStart, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end