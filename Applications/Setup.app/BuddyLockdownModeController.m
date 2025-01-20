@interface BuddyLockdownModeController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)enableTappedAndReturnError:(id *)a3;
- (BYRunState)runState;
- (BuddySetupMethod)setupMethod;
- (_TtC5Setup27BuddyLockdownModeController)init;
- (_TtC5Setup27BuddyLockdownModeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup27BuddyLockdownModeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider;
- (void)setLockdownModeProvider:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)setUpLaterTapped;
- (void)viewDidLoad;
@end

@implementation BuddyLockdownModeController

- (_TtC5Setup27BuddyLockdownModeController)init
{
  sub_100019EF8();
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001A144();
}

- (BOOL)enableTappedAndReturnError:(id *)a3
{
  v3 = self;
  sub_10001A3BC();

  return 1;
}

- (void)setUpLaterTapped
{
  v2 = self;
  sub_10001ABFC();
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP5Setup20LockdownModeProvider_ *)v2;
}

- (void)setLockdownModeProvider:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return (BuddySetupMethod *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod];
}

- (void)setSetupMethod:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod] = a3;
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
  return 12;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = self;
  char v3 = sub_10001B478();

  return v3 & 1;
}

- (_TtC5Setup27BuddyLockdownModeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup27BuddyLockdownModeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup27BuddyLockdownModeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup27BuddyLockdownModeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  char v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup27BuddyLockdownModeController_setupMethod];
}

@end