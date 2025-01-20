@interface PairSetupPromptForSetupCodeDelegateCallback
@end

@implementation PairSetupPromptForSetupCodeDelegateCallback

void ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didReceiveBadPasswordThrottleAttemptsWithDelay:*(int *)(a1 + 40)];
}

void ___PairSetupPromptForSetupCodeDelegateCallback_f_block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) promptUserForPasswordWithType:1];
}

@end