@interface ClarityRootController
- (_TtC12ClarityBoard21ClarityRootController)initWithCoder:(id)a3;
- (_TtC12ClarityBoard21ClarityRootController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)keyboardDidShowWithNotification:(id)a3;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClarityRootController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000259CC();
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100025CE4(v4);
}

- (void)keyboardDidShowWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100026004(v4);
}

- (_TtC12ClarityBoard21ClarityRootController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC12ClarityBoard21ClarityRootController *)sub_10002729C(v5, v7, a4);
}

- (_TtC12ClarityBoard21ClarityRootController)initWithCoder:(id)a3
{
  return (_TtC12ClarityBoard21ClarityRootController *)sub_100027424(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12ClarityBoard21ClarityRootController_heightConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12ClarityBoard21ClarityRootController_closeKeyboardView);
}

@end