@interface DebugRecordReplayViewController
- (_TtC11AssetViewer31DebugRecordReplayViewController)initWithCoder:(id)a3;
- (_TtC11AssetViewer31DebugRecordReplayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)blinkButtonPressed;
- (void)helpDismissVC;
- (void)playButtonPressed;
- (void)recordButtonPressed;
- (void)resetButtonPressed;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)tappedWithRecognizer:(id)a3;
- (void)viewDidLoad;
@end

@implementation DebugRecordReplayViewController

- (_TtC11AssetViewer31DebugRecordReplayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E29124B0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E290A730();
}

- (void)helpDismissVC
{
  v2 = self;
  sub_1E290BD9C();
}

- (void)tappedWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E290C680(v4);
}

- (void)recordButtonPressed
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_state))
  {
    if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_state) != 1) {
      return;
    }
    id v4 = self;
    v2 = self;
    sub_1E290EA68();
  }
  else
  {
    id v4 = self;
    id v3 = self;
    sub_1E290E260();
  }
}

- (void)playButtonPressed
{
  if (!*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_state))
  {
    v2 = self;
    sub_1E290F728();
  }
}

- (void)resetButtonPressed
{
  v2 = self;
  sub_1E290C9CC();
}

- (void)blinkButtonPressed
{
  v2 = self;
  sub_1E290CE68();
}

- (_TtC11AssetViewer31DebugRecordReplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11AssetViewer31DebugRecordReplayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_arqlVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_overlayView));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  sub_1E286EC24((uint64_t)self + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_modelURL, &qword_1EADCC240);
  id v3 = (char *)self + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_arRecordingURL;
  uint64_t v4 = sub_1E2991AA8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_blinkTimer));
  v5 = (char *)self + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_optionsToBlink;
  uint64_t v6 = sub_1E2992D78();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController____lazy_storage___replayObserver);
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  DebugRecordReplayViewController.session(_:didUpdate:)((ARSession)v6, (ARFrame)v7);
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AssetViewer31DebugRecordReplayViewController_arqlVC);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    id v10 = v4;
    sub_1E292BC10(v8);
  }
}

- (void)sessionWasInterrupted:(id)a3
{
}

- (void)sessionInterruptionEnded:(id)a3
{
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
}

@end