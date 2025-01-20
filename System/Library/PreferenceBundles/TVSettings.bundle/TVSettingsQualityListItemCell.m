@interface TVSettingsQualityListItemCell
+ (int64_t)cellStyle;
- (TVSettingsQualityListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_subtitleForSpecifier:(id)a3;
@end

@implementation TVSettingsQualityListItemCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TVSettingsQualityListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TVSettingsQualityListItemCell;
  v9 = [(TVSettingsQualityListItemCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(TVSettingsQualityListItemCell *)v9 detailTextLabel];
    v12 = [(TVSettingsQualityListItemCell *)v10 _subtitleForSpecifier:v8];
    [v11 setText:v12];
  }
  return v10;
}

- (id)_subtitleForSpecifier:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TVSettingsQualityListItemCell;
  v5 = [(TVSettingsQualityListItemCell *)&v29 _tableView];
  v6 = [v5 dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v28.receiver = self;
    v28.super_class = (Class)TVSettingsQualityListItemCell;
    id v8 = [(TVSettingsQualityListItemCell *)&v28 _tableView];
    v9 = [v8 dataSource];
    v10 = [v9 title];

    if (v10)
    {
      v11 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
      uint64_t v12 = [v11 localizedStringForKey:@"CELLULAR_QUALITY_PLAYBACK_SELECTION_TITLE" value:&stru_18968 table:@"TVSettings"];
      v13 = (void *)v12;
      if (v12) {
        CFStringRef v14 = (const __CFString *)v12;
      }
      else {
        CFStringRef v14 = &stru_18968;
      }
      unsigned int v15 = [v10 isEqualToString:v14];
    }
    else
    {
      unsigned int v15 = 0;
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  v16 = [v4 name];
  v17 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v18 = [v17 localizedStringForKey:@"PLAYBACK_QUALITY_HIGH_TITLE" value:&stru_18968 table:@"TVSettings"];
  v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = &stru_18968;
  }
  unsigned int v21 = [v16 isEqualToString:v20];

  v22 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  v23 = v22;
  CFStringRef v24 = @"PLAYBACK_QUALITY_LOW_WIFI_SUBTITLE";
  if (v15) {
    CFStringRef v24 = @"PLAYBACK_QUALITY_AUTO_SUBTITLE";
  }
  if (v21) {
    CFStringRef v25 = @"PLAYBACK_QUALITY_HIGH_SUBTITLE";
  }
  else {
    CFStringRef v25 = v24;
  }
  v26 = [v22 localizedStringForKey:v25 value:&stru_18968 table:@"TVSettings"];

  return v26;
}

@end