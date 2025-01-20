@interface BannerBaseViewController
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (_TtC13MediaRemoteUI24BannerBaseViewController)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI24BannerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)bannerLongPressActionWithSender:(id)a3;
- (void)bannerTapActionWithSender:(id)a3;
- (void)dealloc;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BannerBaseViewController

- (NSString)requesterIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)requestIdentifier
{
  NSString v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
  v3 = self;
  id v4 = [v2 requestIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (_TtC13MediaRemoteUI24BannerBaseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100028A18();
}

- (void)dealloc
{
  NSString v2 = self;
  sub_100026C48();
}

- (void).cxx_destruct
{
  sub_100008C10((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_100026DC8();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100026F28(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1000277D0(a3);
}

- (void)bannerTapActionWithSender:(id)a3
{
}

- (void)bannerLongPressActionWithSender:(id)a3
{
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_100027ECC();
  swift_unknownObjectRelease();
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (_TtC13MediaRemoteUI24BannerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13MediaRemoteUI24BannerBaseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end