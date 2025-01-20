@interface IMLockdownManager
+ (id)sharedInstance;
- (BOOL)_hasShownMismatchedSIM;
- (BOOL)_hasShownWaitingAlertThisSession;
- (BOOL)_isCarrierInstall;
- (BOOL)_isInternalInstall;
- (BOOL)_isNonUIInstall;
- (BOOL)_isVendorInstall;
- (BOOL)_settingUpActivationState;
- (BOOL)isActivated;
- (BOOL)isCarrierInstall;
- (BOOL)isExpired;
- (BOOL)isInternalInstall;
- (BOOL)isNonUIInstall;
- (BOOL)isVendorInstall;
- (IMLockdownManager)init;
- (NSString)uniqueDeviceIdentifier;
- (id)description;
- (int64_t)lockdownState;
- (unint64_t)_state;
- (void)_calculateInstallType;
- (void)_checkLockdown;
- (void)_checkMobileActivation;
- (void)_resetActivationState;
- (void)_setState:(unint64_t)a3;
- (void)_setupActivationState;
- (void)dealloc;
- (void)set_hasShownMismatchedSIM:(BOOL)a3;
- (void)set_hasShownWaitingAlertThisSession:(BOOL)a3;
- (void)set_isCarrierInstall:(BOOL)a3;
- (void)set_isInternalInstall:(BOOL)a3;
- (void)set_isNonUIInstall:(BOOL)a3;
- (void)set_isVendorInstall:(BOOL)a3;
- (void)set_settingUpActivationState:(BOOL)a3;
@end

@implementation IMLockdownManager

- (BOOL)isNonUIInstall
{
  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isNonUIInstall;
}

- (BOOL)isInternalInstall
{
  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isInternalInstall;
}

- (void)_calculateInstallType
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19189553C;
  block[3] = &unk_1E5723270;
  block[4] = self;
  if (qword_1EB273CC8 != -1) {
    dispatch_once(&qword_1EB273CC8, block);
  }
}

- (IMLockdownManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMLockdownManager;
  uint64_t v2 = [(IMLockdownManager *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1918C9D58, (CFStringRef)*MEMORY[0x1E4FBA6E0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1EB273CF8 != -1) {
    dispatch_once(&qword_1EB273CF8, &unk_1EE22FC98);
  }
  uint64_t v2 = (void *)qword_1EB273C58;
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)IMLockdownManager;
  [(IMLockdownManager *)&v4 dealloc];
}

- (void)_resetActivationState
{
  self->_state = 0;
  self->_hasShownMismatchedSIM = 0;
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, @"__kIMLockdownDeviceActivatedChangedNotification", 0);
}

- (unint64_t)_state
{
  return self->_state;
}

- (void)_setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)_checkMobileActivation
{
  if (qword_1E92DAF88 != -1) {
    dispatch_once(&qword_1E92DAF88, &unk_1EE231098);
  }
  if (off_1E92DAF80)
  {
    id v19 = 0;
    off_1E92DAF80(&v19);
    v9 = (const void *)objc_claimAutoreleasedReturnValue();
    id v10 = v19;
    v14 = objc_msgSend_registration(IMRGLog, v11, v12, v13);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v15) {
        sub_1918E1AEC((uint64_t)v10, v14);
      }
    }
    else if (v15)
    {
      sub_1918E1A74((uint64_t)v9, v14);
    }

    if (v9)
    {
      CFTypeID v16 = CFGetTypeID(v9);
      if (v16 == CFStringGetTypeID())
      {
        if (CFEqual(v9, @"Unactivated"))
        {
          unint64_t v17 = 1;
        }
        else if (CFEqual(v9, @"Expired"))
        {
          unint64_t v17 = 2;
        }
        else if (CFEqual(v9, @"Activated") {
               || CFEqual(v9, @"WildcardActivated")
        }
               || CFEqual(v9, @"Unlocked")
               || CFEqual(v9, @"SoftActivation"))
        {
          unint64_t v17 = 3;
        }
        else if (CFEqual(v9, @"MismatchedIMEI"))
        {
          unint64_t v17 = 4;
        }
        else if (CFEqual(v9, @"MismatchedICCID"))
        {
          unint64_t v17 = 5;
        }
        else if (CFEqual(v9, @"MissingSIM"))
        {
          unint64_t v17 = 6;
        }
        else
        {
          unint64_t v17 = 7;
        }
        self->_state = v17;
      }
      CFRelease(v9);
    }
  }
  else
  {
    _IMWarn(@"Failed to weak link to MAEGetActivationStateWithError.", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v18);
    self->_state = 7;
    self->_settingUpActivationState = 0;
  }
}

- (void)_checkLockdown
{
  uint64_t v3 = (const void *)lockdown_copy_activationState();
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      if (CFEqual(v4, @"Unactivated"))
      {
        unint64_t v6 = 1;
      }
      else if (CFEqual(v4, @"Expired"))
      {
        unint64_t v6 = 2;
      }
      else if (CFEqual(v4, @"Activated") {
             || CFEqual(v4, @"WildcardActivated")
      }
             || CFEqual(v4, @"Unlocked")
             || CFEqual(v4, @"SoftActivation"))
      {
        unint64_t v6 = 3;
      }
      else if (CFEqual(v4, @"MismatchedIMEI"))
      {
        unint64_t v6 = 4;
      }
      else if (CFEqual(v4, @"MismatchedICCID"))
      {
        unint64_t v6 = 5;
      }
      else if (CFEqual(v4, @"MissingSIM"))
      {
        unint64_t v6 = 6;
      }
      else
      {
        unint64_t v6 = 7;
      }
      self->_state = v6;
    }
    CFRelease(v4);
  }
}

- (void)_setupActivationState
{
  if (!self->_settingUpActivationState)
  {
    self->_settingUpActivationState = 1;
    objc_msgSend__checkMobileActivation(self, a2, v2, v3);
    self->_settingUpActivationState = 0;
  }
}

- (BOOL)isVendorInstall
{
  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isVendorInstall;
}

- (int64_t)lockdownState
{
  int64_t result = self->_state;
  if (!result)
  {
    objc_msgSend__setupActivationState(self, a2, v2, v3);
    return self->_state;
  }
  return result;
}

- (BOOL)isCarrierInstall
{
  objc_msgSend__calculateInstallType(self, a2, v2, v3);
  return self->_isCarrierInstall;
}

- (BOOL)isActivated
{
  return (unint64_t)objc_msgSend_lockdownState(self, a2, v2, v3) > 2;
}

- (BOOL)isExpired
{
  return objc_msgSend_lockdownState(self, a2, v2, v3) == 2;
}

- (NSString)uniqueDeviceIdentifier
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"[IMLockdown state: %lu]", v2, self->_state);
}

- (BOOL)_settingUpActivationState
{
  return self->_settingUpActivationState;
}

- (void)set_settingUpActivationState:(BOOL)a3
{
  self->_settingUpActivationState = a3;
}

- (BOOL)_isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)set_isInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BOOL)_isCarrierInstall
{
  return self->_isCarrierInstall;
}

- (void)set_isCarrierInstall:(BOOL)a3
{
  self->_isCarrierInstall = a3;
}

- (BOOL)_isNonUIInstall
{
  return self->_isNonUIInstall;
}

- (void)set_isNonUIInstall:(BOOL)a3
{
  self->_isNonUIInstall = a3;
}

- (BOOL)_isVendorInstall
{
  return self->_isVendorInstall;
}

- (void)set_isVendorInstall:(BOOL)a3
{
  self->_isVendorInstall = a3;
}

- (BOOL)_hasShownMismatchedSIM
{
  return self->_hasShownMismatchedSIM;
}

- (void)set_hasShownMismatchedSIM:(BOOL)a3
{
  self->_hasShownMismatchedSIM = a3;
}

- (BOOL)_hasShownWaitingAlertThisSession
{
  return self->_hasShownWaitingAlertThisSession;
}

- (void)set_hasShownWaitingAlertThisSession:(BOOL)a3
{
  self->_hasShownWaitingAlertThisSession = a3;
}

@end