@interface AXMotionCuesSystemApertureViewController
- (BOOL)_canShowWhileLocked;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (_TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController)initWithCoder:(id)a3;
- (_TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)undoButtonTapped;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation AXMotionCuesSystemApertureViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  if (*(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content
                               + 24])
    return 4;
  else {
    return 3;
  }
}

- (int64_t)contentRole
{
  if (*(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content
                               + 24])
    return 2;
  else {
    return 1;
  }
}

- (unint64_t)presentationBehaviors
{
  return 24;
}

- (_TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_12C74();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXMotionCuesSystemApertureViewController();
  v2 = v3.receiver;
  [(AXMotionCuesSystemApertureViewController *)&v3 viewDidLoad];
  v2[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_needsLayout] = 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)sub_124D4((char *)self, (uint64_t)a2, (uint64_t (*)(void))sub_11C4C);
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)sub_124D4((char *)self, (uint64_t)a2, (uint64_t (*)(void))sub_11DE0);
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)sub_124D4((char *)self, (uint64_t)a2, (uint64_t (*)(void))sub_11C58);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_12D34();
  swift_unknownObjectRelease();
}

- (void)undoButtonTapped
{
  v2 = *(void (**)(void))&self->content[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content
                                      + 24];
  if (v2)
  {
    objc_super v3 = self;
    v2();
  }
}

- (_TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content
                              + 16];
  uint64_t v4 = *(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content
                               + 24];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10FBC(v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___leadingIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___minimalIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___textStackView));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___undoButton);
}

@end