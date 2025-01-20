@interface LKSwitchOperation
- (LKRecoverEMCSOperation)recoverEMCSOperation;
- (LKSwitchOperation)init;
- (NSArray)keychainItemsAddedAfterRecoverEMCS;
- (NSMutableArray)mutableKeychainItemsAddedAfterRecoverEMCS;
- (id)dictionary;
- (id)switchTypeString;
- (unint64_t)switchType;
- (void)addKeychainItemAdditionEvent:(id)a3;
- (void)removeLastKeychainItemAdditionEvent;
- (void)setMutableKeychainItemsAddedAfterRecoverEMCS:(id)a3;
- (void)setRecoverEMCSOperation:(id)a3;
- (void)setSwitchType:(unint64_t)a3;
@end

@implementation LKSwitchOperation

- (LKSwitchOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)LKSwitchOperation;
  v2 = [(LKOperation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_switchType = 0;
    recoverEMCSOperation = v2->_recoverEMCSOperation;
    v2->_recoverEMCSOperation = 0;
  }
  return v3;
}

- (void)setRecoverEMCSOperation:(id)a3
{
  if (self->_recoverEMCSOperation != a3) {
    objc_storeStrong((id *)&self->_recoverEMCSOperation, a3);
  }
  MEMORY[0x270F9A758]();
}

- (void)setSwitchType:(unint64_t)a3
{
  if (self->_switchType != a3) {
    self->_switchType = a3;
  }
}

- (NSArray)keychainItemsAddedAfterRecoverEMCS
{
  v2 = [(LKSwitchOperation *)self mutableKeychainItemsAddedAfterRecoverEMCS];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSMutableArray)mutableKeychainItemsAddedAfterRecoverEMCS
{
  mutableKeychainItemsAddedAfterRecoverEMCS = self->_mutableKeychainItemsAddedAfterRecoverEMCS;
  if (!mutableKeychainItemsAddedAfterRecoverEMCS)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_mutableKeychainItemsAddedAfterRecoverEMCS;
    self->_mutableKeychainItemsAddedAfterRecoverEMCS = v4;

    mutableKeychainItemsAddedAfterRecoverEMCS = self->_mutableKeychainItemsAddedAfterRecoverEMCS;
  }
  return mutableKeychainItemsAddedAfterRecoverEMCS;
}

- (void)addKeychainItemAdditionEvent:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(LKSwitchOperation *)self mutableKeychainItemsAddedAfterRecoverEMCS];
    [v5 addObject:v4];
  }
}

- (void)removeLastKeychainItemAdditionEvent
{
  v3 = [(LKSwitchOperation *)self mutableKeychainItemsAddedAfterRecoverEMCS];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(LKSwitchOperation *)self mutableKeychainItemsAddedAfterRecoverEMCS];
    [v5 removeLastObject];
  }
}

- (id)switchTypeString
{
  unint64_t v2 = [(LKSwitchOperation *)self switchType];
  if (v2 > 4) {
    return 0;
  }
  else {
    return off_2645FC5E8[v2];
  }
}

- (id)dictionary
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)LKSwitchOperation;
  v3 = [(LKOperation *)&v24 dictionary];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = [(LKSwitchOperation *)self recoverEMCSOperation];
  objc_super v6 = [v5 dictionary];
  [v4 setObject:v6 forKeyedSubscript:@"recoverKeychainOperation"];

  v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(LKSwitchOperation *)self keychainItemsAddedAfterRecoverEMCS];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v14 = [v13 keychainItemAdded];

        if (v14)
        {
          v15 = [v13 dictionary];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v16 = (void *)[v7 copy];
    [v4 setObject:v16 forKeyedSubscript:@"keychainItemsAddedAfterKeychainRecovery"];
  }
  else
  {
    [v4 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:@"keychainItemsAddedAfterKeychainRecovery"];
  }
  v17 = [(LKSwitchOperation *)self switchTypeString];
  [v4 setObject:v17 forKeyedSubscript:@"switchType"];

  v18 = (void *)[v4 copy];
  return v18;
}

- (LKRecoverEMCSOperation)recoverEMCSOperation
{
  return self->_recoverEMCSOperation;
}

- (unint64_t)switchType
{
  return self->_switchType;
}

- (void)setMutableKeychainItemsAddedAfterRecoverEMCS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableKeychainItemsAddedAfterRecoverEMCS, 0);
  objc_storeStrong((id *)&self->_recoverEMCSOperation, 0);
}

@end