@interface ClientName
+ (id)extractClientNameFromString:(id)a3;
+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4;
- (_TtC7parsecd10ClientName)init;
@end

@implementation ClientName

+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0;
  }
  swift_getObjCClassMetadata();
  static ClientName.extractClientNameFromUserAgent(_:allowAbbreviation:)(v5, v7, a4);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

+ (id)extractClientNameFromString:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  static ClientName.extractClientNameFromString(_:)(v3, v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (_TtC7parsecd10ClientName)init
{
  return (_TtC7parsecd10ClientName *)ClientName.init()();
}

@end