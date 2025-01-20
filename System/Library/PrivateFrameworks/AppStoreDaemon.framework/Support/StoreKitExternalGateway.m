@interface StoreKitExternalGateway
+ (_TtC9appstored23StoreKitExternalGateway)shared;
- (_TtC9appstored23StoreKitExternalGateway)init;
- (void)handleExternalPurchaseTokenInfoDictionary:(id)a3 bundleID:(id)a4;
@end

@implementation StoreKitExternalGateway

+ (_TtC9appstored23StoreKitExternalGateway)shared
{
  if (qword_1005A3008 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B14B8;
  return (_TtC9appstored23StoreKitExternalGateway *)v2;
}

- (void)handleExternalPurchaseTokenInfoDictionary:(id)a3 bundleID:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  v9 = self;
  sub_1000590B0(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC9appstored23StoreKitExternalGateway)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(StoreKitExternalGateway *)&v3 init];
}

@end