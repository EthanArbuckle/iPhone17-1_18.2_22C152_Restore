@interface PreviewViewController
- (_TtC13ClarityCamera21PreviewViewController)initWithCoder:(id)a3;
- (_TtC13ClarityCamera21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PreviewViewController

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_100013B40();
  id v4 = [self sharedApplication];
  [v4 setIdleTimerDisabled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  v5 = self;
  id v6 = [v4 sharedApplication];
  [v6 setIdleTimerDisabled:0];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100013728();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PreviewViewController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[PreviewViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  sub_100013B40();
  swift_unknownObjectRelease();
}

- (_TtC13ClarityCamera21PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC13ClarityCamera21PreviewViewController *)sub_100013E70(v5, v7, a4);
}

- (_TtC13ClarityCamera21PreviewViewController)initWithCoder:(id)a3
{
  return (_TtC13ClarityCamera21PreviewViewController *)sub_100013FB0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
}

@end