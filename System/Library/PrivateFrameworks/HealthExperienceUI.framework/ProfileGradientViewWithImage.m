@interface ProfileGradientViewWithImage
- (_TtC18HealthExperienceUI28ProfileGradientViewWithImage)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI28ProfileGradientViewWithImage)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProfileGradientViewWithImage

- (_TtC18HealthExperienceUI28ProfileGradientViewWithImage)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD43E28C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileGradientViewWithImage();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ProfileGradientViewWithImage *)&v6 traitCollectionDidChange:v4];
  sub_1AD43A1D4();
}

- (_TtC18HealthExperienceUI28ProfileGradientViewWithImage)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage_profileImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage____lazy_storage___disclosureIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28ProfileGradientViewWithImage____lazy_storage___watchIconImage));
  swift_bridgeObjectRelease();
}

@end