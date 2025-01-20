@interface HFAggregatedCharacteristicReadPolicy
- (HFAggregatedCharacteristicReadPolicy)init;
- (HFAggregatedCharacteristicReadPolicy)initWithPolicies:(id)a3;
- (NSArray)policies;
- (NSString)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFAggregatedCharacteristicReadPolicy

void __74__HFAggregatedCharacteristicReadPolicy_evaluateWithCharacteristic_traits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v8 = 0;
  uint64_t v4 = [a2 evaluateWithCharacteristic:v3 traits:&v8];
  id v5 = v8;
  [*(id *)(a1 + 40) unionSet:v5];
  if (v4 == 2)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v6 + 24);
    if (v7 == 1) {
      uint64_t v7 = 2;
    }
    goto LABEL_8;
  }
  if (!v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void *)(v6 + 24);
    if (v7 == 1) {
      uint64_t v7 = 0;
    }
LABEL_8:
    *(void *)(v6 + 24) = v7;
  }
}

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
    uint64_t v10 = [v9 count];

    if (v10 == 1)
    {
      id v11 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
      v12 = [v11 firstObject];
      unint64_t v13 = [v12 evaluateWithCharacteristic:v6 traits:a4];
    }
    else
    {
      v14 = [MEMORY[0x263EFF9C0] set];
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 1;
      v15 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __74__HFAggregatedCharacteristicReadPolicy_evaluateWithCharacteristic_traits___block_invoke;
      v17[3] = &unk_264094FC0;
      id v18 = v6;
      id v11 = v14;
      id v19 = v11;
      v20 = &v21;
      [v15 enumerateObjectsWithOptions:2 usingBlock:v17];

      if (a4) {
        *a4 = (id)[v11 copy];
      }
      unint64_t v13 = v22[3];

      _Block_object_dispose(&v21, 8);
    }
  }
  else
  {
    if (a4)
    {
      *a4 = [MEMORY[0x263EFFA08] set];
    }
    unint64_t v13 = 1;
  }

  return v13;
}

- (NSArray)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
}

- (HFAggregatedCharacteristicReadPolicy)initWithPolicies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAggregatedCharacteristicReadPolicy;
  id v6 = [(HFAggregatedCharacteristicReadPolicy *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policies, a3);
  }

  return v7;
}

- (HFAggregatedCharacteristicReadPolicy)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithPolicies_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicReadPolicy.m", 66, @"%s is unavailable; use %@ instead",
    "-[HFAggregatedCharacteristicReadPolicy init]",
    v5);

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [HFMutableAggregatedCharacteristicReadPolicy alloc];
  id v5 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  id v6 = [(HFAggregatedCharacteristicReadPolicy *)v4 initWithPolicies:v5];

  return v6;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  [v3 appendArraySection:v4 withName:@"policies" skipIfEmpty:0];

  id v5 = [v3 build];

  return (NSString *)v5;
}

@end