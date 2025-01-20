@interface WBViewController
- (BOOL)handleEvent:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (_TtC12ClarityBoard16WBViewController)initWithCoder:(id)a3;
- (_TtC12ClarityBoard16WBViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarUpdateAnimation;
@end

@implementation WBViewController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  return 0;
}

- (_TtC12ClarityBoard16WBViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for WBViewController();
  v9 = [(WBViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC12ClarityBoard16WBViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WBViewController();
  return [(WBViewController *)&v5 initWithCoder:a3];
}

@end