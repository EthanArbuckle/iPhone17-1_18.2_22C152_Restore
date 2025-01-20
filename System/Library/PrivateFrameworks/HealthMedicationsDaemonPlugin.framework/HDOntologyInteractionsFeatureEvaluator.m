@interface HDOntologyInteractionsFeatureEvaluator
- (HDOntologyInteractionsFeatureEvaluator)init;
- (HDOntologyInteractionsFeatureEvaluator)initWithDaemon:(id)a3;
- (HDOntologyInteractionsFeatureEvaluator)initWithDaemon:(id)a3 medicationCountProvider:(id)a4 interactionFactorStateProvider:(id)a5;
- (NSString)featureIdentifier;
- (int64_t)requiresFeatureShardForProfile:(id)a3;
- (void)drugInteractionFactorStateProvider:(id)a3 didObserveChangeForProfile:(id)a4 hasDrugInteractionFactor:(int64_t)a5;
- (void)medicationCountProvider:(id)a3 didObserveChangeForProfile:(id)a4 ontologyBackedMedicationCount:(int64_t)a5;
- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4;
@end

@implementation HDOntologyInteractionsFeatureEvaluator

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F2A2A8];
}

- (HDOntologyInteractionsFeatureEvaluator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyInteractionsFeatureEvaluator)initWithDaemon:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HDOntologyInteractionsFeatureEvaluator)initWithDaemon:(id)a3 medicationCountProvider:(id)a4 interactionFactorStateProvider:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDOntologyInteractionsFeatureEvaluator;
  v11 = [(HDOntologyMedicationFeatureEvaluator *)&v14 initWithDaemon:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_medicationCountProvider, a4);
    objc_storeStrong((id *)&v12->_interactionFactorStateProvider, a5);
  }

  return v12;
}

- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4
{
  medicationCountProvider = self->_medicationCountProvider;
  id v8 = a4;
  id v7 = a3;
  [(HDMedicationCountProvider *)medicationCountProvider monitorMedicationCountsInProfile:v7];
  [(HDMedicationCountProvider *)self->_medicationCountProvider addMedicationCountObserver:self queue:v8];
  [(HDDrugInteractionFactorStateProvider *)self->_interactionFactorStateProvider monitorDrugInteractionFactorsInProfile:v7];

  [(HDDrugInteractionFactorStateProvider *)self->_interactionFactorStateProvider addDrugInteractionFactorStateObserver:self queue:v8];
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0;
  if ([(HDOntologyMedicationFeatureEvaluator *)self canRequireShardWithError:0])
  {
    int64_t v6 = [(HDMedicationCountProvider *)self->_medicationCountProvider ontologyBackedMedicationCountInProfile:v4];
    if (v6 == 2)
    {
      int64_t v5 = 1;
    }
    else if (v6 == 1)
    {
      int64_t v5 = [(HDDrugInteractionFactorStateProvider *)self->_interactionFactorStateProvider hasDrugInteractionFactorInProfile:v4];
    }
    else if (v6)
    {
      int64_t v5 = 2;
    }
    else
    {
      int64_t v5 = 0;
    }
  }

  return v5;
}

- (void)drugInteractionFactorStateProvider:(id)a3 didObserveChangeForProfile:(id)a4 hasDrugInteractionFactor:(int64_t)a5
{
  if (a5 != 2)
  {
    id v7 = [NSString alloc];
    id v8 = HKStringFromOptionalBooleanResult();
    id v9 = (id)[v7 initWithFormat:@"hasDrugInteractionFactor changed to %@", v8];

    [(HDOntologyMedicationFeatureEvaluator *)self triggerShardEvaluatorWithReason:v9];
  }
}

- (void)medicationCountProvider:(id)a3 didObserveChangeForProfile:(id)a4 ontologyBackedMedicationCount:(int64_t)a5
{
  if (a5 != -1)
  {
    id v7 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"didObserve medications count change to %ld", a5);
    [(HDOntologyMedicationFeatureEvaluator *)self triggerShardEvaluatorWithReason:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionFactorStateProvider, 0);
  objc_storeStrong((id *)&self->_medicationCountProvider, 0);
}

@end