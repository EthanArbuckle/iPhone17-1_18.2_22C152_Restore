@interface NSXPCConnection(CoreRC)
- (uint64_t)corerc_checkEntitlement:()CoreRC;
@end

@implementation NSXPCConnection(CoreRC)

- (uint64_t)corerc_checkEntitlement:()CoreRC
{
  v1 = objc_msgSend(a1, "valueForEntitlement:");
  return [v1 BOOLValue];
}

@end