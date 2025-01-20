@interface SYMessageTimerTable
@end

@implementation SYMessageTimerTable

uint64_t __31___SYMessageTimerTable_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_15];
}

void __31___SYMessageTimerTable_dealloc__block_invoke_2(int a1, int a2, dispatch_source_t source)
{
}

void __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _fireCallbackForSeqno:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _cleanupTimerForSeqno:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_3(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 32);
  id v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  [v2 removeObjectForKey:v3];

  uint64_t v4 = [*(id *)(a1 + 40) identifier];

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 40);
    id v7 = [v5 identifier];
    [v6 removeObjectForKey:v7];
  }
}

void __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke_2(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 removeObjectForKey:v3];

  objc_getAssociatedObject(*(id *)(*(void *)(a1[5] + 8) + 40), (const void *)kTimerContextKey);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v7 identifier];

  if (v4)
  {
    v5 = *(void **)(a1[4] + 40);
    id v6 = [v7 identifier];
    [v5 removeObjectForKey:v6];
  }
}

void __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 40) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
}

void __53___SYMessageTimerTable_cancelTimerForSequenceNumber___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 32);
  id v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __49___SYMessageTimerTable_cancelTimerForIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

uint64_t __34___SYMessageTimerTable_timerCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end