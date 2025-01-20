@interface AMDSwiftTests
+ (id)strToIntWithStrValue:(id)a3;
- (_TtC19AppleMediaDiscovery13AMDSwiftTests)init;
@end

@implementation AMDSwiftTests

+ (id)strToIntWithStrValue:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  uint64_t v6 = sub_20ACD4FF0();
  uint64_t v7 = v4;
  swift_getObjCClassMetadata();
  static AMDSwiftTests.strToInt(strValue:)(v6, v7);
  swift_bridgeObjectRelease();

  v9 = (void *)sub_20ACD4FE0();
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC19AppleMediaDiscovery13AMDSwiftTests)init
{
  return (_TtC19AppleMediaDiscovery13AMDSwiftTests *)AMDSwiftTests.init()();
}

@end