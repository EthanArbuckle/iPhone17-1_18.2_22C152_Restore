@interface HSSetupStateMachineCHIPPartnerConfiguration
+ (BOOL)supportsSetupPayloadRetry;
- (HFDiscoveredAccessory)discoveredAccessoryToPair;
- (HFSetupAccessoryResult)setupResult;
- (HFSetupPairingContext)context;
- (HMAccessorySetupCompletedInfo)completedInfo;
- (HSAccessoryPairingFuture)homekitPairingFuture;
- (HSMatterEcosystem)targetEcosystem;
- (MTSDeviceSetupHome)selectedPartnerHome;
- (MTSDeviceSetupRoom)selectedPartnerRoom;
- (MTSSystemCommissionerPairing)currentPairing;
- (NSDate)phaseStartDate;
- (NSHashTable)pairingObservers;
- (NSString)stagedCHIPPairingIdentifier;
- (NSString)statusDescription;
- (NSString)statusTitle;
- (NSTimer)accessoryNotFoundFatalTimeoutTimer;
- (NSTimer)accessoryNotFoundSoftTimeoutTimer;
- (NSUUID)chipDevicePairingUUID;
- (NSUUID)stagingRequestUUID;
- (id)cancelStagingForCHIPPairing;
- (id)pairStagedCHIPAccessoryToPartnerAppHome;
- (id)pairedAccessories;
- (id)roomName;
- (id)stageCHIPAccessory;
- (id)updateUserGivenAccessoryName:(id)a3;
- (unint64_t)phase;
- (void)_updateAccessoryNameWithCHIPPairingIdentifier:(id)a3;
- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3;
- (void)addPairingObserver:(id)a3;
- (void)didReceiveDeviceCredential:(id)a3 forStagingRequestUUID:(id)a4;
- (void)didReceiveThreadScanResults:(id)a3 forStagingRequestUUID:(id)a4;
- (void)didReceiveWiFiScanResults:(id)a3 forStagingRequestUUID:(id)a4;
- (void)didUpdateProgress:(int64_t)a3 forStagingRequestUUID:(id)a4;
- (void)removePairingObserver:(id)a3;
- (void)setAccessoryNotFoundFatalTimeoutTimer:(id)a3;
- (void)setAccessoryNotFoundSoftTimeoutTimer:(id)a3;
- (void)setChipDevicePairingUUID:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentPairing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveredAccessoryToPair:(id)a3;
- (void)setHomekitPairingFuture:(id)a3;
- (void)setPairingObservers:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setPhaseStartDate:(id)a3;
- (void)setSelectedPartnerHome:(id)a3;
- (void)setSelectedPartnerRoom:(id)a3;
- (void)setSetupResult:(id)a3;
- (void)setStagedCHIPPairingIdentifier:(id)a3;
- (void)setStagingRequestUUID:(id)a3;
- (void)setStatusDescription:(id)a3;
- (void)setStatusTitle:(id)a3;
@end

@implementation HSSetupStateMachineCHIPPartnerConfiguration

- (HFSetupAccessoryResult)setupResult
{
  id v3 = objc_alloc((Class)HFSetupAccessoryResult);
  v4 = [(HSSetupStateMachineConfiguration *)self setupDescription];
  v5 = [v4 setupAccessoryPayload];
  id v6 = [v3 initWithPayload:v5];

  return (HFSetupAccessoryResult *)v6;
}

- (void)setSetupResult:(id)a3
{
  v5 = (HFSetupAccessoryResult *)a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup result: %@", buf, 0xCu);
  }

  if ([(HSSetupStateMachineCHIPPartnerConfiguration *)self phase])
  {
    v16 = +[NSAssertionHandler currentHandler];
    v17 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:[(HSSetupStateMachineCHIPPartnerConfiguration *)self phase]];
    [v16 handleFailureInMethod:a2, self, @"HSSetupStateMachineConfiguration.m", 207, @"HFSetupAutomaticDiscoveryPairingController can't handle changing the setup result (payload) after pairing has already started. Set the setup result before calling -startWithHome:, and create a new pairing controller if you need to change it later. Current phase = %@", v17 object file lineNumber description];
  }
  setupResult = self->_setupResult;
  self->_setupResult = v5;
  v8 = v5;

  id v9 = objc_alloc((Class)HFDiscoveredAccessory);
  v10 = +[NSUUID UUID];
  v11 = [(HFSetupAccessoryResult *)v8 setupPayload];
  v12 = [v11 accessoryName];
  v13 = [(HFSetupAccessoryResult *)v8 setupPayload];

  v14 = [v13 category];
  id v15 = [v9 initWithAccessoryUUID:v10 accessoryName:v12 accessoryCategory:v14];
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setDiscoveredAccessoryToPair:v15];
}

- (void)setDelegate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HSSetupStateMachineCHIPPartnerConfiguration;
  [(HSSetupStateMachineConfiguration *)&v10 setDelegate:a3];
  v4 = [(HSSetupStateMachineConfiguration *)self matterDeviceSetupRequest];
  v5 = [v4 topology];

  if (!v5) {
    NSLog(@"Initialized a CHIPPartnerConfig w/o a partner topology, this shouldn't be possible");
  }
  id v6 = [v5 homes];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    v8 = [v5 homes];
    id v9 = [v8 firstObject];
    [(HSSetupStateMachineCHIPPartnerConfiguration *)self setSelectedPartnerHome:v9];
  }
}

- (id)roomName
{
  v2 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self selectedPartnerRoom];
  id v3 = [v2 name];

  return v3;
}

- (HSMatterEcosystem)targetEcosystem
{
  targetEcosystem = self->_targetEcosystem;
  if (!targetEcosystem)
  {
    v4 = [(HSSetupStateMachineConfiguration *)self setupDescription];
    v5 = [v4 appBundleURL];

    if (!v5) {
      NSLog(@"%s Failed to create target ecosystem because the bundle URL of the partner app is missing", "-[HSSetupStateMachineCHIPPartnerConfiguration targetEcosystem]");
    }
    id v6 = +[HSMatterEcosystem ecosystemForContainingAppBundleURL:v5];
    if (!v6)
    {
      id v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000663A4();
      }
    }
    v8 = self->_targetEcosystem;
    self->_targetEcosystem = v6;

    targetEcosystem = self->_targetEcosystem;
  }

  return targetEcosystem;
}

- (id)updateUserGivenAccessoryName:(id)a3
{
  [(HSSetupStateMachineConfiguration *)self setUserGivenAccessoryName:a3];

  return +[NAFuture futureWithNoResult];
}

- (id)stageCHIPAccessory
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  v4 = [v3 homeManager];

  v5 = [v4 accessorySetupCoordinator];
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setPhase:2];
  id v6 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagedCHIPPairingIdentifier];

  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagedCHIPPairingIdentifier];
      *(_DWORD *)buf = 136315394;
      v31 = "-[HSSetupStateMachineCHIPPartnerConfiguration stageCHIPAccessory]";
      __int16 v32 = 2112;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s CHIP accessory is known to system commissioner with identifier %@ - skipping staging", buf, 0x16u);
    }
    id v9 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagedCHIPPairingIdentifier];
    objc_super v10 = +[NAFuture futureWithResult:v9];
  }
  else
  {
    v11 = [(HSSetupStateMachineConfiguration *)self setupDescription];
    id v9 = [v11 setupAccessoryPayload];

    v12 = [(HSSetupStateMachineConfiguration *)self matterDeviceSetupRequest];
    unsigned __int8 v13 = [v12 shouldScanNetworks];

    if (v9)
    {
      objc_initWeak((id *)buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10001E3A0;
      v24[3] = &unk_1000A9890;
      id v9 = v9;
      id v25 = v9;
      unsigned __int8 v29 = v13;
      id v26 = v5;
      v27 = self;
      objc_copyWeak(&v28, (id *)buf);
      objc_super v10 = +[NAFuture futureWithBlock:v24];
      objc_destroyWeak(&v28);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100066418(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v22 = +[NSError hf_errorWithCode:33];
      objc_super v10 = +[NAFuture futureWithError:v22];
    }
  }

  return v10;
}

- (id)pairStagedCHIPAccessoryToPartnerAppHome
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  v4 = [v3 homeManager];

  v5 = [v4 accessorySetupCoordinator];
  if (![(HSSetupStateMachineCHIPPartnerConfiguration *)self phase]) {
    [(HSSetupStateMachineCHIPPartnerConfiguration *)self setPhase:2];
  }
  id v6 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self targetEcosystem];

  if (v6)
  {
    id v7 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagedCHIPPairingIdentifier];
    v8 = [(HSSetupStateMachineConfiguration *)self delegate];
    id v9 = [v8 stateMachineConfigurationGetSetupCode:self];

    objc_super v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self targetEcosystem];
      *(_DWORD *)buf = 136315906;
      v43 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
      __int16 v44 = 2112;
      v45 = v7;
      __int16 v46 = 2112;
      v47 = v9;
      __int16 v48 = 2112;
      v49 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s pairingIdentifier %@, setupCode %@, ecosystem %@. Unless this is an accessory previously paired to system commissioner, it will fail to pair to to partner app because it doesn't have a staged identifier", buf, 0x2Au);
    }
    if (v7)
    {
      v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Creating CHIP setup payload with pairingIdentifier", buf, 0xCu);
      }

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10001ECB4;
      v39[3] = &unk_1000A98B8;
      id v40 = v5;
      id v41 = v7;
      unsigned __int8 v13 = +[NAFuture futureWithCompletionHandlerAdapterBlock:v39];
    }
    else
    {
      v23 = HFLogForCategory();
      v24 = v23;
      if (v9)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v43 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Using setup code as payload string", buf, 0xCu);
        }

        unsigned __int8 v13 = +[NAFuture futureWithResult:v9];
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10006657C(v24, v25, v26, v27, v28, v29, v30, v31);
        }

        __int16 v32 = +[NSError hf_errorWithCode:33];
        unsigned __int8 v13 = +[NAFuture futureWithError:v32];
      }
    }
    v33 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self selectedPartnerHome];
    v34 = HFLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[HSSetupStateMachineCHIPPartnerConfiguration pairStagedCHIPAccessoryToPartnerAppHome]";
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s selectedPartnerHome %@", buf, 0x16u);
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001ECC4;
    v37[3] = &unk_1000A9948;
    v37[4] = self;
    id v38 = v33;
    id v35 = v33;
    v22 = [v13 flatMap:v37];
  }
  else
  {
    v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100066504(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    id v7 = +[NSError hf_errorWithCode:30];
    v22 = +[NAFuture futureWithError:v7];
  }

  return v22;
}

- (void)_updateAccessoryNameWithCHIPPairingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MTSSystemCommissionerPairingManager);
  [(HSSetupStateMachineConfiguration *)self setPairingManager:v5];

  objc_initWeak(&location, self);
  id v6 = [(HSSetupStateMachineConfiguration *)self pairingManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001F128;
  v8[3] = &unk_1000A9998;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [v6 fetchPairingsWithCompletionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)cancelStagingForCHIPPairing
{
  id v3 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagedCHIPPairingIdentifier];

  if (v3)
  {
    id v4 = HFLogForCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      id v6 = +[NAFuture futureWithNoResult];
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "-[HSSetupStateMachineCHIPPartnerConfiguration cancelStagingForCHIPPairing]";
    id v5 = "%s did not cancel staging - the accessory is already staged.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    goto LABEL_5;
  }
  v8 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagingRequestUUID];

  if (!v8)
  {
    id v4 = HFLogForCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "-[HSSetupStateMachineCHIPPartnerConfiguration cancelStagingForCHIPPairing]";
    id v5 = "%s did not cancel staging as there is no stagingRequestUUID";
    goto LABEL_4;
  }
  id v9 = [(HSSetupStateMachineConfiguration *)self addedAccessory];

  if (v9)
  {
    id v4 = HFLogForCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v23 = "-[HSSetupStateMachineCHIPPartnerConfiguration cancelStagingForCHIPPairing]";
    id v5 = "%s Accessory was already paired to Apple Home, no need to cancel staging.  Noop";
    goto LABEL_4;
  }
  id v10 = +[HFHomeKitDispatcher sharedDispatcher];
  v11 = [v10 homeManager];

  v12 = [v11 accessorySetupCoordinator];
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagingRequestUUID];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001F6CC;
  v19[3] = &unk_1000A99C0;
  id v20 = v12;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v13;
  id v14 = v12;
  id v6 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001F6DC;
  v17[3] = &unk_1000A8D98;
  id v18 = v13;
  id v15 = v13;
  id v16 = [v6 addCompletionBlock:v17];

LABEL_6:

  return v6;
}

- (void)didReceiveDeviceCredential:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v9 = [v8 homeManager];

  id v10 = [v9 accessorySetupCoordinator];
  uint64_t v11 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagingRequestUUID];
  if (v11)
  {
    v12 = (void *)v11;
    id v13 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagingRequestUUID];
    unsigned __int8 v14 = [v13 hmf_isEqualToUUID:v7];

    if ((v14 & 1) == 0) {
      NSLog(@"%s received stagingRequestUUID that does not match", "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]");
    }
  }
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setStagingRequestUUID:v7];
  id v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveDeviceCredential:forStagingRequestUUID:]";
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Received and validating device credential: %@ staging request UUID: %@", buf, 0x20u);
  }

  id v16 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self targetEcosystem];
  uint64_t v17 = [v16 extensionMessenger];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001FA04;
  v21[3] = &unk_1000A99E8;
  id v22 = v6;
  id v23 = v10;
  id v24 = v7;
  id v18 = v7;
  id v19 = v10;
  id v20 = v6;
  [v17 validateDeviceCredential:v20 completionHandler:v21];
}

- (void)didReceiveThreadScanResults:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v9 = [v8 homeManager];

  id v10 = [v9 accessorySetupCoordinator];
  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveThreadScanResults:forStagingRequestUUID:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Selecting Thread network from scan results: %@", buf, 0x16u);
  }

  v12 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self targetEcosystem];
  id v13 = [v12 extensionMessenger];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001FCD4;
  v16[3] = &unk_1000A9A10;
  id v17 = v10;
  id v18 = v7;
  id v14 = v7;
  id v15 = v10;
  [v13 selectThreadNetworkFromScanResults:v6 completionHandler:v16];
}

- (void)didReceiveWiFiScanResults:(id)a3 forStagingRequestUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[HFHomeKitDispatcher sharedDispatcher];
  id v9 = [v8 homeManager];

  id v10 = [v9 accessorySetupCoordinator];
  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[HSSetupStateMachineCHIPPartnerConfiguration didReceiveWiFiScanResults:forStagingRequestUUID:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Selecting WiFi network from scan results: %@", buf, 0x16u);
  }

  v12 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self targetEcosystem];
  id v13 = [v12 extensionMessenger];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001FFA8;
  v16[3] = &unk_1000A9A38;
  id v17 = v10;
  id v18 = v7;
  id v14 = v7;
  id v15 = v10;
  [v13 selectWiFiNetworkFromScanResults:v6 completionHandler:v16];
}

- (void)didUpdateProgress:(int64_t)a3 forStagingRequestUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagingRequestUUID];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self stagingRequestUUID];
    unsigned __int8 v10 = [v9 hmf_isEqualToUUID:v6];

    if ((v10 & 1) == 0) {
      NSLog(@"%s received stagingRequestUUID that does not match", "-[HSSetupStateMachineCHIPPartnerConfiguration didUpdateProgress:forStagingRequestUUID:]");
    }
  }
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setStagingRequestUUID:v6];
  uint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = HMSetupAccessoryProgressAsString();
    *(_DWORD *)buf = 136315394;
    id v20 = "-[HSSetupStateMachineCHIPPartnerConfiguration didUpdateProgress:forStagingRequestUUID:]";
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s received progress update: %@", buf, 0x16u);
  }
  id v13 = [(HSSetupStateMachineConfiguration *)self setupDescription];
  id v14 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self context];
  [v14 setSetupAccessoryDescription:v13];

  unint64_t v15 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self phase];
  id v16 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self context];
  id v17 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self discoveredAccessoryToPair];
  id v18 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self setupResult];
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setPhase:+[HFSetupPairingControllerUtilities processThirdPartyAccessorySetupProgressChange:a3 currentPhase:v15 context:v16 discoveredAccessory:v17 setupResult:v18 callerClass:objc_opt_class()]];
}

- (void)addPairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self pairingObservers];

  if (!v5)
  {
    id v6 = +[NSHashTable weakObjectsHashTable];
    [(HSSetupStateMachineCHIPPartnerConfiguration *)self setPairingObservers:v6];
  }
  id v7 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self pairingObservers];
  [v7 addObject:v4];
}

- (id)pairedAccessories
{
  v2 = objc_opt_new();

  return v2;
}

- (void)removePairingObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self pairingObservers];
  [v5 removeObject:v4];
}

- (void)setPhase:(unint64_t)a3
{
  if (self->_phase != a3)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:self->_phase];
      id v7 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a3];
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "-[HSSetupStateMachineCHIPPartnerConfiguration setPhase:]";
      __int16 v26 = 2112;
      __int16 v27 = v6;
      __int16 v28 = 2112;
      __int16 v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s old phase: %@ new phase: %@", buf, 0x20u);
    }
    v8 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self accessoryNotFoundSoftTimeoutTimer];
    [v8 invalidate];

    [(HSSetupStateMachineCHIPPartnerConfiguration *)self setAccessoryNotFoundSoftTimeoutTimer:0];
    id v9 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self accessoryNotFoundFatalTimeoutTimer];
    [v9 invalidate];

    [(HSSetupStateMachineCHIPPartnerConfiguration *)self setAccessoryNotFoundFatalTimeoutTimer:0];
    if (a3 == 2)
    {
      objc_initWeak((id *)buf, self);
      +[HFSetupPairingControllerUtilities accessoryDiscoverySoftTimeout];
      double v11 = v10;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100020748;
      v22[3] = &unk_1000A9A60;
      objc_copyWeak(&v23, (id *)buf);
      v12 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v22 block:v11];
      [(HSSetupStateMachineCHIPPartnerConfiguration *)self setAccessoryNotFoundSoftTimeoutTimer:v12];

      +[HFSetupPairingControllerUtilities accessoryDiscoveryFatalTimeout];
      double v14 = v13;
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = sub_100020808;
      id v20 = &unk_1000A9A60;
      objc_copyWeak(&v21, (id *)buf);
      unint64_t v15 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v17 block:v14];
      -[HSSetupStateMachineCHIPPartnerConfiguration setAccessoryNotFoundFatalTimeoutTimer:](self, "setAccessoryNotFoundFatalTimeoutTimer:", v15, v17, v18, v19, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    self->_phase = a3;
    id v16 = +[NSDate date];
    [(HSSetupStateMachineCHIPPartnerConfiguration *)self setPhaseStartDate:v16];

    if (a3 != 9) {
      [(HSSetupStateMachineCHIPPartnerConfiguration *)self _updateStatusTextAndNotifyDelegate:1];
    }
  }
}

- (void)_updateStatusTextAndNotifyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v29 = 0;
  id v30 = 0;
  unint64_t phase = self->_phase;
  id v6 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self phaseStartDate];
  id v7 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self discoveredAccessoryToPair];
  v8 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self setupResult];
  id v9 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self context];
  double v10 = [(HSSetupStateMachineConfiguration *)self pairingError];
  +[HFSetupPairingControllerUtilities getStatusTitle:&v30 statusDescription:&v29 forPairingPhase:phase phaseStartDate:v6 discoveredAccessory:v7 setupResult:v8 context:v9 setupError:v10];
  id v11 = v30;
  id v12 = v29;

  double v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating status title: \"%@\" description: \"%@\"", buf, 0x16u);
  }

  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setStatusTitle:v11];
  [(HSSetupStateMachineCHIPPartnerConfiguration *)self setStatusDescription:v12];
  if (v3)
  {
    id v23 = v12;
    id v24 = v11;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v14 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self pairingObservers];
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            unint64_t v20 = self->_phase;
            id v21 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self statusTitle];
            id v22 = [(HSSetupStateMachineCHIPPartnerConfiguration *)self statusDescription];
            [v19 pairingController:self didTransitionToPhase:v20 statusTitle:v21 statusDescription:v22];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v16);
    }

    id v12 = v23;
    id v11 = v24;
  }
}

+ (BOOL)supportsSetupPayloadRetry
{
  return 0;
}

- (HMAccessorySetupCompletedInfo)completedInfo
{
  return self->_completedInfo;
}

- (NSUUID)stagingRequestUUID
{
  return self->_stagingRequestUUID;
}

- (void)setStagingRequestUUID:(id)a3
{
}

- (NSString)stagedCHIPPairingIdentifier
{
  return self->_stagedCHIPPairingIdentifier;
}

- (void)setStagedCHIPPairingIdentifier:(id)a3
{
}

- (NSUUID)chipDevicePairingUUID
{
  return self->_chipDevicePairingUUID;
}

- (void)setChipDevicePairingUUID:(id)a3
{
}

- (HFSetupPairingContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (HFSetupPairingContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (MTSDeviceSetupHome)selectedPartnerHome
{
  return self->_selectedPartnerHome;
}

- (void)setSelectedPartnerHome:(id)a3
{
}

- (MTSDeviceSetupRoom)selectedPartnerRoom
{
  return self->_selectedPartnerRoom;
}

- (void)setSelectedPartnerRoom:(id)a3
{
}

- (NSString)statusTitle
{
  return self->_statusTitle;
}

- (void)setStatusTitle:(id)a3
{
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
}

- (HSAccessoryPairingFuture)homekitPairingFuture
{
  return self->_homekitPairingFuture;
}

- (void)setHomekitPairingFuture:(id)a3
{
}

- (MTSSystemCommissionerPairing)currentPairing
{
  return self->_currentPairing;
}

- (void)setCurrentPairing:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (NSDate)phaseStartDate
{
  return self->_phaseStartDate;
}

- (void)setPhaseStartDate:(id)a3
{
}

- (NSHashTable)pairingObservers
{
  return self->_pairingObservers;
}

- (void)setPairingObservers:(id)a3
{
}

- (NSTimer)accessoryNotFoundFatalTimeoutTimer
{
  return self->_accessoryNotFoundFatalTimeoutTimer;
}

- (void)setAccessoryNotFoundFatalTimeoutTimer:(id)a3
{
}

- (NSTimer)accessoryNotFoundSoftTimeoutTimer
{
  return self->_accessoryNotFoundSoftTimeoutTimer;
}

- (void)setAccessoryNotFoundSoftTimeoutTimer:(id)a3
{
}

- (HFDiscoveredAccessory)discoveredAccessoryToPair
{
  return self->_discoveredAccessoryToPair;
}

- (void)setDiscoveredAccessoryToPair:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccessoryToPair, 0);
  objc_storeStrong((id *)&self->_accessoryNotFoundSoftTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_accessoryNotFoundFatalTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_pairingObservers, 0);
  objc_storeStrong((id *)&self->_phaseStartDate, 0);
  objc_storeStrong((id *)&self->_currentPairing, 0);
  objc_storeStrong((id *)&self->_homekitPairingFuture, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusTitle, 0);
  objc_storeStrong((id *)&self->_selectedPartnerRoom, 0);
  objc_storeStrong((id *)&self->_selectedPartnerHome, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_chipDevicePairingUUID, 0);
  objc_storeStrong((id *)&self->_stagedCHIPPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_stagingRequestUUID, 0);
  objc_storeStrong((id *)&self->_setupResult, 0);
  objc_storeStrong((id *)&self->_completedInfo, 0);

  objc_storeStrong((id *)&self->_targetEcosystem, 0);
}

@end