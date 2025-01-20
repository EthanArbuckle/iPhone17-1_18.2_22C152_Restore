@interface UBSSettingsController
+ (void)initialize;
- (UBSSettingsController)init;
- (USLocationWrapper)model;
- (_TtC20UrchinBridgeSettings15SettingLocation)selectedLocation;
- (id)defaultLocation:(id)a3;
- (id)specifiers;
- (void)setModel:(id)a3;
- (void)setSelectedLocation:(id)a3;
@end

@implementation UBSSettingsController

+ (void)initialize
{
  if (qword_11810 != -1) {
    dispatch_once(&qword_11810, &stru_C518);
  }
}

- (UBSSettingsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)UBSSettingsController;
  v2 = [(UBSSettingsController *)&v8 init];
  if (v2)
  {
    v3 = +[USLocationWrapper shared];
    [(UBSSettingsController *)v2 setModel:v3];

    v4 = [(UBSSettingsController *)v2 model];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_4F78;
    v6[3] = &unk_C540;
    v7 = v2;
    [v4 loadLocationsWithCompletion:v6];
  }
  return v2;
}

- (id)defaultLocation:(id)a3
{
  return [(SettingLocation *)self->_selectedLocation name];
}

- (id)specifiers
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = (id)objc_opt_new();
    goto LABEL_5;
  }
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4)
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_6;
  }
  objc_super v8 = objc_opt_new();
  v9 = +[PSSpecifier emptyGroupSpecifier];
  v10 = +[UBSLocalizedString shared];
  v11 = [v10 stringForKey:@"DEFAULT_LOCATION_NOTE_COMPLICATION"];

  [v9 setProperty:v11 forKey:PSFooterTextGroupKey];
  v12 = +[UBSLocalizedString shared];
  v13 = [v12 stringForKey:@"DEFAULT_LOCATION"];

  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"defaultLocation:" detail:objc_opt_class() cell:2 edit:0];
  v18[0] = v9;
  v18[1] = v14;
  v15 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 addObjectsFromArray:v15];

  id v16 = [v8 copy];
  v17 = *(void **)&self->PSListController_opaque[v3];
  *(void *)&self->PSListController_opaque[v3] = v16;

  id v6 = *(id *)&self->PSListController_opaque[v3];
LABEL_6:

  return v6;
}

- (USLocationWrapper)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (_TtC20UrchinBridgeSettings15SettingLocation)selectedLocation
{
  return self->_selectedLocation;
}

- (void)setSelectedLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocation, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end