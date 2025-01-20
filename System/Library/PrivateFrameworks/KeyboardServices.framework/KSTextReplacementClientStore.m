@interface KSTextReplacementClientStore
@end

@implementation KSTextReplacementClientStore

uint64_t __75___KSTextReplacementClientStore_modifyEntry_toEntry_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80___KSTextReplacementClientStore_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) == 0) {
    NSLog(&cfstr_FailedTheUpdat.isa, v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64___KSTextReplacementClientStore_requestSyncWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __53___KSTextReplacementClientStore_cancelPendingUpdates__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    NSLog(&cfstr_FailedToCancel.isa, a3);
  }
}

void __55___KSTextReplacementClientStore_textReplacementEntries__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __67___KSTextReplacementClientStore_queryTextReplacementsWithCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77___KSTextReplacementClientStore_queryTextReplacementsWithPredicate_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70___KSTextReplacementClientStore_performTransaction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

@end