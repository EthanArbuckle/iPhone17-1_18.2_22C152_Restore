@interface DefaultPairedDeviceFeatureAttributesDataSource
- (_TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource)init;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
@end

@implementation DefaultPairedDeviceFeatureAttributesDataSource

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1E0EB3690();
  swift_unknownObjectRelease();
}

- (_TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource)init
{
  result = (_TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource_activePairedDeviceProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource_featureAvailabilityStore));
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSource_logger;
  uint64_t v4 = sub_1E0ECC010();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
}

@end