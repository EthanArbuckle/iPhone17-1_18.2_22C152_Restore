@interface STStorageSystemDetailController
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (int64_t)cellType;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STStorageSystemDetailController

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStorageSystemDetailController;
  [(STStorageSystemDetailController *)&v5 viewWillAppear:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10B4C;
  block[3] = &unk_2CA90;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)valueForSpecifier:(id)a3
{
  v3 = [a3 propertyForKey:PSValueKey];
  [v3 longLongValue];
  v4 = STFormattedSize();

  return v4;
}

- (id)specifiers
{
  v3 = +[NSMutableArray arrayWithCapacity:10];
  v4 = objc_alloc_init(STStorageSystemFakeApp);
  objc_super v5 = +[STStorageAppHeaderCell specifierForStorageApp:v4];
  [v3 addObject:v5];

  uint64_t v6 = STSizeOfSystemVolume();
  v7 = STStorageLocStr(@"SYSTEM_FILES");
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

  v9 = +[NSNumber numberWithLongLong:v6];
  [v8 setProperty:v9 forKey:PSValueKey];

  [v3 addObject:v8];
  uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
  v11 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v12 = v3;

  id v13 = *(id *)&self->super.PSListController_opaque[v10];
  return v13;
}

- (int64_t)cellType
{
  return 1;
}

@end