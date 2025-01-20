@interface FeatureRegulatoryInfoProvider
- (_TtC8HealthUI29FeatureRegulatoryInfoProvider)init;
@end

@implementation FeatureRegulatoryInfoProvider

- (_TtC8HealthUI29FeatureRegulatoryInfoProvider)init
{
  result = (_TtC8HealthUI29FeatureRegulatoryInfoProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI29FeatureRegulatoryInfoProvider_featureAvailabilityStore));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI29FeatureRegulatoryInfoProvider_logger;
  uint64_t v4 = sub_1E0ECC010();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8HealthUI29FeatureRegulatoryInfoProvider__featureRegulatoryInfo;
  sub_1E0EA0E08(0, &qword_1EAD6FA60, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
}

@end