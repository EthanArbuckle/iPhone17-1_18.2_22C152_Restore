@interface LABKOperation
@end

@implementation LABKOperation

uint64_t __49___LABKOperation_dispatchDelegateSelector_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "operation:presenceStateChanged:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isUserPresent"));
}

void __65___LABKOperation_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 operation:*(void *)(a1 + 32) stateChanged:4];
}

void __33___LABKOperation_startWithReply___block_invoke(uint64_t a1, int a2, void *a3)
{
  v7 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = @"YES";
  if (!a2) {
    v6 = v7;
  }
  +[_LABKLog logClass:v5, *(void *)(a1 + 48), @"started: %@", v6 selector message];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end