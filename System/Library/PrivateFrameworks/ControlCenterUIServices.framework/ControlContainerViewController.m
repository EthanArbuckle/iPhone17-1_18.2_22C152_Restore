@interface ControlContainerViewController
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (SBIconImageInfo)iconImageInfo;
- (_TtC23ControlCenterUIServices30ControlContainerViewController)initWithCoder:(id)a3;
- (_TtC23ControlCenterUIServices30ControlContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)continuousCornerRadius;
- (id)sourceView;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ControlContainerViewController

- (_TtC23ControlCenterUIServices30ControlContainerViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners) = 0;
  id v4 = a3;

  result = (_TtC23ControlCenterUIServices30ControlContainerViewController *)sub_24A7DCD00();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24A7CB180();
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  v7 = (double *)((char *)self + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo);
  *(void *)v7 = v3;
  *((void *)v7 + 1) = v4;
  *((void *)v7 + 2) = v5;
  v7[3] = v6;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController), sel_setCompactContinuousCornerRadius_, a3, v6);
}

- (id)sourceView
{
  v2 = self;
  id result = [(ControlContainerViewController *)v2 view];
  if (result)
  {
    id v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)visibleBounds
{
  MEMORY[0x270F108D8](*(double *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo), *(double *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)continuousCornerRadius
{
  return *(double *)((char *)&self->super._overrideTransitioningDelegate
                   + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo);
}

- (BOOL)showsSquareCorners
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners);
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners) = a3;
}

- (_TtC23ControlCenterUIServices30ControlContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGRect result = (_TtC23ControlCenterUIServices30ControlContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController));
}

@end