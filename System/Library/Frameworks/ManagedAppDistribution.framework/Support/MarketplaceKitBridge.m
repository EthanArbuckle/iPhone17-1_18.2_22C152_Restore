@interface MarketplaceKitBridge
+ (void)requestLicenseRepair:(id)a3 status:(int)a4;
- (_TtC19applicensedeliveryd20MarketplaceKitBridge)init;
@end

@implementation MarketplaceKitBridge

+ (void)requestLicenseRepair:(id)a3 status:(int)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  static LicenseRepair.requestLicenseRepair(_:status:)();

  _swift_bridgeObjectRelease(v5);
}

- (_TtC19applicensedeliveryd20MarketplaceKitBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MarketplaceKitBridge *)&v3 init];
}

@end