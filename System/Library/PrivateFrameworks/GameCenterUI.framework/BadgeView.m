@interface BadgeView
- (BOOL)isHidden;
- (CGRect)frame;
- (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation BadgeView

- (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *)sub_1AF6DEAB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6DECC8();
}

- (BOOL)isHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF6DEE04();

  return v3 & 1;
}

- (void)setHidden:(BOOL)a3
{
  v4 = self;
  sub_1AF6DD3C4(a3);
}

- (CGRect)frame
{
  v2 = self;
  sub_1AF6DEFCC();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  sub_1AF6DF07C(x, y, width, height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF6DF3E8();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_badgeSize);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_badgeBorderWidth);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_badgeTransparentMaskLayer));
  swift_unknownObjectWeakDestroy();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_kvoFrameToken);
}

@end