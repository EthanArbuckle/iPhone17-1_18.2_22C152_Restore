@interface NCNotificationsSettingsTopicsListController
- (id)allowNotifications:(id)a3;
- (id)specifierForSubsectionInfo:(id)a3;
- (id)specifiers;
- (id)specifiersForSubsectionInfos:(id)a3;
- (void)setAllowNotifications:(id)a3 specifier:(id)a4;
@end

@implementation NCNotificationsSettingsTopicsListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"BBSECTION_INFO_KEY"];
    v6 = [v5 subsections];
    uint64_t v7 = [(NCNotificationsSettingsTopicsListController *)self specifiersForSubsectionInfos:v6];

    v8 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v7;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)specifierForSubsectionInfo:(id)a3
{
  id v4 = a3;
  v5 = PSDisplayNameForBBSection();
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setAllowNotifications:specifier:" get:"allowNotifications:" detail:0 cell:6 edit:0];

  uint64_t v7 = [v4 subsectionID];
  [v6 setIdentifier:v7];

  [v6 setProperty:v4 forKey:@"BBSECTION_INFO_KEY"];

  return v6;
}

- (id)specifiersForSubsectionInfos:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NCNotificationsSettingsTopicsListController specifierForSubsectionInfo:](self, "specifierForSubsectionInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)allowNotifications:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowsNotifications]);

  return v4;
}

- (void)setAllowNotifications:(id)a3 specifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v11 = [v5 propertyForKey:@"BBSECTION_INFO_KEY"];
  unsigned int v7 = [v6 BOOLValue];

  if (v7) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v11 setAuthorizationStatus:v8];
  [v5 setProperty:v11 forKey:@"BBSECTION_INFO_KEY"];

  uint64_t v9 = +[NCSettingsGatewayController sharedInstance];
  v10 = [v11 sectionID];
  [v9 setSectionInfo:v11 forSectionID:v10];
}

@end