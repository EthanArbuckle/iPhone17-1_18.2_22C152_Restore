@interface FBSProcessResourceProvision
+ (id)provisionWithAllowance:(id *)a3;
+ (id)provisionWithResourceType:(int64_t)a3 timeInterval:(double)a4;
- ($7A943687CD0E45FBDC9482F4CE369844)allowance;
- (BOOL)_queue_calculateValueConsumed:(unint64_t *)a3;
- (BOOL)_queue_updateConsumption;
- (BOOL)allowanceRemaining:(id *)a3;
- (BOOL)isResourceProvision;
- (FBSProcessResourceProvision)initWithAllowance:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (void)_beginMonitoring;
- (void)_prepareForReuse;
- (void)_queue_evaluateConsumptionFromTimer:(BOOL)a3;
- (void)_queue_noteAllowanceExhausted;
- (void)_queue_stopMonitoring;
- (void)_queue_updateConsumption;
- (void)_stopMonitoring;
- (void)_updateProgress;
- (void)dealloc;
- (void)setAllowance:(id *)a3;
@end

@implementation FBSProcessResourceProvision

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

__n128 __50__FBSProcessResourceProvision_allowanceRemaining___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isMonitoring]) {
    [*(id *)(a1 + 32) _queue_updateConsumption];
  }
  v2 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 56);
  v2[2] = result;
  v2[3].n128_u64[0] = v3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 88);
  return result;
}

- (BOOL)allowanceRemaining:(id *)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    if ([(FBSProcessExecutionProvision *)self isViolated])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3810000000;
      v22 = &unk_19C73651E;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      queue = self->_queue;
      uint64_t v18 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__FBSProcessResourceProvision_allowanceRemaining___block_invoke;
      block[3] = &unk_1E58F7080;
      block[4] = self;
      block[5] = &v19;
      block[6] = &v15;
      dispatch_sync(queue, block);
      unint64_t Value = FBSProcessResourceAllowanceGetValue((uint64_t)(v20 + 4));
      unint64_t v7 = v16[3];
      BOOL v8 = Value >= v7;
      uint64_t v9 = Value - v7;
      if (v9 != 0 && v8)
      {
        if (v8) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        FBSProcessResourceAllowanceMake(v20[4], v10, v20[6], &v12);
        *(_OWORD *)&v3->var0 = v12;
        v3->var2 = v13;
        LOBYTE(v3) = FBSProcessResourceAllowanceIsValid(v3);
      }
      else
      {
        LOBYTE(v3) = 0;
      }
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
    }
  }
  return (char)v3;
}

uint64_t __46__FBSProcessResourceProvision__stopMonitoring__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _queue_stopMonitoring];
  v2 = *(void **)(a1 + 32);

  return [v2 _queue_updateConsumption];
}

- (void)_queue_stopMonitoring
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(FBSProcessExecutionProvision *)self process];
  v4 = FBLogWatchdog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = FBSProcessPrettyDescription(v3);
    v6 = NSStringFromProcessResourceType(self->_allowance.type);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_19C680000, v4, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Stopped monitoring.", (uint8_t *)&v8, 0x16u);
  }
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

void __47__FBSProcessResourceProvision__beginMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) process];
  NSClassFromString(&cfstr_Fbprocess.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 rbsHandle];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F963E8];
    v5 = [NSNumber numberWithInt:[v2 pid]];
    uint64_t v7 = [v6 handleForIdentifier:v5 error:0];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 112);
    *(void *)(v8 + 112) = v7;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 56);
  if (v11 == 2)
  {
    uint64_t v15 = *(void **)(v10 + 112);
    if (!v15) {
      goto LABEL_18;
    }
    [v15 elapsedCPUTimeForFrontBoard];
    *(void *)(*(void *)(a1 + 32) + 80) = FBSProcessResourceValueForTimeInterval(v16);
    unint64_t v17 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v17)
    {
      double v14 = FBSProcessResourceTimeIntervalForValue(v17);
      double v13 = v14;
    }
    else
    {
      double v18 = FBSProcessResourceTimeIntervalForValue(*(void *)(*(void *)(a1 + 32) + 64)) * 0.5;
      uint64_t v19 = [MEMORY[0x1E4F28F80] processInfo];
      double v20 = v18 / (double)(unint64_t)[v19 processorCount];

      if (v20 >= 1.0) {
        double v14 = v20;
      }
      else {
        double v14 = 1.0;
      }
      double v13 = v14;
    }
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_18;
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(a1 + 32) + 80) = FBSProcessResourceValueForTimeInterval(v12);
    double v13 = FBSProcessResourceTimeIntervalForValue(*(void *)(*(void *)(a1 + 32) + 64));
    double v14 = -1.0;
  }
  if (v13 > 0.0)
  {
    uint64_t v21 = FBLogWatchdog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = FBSProcessPrettyDescription(v2);
      uint64_t v23 = NSStringFromProcessResourceType(*(void *)(*(void *)(a1 + 32) + 56));
      double v24 = FBSProcessResourceTimeIntervalForValue(*(void *)(*(void *)(a1 + 32) + 64));
      *(_DWORD *)buf = 138544130;
      v30 = v22;
      __int16 v31 = 2114;
      v32 = v23;
      __int16 v33 = 2048;
      double v34 = v24;
      __int16 v35 = 2048;
      double v36 = v14;
      _os_log_impl(&dword_19C680000, v21, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Now monitoring resource allowance of %.2fs (at refreshInterval %.2fs)", buf, 0x2Au);
    }
    uint64_t v25 = [objc_alloc((Class)off_1E58F44A8) initWithIdentifier:@"FBSProcessResourceProvisionMonitor"];
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 104);
    *(void *)(v26 + 104) = v25;

    *(void *)(*(void *)(a1 + 32) + 128) = 0;
    *(double *)(*(void *)(a1 + 32) + 120) = v13;
    BSFloatLessThanFloat();
  }
LABEL_18:
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"FBSProcessResourceProvisionErrorDomain" code:1 userInfo:0];
  [*(id *)(a1 + 32) _noteViolatedWithError:v28];
}

- (BOOL)_queue_calculateValueConsumed:(unint64_t *)a3
{
}

- (void)_prepareForReuse
{
  uint64_t v3 = FBSProcessPrettyDescription(a1);
  uint64_t v4 = NSStringFromProcessResourceType(*(void *)(a2 + 56));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_19C680000, v5, v6, "[%{public}@] [%{public}@] Invalidated", v7, v8, v9, v10, v11);
}

- (void)_stopMonitoring
{
}

- (void)_beginMonitoring
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(FBSProcessExecutionProvision *)self process];
  uint64_t v5 = FBSProcessPrettyDescription(v4);
  uint64_t v6 = NSStringFromProcessResourceType(self->_allowance.type);
  [v3 stringWithFormat:@"com.apple.frontboardservices.watchdog-%@-%@", v5, v6];
  objc_claimAutoreleasedReturnValue();

  [off_1E58F44F8 serial];
  [(id)objc_claimAutoreleasedReturnValue() serviceClass:33];
  objc_claimAutoreleasedReturnValue();
  BSDispatchQueueCreate();
}

- (BOOL)_queue_updateConsumption
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(FBSProcessExecutionProvision *)self isMonitoring]
    && ![(FBSProcessExecutionProvision *)self isViolated])
  {
    uint64_t v4 = [(FBSProcessExecutionProvision *)self process];
    unint64_t v12 = 0;
    BOOL v3 = [(FBSProcessResourceProvision *)self _queue_calculateValueConsumed:&v12];
    if (v3)
    {
      self->_consumedunint64_t Value = v12;
      uint64_t v5 = FBLogWatchdog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = FBSProcessPrettyDescription(v4);
        p_allowance = &self->_allowance;
        uint64_t v8 = NSStringFromProcessResourceType(self->_allowance.type);
        uint64_t v9 = NSStringFromProcessResourceValue(p_allowance->type, v12);
        double v10 = (double)v12 / (double)p_allowance->value;
        *(_DWORD *)buf = 138544130;
        double v14 = v6;
        __int16 v15 = 2114;
        double v16 = v8;
        __int16 v17 = 2114;
        double v18 = v9;
        __int16 v19 = 2048;
        double v20 = v10 * 100.0;
        _os_log_debug_impl(&dword_19C680000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] [%{public}@] Updated resource consumption: %{public}@ (%.2f%%)", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v5 = FBLogWatchdog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        [(FBSProcessResourceProvision *)v4 _queue_updateConsumption];
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)succinctDescriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)FBSProcessResourceProvision;
  BOOL v3 = [(FBSProcessExecutionProvision *)&v8 succinctDescriptionBuilder];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = NSStringFromProcessResourceAllowance(&v4->_allowance.type);
  id v6 = (id)[v3 appendObject:v5 withName:@"allowance"];

  objc_sync_exit(v4);

  return v3;
}

- (BOOL)isResourceProvision
{
  return 1;
}

+ (id)provisionWithAllowance:(id *)a3
{
  if (FBSProcessResourceAllowanceIsValid(a3))
  {
    id v5 = objc_alloc((Class)a1);
    long long v8 = *(_OWORD *)&a3->var0;
    unint64_t var2 = a3->var2;
    id v6 = (void *)[v5 initWithAllowance:&v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  $FE9EE766AA2F25CB6FFEABD6DDE6A993 allowance = self->_allowance;
  uint64_t v5 = [v4 initWithAllowance:&allowance];
  uint64_t v6 = [(NSError *)self->super._error copy];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(unsigned char *)(v5 + 33) = self->super._violated;
  *(unsigned char *)(v5 + 32) = self->super._monitoring;
  *(void *)(v5 + 80) = self->_baselineValue;
  *(void *)(v5 + 88) = self->_consumedValue;
  return (id)v5;
}

- (FBSProcessResourceProvision)initWithAllowance:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBSProcessResourceProvision;
  __n128 result = [(FBSProcessExecutionProvision *)&v6 init];
  if (result)
  {
    unint64_t var2 = a3->var2;
    *(_OWORD *)&result->_allowance.type = *(_OWORD *)&a3->var0;
    result->_allowance.reserved = var2;
    result->_consumedunint64_t Value = 0;
  }
  return result;
}

- (int64_t)type
{
  return self->_allowance.type;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"FBSProcessResourceProvision.m";
  __int16 v10 = 1024;
  int v11 = 65;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

void __47__FBSProcessResourceProvision__prepareForReuse__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
  [*(id *)(*(void *)(a1 + 32) + 104) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = 0;
}

- ($7A943687CD0E45FBDC9482F4CE369844)allowance
{
  *($FE9EE766AA2F25CB6FFEABD6DDE6A993 *)retstr = *($FE9EE766AA2F25CB6FFEABD6DDE6A993 *)((char *)self + 56);
  return self;
}

+ (id)provisionWithResourceType:(int64_t)a3 timeInterval:(double)a4
{
  FBSProcessResourceAllowanceMakeWithTimeInterval(a3, v7, a4);
  uint64_t v5 = [a1 provisionWithAllowance:v7];

  return v5;
}

uint64_t __47__FBSProcessResourceProvision__beginMonitoring__block_invoke_31(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FBLogWatchdog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = FBSProcessPrettyDescription(*(void **)(a1 + 32));
    uint64_t v4 = NSStringFromProcessResourceType(*(void *)(*(void *)(a1 + 40) + 56));
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543874;
    long long v8 = v3;
    __int16 v9 = 2114;
    __int16 v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19C680000, v2, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Watchdog fired because one shot interval hit (%f)", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(a1 + 40) _queue_updateConsumption];
  [*(id *)(a1 + 40) _queue_noteAllowanceExhausted];
  return [*(id *)(a1 + 40) _queue_stopMonitoring];
}

uint64_t __47__FBSProcessResourceProvision__beginMonitoring__block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_evaluateConsumptionFromTimer:1];
}

- (void)_updateProgress
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FBSProcessResourceProvision__updateProgress__block_invoke;
  block[3] = &unk_1E58F4B00;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __46__FBSProcessResourceProvision__updateProgress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_evaluateConsumptionFromTimer:0];
}

- (void)_queue_noteAllowanceExhausted
{
  BOOL v3 = FBSProcessPrettyDescription(a1);
  uint64_t v4 = NSStringFromProcessResourceType(*(void *)(a2 + 56));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_19C680000, v5, v6, "[%{public}@] [%{public}@] Allowance exhausted!", v7, v8, v9, v10, v11);
}

- (void)_queue_evaluateConsumptionFromTimer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FBSProcessExecutionProvision *)self process];
  if (v3) {
    ++self->_timerFireCount;
  }
  uint64_t v6 = FBLogWatchdog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = FBSProcessPrettyDescription(v5);
    uint64_t v8 = NSStringFromProcessResourceType(self->_allowance.type);
    unint64_t timerFireCount = self->_timerFireCount;
    int v10 = 138543874;
    uint8_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = timerFireCount;
    _os_log_impl(&dword_19C680000, v6, OS_LOG_TYPE_INFO, "[%{public}@] [%{public}@] Evaluating consumption... (%llu)", (uint8_t *)&v10, 0x20u);
  }
  if (![(FBSProcessResourceProvision *)self _queue_updateConsumption]) {
    goto LABEL_8;
  }
  if (self->_consumedValue >= self->_allowance.value)
  {
    [(FBSProcessResourceProvision *)self _queue_noteAllowanceExhausted];
LABEL_8:
    [(FBSProcessResourceProvision *)self _queue_stopMonitoring];
  }
}

- (void)setAllowance:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_allowance.type = *(_OWORD *)&a3->var0;
  self->_allowance.reserved = var2;
}

- (void)_queue_updateConsumption
{
  BOOL v3 = FBSProcessPrettyDescription(a1);
  uint64_t v4 = NSStringFromProcessResourceType(*(void *)(a2 + 56));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_19C680000, v5, v6, "[%{public}@] [%{public}@] Unable to calculate resource consumption :(", v7, v8, v9, v10, v11);
}

@end