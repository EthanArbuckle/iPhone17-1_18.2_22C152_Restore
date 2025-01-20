@interface ColorViewController
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (SBIconImageInfo)iconImageInfo;
- (_TtC15ControlCenterUI19ColorViewController)initWithCoder:(id)a3;
- (_TtC15ControlCenterUI19ColorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)continuousCornerRadius;
- (id)sourceView;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)setVisibleBounds:(CGRect)a3;
- (void)viewDidLoad;
@end

@implementation ColorViewController

- (_TtC15ControlCenterUI19ColorViewController)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v5 = (int64x2_t *)((char *)self + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds);
  v5->i64[0] = 0;
  v5->i64[1] = 0;
  v5[1] = vdupq_n_s64(0x4049000000000000uLL);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners) = 1;
  id v6 = a3;

  result = (_TtC15ControlCenterUI19ColorViewController *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ColorViewController();
  v2 = (char *)v5.receiver;
  [(ColorViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setBackgroundColor_, *(void *)&v2[OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color]);
  }
  else
  {
    __break(1u);
  }
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  sub_1D7B66260((uint64_t)self, v3, v4, v5, v6, (uint64_t)a2, &OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_iconImageInfo);
}

- (id)sourceView
{
  v2 = self;
  id result = [(ColorViewController *)v2 view];
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
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds);
  double v5 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                 + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_visibleBounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setVisibleBounds:(CGRect)a3
{
}

- (double)continuousCornerRadius
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius);
}

- (void)setContinuousCornerRadius:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_continuousCornerRadius) = a3;
}

- (BOOL)showsSquareCorners
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners);
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_showsSquareCorners) = a3;
}

- (_TtC15ControlCenterUI19ColorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGRect result = (_TtC15ControlCenterUI19ColorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI19ColorViewController_color));
}

@end