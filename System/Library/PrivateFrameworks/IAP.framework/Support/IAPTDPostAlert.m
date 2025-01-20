@interface IAPTDPostAlert
+ (id)GetLocalizedString:(id)a3;
+ (void)PostAccessoryNotification:(__CFString *)a3 forMsg:(__CFString *)a4 withArg:(__CFString *)a5 forDefaultButton:(__CFString *)a6 withAlternateButton:(__CFString *)a7 forNotification:(__CFUserNotification *)a8 withCallback:(void *)a9 andTimeout:(double)a10;
+ (void)TearDownAccessoryNotification:(__CFUserNotification *)a3;
@end

@implementation IAPTDPostAlert

+ (void)PostAccessoryNotification:(__CFString *)a3 forMsg:(__CFString *)a4 withArg:(__CFString *)a5 forDefaultButton:(__CFString *)a6 withAlternateButton:(__CFString *)a7 forNotification:(__CFUserNotification *)a8 withCallback:(void *)a9 andTimeout:(double)a10
{
  SInt32 error = 0;
  CFStringRef v17 = +[IAPTDPostAlert GetLocalizedString:a3];
  CFStringRef v18 = +[IAPTDPostAlert GetLocalizedString:a4];
  CFStringRef v19 = +[IAPTDPostAlert GetLocalizedString:a6];
  CFStringRef v20 = +[IAPTDPostAlert GetLocalizedString:a7];
  if (v17) {
    CFStringRef v21 = v17;
  }
  else {
    CFStringRef v21 = &stru_10002E240;
  }
  if (v19) {
    CFStringRef v22 = v19;
  }
  else {
    CFStringRef v22 = &stru_10002E240;
  }
  if (!v18) {
    CFStringRef v18 = &stru_10002E240;
  }
  if (a7)
  {
    if (v20) {
      CFStringRef v23 = v20;
    }
    else {
      CFStringRef v23 = &stru_10002E240;
    }
    CFDictionaryRef v24 = (const __CFDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v21, kCFUserNotificationAlertHeaderKey, v18, kCFUserNotificationAlertMessageKey, v22, kCFUserNotificationDefaultButtonTitleKey, v23, kCFUserNotificationAlternateButtonTitleKey, kCFBooleanTrue, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue, @"DismissOnLock", 0);
  }
  else
  {
    CFDictionaryRef v24 = (const __CFDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v21, kCFUserNotificationAlertHeaderKey, v18, kCFUserNotificationAlertMessageKey, v22, kCFUserNotificationDefaultButtonTitleKey, kCFBooleanTrue, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue, @"DismissOnLock", 0, v30, v31);
  }
  CFDictionaryRef v25 = v24;
  +[IAPTDPostAlert TearDownAccessoryNotification:a8];
  if (a8)
  {
    v26 = CFUserNotificationCreate(kCFAllocatorDefault, a10, 3uLL, &error, v25);
    *a8 = v26;
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v26, (CFUserNotificationCallBack)a9, 0);
    if (RunLoopSource)
    {
      v28 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v28, kCFRunLoopCommonModes);
      CFRelease(v28);
    }
    else if (*a8)
    {
      CFRelease(*a8);
      *a8 = 0;
    }
  }
}

+ (void)TearDownAccessoryNotification:(__CFUserNotification *)a3
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

+ (id)GetLocalizedString:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = +[NSBundle bundleWithIdentifier:kIAPFrameworkBundleID];
  if (!v4) {
    return 0;
  }
  return [(NSBundle *)v4 localizedStringForKey:a3 value:&stru_10002E240 table:@"Framework"];
}

@end