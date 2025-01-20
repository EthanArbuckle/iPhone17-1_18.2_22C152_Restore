@interface ProfileGradientsProvider
- (_TtC18HealthExperienceUI24ProfileGradientsProvider)init;
@end

@implementation ProfileGradientsProvider

- (_TtC18HealthExperienceUI24ProfileGradientsProvider)init
{
  v3 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18HealthExperienceUI24ProfileGradientsProvider_topCategories) = (Class)MEMORY[0x1E4FBC860];
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI24ProfileGradientsProvider_colors;
  v8 = v3;
  sub_1AD221BBC();
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1AD73DAD0();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC18HealthExperienceUI24ProfileGradientsProvider_categoriesMetadata) = v3;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ProfileGradientsProvider();
  return [(ProfileGradientsProvider *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end