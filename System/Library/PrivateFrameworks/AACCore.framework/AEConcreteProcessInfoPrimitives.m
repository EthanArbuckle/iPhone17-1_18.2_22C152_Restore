@interface AEConcreteProcessInfoPrimitives
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isBeingTested;
@end

@implementation AEConcreteProcessInfoPrimitives

- (BOOL)hasEntitlement:(id)a3
{
  v3 = (void *)MEMORY[0x263F08AB0];
  id v4 = a3;
  v5 = [v3 processInfo];
  char v6 = objc_msgSend(v5, "ae_hasEntitlement:withValue:", v4, MEMORY[0x263EFFA88]);

  return v6;
}

- (BOOL)isBeingTested
{
  v2 = [MEMORY[0x263F08AB0] processInfo];
  char v3 = objc_msgSend(v2, "ae_isBeingTested");

  return v3;
}

@end