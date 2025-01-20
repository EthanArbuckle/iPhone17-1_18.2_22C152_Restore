@interface CNMobileKeyBag
+ (BOOL)isDevicePasscodeProtected;
+ (BOOL)isDeviceUnlockedSinceBoot;
+ (const)firstUnlockNotificationID;
@end

@implementation CNMobileKeyBag

+ (BOOL)isDevicePasscodeProtected
{
  v2 = (const void *)softLinkMGCopyAnswer(@"yNesiJuidlesNpI/K5Ri4A", 0);
  v3 = v2;
  v4 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v2) {
    CFRelease(v2);
  }
  return v3 == v4;
}

+ (BOOL)isDeviceUnlockedSinceBoot
{
  return softLinkMKBDeviceUnlockedSinceBoot() != 0;
}

+ (const)firstUnlockNotificationID
{
  return "com.apple.mobile.keybagd.first_unlock";
}

@end