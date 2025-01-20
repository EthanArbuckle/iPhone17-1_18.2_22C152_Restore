@interface ESUserNotificationUtilities
+ (void)showUserNotification:(__CFUserNotification *)a3 groupIdentifier:(id)a4 withCompletionBlock:(id)a5;
@end

@implementation ESUserNotificationUtilities

+ (void)showUserNotification:(__CFUserNotification *)a3 groupIdentifier:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(void, void, void))v10;
  if (a3)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"ESUserNotificationUtilities.m" lineNumber:65 description:@"Must have a notification"];

    if (v11) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x263F08690] currentHandler];
  [v24 handleFailureInMethod:a2 object:a1 file:@"ESUserNotificationUtilities.m" lineNumber:66 description:@"Must have a block here"];

LABEL_3:
  v12 = _InfoForNotification((uint64_t)a3);

  if (v12)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ESUserNotificationUtilities.m", 67, @"Already waiting on this notification %p", a3);
  }
  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, (CFUserNotificationCallBack)_ReceiveNotificationResponseCallback, 0);
  if (RunLoopSource)
  {
    v14 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFStringRef v16 = CFRunLoopCopyCurrentMode(Current);
    if (!v16) {
      CFStringRef v16 = (const __CFString *)CFRetain((CFTypeRef)*MEMORY[0x263EFFE78]);
    }
    v17 = objc_opt_new();
    [v17 setGroupIdentifier:v9];
    [v17 setHandler:v11];
    id v18 = v17;
    v19 = _NotificationHandlerMap();
    [v19 setObject:v18 forKey:a3];

    if (v9)
    {
      v20 = [MEMORY[0x263F38DB0] sharedPowerAssertionManager];
      [v20 dropPowerAssertionsForGroupIdentifier:v9];
    }
    CFRunLoopAddSource(Current, v14, v16);
    CFRelease(v16);
    CFRelease(v14);
  }
  else
  {
    v21 = DALoggingwithCategory();
    os_log_type_t v22 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412290;
      v27 = a3;
      _os_log_impl(&dword_239784000, v21, v22, "Couldn't schedule response for notification %@", buf, 0xCu);
    }

    CFUserNotificationCancel(a3);
    ((void (**)(void, __CFUserNotification *, uint64_t))v11)[2](v11, a3, 3);
  }
}

@end