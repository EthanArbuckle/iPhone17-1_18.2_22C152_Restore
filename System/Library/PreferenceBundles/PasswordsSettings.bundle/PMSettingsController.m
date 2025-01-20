@interface PMSettingsController
- (BOOL)shouldReloadSpecifiersOnResume;
- (PMSettingsController)initWithCoder:(id)a3;
- (PMSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)allowAutomaticPasskeyUpgrades;
- (id)isAutomaticStrongPasswordsEnabled;
- (id)openAutoFillSettings;
- (id)passwordBreachDetectionState;
- (id)showServiceNamesInPasswordsState;
- (id)specifiers;
- (void)accountStoreDidChange;
- (void)openPasswordsApp;
- (void)presentNeverSavedSheetView;
- (void)presentPasskeysLearnMoreView;
- (void)setAllowAutomaticPasskeyUpgrades:(id)a3 for:(id)a4;
- (void)setAutomaticStrongPasswordsEnabled:(id)a3 for:(id)a4;
- (void)setPasswordBreachDetectionState:(id)a3 for:(id)a4;
- (void)setShowServiceNamesInPasswords:(id)a3 for:(id)a4;
- (void)showPasswordsPrivacySheet;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PMSettingsController

- (PMSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_D190();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (PMSettingsController *)sub_5310(v5, v7, a4);
}

- (PMSettingsController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_9D0C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_5670(a3);
}

- (id)specifiers
{
  v2 = self;
  sub_5914();

  v3.super.isa = sub_D1B0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)setPasswordBreachDetectionState:(id)a3 for:(id)a4
{
}

- (id)passwordBreachDetectionState
{
  return sub_8664(self, (uint64_t)a2, (uint64_t)WBSPasswordBreachSettings_ptr, (SEL *)&selRef_isPasswordBreachDetectionEnabled);
}

- (void)setShowServiceNamesInPasswords:(id)a3 for:(id)a4
{
}

- (id)showServiceNamesInPasswordsState
{
  return sub_8664(self, (uint64_t)a2, (uint64_t)WBSSavedAccountStore_ptr, (SEL *)&selRef_shouldShowServiceNamesForPasswordAndPasskeyItems);
}

- (void)setAllowAutomaticPasskeyUpgrades:(id)a3 for:(id)a4
{
}

- (id)allowAutomaticPasskeyUpgrades
{
  return sub_8664(self, (uint64_t)a2, (uint64_t)WBSFeatureAvailability_ptr, (SEL *)&selRef_isAutomaticPasskeyUpgradesEnabled);
}

- (void)setAutomaticStrongPasswordsEnabled:(id)a3 for:(id)a4
{
}

- (id)isAutomaticStrongPasswordsEnabled
{
  return sub_8664(self, (uint64_t)a2, (uint64_t)WBSFeatureAvailability_ptr, (SEL *)&selRef_isAutomaticStrongPasswordsEnabled);
}

- (void)showPasswordsPrivacySheet
{
  uint64_t v5 = self;
  swift_bridgeObjectRetain();
  NSString v2 = sub_D180();
  swift_bridgeObjectRelease();
  NSArray v3 = (PMSettingsController *)[self presenterForPrivacySplashWithIdentifier:v2];

  if (v3)
  {
    [(PMSettingsController *)v3 setPresentingViewController:v5];
    [(PMSettingsController *)v3 present];

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)presentNeverSavedSheetView
{
  sub_A264(&qword_14F48);
  __chkstk_darwin();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_D230();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_D210();
  uint64_t v6 = self;
  uint64_t v7 = sub_D200();
  id v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  sub_8C68((uint64_t)v4, (uint64_t)&unk_14F58, (uint64_t)v8);

  swift_release();
}

- (void)accountStoreDidChange
{
  NSString v2 = self;
  sub_8F1C();
}

- (void)presentPasskeysLearnMoreView
{
  NSString v2 = self;
  sub_909C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)openPasswordsApp
{
  uint64_t v0 = sub_D040();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self defaultWorkspace];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [self passwordManagerURL];
    sub_D020();

    sub_D010(v7);
    uint64_t v9 = v8;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_6418((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_D170().super.isa;
    swift_bridgeObjectRelease();
    [v5 openSensitiveURL:v9 withOptions:isa];
  }
  else
  {
    __break(1u);
  }
}

- (id)openAutoFillSettings
{
  sub_A264(&qword_14F70);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v12 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_D040();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D030();
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v1, v2);
    id result = [self defaultWorkspace];
    if (result)
    {
      id v8 = result;
      sub_D010(v7);
      v10 = v9;
      sub_6418((uint64_t)&_swiftEmptyArrayStorage);
      Class isa = sub_D170().super.isa;
      swift_bridgeObjectRelease();
      [v8 openSensitiveURL:v10 withOptions:isa];

      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  __break(1u);
  return result;
}

@end