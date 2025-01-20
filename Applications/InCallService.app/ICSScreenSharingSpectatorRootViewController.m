@interface ICSScreenSharingSpectatorRootViewController
- (BOOL)_canShowWhileLocked;
- (ICSScreenSharingSpectatorRootViewController)initWithCallDisplayStyleManager:(id)a3;
- (ICSScreenSharingSpectatorRootViewController)initWithCoder:(id)a3;
- (ICSScreenSharingSpectatorRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHPIPController)pipController;
- (id)parentViewControllerForRestoringPiP;
- (id)pipSourceProvider;
- (unint64_t)supportedInterfaceOrientations;
- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3;
- (void)loadView;
- (void)pipStateDidChangeNotification:(id)a3;
- (void)setPipController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICSScreenSharingSpectatorRootViewController

- (PHPIPController)pipController
{
  v2 = sub_1001C285C();

  return (PHPIPController *)v2;
}

- (void)setPipController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001C28E8((uint64_t)a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = sub_1001C2930();

  return (unint64_t)v3;
}

- (ICSScreenSharingSpectatorRootViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v4 = a3;
  return (ICSScreenSharingSpectatorRootViewController *)sub_1001C2948(a3);
}

- (ICSScreenSharingSpectatorRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C2BEC();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  sub_1001C2C90();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001C3088();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1001C3144(a3);
}

- (void)pipStateDidChangeNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_1001C3204();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (id)pipSourceProvider
{
  v2 = self;
  id v3 = (void *)sub_1001C3418();

  return v3;
}

- (id)parentViewControllerForRestoringPiP
{
  v2 = self;
  id v3 = (void *)sub_1001C3488();

  return v3;
}

- (void)handlePIPViewControllerRestoredAfterPIPStopped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001C34F8();
}

- (ICSScreenSharingSpectatorRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_1001C3584();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_callDisplayStyleManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_containerViewController));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSScreenSharingSpectatorRootViewController_pipController);
}

@end