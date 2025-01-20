@interface AccessPointWindow
- (BOOL)_canAffectStatusBarAppearance;
- (_TtC12GameCenterUI17AccessPointWindow)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17AccessPointWindow)initWithContentRect:(CGRect)a3;
- (_TtC12GameCenterUI17AccessPointWindow)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI17AccessPointWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
@end

@implementation AccessPointWindow

- (void)dealloc
{
  v2 = self;
  AccessPointWindow.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_accessPoint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_parent));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_rootView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_layoutView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_hostingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_leadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_trailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_topConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_bottomConstraint);
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3E5648();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_1AF3E5B98((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithWindowScene:(id)a3
{
  id v3 = a3;
  AccessPointWindow.init(windowScene:)();
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithFrame:(CGRect)a3
{
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithContentRect:(CGRect)a3
{
}

@end