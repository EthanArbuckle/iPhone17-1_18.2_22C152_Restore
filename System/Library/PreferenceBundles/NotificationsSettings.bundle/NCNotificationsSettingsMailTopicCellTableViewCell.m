@interface NCNotificationsSettingsMailTopicCellTableViewCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation NCNotificationsSettingsMailTopicCellTableViewCell

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
  v33.receiver = self;
  v33.super_class = (Class)NCNotificationsSettingsMailTopicCellTableViewCell;
  id v4 = a3;
  [(NCNotificationsSettingsMailTopicCellTableViewCell *)&v33 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"BBSECTION_INFO_KEY", v33.receiver, v33.super_class);

  if ([v5 allowsNotifications]
    && ([v5 sectionID],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = +[TLAlert bb_toneLibraryAlertTypeForSectionID:v6], v6, v7))
  {
    v8 = +[TLToneManager sharedToneManager];
    v9 = [v5 subsectionID];
    v10 = [v8 currentToneIdentifierForAlertType:v7 topic:v9];

    if (v10) {
      unsigned int v11 = [v10 isEqualToString:TLToneIdentifierNone] ^ 1;
    }
    else {
      unsigned int v11 = 0;
    }
    if (MGGetBoolAnswer())
    {
      v13 = +[TLVibrationManager sharedVibrationManager];
      v14 = [v5 subsectionID];
      v15 = [v13 currentVibrationIdentifierForAlertType:v7 topic:v14];

      if (v15) {
        unsigned int v12 = [v15 isEqualToString:TLVibrationIdentifierNone] ^ 1;
      }
      else {
        unsigned int v12 = 0;
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  else
  {
    unsigned int v12 = 0;
    unsigned int v11 = 0;
  }
  if (([v5 suppressedSettings] & 0x2000) == 0
    && ([v5 pushSettings] & 8) != 0)
  {
    v17 = [v5 parentSection];
    unint64_t v16 = ((unint64_t)[v17 pushSettings] >> 3) & 1;
  }
  else
  {
    LODWORD(v16) = 0;
  }
  v18 = +[NSMutableArray array];
  if ([v5 allowsNotifications])
  {
    v19 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v20 = [v19 localizedStringForKey:@"ALERTS" value:&stru_419A0 table:@"NotificationsSettings"];
    [v18 addObject:v20];
  }
  if (v11)
  {
    v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v22 = v21;
    CFStringRef v23 = @"SOUNDS";
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v22 = v21;
    CFStringRef v23 = @"VIBRATIONS";
  }
  v24 = [v21 localizedStringForKey:v23 value:&stru_419A0 table:@"NotificationsSettings"];
  [v18 addObject:v24];

LABEL_25:
  if (v16)
  {
    v25 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v26 = [v25 localizedStringForKey:@"BADGES" value:&stru_419A0 table:@"NotificationsSettings"];
    [v18 addObject:v26];
  }
  if (![v18 count])
  {
    v27 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v28 = [v27 localizedStringForKey:@"OFF" value:&stru_419A0 table:@"NotificationsSettings"];
    [v18 addObject:v28];
  }
  v29 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v30 = [v29 localizedStringForKey:@"SEPERATOR" value:&stru_419A0 table:@"NotificationsSettings"];
  v31 = [v18 componentsJoinedByString:v30];

  v32 = [(NCNotificationsSettingsMailTopicCellTableViewCell *)self detailTextLabel];
  [v32 setText:v31];
}

@end