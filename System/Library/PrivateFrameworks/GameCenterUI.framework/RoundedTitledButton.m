@interface RoundedTitledButton
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI19RoundedTitledButton)initWithFrame:(CGRect)a3;
- (double)_cornerRadius;
- (void)_setCornerRadius:(double)a3;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
@end

@implementation RoundedTitledButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1AF714AF8(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)didTapButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF714CA4();
}

- (double)_cornerRadius
{
  v2 = self;
  sub_1AF714DB0();
  double v4 = v3;

  return v4;
}

- (void)_setCornerRadius:(double)a3
{
  double v4 = self;
  sub_1AF714A28(a3);
}

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF714A74();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  double v4 = self;
  sub_1AF714AAC(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  double v9 = sub_1AF715064((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease();

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF7151D4();
}

- (_TtC12GameCenterUI19RoundedTitledButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI19RoundedTitledButton_height);
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI19RoundedTitledButton_tapHandler));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI19RoundedTitledButton_visualEffectView);
}

@end