@interface _BESwiftCBridge
+ (BOOL)checkEntitlement:(id)a3 forAuditToken:(id *)a4;
+ (BOOL)checkEntitlementForCurrentProcess:(id)a3;
- (_BESwiftCBridge)init;
@end

@implementation _BESwiftCBridge

+ (BOOL)checkEntitlement:(id)a3 forAuditToken:(id *)a4
{
  uint64_t v4 = sub_243237698();
  char v6 = sub_243237430(v4, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (BOOL)checkEntitlementForCurrentProcess:(id)a3
{
  uint64_t v3 = sub_243237698();
  char v5 = sub_24323755C(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_BESwiftCBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftCBridge();
  return [(_BESwiftCBridge *)&v3 init];
}

@end