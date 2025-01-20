@interface OnboardingAdPrivacyHeaderIconView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView)init;
- (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation OnboardingAdPrivacyHeaderIconView

- (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView)init
{
  return (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView *)sub_10037FDF4();
}

- (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView_label;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView_backgroundView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIView) init];

  result = (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003801A0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_100380420();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView_label));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension33OnboardingAdPrivacyHeaderIconView_backgroundView);
}

@end