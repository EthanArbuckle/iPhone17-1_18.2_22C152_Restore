@interface STStorageContainerDetailController
- (id)dataSize:(id)a3;
- (id)specifiers;
@end

@implementation STStorageContainerDetailController

- (id)dataSize:(id)a3
{
  v3 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageAppKey];
  v4 = [v3 appSize];
  [v4 userTotal];

  v5 = STFormattedSize();

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = STStorageAppKey;
    v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageAppKey];
    v7 = +[NSMutableArray arrayWithCapacity:8];
    v8 = +[PSSpecifier emptyGroupSpecifier];
    [v7 addObject:v8];
    v9 = +[STStorageAppHeaderCell specifierForStorageApp:v6];
    [v7 addObject:v9];

    v10 = STStorageLocStr(@"DOCUMENTS_AND_DATA");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"dataSize:" detail:0 cell:4 edit:0];

    [v11 setProperty:v6 forKey:v5];
    [v7 addObject:v11];
    v12 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v7;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

@end