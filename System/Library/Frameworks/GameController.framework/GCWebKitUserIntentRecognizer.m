@interface GCWebKitUserIntentRecognizer
@end

@implementation GCWebKitUserIntentRecognizer

void __68___GCWebKitUserIntentRecognizer_processChangedElements_atTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 8);
    id v5 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)WeakRetained + 1);
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, *(void *)(a1 + 32));

    [*(id *)(a1 + 40) removeAllObjects];
    id WeakRetained = v5;
  }
}

@end