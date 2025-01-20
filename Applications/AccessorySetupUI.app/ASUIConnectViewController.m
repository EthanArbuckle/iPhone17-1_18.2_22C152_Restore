@interface ASUIConnectViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC16AccessorySetupUI25ASUIConnectViewController)initWithContentView:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)dealloc;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASUIConnectViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ASUIConnectViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_100037758(a3);
}

- (void)dealloc
{
  id v2 = self;
  sub_100034CAC();
}

- (void).cxx_destruct
{
  sub_10000CC2C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_router]);
  sub_10000CBC4(*(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext], *(void *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext], *(void *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 7]);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_super v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_discoverySpinner];
}

- (_TtC16AccessorySetupUI25ASUIConnectViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC16AccessorySetupUI25ASUIConnectViewController *)sub_1000378CC((uint64_t)a3);

  return v5;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000379E0();
}

@end