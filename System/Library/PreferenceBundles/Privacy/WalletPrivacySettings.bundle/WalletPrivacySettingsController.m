@interface WalletPrivacySettingsController
- (_TtC21WalletPrivacySettings31WalletPrivacySettingsController)init;
- (_TtC21WalletPrivacySettings31WalletPrivacySettingsController)initWithCoder:(id)a3;
- (_TtC21WalletPrivacySettings31WalletPrivacySettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)getAuthWithSpecifier:(id)a3;
- (id)specifiers;
- (void)appProtectionCoordinatorDidGainAccess;
- (void)applicationDidBecomeActive;
- (void)applicationWillResignActive;
- (void)authChanged:(unint64_t)a3 :(id)a4;
- (void)dealloc;
- (void)didAddDeactivationReasonWithNotification:(id)a3;
- (void)didEnterBackground;
- (void)didRemoveDeactivationReasonWithNotification:(id)a3;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willEnterForeground;
@end

@implementation WalletPrivacySettingsController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_E87C(v3);
}

- (_TtC21WalletPrivacySettings31WalletPrivacySettingsController)init
{
  return (_TtC21WalletPrivacySettings31WalletPrivacySettingsController *)sub_ED48();
}

- (_TtC21WalletPrivacySettings31WalletPrivacySettingsController)initWithCoder:(id)a3
{
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator];
  v5 = self;
  [v4 unregisterObserver:v5];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(WalletPrivacySettingsController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  BOOL v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController____lazy_storage___shieldViewController];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(WalletPrivacySettingsController *)&v3 loadView];
  sub_23E5C();
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  sub_F220();
}

- (id)specifiers
{
  id v2 = self;
  objc_super v3 = sub_F364();

  if (v3)
  {
    v4.super.isa = sub_27168().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (id)getAuthWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10220(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = sub_270B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (void)authChanged:(unint64_t)a3 :(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  sub_11168(v5);
}

- (_TtC21WalletPrivacySettings31WalletPrivacySettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC21WalletPrivacySettings31WalletPrivacySettingsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)appProtectionCoordinatorDidGainAccess
{
  id v2 = self;
  sub_24608(1u);
}

- (void)didEnterBackground
{
  id v2 = self;
  sub_24D60();
}

- (void)willEnterForeground
{
  id v2 = self;
  sub_23E5C();
}

- (void)applicationWillResignActive
{
  self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationActive] = 0;
  if (self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationInAppSwitcher] == 1)
  {
    id v2 = self;
    sub_24D60();
  }
}

- (void)applicationDidBecomeActive
{
  self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationActive] = 1;
  if ((self->PSListController_opaque[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationInAppSwitcher] & 1) == 0)
  {
    id v2 = self;
    sub_23E5C();
  }
}

- (void)didAddDeactivationReasonWithNotification:(id)a3
{
}

- (void)didRemoveDeactivationReasonWithNotification:(id)a3
{
}

@end