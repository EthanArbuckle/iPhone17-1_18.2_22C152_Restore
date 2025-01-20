@interface BuddyChildSafetyController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BYRunState)runState;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (_TtC5Setup26BuddyChildSafetyController)init;
- (_TtC5Setup26BuddyChildSafetyController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup26BuddyChildSafetyController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueTapped;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setRunState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyChildSafetyController

- (_TtC5Setup26BuddyChildSafetyController)init
{
  return (_TtC5Setup26BuddyChildSafetyController *)sub_10001EBB4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001ED7C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10001F7A4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10001F884(a3);
}

- (void)continueTapped
{
  v3 = self;
  v2 = [(BuddyWelcomeController *)v3 delegate];
  if (v2)
  {
    [(BFFFlowItemDelegate *)v2 flowItemDone:v3];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v4 = *(id *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_flowItemDispositionProvider];
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_flowItemDispositionProvider] = a3;
  id v3 = a3;
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
  *(void *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC5Setup26BuddyChildSafetyController_runState] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 16;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)controllerNeedsToRun
{
  v2 = self;
  char v3 = sub_10001FAF8();

  return v3 & 1;
}

- (_TtC5Setup26BuddyChildSafetyController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup26BuddyChildSafetyController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup26BuddyChildSafetyController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup26BuddyChildSafetyController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end