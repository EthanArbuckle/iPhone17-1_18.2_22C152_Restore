@interface HAPAccessoryServerIP
+ (id)_parseSerializedAccessoryDictionary:(id)a3 server:(id)a4;
+ (id)logCategory;
+ (id)sharedPairOperationQueue;
+ (void)initialize;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_handleSecureSessionClosingWithError:(id *)a3 status:(int)a4 data:(id)a5;
- (BOOL)_isSessionEstablished;
- (BOOL)_matchesError:(id)a3 withHAPErrorCode:(int64_t)a4;
- (BOOL)_matchesError:(id)a3 withHAPHMErrorCode:(int64_t)a4;
- (BOOL)_parseAndValidateTXTRecord;
- (BOOL)_parseTXTRecordDictionary:(id)a3;
- (BOOL)_processEvent:(id)a3 matchedCharacteristic:(id *)a4;
- (BOOL)_shouldConnectBasedOnDisconnectOnIdle;
- (BOOL)_shouldNotifyClientsOfPVFailure:(id)a3;
- (BOOL)_updateAccessories:(id)a3;
- (BOOL)_validateAuthChallengeResponse:(id)a3 expectedTID:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)_validateProtocolInfo:(id)a3;
- (BOOL)authenticated;
- (BOOL)econnresetRetryInProgress;
- (BOOL)hasAttributeDatabase;
- (BOOL)hasBonjourDeviceInfo;
- (BOOL)hasStartedPairing;
- (BOOL)hasUpdatedBonjour;
- (BOOL)invalidated;
- (BOOL)isBonjourDiscoveryPending;
- (BOOL)isContinuingLegacyWACpairing;
- (BOOL)isEstablishingSecureConnection;
- (BOOL)isHandlingInvalidSetupCode;
- (BOOL)isPaired;
- (BOOL)isPairingRequestPending;
- (BOOL)isPostSoftAuthWacStarted;
- (BOOL)isPreSoftAuthWacStarted;
- (BOOL)isSecuritySessionOpen;
- (BOOL)isSessionEstablished;
- (BOOL)isTokenValidationPending;
- (BOOL)isWacAccessory;
- (BOOL)isWacComplete;
- (BOOL)isWacLegacy;
- (BOOL)isWacNeeded;
- (BOOL)isWacStarted;
- (BOOL)pingSupported;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5;
- (BOOL)unitTest_establishedSession;
- (HAPAccessory)primaryAccessoryForServer;
- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo;
- (HAPAccessoryServerBookkeeping)discoveryBookkeeping;
- (HAPAccessoryServerBrowserIP)browser;
- (HAPAccessoryServerIP)initWithBonjourDeviceInfo:(id)a3 keyStore:(id)a4 browser:(id)a5 discoveryMethod:(unint64_t)a6;
- (HAPAccessoryServerIP)initWithHAPWACAccessory:(id)a3 keystore:(id)a4 browser:(id)a5;
- (HAPAccessoryServerIP)initWithKeyStore:(id)a3 browser:(id)a4;
- (HAPAccessoryServerIP)initWithKeyStore:(id)a3 browser:(id)a4 discoveryMethod:(unint64_t)a5;
- (HAPAccessoryServerIPConnectionStatistics)ipConnectionStatistics;
- (HAPAuthSession)authSession;
- (HAPHTTPClient)httpClient;
- (HAPNameResolver)nameResolver;
- (HAPSocketInfo)cachedSocketInfo;
- (HAPSocketInfo)currentSocketInfo;
- (HAPWACAccessory)hapWACAccessory;
- (HAPWACAccessoryClient)hapWACAccessoryClient;
- (HMFBlockOperation)pairOperation;
- (HMFNetAddress)peerAddress;
- (HMFNetAddress)peerAddressEx;
- (HMFNetMonitor)networkMonitor;
- (HMFTimer)bonjourEventTimer;
- (HMFTimer)connectionIdleTimer;
- (HMFTimer)reachabilityEventTimer;
- (NSArray)ipServices;
- (NSData)token;
- (NSDate)reachabilityStartTime;
- (NSDictionary)bonjourDeviceInfo;
- (NSMutableArray)queuedOperations;
- (NSOperationQueue)clientOperationQueue;
- (NSString)description;
- (NSString)model;
- (NSString)peerEndpointDescription;
- (NSString)sourceVersion;
- (double)_getReachabilityTimeoutValue;
- (double)_getReachabilityTimeoutValueWithSleepInterval:(id)a3;
- (double)disconnectOnIdleTimeout;
- (double)minimumReachabilityPingInterval;
- (id)_joinAccessoryNetworkWithCompletion:(id)a3;
- (id)_queuedReadOperationBlock:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (id)_queuedWriteOperationBlock:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (id)_serializeCharacteristicWriteRequestTuples:(void *)a3 error:;
- (id)_startReachabilityEventTimer;
- (id)getAddressTypeWithSocketInfo:(id)a3;
- (id)netServiceResolveCompletionBlock;
- (id)pairVerifyCompletionBlock;
- (id)primaryAccessory;
- (id)readAndResetHAPMetrics:(BOOL)a3;
- (id)services;
- (int)_continuePairingAfterAuthPromptWithRetry:(BOOL)a3;
- (int)_continuePairingWithSetupCode:(id)a3;
- (int)_doEnsureHTTPClientSetUp;
- (int)_ensurePairingSessionIsInitializedWithType:(unsigned int)a3;
- (int)_handlePairSetupCompletionWithData:(id)a3;
- (int)_handlePairVerifyCompletionWithData:(id)a3;
- (int)_pairSetupStartWithConsentRequired:(BOOL)a3;
- (int)_pairSetupTryPassword:(id)a3;
- (int)_pairVerifyStartWithRetry:(BOOL)a3;
- (int)_promptForSetupCodeWithFlags:(unsigned int)a3 delaySeconds:(int)a4 pairingFlags:(unsigned int)a5 isWAC:(BOOL)a6;
- (int)cancelPairingErr;
- (int)getBonjourDeviceDNSName:(id *)a3;
- (int64_t)linkLayerType;
- (int64_t)linkType;
- (unint64_t)abruptDisconnectionCounter;
- (unint64_t)consecutivePairVerifyFailureCount;
- (unint64_t)consecutivePairVerifyFailures;
- (unint64_t)metricHAPIPHTTPEventsCount;
- (unint64_t)metricHAPIPHTTPRequestsCount;
- (unint64_t)metricHAPIPHTTPResponsesCount;
- (unint64_t)metricHAPIPInvalidationCount;
- (unint64_t)statusFlags;
- (unsigned)_getNameResolutionGroupResolveTimeout;
- (void)__registerForInternalCharacteristicNotifications;
- (void)_accessoryDidBecomeUnreachable:(id)a3;
- (void)_cancelNameResolution;
- (void)_clearIPCacheOnError:(id)a3;
- (void)_continuePairingAfterConfirmingSecureWAC:(id)a3;
- (void)_continuePairingAfterMFiCertValidation;
- (void)_continuePairingAfterWAC:(id)a3;
- (void)_continuePairingUsingWAC;
- (void)_doBonjourReconfirm;
- (void)_doPollForAccessory:(id)a3;
- (void)_doReachabilityWithError:(id)a3 forAccessory:(id)a4;
- (void)_doResolveWithGroup:(id)a3;
- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_error:(id)a3 forReadCharacteristicValues:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_error:(id)a3 forWriteCharacteristicValues:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_establishSecureConnectionAndFetchAttributeDatabaseWithReason:(id)a3;
- (void)_establishSecureSession;
- (void)_establishSecureSessionAndRemovePairing:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_getAttributeDatabase;
- (void)_handleConnectionIdleTimeout;
- (void)_handleEventResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 characteristics:(id)a7 requestedEventState:(BOOL)a8 completion:(id)a9 queue:(id)a10;
- (void)_handleListPairingsResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 httpError:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8;
- (void)_handleMFiCertValidation;
- (void)_handlePairSetupAfterM4Callback;
- (void)_handlePairingsResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 httpError:(id)a6 removeRequest:(BOOL)a7 completionQueue:(id)a8 completionBlock:(id)a9;
- (void)_handlePrepareWriteResponseObject:(id)a3 type:(unint64_t)a4 prepareIdentifier:(id)a5 httpStatus:(int)a6 error:(id)a7 requestTuples:(id)a8 timeout:(double)a9 queue:(id)a10 originalCompletion:(id)a11 completion:(id)a12;
- (void)_handleReadECONNRESETError:(id)a3 readCharacteristics:(id)a4 responses:(id)a5 timeout:(double)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)_handleReadResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 characteristics:(id)a7 completion:(id)a8;
- (void)_handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4;
- (void)_handleWriteECONNResetError:(id)a3 writeRequests:(id)a4 responses:(id)a5 timeout:(double)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)_handleWriteResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 requestTuples:(id)a7 completion:(id)a8;
- (void)_incrementPairVerifyFailureCount;
- (void)_indicateSessionActivityWithReason:(id)a3;
- (void)_insertReadCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_insertWriteCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 withCompletionHandler:(id)a6;
- (void)_invalidateWAC;
- (void)_invokePairVerifyCompletionBlock:(id)a3;
- (void)_isAccessoryPublicKeyPresent:(BOOL *)a3 registeredWithHomeKit:(BOOL *)a4;
- (void)_kickConnectionIdleTimer;
- (void)_listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)_notifyDelegateNeedsOwnershipToken;
- (void)_notifyDelegateOfDiscoveryCompletionWithError:(id)a3;
- (void)_notifyDelegateOfPairingProgress:(int64_t)a3;
- (void)_notifyDelegatesOfAddAccessoryFailureWithError:(id)a3;
- (void)_notifyDelegatesOfConnectionState:(BOOL)a3 withError:(id)a4;
- (void)_notifyDelegatesPairingStopped:(id)a3;
- (void)_pairSetupContinueWAC;
- (void)_pairVerifyStartWAC:(id)a3;
- (void)_parseAttributeDatabase:(id)a3 transaction:(id)a4;
- (void)_performEasyConfigWithPairingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 completion:(id)a6;
- (void)_performExecuteWriteValues:(id)a3 prepareIdentifier:(id)a4 timeout:(double)a5 queue:(id)a6 completionHandler:(id)a7;
- (void)_performTimedWriteValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_performWriteValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_pollAccessory;
- (void)_processQueuedOperationsWithError:(id)a3;
- (void)_queueAddPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7;
- (void)_queueEnableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)_queueListPairingWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)_queueReadCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_queueWriteCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 withCompletionHandler:(id)a6;
- (void)_readCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)_removePairingWithIdentifier:(id)a3 publicKey:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)_requestResource:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_reset;
- (void)_sendRemovePairingWithData:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_skipReconfirm;
- (void)_startAddPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7;
- (void)_startConnectionIdleTimer;
- (void)_startReachability;
- (void)_stopReachability;
- (void)_stopReachabilityTimer;
- (void)_submitStateNumberChangeEvent:(BOOL)a3;
- (void)_suspendConnectionIdleTimer;
- (void)_tearDownSession;
- (void)_tearDownSessionAndStartReachabilityWithError:(id)a3;
- (void)_tearDownSessionWithError:(id)a3;
- (void)_tearDownWAC;
- (void)_updateProtocolVersionFromPrimaryAccessory:(id)a3;
- (void)_updateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4;
- (void)_validatePairingAuthMethod:(id)a3 activity:(id)a4;
- (void)_validateReachabilityTimer;
- (void)_writeCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)addActiveSession:(int64_t)a3;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)authSession:(id)a3 authComplete:(id)a4;
- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5;
- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4;
- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5;
- (void)authenticateAccessory;
- (void)bonjourRemoveEvent;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)continuePairingAfterAuthPrompt;
- (void)continuePairingUsingWAC;
- (void)copyPairingIdentityDelegateCallback;
- (void)createKeysForDataStreamWithKeySalt:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)disconnect;
- (void)disconnectOnIdleUpdated;
- (void)disconnectWithError:(id)a3;
- (void)discoverAccessories;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)findPairedPeerDelegateCallback;
- (void)getAccessoryInfo:(id)a3;
- (void)handleHTTPClientUnavailableErrorWithCompletion:(id)a3 serializationType:(unint64_t)a4;
- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4;
- (void)hapWACAccessoryClient:(id)a3 setBonjourInfo:(id)a4;
- (void)hapWACAccessoryClient:(id)a3 wacProgress:(unint64_t)a4;
- (void)httpClient:(id)a3 didReceiveEvent:(id)a4;
- (void)httpClient:(id)a3 didReceiveHTTPMessageWithHeaders:(id)a4 body:(id)a5;
- (void)httpClient:(id)a3 didReceiveSocketEvent:(unint64_t)a4;
- (void)httpClient:(id)a3 willSendHTTPMessageWithHeaders:(id)a4 body:(id)a5;
- (void)httpClientDidCloseConnectionDueToServer:(id)a3;
- (void)identifyWithCompletion:(id)a3;
- (void)incrementHAPIPHTTPEventsCount;
- (void)incrementHAPIPHTTPRequestsCount;
- (void)incrementHAPIPHTTPResponsesCount;
- (void)incrementHAPIPInvalidationCount;
- (void)invalidateWithCompletionHandler:(id)a3;
- (void)invokePairVerifyCompletionBlock:(id)a3;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)networkMonitorIsReachable:(id)a3;
- (void)networkMonitorIsUnreachable:(id)a3;
- (void)pairSetupStartSoftAuthWAC;
- (void)pollAccessory;
- (void)processPendingBonjourRemoveEvents;
- (void)provisionToken:(id)a3;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)reconfirm;
- (void)removeActiveSession:(int64_t)a3;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)requestResource:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)resetPairVerifyFailureCount;
- (void)resetPostSoftAuthWAC;
- (void)savePairedPeerDelegateCallback;
- (void)sendGETRequestToURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)sendPOSTRequestToURL:(id)a3 request:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6;
- (void)sendPUTRequestToURL:(id)a3 request:(id)a4 serializationType:(unint64_t)a5 timeout:(double)a6 completionHandler:(id)a7;
- (void)setAbruptDisconnectionCounter:(unint64_t)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticatedProtocolInfo:(id)a3;
- (void)setBonjourDeviceInfo:(id)a3;
- (void)setBonjourDiscoveryPending:(BOOL)a3;
- (void)setBonjourEventTimer:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setCachedSocketInfo:(id)a3;
- (void)setCancelPairingErr:(int)a3;
- (void)setConnectionIdleTimer:(id)a3;
- (void)setConsecutivePairVerifyFailures:(unint64_t)a3;
- (void)setContinuingLegacyWACpairing:(BOOL)a3;
- (void)setDisconnectOnIdleTimeout:(double)a3;
- (void)setDiscoveryBookkeeping:(id)a3;
- (void)setEconnresetRetryInProgress:(BOOL)a3;
- (void)setEstablishingSecureConnection:(BOOL)a3;
- (void)setHandlingInvalidSetupCode:(BOOL)a3;
- (void)setHapWACAccessoryClient:(id)a3;
- (void)setHasAttributeDatabase:(BOOL)a3;
- (void)setHasStartedPairing:(BOOL)a3;
- (void)setHasUpdatedBonjour:(BOOL)a3;
- (void)setHttpClient:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setIpConnectionStatistics:(id)a3;
- (void)setIpServices:(id)a3;
- (void)setMetricHAPIPHTTPEventsCount:(unint64_t)a3;
- (void)setMetricHAPIPHTTPRequestsCount:(unint64_t)a3;
- (void)setMetricHAPIPHTTPResponsesCount:(unint64_t)a3;
- (void)setMetricHAPIPInvalidationCount:(unint64_t)a3;
- (void)setMinimumReachabilityPingInterval:(double)a3;
- (void)setModel:(id)a3;
- (void)setNameResolver:(id)a3;
- (void)setNetServiceResolveCompletionBlock:(id)a3;
- (void)setPairOperation:(id)a3;
- (void)setPairVerifyCompletionBlock:(id)a3;
- (void)setPairingRequestPending:(BOOL)a3;
- (void)setPostSoftAuthWacStarted:(BOOL)a3;
- (void)setPreSoftAuthWacStarted:(BOOL)a3;
- (void)setPrimaryAccessoryForServer:(id)a3;
- (void)setQueuedOperations:(id)a3;
- (void)setReachabilityEventTimer:(id)a3;
- (void)setReachabilityStartTime:(id)a3;
- (void)setSecuritySessionOpen:(BOOL)a3;
- (void)setSourceVersion:(id)a3;
- (void)setStatusFlags:(unint64_t)a3;
- (void)setToken:(id)a3;
- (void)setTokenValidationPending:(BOOL)a3;
- (void)setUnitTest_establishedSession:(BOOL)a3;
- (void)setWacAccessory:(BOOL)a3;
- (void)setWacComplete:(BOOL)a3;
- (void)setWacLegacy:(BOOL)a3;
- (void)setWacStarted:(BOOL)a3;
- (void)startPairingWithRequest:(id)a3;
- (void)startPing;
- (void)startReprovisioningWithPairingRequest:(id)a3;
- (void)stopPing;
- (void)tearDownSessionOnAuthCompletion;
- (void)timerDidFire:(id)a3;
- (void)updateActiveDisconnectOnIdleTimeout:(double)a3;
- (void)updateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4;
- (void)updateWithHAPWACAccessory:(id)a3;
- (void)validatePairingAuthMethod:(id)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HAPAccessoryServerIP

+ (id)_parseSerializedAccessoryDictionary:(id)a3 server:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 objectForKeyedSubscript:@"services"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v9 = v7;
        uint64_t v10 = [(__CFString *)v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          v12 = 0;
          uint64_t v13 = *(void *)v50;
LABEL_6:
          uint64_t v14 = 0;
          v15 = v12;
          while (1)
          {
            if (*(void *)v50 != v13) {
              objc_enumerationMutation(v9);
            }
            v12 = _parseSerializedService(*(void **)(*((void *)&v49 + 1) + 8 * v14));

            if (!v12) {
              break;
            }
            [v8 addObject:v12];
            ++v14;
            v15 = v12;
            if (v11 == v14)
            {
              uint64_t v11 = [(__CFString *)v9 countByEnumeratingWithState:&v49 objects:v53 count:16];
              if (v11) {
                goto LABEL_6;
              }

              goto LABEL_13;
            }
          }
          v39 = (void *)MEMORY[0x1D944E080]();
          id v40 = v6;
          v41 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            goto LABEL_31;
          }
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v55 = v42;
          _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse serialized service", buf, 0xCu);
        }
        else
        {
LABEL_13:

          objc_msgSend(v5, "hmf_numberForKey:", @"aid");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v16 = [NSNumber numberWithUnsignedInteger:1];
            char v17 = [(__CFString *)v9 isEqualToNumber:v16];

            v18 = (void *)MEMORY[0x1D944E080]();
            id v19 = v6;
            v20 = HMFGetOSLogHandle();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
            if (v17)
            {
              if (v21)
              {
                v22 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v55 = v22;
                __int16 v56 = 2114;
                v57 = v9;
                _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating HAP Accessory with instanceID %{public}@", buf, 0x16u);
              }
              v23 = HAPAccessory;
            }
            else
            {
              if (v21)
              {
                v44 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v55 = v44;
                __int16 v56 = 2114;
                v57 = v9;
                _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating HAP Bridged Accessory with instanceID %{public}@", buf, 0x16u);
              }
              v23 = HAPBridgedAccessory;
            }
            v30 = (void *)[[v23 alloc] initWithServer:v19 instanceID:v9 parsedServices:v8];
            v45 = [v19 identifier];
            [v30 setIdentifier:v45];

            v46 = [v19 identifier];
            [v30 setServerIdentifier:v46];

            goto LABEL_38;
          }
          v39 = (void *)MEMORY[0x1D944E080]();
          id v40 = v6;
          v41 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
LABEL_31:

            v30 = 0;
LABEL_38:

            goto LABEL_39;
          }
          v42 = HMFGetLogIdentifier();
          [v5 objectForKeyedSubscript:@"aid"];
          v48 = v39;
          v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v42;
          __int16 v56 = 2112;
          v57 = v43;
          _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse accessory's instanceID: %@", buf, 0x16u);

          v39 = v48;
        }

        goto LABEL_31;
      }
      v31 = (void *)MEMORY[0x1D944E080]();
      id v32 = v6;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        v37 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v55 = v36;
        __int16 v56 = 2114;
        v57 = @"services";
        __int16 v58 = 2114;
        v59 = v37;
        id v38 = v37;
        _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%{public}@Expected '%{public}@' to be an array in the accessory object of the attribute database, instead it is a %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v31 = (void *)MEMORY[0x1D944E080]();
      id v32 = v6;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v55 = v34;
        _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@No services found when parsing accessory object in attribute database", buf, 0xCu);
      }
    }

    v30 = 0;
LABEL_39:

    goto LABEL_40;
  }
  v24 = (void *)MEMORY[0x1D944E080]();
  id v25 = v6;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    v28 = (__CFString *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v55 = v27;
    __int16 v56 = 2114;
    v57 = v28;
    v29 = v28;
    _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Expected accessory object to be a dictionary in the attribute database, instead it is a %{public}@", buf, 0x16u);
  }
  v30 = 0;
LABEL_40:

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameResolver, 0);
  objc_storeStrong((id *)&self->_httpClient, 0);
  objc_storeStrong((id *)&self->_ipConnectionStatistics, 0);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourEventTimer, 0);
  objc_storeStrong((id *)&self->_hapWACAccessoryClient, 0);
  objc_storeStrong((id *)&self->_clientOperationQueue, 0);
  objc_storeStrong((id *)&self->_pairOperation, 0);
  objc_storeStrong(&self->_netServiceResolveCompletionBlock, 0);
  objc_storeStrong(&self->_pairVerifyCompletionBlock, 0);
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, 0);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryForServer, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_ipServices, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_discoveryBookkeeping, 0);
  objc_storeStrong((id *)&self->_cachedSocketInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_reachabilityStartTime, 0);
  objc_storeStrong((id *)&self->_reachabilityEventTimer, 0);
  objc_storeStrong((id *)&self->_bonjourDeviceInfo, 0);

  objc_storeStrong((id *)&self->_hapWACAccessory, 0);
}

- (void)setUnitTest_establishedSession:(BOOL)a3
{
  self->_unitTest_establishedSession = a3;
}

- (BOOL)unitTest_establishedSession
{
  return self->_unitTest_establishedSession;
}

- (void)setNameResolver:(id)a3
{
}

- (HAPNameResolver)nameResolver
{
  return self->_nameResolver;
}

- (void)setHttpClient:(id)a3
{
}

- (HAPHTTPClient)httpClient
{
  return self->_httpClient;
}

- (void)setIpConnectionStatistics:(id)a3
{
}

- (HAPAccessoryServerIPConnectionStatistics)ipConnectionStatistics
{
  return self->_ipConnectionStatistics;
}

- (void)setDisconnectOnIdleTimeout:(double)a3
{
  self->_disconnectOnIdleTimeout = a3;
}

- (double)disconnectOnIdleTimeout
{
  return self->_disconnectOnIdleTimeout;
}

- (void)setConnectionIdleTimer:(id)a3
{
}

- (HMFTimer)connectionIdleTimer
{
  return self->_connectionIdleTimer;
}

- (void)setCancelPairingErr:(int)a3
{
  self->_cancelPairingErr = a3;
}

- (int)cancelPairingErr
{
  return self->_cancelPairingErr;
}

- (void)setHandlingInvalidSetupCode:(BOOL)a3
{
  self->_handlingInvalidSetupCode = a3;
}

- (BOOL)isHandlingInvalidSetupCode
{
  return self->_handlingInvalidSetupCode;
}

- (void)setTokenValidationPending:(BOOL)a3
{
  self->_tokenValidationPending = a3;
}

- (BOOL)isTokenValidationPending
{
  return self->_tokenValidationPending;
}

- (void)setPairingRequestPending:(BOOL)a3
{
  self->_pairingRequestPending = a3;
}

- (BOOL)isPairingRequestPending
{
  return self->_pairingRequestPending;
}

- (HMFNetMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setHasStartedPairing:(BOOL)a3
{
  self->_hasStartedPairing = a3;
}

- (BOOL)hasStartedPairing
{
  return self->_hasStartedPairing;
}

- (void)setBonjourEventTimer:(id)a3
{
}

- (HMFTimer)bonjourEventTimer
{
  return self->_bonjourEventTimer;
}

- (void)setWacStarted:(BOOL)a3
{
  self->_wacStarted = a3;
}

- (BOOL)isWacStarted
{
  return self->_wacStarted;
}

- (void)setContinuingLegacyWACpairing:(BOOL)a3
{
  self->_continuingLegacyWACpairing = a3;
}

- (BOOL)isContinuingLegacyWACpairing
{
  return self->_continuingLegacyWACpairing;
}

- (void)setHapWACAccessoryClient:(id)a3
{
}

- (HAPWACAccessoryClient)hapWACAccessoryClient
{
  return self->_hapWACAccessoryClient;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (NSOperationQueue)clientOperationQueue
{
  return self->_clientOperationQueue;
}

- (void)setPairOperation:(id)a3
{
}

- (HMFBlockOperation)pairOperation
{
  return self->_pairOperation;
}

- (void)setEconnresetRetryInProgress:(BOOL)a3
{
  self->_econnresetRetryInProgress = a3;
}

- (BOOL)econnresetRetryInProgress
{
  return self->_econnresetRetryInProgress;
}

- (void)setHasAttributeDatabase:(BOOL)a3
{
  self->_hasAttributeDatabase = a3;
}

- (BOOL)hasAttributeDatabase
{
  return self->_hasAttributeDatabase;
}

- (void)setNetServiceResolveCompletionBlock:(id)a3
{
}

- (id)netServiceResolveCompletionBlock
{
  return self->_netServiceResolveCompletionBlock;
}

- (id)pairVerifyCompletionBlock
{
  return self->_pairVerifyCompletionBlock;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return self->_authenticatedProtocolInfo;
}

- (HAPAuthSession)authSession
{
  return self->_authSession;
}

- (void)setPrimaryAccessoryForServer:(id)a3
{
}

- (HAPAccessory)primaryAccessoryForServer
{
  return self->_primaryAccessoryForServer;
}

- (void)setQueuedOperations:(id)a3
{
}

- (NSMutableArray)queuedOperations
{
  return self->_queuedOperations;
}

- (void)setIpServices:(id)a3
{
}

- (NSArray)ipServices
{
  return self->_ipServices;
}

- (void)setBrowser:(id)a3
{
}

- (HAPAccessoryServerBrowserIP)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);

  return (HAPAccessoryServerBrowserIP *)WeakRetained;
}

- (void)setHasUpdatedBonjour:(BOOL)a3
{
  self->_hasUpdatedBonjour = a3;
}

- (BOOL)hasUpdatedBonjour
{
  return self->_hasUpdatedBonjour;
}

- (void)setMetricHAPIPHTTPResponsesCount:(unint64_t)a3
{
  self->_metricHAPIPHTTPResponsesCount = a3;
}

- (unint64_t)metricHAPIPHTTPResponsesCount
{
  return self->_metricHAPIPHTTPResponsesCount;
}

- (void)setMetricHAPIPHTTPRequestsCount:(unint64_t)a3
{
  self->_metricHAPIPHTTPRequestsCount = a3;
}

- (unint64_t)metricHAPIPHTTPRequestsCount
{
  return self->_metricHAPIPHTTPRequestsCount;
}

- (void)setMetricHAPIPHTTPEventsCount:(unint64_t)a3
{
  self->_metricHAPIPHTTPEventsCount = a3;
}

- (unint64_t)metricHAPIPHTTPEventsCount
{
  return self->_metricHAPIPHTTPEventsCount;
}

- (void)setMetricHAPIPInvalidationCount:(unint64_t)a3
{
  self->_metricHAPIPInvalidationCount = a3;
}

- (unint64_t)metricHAPIPInvalidationCount
{
  return self->_metricHAPIPInvalidationCount;
}

- (void)setToken:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setConsecutivePairVerifyFailures:(unint64_t)a3
{
  self->_consecutivePairVerifyFailures = a3;
}

- (unint64_t)consecutivePairVerifyFailures
{
  return self->_consecutivePairVerifyFailures;
}

- (void)setDiscoveryBookkeeping:(id)a3
{
}

- (HAPAccessoryServerBookkeeping)discoveryBookkeeping
{
  return self->_discoveryBookkeeping;
}

- (HAPSocketInfo)cachedSocketInfo
{
  return self->_cachedSocketInfo;
}

- (void)setReachabilityStartTime:(id)a3
{
}

- (NSDate)reachabilityStartTime
{
  return self->_reachabilityStartTime;
}

- (void)setMinimumReachabilityPingInterval:(double)a3
{
  self->_minimumReachabilityPingInterval = a3;
}

- (double)minimumReachabilityPingInterval
{
  return self->_minimumReachabilityPingInterval;
}

- (void)setReachabilityEventTimer:(id)a3
{
}

- (HMFTimer)reachabilityEventTimer
{
  return self->_reachabilityEventTimer;
}

- (void)resetPairVerifyFailureCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_consecutivePairVerifyFailures = 0;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)consecutivePairVerifyFailureCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t consecutivePairVerifyFailures = self->_consecutivePairVerifyFailures;
  os_unfair_lock_unlock(p_lock);
  return consecutivePairVerifyFailures;
}

- (void)_incrementPairVerifyFailureCount
{
  v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock_with_options();
  ++self->_consecutivePairVerifyFailures;
  os_unfair_lock_unlock(&self->_lock);
  [(HAPAccessoryServer *)self setReachable:0];

  [(HAPAccessoryServerIP *)self setCachedSocketInfo:0];
}

- (void)disconnectOnIdleUpdated
{
  v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HAPAccessoryServerIP_disconnectOnIdleUpdated__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __47__HAPAccessoryServerIP_disconnectOnIdleUpdated__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldDisconnectOnIdle];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _startConnectionIdleTimer];
  }
  else
  {
    return [v3 _suspendConnectionIdleTimer];
  }
}

- (void)_suspendConnectionIdleTimer
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HAPAccessoryServerIP *)self connectionIdleTimer];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [(HAPAccessoryServerIP *)v6 connectionIdleTimer];
      [v9 timeInterval];
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Suspending connection idle timer of: %0.3fs", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = [(HAPAccessoryServerIP *)v6 connectionIdleTimer];
    [v11 suspend];

    [(HAPAccessoryServerIP *)v6 setConnectionIdleTimer:0];
  }
}

- (void)_startConnectionIdleTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HAPAccessoryServerIP *)self httpClient];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = HMFGetLogIdentifier();
      int v25 = 138543362;
      v26 = v8;
      v9 = "%{public}@Not starting connection idle timer --- no active connection";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if ([(HAPAccessoryServer *)self isSessionRestoreActive])
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v25 = 138543362;
      v26 = v8;
      v9 = "%{public}@*** Session Restore is active, ignoring start connection idle timer request";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_7:
      _os_log_impl(&dword_1D4758000, v10, v11, v9, (uint8_t *)&v25, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(HAPAccessoryServer *)self shouldDisconnectOnIdle])
  {
    int v12 = [(HAPAccessoryServerIP *)self connectionIdleTimer];
    if (v12)
    {
LABEL_11:

      goto LABEL_13;
    }
    if (!self->_idleTimerActiveSessions)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F65580]);
      [(HAPAccessoryServerIP *)self disconnectOnIdleTimeout];
      v22 = objc_msgSend(v21, "initWithTimeInterval:options:", 0);
      [(HAPAccessoryServerIP *)self setConnectionIdleTimer:v22];

      v23 = [(HAPAccessoryServerIP *)self connectionIdleTimer];
      [v23 setDelegate:self];

      int v12 = [(HAPAccessoryServer *)self clientQueue];
      v24 = [(HAPAccessoryServerIP *)self connectionIdleTimer];
      [v24 setDelegateQueue:v12];

      goto LABEL_11;
    }
  }
LABEL_13:
  uint64_t v13 = [(HAPAccessoryServerIP *)self connectionIdleTimer];

  if (v13)
  {
    __int16 v14 = (void *)MEMORY[0x1D944E080]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      char v17 = HMFGetLogIdentifier();
      v18 = [(HAPAccessoryServerIP *)v15 connectionIdleTimer];
      [v18 timeInterval];
      int v25 = 138543618;
      v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Starting connection idle timer of: %03fs", (uint8_t *)&v25, 0x16u);
    }
    v20 = [(HAPAccessoryServerIP *)v15 connectionIdleTimer];
    [v20 resume];
  }
}

- (void)_kickConnectionIdleTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HAPAccessoryServerIP *)self connectionIdleTimer];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      os_log_type_t v11 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Kicking connection idle timer", (uint8_t *)&v10, 0xCu);
    }
    v9 = [(HAPAccessoryServerIP *)v6 connectionIdleTimer];
    [v9 kick];
  }
}

- (void)_handleConnectionIdleTimeout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HAPAccessoryServer *)self shouldDisconnectOnIdle])
  {
    v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      int v10 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, disconnecting...", (uint8_t *)&v9, 0xCu);
    }
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:29 userInfo:0];
    [(HAPAccessoryServerIP *)v5 disconnectWithError:v8];
  }
}

- (void)updateActiveDisconnectOnIdleTimeout:(double)a3
{
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HAPAccessoryServerIP_updateActiveDisconnectOnIdleTimeout___block_invoke;
  v6[3] = &unk_1E69F3A58;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

void __60__HAPAccessoryServerIP_updateActiveDisconnectOnIdleTimeout___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) shouldDisconnectOnIdle])
  {
    [*(id *)(a1 + 32) setDisconnectOnIdleTimeout:*(double *)(a1 + 40)];
    uint64_t v2 = [*(id *)(a1 + 32) connectionIdleTimer];
    if (v2)
    {
      v3 = (void *)v2;
      v4 = [*(id *)(a1 + 32) connectionIdleTimer];
      [v4 timeInterval];
      double v6 = v5;
      [*(id *)(a1 + 32) disconnectOnIdleTimeout];
      double v8 = v7;

      if (v6 != v8)
      {
        int v9 = (void *)MEMORY[0x1D944E080]();
        id v10 = *(id *)(a1 + 32);
        uint64_t v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          [*(id *)(a1 + 32) disconnectOnIdleTimeout];
          int v22 = 138543618;
          v23 = v12;
          __int16 v24 = 2048;
          uint64_t v25 = v13;
          _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating active connection idle timer timeout to: %0.3fs", (uint8_t *)&v22, 0x16u);
        }
        __int16 v14 = [*(id *)(a1 + 32) connectionIdleTimer];
        [v14 suspend];

        id v15 = objc_alloc(MEMORY[0x1E4F65580]);
        [*(id *)(a1 + 32) disconnectOnIdleTimeout];
        uint64_t v16 = objc_msgSend(v15, "initWithTimeInterval:options:", 0);
        [*(id *)(a1 + 32) setConnectionIdleTimer:v16];

        char v17 = *(void **)(a1 + 32);
        v18 = [v17 connectionIdleTimer];
        [v18 setDelegate:v17];

        uint64_t v19 = [*(id *)(a1 + 32) clientQueue];
        v20 = [*(id *)(a1 + 32) connectionIdleTimer];
        [v20 setDelegateQueue:v19];

        id v21 = [*(id *)(a1 + 32) connectionIdleTimer];
        [v21 resume];
      }
    }
  }
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  v4 = [(HAPAccessoryServer *)self delegate];
  if (v4)
  {
    double v5 = [(HAPAccessoryServer *)self delegateQueue];
    if (v5)
    {
      double v6 = [(HAPAccessoryServer *)self delegate];
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

- (void)_accessoryDidBecomeUnreachable:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  double v6 = (void *)MEMORY[0x1D944E080]();
  char v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v10 = [v4 isReachable];
    uint64_t v11 = [v4 shortDescription];
    int v17 = 138543874;
    v18 = v9;
    __int16 v19 = 1024;
    int v20 = v10;
    __int16 v21 = 2112;
    int v22 = v11;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory became unreachable after ping - reachable flag %d accessory: %@", (uint8_t *)&v17, 0x1Cu);
  }
  [(HAPAccessoryServer *)v7 setReachabilityChangedReason:@"Ping"];
  if ([v4 isReachable])
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    uint64_t v13 = v7;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Marking accessory unreachable", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v16 = [(HAPAccessoryServer *)v13 buildReachabilityNotificationDictionary:v4 reachable:0 linkType:1 withError:0];
    [(HAPAccessoryServer *)v13 notifyClients:2 withDictionary:v16];
  }
  if ([v4 isPrimary]) {
    [(HAPAccessoryServerIP *)v7 _startReachability];
  }
}

- (void)pollAccessory
{
  v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HAPAccessoryServerIP_pollAccessory__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__HAPAccessoryServerIP_pollAccessory__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pollAccessory];
}

- (void)_pollAccessory
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HAPAccessoryServer *)self reachabilityPingEnabled];
  id v4 = (void *)MEMORY[0x1D944E080]();
  double v5 = self;
  double v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      double v8 = HMFGetLogIdentifier();
      int v9 = [(HAPAccessoryServerIP *)v5 primaryAccessory];
      int v10 = [v9 shortDescription];
      int v13 = 138543618;
      __int16 v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Reachability poll for accessory: %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [(HAPAccessoryServerIP *)v5 primaryAccessory];
    [(HAPAccessoryServerIP *)v5 _doPollForAccessory:v11];
  }
  else
  {
    if (v7)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Reachability ping disabled", (uint8_t *)&v13, 0xCu);
    }
    [(HAPAccessoryServerIP *)v5 stopPing];
  }
}

- (void)_doPollForAccessory:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  if (!self->_reachabilityEventTimer)
  {
    double v8 = (void *)MEMORY[0x1D944E080]();
    int v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v11;
    uint64_t v12 = "%{public}@Reachability poll called while reachability event timer is nil";
LABEL_7:
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    goto LABEL_8;
  }
  double v6 = [v4 characteristicOfType:@"0000023C-0000-1000-8000-0026BB765291" serviceType:@"00000239-0000-1000-8000-0026BB765291"];
  if (!v6)
  {
    double v6 = [v4 characteristicOfType:@"00000052-0000-1000-8000-0026BB765291" serviceType:@"0000003E-0000-1000-8000-0026BB765291"];
    if (!v6)
    {
      double v8 = (void *)MEMORY[0x1D944E080]();
      int v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v11;
      uint64_t v12 = "%{public}@Reachability poll failed - no suitable characteristic";
      goto LABEL_7;
    }
  }
  BOOL v7 = [(HAPAccessoryServer *)self clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HAPAccessoryServerIP__doPollForAccessory___block_invoke;
  v13[3] = &unk_1E69F3BC8;
  v13[4] = self;
  id v14 = v4;
  [v14 readValueForCharacteristic:v6 timeout:v7 completionQueue:v13 completionHandler:0.0];

LABEL_9:
}

void __44__HAPAccessoryServerIP__doPollForAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) clientQueue];
  dispatch_assert_queue_V2(v7);

  double v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = *(id *)(a1 + 32);
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = [*(id *)(a1 + 32) reachabilityPingEnabled];
    int v17 = 138543874;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Reachability poll complete error=%@ reachabilityPingEnabled %d", (uint8_t *)&v17, 0x1Cu);
  }
  int v13 = [*(id *)(a1 + 32) reachabilityEventTimer];
  [v13 resume];

  [*(id *)(a1 + 32) _doReachabilityWithError:v6 forAccessory:*(void *)(a1 + 40)];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 448);
  *(void *)(v15 + 448) = v14;
}

- (void)_doReachabilityWithError:(id)a3 forAccessory:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    id v9 = [(HAPAccessoryServer *)self buildReachabilityNotificationDictionary:v7 reachable:0 linkType:1 withError:0];
    [(HAPAccessoryServer *)self incrementFailedPing];
    [(HAPAccessoryServer *)self notifyClients:1 withDictionary:v9];
    int v10 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v11 = [v10 preferenceForKey:@"reachabilityFailedPingLimit"];
    int v12 = [v11 numberValue];

    int v13 = (void *)MEMORY[0x1D944E080](objc_msgSend(v7, "setConsecutiveFailedPingCount:", objc_msgSend(v7, "consecutiveFailedPingCount") + 1));
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = [v7 consecutiveFailedPingCount];
      v18 = [v7 shortDescription];
      int v25 = 138543874;
      uint64_t v26 = v16;
      __int16 v27 = 1024;
      int v28 = v17;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Reachability poll failure count: %d for accessory: %@", (uint8_t *)&v25, 0x1Cu);
    }
    int v19 = [v7 consecutiveFailedPingCount];
    if (v19 == [v12 intValue]) {
      [(HAPAccessoryServerIP *)v14 _accessoryDidBecomeUnreachable:v7];
    }
  }
  else
  {
    [(HAPAccessoryServer *)self incrementSuccessfulPing];
    if ([v7 consecutiveFailedPingCount])
    {
      id v20 = (void *)MEMORY[0x1D944E080]();
      __int16 v21 = self;
      int v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        int v25 = 138543362;
        uint64_t v26 = v23;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Reachability poll -- resetting consecutive ping failure", (uint8_t *)&v25, 0xCu);
      }
      [v7 setConsecutiveFailedPingCount:0];
    }
    if (([v7 isReachable] & 1) == 0)
    {
      if (([v7 isPrimary] & 1) == 0)
      {
        [(HAPAccessoryServer *)self setReachabilityChangedReason:@"Ping"];
        [v7 setReachable:1];
      }
      __int16 v24 = [(HAPAccessoryServer *)self buildReachabilityNotificationDictionary:v7 reachable:1 linkType:1 withError:0];
      [(HAPAccessoryServer *)self notifyClients:2 withDictionary:v24];
    }
    id v9 = [(HAPAccessoryServer *)self buildReachabilityNotificationDictionary:v7 reachable:1 linkType:1 withError:0];
    [(HAPAccessoryServer *)self notifyClients:1 withDictionary:v9];
  }
}

- (void)_indicateSessionActivityWithReason:(id)a3
{
  [(HAPAccessoryServer *)self setReachabilityChangedReason:a3];
  [(HAPAccessoryServer *)self setReachable:1];
  id v4 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HAPAccessoryServerIP__indicateSessionActivityWithReason___block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __59__HAPAccessoryServerIP__indicateSessionActivityWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _kickConnectionIdleTimer];
}

- (void)_startReachability
{
  BOOL v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HAPAccessoryServerIP *)self _startReachabilityEventTimer];
  if (v4)
  {
    id v5 = v4;
    [(HAPAccessoryServerIP *)self _pollAccessory];
    id v4 = v5;
  }
}

- (id)_startReachabilityEventTimer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(HAPAccessoryServer *)self shouldDisconnectOnIdle])
  {
    BOOL v3 = (void *)MEMORY[0x1D944E080]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v21 = 138543362;
      int v22 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@shouldDisconnectOnIdle is enabled -- ignoring request to start reachability timer", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_6;
  }
  id v7 = [(HAPAccessoryServerIP *)self reachabilityEventTimer];

  if (v7)
  {
LABEL_6:
    double v8 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = [(HAPAccessoryServerIP *)self _getReachabilityTimeoutValue];
  double v12 = v11;
  int v13 = (void *)MEMORY[0x1D944E080](v10);
  uint64_t v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    int v17 = [(HAPAccessoryServerIP *)v14 primaryAccessory];
    v18 = [v17 shortDescription];
    int v21 = 138543874;
    int v22 = v16;
    __int16 v23 = 2112;
    __int16 v24 = v18;
    __int16 v25 = 2048;
    double v26 = v12;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting reachability poll timer for accessory: %@ to %0.3fs", (uint8_t *)&v21, 0x20u);
  }
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:3 options:v12];
  [v8 setDelegate:v14];
  int v19 = [(HAPAccessoryServer *)v14 clientQueue];
  [v8 setDelegateQueue:v19];

  [(HAPAccessoryServerIP *)v14 setReachabilityEventTimer:v8];
  [(HAPAccessoryServer *)v14 setReachabilityPingEnabled:1];
  id v20 = [MEMORY[0x1E4F1C9C8] date];
  [(HAPAccessoryServerIP *)v14 setReachabilityStartTime:v20];

LABEL_7:

  return v8;
}

- (double)_getReachabilityTimeoutValue
{
  double minimumReachabilityPingInterval = self->_minimumReachabilityPingInterval;
  id v4 = [(HAPAccessoryServerIP *)self primaryAccessory];
  id v5 = [v4 characteristicOfType:@"0000023A-0000-1000-8000-0026BB765291" serviceType:@"00000239-0000-1000-8000-0026BB765291"];

  if (v5)
  {
    id v6 = [v5 value];
    [(HAPAccessoryServerIP *)self _getReachabilityTimeoutValueWithSleepInterval:v6];
    double minimumReachabilityPingInterval = v7;
  }
  return minimumReachabilityPingInterval;
}

- (double)_getReachabilityTimeoutValueWithSleepInterval:(id)a3
{
  double minimumReachabilityPingInterval = self->_minimumReachabilityPingInterval;
  if (a3)
  {
    [a3 doubleValue];
    double v5 = v4 / 1000.0;
    if (v5 > minimumReachabilityPingInterval) {
      return v5;
    }
  }
  return minimumReachabilityPingInterval;
}

- (void)_stopReachability
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(HAPAccessoryServer *)self accessories];
  if ((unint64_t)[v4 count] < 2)
  {

LABEL_7:
    [(HAPAccessoryServerIP *)self _stopReachabilityTimer];
    return;
  }
  BOOL v5 = [(HAPAccessoryServer *)self reachabilityPingEnabled];

  if (!v5) {
    goto LABEL_7;
  }
  id v6 = (void *)MEMORY[0x1D944E080]();
  double v7 = self;
  double v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    double v11 = v9;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Server still has accessories to support ping for -- ignoring stop ping request for server", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_stopReachabilityTimer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_reachabilityEventTimer)
  {
    BOOL v3 = (void *)MEMORY[0x1D944E080]();
    double v4 = self;
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping reachability timer", (uint8_t *)&v8, 0xCu);
    }
    [(HMFTimer *)self->_reachabilityEventTimer suspend];
    reachabilityEventTimer = self->_reachabilityEventTimer;
    self->_reachabilityEventTimer = 0;
  }
}

- (BOOL)pingSupported
{
  return 1;
}

- (void)stopPing
{
  BOOL v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HAPAccessoryServerIP_stopPing__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__HAPAccessoryServerIP_stopPing__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  double v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping IP reachability", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) setReachabilityPingEnabled:0];
  return [*(id *)(a1 + 32) _stopReachability];
}

- (void)startPing
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HAPAccessoryServerIP_startPing__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __33__HAPAccessoryServerIP_startPing__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) reachabilityPingEnabled];
  id v3 = (void *)MEMORY[0x1D944E080]();
  id v4 = *(id *)(a1 + 32);
  BOOL v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting IP reachability", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) _startReachability];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@Attempting to start ping on server that is not enabled", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke;
  v7[3] = &unk_1E69F3C68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) isWacAccessory]
    || ([*(id *)(a1 + 32) isWacComplete] & 1) != 0)
  {
    char v2 = NSString;
    v16[0] = @"/";
    v16[1] = @"identify";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v4 = [v2 pathWithComponents:v3];

    uint64_t v5 = [*(id *)(a1 + 32) _ensureHTTPClientSetUp];
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6)
      {
        int v7 = HMErrorFromOSStatus(v5);
        (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
      }
    }
    else
    {
      objc_initWeak(location, *(id *)(a1 + 32));
      id v8 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke_621;
      v13[3] = &unk_1E69F0060;
      objc_copyWeak(&v15, location);
      id v14 = *(id *)(a1 + 40);
      [v8 sendPOSTRequestToURL:v4 request:0 serializationType:1 completionHandler:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak(location);
    }
    goto LABEL_11;
  }
  int v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v12;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Identify is not supported for WAC device", (uint8_t *)location, 0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:48];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
  }
}

void __47__HAPAccessoryServerIP_identifyWithCompletion___block_invoke_621(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
  {
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    id v12 = WeakRetained;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      int v25 = 138543618;
      double v26 = v14;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Identify returned HTTP client error: %@", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, id))(v15 + 16))(v15, v9);
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D944E080]();
    id v17 = WeakRetained;
    v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (a4 == 204)
    {
      if (v19)
      {
        id v20 = HMFGetLogIdentifier();
        int v25 = 138543362;
        double v26 = v20;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Identify succeeded", (uint8_t *)&v25, 0xCu);
      }
      int v21 = 0;
    }
    else
    {
      if (v19)
      {
        int v22 = HMFGetLogIdentifier();
        __int16 v23 = [NSNumber numberWithInt:a4];
        int v25 = 138543618;
        double v26 = v22;
        __int16 v27 = 2112;
        id v28 = v23;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Identify returned unexpected status code: %@", (uint8_t *)&v25, 0x16u);
      }
      int v21 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    }
    uint64_t v24 = *(void *)(a1 + 32);
    if (v24) {
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v21);
    }
  }
}

- (void)httpClient:(id)a3 willSendHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self delegate];
  if ([v9 conformsToProtocol:&unk_1F2CA98E8])
  {
    BOOL v10 = [(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServerIP_willSendHTTPHeaders_httpBody_];

    if (v10)
    {
      uint64_t v11 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__HAPAccessoryServerIP_httpClient_willSendHTTPMessageWithHeaders_body___block_invoke;
      block[3] = &unk_1E69F4708;
      block[4] = self;
      id v13 = v7;
      id v14 = v8;
      dispatch_async(v11, block);
    }
  }
  else
  {
  }
}

void __71__HAPAccessoryServerIP_httpClient_willSendHTTPMessageWithHeaders_body___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerIP:*(void *)(a1 + 32) willSendHTTPHeaders:*(void *)(a1 + 40) httpBody:*(void *)(a1 + 48)];
}

- (void)httpClient:(id)a3 didReceiveHTTPMessageWithHeaders:(id)a4 body:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(HAPAccessoryServer *)self delegate];
  if ([v9 conformsToProtocol:&unk_1F2CA98E8])
  {
    BOOL v10 = [(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServerIP_didReceiveHTTPHeaders_httpBody_];

    if (v10)
    {
      uint64_t v11 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__HAPAccessoryServerIP_httpClient_didReceiveHTTPMessageWithHeaders_body___block_invoke;
      block[3] = &unk_1E69F4708;
      block[4] = self;
      id v13 = v7;
      id v14 = v8;
      dispatch_async(v11, block);
    }
  }
  else
  {
  }
}

void __73__HAPAccessoryServerIP_httpClient_didReceiveHTTPMessageWithHeaders_body___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerIP:*(void *)(a1 + 32) didReceiveHTTPHeaders:*(void *)(a1 + 40) httpBody:*(void *)(a1 + 48)];
}

- (void)_handleListPairingsResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 httpError:(id)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  uint64_t v16 = a7;
  id v17 = a8;
  if (v15)
  {
    v18 = (void *)MEMORY[0x1D944E080]();
    BOOL v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v21;
      __int16 v48 = 2112;
      *(void *)long long v49 = v15;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to list-pairings with error %@", buf, 0x16u);
    }
    id v22 = v15;
LABEL_21:
    id v28 = v22;
LABEL_22:
    __int16 v27 = 0;
    goto LABEL_23;
  }
  if (!v14 || a4 != 2 || a5 != 200 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v33 = (void *)MEMORY[0x1D944E080]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v40 = v33;
      v36 = HMFGetLogIdentifier();
      uint64_t v37 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3) {
        id v38 = @"Invalid";
      }
      else {
        id v38 = off_1E69F2448[a4 - 1];
      }
      v39 = v38;
      *(_DWORD *)buf = 138544386;
      v47 = v36;
      __int16 v48 = 1024;
      *(_DWORD *)long long v49 = a5;
      *(_WORD *)&v49[4] = 2080;
      *(void *)&v49[6] = v37;
      *(_WORD *)&v49[14] = 2112;
      *(void *)&v49[16] = v39;
      __int16 v50 = 2112;
      id v51 = v14;
      _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response to list-pairings with HTTP status '%d %s', serializationType %@ responseObject %@", buf, 0x30u);

      v33 = v40;
    }

    id v22 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    goto LABEL_21;
  }
  __int16 v23 = (void *)MEMORY[0x1D944E080]();
  uint64_t v24 = self;
  int v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    double v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v26;
    _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Received valid response to list-pairings", buf, 0xCu);
  }
  id v45 = 0;
  __int16 v27 = +[HAPPairingUtilities parseListPairingsResponse:v14 error:&v45];
  id v28 = v45;
  if (!v27)
  {
    uint64_t v29 = (void *)MEMORY[0x1D944E080]();
    v30 = v24;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v47 = v32;
      __int16 v48 = 2112;
      *(void *)long long v49 = v14;
      *(_WORD *)&v49[8] = 2112;
      *(void *)&v49[10] = v28;
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse list-pairings response: %@ with error %@", buf, 0x20u);
    }
    goto LABEL_22;
  }
LABEL_23:
  if (v16 && v17)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118__HAPAccessoryServerIP__handleListPairingsResponseObject_type_httpStatus_httpError_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E69F4070;
    id v44 = v17;
    id v42 = v27;
    id v43 = v28;
    dispatch_async(v16, block);
  }
}

uint64_t __118__HAPAccessoryServerIP__handleListPairingsResponseObject_type_httpStatus_httpError_completionQueue_completionHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
  {
    id v25 = 0;
    id v8 = +[HAPPairingUtilities createListPairingsRequest:&v25];
    id v9 = v25;
    if (v8)
    {
      BOOL v10 = [@"/" stringByAppendingPathComponent:@"pairings"];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_1E69F0178;
      v19[4] = self;
      id v20 = v6;
      id v21 = v7;
      [(HAPAccessoryServerIP *)self sendPOSTRequestToURL:v10 request:v8 serializationType:2 completionHandler:v19];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      uint64_t v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v18;
        __int16 v28 = 2112;
        id v29 = v9;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create list pairings request payload with error: %@", buf, 0x16u);
      }
      if (!v6 || !v7) {
        goto LABEL_13;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke;
      block[3] = &unk_1E69F3C68;
      id v24 = v7;
      id v23 = v9;
      dispatch_async(v6, block);

      BOOL v10 = v24;
    }

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v11 = (void *)MEMORY[0x1D944E080]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v14;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing list-pairing", buf, 0xCu);
  }
  [(HAPAccessoryServerIP *)v12 _queueListPairingWithCompletionQueue:v6 completionHandler:v7];
  [(HAPAccessoryServerIP *)v12 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.listPairings"];
LABEL_14:
}

uint64_t __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __75__HAPAccessoryServerIP__listPairingsWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleListPairingsResponseObject:a2 type:a3 httpStatus:a4 httpError:a5 completionQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HAPAccessoryServerIP_listPairingsWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E69F4070;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__HAPAccessoryServerIP_listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _listPairingsWithCompletionQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v40 = 0;
  id v8 = [(HAPAccessoryServer *)self getControllerPairingIdentityWithError:&v40];
  id v9 = v40;
  id v10 = [v8 identifier];
  uint64_t v11 = [v8 publicKey];
  id v12 = [v11 data];

  if (!v9)
  {
    if (v12 && v10)
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      uint64_t v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v42 = v18;
        __int16 v43 = 2112;
        id v44 = v10;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending request to accessory to remove the pairing for the current controller: %@", buf, 0x16u);
      }
      BOOL v19 = [(HAPAccessoryServer *)v16 keyStore];
      id v20 = [(HAPAccessoryServer *)v16 identifier];
      id v21 = [(HAPAccessoryServer *)v16 clientQueue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_577;
      v27[3] = &unk_1E69F01C8;
      v27[4] = v16;
      id v28 = v10;
      id v29 = v12;
      id v30 = v19;
      id v31 = v20;
      id v32 = v6;
      id v33 = v7;
      id v22 = v20;
      id v14 = v19;
      dispatch_async(v21, v27);

      id v9 = 0;
      BOOL v13 = 1;
    }
    else
    {
      v45[0] = *MEMORY[0x1E4F28568];
      id v23 = [NSString stringWithFormat:@"Failed to remove the pairing for the current controller"];
      v46[0] = v23;
      v45[1] = *MEMORY[0x1E4F28588];
      id v24 = [MEMORY[0x1E4F28B50] mainBundle];
      id v25 = [v24 localizedStringForKey:@"There was no controller public key or controller username" value:&stru_1F2C4E778 table:0];
      v46[1] = v25;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

      id v9 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:27 userInfo:v14];
      BOOL v13 = 0;
      if (v6 && v7)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2;
        v34[3] = &unk_1E69F3C68;
        id v36 = v7;
        id v9 = v9;
        id v35 = v9;
        dispatch_async(v6, v34);

        BOOL v13 = 0;
      }
    }
    goto LABEL_13;
  }
  BOOL v13 = 0;
  if (v6 && v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v39 = v7;
    id v9 = v9;
    id v38 = v9;
    dispatch_async(v6, block);

    BOOL v13 = 0;
    id v14 = v39;
LABEL_13:
  }
  return v13;
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_577(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v2 clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_578;
  v6[3] = &unk_1E69F01A0;
  objc_copyWeak(&v11, &location);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 80);
  [v2 _removePairingWithIdentifier:v3 publicKey:v4 queue:v5 completion:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_578(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v8;
    __int16 v28 = 2112;
    id v29 = v3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Request to remove current controller pairing from accessory completed with error: %@", buf, 0x16u);
  }
  if (v6) {
    [v6 _reset];
  }
  [v6 setAuthenticated:0];
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v25 = 0;
  [v9 removeAccessoryKeyForName:v10 error:&v25];
  id v11 = v25;
  if (v11)
  {
    id v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = v6;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v15;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_INFO, "%{public}@After removing the accessory with 'Remove Pairing', we failed to remove accessory from the keychain with error %@", buf, 0x16u);
    }
    uint64_t v16 = *(NSObject **)(a1 + 48);
    if (v16)
    {
      id v17 = *(void **)(a1 + 56);
      if (v17)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_579;
        v23[3] = &unk_1E69F3B20;
        v18 = &v24;
        id v24 = v17;
        BOOL v19 = v23;
LABEL_14:
        dispatch_async(v16, v19);
      }
    }
  }
  else
  {
    uint64_t v16 = *(NSObject **)(a1 + 48);
    if (v16)
    {
      id v20 = *(void **)(a1 + 56);
      if (v20)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_580;
        block[3] = &unk_1E69F3B20;
        v18 = &v22;
        id v22 = v20;
        BOOL v19 = block;
        goto LABEL_14;
      }
    }
  }
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_579(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__HAPAccessoryServerIP_removePairingForCurrentControllerOnQueue_completion___block_invoke_2_580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handlePairingsResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 httpError:(id)a6 removeRequest:(BOOL)a7 completionQueue:(id)a8 completionBlock:(id)a9
{
  BOOL v10 = a7;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  if (v16)
  {
    BOOL v19 = v10;
    id v20 = (void *)MEMORY[0x1D944E080]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      id v24 = @"add";
      *(_DWORD *)buf = 138543874;
      uint64_t v62 = (uint64_t)v23;
      __int16 v63 = 2112;
      if (v19) {
        id v24 = @"remove";
      }
      v64 = v24;
      __int16 v65 = 2112;
      *(void *)v66 = v16;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to %@ pairing with error %@", buf, 0x20u);
    }
    id v25 = v16;
  }
  else if (v15 && a4 == 2 && a5 == 200 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v54 = v10;
    double v26 = (void *)MEMORY[0x1D944E080]();
    __int16 v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      uint64_t v30 = (void *)v29;
      id v31 = "add";
      if (v54) {
        id v31 = "remove";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v62 = v29;
      __int16 v63 = 2080;
      v64 = (void *)v31;
      _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Received valid response to %s pairing", buf, 0x16u);
    }
    if (v54)
    {
      uint64_t v60 = 0;
      BOOL v32 = +[HAPPairingUtilities parseRemovePairingResponse:v15 error:&v60];
      id v33 = v60;
    }
    else
    {
      v59 = 0;
      BOOL v32 = +[HAPPairingUtilities parseAddPairingResponse:v15 error:&v59];
      id v33 = v59;
    }
    id v25 = v33;
    if (!v32)
    {
      v41 = (void *)MEMORY[0x1D944E080]();
      id v42 = v27;
      __int16 v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v45 = id v44 = v15;
        v46 = "add";
        *(_DWORD *)buf = 138544130;
        __int16 v63 = 2080;
        uint64_t v62 = (uint64_t)v45;
        if (v54) {
          v46 = "remove";
        }
        v64 = (void *)v46;
        __int16 v65 = 2112;
        *(void *)v66 = v44;
        *(_WORD *)&v66[8] = 2112;
        *(void *)&v66[10] = v25;
        _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse %s pairing response: %@ with error %@", buf, 0x2Au);

        id v15 = v44;
      }
    }
    if (v25)
    {
      v47 = (void *)MEMORY[0x1D944E080]();
      __int16 v48 = v27;
      long long v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v50 = HMFGetLogIdentifier();
        id v51 = "add";
        *(_DWORD *)buf = 138544130;
        __int16 v63 = 2080;
        uint64_t v62 = (uint64_t)v50;
        if (v54) {
          id v51 = "remove";
        }
        v64 = (void *)v51;
        __int16 v65 = 2112;
        *(void *)v66 = v15;
        *(_WORD *)&v66[8] = 2112;
        *(void *)&v66[10] = v25;
        _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse %s pairing response: %@ with error %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v55 = v15;
    v34 = (void *)MEMORY[0x1D944E080]();
    id v35 = self;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v53 = v34;
      uint64_t v52 = HMFGetLogIdentifier();
      if (v10) {
        uint64_t v37 = "remove";
      }
      else {
        uint64_t v37 = "add";
      }
      uint64_t v38 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3) {
        id v39 = @"Invalid";
      }
      else {
        id v39 = off_1E69F2448[a4 - 1];
      }
      id v40 = v39;
      *(_DWORD *)buf = 138544642;
      uint64_t v62 = (uint64_t)v52;
      __int16 v63 = 2080;
      v64 = (void *)v37;
      __int16 v65 = 1024;
      *(_DWORD *)v66 = a5;
      *(_WORD *)&v66[4] = 2080;
      *(void *)&v66[6] = v38;
      *(_WORD *)&v66[14] = 2112;
      *(void *)&v66[16] = v40;
      __int16 v67 = 2112;
      id v68 = v55;
      _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response to %s /pairings with HTTP status '%d %s', serializationType %@ responseObject %@", buf, 0x3Au);

      v34 = v53;
    }

    id v25 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    id v15 = v55;
  }
  if (v17 && v18)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__HAPAccessoryServerIP__handlePairingsResponseObject_type_httpStatus_httpError_removeRequest_completionQueue_completionBlock___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v58 = v18;
    id v57 = v25;
    dispatch_async(v17, block);
  }
}

uint64_t __126__HAPAccessoryServerIP__handlePairingsResponseObject_type_httpStatus_httpError_removeRequest_completionQueue_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_sendRemovePairingWithData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [@"/" stringByAppendingPathComponent:@"pairings"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HAPAccessoryServerIP__sendRemovePairingWithData_queue_completion___block_invoke;
  v14[3] = &unk_1E69F0178;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(HAPAccessoryServerIP *)self sendPOSTRequestToURL:v11 request:v10 serializationType:2 completionHandler:v14];
}

uint64_t __68__HAPAccessoryServerIP__sendRemovePairingWithData_queue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handlePairingsResponseObject:a2 type:a3 httpStatus:a4 httpError:a5 removeRequest:1 completionQueue:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)_establishSecureSessionAndRemovePairing:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self keyStore];
  id v12 = [(HAPAccessoryServer *)self identifier];
  id v23 = 0;
  id v13 = [v11 readPublicKeyForAccessoryName:v12 registeredWithHomeKit:0 error:&v23];
  id v14 = v23;

  if (v13)
  {
    if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
    {
      [(HAPAccessoryServerIP *)self _kickConnectionIdleTimer];
      [(HAPAccessoryServerIP *)self _sendRemovePairingWithData:v8 queue:v9 completion:v10];
    }
    else
    {
      [(HAPAccessoryServerIP *)self _suspendConnectionIdleTimer];
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke;
      v17[3] = &unk_1E69F01F0;
      objc_copyWeak(&v21, &location);
      id v18 = v8;
      BOOL v19 = v9;
      id v20 = v10;
      [(HAPAccessoryServerIP *)self setPairVerifyCompletionBlock:v17];
      [(HAPAccessoryServer *)self setMetric_pairVerifyReason:@"pairingRemove"];
      [(HAPAccessoryServerIP *)self _establishSecureSession];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else if (v9 && v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_3;
    block[3] = &unk_1E69F3B20;
    id v16 = v10;
    dispatch_async(v9, block);
  }
}

void __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a1 + 7;
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained clientQueue];
  dispatch_assert_queue_V2(v6);

  LODWORD(v6) = [WeakRetained shouldRetryPVDueToAuthenticationError:v4];
  if (v6)
  {
    id v7 = [WeakRetained clientQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_2;
    v8[3] = &unk_1E69F3D58;
    v8[4] = WeakRetained;
    id v9 = a1[4];
    id v10 = a1[5];
    id v11 = a1[6];
    dispatch_async(v7, v8);
  }
  else
  {
    [WeakRetained _sendRemovePairingWithData:a1[4] queue:a1[5] completion:a1[6]];
  }
}

uint64_t __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__HAPAccessoryServerIP__establishSecureSessionAndRemovePairing_queue_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _establishSecureSessionAndRemovePairing:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_removePairingWithIdentifier:(id)a3 publicKey:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v11];
  id v15 = [[HAPPairingIdentity alloc] initWithIdentifier:v10 publicKey:v14 privateKey:0 permissions:0];
  id v25 = 0;
  id v16 = +[HAPPairingUtilities createRemovePairingRequestForPairingIdentity:v15 error:&v25];
  id v17 = v25;
  if (v16)
  {
    [(HAPAccessoryServerIP *)self _establishSecureSessionAndRemovePairing:v16 queue:v12 completion:v13];
  }
  else
  {
    context = (void *)MEMORY[0x1D944E080]();
    id v18 = self;
    BOOL v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v20;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remove pairing request payload with error: %@", buf, 0x16u);
    }
    if (v12 && v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__HAPAccessoryServerIP__removePairingWithIdentifier_publicKey_queue_completion___block_invoke;
      block[3] = &unk_1E69F3C68;
      id v23 = v17;
      id v24 = v13;
      dispatch_async(v12, block);
    }
  }
}

void __80__HAPAccessoryServerIP__removePairingWithIdentifier_publicKey_queue_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Remove pairing failed." reason:@"Failed to create remove pairing request payload." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HAPAccessoryServerIP_removePairing_completionQueue_completionHandler___block_invoke;
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

void __72__HAPAccessoryServerIP_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) identifier];
  id v3 = [*(id *)(a1 + 40) publicKey];
  id v4 = [v3 data];
  [v2 _removePairingWithIdentifier:v5 publicKey:v4 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_startAddPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v13];
  id v17 = [[HAPPairingIdentity alloc] initWithIdentifier:v12 publicKey:v16 privateKey:0 permissions:v9];
  id v38 = 0;
  id v18 = +[HAPPairingUtilities createAddPairingRequestForPairingIdentity:v17 error:&v38];
  id v31 = v38;
  if (v18)
  {
    BOOL v19 = [@"/" stringByAppendingPathComponent:@"pairings"];
    if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_549;
      v32[3] = &unk_1E69F0178;
      v32[4] = self;
      id v33 = v14;
      id v34 = v15;
      [(HAPAccessoryServerIP *)self sendPOSTRequestToURL:v19 request:v18 serializationType:2 completionHandler:v32];
    }
    else
    {
      id v30 = v15;
      context = (void *)MEMORY[0x1D944E080]();
      id v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v26 = id v27 = v12;
        *(_DWORD *)buf = 138543362;
        id v40 = v26;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing add-pairing", buf, 0xCu);

        id v12 = v27;
      }

      id v15 = v30;
      [(HAPAccessoryServerIP *)v24 _queueAddPairingWithIdentifier:v12 publicKey:v13 admin:v9 queue:v14 completion:v30];
      [(HAPAccessoryServerIP *)v24 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"pairingAdd"];
    }
    goto LABEL_12;
  }
  id v20 = (void *)MEMORY[0x1D944E080]();
  id v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = id v29 = v15;
    *(_DWORD *)buf = 138543618;
    id v40 = v23;
    __int16 v41 = 2112;
    id v42 = v31;
    _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create add pairing request payload with error: %@", buf, 0x16u);

    id v15 = v29;
  }

  if (v14 && v15)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v36 = v31;
    id v37 = v15;
    dispatch_async(v14, block);

    BOOL v19 = v36;
LABEL_12:
  }
}

void __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:12 description:@"Add pairing failed." reason:@"Failed to create add pairing request payload." suggestion:0 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __88__HAPAccessoryServerIP__startAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_549(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handlePairingsResponseObject:a2 type:a3 httpStatus:a4 httpError:a5 removeRequest:0 completionQueue:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HAPAccessoryServerIP_addPairing_completionQueue_completionHandler___block_invoke;
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

void __69__HAPAccessoryServerIP_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) permissions] & 1;
  id v3 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) identifier];
  id v4 = [*(id *)(a1 + 32) publicKey];
  id v5 = [v4 data];
  [v3 _startAddPairingWithIdentifier:v6 publicKey:v5 admin:v2 queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)savePairedPeerDelegateCallback
{
  return _SavePairedPeerDelegateCallback_f;
}

- (void)findPairedPeerDelegateCallback
{
  return _FindPairedPeerDelegateCallback_f;
}

- (void)copyPairingIdentityDelegateCallback
{
  return _CopyPairingIdentityDelegateCallback_f;
}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v5 = a4;
  id v6 = [(HAPAccessoryServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke;
  v8[3] = &unk_1E69F46E0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) code];
    *(_DWORD *)buf = 138543618;
    id v23 = v5;
    __int16 v24 = 2048;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Auth Complete with status: %ld", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (!v8) {
    id v8 = *(id *)(a1 + 40);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_535;
  v20[3] = &unk_1E69F46E0;
  v20[4] = *(void *)(a1 + 32);
  id v9 = v8;
  id v21 = v9;
  __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_535((uint64_t)v20);
  id v10 = [*(id *)(a1 + 32) delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) delegateQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_2;
    v18[3] = &unk_1E69F46E0;
    id v13 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v13;
    dispatch_async(v12, v18);
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v23 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Does not implement accessoryServer:didFinishAuth:", buf, 0xCu);
    }
  }
}

void __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_535(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    uint64_t v2 = v3;
  }
}

void __49__HAPAccessoryServerIP_authSession_authComplete___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didFinishAuth:*(void *)(a1 + 40)];
}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke;
  v15[3] = &unk_1E69F4098;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v5 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement accessoryServer:confirmUUID:token:", buf, 0xCu);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
    [v10 authSession:v11 authComplete:v12];
  }
}

void __54__HAPAccessoryServerIP_authSession_confirmUUID_token___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) confirmUUID:*(void *)(a1 + 40) token:*(void *)(a1 + 48)];
}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke;
  v15[3] = &unk_1E69F4098;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke_2;
    block[3] = &unk_1E69F4708;
    id v5 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v17 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authenticateUUID:token1:token2:", buf, 0xCu);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
    [v10 authSession:v11 authComplete:v12];
  }
}

void __59__HAPAccessoryServerIP_authSession_authenticateUUID_token___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) authenticateUUID:*(void *)(a1 + 40) token:*(void *)(a1 + 48)];
}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HAPAccessoryServer *)self clientQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke;
  v15[3] = &unk_1E69F4098;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke(id *a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if ([a1[4] isPreSoftAuthWacStarted])
  {
    objc_initWeak(location, a1[4]);
    [a1[4] _notifyDelegateOfPairingProgress:3];
    id v2 = [a1[4] hapWACAccessoryClient];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_2;
    v17[3] = &unk_1E69F0950;
    objc_copyWeak(&v21, location);
    id v18 = a1[5];
    id v19 = a1[6];
    id v20 = a1[7];
    id v3 = (id)[v2 restoreNetworkWithCompletion:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    id v4 = [a1[4] delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      [a1[4] _notifyDelegateOfPairingProgress:5];
      uint64_t v6 = [a1[4] delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_530;
      block[3] = &unk_1E69F4708;
      void block[4] = a1[4];
      id v15 = a1[5];
      id v16 = a1[6];
      dispatch_async(v6, block);
    }
    else
    {
      id v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = a1[4];
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = v10;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", (uint8_t *)location, 0xCu);
      }
      id v11 = a1[4];
      id v12 = a1[7];
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
      [v11 authSession:v12 authComplete:v13];
    }
  }
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  char v5 = [WeakRetained clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_3;
  block[3] = &unk_1E69F20B0;
  id v8 = v3;
  id v9 = WeakRetained;
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[6];
  id v6 = v3;
  dispatch_async(v5, block);
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_530(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  char v5 = [v2 authenticatedProtocolInfo];
  id v6 = [v5 modelName];
  [v7 accessoryServer:v2 validateUUID:v3 token:v4 model:v6];
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_3(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      char v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v37 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to restore back to infrastructure network", buf, 0xCu);
    }
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v34 = *MEMORY[0x1E4F28A50];
    uint64_t v35 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v9 = [v6 errorWithDomain:@"HAPErrorDomain" code:1 userInfo:v8];

    [*(id *)(a1 + 40) authSession:*(void *)(a1 + 64) authComplete:v9];
    return;
  }
  [*(id *)(a1 + 40) _notifyDelegateOfPairingProgress:4];
  id v10 = [*(id *)(a1 + 40) networkMonitor];
  int v11 = [v10 isReachable];

  if (!v11)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_525;
    v29[3] = &unk_1E69F46E0;
    id v17 = *(void **)(a1 + 48);
    v29[4] = *(void *)(a1 + 40);
    id v30 = v17;
    __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_525((uint64_t)v29);
    id v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = *(id *)(a1 + 40);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v37 = v21;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Network is not reachable: Waiting...", buf, 0xCu);
    }
    [*(id *)(a1 + 40) setTokenValidationPending:1];
    id v16 = v30;
    goto LABEL_11;
  }
  id v12 = [*(id *)(a1 + 40) delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    [*(id *)(a1 + 40) _notifyDelegateOfPairingProgress:5];
    id v14 = [*(id *)(a1 + 40) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_4;
    block[3] = &unk_1E69F4708;
    id v15 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v32 = v15;
    id v33 = *(id *)(a1 + 56);
    dispatch_async(v14, block);

    id v16 = v32;
LABEL_11:

    return;
  }
  id v22 = (void *)MEMORY[0x1D944E080]();
  id v23 = *(id *)(a1 + 40);
  __int16 v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v37 = v25;
    _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", buf, 0xCu);
  }
  uint64_t v26 = *(void **)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 64);
  __int16 v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
  [v26 authSession:v27 authComplete:v28];
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_4(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  char v5 = [v2 authenticatedProtocolInfo];
  id v6 = [v5 modelName];
  [v7 accessoryServer:v2 validateUUID:v3 token:v4 model:v6];
}

void __55__HAPAccessoryServerIP_authSession_validateUUID_token___block_invoke_525(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) pairingActivity];
}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Sending Auth Exchange with data: %@", buf, 0x16u);
  }
  id v12 = [(HAPAccessoryServer *)v9 clientQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke;
  v14[3] = &unk_1E69F46E0;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  char v5 = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2;
  id v6 = &unk_1E69F0088;
  objc_copyWeak(&v7, &location);
  id v2 = (void *)MEMORY[0x1D944E2D0](&v3);
  objc_msgSend(*(id *)(a1 + 32), "sendPOSTRequestToURL:request:serializationType:completionHandler:", @"/secure-message", *(void *)(a1 + 40), 3, v2, v3, v4, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v11 = WeakRetained;
  if (!v8 || v9)
  {
    id v13 = (void *)MEMORY[0x1D944E080]();
    id v14 = v11;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        id v17 = @"Invalid";
      }
      else {
        id v17 = off_1E69F2448[a3 - 1];
      }
      __int16 v18 = v17;
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed Auth request, received response object: %@, MIME type: %@, error: %@", buf, 0x2Au);
    }
    id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:8 userInfo:0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_520;
    v23[3] = &unk_1E69F46E0;
    void v23[4] = v14;
    id v20 = v19;
    id v24 = v20;
    __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_520((uint64_t)v23);
    if ([v14 _delegateRespondsToSelector:sel_accessoryServer_didFinishAuth_])
    {
      id v21 = [v14 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2_524;
      block[3] = &unk_1E69F4330;
      void block[4] = v14;
      dispatch_async(v21, block);
    }
  }
  else
  {
    id v12 = [WeakRetained authSession];
    [v12 handleAuthExchangeData:v8 withHeader:1];
  }
}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_520(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __57__HAPAccessoryServerIP_authSession_sendAuthExchangeData___block_invoke_2_524(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:8 userInfo:0];
  [v4 accessoryServer:v2 didFinishAuth:v3];
}

- (void)tearDownSessionOnAuthCompletion
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HAPAccessoryServerIP_tearDownSessionOnAuthCompletion__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__HAPAccessoryServerIP_tearDownSessionOnAuthCompletion__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAuthenticated:1];
  uint64_t v2 = [*(id *)(a1 + 32) authSession];
  [v2 resetSession];

  id v3 = *(void **)(a1 + 32);

  return [v3 _tearDownSession];
}

- (void)provisionToken:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Provisioning Tokens T1: %@", buf, 0x16u);
  }
  id v9 = [(HAPAccessoryServer *)v6 clientQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__HAPAccessoryServerIP_provisionToken___block_invoke;
  v11[3] = &unk_1E69F46E0;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

void __39__HAPAccessoryServerIP_provisionToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authSession];
  [v2 sendTokenUpdateRequest:*(void *)(a1 + 40)];
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v5 = (void *)MEMORY[0x1D944E080](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = [(HAPAccessoryServer *)v6 pairSetupType];
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Current Pair Setup Type %tu", buf, 0x16u);
  }
  id v9 = [(HAPAccessoryServer *)v6 clientQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke;
  v10[3] = &unk_1E69F3DF8;
  v10[4] = v6;
  BOOL v11 = a3;
  dispatch_async(v9, v10);
}

void __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) authMethod] == 2)
  {
    id v6 = [*(id *)(a1 + 32) authSession];
    [v6 continueAuthAfterValidation:*(unsigned __int8 *)(a1 + 40)];

    return;
  }
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_15;
  }
  if ([*(id *)(a1 + 32) authMethod] == 4 || objc_msgSend(*(id *)(a1 + 32), "authMethod") == 6)
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _continuePairingAfterMFiCertValidation];
    return;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
LABEL_15:
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"HAPErrorDomain" code:16 userInfo:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke_2;
    v7[3] = &unk_1E69F46E0;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    id v5 = v4;
    __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke_2((uint64_t)v7);
    [*(id *)(a1 + 32) _notifyDelegatesOfAddAccessoryFailureWithError:v5];
    [*(id *)(a1 + 32) _tearDownSessionAndStartReachabilityWithError:v5];
    [*(id *)(a1 + 32) _processQueuedOperationsWithError:v5];

    return;
  }
  id v3 = *(void **)(a1 + 32);

  [v3 _continuePairingAfterAuthPromptWithRetry:1];
}

void __52__HAPAccessoryServerIP_continueAuthAfterValidation___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

- (void)authenticateAccessory
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HAPAccessoryServerIP_authenticateAccessory__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __45__HAPAccessoryServerIP_authenticateAccessory__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) authSession];
  [v1 handleAuthExchangeData:0 withHeader:1];
}

- (BOOL)_validateAuthChallengeResponse:(id)a3 expectedTID:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = 0;
  id v36 = 0;
  BOOL v9 = +[HAPProtocolMessages parseAuthChallengeResponse:v8 expectedTID:v6 outChallengeResponse:&v36 outMFICert:&v35 withHeader:1];
  id v10 = v36;
  id v11 = v35;
  if (v9)
  {
    uint64_t v34 = a5;
    PairingSessionDeriveKey();
    id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v41 length:32];
    id v13 = (void *)MEMORY[0x1D944E080]();
    __int16 v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      uint64_t v17 = objc_msgSend(v12, "hmf_hexadecimalRepresentation");
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v16;
      __int16 v39 = 2112;
      id v40 = v17;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Derived nonce: %@", buf, 0x16u);
    }
    id v18 = v12;
    [v18 bytes];
    [v18 length];
    id v19 = v10;
    [v19 bytes];
    [v19 length];
    id v20 = v11;
    [v20 bytes];
    [v20 length];
    uint64_t v21 = MFiPlatform_VerifySignature();
    BOOL v22 = v21 == 0;
    id v23 = v34;
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = (void *)MEMORY[0x1D944E080]();
      uint64_t v26 = v14;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v28;
        __int16 v39 = 1024;
        LODWORD(v40) = v24;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Unable to verify the signature, got error: %d", buf, 0x12u);

        id v23 = v34;
      }

      if (v23)
      {
        if (v24 == -67808) {
          [MEMORY[0x1E4F28C58] hapErrorWithCode:17];
        }
        else {
          HMErrorFromOSStatus(v24);
        }
        id *v23 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x1D944E080]();
    id v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)__int16 v41 = 138543362;
      id v42 = v32;
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse auth challenge response", v41, 0xCu);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:15];
      BOOL v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v22 = 0;
    }
  }

  return v22;
}

- (void)_validatePairingAuthMethod:(id)a3 activity:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *, uint64_t))a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v8);

  if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
  {
    if ((self->_featureFlags & 0x20) == 0)
    {
      BOOL v9 = (void *)MEMORY[0x1D944E080]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v57 = v12;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Not sending auth challenge request because the accessory doesn't claim to support it", buf, 0xCu);
      }
      id v13 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3];
      v6[2](v6, v13, 5);

      goto LABEL_11;
    }
    if (!self->_featureFlags)
    {
      uint64_t v26 = 0;
      goto LABEL_19;
    }
    if (self->_featureFlags)
    {
      LOBYTE(location) = 0;
      id v32 = +[HAPProtocolMessages constructAuthChallengeRequest:&unk_1F2C80868 nonce:0 outTID:&location];
      uint64_t v33 = (void *)MEMORY[0x1D944E080]();
      uint64_t v34 = self;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v57 = v36;
        _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Sending auth challenge request", buf, 0xCu);
      }
      objc_initWeak((id *)buf, v34);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke_504;
      v46[3] = &unk_1E69F0150;
      objc_copyWeak(v49, (id *)buf);
      __int16 v48 = v6;
      id v37 = v7;
      char v50 = (char)location;
      id v47 = v37;
      v49[1] = (id)1;
      uint64_t v38 = (void *)MEMORY[0x1D944E2D0](v46);
      [v37 markWithReason:@"Sending auth challenge request"];
      [(HAPAccessoryServerIP *)v34 sendPOSTRequestToURL:@"/secure-message" request:v32 serializationType:3 completionHandler:v38];

      objc_destroyWeak(v49);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if ((self->_featureFlags & 2) != 0)
      {
        uint64_t v39 = 2;
      }
      else if ((self->_featureFlags & 8) != 0)
      {
        uint64_t v39 = 4;
      }
      else
      {
        if ((self->_featureFlags & 0x10) == 0)
        {
          uint64_t v26 = 5;
LABEL_19:
          __int16 v27 = (void *)MEMORY[0x1D944E080]();
          id v28 = self;
          __int16 v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = HMFGetLogIdentifier();
            __int16 v31 = off_1E69EFD28[v26];
            *(_DWORD *)buf = 138543618;
            id v57 = v30;
            __int16 v58 = 2112;
            v59 = v31;
            _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Not sending auth challenge because the auth method doesn't support auth challenges or is unknown: %@", buf, 0x16u);
          }
          v6[2](v6, 0, v26);
          goto LABEL_11;
        }
        uint64_t v39 = 6;
      }
      id v40 = (void *)MEMORY[0x1D944E080]();
      __int16 v41 = self;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = HMFGetLogIdentifier();
        id v44 = off_1E69EFD28[v39];
        *(_DWORD *)buf = 138543618;
        id v57 = v43;
        __int16 v58 = 2112;
        v59 = v44;
        _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Not sending auth challenge due to unsupported auth type: %@", buf, 0x16u);
      }
      id v45 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9];
      v6[2](v6, v45, 5);
    }
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x1D944E080]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v57 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and then doing auth challenge request", buf, 0xCu);
    }
    objc_initWeak(&location, v15);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke;
    v51[3] = &unk_1E69F1150;
    v53 = v6;
    objc_copyWeak(&v54, &location);
    id v18 = v7;
    id v52 = v18;
    id v19 = (void *)MEMORY[0x1D944E2D0](v51);
    id v20 = (void *)MEMORY[0x1D944E080]();
    uint64_t v21 = v15;
    HMFGetOSLogHandle();
    BOOL v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v57 = v23;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing auth challenge request until pair-verify completes", buf, 0xCu);
    }
    [v18 markWithReason:@"Queuing"];
    uint64_t v24 = [(HAPAccessoryServerIP *)v21 queuedOperations];
    uint64_t v25 = (void *)MEMORY[0x1D944E2D0](v19);
    [v24 addObject:v25];

    [(HAPAccessoryServerIP *)v21 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.validatePairingAuthMethod"];
    objc_destroyWeak(&v54);

    objc_destroyWeak(&location);
  }
LABEL_11:
}

void __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [*(id *)(a1 + 32) begin];
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _validatePairingAuthMethod:*(void *)(a1 + 40) activity:*(void *)(a1 + 32)];
    __HMFActivityScopeLeave();
  }
}

void __60__HAPAccessoryServerIP__validatePairingAuthMethod_activity___block_invoke_504(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (v9 || !v8 || !WeakRetained)
  {
    uint64_t v25 = (void *)MEMORY[0x1D944E080]();
    id v26 = v11;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        __int16 v29 = @"Invalid";
      }
      else {
        __int16 v29 = off_1E69F2448[a3 - 1];
      }
      id v30 = v29;
      *(_DWORD *)buf = 138544130;
      id v35 = v28;
      __int16 v36 = 2112;
      id v37 = v8;
      __int16 v38 = 2112;
      uint64_t v39 = v30;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed sending auth Request, received response object: %@, MIME type: %@, error: %@", buf, 0x2Au);
    }
    id v18 = [MEMORY[0x1E4F28C58] hapErrorWithCode:14 description:@"Unknown error retrieving auth status" reason:0 suggestion:0 underlyingError:v9];
    goto LABEL_16;
  }
  id v12 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) markWithReason:@"Handling auth response"]);
  id v13 = v11;
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v35 = v15;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Received auth response: %@", buf, 0x16u);
  }
  uint64_t v16 = *(unsigned __int8 *)(a1 + 64);
  id v33 = 0;
  char v17 = [v13 _validateAuthChallengeResponse:v8 expectedTID:v16 error:&v33];
  id v18 = v33;
  if ((v17 & 1) == 0)
  {
LABEL_16:
    __int16 v31 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_20;
  }
  id v19 = (void *)MEMORY[0x1D944E080]();
  id v20 = v13;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    BOOL v22 = HMFGetLogIdentifier();
    unint64_t v23 = *(void *)(a1 + 56);
    if (v23 > 6) {
      uint64_t v24 = @"HAPAuthMethodUnknown";
    }
    else {
      uint64_t v24 = off_1E69EFD28[v23];
    }
    id v32 = v24;
    *(_DWORD *)buf = 138543618;
    id v35 = v22;
    __int16 v36 = 2112;
    id v37 = v32;
    _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Auth challenge completed successfully with auth method: %@", buf, 0x16u);
  }
  __int16 v31 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_20:
  v31();
}

- (void)validatePairingAuthMethod:(id)a3
{
  id v4 = a3;
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"validatePairingAuthMethod"];
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HAPAccessoryServerIP_validatePairingAuthMethod___block_invoke;
  v7[3] = &unk_1E69F4070;
  v7[4] = self;
  id v9 = v4;
  id v8 = v10;
  id v6 = v4;
  dispatch_async(v5, v7);

  __HMFActivityScopeLeave();
}

uint64_t __50__HAPAccessoryServerIP_validatePairingAuthMethod___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validatePairingAuthMethod:*(void *)(a1 + 48) activity:*(void *)(a1 + 40)];
}

- (BOOL)_validateProtocolInfo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 deviceIdentifier];
  id v6 = [(HAPAccessoryServer *)self identifier];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_7;
  }
  int v7 = [v4 categoryIdentifier];
  id v8 = [(HAPAccessoryServer *)self category];
  if (v7 != [v8 unsignedShortValue]
    || self->_featureFlags != [v4 featureFlags])
  {

LABEL_7:
    goto LABEL_8;
  }
  id v9 = [v4 protocolVersion];
  id v10 = [(HAPAccessoryServer *)self version];
  char v11 = [v9 isEqual:v10];

  if (v11)
  {
    BOOL v12 = 1;
    goto LABEL_11;
  }
LABEL_8:
  id v13 = (void *)MEMORY[0x1D944E080]();
  __int16 v14 = self;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    char v17 = [(HAPAccessoryServer *)v14 category];
    uint64_t v18 = [(HAPAccessoryServer *)v14 authMethod];
    id v19 = [(HAPAccessoryServer *)v14 version];
    int v21 = 138544386;
    BOOL v22 = v16;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v17;
    __int16 v27 = 2048;
    uint64_t v28 = v18;
    __int16 v29 = 2112;
    id v30 = v19;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated Info %@ does not match category: %@, authMethods: %tu version: %@", (uint8_t *)&v21, 0x34u);
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)getAccessoryInfo:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__693;
  void v13[4] = __Block_byref_object_dispose__694;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke;
  v7[3] = &unk_1E69F0128;
  id v9 = v13;
  id v10 = v11;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Getting Acc Info", buf, 0xCu);
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke_493;
  v14[3] = &unk_1E69F0100;
  objc_copyWeak(&v17, &location);
  uint64_t v16 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v13;
  long long v15 = v13;
  int v7 = (void *)MEMORY[0x1D944E2D0](v14);
  id v8 = +[HAPProtocolMessages constructInfoRequest:&unk_1F2C80868 outTID:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  id v9 = (void *)MEMORY[0x1D944E080]();
  id v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  char v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    char v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v12;
    __int16 v21 = 2112;
    BOOL v22 = v8;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending Acc Info Request: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) sendPOSTRequestToURL:@"/secure-message" request:v8 serializationType:3 completionHandler:v7];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __41__HAPAccessoryServerIP_getAccessoryInfo___block_invoke_493(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v8 || v9)
  {
    char v11 = (void *)MEMORY[0x1D944E080]();
    id v12 = WeakRetained;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        long long v15 = @"Invalid";
      }
      else {
        long long v15 = off_1E69F2448[a3 - 1];
      }
      uint64_t v16 = v15;
      int v29 = 138544130;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed sending Acc Info Request, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v29, 0x2Au);
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:8 userInfo:0];
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  id v20 = (void *)MEMORY[0x1D944E080]();
  id v21 = WeakRetained;
  BOOL v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    int v29 = 138543618;
    id v30 = v23;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Received Acc Info response: %@", (uint8_t *)&v29, 0x16u);
  }
  id v24 = +[HAPProtocolMessages parseInfoResponse:v8 expectedTID:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) withHeader:1];
  [v21 setAuthenticatedProtocolInfo:v24];

  __int16 v25 = [v21 authenticatedProtocolInfo];
  int v26 = [v21 _validateProtocolInfo:v25];

  uint64_t v27 = *(void *)(a1 + 32);
  if (v26)
  {
    (*(void (**)(void, void))(v27 + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:7 userInfo:0];
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
  }
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HAPAccessoryServerIP_networkMonitorIsUnreachable___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HAPAccessoryServerIP_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) networkMonitor];

  if (v2 == v3)
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Network is unavailable, suspending all streams", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)networkMonitorIsReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke;
  v7[3] = &unk_1E69F46E0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) networkMonitor];

  if (v2 == v3)
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v40 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Network is available, resuming all streams", buf, 0xCu);
    }
    if ([*(id *)(a1 + 40) isTokenValidationPending])
    {
      [*(id *)(a1 + 40) setTokenValidationPending:0];
      id v8 = [*(id *)(a1 + 40) delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = [*(id *)(a1 + 40) authSession];
        id v35 = 0;
        id v36 = 0;
        int v11 = [v10 getToken:&v36 uuid:&v35];
        id v12 = v36;
        id v13 = v35;

        if (v11)
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_488;
          v33[3] = &unk_1E69F46E0;
          v33[4] = *(void *)(a1 + 40);
          id v14 = v13;
          id v34 = v14;
          __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_488((uint64_t)v33);
          long long v15 = [*(id *)(a1 + 40) delegateQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_2;
          block[3] = &unk_1E69F4708;
          void block[4] = *(void *)(a1 + 40);
          id v13 = v14;
          id v31 = v13;
          id v12 = v12;
          id v32 = v12;
          dispatch_async(v15, block);
        }
        else
        {
          id v21 = (void *)MEMORY[0x1D944E080]();
          id v22 = *(id *)(a1 + 40);
          uint64_t v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            __int16 v40 = v24;
            _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get validation info", buf, 0xCu);
          }
          uint64_t v37 = *MEMORY[0x1E4F28A50];
          __int16 v25 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3];
          __int16 v38 = v25;
          int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];

          uint64_t v27 = *(void **)(a1 + 40);
          uint64_t v28 = [v27 authSession];
          int v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:v26];
          [v27 authSession:v28 authComplete:v29];
        }
      }
      else
      {
        uint64_t v16 = (void *)MEMORY[0x1D944E080]();
        id v17 = *(id *)(a1 + 40);
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          id v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v40 = v19;
          _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement validateUUID:token1:token2:", buf, 0xCu);
        }
        id v20 = *(void **)(a1 + 40);
        id v12 = [v20 authSession];
        id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:1 userInfo:0];
        [v20 authSession:v12 authComplete:v13];
      }
    }
  }
}

void __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_488(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pairingActivity];
}

void __50__HAPAccessoryServerIP_networkMonitorIsReachable___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 authenticatedProtocolInfo];
  id v6 = [v5 modelName];
  [v7 accessoryServer:v2 validateUUID:v3 token:v4 model:v6];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPAccessoryServerIP *)self bonjourEventTimer];

  if (v6 == v4)
  {
    char v9 = (void *)MEMORY[0x1D944E080]();
    uint64_t v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v12;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Timed out waiting for Bonjour event after legacy WAC completion - aborting...", buf, 0xCu);
    }
    id v13 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:8];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __37__HAPAccessoryServerIP_timerDidFire___block_invoke;
    id v19 = &unk_1E69F46E0;
    id v20 = v10;
    id v21 = v13;
    id v14 = v13;
    __37__HAPAccessoryServerIP_timerDidFire___block_invoke((uint64_t)&v16);
    -[HAPAccessoryServerIP _notifyDelegatesOfAddAccessoryFailureWithError:](v10, "_notifyDelegatesOfAddAccessoryFailureWithError:", v14, v16, v17, v18, v19, v20);
    [(HAPAccessoryServerIP *)v10 setBonjourEventTimer:0];
  }
  else
  {
    id v7 = [(HAPAccessoryServerIP *)self reachabilityEventTimer];

    if (v7 == v4)
    {
      [(HAPAccessoryServerIP *)self _validateReachabilityTimer];
      long long v15 = [(HAPAccessoryServerIP *)self reachabilityEventTimer];
      [v15 suspend];

      [(HAPAccessoryServerIP *)self pollAccessory];
    }
    else
    {
      id v8 = [(HAPAccessoryServerIP *)self connectionIdleTimer];

      if (v8 == v4) {
        [(HAPAccessoryServerIP *)self _handleConnectionIdleTimeout];
      }
    }
  }
}

void __37__HAPAccessoryServerIP_timerDidFire___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

- (void)_validateReachabilityTimer
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = NSNumber;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:self->_reachabilityStartTime];
  id v6 = objc_msgSend(v4, "numberWithDouble:");

  [(HAPAccessoryServerIP *)self _getReachabilityTimeoutValue];
  double v8 = v7;
  char v9 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v10 = [v9 preferenceForKey:@"HAPReachabilityTimerDelayToleranceInSeconds"];
  int v11 = [v10 numberValue];

  [v6 doubleValue];
  double v13 = v12;
  uint64_t v14 = [v11 doubleValue];
  if (v13 > v8 + v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1D944E080](v14);
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      double v29 = v8;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@Reachability timer late actual duration %@  expected %0.3f", buf, 0x20u);
    }
    id v20 = objc_msgSend(NSNumber, "numberWithDouble:", v8, @"HAPAccessoryDuration", @"HAPAccessoryExpectedDuration", v6);
    v23[1] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:2];

    [(HAPAccessoryServer *)v17 notifyClients:4 withDictionary:v21];
  }
}

- (BOOL)_handleSecureSessionClosingWithError:(id *)a3 status:(int)a4 data:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  BOOL v9 = [(HAPAccessoryServer *)self useHH2];
  char v10 = 0;
  if (a3)
  {
    if (v9)
    {
      uint64_t v11 = [v8 length];
      char v10 = 0;
      if (v5)
      {
        if (v11)
        {
          double v12 = [MEMORY[0x1E4F28C58] errorWithOSStatus:v5];
          id v21 = v12;
          [(HAPAccessoryServer *)self securitySessionWillCloseWithResponseData:v8 error:&v21];
          id v13 = v21;

          uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithOSStatus:4294960542];
          int v15 = [v13 isEqual:v14];

          if (v15)
          {
            uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v17 = [*a3 domain];
            uint64_t v18 = [*a3 code];
            uint64_t v22 = *MEMORY[0x1E4F28A50];
            v23[0] = v13;
            id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
            *a3 = [v16 errorWithDomain:v17 code:v18 userInfo:v19];
          }
          char v10 = v15 ^ 1;
        }
      }
    }
  }

  return v10;
}

- (int)_handlePairVerifyCompletionWithData:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__693;
  v46 = __Block_byref_object_dispose__694;
  id v47 = 0;
  uint64_t v49 = 0;
  char v50 = 0;
  char v48 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke;
  v39[3] = &unk_1E69F4128;
  id v5 = v4;
  id v40 = v5;
  uint64_t v41 = self;
  id v6 = (void *)MEMORY[0x1D944E2D0](v39);
  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_3;
  v34[3] = &unk_1E69F00D8;
  objc_copyWeak(&v37, &location);
  id v36 = &v42;
  id v7 = v6;
  id v35 = v7;
  id v8 = (void *)MEMORY[0x1D944E2D0](v34);
  id v9 = v5;
  [v9 bytes];
  [v9 length];
  uint64_t v10 = PairingSessionExchange();
  if (v10) {
    goto LABEL_5;
  }
  if (!v48)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v50 length:v49];
    id v13 = (void *)v43[5];
    v43[5] = v12;

    [(HAPAccessoryServerIP *)self sendPOSTRequestToURL:@"/pair-verify" request:v43[5] serializationType:2 completionHandler:v8];
    id v11 = 0;
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = PairingSessionDeriveKey();
  if (v10 || (uint64_t v10 = PairingSessionDeriveKey(), v10))
  {
LABEL_5:
    id v11 = 0;
    goto LABEL_8;
  }
  uint64_t v23 = [(HAPAccessoryServerIP *)self httpClient];
  id v33 = 0;
  char v24 = [v23 enableUAPSessionSecurityWithReadKey:v56 writeKey:v55 error:&v33];
  id v11 = v33;

  if (v24) {
    goto LABEL_24;
  }
  context = (void *)MEMORY[0x1D944E080]();
  __int16 v25 = self;
  HMFGetOSLogHandle();
  __int16 v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v52 = v27;
    __int16 v53 = 2112;
    *(void *)id v54 = v11;
    _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable HAP session security with error %@", buf, 0x16u);
  }
  uint64_t v10 = [v11 code];
  if (!v10)
  {
LABEL_24:
    -[HAPAccessoryServerIP invokePairVerifyCompletionBlock:](self, "invokePairVerifyCompletionBlock:", v11, context);
    [(HAPAccessoryServerIP *)self setSecuritySessionOpen:1];
    [(HAPAccessoryServer *)self setReachable:1];
    context = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerIP *)self _notifyDelegatesOfConnectionState:1 withError:0]);
    __int16 v28 = self;
    HMFGetOSLogHandle();
    double v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v52 = v30;
      _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_INFO, "%{public}@Pair-verify succeeded", buf, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
  if (v50) {
    free(v50);
  }
  if (v10)
  {
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    int v15 = self;
    HMFGetOSLogHandle();
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v52 = v17;
      __int16 v53 = 1024;
      *(_DWORD *)id v54 = v10;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v9;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@Pair-verify message failed: %d with data: %@", buf, 0x1Cu);
    }
    uint64_t v18 = HMErrorFromOSStatus(v10);
    BOOL v19 = [(HAPAccessoryServer *)v15 useHH2];
    if (v10 == -6727 && v19)
    {
      id v32 = v18;
      [(HAPAccessoryServerIP *)v15 _handleSecureSessionClosingWithError:&v32 status:4294960569 data:v9];
      id v21 = v32;

      uint64_t v18 = v21;
    }
    -[HAPAccessoryServerIP _tearDownSessionAndStartReachabilityWithError:](v15, "_tearDownSessionAndStartReachabilityWithError:", v18, context);
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
    [(HAPAccessoryServerIP *)v15 _processQueuedOperationsWithError:v18];
    [(HAPAccessoryServerIP *)v15 invokePairVerifyCompletionBlock:v18];
  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v42, 8);
  return v10;
}

void __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HAPPairingStateFromData(*(void **)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_2;
  v7[3] = &unk_1E69F4708;
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_2((uint64_t)v7);
}

void __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    [WeakRetained _handlePairVerifyCompletionWithData:v8];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = v11;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        uint64_t v16 = @"Invalid";
      }
      else {
        uint64_t v16 = off_1E69F2448[a3 - 1];
      }
      uint64_t v17 = v16;
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      __int16 v26 = v17;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send Pair Verify request, received response object: %@, MIME type: %@, error: %@", buf, 0x2Au);
    }
    [v13 _tearDownSessionAndStartReachabilityWithError:v9];
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:18];
    if ([v13 useHH2])
    {
      id v20 = v18;
      [v13 _handleSecureSessionClosingWithError:&v20 status:4294960596 data:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v19 = v20;

      uint64_t v18 = v19;
    }
    [v13 _processQueuedOperationsWithError:v18];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [v13 invokePairVerifyCompletionBlock:v18];
  }
}

void __60__HAPAccessoryServerIP__handlePairVerifyCompletionWithData___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 48) domain];

    [*(id *)(a1 + 48) code];
    id v2 = v3;
  }
}

- (int)_pairVerifyStartWithRetry:(BOOL)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  char v28 = 0;
  objc_initWeak(&location, self);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  __int16 v23 = __50__HAPAccessoryServerIP__pairVerifyStartWithRetry___block_invoke;
  id v24 = &unk_1E69F00B0;
  objc_copyWeak(&v25, &location);
  BOOL v26 = a3;
  id v5 = (void *)MEMORY[0x1D944E2D0](&v21);
  id v9 = (void *)MEMORY[0x1D944E080](v5, v6, v7, v8);
  uint64_t v10 = self;
  HMFGetOSLogHandle();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v32 = v12;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Pair-verify starting", buf, 0xCu);
  }
  uint64_t v13 = -[HAPAccessoryServerIP _ensurePairingSessionIsInitializedWithType:](v10, "_ensurePairingSessionIsInitializedWithType:", 3, v21, v22, v23, v24);
  if (!v13)
  {
    uint64_t v13 = PairingSessionExchange();
    if (!v13)
    {
      uint64_t v13 = [(HAPAccessoryServerIP *)v10 _ensureHTTPClientSetUp];
      if (!v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:v29];
        [(HAPAccessoryServerIP *)v10 sendPOSTRequestToURL:@"/pair-verify" request:v14 serializationType:2 completionHandler:v5];

        uint64_t v13 = 0;
      }
    }
  }
  if (v30) {
    free(v30);
  }
  if (v13)
  {
    int v15 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = v10;
    HMFGetOSLogHandle();
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v18;
      __int16 v33 = 1024;
      int v34 = v13;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Pair-verify start failed: %d", buf, 0x12u);
    }
    id v19 = HMErrorFromOSStatus(v13);
    [(HAPAccessoryServerIP *)v16 _tearDownSessionAndStartReachabilityWithError:v19];
    [(HAPAccessoryServerIP *)v16 invokePairVerifyCompletionBlock:v19];
    [(HAPAccessoryServerIP *)v16 _processQueuedOperationsWithError:v19];
    [(HAPAccessoryServerIP *)v16 _notifyDelegatesPairingStopped:v19];
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v13;
}

void __50__HAPAccessoryServerIP__pairVerifyStartWithRetry___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = (void *)MEMORY[0x1D944E080]();
  id v12 = WeakRetained;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v27 = 138543362;
    char v28 = v14;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Pair-verify complete", (uint8_t *)&v27, 0xCu);
  }
  if (v8 && a3 == 2 && !v9)
  {
    [v12 _handlePairVerifyCompletionWithData:v8];
  }
  else
  {
    int v15 = (void *)MEMORY[0x1D944E080]();
    id v16 = v12;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        id v19 = @"Invalid";
      }
      else {
        id v19 = off_1E69F2448[a3 - 1];
      }
      id v20 = v19;
      int v27 = 138544130;
      char v28 = v18;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v20;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to send initial Pair Verify request, received response object: %@, MIME type: %@, error: %{public}@", (uint8_t *)&v27, 0x2Au);
    }
    [v16 _tearDownSessionAndStartReachabilityWithError:v9];
    if (*(unsigned char *)(a1 + 40) && ([v16 invalidated] & 1) == 0)
    {
      uint64_t v22 = (void *)MEMORY[0x1D944E080]();
      id v23 = v16;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        int v27 = 138543362;
        char v28 = v25;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@Retrying PV on first failure", (uint8_t *)&v27, 0xCu);
      }
      [v23 _pairVerifyStartWithRetry:0];
    }
    else
    {
      if (v9)
      {
        id v21 = v9;
      }
      else
      {
        id v21 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:53];
      }
      BOOL v26 = v21;
      [v16 _processQueuedOperationsWithError:v21];
      [v16 _notifyDelegatesPairingStopped:v26];
      [v16 invokePairVerifyCompletionBlock:v26];
    }
  }
}

- (BOOL)_shouldNotifyClientsOfPVFailure:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 underlyingErrors], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = [v5 underlyingErrors];
    id v8 = [v7 firstObject];

    BOOL v9 = !v8
      || ![(HAPAccessoryServerIP *)self consecutivePairVerifyFailures]
      || [v8 code] != -6722;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (int)_pairSetupTryPassword:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = 0;
  char v18 = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__HAPAccessoryServerIP__pairSetupTryPassword___block_invoke;
  v15[3] = &unk_1E69F0088;
  objc_copyWeak(&v16, &location);
  id v5 = (void *)MEMORY[0x1D944E2D0](v15);
  if (self->_pairingSession)
  {
    [v4 UTF8String];
    uint64_t v6 = PairingSessionSetSetupCode();
    if (!v6)
    {
      unsigned int v7 = PairingSessionExchange();
      if (v7)
      {
        if (v7 == -6771) {
          uint64_t v6 = 0;
        }
        else {
          uint64_t v6 = v7;
        }
      }
      else
      {
        id v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:v19];
        [(HAPAccessoryServerIP *)self sendPOSTRequestToURL:@"/pair-setup" request:v8 serializationType:2 completionHandler:v5];

        uint64_t v6 = 0;
      }
    }
  }
  else
  {
    uint64_t v6 = 4294960578;
  }
  if (v20) {
    free(v20);
  }
  if (v6)
  {
    BOOL v9 = (void *)MEMORY[0x1D944E080]();
    uint64_t v10 = self;
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 1024;
      int v24 = v6;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed initializing message for try-password during Pair Setup: error: %d", buf, 0x12u);
    }
    uint64_t v13 = HMErrorFromOSStatus(v6);
    [(HAPAccessoryServerIP *)v10 _tearDownSessionAndStartReachabilityWithError:v13];
    [(HAPAccessoryServerIP *)v10 _processQueuedOperationsWithError:v13];
    [(HAPAccessoryServerIP *)v10 _notifyDelegatesPairingStopped:v13];
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __46__HAPAccessoryServerIP__pairSetupTryPassword___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    [WeakRetained _handlePairSetupCompletionWithData:v8];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = v11;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        id v16 = @"Invalid";
      }
      else {
        id v16 = off_1E69F2448[a3 - 1];
      }
      uint64_t v17 = v16;
      int v20 = 138544130;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send request to try password during Pair Setup, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v20, 0x2Au);
    }
    if (v9)
    {
      id v18 = v9;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:66];
    }
    uint64_t v19 = v18;
    [v13 _tearDownSessionAndStartReachabilityWithError:v18];
    [v13 _processQueuedOperationsWithError:v19];
    [v13 _notifyDelegatesPairingStopped:v19];
  }
}

- (int)_promptForSetupCodeWithFlags:(unsigned int)a3 delaySeconds:(int)a4 pairingFlags:(unsigned int)a5 isWAC:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = (void *)MEMORY[0x1D944E080](self, a2);
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v15 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    id v30 = v14;
    __int16 v31 = 1024;
    unsigned int v32 = a3;
    __int16 v33 = 1024;
    int v34 = a4;
    __int16 v35 = 1024;
    unsigned int v36 = a5;
    __int16 v37 = 2112;
    __int16 v38 = v15;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Pair-setup received request to prompt for password, flags: %0x, delay: %d pairing flags: %0x isWAC: %@\n", buf, 0x28u);
  }
  if ((a3 & 0x10000) == 0 || [(HAPAccessoryServerIP *)v12 isHandlingInvalidSetupCode])
  {
    if ((a3 & 0x30000) != 0 || [(HAPAccessoryServerIP *)v12 isHandlingInvalidSetupCode])
    {
      [(HAPAccessoryServerIP *)v12 setHandlingInvalidSetupCode:0];
      if ([(HAPAccessoryServerIP *)v12 _delegateRespondsToSelector:sel_accessoryServer_didReceiveBadPasswordThrottleAttemptsWithDelay_])
      {
        id v16 = [(HAPAccessoryServer *)v12 delegateQueue];
        uint64_t v17 = v16;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_2;
        v26[3] = &unk_1E69F3DD0;
        v26[4] = v12;
        int v27 = a4;
        id v18 = v26;
LABEL_20:
        dispatch_async(v16, v18);
        goto LABEL_21;
      }
    }
    else if ([(HAPAccessoryServerIP *)v12 _delegateRespondsToSelector:sel_accessoryServer_promptUserForPasswordWithType_])
    {
      if ((a5 & 0x40000000) != 0) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 1;
      }
      id v16 = [(HAPAccessoryServer *)v12 delegateQueue];
      uint64_t v17 = v16;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_3;
      v25[3] = &unk_1E69F3A58;
      v25[4] = v12;
      v25[5] = v23;
      id v18 = v25;
      goto LABEL_20;
    }
    return -6702;
  }
  uint64_t v19 = (void *)MEMORY[0x1D944E080]();
  int v20 = v12;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v30 = v22;
    _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Pair-setup restarting pairing before asking for the setup code.", buf, 0xCu);
  }
  [(HAPAccessoryServerIP *)v20 setHandlingInvalidSetupCode:1];
  if (!v6)
  {
    id v16 = [(HAPAccessoryServer *)v20 clientQueue];
    uint64_t v17 = v16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke;
    block[3] = &unk_1E69F4330;
    void block[4] = v20;
    id v18 = block;
    goto LABEL_20;
  }
  uint64_t v17 = [(HAPAccessoryServerIP *)v20 hapWACAccessoryClient];
  [v17 restart];
LABEL_21:

  return 0;
}

uint64_t __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePairSetupCompletionWithData:0];
}

void __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didReceiveBadPasswordThrottleAttemptsWithDelay:*(int *)(a1 + 40)];
}

void __85__HAPAccessoryServerIP__promptForSetupCodeWithFlags_delaySeconds_pairingFlags_isWAC___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) promptUserForPasswordWithType:*(void *)(a1 + 40)];
}

- (void)_handlePairSetupAfterM4Callback
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  int PeerFlags = PairingSessionGetPeerFlags();
  id v5 = (void *)PairingSessionCopyProperty();
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != CFDataGetTypeID())
  {
    id v7 = 0;
    if (!v5) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  id v7 = v5;
  id v8 = +[HAPAccessory productDataStringFromData:v7];
  [(HAPAccessoryServer *)self setProductData:v8];

  id v9 = (void *)MEMORY[0x1D944E080]();
  uint64_t v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [v7 shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v39 = v12;
    __int16 v40 = 1024;
    int v41 = PeerFlags;
    __int16 v42 = 2112;
    uint64_t v43 = v13;
    _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Pair-setup after M4, flags %08X  productData %@", buf, 0x1Cu);
  }
  uint64_t v14 = [(HAPAccessoryServer *)v10 category];
  if ([v14 isEqual:&unk_1F2C80880])
  {
    int v15 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v16 = [v15 preferenceForKey:@"shouldRequireOwnershipProof"];
    int v17 = [v16 BOOLValue];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1D944E080]();
      uint64_t v19 = v10;
      int v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = v21;
        _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Overriding to require ownership proof flags", buf, 0xCu);
      }
      if (!v7)
      {
        uint64_t v37 = 0x1A862D3F6955180CLL;
        id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v37 length:8];
        __int16 v22 = +[HAPAccessory productDataStringFromData:v7];
        [(HAPAccessoryServer *)v19 setProductData:v22];

        uint64_t v23 = (void *)MEMORY[0x1D944E080]();
        __int16 v24 = v19;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          __int16 v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v39 = v26;
          _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Overriding product data to that of BBN/IMP", buf, 0xCu);
        }
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  if ((PeerFlags & 0x40000000) == 0) {
    goto LABEL_22;
  }
LABEL_14:
  int v27 = [(HAPAccessoryServer *)v10 pairingRequest];
  uint64_t v28 = [v27 ownershipToken];

  __int16 v29 = (void *)MEMORY[0x1D944E080]();
  id v30 = v10;
  __int16 v31 = HMFGetOSLogHandle();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
  if (!v28)
  {
    if (v32)
    {
      unsigned int v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v36;
      _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_INFO, "%{public}@Accessory requires ownership token, but we don't have one, bailing out", buf, 0xCu);
    }
    [(HAPAccessoryServerIP *)v30 _notifyDelegateNeedsOwnershipToken];
    [(HAPAccessoryServerIP *)v30 setCancelPairingErr:4294896152];
LABEL_22:
    if (!v5) {
      goto LABEL_24;
    }
LABEL_23:
    CFRelease(v5);
    goto LABEL_24;
  }
  if (v32)
  {
    __int16 v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v33;
    _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding an ownership token to the pairing session", buf, 0xCu);
  }
  int v34 = [(HAPAccessoryServer *)v30 pairingRequest];
  __int16 v35 = [v34 ownershipToken];
  PairingSessionSetProperty();

  if (v5) {
    goto LABEL_23;
  }
LABEL_24:
}

- (int)_handlePairSetupCompletionWithData:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  char v58 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke;
  v55[3] = &unk_1E69F4128;
  id v5 = v4;
  id v56 = v5;
  uint64_t v57 = self;
  CFTypeID v6 = (void *)MEMORY[0x1D944E2D0](v55);
  objc_initWeak(&location, self);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_3;
  v51[3] = &unk_1E69F0060;
  objc_copyWeak(&v53, &location);
  id v7 = v6;
  id v52 = v7;
  v46 = (void *)MEMORY[0x1D944E2D0](v51);
  id v8 = v5;
  [v8 bytes];
  [v8 length];
  uint64_t v9 = PairingSessionExchange();
  uint64_t v10 = v9;
  if (v9)
  {
    if (v9 != -6771) {
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v10 = 0;
    goto LABEL_28;
  }
  if (!v58)
  {
    if ([(HAPAccessoryServerIP *)self cancelPairingErr])
    {
      uint64_t v10 = [(HAPAccessoryServerIP *)self cancelPairingErr];
      goto LABEL_28;
    }
    __int16 v35 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v60 length:v59];
    [(HAPAccessoryServerIP *)self sendPOSTRequestToURL:@"/pair-setup" request:v35 serializationType:2 completionHandler:v46];

    goto LABEL_27;
  }
  id v11 = (void *)MEMORY[0x1D944E080]();
  id v12 = self;
  HMFGetOSLogHandle();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v69 = v14;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Pairing completed - Done", buf, 0xCu);
  }
  if ([(HAPAccessoryServer *)v12 pairSetupType] != 3)
  {
    if ([(HAPAccessoryServer *)v12 pairSetupType] == 5
      || [(HAPAccessoryServer *)v12 pairSetupType] == 6)
    {
      [(HAPAccessoryServerIP *)v12 _handleMFiCertValidation];
    }
    else
    {
      [(HAPAccessoryServerIP *)v12 _tearDownSession];
      unsigned int v36 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:18];
      [(HAPAccessoryServerIP *)v12 _processQueuedOperationsWithError:v36];
      [(HAPAccessoryServerIP *)v12 _notifyDelegatesPairingStopped:0];
    }
    goto LABEL_27;
  }
  int v15 = (void *)MEMORY[0x1D944E080]();
  id v16 = v12;
  HMFGetOSLogHandle();
  int v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)v61 = 138543362;
    uint64_t v62 = v18;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Split pair setup done.", v61, 0xCu);
  }
  uint64_t v10 = PairingSessionDeriveKey();
  if (!v10)
  {
    uint64_t v10 = PairingSessionDeriveKey();
    if (!v10)
    {
      uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
      uint64_t v44 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v67 length:32];
      int v20 = (void *)MEMORY[0x1D944E080]();
      id v21 = v16;
      HMFGetOSLogHandle();
      __int16 v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)v61 = 138543874;
        uint64_t v62 = v23;
        __int16 v63 = 2112;
        id v64 = v19;
        __int16 v65 = 2112;
        v66 = v44;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Generated read key: %@, write key: %@", v61, 0x20u);
      }
      __int16 v24 = [(HAPAccessoryServerIP *)v21 httpClient];
      id v50 = 0;
      char v25 = [v24 enableUAPSessionSecurityWithReadKey:buf writeKey:v67 error:&v50];
      id v45 = v50;

      if (v25) {
        goto LABEL_16;
      }
      context = (void *)MEMORY[0x1D944E080]();
      __int16 v26 = v21;
      HMFGetOSLogHandle();
      int v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)v61 = 138543618;
        uint64_t v62 = v28;
        __int16 v63 = 2112;
        id v64 = v45;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable HAP session security with error %@", v61, 0x16u);
      }
      uint64_t v10 = [v45 code];
      if (!v10)
      {
LABEL_16:
        __int16 v29 = (void *)MEMORY[0x1D944E080]();
        id v30 = v21;
        HMFGetOSLogHandle();
        __int16 v31 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          BOOL v32 = HMFGetLogIdentifier();
          *(_DWORD *)v61 = 138543362;
          uint64_t v62 = v32;
          _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Secure session enabled - starting Auth", v61, 0xCu);
        }
        [(HAPAccessoryServerIP *)v30 _notifyDelegateOfPairingProgress:2];
        __int16 v33 = [MEMORY[0x1E4F1C9C8] date];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_457;
        v47[3] = &unk_1E69F4128;
        id v34 = v33;
        id v48 = v34;
        uint64_t v49 = v30;
        [(HAPAccessoryServerIP *)v30 getAccessoryInfo:v47];

        uint64_t v10 = 0;
      }
    }
  }
LABEL_28:
  if (v60) {
    free(v60);
  }
  if (v10)
  {
    uint64_t v37 = (void *)MEMORY[0x1D944E080]();
    __int16 v38 = self;
    HMFGetOSLogHandle();
    uint64_t v39 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v69 = v40;
      __int16 v70 = 1024;
      int v71 = v10;
      _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_ERROR, "%{public}@Pair-setup message failed with %d", buf, 0x12u);
    }
    int v41 = HMErrorFromOSStatus(v10);
    [(HAPAccessoryServerIP *)v38 _tearDownSessionAndStartReachabilityWithError:v41];
    (*((void (**)(id, void *))v7 + 2))(v7, v41);
    [(HAPAccessoryServerIP *)v38 _processQueuedOperationsWithError:v41];
    [(HAPAccessoryServerIP *)v38 _notifyDelegatesPairingStopped:v41];
  }
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);

  return v10;
}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = HAPPairingStateFromData(*(void **)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2;
  v7[3] = &unk_1E69F4708;
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2((uint64_t)v7);
}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    [WeakRetained _handlePairSetupCompletionWithData:v8];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = v11;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        id v16 = @"Invalid";
      }
      else {
        id v16 = off_1E69F2448[a3 - 1];
      }
      int v17 = v16;
      int v20 = 138544130;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      char v25 = v17;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send Pair Setup request, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v20, 0x2Au);
    }
    if (v9)
    {
      id v18 = v9;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:66];
    }
    uint64_t v19 = v18;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [v13 _tearDownSessionAndStartReachabilityWithError:v19];
    [v13 _processQueuedOperationsWithError:v19];
    [v13 _notifyDelegatesPairingStopped:v19];
  }
}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_457(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v6 = v5;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2_458;
  v10[3] = &unk_1E69F2088;
  v10[4] = *(void *)(a1 + 40);
  uint64_t v12 = v6;
  id v7 = v3;
  id v11 = v7;
  __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2_458((uint64_t)v10);
  id v8 = *(void **)(a1 + 40);
  if (v7)
  {
    id v9 = [v8 authSession];
    [v8 authSession:v9 authComplete:v7];
  }
  else
  {
    [v8 authenticateAccessory];
  }
}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2_458(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v4 = v2;
    id v3 = (id)[NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v4;
  }
}

void __59__HAPAccessoryServerIP__handlePairSetupCompletionWithData___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 48) domain];

    [*(id *)(a1 + 48) code];
    id v2 = v3;
  }
}

- (int)_continuePairingAfterAuthPromptWithRetry:(BOOL)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  __int16 v35 = 0;
  char v33 = 0;
  self->_retryingPairSetup = a3;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke;
  v32[3] = &unk_1E69F4380;
  v32[4] = self;
  uint64_t v5 = (void *)MEMORY[0x1D944E2D0](v32, a2);
  objc_initWeak(&location, self);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  __int16 v26 = __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_449;
  id v27 = &unk_1E69F0038;
  objc_copyWeak(&v29, &location);
  BOOL v30 = a3;
  id v6 = v5;
  id v28 = v6;
  id v7 = (void *)MEMORY[0x1D944E2D0](&v24);
  id v11 = (void *)MEMORY[0x1D944E080](v7, v8, v9, v10);
  uint64_t v12 = self;
  HMFGetOSLogHandle();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v14;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Pair-setup starting", buf, 0xCu);
  }
  -[HAPAccessoryServerIP setCachedSocketInfo:](v12, "setCachedSocketInfo:", 0, v24, v25, v26, v27);
  uint64_t v15 = [(HAPAccessoryServerIP *)v12 _ensurePairingSessionIsInitializedWithType:1];
  if (!v15)
  {
    uint64_t v16 = PairingSessionExchange();
    uint64_t v15 = v16;
    if (v16)
    {
      if (v16 == -6771) {
        goto LABEL_9;
      }
    }
    else
    {
      if ([(HAPAccessoryServerIP *)v12 cancelPairingErr])
      {
        uint64_t v15 = [(HAPAccessoryServerIP *)v12 cancelPairingErr];
        goto LABEL_10;
      }
      uint64_t v15 = [(HAPAccessoryServerIP *)v12 _ensureHTTPClientSetUp];
      if (!v15)
      {
        int v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v35 length:v34];
        [(HAPAccessoryServerIP *)v12 sendPOSTRequestToURL:@"/pair-setup" request:v17 serializationType:2 completionHandler:v7];

LABEL_9:
        uint64_t v15 = 0;
      }
    }
  }
LABEL_10:
  if (v35) {
    free(v35);
  }
  if (v15)
  {
    id v18 = (void *)MEMORY[0x1D944E080]();
    uint64_t v19 = v12;
    HMFGetOSLogHandle();
    int v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v21;
      __int16 v38 = 1024;
      int v39 = v15;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_ERROR, "%{public}@Pair-setup start failed: %d", buf, 0x12u);
    }
    __int16 v22 = HMErrorFromOSStatus(v15);
    [(HAPAccessoryServerIP *)v19 _tearDownSessionAndStartReachabilityWithError:v22];
    (*((void (**)(id, void *))v6 + 2))(v6, v22);
    [(HAPAccessoryServerIP *)v19 _processQueuedOperationsWithError:v22];
    [(HAPAccessoryServerIP *)v19 _notifyDelegatesPairingStopped:v22];
  }
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v15;
}

void __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_2;
  v5[3] = &unk_1E69F46E0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_2((uint64_t)v5);
}

void __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_449(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (v8 && a3 == 2 && !v9)
  {
    [WeakRetained _handlePairSetupCompletionWithData:v8];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = v11;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      if ((unint64_t)(a3 - 1) > 3) {
        uint64_t v16 = @"Invalid";
      }
      else {
        uint64_t v16 = off_1E69F2448[a3 - 1];
      }
      int v17 = v16;
      int v25 = 138544130;
      __int16 v26 = v15;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      BOOL v30 = v17;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to send initial Pair Setup request, received response object: %@, MIME type: %@, error: %@", (uint8_t *)&v25, 0x2Au);
    }
    if (v9)
    {
      id v18 = v9;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:53];
    }
    uint64_t v19 = v18;
    uint64_t v20 = [v13 _tearDownSessionAndStartReachabilityWithError:v18];
    if (*(unsigned char *)(a1 + 48))
    {
      id v21 = (void *)MEMORY[0x1D944E080](v20);
      id v22 = v13;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v25 = 138543362;
        __int16 v26 = v24;
        _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_INFO, "%{public}@Retrying PS on first failure", (uint8_t *)&v25, 0xCu);
      }
      [v22 _continuePairingAfterAuthPromptWithRetry:0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      [v13 _notifyDelegatesPairingStopped:v19];
      [v13 _processQueuedOperationsWithError:v19];
    }
  }
}

void __65__HAPAccessoryServerIP__continuePairingAfterAuthPromptWithRetry___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

- (int)_pairSetupStartWithConsentRequired:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  __int16 v58 = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke;
  v56[3] = &unk_1E69F3DF8;
  v56[4] = self;
  BOOL v57 = a3;
  __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke((uint64_t)v56);
  uint64_t v5 = [(HAPAccessoryServerIP *)self _isAccessoryPublicKeyPresent:(char *)&v58 + 1 registeredWithHomeKit:&v58];
  if (HIBYTE(v58))
  {
    if ((_BYTE)v58)
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_435;
      v53[3] = &unk_1E69F46E0;
      v53[4] = self;
      id v54 = 0;
      __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_435((uint64_t)v53);

      id v6 = 0;
    }
    else
    {
      __int16 v26 = (void *)MEMORY[0x1D944E080](v5);
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v60 = v29;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory public key was already present but it has not been configured with HomeKit", buf, 0xCu);
      }
      BOOL v30 = [(HAPAccessoryServer *)v27 keyStore];
      __int16 v31 = [(HAPAccessoryServer *)v27 identifier];
      id v55 = 0;
      [v30 registerAccessoryWithHomeKit:v31 error:&v55];
      id v6 = v55;
    }
    [(HAPAccessoryServerIP *)self _notifyDelegatesPairingStopped:v6];

    goto LABEL_18;
  }
  id v7 = (void *)MEMORY[0x1D944E080](v5);
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    unint64_t featureFlags = v8->_featureFlags;
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = v10;
    __int16 v61 = 2048;
    unint64_t v62 = featureFlags;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting a reconfirm with Bonjour during pairing with flags: %llu", buf, 0x16u);
  }
  uint64_t v12 = [(HAPAccessoryServerIP *)v8 reconfirm];
  uint64_t featureFlags_low = LOBYTE(v8->_featureFlags);
  if (LOBYTE(v8->_featureFlags))
  {
    if (featureFlags_low)
    {
      if (v3)
      {
        uint64_t v32 = [(HAPAccessoryServerIP *)v8 _ensurePairingSessionIsInitializedWithType:1];
        if (v32)
        {
LABEL_28:
          uint64_t v43 = HMErrorFromOSStatus(v32);
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_2;
          v46[3] = &unk_1E69F46E0;
          void v46[4] = v8;
          id v47 = v43;
          id v44 = v43;
          __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_2((uint64_t)v46);
          [(HAPAccessoryServerIP *)v8 _notifyDelegatesOfAddAccessoryFailureWithError:v44];
          [(HAPAccessoryServerIP *)v8 _tearDownSessionAndStartReachabilityWithError:v44];
          id v45 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:79 reason:0 underlyingError:v44];

          [(HAPAccessoryServerIP *)v8 _processQueuedOperationsWithError:v45];
          return v32;
        }
        uint64_t v34 = (void *)MEMORY[0x1D944E080]();
        __int16 v35 = v8;
        unsigned int v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v60 = v37;
          _os_log_impl(&dword_1D4758000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Requesting consent for MFi Auth pair-setup", buf, 0xCu);
        }
        if ([(HAPAccessoryServerIP *)v35 _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
        {
          __int16 v38 = [HAPAccessoryInfo alloc];
          int v39 = [(HAPAccessoryServer *)v35 name];
          uint64_t v40 = [(HAPAccessoryServer *)v35 category];
          int v41 = [(HAPAccessoryInfo *)v38 initWithName:v39 manufacturer:0 modelName:0 category:v40 certificationStatus:0 denylisted:0 ppid:0];

          __int16 v42 = [(HAPAccessoryServer *)v35 delegateQueue];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_441;
          v48[3] = &unk_1E69F46E0;
          v48[4] = v35;
          uint64_t v49 = v41;
          uint64_t v24 = v41;
          dispatch_async(v42, v48);

          int v25 = v49;
          goto LABEL_13;
        }
LABEL_27:
        uint64_t v32 = 4294960560;
        goto LABEL_28;
      }
    }
    else if ((featureFlags_low & 0x1A) == 0)
    {
      goto LABEL_9;
    }
    LODWORD(v32) = [(HAPAccessoryServerIP *)v8 _continuePairingAfterAuthPromptWithRetry:1];
    return v32;
  }
LABEL_9:
  uint64_t v14 = (void *)MEMORY[0x1D944E080](v12);
  uint64_t v15 = v8;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = HMFGetLogIdentifier();
    unint64_t v18 = v8->_featureFlags;
    *(_DWORD *)buf = 138543618;
    uint64_t v60 = v17;
    __int16 v61 = 2048;
    unint64_t v62 = v18;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory doesn't support known auth flags: %llu, prompting user...", buf, 0x16u);
  }
  if (![(HAPAccessoryServerIP *)v15 _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])goto LABEL_27; {
  uint64_t v19 = [HAPAccessoryInfo alloc];
  }
  uint64_t v20 = [(HAPAccessoryServer *)v15 name];
  id v21 = [(HAPAccessoryServer *)v15 category];
  id v22 = [(HAPAccessoryInfo *)v19 initWithName:v20 manufacturer:0 modelName:0 category:v21 certificationStatus:0 denylisted:0 ppid:0];

  id v23 = [(HAPAccessoryServer *)v15 delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_440;
  block[3] = &unk_1E69F2088;
  id v51 = v22;
  uint64_t v52 = 4 * (featureFlags_low != 0);
  void block[4] = v15;
  uint64_t v24 = v22;
  dispatch_async(v23, block);

  int v25 = v51;
LABEL_13:

LABEL_18:
  LODWORD(v32) = 0;
  return v32;
}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v7 = v2;
    [*(id *)(a1 + 32) isWacAccessory];
    id v3 = (id)HMFBooleanToString();
    [*(id *)(a1 + 32) isWacLegacy];
    id v4 = (id)HMFBooleanToString();
    id v5 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "pairSetupType"));
    [*(id *)(a1 + 32) authMethod];
    id v6 = (id)HMFBooleanToString();
    id v2 = v7;
  }
}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_435(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_440(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:*(void *)(a1 + 48) accessoryInfo:*(void *)(a1 + 40) error:0];
}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_441(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:3 accessoryInfo:*(void *)(a1 + 40) error:0];
}

void __59__HAPAccessoryServerIP__pairSetupStartWithConsentRequired___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    id v2 = v3;
  }
}

- (int)_ensurePairingSessionIsInitializedWithType:(unsigned int)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = [(HAPAccessoryServer *)self pairingRequest];
  id v6 = [v5 pairingIdentity];
  id v7 = [v6 identifier];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(HAPAccessoryServerIP *)self controllerUsername];
  }
  uint64_t v10 = v9;

  p_pairingSession = (CFTypeRef *)&self->_pairingSession;
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    CFTypeRef *p_pairingSession = 0;
  }
  int v13 = PairingSessionCreate();
  if (v13) {
    goto LABEL_39;
  }
  [(HAPAccessoryServerIP *)self setCancelPairingErr:0];
  uint64_t v14 = [(HAPAccessoryServer *)self setPairSetupType:1];
  if (a3 != 1) {
    goto LABEL_36;
  }
  if (LOBYTE(self->_featureFlags))
  {
    if (self->_featureFlags)
    {
      uint64_t v16 = 1;
    }
    else if ((self->_featureFlags & 2) != 0)
    {
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v15 = 5;
      if ((self->_featureFlags & 0x10) != 0) {
        uint64_t v15 = 6;
      }
      if ((self->_featureFlags & 8) != 0) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = v15;
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  [(HAPAccessoryServer *)self setAuthMethod:v16];
  unint64_t featureFlags = self->_featureFlags;
  if ((featureFlags & 1) == 0)
  {
    if ((featureFlags & 2) != 0)
    {
      if (![(HAPAccessoryServerIP *)self authenticated])
      {
        unint64_t v18 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServer *)self setPairSetupType:3]);
        uint64_t v19 = self;
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          id v21 = HMFGetLogIdentifier();
          unint64_t v22 = self->_featureFlags;
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v21;
          __int16 v35 = 2048;
          unint64_t v36 = v22;
          _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Feature flags: %llu, Performing Transient Split pair-setup", buf, 0x16u);
        }
        goto LABEL_35;
      }
    }
    else
    {
      if ((featureFlags & 8) != 0)
      {
        [(HAPAccessoryServer *)self setPairSetupType:5];
        goto LABEL_35;
      }
      if ((featureFlags & 0x10) == 0) {
        goto LABEL_35;
      }
      if (![(HAPAccessoryServerIP *)self authenticated])
      {
        id v23 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServer *)self setPairSetupType:6]);
        uint64_t v24 = self;
        int v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          __int16 v26 = HMFGetLogIdentifier();
          unint64_t v27 = self->_featureFlags;
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v26;
          __int16 v35 = 2048;
          unint64_t v36 = v27;
          __int16 v37 = 1024;
          int v38 = 16793617;
          _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Feature flags: %llu, Performing Transient Split pair-setup with Cert Auth flags: 0x%X", buf, 0x1Cu);
        }
        goto LABEL_35;
      }
    }
    [(HAPAccessoryServer *)self setPairSetupType:4];
  }
LABEL_35:
  PairingSessionSetFlags();
  uint64_t v14 = PairingSessionSetEventHandler();
LABEL_36:
  id v28 = (void *)MEMORY[0x1D944E080](v14);
  __int16 v29 = self;
  BOOL v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v31;
    __int16 v35 = 2112;
    unint64_t v36 = (unint64_t)v10;
    _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_INFO, "%{public}@Setting Pairing session identifier to %@", buf, 0x16u);
  }
  [v10 UTF8String];
  int v13 = PairingSessionSetIdentifier();
  if (v13)
  {
LABEL_39:
    if (*p_pairingSession)
    {
      CFRelease(*p_pairingSession);
      CFTypeRef *p_pairingSession = 0;
    }
  }

  return v13;
}

- (unsigned)_getNameResolutionGroupResolveTimeout
{
  id v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"HAPNameResolutionGroupResolveTimeout"];
  id v4 = [v3 numberValue];

  if (v4) {
    unsigned int v5 = [v4 unsignedIntValue];
  }
  else {
    unsigned int v5 = 12;
  }

  return v5;
}

- (int)_doEnsureHTTPClientSetUp
{
  if ([(HAPAccessoryServer *)self wakeNumber])
  {
    id v3 = [(HAPAccessoryServer *)self suspendedAccessory];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    id v6 = [v5 wakeTuples];

    id v7 = [v6 firstObject];
    id v8 = [v7 wakeAddress];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(HAPAccessoryServerIP *)self httpClient];

  if (v9)
  {
    id v11 = 0;
LABEL_13:
    int v10 = 0;
    goto LABEL_14;
  }
  id v21 = 0;
  int v10 = [(HAPAccessoryServerIP *)self getBonjourDeviceDNSName:&v21];
  id v11 = v21;
  if (!v10)
  {
    [(HAPAccessoryServer *)self setMetric_pairVerifyConnectionEstablishedBy:@"dnsName"];
    uint64_t v12 = [HAPHTTPClient alloc];
    int v13 = [(HAPAccessoryServer *)self clientQueue];
    uint64_t v14 = [(HAPHTTPClient *)v12 initWithDNSName:v11 port:0 eventsEnabled:1 queue:v13 wakeAddress:v8];
    [(HAPAccessoryServerIP *)self setHttpClient:v14];

    uint64_t v15 = [(HAPAccessoryServerIP *)self httpClient];

    if (!v15)
    {
      int v10 = -6718;
      goto LABEL_14;
    }
    uint64_t v16 = [(HAPAccessoryServerIP *)self httpClient];
    int v17 = [(HAPAccessoryServer *)self clientQueue];
    [v16 setDelegate:self queue:v17];

    [(HAPAccessoryServerIP *)self setHasUpdatedBonjour:0];
    if ([(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServerIP_didReceiveHTTPHeaders_httpBody_]|| [(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServerIP_willSendHTTPHeaders_httpBody_])
    {
      unint64_t v18 = [(HAPAccessoryServerIP *)self httpClient];
      uint64_t v19 = [(HAPAccessoryServer *)self clientQueue];
      [v18 setDebugDelegate:self queue:v19];
    }
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (id)getAddressTypeWithSocketInfo:(id)a3
{
  uint64_t v3 = [a3 ipAddressType];
  id v4 = @"IPv4Address";
  if (v3 == 2) {
    id v4 = @"IPv6LLAddress";
  }
  if (v3 == 3) {
    return @"IPv6GlobalAddress";
  }
  else {
    return v4;
  }
}

- (int)getBonjourDeviceDNSName:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![(HAPAccessoryServerIP *)self hasBonjourDeviceInfo]) {
    return -6705;
  }
  v8[0] = 0;
  id v5 = [(HAPAccessoryServerIP *)self bonjourDeviceInfo];
  int DNSName = BonjourDevice_GetDNSName();

  if (!DNSName)
  {
    *a3 = [NSString stringWithUTF8String:v8];
  }
  return DNSName;
}

- (void)httpClient:(id)a3 didReceiveSocketEvent:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = HMFGetLogIdentifier();
    id v11 = [MEMORY[0x1E4F28E78] string];
    uint64_t v12 = v11;
    if (v4) {
      [v11 appendString:@", WakePacket"];
    }
    if ((v4 & 2) != 0) {
      [v12 appendString:@", KeepAlive"];
    }
    int v16 = 138543618;
    int v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received a socket event %@", (uint8_t *)&v16, 0x16u);
  }
  int v13 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  uint64_t v14 = [(HAPAccessoryServer *)v8 identifier];
  uint64_t v15 = [(HAPAccessoryServer *)v8 category];
  [v13 reportWakeEvent:v14 linkType:1 accessoryCategory:v15];
}

- (void)httpClientDidCloseConnectionDueToServer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v25 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received a server-initiated disconnection", buf, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  int v10 = [(HAPAccessoryServer *)v6 identifier];
  id v11 = [(HAPAccessoryServer *)v6 category];
  [v9 reportDisconnection:v10 linkType:1 accessoryCategory:v11];

  uint64_t v12 = [(HAPAccessoryServerIP *)v6 primaryAccessory];
  if ([v12 suspendedState] == 2)
  {
    int v13 = (void *)MEMORY[0x1D944E080]();
    uint64_t v14 = v6;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v25 = v16;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Disconnected -> Entering suspended mode", buf, 0xCu);
    }
    int v17 = [(HAPAccessoryServer *)v14 delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(HAPAccessoryServer *)v14 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__HAPAccessoryServerIP_httpClientDidCloseConnectionDueToServer___block_invoke;
      block[3] = &unk_1E69F4330;
      void block[4] = v14;
      dispatch_async(v19, block);
    }
    [(HAPAccessoryServerIP *)v14 _tearDownSession];
  }
  else
  {
    uint64_t v20 = [v4 invalidateReason];
    [(HAPAccessoryServerIP *)v6 _tearDownSessionAndStartReachabilityWithError:v20];

    id v21 = [(HAPAccessoryServerIP *)v6 browser];
    unint64_t v22 = [(HAPAccessoryServer *)v6 identifier];
    [v21 processPendingBonjourRemoveEvents:v22];
  }
}

void __64__HAPAccessoryServerIP_httpClientDidCloseConnectionDueToServer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didDisconnectWithError:0];
}

- (void)setPairVerifyCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1D944E2D0](self->_pairVerifyCompletionBlock);
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = [(HAPAccessoryServer *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke;
    block[3] = &unk_1E69F3C68;
    void block[4] = self;
    id v17 = v6;
    dispatch_async(v7, block);
  }
  else if (!v4)
  {
    id pairVerifyCompletionBlock = self->_pairVerifyCompletionBlock;
    self->_id pairVerifyCompletionBlock = 0;

    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  mach_absolute_time();
  id v8 = (void *)UpTicksToMilliseconds();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke_410;
  v12[3] = &unk_1E69F0010;
  objc_copyWeak(v14, &location);
  id v13 = v4;
  v14[1] = v8;
  uint64_t v9 = (void *)MEMORY[0x1D944E2D0](v12);
  id v10 = self->_pairVerifyCompletionBlock;
  self->_id pairVerifyCompletionBlock = v9;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
LABEL_6:
}

void __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_ERROR, "%{public}@pairVerifyCompletionBlock is already set!", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:23];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53__HAPAccessoryServerIP_setPairVerifyCompletionBlock___block_invoke_410(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_msgSend(WeakRetained, "metric_pairVerifyReason");

    if (v5)
    {
      mach_absolute_time();
      objc_msgSend(v4, "setMetric_pairVerifyDurationInMS:", UpTicksToMilliseconds() - *(void *)(a1 + 48));
      [v4 submitPairVerifyMetricWithError:v6];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_establishSecureSession
{
  if (HAPIsHH2Enabled_onceToken != -1) {
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_12024);
  }
  if (HAPIsHH2Enabled_hh2Enabled == 1) {
    [(HAPAccessoryServer *)self initializeKeyBagIfNecessary];
  }

  [(HAPAccessoryServerIP *)self _pairVerifyStartWithRetry:1];
}

- (void)invokePairVerifyCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HAPAccessoryServerIP_invokePairVerifyCompletionBlock___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HAPAccessoryServerIP_invokePairVerifyCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invokePairVerifyCompletionBlock:*(void *)(a1 + 40)];
}

- (void)_invokePairVerifyCompletionBlock:(id)a3
{
  id v5 = a3;
  id v4 = [(HAPAccessoryServerIP *)self pairVerifyCompletionBlock];
  [(HAPAccessoryServerIP *)self setPairVerifyCompletionBlock:0];
  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v5);
  }
  [(HAPAccessoryServerIP *)self setEconnresetRetryInProgress:0];
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_securitySessionOpen = a3;

  os_unfair_lock_unlock(p_lock);
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

- (BOOL)_isSessionEstablished
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  return self->_httpClient
      && self->_pairingSession
      && ![(HAPAccessoryServerIP *)self isEstablishingSecureConnection]
      || self->_unitTest_establishedSession;
}

- (BOOL)isSessionEstablished
{
  id v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__HAPAccessoryServerIP_isSessionEstablished__block_invoke;
  v5[3] = &unk_1E69F44F0;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__HAPAccessoryServerIP_isSessionEstablished__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isSessionEstablished];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_updateAccessories:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v47 = [MEMORY[0x1E4F1CA48] array];
  id v45 = v4;
  id v51 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = [(HAPAccessoryServer *)self accessories];
  id v48 = [v5 arrayWithArray:v6];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v44 = self;
  int v7 = [(HAPAccessoryServer *)self accessories];
  uint64_t v50 = [v7 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v61;
    obuint64_t j = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v61 != v49) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v10 = v51;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v71 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v57;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v57 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v56 + 1) + 8 * v14);
            int v16 = [v9 instanceID];
            id v17 = [v15 instanceID];
            int v18 = [v16 isEqualToNumber:v17];

            if (v18) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v71 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_17;
            }
          }
          if ([v9 shouldMergeObject:v15])
          {
            [v9 mergeObject:v15];
            [v47 addObject:v9];
            [v10 removeObject:v15];
            [v48 removeObject:v9];
            goto LABEL_17;
          }
          uint64_t v39 = (void *)MEMORY[0x1D944E080]();
          uint64_t v40 = v44;
          int v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            __int16 v42 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v66 = v42;
            __int16 v67 = 2112;
            id v68 = v9;
            __int16 v69 = 2112;
            __int16 v70 = v15;
            _os_log_impl(&dword_1D4758000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to merge existing accessory %@ with new accessory %@", buf, 0x20u);
          }

          BOOL v38 = 0;
          __int16 v31 = v45;
          __int16 v37 = obj;
          uint64_t v19 = v47;
          goto LABEL_40;
        }
LABEL_17:
      }
      int v7 = obj;
      uint64_t v50 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
      if (v50) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = v47;
  if ([v48 count])
  {
    uint64_t v20 = (void *)MEMORY[0x1D944E080]();
    id v21 = v44;
    unint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v66 = v23;
      __int16 v67 = 2114;
      id v68 = v48;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@The following accessories are not present in the latest attribute database: %{public}@", buf, 0x16u);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v24 = v48;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v24);
          }
          __int16 v29 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          BOOL v30 = HMErrorFromHAPErrorCode(33);
          [v29 invalidateWithError:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v64 count:16];
      }
      while (v26);
    }
  }
  __int16 v31 = v45;
  if ([v51 count])
  {
    uint64_t v32 = [(HAPAccessoryServer *)v44 accessories];

    if (v32)
    {
      uint64_t v33 = (void *)MEMORY[0x1D944E080]();
      uint64_t v34 = v44;
      __int16 v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v66 = v36;
        __int16 v67 = 2114;
        id v68 = v51;
        _os_log_impl(&dword_1D4758000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@The following accessories are new in the latest attribute database: %{public}@", buf, 0x16u);
      }
    }
    [v47 addObjectsFromArray:v51];
  }
  __int16 v37 = [MEMORY[0x1E4F1C978] arrayWithArray:v47];
  [(HAPAccessoryServer *)v44 setAccessories:v37];
  BOOL v38 = 1;
LABEL_40:

  return v38;
}

- (void)_updateProtocolVersionFromPrimaryAccessory:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = [a3 services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(v4);
      }
      char v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
      id v10 = [v9 type];
      char v11 = [v10 isEqualToString:@"000000A2-0000-1000-8000-0026BB765291"];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (!v12) {
      goto LABEL_20;
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v13 = objc_msgSend(v12, "characteristics", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
LABEL_13:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
        uint64_t v19 = [v18 type];
        char v20 = [v19 isEqualToString:@"00000037-0000-1000-8000-0026BB765291"];

        if (v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
      id v21 = [v18 value];

      if (!v21) {
        goto LABEL_26;
      }
      unint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v21];
      [(HAPAccessoryServer *)self setVersion:v22];
      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"1.1"];
      int v24 = [v22 isAtLeastVersion:v23];

      if (v24) {
        [(HAPAccessoryServer *)self setSupportsTimedWrite:1];
      }
    }
    else
    {
LABEL_19:
      id v21 = v13;
    }
  }
  else
  {
LABEL_9:

LABEL_20:
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"1.0"];
    [(HAPAccessoryServer *)self setVersion:v12];
  }
LABEL_26:
}

- (void)__registerForInternalCharacteristicNotifications
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v24 = self;
  id v4 = [(HAPAccessoryServer *)self accessories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    uint64_t v8 = &selRef_setPeripheralDisconnectionTimeout_;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if [v10 conformsToProtocol:v8[221]] && (objc_opt_respondsToSelector())
        {
          char v11 = v4;
          id v12 = [v10 accessoryServerDidRequestCharacteristicsToRegisterForNotifications:v24];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                if (([v17 eventNotificationsEnabled] & 1) == 0) {
                  [v3 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
            }
            while (v14);
          }

          id v4 = v11;
          uint64_t v8 = &selRef_setPeripheralDisconnectionTimeout_;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__HAPAccessoryServerIP___registerForInternalCharacteristicNotifications__block_invoke;
    v25[3] = &unk_1E69F31C0;
    v25[4] = v24;
    int v18 = (void *)MEMORY[0x1D944E2D0](v25);
    uint64_t v19 = (void *)MEMORY[0x1D944E080]();
    char v20 = v24;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      unint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v22;
      __int16 v36 = 2112;
      __int16 v37 = v3;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_INFO, "%{public}@Registering events for characteristics: %@", buf, 0x16u);
    }
    id v23 = [(HAPAccessoryServer *)v20 clientQueue];
    [(HAPAccessoryServerIP *)v20 enableEvents:1 forCharacteristics:v3 withCompletionHandler:v18 queue:v23];
  }
}

void __72__HAPAccessoryServerIP___registerForInternalCharacteristicNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      char v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      id v12 = "%{public}@Failed to enable notifications for accessory with error: %@";
      uint64_t v13 = v9;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, v14);
    }
  }
  else if (v10)
  {
    char v11 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v11;
    id v12 = "%{public}@Successfully enabled notifications for accessory";
    uint64_t v13 = v9;
    uint32_t v14 = 12;
    goto LABEL_6;
  }
}

- (void)_parseAttributeDatabase:(id)a3 transaction:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v64 = a4;
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:0];
  if (v8) {
    uint64_t v9 = [[NSString alloc] initWithData:v8 encoding:4];
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = (void *)MEMORY[0x1D944E080]();
  char v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = (uint64_t)v13;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Parsing attribute database", buf, 0xCu);
  }
  uint32_t v14 = (void *)MEMORY[0x1D944E080]();
  int v15 = v11;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    id v18 = (void *)v17;
    if (v9) {
      uint64_t v19 = (__CFString *)v9;
    }
    else {
      uint64_t v19 = v6;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v73 = v17;
    __int16 v74 = 2112;
    v75 = v19;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Parsing attribute database: %@", buf, 0x16u);
  }
  long long v63 = (void *)v9;

  char v20 = [(__CFString *)v6 objectForKeyedSubscript:@"accessories"];
  if (v20) {
    goto LABEL_56;
  }
  int v41 = (void *)MEMORY[0x1D944E080]();
  __int16 v42 = v15;
  uint64_t v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    id v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v73 = (uint64_t)v44;
    _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%{public}@No accessory objects found in the attribute database", buf, 0xCu);
  }
  long long v27 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:2];
  if (!v27)
  {
LABEL_56:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    id v21 = (void *)MEMORY[0x1D944E080]();
    unint64_t v22 = v15;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = HMFGetLogIdentifier();
      long long v25 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v73 = (uint64_t)v24;
      __int16 v74 = 2114;
      v75 = @"accessories";
      __int16 v76 = 2114;
      v77 = v25;
      id v26 = v25;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Expected the value of '%{public}@' to be an array in the attribute database, instead it is a %{public}@", buf, 0x20u);
    }
    long long v27 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:2];
    if (!v27)
    {
LABEL_16:
      long long v61 = v8;
      long long v62 = v7;
      long long v28 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v20, "count"));
      v66 = [MEMORY[0x1E4F1CA48] array];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v60 = v20;
      obuint64_t j = v20;
      uint64_t v29 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      long long v59 = v6;
      if (v29)
      {
        uint64_t v30 = v29;
        long long v31 = 0;
        uint64_t v32 = *(void *)v68;
LABEL_18:
        uint64_t v33 = 0;
        uint64_t v34 = v31;
        while (1)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(obj);
          }
          long long v31 = +[HAPAccessoryServerIP _parseSerializedAccessoryDictionary:server:](HAPAccessoryServerIP, "_parseSerializedAccessoryDictionary:server:", *(void *)(*((void *)&v67 + 1) + 8 * v33), v15, v59);

          if (!v31) {
            break;
          }
          uint64_t v35 = [v31 instanceID];
          __int16 v36 = [NSNumber numberWithUnsignedInteger:1];
          int v37 = [v35 isEqualToNumber:v36];

          if (v37)
          {
            [v31 setPrimary:1];
            [(HAPAccessoryServerIP *)v15 setPrimaryAccessoryForServer:v31];
            [(HAPAccessoryServerIP *)v15 _updateProtocolVersionFromPrimaryAccessory:v31];
          }
          else
          {
            [v31 setPrimary:0];
          }
          BOOL v38 = [v31 instanceID];
          int v39 = [v28 containsObject:v38];

          if (v39)
          {
            v46 = (void *)MEMORY[0x1D944E080]();
            uint64_t v50 = v15;
            id v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              id v51 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v73 = (uint64_t)v51;
              _os_log_impl(&dword_1D4758000, v48, OS_LOG_TYPE_ERROR, "%{public}@Accessory Server has accessory with duplicate instance ID", buf, 0xCu);
            }
            goto LABEL_40;
          }
          uint64_t v40 = [v31 instanceID];
          [v28 addObject:v40];

          [v31 setServer:v15];
          [v66 addObject:v31];
          ++v33;
          uint64_t v34 = v31;
          if (v30 == v33)
          {
            uint64_t v30 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
            if (v30) {
              goto LABEL_18;
            }
            goto LABEL_34;
          }
        }
        v46 = (void *)MEMORY[0x1D944E080]();
        id v47 = v15;
        id v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          uint64_t v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = (uint64_t)v49;
          _os_log_impl(&dword_1D4758000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse serialized accessory", buf, 0xCu);
        }
        long long v31 = 0;
LABEL_40:
        id v6 = v59;
        id v45 = v66;

        long long v27 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:66];

        if (v27) {
          goto LABEL_51;
        }
      }
      else
      {
        long long v31 = 0;
LABEL_34:

        id v6 = v59;
        id v45 = v66;
      }
      if ((unint64_t)objc_msgSend(v45, "count", v59) < 0xC9)
      {
        if ([(HAPAccessoryServerIP *)v15 _updateAccessories:v45])
        {
          long long v27 = 0;
          goto LABEL_51;
        }
        long long v52 = (void *)MEMORY[0x1D944E080]();
        long long v57 = v15;
        long long v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          long long v58 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = (uint64_t)v58;
          _os_log_impl(&dword_1D4758000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessories, returning invalid response error", buf, 0xCu);
        }
        uint64_t v56 = 50;
      }
      else
      {
        long long v52 = (void *)MEMORY[0x1D944E080]();
        long long v53 = v15;
        long long v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          long long v55 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v73 = (uint64_t)v55;
          _os_log_impl(&dword_1D4758000, v54, OS_LOG_TYPE_ERROR, "%{public}@Accessory Server exceeds maximum number of allowed accessories", buf, 0xCu);
        }
        uint64_t v56 = 49;
      }

      long long v27 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:v56];
LABEL_51:

      id v8 = v61;
      uint64_t v7 = v62;
      char v20 = v60;
      if (!v27) {
        [(HAPAccessoryServerIP *)v15 setHasAttributeDatabase:1];
      }
    }
  }
  [(HAPAccessoryServerIP *)v15 __registerForInternalCharacteristicNotifications];
  [(HAPAccessoryServerIP *)v15 _notifyDelegateOfDiscoveryCompletionWithError:v27];
  [(HAPAccessoryServerIP *)v15 _processQueuedOperationsWithError:v27];
}

- (void)_getAttributeDatabase
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__693;
  v8[4] = __Block_byref_object_dispose__694;
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.CoreHAP.get-att-db"];
  id v3 = (void *)MEMORY[0x1D944E080]();
  id v4 = [@"/" stringByAppendingPathComponent:@"accessories"];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__HAPAccessoryServerIP__getAttributeDatabase__block_invoke;
  v5[3] = &unk_1E69EFFE8;
  objc_copyWeak(&v6, &location);
  v5[4] = v8;
  [(HAPAccessoryServerIP *)self sendGETRequestToURL:v4 timeout:v5 completionHandler:0.0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  _Block_object_dispose(v8, 8);
}

void __45__HAPAccessoryServerIP__getAttributeDatabase__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v8 && a3 == 1 && !v9)
    {
      [WeakRetained _parseAttributeDatabase:v8 transaction:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1D944E080]();
      id v13 = v11;
      uint32_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = HMFGetLogIdentifier();
        if ((unint64_t)(a3 - 1) > 3) {
          uint64_t v16 = @"Invalid";
        }
        else {
          uint64_t v16 = off_1E69F2448[a3 - 1];
        }
        uint64_t v17 = v16;
        int v22 = 138544130;
        id v23 = v15;
        __int16 v24 = 2114;
        id v25 = v8;
        __int16 v26 = 2114;
        long long v27 = v17;
        __int16 v28 = 2114;
        id v29 = v9;
        _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get attribute database, received response object: %{public}@, MIME type: %{public}@, error: %{public}@", (uint8_t *)&v22, 0x2Au);
      }
      if (v9)
      {
        id v18 = v9;
      }
      else
      {
        id v18 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:66];
      }
      uint64_t v19 = v18;
      [v13 _tearDownSessionAndStartReachabilityWithError:v18];
      [v13 _notifyDelegateOfDiscoveryCompletionWithError:v19];
      [v13 _processQueuedOperationsWithError:v19];
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
      id v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = 0;
    }
  }
}

- (BOOL)_parseTXTRecordDictionary:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_dataForKey:", @"id");
  if (!v5)
  {
    int v15 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v18;
      __int16 v100 = 2112;
      v101 = @"id";
LABEL_11:
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);
    }
LABEL_12:

LABEL_13:
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  id v6 = (void *)v5;
  unint64_t v7 = 0x1E4F29000uLL;
  id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  [(HAPAccessoryServer *)self setIdentifier:v8];

  self->_unint64_t featureFlags = 0;
  id v9 = objc_msgSend(v4, "hmf_dataForKey:", @"ff");

  if (v9)
  {
    id v10 = v9;
    [v10 bytes];
    [v10 length];
    p_unint64_t featureFlags = &self->_featureFlags;
    SNScanF();
  }
  char v11 = objc_msgSend(v4, "hmf_dataForKey:", @"md", p_featureFlags);

  if (!v11)
  {
    int v15 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v18;
      __int16 v100 = 2112;
      v101 = @"md";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
  [(HAPAccessoryServerIP *)self setModel:v12];

  id v13 = objc_msgSend(v4, "hmf_dataForKey:", @"sv");

  if (v13)
  {
    uint32_t v14 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
    [(HAPAccessoryServerIP *)self setSourceVersion:v14];
  }
  else
  {
    [(HAPAccessoryServerIP *)self setSourceVersion:0];
  }
  id v21 = objc_msgSend(v4, "hmf_dataForKey:", @"pv");

  if (v21)
  {
    int v22 = (__CFString *)[[NSString alloc] initWithData:v21 encoding:4];
    if (v22)
    {
      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v22];
      [(HAPAccessoryServer *)self setVersion:v23];
      if ((unint64_t)[v23 majorVersion] >= 2)
      {
        int v41 = (void *)MEMORY[0x1D944E080]();
        __int16 v42 = self;
        uint64_t v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v99 = v44;
          __int16 v100 = 2112;
          v101 = v22;
          _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_ERROR, "%{public}@TXT record contains incompatible protocol version %@", buf, 0x16u);
        }
        if ([(HAPAccessoryServerIP *)v42 isPaired])
        {
          [(HAPAccessoryServer *)v42 setReachabilityChangedReason:@"Internal"];
          [(HAPAccessoryServer *)v42 setReachable:0];
          [(HAPAccessoryServerIP *)v42 _tearDownSession];
        }

        goto LABEL_50;
      }
    }
  }
  __int16 v24 = objc_msgSend(v4, "hmf_dataForKey:", @"w#");

  if (v24)
  {
    id v25 = (__CFString *)[[NSString alloc] initWithData:v24 encoding:4];
    uint64_t v26 = [(__CFString *)v25 longLongValue];
    if ((unint64_t)(v26 - 1) >= 0xFFFFFFFF)
    {
      uint64_t v30 = (void *)MEMORY[0x1D944E080]();
      long long v31 = self;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v99 = v33;
        __int16 v100 = 2112;
        v101 = v25;
        _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 'w#' has invalid wake number: %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
    uint64_t v27 = v26;
  }
  else
  {
    uint64_t v27 = 0;
  }
  if ([(HAPAccessoryServer *)self wakeNumber] != v27
    && [(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServer_didUpdateWakeNumber_])
  {
    __int16 v28 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__HAPAccessoryServerIP__parseTXTRecordDictionary___block_invoke;
    block[3] = &unk_1E69F3A58;
    void block[4] = self;
    void block[5] = v27;
    dispatch_async(v28, block);
  }
  [(HAPAccessoryServer *)self setWakeNumber:v27];
  id v21 = objc_msgSend(v4, "hmf_dataForKey:", @"c#");

  if (!v21)
  {
    if (v27) {
      goto LABEL_36;
    }
    int v15 = (void *)MEMORY[0x1D944E080]();
    uint64_t v16 = self;
    v93 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v94;
      __int16 v100 = 2112;
      v101 = @"c#";
      _os_log_impl(&dword_1D4758000, v93, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);
    }
    goto LABEL_13;
  }
  int v22 = (__CFString *)[[NSString alloc] initWithData:v21 encoding:4];
  uint64_t v29 = [(__CFString *)v22 longLongValue];
  if ((unint64_t)(v29 - 1) >= 0xFFFFFFFF)
  {
    id v45 = (void *)MEMORY[0x1D944E080]();
    v46 = self;
    id v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      id v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v99 = v48;
      _os_log_impl(&dword_1D4758000, v47, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 'c#' has invalid configuration number", buf, 0xCu);
    }
LABEL_50:

    goto LABEL_14;
  }
  [(HAPAccessoryServer *)self setConfigNumber:v29];

LABEL_36:
  uint64_t v34 = objc_msgSend(v4, "hmf_dataForKey:", @"s#");

  if (v34)
  {
    uint64_t v35 = (void *)[[NSString alloc] initWithData:v34 encoding:4];
    uint64_t v36 = [v35 longLongValue];
    if ((unint64_t)(v36 - 0x100000000) <= 0xFFFFFFFF00000000)
    {
      int v37 = (void *)MEMORY[0x1D944E080]();
      BOOL v38 = self;
      int v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v99 = v40;
        _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 's#' has invalid state number", buf, 0xCu);
      }
      uint64_t v36 = 1;
    }
    [(HAPAccessoryServer *)self setStateNumber:v36];
  }
  else
  {
    uint64_t v49 = (void *)MEMORY[0x1D944E080]();
    uint64_t v50 = self;
    id v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      long long v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v52;
      __int16 v100 = 2112;
      v101 = @"s#";
      _os_log_impl(&dword_1D4758000, v51, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);
    }
    [(HAPAccessoryServer *)v50 setStateNumber:1];
  }
  long long v53 = objc_msgSend(v4, "hmf_dataForKey:", @"sf");

  if (v53)
  {
    long long v54 = (void *)[[NSString alloc] initWithData:v53 encoding:4];
    uint64_t v55 = [v54 longLongValue];
  }
  else
  {
    uint64_t v55 = 0;
  }
  uint64_t v56 = (void *)MEMORY[0x1D944E080]();
  long long v57 = self;
  long long v58 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    long long v59 = HMFGetLogIdentifier();
    BOOL v60 = [(HAPAccessoryServerIP *)v57 isPaired];
    long long v61 = @"No";
    *(_DWORD *)buf = 138543874;
    v99 = v59;
    if (v60) {
      long long v61 = @"Yes";
    }
    __int16 v100 = 2112;
    v101 = v61;
    __int16 v102 = 2048;
    uint64_t v103 = v55;
    _os_log_impl(&dword_1D4758000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Paired: %@, Setting status flags to %tu", buf, 0x20u);
  }
  [(HAPAccessoryServerIP *)v57 setStatusFlags:v55];
  if (![(HAPAccessoryServerIP *)v57 isWacAccessory]
    || [(HAPAccessoryServerIP *)v57 isWacLegacy])
  {
    [(HAPAccessoryServer *)v57 setHasPairings:(v55 & 1) == 0];
  }
  long long v62 = objc_msgSend(v4, "hmf_dataForKey:", @"ci");

  if (v62)
  {
    long long v63 = (void *)[[NSString alloc] initWithData:v62 encoding:4];
    id v64 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)objc_msgSend(v63, "longLongValue"));
    [(HAPAccessoryServer *)v57 setCategory:v64];
  }
  else
  {
    __int16 v65 = (void *)MEMORY[0x1D944E080]();
    v66 = v57;
    long long v67 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      long long v68 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v68;
      __int16 v100 = 2112;
      v101 = @"ci";
      _os_log_impl(&dword_1D4758000, v67, OS_LOG_TYPE_ERROR, "%{public}@TXT record does not contain data for key '%@', set the category to @(1) - Other", buf, 0x16u);
    }
    [(HAPAccessoryServer *)v66 setCategory:&unk_1F2C80850];
  }
  long long v69 = objc_msgSend(v4, "hmf_dataForKey:", @"sh");

  if (v69)
  {
    long long v70 = (void *)[[NSString alloc] initWithData:v69 encoding:4];
    int v71 = +[HAPJSONValueTransformer defaultJSONValueTransformer];
    id v96 = 0;
    uint64_t v72 = [v71 reverseTransformedValue:v70 format:12 error:&v96];
    id v73 = v96;

    if (v72)
    {
      __int16 v74 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServer *)v57 setSetupHash:v72]);
      v75 = v57;
      __int16 v76 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
        v77 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v99 = v77;
        __int16 v100 = 2112;
        v101 = v72;
        _os_log_impl(&dword_1D4758000, v76, OS_LOG_TYPE_DEBUG, "%{public}@Setup hash is %@ for accessory server", buf, 0x16u);

        unint64_t v7 = 0x1E4F29000;
      }
    }
  }
  else
  {
    uint64_t v78 = (void *)MEMORY[0x1D944E080]();
    v79 = v57;
    v80 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      v81 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v81;
      __int16 v100 = 2112;
      v101 = @"sh";
      _os_log_impl(&dword_1D4758000, v80, OS_LOG_TYPE_DEBUG, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);
    }
  }
  [(HAPAccessoryServer *)v57 setCompatibilityFeatures:0];
  v82 = objc_msgSend(v4, "hmf_dataForKey:", @"fe");

  if (v82)
  {
    v83 = (__CFString *)[objc_alloc(*(Class *)(v7 + 24)) initWithData:v82 encoding:4];
    uint64_t v84 = [(__CFString *)v83 longLongValue];
    if ((unint64_t)(v84 - 0x100000000) > 0xFFFFFFFF00000000)
    {
      [(HAPAccessoryServer *)v57 setCompatibilityFeatures:v84];
    }
    else
    {
      v85 = (void *)MEMORY[0x1D944E080]();
      v86 = v57;
      v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        v88 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v99 = v88;
        __int16 v100 = 2112;
        v101 = v83;
        _os_log_impl(&dword_1D4758000, v87, OS_LOG_TYPE_ERROR, "%{public}@TXT record key 'fe' has invalid value %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v89 = (void *)MEMORY[0x1D944E080]();
    v90 = v57;
    v91 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      v92 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v92;
      __int16 v100 = 2112;
      v101 = @"fe";
      _os_log_impl(&dword_1D4758000, v91, OS_LOG_TYPE_DEBUG, "%{public}@TXT record does not contain data for key '%@'", buf, 0x16u);
    }
  }
  BOOL v19 = 1;
LABEL_15:

  return v19;
}

void __50__HAPAccessoryServerIP__parseTXTRecordDictionary___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v4 accessoryServer:v2 didUpdateWakeNumber:v3];
}

- (BOOL)_parseAndValidateTXTRecord
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServerIP *)self bonjourDeviceInfo];
  id v4 = [v3 objectForKeyedSubscript:@"txt"];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E90] dictionaryFromTXTRecordData:v4];
    if (v5)
    {
      if ([(HAPAccessoryServerIP *)self _parseTXTRecordDictionary:v5])
      {
        id v6 = [(HAPAccessoryServer *)self identifier];

        if (v6)
        {
          BOOL v7 = 1;
LABEL_17:

          goto LABEL_18;
        }
        id v13 = (void *)MEMORY[0x1D944E080]();
        BOOL v19 = self;
        int v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          int v21 = 138543618;
          int v22 = v16;
          __int16 v23 = 2112;
          __int16 v24 = v5;
          uint64_t v17 = "%{public}@Failed to instantiate accessory because a deviceID wasn't present in the TXT record dictionary: %@";
          goto LABEL_15;
        }
LABEL_16:

        BOOL v7 = 0;
        goto LABEL_17;
      }
      id v13 = (void *)MEMORY[0x1D944E080]();
      id v18 = self;
      int v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      uint64_t v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      int v22 = v16;
      __int16 v23 = 2112;
      __int16 v24 = v5;
      uint64_t v17 = "%{public}@Failed to instantiate accessory because TXT record is malformed: %@";
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D944E080]();
      uint32_t v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      uint64_t v16 = HMFGetLogIdentifier();
      int v21 = 138543618;
      int v22 = v16;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      uint64_t v17 = "%{public}@Failed to instantiate accessory because the TXT record data could not be converted to a dictionary: %@";
    }
LABEL_15:
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0x16u);

    goto LABEL_16;
  }
  id v8 = (void *)MEMORY[0x1D944E080]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = HMFGetLogIdentifier();
    id v12 = [(HAPAccessoryServerIP *)v9 bonjourDeviceInfo];
    int v21 = 138543618;
    int v22 = v11;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to instantiate accessory because no TXT record data was found in BonjourDeviceInfo: %@", (uint8_t *)&v21, 0x16u);
  }
  BOOL v7 = 0;
LABEL_18:

  return v7;
}

- (BOOL)_processEvent:(id)a3 matchedCharacteristic:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  if (![(HAPAccessoryServerIP *)self _isSessionEstablished])
  {
    uint64_t v26 = (void *)MEMORY[0x1D944E080]();
    uint64_t v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v29;
      __int16 v87 = 2112;
      v88 = v6;
      _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@No secure session dropping event %@", buf, 0x16u);
LABEL_21:
    }
LABEL_22:

    BOOL v24 = 0;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v26 = (void *)MEMORY[0x1D944E080]();
    uint64_t v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v29;
      __int16 v87 = 2112;
      v88 = (__CFString *)objc_opt_class();
      uint64_t v30 = v88;
      _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because it is not a dictionary, instead it is %@", buf, 0x16u);

      goto LABEL_21;
    }
    goto LABEL_22;
  }
  BOOL v7 = [(__CFString *)v6 hmf_numberForKey:@"aid"];
  if (v7)
  {
    id v8 = [(__CFString *)v6 hmf_numberForKey:@"iid"];
    if (v8)
    {
      uint64_t v9 = [(__CFString *)v6 objectForKeyedSubscript:@"value"];
      id v10 = (__CFString *)v9;
      if (v9)
      {
        __int16 v74 = (__CFString *)v9;
        char v11 = [(HAPAccessoryServer *)self accessories];
        __int16 v76 = v7;
        id v12 = objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v7);

        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v73 = v12;
        id v13 = [v12 services];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v84 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v81;
LABEL_8:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v81 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = [*(id *)(*((void *)&v80 + 1) + 8 * v17) characteristics];
            BOOL v19 = objc_msgSend(v18, "hmf_firstObjectWithInstanceID:", v8);

            if (v19) {
              break;
            }
            if (v15 == ++v17)
            {
              uint64_t v15 = [v13 countByEnumeratingWithState:&v80 objects:v84 count:16];
              if (v15) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }

          if ([v19 shouldValidateValueAfterReading])
          {
            int v41 = [v19 metadata];
            __int16 v42 = [v41 format];
            uint64_t v43 = HAPCharacteristicFormatFromString(v42);

            id v10 = v74;
            BOOL v7 = v76;
            if (!v43)
            {
              id v44 = (void *)MEMORY[0x1D944E080]();
              id v45 = self;
              v46 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v47 = v72 = v44;
                *(_DWORD *)buf = 138543362;
                v86 = v47;
                _os_log_impl(&dword_1D4758000, v46, OS_LOG_TYPE_ERROR, "%{public}@The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", buf, 0xCu);

                id v44 = v72;
              }

              id v48 = v74;
              goto LABEL_41;
            }
          }
          else
          {
            uint64_t v43 = 12;
            id v10 = v74;
            BOOL v7 = v76;
          }
          long long v53 = +[HAPJSONValueTransformer defaultJSONValueTransformer];
          id v79 = 0;
          id v48 = [v53 reverseTransformedValue:v10 format:v43 error:&v79];
          long long v54 = (__CFString *)v79;

          if (v54)
          {
            v77 = v48;
            uint64_t v55 = (void *)MEMORY[0x1D944E080]();
            uint64_t v56 = self;
            long long v57 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              long long v58 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v86 = v58;
              __int16 v87 = 2112;
              v88 = v10;
              __int16 v89 = 2112;
              id v90 = v54;
              long long v59 = "%{public}@Failed to transform the value '%@' with error %@";
              BOOL v60 = v57;
              uint32_t v61 = 32;
LABEL_45:
              _os_log_impl(&dword_1D4758000, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
            }
LABEL_46:

            BOOL v24 = 0;
            id v48 = v77;
            goto LABEL_54;
          }
LABEL_41:
          if (![v19 shouldValidateValueAfterReading]
            || ([v19 validateValue:v48 outValue:0], (uint64_t v62 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            if (([v19 properties] & 0x100) != 0)
            {
              long long v63 = _parseNotificationContextFromCharacteristicResponse(v6);
              [v19 setNotificationContext:v63];

              id v64 = (void *)MEMORY[0x1D944E080]();
              __int16 v65 = self;
              v66 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                long long v67 = v75 = v64;
                [v19 notificationContext];
                uint64_t v78 = v48;
                long long v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v86 = v67;
                __int16 v87 = 2112;
                v88 = v68;
                __int16 v89 = 2112;
                id v90 = v8;
                _os_log_impl(&dword_1D4758000, v66, OS_LOG_TYPE_INFO, "%{public}@Received notification context:%@ in event for characteristic instanceId: %@", buf, 0x20u);

                id v48 = v78;
                id v64 = v75;
              }
            }
            else
            {
              [v19 setNotificationContext:0];
            }
            if (!a4)
            {
              BOOL v24 = 1;
              goto LABEL_55;
            }
            long long v69 = (void *)[v19 copy];
            [v69 setValue:v48];
            long long v70 = [v19 service];
            [v69 setService:v70];

            long long v54 = v69;
            *a4 = v54;
            BOOL v24 = 1;
LABEL_54:

LABEL_55:
            uint64_t v25 = v73;

            goto LABEL_56;
          }
          long long v54 = (__CFString *)v62;
          v77 = v48;
          uint64_t v55 = (void *)MEMORY[0x1D944E080]();
          uint64_t v56 = self;
          long long v57 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            long long v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v86 = v58;
            __int16 v87 = 2112;
            v88 = v54;
            long long v59 = "%{public}@Failed to handle individual event update because the new value is invalid with error %@";
            BOOL v60 = v57;
            uint32_t v61 = 22;
            goto LABEL_45;
          }
          goto LABEL_46;
        }
LABEL_14:

        uint64_t v20 = (void *)MEMORY[0x1D944E080]();
        int v21 = self;
        int v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          __int16 v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v86 = v23;
          _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because there was no matching characteristic", buf, 0xCu);
        }
        BOOL v24 = 0;
        id v10 = v74;
        BOOL v7 = v76;
        uint64_t v25 = v73;
LABEL_56:
      }
      else
      {
        uint64_t v49 = (void *)MEMORY[0x1D944E080]();
        uint64_t v50 = self;
        id v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          long long v52 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v86 = v52;
          _os_log_impl(&dword_1D4758000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because there was no value", buf, 0xCu);
        }
        BOOL v24 = 0;
      }
    }
    else
    {
      uint64_t v36 = (void *)MEMORY[0x1D944E080]();
      int v37 = self;
      BOOL v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v86 = v39;
        __int16 v87 = 2112;
        v88 = @"iid";
        __int16 v89 = 2112;
        id v90 = (id)objc_opt_class();
        id v40 = v90;
        _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because '%@' is not a number, instead it is %@", buf, 0x20u);
      }
      BOOL v24 = 0;
    }
  }
  else
  {
    long long v31 = (void *)MEMORY[0x1D944E080]();
    uint64_t v32 = self;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v86 = v34;
      __int16 v87 = 2112;
      v88 = @"aid";
      __int16 v89 = 2112;
      id v90 = (id)objc_opt_class();
      id v35 = v90;
      _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle individual event update because '%@' is not a number, instead it is %@", buf, 0x20u);
    }
    BOOL v24 = 0;
  }

LABEL_60:
  return v24;
}

- (void)httpClient:(id)a3 didReceiveEvent:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F65520] sharedPowerLogger];
  uint64_t v9 = [(HAPAccessoryServer *)self identifier];
  id v10 = [(HAPAccessoryServer *)self category];
  [v8 reportIncomingIPEvent:v9 accessoryCategory:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v11 = [v7 objectForKeyedSubscript:@"characteristics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [MEMORY[0x1E4F1CA48] array];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      obuint64_t j = v11;
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            id v38 = 0;
            BOOL v18 = [(HAPAccessoryServerIP *)self _processEvent:v17 matchedCharacteristic:&v38];
            id v19 = v38;
            if (!v18)
            {
              long long v31 = (void *)MEMORY[0x1D944E080]();
              uint64_t v32 = self;
              uint64_t v33 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                uint64_t v34 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                id v45 = v34;
                _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to process individual event", buf, 0xCu);
              }

              goto LABEL_21;
            }
            [v12 addObject:v19];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __51__HAPAccessoryServerIP_httpClient_didReceiveEvent___block_invoke;
            v36[3] = &unk_1E69EFFC0;
            v36[4] = self;
            id v37 = v19;
            id v20 = v19;
            [(HAPAccessoryServer *)self enumerateInternalDelegatesUsingBlock:v36];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      [(HAPAccessoryServerIP *)self _handleUpdatesForCharacteristics:v12 stateNumber:0];
LABEL_21:
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1D944E080]();
      uint64_t v27 = self;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v45 = v29;
        __int16 v46 = 2112;
        id v47 = @"characteristics";
        __int16 v48 = 2112;
        id v49 = (id)objc_opt_class();
        id v30 = v49;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle event because the '%@' value was not an array, instead it was %@", buf, 0x20u);
      }
    }
  }
  else
  {
    int v21 = (void *)MEMORY[0x1D944E080]();
    int v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v45 = v24;
      __int16 v46 = 2112;
      id v47 = (__CFString *)objc_opt_class();
      uint64_t v25 = v47;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle event because it was not an NSDictionary, instead it was %@", buf, 0x16u);
    }
  }
}

void __51__HAPAccessoryServerIP_httpClient_didReceiveEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryServer:*(void *)(a1 + 32) didUpdateValueForCharacteristic:*(void *)(a1 + 40)];
  }
}

- (void)_handleEventResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 characteristics:(id)a7 requestedEventState:(BOOL)a8 completion:(id)a9 queue:(id)a10
{
  BOOL v10 = a8;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v135 = a9;
  id v136 = v16;
  v137 = a10;
  v138 = self;
  if (v17)
  {
    id v19 = v18;
    id v20 = (void *)MEMORY[0x1D944E080]();
    int v21 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v168 = v23;
      __int16 v169 = 2112;
      *(void *)v170 = v17;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_ERROR, "%{public}@Setting notification registration failed with error %@", buf, 0x16u);
    }
    BOOL v24 = v137;
    if ([v17 code] == -6723 || objc_msgSend(v17, "code") == -6753)
    {
      uint64_t v25 = (void *)MEMORY[0x1D944E080]();
      uint64_t v26 = v21;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v168 = v28;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Interpreting error as unreachable", buf, 0xCu);

        BOOL v24 = v137;
      }

      id v29 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4 reason:0 underlyingError:v17];
    }
    else
    {
      id v29 = v17;
    }
    v93 = v29;
    [(HAPAccessoryServerIP *)v21 _tearDownSessionAndStartReachabilityWithError:v17];
    id v79 = 0;
    id v30 = v19;
    goto LABEL_67;
  }
  id v134 = v18;
  id v30 = v18;
  if (v16 && a4 == 1 && a5 == 207)
  {
    long long v31 = (void *)MEMORY[0x1D944E080]();
    uint64_t v32 = self;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v168 = v34;
      __int16 v169 = 1024;
      *(_DWORD *)v170 = 207;
      id v30 = v134;
      *(_WORD *)&v170[4] = 2080;
      *(void *)&v170[6] = HTTPGetReasonPhrase();
      *(_WORD *)&v170[14] = 2112;
      *(void *)&v170[16] = v16;
      _os_log_impl(&dword_1D4758000, v33, OS_LOG_TYPE_ERROR, "%{public}@Characteristic event registration request responded with '%d %s' HTTP status code %@", buf, 0x26u);
    }
    id v35 = v16;
    id v36 = v30;
    id v127 = v35;
    if (v32)
    {
      id v37 = [v35 objectForKeyedSubscript:@"characteristics"];
      uint64_t v38 = [v37 count];
      v132 = v36;
      v128 = v37;
      if (v38 == [v36 count])
      {
        v130 = [MEMORY[0x1E4F1CA48] arrayWithArray:v36];
        v129 = [MEMORY[0x1E4F1CA48] array];
        long long v151 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        obuint64_t j = v37;
        uint64_t v125 = [obj countByEnumeratingWithState:&v151 objects:buf count:16];
        if (v125)
        {
          uint64_t v126 = *(void *)v152;
          *(void *)&long long v39 = 138544386;
          long long v119 = v39;
          v123 = v32;
          BOOL v120 = v10;
LABEL_18:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v152 != v126) {
              objc_enumerationMutation(obj);
            }
            long long v41 = *(void **)(*((void *)&v151 + 1) + 8 * v40);
            long long v42 = objc_msgSend(v41, "objectForKeyedSubscript:", @"aid", v119);
            uint64_t v43 = [v41 objectForKeyedSubscript:@"iid"];
            uint64_t v44 = [v41 objectForKeyedSubscript:@"status"];
            BOOL v45 = !v42 || v43 == 0;
            v133 = (void *)v44;
            if (v45 || v44 == 0) {
              break;
            }
            uint64_t v131 = v40;
            id v47 = v42;
            long long v149 = 0u;
            long long v150 = 0u;
            long long v148 = 0u;
            long long v147 = 0u;
            id v48 = v130;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v147 objects:v166 count:16];
            if (!v49)
            {
LABEL_79:

LABEL_80:
              v105 = (void *)MEMORY[0x1D944E080]();
              v106 = v123;
              v107 = HMFGetOSLogHandle();
              long long v42 = v47;
              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                v108 = HMFGetLogIdentifier();
                *(_DWORD *)v156 = 138543874;
                v157 = v108;
                __int16 v158 = 2112;
                uint64_t v159 = (uint64_t)v43;
                __int16 v160 = 2112;
                v161 = v47;
                _os_log_impl(&dword_1D4758000, v107, OS_LOG_TYPE_ERROR, "%{public}@Invalid event response for characteristic ID '%@' against accessory '%@': characteristic was not requested to change event registration", v156, 0x20u);
              }
              id v30 = v134;
              goto LABEL_83;
            }
            uint64_t v50 = v49;
            uint64_t v51 = *(void *)v148;
LABEL_30:
            uint64_t v52 = 0;
            while (1)
            {
              if (*(void *)v148 != v51) {
                objc_enumerationMutation(v48);
              }
              long long v53 = *(void **)(*((void *)&v147 + 1) + 8 * v52);
              long long v54 = [v53 service];
              uint64_t v55 = [v54 accessory];
              uint64_t v56 = [v55 instanceID];

              if (v56)
              {
                if ([v47 isEqualToNumber:v56])
                {
                  long long v57 = [v53 instanceID];
                  char v58 = [v43 isEqualToNumber:v57];

                  if (v58) {
                    break;
                  }
                }
              }

              if (v50 == ++v52)
              {
                uint64_t v50 = [v48 countByEnumeratingWithState:&v147 objects:v166 count:16];
                if (v50) {
                  goto LABEL_30;
                }
                goto LABEL_79;
              }
            }
            id v59 = v53;

            if (!v59) {
              goto LABEL_80;
            }
            [v48 removeObject:v59];
            BOOL v60 = v133;
            if ([v133 intValue])
            {
              uint32_t v61 = HMErrorFromHAPIPStatusErrorCode((void *)[v133 integerValue]);
              uint64_t v62 = [v59 service];
              long long v63 = [v62 accessory];

              id v64 = (void *)MEMORY[0x1D944E080]();
              __int16 v65 = v123;
              v66 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                long long v67 = HMFGetLogIdentifier();
                long long v68 = [v63 instanceID];
                [v59 instanceID];
                long long v69 = v121 = v64;
                [v59 type];
                v122 = v43;
                long long v70 = v47;
                v72 = int v71 = v63;
                *(_DWORD *)v156 = v119;
                v157 = v67;
                __int16 v158 = 2112;
                uint64_t v159 = (uint64_t)v68;
                __int16 v160 = 2112;
                v161 = v69;
                __int16 v162 = 2112;
                v163 = v72;
                __int16 v164 = 2112;
                v165 = v61;
                _os_log_impl(&dword_1D4758000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Event response for characteristic %@/%@/%@ with error: %@", v156, 0x34u);

                long long v63 = v71;
                id v47 = v70;
                uint64_t v43 = v122;

                id v64 = v121;
                BOOL v60 = v133;
              }
            }
            else
            {
              [v59 setEventNotificationsEnabled:v120];
              uint32_t v61 = 0;
            }
            id v73 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v59 error:v61];
            [v129 addObject:v73];

            id v36 = v132;
            uint64_t v40 = v131 + 1;
            id v17 = 0;
            id v30 = v134;
            if (v131 + 1 == v125)
            {
              id v16 = v136;
              uint64_t v32 = v123;
              uint64_t v125 = [obj countByEnumeratingWithState:&v151 objects:buf count:16];
              if (v125) {
                goto LABEL_18;
              }
              goto LABEL_47;
            }
          }
          v105 = (void *)MEMORY[0x1D944E080]();
          v117 = v123;
          v107 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          {
            v118 = HMFGetLogIdentifier();
            *(_DWORD *)v156 = 138544130;
            v157 = v118;
            __int16 v158 = 2112;
            uint64_t v159 = (uint64_t)v43;
            __int16 v160 = 2112;
            v161 = v42;
            __int16 v162 = 2112;
            v163 = v133;
            _os_log_impl(&dword_1D4758000, v107, OS_LOG_TYPE_ERROR, "%{public}@Invalid event response for characteristic ID '%@' against accessory '%@' and HAP status code '%@'", v156, 0x2Au);
          }
LABEL_83:
          BOOL v24 = v137;

          uint64_t v32 = v123;

          id v79 = 0;
          id v16 = v136;
          id v17 = 0;
          id v36 = v132;
          goto LABEL_84;
        }
LABEL_47:

        BOOL v24 = v137;
        if ([v130 count])
        {
          __int16 v74 = (void *)MEMORY[0x1D944E080]();
          v75 = v32;
          __int16 v76 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            v77 = HMFGetLogIdentifier();
            uint64_t v78 = [v130 count];
            *(_DWORD *)v156 = 138543618;
            v157 = v77;
            __int16 v158 = 2048;
            uint64_t v159 = v78;
            _os_log_impl(&dword_1D4758000, v76, OS_LOG_TYPE_ERROR, "%{public}@Invalid event response, '%lu' requested characteristics remain unmatched with a response object", v156, 0x16u);

            id v30 = v134;
          }

          id v79 = 0;
        }
        else
        {
          id v79 = v129;
        }
LABEL_84:
      }
      else
      {
        v98 = (void *)MEMORY[0x1D944E080]();
        v99 = v32;
        __int16 v100 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v102 = v101 = v30;
          uint64_t v103 = [v128 count];
          uint64_t v104 = [v132 count];
          *(_DWORD *)buf = 138543874;
          v168 = v102;
          __int16 v169 = 2048;
          *(void *)v170 = v103;
          *(_WORD *)&v170[8] = 2048;
          *(void *)&v170[10] = v104;
          _os_log_impl(&dword_1D4758000, v100, OS_LOG_TYPE_ERROR, "%{public}@Invalid write response, '%lu' response objects for '%lu' request tuples", buf, 0x20u);

          id v30 = v101;
          id v36 = v132;
          id v16 = v136;
        }

        id v79 = 0;
        BOOL v24 = v137;
      }
      id v35 = v127;
    }
    else
    {
      id v79 = 0;
      BOOL v24 = v137;
    }

    if ([v79 count])
    {
      v93 = 0;
      goto LABEL_68;
    }
    v109 = v30;
    v110 = (void *)MEMORY[0x1D944E080]();
    v111 = v32;
    v112 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    {
      v113 = HMFGetLogIdentifier();
      uint64_t v114 = HTTPGetReasonPhrase();
      v115 = @"HAP JSON";
      *(_DWORD *)buf = 138544386;
      v168 = v113;
      __int16 v169 = 1024;
      *(_DWORD *)v170 = 207;
      id v17 = 0;
      *(_WORD *)&v170[4] = 2080;
      *(void *)&v170[6] = v114;
      *(_WORD *)&v170[14] = 2112;
      *(void *)&v170[16] = @"HAP JSON";
      __int16 v171 = 2112;
      id v172 = v127;
      _os_log_impl(&dword_1D4758000, v112, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response objects for an event registration request, the accessory sent an invalid response with HTTP Status Code '%d %s' and a %@ body: %@", buf, 0x30u);

      BOOL v24 = v137;
      v109 = v134;
    }

    v93 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];

    id v79 = 0;
    id v30 = v109;
LABEL_67:
    id v16 = v136;
LABEL_68:
    v94 = v135;
    goto LABEL_69;
  }
  long long v80 = (void *)MEMORY[0x1D944E080]();
  long long v81 = self;
  long long v82 = HMFGetOSLogHandle();
  long long v83 = v82;
  if (v16 || a4 != 4 || a5 != 204)
  {
    BOOL v24 = v137;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      v95 = HMFGetLogIdentifier();
      uint64_t v96 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3) {
        v97 = @"Invalid";
      }
      else {
        v97 = off_1E69F2448[a4 - 1];
      }
      v116 = v97;
      *(_DWORD *)buf = 138544386;
      v168 = v95;
      __int16 v169 = 1024;
      *(_DWORD *)v170 = a5;
      *(_WORD *)&v170[4] = 2080;
      *(void *)&v170[6] = v96;
      *(_WORD *)&v170[14] = 2112;
      *(void *)&v170[16] = v116;
      __int16 v171 = 2112;
      id v172 = v16;
      _os_log_impl(&dword_1D4758000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to set event registration because the accessory sent an invalid response with HTTP Status Code '%d %s' and a %@ body: %@", buf, 0x30u);

      id v30 = v134;
    }

    v93 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    id v79 = 0;
    id v17 = 0;
    goto LABEL_68;
  }
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v84 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v168 = v84;
    __int16 v169 = 1024;
    *(_DWORD *)v170 = 204;
    id v30 = v134;
    *(_WORD *)&v170[4] = 2080;
    *(void *)&v170[6] = HTTPGetReasonPhrase();
    _os_log_impl(&dword_1D4758000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@Received event registration response with no body and a '%d %s' HTTP status code.", buf, 0x1Cu);
  }
  id v79 = [MEMORY[0x1E4F1CA48] array];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v85 = v30;
  uint64_t v86 = [v85 countByEnumeratingWithState:&v143 objects:v155 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    v88 = 0;
    uint64_t v89 = *(void *)v144;
    do
    {
      uint64_t v90 = 0;
      uint64_t v91 = v88;
      do
      {
        if (*(void *)v144 != v89) {
          objc_enumerationMutation(v85);
        }
        v92 = *(void **)(*((void *)&v143 + 1) + 8 * v90);
        [v92 setEventNotificationsEnabled:v10];
        v88 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v92 error:0];

        [v79 addObject:v88];
        ++v90;
        uint64_t v91 = v88;
      }
      while (v87 != v90);
      uint64_t v87 = [v85 countByEnumeratingWithState:&v143 objects:v155 count:16];
    }
    while (v87);

    id v30 = v134;
  }

  v93 = 0;
  v94 = v135;
  id v16 = v136;
  id v17 = 0;
  BOOL v24 = v137;
LABEL_69:
  [(HAPAccessoryServerIP *)v138 _indicateSessionActivityWithReason:@"Event"];
  if (v94 && v24)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__HAPAccessoryServerIP__handleEventResponseObject_type_httpStatus_error_characteristics_requestedEventState_completion_queue___block_invoke;
    block[3] = &unk_1E69F4070;
    id v142 = v94;
    id v140 = v79;
    id v141 = v93;
    dispatch_async(v24, block);
  }
}

uint64_t __126__HAPAccessoryServerIP__handleEventResponseObject_type_httpStatus_error_characteristics_requestedEventState_completion_queue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  BOOL v57 = a3;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  long long v54 = a6;
  id v11 = v9;
  uint64_t v55 = v11;
  if (self)
  {
    id v12 = v11;
    uint64_t v52 = self;
    id v53 = v10;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v69;
LABEL_4:
      uint64_t v19 = 0;
      id v20 = (void *)v16;
      int v21 = (void *)v17;
      while (1)
      {
        if (*(void *)v69 != v18) {
          objc_enumerationMutation(obj);
        }
        int v22 = v13;
        __int16 v23 = *(void **)(*((void *)&v68 + 1) + 8 * v19);
        if (([v23 properties] & 1) == 0) {
          break;
        }
        BOOL v24 = [v23 service];
        uint64_t v25 = [v24 accessory];
        uint64_t v17 = [v25 instanceID];

        if (!v17)
        {
          id v30 = (void *)MEMORY[0x1D944E080]();
          self = v52;
          id v35 = v52;
          uint64_t v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            id v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v77 = v36;
            __int16 v78 = 2112;
            id v79 = v23;
            _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize event request for characteristic %@ because the accessory instance ID was nil.", buf, 0x16u);
          }
          int v21 = 0;
          uint64_t v34 = 20;
LABEL_20:
          uint64_t v13 = v22;

          id v29 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:v34];

          id v28 = 0;
          goto LABEL_21;
        }
        v75[0] = v17;
        v74[0] = @"aid";
        v74[1] = @"iid";
        uint64_t v26 = [v23 instanceID];
        v75[1] = v26;
        v74[2] = @"ev";
        uint64_t v27 = [NSNumber numberWithBool:v57];
        v75[2] = v27;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];

        uint64_t v13 = v22;
        [v22 addObject:v16];
        ++v19;
        id v20 = (void *)v16;
        int v21 = (void *)v17;
        if (v15 == v19)
        {
          uint64_t v15 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      id v30 = (void *)MEMORY[0x1D944E080]();
      self = v52;
      long long v31 = v52;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v77 = v33;
        __int16 v78 = 2112;
        id v79 = v23;
        _os_log_impl(&dword_1D4758000, v32, OS_LOG_TYPE_ERROR, "%{public}@Characteristic doesn't support notifications: %@", buf, 0x16u);
      }
      uint64_t v34 = 3;
      goto LABEL_20;
    }
    uint64_t v16 = 0;
    uint64_t v17 = 0;
LABEL_13:

    id v28 = v13;
    id v29 = 0;
    int v21 = (void *)v17;
    id v20 = (void *)v16;
    self = v52;
LABEL_21:

    id v10 = v53;
  }
  else
  {
    id v29 = 0;
    id v28 = 0;
  }

  id v37 = v29;
  if (!v28)
  {
    uint64_t v40 = v54;
    if (!v10) {
      goto LABEL_36;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v67 = v10;
    id v66 = v37;
    dispatch_async(v54, block);

    long long v41 = v67;
LABEL_32:

    goto LABEL_36;
  }
  if ([v28 count])
  {
    if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
    {
      uint64_t v72 = @"characteristics";
      id v73 = v28;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      long long v39 = [@"/" stringByAppendingPathComponent:@"characteristics"];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_325;
      v58[3] = &unk_1E69EFF98;
      v58[4] = self;
      id v59 = v55;
      BOOL v62 = v57;
      id v61 = v10;
      uint64_t v40 = v54;
      BOOL v60 = v54;
      [(HAPAccessoryServerIP *)self sendPUTRequestToURL:v39 request:v38 serializationType:1 timeout:v58 completionHandler:10.0];
    }
    else
    {
      id v48 = (void *)MEMORY[0x1D944E080]();
      uint64_t v49 = self;
      uint64_t v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = HMFGetLogIdentifier();
        *(_DWORD *)long long v80 = 138543362;
        long long v81 = v51;
        _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing enableEvents", v80, 0xCu);
      }
      uint64_t v40 = v54;
      [(HAPAccessoryServerIP *)v49 _queueEnableEvents:v57 forCharacteristics:v55 withCompletionHandler:v10 queue:v54];
      [(HAPAccessoryServerIP *)v49 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.events"];
    }
    goto LABEL_36;
  }
  uint64_t v42 = MEMORY[0x1D944E080]();
  uint64_t v43 = self;
  uint64_t v44 = (void *)v42;
  BOOL v45 = v43;
  __int16 v46 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    id v47 = HMFGetLogIdentifier();
    *(_DWORD *)long long v80 = 138543362;
    long long v81 = v47;
    _os_log_impl(&dword_1D4758000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Modifying 0 characteristics, bailing", v80, 0xCu);
  }
  uint64_t v40 = v54;
  if (v10)
  {
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_321;
    v63[3] = &unk_1E69F3B20;
    id v64 = v10;
    dispatch_async(v54, v63);
    long long v41 = v64;
    goto LABEL_32;
  }
LABEL_36:
}

uint64_t __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_321(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__HAPAccessoryServerIP__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_325(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _handleEventResponseObject:a2 type:a3 httpStatus:a4 error:a5 characteristics:*(void *)(a1 + 40) requestedEventState:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56) queue:*(void *)(a1 + 48)];
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HAPAccessoryServerIP_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
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

uint64_t __84__HAPAccessoryServerIP_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableEvents:*(unsigned __int8 *)(a1 + 64) forCharacteristics:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 56) queue:*(void *)(a1 + 48)];
}

- (void)_handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])goto LABEL_23; {
  uint64_t v25 = self;
  }
  uint64_t v26 = v7;
  id v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v27 = v6;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v34 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v14 = [v13 service];
      id v15 = [v14 type];
      if ([v15 isEqualToString:@"00000125-0000-1000-8000-0026BB765291"])
      {
        id v16 = [v13 type];
        int v17 = [v16 isEqualToString:@"00000126-0000-1000-8000-0026BB765291"];

        if (v17)
        {
          id v18 = +[HAPCharacteristicEvent eventWithCharacteristic:v13];
          [v28 addObject:v18];

          goto LABEL_16;
        }
      }
      else
      {
      }
      id v19 = [v14 type];
      if (([v19 isEqualToString:@"00000125-0000-1000-8000-0026BB765291"] & 1) == 0) {
        goto LABEL_14;
      }
      id v20 = [v13 type];
      int v21 = [v20 isEqualToString:@"000000E7-0000-1000-8000-0026BB765291"];

      if (v21)
      {
        id v19 = +[HAPCharacteristicEvent eventWithCharacteristic:v13];
        [v28 addObject:v19];
LABEL_14:
      }
      [v8 addObject:v13];
LABEL_16:
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  }
  while (v10);
LABEL_18:

  if ([v28 count])
  {
    id v37 = @"HAPCharacteristicEvents";
    uint64_t v38 = v28;
    int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    __int16 v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 postNotificationName:@"HAPCharacteristicEventNotification" object:0 userInfo:v22];
  }
  id v7 = v26;
  if ([v8 count])
  {
    BOOL v24 = [(HAPAccessoryServer *)v25 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__HAPAccessoryServerIP__handleUpdatesForCharacteristics_stateNumber___block_invoke;
    block[3] = &unk_1E69F4708;
    void block[4] = v25;
    id v31 = v8;
    id v32 = v26;
    dispatch_async(v24, block);
  }
  id v6 = v27;
LABEL_23:
}

void __69__HAPAccessoryServerIP__handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)[*(id *)(a1 + 40) copy];
  [v4 accessoryServer:v2 didUpdateValuesForCharacteristics:v3 stateNumber:*(void *)(a1 + 48) broadcast:0];
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HAPAccessoryServerIP_handleUpdatesForCharacteristics_stateNumber___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__HAPAccessoryServerIP_handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdatesForCharacteristics:*(void *)(a1 + 40) stateNumber:*(void *)(a1 + 48)];
}

- (void)handleHTTPClientUnavailableErrorWithCompletion:(id)a3 serializationType:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, unint64_t, uint64_t, void *))a3;
  id v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v10;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to handle request because httpClient has been deallocated", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4];
  v6[2](v6, 0, a4, 503, v11);
}

- (void)sendGETRequestToURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HAPAccessoryServerIP *)self httpClient];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v14;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Sending GET request to '%{public}@'", (uint8_t *)&v19, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F653F0] currentActivity];
    if (v15)
    {
      id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
      int v17 = [v16 path];
    }
    [(HAPAccessoryServerIP *)v12 _kickConnectionIdleTimer];
    id v18 = [(HAPAccessoryServerIP *)v12 httpClient];
    [v18 sendGETRequestToURL:v8 timeout:v9 completionHandler:a4];
  }
  else
  {
    [(HAPAccessoryServerIP *)self handleHTTPClientUnavailableErrorWithCompletion:v9 serializationType:1];
  }
}

- (void)sendPOSTRequestToURL:(id)a3 request:(id)a4 serializationType:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(HAPAccessoryServerIP *)self httpClient];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1D944E080]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Sending POST request to '%@'", (uint8_t *)&v19, 0x16u);
    }
    [(HAPAccessoryServerIP *)v15 _kickConnectionIdleTimer];
    id v18 = [(HAPAccessoryServerIP *)v15 httpClient];
    [v18 sendPOSTRequestToURL:v10 withRequestObject:v11 serializationType:a5 completionHandler:v12];
  }
  else
  {
    [(HAPAccessoryServerIP *)self handleHTTPClientUnavailableErrorWithCompletion:v12 serializationType:a5];
  }
}

- (void)sendPUTRequestToURL:(id)a3 request:(id)a4 serializationType:(unint64_t)a5 timeout:(double)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [(HAPAccessoryServerIP *)self httpClient];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1D944E080]();
    int v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = HMFGetLogIdentifier();
      id v20 = (void *)MEMORY[0x1E4F1CAD0];
      id v29 = @"authData";
      __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      id v22 = [v20 setWithArray:v21];
      [v13 secureDescriptionWithBlacklistKeys:v22];
      v23 = id v28 = v16;
      *(_DWORD *)buf = 138543874;
      id v31 = v19;
      __int16 v32 = 2114;
      id v33 = v12;
      __int16 v34 = 2114;
      long long v35 = v23;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Sending PUT request to '%{public}@' with body %{public}@", buf, 0x20u);

      id v16 = v28;
    }

    BOOL v24 = [MEMORY[0x1E4F653F0] currentActivity];
    if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      uint64_t v26 = [v25 path];
    }
    [(HAPAccessoryServerIP *)v17 _kickConnectionIdleTimer];
    id v27 = [(HAPAccessoryServerIP *)v17 httpClient];
    [v27 sendPUTRequestToURL:v12 withRequestObject:v13 serializationType:a5 timeout:v14 completionHandler:a6];
  }
  else
  {
    [(HAPAccessoryServerIP *)self handleHTTPClientUnavailableErrorWithCompletion:v14 serializationType:a5];
  }
}

- (void)_handleWriteResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 requestTuples:(id)a7 completion:(id)a8
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v176 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void (**)(id, id, void *))a8;
  id v16 = (id)MEMORY[0x1D944E080]();
  int v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v209 = v19;
    __int16 v210 = 2114;
    *(void *)v211 = v14;
    *(_WORD *)&v211[8] = 1026;
    *(_DWORD *)&v211[10] = a5;
    *(_WORD *)&v211[14] = 2082;
    *(void *)&v211[16] = HTTPGetReasonPhrase();
    _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Received write response with %{public}@ and '%{public}d %{public}s' HTTP status code", buf, 0x26u);
  }
  id v20 = [MEMORY[0x1E4F653F0] currentActivity];
  if (v13)
  {
    __int16 v21 = (void *)MEMORY[0x1D944E080]();
    id v22 = v17;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      BOOL v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v209 = v24;
      __int16 v210 = 2114;
      *(void *)v211 = v13;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic because the HTTP request returned the following error: %{public}@", buf, 0x16u);
    }
    [v14 count];
    [v13 domain];

    [v13 code];
    uint64_t v25 = [(HAPAccessoryServerIP *)v22 ipConnectionStatistics];
    [v25 accessoryServerIPEvent:4];

    if ([v13 code] == -6723 || objc_msgSend(v13, "code") == -6753)
    {
      uint64_t v26 = (void *)MEMORY[0x1D944E080]();
      id v27 = v22;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v29 = v13;
        id v31 = v30 = v20;
        *(_DWORD *)buf = 138543362;
        v209 = v31;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@interpreting error as unreachable", buf, 0xCu);

        id v20 = v30;
        id v13 = v29;
      }

      id v32 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4 reason:0 underlyingError:v13];
    }
    else
    {
      id v32 = v13;
    }
    uint64_t v38 = v32;
    [(HAPAccessoryServerIP *)v22 _tearDownSessionAndStartReachabilityWithError:v13];
    id v39 = 0;
    id v33 = v176;
    goto LABEL_139;
  }
  __int16 v169 = v15;
  if (a5 == 207 || a5 == 200)
  {
    id v33 = v176;
    id v34 = v176;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v35 = v34;
    }
    else {
      long long v35 = 0;
    }
    id v16 = v35;

    BOOL v37 = a4 == 1 && v16 != 0;
  }
  else
  {
    BOOL v37 = 0;
    id v33 = v176;
  }
  if (a5 == 207 || a5 == 200) {

  }
  id v166 = v14;
  int v167 = a5;
  if (!v37)
  {
    __int16 v102 = (void *)MEMORY[0x1D944E080]();
    uint64_t v103 = v17;
    uint64_t v104 = HMFGetOSLogHandle();
    v105 = v104;
    if (a4 == 4 && !v33 && a5 == 204)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v106 = HMFGetLogIdentifier();
        uint64_t v107 = HTTPGetReasonPhrase();
        *(_DWORD *)buf = 138543874;
        v209 = v106;
        __int16 v210 = 1026;
        *(_DWORD *)v211 = 204;
        *(_WORD *)&v211[4] = 2082;
        *(void *)&v211[6] = v107;
        _os_log_impl(&dword_1D4758000, v105, OS_LOG_TYPE_DEFAULT, "%{public}@Received write response with no body and a '%{public}d %{public}s' HTTP status code.", buf, 0x1Cu);
      }
      v108 = [(HAPAccessoryServerIP *)v103 ipConnectionStatistics];
      [v108 accessoryServerIPEvent:6];

      id v39 = [MEMORY[0x1E4F1CA48] array];
      long long v178 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      id v109 = v14;
      uint64_t v110 = [v109 countByEnumeratingWithState:&v178 objects:v195 count:16];
      if (v110)
      {
        uint64_t v111 = v110;
        v165 = v20;
        v112 = 0;
        uint64_t v113 = *(void *)v179;
        do
        {
          uint64_t v114 = 0;
          v115 = v112;
          do
          {
            if (*(void *)v179 != v113) {
              objc_enumerationMutation(v109);
            }
            v116 = *(void **)(*((void *)&v178 + 1) + 8 * v114);
            v117 = [v116 characteristic];
            v118 = [v116 value];
            [v117 setValue:v118];

            long long v119 = [v116 characteristic];
            v112 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v119 error:0];

            [v39 addObject:v112];
            BOOL v120 = [v116 characteristic];
            [v120 instanceID];

            ++v114;
            v115 = v112;
          }
          while (v111 != v114);
          uint64_t v111 = [v109 countByEnumeratingWithState:&v178 objects:v195 count:16];
        }
        while (v111);

        id v33 = v176;
        id v14 = v166;
        id v20 = v165;
      }

      uint64_t v38 = 0;
      id v15 = v169;
      goto LABEL_139;
    }
    id v15 = v169;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      uint64_t v125 = v20;
      uint64_t v126 = HMFGetLogIdentifier();
      uint64_t v127 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3) {
        v128 = @"Invalid";
      }
      else {
        v128 = off_1E69F2448[a4 - 1];
      }
      long long v143 = v128;
      *(_DWORD *)buf = 138544386;
      v209 = v126;
      __int16 v210 = 1026;
      *(_DWORD *)v211 = a5;
      *(_WORD *)&v211[4] = 2082;
      *(void *)&v211[6] = v127;
      *(_WORD *)&v211[14] = 2114;
      *(void *)&v211[16] = v143;
      __int16 v212 = 2114;
      v213 = v33;
      _os_log_impl(&dword_1D4758000, v105, OS_LOG_TYPE_ERROR, "%{public}@Failed to write characteristic because the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      id v15 = v169;
      id v20 = v125;
      id v13 = 0;
    }

    uint64_t v38 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    id v39 = 0;
LABEL_138:
    id v14 = v166;
    goto LABEL_139;
  }
  uint64_t v40 = (void *)MEMORY[0x1D944E080]();
  long long v41 = v17;
  uint64_t v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = HMFGetLogIdentifier();
    uint64_t v44 = HTTPGetReasonPhrase();
    *(_DWORD *)buf = 138544130;
    v209 = v43;
    __int16 v210 = 1026;
    *(_DWORD *)v211 = a5;
    *(_WORD *)&v211[4] = 2082;
    *(void *)&v211[6] = v44;
    *(_WORD *)&v211[14] = 2114;
    *(void *)&v211[16] = v33;
    _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Characteristic write request responded with '%{public}d %{public}s' HTTP status code %{public}@", buf, 0x26u);
  }
  BOOL v45 = [(HAPAccessoryServerIP *)v41 ipConnectionStatistics];
  [v45 accessoryServerIPEvent:6];

  id v46 = v33;
  id v47 = v14;
  id v48 = [v46 objectForKeyedSubscript:@"characteristics"];
  objc_opt_class();
  __int16 v160 = v48;
  v161 = v46;
  __int16 v171 = v47;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v121 = (void *)MEMORY[0x1D944E080]();
    v122 = HMFGetOSLogHandle();
    id v15 = v169;
    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v124 = v123 = v41;
      *(_DWORD *)buf = 138543618;
      v209 = v124;
      __int16 v210 = 2114;
      *(void *)v211 = @"characteristics";
      _os_log_impl(&dword_1D4758000, v122, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response, %{public}@ key doesn't contain an NSArray", buf, 0x16u);

      long long v41 = v123;
    }

    id v39 = 0;
    id v47 = v171;
    goto LABEL_118;
  }
  uint64_t v49 = [v48 count];
  if (v49 != [v47 count])
  {
    v129 = (void *)MEMORY[0x1D944E080]();
    v130 = HMFGetOSLogHandle();
    id v15 = v169;
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
    {
      uint64_t v131 = HMFGetLogIdentifier();
      v132 = v41;
      uint64_t v133 = [v160 count];
      uint64_t v134 = [v171 count];
      *(_DWORD *)buf = 138543874;
      v209 = v131;
      __int16 v210 = 2050;
      *(void *)v211 = v133;
      long long v41 = v132;
      *(_WORD *)&v211[8] = 2050;
      *(void *)&v211[10] = v134;
      _os_log_impl(&dword_1D4758000, v130, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response, '%{public}lu' response objects for '%{public}lu' request tuples", buf, 0x20u);

      id v47 = v171;
    }

    id v39 = 0;
    goto LABEL_118;
  }
  v155 = v41;
  __int16 v162 = [MEMORY[0x1E4F1CA48] arrayWithArray:v47];
  uint64_t v159 = [MEMORY[0x1E4F1CA48] array];
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  obuint64_t j = v48;
  uint64_t v170 = [obj countByEnumeratingWithState:&v191 objects:buf count:16];
  if (!v170) {
    goto LABEL_87;
  }
  uint64_t v168 = *(void *)v192;
  __int16 v164 = v20;
  do
  {
    uint64_t v50 = 0;
    do
    {
      id v51 = v13;
      if (*(void *)v192 != v168) {
        objc_enumerationMutation(obj);
      }
      uint64_t v52 = *(void **)(*((void *)&v191 + 1) + 8 * v50);
      id v53 = objc_msgSend(v52, "hmf_numberForKey:", @"aid");
      uint64_t v54 = objc_msgSend(v52, "hmf_numberForKey:", @"iid");
      v174 = [v52 objectForKeyedSubscript:@"value"];
      uint64_t v55 = objc_msgSend(v52, "hmf_numberForKey:", @"status");
      v177 = (void *)v54;
      if (v53) {
        BOOL v56 = v54 == 0;
      }
      else {
        BOOL v56 = 1;
      }
      v175 = (void *)v55;
      BOOL v57 = v56 || v55 == 0;
      uint64_t v173 = v50;
      if (v57)
      {
        char v58 = (void *)MEMORY[0x1D944E080]();
        id v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          BOOL v60 = HMFGetLogIdentifier();
          *(_DWORD *)v198 = 138544386;
          v199 = v60;
          __int16 v200 = 2114;
          uint64_t v201 = (uint64_t)v177;
          __int16 v202 = 2114;
          v203 = v53;
          __int16 v204 = 2114;
          v205 = v174;
          __int16 v206 = 2114;
          v207 = v175;
          _os_log_impl(&dword_1D4758000, v59, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response for characteristic ID '%{public}@' against accessory '%{public}@' with value '%{public}@' and HAP status code '%{public}@'", v198, 0x34u);

          id v47 = v171;
        }

        int v61 = 1;
        goto LABEL_84;
      }
      long long v189 = 0u;
      long long v190 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      id v62 = v162;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v187 objects:v197 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v188;
LABEL_51:
        uint64_t v66 = 0;
        while (1)
        {
          if (*(void *)v188 != v65) {
            objc_enumerationMutation(v62);
          }
          id v67 = *(void **)(*((void *)&v187 + 1) + 8 * v66);
          long long v68 = [v67 characteristic];
          long long v69 = [v68 service];
          long long v70 = [v69 accessory];
          long long v71 = [v70 instanceID];

          if (v71)
          {
            if ([v53 isEqualToNumber:v71])
            {
              uint64_t v72 = [v68 instanceID];
              char v73 = [v177 isEqualToNumber:v72];

              if (v73) {
                break;
              }
            }
          }

          if (v64 == ++v66)
          {
            uint64_t v64 = [v62 countByEnumeratingWithState:&v187 objects:v197 count:16];
            if (v64) {
              goto LABEL_51;
            }
            goto LABEL_59;
          }
        }
        id v74 = v67;

        if (!v74) {
          goto LABEL_66;
        }
        id v20 = v164;
        if (v68)
        {
          [v62 removeObject:v74];
          if ([v175 intValue])
          {
            HMErrorFromHAPIPStatusErrorCode((void *)[v175 integerValue]);
            id v75 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v76 = [v68 service];
            v77 = [v76 accessory];

            __int16 v158 = v77;
            __int16 v78 = [v77 server];
            context = (void *)MEMORY[0x1D944E080]();
            id v79 = v78;
            long long v80 = HMFGetOSLogHandle();
            id v33 = v176;
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              long long v81 = HMFGetLogIdentifier();
              [v158 instanceID];
              uint64_t v82 = v156 = v75;
              long long v83 = [v68 instanceID];
              uint64_t v84 = [v68 type];
              *(_DWORD *)v198 = 138544386;
              v199 = v81;
              __int16 v200 = 2114;
              uint64_t v201 = (uint64_t)v82;
              __int16 v202 = 2114;
              v203 = v83;
              __int16 v204 = 2114;
              v205 = v84;
              __int16 v206 = 2114;
              v207 = v156;
              _os_log_impl(&dword_1D4758000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Response for characteristic write %{public}@/%{public}@/%{public}@ with error: %{public}@", v198, 0x34u);

              id v20 = v164;
              id v75 = v156;
            }

            id v47 = v171;
            id v85 = v158;
            goto LABEL_82;
          }
          int v89 = [v74 includeResponseValue];
          id v33 = v176;
          if (v174)
          {
            id v47 = v171;
            if (v89)
            {
              uint64_t v90 = [v68 metadata];
              uint64_t v91 = [v90 format];
              uint64_t v92 = HAPCharacteristicFormatFromString(v91);

              v93 = +[HAPJSONValueTransformer defaultJSONValueTransformer];
              id v186 = 0;
              id v85 = [v93 reverseTransformedValue:v174 format:v92 error:&v186];
              id v75 = v186;

              if (!v75) {
                [v68 setValue:v85];
              }
              id v47 = v171;
              goto LABEL_82;
            }
            goto LABEL_81;
          }
          if ((v89 & 1) == 0)
          {
            [v74 includeResponseValue];
            id v47 = v171;
LABEL_81:
            id v85 = [v74 value];
            [v68 setValue:v85];
            id v75 = 0;
LABEL_82:

            v97 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v68 error:v75];
            [v159 addObject:v97];

            int v61 = 0;
            goto LABEL_83;
          }
          v94 = (void *)MEMORY[0x1D944E080]();
          v95 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            uint64_t v96 = HMFGetLogIdentifier();
            *(_DWORD *)v198 = 138543874;
            v199 = v96;
            __int16 v200 = 2114;
            uint64_t v201 = (uint64_t)v177;
            __int16 v202 = 2114;
            v203 = v53;
            _os_log_impl(&dword_1D4758000, v95, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response for characteristic ID '%{public}@' against accessory '%{public}@': response value is not included in the response when one is requested", v198, 0x20u);
          }
          int v61 = 1;
          goto LABEL_70;
        }
      }
      else
      {
LABEL_59:

        long long v68 = 0;
        id v74 = 0;
LABEL_66:
        id v20 = v164;
      }
      uint64_t v86 = (void *)MEMORY[0x1D944E080]();
      uint64_t v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        v88 = HMFGetLogIdentifier();
        *(_DWORD *)v198 = 138543874;
        v199 = v88;
        __int16 v200 = 2114;
        uint64_t v201 = (uint64_t)v177;
        __int16 v202 = 2114;
        v203 = v53;
        _os_log_impl(&dword_1D4758000, v87, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response for characteristic ID '%{public}@' against accessory '%{public}@': characteristic was not requested to be written", v198, 0x20u);
      }
      int v61 = 1;
      id v33 = v176;
LABEL_70:
      id v47 = v171;
LABEL_83:

      id v51 = 0;
LABEL_84:

      if (v61)
      {

        id v39 = 0;
        id v15 = v169;
        id v13 = v51;
LABEL_116:
        long long v41 = v155;
        goto LABEL_117;
      }
      uint64_t v50 = v173 + 1;
      id v13 = v51;
    }
    while (v173 + 1 != v170);
    uint64_t v170 = [obj countByEnumeratingWithState:&v191 objects:buf count:16];
  }
  while (v170);
LABEL_87:

  if (![v162 count])
  {
    id v39 = v159;
    id v15 = v169;
    goto LABEL_116;
  }
  v98 = (void *)MEMORY[0x1D944E080]();
  v99 = HMFGetOSLogHandle();
  long long v41 = v155;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
  {
    __int16 v100 = HMFGetLogIdentifier();
    uint64_t v101 = [v162 count];
    *(_DWORD *)v198 = 138543618;
    v199 = v100;
    __int16 v200 = 2050;
    uint64_t v201 = v101;
    _os_log_impl(&dword_1D4758000, v99, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid write response, '%{public}lu' request tuples remain unmatched with a response object", v198, 0x16u);
  }
  id v39 = 0;
  id v15 = v169;
LABEL_117:

LABEL_118:
  if (![v39 count])
  {
    id v135 = (void *)MEMORY[0x1D944E080]();
    id v136 = v41;
    v137 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      id v138 = v13;
      v139 = v20;
      id v140 = HMFGetLogIdentifier();
      uint64_t v141 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3) {
        id v142 = @"Invalid";
      }
      else {
        id v142 = off_1E69F2448[a4 - 1];
      }
      long long v144 = v142;
      *(_DWORD *)buf = 138544386;
      v209 = v140;
      __int16 v210 = 1026;
      *(_DWORD *)v211 = v167;
      *(_WORD *)&v211[4] = 2082;
      *(void *)&v211[6] = v141;
      *(_WORD *)&v211[14] = 2114;
      *(void *)&v211[16] = v144;
      __int16 v212 = 2114;
      v213 = v161;
      _os_log_impl(&dword_1D4758000, v137, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse response objects for a write request, the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      id v15 = v169;
      id v20 = v139;
      id v13 = v138;
    }

    uint64_t v38 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];

    id v39 = 0;
    if (v20) {
      goto LABEL_130;
    }
    goto LABEL_138;
  }
  uint64_t v38 = 0;
  if (!v20) {
    goto LABEL_138;
  }
LABEL_130:
  id v145 = v13;
  long long v146 = v20;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  id v39 = v39;
  uint64_t v147 = [v39 countByEnumeratingWithState:&v182 objects:v196 count:16];
  if (v147)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *(void *)v183;
    do
    {
      for (uint64_t i = 0; i != v148; ++i)
      {
        if (*(void *)v183 != v149) {
          objc_enumerationMutation(v39);
        }
        long long v151 = *(void **)(*((void *)&v182 + 1) + 8 * i);
        long long v152 = [v151 characteristic];
        [v152 instanceID];

        long long v153 = [v151 error];
        [v153 domain];

        long long v154 = [v151 error];
        [v154 code];
      }
      uint64_t v148 = [v39 countByEnumeratingWithState:&v182 objects:v196 count:16];
    }
    while (v148);
  }

  id v14 = v166;
  id v15 = v169;
  id v20 = v146;
  id v13 = v145;
LABEL_139:
  if (v15) {
    v15[2](v15, v39, v38);
  }
}

- (void)_handlePrepareWriteResponseObject:(id)a3 type:(unint64_t)a4 prepareIdentifier:(id)a5 httpStatus:(int)a6 error:(id)a7 requestTuples:(id)a8 timeout:(double)a9 queue:(id)a10 originalCompletion:(id)a11 completion:(id)a12
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v68 = a5;
  id v20 = a7;
  id v71 = a8;
  id v70 = a10;
  id v69 = a11;
  __int16 v21 = (void (**)(id, void, id))a12;
  id v22 = (void *)MEMORY[0x1D944E080]();
  uint64_t v23 = self;
  BOOL v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    char v73 = v25;
    __int16 v74 = 1026;
    *(_DWORD *)id v75 = a6;
    *(_WORD *)&v75[4] = 2082;
    *(void *)&v75[6] = HTTPGetReasonPhrase();
    _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Received prepare write response with '%{public}d %{public}s' HTTP status code", buf, 0x1Cu);
  }
  uint64_t v26 = [MEMORY[0x1E4F653F0] currentActivity];
  id v27 = (void *)v26;
  if (v20)
  {
    uint64_t v66 = v21;
    id v28 = (void *)MEMORY[0x1D944E080]();
    id v29 = v23;
    id v30 = HMFGetOSLogHandle();
    id v32 = v69;
    id v31 = v70;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v73 = v33;
      __int16 v74 = 2114;
      *(void *)id v75 = v20;
      _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare write characteristic because the HTTP request returned the following error: %{public}@", buf, 0x16u);
    }
    [v20 domain];

    [v20 code];
    if ([v20 code] == -6723 || objc_msgSend(v20, "code") == -6753)
    {
      id v34 = v19;
      long long v35 = v27;
      uint64_t v36 = (void *)MEMORY[0x1D944E080]();
      BOOL v37 = v29;
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        char v73 = v39;
        _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@interpreting error as unreachable", buf, 0xCu);
      }
      id v40 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4 reason:0 underlyingError:v20];
      id v27 = v35;
      id v19 = v34;
    }
    else
    {
      id v40 = v20;
    }
    [(HAPAccessoryServerIP *)v29 _tearDownSessionAndStartReachabilityWithError:v20];
    __int16 v21 = v66;
    id v51 = v68;
    uint64_t v52 = v71;
    if (v66) {
      v66[2](v66, 0, v40);
    }
  }
  else
  {
    id v67 = (void *)v26;
    if (a6 == 200
      && (id v41 = v19, objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v41, a4 == 1)
      && (isKindOfClass & 1) != 0
      && v41)
    {
      uint64_t v43 = [v41 objectForKeyedSubscript:@"status"];
      uint64_t v44 = v43;
      if (v43)
      {
        int v45 = [v43 intValue];
        id v46 = (void *)MEMORY[0x1D944E080]();
        id v47 = v23;
        id v48 = HMFGetOSLogHandle();
        uint64_t v49 = v48;
        if (v45)
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            char v73 = v50;
            __int16 v74 = 2114;
            *(void *)id v75 = v44;
            *(_WORD *)&v75[8] = 2114;
            *(void *)&v75[10] = v41;
            _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Prepare write failed with HAP Status Code %{public}@ and a body: %{public}@", buf, 0x20u);
          }
          HMErrorFromHAPIPStatusErrorCode((void *)[v44 integerValue]);
          id v40 = (id)objc_claimAutoreleasedReturnValue();
          if (v21) {
            v21[2](v21, 0, v40);
          }
          id v51 = v68;
          id v32 = v69;
          id v31 = v70;
          uint64_t v52 = v71;
        }
        else
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            uint64_t v64 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            char v73 = v64;
            __int16 v74 = 2112;
            *(void *)id v75 = v71;
            _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_INFO, "%{public}@Performing execute write for inCharacteristicWriteRequestTuples %@", buf, 0x16u);
          }
          id v31 = v70;
          uint64_t v52 = v71;
          id v51 = v68;
          id v32 = v69;
          [(HAPAccessoryServerIP *)v47 _performExecuteWriteValues:v71 prepareIdentifier:v68 timeout:v70 queue:v69 completionHandler:a9];
          id v40 = 0;
        }
      }
      else
      {
        BOOL v60 = (void *)MEMORY[0x1D944E080]();
        int v61 = v23;
        id v62 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          uint64_t v63 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          char v73 = v63;
          _os_log_impl(&dword_1D4758000, v62, OS_LOG_TYPE_ERROR, "%{public}@Invalid prepare write response", buf, 0xCu);
        }
        id v40 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:59];
        id v32 = v69;
        id v31 = v70;
        if (v21) {
          v21[2](v21, 0, v40);
        }
        id v51 = v68;
        uint64_t v52 = v71;
      }
      id v27 = v67;
    }
    else
    {
      id v53 = (void *)MEMORY[0x1D944E080]();
      uint64_t v54 = v23;
      uint64_t v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = v53;
        BOOL v56 = HMFGetLogIdentifier();
        uint64_t v57 = HTTPGetReasonPhrase();
        if (a4 - 1 > 3) {
          char v58 = @"Invalid";
        }
        else {
          char v58 = off_1E69F2448[a4 - 1];
        }
        id v59 = v58;
        *(_DWORD *)buf = 138544386;
        char v73 = v56;
        __int16 v74 = 1026;
        *(_DWORD *)id v75 = a6;
        *(_WORD *)&v75[4] = 2082;
        *(void *)&v75[6] = v57;
        *(_WORD *)&v75[14] = 2114;
        *(void *)&v75[16] = v59;
        __int16 v76 = 2114;
        id v77 = v19;
        _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare write characteristic because the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

        id v53 = v65;
      }

      id v32 = v69;
      id v31 = v70;
      id v40 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4];
      id v27 = v67;
      if (v21) {
        v21[2](v21, 0, v40);
      }
      id v51 = v68;
      uint64_t v52 = v71;
    }
  }
}

- (void)_performExecuteWriteValues:(id)a3 prepareIdentifier:(id)a4 timeout:(double)a5 queue:(id)a6 completionHandler:(id)a7
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v41 = 0;
  id v16 = -[HAPAccessoryServerIP _serializeCharacteristicWriteRequestTuples:error:](self, v12, &v41);
  id v17 = v41;
  id v18 = v17;
  if (v15 && v14 && v17)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v40 = v15;
    id v18 = v18;
    id v39 = v18;
    dispatch_async(v14, block);

    id v19 = &v40;
  }
  else
  {
    if (v13)
    {
      v42[0] = @"characteristics";
      v42[1] = @"pid";
      v43[0] = v16;
      v43[1] = v13;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      objc_initWeak(&location, self);
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      id v28 = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_3;
      id v29 = &unk_1E69EFED0;
      objc_copyWeak(v33, &location);
      id v30 = v12;
      v33[1] = *(id *)&a5;
      id v31 = v14;
      id v32 = v15;
      __int16 v21 = (void *)MEMORY[0x1D944E2D0](&v26);
      id v22 = [@"/" stringByAppendingPathComponent:@"characteristics"];
      double v23 = 10.0;
      if (a5 > 0.0) {
        double v23 = a5;
      }
      -[HAPAccessoryServerIP sendPUTRequestToURL:request:serializationType:timeout:completionHandler:](self, "sendPUTRequestToURL:request:serializationType:timeout:completionHandler:", v22, v20, 1, v21, v23, v33, v26, v27, v28, v29);

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    BOOL v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];

    if (v14 == 0 || v15 == 0)
    {
      id v18 = v24;
      goto LABEL_11;
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_2;
    v35[3] = &unk_1E69F3C68;
    id v37 = v15;
    id v18 = v24;
    id v36 = v18;
    dispatch_async(v14, v35);

    id v19 = &v37;
  }
  id v20 = *v19;
LABEL_10:

LABEL_11:
}

- (id)_serializeCharacteristicWriteRequestTuples:(void *)a3 error:
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  v98 = a1;
  if (!a1)
  {
    id v86 = 0;
    goto LABEL_56;
  }
  v97 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v6;
  uint64_t v96 = [obj countByEnumeratingWithState:&v101 objects:v114 count:16];
  id v8 = 0;
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  id v12 = 0;
  if (!v96)
  {
    id v36 = 0;
    goto LABEL_50;
  }
  uint64_t v95 = *(void *)v102;
  *(void *)&long long v7 = 138543362;
  long long v88 = v7;
  int v89 = a3;
  uint64_t v90 = v6;
  do
  {
    uint64_t v13 = 0;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    id v17 = v12;
    do
    {
      if (*(void *)v102 != v95) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v101 + 1) + 8 * v13);
      id v12 = objc_msgSend(v18, "value", v88);

      id v10 = [v18 characteristic];

      id v19 = [v10 service];
      id v20 = [v19 accessory];
      id v9 = [v20 instanceID];

      if (v10) {
        BOOL v21 = v9 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21)
      {
        id v69 = (void *)MEMORY[0x1D944E080]();
        id v70 = v98;
        id v71 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          uint64_t v72 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          uint64_t v107 = v72;
          __int16 v108 = 2112;
          uint64_t v109 = (uint64_t)v12;
          __int16 v110 = 2112;
          uint64_t v111 = (uint64_t)v10;
          __int16 v112 = 2112;
          uint64_t v113 = v9;
          _os_log_impl(&dword_1D4758000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize characteristic write requests because the tuple contained a value of '%@' for characteristic '%@' with an accessory instance ID of '%@'", buf, 0x2Au);
        }
        id v36 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
LABEL_45:
        id v8 = v14;
LABEL_49:
        a3 = v89;
        id v6 = v90;
        goto LABEL_50;
      }
      v99 = v12;
      if (![v10 shouldValidateValueAfterReading])
      {
        uint64_t v24 = 12;
LABEL_18:
        id v34 = +[HAPJSONValueTransformer defaultJSONValueTransformer];
        id v100 = 0;
        uint64_t v35 = [v34 transformedValue:v12 format:v24 error:&v100];
        id v36 = v100;

        id v11 = (void *)v35;
        if (v36) {
          goto LABEL_42;
        }
        goto LABEL_19;
      }
      id v22 = [v10 metadata];
      double v23 = [v22 format];
      uint64_t v24 = HAPCharacteristicFormatFromString(v23);

      if (v24) {
        goto LABEL_18;
      }
      uint64_t v25 = (void *)MEMORY[0x1E4F28D90];
      v105 = v12;
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
      int v27 = [v25 isValidJSONObject:v26];

      id v28 = (void *)MEMORY[0x1D944E080]();
      id v29 = v98;
      id v30 = HMFGetOSLogHandle();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (v27)
      {
        if (v31)
        {
          id v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v88;
          uint64_t v107 = v32;
          _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", buf, 0xCu);
        }
        id v12 = v99;
        id v33 = v99;

        id v11 = v33;
      }
      else
      {
        if (v31)
        {
          id v67 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v88;
          uint64_t v107 = v67;
          _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@The characteristic has not specified a characteristic format type and the characteristic value is of a type that cannot be serialized.", buf, 0xCu);
        }
        id v36 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:43];
        id v12 = v99;
        if (v36)
        {
LABEL_42:
          char v73 = (void *)MEMORY[0x1D944E080]();
          id v74 = v98;
          id v75 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v76 = v9;
            id v77 = v10;
            v79 = uint64_t v78 = v11;
            *(_DWORD *)buf = 138543874;
            uint64_t v107 = v79;
            __int16 v108 = 2112;
            uint64_t v109 = (uint64_t)v12;
            __int16 v110 = 2112;
            uint64_t v111 = (uint64_t)v36;
            _os_log_impl(&dword_1D4758000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform characteristic value '%@' with error: %@", buf, 0x20u);

            id v11 = v78;
            id v10 = v77;
            id v9 = v76;
          }

          goto LABEL_45;
        }
      }
LABEL_19:
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];

      [v8 setObject:v9 forKeyedSubscript:@"aid"];
      id v37 = [v10 instanceID];
      [v8 setObject:v37 forKeyedSubscript:@"iid"];

      [v8 setObject:v11 forKeyedSubscript:@"value"];
      if ([v18 includeResponseValue])
      {
        uint64_t v38 = [v18 characteristic];
        char v39 = [v38 properties];

        if ((v39 & 0x80) == 0)
        {
          long long v80 = (void *)MEMORY[0x1D944E080]();
          id v81 = v98;
          uint64_t v82 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v84 = v83 = v11;
            *(_DWORD *)buf = 138543874;
            uint64_t v107 = v84;
            __int16 v108 = 2112;
            uint64_t v109 = (uint64_t)v10;
            __int16 v110 = 2112;
            uint64_t v111 = (uint64_t)v9;
            _os_log_impl(&dword_1D4758000, v82, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize characteristic write requests because the tuple requires a write response value but the characteristic '%@' on accessory with instance ID '%@' does not support it", buf, 0x20u);

            id v11 = v83;
          }

          id v36 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3];
          goto LABEL_49;
        }
        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"r"];
      }
      id v40 = [v18 authorizationData];
      uint64_t v41 = [v40 length];

      if (v41)
      {
        uint64_t v42 = (void *)MEMORY[0x1D944E080]();
        id v43 = v98;
        uint64_t v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v92 = v9;
          int v45 = v10;
          id v47 = v46 = v11;
          id v48 = [v18 authorizationData];
          uint64_t v49 = [v48 length];
          *(_DWORD *)buf = 138543618;
          uint64_t v107 = v47;
          __int16 v108 = 2048;
          uint64_t v109 = v49;
          _os_log_impl(&dword_1D4758000, v44, OS_LOG_TYPE_INFO, "%{public}@Appending authorization data to characteristic write requests with length: %tu", buf, 0x16u);

          id v11 = v46;
          id v10 = v45;
          id v9 = v92;
        }

        uint64_t v50 = [v18 authorizationData];
        id v51 = [v50 base64EncodedStringWithOptions:0];
        [v8 setObject:v51 forKeyedSubscript:@"authData"];

        id v12 = v99;
      }
      uint64_t v52 = [v18 contextData];
      uint64_t v53 = [v52 length];

      if (v53)
      {
        uint64_t v54 = (void *)MEMORY[0x1D944E080]();
        id v55 = v98;
        BOOL v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v57 = v91 = v54;
          [v18 contextData];
          char v58 = v93 = v11;
          [v18 contextData];
          id v59 = v9;
          v61 = BOOL v60 = v10;
          uint64_t v62 = [v61 length];
          *(_DWORD *)buf = 138543874;
          uint64_t v107 = v57;
          __int16 v108 = 2112;
          uint64_t v109 = (uint64_t)v58;
          __int16 v110 = 2048;
          uint64_t v111 = v62;
          _os_log_impl(&dword_1D4758000, v56, OS_LOG_TYPE_INFO, "%{public}@Appending context data %@ to characteristic write requests with length: %tu", buf, 0x20u);

          id v10 = v60;
          id v9 = v59;

          id v11 = v93;
          uint64_t v54 = v91;
        }

        uint64_t v63 = [v18 contextData];
        uint64_t v64 = [v63 base64EncodedStringWithOptions:0];
        [v8 setObject:v64 forKeyedSubscript:@"ctxData"];

        id v12 = v99;
      }
      [v97 addObject:v8];
      ++v13;
      id v14 = v8;
      id v15 = v9;
      id v16 = v10;
      uint64_t v65 = v9;
      uint64_t v66 = v10;
      id v17 = v12;
    }
    while (v96 != v13);
    uint64_t v68 = [obj countByEnumeratingWithState:&v101 objects:v114 count:16];
    id v36 = 0;
    a3 = v89;
    id v6 = v90;
    id v10 = v66;
    id v9 = v65;
    uint64_t v96 = v68;
  }
  while (v68);
LABEL_50:

  if (a3) {
    *a3 = v36;
  }
  if (v36) {
    id v85 = 0;
  }
  else {
    id v85 = v97;
  }
  id v86 = v85;

LABEL_56:

  return v86;
}

uint64_t __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v12 = a1[4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_4;
  v13[3] = &unk_1E69EFEA8;
  objc_copyWeak(v17, a1 + 7);
  id v14 = a1[4];
  v17[1] = a1[8];
  id v15 = a1[5];
  id v16 = a1[6];
  [WeakRetained _handleWriteResponseObject:v9 type:a3 httpStatus:a4 error:v10 requestTuples:v12 completion:v13];

  objc_destroyWeak(v17);
}

void __101__HAPAccessoryServerIP__performExecuteWriteValues_prepareIdentifier_timeout_queue_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleWriteECONNResetError:v6 writeRequests:*(void *)(a1 + 32) responses:v7 timeout:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
}

- (void)_performTimedWriteValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  dispatch_queue_t queue = (dispatch_queue_t)a5;
  id v9 = a6;
  uint64_t v55 = 0;
  id v29 = HMFRandomDataWithLength();
  [v29 getBytes:&v55 length:8];
  id v30 = [NSNumber numberWithUnsignedLongLong:v55];
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:&unk_1F2C808F8 forKeyedSubscript:@"ttl"];
  [v10 setObject:v30 forKeyedSubscript:@"pid"];
  if (!v9 || v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F65400]);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v11);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2;
    v44[3] = &unk_1E69EFF70;
    objc_copyWeak(&v49, &location);
    objc_copyWeak(v50, &from);
    id v45 = v30;
    id v12 = v27;
    id v46 = v12;
    v50[1] = *(id *)&a4;
    uint64_t v13 = queue;
    id v47 = v13;
    id v14 = v9;
    id v48 = v14;
    id v15 = (void *)MEMORY[0x1D944E2D0](v44);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_4;
    v39[3] = &unk_1E69F1AA8;
    objc_copyWeak(&v42, &from);
    objc_copyWeak(&v43, &location);
    id v40 = v10;
    id v25 = v15;
    id v41 = v25;
    [v11 addExecutionBlock:v39];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2_263;
    v35[3] = &unk_1E69F4270;
    objc_copyWeak(&v38, &from);
    id v37 = v14;
    id v36 = v13;
    [v11 setCompletionBlock:v35];
    id v16 = [MEMORY[0x1E4F653F0] currentActivity];
    if (v16)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = v12;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v56 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v32 != v19) {
              objc_enumerationMutation(v17);
            }
            BOOL v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id v22 = v16;
            double v23 = [v21 characteristic];
            [v23 instanceID];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v56 count:16];
        }
        while (v18);
      }
    }
    uint64_t v24 = [(HAPAccessoryServerIP *)self clientOperationQueue];
    [v24 addOperation:v11];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v42);

    objc_destroyWeak(v50);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v54 = v9;
    dispatch_async(queue, block);
    id v11 = v54;
  }
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, void *a5)
{
  id v15 = a2;
  id v14 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  double v11 = *(double *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3;
  v18[3] = &unk_1E69EFEA8;
  objc_copyWeak(v22, (id *)(a1 + 64));
  id v19 = *(id *)(a1 + 40);
  v22[1] = *(id *)(a1 + 80);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  [WeakRetained _handlePrepareWriteResponseObject:v15 type:a3 prepareIdentifier:v9 httpStatus:a4 error:v14 requestTuples:v10 timeout:v11 queue:v13 originalCompletion:v12 completion:v18];
  [v8 finish];

  objc_destroyWeak(v22);
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_4(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    if (v3)
    {
      id v4 = [v3 clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_262;
      block[3] = &unk_1E69F4070;
      void block[4] = v3;
      id v10 = a1[4];
      id v11 = a1[5];
      dispatch_async(v4, block);
    }
    else
    {
      id v5 = (void *)MEMORY[0x1D944E080]();
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to timed write values because IP Accessory Server has been deallocated", buf, 0xCu);
      }
      id v8 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
      [WeakRetained cancelWithError:v8];
    }
  }
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_2_263(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained error];
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);

    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3_264;
      v6[3] = &unk_1E69F3C68;
      id v5 = *(NSObject **)(a1 + 32);
      id v8 = *(id *)(a1 + 40);
      id v7 = WeakRetained;
      dispatch_async(v5, v6);
    }
  }
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3_264(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_262(uint64_t a1)
{
  id v2 = [@"/" stringByAppendingPathComponent:@"prepare"];
  [*(id *)(a1 + 32) sendPUTRequestToURL:v2 request:*(void *)(a1 + 40) serializationType:1 timeout:*(void *)(a1 + 48) completionHandler:5.0];
}

void __81__HAPAccessoryServerIP__performTimedWriteValues_timeout_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleWriteECONNResetError:v6 writeRequests:*(void *)(a1 + 32) responses:v7 timeout:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
}

- (void)_performWriteValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  dispatch_queue_t queue = a5;
  id v11 = a6;
  id v49 = 0;
  id v25 = v10;
  uint64_t v26 = -[HAPAccessoryServerIP _serializeCharacteristicWriteRequestTuples:error:](self, v10, &v49);
  id v12 = v49;
  uint64_t v13 = v12;
  if (v11 && v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke;
    block[3] = &unk_1E69F3C68;
    id v48 = v11;
    id v47 = v13;
    dispatch_async(queue, block);

    id v14 = v48;
  }
  else
  {
    uint64_t v50 = @"characteristics";
    v51[0] = v26;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    objc_initWeak(&location, self);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2;
    v40[3] = &unk_1E69EFED0;
    objc_copyWeak(v44, &location);
    id v15 = v10;
    id v41 = v15;
    v44[1] = *(id *)&a4;
    id v16 = queue;
    id v42 = v16;
    id v17 = v11;
    id v43 = v17;
    uint64_t v18 = (void *)MEMORY[0x1D944E2D0](v40);
    id v19 = objc_alloc_init(MEMORY[0x1E4F65400]);
    objc_initWeak(&from, v19);
    id v20 = [MEMORY[0x1E4F653F0] currentActivity];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_4;
    v32[3] = &unk_1E69EFF48;
    objc_copyWeak(&v37, &from);
    objc_copyWeak(v38, &location);
    id v21 = v20;
    id v33 = v21;
    id v34 = v15;
    v38[1] = *(id *)&a4;
    id v14 = v24;
    id v35 = v14;
    id v22 = v18;
    id v36 = v22;
    [v19 addExecutionBlock:v32];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2_260;
    v28[3] = &unk_1E69F4270;
    objc_copyWeak(&v31, &from);
    id v30 = v17;
    id v29 = v16;
    [v19 setCompletionBlock:v28];
    double v23 = [(HAPAccessoryServerIP *)self clientOperationQueue];
    [v23 addOperation:v19];

    objc_destroyWeak(&v31);
    objc_destroyWeak(v38);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&from);
    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
  }
}

uint64_t __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v12 = a1[4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3;
  v13[3] = &unk_1E69EFEA8;
  objc_copyWeak(v17, a1 + 7);
  id v14 = a1[4];
  v17[1] = a1[8];
  id v15 = a1[5];
  id v16 = a1[6];
  [WeakRetained _handleWriteResponseObject:v9 type:a3 httpStatus:a4 error:v10 requestTuples:v12 completion:v13];

  objc_destroyWeak(v17);
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_4(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v4 = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    if (v4)
    {
      id v5 = [v4 clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_252;
      block[3] = &unk_1E69EFF20;
      objc_copyWeak(v17, v2);
      id v12 = a1[4];
      id v6 = a1[5];
      v17[1] = a1[10];
      id v13 = v6;
      id v14 = v4;
      id v15 = a1[6];
      id v16 = a1[7];
      dispatch_async(v5, block);

      objc_destroyWeak(v17);
    }
    else
    {
      id v7 = (void *)MEMORY[0x1D944E080]();
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v19 = v9;
        _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to write values because IP Accessory Server has been deallocated", buf, 0xCu);
      }
      id v10 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
      [WeakRetained cancelWithError:v10];
    }
  }
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_2_260(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained error];
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);

    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3_261;
      v6[3] = &unk_1E69F3C68;
      id v5 = *(NSObject **)(a1 + 32);
      id v8 = *(id *)(a1 + 40);
      id v7 = WeakRetained;
      dispatch_async(v5, v6);
    }
  }
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3_261(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_252(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = [@"/" stringByAppendingPathComponent:@"characteristics"];
  if (*(void *)(a1 + 32))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "characteristic", (void)v12);
          [v9 instanceID];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    id v10 = *(void **)(a1 + 32);
  }
  else
  {
    id v10 = 0;
  }
  if (*(double *)(a1 + 80) <= 0.0) {
    double v11 = 10.0;
  }
  else {
    double v11 = *(double *)(a1 + 80);
  }
  objc_msgSend(v10, "markWithReason:", @"Writing", (void)v12);
  [*(id *)(a1 + 48) sendPUTRequestToURL:v3 request:*(void *)(a1 + 56) serializationType:1 timeout:*(void *)(a1 + 64) completionHandler:v11];
  [WeakRetained finish];
}

void __76__HAPAccessoryServerIP__performWriteValues_timeout_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleWriteECONNResetError:v6 writeRequests:*(void *)(a1 + 32) responses:v7 timeout:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
}

- (void)_handleWriteECONNResetError:(id)a3 writeRequests:(id)a4 responses:(id)a5 timeout:(double)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = a7;
  id v18 = a8;
  id v19 = [v14 userInfo];
  uint64_t v20 = objc_msgSend(v19, "hmf_errorForKey:", *MEMORY[0x1E4F28A50]);

  id v21 = [v20 domain];
  if ([v21 isEqual:*MEMORY[0x1E4F28760]] && objc_msgSend(v20, "code") == 54)
  {
    BOOL v22 = [(HAPAccessoryServerIP *)self econnresetRetryInProgress];

    if (!v22)
    {
      double v23 = [(HAPAccessoryServer *)self clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E69F3C90;
      void block[4] = self;
      id v30 = v15;
      double v33 = a6;
      id v31 = v17;
      id v32 = v18;
      dispatch_async(v23, block);

      uint64_t v24 = v30;
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v18)
  {
    [(HAPAccessoryServerIP *)self _indicateSessionActivityWithReason:@"Write"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke_251;
    v25[3] = &unk_1E69F4070;
    id v28 = v18;
    id v26 = v16;
    id v27 = v14;
    dispatch_async(v17, v25);

    uint64_t v24 = v28;
    goto LABEL_8;
  }
LABEL_9:
}

void __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _insertWriteCharacteristicValues:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) withCompletionHandler:*(double *)(a1 + 64)];
  if ([*(id *)(a1 + 32) isEstablishingSecureConnection])
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v10 = 138543362;
      double v11 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Already establishing secure session - not attempting a re-establishment", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) setEconnresetRetryInProgress:1]);
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      double v11 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to re-establish secure session for write on ECONNRESET", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) count];
    [*(id *)(a1 + 32) _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.write.retry"];
  }
}

uint64_t __108__HAPAccessoryServerIP__handleWriteECONNResetError_writeRequests_responses_timeout_queue_completionHandler___block_invoke_251(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_writeCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = a5;
  id v12 = a6;
  if (v10)
  {
    if ([v10 count])
    {
      if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
      {
        BOOL v13 = [(HAPAccessoryServer *)self requiresTimedWrite:v10];
        id v14 = (void *)MEMORY[0x1D944E080]();
        id v15 = self;
        id v16 = HMFGetOSLogHandle();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v13)
        {
          if (v17)
          {
            id v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v40 = v18;
            __int16 v41 = 2114;
            id v42 = v10;
            _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Performing timed write for characteristicWriteRequestTuples %{public}@", buf, 0x16u);
          }
          [(HAPAccessoryServerIP *)v15 _performTimedWriteValues:v10 timeout:v11 queue:v12 completionHandler:a4];
        }
        else
        {
          if (v17)
          {
            double v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v40 = v33;
            __int16 v41 = 2114;
            id v42 = v10;
            _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_INFO, "%{public}@Performing write for characteristicWriteRequestTuples %{public}@", buf, 0x16u);
          }
          [(HAPAccessoryServerIP *)v15 _performWriteValues:v10 timeout:v11 queue:v12 completionHandler:a4];
        }
      }
      else
      {
        id v29 = (void *)MEMORY[0x1D944E080]();
        id v30 = self;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v40 = v32;
          _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing write", buf, 0xCu);
        }
        [(HAPAccessoryServerIP *)v30 _queueWriteCharacteristicValues:v10 timeout:v11 queue:v12 withCompletionHandler:a4];
        [(HAPAccessoryServerIP *)v30 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.write"];
      }
    }
    else
    {
      id v25 = (void *)MEMORY[0x1D944E080]();
      id v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v40 = v28;
        _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Writing 0 characteristics, bailing", buf, 0xCu);
      }
      if (v12)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke_240;
        v34[3] = &unk_1E69F3B20;
        id v35 = v12;
        dispatch_async(v11, v34);
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D944E080]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = HMFGetLogIdentifier();
      double v23 = (void *)MEMORY[0x1D944E2D0](v12);
      *(_DWORD *)buf = 138543874;
      id v40 = v22;
      __int16 v41 = 2114;
      id v42 = 0;
      __int16 v43 = 2114;
      uint64_t v44 = v23;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to write values because the characteristicWriteRequestTuples was %{public}@ and the completion handler was %{public}@", buf, 0x20u);
    }
    uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    if (v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E69F3C68;
      id v38 = v12;
      id v37 = v24;
      dispatch_async(v11, block);
    }
  }
}

uint64_t __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __83__HAPAccessoryServerIP__writeCharacteristicValues_timeout_queue_completionHandler___block_invoke_240(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v15 = NSString;
  id v16 = MEMORY[0x1D944D460](self, a2);
  BOOL v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/HAPAccessoryServerIP.m", 3144];
  id v29 = (id)[v14 initWithName:v17];

  id v18 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E69F17B0;
  id v23 = v11;
  uint64_t v24 = self;
  double v28 = a4;
  id v25 = v12;
  id v26 = v29;
  id v27 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(v18, block);

  __HMFActivityScopeLeave();
}

void __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x1D944E080]();
        id v8 = *(id *)(v1 + 40);
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = HMFGetLogIdentifier();
          [v6 value];
          id v11 = v21 = v7;
          [v6 characteristic];
          uint64_t v12 = v4;
          v14 = uint64_t v13 = v1;
          id v15 = [v6 contextData];
          *(_DWORD *)buf = 138544130;
          id v30 = v10;
          __int16 v31 = 2112;
          id v32 = v11;
          __int16 v33 = 2114;
          id v34 = v14;
          __int16 v35 = 2112;
          id v36 = v15;
          _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Writing value '%@' to characteristic '%{public}@' with contextData '%@'", buf, 0x2Au);

          uint64_t v1 = v13;
          uint64_t v4 = v12;

          id v7 = v21;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v3);
  }

  uint64_t v17 = *(void *)(v1 + 32);
  id v16 = *(void **)(v1 + 40);
  double v18 = *(double *)(v1 + 72);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  id v22[2] = __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_239;
  v22[3] = &unk_1E69F36F0;
  uint64_t v19 = *(void *)(v1 + 48);
  id v23 = *(id *)(v1 + 56);
  id v24 = *(id *)(v1 + 64);
  [v16 _writeCharacteristicValues:v17 timeout:v19 queue:v22 completionHandler:v18];
}

void __92__HAPAccessoryServerIP_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_239(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) markWithReason:@"Calling completion handler"];
  [*(id *)(a1 + 32) begin];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
  [*(id *)(a1 + 32) end];
  [*(id *)(a1 + 32) invalidate];
}

- (void)_handleReadResponseObject:(id)a3 type:(unint64_t)a4 httpStatus:(int)a5 error:(id)a6 characteristics:(id)a7 completion:(id)a8
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v176 = a7;
  id v16 = (void (**)(id, id, void *))a8;
  uint64_t v17 = (void *)MEMORY[0x1D944E080]();
  double v18 = self;
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v205 = v20;
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@Received response to a read characteristics request", buf, 0xCu);
  }
  uint64_t v21 = [MEMORY[0x1E4F653F0] currentActivity];
  if (v15)
  {
    BOOL v22 = (void *)v21;
    id v23 = (void *)MEMORY[0x1D944E080](v21);
    id v24 = v18;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = v15;
      id v27 = v14;
      long long v28 = HMFGetLogIdentifier();
      if (a4 - 1 > 3) {
        id v29 = @"Invalid";
      }
      else {
        id v29 = off_1E69F2448[a4 - 1];
      }
      uint64_t v115 = v29;
      *(_DWORD *)buf = 138544386;
      v205 = v28;
      __int16 v206 = 2114;
      *(void *)v207 = v176;
      *(_WORD *)&v207[8] = 2114;
      *(void *)&v207[10] = v27;
      *(_WORD *)&v207[18] = 2114;
      *(void *)&v207[20] = v115;
      *(_WORD *)&v207[28] = 2114;
      *(void *)&v207[30] = v26;
      _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to read characteristics %{public}@, received response object: %{public}@, MIME type: %{public}@, error: %{public}@", buf, 0x34u);

      id v14 = v27;
      id v15 = v26;
    }

    v116 = v176;
    [v176 count];
    [v15 domain];

    [v15 code];
    id v117 = v15;
    if ([v117 code] == -6723 || (v118 = v117, objc_msgSend(v117, "code") == -6753))
    {
      long long v119 = (void *)MEMORY[0x1D944E080]();
      BOOL v120 = v24;
      v121 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v122 = v15;
        v124 = id v123 = v14;
        *(_DWORD *)buf = 138543362;
        v205 = v124;
        _os_log_impl(&dword_1D4758000, v121, OS_LOG_TYPE_DEFAULT, "%{public}@interpreting error as unreachable", buf, 0xCu);

        id v14 = v123;
        id v15 = v122;
        v116 = v176;
      }

      v118 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:4 reason:0 underlyingError:v117];
    }
    uint64_t v125 = [(HAPAccessoryServerIP *)v24 ipConnectionStatistics];
    [v125 accessoryServerIPEvent:4];

    [(HAPAccessoryServerIP *)v24 _tearDownSessionAndStartReachabilityWithError:v117];
    id v138 = 0;
    goto LABEL_100;
  }
  BOOL v30 = a5 == 200 || a5 == 207;
  int v31 = v30;
  v174 = (void *)v21;
  if (!v14 || !v31 || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), a4 != 1) || (isKindOfClass & 1) == 0)
  {
    __int16 v108 = (void *)MEMORY[0x1D944E080]();
    uint64_t v109 = v18;
    __int16 v110 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      id v111 = v14;
      __int16 v112 = HMFGetLogIdentifier();
      uint64_t v113 = HTTPGetReasonPhrase();
      if (a4 - 1 > 3) {
        uint64_t v114 = @"Invalid";
      }
      else {
        uint64_t v114 = off_1E69F2448[a4 - 1];
      }
      uint64_t v126 = v114;
      *(_DWORD *)buf = 138544386;
      v205 = v112;
      __int16 v206 = 1026;
      *(_DWORD *)v207 = a5;
      *(_WORD *)&v207[4] = 2082;
      *(void *)&v207[6] = v113;
      *(_WORD *)&v207[14] = 2114;
      *(void *)&v207[16] = v126;
      *(_WORD *)&v207[24] = 2114;
      *(void *)&v207[26] = v111;
      _os_log_impl(&dword_1D4758000, v110, OS_LOG_TYPE_ERROR, "%{public}@Failed to read characteristics because the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      id v14 = v111;
      id v15 = 0;
    }

    v118 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    uint64_t v127 = [(HAPAccessoryServerIP *)v109 ipConnectionStatistics];
    [v127 accessoryServerIPEvent:6];

    id v138 = 0;
    v116 = v176;
    id v37 = v174;
    if (!v16) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
  id v166 = v18;
  int v171 = a5;
  id v33 = v14;
  id v34 = v176;
  int v167 = [MEMORY[0x1E4F1CA48] array];
  __int16 v35 = [v33 objectForKeyedSubscript:@"characteristics"];
  objc_opt_class();
  id v164 = v14;
  v165 = v35;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v104 = v34;
    v128 = (void *)MEMORY[0x1D944E080]();
    v129 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      uint64_t v131 = v130 = v33;
      *(_DWORD *)buf = 138543618;
      v205 = v131;
      __int16 v206 = 2112;
      *(void *)v207 = @"characteristics";
      _os_log_impl(&dword_1D4758000, v129, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid read response, %@ key doesn't contain an NSArray", buf, 0x16u);

      id v33 = v130;
    }

    id v138 = 0;
    id v15 = 0;
    id v37 = v174;
    goto LABEL_117;
  }
  uint64_t v36 = [v35 count];
  __int16 v160 = v34;
  if (v36 != [v34 count])
  {
    v132 = (void *)MEMORY[0x1D944E080]();
    uint64_t v133 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
    {
      uint64_t v134 = HMFGetLogIdentifier();
      id v135 = v33;
      uint64_t v136 = [v35 count];
      uint64_t v137 = [v160 count];
      *(_DWORD *)buf = 138543874;
      v205 = v134;
      __int16 v206 = 2050;
      *(void *)v207 = v136;
      id v33 = v135;
      *(_WORD *)&v207[8] = 2050;
      *(void *)&v207[10] = v137;
      _os_log_impl(&dword_1D4758000, v133, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid read response, '%{public}lu' response objects for '%{public}lu' requested characteristics", buf, 0x20u);
    }
    id v138 = 0;
    id v15 = 0;
    id v37 = v174;
    long long v104 = v160;
    goto LABEL_117;
  }
  id v158 = v33;
  v163 = [MEMORY[0x1E4F1CA48] arrayWithArray:v34];
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  obuint64_t j = v35;
  id v37 = v174;
  uint64_t v175 = [obj countByEnumeratingWithState:&v188 objects:buf count:16];
  if (!v175) {
    goto LABEL_85;
  }
  uint64_t v173 = *(void *)v189;
  *(void *)&long long v38 = 138543362;
  long long v155 = v38;
  id v172 = v16;
  do
  {
    uint64_t v39 = 0;
    do
    {
      if (*(void *)v189 != v173) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(void **)(*((void *)&v188 + 1) + 8 * v39);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v53 = (void *)MEMORY[0x1D944E080]();
        id v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          uint64_t v55 = HMFGetLogIdentifier();
          BOOL v56 = objc_opt_class();
          *(_DWORD *)long long v194 = 138543618;
          v195 = v55;
          __int16 v196 = 2112;
          uint64_t v197 = (uint64_t)v56;
          id v57 = v56;
          _os_log_impl(&dword_1D4758000, v54, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid response object - ignoring response object %@", v194, 0x16u);
        }
        goto LABEL_40;
      }
      uint64_t v41 = objc_msgSend(v40, "hmf_numberForKey:", @"aid");
      uint64_t v42 = objc_msgSend(v40, "hmf_numberForKey:", @"iid");
      uint64_t v43 = [v40 objectForKeyedSubscript:@"value"];
      uint64_t v44 = objc_msgSend(v40, "hmf_numberForKey:", @"status");
      v177 = (void *)v42;
      long long v178 = (void *)v41;
      BOOL v30 = v41 == 0;
      uint64_t v45 = v44;
      BOOL v46 = v30 || v42 == 0;
      id v47 = (void *)v43;
      if (v46 || (v171 == 207) != (v44 != 0))
      {
LABEL_32:
        id v49 = (void *)MEMORY[0x1D944E080]();
        uint64_t v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          id v51 = HMFGetLogIdentifier();
          *(_DWORD *)long long v194 = 138544386;
          v195 = v51;
          __int16 v196 = 2114;
          uint64_t v197 = (uint64_t)v177;
          __int16 v198 = 2114;
          v199 = v178;
          __int16 v200 = 2112;
          uint64_t v201 = v43;
          __int16 v202 = 2114;
          v203 = v45;
          _os_log_impl(&dword_1D4758000, v50, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid response for characteristic ID '%{public}@' against accessory '%{public}@' with value '%@' and HAP status code '%{public}@'", v194, 0x34u);
        }
        int v52 = 1;
        goto LABEL_35;
      }
      int v48 = [v44 intValue];
      if (v43)
      {
        if (v48) {
          goto LABEL_32;
        }
      }
      else if (!v48)
      {
        goto LABEL_32;
      }
      uint64_t v168 = (void *)v43;
      __int16 v169 = v45;
      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      id v58 = v163;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v184 objects:v193 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v185;
LABEL_45:
        uint64_t v62 = 0;
        while (1)
        {
          if (*(void *)v185 != v61) {
            objc_enumerationMutation(v58);
          }
          uint64_t v63 = *(void **)(*((void *)&v184 + 1) + 8 * v62);
          uint64_t v64 = objc_msgSend(v63, "service", v155);
          uint64_t v65 = [v64 accessory];
          uint64_t v66 = [v65 instanceID];

          if (v66)
          {
            if ([v178 isEqualToNumber:v66])
            {
              id v67 = [v63 instanceID];
              char v68 = [v177 isEqualToNumber:v67];

              if (v68) {
                break;
              }
            }
          }

          if (v60 == ++v62)
          {
            uint64_t v60 = [v58 countByEnumeratingWithState:&v184 objects:v193 count:16];
            if (v60) {
              goto LABEL_45;
            }
            goto LABEL_53;
          }
        }
        id v69 = v63;

        if (!v69) {
          goto LABEL_60;
        }
        [v58 removeObject:v69];
        id v16 = v172;
        id v37 = v174;
        id v47 = v168;
        __int16 v162 = v69;
        if ([v69 shouldValidateValueAfterReading])
        {
          id v70 = [v69 metadata];
          id v71 = [v70 format];
          uint64_t v72 = HAPCharacteristicFormatFromString(v71);

          if (!v72)
          {
            char v73 = (void *)MEMORY[0x1D944E080]();
            id v74 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              id v75 = HMFGetLogIdentifier();
              *(_DWORD *)long long v194 = v155;
              v195 = v75;
              _os_log_impl(&dword_1D4758000, v74, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] The characteristic has not specified a characteristic format type. This may cause the characteristic value to contain an object of an unexpected type. For now, the value will be passed through without transformation into an appropriate type. At some point in the future, support for this accessory may be dropped.", v194, 0xCu);
            }
            id v76 = v168;
LABEL_68:
            id v15 = 0;
            uint64_t v45 = v169;
            uint64_t v159 = v76;
            if ([v169 intValue])
            {
              v161 = HMErrorFromHAPIPStatusErrorCode((void *)[v169 integerValue]);
              id v85 = v162;
            }
            else
            {
              id v85 = v162;
              if (![v162 shouldValidateValueAfterReading]
                || ([v162 validateValue:v76 outValue:0],
                    (v161 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                [v162 setValue:v76];
                v161 = 0;
              }
            }
            if (([v85 properties] & 0x100) != 0)
            {
              id v86 = _parseNotificationContextFromCharacteristicResponse(v40);
              [v85 setNotificationContext:v86];

              uint64_t v87 = (void *)MEMORY[0x1D944E080]();
              long long v88 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
              {
                int v89 = HMFGetLogIdentifier();
                uint64_t v90 = [v162 notificationContext];
                *(_DWORD *)long long v194 = 138543874;
                v195 = v89;
                __int16 v196 = 2114;
                uint64_t v197 = (uint64_t)v90;
                __int16 v198 = 2114;
                v199 = v177;
                _os_log_impl(&dword_1D4758000, v88, OS_LOG_TYPE_INFO, "%{public}@[HAPAccessoryServerIP] Received notification context:%{public}@ in read response for characteristic instanceId: %{public}@", v194, 0x20u);

                id v15 = 0;
                uint64_t v45 = v169;
              }

              id v85 = v162;
            }
            else
            {
              [v85 setNotificationContext:0];
            }
            uint64_t v91 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v85 error:v161];
            if (v161)
            {
              uint64_t v92 = [v162 service];
              v93 = [v92 accessory];

              v157 = v93;
              v94 = [v93 server];
              context = (void *)MEMORY[0x1D944E080]();
              id v95 = v94;
              uint64_t v96 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                v97 = HMFGetLogIdentifier();
                v98 = [v157 instanceID];
                v99 = [v162 instanceID];
                id v100 = [v162 type];
                *(_DWORD *)long long v194 = 138544386;
                v195 = v97;
                __int16 v196 = 2114;
                uint64_t v197 = (uint64_t)v98;
                __int16 v198 = 2114;
                v199 = v99;
                __int16 v200 = 2114;
                uint64_t v201 = (uint64_t)v100;
                __int16 v202 = 2114;
                v203 = v161;
                _os_log_impl(&dword_1D4758000, v96, OS_LOG_TYPE_DEFAULT, "%{public}@Read response for characteristic %{public}@/%{public}@/%{public}@ with error: %{public}@", v194, 0x34u);

                id v47 = v168;
                uint64_t v45 = v169;
              }

              id v15 = 0;
              id v37 = v174;
            }
            [v167 addObject:v91];

            int v52 = 0;
            goto LABEL_83;
          }
        }
        else
        {
          uint64_t v72 = 12;
        }
        long long v80 = +[HAPJSONValueTransformer defaultJSONValueTransformer];
        id v183 = 0;
        id v76 = [v80 reverseTransformedValue:v168 format:v72 error:&v183];
        id v81 = v183;

        v161 = v81;
        if (!v81) {
          goto LABEL_68;
        }
        uint64_t v159 = v76;
        uint64_t v82 = (void *)MEMORY[0x1D944E080]();
        long long v83 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          uint64_t v84 = HMFGetLogIdentifier();
          *(_DWORD *)long long v194 = 138543874;
          v195 = v84;
          __int16 v196 = 2114;
          uint64_t v197 = (uint64_t)v168;
          __int16 v198 = 2112;
          v199 = v161;
          _os_log_impl(&dword_1D4758000, v83, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Failed to transform value '%{public}@' with error: %@", v194, 0x20u);
        }
        int v52 = 1;
        id v15 = 0;
        uint64_t v45 = v169;
LABEL_83:

        goto LABEL_35;
      }
LABEL_53:

LABEL_60:
      id v77 = (void *)MEMORY[0x1D944E080]();
      uint64_t v78 = HMFGetOSLogHandle();
      id v15 = 0;
      id v16 = v172;
      id v37 = v174;
      id v47 = v168;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        id v79 = HMFGetLogIdentifier();
        *(_DWORD *)long long v194 = 138544130;
        v195 = v79;
        __int16 v196 = 2114;
        uint64_t v197 = (uint64_t)v177;
        __int16 v198 = 2114;
        v199 = v178;
        __int16 v200 = 2112;
        uint64_t v201 = (uint64_t)v168;
        _os_log_impl(&dword_1D4758000, v78, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid response for characteristic ID '%{public}@' against accessory '%{public}@' with value '%@': characteristic was not requested to be read", v194, 0x2Au);

        id v15 = 0;
      }

      int v52 = 1;
      uint64_t v45 = v169;
LABEL_35:

      if (v52)
      {

        id v138 = 0;
        goto LABEL_115;
      }
LABEL_40:
      ++v39;
    }
    while (v39 != v175);
    uint64_t v101 = [obj countByEnumeratingWithState:&v188 objects:buf count:16];
    uint64_t v175 = v101;
  }
  while (v101);
LABEL_85:

  if ([v163 count])
  {
    long long v102 = (void *)MEMORY[0x1D944E080]();
    long long v103 = HMFGetOSLogHandle();
    id v33 = v158;
    long long v104 = v160;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v106 = id v105 = v15;
      uint64_t v107 = [v163 count];
      *(_DWORD *)long long v194 = 138543618;
      v195 = v106;
      __int16 v196 = 2050;
      uint64_t v197 = v107;
      _os_log_impl(&dword_1D4758000, v103, OS_LOG_TYPE_ERROR, "%{public}@[HAPAccessoryServerIP] Invalid read response, '%{public}lu' request tuples remain unmatched with a response object", v194, 0x16u);

      id v15 = v105;
    }

    id v138 = 0;
  }
  else
  {
    id v138 = v167;
LABEL_115:
    id v33 = v158;
    long long v104 = v160;
  }

LABEL_117:
  v139 = [(HAPAccessoryServerIP *)v166 ipConnectionStatistics];
  [v139 accessoryServerIPEvent:6];

  if ([v138 count])
  {
    v118 = 0;
  }
  else
  {
    id v140 = v33;
    uint64_t v141 = (void *)MEMORY[0x1D944E080]();
    id v142 = v166;
    long long v143 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
    {
      long long v144 = HMFGetLogIdentifier();
      uint64_t v145 = HTTPGetReasonPhrase();
      long long v146 = @"HAP JSON";
      *(_DWORD *)buf = 138544386;
      v205 = v144;
      __int16 v206 = 1026;
      *(_DWORD *)v207 = v171;
      *(_WORD *)&v207[4] = 2082;
      *(void *)&v207[6] = v145;
      *(_WORD *)&v207[14] = 2114;
      *(void *)&v207[16] = @"HAP JSON";
      *(_WORD *)&v207[24] = 2114;
      *(void *)&v207[26] = v140;
      _os_log_impl(&dword_1D4758000, v143, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse response objects for a read request, the accessory sent an invalid response with HTTP Status Code '%{public}d %{public}s' and a %{public}@ body: %{public}@", buf, 0x30u);

      id v15 = 0;
    }

    v118 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];

    id v138 = 0;
    id v37 = v174;
  }
  v116 = v176;
  if (!v37)
  {
    id v14 = v164;
    if (!v16) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
  BOOL v22 = v37;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id v138 = v138;
  uint64_t v147 = [v138 countByEnumeratingWithState:&v179 objects:v192 count:16];
  if (v147)
  {
    uint64_t v148 = v147;
    uint64_t v149 = *(void *)v180;
    do
    {
      for (uint64_t i = 0; i != v148; ++i)
      {
        if (*(void *)v180 != v149) {
          objc_enumerationMutation(v138);
        }
        long long v151 = *(void **)(*((void *)&v179 + 1) + 8 * i);
        long long v152 = objc_msgSend(v151, "characteristic", v155);
        [v152 instanceID];

        long long v153 = [v151 error];
        [v153 domain];

        long long v154 = [v151 error];
        [v154 code];
      }
      uint64_t v148 = [v138 countByEnumeratingWithState:&v179 objects:v192 count:16];
    }
    while (v148);
  }

  id v14 = v164;
  id v15 = 0;
LABEL_100:
  id v37 = v22;
  if (v16) {
LABEL_106:
  }
    v16[2](v16, v138, v118);
LABEL_107:
}

- (void)_readCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  dispatch_queue_t queue = a5;
  id v11 = a6;
  if (v10)
  {
    if ([v10 count])
    {
      if ([(HAPAccessoryServerIP *)self _isSessionEstablished])
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v68 count:16];
        id v14 = v12;
        if (v13)
        {
          uint64_t v15 = *(void *)v60;
LABEL_6:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v60 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (v13 == ++v16)
            {
              uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v68 count:16];
              if (v13) {
                goto LABEL_6;
              }
              id v14 = v12;
              goto LABEL_27;
            }
          }

          if (!v11) {
            goto LABEL_28;
          }
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_204;
          v57[3] = &unk_1E69F3B20;
          id v58 = v11;
          dispatch_async(queue, v57);
          id v14 = v58;
        }
LABEL_27:

LABEL_28:
        objc_initWeak((id *)buf, self);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2;
        v52[3] = &unk_1E69EFED0;
        objc_copyWeak(v56, (id *)buf);
        id v31 = v12;
        id v53 = v31;
        v56[1] = *(id *)&a4;
        id v32 = queue;
        id v54 = v32;
        id v33 = v11;
        id v55 = v33;
        id v34 = (void *)MEMORY[0x1D944E2D0](v52);
        __int16 v35 = [MEMORY[0x1E4F653F0] currentActivity];
        id v36 = objc_alloc_init(MEMORY[0x1E4F65400]);
        objc_initWeak(&location, v36);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        void v45[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_4;
        v45[3] = &unk_1E69EFEF8;
        objc_copyWeak(&v49, &location);
        objc_copyWeak(v50, (id *)buf);
        id v46 = v31;
        id v37 = v35;
        id v47 = v37;
        v50[1] = *(id *)&a4;
        id v38 = v34;
        id v48 = v38;
        [v36 addExecutionBlock:v45];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2_220;
        v41[3] = &unk_1E69F4270;
        objc_copyWeak(&v44, &location);
        id v43 = v33;
        uint64_t v42 = v32;
        [v36 setCompletionBlock:v41];
        uint64_t v39 = [(HAPAccessoryServerIP *)self clientOperationQueue];
        [v39 addOperation:v36];

        objc_destroyWeak(&v44);
        objc_destroyWeak(v50);
        objc_destroyWeak(&v49);
        objc_destroyWeak(&location);

        objc_destroyWeak(v56);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v27 = (void *)MEMORY[0x1D944E080]();
        long long v28 = self;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v70 = v30;
          _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing read", buf, 0xCu);
        }
        [(HAPAccessoryServerIP *)v28 _queueReadCharacteristicValues:v10 timeout:queue queue:v11 completionHandler:a4];
        [(HAPAccessoryServerIP *)v28 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.read"];
      }
    }
    else
    {
      id v23 = (void *)MEMORY[0x1D944E080]();
      id v24 = self;
      long long v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v70 = v26;
        _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Reading 0 characteristics, bailing", buf, 0xCu);
      }
      if (v11)
      {
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_199;
        v63[3] = &unk_1E69F3B20;
        id v64 = v11;
        dispatch_async(queue, v63);
      }
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D944E080]();
    double v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = (void *)MEMORY[0x1D944E2D0](v11);
      *(_DWORD *)buf = 138543874;
      id v70 = v20;
      __int16 v71 = 2112;
      uint64_t v72 = 0;
      __int16 v73 = 2112;
      id v74 = v21;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to read values because the characteristics were %@ and the completion handler was %@", buf, 0x20u);
    }
    BOOL v22 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
    if (v11)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E69F3C68;
      id v67 = v11;
      id v66 = v22;
      dispatch_async(queue, block);
    }
  }
}

uint64_t __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_204(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v12 = a1[4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3;
  v13[3] = &unk_1E69EFEA8;
  objc_copyWeak(v17, a1 + 7);
  id v14 = a1[4];
  v17[1] = a1[8];
  id v15 = a1[5];
  id v16 = a1[6];
  [WeakRetained _handleReadResponseObject:v9 type:a3 httpStatus:a4 error:v10 characteristics:v12 completion:v13];

  objc_destroyWeak(v17);
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_4(id *a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    if (v4)
    {
      id from = v2;
      [@"/" stringByAppendingPathComponent:@"characteristics"];
      uint64_t v49 = v48 = a1;
      id v5 = a1[4];
      uint64_t v50 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:buf count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v62;
        id v45 = WeakRetained;
        id v46 = v4;
LABEL_6:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v62 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v61 + 1) + 8 * v11);
          uint64_t v13 = [v12 service];
          id v14 = [v13 accessory];
          id v15 = [v14 instanceID];

          if (!v15) {
            break;
          }
          if ([v50 containsObject:v12])
          {
            context = (void *)MEMORY[0x1D944E080]();
            id v4 = v46;
            id v34 = v46;
            id v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              __int16 v35 = HMFGetLogIdentifier();
              *(_DWORD *)id v66 = 138543618;
              id v67 = v35;
              __int16 v68 = 2112;
              id v69 = v12;
              _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@Refusing to create a query string because the same characteristic has been requested twice: %@", v66, 0x16u);
            }
            uint64_t v33 = 58;
LABEL_23:
            id WeakRetained = v45;
            id v26 = v48;
            long long v25 = (void *)v49;

            id v24 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:v33];

            id v23 = 0;
            BOOL v22 = v7;
            goto LABEL_24;
          }
          [v50 addObject:v12];
          id v16 = NSString;
          uint64_t v17 = [v15 stringValue];
          double v18 = [v12 instanceID];
          [v18 stringValue];
          v20 = uint64_t v19 = v6;
          uint64_t v21 = [v16 stringWithFormat:@"%@%@%@", v17, @".", v20];

          uint64_t v6 = v19;
          [v19 addObject:v21];

          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v61 objects:buf count:16];
            id WeakRetained = v45;
            id v4 = v46;
            if (v9) {
              goto LABEL_6;
            }
            goto LABEL_13;
          }
        }
        context = (void *)MEMORY[0x1D944E080]();
        id v4 = v46;
        id v30 = v46;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          *(_DWORD *)id v66 = 138543618;
          id v67 = v32;
          __int16 v68 = 2112;
          id v69 = v12;
          _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to create a query string for characteristic %@ because the accessory instance ID was nil.", v66, 0x16u);
        }
        id v15 = 0;
        uint64_t v33 = 20;
        goto LABEL_23;
      }
LABEL_13:

      BOOL v22 = [v6 componentsJoinedByString:@","];
      id v23 = [NSString stringWithFormat:@"%@%@", @"id=", v22];
      id v24 = 0;
      id v26 = v48;
      long long v25 = (void *)v49;
LABEL_24:

      id v36 = v24;
      if (v23)
      {
        if (v26[5])
        {
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v37 = v26[4];
          uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v58 != v40) {
                  objc_enumerationMutation(v37);
                }
                [*(id *)(*((void *)&v57 + 1) + 8 * i) instanceID];
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v65 count:16];
            }
            while (v39);
          }
        }
        uint64_t v42 = [v4 clientQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_213;
        block[3] = &unk_1E69F1E88;
        objc_copyWeak(v56, from);
        id v52 = v25;
        id v43 = v23;
        v56[1] = v26[9];
        id v53 = v43;
        id v54 = v4;
        id v55 = v26[6];
        dispatch_async(v42, block);

        objc_destroyWeak(v56);
      }
      else
      {
        [WeakRetained cancelWithError:v36];
      }
    }
    else
    {
      id v27 = (void *)MEMORY[0x1D944E080]();
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v71 = v29;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to read values because IP Accessory Server has been deallocated", buf, 0xCu);
      }
      long long v25 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:20];
      [WeakRetained cancelWithError:v25];
    }
  }
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_2_220(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained error];
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);

    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3_221;
      v6[3] = &unk_1E69F3C68;
      id v5 = *(NSObject **)(a1 + 32);
      id v8 = *(id *)(a1 + 40);
      id v7 = WeakRetained;
      dispatch_async(v5, v6);
    }
  }
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3_221(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_213(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v2 = [NSString stringWithFormat:@"%@?%@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  if (*(double *)(a1 + 72) <= 0.0) {
    double v3 = 10.0;
  }
  else {
    double v3 = *(double *)(a1 + 72);
  }
  uint64_t v4 = [MEMORY[0x1E4F653F0] currentActivity];
  [v4 markWithReason:@"Reading"];

  [*(id *)(a1 + 48) sendGETRequestToURL:v2 timeout:*(void *)(a1 + 56) completionHandler:v3];
  [WeakRetained finish];
}

void __82__HAPAccessoryServerIP__readCharacteristicValues_timeout_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleReadECONNRESETError:v6 readCharacteristics:*(void *)(a1 + 32) responses:v7 timeout:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
}

- (void)_handleReadECONNRESETError:(id)a3 readCharacteristics:(id)a4 responses:(id)a5 timeout:(double)a6 queue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = a7;
  id v18 = a8;
  uint64_t v19 = [v14 userInfo];
  id v20 = objc_msgSend(v19, "hmf_errorForKey:", *MEMORY[0x1E4F28A50]);

  uint64_t v21 = [v20 domain];
  if ([v21 isEqual:*MEMORY[0x1E4F28760]] && objc_msgSend(v20, "code") == 54)
  {
    BOOL v22 = [(HAPAccessoryServerIP *)self econnresetRetryInProgress];

    if (!v22)
    {
      id v23 = [(HAPAccessoryServer *)self clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke;
      block[3] = &unk_1E69F3C90;
      void block[4] = self;
      id v30 = v15;
      double v33 = a6;
      id v31 = v17;
      id v32 = v18;
      dispatch_async(v23, block);

      id v24 = v30;
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v18)
  {
    [(HAPAccessoryServerIP *)self _indicateSessionActivityWithReason:@"Read"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke_198;
    v25[3] = &unk_1E69F4070;
    id v28 = v18;
    id v26 = v16;
    id v27 = v14;
    dispatch_async(v17, v25);

    id v24 = v28;
    goto LABEL_8;
  }
LABEL_9:
}

void __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _insertReadCharacteristicValues:*(void *)(a1 + 40) timeout:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) completionHandler:*(double *)(a1 + 64)];
  if ([*(id *)(a1 + 32) isEstablishingSecureConnection])
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Already establishing secure session - not attempting a re-establishment", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) setEconnresetRetryInProgress:1]);
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to re-establish secure session for read on ECONNRESET", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 40) count];
    [*(id *)(a1 + 32) _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.read.retry"];
  }
}

uint64_t __113__HAPAccessoryServerIP__handleReadECONNRESETError_readCharacteristics_responses_timeout_queue_completionHandler___block_invoke_198(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v15 = NSString;
  id v16 = MEMORY[0x1D944D460](self, a2);
  uint64_t v17 = [v15 stringWithFormat:@"%@, %s:%ld", v16, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/HAPAccessoryServerIP.m", 2612];
  id v28 = (id)[v14 initWithName:v17];

  id v18 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_1E69F17B0;
  void block[4] = self;
  id v23 = v11;
  double v27 = a4;
  id v24 = v12;
  id v25 = v28;
  id v26 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(v18, block);

  __HMFActivityScopeLeave();
}

void __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_1E69F1738;
  objc_copyWeak(&v9, &location);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 _readCharacteristicValues:v3 timeout:v5 queue:v6 completionHandler:v4];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = objc_msgSend(v5, "hmf_objectsPassingTest:", &__block_literal_global_183);
  if ([v8 count])
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Read Response: '%{public}@'", (uint8_t *)&v15, 0x16u);
    }
  }
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 32) markWithReason:@"Calling completion handler"];
  uint64_t v13 = MEMORY[0x1D944E2D0](*(void *)(a1 + 40));
  id v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }

  [*(id *)(a1 + 32) end];
  [*(id *)(a1 + 32) invalidate];
}

BOOL __91__HAPAccessoryServerIP_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_processQueuedOperationsWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServerIP *)self queuedOperations];
  id v6 = (void *)[v5 copy];

  [(HAPAccessoryServerIP *)self setEstablishingSecureConnection:0];
  if (v4) {
    [(HAPAccessoryServerIP *)self setSecuritySessionOpen:0];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        id v12 = [(HAPAccessoryServerIP *)self queuedOperations];
        uint64_t v13 = (void *)MEMORY[0x1D944E2D0](v11);
        [v12 removeObject:v13];

        id v14 = [(HAPAccessoryServer *)self clientQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__HAPAccessoryServerIP__processQueuedOperationsWithError___block_invoke;
        block[3] = &unk_1E69F4070;
        id v17 = v4;
        id v18 = self;
        uint64_t v19 = v11;
        dispatch_async(v14, block);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

uint64_t __58__HAPAccessoryServerIP__processQueuedOperationsWithError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = (void *)MEMORY[0x1D944E080]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = [*(id *)(a1 + 32) code];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 1026;
      int v14 = v8;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failing queued request with %{public}d", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Running queued request", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 40) _kickConnectionIdleTimer];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_queueEnableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
  id v29 = &unk_1E69EFE80;
  objc_copyWeak(&v33, &location);
  id v13 = v12;
  id v30 = v13;
  id v14 = v11;
  id v32 = v14;
  BOOL v34 = a3;
  id v15 = v10;
  id v31 = v15;
  id v16 = (void *)MEMORY[0x1D944E2D0](&v26);
  long long v20 = (void *)MEMORY[0x1D944E080](v16, v17, v18, v19);
  long long v21 = self;
  HMFGetOSLogHandle();
  long long v22 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    long long v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v37 = v23;
    _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing enableEvents until pair-verify completes", buf, 0xCu);
  }
  id v24 = [(HAPAccessoryServerIP *)v21 queuedOperations];
  uint64_t v25 = (void *)MEMORY[0x1D944E2D0](v16);
  [v24 addObject:v25];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (v3)
  {
    BOOL v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = v5;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error in establishing secure session, failing enableEvents block with %@", buf, 0x16u);
    }
    id v10 = *(NSObject **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_176;
    void v11[3] = &unk_1E69F3C68;
    id v13 = *(id *)(a1 + 48);
    id v12 = v3;
    dispatch_async(v10, v11);
  }
  else
  {
    [WeakRetained _enableEvents:*(unsigned __int8 *)(a1 + 64) forCharacteristics:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48) queue:*(void *)(a1 + 32)];
  }
}

uint64_t __90__HAPAccessoryServerIP__queueEnableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_176(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_queueListPairingWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke;
  long long v23 = &unk_1E69F1150;
  objc_copyWeak(&v26, &location);
  id v8 = v6;
  id v24 = v8;
  id v9 = v7;
  id v25 = v9;
  id v10 = (void *)MEMORY[0x1D944E2D0](&v20);
  id v14 = (void *)MEMORY[0x1D944E080](v10, v11, v12, v13);
  id v15 = self;
  HMFGetOSLogHandle();
  __int16 v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v29 = v17;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing list-pairing until pair-verify completes", buf, 0xCu);
  }
  uint64_t v18 = [(HAPAccessoryServerIP *)v15 queuedOperations];
  uint64_t v19 = (void *)MEMORY[0x1D944E2D0](v10);
  [v18 addObject:v19];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error in establishing secure session, failing add pairing block with %@", buf, 0x16u);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke_175;
    void v11[3] = &unk_1E69F3C68;
    id v10 = *(NSObject **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v12 = v3;
    dispatch_async(v10, v11);
  }
  else
  {
    [WeakRetained _listPairingsWithCompletionQueue:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
}

uint64_t __79__HAPAccessoryServerIP__queueListPairingWithCompletionQueue_completionHandler___block_invoke_175(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_queueAddPairingWithIdentifier:(id)a3 publicKey:(id)a4 admin:(BOOL)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke;
  v27[3] = &unk_1E69EFE58;
  objc_copyWeak(&v32, &location);
  id v16 = v14;
  id v28 = v16;
  id v17 = v15;
  id v31 = v17;
  id v18 = v12;
  id v29 = v18;
  id v19 = v13;
  id v30 = v19;
  BOOL v33 = a5;
  uint64_t v20 = (void *)MEMORY[0x1D944E2D0](v27);
  uint64_t v21 = (void *)MEMORY[0x1D944E080]();
  long long v22 = self;
  HMFGetOSLogHandle();
  long long v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v36 = v24;
    _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing add-pairing until pair-verify completes", buf, 0xCu);
  }
  id v25 = [(HAPAccessoryServerIP *)v22 queuedOperations];
  id v26 = (void *)MEMORY[0x1D944E2D0](v20);
  [v25 addObject:v26];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error in establishing secure session, failing add pairing block with %@", buf, 0x16u);
    }
    id v10 = *(NSObject **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_174;
    void v11[3] = &unk_1E69F3C68;
    id v13 = *(id *)(a1 + 56);
    id v12 = v3;
    dispatch_async(v10, v11);
  }
  else
  {
    [WeakRetained _startAddPairingWithIdentifier:*(void *)(a1 + 40) publicKey:*(void *)(a1 + 48) admin:*(unsigned __int8 *)(a1 + 72) queue:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __88__HAPAccessoryServerIP__queueAddPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_174(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_insertWriteCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F653F0] currentActivity];
  [v13 markWithReason:@"Queuing retry"];

  id v14 = [(HAPAccessoryServerIP *)self _queuedWriteOperationBlock:v10 timeout:v11 queue:v12 completionHandler:a4];
  id v15 = (void *)MEMORY[0x1D944E080]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v21 = 138543362;
    long long v22 = v18;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing multiple characteristic write at the start until pair-verify completes", (uint8_t *)&v21, 0xCu);
  }
  id v19 = [(HAPAccessoryServerIP *)v16 queuedOperations];
  uint64_t v20 = (void *)MEMORY[0x1D944E2D0](v14);
  [v19 insertObject:v20 atIndex:0];
}

- (void)_queueWriteCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F653F0] currentActivity];
  [v13 markWithReason:@"Queuing"];
  id v14 = [(HAPAccessoryServerIP *)self _queuedWriteOperationBlock:v10 timeout:v11 queue:v12 completionHandler:a4];
  id v15 = (void *)MEMORY[0x1D944E080]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v21 = 138543362;
    long long v22 = v18;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing multiple characteristic write until pair-verify completes", (uint8_t *)&v21, 0xCu);
  }
  [v10 count];
  id v19 = [(HAPAccessoryServerIP *)v16 queuedOperations];
  uint64_t v20 = (void *)MEMORY[0x1D944E2D0](v14);
  [v19 addObject:v20];
}

- (id)_queuedWriteOperationBlock:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  int v21 = __83__HAPAccessoryServerIP__queuedWriteOperationBlock_timeout_queue_completionHandler___block_invoke;
  long long v22 = &unk_1E69EFE30;
  objc_copyWeak(v26, &location);
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = v12;
  id v25 = v15;
  v26[1] = *(id *)&a4;
  __int16 v16 = (void *)MEMORY[0x1D944E2D0](&v19);
  id v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  return v17;
}

void __83__HAPAccessoryServerIP__queuedWriteOperationBlock_timeout_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v6) {
    [WeakRetained _error:v6 forWriteCharacteristicValues:v5 queue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else {
    [WeakRetained _writeCharacteristicValues:v5 timeout:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
  }
}

- (void)_insertReadCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F653F0] currentActivity];
  [v13 markWithReason:@"Queuing retry"];

  id v14 = [(HAPAccessoryServerIP *)self _queuedReadOperationBlock:v10 timeout:v11 queue:v12 completionHandler:a4];
  id v15 = (void *)MEMORY[0x1D944E080]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v21 = 138543362;
    long long v22 = v18;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing multiple read at the start until pair-verify completes", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v19 = [(HAPAccessoryServerIP *)v16 queuedOperations];
  uint64_t v20 = (void *)MEMORY[0x1D944E2D0](v14);
  [v19 insertObject:v20 atIndex:0];
}

- (void)_queueReadCharacteristicValues:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F653F0] currentActivity];
  [v13 markWithReason:@"Queuing"];
  id v14 = [(HAPAccessoryServerIP *)self _queuedReadOperationBlock:v10 timeout:v11 queue:v12 completionHandler:a4];
  id v15 = (void *)MEMORY[0x1D944E080]();
  __int16 v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v21 = 138543362;
    long long v22 = v18;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing multiple read until pair-verify completes", (uint8_t *)&v21, 0xCu);
  }
  [v10 count];
  uint64_t v19 = [(HAPAccessoryServerIP *)v16 queuedOperations];
  uint64_t v20 = (void *)MEMORY[0x1D944E2D0](v14);
  [v19 addObject:v20];
}

- (id)_queuedReadOperationBlock:(id)a3 timeout:(double)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  int v21 = __82__HAPAccessoryServerIP__queuedReadOperationBlock_timeout_queue_completionHandler___block_invoke;
  long long v22 = &unk_1E69EFE30;
  objc_copyWeak(v26, &location);
  id v13 = v10;
  id v23 = v13;
  id v14 = v11;
  id v24 = v14;
  id v15 = v12;
  id v25 = v15;
  v26[1] = *(id *)&a4;
  __int16 v16 = (void *)MEMORY[0x1D944E2D0](&v19);
  id v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  return v17;
}

void __82__HAPAccessoryServerIP__queuedReadOperationBlock_timeout_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v6) {
    [WeakRetained _error:v6 forReadCharacteristicValues:v5 queue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else {
    [WeakRetained _readCharacteristicValues:v5 timeout:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 64)];
  }
}

- (void)_error:(id)a3 forWriteCharacteristicValues:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v29 = a5;
  id v28 = a6;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v11;
  uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v35)
  {
    uint64_t v13 = *(void *)v42;
    id v31 = self;
    id v32 = v12;
    uint64_t v30 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (v10)
        {
          __int16 v16 = [*(id *)(*((void *)&v41 + 1) + 8 * i) characteristic];
          id v17 = [v16 service];
          uint64_t v18 = [v17 accessory];

          context = (void *)MEMORY[0x1D944E080]();
          uint64_t v19 = self;
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = HMFGetLogIdentifier();
            [v18 instanceID];
            v23 = id v22 = v10;
            id v24 = [v16 instanceID];
            [v16 type];
            id v25 = v34 = v18;
            *(_DWORD *)buf = 138544386;
            id v46 = v21;
            __int16 v47 = 2114;
            id v48 = v23;
            __int16 v49 = 2114;
            uint64_t v50 = v24;
            __int16 v51 = 2114;
            id v52 = v25;
            __int16 v53 = 2114;
            id v54 = v22;
            _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Write response for characteristic %{public}@/%{public}@/%{public}@ with error: %{public}@", buf, 0x34u);

            uint64_t v18 = v34;
            uint64_t v13 = v30;

            id v10 = v22;
            id v12 = v32;

            self = v31;
          }
        }
        id v26 = [v15 characteristic];
        uint64_t v27 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v26 error:v10];

        [v12 addObject:v27];
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v35);
  }

  if (v28)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__HAPAccessoryServerIP__error_forWriteCharacteristicValues_queue_completionHandler___block_invoke;
    block[3] = &unk_1E69F4070;
    id v40 = v28;
    id v38 = v12;
    id v39 = v10;
    dispatch_async(v29, block);
  }
}

uint64_t __84__HAPAccessoryServerIP__error_forWriteCharacteristicValues_queue_completionHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_error:(id)a3 forReadCharacteristicValues:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v29 = a5;
  id v28 = a6;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v11;
  uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v35)
  {
    uint64_t v13 = *(void *)v41;
    uint64_t v30 = *(void *)v41;
    id v31 = v12;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (v10)
        {
          __int16 v16 = [*(id *)(*((void *)&v40 + 1) + 8 * i) service];
          id v17 = [v16 accessory];

          uint64_t v18 = (void *)MEMORY[0x1D944E080]();
          uint64_t v19 = self;
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = HMFGetLogIdentifier();
            id v22 = [v17 instanceID];
            [v15 instanceID];
            BOOL v34 = v18;
            id v24 = v23 = v10;
            [v15 type];
            BOOL v33 = v17;
            v26 = id v25 = self;
            *(_DWORD *)buf = 138544386;
            id v45 = v21;
            __int16 v46 = 2114;
            __int16 v47 = v22;
            __int16 v48 = 2114;
            __int16 v49 = v24;
            __int16 v50 = 2114;
            __int16 v51 = v26;
            __int16 v52 = 2114;
            id v53 = v23;
            _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Read response failed for characteristic %{public}@/%{public}@/%{public}@: %{public}@", buf, 0x34u);

            self = v25;
            id v17 = v33;

            id v10 = v23;
            uint64_t v18 = v34;

            id v12 = v31;
            uint64_t v13 = v30;
          }
        }
        uint64_t v27 = +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:v15 error:v10];
        [v12 addObject:v27];
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v35);
  }

  if (v28)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__HAPAccessoryServerIP__error_forReadCharacteristicValues_queue_completionHandler___block_invoke;
    block[3] = &unk_1E69F4070;
    id v39 = v28;
    id v37 = v12;
    id v38 = v10;
    dispatch_async(v29, block);
  }
}

uint64_t __83__HAPAccessoryServerIP__error_forReadCharacteristicValues_queue_completionHandler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_continuePairingAfterMFiCertValidation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(HAPAccessoryServerIP *)self tearDownSessionOnAuthCompletion];
  if ([(HAPAccessoryServer *)self pairSetupType] == 6)
  {
    BOOL v3 = [(HAPAccessoryServerIP *)self isPreSoftAuthWacStarted];
    id v4 = (void *)MEMORY[0x1D944E080]();
    uint64_t v5 = self;
    id v6 = HMFGetOSLogHandle();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
      {
        id v8 = HMFGetLogIdentifier();
        *(_DWORD *)id v14 = 138543362;
        *(void *)&void v14[4] = v8;
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Transient Pair-Setup completed with Cert Auth - starting easyConfig", v14, 0xCu);
      }
      [(HAPAccessoryServerIP *)v5 pairSetupStartSoftAuthWAC];
    }
    else
    {
      if (v7)
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)id v14 = 138543362;
        *(void *)&void v14[4] = v9;
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Transient Pair-Setup completed with Cert Auth - starting regular", v14, 0xCu);
      }
      id v10 = [(HAPAccessoryServer *)v5 pairingActivity];
      [v10 begin];
      *(void *)id v14 = [(HAPAccessoryServer *)v5 pairingActivity];

      id v11 = [(HAPAccessoryServer *)v5 pairingRequest];
      id v12 = (void *)[v11 copy];

      [v12 setRequiresUserConsent:0];
      uint64_t v13 = [(HAPAccessoryServer *)v5 pairingRequest];
      [(HAPAccessoryServerIP *)v5 startPairingWithRequest:v13];

      __HMFActivityScopeLeave();
    }
  }
  else
  {
    [(HAPAccessoryServerIP *)self _notifyDelegatesPairingStopped:0];
  }
}

- (void)_handleMFiCertValidation
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned int v38 = 0;
  if ([(HAPAccessoryServer *)self pairSetupType] == 5
    || (pairingSession = [(HAPAccessoryServer *)self pairSetupType],
        pairingSession == (PairingSessionPrivate *)6))
  {
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      id v8 = (void *)PairingSessionCopyProperty();
      id v9 = (void *)MEMORY[0x1D944E080]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        long long v40 = v12;
        __int16 v41 = 1024;
        *(_DWORD *)long long v42 = v38;
        *(_WORD *)&v42[4] = 2112;
        *(void *)&v42[6] = v8;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Pair Setup completed with err: %d - MFi Cert %@", buf, 0x1Cu);
      }
      if (v8)
      {
        id v13 = v8;
        CFRelease(v13);
        if ([(HAPAccessoryServerIP *)v10 isPreSoftAuthWacStarted])
        {
          id inited = objc_initWeak(&location, v10);
          uint64_t v15 = (void *)MEMORY[0x1D944E080](inited);
          __int16 v16 = v10;
          HMFGetOSLogHandle();
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            long long v40 = v18;
            _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Restoring network to validate Cert", buf, 0xCu);
          }
          [(HAPAccessoryServerIP *)v16 _notifyDelegateOfPairingProgress:3];
          uint64_t v19 = [(HAPAccessoryServerIP *)v16 hapWACAccessoryClient];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke;
          v34[3] = &unk_1E69EFE08;
          objc_copyWeak(&v36, &location);
          id v35 = v13;
          id v20 = (id)[v19 restoreNetworkWithCompletion:v34];

          objc_destroyWeak(&v36);
          objc_destroyWeak(&location);
        }
        else if ([(HAPAccessoryServerIP *)v10 _delegateRespondsToSelector:sel_accessoryServer_validateCert_model_])
        {
          int v21 = [(HAPAccessoryServer *)v10 delegateQueue];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_3;
          v32[3] = &unk_1E69F46E0;
          void v32[4] = v10;
          id v33 = v13;
          dispatch_async(v21, v32);
        }
        else
        {
          [(HAPAccessoryServerIP *)v10 _tearDownSession];
          id v22 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:18];
          [(HAPAccessoryServerIP *)v10 _processQueuedOperationsWithError:v22];
          id v23 = HMErrorFromOSStatus(v38);
          [(HAPAccessoryServerIP *)v10 _notifyDelegatesPairingStopped:v23];
        }
      }
    }
  }
  id v24 = (void *)MEMORY[0x1D944E080](pairingSession, v3, v4, v5, v6);
  id v25 = self;
  id v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    uint64_t v28 = [(HAPAccessoryServer *)v25 pairSetupType];
    unint64_t v29 = [(HAPAccessoryServer *)v25 authMethod];
    if (v29 > 6) {
      uint64_t v30 = @"HAPAuthMethodUnknown";
    }
    else {
      uint64_t v30 = off_1E69EFD28[v29];
    }
    id v31 = v30;
    *(_DWORD *)buf = 138543874;
    long long v40 = v27;
    __int16 v41 = 2048;
    *(void *)long long v42 = v28;
    *(_WORD *)&v42[8] = 2112;
    *(void *)&v42[10] = v31;
    _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Pair-Setup Completed with Type: %tu, Auth method: %@", buf, 0x20u);
  }
}

void __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (!a2) {
    [WeakRetained _notifyDelegateOfPairingProgress:4];
  }
  if ([v5 _delegateRespondsToSelector:sel_accessoryServer_validateCert_model_])
  {
    [v5 _notifyDelegateOfPairingProgress:5];
    uint64_t v6 = [v5 delegateQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_2;
    v7[3] = &unk_1E69F46E0;
    void v7[4] = v5;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = [v3 model];
  [v5 accessoryServer:v3 validateCert:v2 model:v4];
}

void __48__HAPAccessoryServerIP__handleMFiCertValidation__block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = [v3 model];
  [v5 accessoryServer:v3 validateCert:v2 model:v4];
}

- (BOOL)stopPairingWithError:(id *)a3
{
  uint64_t v4 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isWacAccessory];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _tearDownWAC];
  }
  else
  {
    if ([v3 isEstablishingSecureConnection])
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v4 = [*(id *)(a1 + 32) queuedOperations];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_2;
      void v11[3] = &unk_1E69F4420;
      objc_copyWeak(&v12, &location);
      id v5 = (void *)MEMORY[0x1D944E2D0](v11);
      [v4 addObject:v5];

      uint64_t v6 = &v12;
    }
    else
    {
      [*(id *)(a1 + 32) _tearDownSession];
      objc_initWeak(&location, *(id *)(a1 + 32));
      BOOL v7 = *(void **)(a1 + 32);
      id v8 = [v7 clientQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_153;
      v9[3] = &unk_1E69F4420;
      objc_copyWeak(&v10, &location);
      [v7 removePairingForCurrentControllerOnQueue:v8 completion:v9];

      uint64_t v6 = &v10;
    }
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_3;
  v7[3] = &unk_1E69F4420;
  objc_copyWeak(&v8, v4);
  [WeakRetained removePairingForCurrentControllerOnQueue:v6 completion:v7];

  objc_destroyWeak(&v8);
}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_153(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = WeakRetained;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Pairing stopped and accessory pairing removed with error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

void __45__HAPAccessoryServerIP_stopPairingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = WeakRetained;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Deferred accessory pairing removed with error: %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)disconnect
{
}

- (void)disconnectWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HAPAccessoryServerIP_disconnectWithError___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__HAPAccessoryServerIP_disconnectWithError___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Tearing down session as a result of disconnect call", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _tearDownSessionAndStartReachabilityWithError:*(void *)(a1 + 40)];
}

- (void)_tearDownSessionAndStartReachabilityWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D944E080]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v15 = 138543618;
    __int16 v16 = v9;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@invalidating HTTP client and tearing down pairing session %{public}@", (uint8_t *)&v15, 0x16u);
  }
  id v10 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerIP *)v7 _tearDownSessionWithError:v4]);
  __int16 v11 = v7;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v15 = 138543362;
    __int16 v16 = v13;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ensuring reachability poll is enabled", (uint8_t *)&v15, 0xCu);
  }
  [(HAPAccessoryServerIP *)v11 _startReachability];
  id v14 = [(HAPAccessoryServerIP *)v11 browser];
  [v14 startDiscoveringAccessoryServers];
}

- (void)_skipReconfirm
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Skipping reconfirm", (uint8_t *)&v7, 0xCu);
  }
}

- (BOOL)_matchesError:(id)a3 withHAPHMErrorCode:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 domain];
    if ([v7 isEqual:@"HMErrorDomain"]) {
      BOOL v8 = [v6 code] == a4;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_matchesError:(id)a3 withHAPErrorCode:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 domain];
    if ([v7 isEqual:@"HAPErrorDomain"]) {
      BOOL v8 = [v6 code] == a4;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_doBonjourReconfirm
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HAPAccessoryServerIP *)self bonjourDeviceInfo];
  if (v4)
  {
    int v5 = BonjourDevice_Reconfirm();
    if (v5)
    {
      int v6 = v5;
      int v7 = (void *)MEMORY[0x1D944E080]();
      BOOL v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v11 = 138543618;
        id v12 = v10;
        __int16 v13 = 1024;
        int v14 = v6;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Bonjour reconfirm failed %d", (uint8_t *)&v11, 0x12u);
      }
    }
  }
}

- (void)_tearDownSession
{
}

- (void)_tearDownSessionWithError:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  int v6 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryServerIP *)self setSecuritySessionOpen:0]);
  int v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    id v29 = v4;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@Invalidating HTTP client with error: %{public}@", buf, 0x16u);
  }
  id v10 = [(HAPAccessoryServerIP *)v7 httpClient];
  [v10 invalidateWithError:v4];

  [(HAPAccessoryServerIP *)v7 setHttpClient:0];
  [(HAPAccessoryServerIP *)v7 setHasAttributeDatabase:0];
  if (!v7->_retryingPairSetup) {
    [(HAPAccessoryServerIP *)v7 setPreSoftAuthWacStarted:0];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v11 = [(HAPAccessoryServer *)v7 accessories];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) invalidateWithError:v4];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [(HAPAccessoryServerIP *)v7 _notifyDelegatesOfConnectionState:0 withError:v4];
  __int16 v16 = [MEMORY[0x1E4F65530] sharedPreferences];
  __int16 v17 = [v16 preferenceForKey:@"HAPDefaultIPDisconnectOnIdleTimeoutSeconds"];
  id v18 = [v17 numberValue];
  [v18 doubleValue];
  [(HAPAccessoryServerIP *)v7 setDisconnectOnIdleTimeout:"setDisconnectOnIdleTimeout:"];

  [(HAPAccessoryServerIP *)v7 _suspendConnectionIdleTimer];
  if (v4) {
    uint64_t v19 = 4;
  }
  else {
    uint64_t v19 = 5;
  }
  id v20 = [(HAPAccessoryServerIP *)v7 ipConnectionStatistics];
  [v20 accessoryServerIPEvent:v19];
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  id v6 = a3;
  int v7 = [(HAPAccessoryServer *)self clientQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__HAPAccessoryServerIP_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke;
  v10[3] = &unk_1E69F46E0;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(v7, v10);

  return 1;
}

uint64_t __78__HAPAccessoryServerIP_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) isWacAccessory]
    || ([*(id *)(a1 + 32) isWacLegacy] & 1) != 0
    || ([*(id *)(a1 + 32) isPreSoftAuthWacStarted] & 1) != 0)
  {
    goto LABEL_7;
  }
  int v2 = [*(id *)(a1 + 32) hapWACAccessory];
  if ([v2 supportsTokenAuth])
  {

    goto LABEL_7;
  }
  id v3 = [*(id *)(a1 + 32) hapWACAccessory];
  char v4 = [v3 supportsCertAuth];

  if (v4)
  {
LABEL_7:
    if ([*(id *)(a1 + 32) isPostSoftAuthWacStarted])
    {
      int v5 = (void *)MEMORY[0x1D944E080]();
      id v6 = *(id *)(a1 + 32);
      int v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = HMFGetLogIdentifier();
        int v14 = 138543362;
        uint64_t v15 = v8;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Post SW Auth password", (uint8_t *)&v14, 0xCu);
      }
      return [*(id *)(a1 + 32) _continuePairingWithSetupCode:*(void *)(a1 + 40)];
    }
    else
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      return [v10 _pairSetupTryPassword:v11];
    }
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);

  return [v12 _continuePairingWithSetupCode:v13];
}

- (void)continuePairingAfterAuthPrompt
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  char v4 = self;
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = [(HAPAccessoryServerIP *)v4 hapWACAccessory];
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Continuing pairing after auth prompt hapWACAccessory: %@", buf, 0x16u);
  }
  id v8 = [(HAPAccessoryServer *)v4 clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HAPAccessoryServerIP_continuePairingAfterAuthPrompt__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = v4;
  dispatch_async(v8, block);
}

uint64_t __54__HAPAccessoryServerIP_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) hapWACAccessory];
  if (!v3)
  {
LABEL_11:
    id v10 = *(void **)(a1 + 32);
    return [v10 _continuePairingAfterAuthPromptWithRetry:1];
  }
  char v4 = (void *)v3;
  int v5 = [*(id *)(a1 + 32) hapWACAccessory];
  char v6 = [v5 supportsLegacyWAC];
  if ((v6 & 1) == 0)
  {
    uint64_t v1 = [*(id *)(a1 + 32) hapWACAccessory];
    if (![v1 supportsWAC2]) {
      goto LABEL_6;
    }
  }
  int v7 = [*(id *)(a1 + 32) hapWACAccessory];
  if ([v7 supportsTokenAuth])
  {

    if (v6)
    {
LABEL_7:

      goto LABEL_11;
    }
LABEL_6:

    goto LABEL_7;
  }
  id v8 = [*(id *)(a1 + 32) hapWACAccessory];
  char v9 = [v8 supportsCertAuth];

  if ((v6 & 1) == 0) {
  if (v9)
  }
    goto LABEL_11;
  __int16 v12 = *(void **)(a1 + 32);

  return [v12 _continuePairingUsingWAC];
}

- (void)reconfirm
{
  uint64_t v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HAPAccessoryServerIP_reconfirm__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __33__HAPAccessoryServerIP_reconfirm__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isWacAccessory]
    || ([*(id *)(a1 + 32) isWacComplete] & 1) != 0
    || ([*(id *)(a1 + 32) hasStartedPairing] & 1) != 0)
  {
    int v2 = *(void **)(a1 + 32);
    [v2 _doBonjourReconfirm];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) browser];
    [v3 startDiscoveringWACAccessoryServers];
  }
}

- (void)startPairingWithRequest:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F653F0] currentActivity];
  char v6 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

id __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPairingActivity:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setHasStartedPairing:1];
  [*(id *)(a1 + 32) setPairingRequest:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) isWacAccessory]
    && ([*(id *)(a1 + 32) isWacComplete] & 1) == 0)
  {
    [*(id *)(a1 + 32) _notifyDelegateOfPairingProgress:0];
    int v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_2;
    v6[3] = &unk_1E69F4380;
    void v6[4] = v5;
    return (id)[v5 _joinAccessoryNetworkWithCompletion:v6];
  }
  else
  {
    int v2 = *(void **)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 48) requiresUserConsent];
    return (id)[v2 _pairSetupStartWithConsentRequired:v3];
  }
}

void __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 _notifyDelegatesPairingStopped:v3];
    goto LABEL_13;
  }
  [v4 _notifyDelegateOfPairingProgress:1];
  int v5 = [*(id *)(a1 + 32) hapWACAccessory];
  int v6 = [v5 supportsLegacyWAC];

  if (v6)
  {
    id v7 = [HAPAccessoryInfo alloc];
    id v26 = [*(id *)(a1 + 32) hapWACAccessory];
    id v8 = [v26 name];
    char v9 = [*(id *)(a1 + 32) hapWACAccessory];
    id v10 = [v9 manufacturer];
    id v11 = [*(id *)(a1 + 32) hapWACAccessory];
    __int16 v12 = [v11 model];
    uint64_t v13 = [*(id *)(a1 + 32) hapWACAccessory];
    uint64_t v14 = [v13 wacCategory];
    uint64_t v15 = [(HAPAccessoryInfo *)v7 initWithName:v8 manufacturer:v10 modelName:v12 category:v14 certificationStatus:0 denylisted:0 ppid:0];

    if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
    {
      uint64_t v16 = [*(id *)(a1 + 32) delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_3;
      block[3] = &unk_1E69F46E0;
      void block[4] = *(void *)(a1 + 32);
      id v29 = v15;
      dispatch_async(v16, block);
    }
    goto LABEL_13;
  }
  __int16 v17 = [*(id *)(a1 + 32) hapWACAccessory];
  if ([v17 supportsTokenAuth])
  {

LABEL_10:
    [*(id *)(a1 + 32) setPairingRequestPending:1];
    [*(id *)(a1 + 32) setPreSoftAuthWacStarted:1];
    id v20 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) _notifyDelegateOfPairingProgress:8]);
    id v21 = *(id *)(a1 + 32);
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v31 = v23;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@Waiting for Bonjour to start Cert / Token Auth", buf, 0xCu);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_151;
    v27[3] = &unk_1E69F4330;
    void v27[4] = *(void *)(a1 + 32);
    __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_151((uint64_t)v27);
    goto LABEL_13;
  }
  id v18 = [*(id *)(a1 + 32) hapWACAccessory];
  int v19 = [v18 supportsCertAuth];

  if (v19) {
    goto LABEL_10;
  }
  long long v24 = [*(id *)(a1 + 32) hapWACAccessory];
  int v25 = [v24 supportsWAC2];

  if (v25) {
    [*(id *)(a1 + 32) continuePairingAfterAuthPrompt];
  }
LABEL_13:
}

void __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:1 accessoryInfo:*(void *)(a1 + 40) error:0];
}

void __48__HAPAccessoryServerIP_startPairingWithRequest___block_invoke_151(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v5 = v2;
    id v3 = [*(id *)(a1 + 32) hapWACAccessory];
    id v4 = HAPAuthFeaturesToString([v3 authFeatures]);

    id v2 = v5;
  }
}

- (void)_isAccessoryPublicKeyPresent:(BOOL *)a3 registeredWithHomeKit:(BOOL *)a4
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  id v7 = [(HAPAccessoryServer *)self keyStore];
  id v16 = 0;
  id v8 = [(HAPAccessoryServer *)self identifier];
  id v15 = 0;
  [v7 getControllerPublicKey:&v16 secretKey:0 username:0 allowCreation:0 forAccessory:v8 error:&v15];
  id v9 = v16;
  id v10 = v15;

  if (!v10 && v9)
  {
    id v11 = [(HAPAccessoryServer *)self keyStore];
    __int16 v12 = [(HAPAccessoryServer *)self identifier];
    id v14 = 0;
    uint64_t v13 = [v11 readPublicKeyForAccessoryName:v12 registeredWithHomeKit:a4 error:&v14];
    id v10 = v14;

    if (a3 && !v10 && v13) {
      *a3 = 1;
    }
  }
}

- (void)_establishSecureConnectionAndFetchAttributeDatabaseWithReason:(id)a3
{
  id v4 = a3;
  if (![(HAPAccessoryServerIP *)self isEstablishingSecureConnection])
  {
    id v5 = [MEMORY[0x1E4F65520] sharedPowerLogger];
    int v6 = [(HAPAccessoryServer *)self identifier];
    id v7 = [(HAPAccessoryServer *)self category];
    [v5 reportConnection:v6 linkType:1 accessoryCategory:v7];

    [(HAPAccessoryServerIP *)self setEstablishingSecureConnection:1];
    [(HAPAccessoryServerIP *)self setHasAttributeDatabase:0];
    [(HAPAccessoryServer *)self setMetric_pairVerifyReason:v4];
    [(HAPAccessoryServerIP *)self _suspendConnectionIdleTimer];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    __int16 v12 = __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke;
    uint64_t v13 = &unk_1E69F1A08;
    objc_copyWeak(&v16, &location);
    id v9 = v8;
    id v14 = v9;
    id v15 = v4;
    [(HAPAccessoryServerIP *)self setPairVerifyCompletionBlock:&v10];
    [(HAPAccessoryServerIP *)self _establishSecureSession];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained clientQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v8 = v7;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_2;
  v19[3] = &unk_1E69F4518;
  v19[4] = WeakRetained;
  uint64_t v22 = v8;
  id v20 = *(id *)(a1 + 40);
  id v9 = v3;
  id v21 = v9;
  __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_2((uint64_t)v19);
  if (!v9)
  {
    [WeakRetained _getAttributeDatabase];
    [WeakRetained resetPairVerifyFailureCount];
    if ([WeakRetained authMethod] == 2
      && [WeakRetained isPostSoftAuthWacStarted])
    {
      id v15 = [WeakRetained token];
      [WeakRetained provisionToken:v15];
    }
    id v16 = [WeakRetained identifier];
    [WeakRetained associateAccessoryWithControllerKeyUsingAccessoryIdentifier:v16];

    goto LABEL_11;
  }
  uint64_t v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = WeakRetained;
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v24 = v13;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to complete pair-verify - error: %@", buf, 0x16u);
  }
  [v11 _incrementPairVerifyFailureCount];
  [v11 _clearIPCacheOnError:v9];
  if (![v11 shouldRetryPVDueToAuthenticationError:v9])
  {
    [v11 _notifyDelegatesPairingStopped:v9];
LABEL_11:
    [WeakRetained setEstablishingSecureConnection:0];
    goto LABEL_12;
  }
  id v14 = [v11 clientQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_149;
  v17[3] = &unk_1E69F46E0;
  void v17[4] = v11;
  id v18 = *(id *)(a1 + 40);
  dispatch_async(v14, v17);

LABEL_12:
}

void __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v4 = v2;
    id v3 = (id)[NSNumber numberWithDouble:*(double *)(a1 + 56)];
    [*(id *)(a1 + 48) domain];

    [*(id *)(a1 + 48) code];
    id v2 = v4;
  }
}

uint64_t __86__HAPAccessoryServerIP__establishSecureConnectionAndFetchAttributeDatabaseWithReason___block_invoke_149(uint64_t a1)
{
  return [*(id *)(a1 + 32) _establishSecureConnectionAndFetchAttributeDatabaseWithReason:*(void *)(a1 + 40)];
}

- (void)discoverAccessories
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(HAPAccessoryServerIP *)self hasBonjourDeviceInfo])
  {
    id v3 = [(HAPAccessoryServer *)self clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__HAPAccessoryServerIP_discoverAccessories__block_invoke;
    block[3] = &unk_1E69F4330;
    void block[4] = self;
    dispatch_async(v3, block);
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = self;
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Waiting for Bonjour to discoverAccessories", buf, 0xCu);
    }
    [(HAPAccessoryServerIP *)v5 setBonjourDiscoveryPending:1];
    [(HAPAccessoryServerIP *)v5 _notifyDelegateOfPairingProgress:8];
  }
}

uint64_t __43__HAPAccessoryServerIP_discoverAccessories__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) _isSessionEstablished];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t result = [v3 hasAttributeDatabase];
    if (result)
    {
      id v5 = (void *)MEMORY[0x1D944E080]();
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        int v9 = 138543362;
        uint64_t v10 = v8;
        _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to discover accessories because the session is already established, calling delegate immediately", (uint8_t *)&v9, 0xCu);
      }
      return [*(id *)(a1 + 32) _notifyDelegateOfDiscoveryCompletionWithError:0];
    }
  }
  else
  {
    return [v3 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.discoverAccessories"];
  }
  return result;
}

- (void)_clearIPCacheOnError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];
  uint64_t v7 = objc_msgSend(v6, "hmf_errorForKey:", *MEMORY[0x1E4F28A50]);

  if (v7)
  {
    uint64_t v8 = [v7 domain];
    int v9 = [v8 isEqual:*MEMORY[0x1E4F28760]];

    if (v9)
    {
      uint64_t v10 = [v7 code];
      if ((unint64_t)(v10 - 54) <= 0xB && ((1 << (v10 - 54)) & 0x881) != 0)
      {
        uint64_t v12 = v10;
        uint64_t v13 = (void *)MEMORY[0x1D944E080]();
        id v14 = self;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          int v17 = 138543618;
          id v18 = v16;
          __int16 v19 = 2048;
          uint64_t v20 = v12;
          _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Clearing IP cache due to error %ld", (uint8_t *)&v17, 0x16u);
        }
        [(HAPAccessoryServerIP *)v14 setCachedSocketInfo:0];
      }
    }
  }
}

- (void)setCachedSocketInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (v5 && ![(HAPSocketInfo *)self->_cachedSocketInfo isEqual:v5]) {
    id v6 = self->_cachedSocketInfo;
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong((id *)&self->_cachedSocketInfo, a3);
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    uint64_t v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = [(HAPSocketInfo *)v6 shortDescription];
      uint64_t v12 = [v5 shortDescription];
      int v15 = 138543874;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@cached socket updated from %@ to %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (v5) {
      goto LABEL_10;
    }
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    uint64_t v13 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@cleared socket info", (uint8_t *)&v15, 0xCu);
    }
  }

LABEL_10:
}

- (HAPSocketInfo)currentSocketInfo
{
  char v2 = [(HAPAccessoryServerIP *)self httpClient];
  id v3 = [v2 peerSocketInfo];

  return (HAPSocketInfo *)v3;
}

- (NSString)peerEndpointDescription
{
  char v2 = [(HAPAccessoryServerIP *)self httpClient];
  id v3 = [v2 peerEndpointDescription];

  return (NSString *)v3;
}

- (HMFNetAddress)peerAddressEx
{
  char v2 = [(HAPAccessoryServerIP *)self httpClient];
  id v3 = [v2 peerAddressEx];

  return (HMFNetAddress *)v3;
}

- (HMFNetAddress)peerAddress
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPAccessoryServerIP *)self httpClient];

  if (v3)
  {
    id v4 = [(HAPAccessoryServerIP *)self httpClient];
    id v5 = [v4 peerAddress];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get peer address -- httpClient is nil", (uint8_t *)&v11, 0xCu);
    }
    id v5 = 0;
  }

  return (HMFNetAddress *)v5;
}

- (int64_t)linkType
{
  return 1;
}

- (int64_t)linkLayerType
{
  return 1;
}

- (id)primaryAccessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  primaryAccessoryForServer = self->_primaryAccessoryForServer;
  if (!primaryAccessoryForServer)
  {
    id v5 = [HAPAccessory alloc];
    id v6 = [NSNumber numberWithUnsignedInteger:1];
    uint64_t v7 = [(HAPAccessory *)v5 initWithServer:self instanceID:v6];
    uint64_t v8 = self->_primaryAccessoryForServer;
    self->_primaryAccessoryForServer = v7;

    [(HAPAccessory *)self->_primaryAccessoryForServer setName:self->super._name];
    [(HAPAccessory *)self->_primaryAccessoryForServer setIdentifier:self->super._identifier];
    [(HAPAccessory *)self->_primaryAccessoryForServer setPrimary:1];
    [(HAPAccessory *)self->_primaryAccessoryForServer setServerIdentifier:self->super._identifier];
    primaryAccessoryForServer = self->_primaryAccessoryForServer;
  }
  int v9 = primaryAccessoryForServer;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)services
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSArray *)self->_ipServices copy];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)createKeysForDataStreamWithKeySalt:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HAPAccessoryServerIP_createKeysForDataStreamWithKeySalt_completionHandler___block_invoke;
  block[3] = &unk_1E69F4070;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __77__HAPAccessoryServerIP_createKeysForDataStreamWithKeySalt_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 344))
  {
    [*(id *)(a1 + 40) bytes];
    [*(id *)(a1 + 40) length];
    uint64_t v2 = PairingSessionDeriveKey();
    if (v2
      || ([*(id *)(a1 + 40) bytes],
          [*(id *)(a1 + 40) length],
          uint64_t v2 = PairingSessionDeriveKey(),
          v2))
    {
      id v3 = 0;
    }
    else
    {
      id v9 = [HAPSecuritySessionEncryption alloc];
      id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:32];
      int v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v12 length:32];
      id v3 = [(HAPSecuritySessionEncryption *)v9 initWithInputKey:v10 outputKey:v11];

      uint64_t v2 = 0;
    }
    id v4 = HMErrorFromOSStatus(v2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "%{public}@Attempting to create HDS keys without an active session", buf, 0xCu);
    }
    id v4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:19];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)pairSetupStartSoftAuthWAC
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HAPAccessoryServerIP_pairSetupStartSoftAuthWAC__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __49__HAPAccessoryServerIP_pairSetupStartSoftAuthWAC__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasStartedPairing:1];
  [*(id *)(a1 + 32) setPreSoftAuthWacStarted:0];
  [*(id *)(a1 + 32) setPostSoftAuthWacStarted:1];
  uint64_t result = [*(id *)(a1 + 32) isWacAccessory];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) isWacComplete];
    if ((result & 1) == 0)
    {
      [*(id *)(a1 + 32) _tearDownSession];
      id v3 = *(void **)(a1 + 32);
      return [v3 _pairSetupContinueWAC];
    }
  }
  return result;
}

- (void)_tearDownWAC
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = [(HAPAccessoryServerIP *)v4 isWacComplete];
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@tearDownWAC - wacComplete: %d", buf, 0x12u);
  }
  if ([(HAPAccessoryServerIP *)v4 isWacStarted]
    && ![(HAPAccessoryServerIP *)v4 isWacComplete]
    || [(HAPAccessoryServerIP *)v4 isPreSoftAuthWacStarted]
    || [(HAPAccessoryServerIP *)v4 isPostSoftAuthWacStarted])
  {
    id v7 = [(HAPAccessoryServerIP *)v4 hapWACAccessoryClient];
    [v7 stopEasyConfig];

    [(HAPAccessoryServerIP *)v4 _notifyDelegateOfPairingProgress:3];
    uint64_t v8 = [(HAPAccessoryServerIP *)v4 hapWACAccessoryClient];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__HAPAccessoryServerIP__tearDownWAC__block_invoke;
    void v11[3] = &unk_1E69F4380;
    void v11[4] = v4;
    id v9 = (id)[v8 restoreNetworkWithCompletion:v11];
  }
  else
  {
    id v10 = [(HAPAccessoryServerIP *)v4 pairOperation];
    [v10 finish];
  }
}

uint64_t __36__HAPAccessoryServerIP__tearDownWAC__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _notifyDelegateOfPairingProgress:4];
  }
  return result;
}

- (void)_continuePairingAfterWAC:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    long long v40 = v5;
    __int16 v41 = 2114;
    long long v42 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Continue pairing after WAC with error: %{public}@", buf, 0x16u);
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  id v38[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_123;
  v38[3] = &unk_1E69F4380;
  v38[4] = *(void *)(a1 + 32);
  id v7 = (void (**)(void, void))MEMORY[0x1D944E2D0](v38);
  [*(id *)(a1 + 32) setWacComplete:1];
  id v8 = [*(id *)(a1 + 32) pairOperation];
  [v8 finish];

  id v9 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    [v9 setWacComplete:0];
    v7[2](v7, *(void *)(a1 + 40));
    [*(id *)(a1 + 32) _notifyDelegatesPairingStopped:*(void *)(a1 + 40)];
    goto LABEL_21;
  }
  id v10 = [v9 hapWACAccessory];
  int v11 = [v10 supportsWAC2];

  uint64_t v12 = *(void **)(a1 + 32);
  if (v11)
  {
    id v13 = [v12 keyStore];
    __int16 v14 = [*(id *)(a1 + 32) identifier];
    id v37 = 0;
    [v13 registerAccessoryWithHomeKit:v14 error:&v37];
    id v15 = v37;

    if (v15) {
      ((void (**)(void, id))v7)[2](v7, v15);
    }
    else {
      [*(id *)(a1 + 32) setHasPairings:1];
    }
    [*(id *)(a1 + 32) _notifyDelegatesPairingStopped:v15];
LABEL_20:

    goto LABEL_21;
  }
  int v16 = [v12 hasBonjourDeviceInfo];
  __int16 v17 = *(void **)(a1 + 32);
  if (v16)
  {
    if ([v17 isContinuingLegacyWACpairing]) {
      goto LABEL_21;
    }
    int v18 = [*(id *)(a1 + 32) hasPairings];
    __int16 v19 = (void *)MEMORY[0x1D944E080]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    uint64_t v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = HMFGetLogIdentifier();
        long long v24 = [*(id *)(a1 + 32) bonjourDeviceInfo];
        *(_DWORD *)buf = 138543618;
        long long v40 = v23;
        __int16 v41 = 2112;
        long long v42 = v24;
        _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@already has pairings after legacy WAC completion - aborting pairing operation: %@", buf, 0x16u);
      }
      id v15 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:11];
      ((void (**)(void, id))v7)[2](v7, v15);
      [*(id *)(a1 + 32) _notifyDelegatesOfAddAccessoryFailureWithError:v15];
      goto LABEL_20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v40 = v35;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@continuing Legacy WAC", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setContinuingLegacyWACpairing:1];
    [*(id *)(a1 + 32) _pairSetupStartWithConsentRequired:1];
  }
  else
  {
    __int16 v25 = [v17 bonjourEventTimer];

    if (!v25)
    {
      id v26 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) _notifyDelegateOfPairingProgress:8]);
      id v27 = *(id *)(a1 + 32);
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v40 = v29;
        _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_INFO, "%{public}@Starting a timer to wait for Bonjour event after legacy WAC completion", buf, 0xCu);
      }
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_128;
      v36[3] = &unk_1E69F4330;
      v36[4] = *(void *)(a1 + 32);
      __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_128((uint64_t)v36);
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:60.0];
      [*(id *)(a1 + 32) setBonjourEventTimer:v30];

      id v31 = [*(id *)(a1 + 32) bonjourEventTimer];
      [v31 setDelegate:*(void *)(a1 + 32)];

      uint64_t v32 = [*(id *)(a1 + 32) bonjourEventTimer];
      id v33 = [*(id *)(a1 + 32) clientQueue];
      [v32 setDelegateQueue:v33];

      BOOL v34 = [*(id *)(a1 + 32) bonjourEventTimer];
      [v34 resume];
    }
  }
LABEL_21:
}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_123(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_2;
    v5[3] = &unk_1E69F46E0;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_2((uint64_t)v5);
  }
}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_128(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v5 = v2;
    id v3 = [*(id *)(a1 + 32) hapWACAccessory];
    id v4 = HAPAuthFeaturesToString([v3 authFeatures]);

    uint64_t v2 = v5;
  }
}

void __49__HAPAccessoryServerIP__continuePairingAfterWAC___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    uint64_t v2 = v3;
  }
}

- (int)_continuePairingWithSetupCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2080;
    id v15 = "-[HAPAccessoryServerIP _continuePairingWithSetupCode:]";
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@%s", (uint8_t *)&v12, 0x16u);
  }
  id v9 = [(HAPAccessoryServerIP *)v6 hapWACAccessoryClient];
  id v10 = (id)[v9 continuePairingWithSetupCode:v4];

  return 0;
}

- (void)_continuePairingUsingWAC
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HAPAccessoryServerIP *)self isWacStarted];
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@WAC already started", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Continuing WAC Pairing", buf, 0xCu);
    }
    [(HAPAccessoryServerIP *)v5 setWacStarted:1];
    id v10 = [(HAPAccessoryServerIP *)v5 hapWACAccessory];
    int v11 = [v10 supportsLegacyWAC];

    if (v11)
    {
      [(HAPAccessoryServerIP *)v5 _notifyDelegateOfPairingProgress:6];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke;
      v19[3] = &unk_1E69F4380;
      v19[4] = v5;
      int v12 = v19;
      id v13 = v5;
      __int16 v14 = 0;
    }
    else
    {
      if ([(HAPAccessoryServerIP *)v5 isPostSoftAuthWacStarted])
      {
        [(HAPAccessoryServerIP *)v5 _notifyDelegateOfPairingProgress:0];
        id v15 = [(HAPAccessoryServerIP *)v5 hapWACAccessoryClient];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_116;
        v18[3] = &unk_1E69F4380;
        void v18[4] = v5;
        id v16 = (id)[v15 joinAccessoryNetworkWithCompletion:v18];

        return;
      }
      [(HAPAccessoryServerIP *)v5 _notifyDelegateOfPairingProgress:6];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v17[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_121;
      v17[3] = &unk_1E69F4380;
      void v17[4] = v5;
      __int16 v14 = _WACPairSetupPromptForSetupCodeDelegateCallback_f;
      int v12 = v17;
      id v13 = v5;
    }
    [(HAPAccessoryServerIP *)v13 _performEasyConfigWithPairingPrompt:v14 performPairSetup:1 isSplit:0 completion:v12];
  }
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config completed error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2;
  v7[3] = &unk_1E69F46E0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_121(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config & Pair-Setup completed error: %{public}@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) clientQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_122;
  v10[3] = &unk_1E69F46E0;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, v10);
}

uint64_t __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_122(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continuePairingAfterConfirmingSecureWAC:*(void *)(a1 + 40)];
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying to join accessory network due to error: %{public}@", buf, 0x16u);
    }
    id v7 = [*(id *)(a1 + 40) hapWACAccessoryClient];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_117;
    void v11[3] = &unk_1E69F4380;
    void v11[4] = *(void *)(a1 + 40);
    id v8 = (id)[v7 joinAccessoryNetworkWithCompletion:v11];
  }
  else
  {
    [*(id *)(a1 + 40) _notifyDelegateOfPairingProgress:1];
    [*(id *)(a1 + 40) _notifyDelegateOfPairingProgress:6];
    id v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_119;
    v10[3] = &unk_1E69F4380;
    v10[4] = v9;
    [v9 _performEasyConfigWithPairingPrompt:_WACPairSetupPromptForSetupCodeDelegateCallback_f performPairSetup:1 isSplit:1 completion:v10];
  }
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_117(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_118;
  v7[3] = &unk_1E69F46E0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config & Pair-Setup completed error: %{public}@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) clientQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_120;
  v10[3] = &unk_1E69F46E0;
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, v10);
}

uint64_t __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_120(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continuePairingAfterConfirmingSecureWAC:*(void *)(a1 + 40)];
}

uint64_t __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_2_118(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    return objc_msgSend(v2, "_continuePairingAfterConfirmingSecureWAC:");
  }
  else
  {
    [v2 _notifyDelegateOfPairingProgress:1];
    [*(id *)(a1 + 40) _notifyDelegateOfPairingProgress:6];
    id v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_3;
    v6[3] = &unk_1E69F4380;
    void v6[4] = v5;
    return [v5 _performEasyConfigWithPairingPrompt:_WACPairSetupPromptForSetupCodeDelegateCallback_f performPairSetup:1 isSplit:1 completion:v6];
  }
}

void __48__HAPAccessoryServerIP__continuePairingUsingWAC__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy Config & Pair-Setup completed error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) _continuePairingAfterConfirmingSecureWAC:v3];
}

- (void)_performEasyConfigWithPairingPrompt:(void *)a3 performPairSetup:(BOOL)a4 isSplit:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = [(HAPAccessoryServerIP *)self hapWACAccessoryClient];
  uint64_t v12 = [(HAPAccessoryServer *)self pairingRequest];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__HAPAccessoryServerIP__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_completion___block_invoke;
  v15[3] = &unk_1E69F3E20;
  void v15[4] = self;
  id v16 = v10;
  id v13 = v10;
  id v14 = (id)[v11 performEasyConfigWithParingPrompt:a3 performPairSetup:v7 isSplit:v6 pairingRequest:v12 completion:v15];
}

void __96__HAPAccessoryServerIP__performEasyConfigWithPairingPrompt_performPairSetup_isSplit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) setBonjourDeviceInfo:0]);
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Bonjour reset after Easy Config completed with error: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)continuePairingUsingWAC
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HAPAccessoryServerIP_continuePairingUsingWAC__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __47__HAPAccessoryServerIP_continuePairingUsingWAC__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _continuePairingAfterWAC:0];
}

- (void)_continuePairingAfterConfirmingSecureWAC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  BOOL v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v18 = v8;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Continue pairing after confirming secure WAC with error: %{public}@", buf, 0x16u);
  }
  if (v4)
  {
    [(HAPAccessoryServerIP *)v6 _continuePairingAfterWAC:v4];
  }
  else if ([(HAPAccessoryServerIP *)v6 _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
  {
    int v9 = [HAPAccessoryInfo alloc];
    id v10 = [(HAPAccessoryServer *)v6 name];
    __int16 v11 = [(HAPAccessoryServer *)v6 category];
    id v12 = [(HAPAccessoryInfo *)v9 initWithName:v10 manufacturer:0 modelName:0 category:v11 certificationStatus:0 denylisted:0 ppid:0];

    uint64_t v13 = [(HAPAccessoryServer *)v6 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HAPAccessoryServerIP__continuePairingAfterConfirmingSecureWAC___block_invoke;
    block[3] = &unk_1E69F46E0;
    void block[4] = v6;
    id v16 = v12;
    id v14 = v12;
    dispatch_async(v13, block);
  }
}

void __65__HAPAccessoryServerIP__continuePairingAfterConfirmingSecureWAC___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:5 accessoryInfo:*(void *)(a1 + 40) error:0];
}

- (void)_pairVerifyStartWAC:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944E080]();
  BOOL v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = [(HAPAccessoryServerIP *)v6 hapWACAccessory];
    *(_DWORD *)buf = 138543618;
    id v15 = v8;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Request to start reprovisioning: %{public}@", buf, 0x16u);
  }
  [(HAPAccessoryServerIP *)v6 setWacComplete:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke;
  v12[3] = &unk_1E69F4128;
  void v12[4] = v6;
  id v13 = v4;
  id v10 = v4;
  id v11 = [(HAPAccessoryServerIP *)v6 _joinAccessoryNetworkWithCompletion:v12];
}

void __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Joined accessory network for re-WAC with join error: %{public}@", buf, 0x16u);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  if (v3)
  {
    [v8 setWacComplete:1];
    int v9 = [*(id *)(a1 + 32) browser];
    id v10 = [*(id *)(a1 + 32) identifier];
    [v9 notifyDelegatesOfWACCompletionWithIdentifier:v10 error:v3];
  }
  else
  {
    int v9 = [v8 hapWACAccessoryClient];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke_115;
    v13[3] = &unk_1E69F4380;
    uint64_t v11 = *(void *)(a1 + 40);
    void v13[4] = *(void *)(a1 + 32);
    id v12 = (id)[v9 performEasyConfigWithParingPrompt:0 performPairSetup:0 isSplit:0 pairingRequest:v11 completion:v13];
  }
}

void __44__HAPAccessoryServerIP__pairVerifyStartWAC___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) setWacComplete:1]);
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@Easy config with pair-verify finished with error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) browser];
  int v9 = [*(id *)(a1 + 32) identifier];
  [v8 notifyDelegatesOfWACCompletionWithIdentifier:v9 error:v3];
}

- (void)_pairSetupContinueWAC
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F65400];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke;
  int v10 = &unk_1E69F4658;
  objc_copyWeak(&v11, &location);
  id v4 = [v3 blockOperationWithBlock:&v7];
  -[HAPAccessoryServerIP setPairOperation:](self, "setPairOperation:", v4, v7, v8, v9, v10);

  id v5 = +[HAPAccessoryServerIP sharedPairOperationQueue];
  BOOL v6 = [(HAPAccessoryServerIP *)self pairOperation];
  [v5 addOperation:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_2;
    block[3] = &unk_1E69F4330;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) pairOperation];
  int v3 = [v2 isCancelled];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D944E080]();
    id v5 = *(id *)(a1 + 32);
    BOOL v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = [*(id *)(a1 + 32) hapWACAccessory];
      *(_DWORD *)buf = 138543618;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@cancel pairing: %@", buf, 0x16u);
    }
    int v9 = [*(id *)(a1 + 32) pairOperation];
    [(HAPAccessoryInfo *)v9 finish];
    goto LABEL_10;
  }
  if (![*(id *)(a1 + 32) isWacLegacy])
  {
    if ([*(id *)(a1 + 32) isWacAccessory])
    {
      __int16 v19 = [*(id *)(a1 + 32) hapWACAccessory];
      if ([v19 supportsTokenAuth])
      {

LABEL_16:
        uint64_t v22 = (void *)MEMORY[0x1D944E080]();
        id v23 = *(id *)(a1 + 32);
        long long v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          __int16 v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v29 = v25;
          _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_INFO, "%{public}@Starting WAC Software Auth Split Pair-Setup", buf, 0xCu);
        }
        goto LABEL_19;
      }
      id v20 = [*(id *)(a1 + 32) hapWACAccessory];
      int v21 = [v20 supportsCertAuth];

      if (v21) {
        goto LABEL_16;
      }
    }
LABEL_19:
    [*(id *)(a1 + 32) _continuePairingUsingWAC];
    return;
  }
  int v10 = (void *)MEMORY[0x1D944E080]();
  id v11 = *(id *)(a1 + 32);
  __int16 v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v29 = v13;
    _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Legacy WAC, prompting user to request permission to provide credentials...", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_requestUserPermission_accessoryInfo_error_])
  {
    uint64_t v14 = [HAPAccessoryInfo alloc];
    id v15 = [*(id *)(a1 + 32) name];
    __int16 v16 = [*(id *)(a1 + 32) category];
    id v17 = [(HAPAccessoryInfo *)v14 initWithName:v15 manufacturer:0 modelName:0 category:v16 certificationStatus:0 denylisted:0 ppid:0];

    uint64_t v18 = [*(id *)(a1 + 32) delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_113;
    block[3] = &unk_1E69F46E0;
    void block[4] = *(void *)(a1 + 32);
    id v27 = v17;
    int v9 = v17;
    dispatch_async(v18, block);

LABEL_10:
    return;
  }
  [*(id *)(a1 + 32) _notifyDelegatesOfAddAccessoryFailureWithError:0];
}

void __45__HAPAccessoryServerIP__pairSetupContinueWAC__block_invoke_113(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) requestUserPermission:1 accessoryInfo:*(void *)(a1 + 40) error:0];
}

- (id)_joinAccessoryNetworkWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessoryServerIP *)self browser];
  BOOL v6 = [v5 visible2Pt4Networks];

  uint64_t v7 = [(HAPAccessoryServerIP *)self browser];
  [v7 stopDiscoveringWACAccessoryServersWithInvalidation:0];

  uint64_t v8 = [HAPWACAccessoryClient alloc];
  int v9 = [(HAPAccessoryServerIP *)self hapWACAccessory];
  int v10 = [(HAPAccessoryServerIP *)self browser];
  id v11 = [v10 wacBrowser];
  __int16 v12 = [(HAPWACAccessoryClient *)v8 initWithWACAccessory:v9 server:self browser:v11 compatible2Pt4Networks:v6];
  [(HAPAccessoryServerIP *)self setHapWACAccessoryClient:v12];

  id v13 = [(HAPAccessoryServerIP *)self hapWACAccessoryClient];

  if (v13)
  {
    uint64_t v14 = [(HAPAccessoryServerIP *)self hapWACAccessoryClient];
    [v14 registerClientDelegate:self];

    id v15 = (void *)MEMORY[0x1D944E080]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v30 = v18;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Join accessory network", buf, 0xCu);
    }
    __int16 v19 = [(HAPAccessoryServerIP *)v16 hapWACAccessoryClient];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __60__HAPAccessoryServerIP__joinAccessoryNetworkWithCompletion___block_invoke;
    v27[3] = &unk_1E69F3E20;
    void v27[4] = v16;
    id v28 = v4;
    id v20 = (id)[v19 joinAccessoryNetworkWithCompletion:v27];

    int v21 = 0;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1D944E080]();
    id v23 = self;
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v30 = v25;
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@Error Allocating HAPWACAccessoryClient", buf, 0xCu);
    }
    int v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:19 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v21);
  }

  return v21;
}

void __60__HAPAccessoryServerIP__joinAccessoryNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setBonjourDeviceInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_invalidateWAC
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@invalidateWAC", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(HAPAccessoryServerIP *)v4 pairOperation];
  [v7 finish];
}

- (void)resetPostSoftAuthWAC
{
}

- (void)startReprovisioningWithPairingRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HAPAccessoryServerIP_startReprovisioningWithPairingRequest___block_invoke;
  v7[3] = &unk_1E69F46E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__HAPAccessoryServerIP_startReprovisioningWithPairingRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairVerifyStartWAC:*(void *)(a1 + 40)];
}

- (void)setPostSoftAuthWacStarted:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_postSoftAuthWacStarted = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPostSoftAuthWacStarted
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_postSoftAuthWacStarted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPreSoftAuthWacStarted:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_preSoftAuthWacStarted = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPreSoftAuthWacStarted
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_preSoftAuthWacStarted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWacLegacy:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wacLegacy = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isWacLegacy
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_wacLegacy;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isWacNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_wacAccessory && !self->_wacComplete;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setWacComplete:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wacComplete = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isWacComplete
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_wacComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setWacAccessory:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_wacAccessory = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isWacAccessory
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_wacAccessory;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isPaired
{
  int v3 = [(HAPAccessoryServerIP *)self browser];
  BOOL v4 = [(HAPAccessoryServer *)self identifier];
  char v5 = [v3 isPaired:v4];

  return v5;
}

- (HAPWACAccessory)hapWACAccessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_hapWACAccessory;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateWithHAPWACAccessory:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock_with_options();
  char v5 = [v11 name];
  name = self->super._name;
  self->super._name = v5;

  uint64_t v7 = [v11 deviceId];
  identifier = self->super._identifier;
  self->super._identifier = v7;

  self->_wacAccessory = 1;
  self->_wacComplete = 0;
  objc_storeStrong((id *)&self->_hapWACAccessory, a3);
  os_unfair_lock_unlock(&self->_lock);
  -[HAPAccessoryServerIP setWacLegacy:](self, "setWacLegacy:", [v11 pairSetupWAC] ^ 1);
  int v9 = [v11 setupHash];
  [(HAPAccessoryServer *)self setSetupHash:v9];

  uint64_t v10 = [v11 wacCategory];
  [(HAPAccessoryServer *)self setCategory:v10];

  [(HAPAccessoryServerIP *)self setBonjourDeviceInfo:0];
}

- (HAPAccessoryServerIP)initWithHAPWACAccessory:(id)a3 keystore:(id)a4 browser:(id)a5
{
  id v8 = a3;
  int v9 = [(HAPAccessoryServerIP *)self initWithKeyStore:a4 browser:a5 discoveryMethod:3];
  uint64_t v10 = v9;
  if (v9) {
    [(HAPAccessoryServerIP *)v9 updateWithHAPWACAccessory:v8];
  }

  return v10;
}

- (void)bonjourRemoveEvent
{
  id v2 = [(HAPAccessoryServerIP *)self ipConnectionStatistics];
  [v2 accessoryServerIPEvent:1];
}

- (void)_updateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  int v9 = [(HAPAccessoryServerIP *)self discoveryBookkeeping];
  [v9 setLastDiscoveryMethod:v8];

  __int16 v52 = v6;
  [(HAPAccessoryServerIP *)self setBonjourDeviceInfo:v6];
  [(HAPAccessoryServerIP *)self setHasUpdatedBonjour:1];
  unint64_t v54 = [(HAPAccessoryServer *)self configNumber];
  unint64_t v10 = [(HAPAccessoryServer *)self wakeNumber];
  unint64_t v11 = [(HAPAccessoryServer *)self stateNumber];
  BOOL v53 = [(HAPAccessoryServerIP *)self isBonjourDiscoveryPending];
  [(HAPAccessoryServerIP *)self setInvalidated:0];
  [(HAPAccessoryServerIP *)self setBonjourDiscoveryPending:0];
  BOOL v12 = [(HAPAccessoryServerIP *)self _parseAndValidateTXTRecord];
  BOOL v13 = [(HAPAccessoryServerIP *)self isPaired];
  BOOL v14 = v13;
  uint64_t v55 = v7;
  if (v7 && v13)
  {
    id v15 = (void *)MEMORY[0x1D944E080]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      unint64_t v18 = v10;
      v20 = BOOL v19 = v12;
      *(_DWORD *)buf = 138543362;
      long long v62 = v20;
      _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_INFO, "%{public}@Saving socket info", buf, 0xCu);

      BOOL v12 = v19;
      unint64_t v10 = v18;
    }

    [(HAPAccessoryServerIP *)v16 setCachedSocketInfo:v7];
  }
  int v21 = (void *)MEMORY[0x1D944E080]();
  uint64_t v22 = self;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    long long v24 = HMFGetLogIdentifier();
    unint64_t v25 = v10;
    BOOL v26 = v12;
    uint64_t v27 = [(HAPAccessoryServer *)v22 configNumber];
    uint64_t v28 = [(HAPAccessoryServer *)v22 wakeNumber];
    uint64_t v29 = [(HAPAccessoryServer *)v22 stateNumber];
    *(_DWORD *)buf = 138545410;
    __int16 v30 = @"NO";
    long long v62 = v24;
    if (v14) {
      uint64_t v31 = @"YES";
    }
    else {
      uint64_t v31 = @"NO";
    }
    if (v53) {
      __int16 v30 = @"YES";
    }
    __int16 v63 = 2048;
    unint64_t v64 = v54;
    __int16 v65 = 2048;
    uint64_t v66 = v27;
    BOOL v12 = v26;
    unint64_t v10 = v25;
    __int16 v67 = 2048;
    unint64_t v68 = v25;
    __int16 v69 = 2048;
    uint64_t v70 = v28;
    __int16 v71 = 2048;
    unint64_t v72 = v11;
    __int16 v73 = 2048;
    uint64_t v74 = v29;
    __int16 v75 = 2114;
    id v76 = v31;
    __int16 v77 = 2114;
    uint64_t v78 = v30;
    _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Parsing record: C# old/new %tu/%tu, W# old/new %tu/%tu, S# old/new %tu/%tu Paired: %{public}@, Discovery Pending: %{public}@", buf, 0x5Cu);
  }
  if (v11 != [(HAPAccessoryServer *)v22 stateNumber]
    && [(HAPAccessoryServer *)v22 stateNumber] != 1)
  {
    [(HAPAccessoryServerIP *)v22 _submitStateNumberChangeEvent:1];
  }
  BOOL v32 = v54 != [(HAPAccessoryServer *)v22 configNumber];
  uint64_t v33 = [(HAPAccessoryServer *)v22 stateNumber];
  BOOL v34 = v11 == v33;
  BOOL v35 = v11 != v33;
  int v36 = !v34 || v32;
  BOOL v37 = v12
     && v14
     && v36 | v53
     && [(HAPAccessoryServerIP *)v22 _shouldConnectBasedOnDisconnectOnIdle]
     || [(HAPAccessoryServerIP *)v22 abruptDisconnectionCounter] == 1;
  unsigned int v38 = [(HAPAccessoryServerIP *)v22 ipConnectionStatistics];
  [v38 accessoryServerIPEvent:2];

  BOOL v39 = v10 != [(HAPAccessoryServer *)v22 wakeNumber];
  if ([(HAPAccessoryServer *)v22 wakeNumber])
  {
    long long v40 = (void *)MEMORY[0x1D944E080]();
    __int16 v41 = v22;
    long long v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v62 = v43;
      long long v44 = "%{public}@skip connecting because accessory is suspended";
      id v45 = v42;
      os_log_type_t v46 = OS_LOG_TYPE_DEBUG;
LABEL_30:
      _os_log_impl(&dword_1D4758000, v45, v46, v44, buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      __int16 v47 = (void *)MEMORY[0x1D944E080]();
      __int16 v48 = v22;
      __int16 v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        __int16 v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v62 = v50;
        _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_INFO, "%{public}@connecting because accessory is no longer suspended", buf, 0xCu);
      }
    }
    else if (!v37)
    {
      goto LABEL_40;
    }
    if (![(HAPAccessoryServerIP *)v22 isWacAccessory]
      || [(HAPAccessoryServerIP *)v22 isWacComplete])
    {
      __int16 v51 = [(HAPAccessoryServer *)v22 clientQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__HAPAccessoryServerIP__updateWithBonjourDeviceInfo_socketInfo___block_invoke;
      block[3] = &unk_1E69F3DD0;
      void block[4] = v22;
      BOOL v57 = v32;
      BOOL v58 = v35;
      BOOL v59 = v39;
      BOOL v60 = v53;
      dispatch_async(v51, block);

      goto LABEL_40;
    }
    long long v40 = (void *)MEMORY[0x1D944E080]();
    __int16 v41 = v22;
    long long v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      uint64_t v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v62 = v43;
      long long v44 = "%{public}@skip update because WAC is in progress";
      id v45 = v42;
      os_log_type_t v46 = OS_LOG_TYPE_INFO;
      goto LABEL_30;
    }
  }

LABEL_40:
}

uint64_t __64__HAPAccessoryServerIP__updateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isSessionEstablished])
  {
    id v2 = *(void **)(a1 + 32);
    return [v2 _getAttributeDatabase];
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      BOOL v4 = @"bonjourUpdate.configNumberChanged";
    }
    else if (*(unsigned char *)(a1 + 41))
    {
      BOOL v4 = @"bonjourUpdate.stateNumberChanged";
    }
    else if (*(unsigned char *)(a1 + 42))
    {
      BOOL v4 = @"bonjourUpdate.wakeNumberChanged";
    }
    else if (*(unsigned char *)(a1 + 43))
    {
      BOOL v4 = @"bonjourUpdate.pendingBonjourDiscovery";
    }
    else
    {
      BOOL v4 = @"requested";
    }
    char v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      unint64_t v10 = v8;
      __int16 v11 = 2114;
      BOOL v12 = v4;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_DEBUG, "%{public}@establishing secured session due: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    return [*(id *)(a1 + 32) _establishSecureConnectionAndFetchAttributeDatabaseWithReason:v4];
  }
}

- (BOOL)_shouldConnectBasedOnDisconnectOnIdle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(HAPAccessoryServer *)self shouldDisconnectOnIdle]) {
    return 1;
  }
  int v3 = [(HAPAccessoryServerIP *)self httpClient];

  if (v3) {
    return 1;
  }
  char v5 = (void *)MEMORY[0x1D944E080]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    unint64_t v10 = v8;
    _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Recommend deferring update to server until next connection", (uint8_t *)&v9, 0xCu);
  }
  return 0;
}

- (void)_submitStateNumberChangeEvent:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HAPAccessoryServerIP *)self primaryAccessoryForServer];

  if (v5)
  {
    id v6 = [(HAPAccessoryServerIP *)self primaryAccessoryForServer];
    id v7 = [(HAPAccessoryServer *)self buildReachabilityNotificationDictionary:v6 reachable:v3 linkType:1 withError:0];

    [(HAPAccessoryServer *)self notifyClients:3 withDictionary:v7];
  }
}

- (void)updateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke;
  block[3] = &unk_1E69F4708;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke(uint64_t a1)
{
  *(void *)&v31[5] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _updateWithBonjourDeviceInfo:*(void *)(a1 + 40) socketInfo:*(void *)(a1 + 48)];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_2;
  v27[3] = &unk_1E69F4380;
  void v27[4] = *(void *)(a1 + 32);
  id v2 = (void (**)(void, void))MEMORY[0x1D944E2D0](v27);
  if (![*(id *)(a1 + 32) isWacAccessory]
    || ![*(id *)(a1 + 32) isWacLegacy])
  {
    if (![*(id *)(a1 + 32) isPairingRequestPending]) {
      goto LABEL_20;
    }
    int v21 = (void *)MEMORY[0x1D944E080]();
    id v22 = *(id *)(a1 + 32);
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v24;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Pairing request pending", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setPairingRequestPending:0];
    v2[2](v2, 0);
    unint64_t v25 = *(void **)(a1 + 32);
    uint64_t v26 = 0;
    goto LABEL_19;
  }
  BOOL v3 = (void *)MEMORY[0x1D944E080]();
  id v4 = *(id *)(a1 + 32);
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    BOOL v7 = ([*(id *)(a1 + 32) statusFlags] & 1) == 0;
    int v8 = [*(id *)(a1 + 32) isContinuingLegacyWACpairing];
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v6;
    __int16 v30 = 1024;
    *(_DWORD *)uint64_t v31 = v7;
    v31[2] = 1024;
    *(_DWORD *)&v31[3] = v8;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Legacy WAC accessory Bonjour event - hasPairings %d  continuingLegacyPairing: %d", buf, 0x18u);
  }
  [*(id *)(a1 + 32) setWacComplete:1];
  if ([*(id *)(a1 + 32) hasStartedPairing]
    && ([*(id *)(a1 + 32) isContinuingLegacyWACpairing] & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 32) bonjourEventTimer];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1D944E080]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v13;
        _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_INFO, "%{public}@Received Bonjour event - suspending timer", buf, 0xCu);
      }
      v2[2](v2, 0);
      BOOL v14 = [*(id *)(a1 + 32) bonjourEventTimer];
      [v14 suspend];

      [*(id *)(a1 + 32) setBonjourEventTimer:0];
    }
    if (([*(id *)(a1 + 32) statusFlags] & 1) == 0)
    {
      id v15 = (void *)MEMORY[0x1D944E080]();
      id v16 = *(id *)(a1 + 32);
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v18 = HMFGetLogIdentifier();
        BOOL v19 = [*(id *)(a1 + 32) bonjourDeviceInfo];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v18;
        __int16 v30 = 2112;
        *(void *)uint64_t v31 = v19;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@has pairings after legacy WAC completion - aborting pairing operation: %@", buf, 0x16u);
      }
      id v20 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:11];
      ((void (**)(void, void *))v2)[2](v2, v20);
      [*(id *)(a1 + 32) _notifyDelegatesOfAddAccessoryFailureWithError:v20];

      goto LABEL_20;
    }
    [*(id *)(a1 + 32) setContinuingLegacyWACpairing:1];
    unint64_t v25 = *(void **)(a1 + 32);
    uint64_t v26 = 1;
LABEL_19:
    [v25 _pairSetupStartWithConsentRequired:v26];
  }
LABEL_20:
}

void __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_3;
  v5[3] = &unk_1E69F46E0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_3((uint64_t)v5);
}

void __63__HAPAccessoryServerIP_updateWithBonjourDeviceInfo_socketInfo___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairingActivity];
  if (v2)
  {
    id v8 = v2;
    [*(id *)(a1 + 40) domain];

    [*(id *)(a1 + 40) code];
    [*(id *)(a1 + 32) isWacAccessory];
    id v3 = (id)HMFBooleanToString();
    [*(id *)(a1 + 32) isWacComplete];
    id v4 = (id)HMFBooleanToString();
    [*(id *)(a1 + 32) isWacLegacy];
    id v5 = (id)HMFBooleanToString();
    id v6 = [*(id *)(a1 + 32) hapWACAccessory];
    id v7 = HAPAuthFeaturesToString([v6 authFeatures]);

    id v2 = v8;
  }
}

- (void)setAbruptDisconnectionCounter:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_abruptDisconnectionCounter = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)abruptDisconnectionCounter
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t abruptDisconnectionCounter = self->_abruptDisconnectionCounter;
  os_unfair_lock_unlock(p_lock);
  return abruptDisconnectionCounter;
}

- (BOOL)isBonjourDiscoveryPending
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_bonjourDiscoveryPending;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setBonjourDiscoveryPending:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_bonjourDiscoveryPending = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setEstablishingSecureConnection:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_establishingSecureConnection = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEstablishingSecureConnection
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_establishingSecureConnection;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)hasBonjourDeviceInfo
{
  id v2 = [(HAPAccessoryServerIP *)self bonjourDeviceInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setBonjourDeviceInfo:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  bonjourDeviceInfo = self->_bonjourDeviceInfo;
  self->_bonjourDeviceInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)bonjourDeviceInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDictionary *)self->_bonjourDeviceInfo copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDictionary *)v4;
}

- (void)_notifyDelegateOfDiscoveryCompletionWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(HAPAccessoryServerIP *)self abruptDisconnectionCounter] <= 1) {
      [(HAPAccessoryServerIP *)self setAbruptDisconnectionCounter:[(HAPAccessoryServerIP *)self abruptDisconnectionCounter] + 1];
    }
  }
  else
  {
    [(HAPAccessoryServerIP *)self setAbruptDisconnectionCounter:0];
    [(HAPAccessoryServerIP *)self _startConnectionIdleTimer];
  }
  if ([(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServer_didDiscoverAccessories_transaction_error_])
  {
    id v5 = [(HAPAccessoryServer *)self delegateQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__HAPAccessoryServerIP__notifyDelegateOfDiscoveryCompletionWithError___block_invoke;
    v6[3] = &unk_1E69F46E0;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __70__HAPAccessoryServerIP__notifyDelegateOfDiscoveryCompletionWithError___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 accessories];
  id v4 = (void *)[v3 copy];
  [v5 accessoryServer:v2 didDiscoverAccessories:v4 transaction:0 error:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateNeedsOwnershipToken
{
  if ([(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServerNeedsOwnershipToken_])
  {
    BOOL v3 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HAPAccessoryServerIP__notifyDelegateNeedsOwnershipToken__block_invoke;
    block[3] = &unk_1E69F4330;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __58__HAPAccessoryServerIP__notifyDelegateNeedsOwnershipToken__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServerNeedsOwnershipToken:*(void *)(a1 + 32)];
}

- (void)_notifyDelegatesOfAddAccessoryFailureWithError:(id)a3
{
  id v4 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:79 reason:0 underlyingError:a3];
  [(HAPAccessoryServerIP *)self setWacComplete:0];
  [(HAPAccessoryServerIP *)self setWacStarted:0];
  [(HAPAccessoryServerIP *)self _notifyDelegatesPairingStopped:v4];
}

- (void)_notifyDelegatesOfConnectionState:(BOOL)a3 withError:(id)a4
{
  id v6 = a4;
  if ([(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServer_didUpdateConnectionState_linkLayerType_bookkeeping_withError_])
  {
    id v7 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HAPAccessoryServerIP__notifyDelegatesOfConnectionState_withError___block_invoke;
    block[3] = &unk_1E69F2938;
    void block[4] = self;
    BOOL v10 = a3;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void __68__HAPAccessoryServerIP__notifyDelegatesOfConnectionState_withError___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = [v2 discoveryBookkeeping];
  [v5 accessoryServer:v2 didUpdateConnectionState:v3 linkLayerType:1 bookkeeping:v4 withError:*(void *)(a1 + 40)];
}

- (void)_notifyDelegatesPairingStopped:(id)a3
{
  id v4 = a3;
  [(HAPAccessoryServerIP *)self setWacStarted:0];
  [(HAPAccessoryServerIP *)self setHasStartedPairing:0];
  [(HAPAccessoryServerIP *)self setHandlingInvalidSetupCode:0];
  [(HAPAccessoryServerIP *)self setPreSoftAuthWacStarted:0];
  [(HAPAccessoryServer *)self setPairingRequest:0];
  if ([(HAPAccessoryServerIP *)self isWacAccessory])
  {
    id v5 = [(HAPAccessoryServerIP *)self hapWACAccessoryClient];
    [v5 dumpStatsWithError:v4];

    if (!v4) {
      [(HAPAccessoryServerIP *)self setWacAccessory:0];
    }
  }
  if ([(HAPAccessoryServerIP *)self _shouldNotifyClientsOfPVFailure:v4]
    && [(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
  {
    id v6 = [(HAPAccessoryServer *)self delegateQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__HAPAccessoryServerIP__notifyDelegatesPairingStopped___block_invoke;
    v7[3] = &unk_1E69F46E0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __55__HAPAccessoryServerIP__notifyDelegatesPairingStopped___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:*(void *)(a1 + 40)];
}

- (void)removeActiveSession:(int64_t)a3
{
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HAPAccessoryServerIP_removeActiveSession___block_invoke;
  v6[3] = &unk_1E69F3A58;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __44__HAPAccessoryServerIP_removeActiveSession___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 368) &= ~*(void *)(a1 + 40);
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HAPStringFromAccessoryServerSession(*(void *)(a1 + 40));
    id v7 = HAPStringFromAccessoryServerSession(*(void *)(*(void *)(a1 + 32) + 368));
    int v15 = 138543874;
    id v16 = v5;
    __int16 v17 = 2112;
    unint64_t v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Removed active session for %@. Current active sessions: %@", (uint8_t *)&v15, 0x20u);
  }
  id v8 = *(void **)(a1 + 32);
  if (v8[46])
  {
    id v9 = (void *)MEMORY[0x1D944E080]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = HAPStringFromAccessoryServerSession(*(void *)(*(void *)(a1 + 32) + 368));
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2112;
      unint64_t v18 = v13;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_INFO, "%{public}@Not enabling connection idle timer due to active sessions: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    [v8 _startConnectionIdleTimer];
  }
  BOOL v14 = [*(id *)(a1 + 32) ipConnectionStatistics];
  [v14 accessoryServerIPEvent:8];
}

- (void)addActiveSession:(int64_t)a3
{
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__HAPAccessoryServerIP_addActiveSession___block_invoke;
  v6[3] = &unk_1E69F3A58;
  void v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

void __41__HAPAccessoryServerIP_addActiveSession___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 368) |= *(void *)(a1 + 40);
  id v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HAPStringFromAccessoryServerSession(*(void *)(a1 + 40));
    id v7 = HAPStringFromAccessoryServerSession(*(void *)(*(void *)(a1 + 32) + 368));
    int v10 = 138543874;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    int v15 = v7;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Added active session for %@. Current active sessions: %@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = *(void **)(a1 + 32);
  if (v8[46])
  {
    [v8 _suspendConnectionIdleTimer];
    id v8 = *(void **)(a1 + 32);
  }
  id v9 = [v8 ipConnectionStatistics];
  [v9 accessoryServerIPEvent:7];
}

- (void)hapWACAccessoryClient:(id)a3 setBonjourInfo:(id)a4
{
}

- (void)hapWACAccessoryClient:(id)a3 wacProgress:(unint64_t)a4
{
  if (a4 - 1 > 2) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = qword_1D4912A00[a4 - 1];
  }
  [(HAPAccessoryServerIP *)self _notifyDelegateOfPairingProgress:v4];
}

- (void)_notifyDelegateOfPairingProgress:(int64_t)a3
{
  uint64_t v5 = [(HAPAccessoryServer *)self delegateQueue];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [(HAPAccessoryServerIP *)self _delegateRespondsToSelector:sel_accessoryServer_updatePairingProgress_];

    if (v7)
    {
      id v8 = [(HAPAccessoryServer *)self delegateQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__HAPAccessoryServerIP__notifyDelegateOfPairingProgress___block_invoke;
      v9[3] = &unk_1E69F3A58;
      void v9[4] = self;
      v9[5] = a3;
      dispatch_async(v8, v9);
    }
  }
}

void __57__HAPAccessoryServerIP__notifyDelegateOfPairingProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) updatePairingProgress:*(void *)(a1 + 40)];
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryServerIP;
  uint64_t v4 = [(HMFObject *)&v14 description];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  id v6 = [(HAPAccessoryServer *)self identifier];
  [v5 appendFormat:@"    Device ID: %@", v6];

  BOOL v7 = [(HAPAccessoryServerIP *)self model];
  [v5 appendFormat:@"    Model: %@", v7];

  id v8 = [(HAPAccessoryServer *)self version];
  id v9 = [v8 versionString];
  [v5 appendFormat:@"    Protocol Version: %@", v9];

  int v10 = [(HAPAccessoryServerIP *)self sourceVersion];
  [v5 appendFormat:@"    Source Version: %@", v10];

  objc_msgSend(v5, "appendFormat:", @"    Config Number: %lu", -[HAPAccessoryServer configNumber](self, "configNumber"));
  objc_msgSend(v5, "appendFormat:", @"    Wake Number: %lu", -[HAPAccessoryServer wakeNumber](self, "wakeNumber"));
  objc_msgSend(v5, "appendFormat:", @"    State Number: %lu", -[HAPAccessoryServer stateNumber](self, "stateNumber"));
  id v11 = [(HAPAccessoryServer *)self category];
  [v5 appendFormat:@"    Category: %@", v11];

  objc_msgSend(v5, "appendFormat:", @"    Status Flags: 0x%x", -[HAPAccessoryServerIP statusFlags](self, "statusFlags"));
  objc_msgSend(v5, "appendFormat:", @"    Compatibility Features: 0x%x", (unsigned __int16)-[HAPAccessoryServer compatibilityFeatures](self, "compatibilityFeatures"));
  __int16 v12 = (void *)[v5 copy];

  return (NSString *)v12;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(HAPAccessoryServerIP *)self _stopReachabilityTimer];
  [(HAPAccessoryServerIP *)self setConnectionIdleTimer:0];
  clientOperationQueue = self->_clientOperationQueue;
  self->_clientOperationQueue = 0;

  if (self->_httpClient)
  {
    uint64_t v4 = (void *)MEMORY[0x1D944E080]();
    uint64_t v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@HTTP client not invalidated - invalidating....", buf, 0xCu);
    }
    [(HAPHTTPClient *)self->_httpClient invalidate];
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerIP;
  [(HAPAccessoryServerIP *)&v9 dealloc];
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAccessoryServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HAPAccessoryServerIP_invalidateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E69F3C68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __56__HAPAccessoryServerIP_invalidateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isWacAccessory]
    && ([*(id *)(a1 + 32) isWacComplete] & 1) == 0)
  {
    [*(id *)(a1 + 32) _invalidateWAC];
  }
  else
  {
    id v2 = (void *)MEMORY[0x1D944E080]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      id v6 = [*(id *)(a1 + 32) httpClient];
      *(_DWORD *)buf = 138543618;
      id v23 = v5;
      __int16 v24 = 2112;
      unint64_t v25 = v6;
      _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Invalidating non WAC server with httpClient: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) _cancelNameResolution];
    BOOL v7 = [*(id *)(a1 + 32) httpClient];
    [v7 invalidate];

    [*(id *)(a1 + 32) setHttpClient:0];
    [*(id *)(a1 + 32) setInvalidated:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = objc_msgSend(*(id *)(a1 + 32), "accessories", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
          objc_super v14 = HMErrorFromHAPErrorCode(32);
          [v13 invalidateWithError:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  [*(id *)(a1 + 32) setDelegate:0 queue:0];
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
  return [*(id *)(a1 + 32) incrementHAPIPInvalidationCount];
}

- (void)_reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944E080](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@*** RESET Called", (uint8_t *)&v10, 0xCu);
  }
  [(HAPAccessoryServerIP *)v4 _tearDownSession];
  [(HAPAccessoryServer *)v4 setAccessories:0];
  v4->_wacAccessory = 0;
  primaryAccessoryForServer = v4->_primaryAccessoryForServer;
  v4->_primaryAccessoryForServer = 0;

  cachedSocketInfo = v4->_cachedSocketInfo;
  v4->_cachedSocketInfo = 0;

  bonjourDeviceInfo = v4->_bonjourDeviceInfo;
  v4->_bonjourDeviceInfo = 0;

  v4->_statusFlags = 0;
}

- (HAPAccessoryServerIP)initWithBonjourDeviceInfo:(id)a3 keyStore:(id)a4 browser:(id)a5 discoveryMethod:(unint64_t)a6
{
  id v11 = a3;
  uint64_t v12 = [(HAPAccessoryServerIP *)self initWithKeyStore:a4 browser:a5 discoveryMethod:a6];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bonjourDeviceInfo, a3);
    v13->_hasUpdatedBonjour = 1;
    v13->_invalidated = 0;
    uint64_t v14 = [v11 objectForKeyedSubscript:@"name"];
    name = v13->super._name;
    v13->super._name = (NSString *)v14;

    if (![(HAPAccessoryServerIP *)v13 _parseAndValidateTXTRecord])
    {

      id v13 = 0;
    }
  }

  return v13;
}

- (NSString)sourceVersion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSString *)self->_sourceVersion copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)setSourceVersion:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  sourceVersion = self->_sourceVersion;
  self->_sourceVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)statusFlags
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t statusFlags = self->_statusFlags;
  os_unfair_lock_unlock(p_lock);
  return statusFlags;
}

- (void)setStatusFlags:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t statusFlags = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSString)model
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSString *)self->_model copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)setModel:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  model = self->_model;
  self->_model = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HAPAccessoryServerIP)initWithKeyStore:(id)a3 browser:(id)a4
{
  return [(HAPAccessoryServerIP *)self initWithKeyStore:a3 browser:a4 discoveryMethod:0];
}

- (HAPAccessoryServerIP)initWithKeyStore:(id)a3 browser:(id)a4 discoveryMethod:(unint64_t)a5
{
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HAPAccessoryServerIP;
  uint64_t v9 = [(HAPAccessoryServer *)&v37 initWithKeystore:a3];
  int v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_browser, v8);
    v10->_retryingPairSetup = 0;
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    queuedOperations = v10->_queuedOperations;
    v10->_queuedOperations = (NSMutableArray *)v11;

    v10->_establishingSecureConnection = 0;
    v10->_hasAttributeDatabase = 0;
    id v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", HAPDispatchQueueName(v10, @"clientOperationQueue"));
    [(NSOperationQueue *)v13 setName:v14];

    [(NSOperationQueue *)v13 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v13 setQualityOfService:25];
    clientOperationQueue = v10->_clientOperationQueue;
    v10->_clientOperationQueue = v13;
    uint64_t v16 = v13;

    long long v17 = [[HAPAuthSession alloc] initWithRole:0 instanceId:0 delegate:v10];
    authSession = v10->_authSession;
    v10->_authSession = v17;

    v10->_authenticated = 0;
    long long v19 = (HMFNetMonitor *)objc_alloc_init(MEMORY[0x1E4F654C8]);
    networkMonitor = v10->_networkMonitor;
    v10->_networkMonitor = v19;

    [(HMFNetMonitor *)v10->_networkMonitor setDelegate:v10];
    v10->_hasUpdatedBonjour = 0;
    reachabilityEventTimer = v10->_reachabilityEventTimer;
    v10->_reachabilityEventTimer = 0;

    v10->_idleTimerActiveSessions = 0;
    reachabilityStartTime = v10->_reachabilityStartTime;
    v10->_reachabilityStartTime = 0;

    cachedSocketInfo = v10->_cachedSocketInfo;
    v10->_cachedSocketInfo = 0;

    __int16 v24 = [[HAPAccessoryServerBookkeeping alloc] initWithDiscoveryMethod:a5];
    discoveryBookkeeping = v10->_discoveryBookkeeping;
    v10->_discoveryBookkeeping = v24;

    uint64_t v26 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v27 = [v26 preferenceForKey:@"reachabilityMinimumPollTimeout"];
    uint64_t v28 = [v27 numberValue];

    [v28 doubleValue];
    v10->_double minimumReachabilityPingInterval = v29;
    __int16 v30 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v31 = [v30 preferenceForKey:@"HAPDefaultIPDisconnectOnIdleTimeoutSeconds"];
    BOOL v32 = [v31 numberValue];
    [v32 doubleValue];
    v10->_disconnectOnIdleTimeout = v33;

    BOOL v34 = [[HAPAccessoryServerIPConnectionStatistics alloc] initWithAccessory:v10];
    ipConnectionStatistics = v10->_ipConnectionStatistics;
    v10->_ipConnectionStatistics = v34;
  }
  return v10;
}

+ (id)sharedPairOperationQueue
{
  if (sharedPairOperationQueue_onceToken != -1) {
    dispatch_once(&sharedPairOperationQueue_onceToken, &__block_literal_global_760);
  }
  id v2 = (void *)sharedPairOperationQueue__sharedQueue;

  return v2;
}

void __48__HAPAccessoryServerIP_sharedPairOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v0 setName:@"com.apple.CoreHAP.pairWACOperationQueue"];
  [v0 setMaxConcurrentOperationCount:1];
  [v0 setQualityOfService:25];
  uint64_t v1 = (void *)sharedPairOperationQueue__sharedQueue;
  sharedPairOperationQueue__sharedQueue = (uint64_t)v0;
}

+ (void)initialize
{
}

- (void)processPendingBonjourRemoveEvents
{
  id v3 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HAPAccessoryServerIP_SessionRestore__processPendingBonjourRemoveEvents__block_invoke;
  block[3] = &unk_1E69F4330;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __73__HAPAccessoryServerIP_SessionRestore__processPendingBonjourRemoveEvents__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) browser];
  id v2 = [*(id *)(a1 + 32) identifier];
  [v3 processPendingBonjourRemoveEventsForDeviceID:v2];
}

- (id)readAndResetHAPMetrics:(BOOL)a3
{
  BOOL v11 = a3;
  void v13[4] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12[0] = &unk_1F2C80898;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_metricHAPIPInvalidationCount];
  v13[0] = v5;
  v12[1] = &unk_1F2C808B0;
  id v6 = [NSNumber numberWithUnsignedInteger:self->_metricHAPIPHTTPRequestsCount];
  v13[1] = v6;
  v12[2] = &unk_1F2C808C8;
  BOOL v7 = [NSNumber numberWithUnsignedInteger:self->_metricHAPIPHTTPResponsesCount];
  v13[2] = v7;
  v12[3] = &unk_1F2C808E0;
  id v8 = [NSNumber numberWithUnsignedInteger:self->_metricHAPIPHTTPEventsCount];
  v13[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  if (v11)
  {
    self->_metricHAPIPHTTPRequestsCount = 0;
    self->_metricHAPIPHTTPResponsesCount = 0;
    self->_metricHAPIPHTTPEventsCount = 0;
    self->_metricHAPIPInvalidationCount = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)incrementHAPIPHTTPEventsCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPHTTPEventsCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPIPHTTPResponsesCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPHTTPResponsesCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPIPHTTPRequestsCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPHTTPRequestsCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPIPInvalidationCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_metricHAPIPInvalidationCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)_requestResource:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  BOOL v11 = [(HAPAccessoryServerIP *)self _isSessionEstablished];
  uint64_t v12 = (void *)MEMORY[0x1D944E080]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  uint64_t v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v44 = v16;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_INFO, "%{public}@Requesting resource", buf, 0xCu);
    }
    long long v17 = NSString;
    v42[0] = @"/";
    v42[1] = @"resource";
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    long long v19 = [v17 pathWithComponents:v18];

    int v20 = [(HAPAccessoryServerIP *)v13 _ensureHTTPClientSetUp];
    if (v20)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_4;
      v29[3] = &unk_1E69F0240;
      id v30 = v10;
      int v31 = v20;
      dispatch_async(v9, v29);
    }
    else
    {
      objc_initWeak((id *)buf, v13);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1220;
      v32[3] = &unk_1E69F0218;
      objc_copyWeak(&v35, (id *)buf);
      double v33 = v9;
      id v34 = v10;
      [(HAPAccessoryServerIP *)v13 sendPOSTRequestToURL:v19 request:v8 serializationType:1 completionHandler:v32];

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v44 = v21;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Secure session not established, establishing lazily and queuing resource request", buf, 0xCu);
    }
    objc_initWeak(&location, v13);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke;
    v36[3] = &unk_1E69F01F0;
    objc_copyWeak(&v40, &location);
    objc_super v37 = v9;
    id v39 = v10;
    id v38 = v8;
    id v22 = (void *)MEMORY[0x1D944E2D0](v36);
    id v23 = (void *)MEMORY[0x1D944E080]();
    __int16 v24 = v13;
    HMFGetOSLogHandle();
    unint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v44 = v26;
      _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Queuing resource request until pair-verify completes", buf, 0xCu);
    }
    uint64_t v27 = [(HAPAccessoryServerIP *)v24 queuedOperations];
    uint64_t v28 = (void *)MEMORY[0x1D944E2D0](v22);
    [v27 addObject:v28];

    [(HAPAccessoryServerIP *)v24 _establishSecureConnectionAndFetchAttributeDatabaseWithReason:@"noSession.hapurl"];
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
}

void __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    id v6 = *(NSObject **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2;
    v7[3] = &unk_1E69F3C68;
    id v9 = *(id *)(a1 + 48);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
  else
  {
    [WeakRetained _requestResource:*(void *)(a1 + 40) queue:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
  }
}

void __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1220(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v10)
  {
    uint64_t v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = WeakRetained;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v15;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Image snapshot returned HTTP client error: %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1221;
    block[3] = &unk_1E69F3C68;
    uint64_t v16 = *(NSObject **)(a1 + 32);
    id v33 = *(id *)(a1 + 40);
    id v32 = v10;
    dispatch_async(v16, block);

    id v17 = v33;
  }
  else if (v9 {
         && a4 == 200
  }
         && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), a3 == 2)
         && (isKindOfClass & 1) != 0)
  {
    id v19 = v9;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2_1222;
    v28[3] = &unk_1E69F3C68;
    int v20 = *(NSObject **)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    id v29 = v19;
    id v30 = v21;
    dispatch_async(v20, v28);

    id v17 = v30;
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:50];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_3;
    v25[3] = &unk_1E69F3C68;
    id v23 = *(NSObject **)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    id v26 = v22;
    id v27 = v24;
    id v17 = v22;
    dispatch_async(v23, v25);
  }
}

void __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  HMErrorFromOSStatus(*(unsigned int *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_1221(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2_1222(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __79__HAPAccessoryServerIP_HTTPActivity___requestResource_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)requestResource:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v13 = NSString;
  uint64_t v14 = MEMORY[0x1D944D460](self, a2);
  uint64_t v15 = [v13 stringWithFormat:@"%@, %s:%ld", v14, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/Servers/HAPAccessoryServerIP.m", 8541];
  uint64_t v16 = (void *)[v12 initWithName:v15];

  id v17 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke;
  block[3] = &unk_1E69F32D8;
  void block[4] = self;
  id v23 = v9;
  id v24 = v10;
  id v25 = v16;
  id v26 = v11;
  id v18 = v11;
  id v19 = v16;
  id v20 = v10;
  id v21 = v9;
  dispatch_async(v17, block);
}

void __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke_2;
  v5[3] = &unk_1E69F2528;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 _requestResource:v3 queue:v4 completionHandler:v5];
}

void __78__HAPAccessoryServerIP_HTTPActivity__requestResource_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 32) markWithReason:@"Calling completion handler"];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
  [*(id *)(a1 + 32) end];
  [*(id *)(a1 + 32) invalidate];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t409 != -1) {
    dispatch_once(&logCategory__hmf_once_t409, &__block_literal_global_1238);
  }
  id v2 = (void *)logCategory__hmf_once_v410;

  return v2;
}

uint64_t __44__HAPAccessoryServerIP_Metrics__logCategory__block_invoke()
{
  logCategory__hmf_once_v410 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

- (void)_cancelNameResolution
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HAPAccessoryServerIP *)self nameResolver];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    uint64_t v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_1D4758000, v7, OS_LOG_TYPE_INFO, "%{public}@Cancelling active name resolution", (uint8_t *)&v10, 0xCu);
    }
    id v9 = [(HAPAccessoryServerIP *)v6 nameResolver];
    [v9 invalidate];

    [(HAPAccessoryServerIP *)v6 setNameResolver:0];
  }
}

- (void)_doResolveWithGroup:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = [(HAPAccessoryServer *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HAPAccessoryServerIP *)self nameResolver];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v26 = v10;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Name resolution already in progress!  Are there multiple outstanding connection requests?", buf, 0xCu);
    }
    dispatch_group_leave(v4);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v12 = [v11 preferenceForKey:@"HAPServerIPServerNameResolutionTimeoutSeconds"];
    uint64_t v13 = [v12 numberValue];

    if (v13) {
      uint64_t v14 = (void *)v13;
    }
    else {
      uint64_t v14 = &unk_1F2C80AF0;
    }
    [v14 doubleValue];
    double v16 = v15;
    id v17 = [(HAPAccessoryServerIP *)self bonjourDeviceInfo];
    id v18 = [v17 objectForKey:@"name"];

    id v19 = [(HAPAccessoryServerIP *)self bonjourDeviceInfo];
    id v20 = [v19 objectForKey:@"serviceType"];

    id v21 = [[HAPNameResolver alloc] initWithDeviceName:v18 serviceType:v20 domain:@"local"];
    [(HAPAccessoryServerIP *)self setNameResolver:v21];

    id v22 = [(HAPAccessoryServerIP *)self nameResolver];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __60__HAPAccessoryServerIP_NameResolution___doResolveWithGroup___block_invoke;
    v23[3] = &unk_1E69F2EB8;
    void v23[4] = self;
    id v24 = v4;
    [v22 resolveWithTimeout:v23 completion:v16];
  }
}

void __60__HAPAccessoryServerIP_NameResolution___doResolveWithGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944E080]([*(id *)(a1 + 32) setNameResolver:0]);
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving updated socket info %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) setCachedSocketInfo:v6];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Name resolution failed: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end