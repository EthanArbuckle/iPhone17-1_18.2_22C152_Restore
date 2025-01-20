@interface IntroOfferEligibilityCheck
- (IntroOfferEligibilityCheck)init;
- (NSString)bundleID;
- (NSString)groupID;
- (NSString)logKey;
- (NSString)storefrontID;
- (id)initForGroupID:(id)a3 bundleID:(id)a4 storefrontID:(id)a5 logKey:(id)a6;
- (int64_t)eligibilityBasedOnStatus:(id)a3;
@end

@implementation IntroOfferEligibilityCheck

- (NSString)groupID
{
  return (NSString *)sub_100139A00((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1001398F4);
}

- (NSString)bundleID
{
  return (NSString *)sub_100139A00((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100139938);
}

- (NSString)storefrontID
{
  sub_1001399BC();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)logKey
{
  return (NSString *)sub_100139A00((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_100139A50);
}

- (id)initForGroupID:(id)a3 bundleID:(id)a4 storefrontID:(id)a5 logKey:(id)a6
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5)
  {
    uint64_t v15 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    return sub_100139A7C(v8, v10, v11, v13, (uint64_t)a5, v15, v16, v18);
  }
  a5 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  return sub_100139A7C(v8, v10, v11, v13, (uint64_t)a5, v15, v16, v18);
}

- (int64_t)eligibilityBasedOnStatus:(id)a3
{
  if (a3) {
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  int64_t v6 = sub_100139C68(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (IntroOfferEligibilityCheck)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end