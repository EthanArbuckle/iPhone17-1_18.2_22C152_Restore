@interface SharedInit
@end

@implementation SharedInit

void ___SharedInit_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expireMessages];
}

void ___SharedInit_block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timeoutWindowedMessages];
}

@end