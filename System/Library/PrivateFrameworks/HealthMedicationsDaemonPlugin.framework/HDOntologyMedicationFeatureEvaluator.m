@interface HDOntologyMedicationFeatureEvaluator
- (BOOL)canRequireShardWithError:(id *)a3;
- (HDDaemon)daemon;
- (HDOntologyMedicationFeatureEvaluator)init;
- (HDOntologyMedicationFeatureEvaluator)initWithDaemon:(id)a3;
- (NSString)featureIdentifier;
- (void)triggerShardEvaluatorWithReason:(id)a3;
@end

@implementation HDOntologyMedicationFeatureEvaluator

- (BOOL)canRequireShardWithError:(id *)a3
{
  char v5 = [MEMORY[0x1E4F66AF0] supportsOntologyBackedMedications];
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = [(HDOntologyMedicationFeatureEvaluator *)self featureIdentifier];
    objc_msgSend(v6, "hk_assignError:code:format:", a3, 111, @"Cannot require %@ shard because device configuration does not support ontology backed medications", v7);
  }
  return v5;
}

- (HDOntologyMedicationFeatureEvaluator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  char v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyMedicationFeatureEvaluator)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyMedicationFeatureEvaluator;
  char v5 = [(HDOntologyMedicationFeatureEvaluator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_daemon, v4);
  }

  return v6;
}

- (void)triggerShardEvaluatorWithReason:(id)a3
{
  p_daemon = &self->_daemon;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_daemon);
  v6 = [WeakRetained ontologyUpdateCoordinator];
  v7 = [v6 featureCoordinator];
  [v7 evaluteRequiredShardsForEvalulator:self reason:v5];
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (NSString)featureIdentifier
{
  return 0;
}

@end