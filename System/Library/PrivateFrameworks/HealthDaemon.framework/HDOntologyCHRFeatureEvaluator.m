@interface HDOntologyCHRFeatureEvaluator
- (BOOL)canRequireShardWithError:(id *)a3;
- (HDOntologyCHRFeatureEvaluator)init;
- (HDOntologyCHRFeatureEvaluator)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (NSString)featureIdentifier;
- (int64_t)requiresFeatureShardForProfile:(id)a3;
- (void)accountExistenceNotifier:(id)a3 didChangeHealthRecordAccountExistence:(BOOL)a4;
- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4;
@end

@implementation HDOntologyCHRFeatureEvaluator

- (HDOntologyCHRFeatureEvaluator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyCHRFeatureEvaluator)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyCHRFeatureEvaluator;
  v5 = [(HDOntologyCHRFeatureEvaluator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
  }

  return v6;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F2A298];
}

- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = [a3 healthRecordsAccountExistenceNotifier];
  [v7 addAccountExistenceObserver:self queue:v6];
}

- (BOOL)canRequireShardWithError:(id *)a3
{
  return 1;
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  v5 = [a3 healthRecordsAccountExistenceNotifier];
  unint64_t v6 = [v5 ontologyEnablingHealthRecordsAccountState];

  if (v6 < 3) {
    return qword_1BD340B58[v6];
  }
  objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"HDOntologyCHRFeatureEvaluator.m" lineNumber:65 description:@"Unreachable code has been executed"];

  return 2;
}

- (void)accountExistenceNotifier:(id)a3 didChangeHealthRecordAccountExistence:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  v5 = [WeakRetained featureCoordinator];
  [v5 evaluteRequiredShardsForEvalulator:self reason:@"didChangeHealthRecordAccountExistence"];
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end