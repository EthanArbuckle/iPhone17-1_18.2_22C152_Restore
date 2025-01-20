@interface UNNotificationServiceExtension
- (UNNotificationServiceExtension)init;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void *)contentHandler;
- (void)init;
- (void)serviceExtensionTimeWillExpire;
@end

@implementation UNNotificationServiceExtension

- (UNNotificationServiceExtension)init
{
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationServiceExtension;
  v2 = [(UNNotificationServiceExtension *)&v13 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v4, sel_beginRequestWithExtensionContext_);
    Method v6 = class_getInstanceMethod(v3, sel_beginRequestWithExtensionContext_);
    v7 = UNLogServiceExtension;
    if (InstanceMethod == v6)
    {
      if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE729000, v7, OS_LOG_TYPE_DEFAULT, "Service extension was initialized", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_ERROR)) {
        -[UNNotificationServiceExtension init]();
      }
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3A8];
      v10 = NSStringFromClass(v3);
      [v8 raise:v9, @"You have overridden beginRequestWithExtensionContext: on your subclass of UNNotificationServiceExtension (%@) - this is not allowed", v10 format];
    }
  }
  return v2;
}

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void *)contentHandler
{
  v5 = request;
  Method v6 = contentHandler;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_ERROR)) {
    -[UNNotificationServiceExtension didReceiveNotificationRequest:withContentHandler:]();
  }
  v7 = [(UNNotificationRequest *)v5 content];
  v6[2](v6, v7);
}

- (void)serviceExtensionTimeWillExpire
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE729000, v0, v1, "Service extension base class recieved serviceExtensionTimeWillExpire", v2, v3, v4, v5, v6);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = UNSafeCast(v6, v5);
  v8 = v7;
  if (v7)
  {
    [v7 setExtensionInstance:self];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UNNotificationServiceExtension.m", 71, @"remoteContext is not an instance of _UNNotificationServiceExtensionRemoteContext: remoteContext='%@'", 0 object file lineNumber description];

    if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_ERROR)) {
      -[UNNotificationServiceExtension beginRequestWithExtensionContext:]();
    }
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "un_errorWithUNPrivateErrorCode:userInfo:", 1902, 0);
    [v5 cancelRequestWithError:v10];
  }
}

- (void)init
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE729000, v0, v1, "Service extension was initialized but the developer is attempting to hijack beginRequestWithExtensionContext:", v2, v3, v4, v5, v6);
}

- (void)didReceiveNotificationRequest:withContentHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE729000, v0, v1, "Service extension base class recieved didReceiveNotificationRequest:", v2, v3, v4, v5, v6);
}

- (void)beginRequestWithExtensionContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE729000, v0, v1, "Remote context is not an instance of _UNNotificationServiceExtensionRemoteContext", v2, v3, v4, v5, v6);
}

@end