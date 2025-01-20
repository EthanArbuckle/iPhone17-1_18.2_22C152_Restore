@interface NSXPCConnection(ARAdditions)
- (id)ar_entitlementsArray;
- (uint64_t)ar_BOOLeanValueForEntitlement:()ARAdditions;
- (uint64_t)ar_hasPrivateAREntitlement:()ARAdditions;
- (uint64_t)ar_processBundleIdentifier;
- (uint64_t)ar_processName;
@end

@implementation NSXPCConnection(ARAdditions)

- (uint64_t)ar_processBundleIdentifier
{
  uint64_t v1 = [a1 processIdentifier];
  return MEMORY[0x270F106D8](v1);
}

- (uint64_t)ar_processName
{
  uint64_t v1 = [a1 processIdentifier];
  return MEMORY[0x270F08D60](v1);
}

- (id)ar_entitlementsArray
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.security.arkit"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = (id)MEMORY[0x263EFFA68];
  }

  return v2;
}

- (uint64_t)ar_hasPrivateAREntitlement:()ARAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "ar_entitlementsArray");
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

- (uint64_t)ar_BOOLeanValueForEntitlement:()ARAdditions
{
  uint64_t v1 = objc_msgSend(a1, "valueForEntitlement:");
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end