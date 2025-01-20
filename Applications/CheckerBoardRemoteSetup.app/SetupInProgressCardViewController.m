@interface SetupInProgressCardViewController
- (_TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SetupInProgressCardViewController

- (_TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  return (_TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController *)sub_1000055E4(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_100006064();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager];
}

@end