@interface COTimerAddOnListenerProvider
- (BOOL)serviceShouldAcceptNewConnection:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (id)serviceListener;
@end

@implementation COTimerAddOnListenerProvider

- (OS_dispatch_queue)dispatchQueue
{
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coordination.COTimerService", v4);
    v6 = self->_dispatchQueue;
    self->_dispatchQueue = v5;

    dispatchQueue = self->_dispatchQueue;
  }
  return dispatchQueue;
}

- (id)serviceListener
{
  id v2 = objc_alloc(MEMORY[0x263F08D88]);
  v3 = (void *)[v2 initWithMachServiceName:*MEMORY[0x263F33EC8]];
  return v3;
}

- (BOOL)serviceShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.private.coordination"];
  if ([v4 BOOLValue])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 valueForEntitlement:@"com.apple.private.coordination.timers"];
    char v5 = [v6 BOOLValue];
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end