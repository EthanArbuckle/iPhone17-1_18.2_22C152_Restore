@interface SpecifierHeaderView
- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithFrame:(CGRect)a3;
- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
@end

@implementation SpecifierHeaderView

- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithSpecifier:(id)a3
{
  return (_TtC18HealthExperienceUI19SpecifierHeaderView *)sub_1AD4C02DC(a3);
}

- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView_statusText);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___iconImageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___descriptionLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___statusLabel) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI19SpecifierHeaderView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SpecifierHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3, *(double *)(MEMORY[0x1E4FB2C68] + 8), v3, v4);
  return v5;
}

- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI19SpecifierHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView_image));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___descriptionLabel));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___statusLabel);
}

@end