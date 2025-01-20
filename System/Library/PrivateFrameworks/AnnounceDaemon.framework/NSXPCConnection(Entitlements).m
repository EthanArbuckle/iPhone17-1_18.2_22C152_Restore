@interface NSXPCConnection(Entitlements)
- (uint64_t)clientID;
- (uint64_t)hasAnnounceEntitlement;
@end

@implementation NSXPCConnection(Entitlements)

- (uint64_t)clientID
{
  return [a1 valueForEntitlement:*MEMORY[0x1E4F4A960]];
}

- (uint64_t)hasAnnounceEntitlement
{
  v1 = [a1 valueForEntitlement:*MEMORY[0x1E4F4A968]];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end