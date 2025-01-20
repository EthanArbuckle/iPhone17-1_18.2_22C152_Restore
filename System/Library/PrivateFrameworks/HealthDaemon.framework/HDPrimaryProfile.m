@interface HDPrimaryProfile
- (HDPrimaryProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5;
- (id)_initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6;
- (id)_newAWDSubmissionManager;
- (id)_newNanoSyncManager;
- (id)_newPeriodicCountryMonitorWithNanoSyncManager:(id)a3;
- (id)_newRapportMessenger;
- (id)_newWorkoutManager;
- (id)activityCacheInterface;
- (id)ageGatingManager;
- (id)alarmScheduler;
- (id)appSubscriptionManager;
- (id)associationManager;
- (id)attachmentManager;
- (id)awdSubmissionManager;
- (id)currentActivitySummaryHelper;
- (id)dataCollectionManager;
- (id)fitnessMachineManager;
- (id)nanoSyncManager;
- (id)notificationManager;
- (id)notificationSyncManager;
- (id)periodicCountryMonitor;
- (id)protectedDataOperationScheduler;
- (id)rapportMessenger;
- (id)serviceConnectionManager;
- (id)serviceManager;
- (id)sessionAssertionManager;
- (id)sharingEntryManager;
- (id)summarySharingEntryIDSManager;
- (id)tinkerPrivacyAlertCoordinator;
- (id)workoutCondenser;
- (id)workoutManager;
- (void)terminationCleanup;
- (void)unitTest_setNanoSyncManager:(id)a3;
@end

@implementation HDPrimaryProfile

- (id)currentActivitySummaryHelper
{
  return self->_currentActivitySummaryHelper;
}

- (id)dataCollectionManager
{
  return self->_dataCollectionManager;
}

- (id)workoutManager
{
  return self->_workoutManager;
}

- (id)appSubscriptionManager
{
  return self->_appSubscriptionManager;
}

- (id)nanoSyncManager
{
  return self->_nanoSyncManager;
}

- (id)fitnessMachineManager
{
  v2 = [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F18A85E8];
  v3 = [v2 firstObject];

  v4 = [v3 fitnessManager];

  return v4;
}

- (HDPrimaryProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F2B358];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 primaryProfile];
  v13 = [(HDPrimaryProfile *)self _initWithDirectoryPath:v11 medicalIDDirectoryPath:v10 daemon:v9 profileIdentifier:v12];

  return v13;
}

- (id)_initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  id v10 = a5;
  v75.receiver = self;
  v75.super_class = (Class)HDPrimaryProfile;
  id v11 = [(HDProfile *)&v75 initWithDirectoryPath:a3 medicalIDDirectoryPath:a4 daemon:v10 profileIdentifier:a6];
  if (v11)
  {
    v12 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    sessionAssertionManager = v11->_sessionAssertionManager;
    v11->_sessionAssertionManager = v12;

    v14 = [[HDAgeGatingManager alloc] initWithProfile:v11];
    ageGatingManager = v11->_ageGatingManager;
    v11->_ageGatingManager = v14;

    v16 = [[HDRestorableAlarmScheduler alloc] initWithProfile:v11];
    alarmScheduler = v11->_alarmScheduler;
    v11->_alarmScheduler = v16;

    v18 = [(HDProfile *)v11 daemon];
    v19 = [v18 behavior];
    int v20 = [v19 supportsAppSubscriptions];

    if (v20) {
      v21 = [[HDAppSubscriptionManager alloc] initWithProfile:v11];
    }
    else {
      v21 = 0;
    }
    appSubscriptionManager = v11->_appSubscriptionManager;
    v11->_appSubscriptionManager = v21;

    v23 = [[HDAssociationManager alloc] initWithProfile:v11];
    associationManager = v11->_associationManager;
    v11->_associationManager = v23;

    v25 = [[HDAttachmentManager alloc] initWithProfile:v11];
    attachmentManager = v11->_attachmentManager;
    v11->_attachmentManager = v25;

    uint64_t v27 = [(HDPrimaryProfile *)v11 _newAWDSubmissionManager];
    awdSubmissionManager = v11->_awdSubmissionManager;
    v11->_awdSubmissionManager = (HDAWDSubmissionManager *)v27;

    v29 = [[HDCurrentActivitySummaryHelper alloc] initWithProfile:v11];
    currentActivitySummaryHelper = v11->_currentActivitySummaryHelper;
    v11->_currentActivitySummaryHelper = v29;

    v31 = [[HDProtectedDataOperationScheduler alloc] initWithProfile:v11];
    protectedDataOperationScheduler = v11->_protectedDataOperationScheduler;
    v11->_protectedDataOperationScheduler = v31;

    v33 = [[HDDataCollectionManager alloc] initWithProfile:v11];
    dataCollectionManager = v11->_dataCollectionManager;
    v11->_dataCollectionManager = v33;

    uint64_t v35 = [(HDPrimaryProfile *)v11 _newNanoSyncManager];
    nanoSyncManager = v11->_nanoSyncManager;
    v11->_nanoSyncManager = (HDNanoSyncManager *)v35;

    v37 = [[HDNotificationManager alloc] initWithProfile:v11 bundle:0];
    notificationManager = v11->_notificationManager;
    v11->_notificationManager = v37;

    v39 = [[HDNotificationSyncManager alloc] initWithProfile:v11];
    notificationSyncManager = v11->_notificationSyncManager;
    v11->_notificationSyncManager = v39;

    v41 = [v10 behavior];
    int v42 = [v41 supportsPeriodicCountryMonitoring];

    if (v42)
    {
      uint64_t v43 = [(HDPrimaryProfile *)v11 _newPeriodicCountryMonitorWithNanoSyncManager:v11->_nanoSyncManager];
      periodicCountryMonitor = v11->_periodicCountryMonitor;
      v11->_periodicCountryMonitor = (HDPeriodicCountryMonitor *)v43;
    }
    uint64_t v45 = [(HDPrimaryProfile *)v11 _newRapportMessenger];
    rapportMessenger = v11->_rapportMessenger;
    v11->_rapportMessenger = (HDRapportMessenger *)v45;

    v47 = [[HDTinkerPrivacyAlertCoordinator alloc] initWithProfile:v11];
    tinkerPrivacyAlertCoordinator = v11->_tinkerPrivacyAlertCoordinator;
    v11->_tinkerPrivacyAlertCoordinator = v47;

    v49 = [v10 behavior];
    int v50 = [v49 healthAppSupportedOnDevice];

    if (v50)
    {
      v51 = [[HDSummarySharingEntryManager alloc] initWithProfile:v11];
      summarySharingEntryManager = v11->_summarySharingEntryManager;
      v11->_summarySharingEntryManager = v51;

      v53 = [[HDSummarySharingEntryIDSManager alloc] initWithProfile:v11];
      summarySharingEntryIDSManager = v11->_summarySharingEntryIDSManager;
      v11->_summarySharingEntryIDSManager = v53;
    }
    v55 = [[HDDemoDataManager alloc] initWithProfile:v11];
    demoDataManager = v11->_demoDataManager;
    v11->_demoDataManager = v55;

    uint64_t v57 = [(HDPrimaryProfile *)v11 _newWorkoutManager];
    workoutManager = v11->_workoutManager;
    v11->_workoutManager = (HDWorkoutManager *)v57;

    v59 = [(HDProfile *)v11 daemon];
    v60 = [v59 behavior];
    if (([v60 performsWorkoutCondensation] & 1) != 0 || _HDIsUnitTesting) {
      v61 = [[HDWorkoutCondenser alloc] initWithProfile:v11];
    }
    else {
      v61 = 0;
    }

    workoutCondenser = v11->_workoutCondenser;
    v11->_workoutCondenser = v61;

    v63 = [(HDProfile *)v11 daemon];
    v64 = [v63 behavior];
    int v65 = [v64 isAppleInternalInstall];

    if (v65)
    {
      v66 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v67 = [v66 BOOLForKey:@"HDPPTTestRunning"];
      char v68 = [v66 BOOLForKey:@"HDPPTTestDataUpdateApplied"];
      if (v67 && (v68 & 1) == 0)
      {
        v69 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:410255999.0];
        v70 = [MEMORY[0x1E4F1C9C8] date];
        [v70 timeIntervalSinceDate:v69];
        double v72 = v71;
        v73 = [(HDProfile *)v11 database];
        [v73 setOffsetTimeInterval:v72];

        [v66 setBool:1 forKey:@"HDPPTTestDataUpdateApplied"];
      }
    }
  }

  return v11;
}

- (void)terminationCleanup
{
  v2 = [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F18A85E8];
  id v3 = [v2 firstObject];

  [v3 terminationCleanup];
}

- (id)activityCacheInterface
{
  v2 = [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F18A8648];
  id v3 = [v2 firstObject];

  v4 = [v3 activityCacheInterface];

  return v4;
}

- (id)ageGatingManager
{
  return self->_ageGatingManager;
}

- (id)alarmScheduler
{
  return self->_alarmScheduler;
}

- (id)associationManager
{
  return self->_associationManager;
}

- (id)attachmentManager
{
  return self->_attachmentManager;
}

- (id)awdSubmissionManager
{
  return self->_awdSubmissionManager;
}

- (id)workoutCondenser
{
  return self->_workoutCondenser;
}

- (id)notificationManager
{
  return self->_notificationManager;
}

- (id)notificationSyncManager
{
  return self->_notificationSyncManager;
}

- (id)periodicCountryMonitor
{
  return self->_periodicCountryMonitor;
}

- (id)protectedDataOperationScheduler
{
  return self->_protectedDataOperationScheduler;
}

- (id)rapportMessenger
{
  return self->_rapportMessenger;
}

- (id)serviceConnectionManager
{
  v2 = [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F18A85E8];
  id v3 = [v2 firstObject];

  v4 = [v3 serviceConnectionManager];

  return v4;
}

- (id)serviceManager
{
  v2 = [(HDProfile *)self profileExtensionsConformingToProtocol:&unk_1F18A85E8];
  id v3 = [v2 firstObject];

  v4 = [v3 serviceManager];

  return v4;
}

- (id)sessionAssertionManager
{
  return self->_sessionAssertionManager;
}

- (id)tinkerPrivacyAlertCoordinator
{
  return self->_tinkerPrivacyAlertCoordinator;
}

- (id)sharingEntryManager
{
  return self->_summarySharingEntryManager;
}

- (id)summarySharingEntryIDSManager
{
  return self->_summarySharingEntryIDSManager;
}

- (id)_newAWDSubmissionManager
{
  id v3 = [HDAWDSubmissionManager alloc];

  return [(HDAWDSubmissionManager *)v3 initWithProfile:self];
}

- (id)_newNanoSyncManager
{
  id v3 = [(HDProfile *)self daemon];
  v4 = [v3 behavior];

  if ([v4 supportsNanoSync]) {
    v5 = -[HDNanoSyncManager initWithProfile:isMaster:]([HDNanoSyncManager alloc], "initWithProfile:isMaster:", self, [v4 isAppleWatch] ^ 1);
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)_newPeriodicCountryMonitorWithNanoSyncManager:(id)a3
{
  id v4 = a3;
  v5 = [[HDPeriodicCountryMonitor alloc] initWithProfile:self nanoSyncManager:v4];

  return v5;
}

- (id)_newWorkoutManager
{
  id v3 = [HDWorkoutManager alloc];

  return [(HDWorkoutManager *)v3 initWithProfile:self];
}

- (id)_newRapportMessenger
{
  v2 = [HDRapportMessenger alloc];

  return [(HDRapportMessenger *)v2 initForCompanionDevice];
}

- (void)unitTest_setNanoSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationManager, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_summarySharingEntryIDSManager, 0);
  objc_storeStrong((id *)&self->_summarySharingEntryManager, 0);
  objc_storeStrong((id *)&self->_tinkerPrivacyAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_demoDataManager, 0);
  objc_storeStrong((id *)&self->_workoutCondenser, 0);
  objc_storeStrong((id *)&self->_workoutManager, 0);
  objc_storeStrong((id *)&self->_sessionAssertionManager, 0);
  objc_storeStrong((id *)&self->_serviceConnectionManager, 0);
  objc_storeStrong((id *)&self->_alarmScheduler, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_rapportMessenger, 0);
  objc_storeStrong((id *)&self->_protectedDataOperationScheduler, 0);
  objc_storeStrong((id *)&self->_periodicCountryMonitor, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_nanoSyncManager, 0);
  objc_storeStrong((id *)&self->_fitnessMachineManager, 0);
  objc_storeStrong((id *)&self->_dataCollectionManager, 0);
  objc_storeStrong((id *)&self->_currentActivitySummaryHelper, 0);
  objc_storeStrong((id *)&self->_awdSubmissionManager, 0);
  objc_storeStrong((id *)&self->_appSubscriptionManager, 0);

  objc_storeStrong((id *)&self->_ageGatingManager, 0);
}

@end