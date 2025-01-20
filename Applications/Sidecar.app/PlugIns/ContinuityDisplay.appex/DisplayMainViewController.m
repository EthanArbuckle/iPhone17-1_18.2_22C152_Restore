@interface DisplayMainViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)backgrounded;
- (BOOL)canBecomeFirstResponder;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (BOOL)waitForServiceReady;
- (DisplayMainViewController)initWithCoder:(id)a3;
- (DisplayMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSUndoManager)undoManager;
- (SidecarRequest)request;
- (int)_preferredStatusBarVisibility;
- (int64_t)requestCompleted;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)_batteryStateChangedWithNote:(id)a3;
- (void)_displayModeChanged:(id)a3;
- (void)_keyboardFrameChangedWithNote:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)paste:(id)a3;
- (void)receivedItems:(id)a3;
- (void)requestDidFinish:(id)a3;
- (void)requestDidStart:(id)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)sidecarServiceActive;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DisplayMainViewController

- (NSUndoManager)undoManager
{
  v2 = sub_10002EF80();

  return (NSUndoManager *)v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)waitForServiceReady
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  return 1;
}

- (SidecarRequest)request
{
  v2 = sub_10002F014();

  return (SidecarRequest *)v2;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  v2 = self;
  unint64_t v3 = sub_10002F0A4();

  return v3;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = self;
  char v3 = sub_10002F1AC();

  return v3 & 1;
}

- (void)dealloc
{
  v2 = self;
  sub_10002F278();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10003D9C0(*(void **)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_snapshot], *(void **)&self->displayViewController[OBJC_IVAR___DisplayMainViewController_snapshot]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_10003D8AC((uint64_t)&self->SidecarServiceViewController_opaque[OBJC_IVAR___DisplayMainViewController_usageSummary], &qword_100084D40);
  swift_release();

  swift_unknownObjectRelease();
}

- (void)loadView
{
  v2 = self;
  sub_10002F470();
}

- (void)_keyboardFrameChangedWithNote:(id)a3
{
}

- (void)_batteryStateChangedWithNote:(id)a3
{
  uint64_t v4 = sub_10005E4A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005E460();
  v8 = self;
  sub_10002FF38();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)_displayModeChanged:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100030D70(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100030F30(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10003106C((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)requestDidStart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100031158(v4);
}

- (void)requestDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100031374();
}

- (void)receivedItems:(id)a3
{
  sub_100007F60(0, &qword_1000843F8);
  sub_10005EAC0();

  swift_bridgeObjectRelease();
}

- (int64_t)requestCompleted
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1000361B8();
}

- (void)sidecarServiceActive
{
  v2 = self;
  sub_1000362B8();
}

- (void)cut:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (DisplayMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (DisplayMainViewController *)sub_10003B6B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100036E38);
}

- (DisplayMainViewController)initWithCoder:(id)a3
{
  return (DisplayMainViewController *)sub_1000370D4(a3);
}

- (BOOL)backgrounded
{
  v2 = self;
  unsigned __int8 v3 = sub_100039634();

  return v3 & 1;
}

- (void)setBackgrounded:(BOOL)a3
{
  id v4 = self;
  sub_1000396B8(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end