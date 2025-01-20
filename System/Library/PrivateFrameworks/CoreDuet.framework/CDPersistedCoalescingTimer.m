@interface CDPersistedCoalescingTimer
@end

@implementation CDPersistedCoalescingTimer

id __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  id v7 = v5;
  id v20 = v7;
  if (!v16[5])
  {
    v8 = [*(id *)(*(void *)(a1 + 32) + 48) publisherFromStartTime:0.0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke_2;
    v12[3] = &unk_1E560EE08;
    v14 = &v15;
    id v13 = *(id *)(a1 + 40);
    id v9 = (id)[v8 sinkWithCompletion:&__block_literal_global_39 receiveInput:v12];
  }
  v10 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke_2(uint64_t a1, void *a2)
{
  char v9 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [a2 eventBody];
  uint64_t v6 = (*(void (**)(uint64_t, uint64_t, void *, char *))(v3 + 16))(v3, v4, v5, &v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  return [v2 pruneWithPredicateBlock:&__block_literal_global_497];
}

uint64_t __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke_4()
{
  return 1;
}

@end