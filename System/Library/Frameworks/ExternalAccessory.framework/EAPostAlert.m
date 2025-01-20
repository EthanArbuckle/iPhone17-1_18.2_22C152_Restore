@interface EAPostAlert
+ (id)CopyLocalizedString:(id)a3;
+ (void)EANotificationPostAccessoryNotification:(__CFString *)a3 forMsg:(__CFString *)a4 forDefaultButton:(__CFString *)a5 withAlternateButton:(__CFString *)a6 forNotification:(__CFUserNotification *)a7 withCallback:(void *)a8 andTimeout:(double)a9;
+ (void)EATearDownAccessoryNotification:(__CFUserNotification *)a3;
@end

@implementation EAPostAlert

+ (void)EANotificationPostAccessoryNotification:(__CFString *)a3 forMsg:(__CFString *)a4 forDefaultButton:(__CFString *)a5 withAlternateButton:(__CFString *)a6 forNotification:(__CFUserNotification *)a7 withCallback:(void *)a8 andTimeout:(double)a9
{
  v17 = (void *)MEMORY[0x1C186A640](a1, a2);
  SInt32 error = 0;
  if (a3)
  {
    v18 = (__CFString *)[a1 CopyLocalizedString:a3];
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = &stru_1F1595068;
    if (a4)
    {
LABEL_3:
      v19 = (__CFString *)[a1 CopyLocalizedString:a4];
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      v20 = &stru_1F1595068;
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  v19 = &stru_1F1595068;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  v20 = (__CFString *)[a1 CopyLocalizedString:a5];
  if (a6)
  {
LABEL_5:
    v21 = (void *)[a1 CopyLocalizedString:a6];
    id v22 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    CFDictionaryRef v23 = (const __CFDictionary *)objc_msgSend(v22, "initWithObjectsAndKeys:", v18, *MEMORY[0x1E4F1D990], v19, *MEMORY[0x1E4F1D9A8], v20, *MEMORY[0x1E4F1D9E0], v21, *MEMORY[0x1E4F1D9D0], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F1D9B8], *MEMORY[0x1E4F1CFD0], @"DismissOnLock", 0);

    goto LABEL_10;
  }
LABEL_9:
  id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  CFDictionaryRef v23 = (const __CFDictionary *)objc_msgSend(v24, "initWithObjectsAndKeys:", v18, *MEMORY[0x1E4F1D990], v19, *MEMORY[0x1E4F1D9A8], v20, *MEMORY[0x1E4F1D9E0], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F1D9B8], *MEMORY[0x1E4F1CFD0], @"DismissOnLock", 0);
LABEL_10:

  +[EAPostAlert EATearDownAccessoryNotification:a7];
  if (a7)
  {
    CFAllocatorRef v25 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v26 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a9, 3uLL, &error, v23);
    *a7 = v26;
    if (v26)
    {
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v25, v26, (CFUserNotificationCallBack)a8, 0);
      if (RunLoopSource)
      {
        v28 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v28, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        CFRelease(v28);
      }
      else
      {
        CFRelease(*a7);
        *a7 = 0;
      }
    }
    else
    {
      NSLog(&cfstr_Externalaccess.isa, "+[EAPostAlert EANotificationPostAccessoryNotification:forMsg:forDefaultButton:withAlternateButton:forNotification:withCallback:andTimeout:]", 95, v23);
    }
  }
}

+ (void)EATearDownAccessoryNotification:(__CFUserNotification *)a3
{
  if (a3)
  {
    if (*a3)
    {
      CFUserNotificationCancel(*a3);
      CFRelease(*a3);
      *a3 = 0;
    }
  }
}

+ (id)CopyLocalizedString:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ExternalAccessory"];
  if (!v4) {
    return &stru_1F1595068;
  }
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1C186A640]();
  uint64_t v7 = [v5 localizations];
  if (a3)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      CFPropertyListRef v9 = CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      CFTypeRef v10 = (id)CFMakeCollectable(v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v8 forPreferences:v10];
        if ([v11 count])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            while (2)
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = (id)[v5 localizedStringForKey:a3 value:0 table:@"Localization" localization:*(void *)(*((void *)&v19 + 1) + 8 * v15)];
                if (v16)
                {
                  id v17 = v16;
                  return v17;
                }
                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
      }
    }
  }
  id v17 = (id)[v5 localizedStringForKey:a3 value:&stru_1F1595068 table:@"Localization"];
  if (!v17) {
    return &stru_1F1595068;
  }
  return v17;
}

@end