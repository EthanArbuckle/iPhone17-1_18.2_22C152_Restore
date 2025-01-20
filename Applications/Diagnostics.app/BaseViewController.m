@interface BaseViewController
- (_TtC11Diagnostics18BaseViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics18BaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation BaseViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseViewController();
  v2 = v6.receiver;
  id v3 = [(BaseViewController *)&v6 viewDidLoad];
  uint64_t v4 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x50))(v3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x58))(v4);
  (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x60))(v5);
}

- (_TtC11Diagnostics18BaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for BaseViewController();
  v9 = [(BaseViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC11Diagnostics18BaseViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BaseViewController();
  return [(BaseViewController *)&v5 initWithCoder:a3];
}

@end