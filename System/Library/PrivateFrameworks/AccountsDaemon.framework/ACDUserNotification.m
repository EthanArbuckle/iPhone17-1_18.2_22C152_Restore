@interface ACDUserNotification
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 level:(unint64_t)a7 withCompletionBlock:(id)a8;
+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7;
@end

@implementation ACDUserNotification

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 level:(unint64_t)a7 withCompletionBlock:(id)a8
{
  v30 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v29 = *MEMORY[0x263EFFFC8];
  uint64_t v28 = *MEMORY[0x263EFFFD8];
  uint64_t v27 = *MEMORY[0x263EFFFE8];
  uint64_t v26 = *MEMORY[0x263F00000];
  v12 = NSNumber;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [v12 numberWithBool:1];
  uint64_t v19 = *MEMORY[0x263EFFFE0];
  v20 = [NSNumber numberWithBool:1];
  uint64_t v21 = *MEMORY[0x263F79610];
  v22 = [NSNumber numberWithBool:1];
  objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v17, v29, v16, v28, v15, v27, v14, v26, v18, v19, v20, v21, v22, *MEMORY[0x263F79628], 0);
  CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v24 = (void (**)(void, void, void))[v13 copy];
  v25 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, a7, 0, v23);
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(v25, 0.0, responseFlags);
  ((void (**)(void, __CFUserNotification *, CFOptionFlags))v24)[2](v24, v25, responseFlags[0]);
  if (v25) {
    CFRelease(v25);
  }
}

@end