@interface TTYSubscriptionsSettingsController
- (id)labelForContext:(id)a3;
- (id)specifiers;
- (id)ttyEnabledForSpecifier:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TTYSubscriptionsSettingsController

- (id)labelForContext:(id)a3
{
  id v3 = a3;
  v4 = +[RTTTelephonyUtilities sharedUtilityProvider];
  v5 = [v3 uuid];

  v6 = [v5 UUIDString];
  v7 = [v4 labelFromUUID:v6];

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[RTTTelephonyUtilities sharedUtilityProvider];
    v7 = [v6 subscriptionContexts];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __48__TTYSubscriptionsSettingsController_specifiers__block_invoke;
    v12[3] = &unk_209930;
    v12[4] = self;
    id v8 = v5;
    id v13 = v8;
    [v7 enumerateObjectsUsingBlock:v12];

    v9 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v8;
    id v10 = v8;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

void __48__TTYSubscriptionsSettingsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 labelForContext:v4];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:"ttyEnabledForSpecifier:" detail:objc_opt_class() cell:2 edit:0];

  [v6 setProperty:v4 forKey:PSSubscriptionContextKey];
  [*(id *)(a1 + 40) addObject:v6];
}

- (id)ttyEnabledForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:PSSubscriptionContextKey];
  if (v3)
  {
    id v4 = +[RTTSettings sharedInstance];
    if ([v4 TTYHardwareEnabledForContext:v3])
    {

LABEL_5:
      v7 = @"ON";
      goto LABEL_7;
    }
    id v5 = +[RTTSettings sharedInstance];
    unsigned int v6 = [v5 TTYSoftwareEnabledForContext:v3];

    if (v6) {
      goto LABEL_5;
    }
  }
  v7 = @"OFF";
LABEL_7:
  id v8 = settingsLocString(v7, @"Accessibility");

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TTYSubscriptionsSettingsController;
  [(TTYSubscriptionsSettingsController *)&v4 viewWillAppear:a3];
  [(TTYSubscriptionsSettingsController *)self reloadSpecifiers];
}

@end