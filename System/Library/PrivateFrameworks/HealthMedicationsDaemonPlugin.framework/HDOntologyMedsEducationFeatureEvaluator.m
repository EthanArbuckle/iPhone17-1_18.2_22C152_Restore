@interface HDOntologyMedsEducationFeatureEvaluator
- (HDOntologyMedsEducationFeatureEvaluator)init;
- (HDOntologyMedsEducationFeatureEvaluator)initWithDaemon:(id)a3;
- (HDOntologyMedsEducationFeatureEvaluator)initWithDaemon:(id)a3 medicationCountProvider:(id)a4;
- (NSString)featureIdentifier;
- (int64_t)requiresFeatureShardForProfile:(id)a3;
- (void)medicationCountProvider:(id)a3 didObserveChangeForProfile:(id)a4 ontologyBackedMedicationCount:(int64_t)a5;
- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4;
@end

@implementation HDOntologyMedsEducationFeatureEvaluator

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F2A2C0];
}

- (HDOntologyMedsEducationFeatureEvaluator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyMedsEducationFeatureEvaluator)initWithDaemon:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HDOntologyMedsEducationFeatureEvaluator)initWithDaemon:(id)a3 medicationCountProvider:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDOntologyMedsEducationFeatureEvaluator;
  v8 = [(HDOntologyMedicationFeatureEvaluator *)&v11 initWithDaemon:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_medicationCountProvider, a4);
  }

  return v9;
}

- (void)registerRequiredObserversForProfile:(id)a3 queue:(id)a4
{
  medicationCountProvider = self->_medicationCountProvider;
  id v7 = a4;
  [(HDMedicationCountProvider *)medicationCountProvider monitorMedicationCountsInProfile:a3];
  [(HDMedicationCountProvider *)self->_medicationCountProvider addMedicationCountObserver:self queue:v7];
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0;
  if ([(HDOntologyMedicationFeatureEvaluator *)self canRequireShardWithError:0])
  {
    unint64_t v6 = [(HDMedicationCountProvider *)self->_medicationCountProvider ontologyBackedMedicationCountInProfile:v4];
    if (v6 > 2) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = qword_1BD5A59C8[v6];
    }
  }

  return v5;
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
}

@end