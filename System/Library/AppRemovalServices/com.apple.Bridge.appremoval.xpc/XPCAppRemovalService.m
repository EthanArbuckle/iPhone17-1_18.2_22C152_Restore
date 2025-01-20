@interface XPCAppRemovalService
+ (void)clearUserDefaultsDomain:(id)a3;
+ (void)removeFileAtPath:(id)a3;
- (id)_bridgeDeleteMobileAssets;
- (void)_clearAppConduitData;
- (void)_clearBridgeData;
- (void)_clearNanoPassKitData;
- (void)_clearNanoPreferencesSyncData;
- (void)_clearNanoRegistryData;
- (void)_clearNanoSystemSettingsData;
- (void)_clearNanoTimeKitData;
- (void)_clearPairedSyncData;
- (void)removeAppWithReply:(id)a3;
@end

@implementation XPCAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v5 = (uint64_t (**)(id, void))a3;
  [(XPCAppRemovalService *)self _clearBridgeData];
  [(XPCAppRemovalService *)self _clearNanoSystemSettingsData];
  [(XPCAppRemovalService *)self _clearNanoPreferencesSyncData];
  [(XPCAppRemovalService *)self _clearPairedSyncData];
  [(XPCAppRemovalService *)self _clearNanoRegistryData];
  [(XPCAppRemovalService *)self _clearAppConduitData];
  [(XPCAppRemovalService *)self _clearNanoTimeKitData];
  id v4 = [(XPCAppRemovalService *)self _clearNanoPassKitData];
  if (v5) {
    id v4 = (id)v5[2](v5, 0);
  }
  _objc_release_x8(v4);
}

+ (void)clearUserDefaultsDomain:(id)a3
{
  CFStringRef v3 = (const __CFString *)a3;
  id v4 = (__CFString *)v3;
  if (v3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    CFArrayRef v5 = CFPreferencesCopyKeyList(v3, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    id v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          CFPreferencesSetValue(*(CFStringRef *)(*((void *)&v11 + 1) + 8 * (void)v9), 0, v4, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    CFPreferencesSynchronize(v4, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    id v10 = [(__CFArray *)v5 count];
    NSLog(@"Cleared (%lu) values from domain: (%@)", v10, v4, (void)v11);
  }
}

+ (void)removeFileAtPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v7 = 0;
    unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v7];
    id v6 = v7;

    if (v5) {
      NSLog(@"Removed file at path: (%@)", v3);
    }
    else {
      NSLog(@"Failed to remove file at path: (%@) with error: (%@)", v3, v6);
    }
  }
}

- (void)_clearBridgeData
{
  id v2 = [(XPCAppRemovalService *)self _bridgeDeleteMobileAssets];
  [(id)objc_opt_class() removeFileAtPath:@"/var/mobile/Library/Caches/BridgeIconCache"];
  id v3 = objc_opt_class();
  [v3 clearUserDefaultsDomain:@"com.apple.Bridge"];
}

- (void)_clearNanoSystemSettingsData
{
  id v2 = objc_opt_class();
  [v2 clearUserDefaultsDomain:@"com.apple.nanosystemsettings"];
}

- (void)_clearNanoPreferencesSyncData
{
  [(id)objc_opt_class() clearUserDefaultsDomain:@"com.apple.nanoprefsyncd"];
  id v2 = objc_opt_class();
  [v2 removeFileAtPath:@"/var/mobile/Library/NanoPreferencesSync"];
}

- (void)_clearPairedSyncData
{
  id v2 = objc_opt_class();
  [v2 clearUserDefaultsDomain:@"com.apple.pairedsyncd"];
}

- (void)_clearNanoRegistryData
{
  [(id)objc_opt_class() clearUserDefaultsDomain:@"com.apple.NanoRegistry"];
  [(id)objc_opt_class() clearUserDefaultsDomain:@"com.apple.NanoRegistry.NRRootCommander.volatile"];
  [(id)objc_opt_class() removeFileAtPath:@"/var/mobile/Library/DeviceRegistry"];
  [(id)objc_opt_class() removeFileAtPath:@"/var/mobile/Library/DeviceRegistry.state"];
  +[XPCAppRemovalServiceUnixProcessSignaler killProcessNamed:@"nanoregistryd"];
}

- (void)_clearAppConduitData
{
}

- (void)_clearNanoTimeKitData
{
}

- (void)_clearNanoPassKitData
{
  [(id)objc_opt_class() clearUserDefaultsDomain:@"com.apple.nanopassbook"];
  id v2 = objc_opt_class();
  [v2 removeFileAtPath:@"/var/mobile/Library/Caches/com.apple.NanoPassKit"];
}

- (id)_bridgeDeleteMobileAssets
{
  id v2 = objc_alloc_init((Class)PBBridgeAssetsManager);
  [v2 purgeAllAssetsLocalOnly:1];

  return 0;
}

@end