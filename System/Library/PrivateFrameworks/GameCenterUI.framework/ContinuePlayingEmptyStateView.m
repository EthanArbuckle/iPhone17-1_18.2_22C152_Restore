@interface ContinuePlayingEmptyStateView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI29ContinuePlayingEmptyStateView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29ContinuePlayingEmptyStateView)initWithFrame:(CGRect)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation ContinuePlayingEmptyStateView

- (_TtC12GameCenterUI29ContinuePlayingEmptyStateView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29ContinuePlayingEmptyStateView *)sub_1AF75CB2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29ContinuePlayingEmptyStateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF75CF60();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF75D0EC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1AF75DF18(a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)didTapButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AF75E048();

  sub_1AF3A4630((uint64_t)v6, (uint64_t *)&unk_1E9AC4590);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29ContinuePlayingEmptyStateView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29ContinuePlayingEmptyStateView_button));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI29ContinuePlayingEmptyStateView_buttonHandler);

  sub_1AF368930(v3);
}

@end