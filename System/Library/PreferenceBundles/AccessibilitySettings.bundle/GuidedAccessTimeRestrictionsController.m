@interface GuidedAccessTimeRestrictionsController
- (id)nameOfTimeRestrictionsAlertToneForSpecifier:(id)a3;
- (id)shouldSpeakForTimeRestrictionsAlertPreferenceForSpecifier:(id)a3;
- (id)specifiers;
- (void)setShouldSpeakForTimeRestrictionsAlertPreference:(id)a3 specifier:(id)a4;
@end

@implementation GuidedAccessTimeRestrictionsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(GuidedAccessTimeRestrictionsController *)self loadSpecifiersFromPlistName:@"GuidedAccessTimeRestrictionsSettings" target:self];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)nameOfTimeRestrictionsAlertToneForSpecifier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = [v3 guidedAccessToneIdentifierForTimeRestrictionEvents];
  uint64_t v5 = +[TLToneManager sharedToneManager];
  v6 = [v5 nameForToneIdentifier:v4];

  return v6;
}

- (id)shouldSpeakForTimeRestrictionsAlertPreferenceForSpecifier:(id)a3
{
  uint64_t v3 = +[AXSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 guidedAccessShouldSpeakForTimeRestrictionEvents]);

  return v4;
}

- (void)setShouldSpeakForTimeRestrictionsAlertPreference:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[AXSettings sharedInstance];
  [v5 setGuidedAccessShouldSpeakForTimeRestrictionEvents:v4];
}

@end