@interface BLSHInactiveProcessMinutesBudget
- (BLSHInactiveProcessMinutesBudget)initWithIdentifier:(id)a3 osTimerProvider:(id)a4;
- (BOOL)chargeSpecifier:(void *)a3 withChargeBlock:(void *)a4 fitInBucketBlock:(void *)a5 exceededBudgetBlock:(void *)a6 missedBucketBlock:;
- (BOOL)hasSecondsBudgetAtDate:(id)a3;
- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3;
- (NSArray)buckets;
- (NSString)debugDescription;
- (NSString)description;
- (double)delayTimeToAddInvalidation:(char)a3 hasSecondsBudget:;
- (double)intervalSinceLastInvalidation;
- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5;
- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4;
- (uint64_t)lock_hasSecondsBudgetAtDate:(uint64_t)a1;
- (unint64_t)bucketCount;
- (unint64_t)secondsBucketCount;
- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4;
- (void)dealloc;
- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5;
- (void)performInvalidation;
- (void)resetFutureSpecifiers;
@end

@implementation BLSHInactiveProcessMinutesBudget

- (BLSHInactiveProcessMinutesBudget)initWithIdentifier:(id)a3 osTimerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLSHInactiveProcessMinutesBudget;
  v8 = [(BLSHInactiveProcessMinutesBudget *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_osTimerProvider, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    lock_buckets = v9->_lock_buckets;
    v9->_lock_buckets = (NSMutableArray *)v10;

    uint64_t v12 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;
  }
  return v9;
}

- (void)dealloc
{
  [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLSHInactiveProcessMinutesBudget;
  [(BLSHInactiveProcessMinutesBudget *)&v3 dealloc];
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  [v4 appendArraySection:self->_lock_buckets withName:@"buckets" multilinePrefix:@"    " skipIfEmpty:1];
  if ([(BSTimerScheduleQuerying *)self->_lock_invalidationTimer isScheduled])
  {
    [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer timeRemaining];
    id v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"pendingInvalidation", 1);
  }
  id v7 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  [v4 appendArraySection:self->_lock_buckets withName:@"buckets" multilinePrefix:@"    " skipIfEmpty:1 objectTransformer:&__block_literal_global_27];
  if ([(BSTimerScheduleQuerying *)self->_lock_invalidationTimer isScheduled])
  {
    [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer timeRemaining];
    id v6 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"pendingInvalidation", 1);
  }
  if (self->_lock_lastInvalidationTimestamp)
  {
    id v7 = BLSLoggingStringForMachTime();
    [v4 appendString:v7 withName:@"lastInvalidation" skipIfEmpty:0];
  }
  v8 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v8;
}

uint64_t __52__BLSHInactiveProcessMinutesBudget_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 debugDescription];
}

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 1)
  {
    v8 = v7;
    if ([(BLSHInactiveProcessMinutesBudget *)self hasSecondsBudgetAtDate:v7]) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expectedFidelity == BLSUpdateFidelityMinutes"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessMinutesBudget allowedFidelityAtDate:expectedFidelity:](a2);
    }
    [v11 UTF8String];
    int64_t result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)chargeSpecifier:(void *)a3 withChargeBlock:(void *)a4 fitInBucketBlock:(void *)a5 exceededBudgetBlock:(void *)a6 missedBucketBlock:
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v35 = a2;
  id v11 = a3;
  v37 = a4;
  uint64_t v12 = a5;
  v36 = a6;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x2020000000;
    uint64_t v70 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__11;
    v65 = __Block_byref_object_dispose__11;
    id v66 = 0;
    uint64_t v57 = 0;
    v58 = (double *)&v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0x7FF8000000000000;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    v13 = *(void **)(a1 + 24);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __123__BLSHInactiveProcessMinutesBudget_chargeSpecifier_withChargeBlock_fitInBucketBlock_exceededBudgetBlock_missedBucketBlock___block_invoke;
    v42[3] = &unk_264534270;
    v44 = &v57;
    id v43 = v11;
    v45 = &v53;
    v46 = &v49;
    v47 = &v61;
    v48 = &v67;
    [v13 enumerateObjectsWithOptions:2 usingBlock:v42];
    if (*((unsigned char *)v54 + 24))
    {
      v12[2](v12, v62[5]);
      BOOL v34 = 0;
    }
    else
    {
      uint64_t v14 = v62[5];
      if (*((unsigned char *)v50 + 24))
      {
        v37[2](v37, v14);
        BOOL v34 = 1;
      }
      else
      {
        objc_super v15 = v36[2](v36, v14, v58[3]);
        BOOL v34 = v15 != 0;
        if (v15)
        {
          [*(id *)(a1 + 24) insertObject:v15 atIndex:v68[3]];
          if (os_variant_has_internal_diagnostics())
          {
            v16 = bls_budget_log();
            v33 = v15;
            BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

            if (v17)
            {
              long long v40 = 0u;
              long long v41 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v18 = *(id *)(a1 + 24);
              id v19 = 0;
              uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v83 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v39;
                do
                {
                  uint64_t v22 = 0;
                  v23 = v19;
                  do
                  {
                    if (*(void *)v39 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v24 = *(void **)(*((void *)&v38 + 1) + 8 * v22);
                    if (v23 && [v23 compare:*(void *)(*((void *)&v38 + 1) + 8 * v22)] != -1)
                    {
                      v26 = [NSString stringWithFormat:@"(internal only) unsorted buckets %@", *(void *)(a1 + 24)];
                      v27 = &_os_log_internal;
                      id v28 = &_os_log_internal;
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        NSStringFromSelector(sel_chargeSpecifier_withChargeBlock_fitInBucketBlock_exceededBudgetBlock_missedBucketBlock_);
                        id v29 = (id)objc_claimAutoreleasedReturnValue();
                        v30 = (objc_class *)objc_opt_class();
                        v31 = NSStringFromClass(v30);
                        *(_DWORD *)buf = 138544642;
                        id v72 = v29;
                        __int16 v73 = 2114;
                        v74 = v31;
                        __int16 v75 = 2048;
                        uint64_t v76 = a1;
                        __int16 v77 = 2114;
                        v78 = @"BLSHInactiveProcessMinutesBudget.m";
                        __int16 v79 = 1024;
                        int v80 = 141;
                        __int16 v81 = 2114;
                        v82 = v26;
                        _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
                      }
                      [v26 UTF8String];
                      uint64_t v32 = _bs_set_crash_log_message();
                      -[BLSHLocalHostSceneEnvironmentUpdater updatedEnvironmentWithDelta:backlightSceneUpdate:](v32);
                    }
                    id v19 = v24;

                    ++v22;
                    v23 = v19;
                  }
                  while (v20 != v22);
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v83 count:16];
                }
                while (v20);
              }

              objc_super v15 = v33;
            }
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

void __123__BLSHInactiveProcessMinutesBudget_chargeSpecifier_withChargeBlock_fitInBucketBlock_exceededBudgetBlock_missedBucketBlock___block_invoke(void *a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  *(double *)(*(void *)(a1[5] + 8) + 24) = (*(double (**)(void, id, BOOL))(a1[4] + 16))(a1[4], v7, a3 == 0);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24) == 0.0;
  double v8 = *(double *)(*(void *)(a1[5] + 8) + 24);
  if (v8 > 0.0 && *(void *)(*(void *)(a1[8] + 8) + 40) && (*(double (**)(void))(a1[4] + 16))() == 0.0) {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 > 0.0 || *(unsigned char *)(*(void *)(a1[7] + 8) + 24) != 0;
  }
  *a4 = v9;
  if (v8 <= 0.0)
  {
    if (a3) {
      goto LABEL_18;
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = a3 + 1;
  }
  *(void *)(*(void *)(a1[9] + 8) + 24) = v11;
LABEL_18:
  uint64_t v12 = *(void *)(a1[8] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (a5 != 1)
  {
    id v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expectedFidelity == BLSUpdateFidelityMinutes"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessMinutesBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:](a2);
    }
LABEL_16:
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD6D1ECLL);
  }
  uint64_t v11 = v10;
  uint64_t v12 = [v9 fidelity];
  if ((unint64_t)(v12 - 4) <= 0xFFFFFFFFFFFFFFFALL)
  {
    id v29 = objc_msgSend(NSString, "stringWithFormat:", @"fidelity out of range:%ld", v12);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessMinutesBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:](a2);
    }
    goto LABEL_16;
  }
  uint64_t v51 = 0;
  char v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__11;
  uint64_t v55 = __Block_byref_object_dispose__11;
  id v13 = v9;
  id v56 = v13;
  [MEMORY[0x263F29A18] secondsFidelityThreshold];
  double v15 = v14;
  os_unfair_lock_lock(&self->_lock);
  v16 = [v13 date];
  char v17 = -[BLSHInactiveProcessMinutesBudget lock_hasSecondsBudgetAtDate:]((uint64_t)self, v16);
  id v18 = [v11 date];
  [v18 timeIntervalSinceDate:v16];
  double v20 = v19;

  if (v20 > v15 + v15) {
    char v21 = 1;
  }
  else {
    char v21 = v17;
  }
  uint64_t v22 = self->_identifier;
  os_unfair_lock_unlock(&self->_lock);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke;
  v48[3] = &unk_264534298;
  id v49 = v13;
  char v50 = v21;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2;
  v45[3] = &unk_2645342C0;
  v45[4] = self;
  v46 = v22;
  id v47 = v49;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_39;
  v40[3] = &unk_2645342E8;
  v40[4] = self;
  long long v41 = v46;
  id v42 = v47;
  double v44 = v20;
  id v43 = v11;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_43;
  v30[3] = &unk_264534310;
  double v36 = v15;
  double v37 = v20;
  char v39 = v17;
  id v35 = &v51;
  id v23 = v42;
  id v31 = v23;
  uint64_t v32 = self;
  v24 = v41;
  v33 = v24;
  id v25 = v43;
  id v34 = v25;
  SEL v38 = a2;
  if (!-[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:]((uint64_t)self, v23, v48, v45, v40, v30))
  {
    v26 = (void *)v52[5];
    v52[5] = 0;
  }
  id v27 = (id)v52[5];

  _Block_object_dispose(&v51, 8);

  return v27;
}

- (uint64_t)lock_hasSecondsBudgetAtDate:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x263F29A18] secondsFidelityThreshold];
    int v5 = llround(150.0 / v4);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = *(id *)(a1 + 24);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v11, "validAtDate:", v3, (void)v21))
          {
            if ([v11 isSecondsFidelity])
            {
              BOOL v12 = __OFSUB__(v5--, 1);
              if ((v5 < 0) ^ v12 | (v5 == 0))
              {
                id v13 = bls_budget_log();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v15 = *(void *)(a1 + 8);
                  v16 = objc_msgSend(v3, "bls_shortLoggingString");
                  char v17 = objc_msgSend(*(id *)(a1 + 24), "bls_boundedDescription");
                  *(_DWORD *)buf = 134218754;
                  uint64_t v26 = a1;
                  __int16 v27 = 2114;
                  uint64_t v28 = v15;
                  __int16 v29 = 2114;
                  *(void *)v30 = v16;
                  *(_WORD *)&v30[8] = 2112;
                  *(void *)&v30[10] = v17;
                  _os_log_debug_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEBUG, "%p:%{public}@ budget full at date:%{public}@ buckets:%@", buf, 0x2Au);
                }
                a1 = 0;
                goto LABEL_18;
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v6 = bls_budget_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *(void *)(a1 + 8);
      double v19 = objc_msgSend(v3, "bls_shortLoggingString");
      double v20 = objc_msgSend(*(id *)(a1 + 24), "bls_boundedDescriptionWithMax:transformer:", 16, &__block_literal_global_99_0);
      *(_DWORD *)buf = 134219010;
      uint64_t v26 = a1;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      __int16 v29 = 1024;
      *(_DWORD *)v30 = v5;
      *(_WORD *)&void v30[4] = 2114;
      *(void *)&v30[6] = v19;
      *(_WORD *)&v30[14] = 2112;
      *(void *)&v30[16] = v20;
      _os_log_debug_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEBUG, "%p:%{public}@ budget available (%d) at date:%{public}@ buckets:%@", buf, 0x30u);
    }
    a1 = 1;
LABEL_18:
  }
  return a1;
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 addFutureSpecifier:*(void *)(a1 + 32) hasSecondsBudget:*(unsigned __int8 *)(a1 + 40) allowBeforeStart:a3];
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = bls_budget_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_cold_1();
  }
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_39(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = bls_budget_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v8 = a1[7];
    uint64_t v7 = a1[8];
    uint64_t v9 = a1[6];
    id v10 = objc_msgSend(*(id *)(v5 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_42);
    int v11 = 134219522;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    id v22 = v3;
    __int16 v23 = 2114;
    long long v24 = v10;
    _os_log_impl(&dword_21FCFC000, v4, OS_LOG_TYPE_INFO, "%p:%{public}@ budget full will skip specifier:%{public}@ %.3lfs after nextSpecifier:%{public}@ bucket:%{public}@ existing:%{public}@", (uint8_t *)&v11, 0x48u);
  }
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_40(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

BLSHInactiveBudgetBucket *__100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_43(uint64_t a1, void *a2, double a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a2;
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  double v8 = -v6;
  if (*(unsigned char *)(a1 + 96)) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 <= a3;
  }
  if (v9 && v6 >= a3 && v7 <= v6)
  {
    uint64_t v16 = bls_budget_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      __int16 v19 = *(BLSHInactiveBudgetBucket **)(a1 + 80);
      uint64_t v21 = *(void *)(a1 + 48);
      uint64_t v20 = *(BLSHInactiveBudgetBucket **)(a1 + 56);
      objc_msgSend(*(id *)(v17 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_62);
      id v22 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      uint64_t v41 = v17;
      __int16 v42 = 2114;
      uint64_t v43 = v21;
      __int16 v44 = 2114;
      uint64_t v45 = v18;
      __int16 v46 = 2048;
      double v47 = a3;
      __int16 v48 = 2048;
      id v49 = v19;
      __int16 v50 = 2114;
      uint64_t v51 = v20;
      __int16 v52 = 2114;
      uint64_t v53 = v22;
      _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_INFO, "%p:%{public}@ will skip - out of budget specifier:%{public}@ %.3lfs after oldBucket %.3lfs before nextSpecifier:%{public}@ existing:%{public}@", buf, 0x48u);
    }
    __int16 v15 = 0;
    goto LABEL_19;
  }
  if (!*(unsigned char *)(a1 + 96))
  {
    uint64_t v12 = [*(id *)(a1 + 32) newSpecifierWithMaxFidelity:1];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  __int16 v15 = [[BLSHInactiveBudgetBucket alloc] initWithFutureSpecifier:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v16 = bls_budget_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_43_cold_2(a1, (uint64_t)v15, v16);
    }
    goto LABEL_19;
  }
  if (v6 < a3)
  {
    uint64_t v16 = bls_budget_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      objc_msgSend(*(id *)(v24 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_50);
      __int16 v27 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      uint64_t v41 = v24;
      __int16 v42 = 2114;
      uint64_t v43 = v25;
      __int16 v44 = 2114;
      uint64_t v45 = v26;
      __int16 v46 = 2048;
      double v47 = a3;
      __int16 v48 = 2114;
      id v49 = v15;
      __int16 v50 = 2114;
      uint64_t v51 = v27;
      uint64_t v28 = "%p:%{public}@ specifier:%{public}@ %.3lfs after oldBucket newBucket:%{public}@ existing:%{public}@";
LABEL_31:
      id v34 = v16;
      uint32_t v35 = 62;
      goto LABEL_32;
    }
    goto LABEL_19;
  }
  if (v7 > v6)
  {
    uint64_t v16 = bls_budget_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 48);
      id v31 = *(BLSHInactiveBudgetBucket **)(a1 + 56);
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      double v33 = *(double *)(a1 + 80);
      objc_msgSend(*(id *)(v29 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_53);
      __int16 v27 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      uint64_t v41 = v29;
      __int16 v42 = 2114;
      uint64_t v43 = v30;
      __int16 v44 = 2114;
      uint64_t v45 = v32;
      __int16 v46 = 2048;
      double v47 = v33;
      __int16 v48 = 2114;
      id v49 = v31;
      __int16 v50 = 2114;
      uint64_t v51 = v15;
      __int16 v52 = 2114;
      uint64_t v53 = v27;
      uint64_t v28 = "%p:%{public}@ specifier:%{public}@ %.3lfs before nextSpecifier:%{public}@ newBucket:%{public}@ existing:%{public}@";
      id v34 = v16;
      uint32_t v35 = 72;
LABEL_32:
      _os_log_debug_impl(&dword_21FCFC000, v34, OS_LOG_TYPE_DEBUG, v28, buf, v35);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v8 > a3)
  {
    uint64_t v16 = bls_budget_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = *(void *)(a1 + 40);
      uint64_t v37 = *(void *)(a1 + 48);
      uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      objc_msgSend(*(id *)(v36 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_56);
      __int16 v27 = (BLSHInactiveBudgetBucket *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      uint64_t v41 = v36;
      __int16 v42 = 2114;
      uint64_t v43 = v37;
      __int16 v44 = 2114;
      uint64_t v45 = v38;
      __int16 v46 = 2048;
      double v47 = a3;
      __int16 v48 = 2114;
      id v49 = v15;
      __int16 v50 = 2114;
      uint64_t v51 = v27;
      uint64_t v28 = "%p:%{public}@ specifier:%{public}@ %.3lfs before oldBucket newBucket:%{public}@ existing:%{public}@";
      goto LABEL_31;
    }
LABEL_19:

    return v15;
  }
  char v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"false"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_43_cold_1(a1);
  }
  [v39 UTF8String];
  int64_t result = (BLSHInactiveBudgetBucket *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_45(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_48(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_51(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_54(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

uint64_t __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_60(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

- (void)resetFutureSpecifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_buckets = self->_lock_buckets;
  id v5 = [(NSMutableArray *)lock_buckets indexesOfObjectsPassingTest:&__block_literal_global_66];
  [(NSMutableArray *)lock_buckets removeObjectsAtIndexes:v5];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __57__BLSHInactiveProcessMinutesBudget_resetFutureSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 resetFutureSpecifiers];
  if ([v2 hasBeenRendered]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 containsInvalidation] ^ 1;
  }

  return v3;
}

- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4
{
  id v7 = a3;
  double v8 = self->_identifier;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke;
  v24[3] = &unk_264534358;
  id v25 = v7;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2;
  v21[3] = &unk_2645342C0;
  v21[4] = self;
  id v22 = v8;
  id v23 = v25;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_67;
  v16[3] = &unk_264534380;
  int64_t v19 = a4;
  SEL v20 = a2;
  id v17 = v23;
  uint64_t v18 = self;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_71;
  v11[3] = &unk_2645343A8;
  id v12 = v17;
  uint64_t v13 = self;
  uint64_t v14 = v22;
  SEL v15 = a2;
  BOOL v9 = v22;
  id v10 = v17;
  -[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:]((uint64_t)self, v10, v24, v21, v16, v11);
}

uint64_t __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 applyRenderedSpecifier:*(void *)(a1 + 32) allowBeforeStart:a3];
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = bls_budget_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2_cold_1();
  }
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = NSString;
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = NSStringFromBLSUpdateFidelity();
  id v7 = [v4 stringWithFormat:@"applyRenderedSpecifier: should never exceed budget:%@ specifier:%@ expectedFidelity:%@", v3, v5, v6];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    double v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    BOOL v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544642;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    SEL v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    int64_t v19 = @"BLSHInactiveProcessMinutesBudget.m";
    __int16 v20 = 1024;
    int v21 = 251;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

BLSHInactiveBudgetBucket *__77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [[BLSHInactiveBudgetBucket alloc] initWithFutureSpecifier:*(void *)(a1 + 32)];
  [(BLSHInactiveBudgetBucket *)v4 applyRenderedSpecifier:*(void *)(a1 + 32) allowBeforeStart:0];
  if (v5 != 0.0)
  {
    double v12 = v5;
    uint64_t v13 = NSString;
    uint64_t v14 = *(void *)(a1 + 32);
    SEL v15 = [(BLSHInactiveBudgetBucket *)v4 startDate];
    __int16 v16 = objc_msgSend(v15, "bls_shortLoggingString");
    uint64_t v17 = [*(id *)(a1 + 32) date];
    [v17 timeIntervalSinceReferenceDate];
    uint64_t v19 = v18;
    __int16 v20 = [(BLSHInactiveBudgetBucket *)v4 startDate];
    [v20 timeIntervalSinceReferenceDate];
    __int16 v22 = [v13 stringWithFormat:@"newly allocated bucket failed to apply rendered specifier bucket:%@ specifier:%@ interval:%lf startDate:%@ (specifier:%a startDate:%a)", v4, v14, *(void *)&v12, v16, v19, v21];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_71_cold_1(a1);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD6E1DCLL);
  }
  double v6 = bls_budget_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = objc_msgSend(*(id *)(v9 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_77);
    *(_DWORD *)buf = 134219010;
    uint64_t v24 = v9;
    __int16 v25 = 2114;
    uint64_t v26 = v8;
    __int16 v27 = 2114;
    uint64_t v28 = v10;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    __int16 v31 = 2114;
    uint64_t v32 = v11;
    _os_log_debug_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEBUG, "%p:%{public}@ rendered specifier:%{public}@ not found, applied to new bucket:%{public}@ existing:%{public}@", buf, 0x34u);
  }

  return v4;
}

uint64_t __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_75(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

- (double)delayTimeToAddInvalidation:(char)a3 hasSecondsBudget:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = *(id *)(a1 + 8);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke;
    v21[3] = &unk_264534298;
    id v22 = v5;
    char v23 = a3;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2;
    v18[3] = &unk_2645342C0;
    v18[4] = a1;
    id v19 = v6;
    id v20 = v22;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_78;
    v15[3] = &unk_2645342C0;
    v15[4] = a1;
    id v16 = v19;
    id v17 = v20;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_82;
    v11[3] = &unk_2645343D0;
    id v12 = v17;
    uint64_t v13 = a1;
    id v7 = v16;
    id v14 = v7;
    if (-[BLSHInactiveProcessMinutesBudget chargeSpecifier:withChargeBlock:fitInBucketBlock:exceededBudgetBlock:missedBucketBlock:](a1, v12, v21, v18, v15, v11))
    {
      if (-[BLSHInactiveProcessMinutesBudget intervalSinceLastInvalidation]((os_unfair_lock_s *)a1) >= 0.9) {
        double v8 = 0.0;
      }
      else {
        double v8 = 1.0;
      }
    }
    else
    {
      [MEMORY[0x263F29A18] secondsFidelityThreshold];
      double v8 = v9;
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

uint64_t __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 addInvalidation:*(void *)(a1 + 32) hasSecondsBudget:*(unsigned __int8 *)(a1 + 40) allowBeforeStart:a3];
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = bls_budget_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_cold_1();
  }
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_78(uint64_t a1)
{
  id v2 = bls_budget_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_78_cold_1(a1, v2);
  }
}

uint64_t __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_79(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

BLSHInactiveBudgetBucket *__80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_82(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [[BLSHInactiveBudgetBucket alloc] initWithInvalidation:a1[4]];
  id v5 = bls_budget_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v9 = a1[4];
    uint64_t v10 = objc_msgSend(*(id *)(v8 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_85);
    int v11 = 134219010;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    id v18 = v3;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_debug_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEBUG, "%p:%{public}@ invalidation:%{public}@ applied to new bucket:%{public}@ existing:%{public}@", (uint8_t *)&v11, 0x34u);
  }

  return v4;
}

uint64_t __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_83(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

- (double)intervalSinceLastInvalidation
{
  if (!a1) {
    return 0.0;
  }
  v1 = a1 + 12;
  os_unfair_lock_lock(a1 + 12);
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  double v3 = v2;
  os_unfair_lock_unlock(v1);
  return v3;
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F29940]) initWithDate:v8 fidelity:a4];
  double v11 = -[BLSHInactiveProcessMinutesBudget delayTimeToAddInvalidation:hasSecondsBudget:]((uint64_t)self, v10, [(BLSHInactiveProcessMinutesBudget *)self hasSecondsBudgetAtDate:v8]);
  uint64_t v12 = self->_osTimerProvider;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke;
  v28[3] = &unk_2645343F8;
  BOOL v32 = v11 == 0.0;
  v28[4] = self;
  __int16 v13 = v12;
  __int16 v29 = v13;
  int64_t v31 = a4;
  id v14 = v9;
  id v30 = v14;
  __int16 v15 = (void (**)(void))MEMORY[0x223C5E2B0](v28);
  os_unfair_lock_lock(&self->_lock);
  if (v11 == 0.0)
  {
    os_unfair_lock_unlock(&self->_lock);
    v15[2](v15);
  }
  else
  {
    int v16 = [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer isScheduled];
    __int16 v17 = bls_budget_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        identifier = self->_identifier;
        id v20 = objc_msgSend(v8, "bls_loggingString");
        [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer timeRemaining];
        *(_DWORD *)buf = 134218754;
        id v34 = self;
        __int16 v35 = 2114;
        uint64_t v36 = identifier;
        __int16 v37 = 2114;
        uint64_t v38 = v20;
        __int16 v39 = 2048;
        double v40 = v21;
        _os_log_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_INFO, "%p:%{public}@ will ignore budgeted invalidation at requesteDate:%{public}@ already have scheduled invalidation in %.3lfs", buf, 0x2Au);
      }
    }
    else
    {
      if (v18)
      {
        id v22 = self->_identifier;
        *(_DWORD *)buf = 134218754;
        id v34 = self;
        __int16 v35 = 2114;
        uint64_t v36 = v22;
        __int16 v37 = 2114;
        uint64_t v38 = v10;
        __int16 v39 = 2048;
        double v40 = v11;
        _os_log_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_INFO, "%p:%{public}@ will schedule budgeted invalidation specifier:%{public}@ in %.0lfs", buf, 0x2Au);
      }

      [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer invalidate];
      osTimerProvider = self->_osTimerProvider;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_91;
      v26[3] = &unk_264532FD8;
      __int16 v27 = v15;
      uint64_t v24 = [(BLSHOSTimerProviding *)osTimerProvider scheduledTimerWithIdentifier:@"MinutesInvalidationBudgetExceeded" interval:v26 leewayInterval:v11 handler:v11 * 0.25];
      lock_invalidationTimer = self->_lock_invalidationTimer;
      self->_lock_invalidationTimer = v24;

      __int16 v17 = v27;
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

uint64_t __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = objc_alloc(MEMORY[0x263F29940]);
    double v4 = [*(id *)(a1 + 40) now];
    id v5 = (void *)[v3 initWithDate:v4 fidelity:*(void *)(a1 + 56)];
    -[BLSHInactiveProcessMinutesBudget delayTimeToAddInvalidation:hasSecondsBudget:](v2, v5, 1);
  }
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v6();
}

uint64_t __95__BLSHInactiveProcessMinutesBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke_91(uint64_t a1, void *a2)
{
  [a2 invalidate];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)performInvalidation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_lastInvalidationTimestamp = mach_continuous_time();
  [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer invalidate];
  lock_invalidationTimer = self->_lock_invalidationTimer;
  self->_lock_invalidationTimer = 0;

  lock_buckets = self->_lock_buckets;
  id v6 = [(NSMutableArray *)lock_buckets indexesOfObjectsPassingTest:&__block_literal_global_94];
  [(NSMutableArray *)lock_buckets removeObjectsAtIndexes:v6];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __55__BLSHInactiveProcessMinutesBudget_performInvalidation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 resetFutureAndRenderedSpecifiers];
  int v3 = [v2 containsInvalidation];

  return v3 ^ 1u;
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_buckets = self->_lock_buckets;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__BLSHInactiveProcessMinutesBudget_stillTrackingAfterPurgingStaleDataForNowDate___block_invoke;
  v10[3] = &unk_264534420;
  id v11 = v4;
  id v7 = v4;
  id v8 = [(NSMutableArray *)lock_buckets indexesOfObjectsPassingTest:v10];
  [(NSMutableArray *)lock_buckets removeObjectsAtIndexes:v8];

  LOBYTE(self) = [(NSMutableArray *)self->_lock_buckets count] != 0;
  os_unfair_lock_unlock(p_lock);

  return (char)self;
}

uint64_t __81__BLSHInactiveProcessMinutesBudget_stillTrackingAfterPurgingStaleDataForNowDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 validAtDate:*(void *)(a1 + 32)] ^ 1;
}

- (unint64_t)bucketCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableArray *)self->_lock_buckets count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)secondsBucketCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableArray *)self->_lock_buckets bs_filter:&__block_literal_global_97];
  unint64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

uint64_t __54__BLSHInactiveProcessMinutesBudget_secondsBucketCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSecondsFidelity];
}

- (NSArray)buckets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = (void *)[(NSMutableArray *)self->_lock_buckets copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (BOOL)hasSecondsBudgetAtDate:(id)a3
{
  int v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = -[BLSHInactiveProcessMinutesBudget lock_hasSecondsBudgetAtDate:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

uint64_t __64__BLSHInactiveProcessMinutesBudget_lock_hasSecondsBudgetAtDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortLoggingString];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_lock_buckets, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)allowedFidelityAtDate:(const char *)a1 expectedFidelity:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)validateAndChargeFutureSpecifier:(const char *)a1 nextSpecifier:expectedFidelity:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)validateAndChargeFutureSpecifier:(const char *)a1 nextSpecifier:expectedFidelity:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_5(&dword_21FCFC000, v0, v1, "%p:%{public}@ specifier:%{public}@ fits in bucket:%{public}@");
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_43_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 88));
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __100__BLSHInactiveProcessMinutesBudget_validateAndChargeFutureSpecifier_nextSpecifier_expectedFidelity___block_invoke_43_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend(*(id *)(v5 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_47);
  int v10 = 134219010;
  uint64_t v11 = v5;
  OUTLINED_FUNCTION_8_2();
  uint64_t v12 = v6;
  __int16 v13 = v8;
  uint64_t v14 = a2;
  __int16 v15 = v8;
  uint64_t v16 = v9;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ have budget for specifier:%{public}@ created new newBucket:%{public}@ existing:%{public}@", (uint8_t *)&v10, 0x34u);
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_5(&dword_21FCFC000, v0, v1, "%p:%{public}@ rendered specifier:%{public}@ applied to bucket:%{public}@");
}

void __77__BLSHInactiveProcessMinutesBudget_chargeRenderedSpecifier_expectedFidelity___block_invoke_71_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_5(&dword_21FCFC000, v0, v1, "%p:%{public}@ invalidation:%{public}@ applied to bucket:%{public}@");
}

void __80__BLSHInactiveProcessMinutesBudget_delayTimeToAddInvalidation_hasSecondsBudget___block_invoke_78_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = objc_msgSend(*(id *)(v3 + 24), "bls_boundedDescriptionWithTransformer:", &__block_literal_global_81);
  int v8 = 134218754;
  uint64_t v9 = v3;
  OUTLINED_FUNCTION_8_2();
  uint64_t v10 = v4;
  __int16 v11 = v6;
  uint64_t v12 = v7;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p:%{public}@ invalidation:%{public}@ exceeded budget existing:%{public}@", (uint8_t *)&v8, 0x2Au);
}

@end