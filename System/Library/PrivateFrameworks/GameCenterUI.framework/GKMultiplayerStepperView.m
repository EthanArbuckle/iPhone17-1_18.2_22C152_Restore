@interface GKMultiplayerStepperView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIButton)accessibilityDownButton;
- (UIButton)accessibilityUpButton;
- (_TtC12GameCenterUI24GKMultiplayerStepperView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI24GKMultiplayerStepperView)initWithFrame:(CGRect)a3;
- (void)didTapDown:(id)a3;
- (void)didTapUp:(id)a3;
- (void)layoutSubviews;
@end

@implementation GKMultiplayerStepperView

- (_TtC12GameCenterUI24GKMultiplayerStepperView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3E6B98();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1AF3E6C20();
  double v8 = v7;
  double v10 = v9;
  swift_unknownObjectRelease();

  double v11 = 0.0;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.var3 = v11;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF3E6EF8();
}

- (void)didTapDown:(id)a3
{
}

- (void)didTapUp:(id)a3
{
}

- (UIButton)accessibilityDownButton
{
  id v2 = sub_1AF3E72E4();

  return (UIButton *)v2;
}

- (UIButton)accessibilityUpButton
{
  id v2 = sub_1AF3E7324();

  return (UIButton *)v2;
}

- (_TtC12GameCenterUI24GKMultiplayerStepperView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_downButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_upButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_backgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI24GKMultiplayerStepperView_model);
}

@end