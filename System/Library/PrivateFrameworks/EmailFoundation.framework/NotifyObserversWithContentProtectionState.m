@interface NotifyObserversWithContentProtectionState
@end

@implementation NotifyObserversWithContentProtectionState

void ___NotifyObserversWithContentProtectionState_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 contentProtectionStateChanged:*(void *)(a1 + 40) previousState:*(void *)(a1 + 48)];
}

@end