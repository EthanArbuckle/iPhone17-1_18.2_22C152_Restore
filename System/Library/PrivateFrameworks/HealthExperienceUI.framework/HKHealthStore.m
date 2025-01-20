@interface HKHealthStore
@end

@implementation HKHealthStore

uint64_t __83__HKHealthStore_HAExtensions__mostRecentQuantitySampleOfType_predicate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__HKHealthStore_HAExtensions__mostRecentCategorySampleOfType_predicate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__HKHealthStore_HAExtensions__averageQuantityForType_unit_predicate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a4;
  v6 = [a3 averageQuantity];
  v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v6)
  {
    v9 = (void *)MEMORY[0x1E4F28ED0];
    [v6 doubleValueForUnit:*(void *)(a1 + 32)];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v10, v11);
  }
  else
  {
    (*(void (**)(void, void, id))(v8 + 16))(*(void *)(a1 + 40), 0, v11);
  }
}

void __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke(void *a1)
{
  if (++*(void *)(*(void *)(a1[5] + 8) + 24) >= 2uLL)
  {
    double v2 = *(double *)(*(void *)(a1[6] + 8) + 24);
    if (v2 <= 0.0 || (double v3 = *(double *)(*(void *)(a1[7] + 8) + 24), v3 <= 0.0))
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:v3 / (v2 * v2)];
    }
    id v5 = (id)v4;
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_3;
  block[3] = &unk_1E5E7CDE0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) quantity];
  id v3 = [MEMORY[0x1E4F2B618] meterUnit];
  [v2 doubleValueForUnit:v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

void __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_5;
  block[3] = &unk_1E5E7CDE0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_5(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) quantity];
  id v3 = [MEMORY[0x1E4F2B618] unitFromString:@"kg"];
  [v2 doubleValueForUnit:v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

@end