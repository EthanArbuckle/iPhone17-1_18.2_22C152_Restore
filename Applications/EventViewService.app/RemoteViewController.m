@interface RemoteViewController
+ (BOOL)_isSecureForRemoteViewService;
- (_TtC16EventViewService20RemoteViewController)initWithCoder:(id)a3;
- (_TtC16EventViewService20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
@end

@implementation RemoteViewController

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100044BCC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1000433B0(a3, v6, v7);
  sub_100009CD8((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(const void *))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = v6[2];
    id v9 = a3;
    v10 = self;
    v8(v7);
    _Block_release(v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100044A30(0, &qword_1001A6988);
    sub_100044A6C();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_100043CE8(v4);

  swift_bridgeObjectRelease();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC16EventViewService20RemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for RemoteViewController();
  id v9 = [(RemoteViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC16EventViewService20RemoteViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteViewController();
  return [(RemoteViewController *)&v5 initWithCoder:a3];
}

@end