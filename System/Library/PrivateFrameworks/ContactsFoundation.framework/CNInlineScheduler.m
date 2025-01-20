@interface CNInlineScheduler
@end

@implementation CNInlineScheduler

void __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD0880]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

@end