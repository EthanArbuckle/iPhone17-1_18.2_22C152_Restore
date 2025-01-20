@interface BulletinBoardAppDetailController
+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4;
- (BOOL)_areAlwaysDeliverImmediatelyNotificationsNotEnabledForScheduledDeliveryForSectionInfo:(id)a3;
- (BOOL)isApplicationHiddenForSectionInfo:(id)a3;
- (BOOL)isApplicationLockedForSectionInfo:(id)a3;
- (BOOL)isEffectiveGlobalScheduledDeliverySettingEnabled;
- (BulletinBoardAppDetailController)init;
- (BulletinBoardAppDetailControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_alertDeliveryTypeSettingsSpecifierForSectionInfo:(id)a3;
- (id)_alertSettingsGroupSpecifierForSectionInfo:(id)a3;
- (id)_allowsNotificationsSettingGroupSpecifiersForSectionInfo:(id)a3;
- (id)_allowsNotificationsSettingSpecifierForSectionInfo:(id)a3;
- (id)_alwaysAllowedGroupSpecifiersForSectionInfo:(id)a3;
- (id)_announceSettingsSpecifiersForSectionInfo:(id)a3;
- (id)_badgesSettingSpecifierForSectionInfo:(id)a3;
- (id)_bannerSettingSpecifierForSectionInfo:(id)a3;
- (id)_bannerStyleSettingSpecifierForSectionInfo:(id)a3;
- (id)_carPlaySettingSpecifierForSectionInfo:(id)a3;
- (id)_contentPreviewSpecifierForSectionInfo:(id)a3;
- (id)_criticalAlertSettingSpecifierForSectionInfo:(id)a3;
- (id)_customSettings:(id)a3;
- (id)_customSoundSettingSpecifierForSectionInfo:(id)a3;
- (id)_directMessagesSettingSpecifierForSectionInfo:(id)a3;
- (id)_effectiveSectionInfoForSectionInfo:(id)a3 passingTest:(id)a4;
- (id)_effectiveSectionInfoForSectionInfo:(id)a3 setting:(unint64_t)a4;
- (id)_effectiveSectionInfoForSectionInfo:(id)a3 setting:(unint64_t)a4 pushSetting:(unint64_t)a5;
- (id)_lockScreenAppearanceSettingsSpecifiersForSectionInfo:(id)a3;
- (id)_notificationCenterSettingSpecifierForSectionInfo:(id)a3;
- (id)_notificationDeliverySettingGroupSpecifiersForSectionInfo:(id)a3;
- (id)_notificationGroupingGroupSpecifierForSectionInfo:(id)a3;
- (id)_notificationGroupingSpecifierForSectionInfo:(id)a3;
- (id)_remoteNotificationsSettingSpecifierForSectionInfo:(id)a3;
- (id)_soundSettingSpecifierForSectionInfo:(id)a3;
- (id)_spokenNotificationsSpecifierForSectionInfo:(id)a3;
- (id)_summarizationSpecifierForSectionInfo:(id)a3;
- (id)_timeSensitiveSettingSpecifierForSectionInfo:(id)a3;
- (id)_valueOfNotificationType:(unint64_t)a3 forSectionInfo:(id)a4;
- (id)alertDeliveryDescriptor:(id)a3;
- (id)allowNotifications:(id)a3;
- (id)allowRemoteNotifications:(id)a3;
- (id)badges:(id)a3;
- (id)bannerSetting:(id)a3;
- (id)bannerStyle:(id)a3;
- (id)criticalAlert:(id)a3;
- (id)detailTextForToneWithSpecifier:(id)a3;
- (id)directMessagesSetting:(id)a3;
- (id)notificationCenterSetting:(id)a3;
- (id)notificationGrouping:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)showsMessagePreview:(id)a3;
- (id)sounds:(id)a3;
- (id)specifiers;
- (id)summarizationSetting:(id)a3;
- (id)timeSensitiveSetting:(id)a3;
- (id)viewInCarPlay:(id)a3;
- (unint64_t)_generalSettingsInsertIndexForSpecifiers:(id)a3;
- (void)_loadGlobalPreviews;
- (void)_openAppNotificationSettings:(id)a3;
- (void)_setValue:(id)a3 notificationType:(unint64_t)a4 forSectionInfo:(id)a5;
- (void)_updateBannerStyleForSectionInfo:(id)a3 animated:(BOOL)a4;
- (void)_updateBannerStyleForSectionInfo:(id)a3 animated:(BOOL)a4 forSpecifiers:(id)a5;
- (void)_updateNotificationDeliverySettingForSpecifier:(id)a3;
- (void)_updateSpecifiersWithSectionInfo:(id)a3;
- (void)appDetailControllerWillDisappear:(id)a3;
- (void)dealloc;
- (void)didChangeSettingForSpokenNotificationsAppDetailController:(id)a3 withSpecifierIdentifier:(id)a4;
- (void)editScheduleDismissed:(id)a3;
- (void)emitNavigationEventForAppDetailController;
- (void)reloadSpecifiers;
- (void)setAlertDeliveryDescriptor:(id)a3 specifier:(id)a4;
- (void)setAllowNotifications:(id)a3 specifier:(id)a4;
- (void)setAllowRemoteNotifications:(id)a3 specifier:(id)a4;
- (void)setBadges:(id)a3 specifier:(id)a4;
- (void)setBannerSetting:(id)a3 specifier:(id)a4;
- (void)setBannerStyle:(id)a3 specifier:(id)a4;
- (void)setCriticalAlert:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDirectMessagesSetting:(id)a3 specifier:(id)a4;
- (void)setNotificationCenterSetting:(id)a3 specifier:(id)a4;
- (void)setNotificationGrouping:(id)a3 specifier:(id)a4;
- (void)setSectionInfo:(id)a3 forSectionID:(id)a4;
- (void)setShowsMessagePreview:(id)a3 specifier:(id)a4;
- (void)setSounds:(id)a3 specifier:(id)a4;
- (void)setSummarizationSetting:(id)a3 specifier:(id)a4;
- (void)setTimeSensitiveSetting:(id)a3 specifier:(id)a4;
- (void)setViewInCarPlay:(id)a3 specifier:(id)a4;
- (void)settingsGateway:(id)a3 didUpdateSectionInfo:(id)a4;
- (void)tappedEditSchedule:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BulletinBoardAppDetailController

- (BulletinBoardAppDetailController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BulletinBoardAppDetailController;
  v2 = [(BulletinBoardAppDetailController *)&v5 init];
  [(BulletinBoardAppDetailController *)v2 _loadGlobalPreviews];
  v3 = +[NCSettingsGatewayController sharedInstance];
  [v3 addObserver:v2];

  +[NCRemoteNotificationsManager addObserver:v2];
  return v2;
}

- (void)dealloc
{
  v3 = +[NCSettingsGatewayController sharedInstance];
  [v3 removeObserver:self];

  +[NCRemoteNotificationsManager removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)BulletinBoardAppDetailController;
  [(BulletinBoardAppDetailController *)&v4 dealloc];
}

- (void)_loadGlobalPreviews
{
  id v3 = +[NCSettingsGatewayController sharedInstance];
  self->_globalContentPreviewSetting = (int64_t)[v3 effectiveGlobalContentPreviewsSetting];
}

- (unint64_t)_generalSettingsInsertIndexForSpecifiers:(id)a3
{
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [&off_447F0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&off_447F0);
        }
        id v9 = [v3 indexOfSpecifierWithID:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v5 = (unint64_t)v9 + 1;
          goto LABEL_11;
        }
      }
      id v6 = [&off_447F0 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_11:

  return v5;
}

- (void)reloadSpecifiers
{
  savedSectionInfo = self->_savedSectionInfo;
  self->_savedSectionInfo = 0;

  bannerStyleSpecifier = self->_bannerStyleSpecifier;
  self->_bannerStyleSpecifier = 0;

  disallowedStateHiddenSpecifiers = self->_disallowedStateHiddenSpecifiers;
  self->_disallowedStateHiddenSpecifiers = 0;

  v6.receiver = self;
  v6.super_class = (Class)BulletinBoardAppDetailController;
  [(BulletinBoardAppDetailController *)&v6 reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = OBJC_IVAR___PSViewController__specifier;
    objc_super v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"BBSECTION_INFO_KEY"];
    uint64_t v7 = (BBSectionInfo *)[v6 copy];
    savedSectionInfo = self->_savedSectionInfo;
    self->_savedSectionInfo = v7;

    id v9 = v6;
    v10 = +[NSMutableArray array];
    if ([v9 authorizationStatus])
    {
      long long v11 = [(BulletinBoardAppDetailController *)self _allowsNotificationsSettingGroupSpecifiersForSectionInfo:v9];
      [v10 addObjectsFromArray:v11];

      long long v12 = [(BulletinBoardAppDetailController *)self _notificationDeliverySettingGroupSpecifiersForSectionInfo:v9];
      [v10 addObjectsFromArray:v12];

      long long v13 = [(BulletinBoardAppDetailController *)self _alwaysAllowedGroupSpecifiersForSectionInfo:v9];
      [v10 addObjectsFromArray:v13];

      long long v14 = [(BulletinBoardAppDetailController *)self _alertSettingsGroupSpecifierForSectionInfo:v9];
      [v10 addObjectsFromArray:v14];

      v15 = [(BulletinBoardAppDetailController *)self _announceSettingsSpecifiersForSectionInfo:v9];
      [v10 addObjectsFromArray:v15];

      v16 = [(BulletinBoardAppDetailController *)self _lockScreenAppearanceSettingsSpecifiersForSectionInfo:v9];
      [v10 addObjectsFromArray:v16];
    }
    if ([v9 criticalAlertSetting] || objc_msgSend(v9, "authorizationStatus"))
    {
      v17 = [(BulletinBoardAppDetailController *)self _customSettings:v9];
      [v10 addObjectsFromArray:v17];
    }
    self->_savedBannersAlertType = 1;
    [(BulletinBoardAppDetailController *)self _updateBannerStyleForSectionInfo:v9 animated:0 forSpecifiers:v10];
    v18 = +[MCProfileConnection sharedConnection];
    v19 = [v9 sectionID];
    unsigned __int8 v20 = [v18 isNotificationsModificationAllowedForBundleID:v19];

    if ((v20 & 1) == 0)
    {
      uint64_t v34 = v5;
      uint64_t v35 = v3;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v33 = v10;
      id v21 = v10;
      id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v37;
        uint64_t v25 = PSEnabledKey;
        do
        {
          v26 = 0;
          do
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            v27 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v26);
            v28 = +[NSNumber numberWithBool:0];
            [v27 setProperty:v28 forKey:v25];

            v26 = (char *)v26 + 1;
          }
          while (v23 != v26);
          id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v23);
      }

      uint64_t v5 = v34;
      uint64_t v3 = v35;
      v10 = v33;
    }
    v29 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v10;
    id v30 = v10;

    v31 = [*(id *)&self->PSListController_opaque[v5] name];

    [(BulletinBoardAppDetailController *)self setTitle:v31];
    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_allowsNotificationsSettingGroupSpecifiersForSectionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BulletinBoardAppDetailController *)self _allowsNotificationsSettingSpecifierForSectionInfo:v4];
  objc_super v6 = +[NSMutableArray array];
  if (v5)
  {
    uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"ALLOW_NOTIFICATIONS_GROUP_ID"];
    if ([v4 isAppClip])
    {
      v8 = [v4 sectionInfoSettings];
      unsigned int v9 = [v8 isAuthorizedTemporarily];

      if (v9)
      {
        v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        long long v11 = [v10 localizedStringForKey:@"APP_CLIPS_EXPLANATION_FORMAT" value:&stru_419A0 table:@"NotificationsSettings"];
        long long v12 = BBSettingsDisplayNameForBBSection(v4);
        long long v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

        [v7 setProperty:v13 forKey:PSFooterTextGroupKey];
      }
    }
    if ([(BulletinBoardAppDetailController *)self isApplicationHiddenForSectionInfo:v4])
    {
      long long v14 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v15 = [v14 localizedStringForKey:@"APP_PROTECTION_HIDDEN_EXPLANATION" value:&stru_419A0 table:@"NotificationsSettings"];

      [v7 setProperty:v15 forKey:PSFooterTextGroupKey];
    }
    [v6 addObject:v7];
    [v6 addObject:v5];
  }

  return v6;
}

- (id)_notificationDeliverySettingGroupSpecifiersForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  if (-[BulletinBoardAppDetailController isEffectiveGlobalScheduledDeliverySettingEnabled](self, "isEffectiveGlobalScheduledDeliverySettingEnabled")&& [v4 authorizationStatus] != (char *)&dword_0 + 1)
  {
    uint64_t v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v8 = [v7 localizedStringForKey:@"NOTIFICATION_DELIVERY" value:&stru_419A0 table:@"NotificationsSettings"];
    unsigned int v9 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_DELIVERY_GROUP_ID" name:v8];

    [v9 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    uint64_t v34 = v9;
    [v5 addObject:v9];
    v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    long long v11 = [v10 localizedStringForKey:@"NOTIFICATION_DELIVERY_IMMEDIATE" value:&stru_419A0 table:@"NotificationsSettings"];
    long long v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setButtonAction:"_updateNotificationDeliverySettingForSpecifier:"];
    [v12 setIdentifier:@"NOTIFICATION_DELIVERY_IMMEDIATE_ID"];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = PSCellClassKey;
    [v12 setProperty:v13 forKey:PSCellClassKey];
    uint64_t v15 = PSAllowMultilineTitleKey;
    [v12 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v12 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    [v5 addObject:v12];
    v16 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v17 = [v16 localizedStringForKey:@"NOTIFICATION_DELIVERY_SCHEDULED" value:&stru_419A0 table:@"NotificationsSettings"];
    v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v18 setButtonAction:"_updateNotificationDeliverySettingForSpecifier:"];
    [v18 setIdentifier:@"NOTIFICATION_DELIVERY_SCHEDULED_ID"];
    [v18 setProperty:objc_opt_class() forKey:v14];
    [v18 setProperty:&__kCFBooleanTrue forKey:v15];
    [v18 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    [v5 addObject:v18];
    if ([v4 scheduledDeliverySetting] == (char *)&dword_0 + 2)
    {
      [v34 setProperty:v18 forKey:PSRadioGroupCheckedSpecifierKey];
      v19 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      unsigned __int8 v20 = [v19 localizedStringForKey:@"NOTIFICATION_DELIVERY_SCHEDULED_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
      id v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v22 = [v21 localizedStringForKey:@"NOTIFICATION_DELIVERY_SCHEDULED_EDIT_LINK" value:&stru_419A0 table:@"NotificationsSettings"];
      id v23 = +[NSString stringWithFormat:@"%@ %@", v20, v22];

      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      [v34 setProperty:v25 forKey:PSFooterCellClassGroupKey];

      [v34 setProperty:v23 forKey:PSFooterHyperlinkViewTitleKey];
      v26 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v27 = [v26 localizedStringForKey:@"NOTIFICATION_DELIVERY_SCHEDULED_EDIT_LINK" value:&stru_419A0 table:@"NotificationsSettings"];
      v36.location = (NSUInteger)[v23 rangeOfString:v27];
      v28 = NSStringFromRange(v36);
      [v34 setProperty:v28 forKey:PSFooterHyperlinkViewLinkRangeKey];

      v29 = +[NSValue valueWithNonretainedObject:self];
      [v34 setProperty:v29 forKey:PSFooterHyperlinkViewTargetKey];

      id v30 = NSStringFromSelector("tappedEditSchedule:");
      v31 = &PSFooterHyperlinkViewActionKey;
    }
    else
    {
      [v34 setProperty:v12 forKey:PSRadioGroupCheckedSpecifierKey];
      id v23 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v30 = [v23 localizedStringForKey:@"NOTIFICATION_DELIVERY_IMMEDIATE_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
      v31 = &PSFooterTextGroupKey;
    }
    [v34 setProperty:v30 forKey:*v31];

    id v32 = v5;
  }
  else
  {
    id v6 = v5;
  }

  return v5;
}

- (id)_alwaysAllowedGroupSpecifiersForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(BulletinBoardAppDetailController *)self _criticalAlertSettingSpecifierForSectionInfo:v4];
  uint64_t v7 = [(BulletinBoardAppDetailController *)self _timeSensitiveSettingSpecifierForSectionInfo:v4];
  uint64_t v8 = [(BulletinBoardAppDetailController *)self _directMessagesSettingSpecifierForSectionInfo:v4];
  unsigned int v9 = (void *)v8;
  if (v6 || v7 || v8)
  {
    v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    long long v11 = [v10 localizedStringForKey:@"ALWAYS_DELIVER_IMMEDIATELY" value:&stru_419A0 table:@"NotificationsSettings"];
    long long v12 = +[PSSpecifier groupSpecifierWithID:@"ALWAYS_ALLOWED_GROUP_ID" name:v11];

    objc_msgSend(v5, "bs_safeAddObject:", v12);
    objc_msgSend(v5, "bs_safeAddObject:", v6);
    objc_msgSend(v5, "bs_safeAddObject:", v7);
    objc_msgSend(v5, "bs_safeAddObject:", v9);
    if (v6)
    {
      uint64_t v13 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CRITICAL_ALERT_EXPLANATION"];
      uint64_t v15 = [v13 localizedStringForKey:v14 value:&stru_419A0 table:@"NotificationsSettings"];
      [v12 setProperty:v15 forKey:PSFooterTextGroupKey];

      goto LABEL_25;
    }
    if (!-[BulletinBoardAppDetailController isEffectiveGlobalScheduledDeliverySettingEnabled](self, "isEffectiveGlobalScheduledDeliverySettingEnabled")|| [v4 scheduledDeliverySetting] != (char *)&dword_0 + 2)
    {
      if (!v7)
      {
LABEL_26:

        goto LABEL_27;
      }
      id v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v13 = [v21 localizedStringForKey:@"TIME_SENSITIVE_NOTIFICATIONS_DESCRIPTION_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];

      [v12 setProperty:v13 forKey:PSFooterTextGroupKey];
LABEL_25:

      goto LABEL_26;
    }
    v16 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
    if (!v7)
    {
      if (v9)
      {
        id v22 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        uint64_t v23 = [v22 localizedStringForKey:@"DIRECT_MESSAGES_FOOTER_LEADING" value:&stru_419A0 table:@"NotificationsSettings"];

        uint64_t v24 = 0;
        id v32 = (void *)v23;
        uint64_t v25 = (void *)v23;
        v16 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
      }
      else
      {
        uint64_t v24 = 0;
        id v32 = 0;
        uint64_t v25 = 0;
      }
      goto LABEL_23;
    }
    v17 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    uint64_t v13 = [v17 localizedStringForKey:@"TIME_SENSITIVE_NOTIFICATIONS_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];

    if (v9)
    {
      v18 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v19 = [v18 localizedStringForKey:@"DIRECT_MESSAGES_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];

      id v32 = (void *)v19;
      if (v13 && v19)
      {
        id v30 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        unsigned __int8 v20 = [v30 localizedStringForKey:@"DELIVER_IMMEDIATELY_FOOTER_CONJUNCTION" value:&stru_419A0 table:@"NotificationsSettings"];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v13, v19);
        id v33 = (id)objc_claimAutoreleasedReturnValue();

        v16 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
LABEL_24:
        v31 = v16[299];
        v26 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        v27 = [v26 localizedStringForKey:@"DELIVER_IMMEDIATELY_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
        v28 = objc_msgSend(v31, "stringWithFormat:", v27, v33);

        [v12 setProperty:v28 forKey:PSFooterTextGroupKey];
        goto LABEL_25;
      }
      v16 = &_s21DeveloperToolsSupport13ImageResourceV4name6bundleACSS_So8NSBundleCtcfC_ptr;
      if (!v13)
      {
        uint64_t v24 = 0;
        uint64_t v25 = v32;
        goto LABEL_23;
      }
    }
    else
    {
      id v32 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      if (!v13) {
        goto LABEL_23;
      }
    }
    uint64_t v24 = v13;
    uint64_t v25 = v13;
LABEL_23:
    id v33 = v25;
    uint64_t v13 = v24;
    goto LABEL_24;
  }
LABEL_27:

  return v5;
}

- (id)_announceSettingsSpecifiersForSectionInfo:(id)a3
{
  uint64_t v3 = [(BulletinBoardAppDetailController *)self _spokenNotificationsSpecifierForSectionInfo:a3];
  id v4 = +[NSMutableArray array];
  if (v3)
  {
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v6 = [v5 localizedStringForKey:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
    uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_GROUP" name:v6];

    objc_msgSend(v4, "bs_safeAddObject:", v7);
  }
  objc_msgSend(v4, "bs_safeAddObject:", v3);

  return v4;
}

- (id)_alertSettingsGroupSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 authorizationStatus] != (char *)&dword_0 + 1)
  {
    if ([(BulletinBoardAppDetailController *)self _areAlwaysDeliverImmediatelyNotificationsNotEnabledForScheduledDeliveryForSectionInfo:v4])
    {
      id v6 = [(BulletinBoardAppDetailController *)self _badgesSettingSpecifierForSectionInfo:v4];
      if (v6)
      {
        uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"ALERT_SETTINGS_GROUP_ID"];
        objc_msgSend(v5, "bs_safeAddObject:", v7);
      }
      objc_msgSend(v5, "bs_safeAddObject:", v6);
    }
    else
    {
      id v6 = [(BulletinBoardAppDetailController *)self _alertDeliveryTypeSettingsSpecifierForSectionInfo:v4];
      uint64_t v8 = [(BulletinBoardAppDetailController *)self _bannerStyleSettingSpecifierForSectionInfo:v4];
      unsigned int v9 = [(BulletinBoardAppDetailController *)self _customSoundSettingSpecifierForSectionInfo:v4];
      if (v9)
      {
        v10 = 0;
      }
      else
      {
        v10 = [(BulletinBoardAppDetailController *)self _soundSettingSpecifierForSectionInfo:v4];
      }
      long long v11 = [(BulletinBoardAppDetailController *)self _badgesSettingSpecifierForSectionInfo:v4];
      long long v12 = [(BulletinBoardAppDetailController *)self _carPlaySettingSpecifierForSectionInfo:v4];
      uint64_t v13 = [(BulletinBoardAppDetailController *)self _remoteNotificationsSettingSpecifierForSectionInfo:v4];
      uint64_t v14 = (void *)v13;
      if (v6 || v8 || v9 || v10 || v11 || v12 || v13)
      {
        uint64_t v15 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        [v15 localizedStringForKey:@"ALERT_SETTINGS_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
        unsigned __int8 v20 = v11;
        v17 = v16 = v8;
        +[PSSpecifier groupSpecifierWithID:@"ALERT_SETTINGS_GROUP_ID" name:v17];
        v18 = id v21 = v10;

        uint64_t v8 = v16;
        long long v11 = v20;

        objc_msgSend(v5, "bs_safeAddObject:", v18);
        v10 = v21;
      }
      objc_msgSend(v5, "bs_safeAddObject:", v6);
      objc_msgSend(v5, "bs_safeAddObject:", v8);
      objc_msgSend(v5, "bs_safeAddObject:", v9);
      objc_msgSend(v5, "bs_safeAddObject:", v10);
      objc_msgSend(v5, "bs_safeAddObject:", v11);
      objc_msgSend(v5, "bs_safeAddObject:", v12);
      objc_msgSend(v5, "bs_safeAddObject:", v14);
    }
  }

  return v5;
}

- (id)_lockScreenAppearanceSettingsSpecifiersForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 authorizationStatus] != (char *)&dword_0 + 1
    || [v4 criticalAlertSetting] == (char *)&dword_0 + 2)
  {
    id v6 = [(BulletinBoardAppDetailController *)self _contentPreviewSpecifierForSectionInfo:v4];
    uint64_t v7 = [(BulletinBoardAppDetailController *)self _notificationGroupingSpecifierForSectionInfo:v4];
    uint64_t v8 = [(BulletinBoardAppDetailController *)self _summarizationSpecifierForSectionInfo:v4];
    unsigned int v9 = (void *)v8;
    if (v6 || v7 || v8)
    {
      v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      long long v11 = [v10 localizedStringForKey:@"LOCK_SCREEN_APPEARANCE" value:&stru_419A0 table:@"NotificationsSettings"];
      long long v12 = +[PSSpecifier groupSpecifierWithID:@"LOCK_SCREEN_APPEARANCE_GROUP_ID" name:v11];

      if (v9)
      {
        uint64_t v13 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        uint64_t v14 = [v13 localizedStringForKey:@"SUMMARIZATION_EXPLANATION_SHORT" value:&stru_419A0 table:@"NotificationsSettings"];
        [v12 setProperty:v14 forKey:PSFooterTextGroupKey];
      }
      objc_msgSend(v5, "bs_safeAddObject:", v12);
    }
    objc_msgSend(v5, "bs_safeAddObject:", v6);
    objc_msgSend(v5, "bs_safeAddObject:", v7);
    objc_msgSend(v5, "bs_safeAddObject:", v9);
  }

  return v5;
}

- (id)_contentPreviewSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:64];
  if (v5)
  {
    v26 = v5;
    id v24 = objc_alloc((Class)NSMutableArray);
    uint64_t v25 = self;
    id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    uint64_t v7 = [v6 localizedStringForKey:@"SHOW_PREVIEW_OPTION_ALWAYS" value:&stru_419A0 table:@"NotificationsSettings"];
    v27[0] = v7;
    uint64_t v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    unsigned int v9 = [v8 localizedStringForKey:@"SHOW_PREVIEW_OPTION_UNLOCKED" value:&stru_419A0 table:@"NotificationsSettings"];
    v27[1] = v9;
    v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    long long v11 = [v10 localizedStringForKey:@"SHOW_PREVIEW_OPTION_NEVER" value:&stru_419A0 table:@"NotificationsSettings"];
    v27[2] = v11;
    long long v12 = +[NSArray arrayWithObjects:v27 count:3];
    id v13 = [v24 initWithArray:v12];

    uint64_t v14 = +[NSNumber numberWithInteger:v25->_globalContentPreviewSetting];
    id v15 = [&off_44808 indexOfObject:v14];

    v16 = [v13 objectAtIndex:v15];
    v17 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v18 = [v17 localizedStringForKey:@"SHOW_PREVIEWS_DEFAULT" value:&stru_419A0 table:@"NotificationsSettings"];
    uint64_t v19 = [v16 stringByAppendingString:v18];
    [v13 setObject:v19 atIndexedSubscript:v15];

    unsigned __int8 v20 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v21 = [v20 localizedStringForKey:@"SHOW_PREVIEWS" value:&stru_419A0 table:@"NotificationsSettings"];
    id v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:v25 set:"setShowsMessagePreview:specifier:" get:"showsMessagePreview:" detail:objc_opt_class() cell:2 edit:0];

    [v22 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    [v22 setIdentifier:@"SHOW_PREVIEW_APP_ID"];
    [v22 setValues:&off_44808 titles:v13];
    [v22 setProperty:&__kCFBooleanFalse forKey:PSDeferItemSelectionKey];
    [v22 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

    id v5 = v26;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)_notificationGroupingGroupSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 authorizationStatus] != (char *)&dword_0 + 1
    || [v4 criticalAlertSetting] == (char *)&dword_0 + 2)
  {
    id v6 = [(BulletinBoardAppDetailController *)self _notificationGroupingSpecifierForSectionInfo:v4];
    if (v6)
    {
      uint64_t v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v8 = [v7 localizedStringForKey:@"LOCK_SCREEN_APPEARANCE" value:&stru_419A0 table:@"NotificationsSettings"];
      unsigned int v9 = +[PSSpecifier groupSpecifierWithID:@"NOTIFICATION_GROUPING_GROUP_ID" name:v8];

      objc_msgSend(v5, "bs_safeAddObject:", v9);
    }
    objc_msgSend(v5, "bs_safeAddObject:", v6);
  }

  return v5;
}

- (id)_notificationGroupingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parentSection];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v18 = objc_alloc((Class)NSMutableArray);
    uint64_t v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_GROUPING_OPTION_AUTOMATIC" value:&stru_419A0 table:@"NotificationsSettings"];
    v20[0] = v8;
    unsigned int v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v10 = [v9 localizedStringForKey:@"NOTIFICATION_GROUPING_OPTION_BYAPP" value:&stru_419A0 table:@"NotificationsSettings"];
    v20[1] = v10;
    +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    long long v11 = v19 = self;
    long long v12 = [v11 localizedStringForKey:@"NOTIFICATION_GROUPING_OPTION_OFF" value:&stru_419A0 table:@"NotificationsSettings"];
    v20[2] = v12;
    id v13 = +[NSArray arrayWithObjects:v20 count:3];
    id v14 = [v18 initWithArray:v13];

    id v15 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v16 = [v15 localizedStringForKey:@"NOTIFICATION_GROUPING" value:&stru_419A0 table:@"NotificationsSettings"];
    id v6 = +[PSSpecifier preferenceSpecifierNamed:v16 target:v19 set:"setNotificationGrouping:specifier:" get:"notificationGrouping:" detail:objc_opt_class() cell:2 edit:0];

    [v6 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    [v6 setIdentifier:@"NOTIFICATION_GROUPING_APP_ID"];
    [v6 setValues:&off_44820 titles:v14];
    [v6 setProperty:&__kCFBooleanFalse forKey:PSDeferItemSelectionKey];
  }

  return v6;
}

- (id)_summarizationSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:0x20000];
  if (v5
    && [v4 authorizationStatus] != (char *)&dword_0 + 1
    && [v5 summarizationSetting]
    && (+[NCSettingsGatewayController sharedInstance],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = (char *)[v6 effectiveGlobalSummarizationSetting],
        v6,
        v7 == (unsigned char *)&dword_0 + 2))
  {
    uint64_t v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    unsigned int v9 = [v8 localizedStringForKey:@"SUMMARIZE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setSummarizationSetting:specifier:" get:"summarizationSetting:" detail:0 cell:6 edit:0];

    [v10 setIdentifier:@"SUMMARIZATION_ID"];
    [v10 setProperty:v5 forKey:@"BBSECTION_INFO_KEY"];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setSummarizationSetting:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v9 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  LODWORD(a4) = [v6 BOOLValue];

  if (a4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v9 setSummarizationSetting:v7];
  uint64_t v8 = [v9 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v9 forSectionID:v8];
}

- (id)summarizationSetting:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 summarizationSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (id)_spokenNotificationsSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:1024];
  if (v5
    && [v4 authorizationStatus] != (char *)&dword_0 + 1
    && [v5 announceSetting]
    && (+[NCSettingsGatewayController sharedInstance],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = (char *)[v6 effectiveGlobalAnnounceSetting],
        v6,
        v7 == (unsigned char *)&dword_0 + 2)
    && ![(BulletinBoardAppDetailController *)self _areAlwaysDeliverImmediatelyNotificationsNotEnabledForScheduledDeliveryForSectionInfo:v4])
  {
    v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    long long v11 = [v10 localizedStringForKey:@"SPOKEN_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    uint64_t v8 = +[NCSpokenNotificationsAppDetailController spokenNotificationsSpecifierNamed:v11 sectionInfo:v5 showIcon:0 class:objc_opt_class()];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_customSettings:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parentSection];
  if (v5
    || [v4 authorizationStatus] == (char *)&dword_0 + 1
    && [v4 criticalAlertSetting] != (char *)&dword_0 + 2)
  {
    id v6 = 0;
    goto LABEL_15;
  }
  id v6 = +[NSMutableArray array];
  uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"CUSTOM_SETTINGS_GROUP_ID"];
  [v6 addObject:v7];
  uint64_t v8 = [v4 customSettingsBundle];

  if (v8)
  {
    id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v10 = [v9 localizedStringForKey:@"CUSTOM_SETTINGS" value:&stru_419A0 table:@"NotificationsSettings"];
    long long v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:2 edit:0];

    long long v12 = [v4 customSettingsBundle];
    id v13 = PSBundlePathForPreferenceBundle();
    [v11 setProperty:v13 forKey:PSLazilyLoadedBundleKey];

    id v14 = [v4 customSettingsDetailControllerClass];
    [v11 setProperty:v14 forKey:PSDetailControllerClassKey];

    [v11 setProperty:&__kCFBooleanTrue forKey:PSBundleOverridePrincipalClassKey];
    [v11 setProperty:@"custom" forKey:PSIDKey];
    [v11 setControllerLoadAction:"lazyLoadBundle:"];
  }
  else
  {
    id v15 = [v4 subsections];
    id v16 = [v15 count];

    if (!v16) {
      goto LABEL_10;
    }
    v17 = [v4 sectionID];
    [v17 isEqualToString:@"com.apple.mobilemail"];
    uint64_t v18 = objc_opt_class();

    uint64_t v19 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    unsigned __int8 v20 = [v19 localizedStringForKey:@"CUSTOM_SETTINGS" value:&stru_419A0 table:@"NotificationsSettings"];
    long long v11 = +[PSSpecifier preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:v18 cell:2 edit:0];

    [v11 setProperty:@"custom" forKey:PSIDKey];
    [v11 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
  }
  [v6 addObject:v11];

LABEL_10:
  if ([v4 showsCustomSettingsLink])
  {
    uint64_t v21 = [v4 appName];
    if (v21)
    {
      id v22 = (void *)v21;
      uint64_t v23 = [v4 sectionID];
      id v24 = +[LSApplicationProxy applicationProxyForIdentifier:v23];
      uint64_t v25 = [v24 appState];
      unsigned int v26 = [v25 isValid];

      if (v26)
      {
        v27 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        v28 = [v27 localizedStringForKey:@"APP_SETTINGS_LINK" value:&stru_419A0 table:@"NotificationsSettings"];
        v29 = [v4 appName];
        id v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v29);

        v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:0 cell:13 edit:0];
        [v31 setButtonAction:"_openAppNotificationSettings:"];
        [v31 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
        [v31 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
        [v6 addObject:v31];
      }
    }
  }

LABEL_15:

  return v6;
}

- (void)_openAppNotificationSettings:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = [v3 sectionID];
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = objc_alloc_init((Class)UINotificationSettingsAction);
  id v10 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
  [v5 setObject:v7 forKey:FBSOpenApplicationOptionKeyActions];

  uint64_t v8 = +[FBSOpenApplicationOptions optionsWithDictionary:v5];
  id v9 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  [v9 openApplication:v4 withOptions:v8 completion:0];
}

- (id)_effectiveSectionInfoForSectionInfo:(id)a3 passingTest:(id)a4
{
  id v5 = a3;
  id v6 = (unsigned int (**)(id, void *))a4;
  if (v6[2](v6, v5))
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v5 parentSection];
    id v9 = [v8 subsections];
    id v10 = (char *)[v9 count];

    if (v10 == (unsigned char *)&dword_0 + 1 && v6[2](v6, v8)) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_effectiveSectionInfoForSectionInfo:(id)a3 setting:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10938;
  v6[3] = &unk_410E0;
  v6[4] = a4;
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 passingTest:v6];

  return v4;
}

- (id)_effectiveSectionInfoForSectionInfo:(id)a3 setting:(unint64_t)a4 pushSetting:(unint64_t)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_109EC;
  v7[3] = &unk_41100;
  v7[4] = a4;
  v7[5] = a5;
  id v5 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 passingTest:v7];

  return v5;
}

- (id)_allowsNotificationsSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parentSection];
  id v6 = [v5 subsections];
  if ([v6 count] == (char *)&dword_0 + 1) {
    id v7 = v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  id v9 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v10 = [v9 localizedStringForKey:@"ALLOW_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
  long long v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setAllowNotifications:specifier:" get:"allowNotifications:" detail:0 cell:6 edit:0];

  if ([(BulletinBoardAppDetailController *)self isApplicationHiddenForSectionInfo:v4])
  {
    [v8 setAllowsNotifications:0];
    [v11 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }
  [v11 setIdentifier:@"ALLOW_NOTIFICATIONS_ID"];
  [v11 setProperty:v8 forKey:@"BBSECTION_INFO_KEY"];
  [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v11;
}

- (id)_soundSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 setting:0x4000 pushSetting:2];
  if (v4)
  {
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v6 = [v5 localizedStringForKey:@"SOUNDS" value:&stru_419A0 table:@"NotificationsSettings"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setSounds:specifier:" get:"sounds:" detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"SOUNDS_ID"];
    [v7 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_customSoundSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  if (([v4 suppressedSettings] & 0x4000) != 0
    || ([v4 sectionID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = +[TLAlert bb_toneLibraryAlertTypeForSectionID:v5], v5, !v6))
  {
    id v9 = 0;
  }
  else
  {
    id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v8 = [v7 localizedStringForKey:@"SOUNDS" value:&stru_419A0 table:@"NotificationsSettings"];
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"detailTextForToneWithSpecifier:" detail:objc_opt_class() cell:2 edit:0];

    [v9 setIdentifier:@"SOUND_SUBSTITUTE_ID"];
    [v9 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    id v10 = NSStringFromTLAlertType();
    [v9 setProperty:v10 forKey:@"alertType"];

    long long v11 = [v4 subsectionID];
    [v9 setProperty:v11 forKey:@"accountIdentifier"];
  }

  return v9;
}

- (id)_badgesSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 setting:0x2000 pushSetting:1];
  if (v4)
  {
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v6 = [v5 localizedStringForKey:@"BADGES" value:&stru_419A0 table:@"NotificationsSettings"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setBadges:specifier:" get:"badges:" detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"BADGES"];
    [v7 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_alertDeliveryTypeSettingsSpecifierForSectionInfo:(id)a3
{
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 passingTest:&stru_41120];
  if (v4)
  {
    id v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setAlertDeliveryDescriptor:specifier:" get:"alertDeliveryDescriptor:" detail:0 cell:-1 edit:0];
    [v5 setIdentifier:@"DELIVERY_TYPE_ID"];
    [v5 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_notificationCenterSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 passingTest:&stru_41140];
  if (v4)
  {
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v6 = [v5 localizedStringForKey:@"HISTORY_DESTINATION" value:&stru_419A0 table:@"NotificationsSettings"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setNotificationCenterSetting:specifier:" get:"notificationCenterSetting:" detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"HISTORY"];
    [v7 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_bannerSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 passingTest:&stru_41160];
  if (v4)
  {
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v6 = [v5 localizedStringForKey:@"BANNER_DESTINATION" value:&stru_419A0 table:@"NotificationsSettings"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setBannerSetting:specifier:" get:"bannerSetting:" detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"BANNERS"];
    [v7 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_bannerStyleSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:a3 passingTest:&stru_41180];
  if (v4)
  {
    id v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v6 = [v5 localizedStringForKey:@"BANNER_STYLE" value:&stru_419A0 table:@"NotificationsSettings"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setBannerStyle:specifier:" get:"bannerStyle:" detail:objc_opt_class() cell:2 edit:0];

    id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v9 = [v8 localizedStringForKey:@"BANNER_TEMPORARY_LABEL" value:&stru_419A0 table:@"NotificationsSettings"];
    v14[0] = v9;
    id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    long long v11 = [v10 localizedStringForKey:@"BANNER_PERSISTENT_LABEL" value:&stru_419A0 table:@"NotificationsSettings"];
    v14[1] = v11;
    long long v12 = +[NSArray arrayWithObjects:v14 count:2];

    [v7 setIdentifier:@"BANNER_STYLE_ID"];
    [v7 setValues:&off_44838 titles:v12];
    [v7 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
    [v7 setProperty:&__kCFBooleanFalse forKey:PSDeferItemSelectionKey];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_carPlaySettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  if ([v4 carPlaySetting])
  {
    id v5 = objc_alloc_init((Class)CRPairedVehicleManager);
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_11878;
    id v16 = sub_11888;
    id v17 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_11890;
    v11[3] = &unk_411A8;
    v11[4] = &v12;
    [v5 syncFetchAllVehiclesWithCompletion:v11];
    if ([(id)v13[5] count])
    {
      id v6 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:128];
      if (v6)
      {
        id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        id v8 = [v7 localizedStringForKey:@"VIEW_IN_CARPLAY" value:&stru_419A0 table:@"NotificationsSettings"];
        id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setViewInCarPlay:specifier:" get:"viewInCarPlay:" detail:0 cell:6 edit:0];

        [v9 setIdentifier:@"VIEW_IN_CARPLAY_ID"];
        [v9 setProperty:v6 forKey:@"BBSECTION_INFO_KEY"];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_remoteNotificationsSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  if ([v4 remoteNotificationsSetting]
    && _os_feature_enabled_impl()
    && (+[UIDevice currentDevice],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 userInterfaceIdiom],
        v5,
        !v6)
    && +[NCRemoteNotificationsManager featureIsAvailable])
  {
    id v7 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:0x10000];
    if (v7)
    {
      id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v9 = [v8 localizedStringForKey:@"ALLOW_REMOTE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
      id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setAllowRemoteNotifications:specifier:" get:"allowRemoteNotifications:" detail:0 cell:6 edit:0];

      [v10 setIdentifier:@"ALLOW_REMOTE_NOTIFICATIONS_ID"];
      [v10 setProperty:v7 forKey:@"BBSECTION_INFO_KEY"];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_criticalAlertSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  if ([v4 criticalAlertSetting])
  {
    id v5 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:256];
    if (v5)
    {
      id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v7 = [v6 localizedStringForKey:@"CRITICAL_ALERTS" value:&stru_419A0 table:@"NotificationsSettings"];
      id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setCriticalAlert:specifier:" get:"criticalAlert:" detail:0 cell:6 edit:0];

      [v8 setIdentifier:@"ALLOW_CRITICAL_ALERTS_ID"];
      [v8 setProperty:v5 forKey:@"BBSECTION_INFO_KEY"];
      id v9 = +[UIImage systemImageNamed:@"exclamationmark.triangle.fill"];
      id v10 = +[UIColor systemRedColor];
      long long v11 = [v9 imageWithTintColor:v10 renderingMode:1];

      [v8 setProperty:v11 forKey:PSIconImageKey];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_timeSensitiveSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  if ([v4 timeSensitiveSetting] && objc_msgSend(v4, "authorizationStatus") != (char *)&dword_0 + 1)
  {
    id v6 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:2048];
    if (v6)
    {
      id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v8 = [v7 localizedStringForKey:@"TIME_SENSITIVE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
      id v5 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setTimeSensitiveSetting:specifier:" get:"timeSensitiveSetting:" detail:0 cell:6 edit:0];

      [v5 setIdentifier:@"TIME_SENSITIVE_NOTIFICATIONS_ID"];
      [v5 setProperty:v6 forKey:@"BBSECTION_INFO_KEY"];
      [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
      id v9 = +[UIImage systemImageNamed:@"clock.fill"];
      id v10 = +[UIColor systemYellowColor];
      long long v11 = [v9 imageWithTintColor:v10 renderingMode:1];

      [v5 setProperty:v11 forKey:PSIconImageKey];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_directMessagesSettingSpecifierForSectionInfo:(id)a3
{
  id v4 = a3;
  if (!-[BulletinBoardAppDetailController isEffectiveGlobalScheduledDeliverySettingEnabled](self, "isEffectiveGlobalScheduledDeliverySettingEnabled")|| [v4 scheduledDeliverySetting] == (char *)&dword_0 + 1|| objc_msgSend(v4, "authorizationStatus") == (char *)&dword_0 + 1|| !objc_msgSend(v4, "directMessagesSetting"))
  {
    id v8 = 0;
  }
  else
  {
    id v5 = [(BulletinBoardAppDetailController *)self _effectiveSectionInfoForSectionInfo:v4 setting:0x8000];
    if (v5)
    {
      id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v7 = [v6 localizedStringForKey:@"DIRECT_MESSAGES" value:&stru_419A0 table:@"NotificationsSettings"];
      id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setDirectMessagesSetting:specifier:" get:"directMessagesSetting:" detail:0 cell:6 edit:0];

      [v8 setIdentifier:@"DIRECT_MESSAGES_ID"];
      [v8 setProperty:v5 forKey:@"BBSECTION_INFO_KEY"];
      id v9 = +[UIImage systemImageNamed:@"message.fill"];
      [v8 setProperty:v9 forKey:PSIconImageKey];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_updateBannerStyleForSectionInfo:(id)a3 animated:(BOOL)a4
{
}

- (void)_updateBannerStyleForSectionInfo:(id)a3 animated:(BOOL)a4 forSpecifiers:(id)a5
{
  BOOL v6 = a4;
  id v19 = a3;
  id v8 = a5;
  id v9 = v8;
  if (!v8) {
    id v9 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  }
  id v10 = v9;
  long long v11 = v10;
  p_bannerStyleSpecifier = &self->_bannerStyleSpecifier;
  bannerStyleSpecifier = self->_bannerStyleSpecifier;
  if (bannerStyleSpecifier)
  {
    uint64_t v14 = bannerStyleSpecifier;
  }
  else
  {
    uint64_t v14 = [v10 specifierForID:@"BANNER_STYLE_ID"];
    if (!v14) {
      goto LABEL_14;
    }
  }
  objc_storeStrong((id *)&self->_bannerStyleSpecifier, v14);
  id v15 = +[PSSpecifierUpdates updatesWithSpecifiers:v11];
  if ([v19 alertType])
  {
    id v16 = [v11 specifierForID:@"BANNER_STYLE_ID"];

    if (!v16) {
      [v15 insertSpecifier:*p_bannerStyleSpecifier afterSpecifierWithID:@"DELIVERY_TYPE_ID"];
    }
  }
  else
  {
    [v15 removeSpecifier:*p_bannerStyleSpecifier];
  }
  if (v8)
  {
    id v17 = [v15 currentSpecifiers];
    [v8 setArray:v17];
  }
  else
  {
    uint64_t v18 = [v15 context];
    [v18 setAnimated:v6];

    [(BulletinBoardAppDetailController *)self performSpecifierUpdates:v15];
  }

LABEL_14:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BulletinBoardAppDetailController *)self specifierForID:@"DELIVERY_TYPE_ID"];
  id v9 = [(BulletinBoardAppDetailController *)self indexPathForSpecifier:v8];
  unsigned int v10 = [v9 isEqual:v7];

  if (v10)
  {
    [v6 bounds];
    double v12 = v11;
    [v6 _sectionContentInset];
    +[AlertDeliveryTypeCell preferredHeightInWidth:v12 - v13 - v14];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BulletinBoardAppDetailController;
    [(BulletinBoardAppDetailController *)&v18 tableView:v6 heightForRowAtIndexPath:v7];
  }
  double v16 = v15;

  return v16;
}

- (id)allowNotifications:(id)a3
{
  id v4 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 allowsNotifications] & ~-[BulletinBoardAppDetailController isApplicationHiddenForSectionInfo:](self, "isApplicationHiddenForSectionInfo:", v4));

  return v5;
}

- (void)setAllowNotifications:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v6 propertyForKey:@"BBSECTION_INFO_KEY"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v11 setAuthorizationStatus:v9];
  [v6 setProperty:v11 forKey:@"BBSECTION_INFO_KEY"];

  unsigned int v10 = [v11 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v11 forSectionID:v10];

  [(BulletinBoardAppDetailController *)self reloadSpecifiers];
}

- (id)alertDeliveryDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AlertDeliveryTypeDescriptor);
  id v5 = [v3 propertyForKey:@"BBSECTION_INFO_KEY"];

  unsigned __int8 v6 = [v5 suppressedSettings];
  unsigned __int8 v7 = [v5 pushSettings];
  if ((v6 & 2) != 0)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    -[AlertDeliveryTypeDescriptor setLockScreenSetting:](v4, "setLockScreenSetting:", [v5 lockScreenSetting]);
    if (v6)
    {
LABEL_3:
      if ((v6 & 0x20) != 0) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
  }
  -[AlertDeliveryTypeDescriptor setNotificationCenterSetting:](v4, "setNotificationCenterSetting:", [v5 notificationCenterSetting]);
  if ((v6 & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_7:
  if ((v7 & 4) != 0)
  {
    if ([v5 alertType]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [(AlertDeliveryTypeDescriptor *)v4 setBannerSetting:v8];
  }
LABEL_12:

  return v4;
}

- (void)setAlertDeliveryDescriptor:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  if ([v7 authorizationStatus] == (char *)&dword_0 + 3) {
    [v7 setAuthorizationStatus:2];
  }
  id v11 = v6;
  if ([v11 lockScreenSetting]) {
    objc_msgSend(v7, "setLockScreenSetting:", objc_msgSend(v11, "lockScreenSetting"));
  }
  if ([v11 notificationCenterSetting]) {
    objc_msgSend(v7, "setNotificationCenterSetting:", objc_msgSend(v11, "notificationCenterSetting"));
  }
  if ([v11 bannerSetting])
  {
    id v8 = [v7 alertType];
    if ([v11 bannerSetting] == (char *)&dword_0 + 2)
    {
      if (v8) {
        id savedBannersAlertType = [v7 alertType];
      }
      else {
        id savedBannersAlertType = self->_savedBannersAlertType;
      }
    }
    else
    {
      id savedBannersAlertType = 0;
    }
    [v7 setAlertType:savedBannersAlertType];
  }
  unsigned int v10 = [v7 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v7 forSectionID:v10];

  [(BulletinBoardAppDetailController *)self _updateBannerStyleForSectionInfo:v7 animated:1];
}

- (id)bannerStyle:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 alertType]);

  return v4;
}

- (void)setBannerStyle:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v6 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  if ([v6 authorizationStatus] == (char *)&dword_0 + 3) {
    [v6 setAuthorizationStatus:2];
  }
  id v7 = [v9 integerValue];
  if (!v7) {
    self->_id savedBannersAlertType = (unint64_t)[v6 alertType];
  }
  [v6 setAlertType:v7];
  id v8 = [v6 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v6 forSectionID:v8];
}

- (id)viewInCarPlay:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 carPlaySetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setViewInCarPlay:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v6 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  if ([v6 authorizationStatus] == (char *)&dword_0 + 3) {
    [v6 setAuthorizationStatus:2];
  }
  if ([v9 BOOLValue]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 setCarPlaySetting:v7];
  id v8 = [v6 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v6 forSectionID:v8];
}

- (id)allowRemoteNotifications:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 remoteNotificationsSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setAllowRemoteNotifications:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  id v6 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  if ([v6 authorizationStatus] == (char *)&dword_0 + 3) {
    [v6 setAuthorizationStatus:2];
  }
  if ([v9 BOOLValue]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v6 setRemoteNotificationsSetting:v7];
  id v8 = [v6 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v6 forSectionID:v8];
}

- (id)criticalAlert:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 criticalAlertSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setCriticalAlert:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v9 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  LODWORD(a4) = [v6 BOOLValue];

  if (a4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v9 setCriticalAlertSetting:v7];
  id v8 = [v9 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v9 forSectionID:v8];
}

- (id)timeSensitiveSetting:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 timeSensitiveSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setTimeSensitiveSetting:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v9 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  LODWORD(a4) = [v6 BOOLValue];

  if (a4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v9 setTimeSensitiveSetting:v7];
  [v9 setUserConfiguredTimeSensitiveSetting:1];
  id v8 = [v9 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v9 forSectionID:v8];
}

- (id)directMessagesSetting:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 directMessagesSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setDirectMessagesSetting:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v9 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  LODWORD(a4) = [v6 BOOLValue];

  if (a4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v9 setDirectMessagesSetting:v7];
  id v8 = [v9 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v9 forSectionID:v8];
}

- (id)notificationCenterSetting:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 notificationCenterSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setNotificationCenterSetting:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v9 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  LODWORD(a4) = [v6 BOOLValue];

  if (a4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v9 setNotificationCenterSetting:v7];
  id v8 = [v9 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v9 forSectionID:v8];
}

- (id)bannerSetting:(id)a3
{
  id v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 alertType] != 0);

  return v4;
}

- (void)setBannerSetting:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v11 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v7 = [v11 alertType];
  unsigned int v8 = [v6 BOOLValue];

  if (v8)
  {
    if (v7) {
      id savedBannersAlertType = [v11 alertType];
    }
    else {
      id savedBannersAlertType = self->_savedBannersAlertType;
    }
  }
  else
  {
    id savedBannersAlertType = 0;
  }
  [v11 setAlertType:savedBannersAlertType];
  unsigned int v10 = [v11 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v11 forSectionID:v10];

  [(BulletinBoardAppDetailController *)self _updateBannerStyleForSectionInfo:v11 animated:1];
}

- (id)_valueOfNotificationType:(unint64_t)a3 forSectionInfo:(id)a4
{
  BOOL v4 = ((unint64_t)[a4 pushSettings] & a3) != 0;

  return +[NSNumber numberWithBool:v4];
}

- (id)sounds:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v5 = [(BulletinBoardAppDetailController *)self _valueOfNotificationType:16 forSectionInfo:v4];

  return v5;
}

- (id)badges:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v5 = [(BulletinBoardAppDetailController *)self _valueOfNotificationType:8 forSectionInfo:v4];

  return v5;
}

- (void)_setValue:(id)a3 notificationType:(unint64_t)a4 forSectionInfo:(id)a5
{
  id v13 = a5;
  id v8 = a3;
  if ([v13 authorizationStatus] == (char *)&dword_0 + 3) {
    [v13 setAuthorizationStatus:2];
  }
  unint64_t v9 = (unint64_t)[v13 pushSettings];
  unsigned int v10 = [v8 BOOLValue];

  if (v10) {
    unint64_t v11 = v9 | a4;
  }
  else {
    unint64_t v11 = v9 & ~a4;
  }
  [v13 setPushSettings:v11];
  double v12 = [v13 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v13 forSectionID:v12];
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v7 = a3;
  if ([v7 authorizationStatus] == &dword_4)
  {
    [v7 setAuthorizationStatus:2];
    [(BulletinBoardAppDetailController *)self reloadSpecifierID:@"ALLOW_NOTIFICATIONS_ID"];
  }
  id v5 = +[NCSettingsGatewayController sharedInstance];
  id v6 = [v7 sectionID];
  [v5 setSectionInfo:v7 forSectionID:v6];
}

- (void)_updateSpecifiersWithSectionInfo:(id)a3
{
  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] setProperty:a3 forKey:@"BBSECTION_INFO_KEY"];

  [(BulletinBoardAppDetailController *)self reloadSpecifiers];
}

- (void)setSounds:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  [(BulletinBoardAppDetailController *)self _setValue:v6 notificationType:16 forSectionInfo:v7];
}

- (void)setBadges:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  [(BulletinBoardAppDetailController *)self _setValue:v6 notificationType:8 forSectionInfo:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BulletinBoardAppDetailController;
  [(BulletinBoardAppDetailController *)&v4 viewDidAppear:a3];
  [(BulletinBoardAppDetailController *)self emitNavigationEventForAppDetailController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appDetailControllerWillDisappear:self];

  v6.receiver = self;
  v6.super_class = (Class)BulletinBoardAppDetailController;
  [(BulletinBoardAppDetailController *)&v6 viewWillDisappear:v3];
}

- (BOOL)isApplicationLockedForSectionInfo:(id)a3
{
  BOOL v3 = [a3 sectionID];
  objc_super v4 = +[APApplication applicationWithBundleIdentifier:v3];
  unsigned __int8 v5 = [v4 isLocked];

  return v5;
}

- (BOOL)isApplicationHiddenForSectionInfo:(id)a3
{
  BOOL v3 = [a3 sectionID];
  objc_super v4 = +[APApplication applicationWithBundleIdentifier:v3];
  unsigned __int8 v5 = [v4 isHidden];

  return v5;
}

- (void)_updateNotificationDeliverySettingForSpecifier:(id)a3
{
  id v11 = a3;
  objc_super v4 = [v11 propertyForKey:@"BBSECTION_INFO_KEY"];
  unsigned __int8 v5 = [v11 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:@"NOTIFICATION_DELIVERY_IMMEDIATE_ID"];

  if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v8 = [v11 identifier];
    unsigned int v9 = [v8 isEqualToString:@"NOTIFICATION_DELIVERY_SCHEDULED_ID"];

    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v7 = 2;
  }
  [v4 setScheduledDeliverySetting:v7];
LABEL_6:
  unsigned int v10 = [v4 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v4 forSectionID:v10];
}

- (BOOL)isEffectiveGlobalScheduledDeliverySettingEnabled
{
  v2 = +[NCSettingsGatewayController sharedInstance];
  BOOL v3 = (char *)[v2 effectiveGlobalScheduledDeliverySetting];

  return v3 == (unsigned char *)&dword_0 + 2;
}

- (void)tappedEditSchedule:(id)a3
{
  unsigned int v9 = objc_alloc_init(NCScheduledDeliverySettingsController);
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v9];
  unsigned __int8 v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  unsigned __int8 v6 = [v5 localizedStringForKey:@"SCHEDULED_DELIVERY" value:&stru_419A0 table:@"NotificationsSettings"];
  [(NCScheduledDeliverySettingsController *)v9 setTitle:v6];

  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"editScheduleDismissed:"];
  id v8 = [(NCScheduledDeliverySettingsController *)v9 navigationItem];
  [v8 setRightBarButtonItem:v7];

  [(BulletinBoardAppDetailController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)editScheduleDismissed:(id)a3
{
  [(BulletinBoardAppDetailController *)self reloadSpecifiers];

  [(BulletinBoardAppDetailController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_areAlwaysDeliverImmediatelyNotificationsNotEnabledForScheduledDeliveryForSectionInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[BulletinBoardAppDetailController isEffectiveGlobalScheduledDeliverySettingEnabled](self, "isEffectiveGlobalScheduledDeliverySettingEnabled")&& [v4 scheduledDeliverySetting] == (char *)&dword_0 + 2&& objc_msgSend(v4, "timeSensitiveSetting") != (char *)&dword_0 + 2&& objc_msgSend(v4, "directMessagesSetting") != (char *)&dword_0 + 2;

  return v5;
}

- (id)detailTextForToneWithSpecifier:(id)a3
{
  return NCDetailStringForCustomToneSpecifier(a3);
}

- (void)setShowsMessagePreview:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [v6 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v8 = [v7 integerValue];

  if (v8 == self->_globalContentPreviewSetting) {
    id v9 = 0;
  }
  else {
    id v9 = v8;
  }
  [v11 setContentPreviewSetting:v9];
  unsigned int v10 = [v11 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v11 forSectionID:v10];

  [v6 setProperty:v11 forKey:@"BBSECTION_INFO_KEY"];
}

- (id)showsMessagePreview:(id)a3
{
  id v4 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id globalContentPreviewSetting = [v4 contentPreviewSetting];
  if (!globalContentPreviewSetting) {
    id globalContentPreviewSetting = self->_globalContentPreviewSetting;
  }
  id v6 = +[NSNumber numberWithInteger:globalContentPreviewSetting];

  return v6;
}

- (void)setNotificationGrouping:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [v6 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v8 = [v7 integerValue];

  [v10 setBulletinGroupingSetting:v8];
  id v9 = [v10 sectionID];
  [(BulletinBoardAppDetailController *)self setSectionInfo:v10 forSectionID:v9];

  [v6 setProperty:v10 forKey:@"BBSECTION_INFO_KEY"];
}

- (id)notificationGrouping:(id)a3
{
  BOOL v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 bulletinGroupingSetting]);

  return v4;
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BulletinBoardAppDetailController;
  BOOL v5 = [(BulletinBoardAppDetailController *)&v7 selectSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v5 setDelegate:self];
  }
  +[BulletinBoardAppDetailController emitNavigationEventForSpecifier:v4 viewController:v5];

  return v5;
}

- (void)appDetailControllerWillDisappear:(id)a3
{
  id v4 = [a3 specifier];
  [(BulletinBoardAppDetailController *)self reloadSpecifier:v4];
}

- (void)didChangeSettingForSpokenNotificationsAppDetailController:(id)a3 withSpecifierIdentifier:(id)a4
{
}

- (void)settingsGateway:(id)a3 didUpdateSectionInfo:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13BF0;
  v5[3] = &unk_40D08;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)emitNavigationEventForAppDetailController
{
  BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v4 = [v3 bundleURL];

  if (v4)
  {
    BOOL v5 = self->_savedSectionInfo;
    id v6 = [(BBSectionInfo *)v5 sectionID];
    uint64_t v7 = [(BBSectionInfo *)v5 displayName];
    id v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      id v10 = +[NSURL URLWithString:kNotificationSettingsDeepLinkURLString];
      id v11 = [v10 URLByAppendingPathComponent:v6];

      id v12 = objc_alloc((Class)_NSLocalizedStringResource);
      id v13 = kNotificationsSettingsLocalizedStringsTable;
      double v14 = +[NSLocale currentLocale];
      id v15 = [v12 initWithKey:@"APP_NAME_IN_DEFAULT_VALUE" defaultValue:v8 table:v13 locale:v14 bundleURL:v4];

      double v16 = kNotificationsSettingsGraphicIcon;
      id v18 = v15;
      id v17 = +[NSArray arrayWithObjects:&v18 count:1];
      [(BulletinBoardAppDetailController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:v16 title:v15 localizedNavigationComponents:v17 deepLink:v11];
    }
  }
}

+ (void)emitNavigationEventForSpecifier:(id)a3 viewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  if ([v7 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = v6;
    BOOL v9 = [v5 identifier];
    id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v11 = [v10 bundleURL];

    if (v9 && v11)
    {
      id v12 = [v5 propertyForKey:@"BBSECTION_INFO_KEY"];
      id v13 = [v12 sectionID];
      uint64_t v14 = [v12 displayName];
      id v15 = (void *)v14;
      if (v13 && v14)
      {
        double v16 = +[NSURL URLWithString:kNotificationSettingsDeepLinkURLString];
        id v17 = [v16 URLByAppendingPathComponent:v13];

        id v18 = [v17 URLByAppendingPathComponent:v9];

        v38[0] = @"BANNER_STYLE_ID";
        v38[1] = @"SOUND_SUBSTITUTE_ID";
        v39[0] = @"BANNER_STYLE";
        v39[1] = @"SOUNDS";
        v38[2] = @"SHOW_PREVIEW_APP_ID";
        v38[3] = @"NOTIFICATION_GROUPING_APP_ID";
        v39[2] = @"SHOW_PREVIEWS";
        v39[3] = @"NOTIFICATION_GROUPING";
        id v19 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
        unsigned __int8 v20 = [v19 objectForKeyedSubscript:v9];
        if (v20)
        {
          uint64_t v35 = v20;
          id v32 = v19;
          id v21 = objc_alloc((Class)_NSLocalizedStringResource);
          NSRange v36 = v15;
          id v22 = kNotificationsSettingsLocalizedStringsTable;
          +[NSLocale currentLocale];
          uint64_t v23 = v33 = v18;
          uint64_t v34 = v8;
          id v24 = [v21 initWithKey:@"APP_NAME_IN_DEFAULT_VALUE" defaultValue:v36 table:v22 locale:v23 bundleURL:v11];

          id v25 = objc_alloc((Class)_NSLocalizedStringResource);
          unsigned int v26 = kNotificationsSettingsLocalizedStringsTable;
          v27 = +[NSLocale currentLocale];
          id v28 = [v25 initWithKey:v35 table:v26 locale:v27 bundleURL:v11];

          v29 = kNotificationsSettingsGraphicIcon;
          v37[0] = v24;
          v37[1] = v28;
          id v30 = +[NSArray arrayWithObjects:v37 count:2];
          v31 = v29;
          id v18 = v33;
          objc_msgSend(v34, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", v31, v28, v30, v33);

          id v19 = v32;
          id v15 = v36;

          id v8 = v34;
          unsigned __int8 v20 = v35;
        }
      }
    }
  }
}

- (BulletinBoardAppDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BulletinBoardAppDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bannerStyleSpecifier, 0);
  objc_storeStrong((id *)&self->_savedSectionInfo, 0);
  objc_storeStrong((id *)&self->_showPreviewCriticalAlertsSpecifier, 0);
  objc_storeStrong((id *)&self->_disallowedStateHiddenSpecifiers, 0);
  objc_storeStrong((id *)&self->_accountSpecifiers, 0);
  objc_storeStrong((id *)&self->_showInLockscreen, 0);

  objc_storeStrong((id *)&self->_shownItemCount, 0);
}

@end