@interface BuddySilentModeController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (_TtC5Setup25BuddySilentModeController)init;
- (_TtC5Setup25BuddySilentModeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup25BuddySilentModeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (int64_t)preferredStatusBarStyle;
- (void)continueTapped;
- (void)viewDidLoad;
@end

@implementation BuddySilentModeController

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  id v3 = [(BuddySilentModeController *)v2 traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    return 1;
  }
  else {
    return 3;
  }
}

- (_TtC5Setup25BuddySilentModeController)init
{
  return (_TtC5Setup25BuddySilentModeController *)sub_10000BFC4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000C1C4();
}

- (void)continueTapped
{
  id v3 = self;
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

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (_TtC5Setup25BuddySilentModeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup25BuddySilentModeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup25BuddySilentModeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup25BuddySilentModeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end