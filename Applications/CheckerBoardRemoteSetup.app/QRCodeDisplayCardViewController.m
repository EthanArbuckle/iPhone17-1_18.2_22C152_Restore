@interface QRCodeDisplayCardViewController
- (_TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController)initWithContentView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QRCodeDisplayCardViewController

- (_TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  return (_TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController *)sub_100010290(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_100013364();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
}

@end