@interface ASUIEventFilterCallback
@end

@implementation ASUIEventFilterCallback

void ___ASUIEventFilterCallback_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleKeyboardKeyDownEvent:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void ___ASUIEventFilterCallback_block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleGamepadButtonPressedEvent:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void ___ASUIEventFilterCallback_block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleATVRemoteButtonDownEvent:*(void *)(a1 + 40)];
  v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

@end