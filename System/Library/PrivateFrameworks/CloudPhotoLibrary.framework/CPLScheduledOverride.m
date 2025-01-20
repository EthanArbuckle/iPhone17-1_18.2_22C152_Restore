@interface CPLScheduledOverride
@end

@implementation CPLScheduledOverride

void __54___CPLScheduledOverride__scheduleEndWithTimeInterval___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 8))
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v2 removeObjectForKey:*(void *)(*(void *)(a1 + 40) + 16)];

    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 removeObjectForKey:*(void *)(*(void *)(a1 + 40) + 24)];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    [WeakRetained scheduledOverrideDidEnd:*(void *)(a1 + 40)];

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0;
  }
}

void __70___CPLScheduledOverride_nextTimeIntervalToUseGivenCurrent_expiryDate___block_invoke()
{
  v0 = (void *)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics;
  nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics = (uint64_t)&unk_1F0D91658;
}

@end