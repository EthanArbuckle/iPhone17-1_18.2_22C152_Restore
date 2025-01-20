@interface TVSettingsPlaybackQualityListItemsController
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation TVSettingsPlaybackQualityListItemsController

- (void)viewDidLoad
{
  v3 = [(TVSettingsPlaybackQualityListItemsController *)self title];
  int v4 = MGGetBoolAnswer();
  v5 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v6 = [v5 localizedStringForKey:@"PLAYBACK_QUALITY_CELLULAR" value:&stru_18968 table:@"TVSettings"];
  v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_18968;
  }
  if ([v3 isEqualToString:v8])
  {
  }
  else
  {
    v9 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
    uint64_t v10 = [v9 localizedStringForKey:@"DOWNLOAD_QUALITY_CELLULAR" value:&stru_18968 table:@"TVSettings"];
    v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = &stru_18968;
    }
    unsigned int v13 = [v3 isEqualToString:v12];

    if (!v13)
    {
      v14 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      v15 = v14;
      if (v4) {
        CFStringRef v16 = @"WLAN_QUALITY_PLAYBACK_SELECTION_TITLE";
      }
      else {
        CFStringRef v16 = @"WIFI_QUALITY_PLAYBACK_SELECTION_TITLE";
      }
      goto LABEL_14;
    }
  }
  v14 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  v15 = v14;
  CFStringRef v16 = @"CELLULAR_QUALITY_PLAYBACK_SELECTION_TITLE";
LABEL_14:
  uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_18968 table:@"TVSettings"];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_18968;
  }
  v20 = v19;

  [(TVSettingsPlaybackQualityListItemsController *)self setTitle:v20];
  v21.receiver = self;
  v21.super_class = (Class)TVSettingsPlaybackQualityListItemsController;
  [(TVSettingsPlaybackQualityListItemsController *)&v21 viewDidLoad];
}

- (id)specifiers
{
  v18.receiver = self;
  v18.super_class = (Class)TVSettingsPlaybackQualityListItemsController;
  uint64_t v3 = [(TVSettingsPlaybackQualityListItemsController *)&v18 specifiers];
  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  v5 = *(void **)&self->super.PSListItemsController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.PSListItemsController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)&self->super.PSListItemsController_opaque[v4];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = PSCellClassKey;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "setProperty:forKey:", objc_opt_class(), v10, (void)v14);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  CFStringRef v12 = *(void **)&self->super.PSListItemsController_opaque[v4];

  return v12;
}

@end