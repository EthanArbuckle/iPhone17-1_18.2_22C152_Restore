@interface _DKActivityThrottler
- (id)dateForKey:(uint64_t)a1;
- (id)description;
- (id)keyForName:(void *)a1;
- (uint64_t)_minimumIntervalScheduledActionsContainsActionName:(uint64_t)a1;
- (void)_minimumIntervalScheduledActionsAddActionName:(uint64_t)a1;
- (void)_minimumIntervalScheduledActionsRemoveActionName:(uint64_t)a1;
- (void)_performNoMoreOftenInSecondsThan:(void *)a3 name:(void *)a4 activityBlock:(double)a5 throttleBlock:;
- (void)_performOrScheduleWithTimeInterval:(void *)a3 name:(void *)a4 queue:(unint64_t)a5 activityBlock:(double)a6 callDepth:;
- (void)_performWithDelayInSecondsOf:(void *)a3 name:(void *)a4 queue:(double)a5 activityBlock:;
- (void)clearDateForKey:(uint64_t)a1;
- (void)clearHistoryForName:(void *)a1;
- (void)initWithStore:(void *)a1;
- (void)setDate:(void *)a3 forKey:;
@end

@implementation _DKActivityThrottler

- (void)initWithStore:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)_DKActivityThrottler;
    id v5 = objc_msgSendSuper2(&v21, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 5, a2);
      uint64_t v6 = objc_opt_new();
      v7 = (void *)a1[1];
      a1[1] = v6;

      uint64_t v8 = objc_opt_new();
      v9 = (void *)a1[2];
      a1[2] = v8;

      id v10 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      [v10 setCountLimit:200];
      v11 = NSString;
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = [v11 stringWithFormat:@"%@@%p", v13, a1];
      [v10 setName:v14];

      v15 = (void *)a1[3];
      a1[3] = v10;
      id v16 = v10;

      id v17 = [v16 name];
      dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
      v19 = (void *)a1[4];
      a1[4] = v18;
    }
  }

  return a1;
}

- (void)_performNoMoreOftenInSecondsThan:(void *)a3 name:(void *)a4 activityBlock:(double)a5 throttleBlock:
{
  id v18 = a2;
  v9 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = a1;
    objc_sync_enter(v11);
    v12 = [NSString stringWithFormat:@"_DKThrottledActivityLast%@ActivityDate", v18];
    v13 = -[_DKActivityThrottler dateForKey:]((uint64_t)v11, v12);
    v14 = v13;
    if (v13 && ([v13 timeIntervalSinceNow], double v16 = v15, -v15 < a5))
    {

      objc_sync_exit(v11);
      if (v10) {
        v10[2](v10, v16 + a5);
      }
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      -[_DKActivityThrottler setDate:forKey:]((uint64_t)v11, v17, v12);

      objc_sync_exit(v11);
      if (v9) {
        v9[2](v9);
      }
    }
  }
}

- (void)_performOrScheduleWithTimeInterval:(void *)a3 name:(void *)a4 queue:(unint64_t)a5 activityBlock:(double)a6 callDepth:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (a1)
  {
    id v14 = a1;
    objc_sync_enter(v14);
    if (a5)
    {
      if (a5 >= 0xB)
      {
        double v15 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v17 = [NSNumber numberWithDouble:a6];
          -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:]((uint64_t)v11, v17, (uint64_t)v39);
        }

        goto LABEL_14;
      }
    }
    else if (-[_DKActivityThrottler _minimumIntervalScheduledActionsContainsActionName:]((uint64_t)v14, v11))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:]((uint64_t)v11);
      }
      goto LABEL_14;
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke;
    v33[3] = &unk_1E560F9F0;
    v33[4] = v14;
    id v18 = v11;
    id v34 = v18;
    double v37 = a6;
    v19 = v12;
    v35 = v19;
    id v20 = v13;
    id v36 = v20;
    unint64_t v38 = a5;
    objc_super v21 = (void *)MEMORY[0x192FB31A0](v33);
    -[_DKActivityThrottler _minimumIntervalScheduledActionsAddActionName:]((uint64_t)v14, v18);
    v22 = dispatch_get_current_queue();
    BOOL v23 = v22 == v19;

    if (v23)
    {
      -[_DKActivityThrottler _performNoMoreOftenInSecondsThan:name:activityBlock:throttleBlock:](v14, v18, v20, v21, a6);
      -[_DKActivityThrottler _minimumIntervalScheduledActionsRemoveActionName:]((uint64_t)v14, v18);
    }
    else
    {
      id v24 = v18;
      [v24 UTF8String];
      v25 = (void *)os_transaction_create();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __94___DKActivityThrottler__performOrScheduleWithTimeInterval_name_queue_activityBlock_callDepth___block_invoke_2;
      v27[3] = &unk_1E560F9A0;
      v27[4] = v14;
      double v32 = a6;
      id v28 = v24;
      id v30 = v20;
      id v31 = v21;
      id v29 = v25;
      id v26 = v25;
      dispatch_async(v19, v27);
    }
LABEL_14:
    objc_sync_exit(v14);
  }
}

- (void)_performWithDelayInSecondsOf:(void *)a3 name:(void *)a4 queue:(double)a5 activityBlock:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v12 = a1;
    objc_sync_enter(v12);
    if ([v12[2] containsObject:v9])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[_DKActivityThrottler _performOrScheduleWithTimeInterval:name:queue:activityBlock:callDepth:]((uint64_t)v9);
      }
    }
    else
    {
      [v12[2] addObject:v9];
      id v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        double v15 = [NSNumber numberWithDouble:a5];
        -[_DKActivityThrottler _performWithDelayInSecondsOf:name:queue:activityBlock:]((uint64_t)v9, v15, (uint64_t)v24);
      }

      id v16 = v9;
      [v16 UTF8String];
      id v17 = (void *)os_transaction_create();
      dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __78___DKActivityThrottler__performWithDelayInSecondsOf_name_queue_activityBlock___block_invoke;
      v20[3] = &unk_1E560FA18;
      id v23 = v11;
      v20[4] = v12;
      id v21 = v16;
      id v22 = v17;
      id v19 = v17;
      dispatch_after(v18, v10, v20);
    }
    objc_sync_exit(v12);
  }
}

- (void)clearHistoryForName:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    id v4 = a1;
    objc_sync_enter(v4);
    id v5 = [NSString stringWithFormat:@"_DKThrottledActivityLast%@ActivityDate", v6];
    -[_DKActivityThrottler clearDateForKey:]((uint64_t)v4, v5);

    objc_sync_exit(v4);
    id v3 = v6;
  }
}

- (id)keyForName:(void *)a1
{
  if (a1)
  {
    a1 = [NSString stringWithFormat:@"_DKThrottledActivityLast%@ActivityDate", a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)setDate:(void *)a3 forKey:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    [*(id *)(a1 + 24) setObject:v5 forKey:v6];
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39___DKActivityThrottler_setDate_forKey___block_invoke;
    block[3] = &unk_1E560DB80;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

- (id)dateForKey:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t v4 = [*(id *)(a1 + 24) objectForKey:v3];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) objectForKey:v3];
    BOOL v6 = v5 == 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v5 = 0;
  }
  [v5 timeIntervalSinceNow];
  if (v7 > 0.0)
  {

LABEL_9:
    id v5 = 0;
    goto LABEL_15;
  }
  if (v5) {
    char v8 = v6;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0) {
    [*(id *)(a1 + 24) setObject:v5 forKey:v3];
  }
LABEL_15:

  return v5;
}

- (uint64_t)_minimumIntervalScheduledActionsContainsActionName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 8);
    objc_sync_enter(v4);
    a1 = [*(id *)(a1 + 8) containsObject:v3];
    objc_sync_exit(v4);
  }
  return a1;
}

- (void)_minimumIntervalScheduledActionsAddActionName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 8);
    objc_sync_enter(v3);
    [*(id *)(a1 + 8) addObject:v4];
    objc_sync_exit(v3);
  }
}

- (void)_minimumIntervalScheduledActionsRemoveActionName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 8);
    objc_sync_enter(v3);
    [*(id *)(a1 + 8) removeObject:v4];
    objc_sync_exit(v3);
  }
}

- (void)clearDateForKey:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 24);
    id v4 = a2;
    [v3 removeObjectForKey:v4];
    [*(id *)(a1 + 40) removeObjectForKey:v4];
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = _CDPrettyPrintCollection(self->_minimumIntervalScheduledActions, 0, 0, 0);
  id v5 = _CDPrettyPrintCollection(self->_delayScheduledActions, 0, 0, 0);
  BOOL v6 = [v3 stringWithFormat:@"{ minimumIntervalScheduledActions=%@, delayScheduledActions=%@ }", v4, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_delayScheduledActions, 0);
  objc_storeStrong((id *)&self->_minimumIntervalScheduledActions, 0);
}

- (void)_performOrScheduleWithTimeInterval:(uint64_t)a1 name:queue:activityBlock:callDepth:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Activity '%@' is already scheduled", (uint8_t *)&v1, 0xCu);
}

- (void)_performOrScheduleWithTimeInterval:(uint64_t)a3 name:queue:activityBlock:callDepth:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_9(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Runaway throttled activity '%@' with interval of %@ seconds", v4, 0x16u);
}

- (void)_performWithDelayInSecondsOf:(uint64_t)a3 name:queue:activityBlock:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_9(a1, (uint64_t)a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Delaying activity '%@' by %@ seconds", v4, 0x16u);
}

@end