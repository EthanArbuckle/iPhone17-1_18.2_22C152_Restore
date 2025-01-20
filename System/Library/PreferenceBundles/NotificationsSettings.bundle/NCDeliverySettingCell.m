@interface NCDeliverySettingCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation NCDeliverySettingCell

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
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NCDeliverySettingCell;
  [(NCDeliverySettingCell *)&v21 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:@"NOTIFICATION_DELIVERY_IMMEDIATE_ID"];

  if (v6)
  {
    v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v8 = [v7 localizedStringForKey:@"NOTIFICATION_DELIVERY_IMMEDIATE_DESCRIPTION" value:&stru_419A0 table:@"NotificationsSettings"];

    v9 = +[UIImage systemImageNamed:@"bell.fill"];
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v12 = [v4 identifier];
  unsigned int v13 = [v12 isEqualToString:@"NOTIFICATION_DELIVERY_SCHEDULED_ID"];

  if (!v13)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v14 = +[NCSettingsGatewayController sharedInstance];
  id v15 = [v14 effectiveGlobalScheduledDeliverySetting];

  v16 = +[NCSettingsGatewayController sharedInstance];
  v17 = [v16 effectiveGlobalScheduledDeliveryTimes];

  v18 = NCStringForScheduledDeliverySummary((uint64_t)v15, v17);
  v19 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v20 = [v19 localizedStringForKey:@"NOTIFICATION_DELIVERY_SCHEDULED_DESCRIPTION" value:&stru_419A0 table:@"NotificationsSettings"];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v18);

  v9 = +[UIImage systemImageNamed:@"newspaper.fill"];

  if (v8)
  {
LABEL_3:
    v10 = [(NCDeliverySettingCell *)self detailTextLabel];
    [v10 setText:v8];
  }
LABEL_4:
  if (v9)
  {
    v11 = [(NCDeliverySettingCell *)self imageView];
    [v11 setImage:v9];
  }
LABEL_10:
}

@end