@interface HKFeatureAvailabilityHealthDataRequirementDataSource
- (HKFeatureAvailabilityHealthDataRequirementDataSource)initWithEvaluationProvider:(id)a3;
- (id)isRequirementSatisfied:(id)a3 error:(id *)a4;
- (id)withPrewarmedEvaluationOfRequirementSet:(id)a3 error:(id *)a4 handler:(id)a5;
- (void)registerObserver:(id)a3 forRequirementSet:(id)a4 queue:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKFeatureAvailabilityHealthDataRequirementDataSource

- (HKFeatureAvailabilityHealthDataRequirementDataSource)initWithEvaluationProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKFeatureAvailabilityHealthDataRequirementDataSource;
  v6 = [(HKFeatureAvailabilityHealthDataRequirementDataSource *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_evaluationProvider, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_prewarmedSatisfactionByRequirementStack = v7->_lock_prewarmedSatisfactionByRequirementStack;
    v7->_lock_prewarmedSatisfactionByRequirementStack = v8;
  }
  return v7;
}

- (id)withPrewarmedEvaluationOfRequirementSet:(id)a3 error:(id *)a4 handler:(id)a5
{
  v8 = (void (**)(id, id *))a5;
  v9 = -[HKFeatureAvailabilityRequirementSet allHealthDataRequirements](a3);
  v10 = [(HKFeatureAvailabilityHealthDataRequirementEvaluationProviding *)self->_evaluationProvider evaluationOfRequirements:v9 error:a4];
  objc_super v11 = v10;
  if (v10)
  {
    if ([v10 count])
    {
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableArray *)self->_lock_prewarmedSatisfactionByRequirementStack addObject:v11];
      os_unfair_lock_unlock(&self->_lock);
      v12 = v8[2](v8, a4);
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableArray *)self->_lock_prewarmedSatisfactionByRequirementStack removeLastObject];
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v12 = v8[2](v8, a4);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)isRequirementSatisfied:(id)a3 error:(id *)a4
{
  lock_prewarmedSatisfactionByRequirementStack = self->_lock_prewarmedSatisfactionByRequirementStack;
  id v5 = a3;
  v6 = [(NSMutableArray *)lock_prewarmedSatisfactionByRequirementStack lastObject];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (void)registerObserver:(id)a3 forRequirementSet:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[HKFeatureAvailabilityRequirementSet allHealthDataRequirements](a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(HKFeatureAvailabilityHealthDataRequirementEvaluationProviding *)self->_evaluationProvider registerObserver:v9 forRequirements:v10 queue:v8];
}

- (void)unregisterObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_prewarmedSatisfactionByRequirementStack, 0);

  objc_storeStrong((id *)&self->_evaluationProvider, 0);
}

@end