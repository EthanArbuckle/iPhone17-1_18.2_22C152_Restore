@interface OnDevicePersonalizationDataContainer
- (NSDictionary)metricsData;
- (NSDictionary)personalizationData;
- (_TtC19AppStoreKitInternal36OnDevicePersonalizationDataContainer)init;
@end

@implementation OnDevicePersonalizationDataContainer

- (NSDictionary)personalizationData
{
  type metadata accessor for OnDevicePersonalizationData();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5BCA8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSDictionary)metricsData
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5BCA8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC19AppStoreKitInternal36OnDevicePersonalizationDataContainer)init
{
  result = (_TtC19AppStoreKitInternal36OnDevicePersonalizationDataContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end