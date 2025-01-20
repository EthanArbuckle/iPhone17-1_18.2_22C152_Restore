@interface AXTwiceCompanionMainViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController)initWithCoder:(id)a3;
- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)cardSwipeDownWithGesture:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXTwiceCompanionMainViewController

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AXTwiceCompanionMainViewController();
  v4 = (char *)v6.receiver;
  [(AXTwiceCompanionMainViewController *)&v6 viewDidAppear:v3];
  LODWORD(v3) = *MEMORY[0x263F831C0];
  v5 = (id *)&v4[OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel];
  swift_beginAccess();
  UIAccessibilityPostNotification(v3, *v5);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22C04F6B0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)cardSwipeDownWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22C051114(v4);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_22C06CCD0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController *)AXTwiceCompanionMainViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController)initWithCoder:(id)a3
{
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController *)AXTwiceCompanionMainViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___watchDeviceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController____lazy_storage___deviceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_statusLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_pullToDismissManager));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionMainViewController_cardBackgroundView);
}

@end