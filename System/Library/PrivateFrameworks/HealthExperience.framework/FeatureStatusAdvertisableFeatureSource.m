@interface FeatureStatusAdvertisableFeatureSource
- (_TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource)init;
@end

@implementation FeatureStatusAdvertisableFeatureSource

- (_TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource)init
{
  result = (_TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource_queue));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self+ OBJC_IVAR____TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource_advertisableFeatureSourceProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource_featureStatusProvider);
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC16HealthExperience38FeatureStatusAdvertisableFeatureSource_delegate;

  sub_1C2899788((uint64_t)v3);
}

@end