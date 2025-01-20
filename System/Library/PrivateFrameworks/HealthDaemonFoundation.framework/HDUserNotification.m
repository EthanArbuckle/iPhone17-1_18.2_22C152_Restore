@interface HDUserNotification
- (NSDictionary)additionalDescriptors;
- (NSString)cancelButton;
- (NSString)defaultButton;
- (NSString)message;
- (NSString)otherButton;
- (NSString)title;
- (__CFUserNotification)notification;
- (id)responseHandler;
- (int64_t)alertLevel;
- (unint64_t)userNotificationOptions;
- (void)_handleResponse:(unint64_t)a3;
- (void)presentWithResponseHandler:(id)a3;
- (void)setAdditionalDescriptors:(id)a3;
- (void)setAlertLevel:(int64_t)a3;
- (void)setCancelButton:(id)a3;
- (void)setDefaultButton:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNotification:(__CFUserNotification *)a3;
- (void)setOtherButton:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserNotificationOptions:(unint64_t)a3;
@end

@implementation HDUserNotification

- (void)presentWithResponseHandler:(id)a3
{
  v5 = (void (**)(id, HDUserNotification *, uint64_t, void))a3;
  if (self->_responseHandler)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HDUserNotification.m", 34, @"Invalid parameter not satisfying: %@", @"!_responseHandler" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x21D49F640](v5);
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = v6;

  v8 = [MEMORY[0x263EFF9A0] dictionary];
  v9 = v8;
  if (self->_additionalDescriptors) {
    objc_msgSend(v8, "addEntriesFromDictionary:");
  }
  title = self->_title;
  if (title) {
    [v9 setObject:title forKeyedSubscript:*MEMORY[0x263EFFFC8]];
  }
  message = self->_message;
  if (message) {
    [v9 setObject:message forKeyedSubscript:*MEMORY[0x263EFFFD8]];
  }
  defaultButton = self->_defaultButton;
  if (defaultButton) {
    [v9 setObject:defaultButton forKeyedSubscript:*MEMORY[0x263F00000]];
  }
  cancelButton = self->_cancelButton;
  if (cancelButton) {
    [v9 setObject:cancelButton forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  }
  otherButton = self->_otherButton;
  if (otherButton) {
    [v9 setObject:otherButton forKeyedSubscript:*MEMORY[0x263F00020]];
  }
  int64_t v15 = [(HDUserNotification *)self alertLevel];
  if ((unint64_t)(v15 - 1) >= 3) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 3 - v15;
  }
  SInt32 error = 0;
  v17 = CFUserNotificationCreate(0, 0.0, [(HDUserNotification *)self userNotificationOptions] | v16, &error, (CFDictionaryRef)v9);
  self->_notification = v17;
  if (!v17) {
    v5[2](v5, self, 1, 0);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_pendingNotificationsLock);
  v18 = (void *)_pendingNotifications;
  if (!_pendingNotifications)
  {
    id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v20 = (void *)_pendingNotifications;
    _pendingNotifications = (uint64_t)v19;

    v18 = (void *)_pendingNotifications;
  }
  [v18 addObject:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&_pendingNotificationsLock);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, self->_notification, (CFUserNotificationCallBack)_HDCFNotificationCallback, 0);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  CFRelease(RunLoopSource);
}

- (void)_handleResponse:(unint64_t)a3
{
  (*((void (**)(void))self->_responseHandler + 2))();
  id responseHandler = self->_responseHandler;
  self->_id responseHandler = 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButton
{
  return self->_defaultButton;
}

- (void)setDefaultButton:(id)a3
{
}

- (NSString)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSString)otherButton
{
  return self->_otherButton;
}

- (void)setOtherButton:(id)a3
{
}

- (NSDictionary)additionalDescriptors
{
  return self->_additionalDescriptors;
}

- (void)setAdditionalDescriptors:(id)a3
{
}

- (int64_t)alertLevel
{
  return self->_alertLevel;
}

- (void)setAlertLevel:(int64_t)a3
{
  self->_alertLevel = a3;
}

- (unint64_t)userNotificationOptions
{
  return self->_userNotificationOptions;
}

- (void)setUserNotificationOptions:(unint64_t)a3
{
  self->_userNotificationOptions = a3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_additionalDescriptors, 0);
  objc_storeStrong((id *)&self->_otherButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_defaultButton, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end