@interface DTOService
- (DTOService)initWithWorkQueue:(id)a3 notificationCenter:(id)a4 ui:(id)a5;
- (LACDTOEnvironmentProviding)environmentProvider;
- (LACDTOFeatureControlling)featureController;
- (LACDTOPendingPolicyEvaluationController)pendingPolicyEvaluationController;
- (LACDTORatchetStateProvider)ratchetStateProvider;
- (LACDTOServiceXPC)xpcController;
- (id)processor;
- (void)startServices;
@end

@implementation DTOService

- (id)processor
{
  id v3 = objc_alloc((Class)LACDTOServiceProcessor);
  id v4 = objc_alloc((Class)LACDTOFailureProcessor);
  workQueue = self->_workQueue;
  id v6 = [objc_alloc((Class)LACUserInterfacePresenter) initWithReplyQueue:workQueue uiController:self->_uiController];
  id v7 = [v4 initWithReplyQueue:workQueue ui:v6];
  v14[0] = v7;
  v8 = [(LACDTOSensorTrustService *)self->_sensorTrust evaluationProcessor];
  policyController = self->_policyController;
  emptyPasscodeProcessor = self->_emptyPasscodeProcessor;
  v14[1] = v8;
  v14[2] = emptyPasscodeProcessor;
  v14[3] = policyController;
  v11 = +[NSArray arrayWithObjects:v14 count:4];
  id v12 = [v3 initWithSubprocessors:v11];

  return v12;
}

- (DTOService)initWithWorkQueue:(id)a3 notificationCenter:(id)a4 ui:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_opt_class())
  {
    v108.receiver = self;
    v108.super_class = (Class)DTOService;
    id v12 = [(DTOService *)&v108 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_workQueue, a3);
      objc_storeStrong((id *)&v13->_uiController, a5);
      id v83 = v11;
      v14 = objc_alloc_init(DTOPolicyEvaluationIdentifierFactory);
      v15 = [[DTOKVStore alloc] initWithWorkQueue:v9];
      kvStore = v13->_kvStore;
      v13->_kvStore = (LACDTOKVStore *)v15;

      v17 = [DTORatchetHandler alloc];
      v18 = +[Daemon sharedInstance];
      v19 = [(DTORatchetHandler *)v17 initWithContextProvider:v18 kvstore:v13->_kvStore];

      id v20 = objc_alloc((Class)LACDTOKVStoreMigrationController);
      v21 = v13->_kvStore;
      v22 = +[LACGlobalDomain sharedInstance];
      v23 = (LACDTOKVStoreMigrationController *)[v20 initWithKVStore:v21 defaults:v22 workQueue:v13->_workQueue];
      kvsMigrationController = v13->_kvsMigrationController;
      v13->_kvsMigrationController = v23;

      uint64_t v25 = +[LACPersistentStoreFactory makePersistentStoreWithSuiteName:0];
      persistentStore = v13->_persistentStore;
      v13->_persistentStore = (LACPersistentStore *)v25;

      v27 = objc_alloc_init(DTODeviceInfoProvider);
      deviceInfo = v13->_deviceInfo;
      v13->_deviceInfo = (LACDTODeviceInfoProvider *)v27;

      v29 = (LACDTOEventBus *)objc_alloc_init((Class)LACDTOEventBus);
      eventBus = v13->_eventBus;
      v13->_eventBus = v29;

      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      id v85 = v10;
      v105[2] = sub_10000AB2C;
      v105[3] = &unk_1000389E8;
      v31 = v13;
      v106 = v31;
      id v32 = v9;
      id v107 = v32;
      uint64_t v33 = sub_10000AB2C((uint64_t)v105);
      featureController = v31->_featureController;
      v31->_featureController = (LACDTOFeatureController *)v33;

      uint64_t v35 = +[LACDTOLocationControllerFactory controllerWithStore:v13->_kvStore featureController:v31->_featureController eventBus:v13->_eventBus workQueue:v32];
      locationProvider = v31->_locationProvider;
      v31->_locationProvider = (LACDTOLocationController *)v35;

      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_10000ABEC;
      v102[3] = &unk_100038A38;
      id v37 = v32;
      id v103 = v37;
      v38 = v31;
      v104 = v38;
      uint64_t v39 = sub_10000ABEC((uint64_t)v102);
      lostMode = v38->_lostMode;
      v38->_lostMode = (LACDTOLostModeController *)v39;

      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_10000AD48;
      v98[3] = &unk_100038A60;
      v41 = v19;
      v99 = v41;
      id v42 = v37;
      id v100 = v42;
      v43 = v38;
      v101 = v43;
      uint64_t v44 = sub_10000AD48(v98);
      ratchetStateProvider = v43->_ratchetStateProvider;
      v43->_ratchetStateProvider = (LACDTORatchetStateMonitor *)v44;

      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_10000ADB0;
      v93[3] = &unk_100038A88;
      v46 = v43;
      v94 = v46;
      v95 = v41;
      v96 = v14;
      id v47 = v42;
      id v97 = v47;
      id v84 = v9;
      v81 = v14;
      v82 = v41;
      uint64_t v48 = sub_10000ADB0(v93);
      pendingEvaluationsController = v46->_pendingEvaluationsController;
      v46->_pendingEvaluationsController = (LACDTOPendingPolicyEvaluationController *)v48;

      uint64_t v50 = +[LACDTOEnvironmentProviderFactory environmentProviderWithLocationProvider:v31->_locationProvider featureController:v31->_featureController ratchetStateProvider:v43->_ratchetStateProvider lostModeController:v38->_lostMode];
      environmentProvider = v46->_environmentProvider;
      v46->_environmentProvider = (LACDTOEnvironmentProviding *)v50;

      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10000AE1C;
      v90[3] = &unk_100038AB0;
      id v52 = v10;
      id v91 = v52;
      v53 = v46;
      v92 = v53;
      uint64_t v54 = sub_10000AE1C((uint64_t)v90);
      id v55 = v53[17];
      v53[17] = (id)v54;

      id v56 = [objc_alloc((Class)LACDTOPolicyEvaluationController) initWithEnvironment:v46->_environmentProvider evaluationIdentifierFactory:v81 device:v13->_deviceInfo];
      id v57 = v53[1];
      v53[1] = v56;

      [v53[1] addObserver:v46->_pendingEvaluationsController];
      [v53[1] addObserver:v43->_ratchetStateProvider];
      [(LACDTOPendingPolicyEvaluationController *)v46->_pendingEvaluationsController addObserver:v31->_locationProvider];
      id v58 = [objc_alloc((Class)LAAnalyticsDTO) initForStatusMonitoringWithEnvironment:v46->_environmentProvider workQueue:v47];
      id v59 = v53[20];
      v53[20] = v58;

      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_10000AE78;
      v88[3] = &unk_100038AD8;
      v60 = v53;
      v89 = v60;
      uint64_t v61 = sub_10000AE78((uint64_t)v88);
      id v62 = v60[2];
      v60[2] = (id)v61;

      id v63 = [objc_alloc((Class)LACDTOSensorTrustService) initWithReplyQueue:v47 uiController:v13->_uiController store:v13->_kvStore featureStateProvider:v31->_featureController];
      id v64 = v60[3];
      v60[3] = v63;

      id v65 = objc_alloc((Class)LACDTOLocationPrewarmController);
      v66 = v31->_locationProvider;
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_10000AEE0;
      v86[3] = &unk_100038B00;
      v67 = v60;
      v87 = v67;
      v68 = sub_10000AEE0((uint64_t)v86);
      id v69 = [v65 initWithLocationProvider:v66 strategy:v68 workQueue:v13->_workQueue];
      id v70 = v67[9];
      v67[9] = v69;

      [v52 addObserver:v67[9]];
      id v71 = objc_alloc((Class)LACDTOServiceXPCHost);
      v72 = v31->_featureController;
      v73 = v43->_ratchetStateProvider;
      v74 = [v60[3] trustStateProvider];
      v75 = v71;
      uint64_t v76 = (uint64_t)v73;
      id v11 = v83;
      id v9 = v84;
      id v77 = [v75 initWithFeatureController:v72 ratchetStateProvider:v76 trustStateProvider:v74 pendingEvaluationController:v46->_pendingEvaluationsController];
      id v78 = v67[14];
      v67[14] = v77;
      id v10 = v85;
    }
    self = v13;
    v79 = self;
  }
  else
  {
    v79 = 0;
  }

  return v79;
}

- (void)startServices
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B048;
  v4[3] = &unk_100038B28;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (LACDTOEnvironmentProviding)environmentProvider
{
  return self->_environmentProvider;
}

- (LACDTOServiceXPC)xpcController
{
  return self->_xpcController;
}

- (LACDTORatchetStateProvider)ratchetStateProvider
{
  return self->_ratchetStateProvider;
}

- (LACDTOPendingPolicyEvaluationController)pendingPolicyEvaluationController
{
  return self->_pendingEvaluationsController;
}

- (LACDTOFeatureControlling)featureController
{
  return self->_featureController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lostMode, 0);
  objc_storeStrong((id *)&self->_darwinNotificationsController, 0);
  objc_storeStrong((id *)&self->_eventBus, 0);
  objc_storeStrong((id *)&self->_pendingEvaluationsController, 0);
  objc_storeStrong((id *)&self->_xpcController, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_secureStorage, 0);
  objc_storeStrong((id *)&self->_environmentProvider, 0);
  objc_storeStrong((id *)&self->_ratchetStateProvider, 0);
  objc_storeStrong((id *)&self->_locationPrewarmController, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_kvsMigrationController, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_featureController, 0);
  objc_storeStrong((id *)&self->_sensorTrust, 0);
  objc_storeStrong((id *)&self->_emptyPasscodeProcessor, 0);

  objc_storeStrong((id *)&self->_policyController, 0);
}

@end