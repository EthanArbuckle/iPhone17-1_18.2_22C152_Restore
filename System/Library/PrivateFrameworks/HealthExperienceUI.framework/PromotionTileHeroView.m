@interface PromotionTileHeroView
- (_TtC18HealthExperienceUI21PromotionTileHeroView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI21PromotionTileHeroView)initWithFrame:(CGRect)a3;
@end

@implementation PromotionTileHeroView

- (_TtC18HealthExperienceUI21PromotionTileHeroView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_previousConfiguration;
  uint64_t v9 = sub_1AD73BF60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_watchView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_uiView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_imageTopConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_imageHeightConstraint) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PromotionTileHeroView();
  return -[PromotionTileHeroView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI21PromotionTileHeroView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI21PromotionTileHeroView *)sub_1AD378408(a3);
}

- (void).cxx_destruct
{
  sub_1AD378D10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_previousConfiguration, (uint64_t (*)(void))sub_1AD3786E0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_watchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_uiView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_imageTopConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI21PromotionTileHeroView_imageHeightConstraint);
}

@end