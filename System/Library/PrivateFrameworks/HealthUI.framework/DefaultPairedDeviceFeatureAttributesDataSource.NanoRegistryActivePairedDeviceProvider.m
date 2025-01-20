@interface DefaultPairedDeviceFeatureAttributesDataSource.NanoRegistryActivePairedDeviceProvider
- (_TtCC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSourceP33_3C865D9EABCD2E889047E2D14D69B8F938NanoRegistryActivePairedDeviceProvider)init;
@end

@implementation DefaultPairedDeviceFeatureAttributesDataSource.NanoRegistryActivePairedDeviceProvider

- (_TtCC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSourceP33_3C865D9EABCD2E889047E2D14D69B8F938NanoRegistryActivePairedDeviceProvider)init
{
  result = (_TtCC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSourceP33_3C865D9EABCD2E889047E2D14D69B8F938NanoRegistryActivePairedDeviceProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSourceP33_3C865D9EABCD2E889047E2D14D69B8F938NanoRegistryActivePairedDeviceProvider_pairedDeviceRegistry));
  v3 = (char *)self
     + OBJC_IVAR____TtCC8HealthUI46DefaultPairedDeviceFeatureAttributesDataSourceP33_3C865D9EABCD2E889047E2D14D69B8F938NanoRegistryActivePairedDeviceProvider_logger;
  uint64_t v4 = sub_1E0ECC010();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
}

@end