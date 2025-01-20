@interface IMWatchSyncSatelliteStatus
+ (BOOL)isCompanionSatelliteActive;
+ (void)synchronizeSatelliteStatus:(BOOL)a3;
@end

@implementation IMWatchSyncSatelliteStatus

+ (void)synchronizeSatelliteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1A6227910](@"NPSManager", @"NanoPreferencesSync");
  if (v4)
  {
    id v5 = objc_alloc_init(v4);
    v6 = [NSNumber numberWithBool:v3];
    CFPreferencesSetAppValue(@"SatelliteStatusActive", v6, @"com.apple.MobileSMS");
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = @"NO";
        if (v3) {
          v8 = @"YES";
        }
        int v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Setting Satellite Active Status Nano Preference to: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"SatelliteStatusActive"];
    [v5 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Could not weak link ____NPSManagerClass in synchronizeSatelliteStatus", (uint8_t *)&v11, 2u);
    }
  }
}

+ (BOOL)isCompanionSatelliteActive
{
  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

@end