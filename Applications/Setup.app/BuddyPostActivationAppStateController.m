@interface BuddyPostActivationAppStateController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BYAnalyticsManager)analyticsManager;
- (BYCapabilities)capabilities;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (ProximitySetupController)proximitySetupController;
- (_TtC5Setup37BuddyPostActivationAppStateController)init;
- (_TtC5Setup37BuddyPostActivationAppStateController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup37BuddyPostActivationAppStateController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueSetupTapped;
- (void)eraseTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyPostActivationAppStateController

- (_TtC5Setup37BuddyPostActivationAppStateController)init
{
  sub_100041BCC();
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100041E64();
}

- (void)continueSetupTapped
{
  v2 = self;
  v3 = [(BuddyWelcomeController *)v2 delegate];
  if (v3)
  {
    [(BFFFlowItemDelegate *)v3 flowItemDone:v2];

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)eraseTapped
{
  v2 = self;
  sub_1000420AC();
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return (BYPreferencesController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_buddyPreferencesExcludedFromBackup];
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_buddyPreferencesExcludedFromBackup];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_buddyPreferencesExcludedFromBackup] = a3;
  id v3 = a3;
}

- (ProximitySetupController)proximitySetupController
{
  return (ProximitySetupController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_proximitySetupController];
}

- (void)setProximitySetupController:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_proximitySetupController];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_proximitySetupController] = a3;
  id v3 = a3;
}

- (BYAnalyticsManager)analyticsManager
{
  return (BYAnalyticsManager *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_analyticsManager];
}

- (void)setAnalyticsManager:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_analyticsManager];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup37BuddyPostActivationAppStateController_analyticsManager] = a3;
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

+ (id)cloudConfigSkipKey
{
  if (os_variant_has_internal_ui())
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return v2;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = self;
  char v3 = sub_100042470();

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  type metadata accessor for MainActor();
  v11 = self;
  swift_retain();
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  v13[5] = sub_1000436D8;
  v13[6] = v9;
  sub_100041A28((uint64_t)v7, (uint64_t)&unk_10031E270, (uint64_t)v13);

  swift_release();
  swift_release();
}

- (_TtC5Setup37BuddyPostActivationAppStateController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup37BuddyPostActivationAppStateController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup37BuddyPostActivationAppStateController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup37BuddyPostActivationAppStateController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end