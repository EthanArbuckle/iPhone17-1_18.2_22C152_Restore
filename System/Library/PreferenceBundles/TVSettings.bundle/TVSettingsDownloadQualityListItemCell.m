@interface TVSettingsDownloadQualityListItemCell
+ (int64_t)cellStyle;
- (TVSettingsDownloadQualityListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_subtitleForSpecifier:(id)a3;
@end

@implementation TVSettingsDownloadQualityListItemCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TVSettingsDownloadQualityListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TVSettingsDownloadQualityListItemCell;
  v9 = [(TVSettingsDownloadQualityListItemCell *)&v14 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(TVSettingsDownloadQualityListItemCell *)v9 detailTextLabel];
    v12 = [(TVSettingsDownloadQualityListItemCell *)v10 _subtitleForSpecifier:v8];
    [v11 setText:v12];
  }
  return v10;
}

- (id)_subtitleForSpecifier:(id)a3
{
  v3 = [a3 name];
  v4 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  uint64_t v5 = [v4 localizedStringForKey:@"DOWNLOAD_QUALITY_HIGH_TITLE" value:&stru_18968 table:@"TVSettings"];
  v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_18968;
  }
  unsigned int v8 = [v3 isEqualToString:v7];

  v9 = +[NSBundle bundleWithIdentifier:@"com.apple.tvsettings"];
  v10 = v9;
  if (v8) {
    CFStringRef v11 = @"DOWNLOAD_QUALITY_HIGH_SUBTITLE";
  }
  else {
    CFStringRef v11 = @"DOWNLOAD_QUALITY_LOW_SUBTITLE";
  }
  v12 = [v9 localizedStringForKey:v11 value:&stru_18968 table:@"TVSettings"];

  return v12;
}

@end