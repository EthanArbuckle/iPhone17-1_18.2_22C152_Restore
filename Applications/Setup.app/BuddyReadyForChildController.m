@interface BuddyReadyForChildController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerAllowsNavigatingBack;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddySetupMethod)setupMethod;
- (_TtC5Setup28BuddyReadyForChildController)init;
- (_TtC5Setup28BuddyReadyForChildController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup28BuddyReadyForChildController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider;
- (void)continueTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setLockdownModeProvider:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyReadyForChildController

- (_TtC5Setup28BuddyReadyForChildController)init
{
  sub_1000253F8();
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100025658();
}

- (void)continueTapped
{
  v2 = self;
  sub_100026A98();
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return (BYPreferencesController *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_buddyPreferencesExcludedFromBackup];
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_buddyPreferencesExcludedFromBackup];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_buddyPreferencesExcludedFromBackup] = a3;
  id v3 = a3;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_flowItemDispositionProvider];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_flowItemDispositionProvider] = a3;
  id v3 = a3;
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP5Setup20LockdownModeProvider_ *)v2;
}

- (void)setLockdownModeProvider:(id)a3
{
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_lockdownModeProvider] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod] = a3;
  id v3 = a3;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 8;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100027C5C((uint64_t)sub_1000286D0, v5);

  swift_release();
}

- (_TtC5Setup28BuddyReadyForChildController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup28BuddyReadyForChildController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup28BuddyReadyForChildController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup28BuddyReadyForChildController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  id v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup28BuddyReadyForChildController_setupMethod];
}

@end