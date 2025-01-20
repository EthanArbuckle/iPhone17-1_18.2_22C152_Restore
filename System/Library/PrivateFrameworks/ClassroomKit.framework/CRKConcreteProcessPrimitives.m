@interface CRKConcreteProcessPrimitives
- (BOOL)processExistsWithIdentifier:(int)a3;
- (id)subscribeToExitForProcessWithIdentifier:(int)a3 exitHandler:(id)a4;
@end

@implementation CRKConcreteProcessPrimitives

- (BOOL)processExistsWithIdentifier:(int)a3
{
  return kill(a3, 0) != 3;
}

- (id)subscribeToExitForProcessWithIdentifier:(int)a3 exitHandler:(id)a4
{
  uintptr_t v4 = a3;
  id v5 = a4;
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF83E0], v4, 0x80000000uLL, MEMORY[0x263EF83A0]);
  v7 = +[CRKDispatchSourceSubscription subscriptionWithSource:v6 handler:v5];

  return v7;
}

@end