@interface NCNotificationsSettingsMailTopicsListController
- (id)_allUnreadSpecifierWithSectionInfo:(id)a3;
- (id)_footerTextForSpecialSections:(unint64_t)a3;
- (id)_primaryUnreadSpecifierWithSectionInfo:(id)a3;
- (id)_unreadBadgeGroupSpecifier;
- (id)selectSpecifier:(id)a3;
- (id)specifierForSubsectionInfo:(id)a3;
- (id)specifiers;
- (id)specifiersForSubsectionInfos:(id)a3;
- (void)_updateBadgeSettingsForSpecifier:(id)a3 enabled:(BOOL)a4;
- (void)_updatePrimaryBadgesForSpecifier:(id)a3;
- (void)mailTopicDetailControllerWillDisappear:(id)a3;
@end

@implementation NCNotificationsSettingsMailTopicsListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"BBSECTION_INFO_KEY"];
    v6 = [v5 subsections];
    uint64_t v7 = [(NCNotificationsSettingsMailTopicsListController *)self specifiersForSubsectionInfos:v6];

    v8 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v7;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationsSettingsMailTopicsListController;
  v4 = [(NCNotificationsSettingsMailTopicsListController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (id)specifierForSubsectionInfo:(id)a3
{
  id v4 = a3;
  v5 = PSDisplayNameForBBSection();
  objc_super v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  uint64_t v7 = [v4 subsectionID];
  [v6 setIdentifier:v7];

  [v6 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];
  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];

  return v6;
}

- (id)specifiersForSubsectionInfos:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v4 mutableCopy];
  v47 = v4;
  uint64_t v7 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &stru_41430);
  if (v7) {
    [v6 removeObject:v7];
  }
  v8 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &stru_41450);
  if (v8) {
    [v6 removeObject:v8];
  }
  v9 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &stru_41470);
  if (v9) {
    [v6 removeObject:v9];
  }
  v10 = objc_msgSend(v4, "bs_firstObjectPassingTest:", &stru_41490);
  if (v10) {
    [v6 removeObject:v10];
  }
  v11 = objc_msgSend(v47, "bs_firstObjectPassingTest:", &stru_414B0);
  if (v11) {
    [v6 removeObject:v11];
  }
  v12 = objc_msgSend(v47, "bs_firstObjectPassingTest:", &stru_414D0);
  v45 = v7;
  v46 = v11;
  v43 = v10;
  v44 = v12;
  if (v12)
  {
    [v6 removeObject:v12];
    v13 = [(NCNotificationsSettingsMailTopicsListController *)self _unreadBadgeGroupSpecifier];
    [v5 addObject:v13];
    v14 = +[PSSpecifier preferenceSpecifierNamed:&stru_419A0 target:self set:0 get:0 detail:0 cell:4 edit:0];
    [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v14 setIdentifier:@"MOBILE_MAIL_SETTINGS_PLACARD_ID"];
    [v5 addObject:v14];
    v15 = [(NCNotificationsSettingsMailTopicsListController *)self _primaryUnreadSpecifierWithSectionInfo:v12];
    [v5 addObject:v15];
    objc_msgSend(v47, "bs_firstObjectPassingTest:", &stru_414F0);
    v17 = v16 = v8;
    [(NCNotificationsSettingsMailTopicsListController *)self _allUnreadSpecifierWithSectionInfo:v17];
    v19 = v18 = v9;
    [v5 addObject:v19];
    [v6 removeObject:v17];
    if (((unint64_t)[v17 pushSettings] & 8) != 0) {
      v20 = v19;
    }
    else {
      v20 = v15;
    }
    [v13 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];

    v9 = v18;
    v8 = v16;
    v10 = v43;

    v12 = v44;
    v11 = v46;

    uint64_t v7 = v45;
  }
  if ([v6 count])
  {
    v41 = v9;
    v42 = v8;
    v21 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v22 = [v21 localizedStringForKey:@"ACCOUNTS_GROUP_TITLE" value:&stru_419A0 table:@"NotificationsSettings"];
    v23 = +[PSSpecifier groupSpecifierWithID:@"ACCOUNTS_GROUP_ID" name:v22];

    [v5 addObject:v23];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v24 = v6;
    id v25 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v49;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [(NCNotificationsSettingsMailTopicsListController *)self specifierForSubsectionInfo:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          [v5 addObject:v29];
        }
        id v26 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v26);
    }

    uint64_t v7 = v45;
    v11 = v46;
    v9 = v41;
    v8 = v42;
    v10 = v43;
    v12 = v44;
  }
  if (v7 || v8 || v9 || v10 || v11)
  {
    +[PSSpecifier emptyGroupSpecifier];
    v31 = uint64_t v30 = (uint64_t)v7;
    [v5 addObject:v31];
    if (v30)
    {
      v32 = [(NCNotificationsSettingsMailTopicsListController *)self specifierForSubsectionInfo:v30];
      [v5 addObject:v32];

      uint64_t v30 = 1;
    }
    if (v8)
    {
      v33 = [(NCNotificationsSettingsMailTopicsListController *)self specifierForSubsectionInfo:v8];
      [v5 addObject:v33];
      v30 |= 2uLL;
    }
    if (v9)
    {
      v34 = [(NCNotificationsSettingsMailTopicsListController *)self specifierForSubsectionInfo:v9];
      [v5 addObject:v34];
      v30 |= 4uLL;
    }
    if (v10)
    {
      v35 = [(NCNotificationsSettingsMailTopicsListController *)self specifierForSubsectionInfo:v10];
      [v5 addObject:v35];
      v30 |= 8uLL;
    }
    if (v46)
    {
      objc_msgSend(v46, "setPushSettings:", (unint64_t)objc_msgSend(v46, "pushSettings") & 0xFFFFFFFFFFFFFFF6);
      v36 = [(NCNotificationsSettingsMailTopicsListController *)self specifierForSubsectionInfo:v46];
      [v5 addObject:v36];
      v30 |= 0x10uLL;
    }
    v37 = [(NCNotificationsSettingsMailTopicsListController *)self _footerTextForSpecialSections:v30];
    v38 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v39 = [v38 localizedStringForKey:v37 value:&stru_419A0 table:@"NotificationsSettings"];
    [v31 setProperty:v39 forKey:PSFooterTextGroupKey];

    uint64_t v7 = v45;
    v11 = v46;
    v12 = v44;
  }

  return v5;
}

- (id)_unreadBadgeGroupSpecifier
{
  unreadBadgeGroupSpecifier = self->_unreadBadgeGroupSpecifier;
  if (!unreadBadgeGroupSpecifier)
  {
    id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v5 = [v4 localizedStringForKey:@"BADGE_COUNT" value:&stru_419A0 table:@"NotificationsSettings"];
    id v6 = +[PSSpecifier groupSpecifierWithID:@"PRIMARY_GROUP_ID" name:v5];
    uint64_t v7 = self->_unreadBadgeGroupSpecifier;
    self->_unreadBadgeGroupSpecifier = v6;

    [(PSSpecifier *)self->_unreadBadgeGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    unreadBadgeGroupSpecifier = self->_unreadBadgeGroupSpecifier;
  }

  return unreadBadgeGroupSpecifier;
}

- (id)_primaryUnreadSpecifierWithSectionInfo:(id)a3
{
  primaryUnreadSpecifier = self->_primaryUnreadSpecifier;
  if (a3 && !primaryUnreadSpecifier)
  {
    id v5 = a3;
    id v6 = PSDisplayNameForBBSection();
    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v7 setButtonAction:"_updatePrimaryBadgesForSpecifier:"];
    v8 = [v5 subsectionID];
    [v7 setIdentifier:v8];

    [v7 setProperty:v5 forKey:@"BBSECTION_INFO_KEY"];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v9 = self->_primaryUnreadSpecifier;
    self->_primaryUnreadSpecifier = (PSSpecifier *)v7;

    primaryUnreadSpecifier = self->_primaryUnreadSpecifier;
  }

  return primaryUnreadSpecifier;
}

- (id)_allUnreadSpecifierWithSectionInfo:(id)a3
{
  allUnreadSpecifier = self->_allUnreadSpecifier;
  if (a3 && !allUnreadSpecifier)
  {
    id v5 = a3;
    id v6 = PSDisplayNameForBBSection();
    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v7 setButtonAction:"_updatePrimaryBadgesForSpecifier:"];
    v8 = [v5 subsectionID];
    [v7 setIdentifier:v8];

    [v7 setProperty:v5 forKey:@"BBSECTION_INFO_KEY"];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    v9 = self->_allUnreadSpecifier;
    self->_allUnreadSpecifier = (PSSpecifier *)v7;

    allUnreadSpecifier = self->_allUnreadSpecifier;
  }

  return allUnreadSpecifier;
}

- (void)_updatePrimaryBadgesForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationsSettingsMailTopicsListController *)self _unreadBadgeGroupSpecifier];
  [v5 setProperty:v4 forKey:PSRadioGroupCheckedSpecifierKey];

  id v8 = [(NCNotificationsSettingsMailTopicsListController *)self _allUnreadSpecifierWithSectionInfo:0];
  id v6 = [v4 isEqualToSpecifier:v8];

  [(NCNotificationsSettingsMailTopicsListController *)self _updateBadgeSettingsForSpecifier:v8 enabled:v6];
  uint64_t v7 = [(NCNotificationsSettingsMailTopicsListController *)self _unreadBadgeGroupSpecifier];
  [(NCNotificationsSettingsMailTopicsListController *)self reloadSpecifier:v7];
}

- (void)_updateBadgeSettingsForSpecifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  unint64_t v5 = (unint64_t)[v9 pushSettings] & 0xFFFFFFFFFFFFFFF7;
  uint64_t v6 = 8;
  if (!v4) {
    uint64_t v6 = 0;
  }
  [v9 setPushSettings:v5 | v6];
  uint64_t v7 = +[NCSettingsGatewayController sharedInstance];
  id v8 = [v9 sectionID];
  [v7 setSectionInfo:v9 forSectionID:v8];
}

- (id)_footerTextForSpecialSections:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v5 = v4;
  if ((v3 & 0x10) != 0)
  {
    [v4 addObject:@"PI"];
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"RM"];
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v5 addObject:@"VIP"];
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v5 addObject:@"FM"];
  if ((v3 & 4) != 0) {
LABEL_6:
  }
    [v5 addObject:@"VIT"];
LABEL_7:
  uint64_t v6 = [v5 componentsJoinedByString:@"_"];
  uint64_t v7 = +[NSString stringWithFormat:@"%@_GROUP_FOOTER_TEXT", v6];

  return v7;
}

- (void)mailTopicDetailControllerWillDisappear:(id)a3
{
  id v4 = [a3 specifier];
  [(NCNotificationsSettingsMailTopicsListController *)self reloadSpecifier:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allUnreadSpecifier, 0);
  objc_storeStrong((id *)&self->_primaryUnreadSpecifier, 0);

  objc_storeStrong((id *)&self->_unreadBadgeGroupSpecifier, 0);
}

@end