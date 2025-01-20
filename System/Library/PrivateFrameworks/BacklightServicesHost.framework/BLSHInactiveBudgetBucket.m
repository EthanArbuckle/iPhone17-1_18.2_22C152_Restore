@interface BLSHInactiveBudgetBucket
- (BLSHInactiveBudgetBucket)initWithFutureSpecifier:(id)a3;
- (BLSHInactiveBudgetBucket)initWithInvalidation:(id)a3;
- (BLSHInactiveBudgetBucketEntryCount)entryCount;
- (BLSHInactiveBudgetBucketEntryCount)invalidatedEntryCount;
- (BLSHInactiveBudgetBucketEntryCount)renderedEntryCount;
- (BOOL)containsInvalidation;
- (BOOL)hasBeenRendered;
- (BOOL)isSecondsFidelity;
- (BOOL)validAtDate:(id)a3;
- (NSDate)minuteBoundaryDate;
- (NSDate)startDate;
- (double)addFutureSpecifier:(id)a3 hasSecondsBudget:(BOOL)a4 allowBeforeStart:(BOOL)a5;
- (double)addInvalidation:(id)a3 hasSecondsBudget:(BOOL)a4 allowBeforeStart:(BOOL)a5;
- (double)addSpecifier:(char)a3 allowBeforeStart:(void *)a4 withCountBlock:;
- (double)applyRenderedSpecifier:(id)a3 allowBeforeStart:(BOOL)a4;
- (id)debugDescription;
- (id)description;
- (id)shortLoggingString;
- (int64_t)compare:(id)a3;
- (void)initWithStartDate:(void *)a1;
- (void)recomputeMinuteBoundary;
- (void)resetFutureAndRenderedSpecifiers;
- (void)resetFutureSpecifiers;
@end

@implementation BLSHInactiveBudgetBucket

- (void)initWithStartDate:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BLSHInactiveBudgetBucket;
    id v5 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      v6 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
      v7 = (void *)a1[4];
      a1[4] = v6;

      v8 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
      v9 = (void *)a1[5];
      a1[5] = v8;

      v10 = objc_alloc_init(BLSHInactiveBudgetBucketEntryCount);
      v11 = (void *)a1[6];
      a1[6] = v10;

      -[BLSHInactiveBudgetBucket recomputeMinuteBoundary]((uint64_t)a1);
    }
  }

  return a1;
}

- (void)recomputeMinuteBoundary
{
  if (a1)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v9 setSecond:0];
    v2 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
    v3 = [v2 nextDateAfterDate:*(void *)(a1 + 16) matchingComponents:v9 options:5120];

    [v3 timeIntervalSinceDate:*(void *)(a1 + 16)];
    double v5 = v4;
    [MEMORY[0x263F29A18] secondsFidelityThreshold];
    if (v5 < v6)
    {
      id v7 = v3;
    }
    else
    {
      id v7 = [MEMORY[0x263EFF910] distantFuture];
    }
    v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v7;
  }
}

- (BLSHInactiveBudgetBucket)initWithFutureSpecifier:(id)a3
{
  id v4 = a3;
  double v5 = [v4 date];
  double v6 = (BLSHInactiveBudgetBucket *)-[BLSHInactiveBudgetBucket initWithStartDate:](self, v5);

  if (v6) {
    [(BLSHInactiveBudgetBucketEntryCount *)v6->_entryCount countSpecifier:v4 hasSecondsBudget:1 isCoalesceAllowed:1];
  }

  return v6;
}

- (BLSHInactiveBudgetBucket)initWithInvalidation:(id)a3
{
  id v4 = a3;
  double v5 = [v4 date];
  double v6 = (BLSHInactiveBudgetBucket *)-[BLSHInactiveBudgetBucket initWithStartDate:](self, v5);

  if (v6)
  {
    [(BLSHInactiveBudgetBucketEntryCount *)v6->_entryCount countSpecifier:v4 hasSecondsBudget:1 isCoalesceAllowed:0];
    [(BLSHInactiveBudgetBucketEntryCount *)v6->_renderedEntryCount countSpecifier:v4 hasSecondsBudget:1 isCoalesceAllowed:0];
    [(BLSHInactiveBudgetBucketEntryCount *)v6->_invalidatedEntryCount countSpecifier:v4 hasSecondsBudget:1 isCoalesceAllowed:0];
  }

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NSDate *)self->_startDate bls_shortLoggingString];
  [v3 appendString:v4 withName:@"start"];

  id v5 = (id)objc_msgSend(v3, "appendInt:withName:", -[BLSHInactiveBudgetBucketEntryCount count](self->_entryCount, "count"), @"count");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHInactiveBudgetBucketEntryCount isSecondsFidelity](self->_entryCount, "isSecondsFidelity"), @"isSecondsFidelity", 1);
  id v7 = (id)[v3 appendBool:self->_containsInvalidation withName:@"containsInvalidation" ifEqualTo:1];
  v8 = [v3 build];

  return v8;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NSDate *)self->_startDate bls_shortLoggingString];
  [v3 appendString:v4 withName:@"start"];

  id v5 = (id)objc_msgSend(v3, "appendInt:withName:", -[BLSHInactiveBudgetBucketEntryCount count](self->_entryCount, "count"), @"count");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHInactiveBudgetBucketEntryCount isSecondsFidelity](self->_entryCount, "isSecondsFidelity"), @"isSecondsFidelity", 1);
  id v7 = (id)[v3 appendBool:self->_containsInvalidation withName:@"containsInvalidation" ifEqualTo:1];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  objc_super v13 = __44__BLSHInactiveBudgetBucket_debugDescription__block_invoke;
  v14 = &unk_2645322D0;
  id v15 = v3;
  v16 = self;
  id v8 = v3;
  [v8 appendBodySectionWithName:0 multilinePrefix:@"        " block:&v11];
  id v9 = objc_msgSend(v8, "build", v11, v12, v13, v14);

  return v9;
}

id __44__BLSHInactiveBudgetBucket_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"futureEntries"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"renderedEntries"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"invalidationEntries"];
}

- (id)shortLoggingString
{
  id v3 = NSString;
  id v4 = [(NSDate *)self->_startDate bls_shortLoggingString];
  uint64_t v5 = [(BLSHInactiveBudgetBucketEntryCount *)self->_entryCount count];
  BOOL v6 = [(BLSHInactiveBudgetBucketEntryCount *)self->_entryCount isSecondsFidelity];
  id v7 = "";
  id v8 = " seconds";
  if (!v6) {
    id v8 = "";
  }
  if (self->_containsInvalidation) {
    id v7 = " invalidation(s)";
  }
  id v9 = [v3 stringWithFormat:@"<%p; %@ (%ld)%s%s>", self, v4, v5, v8, v7];

  return v9;
}

- (int64_t)compare:(id)a3
{
  return [(NSDate *)self->_startDate compare:*((void *)a3 + 2)];
}

- (BOOL)isSecondsFidelity
{
  return [(BLSHInactiveBudgetBucketEntryCount *)self->_entryCount isSecondsFidelity];
}

- (double)addSpecifier:(char)a3 allowBeforeStart:(void *)a4 withCountBlock:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  if (!a1)
  {
    double v16 = 0.0;
    goto LABEL_19;
  }
  id v9 = [v7 date];
  [MEMORY[0x263F29A18] secondsFidelityThreshold];
  double v11 = v10;
  [v9 timeIntervalSinceDate:*(void *)(a1 + 16)];
  double v13 = v12;
  [*(id *)(a1 + 32) timeIntervalFromLastEntryToDate:v9];
  double v15 = v14;
  if (v13 >= 0.0)
  {
    if (v13 >= v11)
    {
      double v16 = v14;
      goto LABEL_18;
    }
LABEL_7:
    int v17 = [*(id *)(a1 + 32) count];
    int v18 = v8[2](v8);
    if (v18) {
      double v16 = 0.0;
    }
    else {
      double v16 = NAN;
    }
    if (v13 < 0.0 && v18 != 0)
    {
      v20 = bls_budget_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v22 = *(void **)(a1 + 16);
        [v22 timeIntervalSinceDate:v9];
        uint64_t v24 = v23;
        int v25 = [*(id *)(a1 + 32) count];
        int v26 = 134220034;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        id v29 = v7;
        __int16 v30 = 2114;
        v31 = v22;
        __int16 v32 = 2114;
        v33 = v9;
        __int16 v34 = 2048;
        uint64_t v35 = v24;
        __int16 v36 = 2048;
        double v37 = v13;
        __int16 v38 = 2048;
        double v39 = v15;
        __int16 v40 = 1024;
        int v41 = v17;
        __int16 v42 = 1024;
        int v43 = v25;
        _os_log_debug_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_DEBUG, "%p added addSpecifier:%{public}@ start date will change:%{public}@->%{public}@ (%.3lfs) (intervalSinceStart:%lf; intervalAfterEnd:%lf) (count:%d->%d)",
          (uint8_t *)&v26,
          0x54u);
      }

      objc_storeStrong((id *)(a1 + 16), v9);
      -[BLSHInactiveBudgetBucket recomputeMinuteBoundary](a1);
      double v16 = 0.0;
    }
    goto LABEL_18;
  }
  if (v14 > -v11 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  double v16 = v13;
LABEL_18:

LABEL_19:
  return v16;
}

- (double)addFutureSpecifier:(id)a3 hasSecondsBudget:(BOOL)a4 allowBeforeStart:(BOOL)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__BLSHInactiveBudgetBucket_addFutureSpecifier_hasSecondsBudget_allowBeforeStart___block_invoke;
  v12[3] = &unk_2645336B0;
  BOOL v14 = a4;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  double v10 = -[BLSHInactiveBudgetBucket addSpecifier:allowBeforeStart:withCountBlock:]((uint64_t)self, v9, a5, v12);

  return v10;
}

uint64_t __81__BLSHInactiveBudgetBucket_addFutureSpecifier_hasSecondsBudget_allowBeforeStart___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  id v4 = [*(id *)(a1 + 40) date];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  BOOL v7 = v6 >= 0.0;
  if (v6 >= 1.0) {
    BOOL v7 = 0;
  }
  if (v2) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  double v10 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v10 countSpecifier:v9 hasSecondsBudget:v8 isCoalesceAllowed:1];
}

- (double)applyRenderedSpecifier:(id)a3 allowBeforeStart:(BOOL)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__BLSHInactiveBudgetBucket_applyRenderedSpecifier_allowBeforeStart___block_invoke;
  v10[3] = &unk_2645336D8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  double v8 = -[BLSHInactiveBudgetBucket addSpecifier:allowBeforeStart:withCountBlock:]((uint64_t)self, v7, a4, v10);

  return v8;
}

uint64_t __68__BLSHInactiveBudgetBucket_applyRenderedSpecifier_allowBeforeStart___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return 1;
}

- (double)addInvalidation:(id)a3 hasSecondsBudget:(BOOL)a4 allowBeforeStart:(BOOL)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke;
  v12[3] = &unk_2645336B0;
  v12[4] = self;
  id v13 = v8;
  BOOL v14 = a4;
  id v9 = v8;
  double v10 = -[BLSHInactiveBudgetBucket addSpecifier:allowBeforeStart:withCountBlock:]((uint64_t)self, v9, a5, v12);

  return v10;
}

uint64_t __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  int v2 = (void *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) countSpecifier:*(void *)(a1 + 40) hasSecondsBudget:*(unsigned __int8 *)(a1 + 48) isCoalesceAllowed:0];
  if (v3)
  {
    [*(id *)(*v1 + 40) countSpecifier:*v2 hasSecondsBudget:1 isCoalesceAllowed:0];
    [*(id *)(*v1 + 48) countSpecifier:*v2 hasSecondsBudget:1 isCoalesceAllowed:0];
    *(unsigned char *)(*v1 + 9) = 1;
    id v4 = bls_budget_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke_cold_1(v1, v1 + 1, v4);
    }
  }
  return v3;
}

- (void)resetFutureSpecifiers
{
  uint64_t v3 = (BLSHInactiveBudgetBucketEntryCount *)[(BLSHInactiveBudgetBucketEntryCount *)self->_renderedEntryCount copy];
  entryCount = self->_entryCount;
  self->_entryCount = v3;

  MEMORY[0x270F9A758](v3, entryCount);
}

- (void)resetFutureAndRenderedSpecifiers
{
  uint64_t v3 = (BLSHInactiveBudgetBucketEntryCount *)[(BLSHInactiveBudgetBucketEntryCount *)self->_invalidatedEntryCount copy];
  entryCount = self->_entryCount;
  self->_entryCount = v3;

  double v5 = (BLSHInactiveBudgetBucketEntryCount *)[(BLSHInactiveBudgetBucketEntryCount *)self->_invalidatedEntryCount copy];
  renderedEntryCount = self->_renderedEntryCount;
  self->_renderedEntryCount = v5;

  self->_rendered = 0;
}

- (BOOL)validAtDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BLSHInactiveBudgetBucket *)self isSecondsFidelity];
  double v6 = -60.0;
  if (v5) {
    double v6 = -3600.0;
  }
  id v7 = [v4 dateByAddingTimeInterval:v6];

  char v8 = [v7 isBeforeDate:self->_startDate];
  return v8;
}

- (BOOL)hasBeenRendered
{
  return self->_rendered;
}

- (BOOL)containsInvalidation
{
  return self->_containsInvalidation;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)minuteBoundaryDate
{
  return self->_minuteBoundaryDate;
}

- (BLSHInactiveBudgetBucketEntryCount)entryCount
{
  return self->_entryCount;
}

- (BLSHInactiveBudgetBucketEntryCount)renderedEntryCount
{
  return self->_renderedEntryCount;
}

- (BLSHInactiveBudgetBucketEntryCount)invalidatedEntryCount
{
  return self->_invalidatedEntryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedEntryCount, 0);
  objc_storeStrong((id *)&self->_renderedEntryCount, 0);
  objc_storeStrong((id *)&self->_entryCount, 0);
  objc_storeStrong((id *)&self->_minuteBoundaryDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

void __78__BLSHInactiveBudgetBucket_addInvalidation_hasSecondsBudget_allowBeforeStart___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  int v6 = [*(id *)(*a1 + 32) count];
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p added invalidation:%{public}@ total bucket count:%d", (uint8_t *)&v7, 0x1Cu);
}

@end