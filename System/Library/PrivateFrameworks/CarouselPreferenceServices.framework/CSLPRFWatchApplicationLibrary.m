@interface CSLPRFWatchApplicationLibrary
+ (id)libraryForWatchApplications;
@end

@implementation CSLPRFWatchApplicationLibrary

+ (id)libraryForWatchApplications
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (id *)MEMORY[0x263F83300];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  v3 = [*v2 activeWatch];
  v4 = cslprf_app_library_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *v2;
    v6 = [v3 pairingID];
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_22F4EA000, v4, OS_LOG_TYPE_INFO, "%@ UIApp provided device:%@", (uint8_t *)&v15, 0x16u);
  }
  if (!v3)
  {
LABEL_5:
    v7 = [MEMORY[0x263F57730] sharedInstance];
    v3 = [v7 getActivePairedDevice];

    v8 = cslprf_app_library_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v3 pairingID];
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_22F4EA000, v8, OS_LOG_TYPE_INFO, "NRPairedDeviceRegistry provided device:%@", (uint8_t *)&v15, 0xCu);
    }
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  int v11 = [v3 supportsCapability:v10];

  v12 = off_264A0A730;
  if (!v11) {
    v12 = off_264A0A7C0;
  }
  v13 = (void *)[objc_alloc(*v12) initWithPairedWatch:v3];

  return v13;
}

@end