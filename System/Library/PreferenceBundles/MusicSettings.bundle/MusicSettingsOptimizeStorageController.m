@interface MusicSettingsOptimizeStorageController
+ (id)_minimumStorageOption;
+ (id)_supportedStorageOptions;
+ (id)optimizeStorageStateDescription;
+ (void)_setMinimumStorageOption:(id)a3;
- (MusicSettingsOptimizeStorageController)init;
- (id)minimumStorageGroupFooterText;
- (id)minimumStorageTierDescriptionForSpecifier:(id)a3;
- (id)minimumStorageTierEnabledForSpecifier:(id)a3;
- (id)minimumStorageTierIconImageForSpecifier:(id)a3;
- (id)minimumStorageTierLabelForSpecifier:(id)a3;
- (id)optimizeStorageGroupFooterText;
- (id)spacerImage;
- (id)stringsTable;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MusicSettingsOptimizeStorageController

+ (id)optimizeStorageStateDescription
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"OptimizeStorage", @"com.apple.Music", 0);
  uint64_t v4 = [a1 _minimumStorageOption];
  v5 = (void *)v4;
  if (AppBooleanValue)
  {
    if (!v4)
    {
      v5 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = [v5 localizedStringForKey:@"ON" value:&stru_18CF0 table:@"MusicSettingsOptimizeStorage"];
      goto LABEL_12;
    }
    v6 = [a1 _supportedStorageOptions];
    if (([v6 containsObject:v5] & 1) == 0)
    {
      id v7 = [v5 longLongValue];
      v8 = [v6 lastObject];
      id v9 = [v8 longLongValue];

      if ((uint64_t)v7 <= (uint64_t)v9) {
        [v6 firstObject];
      }
      else {
      uint64_t v11 = [v6 lastObject];
      }

      [a1 _setMinimumStorageOption:v11];
      v5 = (void *)v11;
    }
    id v12 = objc_alloc_init((Class)NSByteCountFormatter);
    [v12 setCountStyle:3];
    [v12 setAllowedUnits:8];
    v10 = objc_msgSend(v12, "stringFromByteCount:", (void)objc_msgSend(v5, "unsignedLongLongValue") << 30);
  }
  else
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v6 localizedStringForKey:@"OFF" value:&stru_18CF0 table:@"MusicSettingsOptimizeStorage"];
  }

LABEL_12:

  return v10;
}

- (MusicSettingsOptimizeStorageController)init
{
  v19.receiver = self;
  v19.super_class = (Class)MusicSettingsOptimizeStorageController;
  v2 = [(MusicSettingsOptimizeStorageController *)&v19 init];
  if (v2)
  {
    v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    uint64_t v4 = +[UIImageSymbolConfiguration configurationWithFont:v3];

    v5 = +[UIImage systemImageNamed:@"checkmark"];
    uint64_t v6 = [v5 imageByApplyingSymbolConfiguration:v4];
    checkmarkImage = v2->_checkmarkImage;
    v2->_checkmarkImage = (UIImage *)v6;

    v8 = (NSByteCountFormatter *)objc_alloc_init((Class)NSByteCountFormatter);
    formatter = v2->_formatter;
    v2->_formatter = v8;

    [(NSByteCountFormatter *)v2->_formatter setCountStyle:3];
    [(NSByteCountFormatter *)v2->_formatter setAllowedUnits:8];
    v10 = [(id)objc_opt_class() _supportedStorageOptions];
    uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
    [v11 setObject:&__NSDictionary0__struct forKeyedSubscript:@"com.apple.Music:MinimumStorageTier0"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_4F24;
    v17[3] = &unk_18748;
    id v12 = v11;
    v18 = v12;
    [v10 enumerateObjectsUsingBlock:v17];
    storageTierSpecifierID = v2->_storageTierSpecifierID;
    v2->_storageTierSpecifierID = v12;
    v14 = v12;

    v15 = [(MusicSettingsOptimizeStorageController *)v2 loadSpecifiersFromPlistName:@"MusicSettingsOptimizeStorage" target:v2];
    [(MusicSettingsOptimizeStorageController *)v2 setAllSpecifiers:v15];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MusicSettingsOptimizeStorageController;
  [(MusicSettingsOptimizeStorageController *)&v21 viewDidAppear:a3];
  v20 = +[NSURL URLWithString:@"prefs:root=MUSIC&path=com.apple.Music:OptimizeStorage"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"APPS" table:@"MusicSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  uint64_t v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"MUSIC" table:@"MusicSettings" locale:v10 bundleURL:v12];

  id v14 = objc_alloc((Class)_NSLocalizedStringResource);
  v15 = +[NSLocale currentLocale];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 bundleURL];
  id v18 = [v14 initWithKey:@"OPTIMIZE_STORAGE" table:@"MusicSettings" locale:v15 bundleURL:v17];

  v22[0] = v8;
  v22[1] = v13;
  objc_super v19 = +[NSArray arrayWithObjects:v22 count:2];
  [(MusicSettingsOptimizeStorageController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Music" title:v18 localizedNavigationComponents:v19 deepLink:v20];
}

- (id)stringsTable
{
  return @"MusicSettingsOptimizeStorage";
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MusicSettingsOptimizeStorageController;
  [(MusicSettingsOptimizeStorageController *)&v7 setPreferenceValue:a3 specifier:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
  uint64_t v6 = [(MusicSettingsOptimizeStorageController *)self specifier];
  [WeakRetained reloadSpecifier:v6];
}

- (id)minimumStorageTierLabelForSpecifier:(id)a3
{
  storageTierSpecifierID = self->_storageTierSpecifierID;
  v5 = [a3 identifier];
  uint64_t v6 = [(NSDictionary *)storageTierSpecifierID objectForKeyedSubscript:v5];
  objc_super v7 = [v6 objectForKeyedSubscript:@"capacity"];

  id v8 = -[NSByteCountFormatter stringFromByteCount:](self->_formatter, "stringFromByteCount:", (void)[v7 unsignedLongLongValue] << 30);

  return v8;
}

- (id)minimumStorageTierEnabledForSpecifier:(id)a3
{
  storageTierSpecifierID = self->_storageTierSpecifierID;
  id v4 = [a3 identifier];
  v5 = [(NSDictionary *)storageTierSpecifierID objectForKeyedSubscript:v4];
  if (v5) {
    uint64_t v6 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v6 = &__kCFBooleanFalse;
  }
  id v7 = v6;

  return v7;
}

- (id)minimumStorageTierIconImageForSpecifier:(id)a3
{
  storageTierSpecifierID = self->_storageTierSpecifierID;
  v5 = [a3 identifier];
  uint64_t v6 = [(NSDictionary *)storageTierSpecifierID objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"capacity"];

  uint64_t v8 = [(id)objc_opt_class() _minimumStorageOption];
  if (v7 | v8 && ![(id)v7 isEqual:v8])
  {
    id v9 = [(MusicSettingsOptimizeStorageController *)self spacerImage];
  }
  else
  {
    id v9 = self->_checkmarkImage;
  }
  v10 = v9;

  return v10;
}

- (id)spacerImage
{
  spacerImage = self->_spacerImage;
  if (!spacerImage)
  {
    id v4 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 24.0, 1.0);
    v5 = [v4 imageWithActions:&stru_18788];
    uint64_t v6 = self->_spacerImage;
    self->_spacerImage = v5;

    spacerImage = self->_spacerImage;
  }

  return spacerImage;
}

- (id)minimumStorageGroupFooterText
{
  v3 = [(id)objc_opt_class() _minimumStorageOption];
  if (v3)
  {
    int v4 = MGGetSInt32Answer();
    CFStringRef v5 = @"MINIMUM_STORAGE_SUMMARY_FORMAT_IPHONE";
    if (v4 == 2) {
      CFStringRef v5 = @"MINIMUM_STORAGE_SUMMARY_FORMAT_IPOD";
    }
    if (v4 == 3) {
      CFStringRef v5 = @"MINIMUM_STORAGE_SUMMARY_FORMAT_IPAD";
    }
    if (v4 == 11) {
      CFStringRef v6 = @"MINIMUM_STORAGE_SUMMARY_FORMAT_VISION";
    }
    else {
      CFStringRef v6 = v5;
    }
    uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:v6 value:&stru_18CF0 table:@"MusicSettingsOptimizeStorage"];
    id v9 = -[NSByteCountFormatter stringFromByteCount:](self->_formatter, "stringFromByteCount:", (void)[v3 unsignedLongLongValue] << 30);
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)optimizeStorageGroupFooterText
{
  int v2 = MGGetSInt32Answer();
  CFStringRef v3 = @"OPTIMIZE_STORAGE_MESSAGE_IPHONE";
  if (v2 == 2) {
    CFStringRef v3 = @"OPTIMIZE_STORAGE_MESSAGE_IPOD";
  }
  if (v2 == 3) {
    CFStringRef v3 = @"OPTIMIZE_STORAGE_MESSAGE_IPAD";
  }
  if (v2 == 11) {
    CFStringRef v4 = @"OPTIMIZE_STORAGE_MESSAGE_VISION";
  }
  else {
    CFStringRef v4 = v3;
  }
  CFStringRef v5 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v6 = [v5 localizedStringForKey:v4 value:&stru_18CF0 table:@"MusicSettingsOptimizeStorage"];

  return v6;
}

- (id)minimumStorageTierDescriptionForSpecifier:(id)a3
{
  storageTierSpecifierID = self->_storageTierSpecifierID;
  CFStringRef v4 = [a3 identifier];
  CFStringRef v5 = [(NSDictionary *)storageTierSpecifierID objectForKeyedSubscript:v4];
  CFStringRef v6 = [v5 objectForKeyedSubscript:@"capacity"];

  if (v6)
  {
    uint64_t v7 = 200 * [v6 intValue];
    uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"MINIMUM_STORAGE_DESCRIPTION_FORMAT" value:&stru_18CF0 table:@"MusicSettingsOptimizeStorage"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_18CF0;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MusicSettingsOptimizeStorageController;
  id v6 = a4;
  uint64_t v7 = [(MusicSettingsOptimizeStorageController *)&v13 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[MusicSettingsOptimizeStorageController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v13.receiver, v13.super_class);

  storageTierSpecifierID = self->_storageTierSpecifierID;
  v10 = [v8 identifier];
  uint64_t v11 = [(NSDictionary *)storageTierSpecifierID objectForKey:v10];

  if (v11) {
    [v7 setSelectionStyle:1];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MusicSettingsOptimizeStorageController;
  [(MusicSettingsOptimizeStorageController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
  uint64_t v8 = [(MusicSettingsOptimizeStorageController *)self specifierAtIndexPath:v7];
  storageTierSpecifierID = self->_storageTierSpecifierID;
  v10 = [v8 identifier];
  uint64_t v11 = [(NSDictionary *)storageTierSpecifierID objectForKey:v10];

  if (v11)
  {
    id v12 = self->_storageTierSpecifierID;
    objc_super v13 = [v8 identifier];
    id v14 = [(NSDictionary *)v12 objectForKeyedSubscript:v13];
    v15 = [v14 objectForKeyedSubscript:@"capacity"];

    [(id)objc_opt_class() _setMinimumStorageOption:v15];
    id WeakRetained = objc_loadWeakRetained((id *)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
    v17 = [(MusicSettingsOptimizeStorageController *)self specifier];
    [WeakRetained reloadSpecifier:v17];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_5B9C;
    v18[3] = &unk_186A8;
    v18[4] = self;
    id v19 = v6;
    id v20 = v7;
    +[UIView performWithoutAnimation:v18];
  }
}

+ (id)_minimumStorageOption
{
  int v2 = (void *)CFPreferencesCopyAppValue(@"MinimumStorageOption", @"com.apple.Music");

  return v2;
}

+ (void)_setMinimumStorageOption:(id)a3
{
  id v3 = a3;
  CFPreferencesSetAppValue(@"MinimumStorageOption", v3, @"com.apple.Music");
  id v4 = [v3 unsignedLongLongValue];

  CFPreferencesSetAppValue(@"MinimumStorageSize", +[NSNumber numberWithUnsignedLongLong:(void)v4 << 30], @"com.apple.Music");

  CFPreferencesAppSynchronize(@"com.apple.Music");
}

+ (id)_supportedStorageOptions
{
  id v3 = (void *)MGCopyAnswer();
  id v4 = [v3 objectForKey:kMGQDiskUsageTotalDataCapacity];
  CFStringRef v5 = v4;
  if (v4)
  {
    double v6 = log2((double)((unint64_t)[v4 longLongValue] >> 30));
    LODWORD(v2) = llround(exp2(floor(v6)));
    id v7 = +[NSMutableArray arrayWithCapacity:6];
    if ((int)v2 >= 1)
    {
      do
      {
        if ((unint64_t)[v7 count] > 5) {
          break;
        }
        uint64_t v8 = +[NSNumber numberWithInteger:v2];
        [v7 insertObject:v8 atIndex:0];

        BOOL v9 = v2 > 1;
        v2 >>= 1;
      }
      while (v9);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageTierSpecifierID, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_spacerImage, 0);

  objc_storeStrong((id *)&self->_checkmarkImage, 0);
}

@end