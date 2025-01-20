@interface ADCompanionService
+ (ADCompanionService)sharedInstance;
- (ADCompanionService)init;
- (ADRapportLink)clientAWDLTransportLink;
- (ADRapportLink)clientLink;
- (BOOL)_cancelTimerForMessage:(id)a3;
- (BOOL)_isDevicePartOfCurrentMediaSystem:(id)a3;
- (BOOL)_shouldLogDiscoveryContextForRequestId:(id)a3;
- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 heartbeat:(BOOL)a5 completion:(id)a6;
- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 timeout:(double)a5 heartbeat:(BOOL)a6 completion:(id)a7;
- (BOOL)_updateSharedData:(id)a3 forDevice:(id)a4;
- (BOOL)_updateSharedDataFromIDSWithIdentifier:(id)a3;
- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 assistantId:(id *)a6 idsDeviceId:(id *)a7 homeKitId:(id *)a8;
- (BOOL)doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:(id)a3;
- (BOOL)isListening;
- (BOOL)isReady;
- (BOOL)isStereoPairConfigured;
- (NSMapTable)handlerForMessageType;
- (NSMutableDictionary)deviceUpdateLog;
- (NSMutableDictionary)incomingRequestLog;
- (NSMutableDictionary)intermediateMessageIDs;
- (NSMutableDictionary)playbackDeviceIDs;
- (NSMutableDictionary)timerInfo;
- (NSMutableSet)discoveryContextLoggedForExecutionIds;
- (NSMutableSet)waitContexts;
- (NSString)cachedStoreFrontIdentifier;
- (NSString)clientAWDLTransportLinkDestinationId;
- (NSString)stereoPartnerIDSIdentifier;
- (OS_dispatch_queue)instrumentationQueue;
- (OS_dispatch_queue)serialQueue;
- (_ADPBDeviceSetDataRequest)cachedSharedData;
- (id)_companionDevice;
- (id)_companionLinkDeviceForHkIdentifier:(id)a3;
- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 allowsAWDLFallback:(BOOL)a5 error:(id *)a6 logDiscoveryContextFor:(id)a7;
- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 logDiscoveryContextFor:(id)a5;
- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3;
- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3 allowsAWDLFallback:(BOOL)a4;
- (id)_getExecutionIdFromRequest:(id)a3;
- (id)_initializeNewMessageWaitContext;
- (id)_newRequestDictionary;
- (id)_newRequestDictionaryWithRequestInfo:(id)a3;
- (id)_newRequestInfoWithRequestDictionary:(id)a3;
- (id)_rapportEffectiveIdForPeer:(id)a3;
- (id)_remotePlaybackDeviceForDevice:(id)a3;
- (id)_setUpNewIntermediateIDsSetForPeer:(id)a3;
- (id)_setupClientAWDLTransportLinkForDestination:(id)a3;
- (id)_transformedRequestDictionaryToForward:(id)a3;
- (id)discoveryTypeForPeer:(id)a3;
- (id)getDevicesDiscoveredNearbyForUserID:(id)a3;
- (id)getDevicesDiscoveredTypeCountForUserID:(id)a3;
- (id)getUserIDForDevice:(id)a3;
- (int64_t)deviceType:(id)a3;
- (void)_activateAWDLMessageLink:(id)a3 completion:(id)a4;
- (void)_cancelAWDLClientLinkTimer;
- (void)_checkCompanionIdentifierStatus;
- (void)_cleanUpMessageWaitContext:(id)a3;
- (void)_emitDevicesDiscoveredEventForRequestId:(id)a3 deviceTypeCount:(id)a4;
- (void)_encryptionKeyDidChange:(id)a3;
- (void)_executeRemoteRequest:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 throughProxyDevice:(id)a7 completion:(id)a8;
- (void)_getFilteredDevicesFromList:(id)a3 withAccessToSameHomeAsDevice:(id)a4 completion:(id)a5;
- (void)_getSharedDataFromCompanionLinkDevice:(id)a3 completion:(id)a4;
- (void)_handleAceCommandRequest:(id)a3 messageID:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)_logCompanionDeviceCommunicationContextFor:(id)a3 executionId:(id)a4;
- (void)_logCompanionDeviceDiscoveryContextFor:(id)a3 executionId:(id)a4;
- (void)_logPersonalDevicesDiscoveredNearbyForRequestId:(id)a3;
- (void)_musicPersonalizationTokenChanged;
- (void)_postConfigurationChangedNotification;
- (void)_prepAWDLClientLinkIfMessageReceivedOverAWDL:(id)a3;
- (void)_recordIntermediateMessageID:(id)a3 forPeer:(id)a4;
- (void)_removeMessageHandler:(id)a3 forMessageType:(id)a4;
- (void)_resetHashedRouteIDs;
- (void)_scheduleOrExtendAWDLClientLinkTimer;
- (void)_sendHeartbeatMessage:(id)a3 targetDeviceIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)_sendMessage:(id)a3 messageType:(id)a4 toTargetDevice:(id)a5 completion:(id)a6;
- (void)_setIsStereoPairConfigured:(BOOL)a3;
- (void)_setReadyState:(BOOL)a3;
- (void)_setupClientLink;
- (void)_sharedDataDidChange:(id)a3;
- (void)_startListening;
- (void)_startObservingDataChangedNotifications;
- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)_stopListening;
- (void)_stopObservingDataChangedNotifications;
- (void)_storeFrontDidChange:(id)a3;
- (void)_tearDownIntermediateMessageIDs:(id)a3 forPeer:(id)a4;
- (void)_unblockWaitContext:(id)a3 forMessageID:(id)a4;
- (void)_unblockWaitingForMessageIDs:(id)a3;
- (void)_updateAssistantIDMapForDevice:(id)a3;
- (void)_updateCompanionIdentifier;
- (void)_updateHashedRouteIDForDevice:(id)a3;
- (void)_updateMediaSystemState;
- (void)_updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3;
- (void)_updateSharedDataForDevice:(id)a3 allowIDSFetch:(BOOL)a4 completion:(id)a5;
- (void)_updateSharedDataWithCompletion:(id)a3;
- (void)_updateSiriInfoDictionary;
- (void)_updateStoreFrontIdentifierWithCompletion:(id)a3;
- (void)_waitForMessageIDs:(id)a3 withContext:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)getDeviceIdentifiersWithCompletion:(id)a3;
- (void)getPlaybackDeviceListWithCompletion:(id)a3;
- (void)getSharedCompanionInfoWithCompletion:(id)a3;
- (void)getStereoPartnerIdentifierWithCompletion:(id)a3;
- (void)invalidateClientAWDLTransportLink;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)removeMessageHandler:(id)a3 forMessageType:(id)a4;
- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithHKIdentifier:(id)a5 completion:(id)a6;
- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithIDSIdentifier:(id)a5 completion:(id)a6;
- (void)sendStereoPartnerMessage:(id)a3 messageType:(id)a4 completion:(id)a5;
- (void)setCachedSharedData:(id)a3;
- (void)setCachedStoreFrontIdentifier:(id)a3;
- (void)setClientAWDLTransportLink:(id)a3;
- (void)setClientAWDLTransportLinkDestinationId:(id)a3;
- (void)setClientLink:(id)a3;
- (void)setDeviceUpdateLog:(id)a3;
- (void)setDiscoveryContextLoggedForExecutionIds:(id)a3;
- (void)setHandlerForMessageType:(id)a3;
- (void)setIncomingRequestLog:(id)a3;
- (void)setInstrumentationQueue:(id)a3;
- (void)setIntermediateMessageIDs:(id)a3;
- (void)setMessageHandler:(id)a3 forMessageType:(id)a4;
- (void)setPlaybackDeviceIDs:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStereoPartnerIDSIdentifier:(id)a3;
- (void)setTimerInfo:(id)a3;
- (void)setWaitContexts:(id)a3;
- (void)startListeningForRemote;
- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8;
- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5;
- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8;
- (void)stopListening;
- (void)updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3;
@end

@implementation ADCompanionService

- (void)_emitDevicesDiscoveredEventForRequestId:(id)a3 deviceTypeCount:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v7 = objc_alloc_init((Class)HALSchemaHALNearbyPersonalDevicesReported);
  [v6 setNearbyPersonalDevicesReported:v7];
  [v6 setHasNearbyPersonalDevicesReported:1];
  uint64_t v8 = +[NSUUID UUID];
  id v9 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  v26 = (void *)v8;
  id v10 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v8];
  [v9 setHalId:v10];

  v27 = v6;
  v25 = v9;
  [v6 setEventMetadata:v9];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v15) integerValue];
        v17 = +[NSNumber numberWithInteger:v16];
        v18 = [v11 objectForKeyedSubscript:v17];
        id v19 = [v18 integerValue];

        switch((unint64_t)v16)
        {
          case 0uLL:
            [v7 setIPhoneCount:v19];
            [v7 setHasIPhoneCount:1];
            break;
          case 1uLL:
            [v7 setIPadCount:v19];
            [v7 setHasIPadCount:1];
            break;
          case 2uLL:
            [v7 setWatchCount:v19];
            [v7 setHasWatchCount:1];
            break;
          case 3uLL:
            [v7 setMacBookCount:v19];
            [v7 setHasMacBookCount:1];
            break;
          case 4uLL:
            [v7 setMacStudioCount:v19];
            [v7 setHasMacStudioCount:1];
            break;
          case 5uLL:
            [v7 setIMacCount:v19];
            [v7 setHasIMacCount:1];
            break;
          default:
            break;
        }
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }

  v20 = +[AssistantSiriAnalytics sharedAnalytics];
  v21 = [v20 defaultMessageStream];
  [v21 emitMessage:v27];

  v22 = ADCreateRequestLinkInfo();
  v23 = [v26 UUIDString];
  v24 = ADCreateRequestLinkInfo();

  ADEmitRequestLinkEventMessage();
}

- (void)_logPersonalDevicesDiscoveredNearbyForRequestId:(id)a3
{
  id v4 = a3;
  if (AFIsHorseman())
  {
    id v5 = +[ADCommandCenter sharedCommandCenter];
    id v6 = [v5 _selectedSharedUserID];

    if ([v6 length])
    {
      id v7 = [(ADCompanionService *)self instrumentationQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004E030;
      block[3] = &unk_10050DCB8;
      block[4] = self;
      id v9 = v4;
      id v10 = v6;
      dispatch_async(v7, block);
    }
  }
}

- (void)_logCompanionDeviceCommunicationContextFor:(id)a3 executionId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v16 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v7 = objc_alloc_init((Class)HALSchemaHALCompanionDeviceCommunicationContext);
  [v7 setEnded:v6];

  [v7 setHasEnded:1];
  [v16 setCompanionDeviceCommunicationContext:v7];
  uint64_t v8 = +[NSUUID UUID];
  id v9 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  id v10 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v8];
  [v9 setHalId:v10];

  [v16 setEventMetadata:v9];
  id v11 = +[AssistantSiriAnalytics sharedAnalytics];
  id v12 = [v11 defaultMessageStream];
  [v12 emitMessage:v16];

  id v13 = ADCreateRequestLinkInfo();

  uint64_t v14 = [v8 UUIDString];
  v15 = ADCreateRequestLinkInfo();

  ADEmitRequestLinkEventMessage();
}

- (void)_logCompanionDeviceDiscoveryContextFor:(id)a3 executionId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v16 = objc_alloc_init((Class)HALSchemaHALClientEvent);
  id v7 = objc_alloc_init((Class)HALSchemaHALCompanionDeviceDiscoveryContext);
  [v7 setEnded:v6];

  [v7 setHasEnded:1];
  [v16 setCompanionDeviceDiscoveryContext:v7];
  uint64_t v8 = +[NSUUID UUID];
  id v9 = objc_alloc_init((Class)HALSchemaHALClientEventMetadata);
  id v10 = [objc_alloc((Class)SISchemaUUID) initWithNSUUID:v8];
  [v9 setHalId:v10];

  [v16 setEventMetadata:v9];
  id v11 = +[AssistantSiriAnalytics sharedAnalytics];
  id v12 = [v11 defaultMessageStream];
  [v12 emitMessage:v16];

  id v13 = ADCreateRequestLinkInfo();

  uint64_t v14 = [v8 UUIDString];
  v15 = ADCreateRequestLinkInfo();

  ADEmitRequestLinkEventMessage();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLink, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_clientAWDLTransportLinkDestinationId, 0);
  objc_storeStrong((id *)&self->_clientAWDLTransportLink, 0);
  objc_storeStrong((id *)&self->_discoveryContextLoggedForExecutionIds, 0);
  objc_storeStrong((id *)&self->_intermediateMessageIDs, 0);
  objc_storeStrong((id *)&self->_waitContexts, 0);
  objc_storeStrong((id *)&self->_cachedStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSharedData, 0);
  objc_storeStrong((id *)&self->_playbackDeviceIDs, 0);
  objc_storeStrong((id *)&self->_handlerForMessageType, 0);
  objc_storeStrong((id *)&self->_stereoPartnerIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceUpdateLog, 0);
  objc_storeStrong((id *)&self->_incomingRequestLog, 0);
  objc_storeStrong((id *)&self->_timerInfo, 0);
  objc_storeStrong((id *)&self->_instrumentationQueue, 0);
  objc_storeStrong((id *)&self->_awdlClientLinkTimer, 0);
}

- (void)setClientLink:(id)a3
{
}

- (ADRapportLink)clientLink
{
  return self->_clientLink;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setClientAWDLTransportLinkDestinationId:(id)a3
{
}

- (NSString)clientAWDLTransportLinkDestinationId
{
  return self->_clientAWDLTransportLinkDestinationId;
}

- (void)setClientAWDLTransportLink:(id)a3
{
}

- (ADRapportLink)clientAWDLTransportLink
{
  return self->_clientAWDLTransportLink;
}

- (void)setDiscoveryContextLoggedForExecutionIds:(id)a3
{
}

- (NSMutableSet)discoveryContextLoggedForExecutionIds
{
  return self->_discoveryContextLoggedForExecutionIds;
}

- (void)setIntermediateMessageIDs:(id)a3
{
}

- (NSMutableDictionary)intermediateMessageIDs
{
  return self->_intermediateMessageIDs;
}

- (void)setWaitContexts:(id)a3
{
}

- (NSMutableSet)waitContexts
{
  return self->_waitContexts;
}

- (void)setCachedStoreFrontIdentifier:(id)a3
{
}

- (NSString)cachedStoreFrontIdentifier
{
  return self->_cachedStoreFrontIdentifier;
}

- (void)setCachedSharedData:(id)a3
{
}

- (_ADPBDeviceSetDataRequest)cachedSharedData
{
  return self->_cachedSharedData;
}

- (void)setPlaybackDeviceIDs:(id)a3
{
}

- (NSMutableDictionary)playbackDeviceIDs
{
  return self->_playbackDeviceIDs;
}

- (void)setHandlerForMessageType:(id)a3
{
}

- (NSMapTable)handlerForMessageType
{
  return self->_handlerForMessageType;
}

- (NSString)stereoPartnerIDSIdentifier
{
  return self->_stereoPartnerIDSIdentifier;
}

- (void)setDeviceUpdateLog:(id)a3
{
}

- (NSMutableDictionary)deviceUpdateLog
{
  return self->_deviceUpdateLog;
}

- (void)setIncomingRequestLog:(id)a3
{
}

- (NSMutableDictionary)incomingRequestLog
{
  return self->_incomingRequestLog;
}

- (void)setTimerInfo:(id)a3
{
}

- (NSMutableDictionary)timerInfo
{
  return self->_timerInfo;
}

- (void)setInstrumentationQueue:(id)a3
{
}

- (OS_dispatch_queue)instrumentationQueue
{
  return self->_instrumentationQueue;
}

- (int64_t)deviceType:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v3 model];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 lowercaseString];
      if ([v6 hasPrefix:@"iphone"])
      {
        int64_t v7 = 0;
      }
      else if ([v6 hasPrefix:@"ipad"])
      {
        int64_t v7 = 1;
      }
      else if ([v6 hasPrefix:@"watch"])
      {
        int64_t v7 = 2;
      }
      else if ([v6 hasPrefix:@"macbook"])
      {
        int64_t v7 = 3;
      }
      else if ([v6 hasPrefix:@"macstudio"])
      {
        int64_t v7 = 4;
      }
      else if ([v6 hasPrefix:@"imac"])
      {
        int64_t v7 = 5;
      }
      else
      {
        int64_t v7 = 6;
      }
    }
    else
    {
      int64_t v7 = 6;
    }
  }
  else
  {
    int64_t v7 = 6;
  }

  return v7;
}

- (id)getUserIDForDevice:(id)a3
{
  id v3 = [a3 siriInfo];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"peerData"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = [v5 objectForKeyedSubscript:@"sharedUserIdentifier"];
      int64_t v7 = v6;
      if (v6 && [v6 length])
      {
        id v8 = v7;
      }
      else
      {
        id v11 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136315138;
          uint64_t v14 = "-[ADCompanionService getUserIDForDevice:]";
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s deviceSiriInfo sharedUserIdentifier nil", (uint8_t *)&v13, 0xCu);
        }
        id v8 = 0;
      }
    }
    else
    {
      id v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[ADCompanionService getUserIDForDevice:]";
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s deviceSiriInfo peerData nil", (uint8_t *)&v13, 0xCu);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[ADCompanionService getUserIDForDevice:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s deviceSiriInfo nil", (uint8_t *)&v13, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)getDevicesDiscoveredNearbyForUserID:(id)a3
{
  id v25 = a3;
  id v4 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v5 = [v4 copy];

  if (v5)
  {
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    group = dispatch_group_create();
    queue = dispatch_queue_create("ADInstrumentationDeviceDiscoveryQueue", 0);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v23 = v5;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (!v6) {
      goto LABEL_22;
    }
    uint64_t v7 = *(void *)v53;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v10 = [(ADCompanionService *)self getUserIDForDevice:v9];
        id v11 = [v9 idsDeviceIdentifier];
        if (v11)
        {
          uint64_t v32 = 0;
          v33 = &v32;
          uint64_t v34 = 0x2020000000;
          LOBYTE(v35) = 0;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10023FAB0;
          block[3] = &unk_10050C700;
          v51 = &v32;
          id v12 = v27;
          id v49 = v12;
          id v13 = v11;
          id v50 = v13;
          dispatch_sync(queue, block);
          if (!*((unsigned char *)v33 + 24))
          {
            unsigned int v14 = [v9 isDiscoveredOverInfraWifi];
            if (v10) {
              unsigned int v15 = v14;
            }
            else {
              unsigned int v15 = 0;
            }
            if (v15 == 1 && [v25 isEqualToString:v10])
            {
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10023FB04;
              v45[3] = &unk_10050DCB8;
              id v46 = v12;
              v47[0] = v13;
              v47[1] = v9;
              dispatch_async(queue, v45);
              id v16 = (id *)v47;
              v17 = &v46;
              goto LABEL_18;
            }
            if ([v9 hasWatchOS] && objc_msgSend(v9, "isOwner"))
            {
              dispatch_group_enter(group);
              v18 = +[ADMultiUserService sharedService];
              v38[0] = _NSConcreteStackBlock;
              v38[1] = 3221225472;
              v38[2] = sub_10023FB14;
              v38[3] = &unk_100508000;
              id v39 = v25;
              v40 = queue;
              id v41 = v12;
              id v42 = v13;
              v43 = v9;
              v44 = group;
              [v18 showPrimaryUserSharedUserIDWithCompletion:v38];

              id v16 = (id *)&v40;
              v17 = &v39;
LABEL_18:
            }
          }

          _Block_object_dispose(&v32, 8);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (!v6)
      {
LABEL_22:

        dispatch_time_t v19 = dispatch_time(0, 1000000000);
        dispatch_group_wait(group, v19);
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x3032000000;
        v35 = sub_10023FBD0;
        v36 = sub_10023FBE0;
        id v37 = 0;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10023FBE8;
        v29[3] = &unk_10050D5F0;
        id v30 = v27;
        long long v31 = &v32;
        id v20 = v27;
        dispatch_sync(queue, v29);
        id v21 = (id)v33[5];

        _Block_object_dispose(&v32, 8);
        id v5 = v23;
        goto LABEL_24;
      }
    }
  }
  id v21 = &__NSArray0__struct;
LABEL_24:

  return v21;
}

- (id)getDevicesDiscoveredTypeCountForUserID:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[ADCompanionService getDevicesDiscoveredTypeCountForUserID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [(ADCompanionService *)self getDevicesDiscoveredNearbyForUserID:v4];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        int64_t v12 = [(ADCompanionService *)self deviceType:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        id v13 = +[NSNumber numberWithInteger:v12];
        unsigned int v14 = [v6 objectForKeyedSubscript:v13];

        unsigned int v15 = +[NSNumber numberWithInteger:v12];
        if (v14)
        {
          id v16 = [v6 objectForKeyedSubscript:v15];

          v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v16 integerValue] + 1);
          v18 = +[NSNumber numberWithInteger:v12];
          [v6 setObject:v17 forKeyedSubscript:v18];

          unsigned int v15 = v16;
        }
        else
        {
          [v6 setObject:&off_100523A20 forKeyedSubscript:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  dispatch_time_t v19 = +[NSDictionary dictionaryWithDictionary:v6];

  return v19;
}

- (void)_cancelAWDLClientLinkTimer
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[ADCompanionService _cancelAWDLClientLinkTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  awdlClientLinkTimer = self->_awdlClientLinkTimer;
  if (awdlClientLinkTimer)
  {
    [(AFWatchdogTimer *)awdlClientLinkTimer cancel];
    id v5 = self->_awdlClientLinkTimer;
    self->_awdlClientLinkTimer = 0;
  }
}

- (void)_scheduleOrExtendAWDLClientLinkTimer
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int64_t v12 = "-[ADCompanionService _scheduleOrExtendAWDLClientLinkTimer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  awdlClientLinkTimer = self->_awdlClientLinkTimer;
  if (awdlClientLinkTimer)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int64_t v12 = "-[ADCompanionService _scheduleOrExtendAWDLClientLinkTimer]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Extending time out.", buf, 0xCu);
      awdlClientLinkTimer = self->_awdlClientLinkTimer;
    }
    [(AFWatchdogTimer *)awdlClientLinkTimer reset];
  }
  id v6 = objc_alloc((Class)AFWatchdogTimer);
  serialQueue = self->_serialQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002401C4;
  v10[3] = &unk_10050E138;
  v10[4] = self;
  id v8 = (AFWatchdogTimer *)[v6 initWithTimeoutInterval:serialQueue onQueue:v10 timeoutHandler:45.0];
  id v9 = self->_awdlClientLinkTimer;
  self->_awdlClientLinkTimer = v8;

  [(AFWatchdogTimer *)self->_awdlClientLinkTimer start];
}

- (void)invalidateClientAWDLTransportLink
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[ADCompanionService invalidateClientAWDLTransportLink]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  clientAWDLTransportLink = self->_clientAWDLTransportLink;
  if (clientAWDLTransportLink)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      clientAWDLTransportLinkDestinationId = self->_clientAWDLTransportLinkDestinationId;
      int v9 = 136315394;
      uint64_t v10 = "-[ADCompanionService invalidateClientAWDLTransportLink]";
      __int16 v11 = 2112;
      int64_t v12 = clientAWDLTransportLinkDestinationId;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s _clientAWDLTransportLink exists for %@. Invalidating it.", (uint8_t *)&v9, 0x16u);
      clientAWDLTransportLink = self->_clientAWDLTransportLink;
    }
    [(ADRapportLink *)clientAWDLTransportLink removeListener:self];
    [(ADRapportLink *)self->_clientAWDLTransportLink invalidate];
    uint64_t v7 = self->_clientAWDLTransportLink;
    self->_clientAWDLTransportLink = 0;
  }
  id v8 = self->_clientAWDLTransportLinkDestinationId;
  self->_clientAWDLTransportLinkDestinationId = 0;

  [(ADCompanionService *)self _cancelAWDLClientLinkTimer];
}

- (BOOL)doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(ADRapportLink *)self->_clientLink activeDevices];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    char v19 = 0;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = v4;
          if (v9)
          {
            [v9 operatingSystemVersion];
            uint64_t v12 = v23;
            [v9 operatingSystemVersion];
            uint64_t v13 = v22;
            [v9 operatingSystemVersion];
            uint64_t v14 = v21;
          }
          else
          {
            uint64_t v14 = 0;
            uint64_t v13 = 0;
            uint64_t v12 = 0;
            uint64_t v23 = 0;
            uint64_t v22 = 0;
            uint64_t v21 = 0;
          }
          *(_DWORD *)buf = 136316162;
          long long v29 = "-[ADCompanionService doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:]";
          __int16 v30 = 2112;
          long long v31 = v9;
          __int16 v32 = 2048;
          uint64_t v33 = v12;
          __int16 v34 = 2048;
          uint64_t v35 = v13;
          __int16 v36 = 2048;
          uint64_t v37 = v14;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s DEVICE: %@, OS major version %ld, OS minor version %ld, OS patch version %ld,", buf, 0x34u);
          id v4 = v11;
        }

        if ([v9 isOwner]
          && [v9 isDiscoveredOverInfraWifi]
          && [v9 hasIOS])
        {
          if (v4)
          {
            unsigned int v15 = [v9 idsDeviceIdentifier];
            id v16 = [v4 idsDeviceUniqueIdentifier];
            unsigned int v17 = [v15 isEqualToString:v16] ^ 1;
          }
          else
          {
            LOBYTE(v17) = 1;
          }
          v19 |= v17;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    char v19 = 0;
  }

  return v19 & 1;
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    unsigned int v17 = "-[ADCompanionService rapportLink:didLoseDevice:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s device lost: %@", (uint8_t *)&v16, 0x16u);
  }
  if (self->_siriInfoDictNeedsInit) {
    [(ADCompanionService *)self _updateSiriInfoDictionary];
  }
  if (AFIsHorseman()
    && [(ADCompanionService *)self _isDevicePartOfCurrentMediaSystem:v7])
  {
    int v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      unsigned int v17 = "-[ADCompanionService rapportLink:didLoseDevice:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s media system device lost: %@", (uint8_t *)&v16, 0x16u);
    }
    [(ADCompanionService *)self setStereoPartnerIDSIdentifier:0];
  }
  uint64_t v10 = +[NSNotificationCenter defaultCenter];
  if (AFSupportsPlayThisOnThat())
  {
    playbackDeviceIDs = self->_playbackDeviceIDs;
    uint64_t v12 = [v7 identifier];
    uint64_t v13 = [(NSMutableDictionary *)playbackDeviceIDs objectForKey:v12];

    if (v13)
    {
      uint64_t v14 = self->_playbackDeviceIDs;
      unsigned int v15 = [v7 identifier];
      [(NSMutableDictionary *)v14 removeObjectForKey:v15];

      [v10 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
    }
  }
  [v10 postNotificationName:@"ADCompanionServiceActiveDevicesDidChangeNotification" object:0];
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v33 = 136315650;
    __int16 v34 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2048;
    uint64_t v38 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s device updated: %@ with changes: %ld", (uint8_t *)&v33, 0x20u);
  }
  if (self->_siriInfoDictNeedsInit) {
    [(ADCompanionService *)self _updateSiriInfoDictionary];
  }
  [(ADCompanionService *)self _updateAssistantIDMapForDevice:v9];
  int v11 = AFSupportsPlayThisOnThat();
  if ((a5 & 2) != 0 && v11)
  {
    uint64_t v12 = objc_msgSend(v9, "_ad_siriSharedDataProtobuf");
    uint64_t v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v33 = 136315394;
      __int16 v34 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
      __int16 v35 = 2112;
      id v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s siriInfo: %@", (uint8_t *)&v33, 0x16u);
    }
    unsigned int v14 = [v12 isRemotePlaybackDevice];
    playbackDeviceIDs = self->_playbackDeviceIDs;
    int v16 = [v9 identifier];
    unsigned int v17 = [(NSMutableDictionary *)playbackDeviceIDs objectForKey:v16];

    if (v14)
    {
      __int16 v18 = AFSiriLogContextDaemon;
      BOOL v19 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (v19)
        {
          int v33 = 136315394;
          __int16 v34 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
          __int16 v35 = 2112;
          id v36 = v9;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s playback device updated: %@", (uint8_t *)&v33, 0x16u);
        }
      }
      else
      {
        if (v19)
        {
          int v33 = 136315394;
          __int16 v34 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
          __int16 v35 = 2112;
          id v36 = v9;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s playback device added: %@", (uint8_t *)&v33, 0x16u);
        }
        uint64_t v23 = self->_playbackDeviceIDs;
        long long v24 = objc_opt_new();
        long long v25 = [v9 identifier];
        [(NSMutableDictionary *)v23 setObject:v24 forKey:v25];
      }
      [(ADCompanionService *)self _updateHashedRouteIDForDevice:v9];
    }
    else
    {
      if (!v17)
      {
LABEL_22:

        goto LABEL_23;
      }
      id v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v33 = 136315394;
        __int16 v34 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
        __int16 v35 = 2112;
        id v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s playback device removed: %@", (uint8_t *)&v33, 0x16u);
      }
      uint64_t v21 = self->_playbackDeviceIDs;
      uint64_t v22 = [v9 identifier];
      [(NSMutableDictionary *)v21 removeObjectForKey:v22];
    }
    long long v26 = +[NSNotificationCenter defaultCenter];
    [v26 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];

    goto LABEL_22;
  }
LABEL_23:
  int v27 = AFIsHorseman();
  if ((a5 & 2) != 0)
  {
    if (v27)
    {
      id v28 = [v9 idsDeviceIdentifier];
      long long v29 = [(ADRapportLink *)self->_clientLink localDevice];
      __int16 v30 = [v29 idsPersonalDeviceIdentifier];
      unsigned int v31 = [v28 isEqualToString:v30];

      if (v31)
      {
        __int16 v32 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v33 = 136315394;
          __int16 v34 = "-[ADCompanionService rapportLink:didUpdateDevice:changes:]";
          __int16 v35 = 2112;
          id v36 = v9;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s companion device updated: %@", (uint8_t *)&v33, 0x16u);
        }
        [(ADCompanionService *)self _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:1];
      }
    }
  }
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    unsigned int v10 = [v7 isPersonal];
    CFStringRef v11 = @"standard";
    *(void *)&v34[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
    *(_DWORD *)__int16 v34 = 136315650;
    *(_WORD *)&v34[12] = 2112;
    if (v10) {
      CFStringRef v11 = @"companion capable";
    }
    *(void *)&v34[14] = v11;
    __int16 v35 = 2112;
    id v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ device found: %@", v34, 0x20u);
  }
  if (self->_siriInfoDictNeedsInit) {
    [(ADCompanionService *)self _updateSiriInfoDictionary];
  }
  -[ADCompanionService _updateAssistantIDMapForDevice:](self, "_updateAssistantIDMapForDevice:", v7, *(_OWORD *)v34);
  if (AFIsHorseman())
  {
    uint64_t v12 = [v7 idsDeviceIdentifier];
    uint64_t v13 = [(ADRapportLink *)self->_clientLink localDevice];
    unsigned int v14 = [v13 idsPersonalDeviceIdentifier];
    unsigned int v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      int v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v34 = 136315394;
        *(void *)&v34[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
        *(_WORD *)&v34[12] = 2112;
        *(void *)&v34[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s companion device found: %@", v34, 0x16u);
      }
      [(ADCompanionService *)self _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:1];
    }
    if ([(ADCompanionService *)self _isDevicePartOfCurrentMediaSystem:v7])
    {
      unsigned int v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v34 = 136315394;
        *(void *)&v34[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
        *(_WORD *)&v34[12] = 2112;
        *(void *)&v34[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s media system device found: %@", v34, 0x16u);
      }
      __int16 v18 = [v7 idsDeviceIdentifier];
      [(ADCompanionService *)self setStereoPartnerIDSIdentifier:v18];
    }
  }
  BOOL v19 = +[NSNotificationCenter defaultCenter];
  if (AFSupportsPlayThisOnThat())
  {
    id v20 = objc_msgSend(v7, "_ad_siriSharedDataProtobuf");
    uint64_t v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v34 = 136315394;
      *(void *)&v34[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
      *(_WORD *)&v34[12] = 2112;
      *(void *)&v34[14] = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s siriInfo: %@", v34, 0x16u);
    }
    unsigned int v22 = [v20 isRemotePlaybackDevice];
    playbackDeviceIDs = self->_playbackDeviceIDs;
    long long v24 = [v7 identifier];
    long long v25 = [(NSMutableDictionary *)playbackDeviceIDs objectForKey:v24];
    long long v26 = v25;
    if (v22)
    {

      if (!v26)
      {
        int v27 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int16 v34 = 136315394;
          *(void *)&v34[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
          *(_WORD *)&v34[12] = 2112;
          *(void *)&v34[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s playback device found: %@", v34, 0x16u);
        }
        id v28 = self->_playbackDeviceIDs;
        long long v29 = objc_opt_new();
        __int16 v30 = [v7 identifier];
        [(NSMutableDictionary *)v28 setObject:v29 forKey:v30];

        [(ADCompanionService *)self _updateHashedRouteIDForDevice:v7];
LABEL_28:
        [v19 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
      }
    }
    else
    {

      if (v26)
      {
        unsigned int v31 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int16 v34 = 136315394;
          *(void *)&v34[4] = "-[ADCompanionService rapportLink:didFindDevice:]";
          *(_WORD *)&v34[12] = 2112;
          *(void *)&v34[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s playback device lost: %@", v34, 0x16u);
        }
        __int16 v32 = self->_playbackDeviceIDs;
        int v33 = [v7 identifier];
        [(NSMutableDictionary *)v32 removeObjectForKey:v33];

        goto LABEL_28;
      }
    }
  }
  [v19 postNotificationName:@"ADCompanionServiceActiveDevicesDidChangeNotification" object:0];
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[ADCompanionService rapportLink:didUpdateLocalDevice:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s companion service updated local device: %@", (uint8_t *)&v12, 0x16u);
  }
  if (AFIsHorseman())
  {
    [(ADCompanionService *)self _updateCompanionIdentifier];
    [(ADCompanionService *)self _updateMediaSystemState];
    if (AFSupportsAirPlayEndpointRoute())
    {
      id v9 = [(_ADPBDeviceSetDataRequest *)self->_cachedSharedData airplayRouteId];
      unsigned int v10 = [(ADRapportLink *)self->_clientLink localDevice];
      CFStringRef v11 = [v10 mediaRouteIdentifier];

      if (v9 != v11 && ([v9 isEqualToString:v11] & 1) == 0) {
        [(ADCompanionService *)self _updateSiriInfoDictionary];
      }
    }
  }
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v12 = "-[ADCompanionService rapportLinkDidInvalidate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100241404;
  v8[3] = &unk_10050E160;
  id v9 = v4;
  unsigned int v10 = self;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v12 = "-[ADCompanionService rapportLinkDidInterrupt:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002416F0;
  v8[3] = &unk_10050E160;
  id v9 = v4;
  unsigned int v10 = self;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (id)_newRequestDictionaryWithRequestInfo:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = [(ADCompanionService *)self _newRequestDictionary];
  id v6 = [v4 text];
  if (v6) {
    [v5 setObject:v6 forKey:@"text"];
  }
  id v7 = [v4 handoffRequestData];
  if (v7) {
    [v5 setObject:v7 forKey:@"handoffRequestData"];
  }
  id v8 = [v4 handoffOriginDeviceName];
  if (v8) {
    [v5 setObject:v8 forKey:@"handoffOriginDeviceName"];
  }
  id v9 = [v4 handoffURLString];
  if (v9) {
    [v5 setObject:v9 forKey:@"handoffURLString"];
  }
  unsigned int v10 = [v4 turnIdentifier];
  if (v10) {
    [v5 setObject:v10 forKey:@"handoffTurnIdentifier"];
  }
  CFStringRef v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 handoffRequiresUserInteraction]);
  [v5 setObject:v11 forKey:@"handoffRequiresUserInteraction"];

  int v12 = [v4 handoffNotification];
  if (v12) {
    [v5 setObject:v12 forKey:@"handoffNotification"];
  }
  uint64_t v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isSiriXRequest]);
  [v5 setObject:v13 forKey:@"isSiriXRequest"];

  __int16 v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isATVHandoff]);
  [v5 setObject:v14 forKey:@"isATVHandoff"];

  return v5;
}

- (id)_newRequestInfoWithRequestDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKey:@"text"];
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
      __int16 v45 = 2112;
      CFStringRef v46 = @"text";
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
    }
    id v13 = 0;
  }
  else
  {
    id v5 = [v3 objectForKey:@"handoffRequestData"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      long long v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
        __int16 v45 = 2112;
        CFStringRef v46 = @"handoffRequestData";
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
      }
      id v13 = 0;
    }
    else
    {
      id v6 = [v3 objectForKey:@"handoffOriginDeviceName"];
      if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v25 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
          __int16 v45 = 2112;
          CFStringRef v46 = @"handoffOriginDeviceName";
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
        }
        id v13 = 0;
      }
      else
      {
        id v7 = [v3 objectForKey:@"handoffURLString"];
        if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v26 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
            __int16 v45 = 2112;
            CFStringRef v46 = @"handoffURLString";
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
          }
          id v13 = 0;
        }
        else
        {
          id v8 = [v3 objectForKey:@"handoffTurnIdentifier"];
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            int v27 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
              __int16 v45 = 2112;
              CFStringRef v46 = @"handoffTurnIdentifier";
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
            }
            id v13 = 0;
          }
          else
          {
            id v9 = [v3 objectForKey:@"handoffRequiresUserInteraction"];
            if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              id v28 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                __int16 v45 = 2112;
                CFStringRef v46 = @"handoffRequiresUserInteraction";
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
              }
              id v13 = 0;
            }
            else
            {
              unsigned int v10 = [v3 objectForKey:@"handoffNotification"];
              if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
              {
                long long v29 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                  __int16 v45 = 2112;
                  CFStringRef v46 = @"handoffNotification";
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
                }
                id v13 = 0;
              }
              else
              {
                CFStringRef v11 = [v3 objectForKey:@"isSiriXRequest"];
                if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  uint64_t v38 = v11;
                  __int16 v30 = AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                    __int16 v45 = 2112;
                    CFStringRef v46 = @"isSiriXRequest";
                    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
                  }
                  id v13 = 0;
                  CFStringRef v11 = v38;
                }
                else
                {
                  v40 = v9;
                  int v12 = [v3 objectForKey:@"isATVHandoff"];
                  id v36 = v12;
                  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    id v39 = v11;
                    unsigned int v31 = AFSiriLogContextDaemon;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                      __int16 v45 = 2112;
                      CFStringRef v46 = @"isATVHandoff";
                      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s malformed remote request key: %@", buf, 0x16u);
                    }
                    id v13 = 0;
                    CFStringRef v11 = v39;
                  }
                  else
                  {
                    id v13 = objc_alloc_init((Class)AFRequestInfo);
                    [v13 setText:v4];
                    [v13 setHandoffOriginDeviceName:v6];
                    [v13 setHandoffURLString:v7];
                    [v13 setTurnIdentifier:v8];
                    objc_msgSend(v13, "setHandoffRequiresUserInteraction:", objc_msgSend(v40, "BOOLValue"));
                    [v13 setHandoffNotification:v10];
                    [v13 setActivationEvent:1];
                    objc_msgSend(v13, "setIsSiriXRequest:", objc_msgSend(v11, "BOOLValue"));
                    objc_msgSend(v13, "setIsATVHandoff:", objc_msgSend(v12, "BOOLValue"));
                    unsigned int v14 = [v11 BOOLValue];
                    if (!v5 || !v14) {
                      goto LABEL_49;
                    }
                    __int16 v37 = v11;
                    __int16 v35 = v10;
                    id v15 = AFSiriLogContextDaemon;
                    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315138;
                      v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Handoff request is SiriX, unpacking RunSiriKitExecutor command and wrapping in a StartLocalRequest", buf, 0xCu);
                    }
                    id v41 = 0;
                    id v16 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:&v41];
                    unsigned int v17 = (__CFString *)v41;
                    __int16 v34 = [v16 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
                    __int16 v18 = v17;
                    if (v17)
                    {
                      BOOL v19 = AFSiriLogContextDaemon;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        v44 = "-[ADCompanionService _newRequestInfoWithRequestDictionary:]";
                        __int16 v45 = 2112;
                        CFStringRef v46 = v18;
                        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Error unpacking RunSiriKitExecutor command from handoff data: %@", buf, 0x16u);
                      }
                    }

                    unsigned int v10 = v35;
                    CFStringRef v11 = v37;
                    if (v34)
                    {
                      id v20 = +[NSUUID UUID];
                      int v33 = [v20 UUIDString];

                      id v21 = objc_alloc_init((Class)SAStartLocalRequest);
                      [v21 setAceId:v33];
                      [v34 setRefId:v33];
                      id v42 = v34;
                      unsigned int v22 = +[NSArray arrayWithObjects:&v42 count:1];
                      [v21 setClientBoundCommands:v22];

                      unsigned int v10 = v35;
                      [v13 setStartLocalRequest:v21];

                      CFStringRef v11 = v37;
                    }
                    else
                    {
LABEL_49:
                      [v13 setHandoffRequestData:v5];
                    }
                  }
                  id v9 = v40;
                }
              }
            }
          }
        }
      }
    }
  }

  return v13;
}

- (void)_getFilteredDevicesFromList:(id)a3 withAccessToSameHomeAsDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = a4;
    CFStringRef v11 = +[ADHomeInfoManager sharedInfoManager];
    int v12 = [v10 homeKitIdentifier];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002424B8;
    v14[3] = &unk_100507FD8;
    id v18 = v9;
    id v15 = v8;
    id v16 = v11;
    unsigned int v17 = self;
    id v13 = v11;
    [v13 getHomeIdForAccessoryId:v12 completion:v14];
  }
}

- (id)_transformedRequestDictionaryToForward:(id)a3
{
  id v4 = [a3 mutableCopy];
  id v5 = [(ADCompanionService *)self _newRequestDictionary];
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

- (id)_newRequestDictionary
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = objc_opt_new();
  id v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];

  [v3 setObject:v5 forKey:@"messageID"];
  id v6 = +[ADDeviceCircleManager sharedInstance];
  id v7 = [v6 localPeerInfo];
  id v8 = [v7 idsDeviceUniqueIdentifier];

  id v9 = AFSiriLogContextDaemon;
  if (v8)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
      __int16 v31 = 2112;
      __int16 v32 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s localPeerUniqueIdentifier: %@", buf, 0x16u);
    }
    [v3 setObject:v8 forKey:@"idsDeviceId"];
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s unable to retrieve local IDS identifier", buf, 0xCu);
  }
  if (AFSupportsAirPlayEndpointRoute())
  {
    id v10 = [(ADRapportLink *)self->_clientLink localDevice];
    CFStringRef v11 = [v10 mediaRouteIdentifier];

    int v12 = AFSiriLogContextDaemon;
    if (v11)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
        __int16 v31 = 2112;
        __int16 v32 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s routeIdentifier: %@", buf, 0x16u);
      }
      id v28 = v11;
      id v13 = +[NSArray arrayWithObjects:&v28 count:1];
      [v3 setObject:v13 forKey:@"airPlayRouteIDs"];
    }
    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s unable to retrieve AirPlay route identifier", buf, 0xCu);
    }
  }
  unsigned int v14 = +[ADCommandCenter sharedCommandCenter];
  id v15 = [v14 getAssistantIdentifier];

  id v16 = AFSiriLogContextDaemon;
  if (v15)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
      __int16 v31 = 2112;
      __int16 v32 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s assistantId: %@", buf, 0x16u);
    }
    [v3 setObject:v15 forKey:@"assistantId"];
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s unable to retrieve assistantd identifier", buf, 0xCu);
  }
  unsigned int v17 = AFCurrentUserInterfaceIdiom();
  if (v17)
  {
    id v18 = AFCurrentUserInterfaceIdiom();
    [v3 setObject:v18 forKey:@"userInterfaceIdiom"];
  }
  else
  {
    BOOL v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s unable to retrieve user interface idiom", buf, 0xCu);
    }
  }
  id v20 = SAAceVersionCurrent;
  if (v20)
  {
    [v3 setObject:v20 forKey:@"aceVersion"];
  }
  else
  {
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[ADCompanionService _newRequestDictionary]";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s unable to retrieve ACE version", buf, 0xCu);
    }
  }
  unsigned int v22 = [(ADRapportLink *)self->_clientLink localDevice];
  uint64_t v23 = [v22 mediaSystemIdentifier];
  long long v24 = [v23 UUIDString];

  if (v24) {
    [v3 setObject:v24 forKey:@"mediaSystemId"];
  }
  long long v25 = [v22 homeKitIdentifier];
  long long v26 = [v25 UUIDString];

  if (v26) {
    [v3 setObject:v26 forKey:@"homeKitId"];
  }

  return v3;
}

- (id)_companionDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(ADRapportLink *)self->_clientLink localDevice];
  id v4 = [v3 idsPersonalDeviceIdentifier];
  id v5 = [(ADCompanionService *)self _companionLinkDeviceForUniqueIDSIdentifier:v4];

  return v5;
}

- (id)_companionLinkDeviceForHkIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 length])
  {
    id v5 = [ADPeerInfo alloc];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100242FF8;
    v10[3] = &unk_10050DB08;
    id v11 = v4;
    id v6 = +[AFPeerInfo newWithBuilder:v10];
    id v7 = [(ADPeerInfo *)v5 initWithAFPeerInfo:v6];
    id v8 = [(ADCompanionService *)self _companionLinkDeviceForPeer:v7 allowsDeviceCircleLookup:1 logDiscoveryContextFor:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3 allowsAWDLFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 length])
  {
    id v7 = [ADPeerInfo alloc];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100243134;
    v12[3] = &unk_10050DB08;
    id v13 = v6;
    id v8 = +[AFPeerInfo newWithBuilder:v12];
    id v9 = [(ADPeerInfo *)v7 initWithAFPeerInfo:v8];
    id v10 = [(ADCompanionService *)self _companionLinkDeviceForPeer:v9 allowsDeviceCircleLookup:1 allowsAWDLFallback:v4 error:0 logDiscoveryContextFor:0];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_companionLinkDeviceForUniqueIDSIdentifier:(id)a3
{
  return [(ADCompanionService *)self _companionLinkDeviceForUniqueIDSIdentifier:a3 allowsAWDLFallback:0];
}

- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 allowsAWDLFallback:(BOOL)a5 error:(id *)a6 logDiscoveryContextFor:(id)a7
{
  BOOL v126 = a5;
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a6) {
    *a6 = 0;
  }
  id v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v113 = [(ADRapportLink *)self->_clientLink localDevice];
    *(_DWORD *)buf = 136315394;
    v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    __int16 v153 = 2112;
    id v154 = v113;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s local device: %@", buf, 0x16u);
  }
  id v14 = objc_alloc_init((Class)HALSchemaHALCompanionDeviceDiscoveryEnded);
  objc_msgSend(v14, "setHasOtheriOSActiveDevices:", -[ADCompanionService doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:](self, "doesCompanionLinkHaveOtheriOSActiveDevicesApartFrom:", v11));
  unsigned int v15 = [(ADCompanionService *)self _shouldLogDiscoveryContextForRequestId:v12];
  unsigned int v16 = v15;
  if (!v11)
  {
    [v14 setDiscoveryType:0];
    [v14 setHasNullPeerIdentityServicesId:1];
    if (v16) {
      [(ADCompanionService *)self _logCompanionDeviceDiscoveryContextFor:v14 executionId:v12];
    }
    id v34 = 0;
    goto LABEL_157;
  }
  BOOL v121 = v9;
  v120 = a6;
  unsigned int v123 = v15;
  id v124 = v12;
  unsigned int v17 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v17 count];
    *(_DWORD *)buf = 136315394;
    v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    __int16 v153 = 2048;
    id v154 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Found %lu active devices", buf, 0x16u);
  }

  id v20 = [v11 idsDeviceUniqueIdentifier];
  objc_msgSend(v14, "setHasNullPeerIdentityServicesId:", objc_msgSend(v20, "length") == 0);

  uint64_t v21 = [v11 idsDeviceUniqueIdentifier];
  if (v21
    && (unsigned int v22 = (void *)v21,
        [v11 idsDeviceUniqueIdentifier],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        id v24 = [v23 length],
        v23,
        v22,
        v24))
  {
    long long v25 = [v11 idsDeviceUniqueIdentifier];
  }
  else
  {
    uint64_t v26 = [v11 idsIdentifier];
    if (v26
      && (int v27 = (void *)v26,
          [v11 idsIdentifier],
          id v28 = objc_claimAutoreleasedReturnValue(),
          id v29 = [v28 length],
          v28,
          v27,
          v29))
    {
      __int16 v30 = [v11 idsIdentifier];
      unsigned int v31 = [v30 hasPrefix:@"device:"];

      __int16 v32 = [v11 idsIdentifier];
      long long v25 = v32;
      if (v31)
      {
        uint64_t v33 = [v32 _stripFZIDPrefix];

        long long v25 = (void *)v33;
      }
    }
    else
    {
      long long v25 = 0;
    }
  }
  v129 = v14;
  __int16 v35 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    id v36 = [v11 homeKitAccessoryIdentifier];
    id v37 = [v11 rapportEffectiveIdentifier];
    *(_DWORD *)buf = 136315906;
    v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    __int16 v153 = 2112;
    id v154 = v25;
    __int16 v155 = 2112;
    id v156 = v36;
    __int16 v157 = 2112;
    id v158 = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s Looking for device with ids id: %@, homekitID : %@, rapportEffectiveID: %@", buf, 0x2Au);
  }
  uint64_t v38 = self;
  v125 = v17;
  if (![v25 length])
  {
    unint64_t v127 = 0;
    id v128 = 0;
    goto LABEL_54;
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v39 = v17;
  id v40 = [v39 countByEnumeratingWithState:&v143 objects:v150 count:16];
  if (!v40)
  {
    unint64_t v127 = 0;
    id v128 = 0;
    goto LABEL_53;
  }
  id v41 = v40;
  unint64_t v127 = 0;
  id v128 = 0;
  uint64_t v42 = *(void *)v144;
  do
  {
    for (i = 0; i != v41; i = (char *)i + 1)
    {
      if (*(void *)v144 != v42) {
        objc_enumerationMutation(v39);
      }
      v44 = *(void **)(*((void *)&v143 + 1) + 8 * i);
      __int16 v45 = [v44 idsDeviceIdentifier];
      unsigned int v46 = [v45 isEqualToString:v25];

      if (v46)
      {
        v47 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logD"
                 "iscoveryContextFor:]";
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s Found the matching device using ids id.", buf, 0xCu);
        }

        objc_msgSend(v129, "setDiscoveryType:", objc_msgSend(v44, "getHALDiscoveryType"));
        v48 = [(ADRapportLink *)v38->_clientLink localDevice];
        unsigned int v49 = [v44 hasValidDiscoveryTypeForLocalDevice:v48];

        if (!v49)
        {
          long long v52 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:lo"
                   "gDiscoveryContextFor:]";
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s Discovery type is invalid.", buf, 0xCu);
          }

          if ([v44 isDiscoveredOverWifiP2P])
          {
            long long v53 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:"
                     "logDiscoveryContextFor:]";
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s Found device over wifiP2P", buf, 0xCu);
            }

            uint64_t v54 = 1019;
          }
          else
          {
            if (![v44 isDiscoveredOverBLE]) {
              continue;
            }
            long long v55 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:"
                     "logDiscoveryContextFor:]";
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s Found device over BLE", buf, 0xCu);
            }

            uint64_t v54 = 1020;
          }
          uint64_t v56 = +[AFError errorWithCode:v54];
          v51 = v128;
          id v128 = (id)v56;
          goto LABEL_45;
        }
        if (![v44 isDiscoveredOverWifiP2P])
        {
          uint64_t v57 = v44;

          if (!v57)
          {
            self = v38;
            unsigned int v17 = v125;
            goto LABEL_55;
          }
          BOOL v58 = 1;
LABEL_131:
          id v12 = v124;
          unsigned int v17 = v125;
          self = v38;
          id v14 = v129;
          goto LABEL_145;
        }
        if (v126)
        {
          id v50 = v44;
          v51 = (void *)v127;
          unint64_t v127 = (unint64_t)v50;
LABEL_45:

          continue;
        }
      }
    }
    id v41 = [v39 countByEnumeratingWithState:&v143 objects:v150 count:16];
  }
  while (v41);
LABEL_53:

  self = v38;
  unsigned int v17 = v125;
LABEL_54:

LABEL_55:
  v59 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Searching using Rapport Identifier", buf, 0xCu);
  }

  v60 = [v11 rapportEffectiveIdentifier];
  id v122 = v11;
  if (![v60 length])
  {
LABEL_81:

    goto LABEL_82;
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v61 = v17;
  id v62 = [v61 countByEnumeratingWithState:&v139 objects:v149 count:16];
  if (!v62) {
    goto LABEL_80;
  }
  id v63 = v62;
  uint64_t v64 = *(void *)v140;
  while (2)
  {
    uint64_t v65 = 0;
LABEL_61:
    if (*(void *)v140 != v64) {
      objc_enumerationMutation(v61);
    }
    v66 = *(void **)(*((void *)&v139 + 1) + 8 * v65);
    v67 = [v66 effectiveIdentifier];
    unsigned int v68 = [v67 isEqualToString:v60];

    if (!v68) {
      goto LABEL_78;
    }
    objc_msgSend(v129, "setDiscoveryType:", objc_msgSend(v66, "getHALDiscoveryType"));
    v69 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%s Found the matching device using rapportEffectiveIdentifier", buf, 0xCu);
    }

    v70 = [(ADRapportLink *)v38->_clientLink localDevice];
    unsigned int v71 = [v66 hasValidDiscoveryTypeForLocalDevice:v70];

    if (!v71)
    {
      v74 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDis"
               "coveryContextFor:]";
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s Discovery type is invalid.", buf, 0xCu);
      }

      if ([v66 isDiscoveredOverWifiP2P])
      {
        uint64_t v75 = 1019;
      }
      else
      {
        if (![v66 isDiscoveredOverBLE]) {
          goto LABEL_78;
        }
        uint64_t v75 = 1020;
      }
      uint64_t v76 = +[AFError errorWithCode:v75];
      v73 = v128;
      id v128 = (id)v76;
LABEL_77:

LABEL_78:
      if (v63 == (id)++v65)
      {
        id v63 = [v61 countByEnumeratingWithState:&v139 objects:v149 count:16];
        if (!v63)
        {
LABEL_80:

          id v11 = v122;
          self = v38;
          unsigned int v17 = v125;
          goto LABEL_81;
        }
        continue;
      }
      goto LABEL_61;
    }
    break;
  }
  if ([v66 isDiscoveredOverWifiP2P])
  {
    if (v126)
    {
      id v72 = v66;
      v73 = (void *)v127;
      unint64_t v127 = (unint64_t)v72;
      goto LABEL_77;
    }
    goto LABEL_78;
  }
  uint64_t v57 = v66;

  if (v57)
  {
LABEL_130:
    BOOL v58 = 1;
    id v11 = v122;
    goto LABEL_131;
  }
  id v11 = v122;
  self = v38;
  unsigned int v17 = v125;
LABEL_82:
  v77 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s Searching using HomeKit Identifier", buf, 0xCu);
  }

  v78 = [v11 homeKitAccessoryIdentifier];
  if (![v78 length])
  {
LABEL_108:

    goto LABEL_109;
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v79 = v17;
  id v80 = [v79 countByEnumeratingWithState:&v135 objects:v148 count:16];
  if (!v80)
  {
LABEL_107:

    id v11 = v122;
    self = v38;
    unsigned int v17 = v125;
    goto LABEL_108;
  }
  id v81 = v80;
  uint64_t v82 = *(void *)v136;
LABEL_87:
  uint64_t v83 = 0;
  while (1)
  {
    if (*(void *)v136 != v82) {
      objc_enumerationMutation(v79);
    }
    v84 = *(void **)(*((void *)&v135 + 1) + 8 * v83);
    v85 = [v84 homeKitIdentifier];
    v86 = [v85 UUIDString];
    unsigned int v87 = [v86 isEqualToString:v78];

    if (!v87) {
      goto LABEL_105;
    }
    objc_msgSend(v129, "setDiscoveryType:", objc_msgSend(v84, "getHALDiscoveryType"));
    v88 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "%s Found the matching device using homeKitAccessoryIdentifier", buf, 0xCu);
    }

    v89 = [(ADRapportLink *)v38->_clientLink localDevice];
    unsigned int v90 = [v84 hasValidDiscoveryTypeForLocalDevice:v89];

    if (v90) {
      break;
    }
    v93 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "%s Discovery type is invalid.", buf, 0xCu);
    }

    if ([v84 isDiscoveredOverWifiP2P])
    {
      uint64_t v94 = 1019;
      goto LABEL_103;
    }
    if ([v84 isDiscoveredOverBLE])
    {
      uint64_t v94 = 1020;
LABEL_103:
      uint64_t v95 = +[AFError errorWithCode:v94];
      v92 = v128;
      id v128 = (id)v95;
LABEL_104:
    }
LABEL_105:
    if (v81 == (id)++v83)
    {
      id v81 = [v79 countByEnumeratingWithState:&v135 objects:v148 count:16];
      if (v81) {
        goto LABEL_87;
      }
      goto LABEL_107;
    }
  }
  if ([v84 isDiscoveredOverWifiP2P])
  {
    if (v126)
    {
      id v91 = v84;
      v92 = (void *)v127;
      unint64_t v127 = (unint64_t)v91;
      goto LABEL_104;
    }
    goto LABEL_105;
  }
  uint64_t v57 = v84;

  if (v57) {
    goto LABEL_130;
  }
  id v11 = v122;
  self = v38;
  unsigned int v17 = v125;
LABEL_109:
  v96 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDiscoveryContextFor:]";
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "%s Searching using uniqueIdentifierForPeer", buf, 0xCu);
  }

  v97 = +[ADPeerCloudService sharedInstance];
  v98 = [v97 uniqueIdentifierForPeer:v11];

  if ([v98 length])
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v99 = v17;
    uint64_t v57 = (uint64_t)[v99 countByEnumeratingWithState:&v131 objects:v147 count:16];
    if (v57)
    {
      uint64_t v100 = *(void *)v132;
      while (2)
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v132 != v100) {
            objc_enumerationMutation(v99);
          }
          v102 = *(void **)(*((void *)&v131 + 1) + 8 * j);
          v103 = [v102 idsDeviceIdentifier];
          unsigned int v104 = [v103 isEqualToString:v98];

          if (v104)
          {
            objc_msgSend(v129, "setDiscoveryType:", objc_msgSend(v102, "getHALDiscoveryType"));
            v105 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:"
                     "logDiscoveryContextFor:]";
              _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "%s Found the matching device using uniqueIdentifier", buf, 0xCu);
            }

            v106 = [(ADRapportLink *)v38->_clientLink localDevice];
            unsigned int v107 = [v102 hasValidDiscoveryTypeForLocalDevice:v106];

            if (v107)
            {
              if (![v102 isDiscoveredOverWifiP2P])
              {
                uint64_t v57 = v102;
                goto LABEL_134;
              }
              if (v126)
              {
                id v108 = v102;

                unint64_t v127 = (unint64_t)v108;
              }
            }
          }
        }
        uint64_t v57 = (uint64_t)[v99 countByEnumeratingWithState:&v131 objects:v147 count:16];
        if (v57) {
          continue;
        }
        break;
      }
LABEL_134:
      id v11 = v122;
      self = v38;
      unsigned int v17 = v125;
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
  id v14 = v129;

  id v12 = v124;
  if (!v57 && v121)
  {
    buf[0] = 0;
    v109 = [v11 afPeerInfo];
    v110 = sub_10016A938(v109, buf);

    if (buf[0])
    {
      v111 = [[ADPeerInfo alloc] initWithAFPeerInfo:v110];
      id v130 = v128;
      uint64_t v57 = [(ADCompanionService *)self _companionLinkDeviceForPeer:v111 allowsDeviceCircleLookup:0 allowsAWDLFallback:v126 error:&v130 logDiscoveryContextFor:0];
      id v112 = v130;

      id v12 = v124;
      id v128 = v112;
    }
    else
    {
      uint64_t v57 = 0;
    }
  }
  BOOL v58 = v57 != 0;
  if (v57 | v127)
  {
    if (v57)
    {
LABEL_145:
      id v114 = [(id)v57 isMeDevice];
    }
    else
    {
      id v114 = [(id)v127 isMeDevice];
      BOOL v58 = 0;
    }
    [v14 setIsMeDevice:v114];
  }
  else
  {
    v118 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      __int16 v153 = 2112;
      id v154 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "%s unable to find device with peer: %@", buf, 0x16u);
    }

    v119 = v128;
    if (!v128)
    {
      v119 = +[AFError errorWithCode:1011];
    }
    if (v120)
    {
      BOOL v58 = 0;
      uint64_t v57 = 0;
      unint64_t v127 = 0;
      id v128 = v119;
      id *v120 = v128;
    }
    else
    {
      unint64_t v127 = 0;
      id v128 = v119;
      BOOL v58 = 0;
      uint64_t v57 = 0;
    }
  }
  if (v123) {
    [(ADCompanionService *)self _logCompanionDeviceDiscoveryContextFor:v14 executionId:v12];
  }
  if (v58)
  {
    v115 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v152 = "-[ADCompanionService _companionLinkDeviceForPeer:allowsDeviceCircleLookup:allowsAWDLFallback:error:logDisco"
             "veryContextFor:]";
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "%s Device found over iWifi will be favored.", buf, 0xCu);
    }
  }
  if (v57) {
    v116 = (void *)v57;
  }
  else {
    v116 = (void *)v127;
  }
  id v34 = v116;

LABEL_157:
  return v34;
}

- (id)discoveryTypeForPeer:(id)a3
{
  v44 = (ADPeerInfo *)a3;
  if (!v44)
  {
    v44 = 0;
    goto LABEL_5;
  }
  BOOL v4 = [(ADPeerInfo *)v44 idsDeviceUniqueIdentifier];
  if (![v4 length])
  {
    id v6 = [(ADPeerInfo *)v44 assistantIdentifier];
    id v7 = [v6 length];

    if (v7) {
      goto LABEL_7;
    }
LABEL_5:
    id v5 = 0;
    goto LABEL_35;
  }

LABEL_7:
  char v49 = 0;
  id v8 = [(ADPeerInfo *)v44 afPeerInfo];
  uint64_t v9 = sub_10016A938(v8, &v49);

  id v36 = (void *)v9;
  if (v49)
  {
    id v10 = [[ADPeerInfo alloc] initWithAFPeerInfo:v9];

    id v11 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[ADCompanionService discoveryTypeForPeer:]";
      __int16 v52 = 2112;
      long long v53 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Improved peer info from Device Circle Manager: %@", buf, 0x16u);
    }
    v44 = v10;
  }
  id v12 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = v13;
    id v34 = (ADPeerInfo *)[v12 count];
    *(_DWORD *)buf = 136315394;
    v51 = "-[ADCompanionService discoveryTypeForPeer:]";
    __int16 v52 = 2048;
    long long v53 = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s Found %lu active devices", buf, 0x16u);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v12;
  id v14 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (!v14)
  {
    id v5 = 0;
    goto LABEL_34;
  }
  id v16 = v14;
  id v5 = 0;
  uint64_t v17 = *(void *)v46;
  *(void *)&long long v15 = 136315650;
  long long v35 = v15;
  uint64_t v41 = *(void *)v46;
  do
  {
    id v18 = 0;
    id v19 = v5;
    id v42 = v16;
    do
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v18);
      uint64_t v21 = objc_msgSend(v20, "idsDeviceIdentifier", v35);
      unsigned int v22 = [(ADPeerInfo *)v44 idsDeviceUniqueIdentifier];
      if ([v21 isEqualToString:v22]) {
        goto LABEL_23;
      }
      uint64_t v23 = objc_msgSend(v20, "_ad_siriSharedDataProtobuf");
      id v24 = [v23 assistantId];
      long long v25 = [(ADPeerInfo *)v44 assistantIdentifier];
      if ([v24 isEqualToString:v25]) {
        goto LABEL_22;
      }
      uint64_t v26 = [v20 effectiveIdentifier];
      int v27 = [(ADPeerInfo *)v44 rapportEffectiveIdentifier];
      id v40 = v26;
      if ([v26 isEqualToString:v27])
      {

LABEL_22:
        uint64_t v17 = v41;
        id v16 = v42;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v38 = [v20 homeKitIdentifier];
      [v38 UUIDString];
      id v29 = v37 = v27;
      __int16 v30 = [(ADPeerInfo *)v44 homeKitAccessoryIdentifier];
      unsigned __int8 v39 = [v29 isEqualToString:v30];

      uint64_t v17 = v41;
      id v16 = v42;
      if ((v39 & 1) == 0)
      {
        id v5 = v19;
        goto LABEL_27;
      }
LABEL_24:
      id v5 = [v20 getAceDiscoveryType];

      id v28 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v35;
        v51 = "-[ADCompanionService discoveryTypeForPeer:]";
        __int16 v52 = 2112;
        long long v53 = v5;
        __int16 v54 = 2112;
        long long v55 = v44;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s Found discovery type %@ for device with peerInfo: %@", buf, 0x20u);
      }
      if ([v20 isDiscoveredOverInfraWifi]) {
        goto LABEL_34;
      }
LABEL_27:
      id v18 = (char *)v18 + 1;
      id v19 = v5;
    }
    while (v16 != v18);
    id v31 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    id v16 = v31;
  }
  while (v31);
LABEL_34:

LABEL_35:
  return v5;
}

- (id)_companionLinkDeviceForPeer:(id)a3 allowsDeviceCircleLookup:(BOOL)a4 logDiscoveryContextFor:(id)a5
{
  return [(ADCompanionService *)self _companionLinkDeviceForPeer:a3 allowsDeviceCircleLookup:a4 allowsAWDLFallback:0 error:0 logDiscoveryContextFor:a5];
}

- (void)_checkCompanionIdentifierStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(ADRapportLink *)self->_clientLink localDevice];
  BOOL v4 = v3;
  if (v3 && ![v3 personalDeviceState])
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[ADCompanionService _checkCompanionIdentifierStatus]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s posting notification to request companion update", (uint8_t *)&v7, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.personal.requests.companion.update", 0, 0, 1u);
  }
}

- (void)_sendHeartbeatMessage:(id)a3 targetDeviceIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 objectForKey:@"messageID"];
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v45 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
    __int16 v46 = 2112;
    double v47 = *(double *)&v13;
    __int16 v48 = 2112;
    id v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v15 = +[ADFMDMonitor sharedManager];
  unsigned int v16 = [v15 isLostModeActive];

  if (!v16)
  {
    uint64_t v19 = 0;
    if (v11 && self->_clientAWDLTransportLink)
    {
      if (-[NSString isEqualToString:](self->_clientAWDLTransportLinkDestinationId, "isEqualToString:", v11, 0))
      {
        [(ADCompanionService *)self _scheduleOrExtendAWDLClientLinkTimer];
        uint64_t v19 = 1;
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    uint64_t v20 = [(ADCompanionService *)self _companionLinkDeviceForUniqueIDSIdentifier:v11 allowsAWDLFallback:v19];
    id v18 = (void *)v20;
    if (self->_isListening)
    {
      if (v20)
      {
        if (a5 > 0.0)
        {
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100244EC8;
          v40[3] = &unk_10050D0D0;
          id v21 = v12;
          id v41 = v21;
          unsigned __int8 v34 = [(ADCompanionService *)self _startTimerForMessage:v13 targetDevice:v18 timeout:0 heartbeat:v40 completion:a5];
          unsigned int v22 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            long long v45 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
            __int16 v46 = 2112;
            double v47 = *(double *)&v13;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
          }
          clientLink = self->_clientLink;
          id v24 = [v18 identifier];
          uint64_t v42 = RPOptionStatusFlags;
          v43 = &off_1005239F0;
          long long v25 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100244F44;
          v35[3] = &unk_100507E98;
          unsigned __int8 v39 = v34;
          id v36 = v13;
          id v37 = self;
          id v38 = v21;
          [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.request.heartbeat" request:v10 destinationID:v24 options:v25 responseHandler:v35];

          uint64_t v26 = v41;
          goto LABEL_34;
        }
        uint64_t v33 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          long long v45 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
          __int16 v46 = 2048;
          double v47 = a5;
          __int16 v48 = 2112;
          id v49 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s invalid timeout (%f) for message: %@", buf, 0x20u);
          if (!v12) {
            goto LABEL_35;
          }
        }
        else if (!v12)
        {
          goto LABEL_35;
        }
        uint64_t v28 = 50;
      }
      else
      {
        id v29 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          long long v45 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s unable to find remote device for execution", buf, 0xCu);
        }
        if (AFIsInternalInstall())
        {
          __int16 v30 = AFSiriLogContextPerformance;
          os_signpost_id_t v31 = os_signpost_id_generate(AFSiriLogContextPerformance);
          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v32 = v31;
            if (os_signpost_enabled(v30))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_EVENT, v32, "CompanionDeviceNotFound", "ADCompanionService _sendHeartbeatMessage", buf, 2u);
            }
          }
        }
        if (!v12)
        {
          id v18 = 0;
          goto LABEL_35;
        }
        uint64_t v28 = 1000;
      }
    }
    else
    {
      int v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        long long v45 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s companion service is disabled", buf, 0xCu);
        if (!v12) {
          goto LABEL_35;
        }
      }
      else if (!v12)
      {
        goto LABEL_35;
      }
      uint64_t v28 = 1009;
    }
    uint64_t v26 = +[AFError errorWithCode:v28];
    (*((void (**)(id, void *))v12 + 2))(v12, v26);
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    long long v45 = "-[ADCompanionService _sendHeartbeatMessage:targetDeviceIdentifier:timeout:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Lost mode is active, not sending any outbound requests", buf, 0xCu);
    if (!v12) {
      goto LABEL_36;
    }
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    id v18 = +[AFError errorWithCode:1003];
    (*((void (**)(id, void *))v12 + 2))(v12, v18);
LABEL_35:
  }
LABEL_36:
}

- (BOOL)_cancelTimerForMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_timerInfo objectForKey:v4];
    id v6 = [v5 heartbeatTimer];
    [v6 cancelIfNotAlreadyCanceled];

    int v7 = [v5 requestTimer];
    unsigned __int8 v8 = [v7 cancelIfNotAlreadyCanceled];
    [(NSMutableDictionary *)self->_timerInfo removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_timerInfo count])
    {
      timerInfo = self->_timerInfo;
      self->_timerInfo = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 timeout:(double)a5 heartbeat:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  long long v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v49 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
    __int16 v50 = 2112;
    double v51 = *(double *)&v12;
    __int16 v52 = 2112;
    id v53 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v12)
  {
    id v21 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v49 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
      id v18 = "%s message ID is null";
      uint64_t v19 = v21;
      uint32_t v20 = 12;
      goto LABEL_17;
    }
LABEL_18:
    BOOL v23 = 0;
    goto LABEL_19;
  }
  unsigned int v16 = [(NSMutableDictionary *)self->_timerInfo objectForKey:v12];

  if (v16)
  {
    uint64_t v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v49 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
      __int16 v50 = 2112;
      double v51 = *(double *)&v12;
      id v18 = "%s already tracking timer for message: %@";
      uint64_t v19 = v17;
      uint32_t v20 = 22;
LABEL_17:
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (a5 <= 0.0)
  {
    id v29 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v49 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
      __int16 v50 = 2048;
      double v51 = a5;
      __int16 v52 = 2112;
      id v53 = v12;
      id v18 = "%s invalid timeout (%f) for message: %@";
      uint64_t v19 = v29;
      uint32_t v20 = 32;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v38 = [v13 idsDeviceIdentifier];
  id v22 = [v38 length];
  BOOL v23 = v22 != 0;
  if (v22)
  {
    if (!self->_timerInfo)
    {
      id v24 = (NSMutableDictionary *)objc_opt_new();
      timerInfo = self->_timerInfo;
      self->_timerInfo = v24;
    }
    uint64_t v26 = objc_opt_new();
    objc_initWeak((id *)buf, self);
    if (v8)
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100245734;
      v43[3] = &unk_100507F38;
      id v44 = v12;
      objc_copyWeak(v47, (id *)buf);
      v47[1] = *(id *)&a5;
      *(double *)&void v47[2] = a5 * 0.5;
      long long v45 = self;
      id v46 = v38;
      int v27 = objc_retainBlock(v43);
      id v28 = [objc_alloc((Class)AFWatchdogTimer) initWithTimeoutInterval:self->_serialQueue onQueue:v27 timeoutHandler:a5 * 0.5];
      [v26 setHeartbeatTimer:v28];
      id v37 = v28;

      objc_destroyWeak(v47);
    }
    else
    {
      id v37 = 0;
    }
    id v32 = objc_alloc((Class)AFWatchdogTimer);
    serialQueue = self->_serialQueue;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1002459B4;
    v39[3] = &unk_100507F60;
    id v34 = v12;
    id v40 = v34;
    objc_copyWeak(&v42, (id *)buf);
    id v41 = v14;
    id v35 = [v32 initWithTimeoutInterval:serialQueue onQueue:v39 timeoutHandler:a5];
    [v26 setRequestTimer:v35];
    [(NSMutableDictionary *)self->_timerInfo setObject:v26 forKey:v34];
    id v36 = +[NSProcessInfo processInfo];
    [v36 systemUptime];
    objc_msgSend(v26, "setStartTime:");

    [v35 start];
    [v37 start];

    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    os_signpost_id_t v31 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v49 = "-[ADCompanionService _startTimerForMessage:targetDevice:timeout:heartbeat:completion:]";
      __int16 v50 = 2112;
      double v51 = *(double *)&v13;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s target device lacks IDS identifier: %@", buf, 0x16u);
    }
  }

LABEL_19:
  return v23;
}

- (BOOL)_startTimerForMessage:(id)a3 targetDevice:(id)a4 heartbeat:(BOOL)a5 completion:(id)a6
{
  return [(ADCompanionService *)self _startTimerForMessage:a3 targetDevice:a4 timeout:a5 heartbeat:a6 completion:10.0];
}

- (void)getSharedCompanionInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCompanionService getSharedCompanionInfoWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100245EA8;
  v8[3] = &unk_10050E188;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)getPlaybackDeviceListWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCompanionService getPlaybackDeviceListWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100246068;
  v8[3] = &unk_10050E188;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(serialQueue, v8);
}

- (void)_updateHashedRouteIDForDevice:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v20 = "-[ADCompanionService _updateHashedRouteIDForDevice:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  playbackDeviceIDs = self->_playbackDeviceIDs;
  id v7 = [v4 identifier];
  BOOL v8 = [(NSMutableDictionary *)playbackDeviceIDs objectForKey:v7];

  if (v8)
  {
    id v9 = objc_msgSend(v4, "_ad_siriSharedDataProtobuf");
    id v10 = v9;
    if (!v9)
    {
LABEL_12:

      goto LABEL_13;
    }
    id v11 = [v9 airplayRouteId];
    if (v11)
    {
      id v12 = [v8 objectForKey:v11];

      if (!v12)
      {
        id v13 = [v11 dataUsingEncoding:4];
        id v14 = +[ADSecurityService sharedService];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1002464FC;
        v15[3] = &unk_100507EE8;
        id v16 = v4;
        uint64_t v17 = self;
        id v18 = v11;
        [v14 processData:v13 usingProcedure:1 completion:v15];

LABEL_10:
      }
    }
    else if ([v8 count])
    {
      [v8 removeAllObjects];
      id v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
      goto LABEL_10;
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_resetHashedRouteIDs
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v21 = "-[ADCompanionService _resetHashedRouteIDs]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        playbackDeviceIDs = self->_playbackDeviceIDs;
        id v11 = [v9 identifier];
        id v12 = [(NSMutableDictionary *)playbackDeviceIDs objectForKey:v11];

        if (v12)
        {
          id v13 = [(ADRapportLink *)self->_clientLink localDevice];
          unsigned int v14 = [v9 hasValidDiscoveryTypeForLocalDevice:v13];

          if (v14)
          {
            [v12 removeAllObjects];
            [(ADCompanionService *)self _updateHashedRouteIDForDevice:v9];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (id)_remotePlaybackDeviceForDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = objc_msgSend(v4, "_ad_siriSharedDataProtobuf");
  if (v5)
  {
    id v6 = objc_alloc_init((Class)SARemotePlaybackDevice);
    uint64_t v7 = [v5 assistantId];
    [v6 setAssistantId:v7];

    BOOL v8 = [v5 userAssignedName];
    [v6 setDeviceName:v8];

    id v9 = [v5 languageCode];
    [v6 setLanguage:v9];

    objc_msgSend(v6, "setSiriEnabled:", objc_msgSend(v5, "siriEnabled"));
    id v10 = [v5 userAgent];
    [v6 setUserAgent:v10];

    id v11 = [v5 storeFrontId];
    [v6 setStorefront:v11];

    id v12 = [v5 userToken];
    [v6 setUserToken:v12];

    id v13 = [v5 utsRequiredRequestData];
    unsigned int v14 = objc_msgSend(v13, "_ad_dictionaryRepresentation");
    [v6 setUtsRequiredRequestKeyValuePairs:v14];

    playbackDeviceIDs = self->_playbackDeviceIDs;
    long long v16 = [v4 identifier];
    long long v17 = [(NSMutableDictionary *)playbackDeviceIDs objectForKey:v16];

    long long v18 = [v5 airplayRouteId];
    uint64_t v19 = [v17 objectForKey:v18];
    [v6 setHashedRouteId:v19];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_updateStoreFrontIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCompanionService _updateStoreFrontIdentifierWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = +[ADAssistantDataManager sharedDataManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100246D98;
  v8[3] = &unk_10050D818;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getiTunesStoreFrontIdentifierWithCompletion:v8];
}

- (void)_updateSharedDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[ADCompanionService _updateSharedDataWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = +[ADCommandCenter sharedCommandCenter];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100247170;
  v8[3] = &unk_100507EC0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 getSharedDataForPeer:v8];
}

- (void)_getSharedDataFromCompanionLinkDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v9 = +[ADFMDMonitor sharedManager];
  unsigned int v10 = [v9 isLostModeActive];

  if (v10)
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Lost mode is active, not sending any outbound requests", buf, 0xCu);
    }
    uint64_t v12 = 1003;
  }
  else
  {
    unsigned int v14 = [v6 idsDeviceIdentifier];
    id v15 = [v14 length];

    if (v15)
    {
      id v13 = [(ADCompanionService *)self _newRequestDictionary];
      long long v16 = [v13 objectForKey:@"messageID"];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1002476C4;
      v30[3] = &unk_10050D0D0;
      id v17 = v7;
      id v31 = v17;
      unsigned __int8 v18 = [(ADCompanionService *)self _startTimerForMessage:v16 targetDevice:v6 heartbeat:1 completion:v30];
      uint64_t v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
        __int16 v36 = 2112;
        id v37 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
      }
      clientLink = self->_clientLink;
      __int16 v21 = [v6 identifier];
      uint64_t v32 = RPOptionStatusFlags;
      uint64_t v33 = &off_1005239F0;
      id v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1002477A8;
      v25[3] = &unk_100507E98;
      unsigned __int8 v29 = v18;
      id v26 = v16;
      int v27 = self;
      id v28 = v17;
      id v23 = v16;
      [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.request.shared.data" request:v13 destinationID:v21 options:v22 responseHandler:v25];

      goto LABEL_12;
    }
    id v24 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v35 = "-[ADCompanionService _getSharedDataFromCompanionLinkDevice:completion:]";
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s device does not have an IDS identifier: %@", buf, 0x16u);
      if (!v7) {
        goto LABEL_13;
      }
    }
    else if (!v7)
    {
      goto LABEL_13;
    }
    uint64_t v12 = 0;
  }
  id v13 = +[AFError errorWithCode:v12];
  (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
LABEL_12:

LABEL_13:
}

- (void)startListeningForRemote
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100247B24;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v41 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
    __int16 v42 = 2112;
    id v43 = v8;
    __int16 v44 = 2112;
    id v45 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v12 = +[ADFMDMonitor sharedManager];
  unsigned int v13 = [v12 isLostModeActive];

  if (!v13)
  {
    [(ADCompanionService *)self _checkCompanionIdentifierStatus];
    id v15 = [(ADCompanionService *)self _newRequestDictionaryWithRequestInfo:v8];
    long long v16 = [(ADCompanionService *)self _getExecutionIdFromRequest:v15];
    id v17 = [(ADCompanionService *)self _companionLinkDeviceForPeer:v9 allowsDeviceCircleLookup:1 logDiscoveryContextFor:v16];

    if (self->_isListening)
    {
      if (v17)
      {
        unsigned __int8 v18 = [v15 objectForKey:@"messageID"];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100248040;
        v36[3] = &unk_10050D0D0;
        id v19 = v10;
        id v37 = v19;
        unsigned __int8 v30 = [(ADCompanionService *)self _startTimerForMessage:v18 targetDevice:v17 heartbeat:1 completion:v36];
        uint32_t v20 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v41 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
          __int16 v42 = 2112;
          id v43 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
        }
        clientLink = self->_clientLink;
        __int16 v21 = [v17 identifier];
        uint64_t v38 = RPOptionStatusFlags;
        unsigned __int8 v39 = &off_1005239F0;
        id v22 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10024805C;
        v31[3] = &unk_100507E98;
        unsigned __int8 v35 = v30;
        id v32 = v18;
        uint64_t v33 = self;
        id v34 = v19;
        id v23 = v18;
        [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.request.remote" request:v15 destinationID:v21 options:v22 responseHandler:v31];

        goto LABEL_22;
      }
      long long v25 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v41 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s unable to find remote device for execution", buf, 0xCu);
      }
      if (AFIsInternalInstall())
      {
        id v26 = AFSiriLogContextPerformance;
        os_signpost_id_t v27 = os_signpost_id_generate(AFSiriLogContextPerformance);
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v28 = v27;
          if (os_signpost_enabled(v26))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, v28, "CompanionDeviceNotFound", "ADCompanionService _startRemoteRequest", buf, 2u);
          }
        }
      }
    }
    else
    {
      id v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v41 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s companion service is disabled", buf, 0xCu);
      }
    }
    (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_22:

    goto LABEL_23;
  }
  unsigned int v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v41 = "-[ADCompanionService _startRemoteRequest:onPeer:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Lost mode is active, not sending any outbound requests", buf, 0xCu);
  }
  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_23:
}

- (void)startRemoteRequest:(id)a3 onPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v21 = "-[ADCompanionService startRemoteRequest:onPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (!v8 && v10) {
    v10[2](v10, 0);
  }
  serialQueue = self->_serialQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100248390;
  v16[3] = &unk_10050E228;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  unsigned int v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(serialQueue, v16);
}

- (void)_cleanUpMessageWaitContext:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADCompanionService _cleanUpMessageWaitContext:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  [(NSMutableSet *)self->_waitContexts removeObject:v4];
  if (![(NSMutableSet *)self->_waitContexts count])
  {
    waitContexts = self->_waitContexts;
    self->_waitContexts = 0;
  }
}

- (void)_waitForMessageIDs:(id)a3 withContext:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(void))a6;
  if ([v10 count])
  {
    id v13 = [objc_alloc((Class)NSMutableSet) initWithArray:v10];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = [v11 seenMessageIDs];
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          [v13 removeObject:*(void *)(*((void *)&v30 + 1) + 8 * (void)v17)];
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v15);
    }

    id v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v35 = "-[ADCompanionService _waitForMessageIDs:withContext:timeout:completion:]";
      __int16 v36 = 2112;
      id v37 = v11;
      __int16 v38 = 2112;
      id v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s %@ waiting on %@", buf, 0x20u);
    }
    [v11 setWaitingOnMessageIDs:v13];
    [v11 setCompletion:v12];
    [(ADCompanionService *)self _unblockWaitContext:v11 forMessageID:0];
    id v19 = [v11 completion];

    if (v19)
    {
      objc_initWeak((id *)buf, v11);
      id v20 = objc_alloc((Class)AFWatchdogTimer);
      serialQueue = self->_serialQueue;
      id v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      id v26 = sub_100248804;
      os_signpost_id_t v27 = &unk_10050C7C8;
      objc_copyWeak(&v29, (id *)buf);
      os_signpost_id_t v28 = self;
      id v22 = [v20 initWithTimeoutInterval:serialQueue onQueue:&v24 timeoutHandler:a5];
      objc_msgSend(v11, "setTimer:", v22, v24, v25, v26, v27);
      [v22 start];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v35 = "-[ADCompanionService _waitForMessageIDs:withContext:timeout:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Nothing to wait on invoking now", buf, 0xCu);
    }
    v12[2](v12);
  }
}

- (void)_unblockWaitContext:(id)a3 forMessageID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    uint64_t v16 = "-[ADCompanionService _unblockWaitContext:forMessageID:]";
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Unblocking %@ with %@", (uint8_t *)&v15, 0x20u);
  }
  if (v6)
  {
    id v8 = [v5 seenMessageIDs];
    if (!v8)
    {
      id v8 = objc_alloc_init((Class)NSMutableArray);
      [v5 setSeenMessageIDs:v8];
    }
    [v8 addObject:v6];
    __int16 v9 = [v5 waitingOnMessageIDs];
    [v9 removeObject:v6];
  }
  id v10 = [v5 completion];
  if (v10)
  {
    id v11 = [v5 waitingOnMessageIDs];
    id v12 = [v11 count];

    if (!v12)
    {
      id v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315394;
        uint64_t v16 = "-[ADCompanionService _unblockWaitContext:forMessageID:]";
        __int16 v17 = 2112;
        id v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Invoking wait context completion %@", (uint8_t *)&v15, 0x16u);
      }
      id v14 = [v5 timer];
      [v14 cancel];

      [v5 setCompletion:0];
      v10[2](v10);
    }
  }
}

- (void)_unblockWaitingForMessageIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    waitContexts = self->_waitContexts;
    if (waitContexts)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = [(NSMutableSet *)waitContexts allObjects];
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          id v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [(ADCompanionService *)self _unblockWaitContext:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) forMessageID:v4];
            id v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (id)_initializeNewMessageWaitContext
{
  id v3 = objc_alloc_init(ADCompanionServiceMessageWaitContext);
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADCompanionService _initializeNewMessageWaitContext]";
    __int16 v11 = 2112;
    long long v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  waitContexts = self->_waitContexts;
  if (!waitContexts)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_waitContexts;
    self->_waitContexts = v6;

    waitContexts = self->_waitContexts;
  }
  [(NSMutableSet *)waitContexts addObject:v3];
  return v3;
}

- (void)_tearDownIntermediateMessageIDs:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADCompanionService *)self _rapportEffectiveIdForPeer:v7];
  id v9 = [v8 length];
  id v10 = AFSiriLogContextDaemon;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      long long v13 = "-[ADCompanionService _tearDownIntermediateMessageIDs:forPeer:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Removed %@", (uint8_t *)&v12, 0x16u);
    }
    __int16 v11 = [(NSMutableDictionary *)self->_intermediateMessageIDs objectForKey:v8];
    [v11 removeObject:v6];
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    long long v13 = "-[ADCompanionService _tearDownIntermediateMessageIDs:forPeer:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Unable to get rapportEffectiveIdentifier for peer %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_recordIntermediateMessageID:(id)a3 forPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(ADCompanionService *)self _rapportEffectiveIdForPeer:v7];
    if ([v9 length])
    {
      id v10 = [(NSMutableDictionary *)self->_intermediateMessageIDs objectForKey:v9];
      __int16 v11 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        id v18 = v11;
        *(_DWORD *)buf = 136316162;
        uint64_t v25 = "-[ADCompanionService _recordIntermediateMessageID:forPeer:]";
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        id v29 = v8;
        __int16 v30 = 2112;
        long long v31 = v9;
        __int16 v32 = 2048;
        id v33 = [v10 count];
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s Recorded %@ for peer: %@, rapportEffectiveIdentifier=%@, messageIDSets count: %lu", buf, 0x34u);
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "addObject:", v6, (void)v19);
          }
          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
    }
    else
    {
      __int16 v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[ADCompanionService _recordIntermediateMessageID:forPeer:]";
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unable to get rapportEffectiveIdentifier for peer %@", buf, 0x16u);
      }
    }
  }
}

- (id)_setUpNewIntermediateIDsSetForPeer:(id)a3
{
  id v4 = a3;
  if (!self->_intermediateMessageIDs)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    intermediateMessageIDs = self->_intermediateMessageIDs;
    self->_intermediateMessageIDs = v5;
  }
  id v7 = [(ADCompanionService *)self _rapportEffectiveIdForPeer:v4];
  if ([v7 length])
  {
    id v8 = [(NSMutableDictionary *)self->_intermediateMessageIDs objectForKey:v7];
    if (!v8)
    {
      id v8 = objc_alloc_init((Class)NSMutableSet);
      [(NSMutableDictionary *)self->_intermediateMessageIDs setObject:v8 forKey:v7];
    }
    id v9 = objc_alloc_init((Class)NSMutableArray);
    [v8 addObject:v9];
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "-[ADCompanionService _setUpNewIntermediateIDsSetForPeer:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Unable to get rapportEffectiveIdentifier for peer %@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_rapportEffectiveIdForPeer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rapportEffectiveIdentifier];
  if (![v4 length])
  {
    id v5 = [v3 afPeerInfo];
    id v6 = sub_10016A938(v5, 0);
    uint64_t v7 = [v6 rapportEffectiveIdentifier];

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)_getExecutionIdFromRequest:(id)a3
{
  id v3 = [a3 objectForKey:@"executionContext"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 objectForKey:@"executionID"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldLogDiscoveryContextForRequestId:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    discoveryContextLoggedForExecutionIds = self->_discoveryContextLoggedForExecutionIds;
    if (!discoveryContextLoggedForExecutionIds)
    {
      id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      uint64_t v7 = self->_discoveryContextLoggedForExecutionIds;
      self->_discoveryContextLoggedForExecutionIds = v6;

      discoveryContextLoggedForExecutionIds = self->_discoveryContextLoggedForExecutionIds;
    }
    unsigned int v8 = [(NSMutableSet *)discoveryContextLoggedForExecutionIds containsObject:v4];
    id v9 = AFSiriLogContextDaemon;
    BOOL v10 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
      {
        int v14 = 136315394;
        id v15 = "-[ADCompanionService _shouldLogDiscoveryContextForRequestId:]";
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Event has already been logged once for %@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      if (v10)
      {
        int v14 = 136315394;
        id v15 = "-[ADCompanionService _shouldLogDiscoveryContextForRequestId:]";
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Logging event for: %@", (uint8_t *)&v14, 0x16u);
      }
      if ((unint64_t)[(NSMutableSet *)self->_discoveryContextLoggedForExecutionIds count] >= 0x33) {
        [(NSMutableSet *)self->_discoveryContextLoggedForExecutionIds removeAllObjects];
      }
      [(NSMutableSet *)self->_discoveryContextLoggedForExecutionIds addObject:v4];
    }
    char v12 = v8 ^ 1;
  }
  else
  {
    __int16 v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      id v15 = "-[ADCompanionService _shouldLogDiscoveryContextForRequestId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Received nil execution id, skip logging discovery event.", (uint8_t *)&v14, 0xCu);
    }
    char v12 = 0;
  }

  return v12;
}

- (void)_executeRemoteRequest:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 throughProxyDevice:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v52 = a7;
  __int16 v16 = (void (**)(id, void, void *))a8;
  id v17 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
    __int16 v82 = 2112;
    id v83 = v14;
    __int16 v84 = 2112;
    id v85 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);
  }
  id v53 = v14;
  __int16 v54 = v15;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v18 = +[ADFMDMonitor sharedManager];
  unsigned int v19 = [v18 isLostModeActive];

  if (v19)
  {
    long long v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Lost mode is active, not sending any outbound requests", buf, 0xCu);
    }
    long long v21 = +[AFError errorWithCode:1003];
    v16[2](v16, 0, v21);
    goto LABEL_48;
  }
  [(ADCompanionService *)self _checkCompanionIdentifierStatus];
  if (self->_isListening)
  {
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100249FE8;
    v75[3] = &unk_100507DA8;
    id v22 = v14;
    id v76 = v22;
    v77 = self;
    __int16 v48 = v16;
    id v79 = v48;
    id v23 = v15;
    id v78 = v23;
    double v51 = objc_retainBlock(v75);
    id v74 = 0;
    id v24 = [(ADCompanionService *)self _getExecutionIdFromRequest:v22];
    id v25 = [(ADCompanionService *)self _companionLinkDeviceForPeer:v23 allowsDeviceCircleLookup:1 allowsAWDLFallback:v10 error:&v74 logDiscoveryContextFor:v24];
    id v50 = v74;

    if (v25) {
      unsigned int v26 = objc_msgSend(v25, "isDiscoveredOverWifiP2P", v48, v50);
    }
    else {
      unsigned int v26 = 0;
    }
    clientAWDLTransportLinkDestinationId = self->_clientAWDLTransportLinkDestinationId;
    if (clientAWDLTransportLinkDestinationId)
    {
      id v29 = [v23 idsDeviceUniqueIdentifier];
      unsigned int v30 = [(NSString *)clientAWDLTransportLinkDestinationId isEqualToString:v29];

      if (!v25) {
        goto LABEL_23;
      }
    }
    else
    {
      unsigned int v30 = 0;
      if (!v25) {
        goto LABEL_23;
      }
    }
    if ((objc_msgSend(v25, "isDiscoveredOverInfraWifi", v48) & 1) != 0
      || ([(ADRapportLink *)self->_clientLink localDevice],
          long long v31 = objc_claimAutoreleasedReturnValue(),
          unsigned int v32 = [v25 willUseProxyCommunicationWithLocalDevice:v31],
          v31,
          v32))
    {
      id v33 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s Device found over iWifi or destination device is a proxyHost on local device.", buf, 0xCu);
      }
      ((void (*)(void *, id, void))v51[2])(v51, v25, 0);
      goto LABEL_47;
    }
LABEL_23:
    if (!v10
      || (+[AFFeatureFlags isAWDLFallbackForPersonalRequestsEnabled] & (v26 | v30)) != 1)
    {
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_10024A808;
      v59[3] = &unk_100507E20;
      BOOL v62 = v10;
      char v63 = v30;
      char v64 = v26;
      id v60 = v50;
      id v61 = v48;
      id v39 = objc_retainBlock(v59);
      id v40 = (void (**)(void))v39;
      if (v11)
      {
        if (v52)
        {
          id v41 = -[ADCompanionService _companionLinkDeviceForUniqueIDSIdentifier:](self, "_companionLinkDeviceForUniqueIDSIdentifier:");
          if (v41)
          {
            __int16 v42 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
              __int16 v82 = 2112;
              id v83 = v52;
              _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s #hal Sending command via proxy: %@", buf, 0x16u);
            }
            ((void (*)(void *, void *, void))v51[2])(v51, v41, 0);
          }
          else
          {
            v40[2](v40);
          }
        }
        else
        {
          double v47 = +[ADDeviceCircleManager sharedInstance];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_10024AA60;
          v55[3] = &unk_100507E70;
          v55[4] = self;
          uint64_t v56 = v51;
          char v58 = 0;
          uint64_t v57 = v40;
          [v47 getContextCollectorDeviceIdentifiersWithCompletion:v55];
        }
      }
      else
      {
        ((void (*)(void *))v39[2])(v39);
      }

      goto LABEL_47;
    }
    id v34 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%s Using AWDL message link for sending message.", buf, 0xCu);
      if (!v25) {
        goto LABEL_27;
      }
    }
    else if (!v25)
    {
LABEL_27:
      unsigned __int8 v35 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s We are responding back to a request received over AWDL. Blindly use existing AWDL link with a faux destinationDevice", buf, 0xCu);
      }
      id v25 = objc_alloc_init((Class)RPCompanionLinkDevice);
      [v25 setIdentifier:self->_clientAWDLTransportLinkDestinationId];
    }
    if (self->_clientAWDLTransportLink
      && (__int16 v36 = self->_clientAWDLTransportLinkDestinationId,
          [v25 identifier],
          id v37 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v36) = [(NSString *)v36 isEqualToString:v37],
          v37,
          v36))
    {
      __int16 v38 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s _clientAWDLTransportLink already exists, no need for activation. Sending message.", buf, 0xCu);
      }
      ((void (*)(void *, id, uint64_t))v51[2])(v51, v25, 1);
      [(ADCompanionService *)self _scheduleOrExtendAWDLClientLinkTimer];
    }
    else
    {
      id v43 = -[ADCompanionService _setupClientAWDLTransportLinkForDestination:](self, "_setupClientAWDLTransportLinkForDestination:", v25, v48);
      objc_initWeak((id *)buf, v43);

      id WeakRetained = objc_loadWeakRetained((id *)buf);
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_10024A530;
      v69[3] = &unk_100507DD0;
      objc_copyWeak(&v72, (id *)buf);
      unsigned int v71 = v51;
      id v45 = v25;
      id v70 = v45;
      char v73 = 1;
      [WeakRetained setStateUpdateHandler:v69];

      id v46 = objc_loadWeakRetained((id *)buf);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10024A670;
      v65[3] = &unk_100507DF8;
      id v67 = v49;
      v65[4] = self;
      id v25 = v45;
      id v66 = v25;
      objc_copyWeak(&v68, (id *)buf);
      [(ADCompanionService *)self _activateAWDLMessageLink:v46 completion:v65];

      objc_destroyWeak(&v68);
      objc_destroyWeak(&v72);
      objc_destroyWeak((id *)buf);
    }
LABEL_47:

    long long v21 = v76;
    goto LABEL_48;
  }
  id v27 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v81 = "-[ADCompanionService _executeRemoteRequest:onPeer:allowsRelay:allowFallbackOnAWDL:throughProxyDevice:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s companion service is disabled", buf, 0xCu);
    if (!v16) {
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    long long v21 = +[AFError errorWithCode:1009];
    v16[2](v16, 0, v21);
LABEL_48:
  }
LABEL_49:
}

- (void)startRemoteExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 throughProxyDevice:(id)a6 executionContext:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  unsigned int v19 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    id v34 = "-[ADCompanionService startRemoteExecution:onPeer:allowsRelay:throughProxyDevice:executionContext:completion:]";
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 2112;
    id v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s command = %@, peer = %@, executionContext = %@", buf, 0x2Au);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024B780;
  block[3] = &unk_100507D30;
  void block[4] = self;
  id v27 = v14;
  BOOL v32 = a5;
  id v28 = v15;
  id v29 = v17;
  id v30 = v16;
  id v31 = v18;
  id v21 = v18;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  id v25 = v14;
  dispatch_async(serialQueue, block);
}

- (void)startRemoteSerialzedCommandExecution:(id)a3 onPeer:(id)a4 allowsRelay:(BOOL)a5 allowFallbackOnAWDL:(BOOL)a6 executionContext:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v32 = "-[ADCompanionService startRemoteSerialzedCommandExecution:onPeer:allowsRelay:allowFallbackOnAWDL:executionCont"
          "ext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10024BA70;
  v24[3] = &unk_100507D08;
  v24[4] = self;
  id v25 = v14;
  BOOL v29 = a5;
  id v26 = v16;
  id v27 = v15;
  BOOL v30 = a6;
  id v28 = v17;
  id v20 = v17;
  id v21 = v15;
  id v22 = v16;
  id v23 = v14;
  dispatch_async(serialQueue, v24);
}

- (void)sendStereoPartnerMessage:(id)a3 messageType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[ADCompanionService sendStereoPartnerMessage:messageType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10024BD14;
  v16[3] = &unk_10050E228;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(serialQueue, v16);
}

- (BOOL)_isDevicePartOfCurrentMediaSystem:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  id v6 = [v5 mediaSystemIdentifier];

  if (v6)
  {
    uint64_t v7 = [(ADRapportLink *)self->_clientLink localDevice];
    id v8 = [v7 mediaSystemIdentifier];
    unsigned __int8 v9 = [v6 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)getStereoPartnerIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024BEFC;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_postConfigurationChangedNotification
{
  if (AFIsHorseman())
  {
    id v3 = +[AFAnalytics sharedAnalytics];
    id v4 = &off_100523A08;
    if (!self->_isStereoPairConfigured) {
      id v4 = &off_100523A20;
    }
    CFStringRef v8 = @"deviceCount";
    unsigned __int8 v9 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v3 logEventWithType:5101 context:v5];
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"ADCompanionServiceStereoConfigurationDidChangeNotification" object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kAFStereoConfigurationaDidChangeDarwinNotification, 0, 0, 1u);
}

- (void)_setIsStereoPairConfigured:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isStereoPairConfigured != v3)
  {
    self->_isStereoPairConfigured = v3;
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[ADCompanionService _setIsStereoPairConfigured:]";
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s media system is configured: %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (BOOL)isStereoPairConfigured
{
  return self->_isStereoPairConfigured;
}

- (void)setStereoPartnerIDSIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = v4;
  if (self->_stereoPartnerIDSIdentifier != v4 && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    int v6 = (NSString *)[(NSString *)v5 copy];
    stereoPartnerIDSIdentifier = self->_stereoPartnerIDSIdentifier;
    self->_stereoPartnerIDSIdentifier = v6;

    __int16 v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = self->_stereoPartnerIDSIdentifier;
      int v10 = 136315394;
      BOOL v11 = "-[ADCompanionService setStereoPartnerIDSIdentifier:]";
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s stereo partner has changed: %@", (uint8_t *)&v10, 0x16u);
    }
    [(ADCompanionService *)self _setIsStereoPairConfigured:self->_stereoPartnerIDSIdentifier != 0];
    [(ADCompanionService *)self _postConfigurationChangedNotification];
  }
}

- (void)_updateMediaSystemState
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[ADCompanionService _updateMediaSystemState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (AFIsHorseman())
  {
    id v4 = [(ADRapportLink *)self->_clientLink localDevice];
    id v5 = [v4 mediaSystemIdentifier];

    if (v5)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      int v6 = [(ADRapportLink *)self->_clientLink activeDevices];
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v6);
            }
            int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([(ADCompanionService *)self _isDevicePartOfCurrentMediaSystem:v10])
            {
              BOOL v11 = [(ADRapportLink *)self->_clientLink localDevice];
              unsigned int v12 = [v10 hasValidDiscoveryTypeForLocalDevice:v11];

              if (v12)
              {
                id v7 = v10;
                goto LABEL_17;
              }
            }
          }
          id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      id v13 = [v7 idsDeviceIdentifier];
      [(ADCompanionService *)self setStereoPartnerIDSIdentifier:v13];
    }
    else
    {
      [(ADCompanionService *)self setStereoPartnerIDSIdentifier:0];
    }
  }
}

- (void)removeMessageHandler:(id)a3 forMessageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v16 = "-[ADCompanionService removeMessageHandler:forMessageType:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@, delegate: %@", buf, 0x20u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024C5CC;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_removeMessageHandler:(id)a3 forMessageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v8 = [(NSMapTable *)self->_handlerForMessageType objectForKey:v7];
  unsigned int v9 = [v8 isEqual:v6];

  if (v9)
  {
    [(NSMapTable *)self->_handlerForMessageType removeObjectForKey:v7];
    if (![(NSMapTable *)self->_handlerForMessageType count])
    {
      handlerForMessageType = self->_handlerForMessageType;
      self->_handlerForMessageType = 0;
    }
  }
  else
  {
    id v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      id v13 = "-[ADCompanionService _removeMessageHandler:forMessageType:]";
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@ is not registered to handle message type: %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)setMessageHandler:(id)a3 forMessageType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[ADCompanionService setMessageHandler:forMessageType:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@, delegate: %@", buf, 0x20u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024C880;
  block[3] = &unk_10050DCB8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_sendMessage:(id)a3 messageType:(id)a4 toTargetDevice:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, id))a6;
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v46 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
    __int16 v47 = 2112;
    id v48 = v11;
    __int16 v49 = 2112;
    id v50 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v15 = +[ADFMDMonitor sharedManager];
  unsigned int v16 = [v15 isLostModeActive];

  if (v16)
  {
    __int16 v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v46 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Lost mode is active, not sending any outbound requests", buf, 0xCu);
      if (!v13) {
        goto LABEL_26;
      }
      goto LABEL_6;
    }
    if (v13)
    {
LABEL_6:
      uint64_t v18 = 1003;
LABEL_24:
      id v19 = +[AFError errorWithCode:v18];
      v13[2](v13, 0, v19);
LABEL_25:
    }
  }
  else
  {
    if (!self->_isListening)
    {
      id v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v46 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s companion service is disabled", buf, 0xCu);
        if (!v13) {
          goto LABEL_26;
        }
      }
      else if (!v13)
      {
        goto LABEL_26;
      }
      uint64_t v18 = 1009;
      goto LABEL_24;
    }
    if (v12)
    {
      id v19 = [(ADCompanionService *)self _newRequestDictionary];
      [v19 setObject:v11 forKey:@"type"];
      id v33 = v10;
      [v19 setObject:v10 forKey:@"payload"];
      [v19 objectForKey:@"messageID"];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10024CE48;
      v40[3] = &unk_10050E188;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v41 = v20;
      id v21 = v13;
      id v42 = v21;
      unsigned __int8 v32 = [(ADCompanionService *)self _startTimerForMessage:v20 targetDevice:v12 heartbeat:1 completion:v40];
      id v22 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v46 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
        __int16 v47 = 2112;
        id v48 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s sending message: %@", buf, 0x16u);
      }
      clientLink = self->_clientLink;
      id v24 = [v12 identifier];
      uint64_t v43 = RPOptionStatusFlags;
      __int16 v44 = &off_1005239F0;
      id v25 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10024CFC4;
      v34[3] = &unk_100507CE0;
      id v35 = v20;
      unsigned __int8 v39 = v32;
      id v36 = v12;
      __int16 v37 = self;
      id v38 = v21;
      id v26 = v20;
      [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.request.generic" request:v19 destinationID:v24 options:v25 responseHandler:v34];

      id v10 = v33;
      goto LABEL_25;
    }
    id v28 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v46 = "-[ADCompanionService _sendMessage:messageType:toTargetDevice:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s unable to find remote device for execution", buf, 0xCu);
    }
    if (AFIsInternalInstall())
    {
      BOOL v29 = AFSiriLogContextPerformance;
      os_signpost_id_t v30 = os_signpost_id_generate(AFSiriLogContextPerformance);
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v31 = v30;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, v31, "CompanionDeviceNotFound", "ADCompanionService _sendMessage", buf, 2u);
        }
      }
    }
    if (v13)
    {
      uint64_t v18 = 1000;
      goto LABEL_24;
    }
  }
LABEL_26:
}

- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithHKIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[ADCompanionService sendMessage:messageType:toDeviceWithHKIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024D5EC;
  block[3] = &unk_10050D3F0;
  void block[4] = self;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(serialQueue, block);
}

- (void)sendMessage:(id)a3 messageType:(id)a4 toDeviceWithIDSIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[ADCompanionService sendMessage:messageType:toDeviceWithIDSIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024D7E8;
  block[3] = &unk_10050D3F0;
  void block[4] = self;
  id v21 = v12;
  id v22 = v10;
  id v23 = v11;
  id v24 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(serialQueue, block);
}

- (void)getDeviceIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024D8E4;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)_stopListening
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[ADCompanionService _stopListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isListening)
  {
    [(ADRapportLink *)self->_clientLink invalidate];
    clientLink = self->_clientLink;
    self->_clientLink = 0;

    *(_WORD *)&self->_isListening = 0;
    playbackDeviceIDs = self->_playbackDeviceIDs;
    self->_playbackDeviceIDs = 0;

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:@"ADSecurityServiceEncryptionKeyDidChangeNotification"];

    [(ADCompanionService *)self _setReadyState:self->_isCompanionLinkReady];
    [(ADCompanionService *)self setStereoPartnerIDSIdentifier:0];
    [(NSMutableDictionary *)self->_incomingRequestLog removeAllObjects];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(NSMutableDictionary *)self->_timerInfo allValues];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) heartbeatTimer];
          [v12 stop];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [(ADCompanionService *)self _stopObservingDataChangedNotifications];
    cachedSharedData = self->_cachedSharedData;
    self->_cachedSharedData = 0;

    cachedStoreFrontIdentifier = self->_cachedStoreFrontIdentifier;
    self->_cachedStoreFrontIdentifier = 0;
  }
}

- (void)stopListening
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024DD64;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_startListening
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[ADCompanionService _startListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_isListening)
  {
    if (!self->_incomingRequestLog)
    {
      id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      incomingRequestLog = self->_incomingRequestLog;
      self->_incomingRequestLog = v4;
    }
    if (AFSupportsPlayThisOnThat())
    {
      if (!self->_playbackDeviceIDs)
      {
        id v6 = (NSMutableDictionary *)objc_opt_new();
        playbackDeviceIDs = self->_playbackDeviceIDs;
        self->_playbackDeviceIDs = v6;
      }
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"_encryptionKeyDidChange:" name:@"ADSecurityServiceEncryptionKeyDidChangeNotification" object:0];
    }
    [(ADCompanionService *)self _setupClientLink];
  }
}

- (void)_stopObservingDataChangedNotifications
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ADCompanionService _stopObservingDataChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isObservingDataChanges)
  {
    self->_isObservingDataChanges = 0;
    int musicPersonalizationNotificationToken = self->_musicPersonalizationNotificationToken;
    if (musicPersonalizationNotificationToken != -1)
    {
      notify_cancel(musicPersonalizationNotificationToken);
      self->_int musicPersonalizationNotificationToken = -1;
    }
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"ADAssistantDataManageriTunesStoreFrontIdentifierDidChangeNotification" object:0];
    [v5 removeObserver:self name:@"ADSharedDataDidChangeNotification" object:0];
  }
  else
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[ADCompanionService _stopObservingDataChangedNotifications]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Already not observing data changes", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_startObservingDataChangedNotifications
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[ADCompanionService _startObservingDataChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isObservingDataChanges)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v15 = "-[ADCompanionService _startObservingDataChangedNotifications]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Already observing data changes", buf, 0xCu);
    }
  }
  else
  {
    self->_isObservingDataChanges = 1;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_sharedDataDidChange:" name:@"ADSharedDataDidChangeNotification" object:0];
    if (AFSupportsPlayThisOnThatPlayback())
    {
      objc_initWeak(&location, self);
      if (self->_musicPersonalizationNotificationToken == -1)
      {
        serialQueue = self->_serialQueue;
        id v8 = _NSConcreteStackBlock;
        uint64_t v9 = 3221225472;
        uint64_t v10 = sub_10024E2D4;
        id v11 = &unk_100509778;
        objc_copyWeak(&v12, &location);
        if (notify_register_dispatch(AFCachedFusePersonalizationTokenChanged, &self->_musicPersonalizationNotificationToken, serialQueue, &v8))
        {
          int v7 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            long long v15 = "-[ADCompanionService _startObservingDataChangedNotifications]";
            _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed to register for music personalization token notification", buf, 0xCu);
          }
          self->_int musicPersonalizationNotificationToken = -1;
        }
        objc_destroyWeak(&v12);
      }
      objc_msgSend(v5, "addObserver:selector:name:object:", self, "_storeFrontDidChange:", @"ADAssistantDataManageriTunesStoreFrontIdentifierDidChangeNotification", 0, v8, v9, v10, v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_musicPersonalizationTokenChanged
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADCompanionService _musicPersonalizationTokenChanged]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADCompanionService *)self _updateSiriInfoDictionary];
}

- (void)_storeFrontDidChange:(id)a3
{
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[ADCompanionService _storeFrontDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10024E4C8;
  v5[3] = &unk_10050B918;
  v5[4] = self;
  [(ADCompanionService *)self _updateStoreFrontIdentifierWithCompletion:v5];
}

- (void)_encryptionKeyDidChange:(id)a3
{
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[ADCompanionService _encryptionKeyDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024E5D8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_sharedDataDidChange:(id)a3
{
  int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[ADCompanionService _sharedDataDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10024E6E0;
  v5[3] = &unk_10050B918;
  v5[4] = self;
  [(ADCompanionService *)self _updateSharedDataWithCompletion:v5];
}

- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 assistantId:(id *)a6 idsDeviceId:(id *)a7 homeKitId:(id *)a8
{
  id v12 = a3;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v12 objectForKey:@"idsDeviceId"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v24 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315138;
          unsigned __int8 v32 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s malformed IDS id", (uint8_t *)&v31, 0xCu);
        }
        id v25 = +[AFError errorWithCode:11 description:@"Malformed IDS id."];
        id v19 = v25;
        if (a5)
        {
          id v19 = v25;
          BOOL v23 = 0;
          *a5 = v19;
        }
        else
        {
          BOOL v23 = 0;
        }
        goto LABEL_59;
      }
      if (![(id)v13 length])
      {

        uint64_t v13 = 0;
      }
    }
    uint64_t v14 = [v12 objectForKey:@"homeKitId"];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v26 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315138;
          unsigned __int8 v32 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s malformed HomeKit id", (uint8_t *)&v31, 0xCu);
        }
        id v27 = +[AFError errorWithCode:11 description:@"Malformed HomeKit id."];
        id v19 = v27;
        if (a5)
        {
          id v19 = v27;
          BOOL v23 = 0;
          *a5 = v19;
        }
        else
        {
          BOOL v23 = 0;
        }
        goto LABEL_58;
      }
      if (![(id)v14 length])
      {

        uint64_t v14 = 0;
      }
    }
    uint64_t v15 = [v12 objectForKey:@"assistantId"];
    if (v15)
    {
      long long v16 = (void *)v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v28 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315138;
          unsigned __int8 v32 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s malformed Assistant id", (uint8_t *)&v31, 0xCu);
        }
        BOOL v29 = +[AFError errorWithCode:11 description:@"Malformed Assistant id."];
        id v19 = v29;
        if (a5)
        {
          id v20 = v29;
          id v19 = v20;
          goto LABEL_44;
        }
LABEL_56:
        BOOL v23 = 0;
        goto LABEL_57;
      }
      if ([v16 length])
      {
LABEL_47:
        if (a6) {
          *a6 = v16;
        }
        if (a7) {
          *a7 = (id) v13;
        }
        id v19 = 0;
        if (a8) {
          *a8 = (id) v14;
        }
        BOOL v23 = 1;
        goto LABEL_57;
      }
    }
    if (!(v13 | v14))
    {
      long long v17 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v31 = 136315138;
        unsigned __int8 v32 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s no IDS, HomeKit or Assistant id specified", (uint8_t *)&v31, 0xCu);
      }
      long long v18 = +[AFError errorWithCode:11 description:@"No IDS, HomeKit or Assistant ID specified."];
      id v19 = v18;
      if (a5)
      {
        id v20 = v18;
        id v19 = v20;
        long long v16 = 0;
LABEL_44:
        BOOL v23 = 0;
        *a5 = v20;
LABEL_57:

LABEL_58:
LABEL_59:

        goto LABEL_60;
      }
      long long v16 = 0;
      goto LABEL_56;
    }
    long long v16 = 0;
    goto LABEL_47;
  }
  id v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v31 = 136315138;
    unsigned __int8 v32 = "-[ADCompanionService _validateIncomingRequest:options:error:assistantId:idsDeviceId:homeKitId:]";
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s malformed request dictionary", (uint8_t *)&v31, 0xCu);
  }
  id v22 = +[AFError errorWithCode:11 description:@"Malformed request dictionary."];
  id v19 = v22;
  if (a5)
  {
    id v19 = v22;
    BOOL v23 = 0;
    *a5 = v19;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_60:

  return v23;
}

- (void)_updateSiriInfoDictionary
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v7 = "-[ADCompanionService _updateSiriInfoDictionary]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024ED08;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_activateAWDLMessageLink:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[ADCompanionService _activateAWDLMessageLink:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  os_signpost_id_t v9 = os_signpost_id_generate(AFSiriLogContextPerformance);
  uint64_t v10 = AFSiriLogContextPerformance;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CompanionServiceAWDLClientLink", "Creating AWDL Client link", buf, 2u);
  }

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024F924;
  block[3] = &unk_10050C148;
  id v17 = v7;
  os_signpost_id_t v18 = v9;
  id v16 = v6;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_prepAWDLClientLinkIfMessageReceivedOverAWDL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"messageLinkType"];
  id v6 = v5;
  if (v5 && [v5 isEqualToString:@"AWDL"])
  {
    uint64_t v7 = [v4 objectForKey:@"idsDeviceId"];
    id v8 = AFSiriLogContextDaemon;
    if (v7)
    {
      os_signpost_id_t v9 = (void *)v7;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        os_signpost_id_t v18 = "-[ADCompanionService _prepAWDLClientLinkIfMessageReceivedOverAWDL:]";
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Received message via AWDL for destinationId: %@", buf, 0x16u);
      }
      if (self->_clientAWDLTransportLink
        && [(NSString *)self->_clientAWDLTransportLinkDestinationId isEqualToString:v9])
      {
        uint64_t v10 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          os_signpost_id_t v18 = "-[ADCompanionService _prepAWDLClientLinkIfMessageReceivedOverAWDL:]";
          __int16 v19 = 2112;
          id v20 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Already activated AWDL link for destinationId: %@. Extending timer.", buf, 0x16u);
        }
        [(ADCompanionService *)self _scheduleOrExtendAWDLClientLinkTimer];
      }
      else
      {
        id v11 = objc_alloc_init((Class)RPCompanionLinkDevice);
        [v11 setIdentifier:v9];
        [(ADCompanionService *)self _setupClientAWDLTransportLinkForDestination:v11];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10024FF4C;
        v14[3] = &unk_100507C90;
        void v14[4] = self;
        id v15 = v9;
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = v16;
        id v13 = v9;
        [(ADCompanionService *)self _activateAWDLMessageLink:v12 completion:v14];

        os_signpost_id_t v9 = v11;
      }
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        os_signpost_id_t v18 = "-[ADCompanionService _prepAWDLClientLinkIfMessageReceivedOverAWDL:]";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Incoming request does not have device IDS id set.", buf, 0xCu);
      }
      os_signpost_id_t v9 = 0;
    }
  }
}

- (void)_handleAceCommandRequest:(id)a3 messageID:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v124 = a5;
  id v11 = a6;
  id v12 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
    __int16 v149 = 2112;
    id v150 = v10;
    __int16 v151 = 2112;
    id v152 = v9;
    __int16 v153 = 2112;
    id v154 = v124;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s incoming command request: %@ %@ %@", buf, 0x2Au);
  }
  id v13 = [v9 objectForKey:@"messageLinkType"];
  id v14 = v13;
  if (!v13 || ![v13 isEqualToString:@"AWDL"])
  {
    unsigned int v116 = 0;
LABEL_10:
    id v16 = [v9 objectForKey:@"forwardsToIDSDeviceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = 0;
    }

    os_signpost_id_t v18 = [v9 objectForKey:@"forwardsToAssistantId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = 0;
    }

    id v122 = (void *)v19;
    id v123 = (id)v17;
    if (v17 | v19)
    {
      v119 = v14;
      v141[0] = _NSConcreteStackBlock;
      v141[1] = 3221225472;
      v141[2] = sub_100251460;
      v141[3] = &unk_100509958;
      id v142 = (id)v17;
      id v143 = (id)v19;
      id v20 = +[AFPeerInfo newWithBuilder:v141];
      id v21 = +[ADDeviceCircleManager sharedInstance];
      id v22 = [v21 localPeerInfo];

      if ((sub_100174BB8(v20, v22) & 1) == 0)
      {
        os_signpost_id_t v30 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
          __int16 v149 = 2112;
          id v150 = v20;
          __int16 v151 = 2112;
          id v152 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s Forwarding request to %@: %@", buf, 0x20u);
        }
        int v31 = [[ADPeerInfo alloc] initWithAFPeerInfo:v20];
        unsigned __int8 v32 = [(ADCompanionService *)self _getExecutionIdFromRequest:v9];
        id v33 = [(ADCompanionService *)self _companionLinkDeviceForPeer:v31 allowsDeviceCircleLookup:1 logDiscoveryContextFor:v32];

        if (v33)
        {
          clientLink = self->_clientLink;
          id v34 = [(ADCompanionService *)self _transformedRequestDictionaryToForward:v9];
          id v35 = [v33 identifier];
          uint64_t v145 = RPOptionStatusFlags;
          long long v146 = &off_1005239F0;
          +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
          __int16 v37 = v36 = v10;
          v139[0] = _NSConcreteStackBlock;
          v139[1] = 3221225472;
          v139[2] = sub_1002514BC;
          v139[3] = &unk_100507C18;
          id v140 = v11;
          [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.request.execute.ace.command" request:v34 destinationID:v35 options:v37 responseHandler:v139];

          id v10 = v36;
          id v38 = v140;
          unsigned __int8 v39 = v33;
        }
        else
        {
          id v42 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
            __int16 v149 = 2112;
            id v150 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s Unable to find destination from peer info %@.", buf, 0x16u);
          }
          unsigned __int8 v39 = 0;
          if (AFIsInternalInstall())
          {
            uint64_t v43 = AFSiriLogContextPerformance;
            os_signpost_id_t v44 = os_signpost_id_generate(AFSiriLogContextPerformance);
            if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v45 = v44;
              if (os_signpost_enabled(v43))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_EVENT, v45, "CompanionDeviceNotFound", "ADCompanionService _handleAceCommandRequest", buf, 2u);
              }
            }
          }
          id v38 = +[AFError errorWithCode:1017];
          (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v38);
        }

        id v26 = v142;
        id v14 = v119;
        goto LABEL_44;
      }

      id v14 = v119;
    }
    BOOL v23 = +[ADFMDMonitor sharedManager];
    unsigned int v24 = [v23 isLostModeActive];

    if (!v24)
    {
      id v26 = [v9 objectForKey:@"command"];
      if (!v26)
      {
        id v27 = [v9 objectForKey:@"serializedCommand"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s incoming command is serialized", buf, 0xCu);
          }
          BOOL v29 = +[AceObject aceObjectWithPlistData:v27];
          id v26 = [v29 dictionary];
        }
        else
        {
          id v26 = 0;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v120 = v14;
        id v115 = v10;
        os_signpost_id_t v46 = os_signpost_id_generate(AFSiriLogContextPerformance);
        __int16 v47 = AFSiriLogContextPerformance;
        id v48 = v47;
        os_signpost_id_t spid = v46;
        unint64_t v49 = v46 - 1;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          id v50 = [v26 valueForKey:@"$class"];
          *(_DWORD *)buf = 138412546;
          v148 = v50;
          __int16 v149 = 2112;
          id v150 = v115;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CompanionService", "Received ACE Command Request: Class=%@, MessageID=%@", buf, 0x16u);
        }
        id v137 = 0;
        id v138 = 0;
        id v135 = 0;
        id v136 = 0;
        unsigned __int8 v51 = [(ADCompanionService *)self _validateIncomingRequest:v9 options:v124 error:&v138 assistantId:&v137 idsDeviceId:&v136 homeKitId:&v135];
        id v112 = v138;
        id v52 = v137;
        id v114 = v136;
        id v113 = v135;
        id v111 = v52;
        if (v51)
        {
          if (v52 && v114)
          {
            id v53 = +[ADDeviceCircleManager sharedInstance];
            [v53 _setAssistantId:v52 forDeviceWithIdsDeviceUniqueIdentifier:v114];
          }
          v106 = +[ADPeerCloudService sharedInstance];
          __int16 v54 = [v106 peerInfoForIDSDeviceUniqueIdentifier:v114 allowNonPeers:1];
          long long v55 = v115;
          if (!v54)
          {
            uint64_t v56 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
              __int16 v149 = 2112;
              id v150 = v114;
              _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s received command from peer IDS isn't aware of yet: %@", buf, 0x16u);
            }
            __int16 v54 = [[ADPeerInfo alloc] initWithUniqueIdentifer:v114];
          }
          [(ADPeerInfo *)v54 setAssistantIdentifier:v52];
          [(ADPeerInfo *)v54 setHomeKitAccessoryIdentifier:v113];
          uint64_t v57 = [v9 objectForKey:@"airPlayRouteIDs"];
          char v58 = v54;
          v109 = v54;
          if (v57)
          {
            v59 = (void *)v57;
            objc_opt_class();
            id v60 = self;
            if (objc_opt_isKindOfClass())
            {
              long long v133 = 0u;
              long long v134 = 0u;
              long long v131 = 0u;
              long long v132 = 0u;
              id v61 = v59;
              BOOL v62 = (char *)[v61 countByEnumeratingWithState:&v131 objects:v144 count:16];
              if (v62)
              {
                char v63 = v62;
                unsigned int v107 = v59;
                uint64_t v64 = *(void *)v132;
                while (2)
                {
                  for (i = 0; i != v63; ++i)
                  {
                    if (*(void *)v132 != v64) {
                      objc_enumerationMutation(v61);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      id v80 = AFSiriLogContextDaemon;
                      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315138;
                        v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                        _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%s received malformed route identifiers", buf, 0xCu);
                      }
                      id v61 = 0;
                      goto LABEL_87;
                    }
                  }
                  char v63 = (char *)[v61 countByEnumeratingWithState:&v131 objects:v144 count:16];
                  if (v63) {
                    continue;
                  }
                  break;
                }
LABEL_87:
                long long v55 = v115;
                id v60 = self;
                v59 = v107;
                char v58 = v109;
              }
              else
              {
                char v58 = v109;
              }
            }
            else
            {
              id v78 = v59;
              id v79 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s received malformed route identifier container", buf, 0xCu);
              }
              id v61 = 0;
              v59 = v78;
              long long v55 = v115;
            }

            v77 = v61;
          }
          else
          {
            v77 = 0;
            id v60 = self;
          }
          v105 = v77;
          [(ADPeerInfo *)v58 setAirPlayRouteIdentifiers:"setAirPlayRouteIdentifiers:"];
          uint64_t v81 = [v124 objectForKey:RPOptionSenderIDSDeviceID];
          id v108 = (void *)v81;
          if (v81)
          {
            __int16 v82 = [(ADCompanionService *)v60 _companionLinkDeviceForUniqueIDSIdentifier:v81 allowsAWDLFallback:v116];
            id v83 = v82;
            if (v82)
            {
              __int16 v84 = [v82 effectiveIdentifier];
              [(ADPeerInfo *)v58 setRapportEffectiveIdentifier:v84];

              -[ADPeerInfo setDeviceOwnedByCurrentUser:](v58, "setDeviceOwnedByCurrentUser:", ((unint64_t)[v83 statusFlags] >> 19) & 1);
            }
            else
            {
              v86 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                __int16 v149 = 2112;
                id v150 = v108;
                _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%s unable to find sender with id: (%@)", buf, 0x16u);
              }
            }
          }
          else
          {
            id v85 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
              _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%s sender has no IDS identifier", buf, 0xCu);
            }
          }
          unsigned int v87 = [v9 objectForKey:@"userInterfaceIdiom"];
          if (v87)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v88 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                _os_log_error_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%s received malformed User Interface Idiom", buf, 0xCu);
              }

              unsigned int v87 = 0;
            }
          }
          [(ADPeerInfo *)v58 setUserInterfaceIdiom:v87];
          uint64_t v89 = [v9 objectForKey:@"aceVersion"];
          if (v89)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              unsigned int v90 = (void *)v89;
              id v91 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%s received malformed ACE Version", buf, 0xCu);
              }

              uint64_t v89 = 0;
              long long v55 = v115;
            }
          }
          [(ADPeerInfo *)v58 setAceVersion:v89];
          v92 = [v9 objectForKey:@"mediaSystemId"];
          unsigned int v104 = (void *)v89;
          if (v92)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v93 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%s received malformed Media System ID", buf, 0xCu);
              }

              v92 = 0;
            }
          }
          [(ADPeerInfo *)v109 setMediaSystemIdentifier:v92];
          uint64_t v94 = [v9 objectForKey:@"executionContext"];
          v118 = v87;
          if (v94)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v95 = AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
                _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%s received malformed execution context", buf, 0xCu);
              }

              uint64_t v94 = 0;
            }
          }
          v96 = v55;
          if (v55)
          {
            incomingRequestLog = self->_incomingRequestLog;
            v98 = +[NSProcessInfo processInfo];
            [v98 systemUptime];
            id v99 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [(NSMutableDictionary *)incomingRequestLog setObject:v99 forKey:v96];
          }
          uint64_t v100 = [(ADCompanionService *)self _setUpNewIntermediateIDsSetForPeer:v109];
          [(ADCompanionService *)self _prepAWDLClientLinkIfMessageReceivedOverAWDL:v9];
          v101 = +[ADCommandCenter sharedCommandCenter];
          v125[0] = _NSConcreteStackBlock;
          v125[1] = 3221225472;
          v125[2] = sub_1002515D0;
          v125[3] = &unk_100507C68;
          v125[4] = self;
          id v126 = v100;
          unint64_t v127 = v109;
          id v128 = v96;
          id v129 = v11;
          os_signpost_id_t v130 = spid;
          v102 = v109;
          id v103 = v100;
          [v101 executeCommand:v26 fromPeer:v102 remoteExecutionInfo:v94 reply:v125];

          id v10 = v96;
          id v14 = v120;
          id v41 = v123;
          id v70 = v111;
          id v67 = v112;
          id v76 = v105;
          id v72 = v106;
        }
        else
        {
          unsigned int v71 = AFSiriLogContextDaemon;
          id v67 = v112;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
            __int16 v149 = 2112;
            id v150 = v112;
            _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%s validation error %@", buf, 0x16u);
          }
          id v72 = objc_opt_new();
          id v73 = objc_alloc_init((Class)SACommandIgnored);
          id v74 = [v73 dictionary];
          [v72 setObject:v74 forKey:@"commandResponse"];

          (*((void (**)(id, void *, void, id))v11 + 2))(v11, v72, 0, v112);
          uint64_t v75 = AFSiriLogContextPerformance;
          id v76 = v75;
          if (v49 > 0xFFFFFFFFFFFFFFFDLL)
          {
            id v10 = v115;
            id v41 = v123;
          }
          else
          {
            id v10 = v115;
            id v41 = v123;
            if (os_signpost_enabled(v75))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_END, spid, "CompanionService", "Validation error, rejected request", buf, 2u);
            }
          }
          id v70 = v111;
        }
      }
      else
      {
        id v66 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%s received malformed command", buf, 0xCu);
        }
        id v67 = objc_opt_new();
        id v68 = objc_alloc_init((Class)SACommandIgnored);
        v69 = [v68 dictionary];
        [v67 setObject:v69 forKey:@"commandResponse"];

        id v70 = +[AFError errorWithCode:11];
        (*((void (**)(id, void *, void, void *))v11 + 2))(v11, v67, 0, v70);
        id v41 = v123;
      }

      goto LABEL_123;
    }
    id v25 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Lost mode is active, rejecting incoming request", buf, 0xCu);
    }
    id v26 = +[AFError errorWithCode:1003];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v26);
LABEL_44:
    id v41 = v123;
LABEL_123:

    goto LABEL_124;
  }
  id v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Received message via AWDL", buf, 0xCu);
  }
  if (+[AFFeatureFlags isAWDLFallbackForPersonalRequestsEnabled])
  {
    unsigned int v116 = 1;
    goto LABEL_10;
  }
  id v40 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "-[ADCompanionService _handleAceCommandRequest:messageID:options:responseHandler:]";
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s Received message via AWDL but AWDL is not enabled. Return the companion mismatched error dialog.", buf, 0xCu);
  }
  id v41 = +[AFError errorWithCode:1019];
  (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v41);
LABEL_124:
}

- (id)_setupClientAWDLTransportLinkForDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 idsDeviceIdentifier];
  if (v5
    && (id v6 = (void *)v5,
        [v4 idsDeviceIdentifier],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    id v9 = [v4 idsDeviceIdentifier];
  }
  else
  {
    id v9 = [v4 identifier];
    if (v9)
    {
      id v10 = [v4 identifier];
      id v11 = [v10 length];

      if (v11)
      {
        id v12 = [v4 identifier];
        unsigned int v13 = [v12 hasPrefix:@"device:"];

        id v14 = [v4 identifier];
        id v9 = v14;
        if (v13)
        {
          uint64_t v15 = [v14 _stripFZIDPrefix];

          id v9 = (void *)v15;
        }
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[ADCompanionService _setupClientAWDLTransportLinkForDestination:]";
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Creating AWDL client link for destination: %@", buf, 0x16u);
  }
  clientAWDLTransportLink = self->_clientAWDLTransportLink;
  if (clientAWDLTransportLink)
  {
    [(ADRapportLink *)clientAWDLTransportLink invalidate];
    os_signpost_id_t v18 = self->_clientAWDLTransportLink;
    self->_clientAWDLTransportLink = 0;
  }
  clientAWDLTransportLinkDestinationId = self->_clientAWDLTransportLinkDestinationId;
  self->_clientAWDLTransportLinkDestinationId = 0;

  id v20 = [ADRapportLink alloc];
  serialQueue = self->_serialQueue;
  id v22 = +[ADRapportLinkConfiguration newWithBuilder:&stru_100507BD0];
  BOOL v23 = [(ADRapportLink *)v20 initWithQueue:serialQueue configuration:v22];
  unsigned int v24 = self->_clientAWDLTransportLink;
  self->_clientAWDLTransportLink = v23;

  [(ADRapportLink *)self->_clientAWDLTransportLink addListener:self];
  id v25 = self->_clientAWDLTransportLink;
  uint64_t v30 = RPOptionStatusFlags;
  int v31 = &off_100523A38;
  id v26 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100251C6C;
  v29[3] = &unk_100507B38;
  void v29[4] = self;
  [(ADRapportLink *)v25 registerRequestID:@"com.apple.siri.request.execute.ace.command" options:v26 handler:v29];

  [(ADRapportLink *)self->_clientAWDLTransportLink setDestinationDevice:v4];
  id v27 = self->_clientAWDLTransportLink;

  return v27;
}

- (void)_setupClientLink
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v28 = "-[ADCompanionService _setupClientLink]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_clientLink)
  {
    os_signpost_id_t v4 = os_signpost_id_generate(AFSiriLogContextPerformance);
    uint64_t v5 = AFSiriLogContextPerformance;
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CompanionServiceClientLink", "Creating CompanionService ClientLink", buf, 2u);
    }

    uint64_t v7 = [ADRapportLink alloc];
    serialQueue = self->_serialQueue;
    id v9 = +[ADRapportLinkConfiguration newWithBuilder:&stru_100507AD0];
    id v10 = [(ADRapportLink *)v7 initWithQueue:serialQueue configuration:v9];
    clientLink = self->_clientLink;
    self->_clientLink = v10;

    [(ADRapportLink *)self->_clientLink addListener:self];
    uint64_t v25 = RPOptionStatusFlags;
    id v26 = &off_1005239F0;
    id v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    unsigned int v13 = self->_clientLink;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100252290;
    v24[3] = &unk_100507B38;
    v24[4] = self;
    [(ADRapportLink *)v13 registerRequestID:@"com.apple.siri.request.execute.ace.command" options:v12 handler:v24];
    id v14 = self->_clientLink;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100252438;
    v23[3] = &unk_100507B38;
    v23[4] = self;
    [(ADRapportLink *)v14 registerRequestID:@"com.apple.siri.request.remote" options:v12 handler:v23];
    uint64_t v15 = self->_clientLink;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002528C8;
    v22[3] = &unk_100507B38;
    v22[4] = self;
    [(ADRapportLink *)v15 registerRequestID:@"com.apple.siri.request.shared.data" options:v12 handler:v22];
    id v16 = self->_clientLink;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100252CB0;
    v21[3] = &unk_100507B38;
    v21[4] = self;
    [(ADRapportLink *)v16 registerRequestID:@"com.apple.siri.request.generic" options:v12 handler:v21];
    unint64_t v17 = self->_clientLink;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002533D4;
    v20[3] = &unk_100507B38;
    v20[4] = self;
    [(ADRapportLink *)v17 registerRequestID:@"com.apple.siri.request.heartbeat" options:v12 handler:v20];
    os_signpost_id_t v18 = self->_clientLink;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002536A8;
    v19[3] = &unk_100507BB0;
    v19[4] = self;
    v19[5] = v4;
    [(ADRapportLink *)v18 activateWithCompletion:v19];
  }
}

- (BOOL)_updateSharedDataFromIDSWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[ADCompanionService _updateSharedDataFromIDSWithIdentifier:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v4 length])
  {
    id v6 = +[ADPeerCloudService sharedInstance];
    uint64_t v7 = [v6 peerInfoForIDSDeviceUniqueIdentifier:v4 allowNonPeers:1];

    BOOL v8 = v7 != 0;
    if (v7)
    {
      id v9 = +[ADCommandCenter sharedCommandCenter];
      id v10 = +[NSSet setWithObject:v7];
      [v9 updateSharedDataFromCloudPeers:v10 completion:0];
    }
    else
    {
      id v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        id v14 = "-[ADCompanionService _updateSharedDataFromIDSWithIdentifier:]";
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s unable to find peer for IDS identifier: (%@)", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updateSharedDataForDevice:(id)a3 allowIDSFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  id v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v32 = "-[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]";
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v11 = [v8 idsDeviceIdentifier];
  if (![v11 length])
  {
    __int16 v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v32 = "-[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]";
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s unable to find IDS identifier for device: %@", buf, 0x16u);
      if (!v9) {
        goto LABEL_24;
      }
    }
    else if (!v9)
    {
      goto LABEL_24;
    }
    v9[2](v9, 0);
    goto LABEL_24;
  }
  id v12 = objc_msgSend(v8, "_ad_siriSharedDataProtobuf");
  int v13 = objc_msgSend(v12, "_ad_data");

  if ([(ADCompanionService *)self _updateSharedData:v13 forDevice:v8])
  {
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v32 = "-[ADCompanionService _updateSharedDataForDevice:allowIDSFetch:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s updated shared data from siriInfo dictionary", buf, 0xCu);
    }
    if (v9) {
      v9[2](v9, 0);
    }
  }
  else
  {
    id v16 = +[NSProcessInfo processInfo];
    [v16 systemUptime];
    double v18 = v17;

    unint64_t v19 = [(NSMutableDictionary *)self->_deviceUpdateLog objectForKey:v11];
    id v20 = v19;
    if (v19 && ([v19 doubleValue], vabdd_f64(v18, v21) <= 3600.0))
    {
      if (v6)
      {
        BOOL v24 = [(ADCompanionService *)self _updateSharedDataFromIDSWithIdentifier:v11];
        if (v9) {
          v9[2](v9, v24);
        }
      }
      else if (v9)
      {
        v9[2](v9, 0);
      }
    }
    else
    {
      if (!self->_deviceUpdateLog)
      {
        id v22 = (NSMutableDictionary *)objc_opt_new();
        deviceUpdateLog = self->_deviceUpdateLog;
        self->_deviceUpdateLog = v22;
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100254390;
      v25[3] = &unk_100507AB0;
      void v25[4] = self;
      id v26 = v8;
      double v29 = v18;
      id v27 = v11;
      BOOL v30 = v6;
      id v28 = v9;
      [(ADCompanionService *)self _getSharedDataFromCompanionLinkDevice:v26 completion:v25];
    }
  }

LABEL_24:
}

- (void)updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3
{
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[ADCompanionService updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100254580;
  v7[3] = &unk_10050CD50;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(serialQueue, v7);
}

- (void)_updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v21 = "-[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  BOOL v6 = +[ADPreferences sharedPreferences];
  uint64_t v7 = v6;
  if (v3)
  {
    BOOL v8 = [v6 lastCompanionRemoteDataFetchDate];
    id v9 = v8;
    if (v8 && ([v8 timeIntervalSinceNow], v10 > -86400.0))
    {
      id v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        double v21 = "-[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s preventing IDS fetch due to rate limiting", buf, 0xCu);
      }
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  int v13 = [(ADCompanionService *)self _companionDevice];
  if (v13)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10025483C;
    v18[3] = &unk_10050B918;
    id v19 = v7;
    [(ADCompanionService *)self _updateSharedDataForDevice:v13 allowIDSFetch:v12 completion:v18];
    id v14 = v19;
  }
  else
  {
    __int16 v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      double v21 = "-[ADCompanionService _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s unable to find companion device in active devices", buf, 0xCu);
    }
    id v16 = [(ADRapportLink *)self->_clientLink localDevice];
    id v14 = [v16 idsPersonalDeviceIdentifier];

    if (v12
      && [(ADCompanionService *)self _updateSharedDataFromIDSWithIdentifier:v14])
    {
      double v17 = +[NSDate now];
      [v7 setLastCompanionRemoteDataFetchDate:v17];

      [v7 synchronize];
    }
  }
}

- (BOOL)_updateSharedData:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315394;
    BOOL v24 = "-[ADCompanionService _updateSharedData:forDevice:]";
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v23, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    id v9 = [v7 idsDeviceIdentifier];
    id v10 = [v9 length];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      uint64_t v12 = +[ADPeerCloudService sharedInstance];
      int v13 = [v6 assistantId];
      if (v13)
      {
        id v14 = +[ADDeviceCircleManager sharedInstance];
        [v14 _setAssistantId:v13 forDeviceWithIdsDeviceUniqueIdentifier:v9];
      }
      __int16 v15 = [v12 peerInfoForIDSDeviceUniqueIdentifier:v9 allowNonPeers:1];
      id v16 = v15;
      if (v15) {
        double v17 = v15;
      }
      else {
        double v17 = [[ADPeerInfo alloc] initWithUniqueIdentifer:v9];
      }
      id v20 = v17;
      double v21 = +[ADCommandCenter sharedCommandCenter];
      [v21 updateSharedDataWithCloudData:v6 fromPeer:v20];
    }
    else
    {
      id v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315394;
        BOOL v24 = "-[ADCompanionService _updateSharedData:forDevice:]";
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s unable to find IDS identifier for device: %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    double v18 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      BOOL v24 = "-[ADCompanionService _updateSharedData:forDevice:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s shared data missing", (uint8_t *)&v23, 0xCu);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updateAssistantIDMapForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[ADCompanionService _updateAssistantIDMapForDevice:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v6 = [v4 idsDeviceIdentifier];
  if ([v6 length])
  {
    id v7 = objc_msgSend(v4, "_ad_siriSharedDataProtobuf");
    BOOL v8 = [v7 assistantId];

    if (!v8)
    {
      if (!AFSupportsMultiUser()
        || (+[ADMultiUserService sharedService],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            [v12 getAssistantIdentifierForIDS:v6],
            BOOL v8 = objc_claimAutoreleasedReturnValue(),
            v12,
            !v8))
      {
        id v10 = AFSiriLogContextDaemon;
        if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        int v13 = 136315394;
        id v14 = "-[ADCompanionService _updateAssistantIDMapForDevice:]";
        __int16 v15 = 2112;
        id v16 = v4;
        BOOL v11 = "%s unable to find assistant identifier for device: %@";
LABEL_13:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x16u);
        goto LABEL_11;
      }
    }
    id v9 = +[ADDeviceCircleManager sharedInstance];
    [v9 _setAssistantId:v8 forDeviceWithIdsDeviceUniqueIdentifier:v6];
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[ADCompanionService _updateAssistantIDMapForDevice:]";
      __int16 v15 = 2112;
      id v16 = v4;
      BOOL v11 = "%s unable to find IDS identifier for device: %@";
      goto LABEL_13;
    }
  }
LABEL_11:
}

- (void)_updateCompanionIdentifier
{
  BOOL v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315138;
    double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v20, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (AFIsHorseman())
  {
    clientLink = self->_clientLink;
    if (clientLink)
    {
      uint64_t v5 = [(ADRapportLink *)clientLink localDevice];
      unsigned int v6 = [v5 personalRequestsState];
      uint64_t v7 = v6 != 0;
      if (AFIsHorseman())
      {
        unsigned int IsRunningAsInstance = AFProcessIsRunningAsInstance();
        if (v6) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = IsRunningAsInstance;
        }
      }
      id v9 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
        __int16 v22 = 1024;
        LODWORD(v23) = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s companion link ready: %d", (uint8_t *)&v20, 0x12u);
      }
      if (self->_isCompanionLinkReady != v7)
      {
        self->_isCompanionLinkReady = v7;
        [(ADCompanionService *)self _setReadyState:v7];
      }
      id v10 = +[ADPreferences sharedPreferences];
      if (![v5 personalDeviceState])
      {
        __int16 v15 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315138;
          double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s companion identifier has not updated yet", (uint8_t *)&v20, 0xCu);
        }
        [v10 setCompanionIdentifier:0];
        goto LABEL_41;
      }
      unsigned int v11 = [v5 personalDeviceState];
      uint64_t v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
        __int16 v22 = 1024;
        LODWORD(v23) = v11 == 6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s has companion device: %d", (uint8_t *)&v20, 0x12u);
      }
      if (v11 == 6)
      {
        int v13 = [v5 idsPersonalDeviceIdentifier];
      }
      else
      {
        int v13 = 0;
      }
      id v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315394;
        double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
        __int16 v22 = 2112;
        int v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s companion identifier has been updated: \"%@\"", (uint8_t *)&v20, 0x16u);
      }
      double v17 = [v10 companionIdentifier];
      if (v13 == v17 || ([(__CFString *)v13 isEqualToString:v17] & 1) != 0)
      {
        double v18 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315138;
          double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s companion identifier was already set", (uint8_t *)&v20, 0xCu);
        }
        if (v11 != 6) {
          goto LABEL_40;
        }
      }
      else
      {
        if (v11 != 6)
        {
          [v10 setCompanionIdentifier:0];
          goto LABEL_40;
        }
        if (v13) {
          CFStringRef v19 = v13;
        }
        else {
          CFStringRef v19 = &stru_10050F7D8;
        }
        [v10 setCompanionIdentifier:v19];
        if (v13)
        {
          [(NSMutableDictionary *)self->_deviceUpdateLog removeObjectForKey:v13];
          if (v17)
          {
            [v10 setLastCompanionRemoteDataFetchDate:0];
            [v10 synchronize];
          }
        }
      }
      [(ADCompanionService *)self _updateSharedDataForCompanionDeviceWithRemoteFetchAllowed:1];
LABEL_40:

LABEL_41:
      return;
    }
    id v14 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      double v21 = "-[ADCompanionService _updateCompanionIdentifier]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s unable to check companion identifier without client link established", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_setReadyState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADCompanionService _setReadyState:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_isReady != v3)
  {
    unsigned int v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[ADCompanionService _setReadyState:]";
      __int16 v10 = 1024;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s companion service ready: %d", (uint8_t *)&v8, 0x12u);
    }
    self->_isReady = v3;
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"ADCompanionServiceReadyStateDidChangeNotification" object:0];
  }
}

- (ADCompanionService)init
{
  v16.receiver = self;
  v16.super_class = (Class)ADCompanionService;
  v2 = [(ADCompanionService *)&v16 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADCompanionService.Serial", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("ADInstrumentationQueue", 0);
    instrumentationQueue = v2->_instrumentationQueue;
    v2->_instrumentationQueue = (OS_dispatch_queue *)v6;

    int v8 = v2->_instrumentationQueue;
    id v9 = dispatch_get_global_queue(17, 0);
    dispatch_set_target_queue(v8, v9);

    v2->_int musicPersonalizationNotificationToken = -1;
    __int16 v10 = v2->_serialQueue;
    BOOL v11 = +[ADQueueMonitor sharedMonitor];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100255460;
    v14[3] = &unk_10050C458;
    __int16 v15 = v10;
    uint64_t v12 = v10;
    [v11 addQueue:v12 heartBeatInterval:v14 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v2;
}

+ (ADCompanionService)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025561C;
  block[3] = &unk_10050E350;
  void block[4] = a1;
  if (qword_100585FF0 != -1) {
    dispatch_once(&qword_100585FF0, block);
  }
  v2 = (void *)qword_100585FE8;
  return (ADCompanionService *)v2;
}

@end