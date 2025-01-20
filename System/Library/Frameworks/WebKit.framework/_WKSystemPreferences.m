@interface _WKSystemPreferences
+ (BOOL)isCaptivePortalModeEnabled;
+ (BOOL)isCaptivePortalModeIgnored:(id)a3;
+ (void)setCaptivePortalModeEnabled:(BOOL)a3;
+ (void)setCaptivePortalModeIgnored:(id)a3 ignore:(BOOL)a4;
@end

@implementation _WKSystemPreferences

+ (BOOL)isCaptivePortalModeEnabled
{
  CFStringRef v2 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "WKLockdownModeEnabled", 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  v3 = (PAL *)CFPreferencesCopyValue(v2, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  v4 = v3;
  if (v3 != (PAL *)*MEMORY[0x1E4F1CFD0])
  {
    char isLockdownModeEnabled = PAL::isLockdownModeEnabled(v3);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char isLockdownModeEnabled = 1;
  if (v3) {
LABEL_3:
  }
    CFRelease(v4);
LABEL_4:
  if (v2) {
    CFRelease(v2);
  }
  return isLockdownModeEnabled;
}

+ (void)setCaptivePortalModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v4 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], "WKLockdownModeEnabled", 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  CFStringRef v5 = v4;
  v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    v6 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(v4, *v6, (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(v7, v8, v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"WKCaptivePortalModeContainerConfigurationChanged", 0, 0, 1u);
  if (v5)
  {
    CFRelease(v5);
  }
}

+ (BOOL)isCaptivePortalModeIgnored:(id)a3
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  v5[1] = @"System/Preferences/";
  v5[2] = @"com.apple.WebKit.cpmconfig_ignore";
  uint64_t v3 = objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 3));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3);
}

+ (void)setCaptivePortalModeIgnored:(id)a3 ignore:(BOOL)a4
{
  int v4 = a4;
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = a3;
  v13[1] = @"System/Preferences/";
  uint64_t v5 = objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 2));
  v12[0] = v5;
  v12[1] = @"com.apple.WebKit.cpmconfig_ignore";
  uint64_t v6 = objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 2));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v6) != v4)
  {
    char v11 = 0;
    int v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v5, &v11);
    if (v11)
    {
      BOOL v8 = 1;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v5, 0);
      BOOL v8 = v11 != 0;
    }
    if ((v7 & v8 & 1) == 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);
    }
    CFStringRef v9 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (v4) {
      [v9 createFileAtPath:v6 contents:0 attributes:0];
    }
    else {
      [v9 removeItemAtPath:v6 error:0];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"WKCaptivePortalModeContainerConfigurationChanged", 0, 0, 1u);
  }
}

@end