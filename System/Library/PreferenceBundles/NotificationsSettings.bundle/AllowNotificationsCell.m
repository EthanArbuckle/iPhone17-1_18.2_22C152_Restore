@interface AllowNotificationsCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AllowNotificationsCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AllowNotificationsCell;
  id v4 = a3;
  [(AllowNotificationsCell *)&v17 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"BBSECTION_INFO_KEY"];

  v6 = [v5 sectionInfoSettings];
  unsigned int v7 = [v6 isAuthorizedTemporarily];

  if (v7)
  {
    v8 = [v5 authorizationExpirationDate];
    [v8 timeIntervalSinceNow];
    double v10 = v9;

    float v11 = v10 / 3600.0;
    unint64_t v12 = llroundf(v11);
    v13 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v14 = [v13 localizedStringForKey:@"EXPIRY_IN_HOURS" value:&stru_419A0 table:@"NotificationsSettings"];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &stru_419A0;
  }
  v16 = [(AllowNotificationsCell *)self detailTextLabel];
  [v16 setText:v15];
}

@end