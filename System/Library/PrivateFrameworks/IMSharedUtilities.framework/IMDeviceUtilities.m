@interface IMDeviceUtilities
+ (BOOL)IMDeviceIsChinaRegion;
+ (BOOL)IMDeviceIsGreenTea;
+ (BOOL)IMDeviceIsIndiaRegion;
+ (BOOL)IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender;
+ (BOOL)IMSupportsASTC;
+ (BOOL)IMSupportsUserNotifications;
+ (BOOL)completedSystemAppMigration;
+ (BOOL)deviceIsLockedDown;
+ (BOOL)isInternalCarryDevice;
+ (BOOL)isInternalInstall;
+ (BOOL)isMessagesInstalled;
+ (BOOL)isSeedInstall;
+ (BOOL)supportsBusinessChat;
+ (BOOL)supportsDataDetectors;
+ (BOOL)supportsFaceTime;
+ (BOOL)supportsFocus;
+ (BOOL)supportsNameAndPhoto;
+ (BOOL)supportsScreenEffects;
+ (BOOL)supportsSharedWithYou;
+ (BOOL)supportsSpotlight;
+ (BOOL)supportsiMessageJunk;
+ (void)setSupportsiMessageJunk:(BOOL)a3;
@end

@implementation IMDeviceUtilities

+ (BOOL)supportsSharedWithYou
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)deviceIsLockedDown
{
  v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = (void *)[v2 objectForKey:@"LDMGlobalEnabled" inDomain:*MEMORY[0x1E4F283E0]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [v3 BOOLValue];
}

+ (BOOL)IMSupportsUserNotifications
{
  return 1;
}

+ (BOOL)isInternalInstall
{
  return MEMORY[0x1F40CD658]("com.apple.Messages", a2);
}

+ (BOOL)supportsFocus
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (void)setSupportsiMessageJunk:(BOOL)a3
{
}

+ (BOOL)IMSupportsASTC
{
  return 1;
}

+ (BOOL)IMDeviceIsChinaRegion
{
  if (qword_1EB4A5DB8 != -1) {
    dispatch_once(&qword_1EB4A5DB8, &unk_1EF2BF2C0);
  }
  return byte_1E94FF020;
}

+ (BOOL)IMDeviceIsGreenTea
{
  if (qword_1EB4A61B8 != -1) {
    dispatch_once(&qword_1EB4A61B8, &unk_1EF2BE218);
  }
  return byte_1E94FF078;
}

+ (BOOL)IMDeviceIsIndiaRegion
{
  if (qword_1E94FF4D0 != -1) {
    dispatch_once(&qword_1E94FF4D0, &unk_1EF2BE338);
  }
  return byte_1E94FF4C8;
}

+ (BOOL)IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender
{
  return MEMORY[0x1F4181798](IMDeviceUtilities, sel_IMDeviceIsGreenTea);
}

+ (BOOL)supportsDataDetectors
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)supportsBusinessChat
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)supportsSpotlight
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)supportsFaceTime
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)supportsNameAndPhoto
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)supportsScreenEffects
{
  return !+[IMDeviceUtilities deviceIsLockedDown];
}

+ (BOOL)supportsiMessageJunk
{
  return IMGetDomainBoolForKey();
}

+ (BOOL)isInternalCarryDevice
{
  if (!+[IMDeviceUtilities isInternalInstall]) {
    return 0;
  }
  v2 = (void *)CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  char v3 = [v2 isEqualToString:@"carry"];
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

+ (BOOL)isSeedInstall
{
  return 0;
}

+ (BOOL)isMessagesInstalled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "applicationIsInstalled:", @"com.apple.MobileSMS"))
  {
    LOBYTE(v3) = 1;
  }
  else if ([a1 completedSystemAppMigration])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = @"NO";
        if (v3) {
          v5 = @"YES";
        }
        int v7 = 138412290;
        v8 = v5;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "We did not finish SystemAppMigration yet, overriding isMessagesInstalled to %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  return v3;
}

+ (BOOL)completedSystemAppMigration
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int SystemAppMigrationStatus = MobileInstallationGetSystemAppMigrationStatus();
  int v3 = IMOSLoggingEnabled();
  if (SystemAppMigrationStatus)
  {
    if (v3)
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v8 = @"NO";
        v5 = "Fetching SystemAppMigrationStatus is %@";
LABEL_8:
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, v5, buf, 0xCu);
      }
    }
  }
  else if (v3)
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = 0;
      v5 = "Fetching SystemAppMigrationStatus failed with error %@";
      goto LABEL_8;
    }
  }
  return 0;
}

@end