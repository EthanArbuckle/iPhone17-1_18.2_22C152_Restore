@interface VibrancyHostView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI16VibrancyHostView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI16VibrancyHostView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation VibrancyHostView

- (_TtC12GameCenterUI16VibrancyHostView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF760DA0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_1AF760E3C(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF760EF4();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  sub_1AF761044((uint64_t)a4);
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

- (_TtC12GameCenterUI16VibrancyHostView)initWithEffect:(id)a3
{
  id v3 = a3;
  sub_1AF7610F0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI16VibrancyHostView_embeddedView);
}

@end