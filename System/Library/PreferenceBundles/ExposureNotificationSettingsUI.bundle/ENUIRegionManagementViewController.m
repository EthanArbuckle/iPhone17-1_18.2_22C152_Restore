@interface ENUIRegionManagementViewController
- (ENUIRegionManagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)adapter;
- (id)_activeRegion;
- (id)_addRegionSpecifiers;
- (id)_authorizedRegions;
- (id)_availableRegions;
- (id)specifiers;
- (id)specifiersForHealthAgencyModels:(id)a3;
- (void)didTapAddRegion:(id)a3;
- (void)setAdapter:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ENUIRegionManagementViewController

- (ENUIRegionManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ENUIRegionManagementViewController;
  v4 = [(ENUIRegionManagementViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = ENUILocalizedString();
    [(ENUIRegionManagementViewController *)v4 setTitle:v5];

    v6 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    [(ENUIRegionManagementViewController *)v4 setAdapter:v6];

    v7 = v4;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ENUIRegionManagementViewController;
  [(ENUIRegionManagementViewController *)&v4 viewWillAppear:a3];
  [(ENUIRegionManagementViewController *)self reloadSpecifiers];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ENUIRegionManagementViewController;
  [(ENUIRegionManagementViewController *)&v7 viewDidDisappear:a3];
  objc_super v4 = [(ENUIRegionManagementViewController *)self table];
  v5 = [(ENUIRegionManagementViewController *)self table];
  v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:0];
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = [(ENUIRegionManagementViewController *)self _activeRegion];
    [v6 addObjectsFromArray:v7];

    v8 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel authorizedRegions];
    id v9 = [v8 count];

    if (v9)
    {
      v10 = [(ENUIRegionManagementViewController *)self _authorizedRegions];
      [v6 addObjectsFromArray:v10];
    }
    v11 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel availableRegions];
    id v12 = [v11 count];

    if (v12)
    {
      v13 = [(ENUIRegionManagementViewController *)self _availableRegions];
      [v6 addObjectsFromArray:v13];
    }
    v14 = [(ENUIRegionManagementViewController *)self _addRegionSpecifiers];
    [v6 addObjectsFromArray:v14];

    id v15 = [v6 copy];
    v16 = *(void **)&self->PSListController_opaque[v2];
    *(void *)&self->PSListController_opaque[v2] = v15;

    id v4 = *(id *)&self->PSListController_opaque[v2];
  }

  return v4;
}

- (id)_activeRegion
{
  v3 = ENUILocalizedString();
  id v4 = +[PSSpecifier groupSpecifierWithName:v3];

  v5 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];

  if (v5)
  {
    id v6 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
    id v15 = v6;
    objc_super v7 = +[NSArray arrayWithObjects:&v15 count:1];
    v8 = [(ENUIRegionManagementViewController *)self specifiersForHealthAgencyModels:v7];
    id v9 = [v8 firstObject];

    v10 = ENUILocalizedString();
    [v4 setObject:v10 forKeyedSubscript:PSFooterTextGroupKey];
  }
  else
  {
    v11 = ENUILocalizedString();
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  }
  v14[0] = v4;
  v14[1] = v9;
  id v12 = +[NSArray arrayWithObjects:v14 count:2];

  return v12;
}

- (id)_authorizedRegions
{
  v3 = ENUILocalizedString();
  id v4 = +[PSSpecifier groupSpecifierWithName:v3];

  v5 = ENUILocalizedString();
  [v4 setObject:v5 forKeyedSubscript:PSFooterTextGroupKey];

  id v6 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel authorizedRegions];
  objc_super v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v6 count] + 1);

  [v7 addObject:v4];
  v8 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel authorizedRegions];
  id v9 = [(ENUIRegionManagementViewController *)self specifiersForHealthAgencyModels:v8];
  [v7 addObjectsFromArray:v9];

  id v10 = [v7 copy];

  return v10;
}

- (id)_availableRegions
{
  v3 = ENUILocalizedString();
  id v4 = +[PSSpecifier groupSpecifierWithName:v3];

  v5 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel availableRegions];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v5 count] + 1);

  [v6 addObject:v4];
  objc_super v7 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel availableRegions];
  v8 = [(ENUIRegionManagementViewController *)self specifiersForHealthAgencyModels:v7];
  [v6 addObjectsFromArray:v8];

  id v9 = [v6 copy];

  return v9;
}

- (id)_addRegionSpecifiers
{
  v3 = +[PSSpecifier groupSpecifierWithID:@"add-region-group"];
  id v4 = ENUILocalizedString();
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v5 setButtonAction:"didTapAddRegion:"];
  v8[0] = v3;
  v8[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (void)didTapAddRegion:(id)a3
{
  id v4 = a3;
  v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  id location = 0;
  objc_initWeak(&location, self);
  id v6 = +[ENUIViewControllerFactory sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_3518;
  v8[3] = &unk_2C6C8;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  objc_super v7 = [v6 createOnboardingStackForAgencyModel:0 exposureManager:v5 fromAvailabilityAlert:0 fromDeepLink:0 subsequentFlow:0 completion:v8];

  [(ENUIRegionManagementViewController *)self presentViewController:v7 animated:1 completion:&stru_2C708];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)specifiersForHealthAgencyModels:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = PSCellClassKey;
    uint64_t v9 = PSTitleKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 name];
        v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

        v14 = [v11 region];
        id v15 = [v14 regionCode];
        [v13 setIdentifier:v15];

        [v13 setUserInfo:v11];
        [v13 setObject:objc_opt_class() forKeyedSubscript:v8];
        v16 = [v11 name];
        [v13 setObject:v16 forKeyedSubscript:v9];

        [v4 addObject:v13];
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)adapter
{
  return self->_adapter;
}

- (void)setAdapter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end