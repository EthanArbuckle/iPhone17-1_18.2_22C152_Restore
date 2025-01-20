@interface HAPAccessoryServer
- (BOOL)doesPeriodicSessionChecks;
- (BOOL)hasAdvertisement;
- (BOOL)hasPairings;
- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3;
- (BOOL)isBLELinkConnected;
- (BOOL)isIncompatibleUpdate;
- (BOOL)isKnownToSystemCommissioner;
- (BOOL)isPaired;
- (BOOL)isPinging;
- (BOOL)isReachable;
- (BOOL)isSecuritySessionOpen;
- (BOOL)isSessionRestoreActive;
- (BOOL)matchesSetupID:(id)a3;
- (BOOL)matchesSetupID:(id)a3 serverIdentifier:(id)a4;
- (BOOL)notifyClients:(unint64_t)a3 withDictionary:(id)a4;
- (BOOL)pingSupported;
- (BOOL)reachabilityPingEnabled;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)requiresThreadRouter;
- (BOOL)requiresTimedWrite:(id)a3;
- (BOOL)securitySessionWillCloseWithResponseData:(id)a3 error:(id *)a4;
- (BOOL)shouldDisconnectOnIdle;
- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)supportsTimedWrite;
- (BOOL)supportsUnreachablePing;
- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5;
- (BOOL)unitTest_useHH2;
- (BOOL)useHH2;
- (HAPAccessory)primaryAccessory;
- (HAPAccessoryPairingRequest)pairingRequest;
- (HAPAccessoryServer)init;
- (HAPAccessoryServer)initWithKeystore:(id)a3;
- (HAPAccessoryServerDelegate)delegate;
- (HAPDeviceID)deviceID;
- (HAPKeyBag)keyBag;
- (HAPKeyStore)keyStore;
- (HAPSuspendedAccessory)suspendedAccessory;
- (HMFActivity)pairingActivity;
- (HMFVersion)version;
- (NSArray)accessories;
- (NSData)rootPublicKey;
- (NSData)setupHash;
- (NSDate)connectionStartTime;
- (NSDictionary)pairingMetricDictionary;
- (NSHashTable)internalDelegates;
- (NSHashTable)notificationClients;
- (NSMutableDictionary)localPairingMetricDictionary;
- (NSNumber)category;
- (NSNumber)nodeID;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)identifier;
- (NSString)metric_pairVerifyConnectionEstablishedBy;
- (NSString)metric_pairVerifyReason;
- (NSString)name;
- (NSString)productData;
- (NSString)reachabilityChangedReason;
- (NSUUID)commissioningID;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)internalDelegateQueue;
- (id)buildReachabilityNotificationDictionary:(id)a3 reachable:(BOOL)a4 linkType:(int64_t)a5 withError:(int64_t)a6;
- (id)getControllerPairingIdentityWithError:(id *)a3;
- (id)getControllerUserName;
- (id)shortDescription;
- (int)failedPingCount;
- (int)successfulPingCount;
- (int64_t)communicationProtocol;
- (int64_t)linkLayerType;
- (int64_t)linkType;
- (unint64_t)authMethod;
- (unint64_t)compatibilityFeatures;
- (unint64_t)configNumber;
- (unint64_t)metric_pairVerifyDurationInMS;
- (unint64_t)numActiveSessionClients;
- (unint64_t)pairSetupType;
- (unint64_t)pendingRemovePairing;
- (unint64_t)sessionCheckInterval;
- (unint64_t)stateNumber;
- (unint64_t)wakeNumber;
- (void)addInternalDelegate:(id)a3;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)associateAccessoryWithControllerKey:(id)a3 usingAccessoryPublicKey:(id)a4;
- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3;
- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3;
- (void)authenticateAccessory;
- (void)clearPairingMetrics;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)continuePairingUsingWAC;
- (void)disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3;
- (void)disconnect;
- (void)disconnectWithError:(id)a3;
- (void)discoverAccessories;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)enumerateInternalDelegatesUsingBlock:(id)a3;
- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)incrementFailedPing;
- (void)incrementSuccessfulPing;
- (void)initializeKeyBagIfNecessary;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)provisionToken:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)refreshKeyBag;
- (void)registerForNotifications:(id)a3;
- (void)removeInternalDelegate:(id)a3;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)removePairingIdentifier:(id)a3 pairingPublicKey:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)setAccessories:(id)a3;
- (void)setAuthMethod:(unint64_t)a3;
- (void)setCategory:(id)a3;
- (void)setCompatibilityFeatures:(unint64_t)a3;
- (void)setConfigNumber:(unint64_t)a3;
- (void)setConnectionStartTime:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setFailedPingCount:(int)a3;
- (void)setHasAdvertisement:(BOOL)a3;
- (void)setHasPairings:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncompatibleUpdate:(BOOL)a3;
- (void)setKeyBag:(id)a3;
- (void)setLocalPairingMetricDictionary:(id)a3;
- (void)setMetric_pairVerifyConnectionEstablishedBy:(id)a3;
- (void)setMetric_pairVerifyDurationInMS:(unint64_t)a3;
- (void)setMetric_pairVerifyReason:(id)a3;
- (void)setName:(id)a3;
- (void)setNotificationClients:(id)a3;
- (void)setPairSetupType:(unint64_t)a3;
- (void)setPairingActivity:(id)a3;
- (void)setPairingMetricWithKey:(id)a3 value:(id)a4;
- (void)setPairingRequest:(id)a3;
- (void)setPendingRemovePairing:(unint64_t)a3;
- (void)setPrimaryAccessory:(id)a3;
- (void)setProductData:(id)a3;
- (void)setReachabilityChangedReason:(id)a3;
- (void)setReachabilityPingEnabled:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setSecuritySessionOpen:(BOOL)a3;
- (void)setSessionRestoreActive:(BOOL)a3;
- (void)setSetupHash:(id)a3;
- (void)setShouldDisconnectOnIdle:(BOOL)a3;
- (void)setStateNumber:(unint64_t)a3;
- (void)setSuccessfulPingCount:(int)a3;
- (void)setSupportsTimedWrite:(BOOL)a3;
- (void)setSupportsUnreachablePing:(BOOL)a3;
- (void)setSuspendedAccessory:(id)a3;
- (void)setUnitTest_useHH2:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)setWakeNumber:(unint64_t)a3;
- (void)startPairingWithConsentRequired:(BOOL)a3 config:(id)a4 ownershipToken:(id)a5;
- (void)startPairingWithRequest:(id)a3;
- (void)startPing;
- (void)stopPing;
- (void)submitPairVerifyMetricWithError:(id)a3;
- (void)tearDownSessionOnAuthCompletion;
- (void)unregisterForNotifications:(id)a3;
- (void)updateAccessoryInfoDictionary:(id)a3;
- (void)validatePairingAuthMethod:(id)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HAPAccessoryServer

void __42__HAPAccessoryServer_addInternalDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalDelegates];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)internalDelegates
{
  return self->_internalDelegates;
}

- (unint64_t)wakeNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t wakeNumber = self->_wakeNumber;
  os_unfair_lock_unlock(p_lock);
  return wakeNumber;
}

- (int64_t)communicationProtocol
{
  return 1;
}

- (id)shortDescription
{
  BOOL v3 = HAPIsInternalBuild();
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(HAPAccessoryServer *)self identifier];
  v7 = (void *)v6;
  if (v3)
  {
    v8 = [(HAPAccessoryServer *)self name];
    v9 = [v4 stringWithFormat:@"%@ %@ %@", v5, v7, v8];
  }
  else
  {
    v9 = [v4 stringWithFormat:@"%@ %@", v5, v6];
  }

  return v9;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)identifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)addInternalDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self internalDelegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HAPAccessoryServer_addInternalDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)internalDelegateQueue
{
  return self->_internalDelegateQueue;
}

- (unint64_t)configNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t configNumber = self->_configNumber;
  os_unfair_lock_unlock(p_lock);
  return configNumber;
}

- (BOOL)isKnownToSystemCommissioner
{
  return 0;
}

- (NSArray)accessories
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_accessories copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (HMFVersion)version
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(HMFVersion *)self->_version copy];
  os_unfair_lock_unlock(p_lock);

  return (HMFVersion *)v4;
}

- (void)setPrimaryAccessory:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSData)setupHash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_setupHash;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isSecuritySessionOpen
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_securitySessionOpen;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isReachable
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)productData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_productData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HAPAccessoryServerDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HAPAccessoryServerDelegate *)WeakRetained;
}

- (void)setAccessories:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  accessories = self->_accessories;
  self->_accessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldDisconnectOnIdle == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldDisconnectOnIdle = v3;
    os_unfair_lock_unlock(p_lock);
    [(HAPAccessoryServer *)self disconnectOnIdleUpdated];
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id obj = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  p_delegate = &self->_delegate;
  if (obj && v6)
  {
    objc_storeWeak((id *)p_delegate, obj);
    id v8 = (OS_dispatch_queue *)v6;
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v8;
  }
  else
  {
    objc_storeWeak((id *)p_delegate, 0);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric_pairVerifyConnectionEstablishedBy, 0);
  objc_storeStrong((id *)&self->_metric_pairVerifyReason, 0);
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_pairingRequest, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_suspendedAccessory, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegateQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegates, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
  objc_storeStrong((id *)&self->_localPairingMetricDictionary, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_connectionStartTime, 0);
  objc_storeStrong((id *)&self->_reachabilityChangedReason, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_notificationClients, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setMetric_pairVerifyConnectionEstablishedBy:(id)a3
{
}

- (NSString)metric_pairVerifyConnectionEstablishedBy
{
  return self->_metric_pairVerifyConnectionEstablishedBy;
}

- (void)setMetric_pairVerifyReason:(id)a3
{
}

- (NSString)metric_pairVerifyReason
{
  return self->_metric_pairVerifyReason;
}

- (void)setMetric_pairVerifyDurationInMS:(unint64_t)a3
{
  self->_metric_pairVerifyDurationInMS = a3;
}

- (unint64_t)metric_pairVerifyDurationInMS
{
  return self->_metric_pairVerifyDurationInMS;
}

- (void)setPairingActivity:(id)a3
{
}

- (HMFActivity)pairingActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingActivity);

  return (HMFActivity *)WeakRetained;
}

- (void)setPairingRequest:(id)a3
{
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  return self->_pairingRequest;
}

- (void)setKeyBag:(id)a3
{
}

- (HAPKeyBag)keyBag
{
  return self->_keyBag;
}

- (HAPKeyStore)keyStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);

  return (HAPKeyStore *)WeakRetained;
}

- (void)setIncompatibleUpdate:(BOOL)a3
{
  self->_incompatibleUpdate = a3;
}

- (BOOL)isIncompatibleUpdate
{
  return self->_incompatibleUpdate;
}

- (HAPSuspendedAccessory)suspendedAccessory
{
  return self->_suspendedAccessory;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setUnitTest_useHH2:(BOOL)a3
{
  self->_unitTest_useHH2 = a3;
}

- (BOOL)unitTest_useHH2
{
  return self->_unitTest_useHH2;
}

- (BOOL)isBLELinkConnected
{
  return self->_bleLinkConnected;
}

- (void)setSupportsTimedWrite:(BOOL)a3
{
  self->_supportsTimedWrite = a3;
}

- (BOOL)supportsTimedWrite
{
  return self->_supportsTimedWrite;
}

- (int64_t)linkLayerType
{
  return self->_linkLayerType;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (HAPAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setLocalPairingMetricDictionary:(id)a3
{
}

- (NSMutableDictionary)localPairingMetricDictionary
{
  return self->_localPairingMetricDictionary;
}

- (void)setSupportsUnreachablePing:(BOOL)a3
{
  self->_supportsUnreachablePing = a3;
}

- (BOOL)supportsUnreachablePing
{
  return self->_supportsUnreachablePing;
}

- (void)setFailedPingCount:(int)a3
{
  self->_failedPingCount = a3;
}

- (int)failedPingCount
{
  return self->_failedPingCount;
}

- (void)setSuccessfulPingCount:(int)a3
{
  self->_successfulPingCount = a3;
}

- (int)successfulPingCount
{
  return self->_successfulPingCount;
}

- (void)setNotificationClients:(id)a3
{
}

- (NSHashTable)notificationClients
{
  return self->_notificationClients;
}

- (BOOL)useHH2
{
  if ([(HAPAccessoryServer *)self unitTest_useHH2]) {
    return 1;
  }
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  return HAPIsHH2Enabled_hh2Enabled;
}

- (BOOL)securitySessionWillCloseWithResponseData:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    if ([v6 length])
    {
      id v8 = *a4;
      v9 = [MEMORY[0x1E4F28C58] errorWithOSStatus:4294960542];
      LOBYTE(v8) = [v8 isEqual:v9];

      if ((v8 & 1) == 0)
      {
        v12 = +[HAPTLVParser parserWithData:v7];
        v13 = [v12 parseResponseForNumber:6];
        v14 = [v12 parseResponseForNumber:7];
        id v15 = *a4;
        v16 = [MEMORY[0x1E4F28C58] errorWithOSStatus:4294960596];
        if ([v15 isEqual:v16])
        {
          int v17 = [v13 unsignedCharValue];

          if (v17 == 3) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        id v18 = *a4;
        v19 = [MEMORY[0x1E4F28C58] errorWithOSStatus:4294960569];
        LODWORD(v18) = [v18 isEqual:v19];

        if (!v18) {
          goto LABEL_20;
        }
        if (v13)
        {
          BOOL v10 = 1;
          if ([v13 unsignedIntValue] != 4 || !v14) {
            goto LABEL_21;
          }
        }
        else if (!v14)
        {
LABEL_20:
          BOOL v10 = 1;
LABEL_21:

          goto LABEL_5;
        }
        if ([&unk_1F2C80E80 containsObject:v14])
        {
LABEL_17:
          v20 = (void *)MEMORY[0x1D944E080]();
          v21 = self;
          v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = HMFGetLogIdentifier();
            id v24 = *a4;
            int v25 = 138543618;
            v26 = v23;
            __int16 v27 = 2112;
            id v28 = v24;
            _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Overwriting the security session error code: %@", (uint8_t *)&v25, 0x16u);
          }
          [MEMORY[0x1E4F28C58] errorWithOSStatus:4294960542];
          BOOL v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
  }
  BOOL v10 = 0;
LABEL_5:

  return v10;
}

- (unint64_t)numActiveSessionClients
{
  return 0;
}

- (unint64_t)sessionCheckInterval
{
  return 0;
}

- (BOOL)doesPeriodicSessionChecks
{
  return 0;
}

- (void)disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
    uint64_t v5 = [(HAPAccessoryServer *)self keyBag];
    id v6 = [v5 currentIdentity];
    v7 = [v6 identifier];
    BOOL v8 = [(HAPAccessoryServer *)self isAccessoryAssociatedWithControllerKey:v7];

    if (v8)
    {
      v9 = [(HAPAccessoryServer *)self keyStore];
      id v16 = 0;
      BOOL v10 = [v9 readPublicKeyForAccessoryName:v4 registeredWithHomeKit:0 error:&v16];
      id v11 = v16;

      if (!v10 || v11)
      {
        v12 = (void *)MEMORY[0x1D944E080]();
        v13 = self;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v18 = v15;
          __int16 v19 = 2112;
          id v20 = v11;
          _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);
        }
      }
      else
      {
        [(HAPAccessoryServer *)self associateAccessoryWithControllerKey:0 usingAccessoryPublicKey:v10];
        [(HAPAccessoryServer *)self refreshKeyBag];
      }
    }
  }
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    uint64_t v5 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServer *)self initializeKeyBagIfNecessary]);
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = HMFGetLogIdentifier();
      v9 = [(HAPAccessoryServer *)v6 keyBag];
      BOOL v10 = [v9 currentIdentity];
      id v11 = [v10 identifier];
      *(_DWORD *)buf = 138543618;
      int v25 = v8;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@PV Succeeded using [%{public}@]", buf, 0x16u);
    }
    v12 = [(HAPAccessoryServer *)v6 keyBag];
    v13 = [v12 currentIdentity];
    v14 = [v13 identifier];
    BOOL v15 = [(HAPAccessoryServer *)v6 isAccessoryAssociatedWithControllerKey:v14];

    if (!v15)
    {
      id v16 = [(HAPAccessoryServer *)v6 keyStore];
      id v23 = 0;
      int v17 = [v16 readPublicKeyForAccessoryName:v4 registeredWithHomeKit:0 error:&v23];
      id v18 = v23;

      if (!v17 || v18)
      {
        __int16 v19 = (void *)MEMORY[0x1D944E080]();
        id v20 = v6;
        uint64_t v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          int v25 = v22;
          __int16 v26 = 2112;
          id v27 = v18;
          _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);
        }
      }
      else
      {
        [(HAPAccessoryServer *)v6 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v17];
      }
    }
  }
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3
{
  id v9 = a3;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
    id v4 = [(HAPAccessoryServer *)self pairingRequest];
    uint64_t v5 = [v4 pairingIdentity];
    if (v5)
    {
      id v6 = (void *)v5;
    }
    else
    {
      v7 = [(HAPAccessoryServer *)self keyBag];
      id v6 = [v7 currentIdentity];

      if (!v6) {
        goto LABEL_6;
      }
    }
    BOOL v8 = [v6 identifier];
    [(HAPAccessoryServer *)self associateAccessoryWithControllerKey:v8 usingAccessoryPublicKey:v9];
  }
LABEL_6:
}

- (void)associateAccessoryWithControllerKey:(id)a3 usingAccessoryPublicKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (HAPPairingIdentity *)a3;
  id v7 = a4;
  if ([(HAPAccessoryServer *)self useHH2])
  {
    BOOL v8 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServer *)self initializeKeyBagIfNecessary]);
    id v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Establishing relationship with controller key: [%@]", buf, 0x16u);
    }
    v12 = [HAPPairingIdentity alloc];
    v13 = [(HAPAccessoryServer *)v9 identifier];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v7];
    BOOL v15 = [(HAPPairingIdentity *)v12 initWithIdentifier:v13 controllerKeyIdentifier:v6 publicKey:v14 privateKey:0 permissions:0];

    id v16 = [(HAPAccessoryServer *)v9 keyStore];
    id v24 = 0;
    int v17 = [v16 establishRelationshipBetweenAccessoryAndControllerKey:v15 error:&v24];
    id v18 = v24;

    if (!v17 || v18)
    {
      id v20 = (void *)MEMORY[0x1D944E080]();
      uint64_t v21 = v9;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v26 = v23;
        __int16 v27 = 2112;
        uint64_t v28 = v15;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the accessory public key inside KeyChain: %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v19 = [(HAPAccessoryServer *)v9 pairingRequest];

      if (v19) {
        [(HAPAccessoryServer *)v9 refreshKeyBag];
      }
    }
  }
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self keyStore];
  id v6 = [(HAPAccessoryServer *)self identifier];
  id v11 = 0;
  int v7 = [v5 isAccessoryAssociatedWithControllerKey:v6 controllerID:&v11];
  id v8 = v11;

  if (v7) {
    char v9 = [v4 isEqualToString:v8];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HAPAccessoryServer *)self useHH2];
  BOOL v6 = 0;
  if (v4 && v5)
  {
    int v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = HMFGetLogIdentifier();
      int v30 = 138543618;
      v31 = v10;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@PV failed with error: %@", (uint8_t *)&v30, 0x16u);
    }
    id v11 = [v4 userInfo];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (v14
      && ([v14 domain],
          BOOL v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = HMFEqualObjects(),
          v15,
          v16)
      && [v14 code] == -6754)
    {
      int v17 = [(HAPAccessoryServer *)v8 identifier];
      [(HAPAccessoryServer *)v8 disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:v17];

      id v18 = [(HAPAccessoryServer *)v8 keyBag];
      __int16 v19 = [v18 nextIdentity];

      BOOL v6 = v19 != 0;
      id v20 = (void *)MEMORY[0x1D944E080]();
      uint64_t v21 = v8;
      v22 = HMFGetOSLogHandle();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v23)
        {
          id v24 = HMFGetLogIdentifier();
          int v25 = NSNumber;
          __int16 v26 = [(HAPAccessoryServer *)v21 keyBag];
          __int16 v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "getCurrentIndexInBag"));
          int v30 = 138543874;
          v31 = v24;
          __int16 v32 = 2112;
          id v33 = v27;
          __int16 v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Going to retry PV with next pairing Identity [%@]: %@", (uint8_t *)&v30, 0x20u);
        }
      }
      else
      {
        if (v23)
        {
          uint64_t v29 = HMFGetLogIdentifier();
          int v30 = 138543362;
          v31 = v29;
          _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Not retrying PV as exhausted all the keys from the key bag.", (uint8_t *)&v30, 0xCu);
        }
        [(HAPAccessoryServer *)v21 refreshKeyBag];
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (void)refreshKeyBag
{
  id v2 = [(HAPAccessoryServer *)self keyBag];
  [v2 refreshKeys];
}

- (void)initializeKeyBagIfNecessary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_keyBag)
  {
    if (!self->_identifier)
    {
      _HMFPreconditionFailure();
      __break(1u);
      return;
    }
    id v4 = [HAPKeyBag alloc];
    identifier = self->_identifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);
    int v7 = [(HAPKeyBag *)v4 initWithAccessoryIdentifier:identifier keyStore:WeakRetained];
    keyBag = self->_keyBag;
    self->_keyBag = v7;
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)getControllerPairingIdentityWithError:(id *)a3
{
  if (![(HAPAccessoryServer *)self useHH2]
    || ([(HAPAccessoryServer *)self keyBag],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 currentIdentity],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    int v7 = [(HAPAccessoryServer *)self keyStore];
    id v8 = [(HAPAccessoryServer *)self identifier];
    BOOL v6 = [v7 readControllerPairingKeyForAccessory:v8 error:a3];
  }

  return v6;
}

- (id)getControllerUserName
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  BOOL v3 = [(HAPAccessoryServer *)self getControllerPairingIdentityWithError:&v11];
  id v4 = v11;
  BOOL v5 = 0;
  if (!v4)
  {
    BOOL v5 = [v3 identifier];
  }
  BOOL v6 = (void *)MEMORY[0x1D944E080]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v13 = v9;
    __int16 v14 = 2112;
    BOOL v15 = v5;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Using default controller username : %@", buf, 0x16u);
  }

  return v5;
}

- (void)disconnect
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  BOOL v5 = NSStringFromSelector(a2);
  BOOL v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)disconnectWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  id v12 = a3;
  if ([(HAPAccessoryServer *)self metric_pairVerifyDurationInMS])
  {
    id v4 = [(HAPAccessoryServer *)self metric_pairVerifyReason];

    if (v4)
    {
      BOOL v5 = [HAPMetricsPairVerifyEvent alloc];
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HAPAccessoryServer linkType](self, "linkType"));
      unint64_t v7 = [(HAPAccessoryServer *)self metric_pairVerifyDurationInMS];
      id v8 = [(HAPAccessoryServer *)self metric_pairVerifyReason];
      char v9 = [(HAPAccessoryServer *)self metric_pairVerifyConnectionEstablishedBy];
      id v10 = [(HAPMetricsPairVerifyEvent *)v5 initWithAccessory:self forLinkType:v6 durationInMS:v7 reason:v8 connectionEstablishedUsing:v9 pvError:v12];

      id v11 = +[HAPMetricsDispatcher sharedInstance];
      [v11 submitLogEvent:v10];
    }
  }
  [(HAPAccessoryServer *)self setMetric_pairVerifyDurationInMS:0];
  [(HAPAccessoryServer *)self setMetric_pairVerifyReason:0];
}

- (void)updateAccessoryInfoDictionary:(id)a3
{
  id v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSArray *)self->_accessories count])
  {
    BOOL v5 = [(NSArray *)self->_accessories objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 manufacturer];
    unint64_t v7 = [v5 productData];
    id v8 = self->_category;
    char v9 = [v5 firmwareVersion];

    os_unfair_lock_unlock(p_lock);
    if (v6) {
      [v11 setObject:v6 forKey:@"manufacturer"];
    }
    id v10 = v11;
    if (v7)
    {
      [v11 setObject:v7 forKey:@"product"];
      id v10 = v11;
    }
    if (v9)
    {
      [v11 setObject:v9 forKey:@"firmwareVersion"];
      id v10 = v11;
    }
    if (v8) {
      [v10 setObject:v8 forKey:@"category"];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v8 = 0;
    char v9 = 0;
    unint64_t v7 = 0;
    uint64_t v6 = 0;
  }
}

- (void)incrementFailedPing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_failedPingCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementSuccessfulPing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_successfulPingCount;

  os_unfair_lock_unlock(p_lock);
}

- (id)buildReachabilityNotificationDictionary:(id)a3 reachable:(BOOL)a4 linkType:(int64_t)a5 withError:(int64_t)a6
{
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = v10;
  if (v10
    && ([v10 identifier], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __int16 v14 = [NSNumber numberWithBool:v8];
    [v13 setObject:v14 forKeyedSubscript:@"HAPAccessoryReachable"];

    [v13 setObject:v11 forKeyedSubscript:@"HAPAccessoryInstance"];
    BOOL v15 = [v11 identifier];
    [v13 setObject:v15 forKeyedSubscript:@"HAPAccessoryIdentifier"];

    uint64_t v16 = [NSNumber numberWithInt:a5];
    [v13 setObject:v16 forKeyedSubscript:@"HAPAccessoryLinkType"];

    int v17 = [NSNumber numberWithInt:a6];
    [v13 setObject:v17 forKeyedSubscript:@"HAPAccessoryError"];

    id v18 = [v11 instanceID];

    if (v18)
    {
      __int16 v19 = [v11 instanceID];
      [v13 setObject:v19 forKeyedSubscript:@"HAPAccessoryInstanceID"];
    }
    id v20 = (void *)[v13 copy];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1D944E080]();
    v22 = self;
    BOOL v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      int v26 = 138543618;
      __int16 v27 = v24;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@*** failed to build reachability notify dictionary -- invalid accessory or identifier %@", (uint8_t *)&v26, 0x16u);
    }
    id v20 = 0;
  }

  return v20;
}

- (void)setSuspendedAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_suspendedAccessory, a3);
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    unint64_t v7 = self;
    BOOL v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      char v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating the server's suspended accessory to: '%@'", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)notifyClients:(unint64_t)a3 withDictionary:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    uint64_t v6 = (void *)[(NSHashTable *)notificationClients copy];
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      unint64_t v7 = (void *)MEMORY[0x1D944E080]();
      v35 = self;
      BOOL v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        char v9 = HMFGetLogIdentifier();
        uint64_t v10 = [v6 count];
        id v11 = +[HAPNotification typeToString:a3];
        *(_DWORD *)buf = 138543874;
        v42 = v9;
        __int16 v43 = 2048;
        uint64_t v44 = v10;
        __int16 v45 = 2112;
        v46 = v11;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying %ld clients for %@", buf, 0x20u);
      }
      if (v33)
      {
        __int16 v12 = objc_msgSend(v33, "hmf_numberForKey:", @"HAPAccessoryInstanceID");
      }
      else
      {
        __int16 v12 = 0;
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = v6;
      uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v17)
      {
        char v32 = 0;
        uint64_t v34 = *(void *)v37;
        *(void *)&long long v18 = 138543874;
        long long v29 = v18;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v37 != v34) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              uint64_t v21 = [v20 hapInstanceId];
            }
            else
            {
              uint64_t v21 = 0;
            }
            v22 = (void *)MEMORY[0x1D944E080]();
            BOOL v23 = v35;
            id v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              int v25 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v29;
              v42 = v25;
              __int16 v43 = 2112;
              uint64_t v44 = (uint64_t)v12;
              __int16 v45 = 2112;
              v46 = v21;
              _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@Attempt to notify client dictionary instanceID %@ clientInstanceId %@", buf, 0x20u);
            }
            if (v21) {
              BOOL v26 = v12 != 0;
            }
            else {
              BOOL v26 = 0;
            }
            if (!v26 || (int v27 = [v21 intValue], v27 == objc_msgSend(v12, "intValue")))
            {
              objc_msgSend(v20, "indicateNotificationFromServer:notifyType:withDictionary:", v23, a3, v33, v29);
              char v32 = 1;
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v17);
      }
      else
      {
        char v32 = 0;
      }

      goto LABEL_33;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  id v13 = (void *)MEMORY[0x1D944E080]();
  uint64_t v14 = self;
  BOOL v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v42 = v16;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Notification client does not exist", buf, 0xCu);
  }
  char v32 = 0;
LABEL_33:

  return v32 & 1;
}

- (void)unregisterForNotifications:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients) {
    [(NSHashTable *)notificationClients removeObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = (void *)MEMORY[0x1D944E080]();
  unint64_t v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing client from accessory server notification %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)registerForNotifications:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    [(NSHashTable *)notificationClients addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    unint64_t v7 = self;
    BOOL v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      char v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering client for accessory server notification %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)isPinging
{
  return 0;
}

- (void)stopPing
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    BOOL v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Stop ping called -- NOP", (uint8_t *)&v7, 0xCu);
  }
}

- (void)startPing
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    BOOL v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Ping called -- NOP", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)pingSupported
{
  return 0;
}

- (void)enumerateInternalDelegatesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self internalDelegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServer_enumerateInternalDelegatesUsingBlock___block_invoke;
  v7[3] = &unk_1E69F3C68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HAPAccessoryServer_enumerateInternalDelegatesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v15 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "internalDelegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_initWeak(&location, *(id *)(*((void *)&v10 + 1) + 8 * v5));
        if (!v15)
        {
          id v6 = objc_loadWeakRetained(&location);
          BOOL v7 = v6 == 0;

          if (!v7)
          {
            uint64_t v8 = *(void *)(a1 + 40);
            id v9 = objc_loadWeakRetained(&location);
            (*(void (**)(uint64_t, id, char *))(v8 + 16))(v8, v9, &v15);
          }
        }
        objc_destroyWeak(&location);
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v3);
  }
}

- (void)removeInternalDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self internalDelegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HAPAccessoryServer_removeInternalDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__HAPAccessoryServer_removeInternalDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalDelegates];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (BOOL)requiresTimedWrite:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HAPAccessoryServer *)self supportsTimedWrite])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v23 = v4;
      BOOL v7 = 0;
      id v8 = 0;
      uint64_t v9 = *(void *)v26;
LABEL_4:
      uint64_t v10 = 0;
      long long v11 = v7;
      long long v12 = v8;
      while (1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        id v8 = objc_msgSend(v13, "characteristic", v23);

        uint64_t v14 = [v8 service];
        char v15 = [v14 accessory];
        BOOL v7 = [v15 instanceID];

        if (!v8 || v7 == 0) {
          break;
        }
        if (([v13 timedWrite] & 1) != 0 || (objc_msgSend(v8, "properties") & 0x20) != 0)
        {
          BOOL v17 = 1;
LABEL_18:
          id v4 = v23;
          goto LABEL_23;
        }
        ++v10;
        long long v11 = v7;
        long long v12 = v8;
        if (v6 == v10)
        {
          uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
          if (v6) {
            goto LABEL_4;
          }
          BOOL v17 = 0;
          goto LABEL_18;
        }
      }
      long long v18 = (void *)MEMORY[0x1D944E080]();
      __int16 v19 = self;
      id v20 = HMFGetOSLogHandle();
      id v4 = v23;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v21;
        __int16 v31 = 2112;
        char v32 = v8;
        __int16 v33 = 2112;
        uint64_t v34 = v7;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to check prepare characteristic write requests for characteristic '%@' with an accessory instance ID of '%@'", buf, 0x20u);
      }
      BOOL v17 = 0;
LABEL_23:
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  uint64_t v10 = NSString;
  long long v11 = NSStringFromSelector(a2);
  long long v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = *MEMORY[0x1E4F1C3B8];
  uint64_t v14 = NSString;
  char v15 = NSStringFromSelector(a2);
  uint64_t v16 = [v14 stringWithFormat:@"You must override %@ in a subclass", v15];
  id v17 = [v12 exceptionWithName:v13 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  long long v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = *MEMORY[0x1E4F1C3B8];
  uint64_t v14 = NSString;
  char v15 = NSStringFromSelector(a2);
  uint64_t v16 = [v14 stringWithFormat:@"You must override %@ in a subclass", v15];
  id v17 = [v12 exceptionWithName:v13 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  long long v12 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v13 = *MEMORY[0x1E4F1C3B8];
  uint64_t v14 = NSString;
  char v15 = NSStringFromSelector(a2);
  uint64_t v16 = [v14 stringWithFormat:@"You must override %@ in a subclass", v15];
  id v17 = [v12 exceptionWithName:v13 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)discoverAccessories
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)removePairingIdentifier:(id)a3 pairingPublicKey:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(HAPAccessoryServer *)self keyBag];
  char v15 = [v14 currentIdentity];
  uint64_t v16 = [v15 identifier];
  char v17 = [v16 isEqualToString:v13];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  long long v26 = __97__HAPAccessoryServer_removePairingIdentifier_pairingPublicKey_completionQueue_completionHandler___block_invoke;
  long long v27 = &unk_1E69F2960;
  long long v29 = self;
  id v30 = v11;
  char v31 = v17;
  id v28 = v10;
  id v18 = v11;
  id v19 = v10;
  id v20 = (void *)MEMORY[0x1D944E2D0](&v24);
  id v21 = objc_alloc(MEMORY[0x1E4F65510]);
  v22 = objc_msgSend(v21, "initWithPairingKeyData:", v12, v24, v25, v26, v27);

  id v23 = [[HAPPairingIdentity alloc] initWithIdentifier:v13 publicKey:v22 privateKey:0 permissions:0];
  [(HAPAccessoryServer *)self removePairing:v23 completionQueue:v19 completionHandler:v20];
}

void __97__HAPAccessoryServer_removePairingIdentifier_pairingPublicKey_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  id v4 = v5;
  if (!v5 && *(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) disconnect];
    [*(id *)(a1 + 40) refreshKeyBag];
    id v4 = 0;
  }
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  id v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  id v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  uint64_t v14 = NSStringFromSelector(a2);
  char v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  uint64_t v14 = NSStringFromSelector(a2);
  char v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  id v11 = NSString;
  uint64_t v12 = NSStringFromSelector(a2);
  id v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)startPairingWithConsentRequired:(BOOL)a3 config:(id)a4 ownershipToken:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  id v11 = NSString;
  uint64_t v12 = NSStringFromSelector(a2);
  id v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)startPairingWithRequest:(id)a3
{
}

- (void)continuePairingUsingWAC
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)continuePairingAfterAuthPrompt
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)matchesSetupID:(id)a3 serverIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    if (v7) {
      goto LABEL_6;
    }
LABEL_7:
    char v9 = 0;
    goto LABEL_8;
  }
  if (![(HAPAccessoryServer *)self matchesSetupID:v6]) {
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = [(HAPAccessoryServer *)self identifier];
    char v9 = HMFEqualObjects();

    goto LABEL_8;
  }
  char v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)matchesSetupID:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self setupHash];
  id v6 = [(HAPAccessoryServer *)self identifier];
  char v7 = HAPValidateSetupHash(v5, v6, v4);

  return v7;
}

- (BOOL)isPaired
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)validatePairingAuthMethod:(id)a3
{
  id v4 = (void (**)(id, void *, void))MEMORY[0x1D944E2D0](a3, a2);
  if (v4)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
    v4[2](v4, v3, 0);
  }
}

- (void)tearDownSessionOnAuthCompletion
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)provisionToken:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)authenticateAccessory
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSDictionary)pairingMetricDictionary
{
  p_metriclock = &self->_metriclock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_localPairingMetricDictionary copy];
  os_unfair_lock_unlock(p_metriclock);

  return (NSDictionary *)v4;
}

- (void)clearPairingMetrics
{
  p_metriclock = &self->_metriclock;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_localPairingMetricDictionary removeAllObjects];

  os_unfair_lock_unlock(p_metriclock);
}

- (void)setPairingMetricWithKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_localPairingMetricDictionary setObject:v6 forKeyedSubscript:v7];
  os_unfair_lock_unlock(&self->_metriclock);
}

- (NSDate)connectionStartTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_connectionStartTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setConnectionStartTime:(id)a3
{
  uint64_t v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  connectionStartTime = self->_connectionStartTime;
  self->_connectionStartTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setReachabilityChangedReason:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  reachabilityChangedReason = self->_reachabilityChangedReason;
  self->_reachabilityChangedReason = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)reachabilityChangedReason
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_reachabilityChangedReason;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAdvertisement = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasAdvertisement
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAdvertisement;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)requiresThreadRouter
{
  return 0;
}

- (NSNumber)nodeID
{
  return 0;
}

- (NSData)rootPublicKey
{
  return 0;
}

- (NSNumber)productID
{
  return 0;
}

- (NSNumber)vendorID
{
  return 0;
}

- (NSUUID)commissioningID
{
  return 0;
}

- (unint64_t)pairSetupType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t pairSetupType = self->_pairSetupType;
  os_unfair_lock_unlock(p_lock);
  return pairSetupType;
}

- (void)setPairSetupType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t pairSetupType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setVersion:(id)a3
{
  uint64_t v4 = (HMFVersion *)a3;
  os_unfair_lock_lock_with_options();
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)compatibilityFeatures
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t compatibilityFeatures = self->_compatibilityFeatures;
  os_unfair_lock_unlock(p_lock);
  return compatibilityFeatures;
}

- (void)setCompatibilityFeatures:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t compatibilityFeatures = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)stateNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t stateNumber = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return stateNumber;
}

- (void)setStateNumber:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t stateNumber = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setWakeNumber:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t wakeNumber = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setConfigNumber:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t configNumber = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setProductData:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  productData = self->_productData;
  self->_productData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCategory:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if ([(NSNumber *)self->_category isEqual:v5])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_category, a3);
    os_unfair_lock_unlock(&self->_lock);
    id v6 = [(HAPAccessoryServer *)self delegate];
    if (v6)
    {
      id v7 = [(HAPAccessoryServer *)self delegateQueue];

      if (v7)
      {
        id v8 = [(HAPAccessoryServer *)self delegateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __34__HAPAccessoryServer_setCategory___block_invoke;
        block[3] = &unk_1E69F4708;
        id v10 = v6;
        id v11 = self;
        id v12 = v5;
        dispatch_async(v8, block);
      }
    }
  }
}

uint64_t __34__HAPAccessoryServer_setCategory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didUpdateCategory:*(void *)(a1 + 48)];
}

- (NSNumber)category
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_category;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  os_unfair_lock_lock_with_options();
  if ([(NSString *)self->_name isEqualToString:v4])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_name, v5);
    os_unfair_lock_unlock(&self->_lock);
    id v6 = [(HAPAccessoryServer *)self delegate];
    if (v6)
    {
      id v7 = [(HAPAccessoryServer *)self delegateQueue];

      if (v7)
      {
        id v8 = [(HAPAccessoryServer *)self delegateQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__HAPAccessoryServer_setName___block_invoke;
        block[3] = &unk_1E69F4708;
        id v10 = v6;
        id v11 = self;
        id v12 = v5;
        dispatch_async(v8, block);
      }
    }
  }
}

uint64_t __30__HAPAccessoryServer_setName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didUpdateName:*(void *)(a1 + 48)];
}

- (void)setAuthMethod:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_authMethod = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)authMethod
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t authMethod = self->_authMethod;
  os_unfair_lock_unlock(p_lock);
  return authMethod;
}

- (void)setSetupHash:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSData *)[v6 copy];
  setupHash = self->_setupHash;
  self->_setupHash = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HAPDeviceID)deviceID
{
  uint64_t v3 = [HAPDeviceID alloc];
  id v4 = [(HAPAccessoryServer *)self identifier];
  id v5 = [(HAPDeviceID *)v3 initWithDeviceIDString:v4];

  return v5;
}

- (void)setHasPairings:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int hasPairings = self->_hasPairings;
  if (hasPairings != v3) {
    self->_int hasPairings = v3;
  }
  if (self->_pendingRemovePairing)
  {
    self->_pendingRemovePairing = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    if (hasPairings == v3) {
      return;
    }
  }
  id v7 = [(HAPAccessoryServer *)self delegate];
  if (v7)
  {
    id v8 = [(HAPAccessoryServer *)self delegateQueue];

    if (v8)
    {
      char v9 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__HAPAccessoryServer_setHasPairings___block_invoke;
      block[3] = &unk_1E69F2938;
      id v11 = v7;
      id v12 = self;
      char v13 = v3;
      dispatch_async(v9, block);
    }
  }
}

uint64_t __37__HAPAccessoryServer_setHasPairings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryServer:*(void *)(a1 + 40) didUpdateHasPairings:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)hasPairings
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasPairings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPendingRemovePairing:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pendingRemovePairing = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pendingRemovePairing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t pendingRemovePairing = self->_pendingRemovePairing;
  os_unfair_lock_unlock(p_lock);
  return pendingRemovePairing;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_securitySessionOpen = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSessionRestoreActive:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sessionRestoreActive = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSessionRestoreActive
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_sessionRestoreActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachabilityPingEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachabilityPingEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)reachabilityPingEnabled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachabilityPingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)shouldDisconnectOnIdle
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldDisconnectOnIdle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(HAPAccessoryServer *)self accessories];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setReachable:v3];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (HAPAccessoryServer)initWithKeystore:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HAPAccessoryServer;
  id v5 = [(HAPAccessoryServer *)&v24 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (const char *)HAPDispatchQueueName(v5, @"clientQueue");
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v9 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2(v7, v8, v9);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v10;

    long long v12 = (const char *)HAPDispatchQueueName(v6, @"delegateQueue");
    long long v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2(v12, v13, v9);
    internalDelegateQueue = v6->_internalDelegateQueue;
    v6->_internalDelegateQueue = (OS_dispatch_queue *)v14;

    objc_storeWeak((id *)&v6->_keyStore, v4);
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    internalDelegates = v6->_internalDelegates;
    v6->_internalDelegates = (NSHashTable *)v16;

    *(_WORD *)&v6->_reachable = 1;
    v6->_unint64_t authMethod = 5;
    v6->_reachabilityPingEnabled = 0;
    v6->_sessionRestoreActive = 0;
    uint64_t v18 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
    notificationClients = v6->_notificationClients;
    v6->_notificationClients = (NSHashTable *)v18;

    v6->_shouldDisconnectOnIdle = 0;
    v6->_successfulPingCount = 0;
    v6->_failedPingCount = 0;
    v6->_hasAdvertisement = 1;
    reachabilityChangedReason = v6->_reachabilityChangedReason;
    v6->_reachabilityChangedReason = (NSString *)@"Unknown";

    v6->_supportsUnreachablePing = 0;
    id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    localPairingMetricDictionary = v6->_localPairingMetricDictionary;
    v6->_localPairingMetricDictionary = v21;
  }
  return v6;
}

- (HAPAccessoryServer)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end