@interface NCAppClipDetailController
- (NCAppClipDetailController)init;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)_updateStoredSectionsWithSectionInfo:(id)a3;
- (void)appDetailControllerWillDisappear:(id)a3;
- (void)dealloc;
- (void)settingsGateway:(id)a3 didUpdateSectionInfo:(id)a4;
@end

@implementation NCAppClipDetailController

- (NCAppClipDetailController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCAppClipDetailController;
  v2 = [(NCAppClipDetailController *)&v5 init];
  if (v2)
  {
    v3 = +[NCSettingsGatewayController sharedInstance];
    [v3 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NCSettingsGatewayController sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NCAppClipDetailController;
  [(NCAppClipDetailController *)&v4 dealloc];
}

- (void)_updateStoredSectionsWithSectionInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OBJC_IVAR___PSViewController__specifier;
  v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"APP_CLIP_SECTION_INFOS"];
  id v7 = [v6 mutableCopy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9F90;
  v9[3] = &unk_40E00;
  id v10 = v4;
  id v8 = v4;
  objc_msgSend(v7, "setObject:atIndexedSubscript:", v8, objc_msgSend(v6, "indexOfObjectPassingTest:", v9));
  [*(id *)&self->PSListController_opaque[v5] setProperty:v7 forKey:@"APP_CLIP_SECTION_INFOS"];
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  id v4 = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    location = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:@"APP_CLIP_SECTION_INFOS"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      uint64_t v18 = PSEnabledKey;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
          objc_opt_class();
          objc_opt_class();
          id v10 = PSApplicationSpecifierForBBSection();
          v11 = +[MCProfileConnection sharedConnection];
          v12 = [v9 sectionID];
          unsigned __int8 v13 = [v11 isNotificationsModificationAllowedForBundleID:v12];

          if ((v13 & 1) == 0)
          {
            v14 = +[NSNumber numberWithBool:0];
            [v10 setProperty:v14 forKey:v18];
          }
          [v3 addObject:v10];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
    objc_storeStrong(location, v3);

    id v4 = *location;
  }
  id v15 = v4;

  return v15;
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCAppClipDetailController;
  id v4 = [(NCAppClipDetailController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (void)appDetailControllerWillDisappear:(id)a3
{
  id v4 = [a3 specifier];
  [(NCAppClipDetailController *)self reloadSpecifier:v4];
}

- (void)settingsGateway:(id)a3 didUpdateSectionInfo:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A39C;
  v5[3] = &unk_40D08;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

@end