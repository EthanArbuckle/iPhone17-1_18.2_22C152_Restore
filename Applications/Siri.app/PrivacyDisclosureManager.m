@interface PrivacyDisclosureManager
+ (BOOL)appRequiresPreflightWithAppBundleId:(id)a3;
- (_TtC4Siri24PrivacyDisclosureManager)init;
@end

@implementation PrivacyDisclosureManager

+ (BOOL)appRequiresPreflightWithAppBundleId:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v6 = sub_10007E83C(v3, v5, 0);
  v8 = v6;
  if (v6)
  {
    if (qword_1001703C8 != -1) {
      swift_once();
    }
    unsigned __int8 v9 = [(id)qword_100170C90 requiresPreflightForApplicationRecord:v8];
    swift_bridgeObjectRelease();

    return v9;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

- (_TtC4Siri24PrivacyDisclosureManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PrivacyDisclosureManager();
  return [(PrivacyDisclosureManager *)&v3 init];
}

@end