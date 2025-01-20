@interface CADAppEntityNotifierModule
- (CADAppEntityNotifierModule)initWithAppEntityNotifier:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)receivedNotificationNamed:(id)a3;
@end

@implementation CADAppEntityNotifierModule

- (void)receivedNotificationNamed:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isActive)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F578B0]])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because of SignificantTimeChangeNotification";
LABEL_26:
        _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if ([v5 isEqualToString:@"com.apple.mobilecal.timezonechanged"])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because the timeZone or timeZoneOverride changed";
        goto LABEL_26;
      }
LABEL_27:
      [(CalAppEntityNotifier *)self->_notifier notifyObservers];
      goto LABEL_28;
    }
    if ([v5 isEqualToString:@"com.apple.mobilecal.preference.notification.overlayCalendarID"])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because the alternate calendar (overlay calendar) changed";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v5 isEqualToString:@"com.apple.mobilecal.preference.notification.weekStart"])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because of change in weekStart preference";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v5 isEqualToString:@"com.apple.eventkit.preference.notification.UnselectedCalendarIdentifiersForFocusMode"])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because focus configuration changed";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v5 isEqualToString:@"com.apple.accessibility.prefers.horizontal.text"])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because AXSPrefersHorizontalTextLayout changed";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F4B7A0]])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because AppProtection hidden apps changed";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4F4B7B0]])
    {
      v6 = CADAppEntityHandle;
      if (os_log_type_enabled((os_log_t)CADAppEntityHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        v7 = "Notifying app entity observers because AppProtection locked apps changed";
        goto LABEL_26;
      }
      goto LABEL_27;
    }
  }
LABEL_28:
}

- (CADAppEntityNotifierModule)initWithAppEntityNotifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADAppEntityNotifierModule;
  v6 = [(CADAppEntityNotifierModule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notifier, a3);
  }

  return v7;
}

- (void)activate
{
  self->_isActive = 1;
}

- (void)deactivate
{
  self->_isActive = 0;
}

- (void).cxx_destruct
{
}

@end