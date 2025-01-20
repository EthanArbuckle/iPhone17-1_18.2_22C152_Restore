@interface BuddyIntentController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)skippedByCloudConfigWithEnvironment:(id)a3;
- (BOOL)controllerNeedsToRun;
- (BYAnalyticsEventAppearance)analyticsEventAppearance;
- (BYRunState)runState;
- (BuddyChildSetupPresenter)childSetupPresenter;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyNetworkProvider)networkProvider;
- (BuddySetupMethod)setupMethod;
- (MCProfileConnection)managedConfiguration;
- (ProximitySetupController)proximitySetupController;
- (_TtC5Setup21BuddyIntentController)init;
- (_TtC5Setup21BuddyIntentController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup21BuddyIntentController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)showModalWiFiSettingsBlock;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsEventAppearance:(id)a3;
- (void)setChildSetupPresenter:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)setShowModalWiFiSettingsBlock:(id)a3;
- (void)setUpForChildTapped;
- (void)setUpForMyselfTapped;
- (void)viewDidLoad;
@end

@implementation BuddyIntentController

- (_TtC5Setup21BuddyIntentController)init
{
  sub_100015EA8();
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001609C();
}

- (void)setUpForMyselfTapped
{
  v2 = self;
  sub_1000163F8();
}

- (void)setUpForChildTapped
{
  v2 = self;
  sub_100016670();
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod] = a3;
  id v3 = a3;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_flowItemDispositionProvider];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_flowItemDispositionProvider] = a3;
  id v3 = a3;
}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_proximitySetupController];
}

- (void)setProximitySetupController:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_proximitySetupController];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_proximitySetupController] = a3;
  id v3 = a3;
}

- (MCProfileConnection)managedConfiguration
{
  return (MCProfileConnection *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_managedConfiguration];
}

- (void)setManagedConfiguration:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_managedConfiguration];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_managedConfiguration] = a3;
  id v3 = a3;
}

- (BYAnalyticsEventAppearance)analyticsEventAppearance
{
  return (BYAnalyticsEventAppearance *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_analyticsEventAppearance];
}

- (void)setAnalyticsEventAppearance:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_analyticsEventAppearance];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_analyticsEventAppearance] = a3;
  id v3 = a3;
}

- (BuddyChildSetupPresenter)childSetupPresenter
{
  return (BuddyChildSetupPresenter *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_childSetupPresenter];
}

- (void)setChildSetupPresenter:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_childSetupPresenter];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_childSetupPresenter] = a3;
  id v3 = a3;
}

- (BuddyNetworkProvider)networkProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BuddyNetworkProvider *)v2;
}

- (void)setNetworkProvider:(id)a3
{
}

- (id)showModalWiFiSettingsBlock
{
  if (*(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock])
  {
    uint64_t v2 = *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock
                                                          + 8];
    v5[4] = *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100031900;
    v5[3] = &unk_1002AFA80;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000188C8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];
  uint64_t v8 = *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_100017EDC(v8);
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
  return 2;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = self;
  char v3 = sub_100017454();

  return v3 & 1;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = [a3 setupMethod];
  if (v4)
  {
    id v5 = v4;
    if (![v4 intent]) {
      [v5 setIntent:1];
    }
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_100017EEC((char *)v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)controllerWasPopped
{
  NSString v2 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_setupMethod];
  if (v2) {
    [v2 setIntent:0];
  }
}

- (_TtC5Setup21BuddyIntentController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup21BuddyIntentController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup21BuddyIntentController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup21BuddyIntentController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v3 = *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup21BuddyIntentController_showModalWiFiSettingsBlock];

  sub_100017EDC(v3);
}

@end