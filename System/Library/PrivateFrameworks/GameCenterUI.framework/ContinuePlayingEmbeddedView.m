@interface ContinuePlayingEmbeddedView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI27ContinuePlayingEmbeddedView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI27ContinuePlayingEmbeddedView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ContinuePlayingEmbeddedView

- (_TtC12GameCenterUI27ContinuePlayingEmbeddedView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27ContinuePlayingEmbeddedView *)sub_1AF37A338(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI27ContinuePlayingEmbeddedView)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF37A50C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_1AF37A5EC(a4, width);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI27ContinuePlayingEmbeddedView_gridView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI27ContinuePlayingEmbeddedView_emptyStateView);
}

@end