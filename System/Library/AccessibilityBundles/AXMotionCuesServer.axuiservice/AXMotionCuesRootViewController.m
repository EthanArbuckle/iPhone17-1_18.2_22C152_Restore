@interface AXMotionCuesRootViewController
- (BOOL)_canShowWhileLocked;
- (_TtC18AXMotionCuesServer30AXMotionCuesRootViewController)initWithCoder:(id)a3;
- (_TtC18AXMotionCuesServer30AXMotionCuesRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)updateLayout;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AXMotionCuesRootViewController

- (_TtC18AXMotionCuesServer30AXMotionCuesRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18794();
}

- (void)dealloc
{
  v2 = self;
  AXMotionCuesRootViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AXMotionCuesRootViewController();
  id v2 = v9.receiver;
  [(AXMotionCuesRootViewController *)&v9 viewDidLoad];
  id v3 = objc_msgSend(v2, "view", v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    [v3 frame];
    double v6 = v5;
    double v8 = v7;

    sub_16EE0(v6, v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  AXMotionCuesRootViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  AXMotionCuesRootViewController.viewWillTransition(to:with:)(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)updateLayout
{
  id v2 = self;
  sub_16934();
}

- (_TtC18AXMotionCuesServer30AXMotionCuesRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18AXMotionCuesServer30AXMotionCuesRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end