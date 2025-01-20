@interface UARPAssetID(HMDAccessoryFirmwareUpdate)
- (id)softwareVersion;
@end

@implementation UARPAssetID(HMDAccessoryFirmwareUpdate)

- (id)softwareVersion
{
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [a1 isMatterAsset])
  {
    v2 = [a1 assetVersionNumber];

    if (!v2) {
      goto LABEL_9;
    }
    id v3 = objc_alloc(MEMORY[0x1E4F65558]);
    v4 = [a1 assetVersionNumber];
    uint64_t v5 = objc_msgSend(v3, "initWithMajorVersion:minorVersion:updateVersion:", objc_msgSend(v4, "unsignedLongValue"), 0, 0);
  }
  else
  {
    v2 = [a1 assetVersion];

    if (!v2) {
      goto LABEL_9;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F65558]);
    v4 = [a1 assetVersion];
    uint64_t v5 = [v6 initWithVersionString:v4];
  }
  v2 = (void *)v5;

LABEL_9:
  return v2;
}

@end