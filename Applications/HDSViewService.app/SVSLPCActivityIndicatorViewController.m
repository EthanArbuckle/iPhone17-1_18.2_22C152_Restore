@interface SVSLPCActivityIndicatorViewController
- (_TtC14HDSViewService37SVSLPCActivityIndicatorViewController)initWithCoder:(id)a3;
- (_TtC14HDSViewService37SVSLPCActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)complete;
- (void)reset;
- (void)spin;
- (void)viewDidLoad;
@end

@implementation SVSLPCActivityIndicatorViewController

- (void)viewDidLoad
{
  v2 = self;
  SVSLPCActivityIndicatorViewController.viewDidLoad()();
}

- (void)spin
{
  v2 = self;
  sub_10008C62C();
}

- (void)complete
{
  v2 = self;
  sub_10008C85C();
}

- (void)reset
{
  v2 = self;
  sub_10008C518();
}

- (_TtC14HDSViewService37SVSLPCActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC14HDSViewService37SVSLPCActivityIndicatorViewController_v;
  id v9 = objc_allocWithZone((Class)type metadata accessor for SVSLEDPasscodeActivityIndicatorView());
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];

  if (v7)
  {
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for SVSLPCActivityIndicatorViewController();
  v13 = [(SVSLPCActivityIndicatorViewController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC14HDSViewService37SVSLPCActivityIndicatorViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC14HDSViewService37SVSLPCActivityIndicatorViewController_v;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SVSLEDPasscodeActivityIndicatorView());
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SVSLPCActivityIndicatorViewController();
  id v9 = [(SVSLPCActivityIndicatorViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService37SVSLPCActivityIndicatorViewController_v));
}

@end