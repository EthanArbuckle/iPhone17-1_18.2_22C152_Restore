@interface CLSSettingsActivityListCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (id)constructSubtitleStringWithSpecifier:(id)a3;
- (id)subtitleDateFormatter;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation CLSSettingsActivityListCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSSettingsActivityListCell;
  id v4 = a3;
  [(CLSSettingsActivityListCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = -[CLSSettingsActivityListCell constructSubtitleStringWithSpecifier:](self, "constructSubtitleStringWithSpecifier:", v4, v7.receiver, v7.super_class);

  v6 = [(CLSSettingsActivityListCell *)self detailTextLabel];
  [v6 setText:v5];
}

- (id)constructSubtitleStringWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:@"CLSSettingsSpecifierActivityLastModifiedDate"];
  if (v5)
  {
    v6 = [(CLSSettingsActivityListCell *)self subtitleDateFormatter];
    objc_super v7 = [v6 stringFromDate:v5];
  }
  else
  {
    objc_super v7 = 0;
  }
  v8 = [v4 propertyForKey:@"CLSSettingsSpecifierContextType"];
  if (![v7 length])
  {
    id v12 = v8;
LABEL_9:
    v11 = v12;
    goto LABEL_10;
  }
  if (![v8 length])
  {
    id v12 = v7;
    goto LABEL_9;
  }
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"DATE_AND_CONTEXT_TYPE" value:&stru_C6A8 table:@"ClassKitSettings"];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v7, v8);

LABEL_10:
  id v13 = v11;

  return v13;
}

- (id)subtitleDateFormatter
{
  if (qword_10BD0 != -1) {
    dispatch_once(&qword_10BD0, &stru_C3C8);
  }
  v2 = (void *)qword_10BC8;

  return v2;
}

@end