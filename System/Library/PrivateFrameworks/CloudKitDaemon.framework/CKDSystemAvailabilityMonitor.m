@interface CKDSystemAvailabilityMonitor
+ (id)sharedMonitor;
+ (void)initialize;
- (BOOL)registerWatcher:(id)a3;
- (id)availabilityDescription;
- (id)initInternal;
- (unint64_t)availabilityState;
- (unint64_t)currentAvailabilityState;
- (unint64_t)simulatedAvailabilityState;
- (void)_clearVanishedWatchers;
- (void)_logAvailabilityDescription;
- (void)_systemMayNowBeReady;
- (void)assertAvailability:(unint64_t)a3;
- (void)dealloc;
- (void)removeNotifications;
- (void)resetToUnavailableForUnitTests;
- (void)setAvailabilityState:(unint64_t)a3;
- (void)setSimulatedAvailabilityState:(unint64_t)a3;
- (void)simulateBuddyCompletedForUnitTests;
- (void)simulateFirstUnlockForUnitTests;
@end

@implementation CKDSystemAvailabilityMonitor

+ (void)initialize
{
  if (!qword_1EBBD0190)
  {
    v2 = [CKDSystemAvailabilityMonitor alloc];
    qword_1EBBD0190 = objc_msgSend_initInternal(v2, v3, v4);
    MEMORY[0x1F41817F8]();
  }
}

+ (id)sharedMonitor
{
  return (id)qword_1EBBD0190;
}

- (id)initInternal
{
  v15.receiver = self;
  v15.super_class = (Class)CKDSystemAvailabilityMonitor;
  v2 = [(CKDSystemAvailabilityMonitor *)&v15 init];
  v5 = v2;
  if (!v2) {
    return v5;
  }
  uint64_t availabilityState = objc_msgSend_currentAvailabilityState(v2, v3, v4);
  v5->_uint64_t availabilityState = availabilityState;
  if (availabilityState != 3)
  {
    if ((availabilityState & 2) != 0) {
      goto LABEL_4;
    }
LABEL_11:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)sub_1C4E161B8, @"com.apple.mobile.keybagd.lock_status", 0, (CFNotificationSuspensionBehavior)1025);
    uint64_t availabilityState = v5->_availabilityState;
    if (availabilityState) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  CKOncePerBoot();
  uint64_t availabilityState = v5->_availabilityState;
  if ((availabilityState & 2) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  if ((availabilityState & 1) == 0)
  {
LABEL_5:
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v5, (CFNotificationCallback)sub_1C4E161B8, (CFStringRef)*MEMORY[0x1E4F9AA18], 0, (CFNotificationSuspensionBehavior)1025);
    uint64_t availabilityState = v5->_availabilityState;
  }
LABEL_6:
  if (availabilityState != 3)
  {
    v10 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E16374;
    block[3] = &unk_1E64F05C8;
    v14 = v5;
    dispatch_async(v10, block);
  }
  objc_msgSend__logAvailabilityDescription(v5, v7, v8);
  return v5;
}

- (void)removeNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.lock_status", 0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F9AA18];
  CFNotificationCenterRemoveObserver(v4, self, v5, 0);
}

- (void)dealloc
{
  objc_msgSend_removeNotifications(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CKDSystemAvailabilityMonitor;
  [(CKDSystemAvailabilityMonitor *)&v4 dealloc];
}

- (void)assertAvailability:(unint64_t)a3
{
  if ((objc_msgSend_availabilityState(self, a2, a3) & a3) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v8, (uint64_t)a2, self, @"CKDSystemAvailabilityMonitor.m", 194, @"System does not have availability %lx", a3);
  }
}

- (unint64_t)currentAvailabilityState
{
  uint64_t v3 = objc_msgSend_simulatedAvailabilityState(self, a2, v2);
  uint64_t v4 = v3;
  if ((v3 & 4) != 0) {
    return v3 & 0xFFFFFFFFFFFFFFFBLL;
  }
  int v5 = MKBDeviceUnlockedSinceBoot();
  int v6 = BYSetupAssistantNeedsToRun();
  uint64_t v7 = (void *)MEMORY[0x1E4F1A550];
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (v5 != 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Can't start yet, device is still locked", buf, 2u);
    }
  }
  if (v6)
  {
    if (*v7 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_INFO, "Can't start yet, device is still in buddy", v13, 2u);
    }
  }
  uint64_t v11 = v4 | 2;
  if (v5 != 1) {
    uint64_t v11 = v4;
  }
  return v11 | v6 ^ 1u;
}

- (id)availabilityDescription
{
  uint64_t v4 = objc_msgSend_availabilityState(self, a2, v2);
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) >= 4)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = objc_msgSend_availabilityState(self, v5, v6);
    objc_msgSend_stringWithFormat_(v8, v10, @"no description for status value %ld", v9);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = off_1E64F3C40[v4 & 0xFFFFFFFFFFFFFFFBLL];
  }
  return v7;
}

- (void)_logAvailabilityDescription
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    uint64_t v7 = objc_msgSend_availabilityDescription(self, v5, v6);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_debug_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_DEBUG, "System is %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_clearVanishedWatchers
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v6 = objc_msgSend_count(obj->_watcherWrappersInRegistrationOrder, v2, v3);
  if (v6 - 1 >= 0)
  {
    do
    {
      uint64_t v7 = objc_msgSend_objectAtIndex_(obj->_watcherWrappersInRegistrationOrder, v4, --v6);
      uint64_t v10 = objc_msgSend_delegate(v7, v8, v9);

      if (!v10) {
        objc_msgSend_removeObjectAtIndex_(obj->_watcherWrappersInRegistrationOrder, v11, v6);
      }
    }
    while (v6 > 0);
  }
  if (!objc_msgSend_count(obj->_watcherWrappersInRegistrationOrder, v4, v5))
  {
    watcherWrappersInRegistrationOrder = obj->_watcherWrappersInRegistrationOrder;
    obj->_watcherWrappersInRegistrationOrder = 0;
  }
  objc_sync_exit(obj);
}

- (void)_systemMayNowBeReady
{
  uint64_t v4 = objc_msgSend_currentAvailabilityState(self, a2, v2);
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_availabilityState(v5, v6, v7);
  uint64_t v11 = objc_msgSend_availabilityState(v5, v9, v10);
  objc_msgSend_setAvailabilityState_(v5, v12, v11 | v4);
  if (v4 != v8)
  {
    objc_msgSend__logAvailabilityDescription(v5, v13, v14);
    uint64_t v17 = objc_msgSend_count(v5->_watcherWrappersInRegistrationOrder, v15, v16);
    if (v17)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_1C4E169C4;
      v27[3] = &unk_1E64F3C20;
      v27[4] = v5;
      v27[5] = v17;
      v27[6] = v4;
      CKMuckingWithPersonas(v27);
    }
    if (v4 == 3)
    {
      watcherWrappersInRegistrationOrder = v5->_watcherWrappersInRegistrationOrder;
      v5->_watcherWrappersInRegistrationOrder = 0;

      objc_msgSend_removeNotifications(v5, v21, v22);
    }
    else
    {
      objc_msgSend__clearVanishedWatchers(v5, v18, v19);
    }
    v25 = objc_msgSend_sharedNotifier(CKDAccountNotifier, v23, v24);
    objc_msgSend_postAccountChangedNotificationWithAccountID_changeType_(v25, v26, 0, 0);
  }
  objc_sync_exit(v5);
}

- (BOOL)registerWatcher:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v8 = objc_msgSend_availabilityState(v5, v6, v7);
    if ((unint64_t)(v8 - 1) < 2)
    {
      uint64_t v12 = objc_msgSend_availabilityState(v5, v9, v10);
      if (!objc_msgSend_systemAvailabilityChanged_(v4, v13, v12))
      {
LABEL_17:
        BOOL v11 = 0;
LABEL_18:
        objc_sync_exit(v5);

        goto LABEL_19;
      }
    }
    else if (v8)
    {
      if (v8 == 3) {
        objc_msgSend_systemAvailabilityChanged_(v4, v9, 3);
      }
      goto LABEL_17;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v14 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412290;
      id v24 = v4;
      _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Registering watcher %@", (uint8_t *)&v23, 0xCu);
    }
    if (!v5->_watcherWrappersInRegistrationOrder)
    {
      objc_super v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      watcherWrappersInRegistrationOrder = v5->_watcherWrappersInRegistrationOrder;
      v5->_watcherWrappersInRegistrationOrder = v15;
    }
    uint64_t v17 = [CKDSystemAvailabilityWatcherWrapper alloc];
    uint64_t v19 = objc_msgSend_initWithDelegate_(v17, v18, (uint64_t)v4);
    if ((objc_msgSend_containsObject_(v5->_watcherWrappersInRegistrationOrder, v20, (uint64_t)v19) & 1) == 0) {
      objc_msgSend_addObject_(v5->_watcherWrappersInRegistrationOrder, v21, (uint64_t)v19);
    }

    BOOL v11 = 1;
    goto LABEL_18;
  }
  BOOL v11 = 0;
LABEL_19:

  return v11;
}

- (void)resetToUnavailableForUnitTests
{
  objc_msgSend_setAvailabilityState_(self, a2, 0);
  objc_msgSend_setSimulatedAvailabilityState_(self, v3, 4);
}

- (void)simulateBuddyCompletedForUnitTests
{
  uint64_t v4 = objc_msgSend_simulatedAvailabilityState(self, a2, v2);
  objc_msgSend_setSimulatedAvailabilityState_(self, v5, v4 | 1);
  objc_msgSend__systemMayNowBeReady(self, v6, v7);
}

- (void)simulateFirstUnlockForUnitTests
{
  uint64_t v4 = objc_msgSend_simulatedAvailabilityState(self, a2, v2);
  objc_msgSend_setSimulatedAvailabilityState_(self, v5, v4 | 2);
  objc_msgSend__systemMayNowBeReady(self, v6, v7);
}

- (unint64_t)availabilityState
{
  return self->_availabilityState;
}

- (void)setAvailabilityState:(unint64_t)a3
{
  self->_uint64_t availabilityState = a3;
}

- (unint64_t)simulatedAvailabilityState
{
  return self->_simulatedAvailabilityState;
}

- (void)setSimulatedAvailabilityState:(unint64_t)a3
{
  self->_simulatedAvailabilityState = a3;
}

- (void).cxx_destruct
{
}

@end