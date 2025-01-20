@interface HDHealthMedicationsDaemonExtension
- (BOOL)daemonDidReceiveNotification:(const char *)a3;
- (HDDaemon)daemon;
- (HDHealthMedicationsDaemonExtension)init;
- (HDHealthMedicationsDaemonExtension)initWithHealthDaemon:(id)a3;
- (HDMedicationPeriodicScheduler)periodicScheduler;
- (HKMedicationsBehavior)medicationsBehavior;
- (NSArray)ontologyFeatureEvaluators;
@end

@implementation HDHealthMedicationsDaemonExtension

- (HDHealthMedicationsDaemonExtension)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthMedicationsDaemonExtension)initWithHealthDaemon:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthMedicationsDaemonExtension;
  v5 = [(HDHealthMedicationsDaemonExtension *)&v24 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    uint64_t v7 = [MEMORY[0x1E4F66B98] sharedBehavior];
    medicationsBehavior = v6->_medicationsBehavior;
    v6->_medicationsBehavior = (HKMedicationsBehavior *)v7;

    v9 = [[HDMedicationPeriodicScheduler alloc] initWithDaemon:v4];
    periodicScheduler = v6->_periodicScheduler;
    v6->_periodicScheduler = v9;

    v11 = [[HDMedicationCountProvider alloc] initWithDaemon:v4];
    medicationCountProvider = v6->_medicationCountProvider;
    v6->_medicationCountProvider = v11;

    v13 = [[HDOntologyMedsEducationFeatureEvaluator alloc] initWithDaemon:v4 medicationCountProvider:v6->_medicationCountProvider];
    medsEducationFeatureEvaluator = v6->_medsEducationFeatureEvaluator;
    v6->_medsEducationFeatureEvaluator = v13;

    v15 = [[HDDrugInteractionFactorStateProvider alloc] initWithDaemon:v4];
    drugInteractionStateProvider = v6->_drugInteractionStateProvider;
    v6->_drugInteractionStateProvider = v15;

    v17 = [[HDOntologyCoreMedsFeatureEvaluator alloc] initWithDaemon:v4 medicationCountProvider:v6->_medicationCountProvider];
    coreMedsFeatureEvaluator = v6->_coreMedsFeatureEvaluator;
    v6->_coreMedsFeatureEvaluator = v17;

    v19 = [[HDOntologyInteractionsFeatureEvaluator alloc] initWithDaemon:v4 medicationCountProvider:v6->_medicationCountProvider interactionFactorStateProvider:v6->_drugInteractionStateProvider];
    interactionsFeatureEvaluator = v6->_interactionsFeatureEvaluator;
    v6->_interactionsFeatureEvaluator = v19;

    v21 = [(HDOntologyMedicationFeatureEvaluator *)[HDOntologyMedsScanningFeatureEvaluator alloc] initWithDaemon:v4];
    medsScanningFeatureEvaluator = v6->_medsScanningFeatureEvaluator;
    v6->_medsScanningFeatureEvaluator = v21;
  }
  return v6;
}

- (NSArray)ontologyFeatureEvaluators
{
  v7[4] = *MEMORY[0x1E4F143B8];
  medsEducationFeatureEvaluator = self->_medsEducationFeatureEvaluator;
  interactionsFeatureEvaluator = self->_interactionsFeatureEvaluator;
  medsScanningFeatureEvaluator = self->_medsScanningFeatureEvaluator;
  v7[0] = self->_coreMedsFeatureEvaluator;
  v7[1] = interactionsFeatureEvaluator;
  v7[2] = medsEducationFeatureEvaluator;
  v7[3] = medsScanningFeatureEvaluator;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  return (NSArray *)v5;
}

- (BOOL)daemonDidReceiveNotification:(const char *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = strcasecmp(a3, (const char *)*MEMORY[0x1E4F669D0]);
  if (v5)
  {
    if (!strcasecmp(a3, "com.apple.system.timezone"))
    {
      _HKInitializeLogging();
      v6 = HKLogMedication();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        v18 = self;
        __int16 v19 = 2082;
        v20 = a3;
      }

      uint64_t v7 = [(HDHealthMedicationsDaemonExtension *)self daemon];
      v8 = [v7 primaryProfile];
      v9 = [v8 healthMedicationsProfileExtension];
      v10 = [v9 medicationScheduleManager];
      v11 = [v10 timeZoneManager];

      [v11 handleTimeZoneChange];
    }
  }
  else
  {
    v12 = [(HDHealthMedicationsDaemonExtension *)self daemon];
    v13 = [v12 primaryProfile];
    v14 = [v13 healthMedicationsProfileExtension];
    v15 = [v14 medicationsDataDonator];
    [v15 didRecieveThirdPartyMigrationNotification];
  }
  return v5 == 0;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (HKMedicationsBehavior)medicationsBehavior
{
  return self->_medicationsBehavior;
}

- (HDMedicationPeriodicScheduler)periodicScheduler
{
  return self->_periodicScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicScheduler, 0);
  objc_storeStrong((id *)&self->_medicationsBehavior, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_medsScanningFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_interactionsFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_medsEducationFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_coreMedsFeatureEvaluator, 0);
  objc_storeStrong((id *)&self->_drugInteractionStateProvider, 0);
  objc_storeStrong((id *)&self->_medicationCountProvider, 0);
}

@end