@interface TVSettingsDownloadQualityListItemsController
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation TVSettingsDownloadQualityListItemsController

- (void)viewDidLoad
{
  v3 = [(TVSettingsDownloadQualityListItemsController *)self title];
  int v4 = MGGetBoolAnswer();
  v5 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v6 = [v5 localizedStringForKey:@"DOWNLOAD_QUALITY_CELLULAR" value:&stru_18968 table:@"TVSettings"];
  v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_18968;
  }
  unsigned int v9 = [v3 isEqualToString:v8];

  v10 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  v11 = v10;
  CFStringRef v12 = @"WIFI_QUALITY_DOWNLOAD_SELECTION_TITLE";
  if (v4) {
    CFStringRef v12 = @"WLAN_QUALITY_DOWNLOAD_SELECTION_TITLE";
  }
  if (v9) {
    CFStringRef v13 = @"CELLULAR_QUALITY_DOWNLOAD_SELECTION_TITLE";
  }
  else {
    CFStringRef v13 = v12;
  }
  uint64_t v14 = [v10 localizedStringForKey:v13 value:&stru_18968 table:@"TVSettings"];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_18968;
  }
  v17 = v16;

  [(TVSettingsDownloadQualityListItemsController *)self setTitle:v17];
  v18.receiver = self;
  v18.super_class = (Class)TVSettingsDownloadQualityListItemsController;
  [(TVSettingsDownloadQualityListItemsController *)&v18 viewDidLoad];
}

- (id)specifiers
{
  v18.receiver = self;
  v18.super_class = (Class)TVSettingsDownloadQualityListItemsController;
  uint64_t v3 = [(TVSettingsDownloadQualityListItemsController *)&v18 specifiers];
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