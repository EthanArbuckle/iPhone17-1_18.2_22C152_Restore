@interface NSXPCConnection(CoordinationClient)
- (id)co_originalInterruptionHandler;
- (id)co_originalInvalidationHandler;
- (void)co_setOriginalInterruptionHandler:()CoordinationClient;
- (void)co_setOriginalInvalidationHandler:()CoordinationClient;
@end

@implementation NSXPCConnection(CoordinationClient)

- (void)co_setOriginalInterruptionHandler:()CoordinationClient
{
  id v4 = (id)MEMORY[0x21D4BD7F0](a3);
  objc_setAssociatedObject(a1, sel_co_originalInterruptionHandler, v4, (void *)1);
}

- (void)co_setOriginalInvalidationHandler:()CoordinationClient
{
  id v4 = (id)MEMORY[0x21D4BD7F0](a3);
  objc_setAssociatedObject(a1, sel_co_originalInvalidationHandler, v4, (void *)1);
}

- (id)co_originalInterruptionHandler
{
  return objc_getAssociatedObject(a1, sel_co_originalInterruptionHandler);
}

- (id)co_originalInvalidationHandler
{
  return objc_getAssociatedObject(a1, sel_co_originalInvalidationHandler);
}

@end