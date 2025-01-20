@interface QOSControllerViewController
- (BOOL)_canShowWhileLocked;
- (_TtC17ContinuityDisplay27QOSControllerViewController)initWithCoder:(id)a3;
- (_TtC17ContinuityDisplay27QOSControllerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation QOSControllerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17ContinuityDisplay27QOSControllerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000FCA4();
}

- (void)loadView
{
  v2 = self;
  sub_10000FD6C();
}

- (_TtC17ContinuityDisplay27QOSControllerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10005E920();
  }
  id v5 = a4;
  sub_1000102B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay27QOSControllerViewController_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay27QOSControllerViewController_label));

  swift_bridgeObjectRelease();
}

@end