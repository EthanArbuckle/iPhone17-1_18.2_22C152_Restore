@interface BPSNotificationAppController
- (BBSectionInfo)bbSectionInfo;
- (BOOL)_suppressSendToNotificationCenterOption;
- (BOOL)caresAboutSubsections;
- (BOOL)mirrorSettings;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)showAlerts;
- (BOOL)showPreview;
- (BOOL)suppressAlertSpecifiers;
- (BOOL)suppressAllMirrorSpecifiers;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressNotificationCoalescingOptions;
- (BOOL)suppressSendToNotificationCenterOption;
- (BOOL)wantsPreviewChoice;
- (BOOL)watchHasCapabilitySendToNotificationCenter;
- (BPSNotificationAppController)init;
- (NPSDomainAccessor)bbAppsSettings;
- (NSMutableArray)notificationApplicationSpecifiers;
- (NSMutableArray)notificationSpecifiers;
- (NSMutableDictionary)sectionInfo;
- (NSString)bundleIdentifier;
- (PSSpecifier)previewSwitchSpecifier;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)bulletinBoardSettings;
- (id)bundle;
- (id)customGroupSpecifierForDescription:(id)a3;
- (id)glanceSpecifierForIdentifier:(id)a3;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (id)localizedPreviewChoiceTitle;
- (id)localizedPreviewGroupFooter;
- (id)localizedPreviewGroupLabel;
- (id)mirroredApplicationGroupSpecifiers;
- (id)notificationGroupTitles;
- (id)notificationGroupValues;
- (id)notificationGroupingValue:(id)a3;
- (id)sectionInfoForBBSectionInfo:(id)a3;
- (id)showPreviewValue:(id)a3;
- (id)soundsValue:(id)a3;
- (id)specifiers;
- (id)vibrationValue:(id)a3;
- (int64_t)alertType;
- (unint64_t)alertingMode;
- (unint64_t)settingsMode;
- (void)_showSettingsNotifications;
- (void)removeAlertOptions;
- (void)removeMirrorOptions;
- (void)removeNotificationCoalescingOptions;
- (void)removeSendToNotificationCenterOption;
- (void)setAlertingMode:(unint64_t)a3;
- (void)setBbAppsSettings:(id)a3;
- (void)setBbSectionInfo:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setMirrorSettings:(BOOL)a3;
- (void)setNotificationApplicationSpecifiers:(id)a3;
- (void)setNotificationGroupingValue:(id)a3 specifier:(id)a4;
- (void)setSettingsMode:(unint64_t)a3;
- (void)setShowPreviewValue:(id)a3 forSpecifier:(id)a4;
- (void)setSoundsValue:(id)a3 forSpecifier:(id)a4;
- (void)setVibrationValue:(id)a3 forSpecifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSubsections;
- (void)writeSectionState;
@end

@implementation BPSNotificationAppController

- (BPSNotificationAppController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BPSNotificationAppController;
  v2 = [(BPSNotificationAppController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    notificationSpecifiers = v2->_notificationSpecifiers;
    v2->_notificationSpecifiers = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.bulletinboard.apps"];
    bbAppsSettings = v2->_bbAppsSettings;
    v2->_bbAppsSettings = (NPSDomainAccessor *)v5;
  }
  return v2;
}

- (id)bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (BOOL)caresAboutSubsections
{
  return 0;
}

- (id)bulletinBoardSettings
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (id)[(NPSDomainAccessor *)self->_bbAppsSettings synchronize];
  v4 = [(NPSDomainAccessor *)self->_bbAppsSettings dictionaryForKey:self->_bundleIdentifier];
  uint64_t v5 = (void *)[v4 mutableCopy];

  v6 = [v5 objectForKeyedSubscript:@"BPSNanoBulletinSubsections"];

  if (v6)
  {
    v7 = [v5 objectForKeyedSubscript:@"BPSNanoBulletinSubsections"];
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "mutableCopy", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v5 setObject:v8 forKeyedSubscript:@"BPSNanoBulletinSubsections"];
  }
  return v5;
}

- (id)glanceSpecifierForIdentifier:(id)a3
{
  return 0;
}

- (id)specifiers
{
  v86[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_53;
  }
  uint64_t v5 = [(BPSNotificationAppController *)self applicationBundleIdentifier];
  v6 = (NSString *)[v5 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v6;

  objc_super v8 = [(BPSNotificationAppController *)self bulletinBoardSettings];
  id v9 = [MEMORY[0x263F5B950] sharedManager];
  [v9 loadBBSections];

  bbSectionInfo = self->_bbSectionInfo;
  self->_bbSectionInfo = 0;

  if (v8)
  {
    uint64_t v11 = (NSMutableDictionary *)[v8 mutableCopy];
    sectionInfo = self->_sectionInfo;
    self->_sectionInfo = v11;
  }
  else
  {
    sectionInfo = [(BPSNotificationAppController *)self bbSectionInfo];
    v13 = [(BPSNotificationAppController *)self sectionInfoForBBSectionInfo:sectionInfo];
    v14 = self->_sectionInfo;
    self->_sectionInfo = v13;
  }
  v15 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinShowsCustomSettings"];
  long long v16 = v15;
  if (v15) {
    self->_mirrorSettings = [v15 BOOLValue] ^ 1;
  }
  else {
    [(BPSNotificationAppController *)self setMirrorSettings:[(BPSNotificationAppController *)self suppressMirrorOption] ^ 1];
  }
  if ([(BPSNotificationAppController *)self caresAboutSubsections]) {
    [(BPSNotificationAppController *)self updateSubsections];
  }
  v83 = [MEMORY[0x263EFF980] array];
  long long v17 = [MEMORY[0x263EFF980] array];
  long long v18 = [(BPSNotificationAppController *)self loadSpecifiersFromPlistName:@"AbstactApplication" target:self];
  notificationSpecifiers = self->_notificationSpecifiers;
  self->_notificationSpecifiers = v18;

  if (![(BPSNotificationAppController *)self suppressAlertSpecifiers])
  {
    if ([(BPSNotificationAppController *)self _suppressSendToNotificationCenterOption])
    {
      [(BPSNotificationAppController *)self removeSendToNotificationCenterOption];
    }
    v20 = [(NSMutableArray *)self->_notificationSpecifiers specifierForID:@"NOTIFICATIONS_OFF_ID"];
    unint64_t v21 = [(BPSNotificationAppController *)self alertingMode];
    if (v21 == 2)
    {
      v23 = self->_notificationSpecifiers;
      v24 = @"ALLOW_NOTIFICATIONS_ID";
    }
    else
    {
      if (v21 != 1)
      {
        if (v21) {
          goto LABEL_23;
        }
        id v22 = v20;
LABEL_21:
        id v25 = v22;
        if (v22)
        {
          v26 = [(NSMutableArray *)self->_notificationSpecifiers specifierForID:@"CUSTOM_RADIO_GROUP_ID"];
          v82 = v25;
          [v26 setProperty:v25 forKey:*MEMORY[0x263F60200]];

          goto LABEL_24;
        }
LABEL_23:
        v82 = 0;
LABEL_24:
        if ([(BPSNotificationAppController *)self alertingMode] == 1
          || [(BPSNotificationAppController *)self alertingMode] == 2)
        {
          uint64_t v27 = [(NSMutableArray *)self->_notificationSpecifiers indexOfObject:v20];
          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
          {
            NSLog(&cfstr_ErrorNotificat.isa);
            uint64_t v27 = 0;
          }
          v28 = [(BPSNotificationAppController *)self notificationApplicationSpecifiers];
          notificationApplicationSpecifiers = self->_notificationApplicationSpecifiers;
          self->_notificationApplicationSpecifiers = v28;

          if (self->_notificationApplicationSpecifiers)
          {
            v76 = v17;
            v79 = v20;
            v30 = v16;
            v31 = v8;
            if (![(NSMutableArray *)self->_notificationSpecifiers count])
            {
              v32 = self->_notificationSpecifiers;
              v33 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
              [(NSMutableArray *)v32 addObject:v33];
            }
            v34 = self->_notificationSpecifiers;
            v35 = self->_notificationApplicationSpecifiers;
            v36 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v27 + 1, -[NSMutableArray count](v35, "count"));
            [(NSMutableArray *)v34 insertObjects:v35 atIndexes:v36];

            objc_super v8 = v31;
            long long v16 = v30;
            long long v17 = v76;
            v20 = v79;
          }
          if ([(BPSNotificationAppController *)self alertType] && !self->_mirrorSettings)
          {
            v75 = v8;
            v37 = (void *)MEMORY[0x263F5FC40];
            v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            [v38 localizedStringForKey:@"ALERTS" value:&stru_26CCB36C8 table:@"AbstactApplication"];
            v77 = v16;
            v39 = v80 = v20;
            v40 = [v37 groupSpecifierWithID:@"ALERT_GROUP_ID" name:v39];

            v86[0] = @"tinker-paired";
            v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:1];
            v74 = v40;
            objc_msgSend(v40, "setProperty:forKey:", v41);

            [(NSMutableArray *)self->_notificationSpecifiers insertObject:v40 atIndex:v27 + 1];
            v42 = (void *)MEMORY[0x263F5FC40];
            v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v44 = [v43 localizedStringForKey:@"SOUND" value:&stru_26CCB36C8 table:@"AbstactApplication"];
            v45 = [v42 preferenceSpecifierNamed:v44 target:self set:sel_setSoundsValue_forSpecifier_ get:sel_soundsValue_ detail:0 cell:6 edit:0];

            v85 = @"tinker-paired";
            v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v85 count:1];
            [v45 setProperty:v46 forKey:@"forbiddenWatchCapabilities"];

            [(NSMutableArray *)self->_notificationSpecifiers insertObject:v45 atIndex:v27 + 2];
            v47 = (void *)MEMORY[0x263F5FC40];
            v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v49 = [v48 localizedStringForKey:@"HAPTIC" value:&stru_26CCB36C8 table:@"AbstactApplication"];
            v50 = [v47 preferenceSpecifierNamed:v49 target:self set:sel_setVibrationValue_forSpecifier_ get:sel_vibrationValue_ detail:0 cell:6 edit:0];

            long long v16 = v77;
            v20 = v80;

            [(NSMutableArray *)self->_notificationSpecifiers insertObject:v50 atIndex:v27 + 3];
            objc_super v8 = v75;
          }
          if ([(NSMutableArray *)self->_notificationSpecifiers count])
          {
            v51 = BPSGetActiveSetupCompletedDevice();
            char HasCapabilityForString = BPSDeviceHasCapabilityForString(@"tinker-paired", v51);

            if ((HasCapabilityForString & 1) == 0)
            {
              [MEMORY[0x263F5FC40] groupSpecifierWithID:@"NOTIFICATION_COALESCING_GROUP_ID"];
              v81 = v78 = v16;
              v53 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"NOTIFICATION_COALESCING_TITLE" target:self set:sel_setNotificationGroupingValue_specifier_ get:sel_notificationGroupingValue_ detail:objc_opt_class() cell:2 edit:0];
              v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v55 = [v54 localizedStringForKey:@"NOTIFICATION_COALESCING_TITLE" value:&stru_26CCB36C8 table:@"AbstactApplication"];
              [v53 setName:v55];

              [v53 setIdentifier:@"NOTIFICATION_COALESCING_ID"];
              [v53 setProperty:@"notificationGroupTitles" forKey:*MEMORY[0x263F602D8]];
              [v53 setProperty:@"notificationGroupValues" forKey:*MEMORY[0x263F60310]];
              v56 = self->_notificationSpecifiers;
              v84[0] = v81;
              v84[1] = v53;
              v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
              [(NSMutableArray *)v56 addObjectsFromArray:v57];

              long long v16 = v78;
            }
          }
        }

        goto LABEL_39;
      }
      v23 = self->_notificationSpecifiers;
      v24 = @"SEND_TO_NOTIFICATION_CENTER_ID";
    }
    id v22 = [(NSMutableArray *)v23 specifierForID:v24];
    goto LABEL_21;
  }
  [(BPSNotificationAppController *)self removeAlertOptions];
LABEL_39:
  if ([(BPSNotificationAppController *)self suppressNotificationCoalescingOptions])
  {
    [(BPSNotificationAppController *)self removeNotificationCoalescingOptions];
  }
  v58 = [(BPSNotificationAppController *)self applicationGroupSpecifiers];
  [v17 addObjectsFromArray:v58];

  if ([(BPSNotificationAppController *)self suppressMirrorOption])
  {
    [(BPSNotificationAppController *)self removeMirrorOptions];
  }
  else if ([(BPSNotificationAppController *)self suppressAllMirrorSpecifiers])
  {
    [(BPSNotificationAppController *)self removeMirrorOptions];
    [(BPSNotificationAppController *)self removeAlertOptions];
  }
  else
  {
    v59 = [(NSMutableArray *)self->_notificationSpecifiers specifierForID:@"MIRROR_RADIO_GROUP_ID"];
    if (self->_mirrorSettings)
    {
      [(BPSNotificationAppController *)self removeAlertOptions];
      v60 = [(NSMutableArray *)self->_notificationSpecifiers specifierForID:@"MIRROR_MY_COMPANION_ID"];
      [v59 setProperty:v60 forKey:*MEMORY[0x263F60200]];
      v61 = [(BPSNotificationAppController *)self localizedMirroringDetailFooter];
      [v59 setProperty:v61 forKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      v62 = [(BPSNotificationAppController *)self mirroredApplicationGroupSpecifiers];
      [v17 addObjectsFromArray:v62];

      v60 = [(NSMutableArray *)self->_notificationSpecifiers specifierForID:@"CUSTOM_ID"];
      [v59 setProperty:v60 forKey:*MEMORY[0x263F60200]];
    }
  }
  [v83 addObjectsFromArray:self->_notificationSpecifiers];
  [v83 addObjectsFromArray:v17];
  if (-[BPSNotificationAppController settingsMode](self, "settingsMode") == 1 && ![v83 count])
  {
    v63 = [(BPSNotificationAppController *)self specifier];
    v64 = [v63 propertyForKey:*MEMORY[0x263F602D0]];

    v65 = NSString;
    v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v66 localizedStringForKey:@"NOTIFICATIONS_SETTINGS_DESCRIPTION_%@" value:&stru_26CCB36C8 table:@"AbstactApplication"];
    v68 = v67 = v16;
    v69 = objc_msgSend(v65, "stringWithFormat:", v68, v64);

    long long v16 = v67;
    v70 = [(BPSNotificationAppController *)self customGroupSpecifierForDescription:v69];
    [v83 addObject:v70];
  }
  v71 = [(BPSNotificationAppController *)self localizedPaneTitle];
  [(BPSNotificationAppController *)self setTitle:v71];

  v72 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v83;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
LABEL_53:
  return v4;
}

- (id)customGroupSpecifierForDescription:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"NOTIFICATIONS_SETTINGS" value:&stru_26CCB36C8 table:@"AbstactApplication"];

  objc_super v8 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  id v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  [v8 setProperty:v10 forKey:*MEMORY[0x263F600C0]];

  [v8 setProperty:v5 forKey:*MEMORY[0x263F600E8]];
  NSUInteger v11 = [v5 rangeOfString:v7 options:4];
  NSUInteger v13 = v12;

  v18.location = v11;
  v18.length = v13;
  v14 = NSStringFromRange(v18);
  [v8 setProperty:v14 forKey:*MEMORY[0x263F600D0]];

  v15 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v8 setProperty:v15 forKey:*MEMORY[0x263F600E0]];

  [v8 setProperty:@"_showSettingsNotifications" forKey:*MEMORY[0x263F600C8]];
  return v8;
}

- (void)_showSettingsNotifications
{
  v2 = [(BPSNotificationAppController *)self bbSectionInfo];
  uint64_t v3 = [v2 sectionID];
  v4 = (void *)v3;
  id v5 = &stru_26CCB36C8;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = NSURL;
  [NSString stringWithFormat:@"prefs:root=NOTIFICATIONS_ID&path=%@", v6];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v8 = [v7 URLWithString:v9];
  BPSOpenSensitiveURLAsync(v8);
}

- (id)sectionInfoForBBSectionInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = NSNumber;
  if (v4 && ![v4 alertType]) {
    uint64_t v7 = [v4 showsInLockScreen];
  }
  else {
    uint64_t v7 = 1;
  }
  objc_super v8 = [v6 numberWithInt:v7];
  [v5 setObject:v8 forKey:@"BPSNanoBulletinShowsAlerts"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "showsMessagePreview"));
  [v5 setObject:v9 forKey:@"BPSNanoBulletinShowsPreview"];

  uint64_t v10 = [v4 sectionID];
  if (v10
    || ([(BPSNotificationAppController *)self applicationBundleIdentifier],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v5 setObject:v10 forKey:@"BPSNanoBulletinSectionId"];
  }
  NSUInteger v11 = [v4 subsectionID];
  if (v11) {
    [v5 setObject:v11 forKey:@"BPSNanoBulletinSubsectionId"];
  }
  NSUInteger v12 = [v4 subsections];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = objc_msgSend(v4, "subsections", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [(BPSNotificationAppController *)self sectionInfoForBBSectionInfo:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v5 setObject:v14 forKey:@"BPSNanoBulletinSubsections"];
  }

  return v5;
}

- (BBSectionInfo)bbSectionInfo
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_bbSectionInfo = &self->_bbSectionInfo;
  bbSectionInfo = self->_bbSectionInfo;
  if (!bbSectionInfo)
  {
    id v5 = [MEMORY[0x263F5B950] sharedManager];
    v6 = [v5 bbSections];

    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x263F5B950] sharedManager];
      [v7 loadBBSections];

      objc_super v8 = [MEMORY[0x263F5B950] sharedManager];
      v6 = [v8 bbSections];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "sectionID", (void)v17);
          if ([v15 isEqualToString:self->_bundleIdentifier])
          {
            objc_storeStrong((id *)p_bbSectionInfo, v14);

            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    bbSectionInfo = *p_bbSectionInfo;
  }
  return bbSectionInfo;
}

- (void)updateSubsections
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F5B950] sharedManager];
  [v3 loadBBSections];

  bbSectionInfo = self->_bbSectionInfo;
  self->_bbSectionInfo = 0;

  id v5 = [(BPSNotificationAppController *)self bbSectionInfo];
  v6 = [(BPSNotificationAppController *)self sectionInfoForBBSectionInfo:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"BPSNanoBulletinSubsections"];

  if (v7)
  {
    if (self->_mirrorSettings
      || ([(NSMutableDictionary *)self->_sectionInfo objectForKeyedSubscript:@"BPSNanoBulletinSubsections"], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      objc_super v8 = [v6 objectForKeyedSubscript:@"BPSNanoBulletinSubsections"];
      [(NSMutableDictionary *)self->_sectionInfo setObject:v8 forKeyedSubscript:@"BPSNanoBulletinSubsections"];
    }
    else
    {
      unint64_t v21 = v6;
      uint64_t v10 = [v6 objectForKeyedSubscript:@"BPSNanoBulletinSubsections"];
      uint64_t v11 = (void *)[v10 mutableCopy];

      if ([v11 count])
      {
        unint64_t v12 = 0;
        uint64_t v22 = self;
        do
        {
          long long v23 = [v11 objectAtIndexedSubscript:v12];
          uint64_t v13 = [v23 objectForKeyedSubscript:@"BPSNanoBulletinSubsectionId"];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v14 = [(NSMutableDictionary *)self->_sectionInfo objectForKeyedSubscript:@"BPSNanoBulletinSubsections"];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v14);
                }
                long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                long long v20 = [v19 objectForKeyedSubscript:@"BPSNanoBulletinSubsectionId"];
                if ([v13 isEqualToString:v20])
                {
                  [v11 setObject:v19 atIndexedSubscript:v12];

                  goto LABEL_18;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_18:

          ++v12;
          self = v22;
        }
        while (v12 < [v11 count]);
      }
      [(NSMutableDictionary *)self->_sectionInfo setObject:v11 forKeyedSubscript:@"BPSNanoBulletinSubsections"];

      v6 = v21;
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_sectionInfo removeObjectForKey:@"BPSNanoBulletinSubsections"];
  }
}

- (void)removeMirrorOptions
{
  notificationSpecifiers = self->_notificationSpecifiers;
  id v4 = [(NSMutableArray *)notificationSpecifiers specifierForID:@"MIRROR_RADIO_GROUP_ID"];
  [(NSMutableArray *)notificationSpecifiers removeObject:v4];

  id v5 = self->_notificationSpecifiers;
  v6 = [(NSMutableArray *)v5 specifierForID:@"MIRROR_MY_COMPANION_ID"];
  [(NSMutableArray *)v5 removeObject:v6];

  uint64_t v7 = self->_notificationSpecifiers;
  id v8 = [(NSMutableArray *)v7 specifierForID:@"CUSTOM_ID"];
  [(NSMutableArray *)v7 removeObject:v8];
}

- (void)removeAlertOptions
{
  notificationSpecifiers = self->_notificationSpecifiers;
  id v4 = [(NSMutableArray *)notificationSpecifiers specifierForID:@"ALERT_GROUP_ID"];
  [(NSMutableArray *)notificationSpecifiers removeObject:v4];

  id v5 = self->_notificationSpecifiers;
  v6 = [(NSMutableArray *)v5 specifierForID:@"CUSTOM_RADIO_GROUP_ID"];
  [(NSMutableArray *)v5 removeObject:v6];

  uint64_t v7 = self->_notificationSpecifiers;
  id v8 = [(NSMutableArray *)v7 specifierForID:@"ALLOW_NOTIFICATIONS_ID"];
  [(NSMutableArray *)v7 removeObject:v8];

  id v9 = self->_notificationSpecifiers;
  uint64_t v10 = [(NSMutableArray *)v9 specifierForID:@"SEND_TO_NOTIFICATION_CENTER_ID"];
  [(NSMutableArray *)v9 removeObject:v10];

  uint64_t v11 = self->_notificationSpecifiers;
  unint64_t v12 = [(NSMutableArray *)v11 specifierForID:@"NOTIFICATIONS_OFF_ID"];
  [(NSMutableArray *)v11 removeObject:v12];

  uint64_t v13 = self->_notificationSpecifiers;
  v14 = [(NSMutableArray *)v13 specifierForID:@"NOTIFICATION_COALESCING_GROUP_ID"];
  [(NSMutableArray *)v13 removeObject:v14];

  uint64_t v15 = self->_notificationSpecifiers;
  uint64_t v16 = [(NSMutableArray *)v15 specifierForID:@"NOTIFICATION_COALESCING_ID"];
  [(NSMutableArray *)v15 removeObject:v16];

  if (self->_notificationApplicationSpecifiers)
  {
    uint64_t v17 = self->_notificationSpecifiers;
    -[NSMutableArray removeObjectsInArray:](v17, "removeObjectsInArray:");
  }
}

- (void)removeNotificationCoalescingOptions
{
  notificationSpecifiers = self->_notificationSpecifiers;
  id v4 = [(NSMutableArray *)notificationSpecifiers specifierForID:@"NOTIFICATION_COALESCING_GROUP_ID"];
  [(NSMutableArray *)notificationSpecifiers removeObject:v4];

  id v5 = self->_notificationSpecifiers;
  id v6 = [(NSMutableArray *)v5 specifierForID:@"NOTIFICATION_COALESCING_ID"];
  [(NSMutableArray *)v5 removeObject:v6];
}

- (void)removeSendToNotificationCenterOption
{
  notificationSpecifiers = self->_notificationSpecifiers;
  id v3 = [(NSMutableArray *)notificationSpecifiers specifierForID:@"SEND_TO_NOTIFICATION_CENTER_ID"];
  [(NSMutableArray *)notificationSpecifiers removeObject:v3];
}

- (id)localizedPaneTitle
{
  return 0;
}

- (id)applicationBundleIdentifier
{
  return 0;
}

- (BOOL)suppressMirrorOption
{
  return 0;
}

- (BOOL)suppressAlertSpecifiers
{
  return 0;
}

- (BOOL)suppressAllMirrorSpecifiers
{
  return 0;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 1;
}

- (BOOL)suppressNotificationCoalescingOptions
{
  return 0;
}

- (BOOL)_suppressSendToNotificationCenterOption
{
  if (![(BPSNotificationAppController *)self watchHasCapabilitySendToNotificationCenter])return 1; {
  return [(BPSNotificationAppController *)self suppressSendToNotificationCenterOption];
  }
}

- (BOOL)watchHasCapabilitySendToNotificationCenter
{
  v2 = BPSGetActiveSetupCompletedDevice();
  char v3 = BPSIsDeviceCompatibleWithVersions(@"5", 0, v2);

  return v3;
}

- (NSMutableArray)notificationApplicationSpecifiers
{
  return 0;
}

- (id)mirroredApplicationGroupSpecifiers
{
  return 0;
}

- (id)applicationGroupSpecifiers
{
  v2 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:*MEMORY[0x263F60058]];
  char v3 = v2;
  if (v2)
  {
    id v4 = [NSClassFromString(v2) sharedInstance];
    if (([v4 areSpecifiersLoaded] & 1) == 0) {
      [v4 loadSpecifiers];
    }
    id v5 = [v4 specifiers];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)localizedMirroringDetailFooter
{
  return 0;
}

- (void)writeSectionState
{
  sectionInfo = self->_sectionInfo;
  id v4 = [MEMORY[0x263EFF910] date];
  [(NSMutableDictionary *)sectionInfo setObject:v4 forKey:@"BPSNanoBulletinUpdateTimestamp"];

  [(NPSDomainAccessor *)self->_bbAppsSettings setObject:self->_sectionInfo forKey:self->_bundleIdentifier];
  id v5 = (id)[(NPSDomainAccessor *)self->_bbAppsSettings synchronize];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BulletinDistributorBBSectionsDidChangeNotification", 0, 0, 0);
}

- (void)setMirrorSettings:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL mirrorSettings = self->_mirrorSettings;
  self->_BOOL mirrorSettings = a3;
  sectionInfo = self->_sectionInfo;
  uint64_t v7 = [NSNumber numberWithInt:!a3];
  [(NSMutableDictionary *)sectionInfo setObject:v7 forKey:@"BPSNanoBulletinShowsCustomSettings"];

  [(BPSNotificationAppController *)self writeSectionState];
  if (mirrorSettings != v3)
  {
    if ([(BPSNotificationAppController *)self alertType])
    {
      if (v3) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 3;
      }
      id v9 = [MEMORY[0x263F7FC90] sharedToneManager];
      objc_msgSend(v9, "_setCurrentToneWatchAlertPolicy:forAlertType:", v8, -[BPSNotificationAppController alertType](self, "alertType"));

      uint64_t v10 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
      objc_msgSend(v10, "_setCurrentVibrationWatchAlertPolicy:forAlertType:", v8, -[BPSNotificationAppController alertType](self, "alertType"));
    }
    [(BPSNotificationAppController *)self mirrorSettingsChanged:v3];
    [(BPSListController *)self reloadSpecifiers];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BPSNotificationAppController *)self indexForIndexPath:v7];
  id v9 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v8];
  uint64_t v10 = [NSNumber numberWithInteger:v8];
  uint64_t v11 = [v9 identifier];
  NSLog(&cfstr_DidselectRowSp.isa, v10, v11);

  unint64_t v12 = [v9 identifier];
  LODWORD(v11) = [v12 isEqualToString:@"MIRROR_MY_COMPANION_ID"];

  if (v11)
  {
    uint64_t v13 = self;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v15 = [v9 identifier];
    int v16 = [v15 isEqualToString:@"CUSTOM_ID"];

    if (!v16)
    {
      uint64_t v17 = [v9 identifier];
      int v18 = [v17 isEqualToString:@"ALLOW_NOTIFICATIONS_ID"];

      if (v18)
      {
        long long v19 = self;
        uint64_t v20 = 2;
      }
      else
      {
        unint64_t v21 = [v9 identifier];
        int v22 = [v21 isEqualToString:@"SEND_TO_NOTIFICATION_CENTER_ID"];

        if (v22)
        {
          long long v19 = self;
          uint64_t v20 = 1;
        }
        else
        {
          long long v23 = [v9 identifier];
          int v24 = [v23 isEqualToString:@"NOTIFICATIONS_OFF_ID"];

          if (!v24) {
            goto LABEL_13;
          }
          long long v19 = self;
          uint64_t v20 = 0;
        }
      }
      [(BPSNotificationAppController *)v19 setAlertingMode:v20];
      goto LABEL_13;
    }
    uint64_t v13 = self;
    uint64_t v14 = 0;
  }
  [(BPSNotificationAppController *)v13 setMirrorSettings:v14];
LABEL_13:
  v25.receiver = self;
  v25.super_class = (Class)BPSNotificationAppController;
  [(BPSNotificationAppController *)&v25 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (id)notificationGroupTitles
{
  v10[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"NOTIFICATION_COALESCING_OFF" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  id v4 = objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class(), v3);
  id v5 = [v4 localizedStringForKey:@"NOTIFICATION_COALESCING_AUTO" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  v10[1] = v5;
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"NOTIFICATION_COALESCING_BY_APP" value:&stru_26CCB36C8 table:@"AbstactApplication"];
  v10[2] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];

  return v8;
}

- (id)notificationGroupValues
{
  return &unk_26CCBC508;
}

- (id)notificationGroupingValue:(id)a3
{
  BOOL v3 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinNotificationGrouping"];
  id v4 = v3;
  if (!v3) {
    BOOL v3 = &unk_26CCBC468;
  }
  id v5 = v3;

  return v5;
}

- (void)setNotificationGroupingValue:(id)a3 specifier:(id)a4
{
  [(NSMutableDictionary *)self->_sectionInfo setObject:a3 forKey:@"BPSNanoBulletinNotificationGrouping"];
  [(BPSNotificationAppController *)self writeSectionState];
}

- (void)setAlertingMode:(unint64_t)a3
{
  unint64_t v5 = [(BPSNotificationAppController *)self alertingMode];
  sectionInfo = self->_sectionInfo;
  id v7 = [NSNumber numberWithBool:a3 == 2];
  [(NSMutableDictionary *)sectionInfo setObject:v7 forKey:@"BPSNanoBulletinShowsAlerts"];

  uint64_t v8 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinSubsections"];
  uint64_t v9 = [v8 count];

  if (v9 == 1)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinSubsections"];
    uint64_t v11 = [v10 objectAtIndex:0];
    unint64_t v12 = [NSNumber numberWithBool:a3 == 2];
    [v11 setObject:v12 forKey:@"BPSNanoBulletinShowsAlerts"];
  }
  uint64_t v13 = self->_sectionInfo;
  uint64_t v14 = [NSNumber numberWithInt:a3 == 1];
  [(NSMutableDictionary *)v13 setObject:v14 forKey:@"BPSNanoBulletinSendToNotificationCenter"];

  [(BPSNotificationAppController *)self writeSectionState];
  if (v5 != a3)
  {
    [(BPSListController *)self reloadSpecifiers];
  }
}

- (unint64_t)alertingMode
{
  if ([(BPSNotificationAppController *)self showAlerts]) {
    return 2;
  }
  id v4 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinSendToNotificationCenter"];
  unint64_t v3 = [v4 BOOLValue];

  return v3;
}

- (void)setShowPreviewValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NSMutableDictionary *)self->_sectionInfo setObject:v5 forKey:@"BPSNanoBulletinShowsPreview"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinSubsections", 0];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setObject:v5 forKey:@"BPSNanoBulletinShowsPreview"];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(BPSNotificationAppController *)self writeSectionState];
}

- (id)showPreviewValue:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinShowsPreview"];
}

- (void)setSoundsValue:(id)a3 forSpecifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [MEMORY[0x263F7FC90] sharedToneManager];
  objc_msgSend(v6, "_setCurrentToneWatchAlertPolicy:forAlertType:", v5, -[BPSNotificationAppController alertType](self, "alertType"));
}

- (id)soundsValue:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F7FC90], "sharedToneManager", a3);
  uint64_t v5 = objc_msgSend(v4, "_currentToneWatchAlertPolicyForAlertType:", -[BPSNotificationAppController alertType](self, "alertType"));

  id v6 = NSNumber;
  return (id)[v6 numberWithBool:v5 == 1];
}

- (void)setVibrationValue:(id)a3 forSpecifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  objc_msgSend(v6, "_setCurrentVibrationWatchAlertPolicy:forAlertType:", v5, -[BPSNotificationAppController alertType](self, "alertType"));
}

- (id)vibrationValue:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F7FCA0], "sharedVibrationManager", a3);
  uint64_t v5 = objc_msgSend(v4, "_currentVibrationWatchAlertPolicyForAlertType:", -[BPSNotificationAppController alertType](self, "alertType"));

  id v6 = NSNumber;
  return (id)[v6 numberWithBool:v5 == 1];
}

- (BOOL)showAlerts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_mirrorSettings)
  {
    long long v11 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinShowsAlerts"];
    char v12 = [v11 BOOLValue];

    return v12;
  }
  v2 = [(BPSNotificationAppController *)self bbSectionInfo];
  unint64_t v3 = [v2 subsections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = objc_msgSend(v2, "subsections", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 allowsNotifications]
            && ([v10 alertType] || (objc_msgSend(v10, "showsInLockScreen") & 1) != 0))
          {

            goto LABEL_18;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else if ([v2 allowsNotifications])
  {
    if ([v2 alertType]) {
LABEL_18:
    }
      char v14 = 1;
    else {
      char v14 = [v2 showsInLockScreen];
    }
    goto LABEL_20;
  }
  char v14 = 0;
LABEL_20:

  return v14;
}

- (BOOL)showPreview
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_mirrorSettings)
  {
    v2 = [(BPSNotificationAppController *)self bbSectionInfo];
    unint64_t v3 = [v2 subsections];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v5 = objc_msgSend(v2, "subsections", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            if ([*(id *)(*((void *)&v14 + 1) + 8 * i) showsMessagePreview])
            {

              char v10 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      char v10 = 0;
    }
    else
    {
      char v10 = [v2 showsMessagePreview];
    }
LABEL_15:

    return v10;
  }
  else
  {
    long long v11 = [(NSMutableDictionary *)self->_sectionInfo objectForKey:@"BPSNanoBulletinShowsPreview"];
    char v12 = [v11 BOOLValue];

    return v12;
  }
}

- (int64_t)alertType
{
  return 0;
}

- (PSSpecifier)previewSwitchSpecifier
{
  unint64_t v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [(BPSNotificationAppController *)self localizedPreviewChoiceTitle];
  uint64_t v5 = [v3 preferenceSpecifierNamed:v4 target:self set:sel_setShowPreviewValue_forSpecifier_ get:sel_showPreviewValue_ detail:0 cell:6 edit:0];

  return (PSSpecifier *)v5;
}

- (id)localizedPreviewChoiceTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v3 = [v2 localizedStringForKey:@"SHOW_PREVIEWS" value:&stru_26CCB36C8 table:@"AbstactApplication"];

  return v3;
}

- (BOOL)wantsPreviewChoice
{
  return 1;
}

- (id)localizedPreviewGroupLabel
{
  return 0;
}

- (id)localizedPreviewGroupFooter
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setBbSectionInfo:(id)a3
{
}

- (void)setNotificationApplicationSpecifiers:(id)a3
{
}

- (NPSDomainAccessor)bbAppsSettings
{
  return self->_bbAppsSettings;
}

- (void)setBbAppsSettings:(id)a3
{
}

- (NSMutableArray)notificationSpecifiers
{
  return self->_notificationSpecifiers;
}

- (BOOL)mirrorSettings
{
  return self->_mirrorSettings;
}

- (NSMutableDictionary)sectionInfo
{
  return self->_sectionInfo;
}

- (unint64_t)settingsMode
{
  return self->_settingsMode;
}

- (void)setSettingsMode:(unint64_t)a3
{
  self->_settingsMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_notificationSpecifiers, 0);
  objc_storeStrong((id *)&self->_bbAppsSettings, 0);
  objc_storeStrong((id *)&self->_notificationApplicationSpecifiers, 0);
  objc_storeStrong((id *)&self->_bbSectionInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end