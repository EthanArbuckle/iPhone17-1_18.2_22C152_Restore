@interface QRCodeScannerCardViewController
- (_TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController)initWithContentView:(id)a3;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation QRCodeScannerCardViewController

- (_TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  return (_TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController *)sub_10000E08C(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v3 = self;
  sub_10000E874();
  sub_10000F23C();
}

- (void)viewDidAppear:(BOOL)a3
{
  if (*(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession])
  {
    v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession];
    [v3 startRunning:a3];
  }
  else
  {
    id v4 = self;
    sub_10000E74C();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession;
  id v4 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession];
  if (v4)
  {
    v6 = self;
    id v7 = v4;
    [v7 stopRunning];
    id v8 = *(id *)&self->PRXCardContentViewController_opaque[v3];
    *(void *)&self->PRXCardContentViewController_opaque[v3] = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for QRCodeScannerCardViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[QRCodeScannerCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_10000FB50;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10000E5B4;
  v11[3] = &unk_100020EE0;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  sub_1000063A8(0, &qword_100027A78);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_10000F86C(v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager];
}

@end