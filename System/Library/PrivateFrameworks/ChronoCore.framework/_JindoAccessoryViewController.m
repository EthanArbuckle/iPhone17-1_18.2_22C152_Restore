@interface _JindoAccessoryViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10ChronoCore29_JindoAccessoryViewController)initWithCoder:(id)a3;
- (_TtC10ChronoCore29_JindoAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation _JindoAccessoryViewController

- (_TtC10ChronoCore29_JindoAccessoryViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ChronoCore29_JindoAccessoryViewController__subscriptions) = (Class)MEMORY[0x1E4FBC870];
  id v4 = a3;

  result = (_TtC10ChronoCore29_JindoAccessoryViewController *)sub_1DAD28728();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
}

- (_TtC10ChronoCore29_JindoAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ChronoCore29_JindoAccessoryViewController__view));

  swift_bridgeObjectRelease();
}

@end