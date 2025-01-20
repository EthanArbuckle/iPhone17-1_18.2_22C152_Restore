@interface BuddyStolenDeviceProtectionController
+ (BOOL)hiddenFromMultiUser;
+ (BOOL)hiddenFromStoreDemoMode;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BYCapabilities)capabilities;
- (BYExpressSettingsSetupCache)expressSettingsCache;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (BuddyFeatureFlags)featureFlags;
- (BuddyMiscState)miscState;
- (BuddySetupMethod)setupMethod;
- (MCProfileConnection)managedConfiguration;
- (_TtC5Setup37BuddyStolenDeviceProtectionController)init;
- (_TtC5Setup37BuddyStolenDeviceProtectionController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup37BuddyStolenDeviceProtectionController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)applicationDidBecomeActive;
- (void)notNowTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setExpressSettingsCache:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)turnOnTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyStolenDeviceProtectionController

- (_TtC5Setup37BuddyStolenDeviceProtectionController)init
{
  sub_10002AE90();
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10002B250();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10002B718(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BuddyStolenDeviceProtectionController();
  v4 = (char *)v5.receiver;
  [(BuddyStolenDeviceProtectionController *)&v5 viewDidDisappear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_notificationCenter] removeObserver:v4 name:UIApplicationDidBecomeActiveNotification object:0];
}

- (MCProfileConnection)managedConfiguration
{
  return (MCProfileConnection *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_managedConfiguration];
}

- (void)setManagedConfiguration:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_managedConfiguration];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_managedConfiguration] = a3;
  id v3 = a3;
}

- (BYCapabilities)capabilities
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYCapabilities *)v2;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return (BYPaneFeatureAnalyticsManager *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_paneFeatureAnalyticsManager];
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_paneFeatureAnalyticsManager];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_paneFeatureAnalyticsManager] = a3;
  id v3 = a3;
}

- (BuddyFeatureFlags)featureFlags
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BuddyFeatureFlags *)v2;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return (BYPreferencesController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_buddyPreferencesExcludedFromBackup];
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_buddyPreferencesExcludedFromBackup];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_buddyPreferencesExcludedFromBackup] = a3;
  id v3 = a3;
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return (BuddyMiscState *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_miscState];
}

- (void)setMiscState:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_miscState];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_miscState] = a3;
  id v3 = a3;
}

- (BYExpressSettingsSetupCache)expressSettingsCache
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYExpressSettingsSetupCache *)v2;
}

- (void)setExpressSettingsCache:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_setupMethod];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_setupMethod] = a3;
  id v3 = a3;
}

+ (id)cloudConfigSkipKey
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = self;
  char v3 = sub_10002BC70();

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  objc_super v5 = self;
  sub_10002FC68((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)turnOnTapped
{
  NSString v2 = self;
  sub_10002C3D8();
}

- (void)notNowTapped
{
  NSString v2 = self;
  sub_10002CB2C();
}

- (void)applicationDidBecomeActive
{
  if (*(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_postAuthenticationWorkItem])
  {
    NSString v2 = self;
    swift_retain();
    dispatch thunk of DispatchWorkItem.perform()();

    swift_release();
  }
}

- (_TtC5Setup37BuddyStolenDeviceProtectionController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup37BuddyStolenDeviceProtectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup37BuddyStolenDeviceProtectionController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup37BuddyStolenDeviceProtectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  char v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyStolenDeviceProtectionController_setupMethod];
}

@end