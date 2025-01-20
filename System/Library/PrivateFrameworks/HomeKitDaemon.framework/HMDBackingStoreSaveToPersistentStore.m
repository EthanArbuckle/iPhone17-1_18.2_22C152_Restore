@interface HMDBackingStoreSaveToPersistentStore
- (BOOL)incrementGeneration;
- (HMDBackingStoreSaveToPersistentStore)initWithHomeManager:(id)a3 reason:(id)a4 incrementGeneration:(BOOL)a5;
- (HMDHomeManager)homeManager;
- (NSString)reason;
- (id)mainReturningError;
@end

@implementation HMDBackingStoreSaveToPersistentStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

- (BOOL)incrementGeneration
{
  return self->_incrementGeneration;
}

- (NSString)reason
{
  return self->_reason;
}

- (HMDHomeManager)homeManager
{
  return self->_homeManager;
}

- (id)mainReturningError
{
  v3 = [(HMDBackingStoreOperation *)self store];
  v4 = [v3 local];
  id v5 = (id)[v4 _begin];

  v6 = [(HMDBackingStoreOperation *)self store];
  v7 = objc_opt_class();
  reason = self->_reason;
  homeManager = self->_homeManager;
  BOOL incrementGeneration = self->_incrementGeneration;
  v11 = [(HMDBackingStoreOperation *)self store];
  v12 = [v7 _saveToLocalStoreWithReason:reason homeManager:homeManager shouldIncrementGenerationCounter:incrementGeneration backingStore:v11];

  v13 = [(HMDBackingStoreOperation *)self store];
  v14 = [v13 local];
  id v15 = (id)[v14 _commit];

  return v12;
}

- (HMDBackingStoreSaveToPersistentStore)initWithHomeManager:(id)a3 reason:(id)a4 incrementGeneration:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackingStoreSaveToPersistentStore;
  v11 = [(HMDBackingStoreOperation *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeManager, a3);
    objc_storeStrong((id *)&v12->_reason, a4);
    v12->_BOOL incrementGeneration = a5;
    v13 = v12;
  }

  return v12;
}

@end