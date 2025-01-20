@interface NSOperationInternalObserver
@end

@implementation NSOperationInternalObserver

void __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 224));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  BOOL v4 = v3 < 1;
  uint64_t v5 = v3 - 1;
  if (!v4) {
    *(void *)(v2 + 48) = v5;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 224));
}

void __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v2 = *(void **)(a1 + 40);
}

@end