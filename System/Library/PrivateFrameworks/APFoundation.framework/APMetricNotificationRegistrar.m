@interface APMetricNotificationRegistrar
- (APMetricNotificationRegistrar)init;
- (NSLock)registryLock;
- (NSMutableDictionary)registryByClosure;
- (NSMutableDictionary)registryByPurpose;
- (NSMutableDictionary)registryToAllPurpose;
- (NSMutableDictionary)registryToExternalPurpose;
- (NSMutableDictionary)registryToInternalPurpose;
- (id)_closuresForPurpose:(int64_t)a3 andMetric:(int64_t)a4;
- (id)_closuresForRegisteredForNonSpecificPurposeInternal:(BOOL)a3;
- (id)_metricRegistryForPurpose:(int64_t)a3 andMetric:(int64_t)a4;
- (int64_t)_registerHandlerInRegistry:(id)a3 closure:(id)a4;
- (int64_t)registerHandlerForAllPurposesAndAllMetricsWithClosure:(id)a3;
- (int64_t)registerHandlerForExternalPurposesAndAllMetricsWithClosure:(id)a3;
- (int64_t)registerHandlerForInternalPurposesAndAllMetricsWithClosure:(id)a3;
- (int64_t)registerHandlerForPurpose:(int64_t)a3 andMetric:(int64_t)a4 closure:(id)a5;
- (int64_t)registerHandlerForPurpose:(int64_t)a3 closure:(id)a4;
- (int64_t)registrationCounter;
- (void)receivedMetric:(id)a3;
- (void)removeHandlerWithIdentifier:(int64_t)a3;
@end

@implementation APMetricNotificationRegistrar

- (APMetricNotificationRegistrar)init
{
  v16.receiver = self;
  v16.super_class = (Class)APMetricNotificationRegistrar;
  v2 = [(APMetricNotificationRegistrar *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    registryByPurpose = v2->_registryByPurpose;
    v2->_registryByPurpose = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:16];
    registryByClosure = v2->_registryByClosure;
    v2->_registryByClosure = (NSMutableDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    registryToAllPurpose = v2->_registryToAllPurpose;
    v2->_registryToAllPurpose = (NSMutableDictionary *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    registryToInternalPurpose = v2->_registryToInternalPurpose;
    v2->_registryToInternalPurpose = (NSMutableDictionary *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    registryToExternalPurpose = v2->_registryToExternalPurpose;
    v2->_registryToExternalPurpose = (NSMutableDictionary *)v11;

    v2->_registrationCounter = 1;
    v13 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    registryLock = v2->_registryLock;
    v2->_registryLock = v13;
  }
  return v2;
}

- (id)_closuresForPurpose:(int64_t)a3 andMetric:(int64_t)a4
{
  uint64_t v7 = [(APMetricNotificationRegistrar *)self registryLock];
  [v7 lock];
  v8 = [(APMetricNotificationRegistrar *)self registryByPurpose];
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  v10 = [v8 objectForKey:v9];
  id v11 = [v10 objectForKey:@"allMetrics"];
  if (a4 >= 1)
  {
    v12 = [NSNumber numberWithInteger:a4];
    v13 = [v10 objectForKey:v12];
    v14 = v13;
    if (v11)
    {
      v15 = (void *)[v11 copy];

      [v15 unionHashTable:v14];
      id v11 = v15;
    }
    else
    {
      id v11 = v13;
    }
  }
  objc_super v16 = [v11 setRepresentation];
  [v7 unlock];

  return v16;
}

- (id)_closuresForRegisteredForNonSpecificPurposeInternal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(APMetricNotificationRegistrar *)self registryLock];
  [v5 lock];
  v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v7 = [(APMetricNotificationRegistrar *)self registryToAllPurpose];
  v8 = [v7 allValues];
  uint64_t v9 = [v6 arrayWithArray:v8];

  if (v3) {
    [(APMetricNotificationRegistrar *)self registryToInternalPurpose];
  }
  else {
  v10 = [(APMetricNotificationRegistrar *)self registryToExternalPurpose];
  }
  id v11 = [v10 allValues];
  [v9 addObjectsFromArray:v11];

  [v5 unlock];
  v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];

  return v12;
}

- (int64_t)registerHandlerForPurpose:(int64_t)a3 closure:(id)a4
{
  return MEMORY[0x1F4181798](self, sel_registerHandlerForPurpose_andMetric_closure_);
}

- (id)_metricRegistryForPurpose:(int64_t)a3 andMetric:(int64_t)a4
{
  v6 = [(APMetricNotificationRegistrar *)self registryByPurpose];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  v8 = [v6 objectForKey:v7];
  if (!v8)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    [v6 setObject:v8 forKey:v7];
  }
  if (a4 < 1)
  {
    v10 = [v8 objectForKey:@"allMetrics"];
    if (!v10)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:4];
      [v8 setObject:v10 forKey:@"allMetrics"];
    }
  }
  else
  {
    uint64_t v9 = [NSNumber numberWithInteger:a4];
    v10 = [v8 objectForKey:v9];
    if (!v10)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:2];
      [v8 setObject:v10 forKey:v9];
    }
  }
  return v10;
}

- (int64_t)registerHandlerForPurpose:(int64_t)a3 andMetric:(int64_t)a4 closure:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(APMetricNotificationRegistrar *)self registryLock];
  [v9 lock];
  int64_t registrationCounter = self->_registrationCounter;
  self->_int64_t registrationCounter = registrationCounter + 1;
  id v11 = [(APMetricNotificationRegistrar *)self _metricRegistryForPurpose:a3 andMetric:a4];
  v12 = (void *)[v8 copy];

  v13 = [(APMetricNotificationRegistrar *)self registryByClosure];
  v14 = [NSNumber numberWithInteger:registrationCounter];
  v15 = _Block_copy(v12);
  [v11 addObject:v15];

  objc_super v16 = _Block_copy(v12);
  [v13 setObject:v16 forKey:v14];

  [v9 unlock];
  return registrationCounter;
}

- (int64_t)registerHandlerForAllPurposesAndAllMetricsWithClosure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APMetricNotificationRegistrar *)self registryToAllPurpose];
  int64_t v6 = [(APMetricNotificationRegistrar *)self _registerHandlerInRegistry:v5 closure:v4];

  return v6;
}

- (int64_t)registerHandlerForInternalPurposesAndAllMetricsWithClosure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APMetricNotificationRegistrar *)self registryToInternalPurpose];
  int64_t v6 = [(APMetricNotificationRegistrar *)self _registerHandlerInRegistry:v5 closure:v4];

  return v6;
}

- (int64_t)registerHandlerForExternalPurposesAndAllMetricsWithClosure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APMetricNotificationRegistrar *)self registryToExternalPurpose];
  int64_t v6 = [(APMetricNotificationRegistrar *)self _registerHandlerInRegistry:v5 closure:v4];

  return v6;
}

- (int64_t)_registerHandlerInRegistry:(id)a3 closure:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APMetricNotificationRegistrar *)self registryLock];
  [v8 lock];
  int64_t registrationCounter = self->_registrationCounter;
  self->_int64_t registrationCounter = registrationCounter + 1;
  v10 = (void *)[v6 copy];

  id v11 = [NSNumber numberWithInteger:registrationCounter];
  v12 = _Block_copy(v10);
  [v7 setObject:v12 forKey:v11];

  [v8 unlock];
  return registrationCounter;
}

- (void)removeHandlerWithIdentifier:(int64_t)a3
{
  id v10 = [(APMetricNotificationRegistrar *)self registryLock];
  [v10 lock];
  uint64_t v5 = [(APMetricNotificationRegistrar *)self registryByClosure];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 removeObjectForKey:v6];
  id v7 = [(APMetricNotificationRegistrar *)self registryToAllPurpose];
  [v7 removeObjectForKey:v6];

  id v8 = [(APMetricNotificationRegistrar *)self registryToInternalPurpose];
  [v8 removeObjectForKey:v6];

  uint64_t v9 = [(APMetricNotificationRegistrar *)self registryToExternalPurpose];
  [v9 removeObjectForKey:v6];

  [v10 unlock];
}

- (void)receivedMetric:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 purpose];
  uint64_t v6 = [v4 metric];
  id v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = [(APMetricNotificationRegistrar *)self _closuresForRegisteredForNonSpecificPurposeInternal:v5 >> 63];
  uint64_t v9 = [v7 setWithArray:v8];

  id v10 = [(APMetricNotificationRegistrar *)self _closuresForPurpose:v5 andMetric:v6];
  [v9 unionSet:v10];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v15));
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (NSMutableDictionary)registryByPurpose
{
  return self->_registryByPurpose;
}

- (NSMutableDictionary)registryByClosure
{
  return self->_registryByClosure;
}

- (NSLock)registryLock
{
  return self->_registryLock;
}

- (int64_t)registrationCounter
{
  return self->_registrationCounter;
}

- (NSMutableDictionary)registryToAllPurpose
{
  return self->_registryToAllPurpose;
}

- (NSMutableDictionary)registryToInternalPurpose
{
  return self->_registryToInternalPurpose;
}

- (NSMutableDictionary)registryToExternalPurpose
{
  return self->_registryToExternalPurpose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryToExternalPurpose, 0);
  objc_storeStrong((id *)&self->_registryToInternalPurpose, 0);
  objc_storeStrong((id *)&self->_registryToAllPurpose, 0);
  objc_storeStrong((id *)&self->_registryLock, 0);
  objc_storeStrong((id *)&self->_registryByClosure, 0);
  objc_storeStrong((id *)&self->_registryByPurpose, 0);
}

@end