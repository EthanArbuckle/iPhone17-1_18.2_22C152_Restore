@interface FinanceRemoteViewController
- (_TtC16FinanceUIService27FinanceRemoteViewController)initWithCoder:(id)a3;
- (_TtC16FinanceUIService27FinanceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
@end

@implementation FinanceRemoteViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100010228;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10000F078(a3, v6, v7);
  sub_1000094D8((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_100010118;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10000F69C(a3, v6, v7);
  sub_1000094D8((uint64_t)v6);
}

- (_TtC16FinanceUIService27FinanceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  id v8 = a4;
  Logger.init(subsystem:category:)();
  if (v7)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FinanceRemoteViewController();
  v10 = [(FinanceRemoteViewController *)&v12 initWithNibName:v9 bundle:v8];

  return v10;
}

- (_TtC16FinanceUIService27FinanceRemoteViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  Logger.init(subsystem:category:)();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FinanceRemoteViewController();
  v5 = [(FinanceRemoteViewController *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log;
  uint64_t v3 = type metadata accessor for Logger();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end