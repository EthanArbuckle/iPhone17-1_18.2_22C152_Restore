@interface _IDSService
+ (_IDSService)serviceWithIdentifier:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 delegateContext:(id)a6 completion:(id)a7;
+ (id)deviceForFromID:(id)a3 fromDevices:(id)a4;
- (BOOL)_canAccount:(id)a3 sendWithFromID:(id)a4;
- (BOOL)_isDroppingMessages;
- (BOOL)canSend;
- (BOOL)canSendMessageWithAccount:(id)a3 toDestination:(id)a4;
- (BOOL)cancelIdentifier:(id)a3 error:(id *)a4;
- (BOOL)cancelMessageWithOptions:(id)a3 destination:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (BOOL)cancelMessageWithOptions:(id)a3 destinations:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (BOOL)cancelMessageWithOptions:(id)a3 identifier:(id *)a4 error:(id *)a5;
- (BOOL)cancelOpportunisticDataWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)getProgressUpdateForIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isPretendingToBeFull;
- (BOOL)manuallyAckMessages;
- (BOOL)needsLaunchOnNearbyDevicesChanged;
- (BOOL)reportSpamMessage:(id)a3;
- (BOOL)sendAccessoryData:(id)a3 toAccessoryID:(id)a4 accessToken:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendAheadGroup:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 completion:(id)a7;
- (BOOL)sendCertifiedDeliveryReceipt:(id)a3;
- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendData:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)sendInvitation:(id)a3 fromAccount:(id)a4 toDestination:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendInvitationUpdate:(id)a3 fromAccount:(id)a4 toDestination:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendOpportunisticData:(id)a3 options:(id)a4 identifier:(id)a5 error:(id *)a6;
- (BOOL)sendProtobuf:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 fromAccount:(id)a5 toDestinations:(id)a6 priority:(int64_t)a7 options:(id)a8 identifier:(id *)a9 error:(id *)a10;
- (BOOL)sendServerMessage:(id)a3 command:(id)a4 fromAccount:(id)a5;
- (BOOL)setWakingPushPriority:(int64_t)a3 error:(id *)a4;
- (BOOL)updateSubServices:(id)a3 forDevice:(id)a4;
- (BOOL)wantsPseudonymUpdates;
- (CUTDeferredTaskQueue)pseudonymUpdateTaskQueue;
- (IDSAccount)iCloudAccount;
- (IDSGroupContextController)groupContextController;
- (IDSServiceProperties)serviceProperties;
- (NSArray)URIs;
- (NSArray)devices;
- (NSDictionary)cachedPseudonymURIMap;
- (NSDictionary)pseudonymURIMap;
- (NSMutableDictionary)completionBlocksByRequestID;
- (NSSet)accounts;
- (NSSet)internalAccounts;
- (NSString)serviceDomain;
- (SEL)protobufActionForType:(unsigned __int16)a3 isResponse:(BOOL)a4;
- (_IDSService)initWithService:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 delegateContext:(id)a6;
- (id)_accountWithURI:(id)a3 orPseudonym:(id)a4;
- (id)_acknowledgementBlockWithDelegateIdentifier:(id)a3;
- (id)_activeDeviceForUniqueID:(id)a3;
- (id)_filteredAccountsFrom:(id)a3;
- (id)_init;
- (id)_initWithDelegateContext:(id)a3;
- (id)_payloadFromDecryptedData:(id)a3;
- (id)_preferredURIForAccount:(id)a3;
- (id)_sendingAccountForAccount:(id)a3;
- (id)_sendingAccountForAccount:(id)a3 destination:(id)a4 fromID:(id)a5;
- (id)daemonController;
- (id)daemonListener;
- (id)datagramChannelForSessionDestination:(id)a3 options:(id)a4 error:(id *)a5;
- (id)datagramChannelForSocketDescriptor:(int)a3 error:(id *)a4;
- (id)datagramConnectionForSessionDestination:(id)a3 error:(id *)a4;
- (id)datagramConnectionForSessionDestination:(id)a3 uid:(unsigned int)a4 error:(id *)a5;
- (id)datagramConnectionForSocketDescriptor:(int)a3 error:(id *)a4;
- (id)deviceForFromID:(id)a3;
- (id)deviceForUniqueID:(id)a3;
- (id)devicesForBTUUID:(id)a3;
- (id)firstRoutableInternetDestinationForSelf;
- (id)groupContextController:(id)a3 accountsForAlises:(id)a4;
- (id)linkedDeviceForFromID:(id)a3 withRelationship:(int64_t)a4;
- (id)linkedDevicesWithRelationship:(int64_t)a3;
- (id)pseudonymForPseudonymURI:(id)a3;
- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5;
- (id)pseudonymsForMaskedURI:(id)a3;
- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4;
- (id)streamConnectionForSessionDestination:(id)a3 error:(id *)a4;
- (id)streamConnectionForSocketDescriptor:(int)a3 error:(id *)a4;
- (id)uriForFromID:(id)a3;
- (int64_t)_messageTypeForCommand:(id)a3;
- (int64_t)maxEffectivePayloadSize;
- (unint64_t)registrationRestrictionReason;
- (void)OTRTestCallback:(id)a3 time:(double)a4 error:(id)a5;
- (void)_callDelegatesForDevicesChanged;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6;
- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7;
- (void)_callDelegatesWithBlock:(id)a3;
- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4;
- (void)_callIsActiveChanged;
- (void)_callLinkedDevicesChanged;
- (void)_calloutPseudonymsDidUpdate;
- (void)_disableAccount:(id)a3;
- (void)_enableAccount:(id)a3;
- (void)_enforceSandboxPolicy;
- (void)_handlePretendingToBeFullWithIdentifier:(id *)a3;
- (void)_loadCachedLinkedDevices;
- (void)_logConnectionMap;
- (void)_processAccountSet:(id)a3;
- (void)_reloadCachedLinkedDevices;
- (void)_sendMissingMessageMetric:(id)a3;
- (void)_setupNewConnectionForAccount:(id)a3;
- (void)_stopAwaitingQuickSwitchAcknowledgementFromDelegateWithIdentifier:(id)a3;
- (void)_tearDownConnectionForUniqueID:(id)a3;
- (void)_updateLinkedDevicesWithDevicesInfo:(id)a3;
- (void)account:(id)a3 pseudonymsChanged:(id)a4;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)connection:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5;
- (void)connection:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6;
- (void)connection:(id)a3 account:(id)a4 sessionInviteReceived:(id)a5 fromID:(id)a6 transportType:(id)a7 options:(id)a8 context:(id)a9 messageContext:(id)a10;
- (void)connection:(id)a3 connectedDevicesChanged:(id)a4;
- (void)connection:(id)a3 devicesChanged:(id)a4;
- (void)connection:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6;
- (void)connection:(id)a3 didFlushCacheForKTPeerURI:(id)a4;
- (void)connection:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6;
- (void)connection:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4;
- (void)connection:(id)a3 didSendOpportunisticDataWithIdentifier:(id)a4 toIDs:(id)a5;
- (void)connection:(id)a3 identifier:(id)a4 alternateCallbackID:(id)a5 willSendToDestinations:(id)a6 skippedDestinations:(id)a7 registrationPropertyToDestinations:(id)a8;
- (void)connection:(id)a3 identifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6 context:(id)a7;
- (void)connection:(id)a3 identifier:(id)a4 fromURI:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)connection:(id)a3 incomingAccessoryData:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingAccessoryReportMessage:(id)a4 accessoryID:(id)a5 controllerID:(id)a6 context:(id)a7;
- (void)connection:(id)a3 incomingData:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingEngramMessage:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingGroupData:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingInvitation:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingInvitationUpdate:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingMessage:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingOpportunisticData:(id)a4 withIdentifier:(id)a5 fromURI:(id)a6 context:(id)a7;
- (void)connection:(id)a3 incomingPendingMessageFromURI:(id)a4 context:(id)a5;
- (void)connection:(id)a3 incomingPendingResourceWithMetadata:(id)a4 guid:(id)a5 fromURI:(id)a6 context:(id)a7;
- (void)connection:(id)a3 incomingProtobuf:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)connection:(id)a3 incomingTopLevelMessage:(id)a4 fromURI:(id)a5 messageContext:(id)a6;
- (void)connection:(id)a3 isActiveChanged:(BOOL)a4;
- (void)connection:(id)a3 messageIdentifier:(id)a4 alternateCallbackID:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 messageContext:(id)a9;
- (void)connection:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)daemonConnected;
- (void)daemonDisconnected;
- (void)dealloc;
- (void)didSwitchActivePairedDevice:(id)a3 forService:(id)a4 wasHandled:(BOOL *)a5;
- (void)finishedProvisioningPseudonym:(id)a3 success:(BOOL)a4 error:(id)a5 forRequestUUID:(id)a6;
- (void)finishedRenewingPseudonym:(id)a3 success:(BOOL)a4 error:(id)a5 requestUUID:(id)a6;
- (void)finishedReportingRequestUUID:(id)a3 withError:(id)a4;
- (void)finishedRevokingPseudonymWithSuccess:(BOOL)a3 error:(id)a4 requestUUID:(id)a5;
- (void)finishedSigningForRequest:(id)a3 signedData:(id)a4 error:(id)a5;
- (void)finishedVerifyingSignedDataForRequest:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)groupContextController:(id)a3 didCreateGroup:(id)a4;
- (void)performGroupTask:(id)a3;
- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6;
- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completion:(id)a6;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6;
- (void)resendSubServicesToDaemonForCurrentDevice;
- (void)revokePseudonym:(id)a3 requestProperties:(id)a4 completion:(id)a5;
- (void)scheduleTransactionLogTask:(id)a3;
- (void)sendAckForMessageWithContext:(id)a3;
- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sendServiceUpdateMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)service:(id)a3 linkedDevicesUpdated:(id)a4;
- (void)service:(id)a3 restrictionReasonChanged:(unint64_t)a4;
- (void)service:(id)a3 tinkerDeviceAdded:(id)a4;
- (void)service:(id)a3 tinkerDeviceRemoved:(id)a4;
- (void)service:(id)a3 tinkerDeviceUpdated:(id)a4;
- (void)setCachedPseudonymURIMap:(id)a3;
- (void)setCompletionBlocksByRequestID:(id)a3;
- (void)setLinkPreferences:(id)a3;
- (void)setManuallyAckMessages:(BOOL)a3;
- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3;
- (void)setPreferInfraWiFi:(BOOL)a3;
- (void)setPretendingToBeFull:(BOOL)a3;
- (void)setProtobufAction:(SEL)a3 forProtobufType:(unsigned __int16)a4 isResponse:(BOOL)a5;
- (void)setPseudonymUpdateTaskQueue:(id)a3;
- (void)setWantsPseudonymUpdates:(BOOL)a3;
- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 options:(id)a5 completion:(id)a6;
- (void)startOTRTest:(int64_t)a3;
- (void)testCloudQRConnection;
- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 options:(id)a7 completion:(id)a8;
@end

@implementation _IDSService

- (id)daemonListener
{
  v2 = +[IDSDaemonController sharedInstance];
  v3 = [v2 listener];

  return v3;
}

- (void)_logConnectionMap
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3B218();
    }
  }
  v6 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Connection map:", v7, 2u);
  }

  [(NSMutableDictionary *)self->_uniqueIDToConnection enumerateKeysAndObjectsUsingBlock:&unk_1EE245CA8];
}

- (NSArray)devices
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CDE8();
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = [(_IDSService *)self accounts];
  uint64_t v44 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v62;
    id v46 = v7;
    id v47 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v62 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v8;
        v9 = *(void **)(*((void *)&v61 + 1) + 8 * v8);
        v10 = [v9 _internal];
        v11 = [v10 lastGDRDate];

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        v12 = [v9 _internal];
        v13 = [v12 devices];

        id v49 = v13;
        uint64_t v51 = [v13 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v51)
        {
          uint64_t v50 = *(void *)v58;
          v48 = v11;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v58 != v50) {
                objc_enumerationMutation(v49);
              }
              v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              v16 = [v15 _internal];
              v17 = [v16 uniqueIDOverride];

              if (![v17 length])
              {
                v18 = [v15 _internal];
                uint64_t v19 = [v18 uniqueID];

                v17 = (void *)v19;
              }
              if ([v17 length])
              {
                v20 = [v6 objectForKey:v17];
                v21 = [v7 objectForKey:v17];
              }
              else
              {
                v20 = 0;
                v21 = 0;
              }
              if ([v17 length])
              {
                v22 = 0;
              }
              else
              {
                v23 = [v15 _internal];
                v22 = [v23 pushToken];

                if ([v22 length])
                {
                  uint64_t v24 = [v6 objectForKey:v22];

                  uint64_t v25 = [v7 objectForKey:v22];
                  v26 = v21;
                  v21 = (void *)v25;

                  v20 = (void *)v24;
                }
              }
              if (!v20) {
                goto LABEL_27;
              }
              v52 = v21;
              v27 = [v11 laterDate:v21];
              int v28 = [v27 isEqualToDate:v11];

              if (v28)
              {

                v21 = v52;
LABEL_27:
                if ([v17 length])
                {
                  if (v15) {
                    CFDictionarySetValue((CFMutableDictionaryRef)v6, v17, v15);
                  }
                  if (v11)
                  {
                    v29 = (__CFDictionary *)v7;
                    v30 = v17;
                    goto LABEL_45;
                  }
                }
                else if ([v22 length])
                {
                  if (v15) {
                    CFDictionarySetValue((CFMutableDictionaryRef)v6, v22, v15);
                  }
                  if (v11)
                  {
                    v29 = (__CFDictionary *)v7;
                    v30 = v22;
LABEL_45:
                    CFDictionarySetValue(v29, v30, v11);
                  }
                }
                v20 = 0;
                goto LABEL_47;
              }
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              v31 = [v15 _internal];
              v32 = [v31 identities];

              uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v65 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v54;
                do
                {
                  for (uint64_t j = 0; j != v34; ++j)
                  {
                    if (*(void *)v54 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8 * j);
                    v38 = [v20 _internal];
                    [v38 _addIdentity:v37];
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v65 count:16];
                }
                while (v34);
              }

              id v7 = v46;
              id v6 = v47;
              v11 = v48;
              v21 = v52;
LABEL_47:
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v57 objects:v66 count:16];
          }
          while (v51);
        }

        uint64_t v8 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v44);
  }

  v39 = [v6 allValues];
  v40 = (void *)[v39 copy];

  return (NSArray *)v40;
}

- (id)_filteredAccountsFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = +[IDSInternalQueueController sharedInstance];
  int v5 = [v4 assertQueueIsCurrent];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A3CC20();
    }
  }
  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v35;
    v13 = &off_1E5728000;
    *(void *)&long long v10 = 138413058;
    long long v30 = v10;
    id v31 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "_internal", v30);
        int v17 = [v16 isTransientAllowlistedAccount];

        if (v17
          || ([v15 _internal],
              v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 canSend],
              v18,
              v19))
        {
          [v7 addObject:v15];
        }
        else
        {
          v20 = [v13[189] _IDSService];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = [v15 _internal];
            v32 = (void *)v21;
            uint64_t v33 = [v15 _internal];
            v22 = [v33 aliases];
            v23 = [v15 _internal];
            uint64_t v24 = v7;
            if ([v23 isActive]) {
              uint64_t v25 = @"YES";
            }
            else {
              uint64_t v25 = @"NO";
            }
            v26 = [v15 _internal];
            int v27 = [v26 canSend];
            *(_DWORD *)buf = v30;
            int v28 = @"NO";
            if (v27) {
              int v28 = @"YES";
            }
            uint64_t v39 = v21;
            __int16 v40 = 2112;
            v41 = v22;
            __int16 v42 = 2112;
            uint64_t v43 = v25;
            id v7 = v24;
            __int16 v44 = 2112;
            uint64_t v45 = v28;
            _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_INFO, "Filtering account %@ with aliases %@  isActive? %@  canSend? %@", buf, 0x2Au);

            id v8 = v31;
            v13 = &off_1E5728000;
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v11);
  }

  return v7;
}

- (NSSet)accounts
{
  id v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CCB8();
    }
  }
  id v6 = [(IDSAccountController *)self->_accountController _internal];
  id v7 = [v6 accounts];

  id v8 = [(_IDSService *)self _filteredAccountsFrom:v7];

  return (NSSet *)v8;
}

- (void)_enforceSandboxPolicy
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Enforcing sandbox policy...", (uint8_t *)&v14, 2u);
  }

  getpid();
  int v4 = CUTProcessNameForPid();
  int v5 = v4;
  if (self->_clientIsSandboxed)
  {
    id v6 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IDSServiceProperties *)self->_serviceProperties serviceName];
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      int v17 = v7;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "%@ (initializing service %@) is sandboxed", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = qword_1EB2BD718;
    id v9 = v4;
    if (v8 != -1) {
      dispatch_once(&qword_1EB2BD718, &unk_1EE247048);
    }
    int v10 = [(id)qword_1EB2BD720 containsObject:v9];

    uint64_t v11 = +[IDSLogging _IDSService];
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [(IDSServiceProperties *)self->_serviceProperties serviceName];
        int v14 = 138412546;
        id v15 = v9;
        __int16 v16 = 2112;
        int v17 = v13;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "%@ (initializing service %@) is not sandboxed but is in the sandbox allowlist.  Not enforcing sandbox policy.", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A3E8CC((uint64_t)v9, (uint64_t)self);
      }

      if (!isRunningTests()) {
        abort();
      }
      throwsIDSAbortException();
    }
  }
}

- (_IDSService)initWithService:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 delegateContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!_IDSRunningInDaemon())
  {
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v47 = _os_activity_create(&dword_19190B000, "Framework init with service, commands", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(v47, &state);
    id v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      int v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [MEMORY[0x1E4F29060] callStackSymbols];
        objc_claimAutoreleasedReturnValue();
        sub_191A3AD44();
      }
    }
    v45.receiver = self;
    v45.super_class = (Class)_IDSService;
    self = [(_IDSService *)&v45 init];
    if (!self) {
      goto LABEL_22;
    }
    uint64_t v18 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = @"NO";
      *(_DWORD *)buf = 134218754;
      id v49 = self;
      if (v7) {
        int v19 = @"YES";
      }
      __int16 v50 = 2112;
      id v51 = v10;
      __int16 v52 = 2112;
      id v53 = v11;
      __int16 v54 = 2112;
      long long v55 = v19;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "_IDSService - initing {self: %p, service: %@, commands: %@, manualAck: %@}", buf, 0x2Au);
    }

    v20 = (IDSServiceProperties *)[objc_alloc(MEMORY[0x1E4F6B5A0]) initWithServiceIdentifier:v10];
    serviceProperties = self->_serviceProperties;
    self->_serviceProperties = v20;

    if (!self->_serviceProperties)
    {
      __int16 v42 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_191A3ACDC();
      }

      int v14 = 0;
      goto LABEL_26;
    }
    v22 = [MEMORY[0x1E4F6C360] sharedInstance];
    if ([v22 isInternalInstall] && (_os_feature_enabled_impl() & 1) == 0)
    {
      char v44 = [v10 containsString:@"com.apple.private.alloy.accessibility.local"];

      if ((v44 & 1) == 0)
      {
        getpid();
        self->_clientIsSandboxed = sandbox_check() != 0;
        [(_IDSService *)self _enforceSandboxPolicy];
        goto LABEL_19;
      }
    }
    else
    {
    }
    self->_clientIsSandboxed = 1;
LABEL_19:
    v23 = [MEMORY[0x1E4F59E30] weakRefWithObject:v12];
    id delegateContext = self->_delegateContext;
    self->_id delegateContext = v23;

    uint64_t v25 = (NSSet *)[v11 copy];
    commands = self->_commands;
    self->_commands = v25;

    int v27 = [[IDSAccountController alloc] _initWithService:v10];
    accountController = self->_accountController;
    self->_accountController = v27;

    v29 = [(IDSAccountController *)self->_accountController _internal];
    long long v30 = +[IDSInternalQueueController sharedInstance];
    id v31 = [v30 queue];
    [v29 addDelegate:self queue:v31];

    lastIsActiveSet = self->_lastIsActiveSet;
    self->_lastIsActiveSet = 0;

    uint64_t v33 = [IDSGroupContextController alloc];
    uint64_t v34 = +[IDSInternalQueueController sharedInstance];
    long long v35 = [(id)v34 queue];
    long long v36 = [(IDSGroupContextController *)v33 initWithServiceName:v10 queue:v35 delegate:self];
    groupContextController = self->_groupContextController;
    self->_groupContextController = v36;

    v38 = objc_alloc_init(IDSQuickSwitchAcknowledgementTracker);
    acknowledgementTracker = self->_acknowledgementTracker;
    self->_acknowledgementTracker = v38;

    self->_manuallyAckMessages = v7;
    __int16 v40 = [MEMORY[0x1E4F6C360] sharedInstance];
    LOBYTE(v34) = [v40 isNonUIInstall];

    if ((v34 & 1) == 0) {
      [(_IDSService *)self _processAccountSet:0];
    }
    v41 = [(_IDSService *)self daemonListener];
    [v41 addHandler:self];

LABEL_22:
    int v14 = self;
LABEL_26:
    os_activity_scope_leave(&state);
    cut_arc_os_release();

    goto LABEL_27;
  }
  v13 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_191A3AC50();
  }

  int v14 = 0;
LABEL_27:

  return v14;
}

- (void)_processAccountSet:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  if ((v6 & 1) == 0)
  {
    BOOL v7 = +[IDSInternalQueueController sharedInstance];
    int v8 = [v7 assertQueueIsCurrent];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_191A3B3E0();
      }
    }
    context = (void *)MEMORY[0x192FE0160]();
    if (!v4 || (id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v4]) == 0)
    {
      id v11 = [(IDSAccountController *)self->_accountController _internal];
      id v12 = [v11 accounts];
      if (v12)
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        int v14 = [(IDSAccountController *)self->_accountController _internal];
        id v15 = [v14 accounts];
        id v10 = (void *)[v13 initWithSet:v15];
      }
      else
      {
        id v10 = 0;
      }
    }
    id v44 = v4;
    int v16 = (void *)MEMORY[0x1E4F1CAD0];
    int v17 = [(NSMutableDictionary *)self->_uniqueIDToConnection allKeys];
    objc_super v45 = [v16 setWithArray:v17];

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
    int v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v20 = v10;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v56 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v26 = [v25 _internal];
          int v27 = [v26 uniqueID];

          if (v27)
          {
            [v19 addObject:v27];
            [v18 setObject:v25 forKey:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v22);
    }

    int v28 = (void *)[v45 mutableCopy];
    [v28 minusSet:v19];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(v29);
          }
          [(_IDSService *)self _tearDownConnectionForUniqueID:*(void *)(*((void *)&v51 + 1) + 8 * j)];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v31);
    }

    if (![(NSMutableDictionary *)self->_uniqueIDToConnection count])
    {
      uniqueIDToConnection = self->_uniqueIDToConnection;
      self->_uniqueIDToConnection = 0;
    }
    long long v35 = (void *)[v19 mutableCopy];
    [v35 minusSet:v45];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v36 = v35;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v48 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = [v18 objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * k)];
          [(_IDSService *)self _setupNewConnectionForAccount:v41];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v38);
    }

    __int16 v42 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "Finished processing accounts set.", buf, 2u);
    }

    [(_IDSService *)self _logConnectionMap];
    id v4 = v44;
  }
}

- (id)daemonController
{
  return +[IDSDaemonController sharedInstance];
}

- (id)_initWithDelegateContext:(id)a3
{
  id v4 = a3;
  int v5 = [(_IDSService *)self _init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F59E30] weakRefWithObject:v4];
    BOOL v7 = (void *)v5[5];
    v5[5] = v6;
  }
  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_IDSService;
  return [(_IDSService *)&v3 init];
}

+ (_IDSService)serviceWithIdentifier:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 delegateContext:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    if (_IDSRunningInDaemon())
    {
      id v15 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_191A3AB30();
      }

      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    }
    else
    {
      int v16 = +[IDSInternalQueueController sharedInstance];
      int v17 = [v16 assertQueueIsCurrent];

      if (v17)
      {
        uint64_t v18 = [MEMORY[0x1E4F6B460] utilities];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_191A3ABB8();
        }
      }
      int v19 = [[_IDSService alloc] initWithService:v11 commands:v12 manuallyAckMessages:v9 delegateContext:v13];
      id v20 = +[IDSDaemonController sharedInstance];
      [v20 blockUntilConnected];

      uint64_t v21 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 134217984;
        uint64_t v24 = v19;
        _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "_IDSService - serviceWithIdentifier finished {serviceObject: %p}", (uint8_t *)&v23, 0xCu);
      }

      (*((void (**)(id, _IDSService *, void))v14 + 2))(v14, v19, 0);
    }
  }

  return result;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  int v8 = _os_activity_create(&dword_19190B000, "Framework init with service commands", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  objc_super v3 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSServiceProperties *)self->_serviceProperties serviceName];
    *(_DWORD *)buf = 134218242;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "_IDSService - deallocing {self: %p, serviceName: %@}", buf, 0x16u);
  }
  int v5 = [(_IDSService *)self daemonListener];
  [v5 removeHandler:self];

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  v6.receiver = self;
  v6.super_class = (Class)_IDSService;
  [(_IDSService *)&v6 dealloc];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3AD98();
    }
  }
  if (v6 && v7)
  {
    __int16 v11 = [(NSMapTable *)self->_delegateToInfo objectForKey:v6];

    if (!v11)
    {
      if (!self->_delegateToInfo)
      {
        id v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        delegateToInfo = self->_delegateToInfo;
        self->_delegateToInfo = v12;
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F6B420]);
      [v14 setQueue:v7];
      [(NSMapTable *)self->_delegateToInfo setObject:v14 forKey:v6];
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1919B75F8;
    v17[3] = &unk_1E5729000;
    v17[4] = self;
    uint64_t v15 = MEMORY[0x192FE03B0](v17);
    int v16 = (void *)v15;
    if (v15) {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(IDSQuickSwitchAcknowledgementTracker *)self->_acknowledgementTracker identifierForServiceDelegate:v4];
    if (v5) {
      [(_IDSService *)self _stopAwaitingQuickSwitchAcknowledgementFromDelegateWithIdentifier:v5];
    }
    [(NSMapTable *)self->_delegateToInfo removeObjectForKey:v4];
    if (![(NSMapTable *)self->_delegateToInfo count])
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;
    }
    id v7 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(IDSServiceProperties *)self->_serviceProperties serviceName];
      int v9 = 134218498;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2048;
      id v14 = v4;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "_IDSService - removed delegate {self: %p, serviceName %@, delegate: %p}", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)_callDelegatesWithBlock:(id)a3
{
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  long long v49 = (void (**)(id, uint64_t))a4;
  id v12 = a5;
  long long v48 = (void (**)(id, uint64_t))a6;
  __int16 v13 = a7;
  id v14 = v13;
  long long v50 = (void (**)(void, void))v12;
  if (v12)
  {
    group = v13;
    uint64_t v15 = +[IDSInternalQueueController sharedInstance];
    int v16 = [v15 assertQueueIsCurrent];

    if (v16)
    {
      int v17 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_191A3AE30();
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    context = (void *)MEMORY[0x192FE0160]();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v20 = self->_delegateToInfo;
    uint64_t v21 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v26 = [(NSMapTable *)self->_delegateToInfo objectForKey:v25];
          int v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (!v28 && (!a3 || (objc_opt_respondsToSelector() & 1) != 0))
          {
            [v18 addObject:v25];
            [v19 addObject:v27];
          }
        }
        uint64_t v22 = [(NSMapTable *)v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v22);
    }

    id v14 = group;
    if ([v18 count])
    {
      char v29 = 1;
      do
      {
        uint64_t v30 = (void *)MEMORY[0x192FE0160]();
        uint64_t v31 = [v18 objectAtIndex:0];
        uint64_t v32 = [v19 objectAtIndex:0];
        [v18 removeObjectAtIndex:0];
        [v19 removeObjectAtIndex:0];
        uint64_t v33 = [v18 count];
        uint64_t v34 = [v32 queue];
        if (v14) {
          dispatch_group_enter(v14);
        }
        long long v35 = +[IDSInternalQueueController sharedInstance];
        id v36 = [v35 queue];

        if (v34 == v36)
        {
          if (a3)
          {
            id v14 = group;
            if (v49 != 0 && (v29 & 1) != 0) {
              v49[2](v49, 1);
            }
            ((void (**)(void, void *))v50)[2](v50, v31);
            if (v48 && !v33) {
              v48[2](v48, 1);
            }
          }
          else
          {
            ((void (**)(void, void *))v50)[2](v50, v31);
            id v14 = group;
          }
          id v43 = self;
          id v44 = self;
          if (!v14) {
            goto LABEL_42;
          }
        }
        else if (v34)
        {
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = sub_1919B87C4;
          v52[3] = &unk_1E572B330;
          SEL v58 = a3;
          char v59 = v29 & 1;
          long long v55 = v49;
          long long v56 = v50;
          id v53 = v31;
          BOOL v60 = v33 == 0;
          long long v57 = v48;
          id v54 = v32;
          uint64_t v37 = (void *)MEMORY[0x192FE03B0](v52);
          uint64_t v38 = v37;
          if (v34 == MEMORY[0x1E4F14428]) {
            dispatch_block_t v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
          }
          else {
            dispatch_block_t v39 = (dispatch_block_t)[v37 copy];
          }
          __int16 v42 = v39;

          id v14 = group;
          if (group) {
            dispatch_group_async(group, v34, v42);
          }
          else {
            dispatch_async(v34, v42);
          }

          if (!group) {
            goto LABEL_42;
          }
        }
        else
        {
          id v40 = self;
          id v41 = self;
          id v14 = group;
          if (!group) {
            goto LABEL_42;
          }
        }
        dispatch_group_leave(v14);
LABEL_42:

        char v29 = 0;
      }
      while ([v18 count]);
    }
    id v45 = self;
    id v46 = self;
  }
}

- (void)daemonConnected
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  int v8 = _os_activity_create(&dword_19190B000, "Framework Daemon Connected", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F29060] callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_191A3AEC8();
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919B8A1C;
  v6[3] = &unk_1E572C1E8;
  v6[4] = self;
  [(_IDSService *)self _callDelegatesWithBlock:v6];
  if (self->_subServices) {
    [(_IDSService *)self resendSubServicesToDaemonForCurrentDevice];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)daemonDisconnected
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = self->_completionBlocksByRequestID;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_completionBlocksByRequestID, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        uint64_t v9 = [v8 second];

        if (v9) {
          v9[2](v9);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_completionBlocksByRequestID removeAllObjects];
}

- (void)OTRTestCallback:(id)a3 time:(double)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    long long v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A3AF1C();
    }
  }
  long long v13 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2048;
    double v25 = a4;
    __int16 v26 = 1024;
    BOOL v27 = v9 == 0;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "%@: OTRTestCallback: token is %@, setupTime is %.6f, error==nil is %d", buf, 0x26u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1919B8DA8;
  v16[3] = &unk_1E572C210;
  v16[4] = self;
  id v17 = v8;
  double v19 = a4;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  [(_IDSService *)self _callDelegatesWithBlock:v16];
}

- (void)connection:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6
{
  BOOL v7 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  int v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    long long v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3AFB4();
    }
  }
  id v14 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = @"NO";
    *(_DWORD *)buf = 138413058;
    id v23 = self;
    if (v7) {
      id v15 = @"YES";
    }
    __int16 v24 = 2112;
    double v25 = v15;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "%@: didCancelMessageWithSuccess: %@ error: %@ identifier %@", buf, 0x2Au);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1919B9008;
  v18[3] = &unk_1E572C238;
  BOOL v21 = v7;
  v18[4] = self;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  [(_IDSService *)self _callDelegatesWithBlock:v18];
}

- (void)didSwitchActivePairedDevice:(id)a3 forService:(id)a4 wasHandled:(BOOL *)a5
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  long long v47 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v49 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3B04C();
    }
  }
  int v11 = [(IDSAccountController *)self->_accountController _internal];
  long long v48 = [v11 serviceName];

  int v12 = [MEMORY[0x1E4F6C3B8] ACKTracker];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v48;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v49;
    *(_WORD *)&buf[22] = 2112;
    v113 = v47;
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "%@ Switched active paired device for service name %@. deviceUniqueID: %@", buf, 0x20u);
  }

  if ([v48 isEqualToIgnoringCase:v49])
  {
    if (a5) {
      *a5 = 1;
    }
    [(IDSQuickSwitchAcknowledgementTracker *)self->_acknowledgementTracker stopAwaitingAcknowledgementFromAllServiceDelegates];
    long long v13 = [self->_delegateContext object];
    v110[0] = 0;
    v110[1] = v110;
    v110[2] = 0x2020000000;
    char v111 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v113 = sub_191918760;
    v114 = sub_1919185D0;
    id v115 = (id)0xAAAAAAAAAAAAAAAALL;
    id v115 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = sub_1919B9A8C;
    v103[3] = &unk_1E572C260;
    v108 = buf;
    v109 = v110;
    id v14 = v48;
    id v104 = v14;
    id v15 = v13;
    id v105 = v15;
    v106 = self;
    id v107 = v49;
    id v16 = (void *)MEMORY[0x192FE03B0](v103);
    id v17 = dispatch_group_create();
    dispatch_group_enter(v17);
    v101[0] = 0;
    v101[1] = v101;
    v101[2] = 0x2020000000;
    char v102 = 0;
    v99[0] = 0;
    v99[1] = v99;
    v99[2] = 0x3032000000;
    v99[3] = sub_191918760;
    v99[4] = sub_1919185D0;
    id v100 = 0;
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = sub_1919B9C9C;
    v92[3] = &unk_1E572C288;
    id v18 = v14;
    id v93 = v18;
    id v19 = v16;
    id v96 = v19;
    id v20 = v47;
    v97 = v101;
    v98 = v99;
    v94 = v20;
    v95 = self;
    id v43 = (void *)MEMORY[0x192FE03B0](v92);
    BOOL v21 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = sub_1919B9E70;
    v87[3] = &unk_1E572C2B0;
    v87[4] = self;
    id v42 = v21;
    id v88 = v42;
    id v22 = v18;
    id v89 = v22;
    v91 = v99;
    id v23 = v15;
    id v90 = v23;
    id v44 = (void *)MEMORY[0x192FE03B0](v87);
    [(_IDSService *)self _callDelegatesRespondingToSelector:sel_service_didSwitchActivePairedDevice_acknowledgementBlock_ withPreCallbacksBlock:v43 callbackBlock:v44 postCallbacksBlock:0 group:v17];
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    char v86 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = sub_191918760;
    v83[4] = sub_1919185D0;
    id v84 = 0;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = sub_1919B9FC4;
    v76[3] = &unk_1E572C288;
    id v24 = v22;
    id v77 = v24;
    id v25 = v19;
    id v80 = v25;
    __int16 v26 = v20;
    v78 = v26;
    v81 = v85;
    v82 = v83;
    id v27 = v23;
    id v79 = v27;
    id v45 = (void *)MEMORY[0x192FE03B0](v76);
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = sub_1919BA0C8;
    v72[3] = &unk_1E572C2D8;
    id v28 = v24;
    id v73 = v28;
    v75 = v83;
    id v29 = v27;
    id v74 = v29;
    id v46 = (void *)MEMORY[0x192FE03B0](v72);
    [(_IDSService *)self _callDelegatesRespondingToSelector:sel_service_devicesChanged_ withPreCallbacksBlock:v45 callbackBlock:v46 postCallbacksBlock:0 group:v17];
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    char v71 = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x3032000000;
    v68[3] = sub_191918760;
    v68[4] = sub_1919185D0;
    id v69 = 0;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = sub_1919BA1C4;
    v61[3] = &unk_1E572C288;
    id v30 = v28;
    id v62 = v30;
    id v31 = v25;
    id v65 = v31;
    uint64_t v32 = v26;
    long long v63 = v32;
    uint64_t v66 = v70;
    v67 = v68;
    id v33 = v29;
    id v64 = v33;
    uint64_t v34 = (void *)MEMORY[0x192FE03B0](v61);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = sub_1919BA2CC;
    v57[3] = &unk_1E572C2D8;
    id v35 = v30;
    id v58 = v35;
    BOOL v60 = v68;
    id v36 = v33;
    id v59 = v36;
    uint64_t v37 = (void *)MEMORY[0x192FE03B0](v57);
    [(_IDSService *)self _callDelegatesRespondingToSelector:sel_service_linkedDevicesChanged_ withPreCallbacksBlock:v34 callbackBlock:v37 postCallbacksBlock:0 group:v17];
    uint64_t v38 = +[IDSInternalQueueController sharedInstance];
    dispatch_block_t v39 = [v38 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919BA3C8;
    block[3] = &unk_1E572C300;
    id v51 = v35;
    id v53 = v31;
    long long v52 = v32;
    id v54 = v99;
    long long v55 = v83;
    long long v56 = buf;
    id v40 = v31;
    dispatch_group_notify(v17, v39, block);

    dispatch_group_leave(v17);
    _Block_object_dispose(v68, 8);

    _Block_object_dispose(v70, 8);
    _Block_object_dispose(v83, 8);

    _Block_object_dispose(v85, 8);
    _Block_object_dispose(v99, 8);

    _Block_object_dispose(v101, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v110, 8);
  }
  else
  {
    id v41 = [MEMORY[0x1E4F6C3B8] ACKTracker];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v49;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v48;
      _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, "Ignoring didSwitch callback for %@, mine is %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = 0;
    }
  }
}

- (id)_activeDeviceForUniqueID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3B0E8();
    }
  }
  if (v4)
  {
    [(_IDSService *)self linkedDevicesWithRelationship:3];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "uniqueID", (void)v19);
          if ([v14 isEqualToIgnoringCase:v4])
          {

LABEL_19:
            id v17 = v13;
            goto LABEL_20;
          }
          id v15 = [v13 uniqueIDOverride];
          char v16 = [v15 isEqualToIgnoringCase:v4];

          if (v16) {
            goto LABEL_19;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        id v17 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_20:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_acknowledgementBlockWithDelegateIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = sub_1919BA79C;
  id v14 = &unk_1E57291B8;
  id v15 = v5;
  id v16 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = (void *)MEMORY[0x192FE03B0](&v11);
  uint64_t v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

- (void)_stopAwaitingQuickSwitchAcknowledgementFromDelegateWithIdentifier:(id)a3
{
}

- (BOOL)_isDroppingMessages
{
  return MEMORY[0x1F4181798](self->_acknowledgementTracker, sel_isAwaitingAcknowledgement);
}

- (void)_callLinkedDevicesChanged
{
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3B180();
    }
  }
  id v6 = (void *)[(NSMutableArray *)self->_linkedDevices copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919BA950;
  v8[3] = &unk_1E572C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(_IDSService *)self _callDelegatesWithBlock:v8];
}

- (void)service:(id)a3 tinkerDeviceAdded:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(_IDSService *)self accounts];
  id v7 = [v6 anyObject];
  id v8 = [v7 serviceName];
  int v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6C3B8] accountEnabled];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ tinkerDeviceAdded (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [(_IDSService *)self daemonListener];
    long long v13 = [v12 linkedDevicesForService:v5];

    [(_IDSService *)self _updateLinkedDevicesWithDevicesInfo:v13];
    [(_IDSService *)self _callLinkedDevicesChanged];
    id v14 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSMutableArray *)self->_linkedDevices __imArrayByApplyingBlock:&unk_1EE246788];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)service:(id)a3 tinkerDeviceRemoved:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(_IDSService *)self accounts];
  id v7 = [v6 anyObject];
  id v8 = [v7 serviceName];
  int v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6C3B8] accountEnabled];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ tinkerDeviceRemoved (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [(_IDSService *)self daemonListener];
    long long v13 = [v12 linkedDevicesForService:v5];

    [(_IDSService *)self _updateLinkedDevicesWithDevicesInfo:v13];
    [(_IDSService *)self _callLinkedDevicesChanged];
    id v14 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSMutableArray *)self->_linkedDevices __imArrayByApplyingBlock:&unk_1EE245C28];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)service:(id)a3 tinkerDeviceUpdated:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(_IDSService *)self accounts];
  id v7 = [v6 anyObject];
  id v8 = [v7 serviceName];
  int v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6C3B8] accountEnabled];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ tinkerDeviceUpdated (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [(_IDSService *)self daemonListener];
    long long v13 = [v12 linkedDevicesForService:v5];

    [(_IDSService *)self _updateLinkedDevicesWithDevicesInfo:v13];
    [(_IDSService *)self _callLinkedDevicesChanged];
    id v14 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSMutableArray *)self->_linkedDevices __imArrayByApplyingBlock:&unk_1EE245C48];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)service:(id)a3 linkedDevicesUpdated:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(_IDSService *)self accounts];
  id v7 = [v6 anyObject];
  id v8 = [v7 serviceName];
  int v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6C3B8] accountEnabled];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ linkedDevicesUpdated (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [(_IDSService *)self daemonListener];
    long long v13 = [v12 linkedDevicesForService:v5];

    [(_IDSService *)self _updateLinkedDevicesWithDevicesInfo:v13];
    [(_IDSService *)self _callLinkedDevicesChanged];
    id v14 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NSMutableArray *)self->_linkedDevices __imArrayByApplyingBlock:&unk_1EE246B08];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)service:(id)a3 restrictionReasonChanged:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(_IDSService *)self serviceProperties];
  id v8 = [v7 identifier];
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1919BB280;
    v10[3] = &unk_1E572C350;
    v10[4] = self;
    v10[5] = a4;
    [(_IDSService *)self _callDelegatesWithBlock:v10];
  }
}

- (void)_setupNewConnectionForAccount:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v6 = [v5 isNonUIInstall];

  if ((v6 & 1) == 0)
  {
    id v7 = +[IDSInternalQueueController sharedInstance];
    int v8 = [v7 assertQueueIsCurrent];

    if (v8)
    {
      int v9 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_191A3B2B0();
      }
    }
    if (v4)
    {
      uint64_t v10 = [v4 _internal];
      uint64_t v11 = [v10 uniqueID];

      uint64_t v12 = [(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v11];
      if (v12)
      {
        long long v13 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v12 _internal];
          int v25 = 138412290;
          __int16 v26 = v14;
          _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_INFO, "We have an existing connection for this unique ID: %@", (uint8_t *)&v25, 0xCu);
        }
      }
      else
      {
        long long v13 = +[IDSConnection _connectionWithAccount:v4 commands:self->_commands indirectDelegateCallouts:1];
        uniqueIDToConnection = self->_uniqueIDToConnection;
        if (!uniqueIDToConnection)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          id v17 = self->_uniqueIDToConnection;
          self->_uniqueIDToConnection = Mutable;

          uniqueIDToConnection = self->_uniqueIDToConnection;
        }
        [(NSMutableDictionary *)uniqueIDToConnection setObject:v13 forKey:v11];
        __int16 v18 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          __int16 v26 = v11;
          _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Setting up new connection for %@", (uint8_t *)&v25, 0xCu);
        }

        [(_IDSService *)self _logConnectionMap];
        if (self->_everHadDelegate)
        {
          long long v19 = +[IDSLogging _IDSService];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            unsigned int listenerCaps = self->_listenerCaps;
            int v25 = 67109120;
            LODWORD(v26) = listenerCaps;
            _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_INFO, "Setting up new connection with caps %d", (uint8_t *)&v25, 8u);
          }

          long long v21 = [v13 _internal];
          [v21 setDelegateCapabilities:self->_listenerCaps];

          long long v22 = [v13 _internal];
          id v23 = +[IDSInternalQueueController sharedInstance];
          uint64_t v24 = [v23 queue];
          [v22 addDelegate:self queue:v24];

          [(_IDSService *)self connection:v13 devicesChanged:0];
        }
      }
    }
  }
}

- (void)_tearDownConnectionForUniqueID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3B348();
    }
  }
  if (v4)
  {
    int v8 = [(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v4];
    int v9 = [v8 _internal];
    [v9 removeDelegate:self];

    [(NSMutableDictionary *)self->_uniqueIDToConnection removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_uniqueIDToConnection count])
    {
      uniqueIDToConnection = self->_uniqueIDToConnection;
      self->_uniqueIDToConnection = 0;
    }
    uint64_t v11 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Tearing down connection for %@", (uint8_t *)&v12, 0xCu);
    }

    [(_IDSService *)self _logConnectionMap];
  }
}

- (void)_callIsActiveChanged
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3B478();
    }
  }
  int v6 = [(_IDSService *)self accounts];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v38 + 1) + 8 * i) _internal];
        uint64_t v14 = [v13 uniqueID];
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v10);
  }

  id v15 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    lastIsActiveSet = self->_lastIsActiveSet;
    *(_DWORD *)buf = 138412546;
    id v44 = lastIsActiveSet;
    __int16 v45 = 2112;
    id v46 = v7;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "activeAccountsChanged, oldSet: %@  newSet: %@", buf, 0x16u);
  }

  p_lastIsActiveSet = &self->_lastIsActiveSet;
  id v17 = self->_lastIsActiveSet;
  if (v17 && ([(NSMutableSet *)v17 isEqual:v7] & 1) == 0)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1919BBD90;
    v35[3] = &unk_1E572C328;
    id v36 = v8;
    uint64_t v37 = self;
    [(_IDSService *)self _callDelegatesWithBlock:v35];
  }
  long long v19 = *p_lastIsActiveSet;
  objc_storeStrong((id *)&self->_lastIsActiveSet, v7);
  uint64_t v20 = [(NSMutableSet *)*p_lastIsActiveSet count];
  if (v20 != [(NSMutableSet *)v19 count]
    || *p_lastIsActiveSet && v19 && ([(NSMutableSet *)*p_lastIsActiveSet isEqualToSet:v19] & 1) == 0)
  {
    long long v21 = [(IDSAccountController *)self->_accountController _internal];
    long long v22 = [v21 accounts];

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "_internal", (void)v31);
          [v23 addObject:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v26);
    }

    if (sub_1919BBE9C(v23))
    {
      id v30 = [MEMORY[0x1E4F6C3B8] IDSService];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "*** dropping devicesChanged callback! -- accountsChanged", buf, 2u);
      }
    }
    else
    {
      [(_IDSService *)self _callDelegatesForDevicesChanged];
    }
  }
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v5 = a4;
  int v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3B510();
    }
  }
  if (v5)
  {
    [(_IDSService *)self _setupNewConnectionForAccount:v5];
    [(_IDSService *)self _callIsActiveChanged];
  }
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  id v5 = a4;
  int v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3B5A8();
    }
  }
  if (v5)
  {
    uint64_t v9 = [v5 _internal];
    uint64_t v10 = [v9 uniqueID];
    [(_IDSService *)self _tearDownConnectionForUniqueID:v10];

    [(_IDSService *)self _callIsActiveChanged];
  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v5 = a4;
  int v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3B640();
    }
  }
  if (v5)
  {
    [(_IDSService *)self _setupNewConnectionForAccount:v5];
    [(_IDSService *)self _callIsActiveChanged];
  }
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  id v5 = a4;
  int v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3B6D8();
    }
  }
  if (v5)
  {
    uint64_t v9 = [v5 _internal];
    uint64_t v10 = [v9 uniqueID];
    [(_IDSService *)self _tearDownConnectionForUniqueID:v10];

    [(_IDSService *)self _callIsActiveChanged];
  }
}

- (void)connection:(id)a3 incomingOpportunisticData:(id)a4 withIdentifier:(id)a5 fromURI:(id)a6 context:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[IDSInternalQueueController sharedInstance];
  int v18 = [v17 assertQueueIsCurrent];

  if (v18)
  {
    long long v19 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_191A3B770();
    }
  }
  uint64_t v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  long long v21 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    long long v22 = [v16 outgoingResponseIdentifier];
    if ([v16 usedEngram]) {
      id v23 = @"YES";
    }
    else {
      id v23 = @"NO";
    }
    NSUInteger v24 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138412802;
    long long v56 = v22;
    __int16 v57 = 2112;
    id v58 = v23;
    __int16 v59 = 2048;
    NSUInteger v60 = v24;
    _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "incomingOpportunisticData on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }
  [v16 setWantsManualAck:self->_manuallyAckMessages];
  uint64_t v25 = [v15 prefixedURI];
  [v16 setFromID:v25];

  uint64_t v26 = [v12 _internal];
  uint64_t v27 = [v26 account];

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1919BC728;
  v49[3] = &unk_1E572C398;
  v49[4] = self;
  id v28 = v27;
  id v50 = v28;
  id v29 = v13;
  id v51 = v29;
  id v30 = v14;
  id v52 = v30;
  id v31 = v15;
  id v53 = v31;
  id v32 = v16;
  id v54 = v32;
  [(_IDSService *)self _callDelegatesWithBlock:v49 group:v20];
  if (!self->_manuallyAckMessages)
  {
    char v38 = [v32 wantsAppAck];
    [v32 storageGuid];
    long long v33 = v40 = v12;
    long long v34 = [v32 outgoingResponseIdentifier];
    long long v39 = +[IDSInternalQueueController sharedInstance];
    id v35 = [v39 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919BC8D0;
    block[3] = &unk_1E572B558;
    char v48 = v38;
    id v42 = v32;
    id v43 = self;
    id v44 = v34;
    id v45 = v31;
    id v46 = v40;
    id v47 = v33;
    id v36 = v33;
    id v37 = v34;
    dispatch_group_notify(v20, v35, block);

    id v12 = v40;
  }
  dispatch_group_leave(v20);
}

- (void)connection:(id)a3 incomingData:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v14 assertQueueIsCurrent];

  if (a5)
  {
    id v15 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_191A3B808();
    }
  }
  id v16 = [v10 _internal];
  id v17 = [v16 account];

  int v18 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [v13 outgoingResponseIdentifier];
    if ([v13 usedEngram]) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    NSUInteger v21 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138412802;
    uint64_t v77 = (uint64_t)v19;
    __int16 v78 = 2112;
    id v79 = v20;
    __int16 v80 = 2048;
    NSUInteger v81 = v21;
    _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "incomingData on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }
  long long v22 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v11 length];
    [v10 _internal];
    id v53 = v11;
    NSUInteger v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v10 _internal];
    long long v56 = self;
    uint64_t v25 = v58 = v10;
    [v25 account];
    uint64_t v27 = v26 = v17;
    id v28 = [v27 _internal];
    id v29 = [v13 outgoingResponseIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v77 = v23;
    __int16 v78 = 2112;
    id v79 = v24;
    __int16 v80 = 2112;
    NSUInteger v81 = (NSUInteger)v28;
    __int16 v82 = 2112;
    id v83 = v12;
    __int16 v84 = 2112;
    v85 = v29;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingData of size %lu on connection %@ account %@ from ID %@ sender-side-identifier %@", buf, 0x34u);

    id v17 = v26;
    self = v56;
    id v10 = v58;

    id v11 = v53;
  }

  id v30 = dispatch_group_create();
  dispatch_group_enter(v30);
  [v13 setWantsManualAck:self->_manuallyAckMessages];
  id v31 = [v12 prefixedURI];
  [v13 setFromID:v31];

  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = sub_1919BD0B0;
  v71[3] = &unk_1E572C3C0;
  v71[4] = self;
  id v32 = v17;
  id v72 = v32;
  id v33 = v11;
  id v73 = v33;
  id v34 = v12;
  id v74 = v34;
  id v35 = v13;
  id v75 = v35;
  [(_IDSService *)self _callDelegatesWithBlock:v71 group:v30];
  if (!self->_manuallyAckMessages)
  {
    id v57 = v32;
    __int16 v59 = v10;
    int v36 = [v35 wantsAppAck];
    char v54 = [v35 isDirectMessage];
    id v37 = [v35 outgoingResponseIdentifier];
    char v38 = [v35 storageGuid];
    long long v39 = [v35 broadcastTime];

    if (v39)
    {
      long long v40 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v42 = v41;
      id v43 = [v35 broadcastTime];
      [v43 doubleValue];
      uint64_t v51 = [v40 numberWithDouble:v42 - v44];
    }
    else
    {
      uint64_t v51 = 0;
    }
    id v45 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      id v46 = @"NO";
      *(_DWORD *)buf = 138413058;
      uint64_t v77 = (uint64_t)v35;
      if (v36) {
        id v46 = @"YES";
      }
      __int16 v78 = 2112;
      id v79 = v46;
      __int16 v80 = 2112;
      NSUInteger v81 = (NSUInteger)v37;
      __int16 v82 = 2112;
      id v83 = v38;
      _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    id v47 = +[IDSInternalQueueController sharedInstance];
    char v48 = [v47 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919BD254;
    block[3] = &unk_1E572C3E8;
    id v61 = v35;
    char v69 = v36;
    char v70 = v54;
    id v62 = v59;
    id v63 = v37;
    id v64 = self;
    id v65 = v34;
    id v66 = v38;
    id v67 = v52;
    id v68 = v33;
    id v55 = v52;
    id v49 = v38;
    id v50 = v37;
    dispatch_group_notify(v30, v48, block);

    id v10 = v59;
    id v32 = v57;
  }
  dispatch_group_leave(v30);
}

- (void)connection:(id)a3 incomingGroupData:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A3B8A0();
    }
  }
  id v17 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [v13 outgoingResponseIdentifier];
    id v19 = v12;
    if ([v13 usedEngram]) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    NSUInteger v21 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138412802;
    uint64_t v71 = (uint64_t)v18;
    __int16 v72 = 2112;
    id v73 = v20;
    id v12 = v19;
    __int16 v74 = 2048;
    NSUInteger v75 = v21;
    _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "incomingGroupData on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }
  long long v22 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v12;
    uint64_t v24 = [v11 length];
    uint64_t v25 = [v10 _internal];
    [v10 _internal];
    v26 = id v56 = v10;
    [v26 account];
    id v53 = v11;
    id v28 = v27 = self;
    id v29 = [v28 _internal];
    id v30 = [v13 outgoingResponseIdentifier];
    *(_DWORD *)buf = 134219010;
    uint64_t v71 = v24;
    id v12 = v23;
    __int16 v72 = 2112;
    id v73 = v25;
    __int16 v74 = 2112;
    NSUInteger v75 = (NSUInteger)v29;
    __int16 v76 = 2112;
    uint64_t v77 = v23;
    __int16 v78 = 2112;
    id v79 = v30;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingGroupData of size %lu on connection %@ account %@ from ID %@ sender-side-identifier %@", buf, 0x34u);

    self = v27;
    id v11 = v53;

    id v10 = v56;
  }

  id v31 = dispatch_group_create();
  dispatch_group_enter(v31);
  [v13 setWantsManualAck:self->_manuallyAckMessages];
  id v32 = [v12 prefixedURI];
  [v13 setFromID:v32];

  id v33 = +[IDSInternalQueueController sharedInstance];
  id v34 = [v33 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1919BDAC8;
  block[3] = &unk_1E57291B8;
  void block[4] = self;
  id v35 = v11;
  id v69 = v35;
  dispatch_group_async(v31, v34, block);

  if (!self->_manuallyAckMessages)
  {
    id v52 = v12;
    id v57 = v10;
    int v54 = [v13 wantsAppAck];
    int v36 = [v13 outgoingResponseIdentifier];
    id v37 = [v13 storageGuid];
    char v38 = [v13 broadcastTime];

    if (v38)
    {
      long long v39 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v41 = v40;
      double v42 = [v13 broadcastTime];
      [v42 doubleValue];
      double v44 = [v39 numberWithDouble:v41 - v43];
    }
    else
    {
      double v44 = 0;
    }
    id v45 = self;
    id v46 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = @"NO";
      *(_DWORD *)buf = 138413058;
      uint64_t v71 = (uint64_t)v13;
      if (v54) {
        id v47 = @"YES";
      }
      __int16 v72 = 2112;
      id v73 = v47;
      __int16 v74 = 2112;
      NSUInteger v75 = (NSUInteger)v36;
      __int16 v76 = 2112;
      uint64_t v77 = v37;
      _os_log_impl(&dword_19190B000, v46, OS_LOG_TYPE_DEFAULT, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    char v48 = +[IDSInternalQueueController sharedInstance];
    id v49 = [v48 queue];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1919BDE80;
    v58[3] = &unk_1E572C438;
    char v67 = v54;
    id v59 = v13;
    NSUInteger v60 = v45;
    id v61 = v36;
    id v62 = v52;
    id v63 = v57;
    id v64 = v37;
    id v65 = v44;
    id v66 = v35;
    id v55 = v44;
    id v50 = v37;
    id v51 = v36;
    dispatch_group_notify(v31, v49, v58);

    id v10 = v57;
    id v12 = v52;
  }
  dispatch_group_leave(v31);
}

- (void)connection:(id)a3 incomingAccessoryData:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = &OBJC_METACLASS___IDSConnection;
  int v15 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v15 assertQueueIsCurrent];

  if (a5)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A3B938();
    }
  }
  id v17 = [v10 _internal];
  int v18 = [v17 account];

  id v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  [v13 setWantsManualAck:self->_manuallyAckMessages];
  uint64_t v20 = [v12 prefixedURI];
  [v13 setFromID:v20];

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1919BE540;
  v56[3] = &unk_1E572C3C0;
  v56[4] = self;
  id v21 = v18;
  id v57 = v21;
  id v22 = v11;
  id v58 = v22;
  id v23 = v12;
  id v59 = v23;
  id v24 = v13;
  id v60 = v24;
  [(_IDSService *)self _callDelegatesWithBlock:v56 group:v19];
  if (!self->_manuallyAckMessages)
  {
    id v42 = v21;
    double v44 = v10;
    int v25 = [v24 wantsAppAck];
    uint64_t v26 = [v24 outgoingResponseIdentifier];
    id v45 = [v24 storageGuid];
    uint64_t v27 = [v24 broadcastTime];

    if (v27)
    {
      id v28 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v30 = v29;
      [v24 broadcastTime];
      v32 = int v31 = v25;
      [v32 doubleValue];
      double v43 = [v28 numberWithDouble:v30 - v33];

      int v25 = v31;
      id v14 = &OBJC_METACLASS___IDSConnection;
    }
    else
    {
      double v43 = 0;
    }
    id v34 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v62 = v24;
      if (v25) {
        id v35 = @"YES";
      }
      __int16 v63 = 2112;
      id v64 = v35;
      __int16 v65 = 2112;
      uint64_t v66 = v26;
      __int16 v67 = 2112;
      id v68 = v45;
      _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    [&v14[30] sharedInstance];
    id v37 = v36 = (void *)v26;
    char v38 = [v37 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919BE6E4;
    block[3] = &unk_1E572C438;
    char v55 = v25;
    id v47 = v24;
    char v48 = self;
    id v49 = v36;
    id v50 = v23;
    id v10 = v44;
    id v51 = v44;
    id v52 = v45;
    id v53 = v43;
    id v54 = v22;
    id v39 = v43;
    id v40 = v45;
    id v41 = v36;
    dispatch_group_notify(v19, v38, block);

    id v21 = v42;
  }
  dispatch_group_leave(v19);
}

- (void)connection:(id)a3 incomingAccessoryReportMessage:(id)a4 accessoryID:(id)a5 controllerID:(id)a6 context:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a6) = [v17 assertQueueIsCurrent];

  if (a6)
  {
    int v18 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_191A3B9D0();
    }
  }
  id v19 = [v12 _internal];
  uint64_t v20 = [v19 account];

  id v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = sub_1919BED30;
  v57[3] = &unk_1E572C398;
  void v57[4] = self;
  id v22 = v20;
  id v58 = v22;
  id v23 = v13;
  id v59 = v23;
  id v24 = v15;
  id v60 = v24;
  id v25 = v14;
  id v61 = v25;
  id v26 = v16;
  id v62 = v26;
  [(_IDSService *)self _callDelegatesWithBlock:v57 group:v21];
  [v26 setWantsManualAck:self->_manuallyAckMessages];
  [v26 setFromID:v25];
  if (!self->_manuallyAckMessages)
  {
    id v45 = v23;
    id v46 = v12;
    int v27 = [v26 wantsAppAck];
    id v47 = [v26 outgoingResponseIdentifier];
    uint64_t v28 = [v26 storageGuid];
    double v29 = [v26 broadcastTime];

    if (v29)
    {
      double v30 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v32 = v31;
      double v33 = [v26 broadcastTime];
      [v33 doubleValue];
      double v43 = [v30 numberWithDouble:v32 - v34];
    }
    else
    {
      double v43 = 0;
    }
    id v44 = v22;
    id v35 = +[IDSLogging _IDSService];
    int v36 = (void *)v28;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v37 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v64 = v26;
      if (v27) {
        id v37 = @"YES";
      }
      __int16 v65 = 2112;
      uint64_t v66 = v37;
      __int16 v67 = 2112;
      id v68 = v47;
      __int16 v69 = 2112;
      uint64_t v70 = v28;
      _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    char v38 = +[IDSInternalQueueController sharedInstance];
    id v39 = [v38 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919BEEA8;
    block[3] = &unk_1E572B530;
    char v56 = v27;
    id v49 = v26;
    id v50 = self;
    id v51 = v47;
    id v52 = v25;
    id v12 = v46;
    id v53 = v46;
    id v54 = v36;
    id v55 = v43;
    id v40 = v43;
    id v41 = v36;
    id v42 = v47;
    dispatch_group_notify(v21, v39, block);

    id v22 = v44;
    id v23 = v45;
  }
  dispatch_group_leave(v21);
}

- (void)connection:(id)a3 incomingInvitation:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v45 = a5;
  id v12 = a6;
  id v13 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v13 assertQueueIsCurrent];

  if (a5)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A3BA68();
    }
  }
  id v44 = v10;
  id v15 = [v10 _internal];
  id v16 = [v15 account];

  id v17 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v18 = objc_opt_class();
  id v19 = sub_1919BF50C(v18, v11, (void *)*MEMORY[0x1E4F6ACC0]);
  id v46 = (void *)[v17 initWithUUIDString:v19];

  uint64_t v20 = objc_opt_class();
  id v21 = sub_1919BF50C(v20, v11, (void *)*MEMORY[0x1E4F6AC88]);
  id v22 = (void *)*MEMORY[0x1E4F6ACA0];
  id v23 = [v11 objectForKey:*MEMORY[0x1E4F6ACA0]];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v25 = objc_opt_class();
    id v26 = sub_1919BF50C(v25, v11, v22);
    [v26 doubleValue];
    int v27 = objc_msgSend(v24, "initWithTimeIntervalSince1970:");
  }
  else
  {
    int v27 = 0;
  }
  uint64_t v28 = objc_opt_class();
  double v29 = sub_1919BF50C(v28, v11, (void *)*MEMORY[0x1E4F6ACB8]);
  unint64_t v30 = (int)[v29 intValue];

  if (v30 <= 5 && ((1 << v30) & 0x3A) != 0)
  {
    double v31 = self;
    uint64_t v32 = objc_opt_class();
    double v33 = sub_1919BF50C(v32, v21, (void *)*MEMORY[0x1E4F6AC98]);
    [v33 intValue];

    double v34 = [[IDSDictionaryInvitationContext alloc] initWithPayload:v21];
    id v35 = [IDSReceivedInvitation alloc];
    int v36 = [v45 prefixedURI];
    id v37 = [(IDSReceivedInvitation *)v35 initWithfromID:v36 state:v30 expirationDate:v27 uniqueID:v46 context:v34];

    char v38 = [v12 senderCorrelationIdentifier];
    [(IDSReceivedInvitation *)v37 setSenderMergeID:v38];

    id v39 = [v12 toID];
    [(IDSReceivedInvitation *)v37 setSelfHandle:v39];

    id v40 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v37;
      _os_log_impl(&dword_19190B000, v40, OS_LOG_TYPE_DEFAULT, "incomingInvitation: created invitation object from incoming message : {%@}", buf, 0xCu);
    }

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1919BF5C8;
    v47[3] = &unk_1E572C460;
    v47[4] = v31;
    id v48 = v16;
    id v49 = v37;
    id v50 = v12;
    id v41 = v37;
    [(_IDSService *)v31 _callDelegatesWithBlock:v47];

    id v42 = v44;
  }
  else
  {
    double v34 = +[IDSLogging _IDSService];
    id v42 = v10;
    if (os_log_type_enabled(&v34->super, OS_LOG_TYPE_DEFAULT))
    {
      double v43 = [v46 UUIDString];
      *(_DWORD *)buf = 134218242;
      id v52 = (IDSReceivedInvitation *)v30;
      __int16 v53 = 2112;
      id v54 = v43;
      _os_log_impl(&dword_19190B000, &v34->super, OS_LOG_TYPE_DEFAULT, "Invalid state {%ld} received in incomingInvitation. Dropping invitation %@", buf, 0x16u);
    }
  }
}

- (void)connection:(id)a3 incomingInvitationUpdate:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v13 assertQueueIsCurrent];

  if (a5)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A3BB78();
    }
  }
  id v15 = objc_msgSend(v9, "_internal", self);
  id v47 = [v15 account];

  id v16 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = sub_1919BF50C(v17, v10, (void *)*MEMORY[0x1E4F6ACC0]);
  id v19 = (void *)[v16 initWithUUIDString:v18];

  uint64_t v20 = objc_opt_class();
  id v21 = sub_1919BF50C(v20, v10, (void *)*MEMORY[0x1E4F6AC88]);
  id v22 = (void *)*MEMORY[0x1E4F6ACA0];
  id v23 = [v10 objectForKey:*MEMORY[0x1E4F6ACA0]];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    uint64_t v25 = objc_opt_class();
    id v26 = sub_1919BF50C(v25, v10, v22);
    [v26 doubleValue];
    int v27 = objc_msgSend(v24, "initWithTimeIntervalSince1970:");
  }
  else
  {
    int v27 = 0;
  }
  uint64_t v28 = objc_opt_class();
  double v29 = sub_1919BF50C(v28, v10, (void *)*MEMORY[0x1E4F6ACB8]);
  unint64_t v30 = (int)[v29 intValue];

  id v48 = v11;
  if (v30 <= 5 && ((1 << v30) & 0x3A) != 0)
  {
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = sub_1919BF50C(v31, v21, (void *)*MEMORY[0x1E4F6AC98]);
    [v32 intValue];

    double v33 = (void *)MEMORY[0x1E4F6B438];
    double v34 = [v11 prefixedURI];
    id v35 = [v33 destinationWithURI:v34];

    int v36 = [[IDSDictionaryInvitationContext alloc] initWithPayload:v21];
    id v37 = [[IDSSentInvitation alloc] initWithDestination:v35 state:v30 expirationDate:v27 uniqueID:v19 context:v36];
    char v38 = [v12 senderCorrelationIdentifier];
    [(IDSSentInvitation *)v37 setSenderMergeID:v38];

    id v39 = [v12 toID];
    [(IDSSentInvitation *)v37 setSelfHandle:v39];

    id v40 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v54 = (unint64_t)v37;
      _os_log_impl(&dword_19190B000, v40, OS_LOG_TYPE_DEFAULT, "incomingInvitationUpdate: created invitation object from incoming message : {%@}", buf, 0xCu);
    }

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_1919BFC00;
    v49[3] = &unk_1E572C460;
    id v41 = v47;
    v49[4] = v46;
    id v50 = v47;
    id v51 = v37;
    id v52 = v12;
    id v42 = v37;
    [v46 _callDelegatesWithBlock:v49];

    double v43 = v9;
  }
  else
  {
    id v35 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = [v19 UUIDString];
      *(_DWORD *)buf = 134218242;
      unint64_t v54 = v30;
      __int16 v55 = 2112;
      char v56 = v44;
      _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_DEFAULT, "Invalid state {%ld} received in incomingInvitationUpdate. Dropping invitation %@", buf, 0x16u);
    }
    id v41 = v47;
    double v43 = v9;
  }
}

- (void)connection:(id)a3 incomingMessage:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v72 = a4;
  id v77 = a5;
  id v10 = a6;
  id v11 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v11 assertQueueIsCurrent];

  if (a5)
  {
    id v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A3BCD0();
    }
  }
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v115 = _os_activity_create(&dword_19190B000, "Service recieved message", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v115, &state);
  id v13 = [v75 _internal];
  __int16 v74 = [v13 account];

  id v14 = [v77 prefixedURI];
  id v73 = [(_IDSService *)self deviceForFromID:v14];

  id v15 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v75 _internal];
    uint64_t v17 = [v75 _internal];
    uint64_t v18 = [v17 account];
    id v19 = [v18 _internal];
    id v20 = [v73 _internal];
    id v21 = [v10 outgoingResponseIdentifier];
    *(_DWORD *)buf = 138413314;
    id v118 = v16;
    __int16 v119 = 2112;
    v120 = v19;
    __int16 v121 = 2112;
    NSUInteger v122 = (NSUInteger)v77;
    __int16 v123 = 2112;
    id v124 = v20;
    __int16 v125 = 2112;
    v126 = v21;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "incomingMessage on connection %@ account %@ from ID %@  from device: %@  sender-side-identifier: %@", buf, 0x34u);
  }
  id v22 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v10 outgoingResponseIdentifier];
    int v24 = [v10 usedEngram];
    NSUInteger v25 = [(NSMapTable *)self->_delegateToInfo count];
    id v26 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v118 = v23;
    if (v24) {
      id v26 = @"YES";
    }
    __int16 v119 = 2112;
    v120 = v26;
    __int16 v121 = 2048;
    NSUInteger v122 = v25;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "incomingMessage on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }
  group = dispatch_group_create();
  dispatch_group_enter(group);
  [v10 setWantsManualAck:self->_manuallyAckMessages];
  int v27 = [v77 prefixedURI];
  [v10 setFromID:v27];

  uint64_t v28 = [v10 resourceTransferURLString];
  uint64_t v71 = v28;
  if (v28)
  {
    uint64_t v29 = [v28 fileSystemRepresentation];
    if (v29)
    {
      unint64_t v30 = [NSString stringWithUTF8String:v29];
    }
    else
    {
      unint64_t v30 = 0;
    }
    id v35 = [v10 resourceTransferMetadata];
    int v36 = [v10 resourceTransferSandboxExtension];
    if (([v30 containsString:@"/Library/IdentityServices/files/"] & 1) == 0
      && ![v30 containsString:@"/Library/IdentityServices/incomingfiles/"]
      || ((char v37 = [v30 containsString:@".."], !v30) ? (v38 = 1) : (v38 = v37), (v38 & 1) != 0))
    {
      id v39 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        sub_191A3BC10();
      }
LABEL_24:
      char v34 = 1;
LABEL_33:

      goto LABEL_34;
    }
    if (v36)
    {
      [v36 UTF8String];
      uint64_t v40 = sandbox_extension_consume();
      if (v40 == -1)
      {
        id v39 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          id v41 = __error();
          sub_191A3BC84(v41, v116, v39);
        }
        goto LABEL_24;
      }
    }
    else
    {
      id v42 = +[IDSTransportLog IDSService];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v118 = v30;
        _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "No sandbox extension for received resource [%@]", buf, 0xCu);
      }

      uint64_t v40 = 0;
    }
    double v43 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v30, v35, v71, v72);
    id v44 = [IDSAutoCleanup alloc];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = sub_1919C0918;
    void v110[3] = &unk_1E572C488;
    id v45 = v43;
    id v111 = v45;
    id v112 = v36;
    uint64_t v113 = v40;
    id v46 = [(IDSAutoCleanup *)v44 initWithBlock:v110];
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = sub_1919C0B1C;
    v104[3] = &unk_1E572C398;
    v104[4] = self;
    id v47 = v74;
    id v105 = v47;
    id v48 = v45;
    id v106 = v48;
    id v49 = v77;
    id v107 = v49;
    id v50 = v10;
    id v108 = v50;
    id v51 = v46;
    v109 = v51;
    [(_IDSService *)self _callDelegatesWithBlock:v104 group:group];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = sub_1919C0CC8;
    v97[3] = &unk_1E572C4B0;
    v97[4] = self;
    id v98 = v47;
    id v39 = v48;
    v99 = v39;
    id v100 = v70;
    id v101 = v49;
    id v102 = v50;
    id v52 = v51;
    v103 = v52;
    [(_IDSService *)self _callDelegatesWithBlock:v97 group:group];

    id v35 = v70;
    char v34 = 0;
    goto LABEL_33;
  }
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = sub_1919C0E78;
  v93[3] = &unk_1E572C460;
  v93[4] = self;
  id v31 = v74;
  id v94 = v31;
  id v32 = v72;
  id v95 = v32;
  id v33 = v77;
  id v96 = v33;
  [(_IDSService *)self _callDelegatesWithBlock:v93 group:group];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = sub_1919C1010;
  v88[3] = &unk_1E572C3C0;
  v88[4] = self;
  id v89 = v31;
  id v90 = v32;
  id v91 = v33;
  id v92 = v10;
  [(_IDSService *)self _callDelegatesWithBlock:v88 group:group];

  char v34 = 0;
LABEL_34:
  if ((v34 & 1) != 0 || !self->_manuallyAckMessages)
  {
    int v53 = [v10 wantsAppAck];
    char v54 = [v10 isDirectMessage];
    __int16 v55 = [v10 outgoingResponseIdentifier];
    char v56 = [v10 storageGuid];
    uint64_t v57 = [v10 broadcastTime];

    if (v57)
    {
      id v58 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v60 = v59;
      id v61 = [v10 broadcastTime];
      [v61 doubleValue];
      uint64_t v57 = [v58 numberWithDouble:v60 - v62];
    }
    __int16 v63 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      id v64 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v118 = v10;
      if (v53) {
        id v64 = @"YES";
      }
      __int16 v119 = 2112;
      v120 = v64;
      __int16 v121 = 2112;
      NSUInteger v122 = (NSUInteger)v55;
      __int16 v123 = 2112;
      id v124 = v56;
      _os_log_impl(&dword_19190B000, v63, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    __int16 v65 = +[IDSInternalQueueController sharedInstance];
    uint64_t v66 = [v65 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919C11B4;
    block[3] = &unk_1E572B508;
    char v86 = v53;
    char v87 = v54;
    id v79 = v75;
    id v80 = v55;
    id v81 = v10;
    __int16 v82 = self;
    id v83 = v77;
    id v84 = v56;
    id v85 = v57;
    id v67 = v57;
    id v68 = v56;
    id v69 = v55;
    dispatch_group_notify(group, v66, block);
  }
  dispatch_group_leave(group);

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)connection:(id)a3 incomingProtobuf:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v10 = a4;
  id v58 = a5;
  id v11 = a6;
  id v12 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a5) = [v12 assertQueueIsCurrent];

  if (a5)
  {
    id v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3BD6C();
    }
  }
  id v14 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 outgoingResponseIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)id v90 = v10;
    *(_WORD *)&v90[8] = 2112;
    *(void *)id v91 = v15;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Incoming protobuf %@, routing to selector/delegate. sender-side-identifier %@", buf, 0x16u);
  }
  id v16 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v11 outgoingResponseIdentifier];
    if ([v11 usedEngram]) {
      uint64_t v18 = @"YES";
    }
    else {
      uint64_t v18 = @"NO";
    }
    NSUInteger v19 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138412802;
    *(void *)id v90 = v17;
    *(_WORD *)&v90[8] = 2112;
    *(void *)id v91 = v18;
    *(_WORD *)&v91[8] = 2048;
    NSUInteger v92 = v19;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Incoming protobuf on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }
  context = (void *)MEMORY[0x192FE0160]();
  uint64_t v57 = objc_msgSend(MEMORY[0x1E4F6B528], "keyRepresentationForType:isResponse:", objc_msgSend(v10, "type"), objc_msgSend(v10, "isResponse"));
  __int16 v55 = [(NSMutableDictionary *)self->_protobufSelectors objectForKey:v57];
  id v20 = [v56 _internal];
  char v54 = [v20 account];

  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  char v88 = 0;
  id v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  [v11 setWantsManualAck:self->_manuallyAckMessages];
  id v22 = [v58 prefixedURI];
  [v11 setFromID:v22];

  if (v55)
  {
    id v23 = (const char *)[v55 pointerValue];
    NSStringFromSelector(v23);
    int v24 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    NSUInteger v25 = v24;
    if (![(NSString *)v24 hasSuffix:@"service:account:fromID:context:"])
    {
      NSUInteger v25 = [(NSString *)v24 stringByAppendingString:@"service:account:fromID:context:"];
    }
    SEL v26 = NSSelectorFromString(v25);
    int v27 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v57 unsignedIntValue];
      *(_DWORD *)buf = 138412802;
      *(void *)id v90 = v24;
      *(_WORD *)&v90[8] = 2112;
      *(void *)id v91 = v25;
      *(_WORD *)&v91[8] = 1024;
      LODWORD(v92) = v28;
      _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, "Found selector %@ fullSelector %@ for key 0x%x", buf, 0x1Cu);
    }

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = sub_1919C1CE4;
    v78[3] = &unk_1E572C4D8;
    SEL v85 = v26;
    id v79 = v10;
    id v80 = v58;
    id v81 = v54;
    __int16 v82 = self;
    id v83 = v11;
    id v84 = v87;
    char v86 = v23;
    [(_IDSService *)self _callDelegatesWithBlock:v78 group:v21];
  }
  else
  {
    uint64_t v29 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v30 = [v57 unsignedIntValue];
      int v31 = [v10 type];
      int v32 = [v10 isResponse];
      id v33 = @"NO";
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v90 = v30;
      if (v32) {
        id v33 = @"YES";
      }
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v31;
      *(_WORD *)id v91 = 2112;
      *(void *)&v91[2] = v33;
      _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_INFO, "No selector for key 0x%x = type(%u) isResponse(%@), notifying delegates", buf, 0x18u);
    }

    char v34 = [v11 messageSequenceNumber];
    [v34 unsignedIntegerValue];
    kdebug_trace();

    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = sub_1919C2020;
    v71[3] = &unk_1E572C500;
    id v72 = (NSString *)v10;
    id v73 = self;
    id v74 = v54;
    id v75 = v58;
    id v76 = v11;
    id v77 = v87;
    [(_IDSService *)self _callDelegatesWithBlock:v71 group:v21];

    int v24 = v72;
  }

  if (!self->_manuallyAckMessages)
  {
    int v52 = [v11 wantsAppAck];
    char v35 = [v11 isDirectMessage];
    int v36 = [v11 outgoingResponseIdentifier];
    char v37 = [v11 storageGuid];
    char v51 = v35;
    char v38 = [v11 broadcastTime];

    if (v38)
    {
      id v39 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v41 = v40;
      id v42 = [v11 broadcastTime];
      [v42 doubleValue];
      char v38 = [v39 numberWithDouble:v41 - v43];
    }
    id v44 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      id v45 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)id v90 = v11;
      if (v52) {
        id v45 = @"YES";
      }
      *(_WORD *)&v90[8] = 2112;
      *(void *)id v91 = v45;
      *(_WORD *)&v91[8] = 2112;
      NSUInteger v92 = (NSUInteger)v36;
      __int16 v93 = 2112;
      id v94 = v37;
      _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    id v46 = +[IDSInternalQueueController sharedInstance];
    id v47 = [v46 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919C21E8;
    block[3] = &unk_1E572C528;
    id v68 = v87;
    id v60 = v36;
    char v69 = v52;
    char v70 = v51;
    id v61 = v56;
    id v62 = v11;
    __int16 v63 = self;
    id v64 = v58;
    id v65 = v37;
    id v66 = v38;
    id v67 = v10;
    id v48 = v38;
    id v49 = v37;
    id v50 = v36;
    dispatch_group_notify(v21, v47, block);
  }
  dispatch_group_leave(v21);

  _Block_object_dispose(v87, 8);
}

- (void)connection:(id)a3 incomingTopLevelMessage:(id)a4 fromURI:(id)a5 messageContext:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A3BE78();
    }
  }
  uint64_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  uint64_t v18 = [v13 outgoingResponseIdentifier];
  NSUInteger v19 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v17;
    if ([v13 usedEngram]) {
      id v21 = @"YES";
    }
    else {
      id v21 = @"NO";
    }
    NSUInteger v22 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138412802;
    id v60 = v18;
    __int16 v61 = 2112;
    id v62 = v21;
    uint64_t v17 = v20;
    __int16 v63 = 2048;
    NSUInteger v64 = v22;
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "incomingTopLevelMessage on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }

  id v23 = [(IDSServiceProperties *)self->_serviceProperties serviceName];
  if ([v23 isEqualToString:@"com.apple.madrid"])
  {
    NSUInteger v24 = [(NSMapTable *)self->_delegateToInfo count];

    if (v24) {
      goto LABEL_16;
    }
    NSUInteger v25 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v60 = v18;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "No delegates for incoming madrid message. Sending 115 for guid %@", buf, 0xCu);
    }

    id v26 = objc_alloc(MEMORY[0x1E4F6B500]);
    int v27 = [(IDSServiceProperties *)self->_serviceProperties serviceName];
    id v23 = (void *)[v26 initWithReason:709 guid:v18 service:v27 additionalInformation:0];

    [(_IDSService *)self _sendMissingMessageMetric:v23];
  }

LABEL_16:
  id v28 = v13;
  [v28 setWantsManualAck:self->_manuallyAckMessages];
  uint64_t v29 = [v12 prefixedURI];
  [v28 setFromID:v29];

  int v30 = [v10 _internal];
  int v31 = [v30 account];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = sub_1919C2908;
  v53[3] = &unk_1E572C398;
  v53[4] = self;
  id v32 = v31;
  id v54 = v32;
  id v33 = v11;
  id v55 = v33;
  id v34 = v12;
  id v56 = v34;
  id v35 = v28;
  id v57 = v35;
  id v36 = v18;
  id v58 = v36;
  [(_IDSService *)self _callDelegatesWithBlock:v53 group:v17];
  if (!self->_manuallyAckMessages)
  {
    [v35 storageGuid];
    v38 = char v37 = v10;
    [v35 outgoingResponseIdentifier];
    v39 = id v46 = v33;
    id v45 = +[IDSInternalQueueController sharedInstance];
    [v45 queue];
    v41 = double v40 = v17;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1919C2AB8;
    block[3] = &unk_1E57296D0;
    id v48 = v38;
    id v49 = v39;
    id v50 = self;
    id v51 = v37;
    id v52 = v35;
    id v42 = v39;
    id v43 = v38;
    id v10 = v37;
    id v44 = v43;
    dispatch_group_notify(v40, v41, block);

    uint64_t v17 = v40;
    id v33 = v46;
  }
  dispatch_group_leave(v17);
}

- (void)connection:(id)a3 incomingPendingMessageFromURI:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3BF10();
    }
  }
  id v14 = [v8 _internal];
  int v15 = [v14 account];

  id v16 = [v10 originalCommand];
  int64_t v17 = [(_IDSService *)self _messageTypeForCommand:v16];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1919C2D7C;
  v21[3] = &unk_1E572C550;
  v21[4] = self;
  id v22 = v15;
  id v24 = v10;
  int64_t v25 = v17;
  id v23 = v9;
  id v18 = v10;
  id v19 = v9;
  id v20 = v15;
  [(_IDSService *)self _callDelegatesWithBlock:v21];
}

- (void)connection:(id)a3 incomingPendingResourceWithMetadata:(id)a4 guid:(id)a5 fromURI:(id)a6 context:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a3 _internal];
  int64_t v17 = [v16 account];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1919C30D8;
  v31[3] = &unk_1E572C578;
  v31[4] = self;
  id v32 = v13;
  id v18 = v13;
  id v19 = (void *)MEMORY[0x192FE03B0](v31);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1919C313C;
  v25[3] = &unk_1E572C5A0;
  v25[4] = self;
  id v26 = v17;
  id v27 = v12;
  id v28 = v14;
  id v29 = v15;
  id v30 = v19;
  id v20 = v15;
  id v21 = v19;
  id v22 = v14;
  id v23 = v12;
  id v24 = v17;
  [(_IDSService *)self _callDelegatesWithBlock:v25];
}

- (int64_t)_messageTypeForCommand:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  if (v3 <= 226)
  {
    switch(v3)
    {
      case 206:
      case 210:
      case 211:
        int64_t result = 12;
        break;
      case 207:
        int64_t result = 8;
        break;
      case 208:
        int64_t result = 9;
        break;
      case 209:
        int64_t result = 10;
        break;
      default:
        if (v3 == 100)
        {
          int64_t result = 0;
        }
        else if (v3 == 121)
        {
          int64_t result = 5;
        }
        else
        {
LABEL_11:
          int64_t result = 15;
        }
        break;
    }
  }
  else
  {
    switch(v3)
    {
      case 232:
        int64_t result = 6;
        break;
      case 233:
      case 234:
      case 236:
      case 237:
      case 238:
      case 240:
      case 241:
      case 244:
      case 246:
      case 247:
      case 248:
      case 249:
        goto LABEL_11;
      case 235:
        int64_t result = 7;
        break;
      case 239:
        int64_t result = 11;
        break;
      case 242:
        int64_t result = 2;
        break;
      case 243:
        int64_t result = 3;
        break;
      case 245:
        int64_t result = 4;
        break;
      case 250:
        int64_t result = 13;
        break;
      case 251:
        int64_t result = 14;
        break;
      default:
        if (v3 != 227) {
          goto LABEL_11;
        }
        int64_t result = 1;
        break;
    }
  }
  return result;
}

- (id)_payloadFromDecryptedData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 _FTOptionallyDecompressData];
      JWDecodeDictionary();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (![v4 count])
      {
        uint64_t v6 = JWDecodeDictionary();

        id v4 = (id)v6;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)connection:(id)a3 incomingEngramMessage:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A3BFA8();
    }
  }
  id v17 = objc_alloc(MEMORY[0x1E4F61158]);
  id v18 = [v13 engramGroupID];
  id v19 = (void *)[v17 initWithDataRepresentation:v18];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1919C3754;
  v33[3] = &unk_1E572C5C8;
  id v20 = v11;
  id v34 = v20;
  id v35 = v13;
  id v36 = self;
  id v37 = v10;
  id v38 = v12;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v24 = (void *)MEMORY[0x192FE03B0](v33);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1919C3AF4;
  v28[3] = &unk_1E572C640;
  id v29 = v19;
  id v30 = v20;
  int v31 = self;
  id v32 = v24;
  id v25 = v24;
  id v26 = v20;
  id v27 = v19;
  [(_IDSService *)self performGroupTask:v28];
}

- (void)connection:(id)a3 isActiveChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3C040();
    }
  }
  id v10 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v6 _internal];
    id v12 = (void *)v11;
    id v13 = @"NO";
    if (v4) {
      id v13 = @"YES";
    }
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_INFO, "isActiveChanged on connection %@ isActive %@", (uint8_t *)&v14, 0x16u);
  }
  [(_IDSService *)self _callIsActiveChanged];
}

- (void)connection:(id)a3 devicesChanged:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3C0D8();
    }
  }
  uint64_t v11 = [v6 _internal];
  id v12 = [v11 account];
  id v13 = [v12 _internal];

  int v14 = [(_IDSService *)self devices];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F6C3B8], "IDSService_oversized");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = objc_msgSend(v14, "__imArrayByApplyingBlock:", &unk_1EE245D88);
    uint64_t v17 = [v14 count];
    NSUInteger v18 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138413314;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2050;
    uint64_t v34 = v17;
    __int16 v35 = 2048;
    NSUInteger v36 = v18;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "devicesChanged on connection %@ account %@ all devices %@ num devices %{public}lu num delegates: %lu", buf, 0x34u);
  }
  if (v13
    && ([MEMORY[0x1E4F1CAD0] setWithObject:v13],
        id v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = sub_1919BBE9C(v19),
        v19,
        v20))
  {
    id v21 = [MEMORY[0x1E4F6C3B8] IDSService];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "*** dropping devicesChanged callback!", buf, 2u);
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
    if ([v7 count])
    {
      [(_IDSService *)self _callDelegatesForDevicesChanged];
    }
    else
    {
      dispatch_time_t v22 = dispatch_time(0, 60000000000);
      id v23 = +[IDSInternalQueueController sharedInstance];
      id v24 = [v23 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1919C48DC;
      block[3] = &unk_1E5729000;
      id v21 = v21;
      id v26 = v21;
      dispatch_after(v22, v24, block);
    }
  }
}

- (void)_callDelegatesForDevicesChanged
{
  id v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3C170();
    }
  }
  id v6 = [(_IDSService *)self devices];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919C4A18;
  v8[3] = &unk_1E572C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(_IDSService *)self _callDelegatesWithBlock:v8];
}

- (void)connection:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3C208();
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919C4B88;
  v10[3] = &unk_1E572C328;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(_IDSService *)self _callDelegatesWithBlock:v10];
}

- (void)connection:(id)a3 connectedDevicesChanged:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3C2A0();
    }
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F6C3B8], "IDSService_oversized");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 _internal];
    id v13 = [v12 account];
    int v14 = [v13 _internal];
    *(_DWORD *)buf = 138413058;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v14;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2050;
    uint64_t v25 = [v7 count];
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "connectedDevicesChanged on connection %@ account %@ devices %@ num devices %{public}lu", buf, 0x2Au);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1919C4DF8;
  v16[3] = &unk_1E572C328;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [(_IDSService *)self _callDelegatesWithBlock:v16];
}

- (void)connection:(id)a3 messageIdentifier:(id)a4 alternateCallbackID:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 messageContext:(id)a9
{
  LODWORD(v9) = a8;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a9;
  NSUInteger v18 = +[IDSInternalQueueController sharedInstance];
  int v19 = [v18 assertQueueIsCurrent];

  if (v19)
  {
    __int16 v20 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_191A3C338();
    }
  }
  id v21 = [v17 bytesSent];

  __int16 v22 = +[IDSLogging _IDSService];
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      BOOL v24 = v9 == 0;
      char v44 = (char)v9;
      id v9 = v13;
      if (v24) {
        uint64_t v25 = @"NO";
      }
      else {
        uint64_t v25 = @"YES";
      }
      uint64_t v26 = [v17 bytesSent];
      id v27 = [v17 totalBytes];
      *(_DWORD *)buf = 138414082;
      id v62 = self;
      __int16 v63 = 2112;
      id v64 = v14;
      __int16 v65 = 2112;
      id v66 = v15;
      __int16 v67 = 2048;
      int64_t v68 = a6;
      __int16 v69 = 2112;
      id v70 = v16;
      __int16 v71 = 2112;
      id v72 = v25;
      id v13 = v9;
      LOBYTE(v9) = v44;
      __int16 v73 = 2112;
      id v74 = v26;
      __int16 v75 = 2112;
      id v76 = v27;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "%@ got messageIdentifier %@ callbackID %@ updatedWithResponseCode: %ld error %@ lastCall %@ sentBytes %@ totalBytes %@", buf, 0x52u);
    }
  }
  else if (v23)
  {
    id v28 = @"NO";
    *(_DWORD *)buf = 138413570;
    id v62 = self;
    __int16 v63 = 2112;
    if (v9) {
      id v28 = @"YES";
    }
    id v64 = v14;
    __int16 v65 = 2112;
    id v66 = v15;
    __int16 v67 = 2048;
    int64_t v68 = a6;
    __int16 v69 = 2112;
    id v70 = v16;
    __int16 v71 = 2112;
    id v72 = v28;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "%@ got messageIdentifier %@ callbackID %@ updatedWithResponseCode: %ld error %@ lastCall %@", buf, 0x3Eu);
  }

  __int16 v29 = [v17 originalCommand];
  char v30 = [v29 isEqualToNumber:&unk_1EE28B370];

  if ((v30 & 1) == 0)
  {
    __int16 v31 = [v13 _internal];
    id v32 = [v31 account];

    if (!a6 && (v9 & 1) == 0)
    {
      uint64_t v33 = [v17 bytesSent];
      if (v33)
      {
        uint64_t v34 = (void *)v33;
        __int16 v35 = [v17 totalBytes];

        if (v35)
        {
          NSUInteger v36 = [v17 bytesSent];
          uint64_t v37 = [v36 integerValue];

          id v38 = [v17 totalBytes];
          uint64_t v45 = [v38 integerValue];

          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = sub_1919C5360;
          v56[3] = &unk_1E572C668;
          v56[4] = self;
          id v57 = v32;
          id v39 = v14;
          id v58 = v39;
          uint64_t v59 = v37;
          uint64_t v60 = v45;
          [(_IDSService *)self _callDelegatesWithBlock:v56];
          uniqueIDToProgress = self->_uniqueIDToProgress;
          if (uniqueIDToProgress)
          {
            double v41 = [(NSMutableDictionary *)uniqueIDToProgress objectForKeyedSubscript:v39];
            id v42 = v41;
            if (v41)
            {
              [v41 setTotalUnitCount:v45];
              [v42 setCompletedUnitCount:v37];
            }
          }
        }
      }
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_1919C53E0;
    v48[3] = &unk_1E572C690;
    v48[4] = self;
    id v49 = v32;
    id v50 = v14;
    id v51 = v15;
    int64_t v54 = a6;
    id v52 = v16;
    char v55 = (char)v9;
    id v53 = v17;
    id v43 = v32;
    [(_IDSService *)self _callDelegatesWithBlock:v48];
  }
}

- (void)connection:(id)a3 identifier:(id)a4 alternateCallbackID:(id)a5 willSendToDestinations:(id)a6 skippedDestinations:(id)a7 registrationPropertyToDestinations:(id)a8
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a3;
  __int16 v20 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a7) = [v20 assertQueueIsCurrent];

  if (a7)
  {
    id v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A3C3D0();
    }
  }
  __int16 v22 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    double v41 = [(_IDSService *)self serviceProperties];
    id v39 = [v41 identifier];
    IDSLoggableDescriptionForHandlesOnService();
    v23 = id v40 = v19;
    [(_IDSService *)self serviceProperties];
    BOOL v24 = v43 = v16;
    [v24 identifier];
    uint64_t v25 = v18;
    id v27 = v26 = v14;
    id v28 = IDSLoggableDescriptionForHandlesOnService();
    id v42 = v17;
    id v29 = v15;
    char v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    *(_DWORD *)buf = 138413570;
    id v52 = self;
    __int16 v53 = 2112;
    id v54 = v26;
    __int16 v55 = 2112;
    id v56 = v29;
    __int16 v57 = 2112;
    id v58 = v23;
    __int16 v59 = 2112;
    uint64_t v60 = v28;
    __int16 v61 = 2112;
    id v62 = v30;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "%@ got identifier %@ callbackID %@ willSendToDestinations %@ skippedDests %@ regPropsToDests (count) %@", buf, 0x3Eu);

    id v15 = v29;
    id v17 = v42;

    id v14 = v26;
    id v18 = v25;

    id v16 = v43;
    id v19 = v40;
  }

  __int16 v31 = [v19 _internal];

  id v32 = [v31 account];

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1919C582C;
  v44[3] = &unk_1E572C4B0;
  v44[4] = self;
  id v45 = v32;
  id v46 = v14;
  id v47 = v15;
  id v48 = v16;
  id v49 = v17;
  id v50 = v18;
  id v33 = v18;
  id v34 = v17;
  id v35 = v16;
  id v36 = v15;
  id v37 = v14;
  id v38 = v32;
  [(_IDSService *)self _callDelegatesWithBlock:v44];
}

- (void)connection:(id)a3 identifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6 context:(id)a7
{
  BOOL v9 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = +[IDSInternalQueueController sharedInstance];
  int v17 = [v16 assertQueueIsCurrent];

  if (v17)
  {
    id v18 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_191A3C468();
    }
  }
  id v19 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      __int16 v20 = @"YES";
    }
    else {
      __int16 v20 = @"NO";
    }
    NSUInteger v21 = [(NSMapTable *)self->_delegateToInfo count];
    *(_DWORD *)buf = 138413314;
    char v44 = self;
    __int16 v45 = 2112;
    id v46 = v12;
    __int16 v47 = 2112;
    id v48 = v20;
    __int16 v49 = 2112;
    id v50 = v13;
    __int16 v51 = 2048;
    NSUInteger v52 = v21;
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "%@ got identifier %@ didSendWithSuccess %@  error %@ num delegates: %lu", buf, 0x34u);
  }

  __int16 v22 = [v15 _internal];

  BOOL v23 = [v22 account];

  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  id v35 = sub_1919C5BA0;
  id v36 = &unk_1E572C6B8;
  id v37 = self;
  id v24 = v23;
  id v38 = v24;
  id v25 = v12;
  id v39 = v25;
  BOOL v42 = v9;
  id v26 = v13;
  id v40 = v26;
  id v27 = v14;
  id v41 = v27;
  [(_IDSService *)self _callDelegatesWithBlock:&v33];
  if (v25)
  {
    id v28 = -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v25, v33, v34, v35, v36, v37, v38, v39, v40);
    id v29 = v28;
    if (v28)
    {
      char v30 = [v28 first];
      ((void (**)(void, id))v30)[2](v30, v26);
    }
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v25];
  }
  uniqueIDToProgress = self->_uniqueIDToProgress;
  if (uniqueIDToProgress)
  {
    [(NSMutableDictionary *)uniqueIDToProgress removeObjectForKey:v25];
    if (![(NSMutableDictionary *)self->_uniqueIDToProgress count])
    {
      id v32 = self->_uniqueIDToProgress;
      self->_uniqueIDToProgress = 0;
    }
  }
}

- (void)connection:(id)a3 identifier:(id)a4 fromURI:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A3C500();
    }
  }
  int v17 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    char v30 = self;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v12;
    _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "%@ got identifier %@ hasBeenDeliveredWithContext %@", buf, 0x20u);
  }

  id v18 = [v13 _internal];

  id v19 = [v18 account];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1919C5E98;
  v24[3] = &unk_1E572C3C0;
  v24[4] = self;
  id v25 = v19;
  id v26 = v10;
  id v27 = v12;
  id v28 = v11;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v19;
  [(_IDSService *)self _callDelegatesWithBlock:v24];
}

- (void)connection:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A3C598();
    }
  }
  int v15 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "%@ didFlushCacheForRemoteURI %@ fromURI %@ guid %@", buf, 0x2Au);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1919C6168;
  v19[3] = &unk_1E572C460;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  [(_IDSService *)self _callDelegatesWithBlock:v19];
}

- (void)connection:(id)a3 didFlushCacheForKTPeerURI:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    int v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3C630();
    }
  }
  id v9 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "%@ didFlushCacheForKTPeerURI %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919C636C;
  v11[3] = &unk_1E572C328;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [(_IDSService *)self _callDelegatesWithBlock:v11];
}

- (void)connection:(id)a3 account:(id)a4 sessionInviteReceived:(id)a5 fromID:(id)a6 transportType:(id)a7 options:(id)a8 context:(id)a9 messageContext:(id)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a7;
  id v21 = a5;
  id v22 = +[IDSInternalQueueController sharedInstance];
  int v23 = [v22 assertQueueIsCurrent];

  if (v23)
  {
    id v24 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_191A3C6C8();
    }
  }
  __int16 v25 = +[_IDSSessionStore sharedInstance];
  id v26 = [v25 sessionForAccount:v15 fromID:v16 identifier:v21 transportType:v20];

  __int16 v27 = [v26 _internal];
  [v27 setBoostContext:v19];

  id v28 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v17;
    _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_INFO, "Sending up options to client: %@", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1919C6674;
  v34[3] = &unk_1E572C398;
  v34[4] = self;
  id v35 = v15;
  id v36 = v26;
  id v37 = v16;
  id v38 = v17;
  id v39 = v18;
  id v29 = v18;
  id v30 = v17;
  id v31 = v16;
  id v32 = v26;
  id v33 = v15;
  [(_IDSService *)self _callDelegatesWithBlock:v34];
}

- (void)connection:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A3C760();
    }
  }
  id v15 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Received group session participant update {service: %@, update: %@, context: %@}", buf, 0x20u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1919C6950;
  v19[3] = &unk_1E572C460;
  v19[4] = self;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  [(_IDSService *)self _callDelegatesWithBlock:v19];
}

- (void)connection:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3C7F8();
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1919C6B2C;
  v14[3] = &unk_1E572C6E0;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [(_IDSService *)self _callDelegatesWithBlock:v14];
}

- (void)connection:(id)a3 didSendOpportunisticDataWithIdentifier:(id)a4 toIDs:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3C890();
    }
  }
  id v12 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Recieved did send opportunistic data {service: %@, identifier: %@, toIDs: %@}", buf, 0x20u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1919C6D60;
  v15[3] = &unk_1E572C6E0;
  v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  [(_IDSService *)self _callDelegatesWithBlock:v15];
}

- (BOOL)isPretendingToBeFull
{
  id v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3C928();
    }
  }
  return self->_pretendingToBeFull;
}

- (void)setPretendingToBeFull:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3C9C0();
    }
  }
  if (self->_pretendingToBeFull != v3)
  {
    self->_pretendingToBeFull = v3;
    if (!v3)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = sub_1919C6F4C;
      v8[3] = &unk_1E572C1E8;
      v8[4] = self;
      [(_IDSService *)self _callDelegatesWithBlock:v8];
    }
  }
}

- (NSString)serviceDomain
{
  v2 = +[IDSInternalQueueController sharedInstance];
  int v3 = [v2 assertQueueIsCurrent];

  if (v3)
  {
    int v4 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_191A3CA58();
    }
  }
  return 0;
}

- (unint64_t)registrationRestrictionReason
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CAF0();
    }
  }
  int v6 = +[IDSDaemonController sharedInstance];
  id v7 = [v6 listener];
  id v8 = [(_IDSService *)self serviceProperties];
  id v9 = [v8 identifier];
  unint64_t v10 = [v7 restrictionReasonForService:v9];

  return v10;
}

- (IDSAccount)iCloudAccount
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CB88();
    }
  }
  int v6 = [(IDSAccountController *)self->_accountController _internal];
  id v7 = [v6 accounts];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "_internal", (void)v16);
        int v14 = [v13 accountType];

        if (v14 == 1)
        {
          id v9 = v12;
          goto LABEL_15;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (IDSAccount *)v9;
}

- (NSSet)internalAccounts
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CD50();
    }
  }
  int v6 = [(IDSAccountController *)self->_accountController _internal];
  id v7 = [v6 internalAccounts];

  id v8 = [(_IDSService *)self _filteredAccountsFrom:v7];

  return (NSSet *)v8;
}

- (IDSServiceProperties)serviceProperties
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CE80();
    }
  }
  serviceProperties = self->_serviceProperties;

  return serviceProperties;
}

- (BOOL)canSend
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CF18();
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v6 = [(IDSAccountController *)self->_accountController _internal];
  id v7 = [v6 accounts];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _internal];
        char v12 = [v11 canSend];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v8;
}

- (void)_reloadCachedLinkedDevices
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F6C3B8] reloadAccounts];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    linkedDevices = self->_linkedDevices;
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = linkedDevices;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Linked devices before %@", buf, 0xCu);
  }

  id v5 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1919C7720;
  v8[3] = &unk_1E5729000;
  v8[4] = self;
  [v5 performBlock:v8 waitUntilDone:1];

  int v6 = [MEMORY[0x1E4F6C3B8] reloadAccounts];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = self->_linkedDevices;
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Linked devices after %@", buf, 0xCu);
  }
}

- (void)_loadCachedLinkedDevices
{
  int v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3CFB0();
    }
  }
  if (!self->_linkedDevicesLoaded)
  {
    int v6 = +[IDSDaemonController sharedInstance];
    [v6 blockUntilConnected];

    id v7 = [(_IDSService *)self accounts];
    uint64_t v8 = [v7 anyObject];
    uint64_t v9 = [v8 serviceName];

    uint64_t v10 = [(_IDSService *)self daemonListener];
    uint64_t v11 = [v10 linkedDevicesForService:v9];

    [(_IDSService *)self _updateLinkedDevicesWithDevicesInfo:v11];
    self->_linkedDevicesLoaded = 1;
  }
}

- (void)_updateLinkedDevicesWithDevicesInfo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3D048();
    }
  }
  uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  linkedDevices = self->_linkedDevices;
  self->_linkedDevices = v8;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = [[IDSDevice alloc] _initWithDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        long long v15 = [self->_delegateContext object];
        [v14 _setService:v15];

        long long v16 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = [v14 _internal];
          long long v18 = [v17 compactDescription];
          *(_DWORD *)buf = 138412290;
          id v28 = v18;
          _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Adding linked IDSDevice %@", buf, 0xCu);
        }
        [(NSMutableArray *)self->_linkedDevices addObject:v14];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v11);
  }

  uint64_t v19 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = [(NSMutableArray *)self->_linkedDevices __imArrayByApplyingBlock:&unk_1EE245A68];
    int v21 = [v20 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v21;
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Linked devices updated with count %d", buf, 8u);
  }
}

- (id)linkedDevicesWithRelationship:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3D0E0();
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3)
  {
    uint64_t v9 = [(_IDSService *)self devices];
    [v8 addObjectsFromArray:v9];
  }
  uint64_t v10 = [(_IDSService *)self accounts];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    [(_IDSService *)self _loadCachedLinkedDevices];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = self->_linkedDevices;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "relationship", (void)v20);
          if (a3 != 1 && (v18 & a3) != 0 && [v17 relationship] != 1) {
            [v8 addObject:v17];
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }

  return v8;
}

- (NSArray)URIs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(_IDSService *)self accounts];
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    uint64_t v4 = *MEMORY[0x1E4F6B7D0];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v5;
        int v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = [v6 handles];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v13 = [v12 URI];
              uint64_t v14 = [v13 unprefixedURI];
              char v15 = [v14 isEqualToString:v4];

              if ((v15 & 1) == 0)
              {
                long long v16 = [v12 URI];
                [v3 addObject:v16];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }

  long long v17 = [v3 allObjects];

  return (NSArray *)v17;
}

- (int64_t)maxEffectivePayloadSize
{
  id v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v4 = +[IDSDaemonController sharedInstance];
  uint64_t v5 = [v4 listener];
  int v6 = [(IDSServiceProperties *)self->_serviceProperties identifier];
  int64_t v7 = [v5 maxEffectivePayloadSizeForService:v6];

  return v7;
}

- (NSDictionary)pseudonymURIMap
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(_IDSService *)self accounts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) pseudonymURIMap];
        [v3 addEntriesFromDictionary:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [(_IDSService *)self accounts];
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
          uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v9 = objc_msgSend(v8, "pseudonyms", v19);
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
                long long v15 = [v14 URI];
                char v16 = [v15 isEqualToURI:v4];

                if (v16)
                {
                  id v17 = v14;

                  goto LABEL_21;
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
LABEL_21:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)pseudonymsForMaskedURI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_IDSService *)self pseudonymURIMap];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_IDSService *)self pseudonymsForMaskedURI:a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1919C8454;
  v13[3] = &unk_1E572C708;
  id v14 = v6;
  id v8 = v6;
  uint64_t v9 = objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v13);
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v9;

  return v11;
}

- (id)_accountWithURI:(id)a3 orPseudonym:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [(_IDSService *)self accounts];
    uint64_t v30 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v30)
    {
      uint64_t v9 = *(void *)v41;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v8);
          }
          id v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v31 = v11;
          if (v6)
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            uint64_t v12 = [v11 handles];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v37;
              while (2)
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v37 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = [*(id *)(*((void *)&v36 + 1) + 8 * j) URI];
                  char v18 = [v17 isEqualToURI:v6];

                  if (v18)
                  {
LABEL_33:
                    id v26 = v31;

                    goto LABEL_34;
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            id v11 = v31;
          }
          if (v7)
          {
            long long v28 = v8;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            uint64_t v12 = [v11 pseudonyms];
            uint64_t v19 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v33;
              while (2)
              {
                for (uint64_t k = 0; k != v20; ++k)
                {
                  if (*(void *)v33 != v21) {
                    objc_enumerationMutation(v12);
                  }
                  long long v23 = [*(id *)(*((void *)&v32 + 1) + 8 * k) URI];
                  long long v24 = [(id)v7 URI];
                  char v25 = [v23 isEqualToURI:v24];

                  if (v25)
                  {
                    id v8 = v28;
                    goto LABEL_33;
                  }
                }
                uint64_t v20 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }

            id v8 = v28;
          }
          uint64_t v9 = v29;
        }
        id v26 = 0;
        uint64_t v30 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v30);
    }
    else
    {
      id v26 = 0;
    }
LABEL_34:
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)setWantsPseudonymUpdates:(BOOL)a3
{
  if (self->_wantsPseudonymUpdates != a3)
  {
    self->_wantsPseudonymUpdates = a3;
    if (a3)
    {
      id v4 = [(_IDSService *)self pseudonymURIMap];
      cachedPseudonymURIMap = self->_cachedPseudonymURIMap;
      self->_cachedPseudonymURIMap = v4;

      id v6 = objc_alloc(MEMORY[0x1E4F59DF8]);
      uint64_t v12 = +[IDSInternalQueueController sharedInstance];
      unint64_t v7 = [v12 queue];
      id v8 = (CUTDeferredTaskQueue *)[v6 initWithCapacity:1 queue:v7 block:&unk_1EE245A88];
      pseudonymUpdateTaskQueue = self->_pseudonymUpdateTaskQueue;
      self->_pseudonymUpdateTaskQueue = v8;

      uint64_t v10 = (CUTDeferredTaskQueue *)v12;
    }
    else
    {
      id v11 = self->_cachedPseudonymURIMap;
      self->_cachedPseudonymURIMap = 0;

      uint64_t v10 = self->_pseudonymUpdateTaskQueue;
      self->_pseudonymUpdateTaskQueue = 0;
    }
  }
}

- (void)account:(id)a3 pseudonymsChanged:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(_IDSService *)self wantsPseudonymUpdates])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(_IDSService *)self accounts];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) _internal];
          uint64_t v12 = [v11 uniqueID];
          char v13 = [v12 isEqualToString:v5];

          if (v13)
          {

            [(CUTDeferredTaskQueue *)self->_pseudonymUpdateTaskQueue enqueueExecutionWithTarget:self afterDelay:1.0];
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
LABEL_12:
}

- (void)_calloutPseudonymsDidUpdate
{
  if ([(_IDSService *)self wantsPseudonymUpdates])
  {
    id v3 = self->_cachedPseudonymURIMap;
    id v4 = [(_IDSService *)self pseudonymURIMap];
    id v5 = IDSServiceCalculatedPseudonymChanges_0(v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1919C9678;
    v9[3] = &unk_1E572C328;
    v9[4] = self;
    id v10 = v5;
    id v6 = v5;
    [(_IDSService *)self _callDelegatesWithBlock:v9];
    cachedPseudonymURIMap = self->_cachedPseudonymURIMap;
    self->_cachedPseudonymURIMap = v4;
    uint64_t v8 = v4;
  }
}

- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  if (!v11)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_IDSService.m", 3013, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v12 = [(_IDSService *)self _sendingAccountForAccount:0];
  char v13 = [(_IDSService *)self _preferredURIForAccount:v12];
  if (v13
    || ([(_IDSService *)self URIs],
        long long v14 = objc_claimAutoreleasedReturnValue(),
        [v14 firstObject],
        char v13 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13))
  {
    [(_IDSService *)self provisionPseudonymForURI:v13 withProperties:v9 requestProperties:v10 completion:v11];
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = [(_IDSService *)self accounts];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v16;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "No URI found on any account -- returning nil {accounts: %@}", buf, 0xCu);
    }
    char v13 = sub_1919C98E4(400);
    v11[2](v11, 0, v13);
  }
}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"_IDSService.m", 3029, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  long long v15 = [(_IDSService *)self _accountWithURI:v11 orPseudonym:0];
  if (v15)
  {
    id v33 = v13;
    id v34 = v12;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1919CA0B8;
    v35[3] = &unk_1E5728FD8;
    id v16 = v14;
    id v36 = v16;
    long long v17 = (void *)MEMORY[0x192FE03B0](v35);
    char v18 = [NSString stringGUID];
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    if (!completionBlocksByRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v21 = self->_completionBlocksByRequestID;
      self->_completionBlocksByRequestID = Mutable;

      completionBlocksByRequestID = self->_completionBlocksByRequestID;
    }
    long long v22 = (void *)MEMORY[0x1E4F6C3A8];
    long long v23 = (void *)MEMORY[0x192FE03B0](v16);
    long long v24 = (void *)MEMORY[0x192FE03B0](v17);
    char v25 = [v22 pairWithFirst:v23 second:v24];
    [(NSMutableDictionary *)completionBlocksByRequestID setObject:v25 forKey:v18];

    id v26 = [MEMORY[0x1E4F6C3B8] registration];
    id v12 = v34;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v38 = v11;
      __int16 v39 = 2112;
      long long v40 = v34;
      __int16 v41 = 2112;
      long long v42 = v18;
      __int16 v43 = 2112;
      char v44 = self;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "provisionPseudonymForURI called {URI: %@, properties: %@, requestUUID: %@, self: %@}", buf, 0x2Au);
    }

    long long v27 = [(_IDSService *)self daemonController];
    long long v28 = [v15 uniqueID];
    id v13 = v33;
    [v27 provisionPseudonymForURI:v11 onAccount:v28 withProperties:v34 requestProperties:v33 requestUUID:v18];

    uint64_t v29 = v36;
  }
  else
  {
    uint64_t v30 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [(_IDSService *)self accounts];
      *(_DWORD *)buf = 138412546;
      id v38 = v11;
      __int16 v39 = 2112;
      long long v40 = v31;
      _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "No account matched URI -- returning nil {URI: %@, accounts: %@}", buf, 0x16u);
    }
    uint64_t v29 = sub_1919C98E4(400);
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v29);
  }
}

- (void)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completion:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"_IDSService.m", 3050, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v14 = [(_IDSService *)self _accountWithURI:0 orPseudonym:v11];
  if (v14)
  {
    id v32 = v12;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1919CA4A4;
    v33[3] = &unk_1E5728FD8;
    id v15 = v13;
    id v34 = v15;
    id v16 = (void *)MEMORY[0x192FE03B0](v33);
    long long v17 = [NSString stringGUID];
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    if (!completionBlocksByRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v20 = self->_completionBlocksByRequestID;
      self->_completionBlocksByRequestID = Mutable;

      completionBlocksByRequestID = self->_completionBlocksByRequestID;
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F6C3A8];
    long long v22 = (void *)MEMORY[0x192FE03B0](v15);
    long long v23 = (void *)MEMORY[0x192FE03B0](v16);
    long long v24 = [v21 pairWithFirst:v22 second:v23];
    [(NSMutableDictionary *)completionBlocksByRequestID setObject:v24 forKey:v17];

    char v25 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v36 = v11;
      __int16 v37 = 2048;
      double v38 = a4;
      __int16 v39 = 2112;
      long long v40 = v17;
      __int16 v41 = 2112;
      long long v42 = self;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "renewPseudonym called {pseudonym: %@, expiry: %f, requestUUID: %@, self: %@}", buf, 0x2Au);
    }

    id v26 = [(_IDSService *)self daemonController];
    long long v27 = [v14 uniqueID];
    id v12 = v32;
    [v26 renewPseudonym:v11 onAccount:v27 forUpdatedExpiryEpoch:v32 requestProperties:v17 requestUUID:a4];

    long long v28 = v34;
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [(_IDSService *)self accounts];
      *(_DWORD *)buf = 138412546;
      id v36 = v11;
      __int16 v37 = 2112;
      double v38 = *(double *)&v30;
      _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "No account matched pseudonym -- returning nil {pseudonym: %@, accounts: %@}", buf, 0x16u);
    }
    long long v28 = sub_1919C98E4(400);
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v28);
  }
}

- (void)revokePseudonym:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_IDSService.m", 3071, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = [(_IDSService *)self _accountWithURI:0 orPseudonym:v9];
  if (v12)
  {
    id v30 = v10;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1919CA874;
    v31[3] = &unk_1E5728FD8;
    id v13 = v11;
    id v32 = v13;
    id v14 = (void *)MEMORY[0x192FE03B0](v31);
    id v15 = [NSString stringGUID];
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    if (!completionBlocksByRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      char v18 = self->_completionBlocksByRequestID;
      self->_completionBlocksByRequestID = Mutable;

      completionBlocksByRequestID = self->_completionBlocksByRequestID;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F6C3A8];
    uint64_t v20 = (void *)MEMORY[0x192FE03B0](v13);
    uint64_t v21 = (void *)MEMORY[0x192FE03B0](v14);
    long long v22 = [v19 pairWithFirst:v20 second:v21];
    [(NSMutableDictionary *)completionBlocksByRequestID setObject:v22 forKey:v15];

    long long v23 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      double v38 = self;
      _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "revokePseudonym called {pseudonym: %@, requestUUID: %@, self: %@}", buf, 0x20u);
    }

    long long v24 = [(_IDSService *)self daemonController];
    char v25 = [v12 uniqueID];
    id v10 = v30;
    [v24 revokePseudonym:v9 onAccount:v25 requestProperties:v30 requestUUID:v15];

    id v26 = v32;
  }
  else
  {
    long long v27 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = [(_IDSService *)self accounts];
      *(_DWORD *)buf = 138412546;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v28;
      _os_log_impl(&dword_19190B000, v27, OS_LOG_TYPE_DEFAULT, "No account matched pseudonym -- returning nil {pseudonym: %@, accounts: %@}", buf, 0x16u);
    }
    id v26 = sub_1919C98E4(400);
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v26);
  }
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F6B538];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSince1970];
  double v14 = v13 + a5;
  id v15 = [(IDSServiceProperties *)self->_serviceProperties identifier];
  v19[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  long long v17 = (void *)[v11 initWithFeatureID:v10 scopeID:v9 expiryEpoch:v16 allowedServices:v14];

  return v17;
}

- (void)finishedProvisioningPseudonym:(id)a3 success:(BOOL)a4 error:(id)a5 forRequestUUID:(id)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = sub_1919CACB8(a5);
  double v13 = [(NSMutableDictionary *)self->_completionBlocksByRequestID objectForKey:v11];
  double v14 = [v13 first];

  if (v14)
  {
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v11];
    id v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v27 = v10;
      if (v8) {
        id v16 = @"YES";
      }
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      __int16 v35 = self;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "finishedProvisioningPseudonym called {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }

    long long v17 = +[IDSInternalQueueController sharedInstance];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1919CADB8;
    v20[3] = &unk_1E572C750;
    uint64_t v21 = v10;
    BOOL v25 = v8;
    id v22 = v11;
    id v23 = v12;
    id v24 = v14;
    [v17 performBlock:v20];

    char v18 = v21;
  }
  else
  {
    char v18 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v27 = v10;
      __int16 v28 = 2112;
      if (v8) {
        uint64_t v19 = @"YES";
      }
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      __int16 v35 = self;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_INFO, "finishedProvisioningPseudonym called but no block! {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }
  }
}

- (void)finishedRenewingPseudonym:(id)a3 success:(BOOL)a4 error:(id)a5 requestUUID:(id)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = sub_1919CACB8(a5);
  double v13 = [(NSMutableDictionary *)self->_completionBlocksByRequestID objectForKey:v11];
  double v14 = [v13 first];

  if (v14)
  {
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v11];
    id v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v27 = v10;
      if (v8) {
        id v16 = @"YES";
      }
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      __int16 v35 = self;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "finishedRenewingPseudonym called {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }

    long long v17 = +[IDSInternalQueueController sharedInstance];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1919CB168;
    v20[3] = &unk_1E572C750;
    uint64_t v21 = v10;
    BOOL v25 = v8;
    id v22 = v11;
    id v23 = v12;
    id v24 = v14;
    [v17 performBlock:v20];

    char v18 = v21;
  }
  else
  {
    char v18 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v27 = v10;
      __int16 v28 = 2112;
      if (v8) {
        uint64_t v19 = @"YES";
      }
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      __int16 v35 = self;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_INFO, "finishedRenewingPseudonym called but no block! {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }
  }
}

- (void)finishedRevokingPseudonymWithSuccess:(BOOL)a3 error:(id)a4 requestUUID:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = sub_1919CACB8(a4);
  id v10 = [(NSMutableDictionary *)self->_completionBlocksByRequestID objectForKey:v8];
  id v11 = [v10 first];

  if (v11)
  {
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v8];
    id v12 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v6) {
        double v13 = @"YES";
      }
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = self;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "finishedRevokingPseudonymWithSuccess called {success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x2Au);
    }

    double v14 = +[IDSInternalQueueController sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1919CB4E0;
    v17[3] = &unk_1E572BE98;
    BOOL v21 = v6;
    char v18 = v8;
    id v19 = v9;
    id v20 = v11;
    [v14 performBlock:v17];

    id v15 = v18;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v6) {
        id v16 = @"YES";
      }
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = self;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_INFO, "finishedRevokingPseudonymWithSuccess called but no block {success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x2Au);
    }
  }
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  double v13 = (void (**)(id, void, void *))a6;
  if (v13)
  {
    if (!v11)
    {
LABEL_14:
      __int16 v35 = sub_1919CB9E4(1u);
      v13[2](v13, 0, v35);

      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"_IDSService.m", 3159, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (!v11) {
      goto LABEL_14;
    }
  }
  if ((IDSIsValidSigningAlgorithm() & 1) == 0) {
    goto LABEL_14;
  }
  double v14 = [v12 keyDiversifier];
  id v15 = [v14 diversifier];
  int v16 = v15 != 0;

  long long v17 = [v12 keyDiversifier];
  char v18 = [v17 trackingPreventionSecret];
  int v19 = v18 == 0;

  BOOL v20 = [v12 keyType] != 1;
  if (v16 == v19 || ((v16 ^ v20) & 1) == 0)
  {
    __int16 v34 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_191A3D178();
    }

    goto LABEL_14;
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1919CC060;
  v44[3] = &unk_1E5728FD8;
  BOOL v21 = v13;
  id v45 = v21;
  uint64_t v22 = MEMORY[0x192FE03B0](v44);
  id v23 = [NSString stringGUID];
  completionBlocksByRequestID = self->_completionBlocksByRequestID;
  if (!completionBlocksByRequestID)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    __int16 v26 = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;

    completionBlocksByRequestID = self->_completionBlocksByRequestID;
  }
  id v27 = (void *)MEMORY[0x1E4F6C3A8];
  __int16 v28 = (void *)MEMORY[0x192FE03B0](v21);
  __int16 v37 = (void *)v22;
  uint64_t v29 = (void *)MEMORY[0x192FE03B0](v22);
  uint64_t v30 = [v27 pairWithFirst:v28 second:v29];
  [(NSMutableDictionary *)completionBlocksByRequestID setObject:v30 forKey:v23];

  id v31 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    uint64_t v47 = v23;
    __int16 v48 = 2112;
    id v49 = v11;
    __int16 v50 = 2048;
    int64_t v51 = a4;
    __int16 v52 = 2112;
    id v53 = v12;
    __int16 v54 = 2112;
    __int16 v55 = self;
    _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "signData called {requestID: %@, data: %@, algo: %ld, options: %@, self: %@}", buf, 0x34u);
  }

  __int16 v32 = [(_IDSService *)self daemonController];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1919CC0C4;
  v38[3] = &unk_1E572C778;
  int64_t v43 = a4;
  id v39 = v11;
  long long v40 = self;
  id v41 = v12;
  id v42 = v23;
  id v33 = v23;
  [v32 forwardMethodWithReplyIsSync:0 block:v38];

LABEL_15:
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 options:(id)a7 completion:(id)a8
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  int v19 = (void (**)(id, void, void *))a8;
  if (!v19)
  {
    int64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"_IDSService.m", 3194, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
LABEL_17:
    unsigned int v41 = 1;
LABEL_18:
    id v42 = sub_1919CB9E4(v41);
    v19[2](v19, 0, v42);

    goto LABEL_19;
  }
  if (!v15) {
    goto LABEL_17;
  }
LABEL_3:
  if (!v16 || !v17 || (IDSIsValidSigningAlgorithm() & 1) == 0) {
    goto LABEL_17;
  }
  BOOL v20 = [v18 keyDiversifier];
  BOOL v21 = [v20 diversifier];
  int v22 = v21 != 0;

  id v23 = [v18 keyDiversifier];
  __int16 v24 = [v23 trackingPreventionSecret];
  int v25 = v24 == 0;

  BOOL v26 = [v18 keyType] != 1;
  if (v22 == v25 || ((v22 ^ v26) & 1) == 0)
  {
    long long v40 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_191A3D178();
    }

    goto LABEL_17;
  }
  if (([v17 isTokenURI] & 1) == 0)
  {
    unsigned int v41 = 2;
    goto LABEL_18;
  }
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1919CC5F0;
  v55[3] = &unk_1E5728FD8;
  id v27 = self;
  __int16 v28 = v19;
  id v56 = v28;
  uint64_t v29 = MEMORY[0x192FE03B0](v55);
  char v44 = [NSString stringGUID];
  id v46 = v27;
  completionBlocksByRequestID = v27->_completionBlocksByRequestID;
  if (!completionBlocksByRequestID)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    __int16 v32 = v27->_completionBlocksByRequestID;
    v27->_completionBlocksByRequestID = (NSMutableDictionary *)Mutable;

    completionBlocksByRequestID = v27->_completionBlocksByRequestID;
  }
  id v33 = (void *)MEMORY[0x1E4F6C3A8];
  __int16 v34 = (void *)MEMORY[0x192FE03B0](v28);
  id v45 = (void *)v29;
  __int16 v35 = (void *)MEMORY[0x192FE03B0](v29);
  uint64_t v36 = [v33 pairWithFirst:v34 second:v35];
  [(NSMutableDictionary *)completionBlocksByRequestID setObject:v36 forKey:v44];

  __int16 v37 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    id v58 = v44;
    __int16 v59 = 2112;
    id v60 = v15;
    __int16 v61 = 2112;
    id v62 = v16;
    __int16 v63 = 2112;
    id v64 = v17;
    __int16 v65 = 2048;
    int64_t v66 = a6;
    __int16 v67 = 2112;
    id v68 = v18;
    __int16 v69 = 2112;
    id v70 = v46;
    _os_log_impl(&dword_19190B000, v37, OS_LOG_TYPE_DEFAULT, "verifySignedData called {requestID: %@, signedData: %@, data: %@, uri: %@, algo: %ld, options: %@, self: %@}", buf, 0x48u);
  }

  double v38 = [(_IDSService *)v46 daemonController];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1919CC654;
  v47[3] = &unk_1E572C7A0;
  id v48 = v15;
  int64_t v54 = a6;
  id v49 = v16;
  __int16 v50 = v46;
  id v51 = v17;
  id v52 = v18;
  id v53 = v44;
  id v39 = v44;
  [v38 forwardMethodWithReplyIsSync:0 block:v47];

LABEL_19:
}

- (void)finishedSigningForRequest:(id)a3 signedData:(id)a4 error:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1919CACB8(a5);
  id v11 = [(NSMutableDictionary *)self->_completionBlocksByRequestID objectForKey:v8];
  id v12 = [v11 first];

  if (v12)
  {
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v8];
    double v13 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      int v25 = v10;
      __int16 v26 = 2112;
      id v27 = self;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "finishedSigningForRequest called {requestUUID: %@, signedData: %@, error: %@, self: %@}", buf, 0x2Au);
    }

    double v14 = +[IDSInternalQueueController sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1919CC950;
    v16[3] = &unk_1E5729948;
    int v19 = v12;
    id v17 = v9;
    id v18 = v10;
    [v14 performBlock:v16];

    id v15 = v19;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      int v25 = v10;
      __int16 v26 = 2112;
      id v27 = self;
      _os_log_error_impl(&dword_19190B000, v15, OS_LOG_TYPE_ERROR, "finishedSigningForRequest called but no block! {requestUUID: %@, signedData: %@, error: %@, self: %@}", buf, 0x2Au);
    }
  }
}

- (void)finishedVerifyingSignedDataForRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = sub_1919CACB8(a5);
  id v10 = [(NSMutableDictionary *)self->_completionBlocksByRequestID objectForKey:v8];
  id v11 = [v10 first];

  if (v11)
  {
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v8];
    id v12 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double v13 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v22 = v8;
      if (v6) {
        double v13 = @"YES";
      }
      __int16 v23 = 2112;
      __int16 v24 = v13;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = self;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "finishedVerifyingSignedDataForRequest called {requestUUID: %@, sucess: %@, error: %@, self: %@}", buf, 0x2Au);
    }

    double v14 = +[IDSInternalQueueController sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1919CCBD4;
    v17[3] = &unk_1E57298D0;
    int v19 = v11;
    BOOL v20 = v6;
    id v18 = v9;
    [v14 performBlock:v17];

    id v15 = v19;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v22 = v8;
      __int16 v23 = 2112;
      if (v6) {
        id v16 = @"YES";
      }
      __int16 v24 = v16;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = self;
      _os_log_error_impl(&dword_19190B000, v15, OS_LOG_TYPE_ERROR, "finishedVerifyingSignedDataForRequest called but no block! {requestUUID: %@, sucess: %@, error: %@, self: %@}", buf, 0x2Au);
    }
  }
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    __int16 v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"_IDSService.m", 3266, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  if ([v11 FZIDType] == 4)
  {
    uint64_t v14 = [(_IDSService *)self _accountWithURI:v12 orPseudonym:0];
    id v15 = (void *)v14;
    if (v12)
    {
      if (!v14) {
        goto LABEL_15;
      }
    }
    else
    {
      id v16 = [0 prefixedURI];
      uint64_t v17 = [(_IDSService *)self _sendingAccountForAccount:0 destination:0 fromID:v16];

      id v12 = [(_IDSService *)self _preferredURIForAccount:v17];
      id v15 = (void *)v17;
      if (!v17) {
        goto LABEL_15;
      }
    }
    if (v12)
    {
      int64_t v36 = a3;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1919CD2A0;
      v37[3] = &unk_1E5728FD8;
      id v18 = v13;
      id v38 = v18;
      uint64_t v19 = MEMORY[0x192FE03B0](v37);
      BOOL v20 = [NSString stringGUID];
      completionBlocksByRequestID = self->_completionBlocksByRequestID;
      if (!completionBlocksByRequestID)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        __int16 v23 = self->_completionBlocksByRequestID;
        self->_completionBlocksByRequestID = Mutable;

        completionBlocksByRequestID = self->_completionBlocksByRequestID;
      }
      __int16 v24 = (void *)MEMORY[0x1E4F6C3A8];
      __int16 v25 = (void *)MEMORY[0x192FE03B0](v18);
      __int16 v35 = (void *)v19;
      __int16 v26 = (void *)MEMORY[0x192FE03B0](v19);
      __int16 v27 = [v24 pairWithFirst:v25 second:v26];
      [(NSMutableDictionary *)completionBlocksByRequestID setObject:v27 forKey:v20];

      uint64_t v28 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v40 = v11;
        __int16 v41 = 2112;
        id v42 = v12;
        __int16 v43 = 2112;
        char v44 = v20;
        __int16 v45 = 2112;
        id v46 = self;
        _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_DEFAULT, "reportApprovalOfURI called {tempURI: %@, fromURI: %@, requestID: %@, self: %@}", buf, 0x2Au);
      }

      uint64_t v29 = [(_IDSService *)self daemonController];
      uint64_t v30 = [v15 uniqueID];
      [v29 reportAction:v36 ofTempURI:v11 fromURI:v12 onAccount:v30 requestUUID:v20];

      id v31 = v38;
      goto LABEL_18;
    }
LABEL_15:
    __int16 v32 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(_IDSService *)self accounts];
      *(_DWORD *)buf = 138412546;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v33;
      _os_log_impl(&dword_19190B000, v32, OS_LOG_TYPE_DEFAULT, "No account matched to report with -- returning nil {fromURI: %@, accounts: %@}", buf, 0x16u);
    }
    id v31 = sub_1919CCFFC(400);
    (*((void (**)(id, void *))v13 + 2))(v13, v31);
LABEL_18:

    goto LABEL_19;
  }
  id v15 = sub_1919CCFFC(400);
  (*((void (**)(id, void *))v13 + 2))(v13, v15);
LABEL_19:
}

- (void)finishedReportingRequestUUID:(id)a3 withError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = sub_1919CACB8(a4);
  id v8 = [(NSMutableDictionary *)self->_completionBlocksByRequestID objectForKey:v6];
  id v9 = [v8 first];

  if (v9)
  {
    [(NSMutableDictionary *)self->_completionBlocksByRequestID removeObjectForKey:v6];
    id v10 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "finishedReportingRequestUUID called {requestUUID: %@, error:%@, self: %@}", (uint8_t *)&v12, 0x20u);
    }

    ((void (**)(void, void *))v9)[2](v9, v7);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "finishedReportingRequestUUID called but no block {requestUUID: %@, error:%@, self: %@}", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (BOOL)updateSubServices:(id)a3 forDevice:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A3D2A0();
    }
  }
  if (v7) {
    goto LABEL_17;
  }
  id v11 = [(_IDSService *)self devices];
  int v12 = (void *)[v11 _copyForEnumerating];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = v12;
  uint64_t v7 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v14 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = ((char *)i + 1))
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v13);
        }
        __int16 v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "_internal", (void)v33);
        int v18 = [v17 isActive];

        if (v18)
        {
          uint64_t v7 = v16;
          goto LABEL_16;
        }
      }
      uint64_t v7 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  if (v7)
  {
LABEL_17:
    uint64_t v19 = [v7 _internal];
    BOOL v20 = [v19 uniqueIDOverride];

    if (![v20 length])
    {
      id v21 = [v7 _internal];
      uint64_t v22 = [v21 uniqueID];

      BOOL v20 = (void *)v22;
    }
    if ([v20 length])
    {
      __int16 v23 = [(NSMutableDictionary *)self->_subServices objectForKey:v20];
      __int16 v24 = v23;
      if (v23 != v6 && ([v23 isEqualToArray:v6] & 1) == 0)
      {
        subServices = self->_subServices;
        if (!subServices)
        {
          CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          __int16 v27 = self->_subServices;
          self->_subServices = Mutable;

          subServices = self->_subServices;
        }
        [(NSMutableDictionary *)subServices setObject:v6 forKey:v20];
        uint64_t v28 = [(_IDSService *)self daemonController];
        uint64_t v29 = [(IDSAccountController *)self->_accountController _internal];
        uint64_t v30 = [v29 serviceName];
        [v28 updateSubServices:v6 forService:v30 deviceUniqueID:v20];

        BOOL v31 = 1;
        goto LABEL_28;
      }
    }
    else
    {
      __int16 v24 = [MEMORY[0x1E4F6C3B8] warning];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_191A3D21C(v7);
      }
    }
    BOOL v31 = 0;
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v7 = [MEMORY[0x1E4F6C3B8] warning];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_191A3D1E8();
  }
  BOOL v31 = 0;
LABEL_29:

  return v31;
}

- (void)resendSubServicesToDaemonForCurrentDevice
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3D36C();
    }
  }
  id v6 = [MEMORY[0x1E4F6C3B8] warning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_191A3D338();
  }

  uint64_t v7 = [(_IDSService *)self devices];
  id v8 = (void *)[v7 _copyForEnumerating];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  id v10 = (id)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "_internal", (void)v24);
        int v15 = [v14 isActive];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_17;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (v10)
  {
    __int16 v16 = [v10 _internal];
    uint64_t v17 = [v16 uniqueIDOverride];

    if (![v17 length])
    {
      int v18 = [v10 _internal];
      uint64_t v19 = [v18 uniqueID];

      uint64_t v17 = v19;
    }
    if ([v17 length])
    {
      BOOL v20 = [(NSMutableDictionary *)self->_subServices objectForKey:v17];
      id v21 = [(_IDSService *)self daemonController];
      uint64_t v22 = [(IDSAccountController *)self->_accountController _internal];
      __int16 v23 = [v22 serviceName];
      [v21 updateSubServices:v20 forService:v23 deviceUniqueID:v17];
    }
    else
    {
      BOOL v20 = [MEMORY[0x1E4F6C3B8] warning];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_191A3D21C(v10);
      }
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A3D1E8();
    }
  }
}

- (void)setProtobufAction:(SEL)a3 forProtobufType:(unsigned __int16)a4 isResponse:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  int v18 = _os_activity_create(&dword_19190B000, "Framework Set Protobuf Action", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  id v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F29060] callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_191A3D404();
    }
  }
  if (a3)
  {
    if (!self->_protobufSelectors)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      protobufSelectors = self->_protobufSelectors;
      self->_protobufSelectors = Mutable;
    }
    uint64_t v14 = (void *)MEMORY[0x192FE0160]();
    int v15 = [MEMORY[0x1E4F6B528] keyRepresentationForType:v6 isResponse:v5];
    __int16 v16 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
    [(NSMutableDictionary *)self->_protobufSelectors setObject:v16 forKey:v15];
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (SEL)protobufActionForType:(unsigned __int16)a3 isResponse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int16 v16 = _os_activity_create(&dword_19190B000, "Framework Get Protobuf Action", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v16, &state);
  uint64_t v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F29060] callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_191A3D458();
    }
  }
  int v10 = (void *)MEMORY[0x192FE0160]();
  uint64_t v11 = [MEMORY[0x1E4F6B528] keyRepresentationForType:v5 isResponse:v4];
  int v12 = [(NSMutableDictionary *)self->_protobufSelectors objectForKey:v11];
  id v13 = (const char *)[v12 pointerValue];

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v13;
}

- (BOOL)canSendMessageWithAccount:(id)a3 toDestination:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Attempting To Send message from account %@ to destinations %@", buf, 0x16u);
  }

  id v9 = [(IDSAccountController *)self->_accountController _internal];
  int v10 = [v9 serviceName];

  if (([v10 isEqualToIgnoringCase:@"com.apple.private.alloy.idscredentials"] & 1) != 0
    || ([v10 isEqualToIgnoringCase:@"com.apple.private.alloy.pbbridge"] & 1) != 0)
  {
    goto LABEL_22;
  }
  if (!self->_clientIsSandboxed)
  {
    uint64_t v11 = [MEMORY[0x1E4F6C3B8] warning];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3D4AC();
    }
  }
  if ([v6 accountType] == 2)
  {
    int v12 = [v7 destinationURIs];
    unint64_t v13 = [v12 count];

    if (v13 < 2)
    {
      __int16 v16 = [v7 destinationURIs];
      uint64_t v17 = [v16 allObjects];
      int v18 = objc_msgSend(v17, "__imFirstObject");
      uint64_t v19 = [v18 _stripFZIDPrefix];
      if ([v19 _appearsToBeEmail])
      {
      }
      else
      {
        long long v25 = [v7 destinationURIs];
        [v25 allObjects];
        v20 = uint64_t v28 = v17;
        objc_msgSend(v20, "__imFirstObject");
        id v21 = v27 = v16;
        uint64_t v22 = [v21 _stripFZIDPrefix];
        char v26 = [v22 _appearsToBePhoneNumber];

        if ((v26 & 1) == 0)
        {
          BOOL v23 = ![(_IDSService *)self _isDroppingMessages];
          goto LABEL_23;
        }
      }
      uint64_t v14 = +[IDSLogging _IDSService];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_WORD *)buf = 0;
      int v15 = "Attempting to send to a remote destination from a local account, this is permited if proxy is permitted and "
            "will fail in the daemon if not";
      goto LABEL_20;
    }
    uint64_t v14 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v15 = "Attempting to send to more than 1 destination, this message will fail in the daemon if necessary";
LABEL_20:
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
  }
  else
  {
    uint64_t v14 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v15 = "Attempting to send on a non local account, this message is allowed to progress";
      goto LABEL_20;
    }
  }
LABEL_21:

LABEL_22:
  LOBYTE(v23) = 1;
LABEL_23:

  return v23;
}

- (id)_preferredURIForAccount:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F6B5C8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 aliasStrings];

  int v8 = [(_IDSService *)self serviceProperties];
  id v9 = [v8 identifier];
  _IDSPrefersPhoneNumbersForServiceIdentifier();
  int v10 = (void *)_IDSCopyCallerID();
  uint64_t v11 = (void *)[v6 initWithUnprefixedURI:v10];

  return v11;
}

- (id)_sendingAccountForAccount:(id)a3
{
  return [(_IDSService *)self _sendingAccountForAccount:a3 destination:0 fromID:0];
}

- (id)_sendingAccountForAccount:(id)a3 destination:(id)a4 fromID:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [v8 _internal];
    int v12 = [v11 serviceName];
    if ([v12 isEqualToString:@"com.apple.madrid"])
    {
LABEL_11:

LABEL_12:
      id v21 = v8;
      goto LABEL_59;
    }
    unint64_t v13 = [v8 _internal];
    uint64_t v14 = [v13 serviceName];
    if ([v14 isEqualToString:@"com.apple.madrid.lite"])
    {
LABEL_10:

      goto LABEL_11;
    }
    id v80 = v10;
    int v15 = [v8 _internal];
    __int16 v16 = [v15 serviceName];
    if ([v16 isEqualToString:@"com.apple.private.alloy.biz"])
    {
LABEL_9:

      id v10 = v80;
      goto LABEL_10;
    }
    id v84 = v15;
    uint64_t v17 = [v8 _internal];
    int v18 = [v17 serviceName];
    if ([v18 isEqualToString:@"com.apple.private.alloy.sms"])
    {
LABEL_8:

      int v15 = v84;
      goto LABEL_9;
    }
    __int16 v82 = v16;
    uint64_t v77 = v17;
    uint64_t v19 = [v8 _internal];
    BOOL v20 = [v19 serviceName];
    if ([v20 isEqualToString:@"com.apple.private.alloy.facetime.multi"])
    {

      uint64_t v17 = v77;
      __int16 v16 = v82;
      goto LABEL_8;
    }
    __int16 v75 = v20;
    id v76 = v19;
    id v74 = [v8 _internal];
    __int16 v73 = [v74 serviceName];
    if ([v73 isEqualToString:@"com.apple.private.alloy.facetime.audio"])
    {
      char v63 = 1;
    }
    else
    {
      id v72 = [v8 _internal];
      uint64_t v71 = [v72 serviceName];
      if ([v71 isEqualToString:@"com.apple.private.alloy.facetime.video"])
      {
        char v64 = 1;
      }
      else
      {
        __int16 v65 = [v8 _internal];
        id v70 = [v65 serviceName];
        if ([v70 isEqualToString:@"com.apple.private.alloy.maps.eta"])
        {
          char v64 = 1;
        }
        else
        {
          __int16 v69 = [v8 _internal];
          id v68 = [v69 serviceName];
          if ([v68 isEqualToString:@"com.apple.private.alloy.nearby"])
          {
            char v64 = 1;
          }
          else
          {
            __int16 v67 = [v8 _internal];
            int64_t v66 = [v67 serviceName];
            char v64 = [v66 isEqualToString:@"com.apple.private.alloy.willow"];
          }
        }
      }
      char v63 = v64;
    }

    id v10 = v80;
    if (v63) {
      goto LABEL_12;
    }
    id v23 = v8;
  }
  else
  {
    uint64_t v22 = [(_IDSService *)self accounts];
    id v23 = [v22 anyObject];
  }
  long long v24 = [(IDSAccountController *)self->_accountController _internal];
  long long v25 = [v24 accounts];
  char v26 = [v25 allObjects];
  long long v27 = objc_msgSend(v26, "__imArrayByFilteringWithBlock:", &unk_1EE245AA8);
  uint64_t v28 = [v27 sortedArrayUsingComparator:&unk_1EE245B08];

  uint64_t v29 = [(_IDSService *)self iCloudAccount];
  id v83 = (void *)v29;
  SEL v85 = v28;
  if (v9 && (id v30 = (void *)v29, [v8 accountType] != 2))
  {
    id v78 = v9;
    id v81 = v10;
    [v9 destinationURIs];
    uint64_t v33 = v32 = v30;
    long long v34 = objc_msgSend(v33, "__imSetByApplyingBlock:", &unk_1EE245AC8);
    long long v35 = (void *)[v34 mutableCopy];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v36 = [v32 handles];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v90 objects:v95 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v91 != v39) {
            objc_enumerationMutation(v36);
          }
          __int16 v41 = [*(id *)(*((void *)&v90 + 1) + 8 * i) URI];
          id v42 = [v41 unprefixedURI];
          [v35 removeObject:v42];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v90 objects:v95 count:16];
      }
      while (v38);
    }

    BOOL v31 = [v35 count] != 0;
    id v9 = v78;
    id v10 = v81;
    uint64_t v28 = v85;
  }
  else
  {
    BOOL v31 = 0;
  }
  __int16 v43 = objc_msgSend(v28, "__imArrayByFilteringWithBlock:", &unk_1EE245AE8);
  char v44 = [(_IDSService *)self serviceProperties];
  __int16 v45 = [v44 identifier];
  int v46 = _IDSPrefersPhoneNumbersForServiceIdentifier();

  if (v46 && [v43 count])
  {
    id v47 = [v43 firstObject];
    id v48 = v85;
LABEL_38:
    id v49 = v83;
    goto LABEL_39;
  }
  id v49 = v83;
  if (!v83 || v31 && ([v83 isUsableForOuterMessaging] & 1) == 0 && objc_msgSend(v43, "count"))
  {
    id v48 = v85;
    if (![v85 count]) {
      goto LABEL_40;
    }
    id v50 = v10;
    id v51 = [v43 firstObject];
    id v52 = v51;
    if (v51)
    {
      id v53 = v51;
    }
    else
    {
      id v53 = [v85 firstObject];
    }
    id v47 = v53;

    id v23 = v52;
    id v10 = v50;
    goto LABEL_38;
  }
  id v47 = v83;
  id v48 = v85;
LABEL_39:

  id v23 = v47;
LABEL_40:
  if (v10 && ![(_IDSService *)self _canAccount:v23 sendWithFromID:v10])
  {
    if (v23 == v49 || ![(_IDSService *)self _canAccount:v49 sendWithFromID:v10])
    {
      id v55 = v10;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v54 = v48;
      uint64_t v56 = [v54 countByEnumeratingWithState:&v86 objects:v94 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        id v79 = v9;
        uint64_t v58 = *(void *)v87;
        while (2)
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v87 != v58) {
              objc_enumerationMutation(v54);
            }
            id v60 = *(id *)(*((void *)&v86 + 1) + 8 * j);
            if (v23 != v60
              && [(_IDSService *)self _canAccount:*(void *)(*((void *)&v86 + 1) + 8 * j) sendWithFromID:v55])
            {
              id v61 = v60;

              id v23 = v61;
              goto LABEL_56;
            }
          }
          uint64_t v57 = [v54 countByEnumeratingWithState:&v86 objects:v94 count:16];
          if (v57) {
            continue;
          }
          break;
        }
LABEL_56:
        id v9 = v79;
        id v10 = v55;
        id v49 = v83;
        id v48 = v85;
      }
    }
    else
    {
      id v54 = v23;
      id v23 = v49;
    }
  }
  id v21 = v23;

LABEL_59:

  return v21;
}

- (BOOL)_canAccount:(id)a3 sendWithFromID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)IDSCopyRawAddressForDestination(v6);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = [v5 aliasStrings];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      unint64_t v13 = [*(id *)(*((void *)&v26 + 1) + 8 * v12) _stripFZIDPrefix];
      char v14 = [v7 isEqualToString:v13];

      if (v14) {
        goto LABEL_19;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (![v6 _appearsToBePseudonymID])
  {
    LOBYTE(v15) = 0;
    goto LABEL_21;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend(v5, "pseudonyms", 0);
  uint64_t v15 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
LABEL_12:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v8);
      }
      int v18 = [*(id *)(*((void *)&v22 + 1) + 8 * v17) URI];
      uint64_t v19 = [v18 prefixedURI];
      char v20 = [v7 isEqualToString:v19];

      if (v20) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v15) {
          goto LABEL_12;
        }
        goto LABEL_20;
      }
    }
LABEL_19:
    LOBYTE(v15) = 1;
  }
LABEL_20:

LABEL_21:
  return v15;
}

- (BOOL)sendOpportunisticData:(id)a3 options:(id)a4 identifier:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (__CFString *)a5;
  unint64_t v13 = +[IDSInternalQueueController sharedInstance];
  int v14 = [v13 assertQueueIsCurrent];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_191A3D4E0();
    }
  }
  if (!v12) {
    uint64_t v12 = @"Default";
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v16 = [v11 dictionaryRepresentation];
  uint64_t v17 = [(_IDSService *)self _sendingAccountForAccount:0];
  int v18 = [v17 uniqueID];

  uint64_t v19 = [MEMORY[0x1E4F6B460] opportunistic];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    long long v25 = v12;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2048;
    uint64_t v29 = [v10 length];
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Client request to send opportunistic data {identifier: %@, options: %@, dataLength: %llu}", (uint8_t *)&v24, 0x20u);
  }
  if (!v16) {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CC08];
  }

  char v20 = [(_IDSService *)self daemonController];
  id v21 = [(IDSAccountController *)self->_accountController _internal];
  long long v22 = [v21 serviceName];
  [v20 sendOpportunisticData:v10 onService:v22 usingAccountWithUniqueID:v18 withIdentifier:v12 options:v16];

  return 1;
}

- (BOOL)cancelOpportunisticDataWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = @"Default";
  }
  if (a4) {
    *a4 = 0;
  }
  id v8 = [(IDSAccountController *)self->_accountController _internal];
  uint64_t v9 = [v8 serviceName];

  id v10 = [MEMORY[0x1E4F6B460] opportunistic];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Client request to cancel opportunistic data {identifier: %@, serviceName: %@}", (uint8_t *)&v13, 0x16u);
  }

  id v11 = [(_IDSService *)self daemonController];
  [v11 cancelOpportunisticDataOnService:v9 withIdentifier:v7];

  return 1;
}

- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v7 = a4;
  id v69 = a5;
  id v8 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a4) = [v8 assertQueueIsCurrent];

  if (a4)
  {
    uint64_t v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3D578();
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v11 = [v79 recipientURI];
  uint64_t v12 = [v11 prefixedURI];
  int v13 = objc_msgSend(v10, "initWithObjects:", v12, 0);

  int v14 = [v79 senderURI];
  __int16 v15 = [v14 prefixedURI];

  uint64_t v16 = (void *)MEMORY[0x1E4F6B438];
  if (v15)
  {
    uint64_t v17 = [v13 setByAddingObject:v15];
    id v76 = [v16 destinationWithDestinations:v17];
  }
  else
  {
    id v76 = [MEMORY[0x1E4F6B438] destinationWithDestinations:v13];
  }
  int v18 = [(_IDSService *)self _sendingAccountForAccount:0 destination:v76 fromID:v15];
  uint64_t v19 = [v18 _internal];
  id v72 = [v19 uniqueID];

  id v74 = [v7 identifier];
  char v20 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v21 = [v79 payload];
  if (v21) {
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F6B1B8], v21);
  }
  theDict = v20;

  long long v22 = [v79 encryptionProperties];
  long long v23 = [v22 segmentNumber];

  if (v23) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B058], v23);
  }

  int v24 = [v79 encryptionProperties];
  long long v25 = [v24 totalSegments];

  if (v25) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B3B0], v25);
  }
  id v70 = v13;

  __int16 v26 = [v7 originalUUID];
  if (v26) {
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E4F6B1B0], v26);
  }

  id v27 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v71 = v7;
  __int16 v28 = [v7 dictionaryRepresentation];
  uint64_t v29 = [v27 dictionaryWithDictionary:v28];

  CFDictionarySetValue(v29, @"IDSSendMessageOptionTopLevelDictionary", MEMORY[0x1E4F1CC38]);
  if (v15) {
    CFDictionarySetValue(v29, @"IDSSendMessageOptionFromID", v15);
  }
  uint64_t v30 = (const void *)MEMORY[0x1E4F1CC38];
  CFDictionarySetValue(v29, @"IDSSendMessageOptionWantsResponse", MEMORY[0x1E4F1CC38]);
  CFDictionarySetValue(v29, @"IDSSendMessageOptionWantsDeliveryStatus", v30);
  BOOL v31 = (void *)MEMORY[0x1E4F1CAD0];
  v101[0] = *MEMORY[0x1E4F6B2B8];
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:1];
  uint64_t v33 = [v31 setWithArray:v32];

  if (v33) {
    CFDictionarySetValue(v29, @"IDSSendMessageOptionRequireAllRegistrationProperties", v33);
  }

  long long v34 = +[IDSLogging _IDSService];
  __int16 v73 = v18;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    long long v35 = [v79 payload];
    long long v36 = [v35 debugDescription];
    uint64_t v37 = [v79 encryptionProperties];
    uint64_t v38 = [v37 segmentNumber];
    [v79 encryptionProperties];
    v40 = uint64_t v39 = v15;
    __int16 v41 = [v40 totalSegments];
    *(_DWORD *)buf = 138413314;
    long long v92 = v74;
    __int16 v93 = 2112;
    id v94 = v76;
    __int16 v95 = 2112;
    uint64_t v96 = v36;
    __int16 v97 = 2112;
    id v98 = v38;
    __int16 v99 = 2112;
    id v100 = v41;
    _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_DEFAULT, "sendMessageLite with identifier: %@ destination: %@ - Message {pn: %@, tp: %@, p: %@}", buf, 0x34u);

    __int16 v15 = v39;
    int v18 = v73;
  }
  if ([(_IDSService *)self canSendMessageWithAccount:v18 toDestination:v76])
  {
    if (v72)
    {
      id v42 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToConnection, "objectForKeyedSubscript:");
      if (v42)
      {
        __int16 v43 = v42;
        char v44 = [v42 _internal];
        id v90 = v74;
        id v89 = 0;
        [v44 sendMessage:theDict toDestinations:v76 priority:300 options:v29 identifier:&v90 error:&v89];
        id v45 = v90;

        id v46 = v89;
        id v74 = v45;
        goto LABEL_33;
      }
    }
    id v48 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = [v18 _internal];
      *(_DWORD *)buf = 138412290;
      long long v92 = v49;
      _os_log_impl(&dword_19190B000, v48, OS_LOG_TYPE_DEFAULT, "sendMessageLite - Could not find connection for account %@", buf, 0xCu);
    }
    [(_IDSService *)self _logConnectionMap];
    __int16 v43 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = [(IDSAccountController *)self->_accountController _internal];
      id v51 = [v50 accounts];
      *(_DWORD *)buf = 138412290;
      long long v92 = v51;
      _os_log_impl(&dword_19190B000, v43, OS_LOG_TYPE_DEFAULT, "sendMessageLite - All accounts %@", buf, 0xCu);
    }
  }
  else
  {
    __int16 v43 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v47 = [v18 _internal];
      *(_DWORD *)buf = 138412290;
      long long v92 = v47;
      _os_log_impl(&dword_19190B000, v43, OS_LOG_TYPE_DEFAULT, "sendMessageLite - Unable to send message to this destination from this account %@", buf, 0xCu);
    }
  }
  id v46 = 0;
LABEL_33:

  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = sub_1919CF9F4;
  void v85[3] = &unk_1E5729948;
  id v52 = v69;
  id v88 = v52;
  id v53 = v79;
  id v86 = v53;
  id v54 = v74;
  id v87 = v54;
  id v55 = (void *)MEMORY[0x192FE03B0](v85);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = sub_1919CFA80;
  v81[3] = &unk_1E572C808;
  id v56 = v52;
  id v84 = v56;
  id v57 = v53;
  id v82 = v57;
  id v58 = v54;
  id v83 = v58;
  __int16 v59 = (void *)MEMORY[0x192FE03B0](v81);
  if (!self->_completionBlocksByRequestID)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;
  }
  if (v58)
  {
    id v62 = self->_completionBlocksByRequestID;
    char v63 = v15;
    char v64 = (void *)MEMORY[0x1E4F6C3A8];
    id v78 = v46;
    id v80 = v57;
    __int16 v65 = v29;
    int64_t v66 = (void *)MEMORY[0x192FE03B0](v59);
    __int16 v67 = (void *)MEMORY[0x192FE03B0](v55);
    id v68 = [v64 pairWithFirst:v66 second:v67];
    [(NSMutableDictionary *)v62 setObject:v68 forKey:v58];

    __int16 v15 = v63;
    uint64_t v29 = v65;
    id v46 = v78;
    id v57 = v80;
  }
}

- (void)sendServiceUpdateMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v60 = a5;
  id v9 = a4;
  id v10 = +[IDSInternalQueueController sharedInstance];
  LODWORD(a4) = [v10 assertQueueIsCurrent];

  if (a4)
  {
    id v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3D610();
    }
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  int v13 = [v8 recipientURI];
  int v14 = [v13 prefixedURI];
  __int16 v15 = objc_msgSend(v12, "initWithObjects:", v14, 0);

  uint64_t v16 = [v8 senderURI];
  uint64_t v17 = [v16 prefixedURI];

  int v18 = (void *)MEMORY[0x1E4F6B438];
  if (v17)
  {
    uint64_t v19 = [v15 setByAddingObject:v17];
    uint64_t v20 = [v18 destinationWithDestinations:v19];
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F6B438] destinationWithDestinations:v15];
  }
  __int16 v65 = [(_IDSService *)self _sendingAccountForAccount:0 destination:v20 fromID:v17];
  id v21 = [v65 _internal];
  char v63 = [v21 uniqueID];

  long long v22 = (void *)MEMORY[0x1E4F1CA60];
  long long v23 = [v9 dictionaryRepresentation];

  int v24 = [v22 dictionaryWithDictionary:v23];

  CFDictionarySetValue(v24, @"IDSSendMessageOptionTopLevelDictionary", MEMORY[0x1E4F1CC38]);
  if (v17) {
    CFDictionarySetValue(v24, @"IDSSendMessageOptionFromID", v17);
  }
  long long v25 = (const void *)MEMORY[0x1E4F1CC38];
  CFDictionarySetValue(v24, @"IDSSendMessageOptionSkipPayloadCheck", MEMORY[0x1E4F1CC38]);
  CFDictionarySetValue(v24, @"IDSSendMessageOptionForceEncryptionOff", v25);
  CFDictionarySetValue(v24, @"IDSSendMessageOptionWantsResponse", v25);
  CFDictionarySetValue(v24, @"IDSSendMessageOptionWantsCertifiedDelivery", v25);
  id v62 = v24;
  CFDictionarySetValue(v24, @"IDSSendMessageOptionCommand", &unk_1EE28B388);
  __int16 v26 = +[IDSLogging _IDSService];
  char v64 = (void *)v20;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v8 senderURI];
    __int16 v28 = [v8 recipientURI];
    *(_DWORD *)buf = 138413058;
    uint64_t v77 = v64;
    __int16 v78 = 2112;
    id v79 = v27;
    __int16 v80 = 2112;
    id v81 = v28;
    __int16 v82 = 2048;
    uint64_t v83 = [v8 preferredServiceType];
    _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage with destination: %@ - Message {senderURI: %@, recipientURI: %@, preferredServiceType: %ld}", buf, 0x2Au);

    uint64_t v20 = (uint64_t)v64;
  }

  if ([(_IDSService *)self canSendMessageWithAccount:v65 toDestination:v20])
  {
    if (v63)
    {
      uint64_t v29 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToConnection, "objectForKeyedSubscript:");
      if (v29)
      {
        uint64_t v30 = v29;
        BOOL v31 = [v29 _internal];
        id v74 = 0;
        id v75 = 0;
        [v31 sendMessage:0 toDestinations:v20 priority:300 options:v24 identifier:&v75 error:&v74];
        id v32 = v75;
        id v33 = v74;

        goto LABEL_23;
      }
    }
    long long v35 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      long long v36 = [v65 _internal];
      *(_DWORD *)buf = 138412290;
      uint64_t v77 = v36;
      _os_log_impl(&dword_19190B000, v35, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage - Could not find connection for account %@", buf, 0xCu);
    }
    [(_IDSService *)self _logConnectionMap];
    uint64_t v30 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(IDSAccountController *)self->_accountController _internal];
      uint64_t v38 = [v37 accounts];
      *(_DWORD *)buf = 138412290;
      uint64_t v77 = v38;
      _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage - All accounts %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v30 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      long long v34 = [v65 _internal];
      *(_DWORD *)buf = 138412290;
      uint64_t v77 = v34;
      _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage - Unable to send message to this destination from this account %@", buf, 0xCu);
    }
  }
  id v33 = 0;
  id v32 = 0;
LABEL_23:

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = sub_1919D0208;
  void v70[3] = &unk_1E5729948;
  id v39 = v60;
  id v73 = v39;
  id v40 = v8;
  id v71 = v40;
  id v41 = v32;
  id v72 = v41;
  id v42 = (void *)MEMORY[0x192FE03B0](v70);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = sub_1919D0294;
  v66[3] = &unk_1E572C808;
  id v43 = v39;
  id v69 = v43;
  id v44 = v40;
  id v67 = v44;
  id v45 = v41;
  id v68 = v45;
  id v46 = (void *)MEMORY[0x192FE03B0](v66);
  if (!self->_completionBlocksByRequestID)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;
  }
  if (v45)
  {
    id v49 = self->_completionBlocksByRequestID;
    id v50 = (void *)MEMORY[0x1E4F6C3A8];
    id v59 = v43;
    id v61 = v44;
    id v51 = v17;
    id v52 = v15;
    id v53 = (void *)MEMORY[0x192FE03B0](v46);
    uint64_t v54 = MEMORY[0x192FE03B0](v42);
    id v55 = v42;
    id v56 = v33;
    id v57 = (void *)v54;
    id v58 = [v50 pairWithFirst:v53 second:v54];
    [(NSMutableDictionary *)v49 setObject:v58 forKey:v45];

    id v33 = v56;
    id v42 = v55;

    __int16 v15 = v52;
    uint64_t v17 = v51;
    id v43 = v59;
    id v44 = v61;
  }
}

- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  uint64_t v19 = +[IDSInternalQueueController sharedInstance];
  int v20 = [v19 assertQueueIsCurrent];

  if (v20)
  {
    id v21 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_191A3D6A8();
    }
  }
  if (!self->_pretendingToBeFull)
  {
    int64_t v51 = a6;
    id v54 = v15;
    id v55 = v18;
    id v53 = v17;
    [MEMORY[0x1E4F6B438] destinationWithDestinations:v17];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v56 = v60 = 0u;
    long long v23 = [v56 destinationURIs];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v58;
LABEL_9:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v58 != v26) {
          objc_enumerationMutation(v23);
        }
        __int16 v28 = *(void **)(*((void *)&v57 + 1) + 8 * v27);
        if (![v28 _FZIDType])
        {
          uint64_t v29 = [(_IDSService *)self serviceProperties];
          char v30 = [v29 wantsPhoneNumberAccount];

          if ((v30 & 1) == 0) {
            break;
          }
        }
        if (v25 == ++v27)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v71 count:16];
          if (v25) {
            goto LABEL_9;
          }
          goto LABEL_16;
        }
      }
      uint64_t v38 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = [(_IDSService *)self serviceProperties];
        id v40 = [v39 identifier];
        *(_DWORD *)buf = 138412546;
        id v68 = v28;
        __int16 v69 = 2112;
        id v70 = v40;
        _os_log_impl(&dword_19190B000, v38, OS_LOG_TYPE_DEFAULT, "sendMessage - Unable to send message to %@ on service %@ since phone number accounts are disabled", buf, 0x16u);
      }
      id v17 = v53;
      id v15 = v54;
      id v18 = v55;
      BOOL v31 = v56;
      if (a9)
      {
        uint64_t v65 = *MEMORY[0x1E4F28568];
        int64_t v66 = @"Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.";
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:44 userInfo:v41];
        char v22 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        long long v34 = (void *)v41;
        id v32 = v16;
        goto LABEL_38;
      }
      char v22 = 0;
      goto LABEL_39;
    }
LABEL_16:

    id v18 = v55;
    long long v23 = [v55 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
    BOOL v31 = v56;
    id v32 = [(_IDSService *)self _sendingAccountForAccount:v16 destination:v56 fromID:v23];

    id v33 = [v32 _internal];
    long long v34 = [v33 uniqueID];

    if ([(_IDSService *)self canSendMessageWithAccount:v32 toDestination:v56])
    {
      id v15 = v54;
      if (v34
        && ([(NSMutableDictionary *)self->_uniqueIDToConnection objectForKeyedSubscript:v34], (long long v35 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        long long v36 = v35;
        uint64_t v37 = [v35 _internal];
        char v22 = [v37 sendMessage:v54 toDestinations:v56 priority:v51 options:v55 identifier:a8 error:a9];

        id v17 = v53;
      }
      else
      {
        id v45 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          id v46 = [v32 _internal];
          *(_DWORD *)buf = 138412290;
          id v68 = v46;
          _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "sendMessage - Could not find connection for account %@", buf, 0xCu);
        }
        [(_IDSService *)self _logConnectionMap];
        id v47 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          id v48 = [(IDSAccountController *)self->_accountController _internal];
          id v49 = [v48 accounts];
          *(_DWORD *)buf = 138412290;
          id v68 = v49;
          _os_log_impl(&dword_19190B000, v47, OS_LOG_TYPE_DEFAULT, "sendMessage - All accounts %@", buf, 0xCu);

          id v18 = v55;
        }

        id v17 = v53;
        BOOL v31 = v56;
        if (!a9)
        {
          char v22 = 0;
          long long v34 = v52;
          goto LABEL_38;
        }
        uint64_t v63 = *MEMORY[0x1E4F28568];
        char v64 = @"Could not find valid account";
        long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v36];
        char v22 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        long long v34 = v52;
      }
    }
    else
    {
      id v42 = v34;
      id v43 = +[IDSLogging _IDSService];
      id v15 = v54;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = [v32 _internal];
        *(_DWORD *)buf = 138412290;
        id v68 = v44;
        _os_log_impl(&dword_19190B000, v43, OS_LOG_TYPE_DEFAULT, "sendMessage - Unable to send message to this destination from this account %@", buf, 0xCu);
      }
      id v17 = v53;
      if (!a9)
      {
        char v22 = 0;
        long long v34 = v42;
        goto LABEL_38;
      }
      uint64_t v61 = *MEMORY[0x1E4F28568];
      id v62 = @"Destination device is not active for this account";
      long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:37 userInfo:v36];
      char v22 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      long long v34 = v42;
    }

LABEL_38:
    id v16 = v32;
LABEL_39:

    goto LABEL_40;
  }
  [(_IDSService *)self _handlePretendingToBeFullWithIdentifier:a8];
  char v22 = 1;
LABEL_40:

  return v22;
}

- (BOOL)cancelMessageWithOptions:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A3D740();
    }
  }
  id v12 = [v8 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
  int v13 = [v8 objectForKeyedSubscript:@"IDSSendMessageOptionQueueOneIdentifier"];

  if (v13)
  {
    int v14 = [NSString stringGUID];
    id v15 = v14;
    if (a4) {
      *a4 = v14;
    }
    id v16 = [(IDSServiceProperties *)self->_serviceProperties pushTopic];
    id v17 = [(_IDSService *)self _sendingAccountForAccount:0];
    id v18 = [v17 uniqueID];

    uint64_t v19 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138413314;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      __int16 v28 = v13;
      __int16 v29 = 2112;
      char v30 = v15;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "cancelMessageWithOptions { service: %@  fromID: %@  queueOneIdentifier: %@  guid: %@ accountUniqueID: %@ }", (uint8_t *)&v23, 0x34u);
    }

    int v20 = [(_IDSService *)self daemonController];
    [v20 cancelMessageWithQueueOneIdentifier:v13 fromID:v12 service:v16 accountUniqueID:v18 messageIdentifier:v15];

    goto LABEL_13;
  }
  if (a5)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @"Cannot cancel message without a queue one identifier.";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    *a5 = [v21 errorWithDomain:@"com.apple.identityservices.error" code:28 userInfo:v15];
LABEL_13:
  }
  return v13 != 0;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destination:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  int v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a3;
  id v12 = [v10 setWithObject:a4];
  LOBYTE(a6) = [(_IDSService *)self cancelMessageWithOptions:v11 destinations:v12 identifier:a5 error:a6];

  return (char)a6;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destinations:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    int v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A3D7D8();
    }
  }
  if (_os_feature_enabled_impl())
  {
    id v15 = [v10 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
    id v16 = [v10 objectForKeyedSubscript:@"IDSSendMessageOptionQueueOneIdentifier"];
    if (v16)
    {
      if (v11 && [v11 count])
      {
        id v17 = [(IDSServiceProperties *)self->_serviceProperties pushTopic];
        if (v15)
        {
          id v18 = [v10 objectForKeyedSubscript:@"IDSSendMessageOptionAlwaysIncludeSelfKey"];

          uint64_t v19 = (void *)MEMORY[0x1E4F6B438];
          if (v18)
          {
            int v20 = [v11 setByAddingObject:v15];
            uint64_t v21 = [v19 destinationWithDestinations:v20];

            uint64_t v22 = v21;
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F6B438];
        }
        uint64_t v22 = [v19 destinationWithDestinations:v11];
LABEL_21:
        id v39 = [(_IDSService *)self _sendingAccountForAccount:0 destination:v22 fromID:v15];
        __int16 v28 = [v39 _internal];
        uint64_t v41 = [v28 uniqueID];

        __int16 v29 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v45 = v17;
          __int16 v46 = 2112;
          id v47 = v15;
          __int16 v48 = 2112;
          id v49 = v16;
          __int16 v50 = 2112;
          uint64_t v51 = v22;
          _os_log_impl(&dword_19190B000, v29, OS_LOG_TYPE_DEFAULT, "cancelMessageWithOptions { service: %@  fromID: %@  queueOneIdentifier: %@  idsDestination: %@ }", buf, 0x2Au);
        }
        id v40 = (void *)v22;

        char v30 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
        __int16 v31 = (const void *)MEMORY[0x1E4F1CC38];
        CFDictionarySetValue(v30, @"IDSSendMessageOptionTopLevelDictionary", MEMORY[0x1E4F1CC38]);
        CFDictionarySetValue(v30, @"IDSSendMessageOptionSkipPayloadCheck", v31);
        CFDictionarySetValue(v30, @"IDSSendMessageOptionForceEncryptionOff", v31);
        CFDictionarySetValue(v30, @"IDSSendMessageOptionCommand", &unk_1EE28B3A0);
        CFDictionarySetValue(v30, @"IDSSendMessageOptionWantsResponse", v31);
        id v32 = (void *)v41;
        if (v41
          && ([(NSMutableDictionary *)self->_uniqueIDToConnection objectForKeyedSubscript:v41], (uint64_t v33 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          long long v34 = v33;
          long long v35 = [v33 _internal];
          char v23 = [v35 sendMessage:0 toDestinations:v40 priority:300 options:v30 identifier:a5 error:a6];
        }
        else
        {
          if (!a6)
          {
            char v23 = 0;
            uint64_t v37 = v40;
            goto LABEL_30;
          }
          long long v36 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v42 = *MEMORY[0x1E4F28568];
          id v43 = @"Could not find valid account to cancel message.";
          long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          [v36 errorWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v34];
          char v23 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v37 = v40;
        id v32 = (void *)v41;
LABEL_30:

        goto LABEL_31;
      }
      if (a6)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v53 = @"Cannot cancel message without a destination.";
        __int16 v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v53;
        __int16 v27 = &v52;
LABEL_17:
        id v17 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
        [v24 errorWithDomain:@"com.apple.identityservices.error" code:28 userInfo:v17];
        char v23 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

        goto LABEL_32;
      }
    }
    else if (a6)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v55[0] = @"Cannot cancel message without a queue one identifier.";
      __int16 v25 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v26 = (__CFString **)v55;
      __int16 v27 = &v54;
      goto LABEL_17;
    }
    char v23 = 0;
LABEL_32:

    goto LABEL_33;
  }
  char v23 = [(_IDSService *)self cancelMessageWithOptions:v10 identifier:a5 error:a6];
LABEL_33:

  return v23;
}

- (BOOL)sendProtobuf:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v13 = a4;
  id v14 = a5;
  id v58 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v72 = _os_activity_create(&dword_19190B000, "Framework Send Protobuf", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v72, &state);
  id v15 = OSLogHandleForTransportCategory();
  uint64_t v61 = self;
  long long v59 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [NSNumber numberWithInteger:a6];
    *(_DWORD *)buf = 138412290;
    id v81 = v16;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "!setState priority=%@", buf, 0xCu);
  }
  if (a8)
  {
    id v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = *a8;
      *(_DWORD *)buf = 138412290;
      id v81 = v18;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v82 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v68 != v21) {
          objc_enumerationMutation(v19);
        }
        char v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v24 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v23;
          _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "!setState destination=%@", buf, 0xCu);
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v82 count:16];
    }
    while (v20);
  }

  __int16 v25 = +[IDSInternalQueueController sharedInstance];
  int v26 = [v25 assertQueueIsCurrent];

  if (v26)
  {
    __int16 v27 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F29060] callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_191A3D870();
    }
  }
  if (!self->_pretendingToBeFull)
  {
    [MEMORY[0x1E4F6B438] destinationWithDestinations:v19];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    id v62 = v64 = 0u;
    __int16 v29 = [v62 destinationURIs];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v64;
LABEL_24:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = *(void **)(*((void *)&v63 + 1) + 8 * v32);
        if (![v33 _FZIDType])
        {
          long long v34 = [(_IDSService *)v61 serviceProperties];
          char v35 = [v34 wantsPhoneNumberAccount];

          if ((v35 & 1) == 0) {
            break;
          }
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v79 count:16];
          if (v30) {
            goto LABEL_24;
          }
          goto LABEL_31;
        }
      }
      uint64_t v42 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [(_IDSService *)v61 serviceProperties];
        id v44 = [v43 identifier];
        *(_DWORD *)id v75 = 138412546;
        id v76 = v33;
        __int16 v77 = 2112;
        __int16 v78 = v44;
        _os_log_impl(&dword_19190B000, v42, OS_LOG_TYPE_DEFAULT, "sendProtobuf - Unable to send message to %@ on service %@ since phone number accounts are disabled", v75, 0x16u);
      }
      if (a9)
      {
        uint64_t v73 = *MEMORY[0x1E4F28568];
        id v74 = @"Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.";
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:44 userInfo:v38];
        char v28 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      }
      char v28 = 0;
      goto LABEL_53;
    }
LABEL_31:

    __int16 v29 = [v58 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
    long long v36 = [(_IDSService *)v61 _sendingAccountForAccount:v59 destination:v62 fromID:v29];

    uint64_t v37 = [v36 _internal];
    uint64_t v38 = [v37 uniqueID];

    if ([(_IDSService *)v61 canSendMessageWithAccount:v36 toDestination:v62])
    {
      if (v38)
      {
        id v39 = [(NSMutableDictionary *)v61->_uniqueIDToConnection objectForKey:v38];
        id v40 = v39;
        if (v39)
        {
          id v41 = [v39 _internal];
          char v28 = [v41 sendProtobuf:v57 toDestinations:v62 priority:a6 options:v58 identifier:a8 error:a9];
          goto LABEL_51;
        }
      }
      id v49 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v50 = [v36 _internal];
        *(_DWORD *)id v75 = 138412290;
        id v76 = v50;
        _os_log_impl(&dword_19190B000, v49, OS_LOG_TYPE_DEFAULT, "sendProtobuf - Could not find connection for account %@", v75, 0xCu);
      }
      [(_IDSService *)v61 _logConnectionMap];
      uint64_t v51 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v52 = [(IDSAccountController *)v61->_accountController _internal];
        id v53 = [v52 accounts];
        *(_DWORD *)id v75 = 138412290;
        id v76 = v53;
        _os_log_impl(&dword_19190B000, v51, OS_LOG_TYPE_DEFAULT, "sendProtobuf - All accounts %@", v75, 0xCu);
      }
      id v54 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v40 = objc_msgSend(v54, "initWithObjectsAndKeys:", @"Could not find valid account", *MEMORY[0x1E4F28568], 0);
      __int16 v48 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v40];
    }
    else
    {
      id v45 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v46 = [v36 _internal];
        *(_DWORD *)id v75 = 138412290;
        id v76 = v46;
        _os_log_impl(&dword_19190B000, v45, OS_LOG_TYPE_DEFAULT, "sendProtobuf - Unable to send protobuf to this destination from this account %@", v75, 0xCu);
      }
      id v47 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v40 = objc_msgSend(v47, "initWithObjectsAndKeys:", @"Destination device is not active for this account", *MEMORY[0x1E4F28568], 0);
      __int16 v48 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:37 userInfo:v40];
    }
    id v41 = v48;
    if (a9)
    {
      id v41 = v48;
      char v28 = 0;
      *a9 = v41;
    }
    else
    {
      char v28 = 0;
    }
LABEL_51:

    long long v59 = v36;
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  [(_IDSService *)self _handlePretendingToBeFullWithIdentifier:a8];
  char v28 = 1;
LABEL_54:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v28;
}

- (void)_handlePretendingToBeFullWithIdentifier:(id *)a3
{
  id v5 = [NSString stringGUID];
  id v6 = v5;
  if (a3) {
    *a3 = v5;
  }
  id v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919D1B1C;
  v9[3] = &unk_1E57291B8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlock:v9];
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v13 = a4;
  id v14 = a5;
  id v60 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v74 = _os_activity_create(&dword_19190B000, "Framework Send Data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v74, &state);
  id v15 = OSLogHandleForTransportCategory();
  long long v63 = self;
  uint64_t v61 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v13 serviceName];
    *(_DWORD *)buf = 138412290;
    id v83 = v16;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "!setState service=%@", buf, 0xCu);
  }
  id v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [NSNumber numberWithInteger:a6];
    *(_DWORD *)buf = 138412290;
    id v83 = v18;
    _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "!setState priority=%@", buf, 0xCu);
  }
  if (a8)
  {
    id v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = *a8;
      *(_DWORD *)buf = 138412290;
      id v83 = v20;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v21 = v14;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v70 != v23) {
          objc_enumerationMutation(v21);
        }
        __int16 v25 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        int v26 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v83 = v25;
          _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "!setState destination=%@", buf, 0xCu);
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v69 objects:v84 count:16];
    }
    while (v22);
  }

  __int16 v27 = +[IDSInternalQueueController sharedInstance];
  int v28 = [v27 assertQueueIsCurrent];

  if (v28)
  {
    __int16 v29 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F29060] callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_191A3D8C4();
    }
  }
  if (!v63->_pretendingToBeFull)
  {
    [MEMORY[0x1E4F6B438] destinationWithDestinations:v21];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v64 = v66 = 0u;
    uint64_t v31 = [v64 destinationURIs];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v66;
LABEL_26:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v66 != v33) {
          objc_enumerationMutation(v31);
        }
        char v35 = *(void **)(*((void *)&v65 + 1) + 8 * v34);
        if (![v35 _FZIDType])
        {
          long long v36 = [(_IDSService *)v63 serviceProperties];
          char v37 = [v36 wantsPhoneNumberAccount];

          if ((v37 & 1) == 0) {
            break;
          }
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v81 count:16];
          if (v32) {
            goto LABEL_26;
          }
          goto LABEL_33;
        }
      }
      id v44 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = [(_IDSService *)v63 serviceProperties];
        __int16 v46 = [v45 identifier];
        *(_DWORD *)__int16 v77 = 138412546;
        __int16 v78 = v35;
        __int16 v79 = 2112;
        __int16 v80 = v46;
        _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_DEFAULT, "sendData - Unable to send message to %@ on service %@ since phone number accounts are disabled", v77, 0x16u);
      }
      if (a9)
      {
        uint64_t v75 = *MEMORY[0x1E4F28568];
        id v76 = @"Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.";
        id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:44 userInfo:v40];
        char v30 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_54;
      }
      char v30 = 0;
      goto LABEL_55;
    }
LABEL_33:

    uint64_t v31 = [v60 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
    uint64_t v38 = [(_IDSService *)v63 _sendingAccountForAccount:v61 destination:v64 fromID:v31];

    id v39 = [v38 _internal];
    id v40 = [v39 uniqueID];

    if ([(_IDSService *)v63 canSendMessageWithAccount:v38 toDestination:v64])
    {
      if (v40)
      {
        id v41 = [(NSMutableDictionary *)v63->_uniqueIDToConnection objectForKey:v40];
        uint64_t v42 = v41;
        if (v41)
        {
          id v43 = [v41 _internal];
          char v30 = [v43 sendData:v59 toDestinations:v64 priority:a6 options:v60 identifier:a8 error:a9];
          goto LABEL_53;
        }
      }
      uint64_t v51 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v52 = [v38 _internal];
        *(_DWORD *)__int16 v77 = 138412290;
        __int16 v78 = v52;
        _os_log_impl(&dword_19190B000, v51, OS_LOG_TYPE_DEFAULT, "sendData - Could not find connection for account %@", v77, 0xCu);
      }
      [(_IDSService *)v63 _logConnectionMap];
      id v53 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        id v54 = [(IDSAccountController *)v63->_accountController _internal];
        id v55 = [v54 accounts];
        *(_DWORD *)__int16 v77 = 138412290;
        __int16 v78 = v55;
        _os_log_impl(&dword_19190B000, v53, OS_LOG_TYPE_DEFAULT, "sendData - All accounts %@", v77, 0xCu);
      }
      id v56 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v42 = objc_msgSend(v56, "initWithObjectsAndKeys:", @"Could not find valid account", *MEMORY[0x1E4F28568], 0);
      __int16 v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v42];
    }
    else
    {
      id v47 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v48 = [v38 _internal];
        *(_DWORD *)__int16 v77 = 138412290;
        __int16 v78 = v48;
        _os_log_impl(&dword_19190B000, v47, OS_LOG_TYPE_DEFAULT, "sendData - Unable to send data to this destination from this account %@", v77, 0xCu);
      }
      id v49 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v42 = objc_msgSend(v49, "initWithObjectsAndKeys:", @"Destination device is not active for this account", *MEMORY[0x1E4F28568], 0);
      __int16 v50 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:37 userInfo:v42];
    }
    id v43 = v50;
    if (a9)
    {
      id v43 = v50;
      char v30 = 0;
      *a9 = v43;
    }
    else
    {
      char v30 = 0;
    }
LABEL_53:

    uint64_t v61 = v38;
LABEL_54:

LABEL_55:
    goto LABEL_56;
  }
  [(_IDSService *)v63 _handlePretendingToBeFullWithIdentifier:a8];
  char v30 = 1;
LABEL_56:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v30;
}

- (BOOL)sendAccessoryData:(id)a3 toAccessoryID:(id)a4 accessToken:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v13 = a4;
  id v46 = a5;
  id v14 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  __int16 v48 = _os_activity_create(&dword_19190B000, "Framework Send Accessory Data", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v48, &state);
  id v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v52 = v13;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "!setState accessoryID=%@", buf, 0xCu);
  }

  if (a7)
  {
    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *a7;
      *(_DWORD *)buf = 138412290;
      id v52 = v17;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }
  }
  id v18 = +[IDSInternalQueueController sharedInstance];
  int v19 = [v18 assertQueueIsCurrent];

  if (v19)
  {
    id v20 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F29060] callStackSymbols];
      objc_claimAutoreleasedReturnValue();
      sub_191A3D918();
    }
  }
  id v21 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v49 = 0;
    _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "Sending AccessoryData Now", v49, 2u);
  }

  uint64_t v22 = [v14 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
  uint64_t v23 = [(_IDSService *)self _sendingAccountForAccount:0 destination:0 fromID:v22];
  id v43 = (void *)v22;
  uint64_t v24 = [v23 _internal];
  __int16 v25 = [v24 uniqueID];

  if (v25)
  {
    int v26 = [(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v25];
  }
  else
  {
    int v26 = 0;
  }
  __int16 v27 = (void *)IDSCopyIDForAccessory();

  int v28 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
  [v28 setObject:v46 forKey:@"IDSSendMessageOptionAccessToken"];
  [v28 setObject:MEMORY[0x1E4F1CC38] forKey:@"IDSSendMessageOptionHomeKitMessage"];
  [v28 setObject:MEMORY[0x1E4F1CC38] forKey:@"IDSSendMessageOptionDisableAliasValidation"];
  id v29 = v28;

  char v30 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
  uint64_t v31 = [MEMORY[0x1E4F6B438] destinationWithDestinations:v30];
  if (v26)
  {
    uint64_t v32 = [v26 _internal];
    char v33 = [v32 sendData:v45 toDestinations:v31 priority:300 options:v29 identifier:a7 error:a8];
  }
  else
  {
    uint64_t v34 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      char v35 = [v23 _internal];
      *(_DWORD *)id v49 = 138412290;
      __int16 v50 = v35;
      _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_DEFAULT, "sendAccessoryData - Could not find connection for account %@", v49, 0xCu);
    }
    [(_IDSService *)self _logConnectionMap];
    long long v36 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      char v37 = [(IDSAccountController *)self->_accountController _internal];
      uint64_t v38 = [v37 accounts];
      *(_DWORD *)id v49 = 138412290;
      __int16 v50 = v38;
      _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "sendAccessoryData - All accounts %@", v49, 0xCu);
    }
    id v39 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v32 = objc_msgSend(v39, "initWithObjectsAndKeys:", @"Could not find valid account", *MEMORY[0x1E4F28568], 0);
    id v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v32];
    id v41 = v40;
    if (a8) {
      *a8 = v40;
    }

    char v33 = 0;
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v33;
}

- (BOOL)sendInvitation:(id)a3 fromAccount:(id)a4 toDestination:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = (void *)MEMORY[0x1E4F6B438];
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = a6;
  id v17 = a4;
  id v18 = [v15 setWithObject:a5];
  int v19 = [v14 destinationWithDestinations:v18];

  id v20 = (void *)[v16 mutableCopy];
  if ([v13 state] != 1)
  {
    id v21 = [v13 selfHandle];

    if (v21)
    {
      uint64_t v22 = [v13 selfHandle];
      uint64_t v23 = [v22 _stripFZIDPrefix];
      uint64_t v24 = [v23 _bestGuessURI];

      [v20 setObject:v24 forKey:@"IDSSendMessageOptionFromID"];
      __int16 v25 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v24;
        _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - overriding fromID to %@", buf, 0xCu);
      }
    }
  }
  int v26 = [v20 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
  __int16 v27 = [(_IDSService *)self _sendingAccountForAccount:v17 destination:v19 fromID:v26];

  int v28 = [v27 _internal];
  id v29 = [v28 uniqueID];

  if (!v29)
  {
    if ([(IDSServiceProperties *)self->_serviceProperties isInvitationService])
    {
LABEL_13:
      uint64_t v34 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        char v35 = [v27 _internal];
        *(_DWORD *)buf = 138412290;
        id v48 = v35;
        _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_DEFAULT, "sendInvitation - Could not find connection for account %@", buf, 0xCu);
      }
      [(_IDSService *)self _logConnectionMap];
      long long v36 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        char v37 = [(IDSAccountController *)self->_accountController _internal];
        uint64_t v38 = [v37 accounts];
        *(_DWORD *)buf = 138412290;
        id v48 = v38;
        _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "sendInvitation - All accounts %@", buf, 0xCu);
      }
      id v39 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      char v30 = objc_msgSend(v39, "initWithObjectsAndKeys:", @"Could not find valid account", *MEMORY[0x1E4F28568], 0);
      id v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v30];
      id v32 = v40;
      if (a8)
      {
        id v32 = v40;
        char v33 = 0;
        *a8 = v32;
        goto LABEL_26;
      }
LABEL_25:
      char v33 = 0;
      goto LABEL_26;
    }
    char v30 = 0;
LABEL_20:
    id v41 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, "sendInvitation - Service is not enabled for Invitations", buf, 2u);
    }

    id v42 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v32 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", @"Service is not enabled for Invitations", *MEMORY[0x1E4F28568], 0);
    id v43 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:53 userInfo:v32];
    id v44 = v43;
    if (a8) {
      *a8 = v43;
    }

    goto LABEL_25;
  }
  char v30 = [(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v29];
  if (([(IDSServiceProperties *)self->_serviceProperties isInvitationService] & 1) == 0) {
    goto LABEL_20;
  }
  if (!v30) {
    goto LABEL_13;
  }
  uint64_t v31 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v13;
    __int16 v49 = 2112;
    __int16 v50 = v20;
    _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "sendInvitation - Attempting to send invitation: %@ with options %@", buf, 0x16u);
  }

  id v32 = [v30 _internal];
  char v33 = [v32 sendInvitation:v13 toDestination:v19 priority:300 options:v20 identifier:a7 error:a8];
LABEL_26:

  return v33;
}

- (BOOL)sendInvitationUpdate:(id)a3 fromAccount:(id)a4 toDestination:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = (void *)MEMORY[0x1E4F6B438];
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = a6;
  id v17 = a4;
  id v18 = [v15 setWithObject:a5];
  int v19 = [v14 destinationWithDestinations:v18];

  id v20 = (void *)[v16 mutableCopy];
  if ([v13 state] != 1)
  {
    id v21 = [v13 selfHandle];

    if (v21)
    {
      uint64_t v22 = [v13 selfHandle];
      uint64_t v23 = [v22 _stripFZIDPrefix];
      uint64_t v24 = [v23 _bestGuessURI];

      [v20 setObject:v24 forKey:@"IDSSendMessageOptionFromID"];
      __int16 v25 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v24;
        _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - overriding fromID to %@", buf, 0xCu);
      }
    }
  }
  int v26 = [v20 objectForKeyedSubscript:@"IDSSendMessageOptionFromID"];
  __int16 v27 = [(_IDSService *)self _sendingAccountForAccount:v17 destination:v19 fromID:v26];

  int v28 = [v27 _internal];
  id v29 = [v28 uniqueID];

  if (!v29)
  {
    if ([(IDSServiceProperties *)self->_serviceProperties isInvitationService])
    {
LABEL_13:
      uint64_t v34 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        char v35 = [v27 _internal];
        *(_DWORD *)buf = 138412290;
        id v48 = v35;
        _os_log_impl(&dword_19190B000, v34, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - Could not find connection for account %@", buf, 0xCu);
      }
      [(_IDSService *)self _logConnectionMap];
      long long v36 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        char v37 = [(IDSAccountController *)self->_accountController _internal];
        uint64_t v38 = [v37 accounts];
        *(_DWORD *)buf = 138412290;
        id v48 = v38;
        _os_log_impl(&dword_19190B000, v36, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - All accounts %@", buf, 0xCu);
      }
      id v39 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      char v30 = objc_msgSend(v39, "initWithObjectsAndKeys:", @"Could not find valid account", *MEMORY[0x1E4F28568], 0);
      id v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:7 userInfo:v30];
      id v32 = v40;
      if (a8)
      {
        id v32 = v40;
        char v33 = 0;
        *a8 = v32;
        goto LABEL_26;
      }
LABEL_25:
      char v33 = 0;
      goto LABEL_26;
    }
    char v30 = 0;
LABEL_20:
    id v41 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - Service is not enabled for Invitations", buf, 2u);
    }

    id v42 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v32 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", @"Service is not enabled for Invitations", *MEMORY[0x1E4F28568], 0);
    id v43 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:53 userInfo:v32];
    id v44 = v43;
    if (a8) {
      *a8 = v43;
    }

    goto LABEL_25;
  }
  char v30 = [(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v29];
  if (([(IDSServiceProperties *)self->_serviceProperties isInvitationService] & 1) == 0) {
    goto LABEL_20;
  }
  if (!v30) {
    goto LABEL_13;
  }
  uint64_t v31 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v48 = v13;
    __int16 v49 = 2112;
    __int16 v50 = v20;
    _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - Attempting to send invitation: %@ with options %@", buf, 0x16u);
  }

  id v32 = [v30 _internal];
  char v33 = [v32 sendInvitationUpdate:v13 toDestination:v19 priority:300 options:v20 identifier:a7 error:a8];
LABEL_26:

  return v33;
}

- (BOOL)setWakingPushPriority:(int64_t)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(IDSServiceProperties *)self->_serviceProperties pushTopic];
    *(_DWORD *)buf = 134218242;
    int64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Setting waking priority %ld on topic %@", buf, 0x16u);
  }
  char valid = _IDSIsValidWakingPushPriority();
  if (valid)
  {
    id v10 = [(_IDSService *)self daemonController];
    id v11 = [(IDSServiceProperties *)self->_serviceProperties pushTopic];
    [v10 setWakingPushPriority:a3 forTopic:v11];
  }
  else
  {
    id v12 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A3D96C();
    }

    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v16 = @"Invalid priority";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:56 userInfo:v10];
    id v11 = v13;
    if (a4)
    {
      id v11 = v13;
      *a4 = v11;
    }
  }

  return valid;
}

- (BOOL)sendData:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3D9A0();
    }
  }
  return 0;
}

- (BOOL)sendServerMessage:(id)a3 command:(id)a4 fromAccount:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3DA38();
    }
  }
  id v14 = [(_IDSService *)self _sendingAccountForAccount:v10];

  uint64_t v15 = [v14 _internal];
  id v16 = [v15 uniqueID];

  if (v16
    && ([(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v16],
        (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v18 = v17;
    __int16 v19 = [v17 _internal];
    char v20 = [v19 sendServerMessage:v8 command:v9];
  }
  else
  {
    uint64_t v21 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v14 _internal];
      int v26 = 138412290;
      __int16 v27 = v22;
      _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, "sendServerMessage - Could not find connection for account %@", (uint8_t *)&v26, 0xCu);
    }
    [(_IDSService *)self _logConnectionMap];
    int64_t v18 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [(IDSAccountController *)self->_accountController _internal];
      uint64_t v24 = [v23 accounts];
      int v26 = 138412290;
      __int16 v27 = v24;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "sendServerMessage - All accounts %@", (uint8_t *)&v26, 0xCu);
    }
    char v20 = 0;
  }

  return v20;
}

- (BOOL)cancelIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3DAD0();
    }
  }
  uint64_t v10 = [v6 length];
  if (v10)
  {
    if (a4) {
      *a4 = 0;
    }
    id v11 = [(_IDSService *)self daemonController];
    int v12 = [(IDSAccountController *)self->_accountController _internal];
    id v13 = [v12 serviceName];
    [v11 cancelItemWithIdentifier:v6 service:v13];
  }
  return v10 != 0;
}

- (BOOL)getProgressUpdateForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3DB68();
    }
  }
  uint64_t v10 = [v6 length];
  if (v10)
  {
    if (a4) {
      *a4 = 0;
    }
    id v11 = [(_IDSService *)self daemonController];
    int v12 = [(IDSAccountController *)self->_accountController _internal];
    id v13 = [v12 serviceName];
    [v11 getProgressUpdateForIdentifier:v6 service:v13];

    if (v6)
    {
      id v14 = [MEMORY[0x1E4F28F90] currentProgress];

      if (v14)
      {
        if (!self->_uniqueIDToProgress)
        {
          CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          uniqueIDToProgress = self->_uniqueIDToProgress;
          self->_uniqueIDToProgress = Mutable;
        }
        id v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
        [(NSMutableDictionary *)self->_uniqueIDToProgress setObject:v17 forKeyedSubscript:v6];
      }
    }
  }

  return v10 != 0;
}

- (id)uriForFromID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IDSInternalQueueController sharedInstance];
  int v5 = [v4 assertQueueIsCurrent];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A3DC00();
    }
  }
  if (v3 && ([v3 isEqualToString:*MEMORY[0x1E4F6ADA8]] & 1) == 0)
  {
    id v7 = [v3 _stripPotentialTokenURIWithToken:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)deviceForFromID:(id)a3 fromDevices:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3DC98();
    }
  }
  if (v5)
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F6ADA8]])
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v53;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v53 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            id v16 = [v15 _internal];
            char v17 = [v16 isDefaultPairedDevice];

            if (v17)
            {
              id v29 = v15;
              goto LABEL_49;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v64 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    if ([v5 containsString:@"device:"])
    {
      id v18 = v5;
      id v10 = [v5 _stripFZIDPrefix];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v19 = v6;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v63 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v49;
        while (2)
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v49 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            __int16 v25 = [v24 uniqueIDOverride];
            char v26 = [v25 isEqualToIgnoringCase:v10];

            if (v26)
            {
              id v29 = v24;

              id v5 = v18;
              goto LABEL_49;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v63 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      id v5 = v18;
    }
    id v47 = 0;
    __int16 v27 = [v5 _stripPotentialTokenURIWithToken:&v47];
    id v10 = v47;
    uint64_t v28 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v58 = v5;
      __int16 v59 = 2112;
      id v60 = v27;
      __int16 v61 = 2112;
      id v62 = v10;
      _os_log_impl(&dword_19190B000, v28, OS_LOG_TYPE_INFO, "FromID %@, strippedURI %@, token %@", buf, 0x20u);
    }

    id v29 = 0;
    if (v10 && v27)
    {
      id v40 = v5;
      id v41 = v27;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v42 = v6;
      char v30 = v6;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v44;
        while (2)
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v44 != v33) {
              objc_enumerationMutation(v30);
            }
            char v35 = *(void **)(*((void *)&v43 + 1) + 8 * k);
            long long v36 = [v35 _internal];
            char v37 = [v36 pushToken];

            uint64_t v38 = [MEMORY[0x1E4F6C3B8] registration];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v58 = v37;
              __int16 v59 = 2112;
              id v60 = v10;
              _os_log_impl(&dword_19190B000, v38, OS_LOG_TYPE_INFO, "Comparing device token %@ to token %@", buf, 0x16u);
            }

            if ([v37 isEqualToData:v10])
            {
              id v29 = v35;

              goto LABEL_47;
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v32) {
            continue;
          }
          break;
        }
      }

      char v30 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v10;
        _os_log_impl(&dword_19190B000, v30, OS_LOG_TYPE_DEFAULT, "Did not find a device matching the token %@", buf, 0xCu);
      }
      id v29 = 0;
LABEL_47:
      __int16 v27 = v41;
      id v6 = v42;
      id v5 = v40;
    }
LABEL_49:
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (id)deviceForFromID:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3DD30();
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = [(_IDSService *)self accounts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v15 = objc_msgSend(v14, "_internal", 0);
        id v16 = [v15 devices];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              [v8 addObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  uint64_t v21 = +[_IDSService deviceForFromID:v4 fromDevices:v8];

  return v21;
}

- (id)linkedDeviceForFromID:(id)a3 withRelationship:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A3DDC8();
    }
  }
  uint64_t v10 = [(_IDSService *)self linkedDevicesWithRelationship:a4];
  uint64_t v11 = +[_IDSService deviceForFromID:v6 fromDevices:v10];

  return v11;
}

- (id)firstRoutableInternetDestinationForSelf
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(_IDSService *)self accounts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v7 accountType] == 1 || !objc_msgSend(v7, "accountType"))
        {
          int v8 = [v7 pushToken];

          if (v8)
          {
            uint64_t v10 = [v7 loginID];
            char v11 = [v10 _appearsToBeEmail];
            uint64_t v12 = [v7 loginID];
            if (v11) {
              uint64_t v13 = IDSCopyIDForEmailAddress();
            }
            else {
              uint64_t v13 = IDSCopyIDForPhoneNumber();
            }
            id v14 = (void *)v13;

            uint64_t v15 = [v7 pushToken];
            id v9 = (void *)IDSCopyIDForTokenWithID();

            goto LABEL_16;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_16:

  return v9;
}

- (id)devicesForBTUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3DE60();
    }
  }
  if (v4)
  {
    int v8 = [(_IDSService *)self linkedDevicesWithRelationship:3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = [v14 nsuuid];
          int v16 = [v15 isEqual:v4];

          if (v16)
          {
            if (!v11) {
              id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v11 addObject:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)deviceForUniqueID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3DEF8();
    }
  }
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v8 = [(_IDSService *)self devices];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [v13 uniqueID];
          if ([v14 isEqualToIgnoringCase:v4])
          {

LABEL_19:
            id v17 = v13;
            goto LABEL_20;
          }
          uint64_t v15 = [v13 uniqueIDOverride];
          char v16 = [v15 isEqualToIgnoringCase:v4];

          if (v16) {
            goto LABEL_19;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        id v17 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_20:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3DF90();
    }
  }
  int v8 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v3) {
      uint64_t v9 = @"YES";
    }
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "setPreferInfraWiFi: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v10 = [(_IDSService *)self daemonController];
  uint64_t v11 = [(IDSAccountController *)self->_accountController _internal];
  uint64_t v12 = [v11 serviceName];
  [v10 setPreferInfraWiFi:v3 service:v12];
}

- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3E0A0();
    }
  }
  int v8 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"NO";
    if (v3) {
      uint64_t v9 = @"YES";
    }
    int v20 = 136315394;
    long long v21 = "-[_IDSService setNeedsLaunchOnNearbyDevicesChanged:]";
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v20, 0x16u);
  }

  uint64_t v10 = [(_IDSService *)self serviceProperties];
  char v11 = [v10 allowLaunchOnNearbyDevicesChanged];

  if (v11)
  {
    uint64_t v12 = [(_IDSService *)self serviceProperties];
    [v12 setNeedsLaunchOnNearbyDevicesChanged:v3];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F6C350] daemon];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A3E028(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (BOOL)needsLaunchOnNearbyDevicesChanged
{
  v2 = [(_IDSService *)self serviceProperties];
  char v3 = [v2 needsLaunchOnNearbyDevicesChanged];

  return v3;
}

- (void)setLinkPreferences:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3E138();
    }
  }
  int v8 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "setLinkPreferences: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v9 = [v4 objectForKey:@"LinkType"];
  uint64_t v10 = [v4 objectForKey:@"PacketsPerSecond"];
  char v11 = [v4 objectForKey:@"InputBytesPerSecond"];
  uint64_t v12 = [v4 objectForKey:@"OutputBytesPerSecond"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v13 = +[IDSTransportLog IDSService];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Received invalid link preferences", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    uint64_t v13 = [(_IDSService *)self daemonController];
    uint64_t v14 = [(IDSAccountController *)self->_accountController _internal];
    uint64_t v15 = [v14 serviceName];
    [v13 setLinkPreferences:v4 service:v15];
  }
}

- (void)startOTRTest:(int64_t)a3
{
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3E1D0();
    }
  }
  int v8 = +[IDSTransportLog IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "forceOTRNegotiation", v12, 2u);
  }

  uint64_t v9 = [(_IDSService *)self daemonController];
  uint64_t v10 = [(IDSAccountController *)self->_accountController _internal];
  char v11 = [v10 serviceName];
  [v9 startOTRTest:v11 priority:a3];
}

- (void)testCloudQRConnection
{
  char v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3E268();
    }
  }
  int v6 = [(_IDSService *)self daemonController];
  id v7 = [(IDSAccountController *)self->_accountController _internal];
  int v8 = [v7 serviceName];
  [v6 testCloudQRConnection:v8];
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 fromAccount:(id)a5 toDestinations:(id)a6 priority:(int64_t)a7 options:(id)a8 identifier:(id *)a9 error:(id *)a10
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v97 = a4;
  id v100 = a5;
  id v99 = a6;
  id v98 = a8;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v106 = _os_activity_create(&dword_19190B000, "Framework Send Resource At URL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v106, &state);
  int v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    size_t v111 = (size_t)v15;
    _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "!setState ResourceURL=%@", buf, 0xCu);
  }

  id v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v100 serviceName];
    *(_DWORD *)buf = 138412290;
    size_t v111 = (size_t)v18;
    _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "!setState serviceName=%@", buf, 0xCu);
  }
  if (a9)
  {
    uint64_t v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = *a9;
      *(_DWORD *)buf = 138412290;
      size_t v111 = (size_t)v20;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }
  }
  if (!self->_pretendingToBeFull)
  {
    [MEMORY[0x1E4F6B438] destinationWithDestinations:v99];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    v95 = long long v102 = 0u;
    __int16 v22 = [v95 destinationURIs];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v120 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v102;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v102 != v24) {
            objc_enumerationMutation(v22);
          }
          long long v26 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          if (![v26 _FZIDType])
          {
            long long v27 = [(_IDSService *)self serviceProperties];
            char v28 = [v27 wantsPhoneNumberAccount];

            if ((v28 & 1) == 0)
            {
              id v47 = +[IDSLogging _IDSService];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                long long v48 = [(_IDSService *)self serviceProperties];
                long long v49 = [v48 identifier];
                *(_DWORD *)buf = 138412546;
                size_t v111 = (size_t)v26;
                __int16 v112 = 2112;
                uint64_t v113 = v49;
                _os_log_impl(&dword_19190B000, v47, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - Unable to send message to %@ on service %@ since phone number accounts are disabled", buf, 0x16u);
              }
              if (a10)
              {
                uint64_t v118 = *MEMORY[0x1E4F28568];
                __int16 v119 = @"Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.";
                long long v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
                *a10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:44 userInfo:v50];
              }
              goto LABEL_37;
            }
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v120 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    if (([v15 isFileURL] & 1) == 0)
    {
      long long v51 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        size_t v111 = (size_t)v15;
        _os_log_impl(&dword_19190B000, v51, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - resourceURL not a file %@", buf, 0xCu);
      }

      id v52 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      __int16 v22 = objc_msgSend(v52, "initWithObjectsAndKeys:", @"Sending non-file resource unsupported", *MEMORY[0x1E4F28568], 0);
      if (a10)
      {
        BOOL v21 = 0;
        *a10 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:28 userInfo:v22];
      }
      else
      {
LABEL_37:
        BOOL v21 = 0;
      }
      goto LABEL_89;
    }
    __int16 v22 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v98];
    NSTemporaryDirectory();
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v15;
    id v89 = [v29 path];
    long long v30 = [v29 lastPathComponent];

    uint64_t v31 = [v92 stringByAppendingString:v30];

    uint64_t v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v109 = 0;
    long long v91 = [v32 attributesOfItemAtPath:v31 error:&v109];
    id v90 = v109;

    if (v91)
    {
      uint64_t v33 = [v31 stringByAppendingString:@".XXXX"];

      size_t MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v33);
      char v35 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xF3589C00uLL);
      if (!v35)
      {
        long long v53 = +[IDSTransportLog IDSService];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          size_t v111 = MaximumSizeOfFileSystemRepresentation;
          _os_log_impl(&dword_19190B000, v53, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - can't allocate %ld bytes for new file path", buf, 0xCu);
        }

        id v94 = 0;
        goto LABEL_45;
      }
      [(__CFString *)v33 getFileSystemRepresentation:v35 maxLength:MaximumSizeOfFileSystemRepresentation];
      mktemp(v35);
      long long v36 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v31 = [v36 stringWithFileSystemRepresentation:v35 length:strlen(v35)];

      free(v35);
    }
    id v93 = v89;
    char v37 = (const char *)[v93 cStringUsingEncoding:4];
    uint64_t v38 = v31;
    LODWORD(v37) = clonefile(v37, (const char *)[(__CFString *)v38 cStringUsingEncoding:4], 0);
    id v39 = __error();
    if ((v37 & 0x80000000) != 0)
    {
      int v40 = *v39;
      id v41 = +[IDSTransportLog IDSService];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        size_t v111 = (size_t)v93;
        __int16 v112 = 2112;
        uint64_t v113 = v38;
        __int16 v114 = 1024;
        LODWORD(v115) = v40;
        _os_log_impl(&dword_19190B000, v41, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - failed to clone file %@ => %@ (error %d). Will try hard link.", buf, 0x1Cu);
      }

      id v42 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v108 = 0;
      char v43 = [v42 linkItemAtPath:v93 toPath:v38 error:&v108];
      id v90 = v108;

      if ((v43 & 1) == 0)
      {

        long long v44 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v107 = 0;
        char v45 = [v44 copyItemAtPath:v93 toPath:v38 error:&v107];
        id v90 = v107;

        if ((v45 & 1) == 0)
        {
          long long v46 = +[IDSTransportLog IDSService];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            size_t v111 = (size_t)v93;
            __int16 v112 = 2112;
            uint64_t v113 = v38;
            __int16 v114 = 2112;
            uint64_t v115 = (uint64_t)v90;
            _os_log_impl(&dword_19190B000, v46, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - failed to link and failed to copy file %@ => %@ (error %@)", buf, 0x20u);
          }

          uint64_t v38 = 0;
        }
      }
    }
    uint64_t v33 = v38;
    id v94 = v33;
LABEL_45:

    long long v54 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      NSTemporaryDirectory();
      long long v55 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v56 = [v29 fileSystemRepresentation];
      *(_DWORD *)buf = 138413058;
      size_t v111 = (size_t)v29;
      __int16 v112 = 2112;
      uint64_t v113 = v55;
      __int16 v114 = 2080;
      uint64_t v115 = v56;
      __int16 v116 = 2112;
      v117 = v94;
      _os_log_impl(&dword_19190B000, v54, OS_LOG_TYPE_DEFAULT, "Attempted to link or copy file %@ destination %@ (%s to %@)", buf, 0x2Au);
    }
    if ([(__CFString *)v94 length])
    {
      id v57 = +[IDSLogging _IDSService];
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        int v58 = [v29 isFileURL];
        uint64_t v59 = [v22 objectForKey:@"IDSSendMessageOptionLocalDelivery"];
        id v60 = (void *)v59;
        __int16 v61 = @"NO";
        *(_DWORD *)buf = 138412802;
        size_t v111 = (size_t)v29;
        __int16 v112 = 2112;
        if (v58) {
          __int16 v61 = @"YES";
        }
        uint64_t v113 = v61;
        __int16 v114 = 2112;
        uint64_t v115 = v59;
        _os_log_impl(&dword_19190B000, v57, OS_LOG_TYPE_INFO, "sendResourceAtURL - resourceURL %@  isFileURL %@  localDelivery %@", buf, 0x20u);
      }
      id v62 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v63 = v94;
      if (v63)
      {
        CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E4F6B0F0], v63);
      }
      else
      {
        BOOL v66 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v66) {
          sub_191A3E300(v66, v67, v68);
        }
      }

      id v69 = v97;
      if (v69) {
        CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E4F6B0D0], v69);
      }

      long long v70 = [v29 absoluteString];
      if (v70) {
        CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E4F6B0E0], v70);
      }

      long long v71 = v63;
      [(__CFString *)v71 UTF8String];
      long long v72 = (void *)sandbox_extension_issue_file();
      if (v72)
      {
        uint64_t v73 = [NSString stringWithUTF8String:v72];
        if (v73) {
          CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E4F6B0E8], v73);
        }

        free(v72);
      }
      else
      {
        id v74 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          size_t v111 = (size_t)v71;
          _os_log_impl(&dword_19190B000, v74, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension for linked/copied file [%@]", buf, 0xCu);
        }
      }
      id v75 = [v29 path];
      [v75 UTF8String];
      id v76 = (void *)sandbox_extension_issue_file();

      if (v76)
      {
        __int16 v77 = [NSString stringWithUTF8String:v76];
        if (v77) {
          CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E4F6B0D8], v77);
        }

        free(v76);
      }
      else
      {
        __int16 v78 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          size_t v111 = (size_t)v29;
          _os_log_impl(&dword_19190B000, v78, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension for original file [%@]", buf, 0xCu);
        }
      }
      BOOL v21 = [(_IDSService *)self sendMessage:v62 fromAccount:v100 toDestinations:v99 priority:a7 options:v22 identifier:a9 error:a10];
      char v79 = !v21;
      if (!a9) {
        char v79 = 1;
      }
      if ((v79 & 1) == 0)
      {
        if (*a9)
        {
          __int16 v80 = [MEMORY[0x1E4F28F90] currentProgress];
          BOOL v81 = v80 == 0;

          if (!v81)
          {
            __int16 v82 = [v98 objectForKey:@"IDSSendMessageOptionWantsProgress"];

            if (v82)
            {
              id v83 = [v98 objectForKeyedSubscript:@"IDSSendMessageOptionWantsProgress"];
              BOOL v84 = v83 == 0;

              if (!v84)
              {
                if (!self->_uniqueIDToProgress)
                {
                  CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                  uniqueIDToProgress = self->_uniqueIDToProgress;
                  self->_uniqueIDToProgress = Mutable;
                }
                id v87 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
                [(NSMutableDictionary *)self->_uniqueIDToProgress setObject:v87 forKeyedSubscript:*a9];
              }
            }
          }
        }
      }
    }
    else
    {
      long long v64 = +[IDSTransportLog IDSService];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        size_t v111 = (size_t)v29;
        _os_log_impl(&dword_19190B000, v64, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - unable to link or copy file %@", buf, 0xCu);
      }

      id v65 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v62 = (__CFDictionary *)objc_msgSend(v65, "initWithObjectsAndKeys:", @"Unable to link or copy file", *MEMORY[0x1E4F28568], 0);
      BOOL v21 = 0;
      if (a10) {
        *a10 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v62];
      }
    }

LABEL_89:
    goto LABEL_90;
  }
  [(_IDSService *)self _handlePretendingToBeFullWithIdentifier:a9];
  BOOL v21 = 1;
LABEL_90:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v21;
}

- (BOOL)sendAheadGroup:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = +[IDSInternalQueueController sharedInstance];
  int v16 = [v15 assertQueueIsCurrent];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_191A3E398();
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F6B460] groupCrypto];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v12 groupID];
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v19;
    _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Sending Ahead group {groupID: %{public}@}", buf, 0xCu);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1919D6458;
  v24[3] = &unk_1E572C858;
  id v25 = v13;
  long long v26 = self;
  id v27 = v12;
  id v28 = v14;
  int64_t v29 = a4;
  long long v30 = a6;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  [(_IDSService *)self performGroupTask:v24];

  return 1;
}

- (BOOL)reportSpamMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3E564();
    }
  }
  int v8 = [(_IDSService *)self serviceProperties];
  uint64_t v9 = [v8 identifier];

  if (v9)
  {
    uint64_t v10 = [v4 objectForKey:*MEMORY[0x1E4F6B608]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      if (v11 == 1)
      {
        id v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6B600]];

        if (v15) {
          goto LABEL_10;
        }
        id v13 = +[IDSLogging _IDSService];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_191A3E530();
        }
        goto LABEL_19;
      }
      if (v11)
      {
LABEL_10:
        id v13 = [(_IDSService *)self daemonController];
        [v13 reportSpamMessage:v4 serviceIdentifier:v9];
        BOOL v14 = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    id v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6B628]];

    if (v12) {
      goto LABEL_10;
    }
    id v13 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A3E4FC();
    }
LABEL_19:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_191A3E4C8();
  }
  BOOL v14 = 0;
LABEL_21:

  return v14;
}

- (void)sendAckForMessageWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3E630();
    }
  }
  if (self->_manuallyAckMessages)
  {
    int v8 = [(_IDSService *)self _sendingAccountForAccount:0];
    uint64_t v9 = [v8 _internal];
    uint64_t v10 = [v9 uniqueID];

    if (v10)
    {
      uint64_t v11 = [(NSMutableDictionary *)self->_uniqueIDToConnection objectForKey:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }
    int v12 = [v4 wantsAppAck];
    id v41 = [v4 outgoingResponseIdentifier];
    uint64_t v13 = [v4 storageGuid];
    int v40 = [v4 fromID];
    BOOL v14 = [v4 broadcastTime];

    if (v14)
    {
      id v15 = NSNumber;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v17 = v16;
      uint64_t v18 = [v4 broadcastTime];
      [v18 doubleValue];
      uint64_t v20 = [v15 numberWithDouble:v17 - v19];

      if (!v12)
      {
LABEL_14:
        if (v13 | v20)
        {
          char v35 = [(_IDSService *)self daemonController];
          char v37 = [v11 _internal];
          int64_t v29 = [v37 account];
          [v29 _internal];
          long long v30 = v39 = v10;
          uint64_t v31 = [v30 uniqueID];
          [v4 priority];
          uint64_t v33 = v32 = v11;
          objc_msgSend(v35, "acknowledgeMessageWithStorageGUID:realGUID:forAccountWithUniqueID:broadcastTime:messageSize:priority:broadcastID:connectionType:", v13, v41, v31, v20, 0, v33, objc_msgSend(v4, "broadcastID"), objc_msgSend(v4, "connectionType"));

          uint64_t v11 = v32;
          uint64_t v10 = v39;
        }
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v20 = 0;
      if (!v12) {
        goto LABEL_14;
      }
    }
    uint64_t v34 = [v4 connectionType];
    id v21 = [(_IDSService *)self daemonController];
    id v22 = [v11 _internal];
    [v22 account];
    uint64_t v23 = v38 = v11;
    [v23 _internal];
    long long v36 = v8;
    v25 = uint64_t v24 = v10;
    [v25 uniqueID];
    uint64_t v26 = v20;
    id v28 = v27 = v13;
    [v21 sendAppAckWithGUID:v41 toDestination:v40 forAccountWithUniqueID:v28 connectionType:v34];

    uint64_t v13 = v27;
    uint64_t v20 = v26;

    uint64_t v10 = v24;
    int v8 = v36;

    uint64_t v11 = v38;
    goto LABEL_14;
  }
  int v8 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_191A3E5FC();
  }
LABEL_17:
}

- (BOOL)sendCertifiedDeliveryReceipt:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(_IDSService *)self _sendingAccountForAccount:0];
    int v6 = [v5 _internal];
    id v7 = [v6 pushTopic];

    int v8 = [v4 service];
    int v9 = [v7 isEqualToString:v8];

    uint64_t v10 = +[IDSLogging _IDSService];
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "sendCertifiedDeliveryReceipt passing context to daemon { context: %@ }", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v11 = [(_IDSService *)self daemonController];
      int v12 = [v4 dictionaryRepresentation];
      [v11 sendCertifiedDeliveryReceipt:v12 serviceName:v7];
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_191A3E6FC(v4);
    }
  }
  else
  {
    uint64_t v5 = +[IDSLogging _IDSService];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3E6C8();
    }
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_sendMissingMessageMetric:(id)a3
{
  id v6 = a3;
  if ([v6 shouldReportMetric])
  {
    id v4 = [v6 payload];
    uint64_t v5 = [v6 command];
    [(_IDSService *)self sendServerMessage:v4 command:v5 fromAccount:0];
  }
}

- (id)datagramConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(_IDSService *)self datagramConnectionForSessionDestination:v6 uid:getuid() error:a4];

  return v7;
}

- (id)datagramConnectionForSessionDestination:(id)a3 uid:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = [MEMORY[0x1E4F38BF0] endpointWithHostname:a3 port:@"0"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F38C10]);
  [v8 setDataMode:1];
  int v9 = [NSString stringWithFormat:@"%@%u", *MEMORY[0x1E4F6B100], v6];
  [v8 requireNetworkAgentWithDomain:v9 type:*MEMORY[0x1E4F6B0F8]];

  uint64_t v10 = [MEMORY[0x1E4F38BE0] connectionWithEndpoint:v7 parameters:v8];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    int v14 = objc_msgSend(v13, "initWithObjectsAndKeys:", @"Unable to create datagram connection with destination", *MEMORY[0x1E4F28568], 0);
    if (a5) {
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v14];
    }
  }

  return v11;
}

- (id)datagramConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5 = dup(a3);
  if (v5 == -1
    || ([MEMORY[0x1E4F38BE0] connectionWithConnectedSocket:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", @"Unable to create datagram connection with destination", *MEMORY[0x1E4F28568], 0);
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v8];
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)streamConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", @"Unable to create stream connection with destination", *MEMORY[0x1E4F28568], 0);
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v6];
  }

  return 0;
}

- (id)streamConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5 = dup(a3);
  if (v5 == -1
    || ([MEMORY[0x1E4F38C30] connectionWithConnectedSocket:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", @"Unable to create datagram connection with destination", *MEMORY[0x1E4F28568], 0);
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v8];
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)datagramChannelForSessionDestination:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [[IDSDatagramChannel alloc] initWithDestination:v7 options:v8];

  uint64_t v10 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "Creating datagram channel with destination %@ => %@", buf, 0x16u);
  }

  if (v9)
  {
    uint64_t v11 = v9;
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", @"Unable to create datagram channel with destination", *MEMORY[0x1E4F28568], 0);
    if (a5) {
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v13];
    }
  }

  return v9;
}

- (id)datagramChannelForSocketDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = dup(a3);
  if (v6 == -1) {
    goto LABEL_5;
  }
  id v7 = [[IDSDatagramChannel alloc] initWithSocketDescriptor:v6];
  id v8 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = a3;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Creating datagram channel with socket %d => %@", buf, 0x12u);
  }

  if (!v7)
  {
LABEL_5:
    id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", @"Unable to create datagram channel with socket descriptor", *MEMORY[0x1E4F28568], 0);
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v10];
    }

    id v7 = 0;
  }

  return v7;
}

- (void)_enableAccount:(id)a3
{
}

- (void)_disableAccount:(id)a3
{
}

- (void)performGroupTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_IDSService *)self groupContextController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919D79C4;
  v7[3] = &unk_1E572C880;
  id v8 = v4;
  id v6 = v4;
  [v5 groupContextWithCompletion:v7];
}

- (void)scheduleTransactionLogTask:(id)a3
{
  id v4 = a3;
  id v5 = [(_IDSService *)self groupContextController];
  [v5 scheduleTransactionLogTask:v4];
}

- (void)connection:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = +[IDSLogging _IDSService];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v9 = a4;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "checkTransportLog {reason: %ld}", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919D7B40;
  v7[3] = &unk_1E572C350;
  void v7[4] = self;
  v7[5] = a4;
  [(_IDSService *)self _callDelegatesWithBlock:v7];
}

- (void)groupContextController:(id)a3 didCreateGroup:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSInternalQueueController sharedInstance];
  int v7 = [v6 assertQueueIsCurrent];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A3E79C();
    }
  }
  id v14 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1919D7CE0;
  v11[3] = &unk_1E572C8A8;
  id v12 = v5;
  id v13 = 0;
  id v9 = v5;
  [(_IDSService *)self sendAheadGroup:v9 priority:300 options:MEMORY[0x1E4F1CC08] identifier:&v14 completion:v11];
  id v10 = v14;
}

- (id)groupContextController:(id)a3 accountsForAlises:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3E834();
    }
  }
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v11 = [(_IDSService *)self accounts];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              __int16 v17 = [v16 aliasStrings];
              int v18 = [v17 containsObject:v10];

              if (v18) {
                [v8 setObject:v16 forKeyedSubscript:v10];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v13);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  return v8;
}

- (BOOL)manuallyAckMessages
{
  return self->_manuallyAckMessages;
}

- (void)setManuallyAckMessages:(BOOL)a3
{
  self->_manuallyAckMessages = a3;
}

- (IDSGroupContextController)groupContextController
{
  return self->_groupContextController;
}

- (BOOL)wantsPseudonymUpdates
{
  return self->_wantsPseudonymUpdates;
}

- (NSDictionary)cachedPseudonymURIMap
{
  return self->_cachedPseudonymURIMap;
}

- (void)setCachedPseudonymURIMap:(id)a3
{
}

- (CUTDeferredTaskQueue)pseudonymUpdateTaskQueue
{
  return self->_pseudonymUpdateTaskQueue;
}

- (void)setPseudonymUpdateTaskQueue:(id)a3
{
}

- (NSMutableDictionary)completionBlocksByRequestID
{
  return self->_completionBlocksByRequestID;
}

- (void)setCompletionBlocksByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocksByRequestID, 0);
  objc_storeStrong((id *)&self->_pseudonymUpdateTaskQueue, 0);
  objc_storeStrong((id *)&self->_cachedPseudonymURIMap, 0);
  objc_storeStrong(&self->_pendingRegisteredIdentitiesBlock, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_acknowledgementTracker, 0);
  objc_storeStrong((id *)&self->_uniqueIDToProgress, 0);
  objc_storeStrong((id *)&self->_groupContextController, 0);
  objc_storeStrong((id *)&self->_subServices, 0);
  objc_storeStrong((id *)&self->_linkedDevices, 0);
  objc_storeStrong((id *)&self->_lastIsActiveSet, 0);
  objc_storeStrong((id *)&self->_protobufSelectors, 0);
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_uniqueIDToConnection, 0);

  objc_storeStrong((id *)&self->_accountController, 0);
}

@end