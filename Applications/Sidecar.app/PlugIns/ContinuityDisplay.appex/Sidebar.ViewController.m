@interface Sidebar.ViewController
- (BOOL)_canShowWhileLocked;
- (_TtCO17ContinuityDisplay7Sidebar14ViewController)initWithCoder:(id)a3;
- (_TtCO17ContinuityDisplay7Sidebar14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_actionButtonPressed:(id)a3;
- (void)_stateButtonPressed:(id)a3;
- (void)_toggleButtonDown:(id)a3;
- (void)_toggleButtonUpIn:(id)a3;
- (void)loadView;
@end

@implementation Sidebar.ViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtCO17ContinuityDisplay7Sidebar14ViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001B898();
}

- (void)loadView
{
  v2 = self;
  sub_10001B97C();
}

- (void)_actionButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C418((uint64_t)v4);
}

- (void)_stateButtonPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C4F0((uint64_t)v4);
}

- (void)_toggleButtonDown:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C5EC(v4);
}

- (void)_toggleButtonUpIn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C680(v4);
}

- (_TtCO17ContinuityDisplay7Sidebar14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10005E920();
  }
  id v5 = a4;
  sub_10001D260();
}

- (void).cxx_destruct
{
  sub_10001A3E0((uint64_t)self + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_topStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_centerStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_bottomStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_topMarginConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_bottomMarginConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController_widthConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar14ViewController__lastDownButton);
}

@end