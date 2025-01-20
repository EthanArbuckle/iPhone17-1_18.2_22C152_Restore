@interface HSProxCardCoordinator
- (BOOL)didShowCustomCommissioningFlowAlertIfNecessary;
- (BOOL)isConfiguringLastAccessoryOfSameCategory;
- (BOOL)isInSetupContext;
- (BOOL)isUsingCHIPCommunicationProtocol;
- (BOOL)isUsingHAPCommunicationProtocol;
- (BOOL)requiresDismissalConfirmation;
- (BOOL)requiresDismissalConfirmation:(id)a3;
- (BOOL)requiresIdentifyButton;
- (BOOL)requiresIdentifyButton:(id)a3;
- (BOOL)retryFlag;
- (BOOL)setupSpecificAccessory;
- (BOOL)stateMachineConfigurationActiveTupleIsTopTuple;
- (BOOL)stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:(id)a3;
- (BOOL)stateMachineConfigurationShouldJumpToDoneStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSetupBridgedAccessories:(id)a3;
- (BOOL)stateMachineConfigurationShouldSetupRouters:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipAccessoryUpdateStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipBridgeAddedStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipDetectedStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipDoneStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipHomeHubStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipHomeHubUpgradeStep:(id)a3;
- (BOOL)stateMachineConfigurationShouldSkipResumeSelectAccessoryStep:(id)a3;
- (BOOL)userDidSelectAccessories;
- (HFAccessoryBrowsingManager)accessoryBrowser;
- (HFDiscoveredAccessory)discoveredAccessory;
- (HMHome)home;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (HSAccessoryPairingFuture)pairingFuture;
- (HSAccessoryTuple)activeTuple;
- (HSAccessoryTuple)nextUnconfiguredBridgedAccessory;
- (HSAccessoryTuple)topAccessoryTuple;
- (HSEntitlementContext)entitlementContext;
- (HSProxCardCoordinator)initWithHome:(id)a3 accessories:(id)a4 delegate:(id)a5;
- (HSProxCardCoordinator)initWithHome:(id)a3 accessoryDescription:(id)a4 matterDeviceSetupRequest:(id)a5 setupSpecificAccessory:(BOOL)a6 entitlementContext:(id)a7 discoveredAccessory:(id)a8 delegate:(id)a9;
- (HSProxCardCoordinatorDelegate)delegate;
- (MTSDeviceSetupRequest)matterDeviceSetupRequest;
- (NAFuture)matterSetupPairingWindowReadyFuture;
- (NSArray)allAccessories;
- (NSArray)allAccessoryTuples;
- (NSArray)bridgedAccessories;
- (NSDictionary)bridgedAccessoryCategoryToArrayMap;
- (NSString)description;
- (NSString)setupCode;
- (NSUUID)suggestedRoomUUID;
- (id)_bridgedConfigurationOrdinalityString;
- (id)_configurationForAccessory:(id)a3 stateMachine:(id)a4;
- (id)_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:(id)a3;
- (id)_generateNextStep;
- (id)_generateNextStepWithActiveTuple:(id)a3;
- (id)_tupleForAccessory:(id)a3;
- (id)didReceiveDiscoveredAccessory:(id)a3;
- (id)didReceiveSetupCode:(id)a3 fromViewController:(id)a4;
- (id)nextViewController;
- (id)nextViewControllerWithTarget:(id)a3;
- (id)showCustomCommissioningFlowAlertIfNecessaryForPayload:(id)a3 onViewController:(id)a4;
- (int64_t)accessoryCommunicationProtocol;
- (int64_t)launchReason;
- (unint64_t)numberOfAccessoriesInSameCategory;
- (unint64_t)pairingState;
- (void)didReceiveAccessories:(id)a3;
- (void)dismissProxCardFlowAfterExecuting:(id)a3;
- (void)home:(id)a3 didFailAccessorySetupWithError:(id)a4;
- (void)notifyDelegateOfPairingFailureWithError:(id)a3;
- (void)pairAccessory;
- (void)pairAccessoryToAppleHome;
- (void)pairAccessoryToPEA;
- (void)resetForRetry;
- (void)setAccessoryBrowser:(id)a3;
- (void)setAccessoryCommunicationProtocol:(int64_t)a3;
- (void)setActiveTuple:(id)a3;
- (void)setBridgedAccessories:(id)a3;
- (void)setBridgedAccessoryCategoryToArrayMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidShowCustomCommissioningFlowAlertIfNecessary:(BOOL)a3;
- (void)setMatterSetupPairingWindowReadyFuture:(id)a3;
- (void)setPairingFuture:(id)a3;
- (void)setPairingState:(unint64_t)a3;
- (void)setRetryFlag:(BOOL)a3;
- (void)setSetupAccessoryDescription:(id)a3;
- (void)setSetupCode:(id)a3;
- (void)setTopAccessoryTuple:(id)a3;
- (void)setUserDidSelectAccessories:(BOOL)a3;
- (void)stateMachineConfiguration:(id)a3 didUpdateHome:(id)a4;
- (void)stateMachineConfigurationIsReadyToPair:(id)a3;
- (void)updateAccessoriesPendingConfiguration:(id)a3;
- (void)updateSetupAccessoryDescriptionWithPayload:(id)a3;
@end

@implementation HSProxCardCoordinator

- (HSProxCardCoordinator)initWithHome:(id)a3 accessoryDescription:(id)a4 matterDeviceSetupRequest:(id)a5 setupSpecificAccessory:(BOOL)a6 entitlementContext:(id)a7 discoveredAccessory:(id)a8 delegate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v54 = a7;
  id v53 = a8;
  id v18 = a9;
  v55.receiver = self;
  v55.super_class = (Class)HSProxCardCoordinator;
  v19 = [(HSProxCardCoordinator *)&v55 init];
  v20 = v19;
  if (v19)
  {
    id v52 = v18;
    objc_storeWeak((id *)&v19->_delegate, v18);
    objc_storeStrong((id *)&v20->_setupAccessoryDescription, a4);
    objc_storeStrong((id *)&v20->_matterDeviceSetupRequest, a5);
    v21 = [v16 setupAccessoryPayload];
    v22 = [v21 setupPayloadURL];
    v23 = [v22 absoluteString];

    if ([v23 length])
    {
      v24 = +[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:v23];
      id v25 = [v24 integerValue];

      v20->_accessoryCommunicationProtocol = (int64_t)v25;
    }
    v20->_setupSpecificAccessory = a6;
    v26 = +[HSAccessoryPairingEventLogger sharedLogger];
    v27 = [v16 setupAccessoryPayload];
    [v26 logTransportFlagsFromPayload:v27];

    objc_storeStrong((id *)&v20->_entitlementContext, a7);
    uint64_t v28 = [v16 suggestedRoomUniqueIdentifier];
    suggestedRoomUUID = v20->_suggestedRoomUUID;
    v20->_suggestedRoomUUID = (NSUUID *)v28;

    v20->_pairingState = 0;
    objc_storeStrong((id *)&v20->_discoveredAccessory, a8);
    if (!a6)
    {
      v30 = (HFAccessoryBrowsingManager *)objc_alloc_init((Class)HFAccessoryBrowsingManager);
      accessoryBrowser = v20->_accessoryBrowser;
      v20->_accessoryBrowser = v30;

      [(HFAccessoryBrowsingManager *)v20->_accessoryBrowser startSearchingForNewAccessories];
    }
    unsigned int v32 = [v16 isSetupInitiatedByOtherMatterEcosystem];
    v33 = &off_1000A8908;
    if (!v32) {
      v33 = off_1000A8900;
    }
    id v34 = objc_alloc_init(*v33);
    id v35 = objc_msgSend(objc_alloc((Class)objc_msgSend(v34, "configurationObjectClass")), "initWithHome:", v15);
    [v35 setDelegate:v20];
    v36 = objc_alloc_init(HSAccessoryTuple);
    [(HSAccessoryTuple *)v36 setStateMachine:v34];
    [(HSAccessoryTuple *)v36 setConfiguration:v35];
    topAccessoryTuple = v20->_topAccessoryTuple;
    v20->_topAccessoryTuple = v36;
    v38 = v36;

    objc_storeStrong((id *)&v20->_activeTuple, v20->_topAccessoryTuple);
    uint64_t v39 = +[NAFuture futureWithNoResult];
    matterSetupPairingWindowReadyFuture = v20->_matterSetupPairingWindowReadyFuture;
    v20->_matterSetupPairingWindowReadyFuture = (NAFuture *)v39;

    v41 = +[HFHomeKitDispatcher sharedDispatcher];
    [v41 setOverrideHome:v15];

    v42 = +[HFHomeKitDispatcher sharedDispatcher];
    [v42 addHomeObserver:v20];

    objc_opt_class();
    v43 = HFLogForCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = [v15 hf_prettyDescription];
      v45 = [v16 hf_prettyDescription];
      [v53 hf_prettyDescription];
      id v51 = v16;
      id v46 = v15;
      v47 = v23;
      v49 = id v48 = v17;
      *(_DWORD *)buf = 138413058;
      v57 = v44;
      __int16 v58 = 2112;
      v59 = v45;
      __int16 v60 = 2112;
      id v61 = v54;
      __int16 v62 = 2112;
      v63 = v49;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Initialized HSProxCardCoordinator with Home [%@] accessoryDescription [%@] entitlementContext [%@] discoveredAccessory [%@]", buf, 0x2Au);

      id v17 = v48;
      v23 = v47;
      id v15 = v46;
      id v16 = v51;
    }
    id v18 = v52;
  }

  return v20;
}

- (HSProxCardCoordinator)initWithHome:(id)a3 accessories:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HSProxCardCoordinator;
  v11 = [(HSProxCardCoordinator *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    if (v9) {
      v13 = v9;
    }
    else {
      v13 = &__NSArray0__struct;
    }
    v14 = +[NSSet setWithArray:v13];
    [(HSProxCardCoordinator *)v12 didReceiveAccessories:v14];

    id v15 = +[HFHomeKitDispatcher sharedDispatcher];
    [v15 setOverrideHome:v8];

    id v16 = +[HFHomeKitDispatcher sharedDispatcher];
    [v16 addHomeObserver:v12];

    objc_opt_class();
  }

  return v12;
}

- (HMHome)home
{
  v2 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  v3 = [v2 configuration];
  v4 = [v3 home];

  return (HMHome *)v4;
}

- (int64_t)launchReason
{
  v3 = [(HSProxCardCoordinator *)self delegate];
  id v4 = [v3 coordinatorGetLaunchReason:self];

  return (int64_t)v4;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  v6 = [(HSProxCardCoordinator *)self discoveredAccessory];
  unint64_t v7 = [(HSProxCardCoordinator *)self pairingState];
  id v8 = [(HSProxCardCoordinator *)self pairingFuture];
  id v9 = [(HSProxCardCoordinator *)self activeTuple];
  id v10 = +[NSString stringWithFormat:@"<%@ setupAccessoryDescription: %@ discoveredAccessory: %@ pairingState: %lu pairingFuture: %@ activeTuple: %@>", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (void)updateAccessoriesPendingConfiguration:(id)a3
{
  id v4 = a3;
  if ((id)[(HSProxCardCoordinator *)self launchReason] != (id)1)
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000677C8(v5);
    }
    goto LABEL_8;
  }
  if (![v4 count])
  {
    v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100067744(v5);
    }
LABEL_8:

    goto LABEL_9;
  }
  [(HSProxCardCoordinator *)self didReceiveAccessories:v4];
  [(HSProxCardCoordinator *)self setUserDidSelectAccessories:1];
LABEL_9:
}

- (void)didReceiveAccessories:(id)a3
{
  id v4 = a3;
  [(HSProxCardCoordinator *)self setPairingState:2];
  if ([(HSProxCardCoordinator *)self launchReason])
  {
    v5 = [v4 allObjects];
    v6 = [v5 sortedArrayUsingComparator:&stru_1000AA648];

    if (_os_feature_enabled_impl()
      && ((id)[(HSProxCardCoordinator *)self launchReason] == (id)4
       || (id)[(HSProxCardCoordinator *)self launchReason] == (id)5))
    {
      uint64_t v7 = +[HFUtilities sortedLockAccessoryArrayForSetup:v4];

      v6 = (void *)v7;
    }
    id v8 = [v6 firstObject];
    id v9 = [(HSProxCardCoordinator *)self _tupleForAccessory:v8];
    [(HSProxCardCoordinator *)self setTopAccessoryTuple:v9];
    id v10 = [(HSProxCardCoordinator *)self topAccessoryTuple];
    [(HSProxCardCoordinator *)self setActiveTuple:v10];
  }
  else
  {
    id v8 = [v4 na_firstObjectPassingTest:&stru_1000AA688];
    v6 = [(HSProxCardCoordinator *)self topAccessoryTuple];
    [v6 setAccessory:v8];
  }

  id v11 = v4;
  v12 = v11;
  if ((objc_msgSend(v8, "hf_isNetworkRouter") & 1) == 0)
  {
    v13 = +[NSSet na_setWithSafeObject:v8];
    v12 = [v11 na_setByRemovingObjectsFromSet:v13];
  }
  v14 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  id v15 = [v14 accessory];
  unsigned int v16 = [v15 hf_isSprinkler];

  if (v16)
  {
    id v17 = [v12 na_filter:&stru_1000AA6A8];
    uint64_t v18 = [v12 na_setByRemovingObjectsFromSet:v17];

    v12 = (void *)v18;
  }
  v19 = [v12 allObjects];
  v20 = [v19 sortedArrayUsingComparator:&stru_1000AA648];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100039A1C;
  v24[3] = &unk_1000AA6F0;
  v24[4] = self;
  v21 = [v20 na_map:v24];
  [(HSProxCardCoordinator *)self setBridgedAccessories:v21];

  v22 = [(HSProxCardCoordinator *)self bridgedAccessories];
  v23 = [v22 na_dictionaryByBucketingObjectsUsingKeyGenerator:&stru_1000AA730];
  [(HSProxCardCoordinator *)self setBridgedAccessoryCategoryToArrayMap:v23];
}

- (void)pairAccessory
{
  v3 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  unsigned int v4 = [v3 isSetupInitiatedByOtherMatterEcosystem];

  if (v4)
  {
    [(HSProxCardCoordinator *)self pairAccessoryToPEA];
  }
  else
  {
    [(HSProxCardCoordinator *)self pairAccessoryToAppleHome];
  }
}

- (void)pairAccessoryToAppleHome
{
  unsigned int v4 = [(HSProxCardCoordinator *)self setupAccessoryDescription];

  if (!v4)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"HSProxCardCoordinator.m" lineNumber:289 description:@"Add Accessory request can not be nil"];
  }
  id v5 = objc_alloc((Class)HFSetupPairingContext);
  v6 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  uint64_t v7 = [(HSProxCardCoordinator *)self entitlementContext];
  id v8 = [v5 initWithSetupAccessoryDescription:v6 isTrustedOrigin:[v7 isEntitledForHomeKitSPI]];

  id v9 = [(HSProxCardCoordinator *)self discoveredAccessory];
  id v10 = [v9 accessory];
  unsigned __int8 v11 = [v10 knownToSystemCommissioner];

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v12 = [(HSProxCardCoordinator *)self discoveredAccessory];
  }
  v13 = [[HSAccessoryPairingFuture alloc] initWithPairingContext:v8 discoveredAccessory:v12];
  [(HSProxCardCoordinator *)self setPairingFuture:v13];

  v14 = [(HSProxCardCoordinator *)self pairingFuture];
  id v15 = [(HSProxCardCoordinator *)self delegate];
  [v14 setPairingObserver:v15];

  unsigned int v16 = +[HSAccessoryPairingEventLogger sharedLogger];
  [v16 logPairingBegin];

  objc_initWeak(&location, self);
  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    v31 = v19;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ pairing starting with context: %@ coordinator: %@", buf, 0x2Au);
  }
  v20 = [(HSProxCardCoordinator *)self pairingFuture];
  v21 = [(HSProxCardCoordinator *)self home];
  v22 = [v20 startPairingWithHome:v21];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100039E04;
  v25[3] = &unk_1000AA758;
  objc_copyWeak(&v26, &location);
  id v23 = [v22 addCompletionBlock:v25];
  objc_destroyWeak(&v26);

  objc_destroyWeak(&location);
}

- (void)pairAccessoryToPEA
{
  unsigned int v4 = [(HSProxCardCoordinator *)self setupAccessoryDescription];

  if (!v4)
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"HSProxCardCoordinator.m" lineNumber:339 description:@"Add Accessory request can not be nil"];
  }
  id v5 = objc_alloc((Class)HFSetupPairingContext);
  v6 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  uint64_t v7 = [(HSProxCardCoordinator *)self entitlementContext];
  id v8 = [v5 initWithSetupAccessoryDescription:v6 isTrustedOrigin:[v7 isEntitledForHomeKitSPI]];

  uint64_t v9 = objc_opt_class();
  id v10 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  id v11 = [v10 configuration];
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;
    if (!v13)
    {
      v14 = +[NSAssertionHandler currentHandler];
      id v15 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v13 = 0;
  }

  [v13 setContext:v8];
  unsigned int v16 = [(HSProxCardCoordinator *)self delegate];
  [v13 addPairingObserver:v16];

  objc_initWeak(&location, self);
  id v17 = [v13 stageCHIPAccessory];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003A380;
  v27[3] = &unk_1000AA780;
  id v18 = v13;
  id v28 = v18;
  objc_copyWeak(&v29, &location);
  v19 = [v17 recover:v27];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10003A6B4;
  v23[3] = &unk_1000AA7D0;
  id v20 = v18;
  id v24 = v20;
  id v25 = self;
  SEL v26 = a2;
  id v21 = [v19 addSuccessBlock:v23];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)notifyDelegateOfPairingFailureWithError:(id)a3
{
  id v17 = a3;
  [(HSProxCardCoordinator *)self setPairingState:3];
  unsigned int v4 = +[NSMutableDictionary dictionary];
  id v5 = [(HSProxCardCoordinator *)self pairingFuture];
  v6 = [v5 pairingStatusTitle];
  [v4 setObject:v6 forKeyedSubscript:HFErrorUserInfoOptionTitleKey];

  uint64_t v7 = [(HSProxCardCoordinator *)self pairingFuture];
  id v8 = [v7 pairingStatusDescription];
  [v4 setObject:v8 forKeyedSubscript:HFErrorUserInfoOptionDescriptionKey];

  id v9 = [v4 count];
  if (v9) {
    id v10 = [v4 copy];
  }
  else {
    id v10 = 0;
  }
  id v11 = [v17 hf_errorWithOperationType:0 options:v10];
  v12 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  id v13 = [v12 configuration];
  [v13 setPairingError:v11];

  if (v9) {
  v14 = [(HSProxCardCoordinator *)self delegate];
  }
  id v15 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  unsigned int v16 = [v15 configuration];
  [v14 coordinator:self updatedConfiguration:v16];
}

- (id)_generateNextStep
{
  v3 = [(HSProxCardCoordinator *)self activeTuple];
  unsigned int v4 = [(HSProxCardCoordinator *)self _generateNextStepWithActiveTuple:v3];

  return v4;
}

- (id)_generateNextStepWithActiveTuple:(id)a3
{
  id v4 = a3;
  id v5 = [v4 moveToNextStep];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003AE18;
  v13[3] = &unk_1000AA7F8;
  id v6 = v4;
  id v14 = v6;
  id v15 = self;
  uint64_t v7 = [v5 flatMap:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003AF08;
  v11[3] = &unk_1000AA870;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = [v7 flatMap:v11];

  return v9;
}

- (id)nextViewController
{
  return [(HSProxCardCoordinator *)self nextViewControllerWithTarget:0];
}

- (id)nextViewControllerWithTarget:(id)a3
{
  id v4 = a3;
  id v5 = [(HSProxCardCoordinator *)self activeTuple];
  id v6 = [v5 currentStep];

  objc_initWeak(&location, self);
  uint64_t v7 = [(HSProxCardCoordinator *)self _generateNextStep];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003B528;
  v20[3] = &unk_1000AA898;
  objc_copyWeak(v21, &location);
  v21[1] = v6;
  id v8 = [v7 flatMap:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003B914;
  v18[3] = &unk_1000AA8C0;
  v18[4] = self;
  id v9 = v4;
  id v19 = v9;
  id v10 = [v8 flatMap:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003BB08;
  v16[3] = &unk_1000AA8C0;
  v16[4] = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = [v10 flatMap:v16];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003BE9C;
  v15[3] = &unk_1000A9C30;
  v15[4] = self;
  id v13 = [v12 addFailureBlock:v15];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  return v12;
}

- (void)dismissProxCardFlowAfterExecuting:(id)a3
{
  id v44 = a3;
  id v4 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  id v5 = [v4 configuration];
  v45 = [v5 home];

  if (objc_msgSend(v45, "hf_currentUserIsOwner"))
  {
    id v6 = +[HSAccessoryPairingEventLogger sharedLogger];
    uint64_t v7 = v6;
    uint64_t v8 = 1;
  }
  else if (objc_msgSend(v45, "hf_currentUserIsAdministrator"))
  {
    id v6 = +[HSAccessoryPairingEventLogger sharedLogger];
    uint64_t v7 = v6;
    uint64_t v8 = 2;
  }
  else
  {
    if (!v45) {
      goto LABEL_8;
    }
    id v6 = +[HSAccessoryPairingEventLogger sharedLogger];
    uint64_t v7 = v6;
    uint64_t v8 = 0;
  }
  [v6 logHUISUserType:v8];

LABEL_8:
  if (![(HSProxCardCoordinator *)self launchReason])
  {
    id v9 = +[HSAccessoryPairingEventLogger sharedLogger];
    [v9 logIsUsingCHIPCommunicationProtocol:[self isUsingCHIPCommunicationProtocol]];
  }
  id v10 = +[HSAccessoryPairingEventLogger sharedLogger];
  id v11 = [(HSProxCardCoordinator *)self delegate];
  [v10 logCardCount:[v11 coordinatorGetNumberOfProxCards:self]];

  id v12 = +[HSAccessoryPairingEventLogger sharedLogger];
  [v12 logHUISDismiss];

  id v13 = +[NAFuture futureWithNoResult];
  if ([(HSProxCardCoordinator *)self launchReason]
    && ((id)[(HSProxCardCoordinator *)self launchReason] != (id)1
     || ([(HSProxCardCoordinator *)self activeTuple],
         id v14 = objc_claimAutoreleasedReturnValue(),
         uint64_t v15 = (uint64_t)[v14 currentStep],
         v14,
         v15 < 11)))
  {
    id v21 = v13;
  }
  else
  {
    unsigned int v16 = [(HSProxCardCoordinator *)self allAccessoryTuples];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10003C564;
    v49[3] = &unk_1000AA910;
    id v50 = v45;
    id v17 = [v16 na_map:v49];
    id v18 = +[NAFuture chainFutures:v17];
    id v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = +[NAFuture futureWithNoResult];
    }
    id v21 = v20;
  }
  if (v44)
  {
    id v22 = v44;
  }
  else
  {
    id v22 = +[NAFuture futureWithNoResult];
  }
  id v23 = v22;
  id v24 = [(HSProxCardCoordinator *)self pairingFuture];
  id v25 = [v24 cancelPairing];
  SEL v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = +[NAFuture futureWithNoResult];
  }
  id v28 = v27;

  id v29 = +[NAFuture futureWithNoResult];
  __int16 v30 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  unsigned int v31 = [v30 isSetupInitiatedByOtherMatterEcosystem];

  if (v31)
  {
    uint64_t v32 = objc_opt_class();
    id v33 = [(HSProxCardCoordinator *)self topAccessoryTuple];
    id v34 = [v33 configuration];
    if (v34)
    {
      if (objc_opt_isKindOfClass()) {
        id v35 = v34;
      }
      else {
        id v35 = 0;
      }
      id v36 = v35;
      if (!v36)
      {
        v43 = +[NSAssertionHandler currentHandler];
        v42 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v43 handleFailureInFunction:v42, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v32, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v36 = 0;
    }

    uint64_t v37 = [v36 cancelStagingForCHIPPairing];

    id v29 = (void *)v37;
  }
  objc_initWeak(&location, self);
  v51[0] = v29;
  v51[1] = v21;
  v51[2] = v23;
  v51[3] = v28;
  v38 = +[NSArray arrayWithObjects:v51 count:4];
  uint64_t v39 = +[NAScheduler mainThreadScheduler];
  v40 = +[NAFuture combineAllFutures:v38 ignoringErrors:1 scheduler:v39];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10003C980;
  v46[3] = &unk_1000A91F0;
  objc_copyWeak(&v47, &location);
  id v41 = [v40 addCompletionBlock:v46];

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)resetForRetry
{
  [(HSProxCardCoordinator *)self setPairingState:0];
  v3 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  unsigned int v4 = [v3 isSetupInitiatedByOtherMatterEcosystem];
  id v5 = &off_1000A8908;
  if (!v4) {
    id v5 = off_1000A8900;
  }
  id v6 = objc_alloc_init(*v5);

  id v7 = objc_alloc((Class)[v6 configurationObjectClass]);
  uint64_t v8 = [(HSProxCardCoordinator *)self home];
  id v9 = [v7 initWithHome:v8];

  [v9 setDelegate:self];
  id v10 = objc_alloc_init(HSAccessoryTuple);
  [(HSAccessoryTuple *)v10 setStateMachine:v6];
  [(HSAccessoryTuple *)v10 setConfiguration:v9];
  [(HSProxCardCoordinator *)self setTopAccessoryTuple:v10];
  id v11 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  [(HSProxCardCoordinator *)self setActiveTuple:v11];

  id v12 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  [v12 updateRetry:1];

  id v13 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  [v13 setCancellationReason:0];

  id v14 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  uint64_t v15 = [v14 setupAccessoryPayload];
  unsigned int v16 = [v15 setupCode];
  [(HSProxCardCoordinator *)self setSetupCode:v16];

  id v17 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  id v18 = [v17 setupAccessoryPayload];
  -[HSProxCardCoordinator setAccessoryCommunicationProtocol:](self, "setAccessoryCommunicationProtocol:", [v18 communicationProtocol]);

  if (![(HSProxCardCoordinator *)self setupSpecificAccessory])
  {
    id v19 = (HFAccessoryBrowsingManager *)objc_alloc_init((Class)HFAccessoryBrowsingManager);
    accessoryBrowser = self->_accessoryBrowser;
    self->_accessoryBrowser = v19;

    [(HFAccessoryBrowsingManager *)self->_accessoryBrowser startSearchingForNewAccessories];
  }
  id v21 = [(HSProxCardCoordinator *)self discoveredAccessory];
  [v21 updateStatus:1 error:0];

  id v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100067A24(self, (uint64_t)v6, v22);
  }
}

- (void)home:(id)a3 didFailAccessorySetupWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = [v6 hf_prettyDescription];
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "-[%@ home:%@ didFailAccessorySetupWithError:%@]", (uint8_t *)&v14, 0x20u);
  }
  if (objc_msgSend(v7, "hf_isHMErrorWithCode:", 23))
  {
    id v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100067B3C(v9);
    }
  }
  else
  {
    id v9 = [(HSProxCardCoordinator *)self pairingFuture];
    id v10 = [v9 cancelPairingWithError:v7];
  }
}

- (HSAccessoryTuple)nextUnconfiguredBridgedAccessory
{
  v2 = [(HSProxCardCoordinator *)self bridgedAccessories];
  v3 = [v2 na_firstObjectPassingTest:&stru_1000AA950];

  return (HSAccessoryTuple *)v3;
}

- (id)_bridgedConfigurationOrdinalityString
{
  v3 = [(HSProxCardCoordinator *)self bridgedAccessories];
  if ([v3 count])
  {
    unsigned int v4 = [(HSProxCardCoordinator *)self activeTuple];
    id v5 = [(HSProxCardCoordinator *)self topAccessoryTuple];

    if (v4 == v5)
    {
      id v11 = 0;
      goto LABEL_11;
    }
    id v6 = [(HSProxCardCoordinator *)self activeTuple];
    v3 = [v6 accessoryCategoryOrPrimaryServiceType];

    id v7 = [(HSProxCardCoordinator *)self bridgedAccessoryCategoryToArrayMap];
    uint64_t v8 = [v7 objectForKeyedSubscript:v3];

    if ((unint64_t)[v8 count] < 2
      || ([(HSProxCardCoordinator *)self activeTuple],
          id v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = (char *)[v8 indexOfObject:v9],
          v9,
          v10 == (char *)0x7FFFFFFFFFFFFFFFLL))
    {
      id v11 = 0;
    }
    else
    {
      id v12 = HFLocalizedCategoryOrPrimaryServiceTypeString();
      id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, [v8 count], v10 + 1);
    }
  }
  else
  {
    id v11 = 0;
  }

LABEL_11:

  return v11;
}

- (id)_configurationForAccessory:(id)a3 stateMachine:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a4, "configurationObjectClass")), "initWithAccessory:", v6);

  [v7 setDelegate:self];

  return v7;
}

- (id)_tupleForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HSAccessoryTuple);
  id v6 = objc_alloc_init(HSSetupStateMachine);
  [(HSAccessoryTuple *)v5 setStateMachine:v6];

  id v7 = [(HSAccessoryTuple *)v5 stateMachine];
  uint64_t v8 = [(HSProxCardCoordinator *)self _configurationForAccessory:v4 stateMachine:v7];

  [(HSAccessoryTuple *)v5 setConfiguration:v8];

  return v5;
}

- (NSArray)allAccessoryTuples
{
  v3 = [(HSProxCardCoordinator *)self topAccessoryTuple];

  if (v3)
  {
    id v4 = [(HSProxCardCoordinator *)self topAccessoryTuple];
    id v9 = v4;
    id v5 = +[NSArray arrayWithObjects:&v9 count:1];
    id v6 = [(HSProxCardCoordinator *)self bridgedAccessories];
    id v7 = [v5 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    id v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSArray)allAccessories
{
  v2 = [(HSProxCardCoordinator *)self allAccessoryTuples];
  v3 = [v2 na_map:&stru_1000AA990];

  return (NSArray *)v3;
}

- (BOOL)isConfiguringLastAccessoryOfSameCategory
{
  v3 = [(HSProxCardCoordinator *)self activeTuple];
  id v4 = [v3 accessoryCategoryOrPrimaryServiceType];

  id v5 = [(HSProxCardCoordinator *)self bridgedAccessoryCategoryToArrayMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [(HSProxCardCoordinator *)self activeTuple];
  uint64_t v8 = [v7 accessory];
  id v9 = [v6 lastObject];
  id v10 = [v9 accessory];
  BOOL v11 = v8 == v10;

  return v11;
}

- (unint64_t)numberOfAccessoriesInSameCategory
{
  v3 = [(HSProxCardCoordinator *)self activeTuple];
  id v4 = [(HSProxCardCoordinator *)self topAccessoryTuple];

  if (v3 == v4) {
    return 1;
  }
  id v5 = [(HSProxCardCoordinator *)self activeTuple];
  id v6 = [v5 accessoryCategoryOrPrimaryServiceType];

  id v7 = [(HSProxCardCoordinator *)self bridgedAccessoryCategoryToArrayMap];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = [v8 count];

  return (unint64_t)v9;
}

- (void)stateMachineConfigurationIsReadyToPair:(id)a3
{
  id v4 = a3;
  if (![(HSProxCardCoordinator *)self pairingState])
  {
    [(HSProxCardCoordinator *)self setPairingState:1];
    objc_initWeak(&location, self);
    id v5 = [(HSProxCardCoordinator *)self matterSetupPairingWindowReadyFuture];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003D4B0;
    v7[3] = &unk_1000AA9B8;
    objc_copyWeak(&v8, &location);
    id v6 = [v5 addSuccessBlock:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)stateMachineConfiguration:(id)a3 didUpdateHome:(id)a4
{
  id v4 = a4;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  [v5 setOverrideHome:v4];
}

- (BOOL)stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:(id)a3
{
  id v4 = [(HSProxCardCoordinator *)self bridgedAccessories];
  if ([v4 count])
  {
    id v5 = [(HSProxCardCoordinator *)self bridgedAccessories];
    if ([v5 count] == (id)1)
    {
      id v6 = [(HSProxCardCoordinator *)self bridgedAccessories];
      id v7 = [v6 firstObject];
      id v8 = [v7 accessory];
      unsigned int v9 = [v8 hf_isNetworkRouter] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)stateMachineConfigurationActiveTupleIsTopTuple
{
  v2 = self;
  v3 = [(HSProxCardCoordinator *)self activeTuple];
  id v4 = [(HSProxCardCoordinator *)v2 topAccessoryTuple];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)stateMachineConfigurationShouldSkipDetectedStep:(id)a3
{
  id v4 = [a3 addedAccessory];

  if (v4)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(HSProxCardCoordinator *)self discoveredAccessory];
    if (v6)
    {
      id v7 = [(HSProxCardCoordinator *)self discoveredAccessory];
      id v8 = [v7 accessory];
      unsigned __int8 v5 = [v8 knownToSystemCommissioner];
    }
    else
    {
      unsigned __int8 v5 = 1;
    }
  }
  return v5 ^ 1;
}

- (BOOL)stateMachineConfigurationShouldSkipHomeHubStep:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 home];

  if (!v5)
  {
    id v6 = [(HSProxCardCoordinator *)self activeTuple];
    NSLog(@"No home for tuple %@", v6);
  }
  unsigned int v7 = ![(HSProxCardCoordinator *)self isUsingCHIPCommunicationProtocol];
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    id v8 = [v4 home];
    if (objc_msgSend(v8, "hf_currentUserIsOwner"))
    {
      unsigned int v9 = +[HFHomeKitDispatcher sharedDispatcher];
      id v10 = [v9 homeManager];
      LOBYTE(v7) = [v10 hasOptedToHH2] | v7;
    }
  }
  BOOL v11 = [v4 home];
  if (objc_msgSend(v11, "hf_currentUserIsOwner"))
  {
    unsigned int v12 = 1;
  }
  else
  {
    id v13 = [v4 home];
    if (objc_msgSend(v13, "hf_currentUserIsAdministrator"))
    {
      int v14 = [v4 home];
      unsigned int v12 = [v14 hf_hasResidentDeviceCapableOfSupportingMatterSharedAdmin];
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  if (v7)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    __int16 v16 = [v4 home];
    unsigned int v15 = [v16 hf_hasResidentDeviceCapableOfSupportingCHIP] & v12;
  }
  return v15;
}

- (BOOL)stateMachineConfigurationShouldSkipHomeHubUpgradeStep:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    unsigned int v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipHomeHubUpgradeStep:]";
      unsigned int v15 = "%s Skipping HSProxCardSetupUIStepHomeHubUpgradeRequired due to runtime FF disabled: [HOME_ENABLE_MATTER_IPHO"
            "NE_ONLY_PAIRING]";
      __int16 v16 = v12;
      uint32_t v17 = 12;
      goto LABEL_13;
    }
LABEL_14:
    BOOL v14 = 1;
    goto LABEL_15;
  }
  unsigned __int8 v5 = [v4 home];
  id v6 = [v5 residentDevices];
  id v7 = [v6 count];

  unsigned int v8 = [(HSProxCardCoordinator *)self isUsingHAPCommunicationProtocol];
  unsigned int v9 = +[HFHomeKitDispatcher sharedDispatcher];
  id v10 = [v9 homeManager];
  unsigned int v11 = [v10 hasOptedToHH2];

  unsigned int v12 = HFLogForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0 || v7 || v11)
  {
    if (v13)
    {
      int v19 = 136315906;
      id v20 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipHomeHubUpgradeStep:]";
      __int16 v21 = 1024;
      BOOL v22 = v7 != 0;
      __int16 v23 = 1024;
      unsigned int v24 = v8;
      __int16 v25 = 1024;
      unsigned int v26 = v11;
      unsigned int v15 = "%s Skipping HSProxCardSetupUIStepHomeHubUpgradeRequired - hasResident: [%d], isHAP: [%d], isHH2: [%d]";
      __int16 v16 = v12;
      uint32_t v17 = 30;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v13)
  {
    int v19 = 136315906;
    id v20 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipHomeHubUpgradeStep:]";
    __int16 v21 = 1024;
    BOOL v22 = 0;
    __int16 v23 = 1024;
    unsigned int v24 = 0;
    __int16 v25 = 1024;
    unsigned int v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Not skipping HSProxCardSetupUIStepHomeHubUpgradeRequired - hasResident: [%d], isHAP: [%d], isHH2: [%d]", (uint8_t *)&v19, 0x1Eu);
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (BOOL)stateMachineConfigurationShouldSkipAccessoryUpdateStep:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    unsigned int v5 = [(HSProxCardCoordinator *)self isUsingCHIPCommunicationProtocol];
    id v6 = [v4 addedAccessory];
    unsigned int v7 = [v6 hf_hasNewValidSoftwareOrFirmwareUpdate];
    unsigned int v8 = [v4 home];
    unsigned int v9 = [v8 hf_currentUserIsAdministrator];

    id v10 = HFLogForCategory();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v5 & v7 & v9)
    {
      if (v11)
      {
        int v17 = 136315650;
        __int16 v18 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipAccessoryUpdateStep:]";
        __int16 v19 = 1024;
        int v20 = 1;
        __int16 v21 = 1024;
        int v22 = 1;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Not skipping HSProxCardSetupUIStepAccessoryUpdate - isMatter: [%{BOOL}d], hasValidUpdate: [%{BOOL}d]", (uint8_t *)&v17, 0x18u);
      }
    }
    else if (v11)
    {
      unsigned int v12 = [v4 home];
      BOOL v13 = [v12 currentUser];
      BOOL v14 = [v13 hf_prettyDescription];
      int v17 = 136316162;
      __int16 v18 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipAccessoryUpdateStep:]";
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 1024;
      int v22 = v7;
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      __int16 v25 = 2112;
      unsigned int v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping HSProxCardSetupUIStepAccessoryUpdate - isMatter: [%{BOOL}d], hasValidUpdate: [%{BOOL}d], isCurrentUserAdmin: %{BOOL}d for %@", (uint8_t *)&v17, 0x28u);
    }
    char v15 = v5 & v7 & v9 ^ 1;
  }
  else
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      __int16 v18 = "-[HSProxCardCoordinator stateMachineConfigurationShouldSkipAccessoryUpdateStep:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping HSProxCardSetupUIStepAccessoryUpdate due to runtime FF disabled: [HOME_ENABLE_MATTER_IPHONE_ONLY_PAIRING]", (uint8_t *)&v17, 0xCu);
    }
    char v15 = 1;
  }

  return v15;
}

- (BOOL)stateMachineConfigurationShouldSkipResumeSelectAccessoryStep:(id)a3
{
  id v4 = a3;
  if ([(HSProxCardCoordinator *)self userDidSelectAccessories]) {
    LOBYTE(v5) = 1;
  }
  else {
    unsigned int v5 = ![(HSProxCardCoordinator *)self stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:v4];
  }

  return v5;
}

- (BOOL)stateMachineConfigurationShouldSkipBridgeAddedStep:(id)a3
{
  id v4 = a3;
  if ((id)[(HSProxCardCoordinator *)self launchReason] == (id)1)
  {
    unsigned int v5 = [(HSProxCardCoordinator *)self nextUnconfiguredBridgedAccessory];
    if (v5)
    {
      id v6 = [(HSProxCardCoordinator *)self nextUnconfiguredBridgedAccessory];
      unsigned int v7 = [(HSProxCardCoordinator *)self activeTuple];
      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }
  unsigned int v9 = [v4 addedAccessory];
  if (([v9 isBridged] & 1) == 0
    && (objc_msgSend(v9, "hf_isNetworkRouter") & 1) == 0)
  {
    id v10 = [v9 hf_bridgedAccessories];
    if (objc_msgSend(v9, "hf_isSprinkler"))
    {
      uint64_t v11 = [v10 na_filter:&stru_1000AA9D8];

      id v10 = (void *)v11;
    }
    if ([v10 count]) {
      unsigned __int8 v8 = 0;
    }
  }
  return v8;
}

- (BOOL)stateMachineConfigurationShouldSkipDoneStep:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  id v6 = [v5 configuration];

  if (v6 == v4)
  {
    unsigned int v7 = [(HSProxCardCoordinator *)self bridgedAccessories];
    LOBYTE(self) = v7 != 0;
  }
  else
  {
    LODWORD(self) = ![(HSProxCardCoordinator *)self isConfiguringLastAccessoryOfSameCategory];
  }
  return (char)self;
}

- (BOOL)stateMachineConfigurationShouldSetupBridgedAccessories:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  id v6 = [v5 configuration];

  if (v6 != v4) {
    return 0;
  }
  unsigned __int8 v8 = [(HSProxCardCoordinator *)self nextUnconfiguredBridgedAccessory];
  BOOL v7 = v8 != 0;

  return v7;
}

- (BOOL)stateMachineConfigurationShouldSetupRouters:(id)a3
{
  id v4 = [a3 addedAccessory];
  if (objc_msgSend(v4, "hf_isNetworkRouter")) {
    BOOL v5 = [(HSProxCardCoordinator *)self isConfiguringLastAccessoryOfSameCategory];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)stateMachineConfigurationShouldJumpToDoneStep:(id)a3
{
  id v4 = a3;
  if ((id)[(HSProxCardCoordinator *)self launchReason] == (id)1)
  {
    BOOL v5 = [v4 addedAccessory];
    if (v5)
    {
      id v6 = [v4 addedAccessory];
      BOOL v7 = [v6 pendingConfigurationIdentifier];
      BOOL v8 = [v7 length] == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isInSetupContext
{
  int64_t v2 = [(HSProxCardCoordinator *)self launchReason];

  return +[HUHomeUIServiceLaunchUserInfo isInSetupContext:v2];
}

- (id)_discoveredAccessoryOrSetupCodeDidUpdateFromViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NAFuture futureWithNoResult];
  id v6 = [(HSProxCardCoordinator *)self discoveredAccessory];

  if (!v6)
  {
LABEL_9:
    id v15 = v5;
    BOOL v5 = v15;
    goto LABEL_20;
  }
  BOOL v7 = [(HSProxCardCoordinator *)self discoveredAccessory];
  if ([v7 requiresSetupCode])
  {
    BOOL v8 = [(HSProxCardCoordinator *)self setupCode];
    BOOL v9 = [v8 length] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  id v10 = [(HSProxCardCoordinator *)self topAccessoryTuple];
  uint64_t v11 = [v10 configuration];
  unsigned int v12 = [v11 isSetupInitiatedByOtherMatterEcosystem] & v9;

  if (v12 == 1)
  {
    BOOL v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(HSProxCardCoordinator *)self discoveredAccessory];
      *(_DWORD *)buf = 136315394;
      id v44 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]";
      __int16 v45 = 2112;
      id v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s setup code required for third-party Matter pairing of discoveredAccessory %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (!v9)
  {
    __int16 v16 = +[NAFuture futureWithNoResult];
    uint64_t v17 = [(HSProxCardCoordinator *)self setupCode];
    __int16 v18 = (void *)v17;
    __int16 v19 = &stru_1000ABBA8;
    if (v17) {
      __int16 v19 = (__CFString *)v17;
    }
    int v20 = v19;

    if ([(HSProxCardCoordinator *)self isUsingCHIPCommunicationProtocol])
    {
      __int16 v21 = [(HSProxCardCoordinator *)self discoveredAccessory];
      [v21 setRawSetupPayloadString:v20];

      objc_initWeak(&location, self);
      int v22 = HFLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [(HSProxCardCoordinator *)self discoveredAccessory];
        *(_DWORD *)buf = 136315650;
        id v44 = "-[HSProxCardCoordinator _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:]";
        __int16 v45 = 2112;
        id v46 = v20;
        __int16 v47 = 2112;
        id v48 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s calling createSetupAccessoryPayloadWithCHIPDecimalStringRepresentation:%@ for discoveredAccessory %@]", buf, 0x20u);
      }
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10003E744;
      v40[3] = &unk_1000AAA20;
      unsigned int v24 = v20;
      id v41 = v24;
      __int16 v25 = +[NAFuture futureWithCompletionHandlerAdapterBlock:v40];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10003E7D8;
      v36[3] = &unk_1000AAA48;
      objc_copyWeak(&v39, &location);
      uint64_t v37 = v24;
      id v38 = v4;
      unsigned int v26 = [v25 flatMap:v36];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      id v27 = [objc_alloc((Class)HMSetupAccessoryPayload) initWithHAPSetupCode:v20];
      unsigned int v26 = +[NAFuture futureWithResult:v27];
    }
    objc_initWeak((id *)buf, self);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10003E9B4;
    v33[3] = &unk_1000AAA70;
    objc_copyWeak(&v35, (id *)buf);
    id v28 = v20;
    id v34 = v28;
    uint64_t v29 = [v26 flatMap:v33];

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);

    BOOL v5 = (void *)v29;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10003EC60;
  v32[3] = &unk_1000A9628;
  v32[4] = self;
  id v15 = [v5 flatMap:v32];
LABEL_20:
  __int16 v30 = v15;

  return v30;
}

- (void)setSetupCode:(id)a3
{
  id v4 = [a3 hf_extractDecimalDigits];
  uint64_t v5 = 1;
  if ([v4 length] == (id)8) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(HSProxCardCoordinator *)self setAccessoryCommunicationProtocol:v6];
  id v7 = [v4 length];
  uint64_t v8 = 3;
  uint64_t v9 = 2;
  if (v7 != (id)11) {
    uint64_t v9 = 0;
  }
  if (v7 != (id)21) {
    uint64_t v8 = v9;
  }
  if (v7 != (id)8) {
    uint64_t v5 = v8;
  }
  id v10 = +[HSAccessoryPairingEventLogger sharedLogger];
  [v10 logCodeInputMethod:v5];

  setupCode = self->_setupCode;
  self->_setupCode = (NSString *)v4;
}

- (int64_t)accessoryCommunicationProtocol
{
  int64_t result = self->_accessoryCommunicationProtocol;
  if (!result)
  {
    id v4 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
    uint64_t v5 = [v4 setupAccessoryPayload];
    self->_accessoryCommunicationProtocol = (int64_t)[v5 communicationProtocol];

    return self->_accessoryCommunicationProtocol;
  }
  return result;
}

- (id)didReceiveDiscoveredAccessory:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_discoveredAccessory, a3);
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromSelector(a2);
    uint64_t v9 = [(HSProxCardCoordinator *)self setupCode];
    id v10 = [v6 accessory];
    unsigned int v11 = [v10 knownToSystemCommissioner];
    unsigned int v12 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
    *(_DWORD *)buf = 138413314;
    id v51 = v8;
    __int16 v52 = 2112;
    id v53 = v6;
    __int16 v54 = 2112;
    objc_super v55 = v9;
    __int16 v56 = 1024;
    unsigned int v57 = v11;
    __int16 v58 = 1024;
    unsigned int v59 = [v12 isSetupInitiatedByOtherMatterEcosystem];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ discoveredAccessory %@ setupCode %@ knownToSystemCommissioner %d isSetupInitiatedByOtherMatterEcosystem %d", buf, 0x2Cu);
  }
  if (!v6)
  {
    uint64_t v32 = +[NAFuture futureWithNoResult];
LABEL_16:
    id v33 = (void *)v32;
    goto LABEL_25;
  }
  BOOL v13 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  BOOL v14 = [(HSProxCardCoordinator *)self discoveredAccessory];
  id v15 = [v14 category];
  [v13 updateAccessoryCategory:v15];

  __int16 v16 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  uint64_t v17 = [(HSProxCardCoordinator *)self discoveredAccessory];
  __int16 v18 = [(id)v17 name];
  [v16 updateAccessoryName:v18];

  __int16 v19 = [v6 accessory];
  LOBYTE(v17) = [v19 knownToSystemCommissioner];

  if ((v17 & 1) == 0)
  {
    uint64_t v32 = [(HSProxCardCoordinator *)self _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:0];
    goto LABEL_16;
  }
  int v20 = [v6 accessory];
  __int16 v21 = [v20 deviceIdentifier];

  int v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v51 = v23;
    __int16 v52 = 2112;
    id v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ discovered Matter accessory is known to system commissioner with identifier %@", buf, 0x16u);
  }
  [(HSProxCardCoordinator *)self setAccessoryCommunicationProtocol:2];
  unsigned int v24 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  unsigned int v25 = [v24 isSetupInitiatedByOtherMatterEcosystem];

  if (v25)
  {
    uint64_t v26 = objc_opt_class();
    id v27 = [(HSProxCardCoordinator *)self activeTuple];
    id v28 = [v27 configuration];
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 0;
      }
      id v30 = v29;
      if (!v30)
      {
        v42 = +[NSAssertionHandler currentHandler];
        unsigned int v31 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v42 handleFailureInFunction:v31, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v26, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v30 = 0;
    }

    [v30 setStagedCHIPPairingIdentifier:v21];
    id v39 = HFLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v51 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@ set pairing identifier on setup configuration; will skip staging",
        buf,
        0xCu);
    }
    id v33 = [(HSProxCardCoordinator *)self _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:0];
  }
  else
  {
    id v34 = HFLogForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v51 = v35;
      __int16 v52 = 2112;
      id v53 = v21;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@ calling createCHIPSetupPayloadStringForStagedPairingWithIdentifier:%@", buf, 0x16u);
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10003F414;
    v48[3] = &unk_1000AAA20;
    id v49 = v21;
    id v36 = +[NAFuture futureWithCompletionHandlerAdapterBlock:v48];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10003F4A8;
    v44[3] = &unk_1000AAAC0;
    SEL v47 = a2;
    id v45 = v6;
    id v46 = self;
    uint64_t v37 = [v36 flatMap:v44];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10003FA1C;
    v43[3] = &unk_1000AAAE0;
    v43[4] = a2;
    id v38 = [v37 recover:v43];
    [(HSProxCardCoordinator *)self setMatterSetupPairingWindowReadyFuture:v38];

    id v33 = +[NAFuture futureWithNoResult];

    id v30 = v49;
  }

LABEL_25:

  return v33;
}

- (id)didReceiveSetupCode:(id)a3 fromViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(HSProxCardCoordinator *)self setSetupCode:v7];
  uint64_t v9 = [(HSProxCardCoordinator *)self setupCode];
  id v10 = [(HSProxCardCoordinator *)self discoveredAccessory];

  if (v10)
  {
    unsigned int v11 = [(HSProxCardCoordinator *)self discoveredAccessory];
    unsigned int v12 = [v11 rawSetupPayloadString];

    if ([v12 length])
    {
      BOOL v13 = +[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:v12];
      id v14 = [v13 integerValue];

      [(HSProxCardCoordinator *)self setAccessoryCommunicationProtocol:v14];
    }
  }
  id v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = NSStringFromSelector(a2);
    int64_t v17 = [(HSProxCardCoordinator *)self accessoryCommunicationProtocol];
    __int16 v18 = [(HSProxCardCoordinator *)self discoveredAccessory];
    *(_DWORD *)buf = 138413314;
    id v27 = v16;
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    unsigned int v31 = v9;
    __int16 v32 = 2048;
    int64_t v33 = v17;
    __int16 v34 = 2112;
    id v35 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ receivedSetupCode %@ setupCode %@ accessoryCommunicationProtocol %ld discoveredAccessory %@", buf, 0x34u);
  }
  if (v9)
  {
    __int16 v19 = [(HSProxCardCoordinator *)self _discoveredAccessoryOrSetupCodeDidUpdateFromViewController:v8];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10003FD54;
    v22[3] = &unk_1000AAB58;
    v22[4] = self;
    SEL v25 = a2;
    id v23 = v9;
    id v24 = v8;
    int v20 = [v19 flatMap:v22];
  }
  else
  {
    int v20 = +[NAFuture futureWithNoResult];
  }

  return v20;
}

- (void)updateSetupAccessoryDescriptionWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HSProxCardCoordinator *)self setupAccessoryDescription];
  [v5 updateWithSetupAccessoryPayload:v4];

  id v6 = [v4 setupPayloadURL];

  id v7 = [v6 absoluteString];
  id v8 = +[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:v7];
  id v9 = [v8 integerValue];

  [(HSProxCardCoordinator *)self setAccessoryCommunicationProtocol:v9];
}

- (id)showCustomCommissioningFlowAlertIfNecessaryForPayload:(id)a3 onViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[HSProxCardCoordinator didShowCustomCommissioningFlowAlertIfNecessary](self, "didShowCustomCommissioningFlowAlertIfNecessary")|| (-[HSProxCardCoordinator setDidShowCustomCommissioningFlowAlertIfNecessary:](self, "setDidShowCustomCommissioningFlowAlertIfNecessary:", 1), ([v6 requiresMatterCustomCommissioningFlow] & 1) == 0))
  {
    id v8 = +[NAFuture futureWithResult:v6];
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100040768;
    v10[3] = &unk_1000A9600;
    id v11 = v6;
    id v12 = v7;
    id v8 = +[NAFuture futureWithBlock:v10];
  }

  return v8;
}

- (HSProxCardCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSProxCardCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)setupSpecificAccessory
{
  return self->_setupSpecificAccessory;
}

- (void)setAccessoryCommunicationProtocol:(int64_t)a3
{
  self->_accessoryCommunicationProtocol = a3;
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (HFAccessoryBrowsingManager)accessoryBrowser
{
  return self->_accessoryBrowser;
}

- (void)setAccessoryBrowser:(id)a3
{
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (NSUUID)suggestedRoomUUID
{
  return self->_suggestedRoomUUID;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void)setSetupAccessoryDescription:(id)a3
{
}

- (HSAccessoryTuple)topAccessoryTuple
{
  return self->_topAccessoryTuple;
}

- (void)setTopAccessoryTuple:(id)a3
{
}

- (HSAccessoryTuple)activeTuple
{
  return self->_activeTuple;
}

- (void)setActiveTuple:(id)a3
{
}

- (HSAccessoryPairingFuture)pairingFuture
{
  return self->_pairingFuture;
}

- (void)setPairingFuture:(id)a3
{
}

- (NSArray)bridgedAccessories
{
  return self->_bridgedAccessories;
}

- (void)setBridgedAccessories:(id)a3
{
}

- (NSString)setupCode
{
  return self->_setupCode;
}

- (HFDiscoveredAccessory)discoveredAccessory
{
  return self->_discoveredAccessory;
}

- (NAFuture)matterSetupPairingWindowReadyFuture
{
  return self->_matterSetupPairingWindowReadyFuture;
}

- (void)setMatterSetupPairingWindowReadyFuture:(id)a3
{
}

- (BOOL)retryFlag
{
  return self->_retryFlag;
}

- (void)setRetryFlag:(BOOL)a3
{
  self->_retryFlag = a3;
}

- (unint64_t)pairingState
{
  return self->_pairingState;
}

- (void)setPairingState:(unint64_t)a3
{
  self->_pairingState = a3;
}

- (NSDictionary)bridgedAccessoryCategoryToArrayMap
{
  return self->_bridgedAccessoryCategoryToArrayMap;
}

- (void)setBridgedAccessoryCategoryToArrayMap:(id)a3
{
}

- (BOOL)userDidSelectAccessories
{
  return self->_userDidSelectAccessories;
}

- (void)setUserDidSelectAccessories:(BOOL)a3
{
  self->_userDidSelectAccessories = a3;
}

- (BOOL)didShowCustomCommissioningFlowAlertIfNecessary
{
  return self->_didShowCustomCommissioningFlowAlertIfNecessary;
}

- (void)setDidShowCustomCommissioningFlowAlertIfNecessary:(BOOL)a3
{
  self->_didShowCustomCommissioningFlowAlertIfNecessary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedAccessoryCategoryToArrayMap, 0);
  objc_storeStrong((id *)&self->_matterSetupPairingWindowReadyFuture, 0);
  objc_storeStrong((id *)&self->_discoveredAccessory, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
  objc_storeStrong((id *)&self->_bridgedAccessories, 0);
  objc_storeStrong((id *)&self->_pairingFuture, 0);
  objc_storeStrong((id *)&self->_activeTuple, 0);
  objc_storeStrong((id *)&self->_topAccessoryTuple, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_suggestedRoomUUID, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);
  objc_storeStrong((id *)&self->_accessoryBrowser, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)requiresDismissalConfirmation
{
  int64_t v2 = self;
  v3 = [(HSProxCardCoordinator *)self activeTuple];
  LOBYTE(v2) = [(HSProxCardCoordinator *)v2 requiresDismissalConfirmation:v3];

  return (char)v2;
}

- (BOOL)requiresDismissalConfirmation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stateMachine];
  id v6 = [v4 currentStep];
  id v7 = [v4 configuration];

  LOBYTE(self) = [v5 stepRequiresDismissalConfirmation:v6 withCoordinator:self configuration:v7];
  return (char)self;
}

- (BOOL)requiresIdentifyButton
{
  int64_t v2 = self;
  v3 = [(HSProxCardCoordinator *)self activeTuple];
  LOBYTE(v2) = [(HSProxCardCoordinator *)v2 requiresIdentifyButton:v3];

  return (char)v2;
}

- (BOOL)requiresIdentifyButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 accessory];
  if (objc_msgSend(v5, "hf_isIdentifiable"))
  {
    id v6 = [v4 stateMachine];
    id v7 = [v4 currentStep];
    id v8 = [v4 configuration];
    unsigned __int8 v9 = [v6 stepRequiresIdentifyButton:v7 withCoordinator:self configuration:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isUsingCHIPCommunicationProtocol
{
  return (id)[(HSProxCardCoordinator *)self accessoryCommunicationProtocol] == (id)2;
}

- (BOOL)isUsingHAPCommunicationProtocol
{
  return (id)[(HSProxCardCoordinator *)self accessoryCommunicationProtocol] == (id)1;
}

@end