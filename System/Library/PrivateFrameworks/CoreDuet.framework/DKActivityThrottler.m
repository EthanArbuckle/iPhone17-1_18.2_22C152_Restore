@interface DKActivityThrottler
@end

@implementation DKActivityThrottler

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke(uint64_t a1, double a2)
{
  v4 = (uint64_t *)(a1 + 40);
  -[_DKActivityThrottler _minimumIntervalScheduledActionsAddActionName:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_cold_1(v4, a1);
  }
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_56;
  v11[3] = &unk_1E560F9C8;
  v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  uint64_t v13 = v8;
  uint64_t v16 = *(void *)(a1 + 64);
  id v14 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  id v15 = v9;
  uint64_t v17 = v10;
  dispatch_after(v5, v6, v11);
}

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_56(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  id v2 = (id)os_transaction_create();
  -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:](*(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 72) + 1, *(double *)(a1 + 64));
  -[_DKActivityThrottler _minimumIntervalScheduledActionsRemoveActionName:](*(void *)(a1 + 40), *(void **)(a1 + 32));
}

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_2(uint64_t a1)
{
  -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 56), *(void **)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  -[_DKActivityThrottler _minimumIntervalScheduledActionsRemoveActionName:](v2, v3);
}

uint64_t __78___DKActivityThrottler__performWithDelayInSecondsOf_name_queue_activityBlock___block_invoke(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = a1[5];
  v4 = *(void **)(a1[4] + 16);
  return [v4 removeObject:v3];
}

uint64_t __39___DKActivityThrottler_setDate_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 40) setObject:a1[5] forKey:a1[6]];
}

void __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_cold_1(uint64_t *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  dispatch_time_t v5 = [NSNumber numberWithDouble:*(double *)(a2 + 64)];
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  id v9 = v4;
  __int16 v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Delaying activity '%@' by %@ seconds due to minimum interval of %@ seconds", (uint8_t *)&v6, 0x20u);
}

@end