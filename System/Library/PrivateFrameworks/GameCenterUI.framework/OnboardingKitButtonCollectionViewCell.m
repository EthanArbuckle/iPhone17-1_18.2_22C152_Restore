@interface OnboardingKitButtonCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation OnboardingKitButtonCollectionViewCell

- (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell *)sub_1AF559E08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF559FFC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  double v9 = sub_1AF55A170((uint64_t)a4, width, height);
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF55A30C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF55A3FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37OnboardingKitButtonCollectionViewCell_button));
}

@end