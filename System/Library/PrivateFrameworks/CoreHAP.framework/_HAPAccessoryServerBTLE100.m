@interface _HAPAccessoryServerBTLE100
+ (id)_convertFromBTLEToHAPUUID:(id)a3;
+ (id)deserializeCharacteristicReadData:(id)a3 characteristicFormat:(unint64_t)a4 supportsAdditionalAuthentication:(BOOL)a5 error:(id *)a6;
+ (id)serializeCharacteristicWriteValue:(id)a3 characteristicFormat:(unint64_t)a4 supportsAdditionalAuthentication:(BOOL)a5 authenticationData:(id)a6 error:(id *)a7;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_parseBTLECharacteristicDescriptor:(id)a3 existingDescriptors:(id)a4 characteristics:(id)a5;
- (BOOL)_shouldEnableSessionSecurity;
- (BOOL)isBLELinkConnected;
- (BOOL)isDisconnecting;
- (BOOL)isSecuritySessionOpening;
- (BOOL)pairingFeaturesRead;
- (BOOL)removeOnDisconnect;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)startPairingRequested;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5;
- (BOOL)unpairedIdentifyRequested;
- (CBCharacteristic)identifyCharacteristic;
- (CBCharacteristic)manufacturerCharacteristic;
- (CBCharacteristic)modelCharacteristic;
- (CBCharacteristic)pairSetupCharacteristic;
- (CBCharacteristic)pairVerifyCharacteristic;
- (CBCharacteristic)pairingFeaturesCharacteristic;
- (CBCharacteristic)pairingsCharacteristic;
- (CBCharacteristic)serialNumberCharacteristic;
- (CBService)accessoryInfoService;
- (CBService)pairingService;
- (HAPSecuritySession)securitySession;
- (NSMapTable)btleCharacteristicToHAPCharacteristicMap;
- (NSMapTable)btleServiceToHAPServiceMap;
- (NSMapTable)hapCharacteristicEnableEventCompletionQueues;
- (NSMapTable)hapCharacteristicReadCompletionQueues;
- (NSMapTable)hapCharacteristicWriteCompletionQueues;
- (NSMutableArray)addRemovePairingOperationsQueue;
- (NSString)description;
- (OS_dispatch_source)connectionLifetimeTimer;
- (_HAPAccessoryServerBTLE100)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16;
- (double)idleConnectionTimeoutInSec;
- (id)_btleCharacteristicForHAPCharacteristic:(id)a3;
- (id)_decryptData:(id)a3 error:(id *)a4;
- (id)_dequeueEnableEventCompletionTupleForCharacteristic:(id)a3;
- (id)_dequeueReadCompletionTupleForCharacteristic:(id)a3;
- (id)_dequeueWriteCompletionHandlerForCharacteristic:(id)a3;
- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4;
- (id)_hapCharacteristicForBTLECharacteristic:(id)a3;
- (id)_nextInstanceID;
- (id)_pairSetupHAPCharacteristic;
- (id)_pairVerifyHAPCharacteristic;
- (id)_parseBTLEService:(id)a3 withInstanceId:(id)a4;
- (id)pairVerifyCompletionBlock;
- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5;
- (id)unpairedIdentifyCompletionBlock;
- (int)_ensurePairingSessionIsInitializedWithType:(unsigned int)a3;
- (int)_handlePairSetupExchangeWithData:(id)a3;
- (int)_pairSetupStart;
- (int)_pairSetupTryPassword:(id)a3;
- (unint64_t)availableInstanceID;
- (unint64_t)characteristicDiscoveryRequestCount;
- (unint64_t)characteristicValueReadCount;
- (unint64_t)connectionRetryCount;
- (unint64_t)hapBLEProtocolVersion;
- (unint64_t)metadataDiscoveryRequestCount;
- (unint64_t)metadataValueReadCount;
- (unint64_t)pairingFeatureFlags;
- (unint64_t)state;
- (void)_addPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7;
- (void)_cancelConnectionLifetimeTimer;
- (void)_checkForAuthPrompt;
- (void)_createPrimaryAccessoryFromAdvertisementData;
- (void)_dequeueAndContinueOperation;
- (void)_disconnect;
- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_enqueueEnableEventCompletionHandler:(id)a3 queue:(id)a4 forCharacteristic:(id)a5;
- (void)_enqueueOperation:(int64_t)a3 identifier:(id)a4 publicKey:(id)a5 admin:(BOOL)a6 queue:(id)a7 completion:(id)a8;
- (void)_enqueueReadCompletionHandler:(id)a3 queue:(id)a4 forCharacteristic:(id)a5;
- (void)_enqueueWriteCompletionHandler:(id)a3 forCharacteristic:(id)a4;
- (void)_getAttributeDatabase;
- (void)_handleConnectionLifetimeTimeout;
- (void)_handleConnectionWithError:(id)a3;
- (void)_handleDescriptorDiscovery;
- (void)_handleDisconnectionWithCompletion:(id)a3;
- (void)_handleHAPCharacteristicDiscoveryForService:(id)a3 error:(id)a4;
- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4;
- (void)_handleHAPServiceDiscovery;
- (void)_handleHAPServiceDiscoveryCompletionForService:(id)a3 withInstanceId:(id)a4;
- (void)_handleHAPWriteConfirmationForCharacteristic:(id)a3 error:(id)a4;
- (void)_handlePairingStateMachine;
- (void)_handlePairingsReadForCharacteristic:(id)a3 readError:(id)a4 removing:(BOOL)a5 queue:(id)a6 completion:(id)a7;
- (void)_handlePairingsWriteForCharacteristic:(id)a3 writeError:(id)a4 removing:(BOOL)a5 queue:(id)a6 completion:(id)a7;
- (void)_handleReadDescriptorValues;
- (void)_handleReceivedSecuritySessionSetupExchangeData:(id)a3;
- (void)_handleSuccessfulBTLEConnection;
- (void)_handleUpdatedValueForBTLECharacteristic:(id)a3 error:(id)a4;
- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4;
- (void)_readCharacteristicValues:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)_readValueForCharacteristic:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)_reallyEstablishSecureSession;
- (void)_removePairingWithIdentifier:(id)a3 publicKey:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_resetState;
- (void)_setupBTLEConnectionToPeripheral;
- (void)_updateConnectionLifetimeTimer;
- (void)_writeCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 authorizationData:(id)a5 withCompletionHandler:(id)a6 queue:(id)a7;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)dealloc;
- (void)disconnect;
- (void)discoverAccessories;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4;
- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)readValueForCharacteristic:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)securitySession:(id)a3 didCloseWithError:(id)a4;
- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)securitySessionDidOpen:(id)a3;
- (void)securitySessionIsOpening:(id)a3;
- (void)setAccessoryInfoService:(id)a3;
- (void)setAddRemovePairingOperationsQueue:(id)a3;
- (void)setAvailableInstanceID:(unint64_t)a3;
- (void)setBtleCharacteristicToHAPCharacteristicMap:(id)a3;
- (void)setBtleServiceToHAPServiceMap:(id)a3;
- (void)setCharacteristicDiscoveryRequestCount:(unint64_t)a3;
- (void)setCharacteristicValueReadCount:(unint64_t)a3;
- (void)setConnectionLifetimeTimer:(id)a3;
- (void)setConnectionRetryCount:(unint64_t)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setHapCharacteristicEnableEventCompletionQueues:(id)a3;
- (void)setHapCharacteristicReadCompletionQueues:(id)a3;
- (void)setHapCharacteristicWriteCompletionQueues:(id)a3;
- (void)setIdentifyCharacteristic:(id)a3;
- (void)setIdleConnectionTimeoutInSec:(double)a3;
- (void)setManufacturerCharacteristic:(id)a3;
- (void)setMetadataDiscoveryRequestCount:(unint64_t)a3;
- (void)setMetadataValueReadCount:(unint64_t)a3;
- (void)setModelCharacteristic:(id)a3;
- (void)setPairSetupCharacteristic:(id)a3;
- (void)setPairVerifyCharacteristic:(id)a3;
- (void)setPairVerifyCompletionBlock:(id)a3;
- (void)setPairingFeatureFlags:(unint64_t)a3;
- (void)setPairingFeaturesCharacteristic:(id)a3;
- (void)setPairingFeaturesRead:(BOOL)a3;
- (void)setPairingService:(id)a3;
- (void)setPairingsCharacteristic:(id)a3;
- (void)setRemoveOnDisconnect:(BOOL)a3;
- (void)setSecuritySession:(id)a3;
- (void)setSecuritySessionOpening:(BOOL)a3;
- (void)setSerialNumberCharacteristic:(id)a3;
- (void)setStartPairingRequested:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setUnpairedIdentifyCompletionBlock:(id)a3;
- (void)setUnpairedIdentifyRequested:(BOOL)a3;
- (void)startPairingWithRequest:(id)a3;
- (void)updateConnectionIdleTime:(unsigned __int8)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation _HAPAccessoryServerBTLE100

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unpairedIdentifyCompletionBlock, 0);
  objc_storeStrong((id *)&self->_connectionLifetimeTimer, 0);
  objc_storeStrong((id *)&self->_securitySession, 0);
  objc_storeStrong(&self->_pairVerifyCompletionBlock, 0);
  objc_storeStrong((id *)&self->_manufacturerCharacteristic, 0);
  objc_storeStrong((id *)&self->_serialNumberCharacteristic, 0);
  objc_storeStrong((id *)&self->_modelCharacteristic, 0);
  objc_storeStrong((id *)&self->_identifyCharacteristic, 0);
  objc_storeStrong((id *)&self->_accessoryInfoService, 0);
  objc_storeStrong((id *)&self->_pairingsCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairingFeaturesCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairVerifyCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairSetupCharacteristic, 0);
  objc_storeStrong((id *)&self->_pairingService, 0);
  objc_storeStrong((id *)&self->_addRemovePairingOperationsQueue, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicEnableEventCompletionQueues, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicWriteCompletionQueues, 0);
  objc_storeStrong((id *)&self->_hapCharacteristicReadCompletionQueues, 0);
  objc_storeStrong((id *)&self->_btleCharacteristicToHAPCharacteristicMap, 0);

  objc_storeStrong((id *)&self->_btleServiceToHAPServiceMap, 0);
}

- (void)setRemoveOnDisconnect:(BOOL)a3
{
  self->_removeOnDisconnect = a3;
}

- (BOOL)removeOnDisconnect
{
  return self->_removeOnDisconnect;
}

- (void)setUnpairedIdentifyCompletionBlock:(id)a3
{
}

- (id)unpairedIdentifyCompletionBlock
{
  return self->_unpairedIdentifyCompletionBlock;
}

- (void)setUnpairedIdentifyRequested:(BOOL)a3
{
  self->_unpairedIdentifyRequested = a3;
}

- (BOOL)unpairedIdentifyRequested
{
  return self->_unpairedIdentifyRequested;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setIdleConnectionTimeoutInSec:(double)a3
{
  self->_idleConnectionTimeoutInSec = a3;
}

- (double)idleConnectionTimeoutInSec
{
  return self->_idleConnectionTimeoutInSec;
}

- (void)setConnectionLifetimeTimer:(id)a3
{
}

- (OS_dispatch_source)connectionLifetimeTimer
{
  return self->_connectionLifetimeTimer;
}

- (void)setSecuritySessionOpening:(BOOL)a3
{
  self->_securitySessionOpening = a3;
}

- (BOOL)isSecuritySessionOpening
{
  return self->_securitySessionOpening;
}

- (void)setSecuritySession:(id)a3
{
}

- (HAPSecuritySession)securitySession
{
  return self->_securitySession;
}

- (void)setPairingFeatureFlags:(unint64_t)a3
{
  self->_pairingFeatureFlags = a3;
}

- (unint64_t)pairingFeatureFlags
{
  return self->_pairingFeatureFlags;
}

- (void)setPairingFeaturesRead:(BOOL)a3
{
  self->_pairingFeaturesRead = a3;
}

- (BOOL)pairingFeaturesRead
{
  return self->_pairingFeaturesRead;
}

- (void)setStartPairingRequested:(BOOL)a3
{
  self->_startPairingRequested = a3;
}

- (BOOL)startPairingRequested
{
  return self->_startPairingRequested;
}

- (void)setPairVerifyCompletionBlock:(id)a3
{
}

- (id)pairVerifyCompletionBlock
{
  return self->_pairVerifyCompletionBlock;
}

- (void)setManufacturerCharacteristic:(id)a3
{
}

- (CBCharacteristic)manufacturerCharacteristic
{
  return self->_manufacturerCharacteristic;
}

- (void)setSerialNumberCharacteristic:(id)a3
{
}

- (CBCharacteristic)serialNumberCharacteristic
{
  return self->_serialNumberCharacteristic;
}

- (void)setModelCharacteristic:(id)a3
{
}

- (CBCharacteristic)modelCharacteristic
{
  return self->_modelCharacteristic;
}

- (void)setIdentifyCharacteristic:(id)a3
{
}

- (CBCharacteristic)identifyCharacteristic
{
  return self->_identifyCharacteristic;
}

- (void)setAccessoryInfoService:(id)a3
{
}

- (CBService)accessoryInfoService
{
  return self->_accessoryInfoService;
}

- (void)setPairingsCharacteristic:(id)a3
{
}

- (CBCharacteristic)pairingsCharacteristic
{
  return self->_pairingsCharacteristic;
}

- (void)setPairingFeaturesCharacteristic:(id)a3
{
}

- (CBCharacteristic)pairingFeaturesCharacteristic
{
  return self->_pairingFeaturesCharacteristic;
}

- (void)setPairVerifyCharacteristic:(id)a3
{
}

- (CBCharacteristic)pairVerifyCharacteristic
{
  return self->_pairVerifyCharacteristic;
}

- (void)setPairSetupCharacteristic:(id)a3
{
}

- (CBCharacteristic)pairSetupCharacteristic
{
  return self->_pairSetupCharacteristic;
}

- (void)setPairingService:(id)a3
{
}

- (CBService)pairingService
{
  return self->_pairingService;
}

- (void)setAddRemovePairingOperationsQueue:(id)a3
{
}

- (NSMutableArray)addRemovePairingOperationsQueue
{
  return self->_addRemovePairingOperationsQueue;
}

- (void)setHapCharacteristicEnableEventCompletionQueues:(id)a3
{
}

- (NSMapTable)hapCharacteristicEnableEventCompletionQueues
{
  return self->_hapCharacteristicEnableEventCompletionQueues;
}

- (void)setHapCharacteristicWriteCompletionQueues:(id)a3
{
}

- (NSMapTable)hapCharacteristicWriteCompletionQueues
{
  return self->_hapCharacteristicWriteCompletionQueues;
}

- (void)setHapCharacteristicReadCompletionQueues:(id)a3
{
}

- (NSMapTable)hapCharacteristicReadCompletionQueues
{
  return self->_hapCharacteristicReadCompletionQueues;
}

- (void)setBtleCharacteristicToHAPCharacteristicMap:(id)a3
{
}

- (NSMapTable)btleCharacteristicToHAPCharacteristicMap
{
  return self->_btleCharacteristicToHAPCharacteristicMap;
}

- (void)setAvailableInstanceID:(unint64_t)a3
{
  self->_availableInstanceID = a3;
}

- (unint64_t)availableInstanceID
{
  return self->_availableInstanceID;
}

- (void)setMetadataValueReadCount:(unint64_t)a3
{
  self->_metadataValueReadCount = a3;
}

- (unint64_t)metadataValueReadCount
{
  return self->_metadataValueReadCount;
}

- (void)setMetadataDiscoveryRequestCount:(unint64_t)a3
{
  self->_metadataDiscoveryRequestCount = a3;
}

- (unint64_t)metadataDiscoveryRequestCount
{
  return self->_metadataDiscoveryRequestCount;
}

- (void)setCharacteristicValueReadCount:(unint64_t)a3
{
  self->_characteristicValueReadCount = a3;
}

- (unint64_t)characteristicValueReadCount
{
  return self->_characteristicValueReadCount;
}

- (void)setCharacteristicDiscoveryRequestCount:(unint64_t)a3
{
  self->_characteristicDiscoveryRequestCount = a3;
}

- (unint64_t)characteristicDiscoveryRequestCount
{
  return self->_characteristicDiscoveryRequestCount;
}

- (void)setBtleServiceToHAPServiceMap:(id)a3
{
}

- (NSMapTable)btleServiceToHAPServiceMap
{
  return self->_btleServiceToHAPServiceMap;
}

- (void)setConnectionRetryCount:(unint64_t)a3
{
  self->_connectionRetryCount = a3;
}

- (unint64_t)connectionRetryCount
{
  return self->_connectionRetryCount;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)disconnect
{
  v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___HAPAccessoryServerBTLE100_disconnect__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_dequeueAndContinueOperation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
    [v5 removeObjectAtIndex:0];
  }
  v6 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D944E080]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
      int v28 = 138543618;
      v29 = v10;
      __int16 v30 = 2048;
      uint64_t v31 = [v11 count];
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Continuing with remaining %ld operations", (uint8_t *)&v28, 0x16u);
    }
    v12 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
    v13 = [v12 objectAtIndex:0];

    [v13 setOperationExecuting:1];
    uint64_t v14 = [v13 operation];
    if (v14 == 6)
    {
      v15 = [v13 identifier];
      v16 = [v13 publicKey];
      v20 = [v13 queue];
      v21 = [v13 completionHandler];
      [(_HAPAccessoryServerBTLE100 *)self _removePairingWithIdentifier:v15 publicKey:v16 queue:v20 completion:v21];
    }
    else
    {
      if (v14 != 5)
      {
        v22 = (void *)MEMORY[0x1D944E080]();
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = HMFGetLogIdentifier();
          v25 = [(HAPAccessoryServer *)self name];
          uint64_t v26 = [v13 operation];
          v27 = [v13 identifier];
          int v28 = 138544130;
          v29 = v24;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v25;
          __int16 v32 = 2048;
          uint64_t v33 = v26;
          __int16 v34 = 2112;
          v35 = v27;
          _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] ### Invalid Operation %tu in Q for controller: %@, Dropping and continuing", (uint8_t *)&v28, 0x2Au);
        }
        [(_HAPAccessoryServerBTLE100 *)self _dequeueAndContinueOperation];
        goto LABEL_14;
      }
      v15 = [v13 identifier];
      v16 = [v13 publicKey];
      uint64_t v17 = [v13 admin];
      v18 = [v13 queue];
      v19 = [v13 completionHandler];
      [(_HAPAccessoryServerBTLE100 *)self _addPairingWithIdentifier:v15 publicKey:v16 admin:v17 queue:v18 completion:v19];
    }
LABEL_14:
  }
}

- (void)_enqueueOperation:(int64_t)a3 identifier:(id)a4 publicKey:(id)a5 admin:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = [[HAPAddRemovePairingOperation alloc] initWith:a3 identifier:v14 publicKey:v15 admin:v10 queue:v16 completion:v17];
  v19 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
  uint64_t v20 = [v19 count];

  if (!v20) {
    [(HAPAddRemovePairingOperation *)v18 setOperationExecuting:1];
  }
  v21 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
  [v21 addObject:v18];

  v22 = (void *)MEMORY[0x1D944E080]();
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = HMFGetLogIdentifier();
    v25 = [(HAPAccessoryServer *)self name];
    int v26 = 138544130;
    v27 = v24;
    __int16 v28 = 2112;
    v29 = v25;
    __int16 v30 = 2048;
    int64_t v31 = a3;
    __int16 v32 = 2112;
    id v33 = v14;
    _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Queued Operation %ld for controller with identifier %@", (uint8_t *)&v26, 0x2Au);
  }
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1D944E080]();
  BOOL v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [(HAPAccessoryServer *)self name];
    v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    id v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] %@ is not supported over this transport", buf, 0x20u);
  }
  if (v7 && v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80___HAPAccessoryServerBTLE100_listPairingsWithCompletionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v15 = v8;
    dispatch_async(v7, block);
  }
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  id v23 = 0;
  id v8 = [(HAPAccessoryServer *)self getControllerPairingIdentityWithError:&v23];
  id v9 = v23;
  if (v8)
  {
    BOOL v10 = (void *)MEMORY[0x1D944E080]();
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Received request to remove pairing for the current controller", buf, 0x16u);
    }
    id v14 = [(HAPAccessoryServer *)self clientQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_345;
    v17[3] = &unk_1E69F3E98;
    v17[4] = self;
    id v19 = v7;
    __int16 v18 = v6;
    [(_HAPAccessoryServerBTLE100 *)self removePairing:0 completionQueue:v14 completionHandler:v17];

    id v15 = v19;
    goto LABEL_7;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v22 = v7;
    id v21 = v9;
    dispatch_async(v6, block);

    id v15 = v22;
LABEL_7:
  }
  return v8 != 0;
}

- (void)_removePairingWithIdentifier:(id)a3 publicKey:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = a5;
  id v40 = a6;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v11];
  id v14 = [[HAPPairingIdentity alloc] initWithIdentifier:v10 publicKey:v13 privateKey:0 permissions:0];
  id v47 = 0;
  id v15 = +[HAPPairingUtilities createRemovePairingRequestForPairingIdentity:v14 error:&v47];
  id v16 = v47;
  id v17 = (void *)MEMORY[0x1D944E080]();
  __int16 v18 = HMFGetOSLogHandle();
  id v19 = v18;
  if (v15)
  {
    id v37 = v16;
    id v38 = v11;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = HMFGetLogIdentifier();
      id v21 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138543874;
      v49 = v20;
      __int16 v50 = 2112;
      v51 = v21;
      __int16 v52 = 2112;
      id v53 = v10;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Received request to remove pairing for controller with identifier %@", buf, 0x20u);
    }
    id v22 = [(HAPAccessoryServerBTLE *)self browser];
    id v23 = [(HAPAccessoryServer *)self identifier];
    [v22 deRegisterAccessoryWithIdentifier:v23];

    v24 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
    v25 = [(_HAPAccessoryServerBTLE100 *)self pairingsCharacteristic];
    __int16 v26 = [v24 objectForKey:v25];

    if (!v26)
    {
      v27 = [HAPCharacteristic alloc];
      uint64_t v28 = [(HAPAccessoryServerBTLE *)self stateNumber];
      LOBYTE(v36) = 1;
      __int16 v26 = [(HAPCharacteristic *)v27 initWithType:@"00000050-0000-1000-8000-0026BB765291" instanceID:&unk_1F2C80B98 value:0 stateNumber:v28 properties:6 eventNotificationsEnabled:0 implicitWriteWithResponse:v36 metadata:0];

      v29 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
      __int16 v30 = [(_HAPAccessoryServerBTLE100 *)self pairingsCharacteristic];
      [v29 setObject:v26 forKey:v30];
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_344;
    v41[3] = &unk_1E69F3E48;
    v41[4] = self;
    v42 = v12;
    int64_t v31 = v40;
    id v43 = v40;
    __int16 v32 = (void *)MEMORY[0x1D944E2D0](v41);
    id v33 = [(HAPAccessoryServer *)self clientQueue];
    [(_HAPAccessoryServerBTLE100 *)self _writeValue:v15 forCharacteristic:v26 authorizationData:0 withCompletionHandler:v32 queue:v33];

    id v16 = v37;
    id v11 = v38;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    uint64_t v34 = v39 = v11;
    v35 = [(HAPAccessoryServer *)self name];
    *(_DWORD *)buf = 138543874;
    v49 = v34;
    __int16 v50 = 2112;
    v51 = v35;
    __int16 v52 = 2112;
    id v53 = v16;
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server '%@] Failed to create remove pairing request payload with error: %@", buf, 0x20u);

    id v11 = v39;
  }

  int64_t v31 = v40;
  if (v12 && v40)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    v45 = (HAPCharacteristic *)v16;
    id v46 = v40;
    dispatch_async(v12, block);

    __int16 v26 = v45;
LABEL_12:
  }
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___HAPAccessoryServerBTLE100_removePairing_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E69F3D58;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_handlePairingsReadForCharacteristic:(id)a3 readError:(id)a4 removing:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)MEMORY[0x1D944E080]();
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [(HAPAccessoryServer *)self name];
    __int16 v20 = (void *)v19;
    id v21 = "Add";
    *(_DWORD *)buf = 138544130;
    id v43 = v18;
    __int16 v44 = 2112;
    if (v9) {
      id v21 = "Remove";
    }
    uint64_t v45 = v19;
    __int16 v46 = 2080;
    id v47 = v21;
    __int16 v48 = 2112;
    id v49 = v13;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@'] Completed Pairings read request for '%s' with error %@", buf, 0x2Au);
  }
  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v41 = v15;
    id v40 = v13;
    id v22 = v15;
    dispatch_async(v14, block);

    id v23 = v41;
  }
  else
  {
    v24 = [v12 value];
    if (v9)
    {
      uint64_t v38 = 0;
      v25 = (id *)&v38;
      +[HAPPairingUtilities parseRemovePairingResponse:v24 error:&v38];
    }
    else
    {
      uint64_t v37 = 0;
      v25 = (id *)&v37;
      +[HAPPairingUtilities parseAddPairingResponse:v24 error:&v37];
    }
    id v26 = *v25;

    v27 = (void *)MEMORY[0x1D944E080]();
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = HMFGetLogIdentifier();
      uint64_t v30 = [(HAPAccessoryServer *)self name];
      int64_t v31 = (void *)v30;
      __int16 v32 = "Add";
      *(_DWORD *)buf = 138544130;
      id v43 = v29;
      __int16 v44 = 2112;
      if (v9) {
        __int16 v32 = "Remove";
      }
      uint64_t v45 = v30;
      __int16 v46 = 2080;
      id v47 = v32;
      __int16 v48 = 2112;
      id v49 = v26;
      _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@'] Parsed pairing response for '%s' to error %@", buf, 0x2Au);
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke_337;
    v34[3] = &unk_1E69F3C68;
    id v35 = v26;
    id v36 = v15;
    id v33 = v15;
    id v23 = v26;
    dispatch_async(v14, v34);
  }
}

- (void)_handlePairingsWriteForCharacteristic:(id)a3 writeError:(id)a4 removing:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)MEMORY[0x1D944E080]();
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [(HAPAccessoryServer *)self name];
    __int16 v20 = (void *)v19;
    id v21 = "Add";
    *(_DWORD *)buf = 138544130;
    id v39 = v18;
    __int16 v40 = 2112;
    if (v9) {
      id v21 = "Remove";
    }
    uint64_t v41 = v19;
    __int16 v42 = 2080;
    id v43 = v21;
    __int16 v44 = 2112;
    id v45 = v13;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@'] Completed Pairings write request for '%s' with error %@", buf, 0x2Au);
  }
  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    uint64_t v37 = v15;
    id v36 = v13;
    id v22 = v15;
    dispatch_async(v14, block);

    id v23 = v37;
  }
  else
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke_2;
    uint64_t v30 = &unk_1E69F3E70;
    int64_t v31 = self;
    BOOL v34 = v9;
    __int16 v32 = v14;
    id v33 = v15;
    v24 = v15;
    v25 = (void *)MEMORY[0x1D944E2D0](&v27);
    id v26 = [(HAPAccessoryServer *)self clientQueue];
    [(_HAPAccessoryServerBTLE100 *)self _readValueForCharacteristic:v12 completionQueue:v26 completionHandler:v25];

    id v23 = v32;
  }
}

- (void)_addPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v40 = a7;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v13];
  id v16 = [[HAPPairingIdentity alloc] initWithIdentifier:v12 publicKey:v15 privateKey:0 permissions:v9];
  id v47 = 0;
  id v17 = +[HAPPairingUtilities createAddPairingRequestForPairingIdentity:v16 error:&v47];
  id v18 = v47;
  uint64_t v19 = (void *)MEMORY[0x1D944E080]();
  __int16 v20 = HMFGetOSLogHandle();
  id v21 = v20;
  if (v17)
  {
    id v37 = v18;
    id v38 = v13;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138543874;
      id v49 = v22;
      __int16 v50 = 2112;
      v51 = v23;
      __int16 v52 = 2112;
      id v53 = v12;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Received request to add pairing for controller with identifier %@", buf, 0x20u);
    }
    v24 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
    v25 = [(_HAPAccessoryServerBTLE100 *)self pairingsCharacteristic];
    id v26 = [v24 objectForKey:v25];

    if (!v26)
    {
      uint64_t v27 = [HAPCharacteristic alloc];
      uint64_t v28 = [(HAPAccessoryServerBTLE *)self stateNumber];
      LOBYTE(v36) = 1;
      id v26 = [(HAPCharacteristic *)v27 initWithType:@"00000050-0000-1000-8000-0026BB765291" instanceID:&unk_1F2C80B98 value:0 stateNumber:v28 properties:6 eventNotificationsEnabled:0 implicitWriteWithResponse:v36 metadata:0];

      v29 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
      uint64_t v30 = [(_HAPAccessoryServerBTLE100 *)self pairingsCharacteristic];
      [v29 setObject:v26 forKey:v30];
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_334;
    v41[3] = &unk_1E69F3E48;
    v41[4] = self;
    __int16 v42 = v14;
    int64_t v31 = v40;
    id v43 = v40;
    __int16 v32 = (void *)MEMORY[0x1D944E2D0](v41);
    id v33 = [(HAPAccessoryServer *)self clientQueue];
    [(_HAPAccessoryServerBTLE100 *)self _writeValue:v17 forCharacteristic:v26 authorizationData:0 withCompletionHandler:v32 queue:v33];

    id v18 = v37;
    id v13 = v38;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    BOOL v34 = v39 = v13;
    id v35 = [(HAPAccessoryServer *)self name];
    *(_DWORD *)buf = 138543874;
    id v49 = v34;
    __int16 v50 = 2112;
    v51 = v35;
    __int16 v52 = 2112;
    id v53 = v18;
    _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server '%@] Failed to create add pairing request payload with error: %@", buf, 0x20u);

    id v13 = v39;
  }

  int64_t v31 = v40;
  if (v14 && v40)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v45 = (HAPCharacteristic *)v18;
    id v46 = v40;
    dispatch_async(v14, block);

    id v26 = v45;
LABEL_12:
  }
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75___HAPAccessoryServerBTLE100_addPairing_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_1E69F3D58;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___HAPAccessoryServerBTLE100_identifyWithCompletion___block_invoke;
  v7[3] = &unk_1E69F3C68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_handleConnectionLifetimeTimeout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [(HAPAccessoryServer *)self identifier];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Handling connection lifetime timeout", (uint8_t *)&v7, 0x16u);
  }
  [(_HAPAccessoryServerBTLE100 *)self _cancelConnectionLifetimeTimer];
  [(_HAPAccessoryServerBTLE100 *)self _disconnect];
}

- (void)_disconnect
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [(HAPAccessoryServer *)self identifier];
    int v8 = 138543618;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Canceling connection lifetime timeout and disconnecting from peripheral", (uint8_t *)&v8, 0x16u);
  }
  [(_HAPAccessoryServerBTLE100 *)self setDisconnecting:1];
  int v7 = [(HAPAccessoryServerBTLE *)self browser];
  [v7 disconnectFromBTLEAccessoryServer:self];
}

- (void)_cancelConnectionLifetimeTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [(HAPAccessoryServer *)self identifier];
    int v9 = 138543618;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] cancelling connection lifetime timer...", (uint8_t *)&v9, 0x16u);
  }
  int v7 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];

  if (v7)
  {
    int v8 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];
    dispatch_source_cancel(v8);

    [(_HAPAccessoryServerBTLE100 *)self setConnectionLifetimeTimer:0];
  }
}

- (void)_updateConnectionLifetimeTimer
{
  v3 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];

  if (!v3)
  {
    id v4 = [(HAPAccessoryServer *)self clientQueue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    [(_HAPAccessoryServerBTLE100 *)self setConnectionLifetimeTimer:v5];

    objc_initWeak(&location, self);
    id v6 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __60___HAPAccessoryServerBTLE100__updateConnectionLifetimeTimer__block_invoke;
    id v15 = &unk_1E69F4658;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v6, &v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  if ([(_HAPAccessoryServerBTLE100 *)self state] == 7)
  {
    int64_t v7 = 60000000000;
  }
  else
  {
    [(_HAPAccessoryServerBTLE100 *)self idleConnectionTimeoutInSec];
    int64_t v7 = 1000000000 * (unint64_t)v8;
  }
  int v9 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];
  dispatch_time_t v10 = dispatch_time(0, v7);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  if (!v3)
  {
    __int16 v11 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];
    dispatch_resume(v11);
  }
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  dispatch_source_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___HAPAccessoryServerBTLE100_updateConnectionIdleTime___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  unsigned __int8 v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (int)_pairSetupTryPassword:(id)a3
{
  id v4 = a3;
  dispatch_source_t v5 = v4;
  if (self->_pairingSession)
  {
    [v4 UTF8String];
    int v6 = PairingSessionSetSetupCode();
    if (!v6)
    {
      int v7 = PairingSessionExchange();
      int v6 = v7;
      if (v7)
      {
        if (v7 == -6771) {
          int v6 = 0;
        }
      }
    }
  }
  else
  {
    int v6 = -6718;
  }

  return v6;
}

- (int)_handlePairSetupExchangeWithData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = 0;
  char v22 = 0;
  dispatch_source_t v5 = (void *)MEMORY[0x1D944E080]();
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = (id)objc_opt_class();
    __int16 v29 = 2080;
    uint64_t v30 = "-[_HAPAccessoryServerBTLE100 _handlePairSetupExchangeWithData:]";
    id v8 = v28;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ %s", buf, 0x20u);
  }
  id v9 = v4;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = PairingSessionExchange();
  if (v10)
  {
    uint64_t v11 = v10;
    if (v10 == -6771) {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 1024;
      LODWORD(v28) = v11;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@### Pair-setup message failed: %d\n", buf, 0x12u);
    }
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      self->_pairingSession = 0;
    }
    id v16 = [(HAPAccessoryServerBTLE *)self browser];
    [v16 disconnectFromBTLEAccessoryServer:self];

    id v17 = HMErrorFromOSStatus(v11);
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      id v18 = [(HAPAccessoryServer *)self delegateQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __63___HAPAccessoryServerBTLE100__handlePairSetupExchangeWithData___block_invoke_323;
      v20[3] = &unk_1E69F46E0;
      v20[4] = self;
      id v21 = v17;
      dispatch_async(v18, v20);
    }
    [(_HAPAccessoryServerBTLE100 *)self setStartPairingRequested:0];
  }
  return v11;
}

- (int)_pairSetupStart
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  char v29 = 0;
  if ([(HAPAccessoryServerBTLE *)self isPaired])
  {
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      v3 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke;
      block[3] = &unk_1E69F4330;
      void block[4] = self;
      dispatch_async(v3, block);
    }
    [(_HAPAccessoryServerBTLE100 *)self setStartPairingRequested:0];
    id v4 = 0;
    int v5 = 0;
    goto LABEL_19;
  }
  int v6 = (void *)MEMORY[0x1D944E080]();
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = (id)objc_opt_class();
    __int16 v36 = 2080;
    id v37 = "-[_HAPAccessoryServerBTLE100 _pairSetupStart]";
    id v9 = v35;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ %s", buf, 0x20u);
  }
  int v10 = [(_HAPAccessoryServerBTLE100 *)self _ensurePairingSessionIsInitializedWithType:1];
  if (v10)
  {
    int v5 = v10;
    id v4 = 0;
LABEL_12:
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v13;
      __int16 v34 = 1024;
      LODWORD(v35) = v5;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@### Pair-setup start failed: %d\n", buf, 0x12u);
    }
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      self->_pairingSession = 0;
    }
    id v15 = [(HAPAccessoryServerBTLE *)self browser];
    [v15 disconnectFromBTLEAccessoryServer:self];

    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      id v16 = [(HAPAccessoryServer *)self delegateQueue];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke_322;
      v26[3] = &unk_1E69F3DD0;
      int v27 = v5;
      v26[4] = self;
      dispatch_async(v16, v26);
    }
    [(_HAPAccessoryServerBTLE100 *)self setStartPairingRequested:0];
    goto LABEL_19;
  }
  int v5 = PairingSessionExchange();
  if (v5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v31 length:v30];
    id v18 = [(_HAPAccessoryServerBTLE100 *)self _pairSetupHAPCharacteristic];
    [(_HAPAccessoryServerBTLE100 *)self _notifyDelegateOfSentPlaintextData:v4 forCharacteristic:v18];

    [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
    id v19 = [(HAPAccessoryServerBTLE *)self peripheral];
    __int16 v20 = [(_HAPAccessoryServerBTLE100 *)self pairSetupCharacteristic];
    [v19 writeValue:v4 forCharacteristic:v20 type:0];

    id v21 = (void *)MEMORY[0x1D944E080]();
    char v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      v24 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      id v33 = v23;
      __int16 v34 = 2112;
      id v35 = v24;
      __int16 v36 = 2080;
      id v37 = "-[_HAPAccessoryServerBTLE100 _pairSetupStart]";
      __int16 v38 = 2112;
      id v39 = v4;
      id v25 = v24;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@%@ %s: Writing initial pair setup data: %@", buf, 0x2Au);
    }
  }
  if (v5) {
    goto LABEL_12;
  }
LABEL_19:

  return v5;
}

- (int)_ensurePairingSessionIsInitializedWithType:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_pairingSession = &self->_pairingSession;
  if (self->_pairingSession) {
    return 0;
  }
  int v4 = PairingSessionCreate();
  if (v4) {
    goto LABEL_13;
  }
  uint64_t v6 = PairingSessionSetFlags();
  int v7 = (void *)MEMORY[0x1D944E080](v6);
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = [(_HAPAccessoryServerBTLE100 *)v8 controllerUsername];
    *(_DWORD *)buf = 138543618;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting Pairing session identifier to : %@", buf, 0x16u);
  }
  id v12 = [(_HAPAccessoryServerBTLE100 *)v8 controllerUsername];
  [v12 UTF8String];
  int v4 = PairingSessionSetIdentifier();

  if (v4 || (int v4 = PairingSessionSetMTU()) != 0)
  {
LABEL_13:
    if (*p_pairingSession)
    {
      CFRelease(*p_pairingSession);
      *p_pairingSession = 0;
    }
  }
  return v4;
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91___HAPAccessoryServerBTLE100_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke;
  block[3] = &unk_1E69F4708;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D944E080]();
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v21 = v13;
    __int16 v22 = 2080;
    uint64_t v23 = "-[_HAPAccessoryServerBTLE100 peripheral:didWriteValueForCharacteristic:error:]";
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: Received write confirmation for characteristic %@", buf, 0x20u);
  }
  id v14 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___HAPAccessoryServerBTLE100_peripheral_didWriteValueForCharacteristic_error___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v18 = v10;
  id v19 = v9;
  id v15 = v9;
  id v16 = v10;
  dispatch_async(v14, block);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForCharacteristic_error___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke;
  block[3] = &unk_1E69F4708;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87___HAPAccessoryServerBTLE100_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___HAPAccessoryServerBTLE100_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___HAPAccessoryServerBTLE100_peripheral_didModifyServices___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___HAPAccessoryServerBTLE100_peripheral_didDiscoverServices___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (id)_pairVerifyHAPCharacteristic
{
  v3 = [HAPCharacteristic alloc];
  int v4 = [(HAPAccessoryServerBTLE *)self stateNumber];
  LOBYTE(v7) = 1;
  id v5 = [(HAPCharacteristic *)v3 initWithType:@"0000004E-0000-1000-8000-0026BB765291" instanceID:&unk_1F2C80B80 value:0 stateNumber:v4 properties:6 eventNotificationsEnabled:0 implicitWriteWithResponse:v7 metadata:0];

  return v5;
}

- (id)_pairSetupHAPCharacteristic
{
  v3 = [HAPCharacteristic alloc];
  int v4 = [(HAPAccessoryServerBTLE *)self stateNumber];
  LOBYTE(v7) = 1;
  id v5 = [(HAPCharacteristic *)v3 initWithType:@"0000004C-0000-1000-8000-0026BB765291" instanceID:&unk_1F2C80B68 value:0 stateNumber:v4 properties:6 eventNotificationsEnabled:0 implicitWriteWithResponse:v7 metadata:0];

  return v5;
}

- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&unk_1F2CA6D90])
  {
    BOOL v9 = [(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServerBTLE_willSendPlaintextPayload_forCharacteristic_];

    if (v9)
    {
      id v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83___HAPAccessoryServerBTLE100__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke;
      block[3] = &unk_1E69F4708;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&unk_1F2CA6D90])
  {
    BOOL v9 = [(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServerBTLE_willSendEncryptedAndAuthenticatedPayload_forCharacteristic_];

    if (v9)
    {
      id v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96___HAPAccessoryServerBTLE100__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke;
      block[3] = &unk_1E69F4708;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&unk_1F2CA6D90])
  {
    BOOL v9 = [(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServerBTLE_didReceivePlaintextPayload_forCharacteristic_];

    if (v9)
    {
      id v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke;
      block[3] = &unk_1E69F4708;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(v10, block);
    }
  }
  else
  {
  }
}

- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&unk_1F2CA6D90])
  {
    BOOL v9 = [(HAPAccessoryServer *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke;
      block[3] = &unk_1E69F4708;
      void block[4] = self;
      id v13 = v6;
      id v14 = v7;
      dispatch_async(v11, block);
    }
  }
  else
  {
  }
}

- (BOOL)_shouldEnableSessionSecurity
{
  return 1;
}

- (id)_hapCharacteristicForBTLECharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_btleCharacteristicForHAPCharacteristic:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
  id v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
        id v13 = [v12 objectForKey:v11];
        int v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v15 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  id v4 = [(HAPAccessoryServer *)self delegate];
  if (v4)
  {
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    if (v5)
    {
      id v6 = [(HAPAccessoryServer *)self delegate];
      char v7 = objc_opt_respondsToSelector();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (id)_nextInstanceID
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_HAPAccessoryServerBTLE100 availableInstanceID](self, "availableInstanceID"));
  [(_HAPAccessoryServerBTLE100 *)self setAvailableInstanceID:[(_HAPAccessoryServerBTLE100 *)self availableInstanceID] + 1];

  return v3;
}

- (BOOL)_parseBTLECharacteristicDescriptor:(id)a3 existingDescriptors:(id)a4 characteristics:(id)a5
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
  id v12 = [v11 objectForKey:v10];

  id v13 = [v12 metadata];

  if (!v13)
  {
    int v14 = objc_alloc_init(HAPCharacteristicMetadata);
    [v12 setMetadata:v14];
  }
  id v15 = [v8 UUID];
  id v16 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
  if (![v15 isEqual:v16])
  {

LABEL_10:
    __int16 v24 = [v8 UUID];
    id v25 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCD0]];
    int v26 = [v24 isEqual:v25];

    if (v26)
    {
      id v27 = [v8 value];
      id v123 = v8;
      v124 = v12;
      id v121 = v10;
      if ((unint64_t)[v27 length] <= 6
        || ([v27 getBytes:buf length:7], buf[1]))
      {

LABEL_14:
        id v28 = (void *)MEMORY[0x1D944E080]();
        char v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v131 = v30;
          __int16 v132 = 2112;
          id v133 = v27;
          _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@### Invalid BTLE Format Descriptor: %@", buf, 0x16u);
        }
        uint64_t v31 = 0;
        goto LABEL_17;
      }
      v98 = (void *)buf[0];
      v99 = (void *)*(unsigned __int16 *)&buf[2];
      int v100 = *(unsigned __int16 *)((char *)&v131 + 1);
      int v101 = v131;

      if (v101 != 1 || v100) {
        goto LABEL_14;
      }
      v102 = objc_alloc_init(HAPCharacteristicMetadata);
      v103 = v102;
      if (((_BYTE)v98 - 1) >= 0x1Bu || ((0x50AAAA9u >> ((_BYTE)v98 - 1)) & 1) == 0)
      {
        v104 = (void *)MEMORY[0x1D944E080]();
        v105 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
LABEL_69:

          uint64_t v31 = 0;
LABEL_92:

          id v12 = v124;
LABEL_17:

          __int16 v32 = [(HAPCharacteristicMetadata *)v31 format];
          id v33 = [v12 metadata];
          [v33 setFormat:v32];

          v120 = v31;
          __int16 v34 = [(HAPCharacteristicMetadata *)v31 units];
          id v35 = [v12 metadata];
          [v35 setUnits:v34];

          id v36 = [v12 metadata];
          id v122 = v9;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id obj = v9;
          uint64_t v37 = [obj countByEnumeratingWithState:&v126 objects:buf count:16];
          unint64_t v38 = 0x1E4F1B000uLL;
          if (!v37) {
            goto LABEL_38;
          }
          uint64_t v39 = v37;
          uint64_t v40 = *(void *)v127;
          uint64_t v41 = *MEMORY[0x1E4F1BCE0];
          while (1)
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v127 != v40) {
                objc_enumerationMutation(obj);
              }
              id v43 = *(void **)(*((void *)&v126 + 1) + 8 * i);
              __int16 v44 = [v43 UUID];
              id v45 = [*(id *)(v38 + 3432) UUIDWithString:@"6EB45C6C-A230-4F3A-886F-F8A8EEFC42E8"];
              if (![v44 isEqual:v45]) {
                goto LABEL_25;
              }
              id v46 = [v36 constraints];
              id v47 = [v46 stepValue];
              if (v47)
              {

                unint64_t v38 = 0x1E4F1B000uLL;
LABEL_25:

                goto LABEL_26;
              }
              __int16 v52 = [v43 value];

              unint64_t v38 = 0x1E4F1B000;
              if (v52)
              {
                __int16 v48 = [v36 format];
                id v53 = [v43 value];
                uint64_t v54 = _convertFromBTLEToHAPValue(v48, v53);
                v55 = [v36 constraints];
                [v55 setStepValue:v54];

                goto LABEL_32;
              }
LABEL_26:
              __int16 v48 = [v43 UUID];
              id v49 = [*(id *)(v38 + 3432) UUIDWithString:v41];
              if ([v48 isEqual:v49])
              {
                __int16 v50 = [v36 constraints];
                v51 = [v50 stepValue];
                if (v51)
                {

LABEL_32:
                  unint64_t v38 = 0x1E4F1B000;
                  goto LABEL_35;
                }
                v56 = [v43 value];

                unint64_t v38 = 0x1E4F1B000;
                if (!v56) {
                  continue;
                }
                __int16 v48 = [v43 value];
                _updateHAPConstraintsFromBTLEValidRange(v36, v48);
              }
              else
              {
              }
LABEL_35:
            }
            uint64_t v39 = [obj countByEnumeratingWithState:&v126 objects:buf count:16];
            if (!v39)
            {
LABEL_38:

              id v9 = v122;
              id v8 = v123;
              id v10 = v121;
              id v12 = v124;
              goto LABEL_55;
            }
          }
        }
        v106 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v131 = v106;
        __int16 v132 = 2048;
        id v133 = v98;
        v107 = "%{public}@### Invalid BTLE Format Value: %lu";
LABEL_68:
        _os_log_impl(&dword_1D4758000, v105, OS_LOG_TYPE_ERROR, v107, buf, 0x16u);

        goto LABEL_69;
      }
      uint64_t v118 = [(HAPCharacteristicMetadata *)v102 setFormat:*off_1E69F3F30[((_BYTE)v98 - 1)]];
      if ((int)v99 > 10032)
      {
        switch(v99)
        {
          case 0x2731:
            v119 = @"lux";
            goto LABEL_91;
          case 0x2763:
            v119 = @"arcdegrees";
            goto LABEL_91;
          case 0x27AD:
            v119 = @"percentage";
            goto LABEL_91;
        }
      }
      else
      {
        switch(v99)
        {
          case 0x2700:
            v119 = 0;
            goto LABEL_91;
          case 0x2703:
            v119 = @"seconds";
            goto LABEL_91;
          case 0x272F:
            v119 = @"celsius";
LABEL_91:
            [(HAPCharacteristicMetadata *)v103 setUnits:v119];
            uint64_t v31 = v103;
            goto LABEL_92;
        }
      }
      v104 = (void *)MEMORY[0x1D944E080](v118);
      v105 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
        goto LABEL_69;
      }
      v106 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v131 = v106;
      __int16 v132 = 2048;
      id v133 = v99;
      v107 = "%{public}@### Invalid BTLE Units Value: 0x%lu";
      goto LABEL_68;
    }
    v57 = [v8 UUID];
    v58 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCD8]];
    int v59 = [v57 isEqual:v58];

    if (v59)
    {
      v60 = [v8 value];
      if ([v60 containsString:@";"])
      {
        v61 = [v60 componentsSeparatedByString:@";"];
        v62 = (void *)[v61 mutableCopy];

        if ([(_HAPAccessoryServerBTLE100 *)self hapBLEProtocolVersion] != 1)
        {
          v63 = NSNumber;
          v64 = [v62 objectAtIndexedSubscript:0];
          v65 = objc_msgSend(v63, "numberWithUnsignedInteger:", objc_msgSend(v64, "integerValue"));
          [v12 setInstanceID:v65];
        }
        [v62 removeObjectAtIndex:0];
        v66 = [v62 componentsJoinedByString:@";"];
        v67 = [v12 metadata];
        [v67 setManufacturerDescription:v66];
      }
      else
      {
        v62 = [v8 value];
        v66 = [v12 metadata];
        [v66 setManufacturerDescription:v62];
      }
    }
    else
    {
      v68 = [v8 UUID];
      v69 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"6EB45C6C-A230-4F3A-886F-F8A8EEFC42E8"];
      int v70 = [v68 isEqual:v69];

      if (v70)
      {
        v71 = [v12 metadata];
        v72 = [v71 format];

        if (!v72)
        {
LABEL_55:
          v86 = (void *)MEMORY[0x1D944E080]();
          v87 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            v88 = HMFGetLogIdentifier();
            v89 = [v12 metadata];
            *(_DWORD *)buf = 138543874;
            v131 = v88;
            __int16 v132 = 2112;
            id v133 = v89;
            __int16 v134 = 2112;
            id v135 = v8;
            _os_log_impl(&dword_1D4758000, v87, OS_LOG_TYPE_INFO, "%{public}@HAP Metadata :%@ from BTLEDescriptor: %@", buf, 0x20u);
          }
          BOOL v85 = 1;
          goto LABEL_58;
        }
        v73 = [v12 metadata];
        v74 = [v73 constraints];

        if (!v74)
        {
          v75 = objc_alloc_init(HAPMetadataConstraints);
          v76 = [v12 metadata];
          [v76 setConstraints:v75];
        }
        v60 = [v12 metadata];
        v77 = [v60 format];
        v78 = [v8 value];
        v79 = _convertFromBTLEToHAPValue(v77, v78);
        v80 = [v12 metadata];
        v81 = [v80 constraints];
        [v81 setStepValue:v79];
      }
      else
      {
        v91 = [v8 UUID];
        v92 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCE0]];
        int v93 = [v91 isEqual:v92];

        if (v93)
        {
          v94 = [v12 metadata];
          v95 = [v94 format];

          if (v95)
          {
            v96 = [v12 metadata];
            v97 = [v8 value];
            _updateHAPConstraintsFromBTLEValidRange(v96, v97);
          }
          goto LABEL_55;
        }
        v108 = [v8 UUID];
        v109 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"C5FC363E-D2BF-43E5-928C-AB7D3628470E"];
        int v110 = [v108 isEqual:v109];

        if (!v110)
        {
          v115 = (void *)MEMORY[0x1D944E080]();
          v116 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            v117 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v131 = v117;
            __int16 v132 = 2112;
            id v133 = v8;
            _os_log_impl(&dword_1D4758000, v116, OS_LOG_TYPE_ERROR, "%{public}@Unknown BTLE Descriptor: %@", buf, 0x16u);
          }
          goto LABEL_55;
        }
        v111 = [v8 value];
        v60 = _convertFromBTLEToHAPValue(@"uint16", v111);

        if (([v60 shortValue] & 4) != 0)
        {
          v112 = (void *)MEMORY[0x1D944E080](objc_msgSend(v12, "setProperties:", objc_msgSend(v12, "properties") | 0x10));
          v113 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            v114 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v131 = v114;
            __int16 v132 = 2112;
            id v133 = v10;
            _os_log_impl(&dword_1D4758000, v113, OS_LOG_TYPE_DEFAULT, "%{public}@ ### Characteristic with AAD: %@", buf, 0x16u);
          }
        }
      }
    }

    goto LABEL_55;
  }
  unint64_t v17 = [(_HAPAccessoryServerBTLE100 *)self hapBLEProtocolVersion];

  if (v17 == 1) {
    goto LABEL_10;
  }
  long long v18 = [v8 value];
  LOWORD(v126) = 0;
  if ([v18 length] == 2)
  {
    [v18 getBytes:&v126 length:2];
    long long v19 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v126];
    [v12 setInstanceID:v19];

    long long v20 = (void *)MEMORY[0x1D944E080]();
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = [NSNumber numberWithUnsignedLongLong:(unsigned __int16)v126];
      *(_DWORD *)buf = 138543618;
      v131 = v22;
      __int16 v132 = 2112;
      id v133 = v23;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@HAP Metadata : Found Characteristics with Instance ID = %@", buf, 0x16u);
    }

    goto LABEL_55;
  }
  v82 = (void *)MEMORY[0x1D944E080]();
  v83 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
  {
    v84 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v131 = v84;
    __int16 v132 = 2112;
    id v133 = v18;
    _os_log_impl(&dword_1D4758000, v83, OS_LOG_TYPE_ERROR, "%{public}@HAP Metadata : ### Invalid Characteristic Instance ID bytes %@", buf, 0x16u);
  }

  BOOL v85 = 0;
LABEL_58:

  return v85;
}

- (id)_parseBTLEService:(id)a3 withInstanceId:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 UUID];
  id v9 = [v8 UUIDString];
  id v10 = +[_HAPAccessoryServerBTLE100 _convertFromBTLEToHAPUUID:v9];

  if (v10)
  {
    id v11 = self;
    if ([(_HAPAccessoryServerBTLE100 *)self hapBLEProtocolVersion] == 1)
    {
      uint64_t v12 = [(_HAPAccessoryServerBTLE100 *)self _nextInstanceID];

      id v7 = (id)v12;
    }
    id v53 = [[HAPService alloc] initWithType:v10 instanceID:v7];
    if (v53)
    {
      id v47 = v10;
      id v48 = v7;
      long long v18 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000051-0000-1000-8000-0026BB765291"];
      __int16 v52 = [MEMORY[0x1E4F1CA48] array];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v49 = v6;
      id obj = [v6 characteristics];
      uint64_t v19 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        id v21 = v11;
        uint64_t v22 = *(void *)v56;
        __int16 v50 = v18;
        while (2)
        {
          uint64_t v23 = 0;
          uint64_t v51 = v20;
          do
          {
            if (*(void *)v56 != v22) {
              objc_enumerationMutation(obj);
            }
            __int16 v24 = *(void **)(*((void *)&v55 + 1) + 8 * v23);
            id v25 = [v24 UUID];
            char v26 = [v25 isEqual:v18];

            if ((v26 & 1) == 0)
            {
              unint64_t v27 = [v24 properties];
              uint64_t v28 = (v27 >> 1) & 4 | v27 & 2 | (v27 >> 5) & 1;
              char v29 = [[HAPCharacteristicMetadata alloc] initWithConstraints:0 description:0 format:@"data" units:0];
              uint64_t v30 = [v24 UUID];
              uint64_t v31 = [v30 UUIDString];

              __int16 v32 = [HAPCharacteristic alloc];
              id v33 = [(_HAPAccessoryServerBTLE100 *)v21 _nextInstanceID];
              __int16 v34 = [(HAPAccessoryServerBTLE *)v21 stateNumber];
              LOBYTE(v46) = 1;
              id v35 = [(HAPCharacteristic *)v32 initWithType:v31 instanceID:v33 value:0 stateNumber:v34 properties:v28 eventNotificationsEnabled:0 implicitWriteWithResponse:v46 metadata:v29];

              if (!v35)
              {
                __int16 v42 = (void *)MEMORY[0x1D944E080]();
                id v43 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  __int16 v44 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v61 = v44;
                  _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%{public}@### Creating HAPCharacteristic for BTLE failed init.", buf, 0xCu);
                }

                unint64_t v17 = 0;
                id v7 = v48;
                id v6 = v49;
                id v10 = v47;
                long long v18 = v50;
                unint64_t v38 = v52;
                goto LABEL_25;
              }
              id v36 = [MEMORY[0x1E4F1C9C8] distantPast];
              [(HAPCharacteristic *)v35 setValueUpdatedTime:v36];

              [(HAPCharacteristic *)v35 setService:v53];
              [v52 addObject:v35];
              uint64_t v37 = [(_HAPAccessoryServerBTLE100 *)v21 btleCharacteristicToHAPCharacteristicMap];
              [v37 setObject:v35 forKey:v24];

              long long v18 = v50;
              uint64_t v20 = v51;
            }
            ++v23;
          }
          while (v20 != v23);
          uint64_t v20 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      unint64_t v38 = v52;
      [(HAPService *)v53 setCharacteristics:v52];
      unint64_t v17 = v53;
      id v7 = v48;
      id v6 = v49;
      id v10 = v47;
LABEL_25:
    }
    else
    {
      uint64_t v39 = (void *)MEMORY[0x1D944E080]();
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v61 = v41;
        _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, "%{public}@### Creating HAPService for BTLE failed init.", buf, 0xCu);
      }
      unint64_t v17 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D944E080]();
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v6 UUID];
      *(_DWORD *)buf = 138543618;
      v61 = v15;
      __int16 v62 = 2112;
      v63 = v16;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@### [HAP Accessory Server BTLE] Failed converting from BTLE UUID to internal: %@", buf, 0x16u);
    }
    unint64_t v17 = 0;
  }

  return v17;
}

- (void)_handleHAPServiceDiscoveryCompletionForService:(id)a3 withInstanceId:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE100 *)self _parseBTLEService:v6 withInstanceId:v7];
  if (v8)
  {
    id v9 = [(_HAPAccessoryServerBTLE100 *)self btleServiceToHAPServiceMap];
    [v9 setObject:v8 forKey:v6];

    id v10 = [(HAPAccessoryServer *)self primaryAccessory];
    [v8 setAccessory:v10];

    id v11 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v12 = [(HAPAccessoryServer *)self primaryAccessory];
    id v13 = [v12 services];
    int v14 = [v11 arrayWithArray:v13];

    [v14 addObject:v8];
    id v15 = [(HAPAccessoryServer *)self primaryAccessory];
    [v15 setServices:v14];

    [(_HAPAccessoryServerBTLE100 *)self setCharacteristicValueReadCount:[(_HAPAccessoryServerBTLE100 *)self characteristicValueReadCount] - 1];
    if (![(_HAPAccessoryServerBTLE100 *)self characteristicDiscoveryRequestCount]
      && ![(_HAPAccessoryServerBTLE100 *)self characteristicValueReadCount])
    {
      [(_HAPAccessoryServerBTLE100 *)self _handlePairingStateMachine];
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D944E080]();
    unint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v18;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@### Unable to parse BTLE service", buf, 0xCu);
    }
    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:66];
    uint64_t v20 = [(HAPAccessoryServer *)self delegateQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92___HAPAccessoryServerBTLE100__handleHAPServiceDiscoveryCompletionForService_withInstanceId___block_invoke;
    v22[3] = &unk_1E69F46E0;
    v22[4] = self;
    id v23 = v19;
    id v21 = v19;
    dispatch_async(v20, v22);
  }
}

- (void)_handleHAPCharacteristicDiscoveryForService:(id)a3 error:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  id v7 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000051-0000-1000-8000-0026BB765291"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [v6 characteristics];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v14 = [v13 UUID];
        int v15 = [v14 isEqual:v7];

        if (v15)
        {
          [(_HAPAccessoryServerBTLE100 *)self setCharacteristicValueReadCount:[(_HAPAccessoryServerBTLE100 *)self characteristicValueReadCount] + 1];
          uint64_t v22 = [(HAPAccessoryServerBTLE *)self peripheral];
          [v22 readValueForCharacteristic:v13];

          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = (void *)MEMORY[0x1D944E080]();
  unint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = HMFGetLogIdentifier();
    uint64_t v19 = [(HAPAccessoryServer *)self identifier];
    uint64_t v20 = [(HAPAccessoryServer *)self name];
    id v21 = [v6 UUID];
    *(_DWORD *)buf = 138544130;
    char v29 = v18;
    __int16 v30 = 2112;
    uint64_t v31 = v19;
    __int16 v32 = 2112;
    id v33 = v20;
    __int16 v34 = 2112;
    id v35 = v21;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@ '%@'] Service with UUID %@ does not have the HAP Service Instance ID characteristic, skipping HAPService creation", buf, 0x2Au);
  }
LABEL_13:
  [(_HAPAccessoryServerBTLE100 *)self setCharacteristicDiscoveryRequestCount:[(_HAPAccessoryServerBTLE100 *)self characteristicDiscoveryRequestCount] - 1];
}

- (void)_handleReadDescriptorValues
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(_HAPAccessoryServerBTLE100 *)self setMetadataValueReadCount:0];
  if ([(_HAPAccessoryServerBTLE100 *)self hapBLEProtocolVersion] == 1)
  {
    v3 = (void *)MEMORY[0x1D944E080]();
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Skipping descriptor reads", buf, 0xCu);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
    id v7 = [v6 keyEnumerator];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v13 = [v12 descriptors];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v33 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v24;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
                [(_HAPAccessoryServerBTLE100 *)self setMetadataValueReadCount:[(_HAPAccessoryServerBTLE100 *)self metadataValueReadCount] + 1];
                [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
                uint64_t v19 = [(HAPAccessoryServerBTLE *)self peripheral];
                [v19 readValueForDescriptor:v18];

                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v33 count:16];
            }
            while (v15);
          }

          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v9);
    }
  }
  if (![(_HAPAccessoryServerBTLE100 *)self metadataValueReadCount])
  {
    [(_HAPAccessoryServerBTLE100 *)self _handlePairingStateMachine];
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didDiscoverAccessories_transaction_error_])
    {
      uint64_t v20 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57___HAPAccessoryServerBTLE100__handleReadDescriptorValues__block_invoke;
      block[3] = &unk_1E69F4330;
      void block[4] = self;
      dispatch_async(v20, block);
    }
  }
}

- (void)_handleDescriptorDiscovery
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(_HAPAccessoryServerBTLE100 *)self setMetadataDiscoveryRequestCount:0];
  if ([(_HAPAccessoryServerBTLE100 *)self hapBLEProtocolVersion] == 1)
  {
    v3 = (void *)MEMORY[0x1D944E080]();
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v24 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Skipping descriptor discovery", buf, 0xCu);
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
    id v7 = [v6 keyEnumerator];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v20;
      *(void *)&long long v9 = 138543618;
      long long v18 = v9;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          uint64_t v14 = (void *)MEMORY[0x1D944E080]();
          uint64_t v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v18;
            long long v24 = v16;
            __int16 v25 = 2112;
            uint64_t v26 = v13;
            _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Discovering metadata for BTLE Char: %@", buf, 0x16u);
          }
          [(_HAPAccessoryServerBTLE100 *)self setMetadataDiscoveryRequestCount:[(_HAPAccessoryServerBTLE100 *)self metadataDiscoveryRequestCount] + 1];
          [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
          uint64_t v17 = [(HAPAccessoryServerBTLE *)self peripheral];
          [v17 discoverDescriptorsForCharacteristic:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v10);
    }
  }
  if (![(_HAPAccessoryServerBTLE100 *)self metadataDiscoveryRequestCount]) {
    [(_HAPAccessoryServerBTLE100 *)self _handlePairingStateMachine];
  }
}

- (void)_handleHAPServiceDiscovery
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(_HAPAccessoryServerBTLE100 *)self setCharacteristicDiscoveryRequestCount:0];
  [(_HAPAccessoryServerBTLE100 *)v2 setCharacteristicValueReadCount:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v3 = [(HAPAccessoryServerBTLE *)v2 peripheral];
  id v4 = [v3 services];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v8 = *MEMORY[0x1E4F1BCE8];
    uint64_t v27 = *MEMORY[0x1E4F1BCB8];
    uint64_t v28 = *MEMORY[0x1E4F1BCC0];
    uint64_t v23 = *MEMORY[0x1E4F1BCB0];
    long long v24 = v2;
    unint64_t v9 = 0x1E4F1B000uLL;
    uint64_t v29 = *MEMORY[0x1E4F1BCE8];
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      uint64_t v31 = v6;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        uint64_t v12 = [(_HAPAccessoryServerBTLE100 *)v2 pairingService];
        if ([v11 isEqual:v12]) {
          goto LABEL_12;
        }
        id v13 = v11;
        uint64_t v14 = [v13 UUID];
        uint64_t v15 = [*(id *)(v9 + 3432) UUIDWithString:v8];
        if ([v14 isEqual:v15])
        {

          goto LABEL_11;
        }
        uint64_t v16 = [v13 UUID];
        uint64_t v17 = [*(id *)(v9 + 3432) UUIDWithString:v28];
        if ([v16 isEqual:v17])
        {

          uint64_t v8 = v29;
          uint64_t v7 = v30;
LABEL_11:
          uint64_t v6 = v31;
LABEL_12:

          goto LABEL_13;
        }
        long long v18 = [v13 UUID];
        long long v19 = [*(id *)(v9 + 3432) UUIDWithString:v27];
        if ([v18 isEqual:v19])
        {

          uint64_t v8 = v29;
          uint64_t v7 = v30;
          uint64_t v6 = v31;
          unint64_t v9 = 0x1E4F1B000;
          goto LABEL_12;
        }
        [v13 UUID];
        long long v20 = v25 = v18;
        long long v21 = [MEMORY[0x1E4F1BD68] UUIDWithString:v23];
        char v26 = [v20 isEqual:v21];

        v2 = v24;
        uint64_t v8 = v29;
        uint64_t v7 = v30;
        uint64_t v6 = v31;
        unint64_t v9 = 0x1E4F1B000;
        if ((v26 & 1) == 0)
        {
          [(_HAPAccessoryServerBTLE100 *)v24 setCharacteristicDiscoveryRequestCount:[(_HAPAccessoryServerBTLE100 *)v24 characteristicDiscoveryRequestCount]+ 1];
          [(_HAPAccessoryServerBTLE100 *)v24 _updateConnectionLifetimeTimer];
          uint64_t v12 = [(HAPAccessoryServerBTLE *)v24 peripheral];
          [v12 discoverCharacteristics:0 forService:v13];
          goto LABEL_12;
        }
LABEL_13:
        ++v10;
      }
      while (v6 != v10);
      uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v6 = v22;
    }
    while (v22);
  }
}

- (void)_getAttributeDatabase
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2080;
    long long v19 = "-[_HAPAccessoryServerBTLE100 _getAttributeDatabase]";
    id v6 = v17;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@%@ %s: Getting HAP attribute database from accessory", buf, 0x20u);
  }
  if ([(_HAPAccessoryServerBTLE100 *)self state] == 12)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [(HAPAccessoryServer *)self identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Ignoring request to discover accessories because the session is already established, calling delegate immediately", buf, 0x16u);
    }
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didDiscoverAccessories_transaction_error_])
    {
      uint64_t v11 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51___HAPAccessoryServerBTLE100__getAttributeDatabase__block_invoke;
      block[3] = &unk_1E69F4330;
      void block[4] = self;
      dispatch_async(v11, block);
    }
  }
  else
  {
    [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
    uint64_t v12 = [(HAPAccessoryServerBTLE *)self peripheral];
    [v12 discoverServices:0];
  }
}

- (void)discoverAccessories
{
  v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)securitySessionDidOpen:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___HAPAccessoryServerBTLE100_securitySessionDidOpen___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)securitySessionIsOpening:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___HAPAccessoryServerBTLE100_securitySessionIsOpening___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74___HAPAccessoryServerBTLE100_securitySession_didReceiveSetupExchangeData___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HAPAccessoryServer *)self identifier];
  char v11 = [v10 isEqualToString:v9];

  if (v11)
  {
    id v12 = [(HAPAccessoryServer *)self keyStore];
    id v31 = 0;
    id v13 = [v12 readPublicKeyForAccessoryName:v9 registeredWithHomeKit:0 error:&v31];
    id v14 = v31;

    if (v13)
    {
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v13];
      __int16 v16 = [[HAPPairingIdentity alloc] initWithIdentifier:v9 publicKey:v15 privateKey:0 permissions:0];
      if (!v16)
      {
        id v17 = (void *)MEMORY[0x1D944E080]();
        __int16 v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v19 = uint64_t v30 = v17;
          uint64_t v20 = [(HAPAccessoryServer *)self identifier];
          *(_DWORD *)buf = 138544130;
          long long v33 = v19;
          __int16 v34 = 2112;
          long long v35 = v20;
          __int16 v36 = 2112;
          id v37 = v9;
          __int16 v38 = 2112;
          id v39 = v13;
          _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Failed to create pairing identity with identifier, %@, public key, %@", buf, 0x2Au);

          id v17 = v30;
        }

        if (a5)
        {
          *a5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Failed to retrieve peer pairing identity." reason:@"Failed to create pairing identity" suggestion:0 underlyingError:0];
        }
      }
    }
    else
    {
      __int16 v25 = (void *)MEMORY[0x1D944E080]();
      char v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        uint64_t v28 = [(HAPAccessoryServer *)self identifier];
        *(_DWORD *)buf = 138544130;
        long long v33 = v27;
        __int16 v34 = 2112;
        long long v35 = v28;
        __int16 v36 = 2112;
        id v37 = v9;
        __int16 v38 = 2112;
        id v39 = v14;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Failed to retrieved public key for accessory with identifier '%@' with error: %@", buf, 0x2Au);
      }
      __int16 v16 = 0;
    }
  }
  else
  {
    long long v21 = (void *)MEMORY[0x1D944E080]();
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      long long v24 = [(HAPAccessoryServer *)self identifier];
      *(_DWORD *)buf = 138543874;
      long long v33 = v23;
      __int16 v34 = 2112;
      long long v35 = v24;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Unexpected pairing peer identifier, %@", buf, 0x20u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:16 description:@"Insufficient Authorization." reason:@"Unexpected pairing peer identifier." suggestion:0 underlyingError:0];
      __int16 v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v16 = 0;
    }
  }

  return v16;
}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [(HAPAccessoryServer *)self identifier];
    int v16 = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    long long v19 = v10;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] Request for local pairing identity", (uint8_t *)&v16, 0x16u);
  }
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled != 1
    || ([(HAPAccessoryServer *)self keyBag],
        char v11 = objc_claimAutoreleasedReturnValue(),
        [v11 currentIdentity],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    id v13 = [(HAPAccessoryServer *)self keyStore];
    id v14 = [(HAPAccessoryServer *)self identifier];
    id v12 = [v13 readControllerPairingKeyForAccessory:v14 error:a4];
  }

  return v12;
}

- (id)_decryptData:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    id v17 = "-[_HAPAccessoryServerBTLE100 _decryptData:error:]";
    __int16 v18 = 2048;
    uint64_t v19 = [v6 length];
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%s: Decrypting data with length %lu", (uint8_t *)&v14, 0x20u);
  }
  id v10 = [(_HAPAccessoryServerBTLE100 *)self securitySession];

  if (v10)
  {
    char v11 = [(_HAPAccessoryServerBTLE100 *)self securitySession];
    id v12 = [v11 decryptData:v6 additionalAuthenticatedData:0 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6718 userInfo:0];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    id v17 = "-[_HAPAccessoryServerBTLE100 _encryptDataAndGenerateAuthTag:error:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%s: Encrypting plaintext data: %@", (uint8_t *)&v14, 0x20u);
  }
  id v10 = [(_HAPAccessoryServerBTLE100 *)self securitySession];

  if (v10)
  {
    char v11 = [(_HAPAccessoryServerBTLE100 *)self securitySession];
    id v12 = [v11 encryptData:v6 additionalAuthenticatedData:0 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6718 userInfo:0];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_handleReceivedSecuritySessionSetupExchangeData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HAPAccessoryServerBTLE100 *)self securitySession];
  if (v5
    && (id v6 = (void *)v5,
        BOOL v7 = [(HAPAccessoryServer *)self isSecuritySessionOpen],
        v6,
        !v7))
  {
    id v12 = [(_HAPAccessoryServerBTLE100 *)self securitySession];
    [v12 receivedSetupExchangeData:v4 error:0];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      char v11 = [(HAPAccessoryServer *)self identifier];
      int v13 = 138543618;
      int v14 = v10;
      __int16 v15 = 2112;
      __int16 v16 = v11;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Unexpected security session setup exchange data, dropping.", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_reallyEstablishSecureSession
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HAPAccessoryServerBTLE *)self isPaired])
  {
    if ([(HAPAccessoryServer *)self isSecuritySessionOpen])
    {
      v3 = (void *)MEMORY[0x1D944E080]();
      id v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = HMFGetLogIdentifier();
        id v6 = [(HAPAccessoryServer *)self identifier];
        int v12 = 138543618;
        int v13 = v5;
        __int16 v14 = 2112;
        __int16 v15 = v6;
        _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] A security session is already established.", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [(HAPAccessoryServer *)self identifier];
      int v12 = 138543618;
      int v13 = v9;
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Unable to establish a secure session because the accessory isn't paired.", (uint8_t *)&v12, 0x16u);
    }
    [MEMORY[0x1E4F28C58] errorWithHMErrorCode:18];
  }
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled == 1) {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
  }
  char v11 = [[HAPSecuritySession alloc] initWithRole:0 resumeSessionID:0 delegate:self];
  [(_HAPAccessoryServerBTLE100 *)self setSecuritySession:v11];
  [(HAPSecuritySession *)v11 open];
}

- (void)_handleUpdatedValueForBTLECharacteristic:(id)a3 error:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    char v11 = [v6 UUID];
    int v12 = [v6 value];
    *(_DWORD *)buf = 138544130;
    int v70 = v10;
    __int16 v71 = 2112;
    id v72 = v11;
    __int16 v73 = 2112;
    id v74 = v12;
    __int16 v75 = 2112;
    id v76 = v7;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Updated value for BTLE characteristic: %@ Value: %@ error: %@", buf, 0x2Au);
  }
  id v13 = v7;
  __int16 v14 = v13;
  if (v13)
  {
    __int16 v15 = 0;
    id v16 = v13;
    goto LABEL_5;
  }
  __int16 v15 = [(_HAPAccessoryServerBTLE100 *)self _hapCharacteristicForBTLECharacteristic:v6];
  if (!v15)
  {
    uint64_t v54 = (void *)MEMORY[0x1D944E080]();
    long long v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      long long v56 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v70 = v56;
      __int16 v71 = 2112;
      id v72 = v6;
      _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_ERROR, "%{public}@### Unable to find HAP characteristic for BTLE characteristic %@ after receiving read response", buf, 0x16u);
    }
    uint64_t v57 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:27];
    if (v57)
    {
      id v16 = (id)v57;
      __int16 v15 = 0;
      goto LABEL_5;
    }
  }
  uint64_t v29 = [v6 value];
  uint64_t v30 = [v29 length];

  if (!v30)
  {
    char v22 = 0;
    id v16 = 0;
    goto LABEL_8;
  }
  BOOL v31 = [(_HAPAccessoryServerBTLE100 *)self _shouldEnableSessionSecurity];
  __int16 v32 = [v6 value];
  if (v31)
  {
    [(_HAPAccessoryServerBTLE100 *)self _notifyDelegateOfReceivedEncryptedAuthenticatedData:v32 forCharacteristic:v15];

    long long v33 = [v6 value];
    id v68 = 0;
    __int16 v32 = [(_HAPAccessoryServerBTLE100 *)self _decryptData:v33 error:&v68];
    id v34 = v68;

    if (v34)
    {
      long long v35 = (void *)MEMORY[0x1D944E080]();
      __int16 v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        int v70 = v37;
        __int16 v71 = 2112;
        id v72 = v6;
        __int16 v73 = 2112;
        id v74 = v34;
        _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%{public}@### Decrypting data for characteristic %@ received after a read request failed with error: %@", buf, 0x20u);
      }
      __int16 v38 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:55];
      goto LABEL_39;
    }
  }
  else
  {
    id v34 = 0;
  }
  __int16 v38 = 0;
LABEL_39:
  [(_HAPAccessoryServerBTLE100 *)self _notifyDelegateOfReceivedPlaintextData:v32 forCharacteristic:v15];
  long long v58 = [v15 metadata];
  int v59 = [v58 format];
  uint64_t v60 = HAPCharacteristicFormatFromString(v59);

  id v67 = v38;
  v61 = +[_HAPAccessoryServerBTLE100 deserializeCharacteristicReadData:characteristicFormat:supportsAdditionalAuthentication:error:](_HAPAccessoryServerBTLE100, "deserializeCharacteristicReadData:characteristicFormat:supportsAdditionalAuthentication:error:", v32, v60, [v15 supportsAdditionalAuthorizationData], &v67);
  id v16 = v67;

  if (!v16)
  {
    [v15 setValue:v61];

    char v22 = 0;
    goto LABEL_8;
  }

LABEL_5:
  uint64_t v17 = (void *)MEMORY[0x1D944E080]();
  __int16 v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    uint64_t v20 = [(HAPAccessoryServer *)self identifier];
    long long v21 = [(HAPAccessoryServer *)self name];
    *(_DWORD *)buf = 138544130;
    int v70 = v19;
    __int16 v71 = 2112;
    id v72 = v20;
    __int16 v73 = 2112;
    id v74 = v21;
    __int16 v75 = 2112;
    id v76 = v16;
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@### [BTLE Accessory Server '%@' '%@'] Failed to process updated characteristic value with error: %@", buf, 0x2Au);
  }
  char v22 = 1;
LABEL_8:
  uint64_t v23 = [(_HAPAccessoryServerBTLE100 *)self _dequeueReadCompletionTupleForCharacteristic:v15];
  long long v24 = v23;
  if (v23)
  {
    uint64_t v25 = [v23 completionQueue];
    if (v25)
    {
      char v26 = (void *)v25;
      uint64_t v27 = [v24 handler];

      if (v27)
      {
        uint64_t v28 = [v24 completionQueue];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_188;
        v62[3] = &unk_1E69F4708;
        id v63 = v24;
        id v64 = v15;
        id v65 = v16;
        dispatch_async(v28, v62);
      }
    }
  }
  else
  {
    id v39 = (void *)MEMORY[0x1D944E080]();
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v70 = v41;
      __int16 v71 = 2112;
      id v72 = v15;
      _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_INFO, "%{public}@Received notification for HAPCharacteristic %@, Reading Value", buf, 0x16u);
    }
    __int16 v42 = [(HAPAccessoryServerBTLE *)self browser];
    id v43 = [(HAPAccessoryServer *)self identifier];
    [v42 markNotifyingCharacteristicUpdatedForIdentifier:v43];

    __int16 v44 = [v6 value];
    if ([v44 length]) {
      char v45 = 1;
    }
    else {
      char v45 = v22;
    }
    if (v45)
    {
    }
    else
    {
      int v46 = [v15 eventNotificationsEnabled];

      if (v46)
      {
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke;
        v66[3] = &unk_1E69F3D80;
        v66[4] = self;
        id v47 = (void *)MEMORY[0x1D944E2D0](v66);
        [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
        id v48 = [(HAPAccessoryServer *)self clientQueue];
        [(_HAPAccessoryServerBTLE100 *)self readValueForCharacteristic:v15 queue:v48 completionHandler:v47];

        goto LABEL_31;
      }
    }
    id v49 = (void *)MEMORY[0x1D944E080]();
    __int16 v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = HMFGetLogIdentifier();
      __int16 v52 = [(HAPAccessoryServer *)self identifier];
      id v53 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138544130;
      int v70 = v51;
      __int16 v71 = 2112;
      id v72 = v52;
      __int16 v73 = 2112;
      id v74 = v53;
      __int16 v75 = 2112;
      id v76 = v16;
      _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_ERROR, "%{public}@### [BTLE Accessory Server '%@' '%@'] Failed to process updated characteristic value with error: %@", buf, 0x2Au);
    }
  }
LABEL_31:
}

- (void)_readValueForCharacteristic:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(_HAPAccessoryServerBTLE100 *)self _btleCharacteristicForHAPCharacteristic:v8];
  if (v11)
  {
    if (([v8 properties] & 2) != 0)
    {
      if (![(_HAPAccessoryServerBTLE100 *)self isDisconnecting])
      {
        [(_HAPAccessoryServerBTLE100 *)self _enqueueReadCompletionHandler:v10 queue:v9 forCharacteristic:v8];
        [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
        __int16 v18 = [(HAPAccessoryServerBTLE *)self peripheral];
        [v18 readValueForCharacteristic:v11];
        goto LABEL_20;
      }
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = [NSString stringWithFormat:@"Failed to read the value of characteristic %@", v8];
      __int16 v18 = [v27 errorWithHMErrorCode:4 reason:v28 underlyingError:0];

      if (v9 && v10)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_2;
        v29[3] = &unk_1E69F4070;
        id v32 = v10;
        id v30 = v8;
        id v31 = v18;
        dispatch_async(v9, v29);

        id v19 = v32;
        goto LABEL_18;
      }
    }
    else
    {
      int v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v44 = v14;
        __int16 v45 = 2112;
        id v46 = v8;
        _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to read HAP characteristic %@: it does not support reading", buf, 0x16u);
      }
      __int16 v15 = (void *)MEMORY[0x1E4F28C58];
      id v16 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v17 = [v16 localizedStringForKey:@"The characteristic does not support reading." value:&stru_1F2C4E778 table:0];
      __int16 v18 = [v15 errorWithHMErrorCode:6 reason:v17 underlyingError:0];

      if (v9 && v10)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_187;
        block[3] = &unk_1E69F4070;
        id v36 = v10;
        id v34 = v8;
        id v35 = v18;
        dispatch_async(v9, block);

        id v19 = v36;
LABEL_18:
      }
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1D944E080]();
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      char v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v44 = v22;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to read HAP characteristic %@: it does not have a corresponding BTLE characteristic", buf, 0x16u);
    }
    v41[0] = *MEMORY[0x1E4F28568];
    uint64_t v23 = [NSString stringWithFormat:@"Failed to read the value of characteristic %@", v8];
    v42[0] = v23;
    v41[1] = *MEMORY[0x1E4F28588];
    long long v24 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v25 = [v24 localizedStringForKey:@"Unable to find matching BTLE characteristic" value:&stru_1F2C4E778 table:0];
    v42[1] = v25;
    __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

    char v26 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:2 userInfo:v18];
    if (v9 && v10)
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke;
      v37[3] = &unk_1E69F4070;
      id v40 = v10;
      id v38 = v8;
      id v39 = v26;
      dispatch_async(v9, v37);
    }
  }
LABEL_20:
}

- (void)_readCharacteristicValues:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v23 = a4;
  id v22 = a5;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = dispatch_group_create();
  uint64_t v25 = [MEMORY[0x1E4F653F0] currentActivity];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
        dispatch_group_enter(v10);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke;
        v30[3] = &unk_1E69F3D30;
        id v31 = v25;
        id v32 = v9;
        long long v33 = v10;
        id v16 = (void *)MEMORY[0x1D944E2D0](v30);
        [v15 instanceID];

        uint64_t v17 = [(HAPAccessoryServer *)self clientQueue];
        [(_HAPAccessoryServerBTLE100 *)self _readValueForCharacteristic:v15 completionQueue:v17 completionHandler:v16];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  __int16 v18 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_179;
  block[3] = &unk_1E69F3D58;
  void block[4] = self;
  id v27 = v23;
  id v28 = v9;
  id v29 = v22;
  id v19 = v9;
  id v20 = v22;
  id v21 = v23;
  dispatch_group_notify(v10, v18, block);
}

- (void)readValueForCharacteristic:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke;
  v15[3] = &unk_1E69F3D58;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E69F3C90;
  double v21 = a4;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)_handleHAPWriteConfirmationForCharacteristic:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = [(_HAPAccessoryServerBTLE100 *)self _hapCharacteristicForBTLECharacteristic:v6];
  id v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v19 = 138543874;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      long long v24 = v7;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Received write completion for characteristic %@ with error %@", (uint8_t *)&v19, 0x20u);
    }
    uint64_t v13 = [(_HAPAccessoryServerBTLE100 *)self _dequeueWriteCompletionHandlerForCharacteristic:v8];
    id v14 = (void *)v13;
    if (v13)
    {
      (*(void (**)(uint64_t, char *, char *))(v13 + 16))(v13, v8, v7);
    }
    else
    {
      id v16 = (void *)MEMORY[0x1D944E080]();
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v19 = 138543874;
        id v20 = v18;
        __int16 v21 = 2080;
        id v22 = "-[_HAPAccessoryServerBTLE100 _handleHAPWriteConfirmationForCharacteristic:error:]";
        __int16 v23 = 2112;
        long long v24 = v8;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@%s: ### Unable to get write completion handler for %@ after receiving a write confirmation", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v15;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@### Unable to find HAP characteristic for BTLE characteristic after receiving write confirmation", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 authorizationData:(id)a5 withCompletionHandler:(id)a6 queue:(id)a7
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(_HAPAccessoryServerBTLE100 *)self _btleCharacteristicForHAPCharacteristic:v12];
  if (!v16)
  {
    uint64_t v25 = (void *)MEMORY[0x1D944E080]();
    char v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v93 = (uint64_t)v27;
      __int16 v94 = 2112;
      id v95 = v12;
      _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to write HAP characteristic %@: it does not have a corresponding BTLE characteristic", buf, 0x16u);
    }
    v90[0] = *MEMORY[0x1E4F28568];
    id v28 = [NSString stringWithFormat:@"Failed to write the value of characteristic %@", v12];
    v91[0] = v28;
    v90[1] = *MEMORY[0x1E4F28588];
    id v29 = [MEMORY[0x1E4F28B50] mainBundle];
    id v30 = [v29 localizedStringForKey:@"Unable to find matching BTLE characteristic" value:&stru_1F2C4E778 table:0];
    v91[1] = v30;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];

    id v24 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:2 userInfo:v23];
    if (v14 && v15)
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke;
      v86[3] = &unk_1E69F4070;
      id v89 = v14;
      id v87 = v12;
      id v24 = v24;
      id v88 = v24;
      dispatch_async(v15, v86);
    }
    goto LABEL_39;
  }
  if (([v12 properties] & 4) != 0)
  {
    id v31 = [v12 metadata];
    id v32 = [v31 format];
    uint64_t v33 = HAPCharacteristicFormatFromString(v32);

    id v81 = 0;
    +[_HAPAccessoryServerBTLE100 serializeCharacteristicWriteValue:characteristicFormat:supportsAdditionalAuthentication:authenticationData:error:](_HAPAccessoryServerBTLE100, "serializeCharacteristicWriteValue:characteristicFormat:supportsAdditionalAuthentication:authenticationData:error:", v61, v33, [v12 supportsAdditionalAuthorizationData], v13, &v81);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v81;
    if (v23)
    {
      if (!v14 || !v15) {
        goto LABEL_39;
      }
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_2;
      v77[3] = &unk_1E69F4070;
      id v80 = v14;
      id v78 = v12;
      id v79 = v23;
      dispatch_async(v15, v77);

      id v34 = v80;
      goto LABEL_38;
    }
    if ([(_HAPAccessoryServerBTLE100 *)self isDisconnecting])
    {
      long long v35 = (void *)MEMORY[0x1E4F28C58];
      long long v36 = [NSString stringWithFormat:@"Failed to write the value of characteristic %@", v12];
      id v34 = [v35 errorWithHMErrorCode:4 reason:v36 underlyingError:0];

      if (v14 && v15)
      {
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_3;
        v73[3] = &unk_1E69F4070;
        id v76 = v14;
        id v74 = v12;
        id v34 = v34;
        id v75 = v34;
        dispatch_async(v15, v73);
      }
      goto LABEL_38;
    }
    long long v37 = [MEMORY[0x1E4F653F0] currentActivity];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_4;
    v67[3] = &unk_1E69F3CB8;
    v67[4] = v61;
    id v56 = v12;
    id v68 = v56;
    v69 = self;
    id v59 = v37;
    id v70 = v59;
    id v53 = v14;
    id v72 = v53;
    id v38 = v15;
    __int16 v71 = v38;
    uint64_t v58 = MEMORY[0x1D944E2D0](v67);
    id v57 = v13;
    if ([(_HAPAccessoryServerBTLE100 *)self _shouldEnableSessionSecurity])
    {
      uint64_t v51 = v38;
      id v66 = 0;
      id v60 = [(_HAPAccessoryServerBTLE100 *)self _encryptDataAndGenerateAuthTag:v24 error:&v66];
      id v39 = v66;
      context = (void *)MEMORY[0x1D944E080]();
      id v40 = HMFGetOSLogHandle();
      if (v39)
      {
        uint64_t v41 = v40;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          __int16 v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v93 = (uint64_t)v42;
          __int16 v94 = 2112;
          id v95 = v39;
          _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Failed to encrypt payload with error: %@", buf, 0x16u);
        }
        id v43 = v39;

        if (v53)
        {
          __int16 v44 = (void *)v58;
          id v34 = v59;
          if (v51)
          {
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_165;
            v62[3] = &unk_1E69F4070;
            id v65 = v53;
            id v63 = v56;
            id v64 = v43;
            dispatch_async(v51, v62);
          }
        }
        else
        {
          __int16 v44 = (void *)v58;
          id v34 = v59;
        }
        __int16 v50 = v60;
        goto LABEL_37;
      }
      id v49 = v40;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        long long v55 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v93 = (uint64_t)v55;
        __int16 v94 = 2112;
        id v95 = v60;
        _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_INFO, "%{public}@Sending encrypted data: %@", buf, 0x16u);
      }
      id v48 = v56;
      [(_HAPAccessoryServerBTLE100 *)self _notifyDelegateOfSentEncryptedAuthenticatedData:v60 forCharacteristic:v56];
    }
    else
    {
      id v60 = v24;
      uint64_t v54 = (void *)MEMORY[0x1D944E080]();
      __int16 v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        uint64_t v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v93 = v46;
        uint64_t v47 = (void *)v46;
        _os_log_impl(&dword_1D4758000, v45, OS_LOG_TYPE_INFO, "%{public}@Sending plaintext data because encryption has been disabled.", buf, 0xCu);
      }
      id v48 = v56;
    }
    [(_HAPAccessoryServerBTLE100 *)self _enqueueWriteCompletionHandler:v58 forCharacteristic:v48];
    [(_HAPAccessoryServerBTLE100 *)self _notifyDelegateOfSentPlaintextData:v24 forCharacteristic:v48];
    [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
    __int16 v44 = (void *)v58;
    id v43 = [(HAPAccessoryServerBTLE *)self peripheral];
    __int16 v50 = v60;
    [v43 writeValue:v60 forCharacteristic:v16 type:0];
    id v34 = v59;
LABEL_37:

    id v13 = v57;
LABEL_38:

    goto LABEL_39;
  }
  id v17 = (void *)MEMORY[0x1D944E080]();
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v93 = (uint64_t)v19;
    __int16 v94 = 2112;
    id v95 = v12;
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to write HAP characteristic %@: it does not support writing", buf, 0x16u);
  }
  id v20 = (void *)MEMORY[0x1E4F28C58];
  __int16 v21 = [MEMORY[0x1E4F28B50] mainBundle];
  id v22 = [v21 localizedStringForKey:@"The characteristic does not support writing." value:&stru_1F2C4E778 table:0];
  id v23 = [v20 errorWithHMErrorCode:5 reason:v22 underlyingError:0];

  if (v14 && v15)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_154;
    block[3] = &unk_1E69F4070;
    id v85 = v14;
    id v83 = v12;
    id v23 = v23;
    id v84 = v23;
    dispatch_async(v15, block);

    id v24 = v85;
LABEL_39:
  }
}

- (void)_writeCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v25 = a4;
  id v24 = a5;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  id v9 = dispatch_group_create();
  char v26 = [MEMORY[0x1E4F653F0] currentActivity];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        dispatch_group_enter(v9);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke;
        v34[3] = &unk_1E69F3BC8;
        id v35 = v29;
        long long v36 = v9;
        id v14 = (void *)MEMORY[0x1D944E2D0](v34);
        id v15 = [v13 characteristic];
        [v15 instanceID];

        id v16 = [v13 value];
        id v17 = [v13 characteristic];
        id v18 = [v13 authorizationData];
        int v19 = [(HAPAccessoryServer *)self clientQueue];
        [(_HAPAccessoryServerBTLE100 *)self _writeValue:v16 forCharacteristic:v17 authorizationData:v18 withCompletionHandler:v14 queue:v19];

        ++v12;
      }
      while (v11 != v12);
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v11);
  }

  id v20 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_146;
  block[3] = &unk_1E69F3D58;
  void block[4] = self;
  id v31 = v25;
  id v32 = v29;
  id v33 = v24;
  id v21 = v29;
  id v22 = v25;
  id v23 = v24;
  dispatch_group_notify(v9, v20, block);
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98___HAPAccessoryServerBTLE100_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E69F3C90;
  double v21 = a4;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (id)_dequeueEnableEventCompletionTupleForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicEnableEventCompletionQueues];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 firstObject];
  if (v7) {
    [v6 removeObject:v7];
  }

  return v7;
}

- (void)_enqueueEnableEventCompletionHandler:(id)a3 queue:(id)a4 forCharacteristic:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicEnableEventCompletionQueues];
  id v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1CA48] array];
    id v12 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicEnableEventCompletionQueues];
    [v12 setObject:v11 forKey:v9];
  }
  id v13 = +[HAPCharacteristicEnableEventCompletionTuple enableEventCompletionTupleWithHandler:v14 queue:v8];
  if (v13) {
    [v11 addObject:v13];
  }
}

- (id)_dequeueReadCompletionTupleForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicReadCompletionQueues];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 firstObject];
  if (v7) {
    [v6 removeObject:v7];
  }

  return v7;
}

- (void)_enqueueReadCompletionHandler:(id)a3 queue:(id)a4 forCharacteristic:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicReadCompletionQueues];
  id v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F1CA48] array];
    id v12 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicReadCompletionQueues];
    [v12 setObject:v11 forKey:v9];
  }
  id v13 = +[HAPCharacteristicReadCompletionTuple readCompletionTupleWithHandler:v14 queue:v8];
  [v11 addObject:v13];
}

- (id)_dequeueWriteCompletionHandlerForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicWriteCompletionQueues];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 firstObject];
  id v8 = (void *)v7;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x1D944E2D0](v7);
    [v6 removeObject:v9];
  }
  id v10 = (void *)MEMORY[0x1D944E2D0](v8);

  return v10;
}

- (void)_enqueueWriteCompletionHandler:(id)a3 forCharacteristic:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicWriteCompletionQueues];
  id v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = [(_HAPAccessoryServerBTLE100 *)self hapCharacteristicWriteCompletionQueues];
    [v9 setObject:v8 forKey:v6];
  }
  id v10 = (void *)MEMORY[0x1D944E2D0](v11);
  [v8 addObject:v10];
}

- (void)_handleDisconnectionWithCompletion:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [(HAPAccessoryServer *)self identifier];
    *(_DWORD *)buf = 138543618;
    v107 = v7;
    __int16 v108 = 2112;
    uint64_t v109 = (uint64_t)v8;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Handling disconnection with error", buf, 0x16u);
  }
  if ([(_HAPAccessoryServerBTLE100 *)self startPairingRequested])
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [(HAPAccessoryServer *)self identifier];
      *(_DWORD *)buf = 138543618;
      v107 = v11;
      __int16 v108 = 2112;
      uint64_t v109 = (uint64_t)v12;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] disconnected during pairing", buf, 0x16u);
    }
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      id v13 = [(HAPAccessoryServer *)self delegateQueue];
      id v14 = v13;
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke;
      v105[3] = &unk_1E69F4330;
      v105[4] = self;
      id v15 = v105;
LABEL_60:
      dispatch_async(v13, v15);
LABEL_61:
    }
  }
  else if ([(_HAPAccessoryServerBTLE100 *)self unpairedIdentifyRequested])
  {
    id v16 = (void *)MEMORY[0x1D944E080]();
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = [(HAPAccessoryServer *)self identifier];
      *(_DWORD *)buf = 138543618;
      v107 = v18;
      __int16 v108 = 2112;
      uint64_t v109 = (uint64_t)v19;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] disconnected after unpaired identify request completed", buf, 0x16u);
    }
    id v20 = [(_HAPAccessoryServerBTLE100 *)self unpairedIdentifyCompletionBlock];

    if (v20)
    {
      double v21 = (void *)MEMORY[0x1D944E080]();
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = HMFGetLogIdentifier();
        id v24 = [(HAPAccessoryServer *)self identifier];
        *(_DWORD *)buf = 138543618;
        v107 = v23;
        __int16 v108 = 2112;
        uint64_t v109 = (uint64_t)v24;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] identify failed calling completion block", buf, 0x16u);
      }
      id v14 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:52];
      id v25 = [(_HAPAccessoryServerBTLE100 *)self unpairedIdentifyCompletionBlock];
      [(_HAPAccessoryServerBTLE100 *)self setUnpairedIdentifyCompletionBlock:0];
      uint64_t v26 = MEMORY[0x1D944E2D0](v25);
      id v27 = (void *)v26;
      if (v26) {
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v14);
      }

      goto LABEL_61;
    }
  }
  else
  {
    unint64_t v28 = [(_HAPAccessoryServerBTLE100 *)self state];
    id v29 = (void *)MEMORY[0x1D944E080]();
    id v30 = HMFGetOSLogHandle();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v28 == 12)
    {
      id v78 = v4;
      if (v31)
      {
        id v32 = HMFGetLogIdentifier();
        id v33 = [(HAPAccessoryServer *)self identifier];
        *(_DWORD *)buf = 138543618;
        v107 = v32;
        __int16 v108 = 2112;
        uint64_t v109 = (uint64_t)v33;
        _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] failed after session is up", buf, 0x16u);
      }
      id v34 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v35 = [(_HAPAccessoryServerBTLE100 *)self btleCharacteristicToHAPCharacteristicMap];
      long long v36 = [v35 objectEnumerator];

      uint64_t v80 = [v36 countByEnumeratingWithState:&v100 objects:v115 count:16];
      if (v80)
      {
        uint64_t v79 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v80; ++i)
          {
            if (*(void *)v101 != v79) {
              objc_enumerationMutation(v36);
            }
            uint64_t v38 = *(void *)(*((void *)&v100 + 1) + 8 * i);
            uint64_t v39 = [(_HAPAccessoryServerBTLE100 *)self _dequeueReadCompletionTupleForCharacteristic:v38];
            if (v39)
            {
              long long v40 = (void *)v39;
              do
              {
                uint64_t v41 = [v40 handler];
                if (v41)
                {
                  uint64_t v42 = (void *)v41;
                  id v43 = [v40 completionQueue];

                  if (v43)
                  {
                    __int16 v44 = [v40 completionQueue];
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_138;
                    block[3] = &unk_1E69F4708;
                    id v97 = v40;
                    uint64_t v98 = v38;
                    id v99 = v34;
                    dispatch_async(v44, block);
                  }
                }
                uint64_t v45 = [(_HAPAccessoryServerBTLE100 *)self _dequeueReadCompletionTupleForCharacteristic:v38];

                long long v40 = (void *)v45;
              }
              while (v45);
            }
            uint64_t v46 = [(_HAPAccessoryServerBTLE100 *)self _dequeueWriteCompletionHandlerForCharacteristic:v38];
            if (v46)
            {
              uint64_t v47 = (void *)v46;
              do
              {
                id v48 = [(HAPAccessoryServer *)self delegateQueue];
                v93[0] = MEMORY[0x1E4F143A8];
                v93[1] = 3221225472;
                v93[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_2;
                v93[3] = &unk_1E69F4070;
                id v95 = v47;
                v93[4] = v38;
                id v94 = v34;
                id v49 = v47;
                dispatch_async(v48, v93);

                uint64_t v47 = [(_HAPAccessoryServerBTLE100 *)self _dequeueWriteCompletionHandlerForCharacteristic:v38];
              }
              while (v47);
            }
            uint64_t v50 = [(_HAPAccessoryServerBTLE100 *)self _dequeueEnableEventCompletionTupleForCharacteristic:v38];
            if (v50)
            {
              uint64_t v51 = (void *)v50;
              do
              {
                uint64_t v52 = [v51 handler];
                if (v52)
                {
                  id v53 = (void *)v52;
                  uint64_t v54 = [v51 completionQueue];

                  if (v54)
                  {
                    long long v55 = [v51 completionQueue];
                    v89[0] = MEMORY[0x1E4F143A8];
                    v89[1] = 3221225472;
                    v89[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_3;
                    v89[3] = &unk_1E69F4708;
                    id v90 = v51;
                    uint64_t v91 = v38;
                    id v92 = v34;
                    dispatch_async(v55, v89);
                  }
                }
                uint64_t v56 = [(_HAPAccessoryServerBTLE100 *)self _dequeueEnableEventCompletionTupleForCharacteristic:v38];

                uint64_t v51 = (void *)v56;
              }
              while (v56);
            }
          }
          uint64_t v80 = [v36 countByEnumeratingWithState:&v100 objects:v115 count:16];
        }
        while (v80);
      }

      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v81 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
      uint64_t v57 = [v81 countByEnumeratingWithState:&v85 objects:v114 count:16];
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v58; ++j)
          {
            if (*(void *)v86 != v59) {
              objc_enumerationMutation(v81);
            }
            id v61 = *(void **)(*((void *)&v85 + 1) + 8 * j);
            __int16 v62 = (void *)MEMORY[0x1D944E080]();
            id v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v64 = v82 = v62;
              uint64_t v65 = v58;
              uint64_t v66 = v59;
              uint64_t v67 = [v61 operation];
              id v68 = [v61 identifier];
              int v69 = [v61 operationExecuting];
              *(_DWORD *)buf = 138544130;
              v107 = v64;
              __int16 v108 = 2048;
              uint64_t v109 = v67;
              uint64_t v59 = v66;
              uint64_t v58 = v65;
              __int16 v110 = 2112;
              v111 = v68;
              __int16 v112 = 1024;
              int v113 = v69;
              _os_log_impl(&dword_1D4758000, v63, OS_LOG_TYPE_INFO, "%{public}@Failed pending operation %tu for %@, Executing: %d", buf, 0x26u);

              __int16 v62 = v82;
            }

            if (([v61 operationExecuting] & 1) == 0)
            {
              uint64_t v70 = [v61 completionHandler];
              if (v70)
              {
                __int16 v71 = (void *)v70;
                id v72 = [v61 queue];

                if (v72)
                {
                  __int16 v73 = [v61 queue];
                  v83[0] = MEMORY[0x1E4F143A8];
                  v83[1] = 3221225472;
                  v83[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_139;
                  v83[3] = &unk_1E69F46E0;
                  v83[4] = v61;
                  id v84 = v34;
                  dispatch_async(v73, v83);
                }
              }
            }
          }
          uint64_t v58 = [v81 countByEnumeratingWithState:&v85 objects:v114 count:16];
        }
        while (v58);
      }

      id v74 = [(_HAPAccessoryServerBTLE100 *)self addRemovePairingOperationsQueue];
      [v74 removeAllObjects];

      id v4 = v78;
    }
    else
    {
      if (v31)
      {
        id v75 = HMFGetLogIdentifier();
        id v76 = [(HAPAccessoryServer *)self identifier];
        *(_DWORD *)buf = 138543618;
        v107 = v75;
        __int16 v108 = 2112;
        uint64_t v109 = (uint64_t)v76;
        _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] disconnected before secure session was established", buf, 0x16u);
      }
      if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didDiscoverAccessories_transaction_error_])
      {
        id v13 = [(HAPAccessoryServer *)self delegateQueue];
        id v14 = v13;
        v104[0] = MEMORY[0x1E4F143A8];
        v104[1] = 3221225472;
        v104[2] = __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_137;
        v104[3] = &unk_1E69F4330;
        v104[4] = self;
        id v15 = v104;
        goto LABEL_60;
      }
    }
  }
  [(_HAPAccessoryServerBTLE100 *)self _resetState];
  uint64_t v77 = (void (**)(void, void))MEMORY[0x1D944E2D0](v4);
  if (v77) {
    ((void (**)(void, BOOL))v77)[2](v77, [(_HAPAccessoryServerBTLE100 *)self removeOnDisconnect]);
  }
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    unint64_t v11 = [(_HAPAccessoryServerBTLE100 *)self state];
    if (v11 - 1 > 0xB) {
      id v12 = @"Unknown State";
    }
    else {
      id v12 = off_1E69F4468[v11 - 1];
    }
    id v13 = v12;
    *(_DWORD *)buf = 138543874;
    id v22 = v10;
    __int16 v23 = 2112;
    unint64_t v24 = (unint64_t)v6;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server] Received disconnection event with error %@ in state %@", buf, 0x20u);
  }
  if ([(_HAPAccessoryServerBTLE100 *)self state] == 2
    && [(_HAPAccessoryServerBTLE100 *)self connectionRetryCount] <= 2)
  {
    id v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      unint64_t v17 = [(_HAPAccessoryServerBTLE100 *)self connectionRetryCount];
      *(_DWORD *)buf = 138543618;
      id v22 = v16;
      __int16 v23 = 2048;
      unint64_t v24 = v17;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server] ### BLE Connection Failure, Retry count: %lu", buf, 0x16u);
    }
    [(_HAPAccessoryServerBTLE100 *)self setConnectionRetryCount:[(_HAPAccessoryServerBTLE100 *)self connectionRetryCount] + 1];
    [(_HAPAccessoryServerBTLE100 *)self setState:1];
    [(_HAPAccessoryServerBTLE100 *)self _handlePairingStateMachine];
  }
  else
  {
    id v18 = [(HAPAccessoryServer *)self clientQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77___HAPAccessoryServerBTLE100_handleDisconnectionWithError_completionHandler___block_invoke;
    v19[3] = &unk_1E69F3C68;
    v19[4] = self;
    id v20 = v7;
    dispatch_async(v18, v19);
  }
}

- (BOOL)isBLELinkConnected
{
  v2 = [(HAPAccessoryServerBTLE *)self peripheral];
  BOOL v3 = [v2 state] == 2;

  return v3;
}

- (void)_handleSuccessfulBTLEConnection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v7 = 138543874;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2080;
    id v12 = "-[_HAPAccessoryServerBTLE100 _handleSuccessfulBTLEConnection]";
    id v6 = v10;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@%@ %s", (uint8_t *)&v7, 0x20u);
  }
  [(_HAPAccessoryServerBTLE100 *)self _handlePairingStateMachine];
}

- (void)_handleConnectionWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v8 = v12;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ connection completed with error: %@", (uint8_t *)&v9, 0x20u);
  }
  if (!v4)
  {
    [(_HAPAccessoryServerBTLE100 *)self _handleSuccessfulBTLEConnection];
    [(HAPAccessoryServerBTLE *)self incrementHAPBTLEMetricsConnectionCount];
  }
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___HAPAccessoryServerBTLE100_handleConnectionWithPeripheral_withError___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_setupBTLEConnectionToPeripheral
{
  id v3 = [(HAPAccessoryServerBTLE *)self browser];
  [v3 connectToBTLEAccessoryServer:self];
}

- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = [(_HAPAccessoryServerBTLE100 *)self _hapCharacteristicForBTLECharacteristic:v6];
  id v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = HMFGetOSLogHandle();
  __int16 v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification update completion for characteristic %@ with error %@", buf, 0x20u);
    }
    id v13 = [(_HAPAccessoryServerBTLE100 *)self _dequeueEnableEventCompletionTupleForCharacteristic:v8];
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 completionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87___HAPAccessoryServerBTLE100__handleHAPNotificationStateUpdateForCharacteristic_error___block_invoke;
      block[3] = &unk_1E69F4708;
      id v21 = v14;
      id v22 = v8;
      __int16 v23 = v7;
      dispatch_async(v15, block);
    }
    else
    {
      unint64_t v17 = (void *)MEMORY[0x1D944E080]();
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v25 = v19;
        __int16 v26 = 2080;
        uint64_t v27 = "-[_HAPAccessoryServerBTLE100 _handleHAPNotificationStateUpdateForCharacteristic:error:]";
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@%s: ### Unable to get enable event completion handler for %@ after receiving a notification update confirmation", buf, 0x20u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v16;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@### Unable to find HAP characteristic for BTLE characteristic after receiving Notification Update confirmation", buf, 0xCu);
    }
  }
}

- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v41 = a3;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = a6;
  id v12 = [(_HAPAccessoryServerBTLE100 *)self _btleCharacteristicForHAPCharacteristic:v9];
  id v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    uint64_t v15 = v11;
    unint64_t v17 = v16 = v10;
    [(HAPAccessoryServer *)self identifier];
    v19 = id v18 = v12;
    id v20 = [(HAPAccessoryServer *)self name];
    *(_DWORD *)buf = 138544386;
    uint64_t v65 = v17;
    __int16 v66 = 2112;
    id v67 = v19;
    __int16 v68 = 2112;
    int v69 = v20;
    __int16 v70 = 1024;
    BOOL v71 = v41;
    __int16 v72 = 2112;
    id v73 = v9;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Enable Events :%d for Characteristics: %@", buf, 0x30u);

    id v12 = v18;
    id v10 = v16;
    __int16 v11 = v15;
  }

  if (!v12)
  {
    uint64_t v30 = (void *)MEMORY[0x1D944E080]();
    BOOL v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v65 = v32;
      __int16 v66 = 2114;
      id v67 = v9;
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to enable Events on HAP characteristic %{public}@: it does not have a corresponding BTLE characteristic", buf, 0x16u);
    }
    v62[0] = *MEMORY[0x1E4F28568];
    id v33 = [NSString stringWithFormat:@"Failed to enable events for characteristic %@", v9];
    v63[0] = v33;
    v62[1] = *MEMORY[0x1E4F28588];
    id v34 = [MEMORY[0x1E4F28B50] mainBundle];
    id v35 = [v34 localizedStringForKey:@"Unable to find matching BTLE characteristic" value:&stru_1F2C4E778 table:0];
    v63[1] = v35;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];

    __int16 v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6727 userInfo:v27];
    if (!v10 || !v11) {
      goto LABEL_20;
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke;
    v54[3] = &unk_1E69F4070;
    id v57 = v10;
    id v55 = v9;
    id v56 = v28;
    dispatch_async(v11, v54);

    id v29 = v57;
    goto LABEL_19;
  }
  if (([v12 properties] & 0x20) == 0)
  {
    id v21 = (void *)MEMORY[0x1D944E080]();
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v65 = v23;
      __int16 v66 = 2114;
      id v67 = v9;
      __int16 v68 = 2114;
      int v69 = v12;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@### Error while attempting to enable Events on HAP characteristic %{public}@: Corresponding BTLE Characteristics %{public}@: does not support it", buf, 0x20u);
    }
    v60[0] = *MEMORY[0x1E4F28568];
    unint64_t v24 = [NSString stringWithFormat:@"Failed to enable events for characteristic %@", v9];
    v61[0] = v24;
    v60[1] = *MEMORY[0x1E4F28588];
    __int16 v25 = [MEMORY[0x1E4F28B50] mainBundle];
    __int16 v26 = [v25 localizedStringForKey:@"BTLE characteristic does not support indication" value:&stru_1F2C4E778 table:0];
    v61[1] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];

    __int16 v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6735 userInfo:v27];
    if (!v10 || !v11) {
      goto LABEL_20;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_130;
    block[3] = &unk_1E69F4070;
    id v53 = v10;
    id v51 = v9;
    id v52 = v28;
    dispatch_async(v11, block);

    id v29 = v53;
    goto LABEL_19;
  }
  if (![(_HAPAccessoryServerBTLE100 *)self isDisconnecting])
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    void v42[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_3;
    v42[3] = &unk_1E69F3C40;
    BOOL v45 = v41;
    id v44 = v10;
    uint64_t v38 = v11;
    id v43 = v38;
    uint64_t v39 = (void *)MEMORY[0x1D944E2D0](v42);
    [(_HAPAccessoryServerBTLE100 *)self _enqueueEnableEventCompletionHandler:v39 queue:v38 forCharacteristic:v9];
    [(_HAPAccessoryServerBTLE100 *)self _updateConnectionLifetimeTimer];
    long long v40 = [(HAPAccessoryServerBTLE *)self peripheral];
    [v40 setNotifyValue:v41 forCharacteristic:v12];

    uint64_t v27 = v44;
    goto LABEL_21;
  }
  v58[0] = *MEMORY[0x1E4F28568];
  long long v36 = [NSString stringWithFormat:@"Failed to enable events for characteristics %@", v9];
  v59[0] = v36;
  v58[1] = *MEMORY[0x1E4F28588];
  long long v37 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4];
  v59[1] = v37;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];

  __int16 v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6753 userInfo:v27];
  if (v10 && v11)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2;
    v46[3] = &unk_1E69F4070;
    id v49 = v10;
    id v47 = v9;
    id v48 = v28;
    dispatch_async(v11, v46);

    id v29 = v49;
LABEL_19:
  }
LABEL_20:

LABEL_21:
}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v26 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v24 = a5;
  id v10 = a6;
  __int16 v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = dispatch_group_create();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * v16);
        dispatch_group_enter(v12);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
        v33[3] = &unk_1E69F3BC8;
        id v34 = v11;
        id v35 = v12;
        id v18 = (void *)MEMORY[0x1D944E2D0](v33);
        [(_HAPAccessoryServerBTLE100 *)self _enableEvent:v26 forCharacteristic:v17 withCompletionHandler:v18 queue:v10];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v14);
  }

  id v19 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_110;
  block[3] = &unk_1E69F3C18;
  id v30 = obj;
  id v31 = v24;
  void block[4] = self;
  id v28 = v10;
  BOOL v32 = v26;
  id v29 = v11;
  id v20 = obj;
  id v21 = v11;
  id v22 = v10;
  id v23 = v24;
  dispatch_group_notify(v12, v19, block);
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90___HAPAccessoryServerBTLE100_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  block[3] = &unk_1E69F3BA0;
  BOOL v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  id v4 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___HAPAccessoryServerBTLE100_stopPairingWithError___block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)_handlePairingStateMachine
{
  v2 = self;
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  v120 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    [(HAPAccessoryServer *)v2 identifier];
    id v6 = v2;
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v8 = [(HAPAccessoryServer *)v6 name];
    uint64_t v9 = [(_HAPAccessoryServerBTLE100 *)v6 state];
    uint64_t v10 = [(_HAPAccessoryServerBTLE100 *)v6 state];
    if ((unint64_t)(v10 - 1) > 0xB) {
      id v11 = @"Unknown State";
    }
    else {
      id v11 = off_1E69F4468[v10 - 1];
    }
    id v12 = v11;
    *(_DWORD *)buf = 138544642;
    v137 = v5;
    __int16 v138 = 2112;
    v139 = v7;
    __int16 v140 = 2112;
    v141 = v8;
    __int16 v142 = 2080;
    v143 = "-[_HAPAccessoryServerBTLE100 _handlePairingStateMachine]";
    __int16 v144 = 2048;
    uint64_t v145 = v9;
    __int16 v146 = 2112;
    v147 = v12;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] %s with state %lu (%@)", buf, 0x3Eu);

    v2 = v120;
  }

  switch([(_HAPAccessoryServerBTLE100 *)v2 state])
  {
    case 1uLL:
      uint64_t v13 = [(HAPAccessoryServerBTLE *)v2 peripheral];
      uint64_t v14 = [v13 state];

      if (v14)
      {
        id v15 = [(HAPAccessoryServerBTLE *)v2 peripheral];
        uint64_t v16 = [v15 state];

        if (v16 == 2)
        {
          [(_HAPAccessoryServerBTLE100 *)v2 setState:2];
          uint64_t v17 = (void *)MEMORY[0x1D944E080]([(_HAPAccessoryServerBTLE100 *)v2 _updateConnectionLifetimeTimer]);
          id v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = HMFGetLogIdentifier();
            id v20 = [(HAPAccessoryServer *)v2 identifier];
            BOOL v21 = [(HAPAccessoryServer *)v120 name];
            *(_DWORD *)buf = 138543874;
            v137 = v19;
            __int16 v138 = 2112;
            v139 = v20;
            __int16 v140 = 2112;
            v141 = v21;
            _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] Discovering services", buf, 0x20u);

            v2 = v120;
          }

          id v22 = [(HAPAccessoryServerBTLE *)v2 peripheral];
          [v22 discoverServices:0];
          goto LABEL_104;
        }
      }
      else
      {
        [(_HAPAccessoryServerBTLE100 *)v2 _updateConnectionLifetimeTimer];
        [(_HAPAccessoryServerBTLE100 *)v2 _setupBTLEConnectionToPeripheral];
      }
      return;
    case 2uLL:
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v28 = [(HAPAccessoryServerBTLE *)v2 peripheral];
      id v29 = [v28 services];

      id obj = v29;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v129 objects:v135 count:16];
      if (v30)
      {
        uint64_t v32 = v30;
        uint64_t v118 = *(void *)v130;
        *(void *)&long long v31 = 138544130;
        long long v116 = v31;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v130 != v118) {
              objc_enumerationMutation(obj);
            }
            id v34 = *(void **)(*((void *)&v129 + 1) + 8 * i);
            id v35 = (void *)MEMORY[0x1D944E080]();
            long long v36 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              long long v37 = HMFGetLogIdentifier();
              long long v38 = [(HAPAccessoryServer *)v2 identifier];
              long long v39 = [(HAPAccessoryServer *)v120 name];
              long long v40 = [v34 UUID];
              *(_DWORD *)buf = v116;
              v137 = v37;
              __int16 v138 = 2112;
              v139 = v38;
              __int16 v140 = 2112;
              v141 = v39;
              __int16 v142 = 2112;
              v143 = v40;
              _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] current service UUID: %@", buf, 0x2Au);

              v2 = v120;
            }

            uint64_t v41 = [v34 UUID];
            uint64_t v42 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
            int v43 = [v41 isEqual:v42];

            if (v43) {
              [(_HAPAccessoryServerBTLE100 *)v2 setPairingService:v34];
            }
            id v44 = objc_msgSend(v34, "UUID", v116);
            BOOL v45 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED3"];
            int v46 = [v44 isEqual:v45];

            if (v46) {
              [(_HAPAccessoryServerBTLE100 *)v2 setAccessoryInfoService:v34];
            }
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v129 objects:v135 count:16];
        }
        while (v32);
      }

      uint64_t v47 = [(_HAPAccessoryServerBTLE100 *)v2 pairingService];
      if (v47)
      {
        id v48 = (void *)v47;
        id v49 = [(_HAPAccessoryServerBTLE100 *)v2 accessoryInfoService];

        if (v49)
        {
          [(_HAPAccessoryServerBTLE100 *)v2 setState:3];
          [(_HAPAccessoryServerBTLE100 *)v2 _updateConnectionLifetimeTimer];
          id v22 = [(HAPAccessoryServerBTLE *)v2 peripheral];
          uint64_t v50 = [(_HAPAccessoryServerBTLE100 *)v2 pairingService];
          goto LABEL_56;
        }
      }
      long long v100 = (void *)MEMORY[0x1D944E080]();
      long long v101 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        goto LABEL_103;
      }
      long long v102 = HMFGetLogIdentifier();
      long long v103 = [(HAPAccessoryServer *)v2 identifier];
      v104 = [(HAPAccessoryServer *)v2 name];
      *(_DWORD *)buf = 138543874;
      v137 = v102;
      __int16 v138 = 2112;
      v139 = v103;
      __int16 v140 = 2112;
      v141 = v104;
      v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to discover pairing service or accessory info service!";
      goto LABEL_102;
    case 3uLL:
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v51 = [(_HAPAccessoryServerBTLE100 *)v2 pairingService];
      id v52 = [v51 characteristics];

      uint64_t v53 = [v52 countByEnumeratingWithState:&v125 objects:v134 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v126;
        do
        {
          for (uint64_t j = 0; j != v54; ++j)
          {
            if (*(void *)v126 != v55) {
              objc_enumerationMutation(v52);
            }
            id v57 = *(void **)(*((void *)&v125 + 1) + 8 * j);
            uint64_t v58 = [v57 UUID];
            uint64_t v59 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000004C-0000-1000-8000-0026BB765291"];
            int v60 = [v58 isEqual:v59];

            if (v60)
            {
              [(_HAPAccessoryServerBTLE100 *)v120 setPairSetupCharacteristic:v57];
            }
            else
            {
              id v61 = [v57 UUID];
              __int16 v62 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000004E-0000-1000-8000-0026BB765291"];
              int v63 = [v61 isEqual:v62];

              if (v63)
              {
                [(_HAPAccessoryServerBTLE100 *)v120 setPairVerifyCharacteristic:v57];
              }
              else
              {
                id v64 = [v57 UUID];
                uint64_t v65 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000004F-0000-1000-8000-0026BB765291"];
                int v66 = [v64 isEqual:v65];

                if (v66)
                {
                  [(_HAPAccessoryServerBTLE100 *)v120 setPairingFeaturesCharacteristic:v57];
                }
                else
                {
                  id v67 = [v57 UUID];
                  __int16 v68 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000050-0000-1000-8000-0026BB765291"];
                  int v69 = [v67 isEqual:v68];

                  if (v69) {
                    [(_HAPAccessoryServerBTLE100 *)v120 setPairingsCharacteristic:v57];
                  }
                }
              }
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v125 objects:v134 count:16];
        }
        while (v54);
      }

      v2 = v120;
      uint64_t v70 = [(_HAPAccessoryServerBTLE100 *)v120 pairSetupCharacteristic];
      if (!v70) {
        goto LABEL_96;
      }
      BOOL v71 = (void *)v70;
      uint64_t v72 = [(_HAPAccessoryServerBTLE100 *)v120 pairVerifyCharacteristic];
      if (!v72) {
        goto LABEL_95;
      }
      id v73 = (void *)v72;
      uint64_t v74 = [(_HAPAccessoryServerBTLE100 *)v120 pairingFeaturesCharacteristic];
      if (v74)
      {
        id v75 = (void *)v74;
        id v76 = [(_HAPAccessoryServerBTLE100 *)v120 pairingsCharacteristic];

        if (v76)
        {
          [(_HAPAccessoryServerBTLE100 *)v120 setState:4];
          [(_HAPAccessoryServerBTLE100 *)v120 _updateConnectionLifetimeTimer];
          id v22 = [(HAPAccessoryServerBTLE *)v120 peripheral];
          uint64_t v77 = [(_HAPAccessoryServerBTLE100 *)v120 pairingFeaturesCharacteristic];
          [v22 readValueForCharacteristic:v77];
          goto LABEL_57;
        }
      }
      else
      {

LABEL_95:
      }
LABEL_96:
      long long v100 = (void *)MEMORY[0x1D944E080]();
      long long v101 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        goto LABEL_103;
      }
      long long v102 = HMFGetLogIdentifier();
      long long v103 = [(HAPAccessoryServer *)v120 identifier];
      v104 = [(HAPAccessoryServer *)v120 name];
      *(_DWORD *)buf = 138543874;
      v137 = v102;
      __int16 v138 = 2112;
      v139 = v103;
      __int16 v140 = 2112;
      v141 = v104;
      v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to find all pairing characteristics in the pairing service";
      goto LABEL_102;
    case 4uLL:
      if ([(_HAPAccessoryServerBTLE100 *)v2 pairingFeaturesRead])
      {
        if ([(_HAPAccessoryServerBTLE100 *)v2 startPairingRequested])
        {
          [(_HAPAccessoryServerBTLE100 *)v2 setState:5];
          [(_HAPAccessoryServerBTLE100 *)v2 _cancelConnectionLifetimeTimer];
          [(_HAPAccessoryServerBTLE100 *)v2 _checkForAuthPrompt];
          return;
        }
LABEL_55:
        [(_HAPAccessoryServerBTLE100 *)v2 setState:6];
        id v22 = [(HAPAccessoryServerBTLE *)v2 peripheral];
        uint64_t v50 = [(_HAPAccessoryServerBTLE100 *)v2 accessoryInfoService];
LABEL_56:
        uint64_t v77 = (void *)v50;
        [v22 discoverCharacteristics:0 forService:v50];
        goto LABEL_57;
      }
      long long v100 = (void *)MEMORY[0x1D944E080]();
      long long v101 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        goto LABEL_103;
      }
      long long v102 = HMFGetLogIdentifier();
      long long v103 = [(HAPAccessoryServer *)v2 identifier];
      v104 = [(HAPAccessoryServer *)v2 name];
      *(_DWORD *)buf = 138543874;
      v137 = v102;
      __int16 v138 = 2112;
      v139 = v103;
      __int16 v140 = 2112;
      v141 = v104;
      v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to read pairing features characteristic";
      goto LABEL_102;
    case 5uLL:
      [(_HAPAccessoryServerBTLE100 *)v2 _updateConnectionLifetimeTimer];
      goto LABEL_55;
    case 6uLL:
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v78 = [(_HAPAccessoryServerBTLE100 *)v2 accessoryInfoService];
      uint64_t v79 = [v78 characteristics];

      uint64_t v80 = [v79 countByEnumeratingWithState:&v121 objects:v133 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        char v119 = 0;
        uint64_t v82 = *(void *)v122;
        do
        {
          for (uint64_t k = 0; k != v81; ++k)
          {
            if (*(void *)v122 != v82) {
              objc_enumerationMutation(v79);
            }
            id v84 = *(void **)(*((void *)&v121 + 1) + 8 * k);
            long long v85 = [v84 UUID];
            long long v86 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000014-0000-1000-8000-0026BB765291"];
            int v87 = [v85 isEqual:v86];

            if (v87)
            {
              [(_HAPAccessoryServerBTLE100 *)v120 setIdentifyCharacteristic:v84];
            }
            else
            {
              long long v88 = [v84 UUID];
              id v89 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000021-0000-1000-8000-0026BB765291"];
              int v90 = [v88 isEqual:v89];

              if (v90)
              {
                [(_HAPAccessoryServerBTLE100 *)v120 setModelCharacteristic:v84];
              }
              else
              {
                uint64_t v91 = [v84 UUID];
                id v92 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000020-0000-1000-8000-0026BB765291"];
                int v93 = [v91 isEqual:v92];

                if (v93)
                {
                  [(_HAPAccessoryServerBTLE100 *)v120 setManufacturerCharacteristic:v84];
                }
                else
                {
                  id v94 = [v84 UUID];
                  id v95 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000030-0000-1000-8000-0026BB765291"];
                  int v96 = [v94 isEqual:v95];

                  if (v96)
                  {
                    [(_HAPAccessoryServerBTLE100 *)v120 setSerialNumberCharacteristic:v84];
                  }
                  else
                  {
                    id v97 = [v84 UUID];
                    uint64_t v98 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000051-0000-1000-8000-0026BB765291"];
                    char v99 = [v97 isEqual:v98];

                    v119 |= v99;
                  }
                }
              }
            }
          }
          uint64_t v81 = [v79 countByEnumeratingWithState:&v121 objects:v133 count:16];
        }
        while (v81);
      }
      else
      {
        char v119 = 0;
      }

      v2 = v120;
      uint64_t v106 = [(_HAPAccessoryServerBTLE100 *)v120 identifyCharacteristic];
      if (!v106) {
        goto LABEL_100;
      }
      v107 = (void *)v106;
      uint64_t v108 = [(_HAPAccessoryServerBTLE100 *)v120 modelCharacteristic];
      if (!v108) {
        goto LABEL_99;
      }
      uint64_t v109 = (void *)v108;
      uint64_t v110 = [(_HAPAccessoryServerBTLE100 *)v120 manufacturerCharacteristic];
      if (!v110)
      {

LABEL_99:
        goto LABEL_100;
      }
      v111 = (void *)v110;
      __int16 v112 = [(_HAPAccessoryServerBTLE100 *)v120 serialNumberCharacteristic];
      char v113 = (v112 != 0) & v119;

      if ((v113 & 1) == 0)
      {
LABEL_100:
        long long v100 = (void *)MEMORY[0x1D944E080]();
        long long v101 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          long long v102 = HMFGetLogIdentifier();
          long long v103 = [(HAPAccessoryServer *)v120 identifier];
          v104 = [(HAPAccessoryServer *)v120 name];
          *(_DWORD *)buf = 138543874;
          v137 = v102;
          __int16 v138 = 2112;
          v139 = v103;
          __int16 v140 = 2112;
          v141 = v104;
          v105 = "%{public}@[BTLE Accessory Server %@ %@] Unable to find all accessory info characteristics in the pairing service";
LABEL_102:
          _os_log_impl(&dword_1D4758000, v101, OS_LOG_TYPE_ERROR, v105, buf, 0x20u);

          v2 = v120;
        }
LABEL_103:

        id v22 = [(HAPAccessoryServerBTLE *)v2 browser];
        [v22 disconnectFromBTLEAccessoryServer:v2];
        goto LABEL_104;
      }
      if ([(_HAPAccessoryServerBTLE100 *)v120 unpairedIdentifyRequested])
      {
        buf[0] = 1;
        id v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:1];
        uint64_t v77 = [(HAPAccessoryServerBTLE *)v120 peripheral];
        v114 = [(_HAPAccessoryServerBTLE100 *)v120 identifyCharacteristic];
        [v77 writeValue:v22 forCharacteristic:v114 type:0];

LABEL_57:
LABEL_104:

        return;
      }
      if ([(_HAPAccessoryServerBTLE100 *)v120 startPairingRequested])
      {
        [(_HAPAccessoryServerBTLE100 *)v120 setState:7];
        [(_HAPAccessoryServerBTLE100 *)v120 _pairSetupStart];
      }
      else
      {
LABEL_108:
        [(_HAPAccessoryServerBTLE100 *)v2 setState:8];
        [(_HAPAccessoryServerBTLE100 *)v2 _reallyEstablishSecureSession];
      }
      return;
    case 7uLL:
      goto LABEL_108;
    case 8uLL:
      [(_HAPAccessoryServerBTLE100 *)v2 setState:9];
      [(_HAPAccessoryServerBTLE100 *)v2 _handleHAPServiceDiscovery];
      return;
    case 9uLL:
      [(_HAPAccessoryServerBTLE100 *)v2 setState:10];
      [(_HAPAccessoryServerBTLE100 *)v2 _handleDescriptorDiscovery];
      return;
    case 10uLL:
      [(_HAPAccessoryServerBTLE100 *)v2 setState:11];
      [(_HAPAccessoryServerBTLE100 *)v2 _handleReadDescriptorValues];
      return;
    case 11uLL:
      [(_HAPAccessoryServerBTLE100 *)v2 setState:12];
      return;
    default:
      id v23 = (void *)MEMORY[0x1D944E080]();
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        uint64_t v26 = [(_HAPAccessoryServerBTLE100 *)v2 state];
        if ((unint64_t)(v26 - 1) > 0xB) {
          uint64_t v27 = @"Unknown State";
        }
        else {
          uint64_t v27 = off_1E69F4468[v26 - 1];
        }
        v115 = v27;
        *(_DWORD *)buf = 138543618;
        v137 = v25;
        __int16 v138 = 2112;
        v139 = v115;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@### Unhandled pairing state for BTLE accessory: '%@'", buf, 0x16u);
      }
      return;
  }
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  if (a3)
  {
    [(_HAPAccessoryServerBTLE100 *)self continuePairingAfterAuthPrompt];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Pairing Failed." reason:@"User cancelled pairing" suggestion:0 underlyingError:0];
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
    {
      uint64_t v5 = [(HAPAccessoryServer *)self delegateQueue];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __58___HAPAccessoryServerBTLE100_continueAuthAfterValidation___block_invoke;
      v6[3] = &unk_1E69F46E0;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(v5, v6);
    }
  }
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [(HAPAccessoryServer *)self clientQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84___HAPAccessoryServerBTLE100_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v10[3] = &unk_1E69F46E0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(v7, v10);

  return 1;
}

- (void)_checkForAuthPrompt
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    unint64_t pairingFeatureFlags = self->_pairingFeatureFlags;
    *(_DWORD *)buf = 138543618;
    id v28 = v5;
    __int16 v29 = 2048;
    unint64_t v30 = pairingFeatureFlags;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@[BTLE] PairingFeatureFlags = %llu", buf, 0x16u);
  }
  uint64_t pairingFeatureFlags_low = LOBYTE(self->_pairingFeatureFlags);
  id v8 = (void *)MEMORY[0x1D944E080]();
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (pairingFeatureFlags_low)
  {
    if (v10)
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [(HAPAccessoryServer *)self identifier];
      uint64_t v13 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138543874;
      id v28 = v11;
      __int16 v29 = 2112;
      unint64_t v30 = (unint64_t)v12;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] Accessory supports auth, skipping prompting user...", buf, 0x20u);
    }
    [(_HAPAccessoryServerBTLE100 *)self _handlePairingStateMachine];
  }
  else
  {
    if (v10)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      id v15 = [(HAPAccessoryServer *)self identifier];
      uint64_t v16 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138543874;
      id v28 = v14;
      __int16 v29 = 2112;
      unint64_t v30 = (unint64_t)v15;
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@ %@] Accessory doesn't support auth, prompting user...", buf, 0x20u);
    }
    if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
    {
      uint64_t v17 = [HAPAccessoryInfo alloc];
      id v18 = [(HAPAccessoryServer *)self name];
      id v19 = [(HAPAccessoryServer *)self category];
      id v20 = [(HAPAccessoryInfo *)v17 initWithName:v18 manufacturer:0 modelName:0 category:v19 certificationStatus:0 denylisted:0 ppid:0];

      BOOL v21 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke;
      block[3] = &unk_1E69F46E0;
      void block[4] = self;
      uint64_t v26 = v20;
      id v22 = v20;
      dispatch_async(v21, block);
    }
    else
    {
      if ([(_HAPAccessoryServerBTLE100 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
      {
        id v23 = [(HAPAccessoryServer *)self delegateQueue];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke_2;
        v24[3] = &unk_1E69F4330;
        v24[4] = self;
        dispatch_async(v23, v24);
      }
      [(_HAPAccessoryServerBTLE100 *)self setStartPairingRequested:0];
    }
  }
}

- (void)continuePairingAfterAuthPrompt
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)startPairingWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a5;
  id v7 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___HAPAccessoryServerBTLE100_configureCharacteristics_queue_withCompletionHandler___block_invoke;
  block[3] = &unk_1E69F3B20;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a5;
  id v7 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___HAPAccessoryServerBTLE100_generateBroadcastKey_queue_withCompletionHandler___block_invoke;
  block[3] = &unk_1E69F3B20;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_createPrimaryAccessoryFromAdvertisementData
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [HAPAccessory alloc];
  id v4 = [NSNumber numberWithUnsignedInteger:1];
  uint64_t v5 = [(HAPAccessory *)v3 initWithServer:self instanceID:v4];

  id v6 = [(HAPAccessoryServer *)self name];
  [(HAPAccessory *)v5 setName:v6];

  id v7 = [(HAPAccessoryServer *)self identifier];
  [(HAPAccessory *)v5 setIdentifier:v7];

  id v8 = [(HAPAccessoryServer *)self identifier];
  [(HAPAccessory *)v5 setServerIdentifier:v8];

  [(HAPAccessoryServer *)self setPrimaryAccessory:v5];
  v10[0] = v5;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(HAPAccessoryServer *)self setAccessories:v9];
}

- (unint64_t)hapBLEProtocolVersion
{
  return 1;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41___HAPAccessoryServerBTLE100_description__block_invoke;
  v8[3] = &unk_1E69F46E0;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(v4, v8);

  id v6 = v5;
  return (NSString *)v6;
}

- (void)dealloc
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  id v4 = [(HAPAccessoryServerBTLE *)self peripheral];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)_HAPAccessoryServerBTLE100;
  [(_HAPAccessoryServerBTLE100 *)&v5 dealloc];
}

- (void)_resetState
{
  [(_HAPAccessoryServerBTLE100 *)self setState:1];
  id v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(_HAPAccessoryServerBTLE100 *)self setBtleServiceToHAPServiceMap:v3];

  id v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(_HAPAccessoryServerBTLE100 *)self setBtleCharacteristicToHAPCharacteristicMap:v4];

  objc_super v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(_HAPAccessoryServerBTLE100 *)self setHapCharacteristicReadCompletionQueues:v5];

  id v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(_HAPAccessoryServerBTLE100 *)self setHapCharacteristicWriteCompletionQueues:v6];

  id v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(_HAPAccessoryServerBTLE100 *)self setHapCharacteristicEnableEventCompletionQueues:v7];

  id v8 = [MEMORY[0x1E4F1CA48] array];
  [(_HAPAccessoryServerBTLE100 *)self setAddRemovePairingOperationsQueue:v8];

  [(_HAPAccessoryServerBTLE100 *)self setPairingService:0];
  [(_HAPAccessoryServerBTLE100 *)self setPairingsCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setPairSetupCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setPairVerifyCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setPairingFeaturesCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setIdentifyCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setModelCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setSerialNumberCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setManufacturerCharacteristic:0];
  [(_HAPAccessoryServerBTLE100 *)self setConnectionRetryCount:0];
  [(_HAPAccessoryServerBTLE100 *)self setCharacteristicDiscoveryRequestCount:0];
  [(_HAPAccessoryServerBTLE100 *)self setCharacteristicValueReadCount:0];
  [(_HAPAccessoryServerBTLE100 *)self setMetadataDiscoveryRequestCount:0];
  [(_HAPAccessoryServerBTLE100 *)self setMetadataValueReadCount:0];
  [(_HAPAccessoryServerBTLE100 *)self setAvailableInstanceID:1];
  [(_HAPAccessoryServerBTLE100 *)self setStartPairingRequested:0];
  [(_HAPAccessoryServerBTLE100 *)self setRemoveOnDisconnect:[(_HAPAccessoryServerBTLE100 *)self unpairedIdentifyRequested] ^ 1];
  [(_HAPAccessoryServerBTLE100 *)self setUnpairedIdentifyRequested:0];
  id v9 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];

  if (v9)
  {
    id v10 = [(_HAPAccessoryServerBTLE100 *)self connectionLifetimeTimer];
    dispatch_source_cancel(v10);

    [(_HAPAccessoryServerBTLE100 *)self setConnectionLifetimeTimer:0];
  }
  [(_HAPAccessoryServerBTLE100 *)self setIdleConnectionTimeoutInSec:10.0];
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  [(_HAPAccessoryServerBTLE100 *)self setSecuritySession:0];
  [(HAPAccessoryServer *)self setSecuritySessionOpen:0];

  [(_HAPAccessoryServerBTLE100 *)self setSecuritySessionOpening:0];
}

- (_HAPAccessoryServerBTLE100)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  BOOL v44 = a8;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  __int16 v25 = v23;
  id v26 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  id v49 = v27;
  uint64_t v50 = v24;
  uint64_t v47 = v30;
  id v48 = v28;
  int v46 = v31;
  if (v25)
  {
    v51.receiver = self;
    v51.super_class = (Class)_HAPAccessoryServerBTLE100;
    id v43 = v28;
    uint64_t v32 = v26;
    uint64_t v33 = [(HAPAccessoryServerBTLE *)&v51 initWithPeripheral:v20 name:v21 pairingUsername:v22 statusFlags:v25 stateNumber:v24 stateChanged:v44 connectReason:a9 configNumber:v26 category:v27 setupHash:v43 connectionIdleTime:a13 browser:v29 keyStore:v30 whbStableIdentifier:v31];
    id v34 = v33;
    if (v33)
    {
      [(HAPAccessoryServerBTLE *)v33 peripheral];
      long long v36 = v35 = v25;
      [v36 setDelegate:v34];

      __int16 v25 = v35;
      [(_HAPAccessoryServerBTLE100 *)v34 _resetState];
      [(_HAPAccessoryServerBTLE100 *)v34 _createPrimaryAccessoryFromAdvertisementData];
    }
    long long v37 = v34;
    long long v38 = v37;
  }
  else
  {
    long long v37 = self;
    long long v39 = (void *)MEMORY[0x1D944E080]();
    long long v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v41;
      __int16 v54 = 2112;
      id v55 = v22;
      _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE %@] Missing required parameter 'inStatusFlags'", buf, 0x16u);
    }
    long long v38 = 0;
    uint64_t v32 = v26;
  }

  return v38;
}

+ (id)_convertFromBTLEToHAPUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[HAPMetadata getSharedInstance];
  id v5 = [v4 btleToServiceType:v3];
  if (!v5) {
    id v5 = v3;
  }

  return v5;
}

+ (id)deserializeCharacteristicReadData:(id)a3 characteristicFormat:(unint64_t)a4 supportsAdditionalAuthentication:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = v9;
  id v11 = v9;
  if (!v7) {
    goto LABEL_9;
  }
  id v12 = v9;
  [v12 bytes];
  id v13 = v12;
  [v13 bytes];
  [v13 length];
  if (!TLV8GetBytes())
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:0];

    if (!v11) {
      goto LABEL_4;
    }
LABEL_9:
    id v18 = +[HAPDataValueTransformer defaultDataValueTransformer];
    uint64_t v17 = [v18 reverseTransformedValue:v11 format:a4 error:a6];

    goto LABEL_10;
  }

LABEL_4:
  uint64_t v14 = (void *)MEMORY[0x1D944E080]();
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v21 = v16;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Expected TLV8 value because the characteristic support authorization data but was unable to parse TLV8.", buf, 0xCu);
  }
  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6737 userInfo:0];
    uint64_t v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_10:

  return v17;
}

+ (id)serializeCharacteristicWriteValue:(id)a3 characteristicFormat:(unint64_t)a4 supportsAdditionalAuthentication:(BOOL)a5 authenticationData:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v28 = 0;
  uint64_t v14 = [v13 transformedValue:v11 format:a4 error:&v28];
  id v15 = v28;

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1D944E080]();
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      LODWORD(buf[0]) = 138543874;
      *(void *)((char *)buf + 4) = v18;
      WORD6(buf[0]) = 2112;
      *(void *)((char *)buf + 14) = v11;
      WORD3(buf[1]) = 2112;
      *((void *)&buf[1] + 1) = v15;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Failed to transform the write value '%@' with error: %@", (uint8_t *)buf, 0x20u);
    }
    if (a7)
    {
      id v19 = v15;
LABEL_6:
      id v20 = 0;
      *a7 = v19;
      goto LABEL_21;
    }
LABEL_20:
    id v20 = 0;
    goto LABEL_21;
  }
  id v20 = v14;
  if (v9)
  {
    id v21 = v12;
    memset(buf, 0, sizeof(buf));
    uint64_t v29 = 0;
    id v30 = 0;
    TLV8BufferInit();
    id v22 = v20;
    [v22 bytes];
    [v22 length];
    id v20 = 0;
    if (!TLV8BufferAppend())
    {
      if (v21
        && [v21 length]
        && (id v23 = v21,
            [v23 bytes],
            [v23 length],
            TLV8BufferAppend())
        || TLV8BufferDetach())
      {
        id v20 = 0;
      }
      else
      {
        id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:v29];
        free(v30);
      }
    }
    TLV8BufferFree();

    if (!v20)
    {
      id v24 = (void *)MEMORY[0x1D944E080]();
      __int16 v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        LODWORD(buf[0]) = 138543618;
        *(void *)((char *)buf + 4) = v26;
        WORD6(buf[0]) = 2112;
        *(void *)((char *)buf + 14) = v22;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerBTLE] Failed to encode characteristic write payload: %@", (uint8_t *)buf, 0x16u);
      }
      if (a7)
      {
        id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6737 userInfo:0];
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
LABEL_21:

  return v20;
}

@end