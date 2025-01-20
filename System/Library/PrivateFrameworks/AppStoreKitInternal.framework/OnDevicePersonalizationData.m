@interface OnDevicePersonalizationData
- (NSArray)userSegments;
- (NSString)appId;
- (_TtC19AppStoreKitInternal27OnDevicePersonalizationData)init;
@end

@implementation OnDevicePersonalizationData

- (NSString)appId
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)userSegments
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5C238();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC19AppStoreKitInternal27OnDevicePersonalizationData)init
{
  result = (_TtC19AppStoreKitInternal27OnDevicePersonalizationData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end