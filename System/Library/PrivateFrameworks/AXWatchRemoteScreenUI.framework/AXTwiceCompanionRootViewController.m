@interface AXTwiceCompanionRootViewController
- (BOOL)_canShowWhileLocked;
- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController)initWithCoder:(id)a3;
- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)airplayDidStartStreamingWithMirroringLayer:(id)a3;
- (void)airplayDidStopStreaming;
- (void)axActionPerformWithAction:(int)a3 value:(id)a4 bridgeElement:(id)a5;
- (void)axElementActivate:(CGPoint)a3;
- (void)crownButtonLongPressed;
- (void)crownButtonPressed;
- (void)crownButtonScrollDown;
- (void)crownButtonScrollUp;
- (void)dealloc;
- (void)dismissButtonTappedWithSender:(id)a3;
- (void)doubleCrownButtonPressed;
- (void)pullToDismissViewController;
- (void)sideButtonLongPressed;
- (void)sideButtonPressed;
- (void)stingButtonKeycord;
- (void)stingButtonLongPressed;
- (void)stingButtonPressed;
- (void)tripleCrownButtonPressed;
- (void)twiceRemoteScreenReceiveMessage:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXTwiceCompanionRootViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_22C05EA2C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_22C05F308(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_22C05F7A4(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger);
  v3 = self;
  id v4 = v2;
  sub_22C06CAB0();

  id v5 = sub_22C05D478();
  objc_msgSend(v5, sel_cleanup);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for AXTwiceCompanionRootViewController();
  [(AXTwiceCompanionRootViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_eventSerialQueue));
  sub_22C06C1D4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___airplayReceiver));
  swift_bridgeObjectRelease();
  sub_22C06C1D4(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___eventProcessor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_remoteMessenger));
  v3 = (char *)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_currentState;
  uint64_t v4 = sub_22C06CBD0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_22C06B978((uint64_t)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_inactiveDate, &qword_26849E340);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController____lazy_storage___inactiveTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_mainVC));
  sub_22C06B978((uint64_t)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController_viewDidAppearDate, &qword_26849E340);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *)AXTwiceCompanionRootViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController)initWithCoder:(id)a3
{
  return (_TtC21AXWatchRemoteScreenUI34AXTwiceCompanionRootViewController *)AXTwiceCompanionRootViewController.init(coder:)(a3);
}

- (void)twiceRemoteScreenReceiveMessage:(id)a3
{
  uint64_t v4 = sub_22C06CCA0();
  uint64_t v5 = self;
  AXTwiceCompanionRootViewController.twiceRemoteScreenReceiveMessage(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)dismissButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_22C06BF18(0xD00000000000001CLL, 0x800000022C06FC80);
}

- (void)airplayDidStartStreamingWithMirroringLayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AXTwiceCompanionRootViewController.airplayDidStartStreaming(withMirroringLayer:)((CALayer)v4);
}

- (void)airplayDidStopStreaming
{
  v2 = self;
  AXTwiceCompanionRootViewController.airplayDidStopStreaming()();
}

- (void)axElementActivate:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v5 = self;
  AXTwiceCompanionRootViewController.axElementActivate(_:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
}

- (void)crownButtonPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonPressed()();
}

- (void)doubleCrownButtonPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.doubleCrownButtonPressed()();
}

- (void)tripleCrownButtonPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.tripleCrownButtonPressed()();
}

- (void)crownButtonScrollUp
{
  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonScrollUp()();
}

- (void)crownButtonScrollDown
{
  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonScrollDown()();
}

- (void)crownButtonLongPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.crownButtonLongPressed()();
}

- (void)sideButtonPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.sideButtonPressed()();
}

- (void)sideButtonLongPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.sideButtonLongPressed()();
}

- (void)axActionPerformWithAction:(int)a3 value:(id)a4 bridgeElement:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    v9 = self;
    swift_unknownObjectRetain();
    sub_22C06CE60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v10 = a5;
    v11 = self;
  }
  AXTwiceCompanionRootViewController.axActionPerform(action:value:bridgeElement:)(a3, (uint64_t)v12, a5);

  sub_22C06B978((uint64_t)v12, &qword_26849E3D0);
}

- (void)pullToDismissViewController
{
  v2 = self;
  AXTwiceCompanionRootViewController.pullToDismissViewController()();
}

- (void)stingButtonPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.stingButtonPressed()();
}

- (void)stingButtonLongPressed
{
  v2 = self;
  AXTwiceCompanionRootViewController.stingButtonLongPressed()();
}

- (void)stingButtonKeycord
{
  v2 = self;
  AXTwiceCompanionRootViewController.stingButtonKeycord()();
}

@end