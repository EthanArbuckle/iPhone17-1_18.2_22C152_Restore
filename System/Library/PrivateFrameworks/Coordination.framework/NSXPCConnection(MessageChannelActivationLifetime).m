@interface NSXPCConnection(MessageChannelActivationLifetime)
- (uint64_t)activated;
- (void)setActivated:()MessageChannelActivationLifetime;
@end

@implementation NSXPCConnection(MessageChannelActivationLifetime)

- (void)setActivated:()MessageChannelActivationLifetime
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_activated, v2, (void *)1);
}

- (uint64_t)activated
{
  v1 = objc_getAssociatedObject(a1, sel_activated);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end