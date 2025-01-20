@interface HMDCodingConditionSet
+ (void)resolve:(void *)a3 fromSet:;
- (BOOL)isEqual:(id)a3;
- (HMDCodingConditionSet)initWithModel:(id)a3;
- (HMDCodingConditionSet)initWithModel:(id)a3 conditions:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)addCondition:(id)a3;
- (void)removeCondition:(id)a3;
- (void)resolve:(uint64_t)a1;
@end

@implementation HMDCodingConditionSet

+ (void)resolve:(void *)a3 fromSet:
{
  self;
  if (a3)
  {
    uint64_t v5 = [a3 indexOfObject:a2];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = v5;
      self;
      if (v6 >= 0x40)
      {
        v7 = (HMDCodingConditionSet *)_HMFPreconditionFailure();
        [(HMDCodingConditionSet *)v7 .cxx_destruct];
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithModel:self->_model];
  *((void *)result + 2) = self->_bitmask;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && (HMDManagedObjectCodingModel *)*((void *)a3 + 1) == self->_model
      && *((void *)a3 + 2) == self->_bitmask;
}

- (unint64_t)hash
{
  return self->_bitmask ^ [(HMDManagedObjectCodingModel *)self->_model hash];
}

- (id)description
{
  model = self->_model;
  unint64_t bitmask = self->_bitmask;
  if (model) {
    conditions = model->_conditions;
  }
  else {
    conditions = 0;
  }
  self;
  if (bitmask)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __55__HMDCodingConditionSet_descriptionForBitmask_withSet___block_invoke;
    v12 = &unk_264A1B9C8;
    id v13 = v5;
    unint64_t v14 = bitmask;
    id v6 = v5;
    [(NSOrderedSet *)conditions enumerateObjectsUsingBlock:&v9];
    v7 = (__CFString *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  }
  else
  {
    v7 = @"<none>";
  }
  return v7;
}

void __55__HMDCodingConditionSet_descriptionForBitmask_withSet___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  self;
  if (a3 >= 0x40)
  {
    v7 = (HMDCodingConditionSet *)_HMFPreconditionFailure();
    [(HMDCodingConditionSet *)v7 removeCondition:v9];
  }
  else if ((*(void *)(a1 + 40) >> a3))
  {
    if ([*(id *)(a1 + 32) length]) {
      [*(id *)(a1 + 32) appendString:@"|"];
    }
    id v6 = *(void **)(a1 + 32);
    [v6 appendString:a2];
  }
}

- (void)removeCondition:(id)a3
{
  -[HMDCodingConditionSet resolve:]((uint64_t)self, (uint64_t)a3);
  self->_bitmask &= ~v4;
}

- (void)resolve:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    uint64_t v4 = v3 ? *(void **)(v3 + 40) : 0;
    +[HMDCodingConditionSet resolve:fromSet:]((uint64_t)HMDCodingConditionSet, a2, v4);
    if (!v5)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        SEL v8 = HMFGetLogIdentifier();
        int v9 = 138543618;
        uint64_t v10 = v8;
        __int16 v11 = 2114;
        uint64_t v12 = a2;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring coding condition '%{public}@' that is not defined in the coding model", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (void)addCondition:(id)a3
{
  -[HMDCodingConditionSet resolve:]((uint64_t)self, (uint64_t)a3);
  self->_bitmask |= v4;
}

- (HMDCodingConditionSet)initWithModel:(id)a3 conditions:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HMDCodingConditionSet *)self initWithModel:a3];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = a4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[HMDCodingConditionSet addCondition:](v5, "addCondition:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (HMDCodingConditionSet)initWithModel:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCodingConditionSet;
  uint64_t v4 = [(HMDCodingConditionSet *)&v7 init];
  uint64_t v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_model, a3);
  }
  return v5;
}

@end