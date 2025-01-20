@interface ProgressBarView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI15ProgressBarView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI15ProgressBarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProgressBarView

- (_TtC12GameCenterUI15ProgressBarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI15ProgressBarView *)sub_1AF7106CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI15ProgressBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF710A94();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  double v6 = self;
  sub_1AF710CC4(width);
  double v8 = v7;
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

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF710EF8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15ProgressBarView_progressFillView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI15ProgressBarView_progressTrackView);
}

@end