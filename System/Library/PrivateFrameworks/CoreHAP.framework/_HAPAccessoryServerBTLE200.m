@interface _HAPAccessoryServerBTLE200
+ (BOOL)isHAPDescriptor:(id)a3;
+ (BOOL)isHAPService:(id)a3;
+ (BOOL)parseCharacteristicConfigurationResponse:(id)a3 error:(id *)a4;
+ (BOOL)parseProtocolConfigurationResponse:(id)a3 key:(id *)a4 stateNumber:(id *)a5 error:(id *)a6;
+ (BOOL)parseReadResponse:(id)a3 value:(id *)a4 notificationContext:(id *)a5 error:(id *)a6;
+ (BOOL)parseWriteResponse:(id)a3 value:(id *)a4 error:(id *)a5;
+ (id)configurationRequestForCharacteristic:(id)a3 isBroadcasted:(BOOL)a4 interval:(unint64_t)a5 error:(id *)a6;
+ (id)configurationRequestForService:(id)a3 configRequestType:(unsigned __int8)a4 error:(id *)a5;
+ (id)executeWriteRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5;
+ (id)extractNotificationContextFromBodyData:(id)a3 error:(id *)a4;
+ (id)extractSerializedRequestValueFromBodyData:(id)a3 error:(id *)a4;
+ (id)logCategory;
+ (id)parseServiceSignatureResponse:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 error:(id *)a6;
+ (id)parseSignatureResponse:(id)a3 error:(id *)a4;
+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8;
+ (id)readRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5;
+ (id)signatureRequestForCharacteristic:(id)a3 requiresAuthentication:(BOOL)a4 error:(id *)a5;
+ (id)signatureRequestForService:(id)a3 characteristic:(id)a4 requiresAuthentication:(BOOL)a5 error:(id *)a6;
+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8;
- (BOOL)_cancelDiscoveryWithError:(id)a3;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_parsePairingFeaturesCharacteristic:(id)a3 authMethod:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_shouldIgnoreRetryDiscoveryError:(id)a3;
- (BOOL)_validateGeneratedBroadcastKey:(id)a3;
- (BOOL)_validateProtocolInfo:(id)a3;
- (BOOL)authenticated;
- (BOOL)doesPeriodicSessionChecks;
- (BOOL)hasBeenDiscovered;
- (BOOL)hasValidCache;
- (BOOL)isBLELinkConnected;
- (BOOL)isBadSetupCode;
- (BOOL)isHAPCharacteristic:(id)a3;
- (BOOL)isPairing;
- (BOOL)isReadyForOperation:(int64_t)a3;
- (BOOL)isSecuritySessionOpen;
- (BOOL)isVerified;
- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5;
- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4 serverPairingCompletion:(id)a5;
- (BOOL)shouldVerifyHAPCharacteristic:(id)a3;
- (BOOL)shouldVerifyHAPService:(id)a3;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5;
- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo;
- (HAPAuthSession)authSession;
- (HAPBLEAccessoryCache)accessoryCache;
- (HAPCharacteristic)identifyCharacteristic;
- (HAPCharacteristic)pairSetupCharacteristic;
- (HAPCharacteristic)pairVerifyCharacteristic;
- (HAPCharacteristic)pairingFeaturesCharacteristic;
- (HAPCharacteristic)pairingsCharacteristic;
- (HAPPairSetupSession)pairSetupSession;
- (HAPSecuritySession)securitySession;
- (HMFTimer)connectionIdleTimer;
- (NSError)pairingDisconnectionError;
- (NSMapTable)characteristicEnableEventCompletionHandlers;
- (NSMapTable)characteristicWriteCompletionHandlers;
- (NSMutableArray)operationsReceivedDuringConnectionStateChange;
- (NSMutableArray)pendingRequests;
- (NSMutableArray)pendingResponses;
- (NSMutableSet)discoveredAccessoryCharacteristicsPendingRead;
- (NSOperationQueue)pairVerifyOperationQueue;
- (NSOperationQueue)requestOperationQueue;
- (NSString)debugDescription;
- (NSString)description;
- (_HAPAccessoryServerBTLE200)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16;
- (_HAPBTLEDiscoveryContext)discoveryContext;
- (double)pairSetupBackoffTimeInterval;
- (id)_characteristicForCBCharacteristic:(id)a3;
- (id)_decryptData:(id)a3 error:(id *)a4;
- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4;
- (id)_getCBCharacteristic:(id)a3 instanceId:(id)a4 service:(id)a5;
- (id)_getCBService:(id)a3 instanceOrder:(unint64_t)a4;
- (id)_getCachedService:(id)a3;
- (id)_getCharacteristicInstanceID:(id)a3 error:(id *)a4;
- (id)_getProtocolInfoService;
- (id)_getServiceInstanceID:(id)a3;
- (id)_hapServicesFromCache;
- (id)_parseCharacteristic:(id)a3 error:(id *)a4;
- (id)_parseService:(id)a3 error:(id *)a4;
- (id)_pendingRequestForCharacteristic:(id)a3;
- (id)_pendingResponseForRequest:(id)a3;
- (id)_serviceCacheFromHAPService:(id)a3 serviceOrder:(unint64_t)a4;
- (id)_serviceForCBService:(id)a3;
- (id)connectionCompletionHandler;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (id)protocolInfoServiceSignatureCharacteristics;
- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4;
- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5;
- (id)setupCodeCompletionHandler;
- (int64_t)connectionState;
- (int64_t)discoveryRetries;
- (unint64_t)_getPairSetupType;
- (unint64_t)_maximumControlWriteLengthForRequest:(id)a3;
- (unint64_t)_outstandingRequests;
- (unint64_t)hapBLEProtocolVersion;
- (unint64_t)numActiveSessionClients;
- (unint64_t)sessionCheckInterval;
- (unsigned)featureFlags;
- (void)_cacheServices:(id)a3;
- (void)_cancelAllQueuedOperationsWithError:(id)a3;
- (void)_cancelConnectionWithError:(id)a3;
- (void)_checkForAuthPrompt:(BOOL)a3;
- (void)_configureBroadcastKeyGeneration:(unsigned __int8)a3 service:(id)a4 withCompletion:(id)a5;
- (void)_configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)_continuePairingAfterMFiCertValidation;
- (void)_createPrimaryAccessoryFromAdvertisementData;
- (void)_disconnectWithDisconnectionError:(id)a3 completionHandler:(id)a4;
- (void)_discoverCharacteristic:(id)a3;
- (void)_discoverCharacteristicsForService:(id)a3;
- (void)_discoverServices;
- (void)_discoverWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)_enableBroadcastEvent:(BOOL)a3 interval:(unint64_t)a4 forCharacteristic:(id)a5 completionHandler:(id)a6;
- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_enableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_enqueueRequest:(id)a3 shouldPrioritize:(BOOL)a4;
- (void)_establishSecureSession;
- (void)_generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)_getPairingFeaturesWithCompletionHandler:(id)a3;
- (void)_handleCompletedDiscovery;
- (void)_handleConnectionIdleTimeout;
- (void)_handleConnectionWithError:(id)a3;
- (void)_handleDiscoveredCharacteristic:(id)a3 error:(id)a4;
- (void)_handleDiscoveredCharacteristicsForService:(id)a3 error:(id)a4;
- (void)_handleDiscoveredDescriptors:(id)a3;
- (void)_handleDiscoveredServices:(id)a3 error:(id)a4;
- (void)_handleEventIndicationForCharacteristic:(id)a3;
- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4;
- (void)_handlePairSetupSessionExchangeData:(id)a3;
- (void)_handlePairingSetupCodeRequestWithCompletionHandler:(id)a3;
- (void)_handleReadCharacteristicSignature:(id)a3 error:(id)a4;
- (void)_handleReadCharacteristicValue:(id)a3 error:(id)a4;
- (void)_handleReadDescriptorValue:(id)a3 error:(id)a4;
- (void)_handleReadServiceInstanceId:(id)a3;
- (void)_handleReadServiceSignature:(id)a3 error:(id)a4;
- (void)_handleResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5;
- (void)_handleSecuritySessionSetupExchangeData:(id)a3;
- (void)_handleUpdateValueForCharacteristic:(id)a3 error:(id)a4;
- (void)_handleWriteCompletionForCharacteristic:(id)a3 error:(id)a4;
- (void)_invokeOperationsReceivedDuringConnectionStateChangeWithError:(id)a3;
- (void)_kickConnectionIdleTimer;
- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4;
- (void)_notifyDelegatesOfConnectionState:(BOOL)a3 withError:(id)a4;
- (void)_notifyDelegatesPairingStopped:(id)a3;
- (void)_pairingCompletedWithError:(id)a3;
- (void)_performEnableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)_performTimedWriteExecuteForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)_performTimedWritePrepareWithValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)_performTimedWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)_performWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)_readCharacteristicSignature:(id)a3;
- (void)_readCharacteristicSignatures;
- (void)_readCharacteristicValue:(id)a3;
- (void)_readCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_readDescriptorValue:(id)a3;
- (void)_readPendingDiscoveredCharacteristicTypesWithCompletion:(id)a3;
- (void)_readServiceSignature:(id)a3;
- (void)_readValueForCharacteristic:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)_reallySendRequest:(id)a3 completionHandler:(id)a4;
- (void)_removePairingOfAccessoryServerCancelledMidPairing;
- (void)_requestResponseForRequest:(id)a3;
- (void)_resetWithError:(id)a3;
- (void)_restartConnectionIdleTimer:(double)a3;
- (void)_resumeAllOperations;
- (void)_resumeConnectionIdleTimer;
- (void)_retryDiscovery;
- (void)_sendControlPacket:(id)a3 forRequest:(id)a4 completionHandler:(id)a5;
- (void)_sendData:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5;
- (void)_sendPairingRequestData:(id)a3 completionHandler:(id)a4;
- (void)_sendProtocolInfoServiceExchangeData:(id)a3 completion:(id)a4;
- (void)_sendRequest:(id)a3 shouldPrioritize:(BOOL)a4 responseHandler:(id)a5;
- (void)_suspendAllOperations;
- (void)_suspendConnectionIdleTimer;
- (void)_updateConnectionIdleTime:(unsigned __int8)a3;
- (void)_updateLastKeyBagIdentityIndexFailingPVWithError:(id)a3;
- (void)_updatePropertiesFromCharacteristic:(id)a3;
- (void)_writeValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)authSession:(id)a3 authComplete:(id)a4;
- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4;
- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5;
- (void)authenticateAccessory;
- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)connectWithCompletionHandler:(id)a3;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)controlOutputStream:(id)a3 didCloseWithError:(id)a4;
- (void)controlOutputStream:(id)a3 didReceiveRequestToSendControlPacket:(id)a4 completionHandler:(id)a5;
- (void)controlOutputStreamDidComplete:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)discoverAccessories;
- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)evaluateConnectionStateForOperation:(int64_t)a3 block:(id)a4;
- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5;
- (void)getAccessoryInfo:(id)a3;
- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4;
- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)markNotifyingCharacteristicUpdatedforCharacteristic:(id)a3;
- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4;
- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4;
- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4;
- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)provisionToken:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)securitySession:(id)a3 didCloseWithError:(id)a4;
- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4;
- (void)securitySessionDidOpen:(id)a3;
- (void)securitySessionIsOpening:(id)a3;
- (void)setAccessoryCache:(id)a3;
- (void)setAuthSession:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticatedProtocolInfo:(id)a3;
- (void)setBadPairSetupCode:(BOOL)a3;
- (void)setConnectionCompletionHandler:(id)a3;
- (void)setConnectionIdleTimer:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setDiscoveredAccessoryCharacteristicsPendingRead:(id)a3;
- (void)setDiscoveryContext:(id)a3;
- (void)setDiscoveryRetries:(int64_t)a3;
- (void)setFeatureFlags:(unsigned __int8)a3;
- (void)setHasBeenDiscovered:(BOOL)a3;
- (void)setHasValidCache:(BOOL)a3;
- (void)setIdentifyCharacteristic:(id)a3;
- (void)setOperationsReceivedDuringConnectionStateChange:(id)a3;
- (void)setPairSetupBackoffTimeInterval:(double)a3;
- (void)setPairSetupCharacteristic:(id)a3;
- (void)setPairSetupSession:(id)a3;
- (void)setPairVerifyCharacteristic:(id)a3;
- (void)setPairing:(BOOL)a3;
- (void)setPairingDisconnectionError:(id)a3;
- (void)setPairingFeaturesCharacteristic:(id)a3;
- (void)setPairingsCharacteristic:(id)a3;
- (void)setSecuritySession:(id)a3;
- (void)setSecuritySessionOpen:(BOOL)a3;
- (void)setSetupCodeCompletionHandler:(id)a3;
- (void)setVerified:(BOOL)a3;
- (void)startPairingWithRequest:(id)a3;
- (void)submitPairVerifyMetricWithError:(id)a3;
- (void)tearDownSessionOnAuthCompletion;
- (void)timerDidFire:(id)a3;
- (void)updateConnectionIdleTime:(unsigned __int8)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation _HAPAccessoryServerBTLE200

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationsReceivedDuringConnectionStateChange, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryCharacteristicsPendingRead, 0);
  objc_storeStrong((id *)&self->_characteristicEnableEventCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_characteristicWriteCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_destroyWeak((id *)&self->_pairingsCharacteristic);
  objc_storeStrong((id *)&self->_pairVerifyOperationQueue, 0);
  objc_destroyWeak((id *)&self->_pairVerifyCharacteristic);
  objc_destroyWeak((id *)&self->_pairSetupCharacteristic);
  objc_destroyWeak((id *)&self->_pairingFeaturesCharacteristic);
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, 0);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_pairingDisconnectionError, 0);
  objc_storeStrong(&self->_setupCodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_destroyWeak((id *)&self->_identifyCharacteristic);
  objc_storeStrong((id *)&self->_discoveryContext, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong(&self->_connectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);

  objc_storeStrong((id *)&self->_securitySession, 0);
}

- (void)setOperationsReceivedDuringConnectionStateChange:(id)a3
{
}

- (NSMutableArray)operationsReceivedDuringConnectionStateChange
{
  return self->_operationsReceivedDuringConnectionStateChange;
}

- (void)setDiscoveredAccessoryCharacteristicsPendingRead:(id)a3
{
}

- (NSMutableSet)discoveredAccessoryCharacteristicsPendingRead
{
  return self->_discoveredAccessoryCharacteristicsPendingRead;
}

- (void)setFeatureFlags:(unsigned __int8)a3
{
  self->_featureFlags = a3;
}

- (unsigned)featureFlags
{
  return self->_featureFlags;
}

- (NSMapTable)characteristicEnableEventCompletionHandlers
{
  return self->_characteristicEnableEventCompletionHandlers;
}

- (NSMapTable)characteristicWriteCompletionHandlers
{
  return self->_characteristicWriteCompletionHandlers;
}

- (NSMutableArray)pendingResponses
{
  return self->_pendingResponses;
}

- (NSOperationQueue)requestOperationQueue
{
  return self->_requestOperationQueue;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPairingsCharacteristic:(id)a3
{
}

- (NSOperationQueue)pairVerifyOperationQueue
{
  return self->_pairVerifyOperationQueue;
}

- (void)setPairVerifyCharacteristic:(id)a3
{
}

- (void)setPairSetupCharacteristic:(id)a3
{
}

- (void)setPairingFeaturesCharacteristic:(id)a3
{
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return self->_authenticatedProtocolInfo;
}

- (void)setAuthSession:(id)a3
{
}

- (HAPAuthSession)authSession
{
  return self->_authSession;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setPairingDisconnectionError:(id)a3
{
}

- (NSError)pairingDisconnectionError
{
  return self->_pairingDisconnectionError;
}

- (void)setPairing:(BOOL)a3
{
  self->_pairing = a3;
}

- (BOOL)isPairing
{
  return self->_pairing;
}

- (void)setSetupCodeCompletionHandler:(id)a3
{
}

- (id)setupCodeCompletionHandler
{
  return self->_setupCodeCompletionHandler;
}

- (void)setBadPairSetupCode:(BOOL)a3
{
  self->_badPairSetupCode = a3;
}

- (BOOL)isBadSetupCode
{
  return self->_badPairSetupCode;
}

- (void)setPairSetupBackoffTimeInterval:(double)a3
{
  self->_pairSetupBackoffTimeInterval = a3;
}

- (double)pairSetupBackoffTimeInterval
{
  return self->_pairSetupBackoffTimeInterval;
}

- (void)setPairSetupSession:(id)a3
{
}

- (HAPPairSetupSession)pairSetupSession
{
  return self->_pairSetupSession;
}

- (void)setIdentifyCharacteristic:(id)a3
{
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (BOOL)isVerified
{
  return self->_verified;
}

- (void)setDiscoveryRetries:(int64_t)a3
{
  self->_discoveryRetries = a3;
}

- (int64_t)discoveryRetries
{
  return self->_discoveryRetries;
}

- (void)setDiscoveryContext:(id)a3
{
}

- (_HAPBTLEDiscoveryContext)discoveryContext
{
  return self->_discoveryContext;
}

- (void)setConnectionIdleTimer:(id)a3
{
}

- (HMFTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (void)setConnectionCompletionHandler:(id)a3
{
}

- (id)connectionCompletionHandler
{
  return self->_connectionCompletionHandler;
}

- (void)setAccessoryCache:(id)a3
{
}

- (HAPBLEAccessoryCache)accessoryCache
{
  return self->_accessoryCache;
}

- (void)disconnect
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Disconnecting as a result of direct disconnect call", buf, 0xCu);
  }
  v7 = [(HAPAccessoryServer *)v4 clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___HAPAccessoryServerBTLE200_disconnect__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = v4;
  dispatch_async(v7, block);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_HAPAccessoryServerBTLE200 *)self connectionIdleTimer];

  if (v6 == v4)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __43___HAPAccessoryServerBTLE200_timerDidFire___block_invoke;
    v26 = &unk_1E69F4330;
    v27 = self;
    [(HAPAccessoryServer *)self pairingActivity];

    [(_HAPAccessoryServerBTLE200 *)self _handleConnectionIdleTimeout];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [v12 responseTimer];

          if (v13 == v4)
          {
            v14 = (void *)MEMORY[0x1D944E080]();
            v15 = self;
            v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v29 = v17;
              __int16 v30 = 2112;
              v31 = v12;
              _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Cancelling the timed out request: %@", buf, 0x16u);
            }
            v18 = [MEMORY[0x1E4F28C58] hapErrorWithCode:24 description:@"Request failed." reason:@"Request timed out waiting for response." suggestion:0 underlyingError:0];
            [v12 cancelWithError:v18];

            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___HAPAccessoryServerBTLE200_securitySession_didCloseWithError___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_updateLastKeyBagIdentityIndexFailingPVWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v15 = v8;

  id v9 = [v15 domain];
  int v10 = HMFEqualObjects();

  if (v10 && [v15 code] == -6754)
  {
    uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
    id v12 = NSNumber;
    id v13 = [(HAPAccessoryServer *)self keyBag];
    id v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "getCurrentIndexInBag"));
    [v11 setLastKeyBagIdentityIndexFailingPV:v14];
  }
}

- (BOOL)_shouldIgnoreRetryDiscoveryError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 underlyingErrors];
  v5 = [v4 firstObject];

  BOOL v6 = (([v3 isHAPError] & 1) != 0 || objc_msgSend(v5, "isHAPError"))
    && ([v3 code] == 27 || objc_msgSend(v5, "code") == 27);

  return v6;
}

- (void)securitySessionDidOpen:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___HAPAccessoryServerBTLE200_securitySessionDidOpen___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)securitySessionIsOpening:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___HAPAccessoryServerBTLE200_securitySessionIsOpening___block_invoke;
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
  block[2] = __74___HAPAccessoryServerBTLE200_securitySession_didReceiveSetupExchangeData___block_invoke;
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
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
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v13];
      v16 = [[HAPPairingIdentity alloc] initWithIdentifier:v9 publicKey:v15 privateKey:0 permissions:0];
      if (!v16)
      {
        v17 = (void *)MEMORY[0x1D944E080]();
        v18 = self;
        long long v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          long long v20 = v30 = v17;
          *(_DWORD *)buf = 138543874;
          uint64_t v33 = v20;
          __int16 v34 = 2112;
          id v35 = v9;
          __int16 v36 = 2112;
          id v37 = v13;
          _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Failed to create pairing identity with identifier, %@, public key, %@", buf, 0x20u);

          v17 = v30;
        }

        if (a5)
        {
          *a5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Failed to retrieve peer pairing identity." reason:@"Failed to create pairing identity" suggestion:0 underlyingError:0];
        }
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x1D944E080]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v28;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        id v37 = v14;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve public key for accessory with identifier '%@' with error: %@", buf, 0x20u);
      }
      v16 = 0;
    }
  }
  else
  {
    long long v21 = (void *)MEMORY[0x1D944E080]();
    long long v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v24;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Unexpected pairing peer identifier, %@", buf, 0x16u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:16 description:@"Insufficient Authorization." reason:@"Unexpected pairing peer identifier." suggestion:0 underlyingError:0];
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v10;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Request for local pairing identity", (uint8_t *)&v13, 0xCu);
  }
  char v11 = [(HAPAccessoryServer *)v8 getControllerPairingIdentityWithError:a4];

  return v11;
}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self metric_pairVerifyReason];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    uint64_t v8 = [v7 sessionStartTime];

    if (v8)
    {
      mach_absolute_time();
      uint64_t v9 = UpTicksToMilliseconds();
      id v10 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
      -[HAPAccessoryServer setMetric_pairVerifyDurationInMS:](self, "setMetric_pairVerifyDurationInMS:", v9 - [v10 sessionStartTime]);

      v11.receiver = self;
      v11.super_class = (Class)_HAPAccessoryServerBTLE200;
      [(HAPAccessoryServer *)&v11 submitPairVerifyMetricWithError:v4];
    }
  }
}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55___HAPAccessoryServerBTLE200_authSession_authComplete___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60___HAPAccessoryServerBTLE200_authSession_confirmUUID_token___block_invoke;
  v15[3] = &unk_1E69F4098;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65___HAPAccessoryServerBTLE200_authSession_authenticateUUID_token___block_invoke;
  v15[3] = &unk_1E69F4098;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61___HAPAccessoryServerBTLE200_authSession_validateUUID_token___block_invoke;
  v15[3] = &unk_1E69F4098;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___HAPAccessoryServerBTLE200_authSession_sendAuthExchangeData___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_notifyDelegatesOfConnectionState:(BOOL)a3 withError:(id)a4
{
  id v6 = a4;
  if ([(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServer_didUpdateConnectionState_linkLayerType_withError_])
  {
    id v7 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74___HAPAccessoryServerBTLE200__notifyDelegatesOfConnectionState_withError___block_invoke;
    block[3] = &unk_1E69F2938;
    void block[4] = self;
    BOOL v10 = a3;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

- (void)_notifyDelegatesPairingStopped:(id)a3
{
  id v4 = a3;
  if ([(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
  {
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61___HAPAccessoryServerBTLE200__notifyDelegatesPairingStopped___block_invoke;
    v6[3] = &unk_1E69F46E0;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)_continuePairingAfterMFiCertValidation
{
  [(_HAPAccessoryServerBTLE200 *)self tearDownSessionOnAuthCompletion];
  [(_HAPAccessoryServerBTLE200 *)self setPairing:0];
  [(_HAPAccessoryServerBTLE200 *)self setBadPairSetupCode:0];
  [(_HAPAccessoryServerBTLE200 *)self setPairSetupBackoffTimeInterval:0.0];
  [(_HAPAccessoryServerBTLE200 *)self setPairSetupSession:0];

  [(_HAPAccessoryServerBTLE200 *)self _notifyDelegatesPairingStopped:0];
}

- (void)tearDownSessionOnAuthCompletion
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___HAPAccessoryServerBTLE200_tearDownSessionOnAuthCompletion__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)provisionToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Provisioning Tokens T1: %@", buf, 0x16u);
  }
  id v9 = [(HAPAccessoryServer *)v6 clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45___HAPAccessoryServerBTLE200_provisionToken___block_invoke;
  v11[3] = &unk_1E69F46E0;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D944E080](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    unint64_t v9 = [(HAPAccessoryServer *)v6 authMethod];
    if (v9 > 6) {
      id v10 = @"HAPAuthMethodUnknown";
    }
    else {
      id v10 = off_1E69EFD28[v9];
    }
    objc_super v11 = v10;
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Current Auth Method %@", buf, 0x16u);
  }
  id v12 = [(HAPAccessoryServer *)v6 clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58___HAPAccessoryServerBTLE200_continueAuthAfterValidation___block_invoke;
  v13[3] = &unk_1E69F3DF8;
  v13[4] = v6;
  BOOL v14 = a3;
  dispatch_async(v12, v13);
}

- (void)authenticateAccessory
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___HAPAccessoryServerBTLE200_authenticateAccessory__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)_validateProtocolInfo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 deviceIdentifier];
  id v6 = [(HAPAccessoryServer *)self identifier];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_7;
  }
  int v7 = [v4 categoryIdentifier];
  id v8 = [(HAPAccessoryServer *)self category];
  if (v7 != [v8 unsignedShortValue]
    || (int v9 = [v4 featureFlags], v9 != -[_HAPAccessoryServerBTLE200 featureFlags](self, "featureFlags")))
  {

LABEL_7:
    goto LABEL_8;
  }
  id v10 = [v4 protocolVersion];
  uint64_t v11 = [v10 majorVersion];
  id v12 = [(HAPAccessoryServer *)self version];
  uint64_t v13 = [v12 majorVersion];

  if (v11 == v13)
  {
    BOOL v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  __int16 v15 = (void *)MEMORY[0x1D944E080]();
  id v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = HMFGetLogIdentifier();
    uint64_t v19 = [(HAPAccessoryServer *)v16 identifier];
    long long v20 = [(HAPAccessoryServer *)v16 category];
    uint64_t v21 = [(HAPAccessoryServer *)v16 authMethod];
    long long v22 = [(HAPAccessoryServer *)v16 version];
    int v24 = 138544642;
    v25 = v18;
    __int16 v26 = 2112;
    id v27 = v4;
    __int16 v28 = 2112;
    v29 = v19;
    __int16 v30 = 2112;
    id v31 = v20;
    __int16 v32 = 2048;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    id v35 = v22;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated Info %@ does not match: identifier: %@, category: %@, authMethods: %tu version: %@", (uint8_t *)&v24, 0x3Eu);
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)getAccessoryInfo:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___HAPAccessoryServerBTLE200_getAccessoryInfo___block_invoke;
  block[3] = &unk_1E69F3830;
  id v8 = v4;
  int v9 = v10;
  void block[4] = self;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4
{
  id v6 = a3;
  int v7 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke;
  block[3] = &unk_1E69F2088;
  id v11 = v6;
  id v12 = self;
  double v13 = a4;
  id v8 = v6;
  dispatch_async(v7, block);

  return 0;
}

- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73___HAPAccessoryServerBTLE200_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke;
  block[3] = &unk_1E69F4070;
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveProductData___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___HAPAccessoryServerBTLE200_pairSetupSession_didStopWithError___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    double v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v44 = v13;
    __int16 v45 = 2112;
    id v46 = v9;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Request to save pairing peer: %@", buf, 0x16u);
  }
  id v14 = [v9 identifier];
  __int16 v15 = [(HAPAccessoryServer *)v11 identifier];
  char v16 = [v14 isEqualToString:v15];

  if (v16)
  {
    __int16 v17 = [v9 publicKey];
    id v18 = [v17 data];

    uint64_t v19 = [(HAPAccessoryServer *)v11 keyStore];
    long long v20 = [v9 identifier];
    id v42 = 0;
    char v21 = [v19 savePublicKey:v18 forAccessoryName:v20 error:&v42];
    id v22 = v42;

    if (v21)
    {
      [(HAPAccessoryServer *)v11 associateAccessoryWithControllerKeyUsingAccessoryPublicKey:v18];
      id v41 = 0;
      BOOL v23 = [(HAPAccessoryServerBTLE *)v11 updatePeripheralIdentifier:&v41 isPairing:1];
      id v24 = v41;
      if (!v23)
      {
        v25 = (void *)MEMORY[0x1D944E080]();
        __int16 v26 = v11;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v28 = v40 = v25;
          *(_DWORD *)buf = 138543618;
          v44 = v28;
          __int16 v45 = 2112;
          id v46 = v24;
          _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the accessory's peripheral identifier with error: %@", buf, 0x16u);

          v25 = v40;
        }

        if (a5) {
          *a5 = v24;
        }
      }
    }
    else
    {
      id v35 = (void *)MEMORY[0x1D944E080]();
      uint64_t v36 = v11;
      id v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v44 = v38;
        __int16 v45 = 2112;
        id v46 = v22;
        _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to save accessory's identifier and public key to the keystore with error: %@", buf, 0x16u);
      }
      BOOL v23 = 0;
      if (a5) {
        *a5 = v22;
      }
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1D944E080]();
    __int16 v30 = v11;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      uint64_t v33 = [v9 identifier];
      __int16 v34 = [(HAPAccessoryServer *)v30 identifier];
      *(_DWORD *)buf = 138543874;
      v44 = v32;
      __int16 v45 = 2112;
      id v46 = v33;
      __int16 v47 = 2112;
      v48 = v34;
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@The peer's identifier exchanged during Pair Setup, %@, does not match the identifier from the accessory's advertisement, %@", buf, 0x20u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:7 description:@"Pairing failed." reason:@"The peer's identifier does not match it's advertised identifier" suggestion:0 underlyingError:0];
      BOOL v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v10;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Request for local pairing identity", (uint8_t *)&v17, 0xCu);
  }
  id v11 = [(HAPAccessoryServer *)v8 pairingRequest];
  uint64_t v12 = [v11 pairingIdentity];
  if (v12)
  {
    double v13 = (void *)v12;
LABEL_5:

    goto LABEL_7;
  }
  id v14 = [(HAPAccessoryServer *)v8 keyBag];
  double v13 = [v14 currentIdentity];

  if (!v13)
  {
    id v11 = [(HAPAccessoryServer *)v8 keyStore];
    char v16 = [(HAPAccessoryServer *)v8 identifier];
    double v13 = [v11 readControllerPairingKeyForAccessory:v16 error:a4];

    goto LABEL_5;
  }
LABEL_7:

  return v13;
}

- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___HAPAccessoryServerBTLE200_pairSetupSession_didReceiveSetupExchangeData___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)controlOutputStreamDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___HAPAccessoryServerBTLE200_controlOutputStreamDidComplete___block_invoke;
  block[3] = &unk_1E69F4330;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)controlOutputStream:(id)a3 didCloseWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68___HAPAccessoryServerBTLE200_controlOutputStream_didCloseWithError___block_invoke;
  v11[3] = &unk_1E69F46E0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)controlOutputStream:(id)a3 didReceiveRequestToSendControlPacket:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105___HAPAccessoryServerBTLE200_controlOutputStream_didReceiveRequestToSendControlPacket_completionHandler___block_invoke;
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

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91___HAPAccessoryServerBTLE200_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E69F4098;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___HAPAccessoryServerBTLE200_peripheral_didWriteValueForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E69F4098;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E69F4098;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75___HAPAccessoryServerBTLE200_peripheral_didUpdateValueForDescriptor_error___block_invoke;
  v15[3] = &unk_1E69F4098;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87___HAPAccessoryServerBTLE200_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke;
  v15[3] = &unk_1E69F4098;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84___HAPAccessoryServerBTLE200_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
  v15[3] = &unk_1E69F4098;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___HAPAccessoryServerBTLE200_peripheral_didModifyServices___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 services];
  id v9 = (void *)[v8 copy];

  id v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v24 = v13;
    __int16 v25 = 2112;
    __int16 v26 = v9;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Discovered CB services: %@", buf, 0x16u);
  }
  id v14 = [(HAPAccessoryServer *)v11 clientQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61___HAPAccessoryServerBTLE200_peripheral_didDiscoverServices___block_invoke;
  v18[3] = &unk_1E69F4098;
  id v19 = v6;
  long long v20 = v11;
  id v21 = v9;
  id v22 = v7;
  id v15 = v7;
  id v16 = v9;
  id v17 = v6;
  dispatch_async(v14, v18);
}

- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self delegate];
  if ([v8 conformsToProtocol:&unk_1F2CA6D90])
  {
    BOOL v9 = [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServerBTLE_willSendPlaintextPayload_forCharacteristic_];

    if (v9)
    {
      id v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83___HAPAccessoryServerBTLE200__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke;
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
    BOOL v9 = [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServerBTLE_willSendEncryptedAndAuthenticatedPayload_forCharacteristic_];

    if (v9)
    {
      id v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96___HAPAccessoryServerBTLE200__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke;
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
    BOOL v9 = [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServerBTLE_didReceivePlaintextPayload_forCharacteristic_];

    if (v9)
    {
      id v10 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __87___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke;
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
      block[2] = __100___HAPAccessoryServerBTLE200__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke;
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

- (BOOL)_validateGeneratedBroadcastKey:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HAPAccessoryServer *)self keyStore];
    id v30 = 0;
    id v31 = 0;
    id v29 = 0;
    id v6 = [(HAPAccessoryServer *)self identifier];
    id v28 = 0;
    int v7 = [v5 getControllerPublicKey:&v31 secretKey:&v30 username:&v29 allowCreation:0 forAccessory:v6 error:&v28];
    id v8 = v31;
    id v9 = v30;
    id v10 = v29;
    id v11 = v28;

    if (v7)
    {
      id v12 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
      id v13 = [v12 broadcastKey];
      char v14 = [v13 isEqualToData:v4];

      if (v14)
      {
        BOOL v15 = 1;
LABEL_12:

        goto LABEL_13;
      }
      id v16 = (void *)MEMORY[0x1D944E080]();
      id v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v33 = v19;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Generated Broadcast key does not match", buf, 0xCu);
      }
    }
    long long v20 = (void *)MEMORY[0x1D944E080]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      BOOL v23 = HMFGetLogIdentifier();
      id v24 = [(_HAPAccessoryServerBTLE200 *)v21 securitySession];
      [v24 broadcastKey];
      v25 = id v27 = v9;
      *(_DWORD *)buf = 138544642;
      uint64_t v33 = v23;
      __int16 v34 = 2112;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      v39 = v25;
      __int16 v40 = 2112;
      id v41 = v4;
      __int16 v42 = 2112;
      id v43 = v11;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Controller Public Key: %@, Controller Identifier: %@, \n\tGenerated Broadcast Key: %@, \n\tAccessory Broadcast Key: %@. Error: %@", buf, 0x3Eu);

      id v9 = v27;
    }

    BOOL v15 = 0;
    goto LABEL_12;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (void)_generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_HAPAccessoryServerBTLE200 *)self _getProtocolInfoService];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80___HAPAccessoryServerBTLE200__generateBroadcastKey_queue_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E69F1B78;
  objc_copyWeak(&v16, &location);
  char v17 = v6;
  id v11 = v8;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [(_HAPAccessoryServerBTLE200 *)self _configureBroadcastKeyGeneration:v6 service:v10 withCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HAPAccessoryServer *)self clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79___HAPAccessoryServerBTLE200_generateBroadcastKey_queue_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E69F3600;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unsigned __int8 v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
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
  return 1;
}

- (BOOL)isBLELinkConnected
{
  return [(_HAPAccessoryServerBTLE200 *)self connectionState] == 2;
}

- (void)_handleConnectionIdleTimeout
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:29];
  if ([(_HAPAccessoryServerBTLE200 *)self isPairing]) {
    [(_HAPAccessoryServerBTLE200 *)self setPairingDisconnectionError:v3];
  }
  int64_t v4 = [(_HAPAccessoryServerBTLE200 *)self connectionState];
  id v5 = (void *)MEMORY[0x1D944E080]();
  uint64_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [(HAPAccessoryServerBTLE *)v6 peripheral];
      int v16 = 138543618;
      char v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, cancelling connection to the peripheral: %@", (uint8_t *)&v16, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hapErrorWithCode:8 description:@"Connection Failed" reason:@"Connection request timed out" suggestion:0 underlyingError:v3];
    [(_HAPAccessoryServerBTLE200 *)v6 _cancelConnectionWithError:v11];
  }
  else
  {
    if (v8)
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = NSNumber;
      id v14 = [(_HAPAccessoryServerBTLE200 *)v6 requestOperationQueue];
      id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "operationCount"));
      int v16 = 138543618;
      char v17 = v12;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, pending requests: %@", (uint8_t *)&v16, 0x16u);
    }
    [(_HAPAccessoryServerBTLE200 *)v6 _disconnectWithDisconnectionError:v3 completionHandler:0];
  }
}

- (void)_suspendConnectionIdleTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  int64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Suspending the connection idle timer...", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(_HAPAccessoryServerBTLE200 *)v4 connectionIdleTimer];
  [v7 suspend];
}

- (void)_resumeConnectionIdleTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  int64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Resuming the connection idle timer...", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(_HAPAccessoryServerBTLE200 *)v4 connectionIdleTimer];
  [v7 resume];
}

- (void)_kickConnectionIdleTimer
{
  id v2 = [(_HAPAccessoryServerBTLE200 *)self connectionIdleTimer];
  [v2 kick];
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAPAccessoryServer *)self connectionStartTime];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [(HAPAccessoryServer *)self connectionStartTime];
    [v9 timeIntervalSinceDate:v10];
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }

  [(HAPAccessoryServer *)self setConnectionStartTime:0];
  id v13 = [(HAPAccessoryServer *)self clientQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77___HAPAccessoryServerBTLE200_handleDisconnectionWithError_completionHandler___block_invoke;
  v16[3] = &unk_1E69F1B50;
  id v17 = v6;
  __int16 v18 = self;
  uint64_t v20 = v12;
  id v19 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(v13, v16);
}

- (BOOL)isReadyForOperation:(int64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___HAPAccessoryServerBTLE200_isReadyForOperation___block_invoke;
  block[3] = &unk_1E69F2DF0;
  void block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (void)_handleConnectionWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Connection completed with error: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v4)
  {
    [(_HAPAccessoryServerBTLE200 *)v6 setConnectionState:0];
    [(_HAPAccessoryServerBTLE200 *)v6 _suspendConnectionIdleTimer];
  }
  else
  {
    id v9 = [(HAPAccessoryServerBTLE *)v6 browser];
    uint64_t v10 = [(HAPAccessoryServerBTLE *)v6 peripheral];
    [v9 setConnectionLatency:1 forPeripheral:v10];

    [(_HAPAccessoryServerBTLE200 *)v6 setConnectionState:2];
    [(_HAPAccessoryServerBTLE200 *)v6 _updateConnectionIdleTime:[(HAPAccessoryServerBTLE *)v6 connectionIdleTime]];
    [(_HAPAccessoryServerBTLE200 *)v6 _kickConnectionIdleTimer];
    [(HAPAccessoryServerBTLE *)v6 incrementHAPBTLEMetricsConnectionCount];
  }
  char v11 = [(_HAPAccessoryServerBTLE200 *)v6 connectionCompletionHandler];
  uint64_t v12 = MEMORY[0x1D944E2D0]();
  id v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);
  }

  [(_HAPAccessoryServerBTLE200 *)v6 setConnectionCompletionHandler:0];
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___HAPAccessoryServerBTLE200_handleConnectionWithPeripheral_withError___block_invoke;
  block[3] = &unk_1E69F4708;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D944E080]([(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer]);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2048;
    double v17 = a3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating connectionIdle time to: %f", (uint8_t *)&v14, 0x16u);
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:a3];
  [(_HAPAccessoryServerBTLE200 *)v6 setConnectionIdleTimer:v9];

  id v10 = [(_HAPAccessoryServerBTLE200 *)v6 connectionIdleTimer];
  [v10 setDelegate:v6];

  char v11 = [(_HAPAccessoryServerBTLE200 *)v6 connectionIdleTimer];
  id v12 = [(HAPAccessoryServer *)v6 clientQueue];
  [v11 setDelegateQueue:v12];

  id v13 = [(_HAPAccessoryServerBTLE200 *)v6 connectionIdleTimer];
  [v13 resume];
}

- (void)_updateConnectionIdleTime:(unsigned __int8)a3
{
  int v3 = a3;
  -[HAPAccessoryServerBTLE setConnectionIdleTime:](self, "setConnectionIdleTime:");
  double v5 = 5.0;
  if (v3 == 1) {
    double v5 = 2.0;
  }
  if (v3 == 2) {
    double v5 = 15.0;
  }

  [(_HAPAccessoryServerBTLE200 *)self _restartConnectionIdleTimer:v5];
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___HAPAccessoryServerBTLE200_updateConnectionIdleTime___block_invoke;
  v6[3] = &unk_1E69F3DF8;
  void v6[4] = self;
  unsigned __int8 v7 = a3;
  dispatch_async(v5, v6);
}

- (void)_disconnectWithDisconnectionError:(id)a3 completionHandler:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  int64_t v9 = [(_HAPAccessoryServerBTLE200 *)self connectionState];
  if (v9 == 2)
  {
    id v10 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
    uint64_t v11 = [v10 operationCount];

    if (v11 && [v6 isHAPError] && objc_msgSend(v6, "code") == 29)
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = self;
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = HMFGetLogIdentifier();
        __int16 v16 = [(HAPAccessoryServerBTLE *)v13 blePeripheral];
        double v17 = [v16 shortDescription];
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:v11];
        *(_DWORD *)buf = 138543874;
        id v43 = v15;
        __int16 v44 = 2112;
        __int16 v45 = v17;
        __int16 v46 = 2112;
        __int16 v47 = v18;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@Deferring disconnecting from the peripheral: %@. Pending requests: %@", buf, 0x20u);
      }
      [(_HAPAccessoryServerBTLE200 *)v13 _kickConnectionIdleTimer];
    }
    else
    {
      __int16 v26 = (void *)MEMORY[0x1D944E080]([(_HAPAccessoryServerBTLE200 *)self setConnectionCompletionHandler:v7]);
      id v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        id v30 = [(HAPAccessoryServerBTLE *)v27 blePeripheral];
        id v31 = [v30 shortDescription];
        __int16 v32 = [NSNumber numberWithUnsignedInteger:v11];
        *(_DWORD *)buf = 138543874;
        id v43 = v29;
        __int16 v44 = 2112;
        __int16 v45 = v31;
        __int16 v46 = 2112;
        __int16 v47 = v32;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_INFO, "%{public}@Disconnecting from the peripheral: %@. Pending requests: %@", buf, 0x20u);
      }
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      __int16 v38 = __82___HAPAccessoryServerBTLE200__disconnectWithDisconnectionError_completionHandler___block_invoke;
      v39 = &unk_1E69F46E0;
      __int16 v40 = v27;
      id v41 = v6;
      __82___HAPAccessoryServerBTLE200__disconnectWithDisconnectionError_completionHandler___block_invoke((uint64_t)&v36);
      [(_HAPAccessoryServerBTLE200 *)v27 _suspendConnectionIdleTimer];
      uint64_t v33 = [(HAPAccessoryServerBTLE *)v27 browser];
      [v33 disconnectFromBTLEAccessoryServer:v27];

      [(_HAPAccessoryServerBTLE200 *)v27 setConnectionState:3];
    }
  }
  else
  {
    int64_t v19 = v9;
    if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      uint64_t v20 = (void *)MEMORY[0x1D944E080]();
      id v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        BOOL v23 = HMFGetLogIdentifier();
        id v24 = [NSNumber numberWithInteger:v19];
        *(_DWORD *)buf = 138543618;
        id v43 = v23;
        __int16 v44 = 2112;
        __int16 v45 = v24;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Trying to disconnect but a connection is already in progress (%@)", buf, 0x16u);
      }
      __int16 v25 = [MEMORY[0x1E4F28C58] hapErrorWithCode:4];
    }
    else
    {
      __int16 v25 = 0;
    }
    uint64_t v34 = MEMORY[0x1D944E2D0](v7);
    id v35 = (void *)v34;
    if (v34) {
      (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v25);
    }
  }
}

- (void)_cancelConnectionWithError:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if ([(_HAPAccessoryServerBTLE200 *)self connectionState] == 1)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Cancelling connection with error: %@", buf, 0x16u);
    }
    double v5 = v4;
    if (!v4)
    {
      double v5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
    }
    id v10 = [(_HAPAccessoryServerBTLE200 *)v7 connectionCompletionHandler];
    uint64_t v11 = MEMORY[0x1D944E2D0]();
    id v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v5);
    }

    [(_HAPAccessoryServerBTLE200 *)v7 setConnectionCompletionHandler:0];
    id v13 = [(_HAPAccessoryServerBTLE200 *)v7 discoveryContext];

    if (v13) {
      [(_HAPAccessoryServerBTLE200 *)v7 _cancelDiscoveryWithError:v5];
    }
    if ([(_HAPAccessoryServerBTLE200 *)v7 isPairing])
    {
      int v14 = [v5 userInfo];
      uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      __int16 v16 = (void *)v15;
      if (v15) {
        double v17 = (void *)v15;
      }
      else {
        double v17 = v5;
      }
      id v18 = v17;

      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      BOOL v23 = __57___HAPAccessoryServerBTLE200__cancelConnectionWithError___block_invoke;
      id v24 = &unk_1E69F46E0;
      __int16 v25 = v7;
      id v26 = v18;
      id v19 = v18;
      __57___HAPAccessoryServerBTLE200__cancelConnectionWithError___block_invoke((uint64_t)&v21);
    }
    uint64_t v20 = [(HAPAccessoryServerBTLE *)v7 browser];
    [v20 disconnectFromBTLEAccessoryServer:v7];
  }
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___HAPAccessoryServerBTLE200_connectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E69F4270;
  void v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_decryptData:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v10;
    __int16 v20 = 2048;
    uint64_t v21 = [v6 length];
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Decrypting data with length %lu", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)v8 securitySession];

  if (v11)
  {
    id v12 = [(_HAPAccessoryServerBTLE200 *)v8 securitySession];
LABEL_7:
    uint64_t v15 = v12;
    __int16 v16 = [v12 decryptData:v6 additionalAuthenticatedData:0 error:a4];

    goto LABEL_8;
  }
  id v13 = [(_HAPAccessoryServerBTLE200 *)v8 pairSetupSession];
  int v14 = [v13 isSecureSession];

  if (v14)
  {
    id v12 = [(_HAPAccessoryServerBTLE200 *)v8 pairSetupSession];
    goto LABEL_7;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Missing security session." reason:0 suggestion:0 underlyingError:0];
    __int16 v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v16 = 0;
  }
LABEL_8:

  return v16;
}

- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Encrypting plaintext data: %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)v8 securitySession];

  if (v11)
  {
    id v12 = [(_HAPAccessoryServerBTLE200 *)v8 securitySession];
LABEL_7:
    uint64_t v15 = v12;
    __int16 v16 = [v12 encryptData:v6 additionalAuthenticatedData:0 error:a4];

    goto LABEL_8;
  }
  id v13 = [(_HAPAccessoryServerBTLE200 *)v8 pairSetupSession];
  int v14 = [v13 isSecureSession];

  if (v14)
  {
    id v12 = [(_HAPAccessoryServerBTLE200 *)v8 pairSetupSession];
    goto LABEL_7;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Missing security session." reason:0 suggestion:0 underlyingError:0];
    __int16 v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v16 = 0;
  }
LABEL_8:

  return v16;
}

- (id)protocolInfoServiceSignatureCharacteristics
{
  id v2 = [(HAPAccessoryServer *)self primaryAccessory];
  int v3 = [v2 servicesOfType:@"000000A2-0000-1000-8000-0026BB765291"];
  id v4 = [v3 firstObject];

  double v5 = [v4 characteristicsOfType:@"000000A5-0000-1000-8000-0026BB765291"];
  id v6 = [v5 firstObject];

  return v6;
}

- (HAPCharacteristic)pairVerifyCharacteristic
{
  p_pairVerifyCharacteristic = &self->_pairVerifyCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairVerifyCharacteristic);

  if (!WeakRetained)
  {
    double v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000055-0000-1000-8000-0026BB765291"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"0000004E-0000-1000-8000-0026BB765291"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairVerifyCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairVerifyCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (void)_handleSecuritySessionSetupExchangeData:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(_HAPAccessoryServerBTLE200 *)self pairVerifyCharacteristic];
  if (v5)
  {
    objc_initWeak(location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70___HAPAccessoryServerBTLE200__handleSecuritySessionSetupExchangeData___block_invoke;
    v12[3] = &unk_1E69F1B20;
    objc_copyWeak(&v14, location);
    id v13 = v5;
    [(_HAPAccessoryServerBTLE200 *)self _writeValue:v4 toCharacteristic:v13 authorizationData:0 contextData:0 options:18 completionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Security session setup exchange failed, missing the Pair Verify characteristic", (uint8_t *)location, 0xCu);
    }
    id v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Security session setup exchange failed." reason:@"Missing Pair Verify characteristic." suggestion:0 underlyingError:0];
    uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)v7 securitySession];
    [v11 receivedSetupExchangeData:0 error:v10];
  }
}

- (void)_establishSecureSession
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(HAPAccessoryServerBTLE *)self isPaired])
  {
    int v3 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    if ([v3 isOpen])
    {

LABEL_9:
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v20 = v15;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@A security session is already established.", buf, 0xCu);
      }
      return;
    }
    id v10 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    int v11 = [v10 isOpening];

    if (v11) {
      goto LABEL_9;
    }
    if (HAPIsHH2Enabled_onceToken != -1) {
      dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
    }
    if (HAPIsHH2Enabled_hh2Enabled == 1)
    {
      [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
      __int16 v16 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
      double v17 = [(HAPAccessoryServer *)self keyBag];
      [v16 updateCurrentPairingIdentityIndexIfNeededForKeyBag:v17];
    }
    int v18 = [[HAPSecuritySession alloc] initWithRole:0 resumeSessionID:[(HAPAccessoryServerBTLE *)self resumeSessionID] delegate:self];
    [(_HAPAccessoryServerBTLE200 *)self setSecuritySession:v18];
    [(HAPSecuritySession *)v18 open];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    double v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = @"Unable to establish a secure session because the accessory isn't paired.";
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Unable to establish a secure session because the accessory isn't paired." reason:0 suggestion:0 underlyingError:0];
    if (v8)
    {
      id v9 = (void *)v8;
      [(_HAPAccessoryServerBTLE200 *)v5 _disconnectWithDisconnectionError:v8 completionHandler:0];
    }
  }
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  int v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  double v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)isSecuritySessionOpen
{
  id v2 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
  char v3 = [v2 isOpen];

  return v3;
}

- (void)setSecuritySession:(id)a3
{
  uint64_t v4 = (HAPSecuritySession *)a3;
  os_unfair_lock_lock_with_options();
  securitySession = self->_securitySession;
  self->_securitySession = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (HAPSecuritySession)securitySession
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_securitySession;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_invokeOperationsReceivedDuringConnectionStateChangeWithError:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_HAPAccessoryServerBTLE200 *)self operationsReceivedDuringConnectionStateChange];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = NSNumber;
      id v13 = [(_HAPAccessoryServerBTLE200 *)v9 operationsReceivedDuringConnectionStateChange];
      id v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      *(_DWORD *)buf = 138543874;
      id v27 = v11;
      __int16 v28 = 2112;
      __int16 v29 = v14;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Invoking %@ operation blocks pended during connection state change with error: %@", buf, 0x20u);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = [(_HAPAccessoryServerBTLE200 *)v9 operationsReceivedDuringConnectionStateChange];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v19++) + 16))();
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }

    __int16 v20 = [(_HAPAccessoryServerBTLE200 *)v9 operationsReceivedDuringConnectionStateChange];
    [v20 removeAllObjects];
  }
}

- (void)evaluateConnectionStateForOperation:(int64_t)a3 block:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___HAPAccessoryServerBTLE200_evaluateConnectionStateForOperation_block___block_invoke;
  block[3] = &unk_1E69F1AF8;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_cancelAllQueuedOperationsWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    double v5 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
    id v6 = [v5 operations];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1D944E080]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int64_t v11 = HMFGetLogIdentifier();
        id v12 = [(_HAPAccessoryServerBTLE200 *)v9 requestOperationQueue];
        id v13 = [v12 operations];
        int v15 = 138543618;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Cancelling all queued operations: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
    [v14 cancelAllOperationsWithError:v4];
  }
}

- (void)_resumeAllOperations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
  int v4 = [v3 isSuspended];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      int64_t v11 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Resuming all request operations", (uint8_t *)&v10, 0xCu);
    }
    id v9 = [(_HAPAccessoryServerBTLE200 *)v6 requestOperationQueue];
    [v9 setSuspended:0];
  }
}

- (void)_suspendAllOperations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
  char v4 = [v3 isSuspended];

  if ((v4 & 1) == 0)
  {
    double v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      int64_t v11 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Suspending all request operations", (uint8_t *)&v10, 0xCu);
    }
    id v9 = [(_HAPAccessoryServerBTLE200 *)v6 requestOperationQueue];
    [v9 setSuspended:1];
  }
}

- (unint64_t)_outstandingRequests
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(_HAPAccessoryServerBTLE200 *)self requestOperationQueue];
  char v3 = [v2 operations];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) isFinished] ^ 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)_enqueueRequest:(id)a3 shouldPrioritize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v10 = HMFGetLogIdentifier();
    int v22 = 138543618;
    long long v23 = v10;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Queueing request: %@", (uint8_t *)&v22, 0x16u);
  }
  long long v11 = [v6 characteristic];
  long long v12 = [(_HAPAccessoryServerBTLE200 *)v8 pairVerifyCharacteristic];
  if ([v11 isEqual:v12])
  {
    int v13 = [v6 type];

    if (v13 != 1)
    {
      uint64_t v14 = [(_HAPAccessoryServerBTLE200 *)v8 pairVerifyOperationQueue];
      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([v6 isEncrypted])
  {
    uint64_t v15 = [(_HAPAccessoryServerBTLE200 *)v8 securitySession];
    if (![v15 isOpen])
    {
      uint64_t v16 = [(_HAPAccessoryServerBTLE200 *)v8 securitySession];
      if (![v16 isOpening])
      {
        __int16 v20 = [(_HAPAccessoryServerBTLE200 *)v8 pairSetupSession];
        char v21 = [v20 isSecureSession];

        if ((v21 & 1) == 0)
        {
          [(_HAPAccessoryServerBTLE200 *)v8 _suspendAllOperations];
          [(HAPAccessoryServer *)v8 setMetric_pairVerifyReason:@"noSession.request"];
          [(_HAPAccessoryServerBTLE200 *)v8 _establishSecureSession];
        }
        goto LABEL_12;
      }
    }
  }
LABEL_12:
  uint64_t v14 = [(_HAPAccessoryServerBTLE200 *)v8 requestOperationQueue];
LABEL_13:
  __int16 v17 = (void *)v14;
  if (v4)
  {
    uint64_t v18 = [v6 operation];
    [v18 setQueuePriority:4];
  }
  uint64_t v19 = [v6 operation];
  [v17 addOperation:v19];
}

- (void)_sendProtocolInfoServiceExchangeData:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] >= 2)
  {
    uint64_t v8 = objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);

    id v6 = (id)v8;
  }
  id v9 = (void *)MEMORY[0x1D944E080]();
  long long v10 = self;
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v12;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending Protocol Exchange for data: %@", buf, 0x16u);
  }
  int v13 = [(_HAPAccessoryServerBTLE200 *)v10 protocolInfoServiceSignatureCharacteristics];
  if (v13)
  {
    objc_initWeak(&location, v10);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78___HAPAccessoryServerBTLE200__sendProtocolInfoServiceExchangeData_completion___block_invoke;
    v27[3] = &unk_1E69F1AD0;
    objc_copyWeak(&v29, &location);
    id v14 = v7;
    id v28 = v14;
    uint64_t v15 = (void *)MEMORY[0x1D944E2D0](v27);
    uint64_t v16 = [[HAPBTLERequest alloc] initWithCharacteristic:v13 requestType:255 bodyData:v6 shouldEncrypt:1 timeoutInterval:10.0];
    if (v16)
    {
      [(_HAPAccessoryServerBTLE200 *)v10 _sendRequest:v16 shouldPrioritize:0 responseHandler:v15];
      [(_HAPAccessoryServerBTLE200 *)v10 _kickConnectionIdleTimer];
    }
    else
    {
      context = (void *)MEMORY[0x1D944E080]();
      int v22 = v10;
      HMFGetOSLogHandle();
      long long v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v24;
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create exchange request for characteristic, %@", buf, 0x16u);
      }
      id v25 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
      (*((void (**)(id, void *, void))v14 + 2))(v14, v25, 0);
    }
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v17 = (void *)MEMORY[0x1D944E080]();
    uint64_t v18 = v10;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed, missing the Service Signature Characteristic for Protocol Info Service", buf, 0xCu);
    }
    char v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:3 userInfo:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v21, 0);
  }
}

- (void)_handleResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(_HAPAccessoryServerBTLE200 *)self _pendingRequestForCharacteristic:v9];
  long long v12 = v11;
  if (v11)
  {
    if (v10)
    {
      int v13 = (void *)MEMORY[0x1D944E080]();
      id v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v106 = v16;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v12;
        __int16 v109 = 2112;
        uint64_t v110 = (uint64_t)v10;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response for request, %@, with error: %@", buf, 0x20u);
      }
      [v12 cancelWithError:v10];
      goto LABEL_64;
    }
    char v21 = [v11 responseTimer];
    [v21 suspend];

    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    id v22 = v8;
    if ([v12 isEncrypted])
    {
      id v104 = 0;
      uint64_t v23 = [(_HAPAccessoryServerBTLE200 *)self _decryptData:v22 error:&v104];
      id v24 = v104;

      if (!v23)
      {
        v54 = (void *)MEMORY[0x1D944E080]();
        v55 = self;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v106 = v57;
          __int16 v107 = 2112;
          uint64_t v108 = (uint64_t)v12;
          __int16 v109 = 2112;
          uint64_t v110 = (uint64_t)v24;
          _os_log_impl(&dword_1D4758000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt response to request %@ with error: %@", buf, 0x20u);
        }
        [v12 cancelWithError:v24];
        goto LABEL_63;
      }

      id v24 = (id)v23;
    }
    else
    {
      id v24 = v22;
    }
    id v25 = (void *)MEMORY[0x1D944E080]();
    uint64_t v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v106 = v28;
      __int16 v107 = 2112;
      uint64_t v108 = (uint64_t)v24;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Decrypted Response: %@", buf, 0x16u);
    }
    id v103 = 0;
    id v29 = +[HAPBTLEControlPacket packetWithSerializedData:v24 error:&v103];
    id v30 = v103;
    if (!v29)
    {
      id v41 = (void *)MEMORY[0x1D944E080]();
      __int16 v42 = v26;
      id v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v44 = v24;
        v46 = id v45 = v30;
        *(_DWORD *)buf = 138543618;
        v106 = v46;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v45;
        _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse control field with error: %@", buf, 0x16u);

        id v30 = v45;
        id v24 = v44;
        id v29 = 0;
      }

      [v12 cancelWithError:v30];
      goto LABEL_62;
    }
    id v101 = v24;
    if ([v29 type] == 1)
    {
      if (![v29 isContinuationPacket]) {
        goto LABEL_19;
      }
      [v12 identifier];
      v32 = id v31 = v30;
      __int16 v33 = [v29 transactionIdentifier];
      char v34 = [v32 isEqual:v33];

      id v30 = v31;
      if (v34)
      {
LABEL_19:
        id v100 = v30;
        if ([v29 isContinuationPacket])
        {
          uint64_t v35 = [(_HAPAccessoryServerBTLE200 *)v26 _pendingResponseForRequest:v12];
          context = (void *)MEMORY[0x1D944E080]();
          uint64_t v36 = v26;
          uint64_t v37 = HMFGetOSLogHandle();
          __int16 v38 = v37;
          if (!v35)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v87 = id v86 = v30;
              *(_DWORD *)buf = 138543618;
              v106 = v87;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v12;
              _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve the response for the continued request: %@", buf, 0x16u);

              id v30 = v86;
            }

            __int16 v40 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Request failed." reason:@"Failed to handle continued response." suggestion:0 underlyingError:0];
            [v12 cancelWithError:v40];
            id v24 = v101;
            goto LABEL_61;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v106 = v39;
            __int16 v107 = 2112;
            uint64_t v108 = v35;
            _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Received data for continued response: %@", buf, 0x16u);
          }
          __int16 v40 = (HAPBTLEResponse *)v35;
        }
        else
        {
          __int16 v40 = [[HAPBTLEResponse alloc] initWithRequest:v12];
          v58 = [(_HAPAccessoryServerBTLE200 *)v26 pendingResponses];
          [v58 addObject:v40];

          v59 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:4.0];
          [v59 setDelegate:v26];
          v60 = [(HAPAccessoryServer *)v26 clientQueue];
          [v59 setDelegateQueue:v60];

          [v12 setResponseTimer:v59];
        }
        v61 = [v29 payload];
        id v102 = 0;
        uint64_t v62 = [(HAPBTLEResponse *)v40 appendData:v61 error:&v102];
        id contexta = v102;

        if (!v62)
        {
          v98 = v40;
          v76 = (void *)MEMORY[0x1D944E080]();
          v77 = v26;
          v78 = HMFGetOSLogHandle();
          id v24 = v101;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v79 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v106 = v79;
            __int16 v107 = 2112;
            uint64_t v108 = (uint64_t)v98;
            _os_log_impl(&dword_1D4758000, v78, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize the response data for response: %@", buf, 0x16u);
          }
          v63 = contexta;
          v80 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15 description:@"Failed to deserialize response." reason:0 suggestion:0 underlyingError:contexta];
          [v12 cancelWithError:v80];

          __int16 v40 = v98;
          id v30 = v100;
          goto LABEL_60;
        }
        id v24 = v101;
        if ([(HAPBTLEResponse *)v40 isComplete])
        {
          id v30 = v100;
          if ([(HAPBTLEResponse *)v40 isValid])
          {
            v63 = contexta;
            if ([v12 isFinished])
            {
LABEL_60:

LABEL_61:
              goto LABEL_62;
            }
            v96 = v40;
            v64 = (void *)MEMORY[0x1D944E080]();
            v65 = v26;
            v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v68 = v67 = v64;
              *(_DWORD *)buf = 138543618;
              v106 = v68;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v96;
              _os_log_impl(&dword_1D4758000, v66, OS_LOG_TYPE_INFO, "%{public}@Handling completed response: %@", buf, 0x16u);

              v64 = v67;
            }

            if ([v12 type] == 4) {
              [(_HAPAccessoryServerBTLE200 *)v65 _suspendAllOperations];
            }
            v69 = [v12 operation];
            [v69 finish];

            id v30 = v100;
            id v24 = v101;
            __int16 v40 = v96;
          }
          else
          {
            v88 = (void *)MEMORY[0x1D944E080]();
            v89 = v26;
            v90 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            {
              v91 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v106 = v91;
              __int16 v107 = 2112;
              uint64_t v108 = (uint64_t)v40;
              __int16 v109 = 2112;
              uint64_t v110 = (uint64_t)v12;
              _os_log_impl(&dword_1D4758000, v90, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response, %@, to request: %@", buf, 0x20u);
            }
            v92 = [MEMORY[0x1E4F28C58] hapErrorWithCode:15 description:@"Invalid response." reason:@"The response could not be validated against the request." suggestion:0 underlyingError:0];
            [v12 cancelWithError:v92];

            id v30 = v100;
            id v24 = v101;
          }
        }
        else
        {
          v81 = v40;
          v82 = (void *)MEMORY[0x1D944E080]();
          v83 = v26;
          v84 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v85 = v99 = v82;
            *(_DWORD *)buf = 138543618;
            v106 = v85;
            __int16 v107 = 2112;
            uint64_t v108 = (uint64_t)v81;
            _os_log_impl(&dword_1D4758000, v84, OS_LOG_TYPE_DEBUG, "%{public}@Requesting additional data for response: %@", buf, 0x16u);

            v82 = v99;
          }

          [(_HAPAccessoryServerBTLE200 *)v83 _requestResponseForRequest:v12];
          id v30 = v100;
          __int16 v40 = v81;
        }
        v63 = contexta;
        goto LABEL_60;
      }
      v70 = (void *)MEMORY[0x1D944E080]();
      v71 = v26;
      v72 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        contextb = HMFGetLogIdentifier();
        [v29 transactionIdentifier];
        v73 = v97 = v70;
        uint64_t v74 = [v12 identifier];
        *(_DWORD *)buf = 138543874;
        v106 = contextb;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v73;
        __int16 v109 = 2112;
        uint64_t v110 = v74;
        v75 = (void *)v74;
        _os_log_impl(&dword_1D4758000, v72, OS_LOG_TYPE_ERROR, "%{public}@The continuation response payload transaction identifier, %@, does not match the request's transaction identifier, %@.", buf, 0x20u);

        id v30 = v31;
        v70 = v97;
      }
      [v12 cancelWithError:0];
    }
    else
    {
      id v47 = v30;
      uint64_t v48 = (void *)MEMORY[0x1D944E080]();
      uint64_t v49 = v26;
      v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = HMFGetLogIdentifier();
        int v52 = [v29 type];
        *(_DWORD *)buf = 138543618;
        v106 = v51;
        __int16 v107 = 1024;
        LODWORD(v108) = v52;
        _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_ERROR, "%{public}@Invalid response type control type: %u", buf, 0x12u);
      }
      v53 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Request failed." reason:@"Invalid response control type." suggestion:0 underlyingError:0];
      [v12 cancelWithError:v53];

      id v30 = v47;
    }
    id v24 = v101;
LABEL_62:

LABEL_63:
    goto LABEL_64;
  }
  __int16 v17 = (void *)MEMORY[0x1D944E080]();
  uint64_t v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v106 = v20;
    __int16 v107 = 2112;
    uint64_t v108 = (uint64_t)v9;
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected response from characteristic, %@, dropping", buf, 0x16u);
  }
LABEL_64:
}

- (void)_requestResponseForRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 characteristic];
  id v6 = [v5 cbCharacteristic];

  if (v6)
  {
    id v7 = [v4 responseTimer];
    [v7 resume];

    id v8 = [(HAPAccessoryServerBTLE *)self peripheral];
    [v8 readValueForCharacteristic:v6];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for request: %@", (uint8_t *)&v13, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Missing mapped characteristic" reason:0 suggestion:0 underlyingError:0];
    [v4 cancelWithError:v8];
  }
}

- (void)_handleWriteCompletionForCharacteristic:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
    [v10 removeObjectForKey:v6];

    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    ((void (**)(void, id))v9)[2](v9, v7);
  }
  else
  {
    long long v11 = (void *)MEMORY[0x1D944E080]();
    long long v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected write completion from characteristic, %@, dropping", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_sendData:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
  long long v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    uint64_t v18 = [v9 cbCharacteristic];
    if (v18)
    {
      __int16 v17 = (void *)v18;
      uint64_t v19 = [(_HAPAccessoryServerBTLE200 *)self characteristicWriteCompletionHandlers];
      __int16 v20 = (void *)[v10 copy];
      char v21 = (void *)MEMORY[0x1D944E2D0]();
      [v19 setObject:v21 forKey:v9];

      id v22 = [(HAPAccessoryServerBTLE *)self peripheral];
      [v22 writeValue:v8 forCharacteristic:v17 type:0];

      [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1D944E080]();
      id v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        int v28 = 138543618;
        id v29 = v26;
        __int16 v30 = 2112;
        id v31 = v9;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v28, 0x16u);
      }
      if (v10)
      {
        id v27 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Missing mapped characteristic" reason:0 suggestion:0 underlyingError:0];
        (*((void (**)(id, void *))v10 + 2))(v10, v27);
      }
      __int16 v17 = 0;
    }
    goto LABEL_13;
  }
  int v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = self;
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    int v28 = 138543618;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@A write operation for '%@' is already is progress.", (uint8_t *)&v28, 0x16u);
  }
  if (v10)
  {
    __int16 v17 = [MEMORY[0x1E4F28C58] hapErrorWithCode:4 description:@"Operation in progress." reason:@"A write operation is already in progress." suggestion:0 underlyingError:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
LABEL_13:
  }
}

- (void)_sendControlPacket:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  long long v11 = [v8 serialize];
  if (![v9 isEncrypted])
  {
    id v13 = 0;
    goto LABEL_5;
  }
  id v28 = 0;
  uint64_t v12 = [(_HAPAccessoryServerBTLE200 *)self _encryptDataAndGenerateAuthTag:v11 error:&v28];
  id v13 = v28;

  if (v12)
  {
    long long v11 = (void *)v12;
LABEL_5:
    id v14 = (void *)MEMORY[0x1D944E080]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v11 length];
      *(_DWORD *)buf = 138543874;
      __int16 v30 = v17;
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Sending %tu bytes of control payload for request: %@", buf, 0x20u);
    }
    uint64_t v19 = (void *)MEMORY[0x1D944E080]();
    __int16 v20 = v15;
    char v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v30 = v22;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v9;
      __int16 v33 = 2112;
      id v34 = v11;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Sending control payload for request, %@, to accessory: %@", buf, 0x20u);
    }
    uint64_t v23 = [v9 characteristic];
    [(_HAPAccessoryServerBTLE200 *)v20 _sendData:v11 toCharacteristic:v23 completionHandler:v10];

    goto LABEL_10;
  }
  id v24 = (void *)MEMORY[0x1D944E080]();
  id v25 = self;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v30 = v27;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v13;
    _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt control payload with error: %@", buf, 0x16u);
  }
  if (v10) {
    v10[2](v10, v13);
  }
LABEL_10:
}

- (unint64_t)_maximumControlWriteLengthForRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServerBTLE *)self peripheral];
  unint64_t v6 = [v5 maximumWriteValueLengthForType:0];

  id v7 = [(HAPAccessoryServerBTLE *)self peripheral];
  unint64_t v8 = [v7 maximumWriteValueLengthForType:1];

  if (!v6)
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v28 = 138543362;
      id v29 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the maximum write length to 512", (uint8_t *)&v28, 0xCu);
    }
    unint64_t v6 = 512;
    if (!v8) {
      goto LABEL_8;
    }
LABEL_7:
    if (v8 != -3) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:
  id v13 = (void *)MEMORY[0x1D944E080]();
  id v14 = self;
  int v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = HMFGetLogIdentifier();
    int v28 = 138543362;
    id v29 = v16;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the peripheral's mtu length to 23", (uint8_t *)&v28, 0xCu);
  }
  unint64_t v8 = 23;
LABEL_11:
  int v17 = [v4 isEncrypted];
  unint64_t v18 = 17;
  if (!v17) {
    unint64_t v18 = 1;
  }
  if (v8 / v18 >= 4)
  {
    uint64_t v19 = (void *)MEMORY[0x1D944E080]();
    __int16 v20 = self;
    char v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = HMFGetLogIdentifier();
      int v28 = 138543618;
      id v29 = v22;
      __int16 v30 = 2048;
      unint64_t v31 = v8;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Electing to write as reduced size payload of length %tu", (uint8_t *)&v28, 0x16u);
    }
    unint64_t v6 = v8;
  }
  if ([v4 isEncrypted])
  {
    if (v6 > 0xF)
    {
      v6 -= 16;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1D944E080]();
      id v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        int v28 = 138543874;
        id v29 = v26;
        __int16 v30 = 2048;
        unint64_t v31 = v6;
        __int16 v32 = 1024;
        int v33 = 16;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@The maximum write length, %tu, is less than the auth tag length, %d", (uint8_t *)&v28, 0x1Cu);
      }
      unint64_t v6 = 0;
    }
  }

  return v6;
}

- (void)_reallySendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67___HAPAccessoryServerBTLE200__reallySendRequest_completionHandler___block_invoke;
  block[3] = &unk_1E69F4070;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_sendRequest:(id)a3 shouldPrioritize:(BOOL)a4 responseHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F65400]);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke;
  v22[3] = &unk_1E69F1A30;
  objc_copyWeak(&v24, &from);
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  objc_copyWeak(&v25, &location);
  [v10 addExecutionBlock:v22];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __76___HAPAccessoryServerBTLE200__sendRequest_shouldPrioritize_responseHandler___block_invoke_3;
  int v17 = &unk_1E69F1AA8;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  id v12 = v11;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  [v10 setCompletionBlock:&v14];
  objc_msgSend(v12, "setOperation:", v10, v14, v15, v16, v17);
  [(_HAPAccessoryServerBTLE200 *)self _enqueueRequest:v12 shouldPrioritize:v6];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (id)_pendingResponseForRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(_HAPAccessoryServerBTLE200 *)self pendingResponses];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 request];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pendingRequestForCharacteristic:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 characteristic];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (HAPCharacteristic)identifyCharacteristic
{
  p_identifyCharacteristic = &self->_identifyCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identifyCharacteristic);

  if (!WeakRetained)
  {
    uint64_t v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"0000003E-0000-1000-8000-0026BB765291"];
    uint64_t v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"00000014-0000-1000-8000-0026BB765291"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_identifyCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_identifyCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___HAPAccessoryServerBTLE200_identifyWithCompletion___block_invoke;
  v6[3] = &unk_1E69F1608;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(_HAPAccessoryServerBTLE200 *)self _discoverWithType:1 completionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (unint64_t)_getPairSetupType
{
  unint64_t result = [(HAPAccessoryServer *)self authMethod];
  if (result != 1)
  {
    if ([(HAPAccessoryServer *)self authMethod] == 2)
    {
      if ([(_HAPAccessoryServerBTLE200 *)self authenticated]) {
        return 4;
      }
      else {
        return 3;
      }
    }
    else if ([(HAPAccessoryServer *)self authMethod] == 4)
    {
      return 5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_sendPairingRequestData:(id)a3 completionHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self pairingsCharacteristic];
  if (v8)
  {
    objc_initWeak(location, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __72___HAPAccessoryServerBTLE200__sendPairingRequestData_completionHandler___block_invoke;
    uint64_t v18 = &unk_1E69F3D08;
    objc_copyWeak(&v20, location);
    id v19 = v7;
    id v9 = (void *)MEMORY[0x1D944E2D0](&v15);
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v6, v8, 0, 0, 7, v9, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D944E080]();
    char v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v13;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Pairing operation failed, missing the Pairings characteristic", (uint8_t *)location, 0xCu);
    }
    if (v7)
    {
      long long v14 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Pairing operation failed." reason:@"Missing Pairings characteristic." suggestion:0 underlyingError:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
    }
  }
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80___HAPAccessoryServerBTLE200_listPairingsWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E69F4070;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4 serverPairingCompletion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v29 = 0;
  char v11 = [(HAPAccessoryServer *)self getControllerPairingIdentityWithError:&v29];
  id v12 = v29;
  id v13 = (void *)MEMORY[0x1D944E080]();
  long long v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  uint64_t v16 = v15;
  if (v11)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unint64_t v31 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Received request to remove pairing for the current controller", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v14);
    uint64_t v18 = [(HAPAccessoryServer *)v14 clientQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke_734;
    v21[3] = &unk_1E69F1990;
    objc_copyWeak(&v25, (id *)buf);
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    [(_HAPAccessoryServerBTLE200 *)v14 removePairing:v11 completionQueue:v18 completionHandler:v21];

    [(_HAPAccessoryServerBTLE200 *)v14 setHasValidCache:0];
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v31 = v19;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Remove current pairing failed, failed to get the current controller with error: %@", buf, 0x16u);
    }
    if (v8 && v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106___HAPAccessoryServerBTLE200_removePairingForCurrentControllerOnQueue_completion_serverPairingCompletion___block_invoke;
      block[3] = &unk_1E69F3C68;
      id v28 = v9;
      id v27 = v12;
      dispatch_async(v8, block);
    }
  }

  return v11 != 0;
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  return [(_HAPAccessoryServerBTLE200 *)self removePairingForCurrentControllerOnQueue:a3 completion:a4 serverPairingCompletion:0];
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78___HAPAccessoryServerBTLE200_removePairing_completionQueue_completionHandler___block_invoke;
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

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75___HAPAccessoryServerBTLE200_addPairing_completionQueue_completionHandler___block_invoke;
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

- (HAPCharacteristic)pairingsCharacteristic
{
  p_pairingsCharacteristic = &self->_pairingsCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingsCharacteristic);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000055-0000-1000-8000-0026BB765291"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"00000050-0000-1000-8000-0026BB765291"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairingsCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairingsCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (HAPCharacteristic)pairSetupCharacteristic
{
  p_pairSetupCharacteristic = &self->_pairSetupCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairSetupCharacteristic);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000055-0000-1000-8000-0026BB765291"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"0000004C-0000-1000-8000-0026BB765291"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairSetupCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairSetupCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (HAPCharacteristic)pairingFeaturesCharacteristic
{
  p_pairingFeaturesCharacteristic = &self->_pairingFeaturesCharacteristic;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingFeaturesCharacteristic);

  if (!WeakRetained)
  {
    id v5 = [(HAPAccessoryServer *)self primaryAccessory];
    id v6 = [v5 servicesOfType:@"00000055-0000-1000-8000-0026BB765291"];
    id v7 = [v6 firstObject];

    id v8 = [v7 characteristicsOfType:@"0000004F-0000-1000-8000-0026BB765291"];
    id v9 = [v8 firstObject];
    objc_storeWeak((id *)p_pairingFeaturesCharacteristic, v9);
  }
  id v10 = objc_loadWeakRetained((id *)p_pairingFeaturesCharacteristic);

  return (HAPCharacteristic *)v10;
}

- (void)_pairingCompletedWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Pair Setup completed with error: %@", buf, 0x16u);
  }
  if (v4)
  {
    [(_HAPAccessoryServerBTLE200 *)v6 setPairing:0];
    [(_HAPAccessoryServerBTLE200 *)v6 setPairingDisconnectionError:0];
    [(_HAPAccessoryServerBTLE200 *)v6 setBadPairSetupCode:0];
    [(_HAPAccessoryServerBTLE200 *)v6 setPairSetupBackoffTimeInterval:0.0];
    [(_HAPAccessoryServerBTLE200 *)v6 setPairSetupSession:0];
    [(_HAPAccessoryServerBTLE200 *)v6 _disconnectWithDisconnectionError:v4 completionHandler:0];
  }
  uint64_t v9 = [(_HAPAccessoryServerBTLE200 *)v6 _getPairSetupType];
  if (v9 == 5)
  {
    if ([(_HAPAccessoryServerBTLE200 *)v6 _delegateRespondsToSelector:sel_accessoryServer_validateCert_model_])
    {
      id v17 = [(_HAPAccessoryServerBTLE200 *)v6 pairSetupSession];
      id v18 = [v17 getCertificate];

      id v19 = [(HAPAccessoryServer *)v6 delegateQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke_3;
      v21[3] = &unk_1E69F46E0;
      void v21[4] = v6;
      id v22 = v18;
      id v20 = v18;
      dispatch_async(v19, v21);
    }
  }
  else if (v9 == 3)
  {
    id v10 = [(_HAPAccessoryServerBTLE200 *)v6 pairSetupSession];
    [v10 generateSessionKeys];

    char v11 = [HAPAuthSession alloc];
    id v12 = [(_HAPAccessoryServerBTLE200 *)v6 protocolInfoServiceSignatureCharacteristics];
    id v13 = [v12 instanceID];
    id v14 = [(HAPAuthSession *)v11 initWithRole:0 instanceId:v13 delegate:v6];
    [(_HAPAccessoryServerBTLE200 *)v6 setAuthSession:v14];

    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57___HAPAccessoryServerBTLE200__pairingCompletedWithError___block_invoke;
    v23[3] = &unk_1E69F4128;
    id v24 = v15;
    id v25 = v6;
    id v16 = v15;
    [(_HAPAccessoryServerBTLE200 *)v6 getAccessoryInfo:v23];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)v6 setPairing:0];
    [(_HAPAccessoryServerBTLE200 *)v6 setBadPairSetupCode:0];
    [(_HAPAccessoryServerBTLE200 *)v6 setPairSetupBackoffTimeInterval:0.0];
    [(_HAPAccessoryServerBTLE200 *)v6 setPairSetupSession:0];
    [(HAPAccessoryServer *)v6 setPairingRequest:0];
    [(_HAPAccessoryServerBTLE200 *)v6 _notifyDelegatesPairingStopped:v4];
  }
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [(HAPAccessoryServer *)self clientQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84___HAPAccessoryServerBTLE200_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  void v10[3] = &unk_1E69F46E0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(v7, v10);

  return 0;
}

- (void)_handlePairingSetupCodeRequestWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isBadSetupCode]
    && [(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServer_didReceiveBadPasswordThrottleAttemptsWithDelay_])
  {
    [(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer];
    [(_HAPAccessoryServerBTLE200 *)self setSetupCodeCompletionHandler:v4];
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    id v6 = v5;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E69F4330;
    void v13[4] = self;
    id v7 = v13;
LABEL_6:
    dispatch_async(v5, v7);
    goto LABEL_10;
  }
  if ([(_HAPAccessoryServerBTLE200 *)self _delegateRespondsToSelector:sel_accessoryServer_promptUserForPasswordWithType_])
  {
    [(_HAPAccessoryServerBTLE200 *)self _suspendConnectionIdleTimer];
    [(_HAPAccessoryServerBTLE200 *)self setSetupCodeCompletionHandler:v4];
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    id v6 = v5;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82___HAPAccessoryServerBTLE200__handlePairingSetupCodeRequestWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E69F4330;
    void v12[4] = self;
    id v7 = v12;
    goto LABEL_6;
  }
  id v8 = (void *)MEMORY[0x1D944E080]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@The delegate does not support prompting the user for a passcode", buf, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Pairing Failed." reason:@"The delegate is missing." suggestion:0 underlyingError:0];
  v4[2](v4, 0, v6);
  [(_HAPAccessoryServerBTLE200 *)v9 setSetupCodeCompletionHandler:0];
LABEL_10:
}

- (void)_handlePairSetupSessionExchangeData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke;
  v17[3] = &unk_1E69F4128;
  id v5 = v4;
  id v18 = v5;
  id v19 = self;
  id v6 = (void (**)(void, void))MEMORY[0x1D944E2D0](v17);
  id v7 = [(_HAPAccessoryServerBTLE200 *)self pairSetupCharacteristic];
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66___HAPAccessoryServerBTLE200__handlePairSetupSessionExchangeData___block_invoke_679;
    v14[3] = &unk_1E69F3E48;
    v14[4] = self;
    uint64_t v16 = v6;
    id v15 = v7;
    [(_HAPAccessoryServerBTLE200 *)self _writeValue:v5 toCharacteristic:v15 authorizationData:0 contextData:0 options:26 completionHandler:v14];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pair Setup characteristic", buf, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7 description:@"Pairing Failed." reason:@"Missing Pair Setup characteristic." suggestion:0 underlyingError:0];
    ((void (**)(void, void *))v6)[2](v6, v12);
    id v13 = [(_HAPAccessoryServerBTLE200 *)v9 pairSetupSession];
    [v13 receivedSetupExchangeData:0 error:v12];
  }
}

- (BOOL)stopPairingWithError:(id *)a3
{
  id v4 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___HAPAccessoryServerBTLE200_stopPairingWithError___block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)continuePairingAfterAuthPrompt
{
  char v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___HAPAccessoryServerBTLE200_continuePairingAfterAuthPrompt__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)_parsePairingFeaturesCharacteristic:(id)a3 authMethod:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    -[_HAPAccessoryServerBTLE200 setFeatureFlags:](self, "setFeatureFlags:", [v9 unsignedCharValue]);
    int v11 = [(_HAPAccessoryServerBTLE200 *)self featureFlags];
    uint64_t v12 = 2;
    uint64_t v13 = 4;
    uint64_t v14 = 5;
    if ((v11 & 0x10) != 0) {
      uint64_t v14 = 6;
    }
    if ((v11 & 8) == 0) {
      uint64_t v13 = v14;
    }
    if ((v11 & 2) == 0) {
      uint64_t v12 = v13;
    }
    if (v11) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v12;
    }
    if (v11) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    [(HAPAccessoryServer *)self setAuthMethod:v16];
    if ([(HAPAccessoryServer *)self authMethod] == 6) {
      [(HAPAccessoryServer *)self setAuthMethod:4];
    }
    if (a4) {
      *a4 = [(HAPAccessoryServer *)self authMethod];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v22 = 138543362;
      id v23 = v20;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, the Pairing Features characteristic value is invalid", (uint8_t *)&v22, 0xCu);
    }
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Pairing Failed." reason:@"The Pairing Features characteristic value is missing" suggestion:0 underlyingError:0];
    }
  }

  return isKindOfClass & 1;
}

- (void)_getPairingFeaturesWithCompletionHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E69F1968;
  void v21[4] = self;
  id v5 = v4;
  id v22 = v5;
  id v6 = (void (**)(void, void, void))MEMORY[0x1D944E2D0](v21);
  id v7 = [(_HAPAccessoryServerBTLE200 *)self pairingFeaturesCharacteristic];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 value];

    if (!v9)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71___HAPAccessoryServerBTLE200__getPairingFeaturesWithCompletionHandler___block_invoke_653;
      v18[3] = &unk_1E69F3E48;
      void v18[4] = self;
      id v20 = v6;
      id v15 = v8;
      id v19 = v15;
      uint64_t v16 = (void *)MEMORY[0x1D944E2D0](v18);
      [(_HAPAccessoryServerBTLE200 *)self _readValueForCharacteristic:v15 options:2 completionHandler:v16];

      goto LABEL_9;
    }
    *(void *)buf = 0;
    id v17 = 0;
    [(_HAPAccessoryServerBTLE200 *)self _parsePairingFeaturesCharacteristic:v8 authMethod:buf error:&v17];
    id v10 = v17;
    ((void (**)(void, void, id))v6)[2](v6, *(void *)buf, v10);
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D944E080]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pairing Features characteristic", buf, 0xCu);
    }
    id v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:7 description:@"Pairing Failed." reason:@"Missing Pairing Features characteristic." suggestion:0 underlyingError:0];
    ((void (**)(void, void, id))v6)[2](v6, 0, v10);
  }

LABEL_9:
}

- (void)_checkForAuthPrompt:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___HAPAccessoryServerBTLE200__checkForAuthPrompt___block_invoke;
  v3[3] = &unk_1E69F1940;
  v3[4] = self;
  BOOL v4 = a3;
  [(_HAPAccessoryServerBTLE200 *)self _discoverWithType:2 completionHandler:v3];
}

- (void)startPairingWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F653F0] currentActivity];
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___HAPAccessoryServerBTLE200_startPairingWithRequest___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)_enableBroadcastEvent:(BOOL)a3 interval:(unint64_t)a4 forCharacteristic:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 service];
  uint64_t v13 = [v12 accessory];
  uint64_t v14 = [v13 server];

  if (v14 == self)
  {
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __97___HAPAccessoryServerBTLE200__enableBroadcastEvent_interval_forCharacteristic_completionHandler___block_invoke;
    v30[3] = &unk_1E69F18F0;
    objc_copyWeak(&v33, &location);
    id v19 = v10;
    id v31 = v19;
    id v20 = v11;
    id v32 = v20;
    id v21 = (void *)MEMORY[0x1D944E2D0](v30);
    id v29 = 0;
    id v22 = [(id)objc_opt_class() configurationRequestForCharacteristic:v19 isBroadcasted:v8 interval:a4 error:&v29];
    id v23 = v29;
    if (v22)
    {
      [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v22 shouldPrioritize:0 responseHandler:v21];
    }
    else
    {
      context = (void *)MEMORY[0x1D944E080]();
      uint64_t v24 = self;
      HMFGetOSLogHandle();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v36 = v26;
        __int16 v37 = 2112;
        id v38 = v19;
        __int16 v39 = 2112;
        id v40 = v23;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for characteristic, %@, with error: %@", buf, 0x20u);
      }
      id v27 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
      _callCharacteristicOperationCompletion(v19, v20, 3, v27, @"Failed to create configuration request.");
    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v18;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Configure characteristic failed, characteristic is not part of server: %@", buf, 0x16u);
    }
    _callCharacteristicOperationCompletion(v10, v11, 3, 0, @"Characteristic is not part of server.");
  }
}

- (void)_configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v29 = a4;
  id v28 = a5;
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v9 = dispatch_group_create();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v14 = [v13 characteristic];
        char v15 = [v14 properties];

        if ((v15 & 8) != 0)
        {
          dispatch_group_enter(v9);
          uint64_t v21 = [v13 broadcastEnable];
          uint64_t v22 = [v13 broadcastInterval];
          id v23 = [v13 characteristic];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke;
          v37[3] = &unk_1E69F3D30;
          v37[4] = self;
          id v38 = v30;
          __int16 v39 = v9;
          [(_HAPAccessoryServerBTLE200 *)self _enableBroadcastEvent:v21 interval:v22 forCharacteristic:v23 completionHandler:v37];
        }
        else
        {
          uint64_t v16 = (void *)MEMORY[0x1D944E080]();
          id v17 = self;
          id v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v19 = HMFGetLogIdentifier();
            id v20 = [v13 characteristic];
            *(_DWORD *)buf = 138543618;
            id v45 = v19;
            __int16 v46 = 2112;
            id v47 = v20;
            _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic %@ does not support broadcast notification", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v10);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v24 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___HAPAccessoryServerBTLE200__configureCharacteristics_queue_withCompletionHandler___block_invoke_605;
  block[3] = &unk_1E69F4298;
  objc_copyWeak(&v36, (id *)buf);
  id v33 = v29;
  id v34 = v30;
  id v35 = v28;
  id v25 = v30;
  id v26 = v28;
  id v27 = v29;
  dispatch_group_notify(v9, v24, block);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83___HAPAccessoryServerBTLE200_configureCharacteristics_queue_withCompletionHandler___block_invoke;
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

- (void)_configureBroadcastKeyGeneration:(unsigned __int8)a3 service:(id)a4 withCompletion:(id)a5
{
  int v6 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86___HAPAccessoryServerBTLE200__configureBroadcastKeyGeneration_service_withCompletion___block_invoke;
  v25[3] = &unk_1E69F18C8;
  v25[4] = self;
  char v29 = v6;
  objc_copyWeak(&v28, &location);
  id v10 = v9;
  id v27 = v10;
  id v11 = v8;
  id v26 = v11;
  id v12 = (void *)MEMORY[0x1D944E2D0](v25);
  id v13 = objc_opt_class();
  id v24 = 0;
  if (v6 == 2) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  char v15 = [v13 configurationRequestForService:v11 configRequestType:v14 error:&v24];
  id v16 = v24;
  if (v15)
  {
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v15 shouldPrioritize:0 responseHandler:v12];
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = self;
    HMFGetOSLogHandle();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v32 = v20;
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v16;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for service, %@, with error: %@", buf, 0x20u);
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = [NSString stringWithFormat:@"Failed to configure service %@.", v11];
    id v23 = [v21 hapErrorWithCode:1 description:v22 reason:@"Failed to create request." suggestion:0 underlyingError:v16];

    (*((void (**)(id, void, void, void, void *, double))v10 + 2))(v10, 0, 0, 0, v23, 0.0);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_handleEventIndicationForCharacteristic:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 properties])
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    int v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Reading value on Indication for characteristic %@", buf, 0x16u);
    }
    [(_HAPAccessoryServerBTLE200 *)v6 markNotifyingCharacteristicUpdatedforCharacteristic:v4];
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
    id v10 = [(HAPAccessoryServer *)v6 clientQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70___HAPAccessoryServerBTLE200__handleEventIndicationForCharacteristic___block_invoke;
    v11[3] = &unk_1E69F31C0;
    void v11[4] = v6;
    [(_HAPAccessoryServerBTLE200 *)v6 _readCharacteristicValues:v9 queue:v10 completionHandler:v11];
  }
}

- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self characteristicEnableEventCompletionHandlers];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = [(_HAPAccessoryServerBTLE200 *)self characteristicEnableEventCompletionHandlers];
    [v10 removeObjectForKey:v6];

    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    ((void (**)(void, id))v9)[2](v9, v7);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D944E080]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Received unexpected notification updated completion from characteristic, %@, dropping", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_enableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 cbCharacteristic];
  if (v10)
  {
    id v11 = [(_HAPAccessoryServerBTLE200 *)self characteristicEnableEventCompletionHandlers];
    id v12 = (void *)[v9 copy];
    id v13 = (void *)MEMORY[0x1D944E2D0]();
    [v11 setObject:v13 forKey:v8];

    __int16 v14 = [(HAPAccessoryServerBTLE *)self peripheral];
    [v14 setNotifyValue:v6 forCharacteristic:v10];
LABEL_7:

    goto LABEL_8;
  }
  int v15 = (void *)MEMORY[0x1D944E080]();
  uint64_t v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v18 = HMFGetLogIdentifier();
    int v19 = 138543618;
    id v20 = v18;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v19, 0x16u);
  }
  if (v9)
  {
    __int16 v14 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Missing mapped characteristic" reason:0 suggestion:0 underlyingError:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_performEnableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __85___HAPAccessoryServerBTLE200__performEnableEvent_toCharacteristic_completionHandler___block_invoke;
  id v18 = &unk_1E69F3E20;
  id v19 = v8;
  id v20 = v9;
  id v10 = v8;
  id v11 = v9;
  [(_HAPAccessoryServerBTLE200 *)self _enableEvent:v6 toCharacteristic:v10 completionHandler:&v15];
  id v12 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
  if ([v12 isOpen])
  {
  }
  else
  {
    id v13 = [(_HAPAccessoryServerBTLE200 *)self securitySession];
    char v14 = [v13 isOpening];

    if ((v14 & 1) == 0)
    {
      [(_HAPAccessoryServerBTLE200 *)self _suspendAllOperations];
      [(HAPAccessoryServer *)self setMetric_pairVerifyReason:@"noSession.event"];
      [(_HAPAccessoryServerBTLE200 *)self _establishSecureSession];
    }
  }
}

- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v8 = a3;
  v55[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 cbCharacteristic];
  char v14 = (void *)MEMORY[0x1D944E080]();
  uint64_t v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    __int16 v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v51 = v17;
    __int16 v52 = 1024;
    *(_DWORD *)v53 = v8;
    *(_WORD *)&v53[4] = 2112;
    *(void *)&v53[6] = v10;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Enable Events :%d for Characteristics: %@", buf, 0x1Cu);
  }
  if (!v13)
  {
    id v28 = (void *)MEMORY[0x1D944E080]();
    char v29 = v15;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v31;
      __int16 v52 = 2114;
      *(void *)v53 = v10;
      _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Error while attempting to enable Events on HAP characteristic %{public}@: it does not have a corresponding BTLE characteristic", buf, 0x16u);
    }
    v54[0] = *MEMORY[0x1E4F28568];
    id v32 = [NSString stringWithFormat:@"Failed to enable events for characteristic %@", v10];
    v55[0] = v32;
    v54[1] = *MEMORY[0x1E4F28588];
    __int16 v33 = [MEMORY[0x1E4F28B50] mainBundle];
    id v34 = [v33 localizedStringForKey:@"Unable to find matching BTLE characteristic" value:&stru_1F2C4E778 table:0];
    v55[1] = v34;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];

    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6727 userInfo:v25];
    if (!v11 || !v12) {
      goto LABEL_16;
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke;
    v44[3] = &unk_1E69F4070;
    id v47 = v11;
    id v45 = v10;
    id v46 = v26;
    dispatch_async(v12, v44);

    id v27 = v47;
    goto LABEL_15;
  }
  if (([v13 properties] & 0x20) != 0)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2;
    v36[3] = &unk_1E69F3E70;
    BOOL v39 = v8;
    v36[4] = v15;
    id v38 = v11;
    uint64_t v37 = v12;
    __int16 v35 = (void *)MEMORY[0x1D944E2D0](v36);
    [(_HAPAccessoryServerBTLE200 *)v15 _performEnableEvent:v8 toCharacteristic:v10 completionHandler:v35];

    goto LABEL_18;
  }
  id v18 = (void *)MEMORY[0x1D944E080]();
  id v19 = v15;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v51 = v21;
    __int16 v52 = 2114;
    *(void *)v53 = v10;
    *(_WORD *)&v53[8] = 2114;
    *(void *)&v53[10] = v13;
    _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error while attempting to enable Events on HAP characteristic %{public}@: Corresponding BTLE Characteristics %{public}@: does not support it", buf, 0x20u);
  }
  v48[0] = *MEMORY[0x1E4F28568];
  id v22 = [NSString stringWithFormat:@"Failed to enable events for characteristic %@", v10];
  v49[0] = v22;
  v48[1] = *MEMORY[0x1E4F28588];
  uint64_t v23 = [MEMORY[0x1E4F28B50] mainBundle];
  id v24 = [v23 localizedStringForKey:@"BTLE characteristic does not support indication" value:&stru_1F2C4E778 table:0];
  v49[1] = v24;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

  id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6735 userInfo:v25];
  if (v11 && v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89___HAPAccessoryServerBTLE200__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_567;
    block[3] = &unk_1E69F4070;
    id v43 = v11;
    id v41 = v10;
    id v42 = v26;
    dispatch_async(v12, block);

    id v27 = v43;
LABEL_15:
  }
LABEL_16:

LABEL_18:
}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  unsigned int v71 = a3;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v61 = a4;
  id v62 = a5;
  v66 = a6;
  BOOL v9 = [(_HAPAccessoryServerBTLE200 *)self connectionState] == 2;
  id v10 = (void *)MEMORY[0x1D944E080]();
  v70 = self;
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      if (v71) {
        char v14 = @"Enabling";
      }
      else {
        char v14 = @"Disabling";
      }
      uint64_t v15 = [v61 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v119 = v15;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@%@ events for characteristics: %@", buf, 0x20u);
    }
    id v63 = [MEMORY[0x1E4F1CA48] array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v16 = v61;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v98 objects:v122 count:16];
    if (v17)
    {
      id obj = 0;
      uint64_t v18 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v99 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          if ([v20 eventNotificationsEnabled] == v71)
          {
            __int16 v21 = (void *)MEMORY[0x1D944E080]();
            id v22 = v70;
            uint64_t v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              id v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v24;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v20;
              _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Events already enabled for %@", buf, 0x16u);
            }
            ++obj;
          }
          else if ([v20 properties])
          {
            [v63 addObject:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v98 objects:v122 count:16];
      }
      while (v17);
    }
    else
    {
      id obj = 0;
    }

    id v28 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v119 = __Block_byref_object_copy__7491;
    v120 = __Block_byref_object_dispose__7492;
    id v121 = 0;
    v60 = v28;
    if ([v63 count])
    {
      dispatch_group_enter(v28);
      char v29 = [MEMORY[0x1E4F1CA48] array];
      group = dispatch_group_create();
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id obja = v16;
      uint64_t v30 = [obja countByEnumeratingWithState:&v94 objects:v117 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v95;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v95 != v31) {
              objc_enumerationMutation(obja);
            }
            __int16 v33 = *(void **)(*((void *)&v94 + 1) + 8 * j);
            dispatch_group_enter(group);
            v90[0] = MEMORY[0x1E4F143A8];
            v90[1] = 3221225472;
            v90[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_547;
            v90[3] = &unk_1E69F1850;
            char v93 = v71;
            v90[4] = v70;
            id v91 = v29;
            v92 = group;
            id v34 = (void *)MEMORY[0x1D944E2D0](v90);
            [(_HAPAccessoryServerBTLE200 *)v70 _enableEvent:v71 forCharacteristic:v33 withCompletionHandler:v34 queue:v66];
            [v33 setEventNotificationsEnabled:v71];
          }
          uint64_t v30 = [obja countByEnumeratingWithState:&v94 objects:v117 count:16];
        }
        while (v30);
      }

      dispatch_group_leave(v60);
      __int16 v35 = [(HAPAccessoryServer *)v70 clientQueue];
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_548;
      v83[3] = &unk_1E69F18A0;
      v83[4] = v70;
      id v84 = v63;
      v85 = v66;
      v88 = buf;
      char v89 = v71;
      id v86 = v29;
      id v87 = v62;
      id v36 = v29;
      dispatch_group_notify(v60, v35, v83);
    }
    else
    {
      group = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v37 = v16;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v79 objects:v116 count:16];
      unsigned int v39 = v71;
      if (v38)
      {
        uint64_t v64 = *(void *)v80;
        do
        {
          uint64_t v65 = v38;
          for (uint64_t k = 0; k != v65; ++k)
          {
            if (*(void *)v80 != v64) {
              objc_enumerationMutation(v37);
            }
            id v41 = *(void **)(*((void *)&v79 + 1) + 8 * k);
            if ([v41 eventNotificationsEnabled] == v39)
            {
              id v42 = 0;
            }
            else
            {
              id v42 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6711 userInfo:0];
              id v43 = (void *)MEMORY[0x1D944E080]();
              id v44 = v70;
              HMFGetOSLogHandle();
              id v45 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                id v46 = (id)objc_claimAutoreleasedReturnValue();
                id v47 = [v41 instanceID];
                uint64_t v48 = [v41 type];
                *(_DWORD *)uint64_t v108 = 138544130;
                id v109 = v46;
                __int16 v110 = 2112;
                uint64_t v111 = v47;
                __int16 v112 = 2112;
                v113 = v48;
                __int16 v114 = 2112;
                v115 = v42;
                _os_log_impl(&dword_1D4758000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@ with error: %@", v108, 0x2Au);
              }
            }
            uint64_t v49 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v41 error:v42];
            if (v49) {
              [group addObject:v49];
            }

            unsigned int v39 = v71;
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v79 objects:v116 count:16];
        }
        while (v38);
      }

      if (obj == (char *)[v37 count])
      {
        if (!v62 || !v66) {
          goto LABEL_40;
        }
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_553;
        v76[3] = &unk_1E69F3C68;
        id v78 = v62;
        group = group;
        v77 = group;
        dispatch_async(v66, v76);

        id v36 = v78;
      }
      else
      {
        v106[0] = *MEMORY[0x1E4F28568];
        v50 = [NSString stringWithFormat:@"Failed to enable events for characteristic %@", v37];
        v107[0] = v50;
        v106[1] = *MEMORY[0x1E4F28588];
        v51 = [MEMORY[0x1E4F28B50] mainBundle];
        __int16 v52 = [v51 localizedStringForKey:@"No Characteristics support notify property" value:&stru_1F2C4E778 table:0];
        v107[1] = v52;
        id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:2];

        uint64_t v53 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6735 userInfo:v36];
        v54 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v53;

        v55 = (void *)MEMORY[0x1D944E080]();
        v56 = v70;
        HMFGetOSLogHandle();
        v57 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = HMFGetLogIdentifier();
          v59 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)uint64_t v108 = 138543618;
          id v109 = v58;
          __int16 v110 = 2112;
          uint64_t v111 = v59;
          _os_log_impl(&dword_1D4758000, v57, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable events for characteristic with error: %@", v108, 0x16u);
        }
        if (v62 && v66)
        {
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_560;
          v72[3] = &unk_1E69F3830;
          id v74 = v62;
          group = group;
          v73 = group;
          v75 = buf;
          dispatch_async(v66, v72);
        }
      }
    }

LABEL_40:
    _Block_object_dispose(buf, 8);

    id v27 = v60;
    goto LABEL_41;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v25 = HMFGetLogIdentifier();
    if (v71) {
      id v26 = @"enabling";
    }
    else {
      id v26 = @"disabling";
    }
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2048;
    v119 = [(_HAPAccessoryServerBTLE200 *)v70 connectionState];
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Rejecting %@ events on server that is not connected, current state: %tu", buf, 0x20u);
  }
  id v63 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:2 userInfo:0];
  if (v62 && v66)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91___HAPAccessoryServerBTLE200__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    block[3] = &unk_1E69F4070;
    v105 = v62;
    id v103 = v61;
    id v63 = v63;
    id v104 = v63;
    dispatch_async(v66, block);

    id v27 = v105;
LABEL_41:
  }
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v8 = a3;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(_HAPAccessoryServerBTLE200 *)self isBLELinkConnected])
  {
    id v53 = v11;
    BOOL v52 = v8;
    if (v8)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v49 = v12;
        uint64_t v16 = *(void *)v60;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v60 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            id v19 = +[HAPMetadata getSharedInstance];
            id v20 = [v19 characteristicTypesChangingTargetState];
            __int16 v21 = [v18 type];
            char v22 = [v20 containsObject:v21];

            if (v22)
            {
              char v23 = 1;
              goto LABEL_20;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        char v23 = 0;
LABEL_20:
        id v12 = v49;
      }
      else
      {
        char v23 = 0;
      }

      LOBYTE(v8) = v52;
    }
    else
    {
      char v23 = 0;
    }
    BOOL v34 = [(HAPAccessoryServerBTLE *)self stateChanged];
    int64_t v35 = 0;
    if (v23)
    {
      id v11 = v53;
    }
    else
    {
      id v11 = v53;
      if (!v34)
      {
        id v36 = [MEMORY[0x1E4F65530] sharedPreferences];
        id v37 = [v36 preferenceForKey:@"BTLEAccessoryEnableEventBackoffTime"];
        uint64_t v38 = [v37 numberValue];
        [v38 doubleValue];
        int64_t v35 = (uint64_t)(v39 * 1000000000.0);

        long long v40 = (void *)MEMORY[0x1D944E080]();
        id v41 = self;
        id v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v43 = HMFGetLogIdentifier();
          if (v52) {
            id v44 = @"enable";
          }
          else {
            id v44 = @"disable";
          }
          v51 = v40;
          id v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
          id v46 = objc_msgSend(NSNumber, "numberWithInteger:", -[_HAPAccessoryServerBTLE200 connectionState](v41, "connectionState"));
          *(_DWORD *)buf = 138544130;
          uint64_t v65 = v43;
          __int16 v66 = 2112;
          v67 = v44;
          id v11 = v53;
          __int16 v68 = 2112;
          v69 = v45;
          __int16 v70 = 2112;
          unsigned int v71 = v46;
          _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_INFO, "%{public}@Deferring %@ events on %@ characteristics to prioritize local operations. Connection state: %@", buf, 0x2Au);

          long long v40 = v51;
        }

        LOBYTE(v8) = v52;
      }
    }
    dispatch_time_t v47 = dispatch_time(0, v35);
    uint64_t v48 = [(HAPAccessoryServer *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90___HAPAccessoryServerBTLE200_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    block[3] = &unk_1E69F3BA0;
    void block[4] = self;
    BOOL v58 = v8;
    id v55 = v10;
    id v57 = v11;
    id v56 = v12;
    dispatch_after(v47, v48, block);
  }
  else
  {
    BOOL v24 = v8;
    id v25 = (void *)MEMORY[0x1D944E080]();
    id v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = v11;
      if (v24) {
        uint64_t v30 = @"enabling";
      }
      else {
        uint64_t v30 = @"disabling";
      }
      id v50 = v12;
      id v31 = v10;
      id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      __int16 v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[_HAPAccessoryServerBTLE200 connectionState](v26, "connectionState"));
      *(_DWORD *)buf = 138544130;
      uint64_t v65 = v28;
      __int16 v66 = 2112;
      v67 = v30;
      id v11 = v29;
      __int16 v68 = 2112;
      v69 = v32;
      __int16 v70 = 2112;
      unsigned int v71 = v33;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_INFO, "%{public}@Skipping %@ events for %@ characteristics in connection state: %@", buf, 0x2Au);

      id v10 = v31;
      id v12 = v50;
    }
  }
}

- (void)markNotifyingCharacteristicUpdatedforCharacteristic:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 properties])
  {
    id v5 = [(HAPAccessoryServerBTLE *)self browser];
    BOOL v6 = [(HAPAccessoryServer *)self identifier];
    [v5 markNotifyingCharacteristicUpdatedForIdentifier:v6];

    if (![(HAPAccessoryServerBTLE *)self notifyingCharacteristicUpdated])
    {
      [(HAPAccessoryServerBTLE *)self setNotifyingCharacteristicUpdated:1];
      id v7 = [(HAPAccessoryServerBTLE *)self stateNumber];
      unsigned __int16 v8 = [v7 unsignedShortValue] + 1;

      BOOL v9 = (void *)MEMORY[0x1D944E080]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = [(HAPAccessoryServerBTLE *)v10 stateNumber];
        uint64_t v14 = [NSNumber numberWithUnsignedShort:v8];
        int v17 = 138544130;
        uint64_t v18 = v12;
        __int16 v19 = 2114;
        id v20 = v13;
        __int16 v21 = 2114;
        char v22 = v14;
        __int16 v23 = 2114;
        id v24 = v4;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating state number %{public}@ -> %{public}@ due to characteristic update: %{public}@", (uint8_t *)&v17, 0x2Au);
      }
      uint64_t v15 = [NSNumber numberWithUnsignedShort:v8];
      [(HAPAccessoryServerBTLE *)v10 setStateNumber:v15];
    }
    uint64_t v16 = [(HAPAccessoryServerBTLE *)self stateNumber];
    [v4 setStateNumber:v16];
  }
}

- (void)_performTimedWriteExecuteForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v33 = 0;
  uint64_t v14 = [(id)objc_opt_class() executeWriteRequestForCharacteristic:v11 options:a5 error:&v33];
  id v15 = v33;
  if (v14)
  {
    objc_initWeak((id *)location, self);
    id v16 = objc_alloc(MEMORY[0x1E4F653F0]);
    int v17 = NSString;
    uint64_t v18 = MEMORY[0x1D944D460](self, a2);
    __int16 v19 = [v17 stringWithFormat:@"%@, %s:%ld", v18, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4924];
    id v20 = (void *)[v16 initWithName:v19];
    id v32 = v20;

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __105___HAPAccessoryServerBTLE200__performTimedWriteExecuteForCharacteristic_value_options_completionHandler___block_invoke;
    v26[3] = &unk_1E69F17D8;
    objc_copyWeak(v31, (id *)location);
    id v27 = v20;
    id v28 = v11;
    id v30 = v13;
    id v29 = v12;
    v31[1] = (id)a5;
    __int16 v21 = (void *)MEMORY[0x1D944E2D0](v26);
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v14 shouldPrioritize:1 responseHandler:v21];

    objc_destroyWeak(v31);
    __HMFActivityScopeLeave();

    objc_destroyWeak((id *)location);
  }
  else
  {
    char v22 = (void *)MEMORY[0x1D944E080]();
    __int16 v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543874;
      *(void *)&id location[4] = v25;
      __int16 v35 = 2114;
      id v36 = v11;
      __int16 v37 = 2114;
      id v38 = v15;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Timed write execute failed, failed to create request for characteristic, %{public}@, with error: %{public}@", location, 0x20u);
    }
    _callCharacteristicOperationCompletion(v11, v13, 2, v15, @"Failed to create execute-write request.");
  }
}

- (void)_performTimedWritePrepareWithValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v41 = 0;
  __int16 v35 = v15;
  id v20 = [(id)objc_opt_class() prepareWriteRequestForCharacteristic:v16 value:v15 authorizationData:v17 contextData:v18 options:a7 error:&v41];
  id v36 = v41;
  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F653F0]);
    char v22 = NSString;
    __int16 v23 = MEMORY[0x1D944D460](self, a2);
    id v24 = [v22 stringWithFormat:@"%@, %s:%ld", v23, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4858];
    uint64_t v25 = (void *)[v21 initWithName:v24];
    *(void *)buf = v25;

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __138___HAPAccessoryServerBTLE200__performTimedWritePrepareWithValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke;
    v37[3] = &unk_1E69F1828;
    v37[4] = self;
    id v26 = v25;
    id v38 = v26;
    id v27 = v16;
    id v39 = v27;
    id v40 = v19;
    id v28 = (void *)MEMORY[0x1D944E2D0](v37);
    id v29 = v26;
    [v27 instanceID];

    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v20 shouldPrioritize:((unint64_t)a7 >> 4) & 1 responseHandler:v28];
    __HMFActivityScopeLeave();
  }
  else
  {
    id v30 = (void *)MEMORY[0x1D944E080]();
    id v31 = self;
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v33;
      __int16 v43 = 2114;
      id v44 = v16;
      __int16 v45 = 2114;
      id v46 = v36;
      _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%{public}@Timed write prepare failed, failed to create request for characteristic, %{public}@, with error: %{public}@", buf, 0x20u);
    }
    BOOL v34 = [MEMORY[0x1E4F28C58] hapErrorWithCode:10];
    _callCharacteristicOperationCompletion(v16, v19, 2, v34, @"Failed to create prepare-write request.");
  }
}

- (void)_performTimedWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __127___HAPAccessoryServerBTLE200__performTimedWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke;
  v23[3] = &unk_1E69F1800;
  void v23[4] = self;
  id v24 = v15;
  id v25 = v14;
  id v26 = v16;
  int64_t v27 = a7;
  id v17 = v14;
  id v18 = v15;
  id v19 = v16;
  id v20 = a6;
  id v21 = a5;
  char v22 = (void *)MEMORY[0x1D944E2D0](v23);
  [(_HAPAccessoryServerBTLE200 *)self _performTimedWritePrepareWithValue:v17 toCharacteristic:v18 authorizationData:v21 contextData:v20 options:a7 completionHandler:v22];
}

- (void)_performWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v33 = a5;
  id v34 = a6;
  id v17 = a8;
  id v18 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v19 = NSString;
  id v20 = MEMORY[0x1D944D460](self, a2);
  id v21 = [v19 stringWithFormat:@"%@, %s:%ld", v20, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4712];
  char v22 = (void *)[v18 initWithName:v21];
  id v43 = v22;

  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __122___HAPAccessoryServerBTLE200__performWriteValue_toCharacteristic_authorizationData_contextData_options_completionHandler___block_invoke;
  v36[3] = &unk_1E69F17D8;
  objc_copyWeak(v41, &location);
  id v23 = v16;
  id v37 = v23;
  id v38 = v22;
  id v24 = v17;
  id v40 = v24;
  id v25 = v15;
  id v39 = v25;
  v41[1] = (id)a7;
  id v26 = (void *)MEMORY[0x1D944E2D0](v36);
  id v35 = 0;
  int64_t v27 = [(id)objc_opt_class() writeRequestForCharacteristic:v23 value:v25 authorizationData:v33 contextData:v34 options:a7 error:&v35];
  id v28 = v35;
  if (v27)
  {
    [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v27 shouldPrioritize:((unint64_t)a7 >> 4) & 1 responseHandler:v26];
  }
  else
  {
    context = (void *)MEMORY[0x1D944E080]();
    id v29 = self;
    HMFGetOSLogHandle();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v45 = v31;
      __int16 v46 = 2114;
      id v47 = v23;
      __int16 v48 = 2114;
      id v49 = v28;
      _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Write failed, failed to create request for characteristic, %{public}@, with error: %{public}@", buf, 0x20u);
    }
    _callCharacteristicOperationCompletion(v23, v24, 2, v28, @"Failed to create request.");
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
}

- (void)_writeValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, id, void *))a8;
  id v19 = [v15 service];
  id v20 = [v19 accessory];
  id v21 = [v20 server];

  if (v21 == self)
  {
    if ((a7 & 4) != 0 || ([v15 properties] & 0x20) != 0)
    {
      id v32 = (void *)MEMORY[0x1D944E080]();
      id v33 = self;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = HMFGetLogIdentifier();
        int v36 = 138543618;
        id v37 = v35;
        __int16 v38 = 2114;
        id v39 = v15;
        _os_log_impl(&dword_1D4758000, v34, OS_LOG_TYPE_INFO, "%{public}@Performing timed write for characteristic %{public}@", (uint8_t *)&v36, 0x16u);
      }
      [(_HAPAccessoryServerBTLE200 *)v33 _performTimedWriteValue:v14 toCharacteristic:v15 authorizationData:v16 contextData:v17 options:a7 completionHandler:v18];
    }
    else
    {
      id v28 = (void *)MEMORY[0x1D944E080]();
      id v29 = self;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = HMFGetLogIdentifier();
        int v36 = 138543618;
        id v37 = v31;
        __int16 v38 = 2114;
        id v39 = v15;
        _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_INFO, "%{public}@Performing write for characteristic %{public}@", (uint8_t *)&v36, 0x16u);
      }
      [(_HAPAccessoryServerBTLE200 *)v29 _performWriteValue:v14 toCharacteristic:v15 authorizationData:v16 contextData:v17 options:a7 completionHandler:v18];
    }
  }
  else
  {
    char v22 = (void *)MEMORY[0x1D944E080]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      id v26 = [v15 shortDescription];
      int v36 = 138543618;
      id v37 = v25;
      __int16 v38 = 2114;
      id v39 = v26;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Write failed, characteristic is not part of server: %{public}@", (uint8_t *)&v36, 0x16u);
    }
    if (v18)
    {
      int64_t v27 = [MEMORY[0x1E4F28C58] hapErrorWithCode:10];
      v18[2](v18, v15, v27);
    }
  }
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v15 = NSString;
  id v16 = MEMORY[0x1D944D460](self, a2);
  id v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4581];
  id v18 = (void *)[v14 initWithName:v17];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98___HAPAccessoryServerBTLE200_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v23[3] = &unk_1E69F17B0;
  double v28 = a4;
  void v23[4] = self;
  id v24 = v11;
  id v25 = v18;
  id v26 = v12;
  id v27 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v18;
  id v22 = v11;
  [(_HAPAccessoryServerBTLE200 *)self evaluateConnectionStateForOperation:3 block:v23];
}

- (void)_readValueForCharacteristic:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 service];
  id v12 = [v11 accessory];
  id v13 = [v12 server];

  if (v13 == self)
  {
    id v36 = 0;
    id v19 = [(id)objc_opt_class() readRequestForCharacteristic:v9 options:a4 error:&v36];
    id v18 = v36;
    if (v19)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F653F0]);
      id v21 = NSString;
      id v22 = MEMORY[0x1D944D460](self, a2);
      id v23 = [v21 stringWithFormat:@"%@, %s:%ld", v22, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4359];
      id v24 = (void *)[v20 initWithName:v23];
      *(void *)buf = v24;

      objc_initWeak(&location, self);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __84___HAPAccessoryServerBTLE200__readValueForCharacteristic_options_completionHandler___block_invoke;
      v30[3] = &unk_1E69F1760;
      objc_copyWeak(&v34, &location);
      id v31 = v9;
      id v32 = v24;
      id v33 = v10;
      id v25 = (void *)MEMORY[0x1D944E2D0](v30);
      [(_HAPAccessoryServerBTLE200 *)self _sendRequest:v19 shouldPrioritize:((unint64_t)a4 >> 1) & 1 responseHandler:v25];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      __HMFActivityScopeLeave();
    }
    else
    {
      id v26 = (void *)MEMORY[0x1D944E080]();
      id v27 = self;
      double v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v29;
        __int16 v38 = 2114;
        id v39 = v9;
        __int16 v40 = 2114;
        id v41 = v18;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Read failed, failed to create request for characteristic, %{public}@, with error: %{public}@", buf, 0x20u);
      }
      _callCharacteristicOperationCompletion(v9, v10, 1, v18, @"Failed to create request.");
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v38 = 2114;
      id v39 = v9;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Read failed, characteristic is not part of server: %{public}@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F28C58] hapErrorWithCode:11];
    _callCharacteristicOperationCompletion(v9, v10, 1, v18, @"Characteristic is not part of server.");
  }
}

- (void)_updatePropertiesFromCharacteristic:(id)a3
{
  id v9 = a3;
  id v4 = [v9 type];
  id v5 = [(HAPAccessoryServer *)self primaryAccessory];
  if ([v4 isEqualToString:@"00000220-0000-1000-8000-0026BB765291"])
  {
    BOOL v6 = [v9 value];
    id v7 = +[HAPAccessory productDataStringFromData:v6];
    [(HAPAccessoryServer *)self setProductData:v7];

    unsigned __int16 v8 = [(HAPAccessoryServer *)self productData];
    [v5 setProductData:v8];
  }
}

- (void)_readCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v21 = a4;
  id v20 = a5;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v10 = dispatch_group_create();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
        dispatch_group_enter(v10);
        [v15 instanceID];

        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke;
        v27[3] = &unk_1E69F3D30;
        void v27[4] = self;
        id v28 = v9;
        id v29 = v10;
        [(_HAPAccessoryServerBTLE200 *)self _readValueForCharacteristic:v15 options:1 completionHandler:v27];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  id v16 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80___HAPAccessoryServerBTLE200__readCharacteristicValues_queue_completionHandler___block_invoke_391;
  block[3] = &unk_1E69F3D58;
  void block[4] = self;
  id v24 = v21;
  id v25 = v9;
  id v26 = v20;
  id v17 = v9;
  id v18 = v20;
  id v19 = v21;
  dispatch_group_notify(v10, v16, block);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v15 = NSString;
  id v16 = MEMORY[0x1D944D460](self, a2);
  id v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4221];
  id v18 = (void *)[v14 initWithName:v17];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97___HAPAccessoryServerBTLE200_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  v23[3] = &unk_1E69F17B0;
  id v24 = v11;
  id v25 = self;
  id v27 = v12;
  id v28 = v13;
  double v29 = a4;
  id v26 = v18;
  id v19 = v12;
  id v20 = v13;
  id v21 = v18;
  id v22 = v11;
  [(_HAPAccessoryServerBTLE200 *)self evaluateConnectionStateForOperation:2 block:v23];
}

- (id)_parseCharacteristic:(id)a3 error:(id *)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v6])
  {
    id v7 = [v6 UUID];
    uint64_t v8 = +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:v7];

    id v84 = (void *)v8;
    v85 = a4;
    if (v8)
    {
      v83 = self;
      [v6 descriptors];
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v9 countByEnumeratingWithState:&v87 objects:v91 count:16];
      id obj = v9;
      if (v10)
      {
        uint64_t v11 = v10;
        id v82 = v6;
        id v12 = 0;
        uint64_t v13 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v88 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            id v16 = [v15 UUID];
            id v17 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
            int v18 = [v16 isEqual:v17];

            if (v18)
            {
              id v19 = v15;

              id v12 = v19;
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
        }
        while (v11);

        id v6 = v82;
        if (v12)
        {
          id v20 = _parseCharacteristicInstanceID(v12, a4);
          if (!v20)
          {
            long long v59 = (void *)MEMORY[0x1D944E080]();
            long long v60 = v83;
            long long v61 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              long long v62 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              char v93 = v62;
              _os_log_impl(&dword_1D4758000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Characteristic Instance ID", buf, 0xCu);
            }
            __int16 v46 = 0;
            BOOL v58 = v84;
            goto LABEL_58;
          }
          id v21 = [(_HAPAccessoryServerBTLE200 *)v83 discoveryContext];
          id v22 = [v21 characteristicSignatures];
          id v23 = [v22 objectForKey:v82];

          long long v81 = v20;
          if (v23)
          {
            id v24 = [v23 characteristicType];
            char v25 = [v24 isEqual:v84];

            if (v25)
            {
              id v26 = [HAPCharacteristic alloc];
              id v27 = [v84 UUIDString];
              id v28 = [(HAPAccessoryServerBTLE *)v83 stateNumber];
              uint64_t v29 = [v23 characteristicProperties];
              long long v30 = [v23 characteristicMetadata];
              LOBYTE(v80) = 1;
              long long v31 = [(HAPCharacteristic *)v26 initWithType:v27 instanceID:v81 value:0 stateNumber:v28 properties:v29 eventNotificationsEnabled:0 implicitWriteWithResponse:v80 metadata:v30];

              if (v31)
              {
                long long v32 = [MEMORY[0x1E4F1C9C8] distantPast];
                [(HAPCharacteristic *)v31 setValueUpdatedTime:v32];

                [(HAPCharacteristic *)v31 setCBCharacteristic:v82];
                long long v33 = [(_HAPAccessoryServerBTLE200 *)v83 _characteristicForCBCharacteristic:v82];
                if ([(__CFString *)v33 isEqualToCharacteristic:v31]
                  && ([(__CFString *)v33 metadata],
                      id v34 = objc_claimAutoreleasedReturnValue(),
                      [(HAPCharacteristic *)v31 metadata],
                      uint64_t v35 = objc_claimAutoreleasedReturnValue(),
                      int v36 = [v34 isEqualToCharacteristicMetadata:v35],
                      v35,
                      v34,
                      v36))
                {
                  id v37 = (void *)MEMORY[0x1D944E080]();
                  __int16 v38 = v83;
                  id v39 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
                    __int16 v40 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    char v93 = v40;
                    __int16 v94 = 2112;
                    long long v95 = v33;
                    _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Using existing characteristic: %@", buf, 0x16u);
                  }
                  id v41 = v33;
                  long long v33 = v41;
                }
                else
                {
                  id v41 = v31;
                }
                __int16 v46 = v41;
              }
              else
              {
                unsigned int v71 = NSString;
                uint64_t v72 = [v84 UUIDString];
                uint64_t v73 = [v23 characteristicProperties];
                id v74 = [v23 characteristicMetadata];
                long long v33 = [v71 stringWithFormat:@"Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu, metadata, %@", v72, v81, v73, v74];

                v75 = (void *)MEMORY[0x1D944E080]();
                v76 = v83;
                v77 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  id v78 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  char v93 = v78;
                  __int16 v94 = 2112;
                  long long v95 = v33;
                  _os_log_impl(&dword_1D4758000, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
                }
                if (v85)
                {
                  [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v33 reason:0 suggestion:0 underlyingError:0];
                  __int16 v46 = 0;
                  id *v85 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  __int16 v46 = 0;
                }
              }
              BOOL v58 = v84;

              goto LABEL_57;
            }
            __int16 v66 = NSString;
            v67 = [v23 characteristicType];
            __int16 v68 = [v67 UUIDString];
            v69 = [v84 UUIDString];
            long long v31 = [v66 stringWithFormat:@"The authenticated characteristic type, %@, does not match the characteristic type, %@", v68, v69];

            id v63 = (void *)MEMORY[0x1D944E080]();
            uint64_t v64 = v83;
            uint64_t v65 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              goto LABEL_44;
            }
          }
          else
          {
            long long v31 = [NSString stringWithFormat:@"Missing characteristic signature for characteristic: %@", v82];
            id v63 = (void *)MEMORY[0x1D944E080]();
            uint64_t v64 = v83;
            uint64_t v65 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
LABEL_44:
              __int16 v70 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              char v93 = v70;
              __int16 v94 = 2112;
              long long v95 = (__CFString *)v31;
              _os_log_impl(&dword_1D4758000, v65, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
            }
          }

          if (v85)
          {
            [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:v31 reason:0 suggestion:0 underlyingError:0];
            __int16 v46 = 0;
            id *v85 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            __int16 v46 = 0;
          }
          BOOL v58 = v84;
LABEL_57:

          id v20 = v81;
LABEL_58:

          goto LABEL_59;
        }
      }
      else
      {
      }
      v54 = (void *)MEMORY[0x1D944E080]();
      id v55 = v83;
      id v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        id v57 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        char v93 = v57;
        __int16 v94 = 2112;
        long long v95 = @"Characteristic missing characteristic instance ID descriptor";
        _os_log_impl(&dword_1D4758000, v56, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      if (v85)
      {
        [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Characteristic missing characteristic instance ID descriptor" reason:0 suggestion:0 underlyingError:0];
        __int16 v46 = 0;
        id *v85 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
    }
    else
    {
      id v47 = NSString;
      __int16 v48 = [v6 UUID];
      uint64_t v49 = [v47 stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v48];

      uint64_t v50 = (void *)MEMORY[0x1D944E080]();
      v51 = self;
      BOOL v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        id v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        char v93 = v53;
        __int16 v94 = 2112;
        long long v95 = (__CFString *)v49;
        _os_log_impl(&dword_1D4758000, v52, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id obj = (id)v49;
      if (v85)
      {
        [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v49 reason:0 suggestion:0 underlyingError:0];
        __int16 v46 = 0;
        id *v85 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
        BOOL v58 = v84;
LABEL_59:

        goto LABEL_60;
      }
    }
    __int16 v46 = 0;
    goto LABEL_37;
  }
  uint64_t v42 = (void *)MEMORY[0x1D944E080]();
  id v43 = self;
  id v44 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    __int16 v45 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    char v93 = v45;
    __int16 v94 = 2112;
    long long v95 = @"Characteristic does not support HAP";
    _os_log_impl(&dword_1D4758000, v44, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Characteristic does not support HAP" reason:0 suggestion:0 underlyingError:0];
    __int16 v46 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v46 = 0;
  }
LABEL_60:

  return v46;
}

- (id)_parseService:(id)a3 error:(id *)a4
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([(id)objc_opt_class() isHAPService:v6] & 1) == 0)
  {
    id v24 = (void *)MEMORY[0x1D944E080]();
    char v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v126 = v27;
      __int16 v127 = 2112;
      v128 = @"Service does not support HAP";
      _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Service does not support HAP" reason:0 suggestion:0 underlyingError:0];
      id v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = 0;
    }
    goto LABEL_78;
  }
  id v7 = [v6 UUID];
  uint64_t v8 = +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:v7];

  if (!v8)
  {
    uint64_t v29 = NSString;
    long long v30 = [v6 UUID];
    id v14 = [v29 stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v30];

    long long v31 = (void *)MEMORY[0x1D944E080]();
    long long v32 = self;
    long long v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = id v34 = v14;
      *(_DWORD *)buf = 138543618;
      v126 = v35;
      __int16 v127 = 2112;
      v128 = v34;
      _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      id v14 = v34;
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v14 reason:0 suggestion:0 underlyingError:0];
      id v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v28 = 0;
    }
    goto LABEL_77;
  }
  uint64_t v108 = v8;
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v10 = [v6 characteristics];
  __int16 v112 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v104 = v6;
  id v11 = [v6 characteristics];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v120 objects:v131 count:16];
  uint64_t v111 = self;
  __int16 v107 = a4;
  if (!v12)
  {
    id v14 = 0;
    goto LABEL_32;
  }
  uint64_t v13 = v12;
  id v14 = 0;
  uint64_t v15 = *(void *)v121;
  id v109 = v11;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v121 != v15) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(__CFString **)(*((void *)&v120 + 1) + 8 * i);
      if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v17])
      {
        id v119 = 0;
        int v18 = [(_HAPAccessoryServerBTLE200 *)self _parseCharacteristic:v17 error:&v119];
        id v19 = v119;
        if (v18)
        {
          [v112 addObject:v18];
        }
        else
        {
          v113 = v14;
          id v20 = (void *)MEMORY[0x1D944E080]();
          id v21 = self;
          id v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v126 = v23;
            __int16 v127 = 2112;
            v128 = v17;
            __int16 v129 = 2112;
            id v130 = v19;
            _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse characteristic, %@, with error: %@", buf, 0x20u);

            a4 = v107;
          }

          id v14 = v113;
          id v11 = v109;
          self = v111;
        }
      }
      else
      {
        if (!_isServiceInstanceIDCharacteristic(v17)) {
          continue;
        }
        if (v14)
        {
          uint64_t v64 = (void *)MEMORY[0x1D944E080]();
          uint64_t v65 = self;
          __int16 v66 = HMFGetOSLogHandle();
          id v6 = v104;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v68 = v67 = v14;
            *(_DWORD *)buf = 138543618;
            v126 = v68;
            __int16 v127 = 2112;
            v128 = @"Invalid service, multiple Service Instance ID characteristics.";
            _os_log_impl(&dword_1D4758000, v66, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

            id v14 = v67;
          }

          if (a4)
          {
            [MEMORY[0x1E4F28C58] hapErrorWithCode:9, @"Invalid service, multiple Service Instance ID characteristics.", 0, 0, 0 description reason suggestion underlyingError];
            id v28 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v28 = 0;
          }
          goto LABEL_55;
        }
        _parseServiceInstanceID(v17, a4);
        id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v69 = (void *)MEMORY[0x1D944E080]();
          __int16 v70 = self;
          unsigned int v71 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            uint64_t v73 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v126 = v73;
            _os_log_impl(&dword_1D4758000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Service Instance ID", buf, 0xCu);
          }
          id v14 = 0;
          id v28 = 0;
          id v6 = v104;
LABEL_55:
          uint64_t v8 = v108;
          goto LABEL_76;
        }
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v120 objects:v131 count:16];
  }
  while (v13);
LABEL_32:
  __int16 v114 = v14;

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v11 = v112;
  uint64_t v36 = [v11 countByEnumeratingWithState:&v115 objects:v124 count:16];
  __int16 v110 = v11;
  if (!v36) {
    goto LABEL_44;
  }
  uint64_t v37 = v36;
  uint64_t v38 = *(void *)v116;
  while (2)
  {
    uint64_t v39 = 0;
    while (2)
    {
      if (*(void *)v116 != v38) {
        objc_enumerationMutation(v11);
      }
      __int16 v40 = *(void **)(*((void *)&v115 + 1) + 8 * v39);
      id v41 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
      uint64_t v42 = [v41 characteristicSignatures];
      id v43 = [v40 cbCharacteristic];
      id v44 = [v42 objectForKey:v43];

      if (!v44)
      {
        id v74 = [NSString stringWithFormat:@"Missing characteristic signature for characteristic: %@", v40];
        v75 = (void *)MEMORY[0x1D944E080]();
        v76 = v111;
        v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          id v78 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v126 = v78;
          __int16 v127 = 2112;
          v128 = v74;
          _os_log_impl(&dword_1D4758000, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
        }
        uint64_t v8 = v108;
        if (v107)
        {
          *__int16 v107 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:v74 reason:0 suggestion:0 underlyingError:0];
        }

        id v28 = 0;
        id v6 = v104;
        id v14 = v114;
        goto LABEL_76;
      }
      __int16 v45 = (void *)MEMORY[0x1E4F1BD68];
      __int16 v46 = [v44 serviceType];
      id v47 = [v46 UUIDString];
      __int16 v48 = [v45 UUIDWithString:v47];

      uint64_t v49 = +[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:v48];
      uint64_t v50 = [v44 serviceType];
      if ([v50 isEqual:v108])
      {

        goto LABEL_41;
      }
      char v51 = [v49 isEqual:v108];

      if ((v51 & 1) == 0)
      {
        __int16 v94 = NSString;
        long long v95 = [v44 serviceType];
        uint64_t v96 = [v95 UUIDString];
        uint64_t v8 = v108;
        long long v97 = [v108 UUIDString];
        long long v98 = [v48 UUIDString];
        uint64_t v106 = [v94 stringWithFormat:@"The authenticated service type, %@, does not match the service type, %@ or %@, for characteristic: %@", v96, v97, v98, v40];

        long long v99 = (void *)MEMORY[0x1D944E080]();
        long long v100 = v111;
        long long v101 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          id v102 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v126 = v102;
          __int16 v127 = 2112;
          v128 = (__CFString *)v106;
          _os_log_impl(&dword_1D4758000, v101, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
        }
        id v6 = v104;
        long long v81 = (__CFString *)v106;
        v85 = v107;
        goto LABEL_73;
      }
LABEL_41:
      BOOL v52 = [v44 serviceInstanceID];
      char v53 = [v52 isEqualToNumber:v114];

      if ((v53 & 1) == 0)
      {
        long long v79 = NSString;
        uint64_t v80 = [v44 serviceInstanceID];
        long long v81 = [v79 stringWithFormat:@"The authenticated service instance ID, %@, does not match the service instance ID, %@, for characteristic: %@", v80, v114, v40];

        id v82 = (void *)MEMORY[0x1D944E080]();
        v83 = v111;
        id v84 = HMFGetOSLogHandle();
        v85 = v107;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          id v86 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v126 = v86;
          __int16 v127 = 2112;
          v128 = v81;
          _os_log_impl(&dword_1D4758000, v84, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
        }
        id v6 = v104;
        uint64_t v8 = v108;
LABEL_73:
        id v14 = v114;
        if (v85)
        {
          id *v85 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:v81 reason:0 suggestion:0 underlyingError:0];
        }

        id v28 = 0;
        id v11 = v110;
        goto LABEL_76;
      }

      ++v39;
      id v11 = v110;
      self = v111;
      if (v37 != v39) {
        continue;
      }
      break;
    }
    uint64_t v37 = [v110 countByEnumeratingWithState:&v115 objects:v124 count:16];
    if (v37) {
      continue;
    }
    break;
  }
LABEL_44:

  v54 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  id v55 = [v54 serviceSignatures];
  id v6 = v104;
  id v56 = [v55 objectForKey:v104];

  id v57 = [HAPService alloc];
  uint64_t v8 = v108;
  BOOL v58 = [v108 UUIDString];
  long long v59 = (void *)[v11 copy];
  uint64_t v60 = [v56 serviceProperties];
  v105 = v56;
  long long v61 = [v56 linkedServices];
  long long v62 = (void *)[v61 copy];
  id v28 = [(HAPService *)v57 initWithType:v58 instanceID:v114 parsedCharacteristics:v59 serviceProperties:v60 linkedServices:v62];

  if (v28)
  {
    [(HAPService *)v28 setCBService:v104];
    id v63 = v28;
    id v14 = v114;
  }
  else
  {
    long long v87 = NSString;
    long long v88 = [v108 UUIDString];
    long long v89 = [v87 stringWithFormat:@"Failed to create service with type, %@, service instance ID, %@, characteristics, %@", v88, v114, v110];

    long long v90 = (void *)MEMORY[0x1D944E080]();
    id v91 = v111;
    v92 = HMFGetOSLogHandle();
    id v14 = v114;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      char v93 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v126 = v93;
      __int16 v127 = 2112;
      v128 = v89;
      _os_log_impl(&dword_1D4758000, v92, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      id v14 = v114;
    }

    if (v107)
    {
      *__int16 v107 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v89 reason:0 suggestion:0 underlyingError:0];
    }
  }
  id v11 = v105;
LABEL_76:

LABEL_77:
LABEL_78:

  return v28;
}

- (BOOL)shouldVerifyHAPService:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  id v6 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
  if ([v5 isEqual:v6])
  {

LABEL_4:
    char v10 = 0;
    goto LABEL_12;
  }
  id v7 = [v4 UUID];
  uint64_t v8 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000055-0000-1000-8000-0026BB765291"];
  char v9 = [v7 isEqual:v8];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = [v4 UUID];
  uint64_t v12 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED3"];
  if ([v11 isEqual:v12])
  {
    int v13 = ![(HAPAccessoryServerBTLE *)self isPaired];
  }
  else
  {
    id v14 = [v4 UUID];
    uint64_t v15 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000003E-0000-1000-8000-0026BB765291"];
    if ([v14 isEqual:v15]) {
      int v13 = ![(HAPAccessoryServerBTLE *)self isPaired];
    }
    else {
      LOBYTE(v13) = 0;
    }
  }
  char v10 = v13 ^ 1;
LABEL_12:

  return v10;
}

- (BOOL)shouldVerifyHAPCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [v4 service];
  id v6 = [v5 UUID];
  id v7 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
  if ([v6 isEqual:v7])
  {
  }
  else
  {
    uint64_t v8 = [v4 service];
    char v9 = [v8 UUID];
    char v10 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000055-0000-1000-8000-0026BB765291"];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_10;
    }
  }
  uint64_t v12 = [v4 UUID];
  int v13 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000004C-0000-1000-8000-0026BB765291"];
  if (![v12 isEqual:v13])
  {
    id v14 = [v4 UUID];
    char v9 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000004E-0000-1000-8000-0026BB765291"];
    if ([v14 isEqual:v9])
    {

      goto LABEL_7;
    }
    id v16 = [v4 UUID];
    id v17 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000004F-0000-1000-8000-0026BB765291"];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_8;
    }
LABEL_10:
    id v19 = [v4 service];
    id v20 = [v19 UUID];
    id v21 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED3"];
    char v22 = [v20 isEqual:v21];
    if ((v22 & 1) == 0)
    {
      id v23 = [v4 service];
      id v24 = [v23 UUID];
      char v9 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000003E-0000-1000-8000-0026BB765291"];
      if (![v24 isEqual:v9])
      {
        LOBYTE(v28) = 0;
LABEL_19:

LABEL_20:
        char v15 = v28 ^ 1;
        goto LABEL_21;
      }
      long long v30 = v24;
      long long v32 = v23;
    }
    char v25 = self;
    id v26 = objc_msgSend(v4, "UUID", v30);
    id v27 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000014-0000-1000-8000-0026BB765291"];
    if ([v26 isEqual:v27]) {
      int v28 = ![(HAPAccessoryServerBTLE *)v25 isPaired];
    }
    else {
      LOBYTE(v28) = 0;
    }
    id v24 = v31;

    id v23 = v32;
    if (v22) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_7:

LABEL_8:
  char v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)isHAPCharacteristic:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_isServiceInstanceIDCharacteristic(v3))
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 descriptors];
    if ([v5 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        char v15 = v5;
        uint64_t v9 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            int v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) UUID];
            uint64_t v12 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
            char v13 = [v11 isEqual:v12];

            if (v13)
            {
              BOOL v4 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            continue;
          }
          break;
        }
        BOOL v4 = 0;
LABEL_14:
        id v5 = v15;
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (void)_handleReadServiceSignature:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (![(_HAPAccessoryServerBTLE200 *)self _shouldIgnoreRetryDiscoveryError:v7])
    {
      v12[0] = (id)MEMORY[0x1E4F143A8];
      v12[1] = (id)3221225472;
      v12[2] = __64___HAPAccessoryServerBTLE200__handleReadServiceSignature_error___block_invoke;
      v12[3] = &unk_1E69F4708;
      void v12[4] = self;
      id v13 = v6;
      id v8 = v7;
      id v14 = v8;
      __64___HAPAccessoryServerBTLE200__handleReadServiceSignature_error___block_invoke(v12);
      [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:v8];
    }
  }
  else
  {
    uint64_t v9 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    char v10 = [v9 readingSignatureServices];
    [v10 removeObject:v6];

    int v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    LODWORD(v10) = [v11 isComplete];

    if (v10) {
      [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
    }
  }
}

- (void)_handleReadCharacteristicSignature:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (![(_HAPAccessoryServerBTLE200 *)self _shouldIgnoreRetryDiscoveryError:v7])
    {
      v12[0] = (id)MEMORY[0x1E4F143A8];
      v12[1] = (id)3221225472;
      v12[2] = __71___HAPAccessoryServerBTLE200__handleReadCharacteristicSignature_error___block_invoke;
      v12[3] = &unk_1E69F4708;
      void v12[4] = self;
      id v13 = v6;
      id v8 = v7;
      id v14 = v8;
      __71___HAPAccessoryServerBTLE200__handleReadCharacteristicSignature_error___block_invoke(v12);
      [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:v8];
    }
  }
  else
  {
    uint64_t v9 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    char v10 = [v9 readingSignatureCharacteristics];
    [v10 removeObject:v6];

    int v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    LODWORD(v10) = [v11 isComplete];

    if (v10) {
      [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
    }
  }
}

- (void)_readServiceSignature:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v4])
  {
    id v5 = objc_opt_class();
    id v6 = [v4 service];
    id v7 = [v6 UUID];
    id v8 = [v5 hapUUIDFromBTLEUUID:v7];

    if (v8)
    {
      uint64_t v9 = [v4 service];
      uint64_t v10 = [(_HAPAccessoryServerBTLE200 *)self _getServiceInstanceID:v9];

      id v116 = 0;
      uint64_t v11 = [(_HAPAccessoryServerBTLE200 *)self _getCharacteristicInstanceID:v4 error:&v116];
      uint64_t v12 = (__CFString *)v116;
      if (v10 | v11)
      {
        if ([(_HAPAccessoryServerBTLE200 *)self isVerified])
        {
          BOOL v13 = 0;
        }
        else
        {
          long long v31 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
          if ([v31 discoveryType])
          {
            BOOL v13 = 0;
          }
          else
          {
            long long v32 = [v4 service];
            BOOL v13 = [(_HAPAccessoryServerBTLE200 *)self shouldVerifyHAPService:v32];
          }
        }
        long long v33 = [v4 service];
        long long v30 = [(_HAPAccessoryServerBTLE200 *)self _serviceForCBService:v33];

        id v109 = (void *)v10;
        if (v13 || !v30)
        {
          if (v13 && [0 isAuthenticated])
          {
            char v51 = (void *)MEMORY[0x1D944E080]();
            BOOL v52 = self;
            char v53 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              v54 = HMFGetLogIdentifier();
              [v4 service];
              uint64_t v55 = v11;
              id v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              long long v118 = v54;
              __int16 v119 = 2112;
              long long v120 = v56;
              _os_log_impl(&dword_1D4758000, v53, OS_LOG_TYPE_DEBUG, "%{public}@Found authenticated cached signature, skipping reading service signature for service: %@", buf, 0x16u);

              uint64_t v11 = v55;
              uint64_t v10 = (uint64_t)v109;
            }

            id v47 = [(_HAPAccessoryServerBTLE200 *)v52 discoveryContext];
            __int16 v48 = [(HAPBTLEServiceSignature *)v47 serviceSignatures];
            uint64_t v49 = [v4 service];
            [v48 setObject:0 forKey:v49];
          }
          else
          {
            uint64_t v106 = v30;
            id v57 = (void *)MEMORY[0x1D944E080]();
            BOOL v58 = self;
            long long v59 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v60 = HMFGetLogIdentifier();
              [v4 service];
              uint64_t v61 = v11;
              long long v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              long long v118 = v60;
              __int16 v119 = 2112;
              long long v120 = v62;
              _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for service: %@", buf, 0x16u);

              uint64_t v11 = v61;
            }

            id v63 = +[HAPMetadata getSharedInstance];
            uint64_t v64 = [v8 UUIDString];
            uint64_t v65 = [(HAPBTLEServiceSignature *)v63 getDefaultServiceProperties:v64];

            uint64_t v108 = v11;
            id v103 = v65;
            id v104 = v63;
            if (v65) {
              uint64_t v65 = (void *)[v65 unsignedLongLongValue];
            }
            __int16 v66 = [HAPService alloc];
            v67 = [v8 UUIDString];
            uint64_t v49 = [(HAPService *)v66 initWithType:v67 instanceID:v109 parsedCharacteristics:0 serviceProperties:v65 linkedServices:0];

            if (v49)
            {
              __int16 v68 = [v4 service];
              [(HAPService *)v49 setCBService:v68];

              v69 = [HAPCharacteristic alloc];
              __int16 v70 = [v4 UUID];
              unsigned int v71 = [v70 UUIDString];
              uint64_t v72 = [(HAPAccessoryServerBTLE *)v58 stateNumber];
              LOBYTE(v100) = 1;
              uint64_t v73 = [(HAPCharacteristic *)v69 initWithType:v71 instanceID:v108 value:0 stateNumber:v72 properties:2 eventNotificationsEnabled:0 implicitWriteWithResponse:v100 metadata:0];

              id v74 = v73;
              [(HAPCharacteristic *)v73 setCBCharacteristic:v4];
              [(HAPCharacteristic *)v73 setService:v49];
              v75 = [(_HAPAccessoryServerBTLE200 *)v58 discoveryContext];
              BOOL v76 = [v75 discoveryType] == 0;

              id v115 = 0;
              v77 = [(id)objc_opt_class() signatureRequestForService:v49 characteristic:v74 requiresAuthentication:v76 error:&v115];
              id v78 = v115;
              id v101 = v78;
              id v102 = v74;
              if (v77)
              {
                [v4 service];
                v80 = long long v79 = v77;
                v110[0] = MEMORY[0x1E4F143A8];
                v110[1] = 3221225472;
                v110[2] = __52___HAPAccessoryServerBTLE200__readServiceSignature___block_invoke;
                v110[3] = &unk_1E69F16D0;
                id v111 = v80;
                __int16 v112 = v58;
                id v113 = v109;
                id v114 = v8;
                id v81 = v80;
                id v82 = (void *)MEMORY[0x1D944E2D0](v110);
                [(_HAPAccessoryServerBTLE200 *)v58 _sendRequest:v79 shouldPrioritize:0 responseHandler:v82];
                v83 = [(_HAPAccessoryServerBTLE200 *)v58 discoveryContext];
                id v84 = [v83 readingSignatureServices];
                v85 = [v4 service];
                [v84 addObject:v85];

                v77 = v79;
              }
              else
              {
                id v95 = v78;
                uint64_t v96 = (void *)MEMORY[0x1D944E080]();
                long long v97 = v58;
                long long v98 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                {
                  long long v99 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  long long v118 = v99;
                  __int16 v119 = 2112;
                  long long v120 = v106;
                  __int16 v121 = 2112;
                  id v122 = v95;
                  _os_log_impl(&dword_1D4758000, v98, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for service, %@, with error: %@", buf, 0x20u);

                  v77 = 0;
                }

                id v81 = [v4 service];
                [(_HAPAccessoryServerBTLE200 *)v97 _handleReadServiceSignature:v81 error:v95];
              }
              uint64_t v11 = v108;
              id v47 = v104;

              uint64_t v10 = (uint64_t)v109;
              long long v30 = v106;
              char v93 = v101;
              __int16 v94 = v102;
            }
            else
            {
              id v86 = NSString;
              long long v87 = [v8 UUIDString];
              uint64_t v88 = [v86 stringWithFormat:@"Failed to create service with type, %@, instance ID, %@, properties, %tu", v87, v109, v65];

              long long v89 = (void *)MEMORY[0x1D944E080]();
              long long v90 = v58;
              id v91 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                v92 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                long long v118 = v92;
                __int16 v119 = 2112;
                long long v120 = (__CFString *)v88;
                _os_log_impl(&dword_1D4758000, v91, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
              }
              char v93 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v88 reason:0 suggestion:0 underlyingError:0];
              [(_HAPAccessoryServerBTLE200 *)v90 _handleReadCharacteristicSignature:v4 error:v93];
              uint64_t v11 = v108;
              uint64_t v10 = (uint64_t)v109;
              __int16 v94 = (void *)v88;
              id v47 = v104;
              long long v30 = v106;
            }

            __int16 v48 = v103;
          }
        }
        else
        {
          v105 = v8;
          uint64_t v107 = v11;
          id v34 = (void *)MEMORY[0x1D944E080]();
          uint64_t v35 = self;
          uint64_t v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v38 = uint64_t v37 = v30;
            uint64_t v39 = [v4 service];
            *(_DWORD *)buf = 138543618;
            long long v118 = v38;
            __int16 v119 = 2112;
            long long v120 = v39;
            _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Found cached service signature, skipping reading service signature for service: %@", buf, 0x16u);

            long long v30 = v37;
          }

          __int16 v40 = [HAPBTLEServiceSignature alloc];
          id v41 = objc_alloc(MEMORY[0x1E4F29128]);
          uint64_t v42 = [(__CFString *)v30 type];
          id v43 = (void *)[v41 initWithUUIDString:v42];
          id v44 = [(__CFString *)v30 instanceID];
          uint64_t v45 = [(__CFString *)v30 serviceProperties];
          __int16 v46 = [(__CFString *)v30 linkedServices];
          id v47 = [(HAPBTLEServiceSignature *)v40 initWithServiceType:v43 serviceInstanceID:v44 serviceProperties:v45 linkedServices:v46 authenticated:0];

          __int16 v48 = [(_HAPAccessoryServerBTLE200 *)v35 discoveryContext];
          uint64_t v49 = [v48 serviceSignatures];
          uint64_t v50 = [v4 service];
          [(HAPService *)v49 setObject:v47 forKey:v50];

          uint64_t v11 = v107;
          uint64_t v10 = (uint64_t)v109;
          id v8 = v105;
        }
      }
      else
      {
        char v25 = (void *)MEMORY[0x1D944E080]();
        id v26 = self;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int v28 = HMFGetLogIdentifier();
          uint64_t v29 = [v4 service];
          *(_DWORD *)buf = 138544130;
          long long v118 = v28;
          __int16 v119 = 2112;
          long long v120 = v29;
          __int16 v121 = 2112;
          id v122 = v4;
          __int16 v123 = 2112;
          v124 = v12;
          _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to get service/characteristic, %@/%@, instance ID with error: %@", buf, 0x2Au);
        }
        long long v30 = [v4 service];
        [(_HAPAccessoryServerBTLE200 *)v26 _handleReadServiceSignature:v30 error:v12];
      }
    }
    else
    {
      long long v18 = NSString;
      long long v19 = [v4 service];
      id v20 = [v19 UUID];
      uint64_t v12 = [v18 stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v20];

      uint64_t v21 = (void *)MEMORY[0x1D944E080]();
      char v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v118 = v24;
        __int16 v119 = 2112;
        long long v120 = v12;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      uint64_t v10 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v12 reason:0 suggestion:0 underlyingError:0];
      uint64_t v11 = [v4 service];
      [(_HAPAccessoryServerBTLE200 *)v22 _handleReadServiceSignature:v11 error:v10];
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D944E080]();
    char v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v118 = v17;
      __int16 v119 = 2112;
      long long v120 = @"Service Properties Characteristic does not support HAP";
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Service Properties Characteristic does not support HAP" reason:0 suggestion:0 underlyingError:0];
    uint64_t v12 = [v4 service];
    [(_HAPAccessoryServerBTLE200 *)v15 _handleReadServiceSignature:v12 error:v8];
  }
}

- (void)_readCharacteristicSignature:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v4])
  {
    id v5 = objc_opt_class();
    id v6 = [(__CFString *)v4 UUID];
    id v7 = [v5 hapUUIDFromBTLEUUID:v6];

    if (v7)
    {
      id v93 = 0;
      id v8 = [(_HAPAccessoryServerBTLE200 *)self _getCharacteristicInstanceID:v4 error:&v93];
      uint64_t v9 = (__CFString *)v93;
      if (v8)
      {
        if ([(_HAPAccessoryServerBTLE200 *)self isVerified])
        {
          BOOL v10 = 0;
        }
        else
        {
          char v25 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
          if ([v25 discoveryType]) {
            BOOL v10 = 0;
          }
          else {
            BOOL v10 = [(_HAPAccessoryServerBTLE200 *)self shouldVerifyHAPCharacteristic:v4];
          }
        }
        uint64_t v26 = [(_HAPAccessoryServerBTLE200 *)self _characteristicForCBCharacteristic:v4];
        id v27 = (void *)v26;
        if (v10 || !v26)
        {
          if (v10 && [0 isAuthenticated])
          {
            uint64_t v45 = (void *)MEMORY[0x1D944E080]();
            __int16 v46 = self;
            id v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              __int16 v48 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v95 = v48;
              __int16 v96 = 2112;
              long long v97 = v4;
              _os_log_impl(&dword_1D4758000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Found authenticated cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);
            }
            uint64_t v42 = [(_HAPAccessoryServerBTLE200 *)v46 discoveryContext];
            id v43 = [(HAPBTLECharacteristicSignature *)v42 characteristicSignatures];
            [v43 setObject:0 forKey:v4];
          }
          else
          {
            uint64_t v49 = (void *)MEMORY[0x1D944E080]();
            uint64_t v50 = self;
            char v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              BOOL v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v95 = v52;
              __int16 v96 = 2112;
              long long v97 = v4;
              _os_log_impl(&dword_1D4758000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for characteristic: %@", buf, 0x16u);
            }
            char v53 = +[HAPMetadata getSharedInstance];
            long long v89 = v7;
            v54 = [v7 UUIDString];
            id v43 = [(HAPBTLECharacteristicSignature *)v53 getDefaultCharacteristicProperties:v54];

            long long v87 = v9;
            long long v79 = v27;
            v83 = v53;
            if (v43) {
              uint64_t v55 = [v43 unsignedLongLongValue];
            }
            else {
              uint64_t v55 = 2;
            }
            id v56 = [HAPCharacteristic alloc];
            id v57 = [v7 UUIDString];
            BOOL v58 = [(HAPAccessoryServerBTLE *)v50 stateNumber];
            LOBYTE(v78) = 1;
            long long v59 = [(HAPCharacteristic *)v56 initWithType:v57 instanceID:v8 value:0 stateNumber:v58 properties:v55 eventNotificationsEnabled:0 implicitWriteWithResponse:v78 metadata:0];

            v85 = v8;
            if (v59)
            {
              [(HAPCharacteristic *)v59 setCBCharacteristic:v4];
              uint64_t v60 = [(_HAPAccessoryServerBTLE200 *)v50 discoveryContext];
              BOOL v61 = [v60 discoveryType] == 0;

              id v92 = 0;
              long long v62 = [(id)objc_opt_class() signatureRequestForCharacteristic:v59 requiresAuthentication:v61 error:&v92];
              id v63 = (__CFString *)v92;
              if (v62)
              {
                v90[0] = MEMORY[0x1E4F143A8];
                v90[1] = 3221225472;
                v90[2] = __59___HAPAccessoryServerBTLE200__readCharacteristicSignature___block_invoke;
                v90[3] = &unk_1E69F16A8;
                v90[4] = v50;
                uint64_t v64 = v4;
                id v91 = v64;
                uint64_t v65 = (void *)MEMORY[0x1D944E2D0](v90);
                [(_HAPAccessoryServerBTLE200 *)v50 _sendRequest:v62 shouldPrioritize:0 responseHandler:v65];
                __int16 v66 = [(_HAPAccessoryServerBTLE200 *)v50 discoveryContext];
                v67 = [v66 readingSignatureCharacteristics];
                [v67 addObject:v64];
              }
              else
              {
                id v74 = (void *)MEMORY[0x1D944E080]();
                v75 = v50;
                BOOL v76 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  v77 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  id v95 = v77;
                  __int16 v96 = 2112;
                  long long v97 = v4;
                  __int16 v98 = 2112;
                  long long v99 = v63;
                  _os_log_impl(&dword_1D4758000, v76, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for characteristic, %@, with error: %@", buf, 0x20u);
                }
                [(_HAPAccessoryServerBTLE200 *)v75 _handleReadCharacteristicSignature:v4 error:v63];
                long long v62 = 0;
              }
            }
            else
            {
              __int16 v68 = NSString;
              v69 = [v7 UUIDString];
              id v63 = [v68 stringWithFormat:@"Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu", v69, v8, v55];

              __int16 v70 = (void *)MEMORY[0x1D944E080]();
              unsigned int v71 = v50;
              uint64_t v72 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                uint64_t v73 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v95 = v73;
                __int16 v96 = 2112;
                long long v97 = v63;
                _os_log_impl(&dword_1D4758000, v72, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
              }
              long long v62 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v63 reason:0 suggestion:0 underlyingError:0];
              [(_HAPAccessoryServerBTLE200 *)v71 _handleReadCharacteristicSignature:v4 error:v62];
            }
            id v27 = v79;

            id v8 = v85;
            uint64_t v9 = v87;
            id v7 = v89;
            uint64_t v42 = v83;
          }
        }
        else
        {
          id v86 = v9;
          uint64_t v88 = v7;
          id v84 = v8;
          int v28 = (void *)MEMORY[0x1D944E080]();
          uint64_t v29 = self;
          long long v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            long long v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v95 = v31;
            __int16 v96 = 2112;
            long long v97 = v4;
            _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Found cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);
          }
          uint64_t v80 = [HAPBTLECharacteristicSignature alloc];
          id v32 = objc_alloc(MEMORY[0x1E4F29128]);
          id v82 = [v27 type];
          long long v33 = (void *)[v32 initWithUUIDString:v82];
          id v34 = [v27 service];
          uint64_t v35 = [v34 instanceID];
          id v36 = objc_alloc(MEMORY[0x1E4F29128]);
          [v27 service];
          uint64_t v37 = v81 = v29;
          uint64_t v38 = [v37 type];
          uint64_t v39 = (void *)[v36 initWithUUIDString:v38];
          uint64_t v40 = [v27 properties];
          id v41 = [v27 metadata];
          uint64_t v42 = [(HAPBTLECharacteristicSignature *)v80 initWithCharacteristicType:v33 serviceInstanceID:v35 serviceType:v39 characteristicProperties:v40 characteristicMetadata:v41 authenticated:0];

          id v43 = [(_HAPAccessoryServerBTLE200 *)v81 discoveryContext];
          id v44 = [v43 characteristicSignatures];
          [v44 setObject:v42 forKey:v4];

          id v8 = v84;
          uint64_t v9 = v86;
          id v7 = v88;
        }
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x1D944E080]();
        char v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v95 = v24;
          __int16 v96 = 2112;
          long long v97 = v4;
          __int16 v98 = 2112;
          long long v99 = v9;
          _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get characteristic, %@, instance ID with error: %@", buf, 0x20u);
        }
        [(_HAPAccessoryServerBTLE200 *)v22 _handleReadCharacteristicSignature:v4 error:v9];
        id v8 = 0;
      }
    }
    else
    {
      char v15 = NSString;
      long long v16 = [(__CFString *)v4 UUID];
      uint64_t v9 = [v15 stringWithFormat:@"Failed to convert UUID '%@' to HAP UUID", v16];

      long long v17 = (void *)MEMORY[0x1D944E080]();
      long long v18 = self;
      long long v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v95 = v20;
        __int16 v96 = 2112;
        long long v97 = v9;
        _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:v9 reason:0 suggestion:0 underlyingError:0];
      [(_HAPAccessoryServerBTLE200 *)v18 _handleReadCharacteristicSignature:v4 error:v8];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    uint64_t v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v95 = v14;
      __int16 v96 = 2112;
      long long v97 = @"Characteristic does not support HAP";
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Characteristic does not support HAP" reason:0 suggestion:0 underlyingError:0];
    [(_HAPAccessoryServerBTLE200 *)v12 _handleReadCharacteristicSignature:v4 error:v7];
  }
}

- (id)_getProtocolInfoService
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(_HAPAccessoryServerBTLE200 *)self _hapServicesFromCache];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "type", (void)v12);
        char v9 = [v8 isEqualToString:@"000000A2-0000-1000-8000-0026BB765291"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)_getServiceInstanceID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend(v4, "characteristics", 0);
  id v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (_isServiceInstanceIDCharacteristic(v9))
        {
          id v6 = _parseServiceInstanceID(v9, 0);
          if (!v6)
          {
            id v10 = (void *)MEMORY[0x1D944E080]();
            uint64_t v11 = self;
            long long v12 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              long long v13 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              id v20 = v13;
              __int16 v21 = 2114;
              id v22 = v4;
              __int16 v23 = 2114;
              id v24 = v9;
              _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get Service Instance ID for Service: %{public}@, Characteristic: %{public}@", buf, 0x20u);
            }
            id v6 = 0;
          }
          goto LABEL_14;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)_getCharacteristicInstanceID:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [a3 descriptors];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 UUID];
        uint64_t v11 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
        char v12 = [v10 isEqual:v11];

        if (v12)
        {
          long long v13 = _parseCharacteristicInstanceID(v9, a4);

          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Characteristic missing the characteristic instance ID descriptor" reason:0 suggestion:0 underlyingError:0];
    long long v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v13 = 0;
  }
LABEL_12:

  return v13;
}

- (void)_readCharacteristicSignatures
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v3 = [(HAPAccessoryServerBTLE *)self peripheral];
  id v4 = [v3 services];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([(id)objc_opt_class() isHAPService:v9])
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v10 = objc_msgSend(v9, "characteristics", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
                if (_isServiceSignatureCharacteristic(v15)) {
                  [(_HAPAccessoryServerBTLE200 *)self _readServiceSignature:v15];
                }
                if ([(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v15]) {
                  [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignature:v15];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  long long v16 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  int v17 = [v16 isComplete];

  if (v17) {
    [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
  }
}

- (void)_handleUpdateValueForCharacteristic:(id)a3 error:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  char v9 = [v8 readingCharacteristics];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    [(_HAPAccessoryServerBTLE200 *)self _handleReadCharacteristicValue:v6 error:v7];
  }
  else
  {
    uint64_t v11 = [v6 value];
    if ([v11 length])
    {
      id v32 = v11;
      id v33 = v7;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v12 = [(_HAPAccessoryServerBTLE200 *)self pendingRequests];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            long long v18 = [v17 characteristic];
            long long v19 = [v18 cbCharacteristic];
            int v20 = [v19 isEqual:v6];

            if (v20)
            {
              long long v25 = [v17 characteristic];
              uint64_t v11 = v32;
              id v7 = v33;
              [(_HAPAccessoryServerBTLE200 *)self _handleResponseData:v32 fromCharacteristic:v25 error:v33];

              goto LABEL_23;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      long long v21 = (void *)MEMORY[0x1D944E080]();
      long long v22 = self;
      long long v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v24;
        __int16 v41 = 2114;
        id v42 = v6;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@Received unexpected response from characteristic: %{public}@", buf, 0x16u);
      }
      uint64_t v11 = v32;
      id v7 = v33;
    }
    else
    {
      uint64_t v12 = [(_HAPAccessoryServerBTLE200 *)self _characteristicForCBCharacteristic:v6];
      uint64_t v26 = (void *)MEMORY[0x1D944E080]();
      id v27 = self;
      uint64_t v28 = HMFGetOSLogHandle();
      uint64_t v29 = v28;
      if (v12)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          long long v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v30;
          __int16 v41 = 2114;
          id v42 = v6;
          _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Received zero-length value for characteristic: %{public}@", buf, 0x16u);
        }
        [(_HAPAccessoryServerBTLE200 *)v27 _handleEventIndicationForCharacteristic:v12];
      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          long long v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v40 = v31;
          __int16 v41 = 2114;
          id v42 = v6;
          _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@Received characteristic indication from unmapped characteristic: %{public}@", buf, 0x16u);
        }
      }
LABEL_23:
    }
  }
}

- (void)_handleReadDescriptorValue:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944E080]();
  char v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v6 characteristic];
    uint64_t v13 = [v6 value];
    int v17 = 138544130;
    long long v18 = v11;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    long long v22 = v12;
    __int16 v23 = 2114;
    long long v24 = v13;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Read value of descriptor: %{public}@ for characteristic: %{public}@ value: %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)v9 _cancelDiscoveryWithError:v7];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)v9 _kickConnectionIdleTimer];
    uint64_t v14 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
    uint64_t v15 = [v14 readingDescriptors];
    [v15 removeObject:v6];

    long long v16 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
    LODWORD(v15) = [v16 isComplete];

    if (v15) {
      [(_HAPAccessoryServerBTLE200 *)v9 _readCharacteristicSignatures];
    }
  }
}

- (void)_readDescriptorValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 value];

  if (!v5)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      char v9 = HMFGetLogIdentifier();
      int v15 = 138543618;
      long long v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of descriptor: %@", (uint8_t *)&v15, 0x16u);
    }
    int v10 = [(_HAPAccessoryServerBTLE200 *)v7 discoveryContext];
    uint64_t v11 = [v10 readingDescriptors];
    [v11 addObject:v4];

    uint64_t v12 = [(HAPAccessoryServerBTLE *)v7 peripheral];
    [v12 readValueForDescriptor:v4];
  }
  uint64_t v13 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  int v14 = [v13 isComplete];

  if (v14) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
}

- (void)_handleReadCharacteristicValue:(id)a3 error:(id)a4
{
  id v10 = a3;
  if (a4)
  {
    [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:a4];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    id v6 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    id v7 = [v6 readingCharacteristics];
    [v7 removeObject:v10];

    id v8 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    LODWORD(v7) = [v8 isComplete];

    if (v7) {
      [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
    }
    if (_isServiceInstanceIDCharacteristic(v10))
    {
      char v9 = [v10 service];
      [(_HAPAccessoryServerBTLE200 *)self _handleReadServiceInstanceId:v9];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_readCharacteristicValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  id v6 = [v5 readingCharacteristics];
  [v6 addObject:v4];

  id v7 = [v4 value];

  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)self _handleReadCharacteristicValue:v4 error:0];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    char v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      long long v16 = v11;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of characteristic: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v12 = [(HAPAccessoryServerBTLE *)v9 peripheral];
    [v12 readValueForCharacteristic:v4];
  }
  uint64_t v13 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  int v14 = [v13 isComplete];

  if (v14) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
}

- (void)_handleDiscoveredDescriptors:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if ([(id)objc_opt_class() isHAPDescriptor:v9]) {
          [(_HAPAccessoryServerBTLE200 *)self _readDescriptorValue:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_handleDiscoveredCharacteristic:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D944E080]();
  uint64_t v9 = self;
  long long v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = HMFGetLogIdentifier();
    long long v12 = [v6 descriptors];
    int v17 = 138544130;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Discovered descriptors: %@ for characteristic: %@ with error: %@", (uint8_t *)&v17, 0x2Au);
  }
  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)v9 _cancelDiscoveryWithError:v7];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)v9 _kickConnectionIdleTimer];
    if ([(_HAPAccessoryServerBTLE200 *)v9 isHAPCharacteristic:v6])
    {
      long long v13 = [v6 descriptors];
      [(_HAPAccessoryServerBTLE200 *)v9 _handleDiscoveredDescriptors:v13];
    }
    int v14 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
    uint64_t v15 = [v14 discoveringCharacteristics];
    [v15 removeObject:v6];

    long long v16 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
    LODWORD(v15) = [v16 isComplete];

    if (v15) {
      [(_HAPAccessoryServerBTLE200 *)v9 _readCharacteristicSignatures];
    }
  }
}

- (void)_discoverCharacteristic:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  id v6 = [v5 discoveringCharacteristics];
  [v6 addObject:v4];

  id v7 = (void *)MEMORY[0x1D944E080]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    long long v13 = v10;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Discovering characteristic: %@", (uint8_t *)&v12, 0x16u);
  }
  long long v11 = [(HAPAccessoryServerBTLE *)v8 peripheral];
  [v11 discoverDescriptorsForCharacteristic:v4];
}

- (void)_handleReadServiceInstanceId:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() isHAPService:v4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = objc_msgSend(v4, "characteristics", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((_isServiceInstanceIDCharacteristic(v10) & 1) == 0
            && [(_HAPAccessoryServerBTLE200 *)self isHAPCharacteristic:v10])
          {
            [(_HAPAccessoryServerBTLE200 *)self _discoverCharacteristic:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  long long v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  int v12 = [v11 discoveringServices];
  [v12 removeObject:v4];

  long long v13 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  LODWORD(v12) = [v13 isComplete];

  if (v12) {
    [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
  }
}

- (void)_handleDiscoveredCharacteristicsForService:(id)a3 error:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:v7];
  }
  else
  {
    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    if ([(id)objc_opt_class() isHAPService:v6]
      && ![(_HAPAccessoryServerBTLE200 *)self hasValidCache])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      int v12 = objc_msgSend(v6, "characteristics", 0);
      uint64_t v18 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v12);
            }
            id v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (_isServiceInstanceIDCharacteristic(v22))
            {
              [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicValue:v22];
              goto LABEL_8;
            }
          }
          uint64_t v19 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1D944E080]();
      uint64_t v9 = self;
      long long v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        long long v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v11;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Removing Service: %@ from discovery context", buf, 0x16u);
      }
      int v12 = [(_HAPAccessoryServerBTLE200 *)v9 discoveryContext];
      long long v13 = [v12 discoveringServices];
      [v13 removeObject:v6];
    }
LABEL_8:

    if (![(_HAPAccessoryServerBTLE200 *)self hasValidCache])
    {
      long long v14 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
      int v15 = [v14 isComplete];

      if (v15) {
        [(_HAPAccessoryServerBTLE200 *)self _readCharacteristicSignatures];
      }
    }
    if ([(_HAPAccessoryServerBTLE200 *)self hasValidCache])
    {
      long long v16 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
      int v17 = [v16 isComplete];

      if (v17) {
        [(_HAPAccessoryServerBTLE200 *)self _handleCompletedDiscovery];
      }
    }
  }
}

- (void)_discoverCharacteristicsForService:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    long long v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Discovering service: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [(_HAPAccessoryServerBTLE200 *)v6 discoveryContext];
  long long v10 = [v9 discoveringServices];
  [v10 addObject:v4];

  long long v11 = [(HAPAccessoryServerBTLE *)v6 peripheral];
  [v11 discoverCharacteristics:0 forService:v4];
}

- (void)_handleDiscoveredServices:(id)a3 error:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    [(_HAPAccessoryServerBTLE200 *)self _kickConnectionIdleTimer];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v6;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v7) {
      goto LABEL_27;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        if ([(id)objc_opt_class() isHAPService:v11])
        {
          int v12 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
          uint64_t v13 = [v12 discoveryType];

          if (v13 == 1)
          {
            __int16 v14 = [v11 UUID];
            id v15 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED3"];
            if ([v14 isEqual:v15])
            {

LABEL_26:
              -[_HAPAccessoryServerBTLE200 _discoverCharacteristicsForService:](self, "_discoverCharacteristicsForService:", v11, v28);
              goto LABEL_27;
            }
            uint64_t v16 = [v11 UUID];
            int v17 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"0000003E-0000-1000-8000-0026BB765291"];
            int v18 = [v16 isEqual:v17];

            if (v18) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v19 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
            uint64_t v20 = [v19 discoveryType];

            if (v20 != 2) {
              goto LABEL_18;
            }
            __int16 v21 = [v11 UUID];
            id v22 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
            if ([v21 isEqual:v22]) {
              goto LABEL_17;
            }
            long long v23 = [v11 UUID];
            long long v24 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000055-0000-1000-8000-0026BB765291"];
            if ([v23 isEqual:v24])
            {

LABEL_17:
LABEL_18:
              -[_HAPAccessoryServerBTLE200 _discoverCharacteristicsForService:](self, "_discoverCharacteristicsForService:", v11, v28);
              goto LABEL_19;
            }
            [v11 UUID];
            long long v25 = v29 = v23;
            long long v26 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"000000A2-0000-1000-8000-0026BB765291"];
            char v30 = [v25 isEqual:v26];

            if (v30) {
              goto LABEL_18;
            }
          }
        }
LABEL_19:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v8 = v27;
      if (!v27)
      {
LABEL_27:

        id v6 = v28;
        goto LABEL_28;
      }
    }
  }
  [(_HAPAccessoryServerBTLE200 *)self _cancelDiscoveryWithError:a4];
LABEL_28:
}

- (void)_discoverServices
{
  id v2 = [(HAPAccessoryServerBTLE *)self peripheral];
  [v2 discoverServices:0];
}

- (void)_cacheServices:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(_HAPAccessoryServerBTLE200 *)v6 accessoryCache];
    *(_DWORD *)buf = 138543618;
    long long v32 = v8;
    __int16 v33 = 2112;
    long long v34 = v9;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: current Cache : %@", buf, 0x16u);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    uint64_t v14 = 1;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = -[_HAPAccessoryServerBTLE200 _serviceCacheFromHAPService:serviceOrder:](v6, "_serviceCacheFromHAPService:serviceOrder:", *(void *)(*((void *)&v26 + 1) + 8 * v15), v14 + v15, (void)v26);
        int v17 = [(_HAPAccessoryServerBTLE200 *)v6 accessoryCache];
        [v17 updateWithService:v16];

        ++v15;
      }
      while (v12 != v15);
      v14 += v15;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  int64_t v18 = +[HAPBLEAccessoryCache currentDiscoveryVersion];
  uint64_t v19 = [(_HAPAccessoryServerBTLE200 *)v6 accessoryCache];
  [v19 setDiscoveryVersion:v18];

  uint64_t v20 = [(_HAPAccessoryServerBTLE200 *)v6 accessoryCache];
  [v20 save];

  __int16 v21 = (void *)MEMORY[0x1D944E080]([(_HAPAccessoryServerBTLE200 *)v6 setHasValidCache:1]);
  id v22 = v6;
  long long v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    long long v24 = HMFGetLogIdentifier();
    long long v25 = [(_HAPAccessoryServerBTLE200 *)v22 accessoryCache];
    *(_DWORD *)buf = 138543618;
    long long v32 = v24;
    __int16 v33 = 2112;
    long long v34 = v25;
    _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Saved Valid Cache : %@", buf, 0x16u);
  }
}

- (id)_serviceCacheFromHAPService:(id)a3 serviceOrder:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [HAPBLEServiceCache alloc];
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v8 = [v5 type];
  uint64_t v9 = (void *)[v7 initWithUUIDString:v8];
  id v10 = [v5 instanceID];
  uint64_t v11 = [v5 serviceProperties];
  uint64_t v12 = [v5 linkedServices];
  uint64_t v13 = [(HAPBLEServiceCache *)v6 initWithServiceUUID:v9 instanceId:v10 instanceOrder:a4 serviceProperties:v11 linkedServices:v12];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = v5;
  id obj = [v5 characteristics];
  uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        int64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v19 = [HAPBLECharacteristicCache alloc];
        id v20 = objc_alloc(MEMORY[0x1E4F29128]);
        __int16 v21 = [v18 type];
        id v22 = (void *)[v20 initWithUUIDString:v21];
        long long v23 = [v18 instanceID];
        uint64_t v24 = [v18 properties];
        long long v25 = [v18 accessoryMetadata];
        long long v26 = [(HAPBLECharacteristicCache *)v19 initWithCharacteristicUUID:v22 instanceId:v23 characteristicProperties:v24 characteristicMetadata:v25];

        [(HAPBLEServiceCache *)v13 updateWithCharacteristic:v26];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  return v13;
}

- (id)_hapServicesFromCache
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F1C000uLL;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  uint64_t v7 = [v6 discoveryType];

  if (v7 == 2)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v11 = @"00000055-0000-1000-8000-0026BB765291";
  }
  else
  {
    if (v7 != 1)
    {
      if (v7) {
        goto LABEL_10;
      }
      uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
      uint64_t v9 = [v8 cachedServices];
      [v4 addObjectsFromArray:v9];

      goto LABEL_9;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v11 = @"0000003E-0000-1000-8000-0026BB765291";
  }
  uint64_t v12 = (void *)[v10 initWithUUIDString:v11];
  uint64_t v8 = [(_HAPAccessoryServerBTLE200 *)self _getCachedService:v12];

  if (!v8) {
    goto LABEL_10;
  }
  [v4 addObject:v8];
LABEL_9:

LABEL_10:
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v13 = v4;
  uint64_t v63 = [v13 countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v63)
  {
    uint64_t v14 = *(void *)v80;
    unint64_t v15 = 0x1E4F1C000uLL;
    __int16 v66 = v13;
    v67 = v5;
    uint64_t v62 = *(void *)v80;
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v80 != v14) {
          objc_enumerationMutation(v13);
        }
        int v17 = *(void **)(*((void *)&v79 + 1) + 8 * v16);
        int64_t v18 = [v17 serviceUUID];
        uint64_t v19 = -[_HAPAccessoryServerBTLE200 _getCBService:instanceOrder:](self, "_getCBService:instanceOrder:", v18, [v17 serviceInstanceOrder]);

        if (!v19)
        {
          id v57 = (void *)MEMORY[0x1D944E080]();
          BOOL v58 = self;
          long long v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            uint64_t v60 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v85 = v60;
            __int16 v86 = 2114;
            long long v87 = v17;
            _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb service for %{public}@", buf, 0x16u);
          }
LABEL_34:

          id v51 = 0;
          goto LABEL_35;
        }
        uint64_t v65 = v16;
        id v20 = [*(id *)(v3 + 2632) array];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        uint64_t v64 = v17;
        id obj = [v17 cachedCharacteristics];
        __int16 v68 = v20;
        uint64_t v74 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
        if (v74)
        {
          uint64_t v73 = *(void *)v76;
          while (2)
          {
            for (uint64_t i = 0; i != v74; ++i)
            {
              if (*(void *)v76 != v73) {
                objc_enumerationMutation(obj);
              }
              id v22 = *(void **)(*((void *)&v75 + 1) + 8 * i);
              long long v23 = [v22 characteristicUUID];
              uint64_t v24 = [v22 characteristicInstanceId];
              long long v25 = [(_HAPAccessoryServerBTLE200 *)self _getCBCharacteristic:v23 instanceId:v24 service:v19];

              long long v26 = [(HAPAccessoryServer *)self primaryAccessory];
              long long v27 = [v22 characteristicInstanceId];
              long long v28 = [v26 characteristicWithInstanceID:v27];

              if (!v28)
              {
                __int16 v70 = [HAPCharacteristic alloc];
                unsigned int v71 = [v22 characteristicUUID];
                long long v29 = [v71 UUIDString];
                [v22 characteristicInstanceId];
                long long v30 = v72 = v25;
                long long v31 = [(HAPAccessoryServerBTLE *)self stateNumber];
                unint64_t v32 = v15;
                uint64_t v33 = [v22 characteristicProperties];
                [v22 characteristicMetadata];
                long long v34 = v19;
                v36 = uint64_t v35 = self;
                LOBYTE(v61) = 1;
                uint64_t v37 = v33;
                unint64_t v15 = v32;
                long long v28 = [(HAPCharacteristic *)v70 initWithType:v29 instanceID:v30 value:0 stateNumber:v31 properties:v37 eventNotificationsEnabled:0 implicitWriteWithResponse:v61 metadata:v36];

                self = v35;
                uint64_t v19 = v34;

                id v20 = v68;
                long long v25 = v72;

                if (!v28)
                {
                  BOOL v52 = (void *)MEMORY[0x1D944E080]();
                  char v53 = self;
                  v54 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v55 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v85 = v55;
                    __int16 v86 = 2114;
                    long long v87 = v22;
                    _os_log_impl(&dword_1D4758000, v54, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb characteristic for %{public}@", buf, 0x16u);
                  }

                  id v13 = v66;
                  id v5 = v67;
                  goto LABEL_34;
                }
              }
              uint64_t v38 = [*(id *)(v15 + 2504) distantPast];
              [(HAPCharacteristic *)v28 setValueUpdatedTime:v38];

              uint64_t v39 = [(HAPAccessoryServerBTLE *)self stateNumber];
              [(HAPCharacteristic *)v28 setStateNumber:v39];

              [(HAPCharacteristic *)v28 setCBCharacteristic:v25];
              [v20 addObject:v28];
            }
            uint64_t v74 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
            if (v74) {
              continue;
            }
            break;
          }
        }

        uint64_t v40 = [(HAPAccessoryServer *)self primaryAccessory];
        __int16 v41 = [v64 serviceInstanceId];
        id v42 = [v40 serviceWithInstanceID:v41];

        id v5 = v67;
        if (v42) {
          goto LABEL_27;
        }
        uint64_t v43 = [HAPService alloc];
        id v44 = [v64 serviceUUID];
        uint64_t v45 = [v44 UUIDString];
        __int16 v46 = [v64 serviceInstanceId];
        uint64_t v47 = [v64 serviceProperties];
        __int16 v48 = [v64 linkedServices];
        uint64_t v49 = v47;
        id v20 = v68;
        id v42 = [(HAPService *)v43 initWithType:v45 instanceID:v46 parsedCharacteristics:v68 serviceProperties:v49 linkedServices:v48];

        if (v42)
        {
LABEL_27:
          uint64_t v50 = [(HAPAccessoryServer *)self primaryAccessory];
          [(HAPService *)v42 setAccessory:v50];

          [(HAPService *)v42 setCBService:v19];
          [v67 addObject:v42];
        }
        id v13 = v66;
        uint64_t v16 = v65 + 1;
        uint64_t v14 = v62;
        unint64_t v3 = 0x1E4F1C000;
        unint64_t v15 = 0x1E4F1C000;
      }
      while (v65 + 1 != v63);
      uint64_t v63 = [v66 countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (v63) {
        continue;
      }
      break;
    }
  }

  id v51 = v5;
LABEL_35:

  return v51;
}

- (id)_getCachedService:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
  id v6 = [v5 cachedServices];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 serviceUUID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_getCBService:(id)a3 instanceOrder:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1BD68], "UUIDWithNSUUID:");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v33 = self;
  id v6 = [(HAPAccessoryServerBTLE *)self peripheral];
  id v7 = [v6 services];
  uint64_t v8 = (void *)[v7 copy];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        unsigned int v16 = [(id)objc_opt_class() isHAPService:v15];
        long long v17 = [v15 UUID];
        int v18 = [v17 isEqual:v5];

        if (v18)
        {
          id v19 = v15;

          id v11 = v19;
        }
        v12 += v16;
        id v20 = [v15 UUID];
        int v21 = [v20 isEqual:v5];

        if (v21) {
          BOOL v22 = v12 == a4;
        }
        else {
          BOOL v22 = 0;
        }
        if (v22)
        {
          id v23 = v15;

          uint64_t v24 = v30;
          goto LABEL_20;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }

  long long v25 = (void *)MEMORY[0x1D944E080]();
  long long v26 = v33;
  long long v27 = HMFGetOSLogHandle();
  uint64_t v24 = v30;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    long long v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = v28;
    __int16 v40 = 2114;
    id v41 = v11;
    __int16 v42 = 2114;
    id v43 = v30;
    __int16 v44 = 2050;
    unint64_t v45 = a4;
    _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: Returning first instance %{public}@ Service for : %{public}@/%{public}tu", buf, 0x2Au);
  }
  id v11 = v11;
  id v23 = v11;
LABEL_20:

  return v23;
}

- (id)_getCBCharacteristic:(id)a3 instanceId:(id)a4 service:(id)a5
{
  long long v25 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1BD68] UUIDWithNSUUID:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [v8 characteristics];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unsigned int v16 = objc_msgSend(v15, "UUID", v25);
        char v17 = [v16 isEqual:v9];

        if (v17)
        {
          id v23 = v15;

          int v21 = v26;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  int v18 = (void *)MEMORY[0x1D944E080]();
  id v19 = v25;
  id v20 = HMFGetOSLogHandle();
  int v21 = v26;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    BOOL v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    unint64_t v32 = v22;
    __int16 v33 = 2114;
    id v34 = v7;
    __int16 v35 = 2114;
    id v36 = v26;
    _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: NO CB Characteristic for : %{public}@/%{public}@", buf, 0x20u);
  }
  id v23 = 0;
LABEL_13:

  return v23;
}

- (void)_handleCompletedDiscovery
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];

  if (!v3) {
    return;
  }
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [(_HAPAccessoryServerBTLE200 *)v5 discoveryContext];
    *(_DWORD *)buf = 138543618;
    __int16 v112 = v7;
    __int16 v113 = 2050;
    uint64_t v114 = [v8 discoveryType];
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %{public}tu completed.", buf, 0x16u);
  }
  BOOL v9 = [(_HAPAccessoryServerBTLE200 *)v5 hasValidCache];
  uint64_t v10 = (void *)MEMORY[0x1D944E080]();
  long long v97 = v5;
  uint64_t v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      uint64_t v13 = HMFGetLogIdentifier();
      long long v14 = [(_HAPAccessoryServerBTLE200 *)v97 accessoryCache];
      long long v15 = [v14 peripheralInfo];
      *(_DWORD *)buf = 138543618;
      __int16 v112 = v13;
      __int16 v113 = 2114;
      uint64_t v114 = (uint64_t)v15;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Constructing attribute database from cache %{public}@", buf, 0x16u);
    }
    id v16 = [(_HAPAccessoryServerBTLE200 *)v97 _hapServicesFromCache];
    char v17 = (void *)MEMORY[0x1D944E080]();
    int v18 = v97;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v112 = v20;
      __int16 v113 = 2114;
      uint64_t v114 = (uint64_t)v16;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database with cached services: %{public}@", buf, 0x16u);
    }
    if (v16 && [v16 count])
    {
      int64_t v21 = +[HAPBLEAccessoryCache currentDiscoveryVersion];
      BOOL v22 = [(_HAPAccessoryServerBTLE200 *)v18 accessoryCache];
      [v22 setDiscoveryVersion:v21];

      id v23 = [(_HAPAccessoryServerBTLE200 *)v18 accessoryCache];
      [v23 save];
    }
    else
    {
      v109[0] = *MEMORY[0x1E4F28568];
      long long v78 = [NSString stringWithFormat:@"Failed att-db construction from cache"];
      v110[0] = v78;
      v109[1] = *MEMORY[0x1E4F28588];
      long long v79 = [MEMORY[0x1E4F28B50] mainBundle];
      long long v80 = [v79 localizedStringForKey:@"Unable to find matching CB service / characteristic" value:&stru_1F2C4E778 table:0];
      v110[1] = v80;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:2];

      long long v81 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6727 userInfo:v23];
      [(_HAPAccessoryServerBTLE200 *)v18 _cancelDiscoveryWithError:v81];
      long long v82 = [(HAPAccessoryServerBTLE *)v18 browser];
      v83 = [(_HAPAccessoryServerBTLE200 *)v18 accessoryCache];
      id v84 = [v83 pairingIdentifier];
      [v82 removeCachedAccessoryWithIdentifier:v84];

      v85 = (void *)MEMORY[0x1D944E080]([(_HAPAccessoryServerBTLE200 *)v18 setHasValidCache:0]);
      __int16 v86 = v18;
      long long v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        uint64_t v88 = HMFGetLogIdentifier();
        uint64_t v89 = [(_HAPAccessoryServerBTLE200 *)v86 accessoryCache];
        *(_DWORD *)buf = 138543618;
        __int16 v112 = v88;
        __int16 v113 = 2114;
        uint64_t v114 = (uint64_t)v89;
        _os_log_impl(&dword_1D4758000, v87, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Att-db mismatch removing the cached accessory: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v65 = [(HAPAccessoryServer *)v18 primaryAccessory];
    long long v90 = (void *)[v16 copy];
    [v65 setServices:v90];

    goto LABEL_54;
  }
  if (v12)
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v112 = v24;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting attribute database parsing", buf, 0xCu);
  }
  long long v25 = [(HAPAccessoryServerBTLE *)v97 peripheral];
  id v26 = [v25 services];
  long long v27 = (void *)[v26 copy];

  long long v28 = v97;
  __int16 v98 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v27, "count"));
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v16 = v27;
  uint64_t v29 = [v16 countByEnumeratingWithState:&v105 objects:v117 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    unint64_t v31 = 0x1E4F1B000uLL;
    uint64_t v32 = *(void *)v106;
    id v99 = v16;
    uint64_t v100 = *(void *)v106;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v106 != v32) {
          objc_enumerationMutation(v16);
        }
        id v34 = *(void **)(*((void *)&v105 + 1) + 8 * v33);
        if ([(id)objc_opt_class() isHAPService:v34])
        {
          __int16 v35 = [(_HAPAccessoryServerBTLE200 *)v28 discoveryContext];
          uint64_t v36 = [v35 discoveryType];

          if (v36 != 1)
          {
            __int16 v46 = [(_HAPAccessoryServerBTLE200 *)v28 discoveryContext];
            uint64_t v47 = [v46 discoveryType];

            if (v47 != 2) {
              goto LABEL_31;
            }
            long long v37 = [v34 UUID];
            uint64_t v38 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"FED4"];
            if ([v37 isEqual:v38]) {
              goto LABEL_30;
            }
            __int16 v48 = [v34 UUID];
            uint64_t v49 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"00000055-0000-1000-8000-0026BB765291"];
            if ([v48 isEqual:v49])
            {

              id v16 = v99;
LABEL_30:

LABEL_31:
              id v104 = 0;
              uint64_t v50 = [(_HAPAccessoryServerBTLE200 *)v28 _parseService:v34 error:&v104];
              id v51 = v104;
              if (v50)
              {
                BOOL v52 = [(HAPAccessoryServer *)v28 primaryAccessory];
                [v50 setAccessory:v52];

                [v98 addObject:v50];
                uint64_t v32 = v100;
              }
              else
              {
                char v53 = (void *)MEMORY[0x1D944E080]();
                v54 = v28;
                uint64_t v55 = HMFGetOSLogHandle();
                uint64_t v32 = v100;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  id v56 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  __int16 v112 = v56;
                  __int16 v113 = 2114;
                  uint64_t v114 = (uint64_t)v51;
                  _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse service with error: %{public}@", buf, 0x16u);
                }
                id v16 = v99;
              }
            }
            else
            {
              id v57 = [v34 UUID];
              BOOL v58 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"000000A2-0000-1000-8000-0026BB765291"];
              char v59 = [v57 isEqual:v58];

              long long v28 = v97;
              id v16 = v99;
              if (v59) {
                goto LABEL_31;
              }
              uint64_t v60 = (void *)MEMORY[0x1D944E080]();
              uint64_t v61 = v97;
              uint64_t v62 = HMFGetOSLogHandle();
              uint64_t v32 = v100;
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                uint64_t v63 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                __int16 v112 = v63;
                __int16 v113 = 2112;
                uint64_t v114 = (uint64_t)v34;
                _os_log_impl(&dword_1D4758000, v62, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Pairing discovery: %@", buf, 0x16u);
              }
            }
            unint64_t v31 = 0x1E4F1B000;
            goto LABEL_38;
          }
          long long v37 = [v34 UUID];
          uint64_t v38 = [*(id *)(v31 + 3432) UUIDWithString:@"FED3"];
          if ([v37 isEqual:v38]) {
            goto LABEL_30;
          }
          uint64_t v39 = [v34 UUID];
          __int16 v40 = [*(id *)(v31 + 3432) UUIDWithString:@"0000003E-0000-1000-8000-0026BB765291"];
          char v41 = [v39 isEqual:v40];

          id v16 = v99;
          if (v41) {
            goto LABEL_31;
          }
          __int16 v42 = (void *)MEMORY[0x1D944E080]();
          id v43 = v28;
          __int16 v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            unint64_t v45 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v112 = v45;
            __int16 v113 = 2112;
            uint64_t v114 = (uint64_t)v34;
            _os_log_impl(&dword_1D4758000, v44, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Identify discovery: %@", buf, 0x16u);
          }
          unint64_t v31 = 0x1E4F1B000;
          uint64_t v32 = v100;
        }
LABEL_38:
        ++v33;
      }
      while (v30 != v33);
      uint64_t v64 = [v16 countByEnumeratingWithState:&v105 objects:v117 count:16];
      uint64_t v30 = v64;
    }
    while (v64);
  }

  uint64_t v65 = v98;
  uint64_t v66 = [v98 count];
  v67 = (void *)MEMORY[0x1D944E080]();
  __int16 v68 = v28;
  v69 = HMFGetOSLogHandle();
  __int16 v70 = v69;
  if (!v66)
  {
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      __int16 v96 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v112 = v96;
      _os_log_impl(&dword_1D4758000, v70, OS_LOG_TYPE_ERROR, "%{public}@Attribute database parsing failed due to missing compatible services", buf, 0xCu);
    }
    id v91 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Peripheral missing services" reason:0 suggestion:0 underlyingError:0];
    goto LABEL_55;
  }
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    unsigned int v71 = HMFGetLogIdentifier();
    uint64_t v72 = [(_HAPAccessoryServerBTLE200 *)v68 discoveryContext];
    uint64_t v73 = [v72 discoveryType];
    *(_DWORD *)buf = 138543874;
    __int16 v112 = v71;
    __int16 v113 = 2114;
    uint64_t v114 = (uint64_t)v98;
    __int16 v115 = 2050;
    uint64_t v116 = v73;
    _os_log_impl(&dword_1D4758000, v70, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database parsing with parsed services: %{public}@, type: %{public}tu", buf, 0x20u);
  }
  uint64_t v74 = [(HAPAccessoryServer *)v68 primaryAccessory];
  long long v75 = (void *)[v98 copy];
  [v74 setServices:v75];

  long long v76 = [(_HAPAccessoryServerBTLE200 *)v68 discoveryContext];
  uint64_t v77 = [v76 discoveryType];

  if (!v77)
  {
    [(_HAPAccessoryServerBTLE200 *)v68 setVerified:1];
    [(_HAPAccessoryServerBTLE200 *)v68 _cacheServices:v98];
  }
LABEL_54:
  id v91 = 0;
  long long v28 = v97;
LABEL_55:

  [(_HAPAccessoryServerBTLE200 *)v28 discoveryContext];
  id v93 = v92 = v28;
  __int16 v94 = [v93 completionHandler];

  if (v94)
  {
    id v95 = [(HAPAccessoryServer *)v92 clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55___HAPAccessoryServerBTLE200__handleCompletedDiscovery__block_invoke;
    block[3] = &unk_1E69F3C68;
    id v103 = v94;
    id v102 = v91;
    dispatch_async(v95, block);
  }
  [(_HAPAccessoryServerBTLE200 *)v92 setDiscoveryContext:0];
}

- (void)_retryDiscovery
{
  unint64_t v3 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];

  if (v3)
  {
    id v4 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
    [v4 reset];

    [(_HAPAccessoryServerBTLE200 *)self setDiscoveryRetries:[(_HAPAccessoryServerBTLE200 *)self discoveryRetries] + 1];
    id v5 = [(_HAPAccessoryServerBTLE200 *)self pairVerifyOperationQueue];
    id v6 = [MEMORY[0x1E4F28C58] hapErrorWithCode:27];
    [v5 cancelAllOperationsWithError:v6];

    id v7 = [MEMORY[0x1E4F28C58] hapErrorWithCode:27];
    [(_HAPAccessoryServerBTLE200 *)self _cancelAllQueuedOperationsWithError:v7];

    [(_HAPAccessoryServerBTLE200 *)self _resumeAllOperations];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45___HAPAccessoryServerBTLE200__retryDiscovery__block_invoke;
    v8[3] = &unk_1E69F4330;
    v8[4] = self;
    __45___HAPAccessoryServerBTLE200__retryDiscovery__block_invoke((uint64_t)v8);
    [(_HAPAccessoryServerBTLE200 *)self setDiscoveryContext:0];
    [(_HAPAccessoryServerBTLE200 *)self discoverAccessoriesAndReadCharacteristicTypes:0];
  }
}

- (BOOL)_cancelDiscoveryWithError:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];

  if (!v5)
  {
LABEL_25:
    BOOL v30 = 0;
    goto LABEL_26;
  }
  id v6 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
  id v7 = [v6 lastKeyBagIdentityIndexFailingPV];
  if (v7)
  {
    id v8 = [(HAPAccessoryServer *)self keyBag];
    BOOL v9 = [(_HAPAccessoryServerBTLE200 *)self accessoryCache];
    uint64_t v10 = [v9 lastKeyBagIdentityIndexFailingPV];
    int v11 = objc_msgSend(v8, "isValidIndex:", objc_msgSend(v10, "integerValue") + 1);
  }
  else
  {
    int v11 = 0;
  }

  if ([(_HAPAccessoryServerBTLE200 *)self discoveryRetries] < 2) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  BOOL v13 = [(_HAPAccessoryServerBTLE200 *)self _shouldIgnoreRetryDiscoveryError:v4];
  long long v14 = (void *)MEMORY[0x1D944E080]();
  long long v15 = self;
  id v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v13 && v12)
  {
    if (v17)
    {
      int v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v44 = v18;
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v4;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring cancel discovery request due to BTLE sudden disconnection: %@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  if (v17)
  {
    id v19 = HMFGetLogIdentifier();
    id v20 = [(_HAPAccessoryServerBTLE200 *)v15 discoveryContext];
    *(_DWORD *)buf = 138543874;
    __int16 v44 = v19;
    __int16 v45 = 2050;
    uint64_t v46 = [v20 discoveryType];
    __int16 v47 = 2114;
    uint64_t v48 = (uint64_t)v4;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %{public}tu cancelled with error: %{public}@", buf, 0x20u);
  }
  if (!v4)
  {
    id v31 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Discovery failed." reason:@"Cancelled." suggestion:0 underlyingError:0];
LABEL_22:
    uint64_t v32 = v31;
    uint64_t v33 = [(_HAPAccessoryServerBTLE200 *)v15 discoveryContext];
    id v34 = [v33 completionHandler];

    if (v34)
    {
      __int16 v35 = [(HAPAccessoryServer *)v15 clientQueue];
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      uint64_t v39 = __56___HAPAccessoryServerBTLE200__cancelDiscoveryWithError___block_invoke;
      __int16 v40 = &unk_1E69F3C68;
      id v42 = v34;
      id v41 = v32;
      dispatch_async(v35, &v37);
    }
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](v15, "setDiscoveryContext:", 0, v37, v38, v39, v40);

    goto LABEL_25;
  }
  int64_t v21 = [v4 domain];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4F1BC80]] & v12;

  if (v22 != 1)
  {
    [(_HAPAccessoryServerBTLE200 *)v15 setHasValidCache:0];
    id v31 = v4;
    goto LABEL_22;
  }
  id v23 = (void *)MEMORY[0x1D944E080]();
  uint64_t v24 = v15;
  long long v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = HMFGetLogIdentifier();
    long long v27 = [(_HAPAccessoryServerBTLE200 *)v24 discoveryContext];
    uint64_t v28 = [v27 discoveryType];
    uint64_t v29 = [(_HAPAccessoryServerBTLE200 *)v24 discoveryRetries];
    *(_DWORD *)buf = 138544130;
    __int16 v44 = v26;
    __int16 v45 = 2048;
    uint64_t v46 = v28;
    __int16 v47 = 2048;
    uint64_t v48 = v29;
    __int16 v49 = 1024;
    int v50 = 2;
    _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_INFO, "%{public}@Reconnecting and restarting attribute database discovery type: %tu due to a connection error. Current retries, %tu, max retries, %d.", buf, 0x26u);
  }
  [(_HAPAccessoryServerBTLE200 *)v24 _retryDiscovery];
  BOOL v30 = 1;
LABEL_26:

  return v30;
}

- (void)_discoverWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke;
  v25[3] = &unk_1E69F1658;
  objc_copyWeak(v28, &location);
  id v8 = v7;
  id v26 = v8;
  v28[1] = (id)a3;
  id v9 = v6;
  id v27 = v9;
  uint64_t v10 = (void (**)(void, void))MEMORY[0x1D944E2D0](v25);
  int v11 = [(_HAPAccessoryServerBTLE200 *)self discoveryContext];
  int v12 = [v11 isDiscovering];

  if (v12)
  {
    BOOL v13 = (void *)MEMORY[0x1D944E080]();
    long long v14 = self;
    HMFGetOSLogHandle();
    long long v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v17 = NSNumber;
      int v18 = [(_HAPAccessoryServerBTLE200 *)v14 discoveryContext];
      id v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "discoveryType"));
      *(_DWORD *)buf = 138543618;
      id v31 = v16;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@The server already has a discovery in progress for type: %@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hapErrorWithCode:4];
    ((void (**)(void, _HAPBTLEDiscoveryContext *))v10)[2](v10, v20);
  }
  else
  {
    int64_t v21 = [[_HAPBTLEDiscoveryContext alloc] initWithDiscoveryType:a3];
    [(_HAPBTLEDiscoveryContext *)v21 setCompletionHandler:v10];
    [(_HAPBTLEDiscoveryContext *)v21 setDiscovering:1];
    [(_HAPAccessoryServerBTLE200 *)self setDiscoveryContext:v21];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66___HAPAccessoryServerBTLE200__discoverWithType_completionHandler___block_invoke_211;
    v22[3] = &unk_1E69F1680;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    id v20 = v21;
    id v23 = v20;
    [(_HAPAccessoryServerBTLE200 *)self connectWithCompletionHandler:v22];

    objc_destroyWeak(v24);
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

- (void)_readPendingDiscoveredCharacteristicTypesWithCompletion:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = (void (**)(void))a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [(_HAPAccessoryServerBTLE200 *)self discoveredAccessoryCharacteristicsPendingRead];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        int v11 = [v10 isEqualToString:@"00000023-0000-1000-8000-0026BB765291"];
        int v12 = [(HAPAccessoryServer *)self primaryAccessory];
        BOOL v13 = v12;
        if (!v11)
        {
          long long v15 = [v12 characteristicsOfType:v10];
          long long v14 = [v15 firstObject];

LABEL_10:
          if (!v14) {
            continue;
          }
          goto LABEL_11;
        }
        long long v14 = [v12 characteristicOfType:v10 serviceType:@"0000003E-0000-1000-8000-0026BB765291"];

        if (!v14)
        {
          BOOL v13 = [(HAPAccessoryServer *)self primaryAccessory];
          long long v14 = [v13 characteristicOfType:v10 serviceType:@"FED3"];
          goto LABEL_10;
        }
LABEL_11:
        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v7);
  }

  id v16 = [(_HAPAccessoryServerBTLE200 *)self discoveredAccessoryCharacteristicsPendingRead];
  [v16 removeAllObjects];

  if ([v4 count])
  {
    BOOL v17 = (void *)MEMORY[0x1D944E080]();
    int v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v43 = v20;
      __int16 v44 = 2112;
      __int16 v45 = v4;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Reading pending discovered characteristics with types: %@", buf, 0x16u);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    int64_t v21 = (void *)[v4 copy];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __86___HAPAccessoryServerBTLE200__readPendingDiscoveredCharacteristicTypesWithCompletion___block_invoke;
          v29[3] = &unk_1E69F3E48;
          id v30 = v4;
          uint64_t v31 = v26;
          __int16 v32 = v28;
          [(_HAPAccessoryServerBTLE200 *)v18 _readValueForCharacteristic:v26 options:1 completionHandler:v29];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v23);
    }

    id v27 = v28;
  }
  else
  {
    id v27 = v28;
    v28[2](v28);
  }
}

- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76___HAPAccessoryServerBTLE200_discoverAccessoriesAndReadCharacteristicTypes___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)discoverAccessories
{
}

- (void)_removePairingOfAccessoryServerCancelledMidPairing
{
  if ([(HAPAccessoryServer *)self pendingRemovePairing] == 1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke;
    v8[3] = &unk_1E69F4380;
    v8[4] = self;
    unint64_t v3 = (void *)MEMORY[0x1D944E2D0](v8);
    id v4 = [(HAPAccessoryServer *)self clientQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80___HAPAccessoryServerBTLE200__removePairingOfAccessoryServerCancelledMidPairing__block_invoke_191;
    v6[3] = &unk_1E69F15B8;
    id v7 = v3;
    id v5 = v3;
    [(_HAPAccessoryServerBTLE200 *)self removePairingForCurrentControllerOnQueue:v4 completion:v6 serverPairingCompletion:v5];
  }
}

- (id)_characteristicForCBCharacteristic:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 service];
  id v6 = [(_HAPAccessoryServerBTLE200 *)self _serviceForCBService:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v6, "characteristics", 0);
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = [v11 cbCharacteristic];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_serviceForCBService:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(HAPAccessoryServer *)self accessories];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = objc_msgSend(v8, "services", v19);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              long long v15 = [v14 cbService];
              char v16 = [v15 isEqual:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  id v4 = [(HAPAccessoryServer *)self delegate];
  if (v4)
  {
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    if (v5)
    {
      uint64_t v6 = [(HAPAccessoryServer *)self delegate];
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

- (void)_createPrimaryAccessoryFromAdvertisementData
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [HAPAccessory alloc];
  id v4 = [NSNumber numberWithUnsignedInteger:1];
  id v5 = [(HAPAccessory *)v3 initWithServer:self instanceID:v4];

  uint64_t v6 = [(HAPAccessoryServer *)self name];
  [(HAPAccessory *)v5 setName:v6];

  char v7 = [(HAPAccessoryServer *)self identifier];
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
  return 2;
}

- (void)setConnectionState:(int64_t)a3
{
  p_locuint64_t k = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_connectionState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)connectionState
{
  p_locuint64_t k = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  int64_t connectionState = self->_connectionState;
  os_unfair_lock_unlock(p_lock);
  return connectionState;
}

- (void)setHasBeenDiscovered:(BOOL)a3
{
  p_locuint64_t k = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_hasBeenDiscovered = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasBeenDiscovered
{
  id v2 = self;
  p_locuint64_t k = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasBeenDiscovered;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasValidCache:(BOOL)a3
{
  p_locuint64_t k = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_hasValidCache = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasValidCache
{
  id v2 = self;
  p_locuint64_t k = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasValidCache;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)description
{
  return (NSString *)[(_HAPAccessoryServerBTLE200 *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(_HAPAccessoryServerBTLE200 *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSString;
  uint64_t v6 = [(HAPAccessoryServerBTLE *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = &stru_1F2C4E778;
  }
  [(HAPAccessoryServer *)self hasPairings];
  id v8 = HMFBooleanToString();
  uint64_t v9 = [(HAPAccessoryServerBTLE *)self peripheral];
  uint64_t v10 = [v5 stringWithFormat:@"<%@%@, hasPairings = %@, Peripheral = %@>", v6, v7, v8, v9];

  if (v3) {

  }
  return v10;
}

- (void)dealloc
{
  BOOL v3 = [(HAPAccessoryServerBTLE *)self peripheral];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)_HAPAccessoryServerBTLE200;
  [(_HAPAccessoryServerBTLE200 *)&v4 dealloc];
}

- (void)_resetWithError:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  uint64_t v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v57 = v8;
    __int16 v58 = 2112;
    id v59 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting server with error: %@", buf, 0x16u);
  }
  [(HAPAccessoryServerBTLE *)v6 setNotifyingCharacteristicUpdated:0];
  id v9 = v4;
  uint64_t v10 = v9;
  if (!v9)
  {
    if ([(_HAPAccessoryServerBTLE200 *)v6 isPairing]
      && ([(_HAPAccessoryServerBTLE200 *)v6 pairingDisconnectionError],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      uint64_t v12 = [(_HAPAccessoryServerBTLE200 *)v6 pairingDisconnectionError];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2 description:@"Cancelled." reason:@"Resetting the server." suggestion:0 underlyingError:0];
    }
    uint64_t v10 = (void *)v12;
  }
  id v43 = v9;
  [(_HAPAccessoryServerBTLE200 *)v6 _cancelAllQueuedOperationsWithError:v10];
  [(_HAPAccessoryServerBTLE200 *)v6 _resumeAllOperations];
  char v13 = [(_HAPAccessoryServerBTLE200 *)v6 characteristicWriteCompletionHandlers];
  long long v14 = [v13 keyEnumerator];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  uint64_t v46 = v6;
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v20 = [(_HAPAccessoryServerBTLE200 *)v6 characteristicWriteCompletionHandlers];
        long long v21 = [v20 objectForKey:v19];

        if (v10)
        {
          long long v22 = (void *)MEMORY[0x1D944E080]();
          long long v23 = v6;
          long long v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            long long v25 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v57 = v25;
            __int16 v58 = 2114;
            id v59 = v19;
            __int16 v60 = 2114;
            uint64_t v61 = v10;
            _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Calling write completion handler for %{public}@ with error: %{public}@", buf, 0x20u);

            uint64_t v6 = v46;
          }
        }
        ((void (**)(void, void *))v21)[2](v21, v10);
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v16);
  }

  long long v26 = [(_HAPAccessoryServerBTLE200 *)v6 characteristicWriteCompletionHandlers];
  [v26 removeAllObjects];

  long long v27 = [(_HAPAccessoryServerBTLE200 *)v6 characteristicEnableEventCompletionHandlers];
  long long v28 = [v27 keyEnumerator];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obja = v28;
  uint64_t v29 = [obja countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(obja);
        }
        long long v33 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        long long v34 = [(_HAPAccessoryServerBTLE200 *)v6 characteristicEnableEventCompletionHandlers];
        long long v35 = [v34 objectForKey:v33];

        if (v10)
        {
          long long v36 = (void *)MEMORY[0x1D944E080]();
          long long v37 = v6;
          long long v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            long long v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v57 = v39;
            __int16 v58 = 2114;
            id v59 = v33;
            __int16 v60 = 2114;
            uint64_t v61 = v10;
            _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Calling enable event completion handler for %{public}@ with error: %{public}@", buf, 0x20u);

            uint64_t v6 = v46;
          }
        }
        ((void (**)(void, void *))v35)[2](v35, v10);
      }
      uint64_t v30 = [obja countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v30);
  }

  long long v40 = [(_HAPAccessoryServerBTLE200 *)v6 characteristicEnableEventCompletionHandlers];
  [v40 removeAllObjects];

  [(_HAPAccessoryServerBTLE200 *)v6 _invokeOperationsReceivedDuringConnectionStateChangeWithError:v10];
  [(_HAPAccessoryServerBTLE200 *)v6 _cancelDiscoveryWithError:v43];
  if ([(_HAPAccessoryServerBTLE200 *)v6 isPairing]) {
    [(_HAPAccessoryServerBTLE200 *)v6 _pairingCompletedWithError:v10];
  }
  id v41 = [(_HAPAccessoryServerBTLE200 *)v6 pairSetupSession];
  [(_HAPAccessoryServerBTLE200 *)v6 setPairSetupSession:0];
  [v41 stop];
  id v42 = [(_HAPAccessoryServerBTLE200 *)v6 securitySession];
  [(_HAPAccessoryServerBTLE200 *)v6 setSecuritySession:0];
  [v42 close];
  [(_HAPAccessoryServerBTLE200 *)v6 setDiscoveryRetries:0];
}

- (_HAPAccessoryServerBTLE200)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 stateChanged:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  BOOL v95 = a8;
  id v20 = a3;
  id v21 = a4;
  id v99 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  long long v27 = v22;
  id v28 = a14;
  id v29 = a15;
  v103.receiver = self;
  v103.super_class = (Class)_HAPAccessoryServerBTLE200;
  id v94 = a16;
  id v85 = v25;
  long long v97 = v25;
  uint64_t v30 = v23;
  uint64_t v31 = v99;
  __int16 v98 = v20;
  id v32 = v20;
  long long v33 = v21;
  long long v34 = [(HAPAccessoryServerBTLE *)&v103 initWithPeripheral:v32 name:v21 pairingUsername:v99 statusFlags:v22 stateNumber:v30 stateChanged:v95 connectReason:a9 configNumber:v24 category:v85 setupHash:v26 connectionIdleTime:a13 browser:v28 keyStore:v29 whbStableIdentifier:v94];
  if (!v34) {
    goto LABEL_13;
  }
  id v89 = v29;
  id v91 = v26;
  uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
  pendingRequests = v34->_pendingRequests;
  v34->_pendingRequests = (NSMutableArray *)v35;

  uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
  pendingResponses = v34->_pendingResponses;
  v34->_pendingResponses = (NSMutableArray *)v37;

  uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
  operationsReceivedDuringConnectionStateChange = v34->_operationsReceivedDuringConnectionStateChange;
  v34->_operationsReceivedDuringConnectionStateChange = (NSMutableArray *)v39;

  uint64_t v41 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  characteristicWriteCompletionHandlers = v34->_characteristicWriteCompletionHandlers;
  v34->_characteristicWriteCompletionHandlers = (NSMapTable *)v41;

  uint64_t v43 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  characteristicEnableEventCompletionHandlers = v34->_characteristicEnableEventCompletionHandlers;
  v34->_characteristicEnableEventCompletionHandlers = (NSMapTable *)v43;

  uint64_t v45 = [MEMORY[0x1E4F1CA80] set];
  discoveredAccessoryCharacteristicsPendingRead = v34->_discoveredAccessoryCharacteristicsPendingRead;
  v34->_discoveredAccessoryCharacteristicsPendingRead = (NSMutableSet *)v45;

  v34->_authenticated = 0;
  id v47 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  __int16 v96 = v28;
  long long v90 = v33;
  id v48 = v24;
  long long v49 = objc_msgSend(NSString, "stringWithFormat:", @"%s", HAPDispatchQueueName(v34, @"requestOperationQueue"));
  [v47 setName:v49];

  [v47 setMaxConcurrentOperationCount:1];
  [v47 setQualityOfService:25];
  __int16 v86 = v47;
  objc_storeStrong((id *)&v34->_requestOperationQueue, v47);
  id v50 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  long long v51 = v30;
  id v52 = v99;
  long long v53 = objc_msgSend(NSString, "stringWithFormat:", @"%s", HAPDispatchQueueName(v34, @"securitySessionOperationQueue"));
  [v50 setName:v53];

  [v50 setMaxConcurrentOperationCount:1];
  [v50 setQualityOfService:25];
  objc_storeStrong((id *)&v34->_pairVerifyOperationQueue, v50);
  uint64_t v54 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:15.0];
  connectionIdleTimer = v34->_connectionIdleTimer;
  v34->_connectionIdleTimer = (HMFTimer *)v54;

  [(HMFTimer *)v34->_connectionIdleTimer setDelegate:v34];
  id v56 = v34->_connectionIdleTimer;
  id v57 = [(HAPAccessoryServer *)v34 clientQueue];
  [(HMFTimer *)v56 setDelegateQueue:v57];

  __int16 v58 = [v98 cbPeripheral];
  [v58 setDelegate:v34];

  id v59 = [HAPBLEPeripheralInfo alloc];
  __int16 v60 = [v98 uniqueBTIdentifier];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v62 = [v98 name];
  id v92 = v48;
  id v84 = v48;
  long long v33 = v90;
  long long v87 = v51;
  uint64_t v88 = v27;
  uint64_t v63 = [(HAPBLEPeripheralInfo *)v59 initWithPeripheralInfo:v60 advertisedProtocolVersion:2 previousProtocolVersion:2 resumeSessionId:0 lastSeen:v27 statusFlags:v51 stateNumber:Current configNumber:v84 categoryIdentifier:v97 accessoryName:v62];

  uint64_t v64 = [v96 cachedAccessoryForIdentifier:v99];
  uint64_t v65 = [(HAPBLEAccessoryCache *)v64 metadataVersion];
  if (!v65) {
    goto LABEL_8;
  }
  uint64_t v66 = (void *)v65;
  v67 = [(HAPBLEAccessoryCache *)v64 cachedServices];
  uint64_t v68 = [v67 count];
  if (!v92 || !v68)
  {

    goto LABEL_8;
  }
  v69 = [(HAPBLEAccessoryCache *)v64 peripheralInfo];
  __int16 v70 = [v69 configNumber];
  char v71 = [v70 isEqual:v92];

  id v52 = v99;
  long long v33 = v90;
  if ((v71 & 1) == 0)
  {
LABEL_8:
    char v77 = 0;
    uint64_t v72 = v64;
    uint64_t v64 = [[HAPBLEAccessoryCache alloc] initWithPairingIdentifier:v52];
    goto LABEL_9;
  }
  uint64_t v72 = [(HAPBLEAccessoryCache *)v64 peripheralInfo];
  uint64_t v73 = [v72 broadcastKey];
  uint64_t v74 = [(HAPBLEAccessoryCache *)v64 peripheralInfo];
  long long v75 = [v74 keyUpdatedStateNumber];
  long long v76 = [(HAPBLEAccessoryCache *)v64 peripheralInfo];
  [v76 keyUpdatedTime];
  -[HAPBLEPeripheralInfo saveBroadcastKey:keyUpdatedStateNumber:updatedTime:](v63, "saveBroadcastKey:keyUpdatedStateNumber:updatedTime:", v73, v75);

  long long v33 = v90;
  char v77 = 1;
LABEL_9:

  [(HAPBLEAccessoryCache *)v64 updateWithPeripheralInfo:v63];
  v34->_hasValidCache = v77;
  objc_storeStrong((id *)&v34->_accessoryCache, v64);
  long long v78 = [(HAPBLEAccessoryCache *)v64 peripheralInfo];
  uint64_t v79 = [v78 accessoryName];
  long long v80 = (void *)v79;
  if (v79) {
    long long v81 = (void *)v79;
  }
  else {
    long long v81 = v33;
  }
  objc_storeStrong((id *)&v34->super.super._name, v81);

  long long v82 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithMajorVersion:2 minorVersion:0 updateVersion:0];
  [(HAPAccessoryServer *)v34 setVersion:v82];

  objc_initWeak(&location, v34);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __209___HAPAccessoryServerBTLE200_initWithPeripheral_name_pairingUsername_statusFlags_stateNumber_stateChanged_connectReason_configNumber_category_setupHash_connectionIdleTime_browser_keyStore_whbStableIdentifier___block_invoke;
  v100[3] = &unk_1E69F4658;
  objc_copyWeak(&v101, &location);
  [(HAPBLEAccessoryCache *)v64 updateWithSaveBlock:v100];
  id v26 = v91;
  [(_HAPAccessoryServerBTLE200 *)v34 _createPrimaryAccessoryFromAdvertisementData];
  id v24 = v92;
  id v29 = v89;
  objc_destroyWeak(&v101);
  objc_destroyWeak(&location);

  uint64_t v31 = v99;
  uint64_t v30 = v87;
  long long v27 = v88;
  id v28 = v96;
LABEL_13:

  return v34;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t332 != -1) {
    dispatch_once(&logCategory__hmf_once_t332, &__block_literal_global_1020);
  }
  id v2 = (void *)logCategory__hmf_once_v333;

  return v2;
}

+ (BOOL)parseCharacteristicConfigurationResponse:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 body];
  [v7 bytes];

  id v8 = [v6 body];
  [v8 length];

  id v9 = [v6 request];
  int v10 = [v9 type];

  if (v10 != 7)
  {
    uint64_t v12 = 0;
    id v13 = 0;
    goto LABEL_16;
  }
  BOOL v11 = 1;
  if (TLV8GetOrCopyCoalesced()
    || ([MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0],
        (long long v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v12 = 0;
    id v13 = 0;
    goto LABEL_17;
  }
  if (TLV8GetOrCopyCoalesced())
  {
    uint64_t v12 = v14;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];

    if (v12)
    {
      uint64_t v15 = (void *)MEMORY[0x1D944E080](0);
      id v16 = a1;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        long long v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v23 = v18;
        __int16 v24 = 1024;
        int v25 = 0;
        __int16 v26 = 1024;
        int v27 = 0;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Parsed configuration response properties: %0xX, Interval: %d", buf, 0x18u);
      }
    }
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  id v20 = [MEMORY[0x1E4F28C58] errorWithOSStatus:4294960591];
  id v13 = [v19 hapErrorWithCode:12 description:@"Configuration response failed." reason:@"Failed to parse configuration response body." suggestion:0 underlyingError:v20];

  if (!v13)
  {
LABEL_16:
    BOOL v11 = 1;
    goto LABEL_17;
  }
  if (a4)
  {
    id v13 = v13;
    BOOL v11 = 0;
    *a4 = v13;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

+ (id)configurationRequestForCharacteristic:(id)a3 isBroadcasted:(BOOL)a4 interval:(unint64_t)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  TLV8BufferInit();
  uint64_t v9 = TLV8BufferAppend();
  if (v9 || v7 && (uint64_t v9 = TLV8BufferAppend(), v9))
  {
    uint64_t v10 = v9;
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
    if (v12) {
      BOOL v11 = (void *)v12;
    }
    else {
      BOOL v11 = 0;
    }
    if (v12) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 4294960568;
    }
  }
  TLV8BufferFree();
  if (a6 && v10)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    long long v14 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v10];
    *a6 = [v13 hapErrorWithCode:1 description:@"Characteristic configuration failed." reason:@"Failed to create characteristic configuration request body." suggestion:0 underlyingError:v14];
  }
  uint64_t v15 = [[HAPBTLERequest alloc] initWithCharacteristic:v8 requestType:7 bodyData:v11 shouldEncrypt:1 timeoutInterval:10.0];

  return v15;
}

+ (BOOL)parseProtocolConfigurationResponse:(id)a3 key:(id *)a4 stateNumber:(id *)a5 error:(id *)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [v9 body];
  [v10 bytes];

  BOOL v11 = [v9 body];
  [v11 length];

  uint64_t v43 = 0;
  uint64_t v44 = 0;
  id v42 = 0;
  unsigned __int16 v41 = 0;
  unsigned __int8 v40 = 0;
  __int16 v39 = 0;
  int __s = 0;
  uint64_t v12 = [v9 request];
  int v13 = [v12 type];

  if (v13 == 8)
  {
    long long v14 = 0;
    if (!TLV8GetOrCopyCoalesced())
    {
      long long v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:v43];
    }
    if (TLV8GetOrCopyCoalesced())
    {
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:v43];

      if (v42)
      {
        free(v42);
        id v42 = 0;
      }
      if (v43 == 1) {
        objc_msgSend(v15, "getBytes:range:", &v40, 0, 1);
      }
    }
    if (TLV8GetOrCopyCoalesced())
    {
      id v16 = v15;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:v43];

      if (v42)
      {
        free(v42);
        id v42 = 0;
      }
      memset_s(&__s, 6uLL, 0, 6uLL);
      if (v43 == 6) {
        objc_msgSend(v16, "getBytes:range:", &__s, 0, 6);
      }
    }
    if (TLV8GetOrCopyCoalesced()) {
      goto LABEL_17;
    }
    uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:v43];

    if (v42)
    {
      free(v42);
      id v42 = 0;
    }
    if (v19)
    {
      memset_s(v61, 0x20uLL, 0, 0x20uLL);
      uint64_t v20 = v43;
      if (v43 == 32)
      {
        objc_msgSend(v19, "getBytes:range:", v61, 0, 32);
        [MEMORY[0x1E4F1C9B8] dataWithBytes:v61 length:32];
        uint64_t v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v21 = 4294960591;
      }
      id v22 = (void *)MEMORY[0x1D944E080]();
      id v23 = a1;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        int v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138545410;
        uint64_t v46 = v25;
        __int16 v47 = 1024;
        *(_DWORD *)id v48 = v41;
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = v40;
        __int16 v49 = 1024;
        int v50 = __s;
        __int16 v51 = 1024;
        int v52 = BYTE1(__s);
        __int16 v53 = 1024;
        int v54 = BYTE2(__s);
        __int16 v55 = 1024;
        int v56 = HIBYTE(__s);
        __int16 v57 = 1024;
        int v58 = v39;
        __int16 v59 = 1024;
        int v60 = HIBYTE(v39);
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Parsed protocol configuration response GSN: %d, C#: %d, advId: %02X:%02X:%02X:%02X:%02X:%02X", buf, 0x3Cu);
      }
      __int16 v26 = (void *)MEMORY[0x1D944E080]();
      id v27 = v23;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id v29 = HMFGetLogIdentifier();
        uint64_t v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v61 length:32];
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v29;
        __int16 v47 = 2112;
        *(void *)id v48 = v30;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Broadcast Key: %@", buf, 0x16u);
      }
      if (v20 == 32)
      {
        id v17 = 0;
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
        id v32 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v21];
        id v17 = [v31 hapErrorWithCode:12 description:@"Configuration response failed." reason:@"Failed to parse configuration response body." suggestion:0 underlyingError:v32];

        if (v17)
        {
          long long v33 = (void *)MEMORY[0x1D944E080]();
          id v34 = v27;
          uint64_t v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            long long v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v46 = v36;
            __int16 v47 = 2112;
            *(void *)id v48 = v17;
            _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Failed parsing protocol configuration response with error: %@", buf, 0x16u);
          }
          if (a6)
          {
            id v17 = v17;
            BOOL v18 = 0;
            *a6 = v17;
          }
          else
          {
            BOOL v18 = 0;
          }
          goto LABEL_36;
        }
      }
      BOOL v18 = 1;
LABEL_36:
      id v16 = v19;
      goto LABEL_37;
    }
  }
  id v16 = 0;
LABEL_17:
  id v17 = 0;
  BOOL v18 = 1;
LABEL_37:

  return v18;
}

+ (id)configurationRequestForService:(id)a3 configRequestType:(unsigned __int8)a4 error:(id *)a5
{
  int v6 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  TLV8BufferInit();
  if (v6 != 2 && (uint64_t v8 = TLV8BufferAppend(), v8) || (uint64_t v8 = TLV8BufferAppend(), v8))
  {
    uint64_t v9 = v8;
    id v10 = 0;
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v29);
    if (v10) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 4294960568;
    }
  }
  TLV8BufferFree();
  if (a5 && v9)
  {
    BOOL v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v9];
    *a5 = [v11 hapErrorWithCode:12 description:@"Protocol configuration failed" reason:@"Failed to create protocol configuration body" suggestion:0 underlyingError:v12];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v13 = objc_msgSend(v7, "characteristics", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v14)
  {
LABEL_21:

    goto LABEL_24;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v25;
LABEL_12:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v25 != v16) {
      objc_enumerationMutation(v13);
    }
    BOOL v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
    uint64_t v19 = [v18 cbCharacteristic];
    if (!_isServiceSignatureCharacteristic(v19))
    {

      goto LABEL_19;
    }
    char v20 = [v7 serviceProperties];

    if ((v20 & 4) != 0) {
      break;
    }
LABEL_19:
    if (v15 == ++v17)
    {
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  id v21 = v18;

  if (v21)
  {
    id v22 = [[HAPBTLERequest alloc] initWithCharacteristic:v21 requestType:8 bodyData:v10 shouldEncrypt:1 timeoutInterval:10.0];

    goto LABEL_27;
  }
LABEL_24:
  if (a5)
  {
    [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Protocol configuration request create failed" reason:@"Service is missing service signature characteristic or support for configuration" suggestion:0 underlyingError:0];
    id v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }
LABEL_27:

  return v22;
}

+ (BOOL)parseWriteResponse:(id)a3 value:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 request];
  int v10 = [v9 type];

  if (v10 == 5 || v10 == 2)
  {
    uint64_t v12 = [v8 body];
    id v28 = 0;
    int v13 = [a1 extractSerializedRequestValueFromBodyData:v12 error:&v28];
    id v14 = v28;

    if (v13)
    {
      uint64_t v15 = [v8 request];
      uint64_t v16 = [v15 characteristic];
      uint64_t v17 = [v16 metadata];
      BOOL v18 = [v17 format];
      uint64_t v19 = HAPCharacteristicFormatFromString(v18);

      char v20 = +[HAPDataValueTransformer defaultDataValueTransformer];
      id v27 = v14;
      id v21 = [v20 reverseTransformedValue:v13 format:v19 error:&v27];
      id v22 = v27;

      id v14 = v22;
      goto LABEL_9;
    }
    if (v14)
    {
      int v13 = 0;
      id v21 = 0;
      if (a5) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
    uint64_t v23 = 4294960559;
  }
  else
  {
    uint64_t v23 = 4294960591;
  }
  long long v24 = (void *)MEMORY[0x1E4F28C58];
  char v20 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v23];
  id v14 = [v24 hapErrorWithCode:12 description:@"Write failed." reason:@"Failed to parse write request body." suggestion:0 underlyingError:v20];
  id v21 = 0;
  int v13 = 0;
LABEL_9:

  if (v14)
  {
    if (a5)
    {
LABEL_11:
      id v14 = v14;
      BOOL v25 = 0;
      *a5 = v14;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v25 = 0;
    goto LABEL_19;
  }
  if (a4)
  {
    id v21 = v21;
    id v14 = 0;
    *a4 = v21;
  }
  else
  {
    id v14 = 0;
  }
  BOOL v25 = 1;
LABEL_19:

  return v25;
}

+ (id)executeWriteRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (([v8 properties] & 4) != 0)
  {
    id v14 = [[HAPBTLERequest alloc] initWithCharacteristic:v8 requestType:5 bodyData:0 shouldEncrypt:v6 & 1 timeoutInterval:10.0];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = a1;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = [v8 shortDescription];
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:11];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (([v14 properties] & 4) != 0)
  {
    long long v24 = [v14 metadata];
    BOOL v25 = [v24 format];
    uint64_t v26 = HAPCharacteristicFormatFromString(v25);

    id v27 = _createCharacteristicWriteBody(v15, v26, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 2.5);
    if (v27) {
      uint64_t v23 = [[HAPBTLERequest alloc] initWithCharacteristic:v14 requestType:4 bodyData:v27 shouldEncrypt:a7 & 1 timeoutInterval:2.5];
    }
    else {
      uint64_t v23 = 0;
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = a1;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v14 shortDescription];
      int v29 = 138543618;
      long long v30 = v21;
      __int16 v31 = 2114;
      long long v32 = v22;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %{public}@", (uint8_t *)&v29, 0x16u);
    }
    if (a8)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:10];
      uint64_t v23 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = 0;
    }
  }

  return v23;
}

+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (([v14 properties] & 4) != 0)
  {
    long long v24 = [v14 metadata];
    BOOL v25 = [v24 format];
    uint64_t v26 = HAPCharacteristicFormatFromString(v25);

    id v27 = _createCharacteristicWriteBody(v15, v26, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 0.0);
    if (v27)
    {
      if ((a7 & 8) != 0) {
        double v28 = 60.0;
      }
      else {
        double v28 = 10.0;
      }
      uint64_t v23 = [[HAPBTLERequest alloc] initWithCharacteristic:v14 requestType:2 bodyData:v27 shouldEncrypt:a7 & 1 timeoutInterval:v28];
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = a1;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v14 shortDescription];
      int v30 = 138543618;
      __int16 v31 = v21;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %{public}@", (uint8_t *)&v30, 0x16u);
    }
    if (a8)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:10];
      uint64_t v23 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = 0;
    }
  }

  return v23;
}

+ (id)extractNotificationContextFromBodyData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  uint64_t v6 = TLV8GetOrCopyCoalesced();
  if (v6)
  {
    id v7 = 0;
    if (a4 && v6 != -6727)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v6];
      *a4 = [v8 hapErrorWithCode:12 description:@"Parse failed." reason:@"Failed to parse notification context." suggestion:0 underlyingError:v9];

      id v7 = 0;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
  }

  return v7;
}

+ (id)extractSerializedRequestValueFromBodyData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  uint64_t v6 = TLV8GetOrCopyCoalesced();
  if (v6)
  {
    if (a4)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      id v8 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v6];
      *a4 = [v7 hapErrorWithCode:12 description:@"Parse failed." reason:@"Failed to parse request body." suggestion:0 underlyingError:v8];

      a4 = 0;
    }
  }
  else
  {
    a4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
  }

  return a4;
}

+ (BOOL)parseReadResponse:(id)a3 value:(id *)a4 notificationContext:(id *)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [v9 request];
  int v11 = [v10 type];

  long long v41 = a5;
  if (v11 != 3)
  {
    uint64_t v36 = 4294960591;
    goto LABEL_25;
  }
  int v12 = [v9 statusCode];
  uint64_t v13 = 3;
  switch(v12)
  {
    case 0:
      goto LABEL_10;
    case 1:
    case 6:
      break;
    case 2:
      uint64_t v13 = 5;
      break;
    case 3:
      uint64_t v13 = 16;
      break;
    case 4:
      uint64_t v13 = 9;
      break;
    case 5:
      uint64_t v13 = 17;
      break;
    case 8:
      uint64_t v13 = 31;
      break;
    default:
      uint64_t v13 = 1;
      break;
  }
  uint64_t v14 = [MEMORY[0x1E4F28C58] hapErrorWithCode:v13];
  if (v14)
  {
    id v17 = (id)v14;
    goto LABEL_22;
  }
LABEL_10:
  id v15 = objc_msgSend(v9, "body", v13);
  id v44 = 0;
  id v16 = [a1 extractSerializedRequestValueFromBodyData:v15 error:&v44];
  id v17 = v44;

  if (!v16)
  {
    if (v17)
    {
LABEL_22:
      long long v24 = 0;
      id v29 = 0;
      id v16 = 0;
      goto LABEL_17;
    }
    uint64_t v36 = 4294960559;
LABEL_25:
    long long v37 = (void *)MEMORY[0x1E4F28C58];
    long long v38 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v36];
    id v17 = [v37 hapErrorWithCode:1 description:@"Read failed." reason:@"Failed to parse read request body." suggestion:0 underlyingError:v38];

    id v16 = 0;
    id v29 = 0;
    long long v24 = 0;
    if (!v17) {
      goto LABEL_26;
    }
LABEL_17:
    if (a6)
    {
      id v17 = v17;
      BOOL v35 = 0;
      *a6 = v17;
    }
    else
    {
      BOOL v35 = 0;
    }
    goto LABEL_32;
  }
  __int16 v18 = [v9 request];
  id v19 = [v18 characteristic];
  uint64_t v20 = [v19 metadata];
  id v21 = [v20 format];
  uint64_t v22 = HAPCharacteristicFormatFromString(v21);

  uint64_t v23 = +[HAPDataValueTransformer defaultDataValueTransformer];
  id v43 = v17;
  long long v24 = [v23 reverseTransformedValue:v16 format:v22 error:&v43];
  id v25 = v43;

  if (v25)
  {
    id v29 = 0;
    id v17 = v25;
    goto LABEL_17;
  }
  uint64_t v26 = [v9 request];
  id v27 = [v26 characteristic];
  __int16 v28 = [v27 properties];

  if ((v28 & 0x100) != 0)
  {
    int v30 = [v9 body];
    id v42 = 0;
    id v29 = [a1 extractNotificationContextFromBodyData:v30 error:&v42];
    id v17 = v42;

    __int16 v31 = (void *)MEMORY[0x1D944E080]();
    id v32 = a1;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v46 = v34;
      __int16 v47 = 2114;
      id v48 = v29;
      __int16 v49 = 2114;
      id v50 = v17;
      _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_INFO, "%{public}@Parsed read response notification context: %{public}@ with error: %{public}@", buf, 0x20u);
    }
    if (!v17) {
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  id v29 = 0;
LABEL_26:
  if (a4) {
    *a4 = v24;
  }
  if (v29)
  {
    id v29 = v29;
    id v17 = 0;
    *long long v41 = v29;
  }
  else
  {
    id v17 = 0;
  }
  BOOL v35 = 1;
LABEL_32:

  return v35;
}

+ (id)readRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (([v7 properties] & 2) != 0)
  {
    int v12 = [[HAPBTLERequest alloc] initWithCharacteristic:v7 requestType:3 bodyData:0 shouldEncrypt:v6 & 1 timeoutInterval:10.0];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = [v7 shortDescription];
      int v14 = 138543618;
      id v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Read failed, characteristic does not support secured reads: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:11];
      int v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)isHAPDescriptor:(id)a3
{
  BOOL v3 = [a3 UUID];
  id v4 = [MEMORY[0x1E4F1BD68] UUIDWithString:@"DC46F0FE-81D2-4616-B5D9-6ABDD796939A"];
  char v5 = [v3 isEqual:v4];

  return v5;
}

+ (BOOL)isHAPService:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 UUID];
  char v5 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCF8]];
  if ([v4 isEqual:v5]) {
    goto LABEL_10;
  }
  char v6 = [v3 UUID];
  id v7 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BD00]];
  if ([v6 isEqual:v7])
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  id v8 = [v3 UUID];
  id v9 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCE8]];
  if ([v8 isEqual:v9])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v10 = [v3 UUID];
  int v11 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCC0]];
  if ([v10 isEqual:v11])
  {

    goto LABEL_8;
  }
  uint64_t v33 = v11;
  uint64_t v34 = v10;
  int v12 = [v3 UUID];
  uint64_t v13 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCB8]];
  if ([v12 isEqual:v13])
  {

    goto LABEL_8;
  }
  id v32 = v13;
  __int16 v16 = [v3 UUID];
  int v30 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCB0]];
  __int16 v31 = v16;
  if (objc_msgSend(v16, "isEqual:"))
  {
    char v17 = 1;
    uint64_t v18 = v32;
  }
  else
  {
    id v19 = [v3 UUID];
    __int16 v28 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCF0]];
    id v29 = v19;
    if (objc_msgSend(v19, "isEqual:"))
    {
      char v17 = 1;
    }
    else
    {
      id v27 = [v3 UUID];
      uint64_t v20 = [MEMORY[0x1E4F1BD68] UUIDWithString:*MEMORY[0x1E4F1BCC8]];
      char v17 = objc_msgSend(v27, "isEqual:");
    }
    uint64_t v18 = v32;
  }
  if (v17) {
    goto LABEL_12;
  }
  id v21 = [v3 characteristics];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
LABEL_32:
    BOOL v14 = 1;
    goto LABEL_13;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = [v3 characteristics];
  uint64_t v23 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v4);
        }
        if (_isServiceInstanceIDCharacteristic(*(void **)(*((void *)&v35 + 1) + 8 * i)))
        {

          goto LABEL_32;
        }
      }
      uint64_t v24 = [v4 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_11:

LABEL_12:
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

+ (id)parseServiceSignatureResponse:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 body];
  [v12 bytes];

  uint64_t v13 = [v9 body];
  [v13 length];

  uint64_t v27 = 0;
  uint64_t v28 = 0;
  v26[1] = 0;
  BOOL v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [v9 request];
  int v16 = [v15 type];

  if (v16 == 6)
  {
    uint64_t v17 = 0;
    if (!TLV8GetOrCopyCoalesced())
    {
      uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v28 length:v27];
      if (!v17)
      {
        id v18 = 0;
LABEL_29:
        id v20 = 0;
        uint64_t v21 = 4294960559;
        goto LABEL_13;
      }
      id v18 = (id)v17;
      if ((unint64_t)[v18 length] <= 1)
      {
        id v22 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"The service properties value is missing." reason:0 suggestion:0 underlyingError:0];

        id v20 = v22;
        uint64_t v17 = 0;
        uint64_t v21 = 0;
LABEL_13:

        goto LABEL_14;
      }
      __int16 v29 = 0;
      [v18 getBytes:&v29 length:2];
      uint64_t v17 = v29 & 7;
    }
    uint64_t v19 = TLV8GetOrCopyCoalesced();
    id v20 = 0;
    if (v19 == -6727)
    {
LABEL_22:
      uint64_t v24 = -[HAPBTLEServiceSignature initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:]([HAPBTLEServiceSignature alloc], "initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:", v11, v10, v17, v14, [v9 isEncrypted]);
      goto LABEL_24;
    }
    uint64_t v21 = v19;
    if (v19)
    {
LABEL_14:
      if (v20) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
    id v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v28 length:v27];
    if (v18)
    {
      if (![v18 length])
      {
        id v20 = 0;
        goto LABEL_18;
      }
      v26[0] = 0;
      uint64_t v21 = _parseLinkedServices(v18, v14, v26);
      id v20 = v26[0];
      if (v21)
      {
        [v14 removeObject:v10];
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    goto LABEL_29;
  }
  uint64_t v17 = 0;
  id v20 = 0;
  uint64_t v21 = 4294960591;
LABEL_15:
  if (!v21) {
    goto LABEL_19;
  }
  uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
  id v18 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v21];
  id v20 = [v23 hapErrorWithCode:12 description:@"Service Signature response failed." reason:@"Failed to parse service signature response body." suggestion:0 underlyingError:v18];
LABEL_18:

LABEL_19:
  if (!v20) {
    goto LABEL_22;
  }
  if (a6)
  {
    id v20 = v20;
    uint64_t v24 = 0;
    *a6 = v20;
  }
  else
  {
    uint64_t v24 = 0;
  }
LABEL_24:

  return v24;
}

+ (id)parseSignatureResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 body];
  [v6 bytes];

  id v7 = [v5 body];
  [v7 length];

  id v8 = [v5 request];
  int v9 = [v8 type];

  if (v9 == 1) {
    TLV8GetOrCopyCoalesced();
  }
  id v10 = (void *)MEMORY[0x1E4F28C58];
  id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithOSStatus:");
  id v12 = [v10 hapErrorWithCode:12 description:@"Signature request failed." reason:@"Failed to parse signature response body." suggestion:0 underlyingError:v11];

  if (v12)
  {
    uint64_t v13 = 0;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    uint64_t v13 = -[HAPBTLECharacteristicSignature initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:]([HAPBTLECharacteristicSignature alloc], "initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:", 0, 0, 0, 0, 0, [v5 isEncrypted]);
  }

  return v13;
}

+ (id)signatureRequestForService:(id)a3 characteristic:(id)a4 requiresAuthentication:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v7 = a4;
  id v8 = [[HAPBTLERequest alloc] initWithCharacteristic:v7 requestType:6 bodyData:0 shouldEncrypt:v6 timeoutInterval:10.0];

  return v8;
}

+ (id)signatureRequestForCharacteristic:(id)a3 requiresAuthentication:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  id v7 = [[HAPBTLERequest alloc] initWithCharacteristic:v6 requestType:1 bodyData:0 shouldEncrypt:v5 timeoutInterval:10.0];

  return v7;
}

@end