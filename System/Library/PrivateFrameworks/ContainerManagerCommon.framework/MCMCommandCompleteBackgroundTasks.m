@interface MCMCommandCompleteBackgroundTasks
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandCompleteBackgroundTasks

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 46;
}

- (void)execute
{
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = MCMSharedBackgroundQueue();
  dispatch_barrier_async_and_wait(v4, &__block_literal_global_13588);

  v5 = MCMSharedSlowWorkloop();
  dispatch_barrier_async_and_wait(v5, &__block_literal_global_2);

  v6 = MCMDataProtectionQueue();
  dispatch_barrier_async_and_wait(v6, &__block_literal_global_4);

  v7 = [(MCMCommand *)self resultPromise];
  v8 = [[MCMResultBase alloc] initWithError:0];
  [v7 completeWithResult:v8];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  v4 = [v3 codeSignInfo];
  v5 = [v4 entitlements];

  if ([v5 allowed]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 testabilityAllowed];
  }

  return v6;
}

@end