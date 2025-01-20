@interface GCKeyboardAndMouseEventSubject
@end

@implementation GCKeyboardAndMouseEventSubject

void __63___GCKeyboardAndMouseEventSubject_Button__observeButtonEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonEventObservers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) buttonEventObservers];
      v6 = (void *)[v5 mutableCopy];

      v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setButtonEventObservers:v6];
      v8 = [*(id *)(a1 + 32) buttonEventObservers];
      v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

void __67___GCKeyboardAndMouseEventSubject_Keyboard__observeKeyboardEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) keyboardEventObservers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) keyboardEventObservers];
      v6 = (void *)[v5 mutableCopy];

      v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setKeyboardEventObservers:v6];
      v8 = [*(id *)(a1 + 32) keyboardEventObservers];
      v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

void __63___GCKeyboardAndMouseEventSubject_Scroll__observeScrollEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) scrollEventObservers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) scrollEventObservers];
      v6 = (void *)[v5 mutableCopy];

      v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setScrollEventObservers:v6];
      v8 = [*(id *)(a1 + 32) scrollEventObservers];
      v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

void __69___GCKeyboardAndMouseEventSubject_Digitizer__observeDigitizerEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) digitizerEventObservers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) digitizerEventObservers];
      v6 = (void *)[v5 mutableCopy];

      v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setDigitizerEventObservers:v6];
      v8 = [*(id *)(a1 + 32) digitizerEventObservers];
      v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

void __65___GCKeyboardAndMouseEventSubject_Pointer__observePointerEvents___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pointerEventObservers];
  v3 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    do
    {
      v5 = [*(id *)(a1 + 32) pointerEventObservers];
      v6 = (void *)[v5 mutableCopy];

      v7 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      [v6 removeObject:v7];

      [*(id *)(a1 + 32) setPointerEventObservers:v6];
      v8 = [*(id *)(a1 + 32) pointerEventObservers];
      v9 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 40));
      char v10 = [v8 containsObject:v9];
    }
    while ((v10 & 1) != 0);
  }
}

@end