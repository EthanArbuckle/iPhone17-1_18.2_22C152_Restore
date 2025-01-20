@interface SetupStartViewController
- (_TtC14AppleIDSetupUI24SetupStartViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation SetupStartViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SetupStartViewController();
  v2 = (char *)v6.receiver;
  [(SetupStartViewController *)&v6 viewDidLoad];
  v3 = (uint64_t *)&v2[OBJC_IVAR____TtC14AppleIDSetupUI24SetupStartViewController_deviceModel];
  swift_bridgeObjectRetain();
  sub_24834DC20();
  swift_bridgeObjectRelease();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  swift_bridgeObjectRetain();
  sub_24834D550(v4, v5);
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setDismissalType_, 3, v6.receiver, v6.super_class);
}

- (_TtC14AppleIDSetupUI24SetupStartViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC14AppleIDSetupUI24SetupStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end