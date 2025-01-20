@interface AAUserNotification
+ (id)_defaultParameters;
+ (void)_waitForResponseAndReleaseNotification:(__CFUserNotification *)a3 completion:(id)a4;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 secureTextFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 textFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8;
+ (void)waitForResponseToNotification:(__CFUserNotification *)a3 completion:(id)a4;
@end

@implementation AAUserNotification

+ (id)_defaultParameters
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FA7328];
  v5[0] = *MEMORY[0x1E4F1D9B8];
  v5[1] = v2;
  v6[0] = MEMORY[0x1E4F1CC38];
  v6[1] = MEMORY[0x1E4F1CC28];
  v5[2] = *MEMORY[0x1E4FA7340];
  v6[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = +[AAUserNotification _defaultParameters];
  v17 = (void *)[v16 mutableCopy];

  if (v18) {
    [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  }
  if (v12) {
    [v17 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  if (v14) {
    [v17 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  }
  objc_msgSend(a1, "_waitForResponseAndReleaseNotification:completion:", CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 3uLL, 0, (CFDictionaryRef)v17), v15);
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 textFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = +[AAUserNotification _defaultParameters];
  v20 = (void *)[v19 mutableCopy];

  if (v21) {
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  }
  if (v14) {
    [v20 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  }
  if (v15) {
    [v20 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1DA20]];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  if (v17) {
    [v20 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  }
  objc_msgSend(a1, "_waitForResponseAndReleaseNotification:completion:", CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 3uLL, 0, (CFDictionaryRef)v20), v18);
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 secureTextFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = +[AAUserNotification _defaultParameters];
  v20 = (void *)[v19 mutableCopy];

  if (v21) {
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  }
  if (v14) {
    [v20 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  }
  if (v15) {
    [v20 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1DA20]];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  if (v17) {
    [v20 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  }
  objc_msgSend(a1, "_waitForResponseAndReleaseNotification:completion:", CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0x10000uLL, 0, (CFDictionaryRef)v20), v18);
}

+ (void)_waitForResponseAndReleaseNotification:(__CFUserNotification *)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__AAUserNotification__waitForResponseAndReleaseNotification_completion___block_invoke;
    v8[3] = &unk_1E5A49AA8;
    v10 = a3;
    id v9 = v6;
    [a1 waitForResponseToNotification:a3 completion:v8];
  }
  else if (a3)
  {
    CFRelease(a3);
  }
}

uint64_t __72__AAUserNotification__waitForResponseAndReleaseNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

+ (void)waitForResponseToNotification:(__CFUserNotification *)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    if (a3)
    {
      CFRetain(a3);
      v7 = _AANotificationQueue();
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__AAUserNotification_waitForResponseToNotification_completion___block_invoke;
      v8[3] = &unk_1E5A49AD0;
      v10 = a3;
      id v9 = v6;
      dispatch_async(v7, v8);
    }
    else
    {
      (*((void (**)(id, void, uint64_t))v5 + 2))(v5, 0, 3);
    }
  }
}

void __63__AAUserNotification_waitForResponseToNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 40)];
  v3 = (void *)[*(id *)(a1 + 32) copy];
  v4 = (void *)MEMORY[0x1A622F430]();
  id v5 = _AANotificationHandlerMap();
  [v5 setObject:v4 forKeyedSubscript:v2];

  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v2;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for notification for key: %@", (uint8_t *)&v11, 0xCu);
  }

  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)_AACFNotificationCallback, 0);
  if (RunLoopSource)
  {
    v8 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v8, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(v8);
  }
  else
  {
    v10 = _AANotificationHandlerMap();
    [v10 removeObjectForKey:v2];

    CFRelease(*(CFTypeRef *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end