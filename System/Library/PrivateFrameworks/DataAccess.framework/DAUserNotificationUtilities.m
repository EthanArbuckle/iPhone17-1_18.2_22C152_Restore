@interface DAUserNotificationUtilities
+ (void)showUserNotification:(__CFUserNotification *)a3 groupIdentifier:(id)a4 callbackQueue:(id)a5 sourceRunLoop:(id)a6 completionBlock:(id)a7;
@end

@implementation DAUserNotificationUtilities

+ (void)showUserNotification:(__CFUserNotification *)a3 groupIdentifier:(id)a4 callbackQueue:(id)a5 sourceRunLoop:(id)a6 completionBlock:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void (**)(void, void, void))v16;
  if (a3)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_17:
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"DAUserNotificationUtilities.m", 74, @"Invalid parameter not satisfying: %@", @"completionBlock != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, a1, @"DAUserNotificationUtilities.m", 73, @"Invalid parameter not satisfying: %@", @"notification != nil" object file lineNumber description];

  if (!v17) {
    goto LABEL_17;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_18:
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, a1, @"DAUserNotificationUtilities.m", 75, @"Invalid parameter not satisfying: %@", @"runLoop != nil" object file lineNumber description];

LABEL_4:
  v18 = _InfoForNotification((uint64_t)a3);

  if (v18)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"DAUserNotificationUtilities.m", 76, @"Already waiting on this notification %p", a3);
  }
  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, (CFUserNotificationCallBack)_ReceiveNotificationResponseCallback, 0);
  if (RunLoopSource)
  {
    v20 = RunLoopSource;
    v21 = (__CFRunLoop *)[v15 getCFRunLoop];
    CFStringRef v22 = CFRunLoopCopyCurrentMode(v21);
    if (!v22) {
      CFStringRef v22 = (const __CFString *)CFRetain((CFTypeRef)*MEMORY[0x1E4F1D410]);
    }
    v23 = objc_opt_new();
    [v23 setGroupIdentifier:v13];
    [v23 setHandler:v17];
    [v23 setCallbackQueue:v14];
    id v24 = v23;
    v25 = _NotificationHandlerMap();
    [v25 setObject:v24 forKey:a3];

    if (v13)
    {
      v26 = +[DAPowerAssertionManager sharedPowerAssertionManager];
      [v26 dropPowerAssertionsForGroupIdentifier:v13];
    }
    CFRunLoopAddSource(v21, v20, v22);
    CFRelease(v22);
    CFRelease(v20);
  }
  else
  {
    v27 = DALoggingwithCategory();
    os_log_type_t v28 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
    if (os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 138412290;
      v34 = a3;
      _os_log_impl(&dword_1BA384000, v27, v28, "Couldn't schedule response for notification %@", buf, 0xCu);
    }

    CFUserNotificationCancel(a3);
    ((void (**)(void, __CFUserNotification *, uint64_t))v17)[2](v17, a3, 3);
  }
}

@end