@interface DSAppPermissionsDescriptor(DigitalSeparationUI)
+ (id)iconAppBundleForPermission:()DigitalSeparationUI;
+ (id)iconAssetNameForPermission:()DigitalSeparationUI;
+ (id)iconForPermission:()DigitalSeparationUI tableFormat:;
+ (id)stringKeyForPermission:()DigitalSeparationUI;
@end

@implementation DSAppPermissionsDescriptor(DigitalSeparationUI)

+ (id)iconAppBundleForPermission:()DigitalSeparationUI
{
  uint64_t v3 = iconAppBundleForPermission__token;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&iconAppBundleForPermission__token, &__block_literal_global_8);
  }
  v5 = [(id)iconAppBundleForPermission__icons objectForKey:v4];

  return v5;
}

+ (id)iconAssetNameForPermission:()DigitalSeparationUI
{
  uint64_t v3 = iconAssetNameForPermission__token;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&iconAssetNameForPermission__token, &__block_literal_global_318);
  }
  v5 = [(id)iconAssetNameForPermission__icons objectForKey:v4];

  return v5;
}

+ (id)iconForPermission:()DigitalSeparationUI tableFormat:
{
  id v5 = a3;
  v6 = [MEMORY[0x263F3A340] iconAppBundleForPermission:v5];
  if (v6 && !+[DSUIUtilities isPlaceholderForApp:v6])
  {
    if (a4) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 12;
    }
    v10 = +[DSUIUtilities appIconForAppID:v6 format:v15];
  }
  else
  {
    v7 = [MEMORY[0x263F3A340] iconAssetNameForPermission:v5];
    v8 = (void *)MEMORY[0x263F827E8];
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v8 imageNamed:v7 inBundle:v9];

    if (a4)
    {
      v11 = +[DSUIUtilities appIconForAppID:&stru_26E9097D0 format:0];
      [v11 size];
      double v13 = v12;
      [v11 size];
      uint64_t v14 = [v10 imageByPreparingThumbnailOfSize:v13];

      v10 = (void *)v14;
    }
  }
  return v10;
}

+ (id)stringKeyForPermission:()DigitalSeparationUI
{
  uint64_t v3 = stringKeyForPermission__token;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stringKeyForPermission__token, &__block_literal_global_378);
  }
  id v5 = [(id)stringKeyForPermission__icons objectForKey:v4];

  return v5;
}

@end