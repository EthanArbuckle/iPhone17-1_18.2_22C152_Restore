@interface BCSAppClipActionPickerItem
- (BOOL)useInlineMenu;
- (id)icon;
- (id)label;
@end

@implementation BCSAppClipActionPickerItem

- (id)icon
{
  v2 = [(BCSActionPickerItem *)self action];
  v3 = [v2 clipMetadataRequest];
  v4 = [v3 getDownloadedIconURLSynchronously];

  v5 = (void *)appclipIconCache;
  if (!appclipIconCache)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    v7 = (void *)appclipIconCache;
    appclipIconCache = (uint64_t)v6;

    [(id)appclipIconCache setCountLimit:8];
    v5 = (void *)appclipIconCache;
  }
  v8 = [v5 objectForKey:v4];
  if (!v8)
  {
    if (v4 && (MGGetFloat32Answer(), (uint64_t v10 = _bcs_iconWithAppclipTreatment(v4, v9)) != 0))
    {
      v8 = (void *)[objc_alloc((Class)getUIImageClass()) initWithCGImage:v10];
      [(id)appclipIconCache setObject:v8 forKey:v4];
    }
    else
    {
      v8 = [getUIImageClass() systemImageNamed:@"appclip"];
    }
  }

  return v8;
}

- (id)label
{
  v2 = [(BCSActionPickerItem *)self action];
  v3 = [v2 clipMetadataRequest];
  v4 = [v3 getClipMetadataSynchronously];

  if (v4)
  {
    v5 = NSString;
    id v6 = _BCSLocalizedString(@"%@ %@", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
    v7 = [v4 clipOpenButtonTitle];
    v8 = [v4 clipName];
    float v9 = objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
  }
  else
  {
    float v9 = _BCSLocalizedString(@"Open App Clip", &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
  }

  return v9;
}

- (BOOL)useInlineMenu
{
  return 1;
}

@end