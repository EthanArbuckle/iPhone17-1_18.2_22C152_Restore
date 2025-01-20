@interface CompassSettingsController
- (id)specifiers;
@end

@implementation CompassSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    id v6 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.compass"];
    v7 = [v6 specifiersForPolicyOptions:8486912 force:0];
    [v5 addObjectsFromArray:v7];
    v8 = [(CompassSettingsController *)self loadSpecifiersFromPlistName:@"CompassSettings" target:self];
    [v5 addObjectsFromArray:v8];
    id v9 = [v5 copy];
    v10 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v9;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

@end