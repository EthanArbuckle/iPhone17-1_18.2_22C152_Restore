@interface ADDeviceCircleManager
+ (ADDeviceCircleManager)sharedInstance;
+ (id)_rapportLinkWithQueue:(id)a3;
- (BOOL)_doesHomeKitAccessorySupportMUX:(id)a3;
- (BOOL)_isLocalDeviceCollectorCandidate;
- (BOOL)_isRemoteDeviceCollectorCandidate:(id)a3;
- (BOOL)_isSyncTokenAcceptingAccessory:(id)a3;
- (NSSet)personalRequestsEnabledAccessories;
- (id)_collectorDeviceIdentifiersWithFlags;
- (id)_handleDeviceCapabilitiesFetch:(id)a3 fromPeer:(id)a4;
- (id)_handlePeersAndSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4;
- (id)_handleSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4;
- (id)_initWithQueue:(id)a3 rapportLink:(id)a4;
- (id)_keepAliveLinkToDevice:(id)a3;
- (id)_localPeerData;
- (id)_localPeerInfo;
- (id)_managedPeerInfoForAssistantIdentifier:(id)a3;
- (id)_managedPeerInfoForHomeKitAccessoryIdentifier:(id)a3;
- (id)_managedPeerInfoForIDSDeviceUniqueIdentifier:(id)a3;
- (id)_managedPeerInfoForRapportEffectiveIdentifier:(id)a3;
- (id)_managedPeerInfoMatchingPeerInfo:(id)a3;
- (id)_mapPeerToAccessoryWithEnabledPersonalRequests:(id)a3;
- (id)_rapportLinkMessageOptions;
- (id)_remotePeerInfoForAssistantIdentifier:(id)a3;
- (id)_remotePeerInfoForHomeKitAccessoryIdentifier:(id)a3;
- (id)_remotePeerInfoForIDSDeviceUniqueIdentifier:(id)a3;
- (id)_remotePeerInfoForRapportEffectiveIdentifier:(id)a3;
- (id)_rpDeviceMatchingPeerInfo:(id)a3;
- (id)_setUpOnDemandClientLinkToContextCollector;
- (id)_syncCompanionLinkDeviceLocalPeerData;
- (id)assistantIdForDeviceWithIdsDeviceUniqueIdentifier:(id)a3;
- (id)idsDeviceUniqueIdentifierForDeviceWithAssistantId:(id)a3;
- (id)localPeerInfo;
- (id)locationSharingDevice;
- (id)managedPeerInfoMatchingPeerInfo:(id)a3;
- (unint64_t)_rapportLinkInstabilityPenalty;
- (void)_activateOnDemandClientLinkToContextCollector:(id)a3 completion:(id)a4;
- (void)_cleanupOnDemandClientLinkToContextCollector:(id)a3;
- (void)_executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandConnectionToContextCollector:(BOOL)a6 completion:(id)a7;
- (void)_executeCommandThroughOnDemandClientLinkToContextCollector:(id)a3 onPeer:(id)a4 debugID:(id)a5 completion:(id)a6;
- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 completion:(id)a4;
- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 fromCollectorWithIndex:(unint64_t)a4 existingCapabilities:(id)a5 completion:(id)a6;
- (void)_forwardExecuteCommandToDevice:(id)a3 message:(id)a4 from:(id)a5 completion:(id)a6;
- (void)_handleExecuteCommand:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4;
- (void)_reelectCollectorIfNecessary;
- (void)_registerRequestHandlerForRequestId:(id)a3 messageType:(id)a4 handler:(id)a5;
- (void)_removeRemotePeerInfoWithRapportEffectiveIdentifier:(id)a3;
- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3;
- (void)_sendSyncTokenToAccessories:(id)a3 transferReason:(int64_t)a4;
- (void)_sendSyncTokenToAccessoryWithHomeKitIdentifier:(id)a3 aceHost:(id)a4 clientLink:(id)a5 transferReason:(int64_t)a6;
- (void)_sendSyncTokenToUpdatedPeer:(id)a3;
- (void)_setAssistantId:(id)a3 forDeviceWithIdsDeviceUniqueIdentifier:(id)a4;
- (void)_setupClientLink;
- (void)_setupMUXSupport;
- (void)_startStationaryScoreTimer;
- (void)_stopStationaryScoreTimer;
- (void)_updateAssistantIdentifierAndSharedUserIdentifier;
- (void)_updateClientLinkSiriInfo;
- (void)_updateCollectorElectionVersion;
- (void)_updateContextCollectorStatusToRapport:(BOOL)a3;
- (void)_updateCurrentAccessoryInfo:(id)a3;
- (void)_updateDeviceCountTrend;
- (void)_updateLocalPeerInfo:(id)a3;
- (void)_updatePersonalRequestsEnabledAccessories;
- (void)_updateRemotePeerInfo:(id)a3;
- (void)_updateSiriInfoWithDeviceCapabilities;
- (void)_updateSiriInfoWithLocalPeerData:(id)a3;
- (void)_updateStationaryScore;
- (void)_updateStationaryScoreAndResetTimer;
- (void)_updateStationaryScoreBroadcasting;
- (void)activeAccountIdentifierDidChange:(id)a3;
- (void)addListener:(id)a3;
- (void)dumpAssistantStateChunk:(id)a3;
- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 completion:(id)a6;
- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandRapportConnection:(id)a6;
- (void)getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:(id)a3;
- (void)getCapabilitiesForDevice:(id)a3 completion:(id)a4;
- (void)getCapabilitiesForReachableDevicesWithCompletion:(id)a3;
- (void)getContextCollectorDeviceIdentifiersWithCompletion:(id)a3;
- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3;
- (void)homeInfoManager:(id)a3 didUpdateCurrentAccessoryInfo:(id)a4;
- (void)isMeDeviceDidChange:(id)a3;
- (void)myriadTrialBoostsUpdated:(id)a3;
- (void)preferencesEnabledBitsDidChange:(id)a3;
- (void)preferencesSharedUserIdentifierDidChange:(id)a3;
- (void)rapportLink:(id)a3 didFindDevice:(id)a4;
- (void)rapportLink:(id)a3 didLoseDevice:(id)a4;
- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7;
- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5;
- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4;
- (void)reelectContextCollectorWithBestScore;
- (void)removeListener:(id)a3;
- (void)sendRequestType:(id)a3 data:(id)a4 toDeviceWithAssistantIdentifier:(id)a5 onQueue:(id)a6 completion:(id)a7;
- (void)sendSyncTokenToPersonalRequestsEnabledAccessories;
- (void)setPersonalRequestsEnabledAccessories:(id)a3;
- (void)sharedDataDidChange:(id)a3;
- (void)updatePersonalRequestsEnabledAccessories:(id)a3;
- (void)wakeUpNearbyDevices;
@end

@implementation ADDeviceCircleManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalRequestsEnabledAccessories, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_svdCapabilities, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifiersByAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_remotePeerInfoByRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_localPeerInfo, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdsByDeviceIDSID, 0);
  objc_storeStrong((id *)&self->_lastReelectionDate, 0);
  objc_storeStrong((id *)&self->_deviceCountTrend, 0);
  objc_storeStrong((id *)&self->_stationaryScoreTimer, 0);
  objc_storeStrong((id *)&self->_currentCollectorIDs, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_onDemandClientLinkToContextCollector, 0);
  objc_storeStrong((id *)&self->_clientLink, 0);
  objc_storeStrong((id *)&self->_muxSyncQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (unint64_t)_rapportLinkInstabilityPenalty
{
  return self->_rapportInstabilityPenalty;
}

- (void)reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016550C;
  block[3] = &unk_10050C148;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)dumpAssistantStateChunk:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016561C;
  v8[3] = &unk_10050D080;
  id v9 = a3;
  id v4 = v9;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100165634;
  v6[3] = &unk_10050A768;
  v7 = objc_retainBlock(v8);
  v5 = v7;
  [(ADDeviceCircleManager *)self getManagedLocalAndRemotePeerInfoWithCompletion:v6];
}

- (id)_remotePeerInfoForRapportEffectiveIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_remotePeerInfoByRapportEffectiveIdentifier objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_remotePeerInfoForHomeKitAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier objectForKey:v4];
    id v6 = [(ADDeviceCircleManager *)self _remotePeerInfoForRapportEffectiveIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_remotePeerInfoForIDSDeviceUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier objectForKey:v4];
    id v6 = [(ADDeviceCircleManager *)self _remotePeerInfoForRapportEffectiveIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_remotePeerInfoForAssistantIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSMutableDictionary *)self->_rapportEffectiveIdentifiersByAssistantIdentifier objectForKey:v4];
    id v6 = [(ADDeviceCircleManager *)self _remotePeerInfoForRapportEffectiveIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_removeRemotePeerInfoWithRapportEffectiveIdentifier:(id)a3
{
  id v11 = a3;
  id v4 = [v11 length];
  v5 = v11;
  if (v4)
  {
    id v6 = [(NSMutableDictionary *)self->_remotePeerInfoByRapportEffectiveIdentifier objectForKey:v11];
    v7 = v6;
    if (v6)
    {
      id v8 = [v6 idsDeviceUniqueIdentifier];
      if ([v8 length]) {
        [(NSMutableDictionary *)self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier removeObjectForKey:v8];
      }
      id v9 = [v7 assistantIdentifier];
      if ([v9 length]) {
        [(NSMutableDictionary *)self->_rapportEffectiveIdentifiersByAssistantIdentifier removeObjectForKey:v9];
      }
      id v10 = [v7 homeKitAccessoryIdentifier];
      if ([v10 length]) {
        [(NSMutableDictionary *)self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier removeObjectForKey:v10];
      }
      [(NSMutableDictionary *)self->_remotePeerInfoByRapportEffectiveIdentifier removeObjectForKey:v11];
    }
    v5 = v11;
  }
}

- (void)_updateRemotePeerInfo:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 rapportEffectiveIdentifier];
    if (![v6 length])
    {
      v24 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315650;
        v26 = "-[ADDeviceCircleManager _updateRemotePeerInfo:]";
        __int16 v27 = 2112;
        v28 = v5;
        __int16 v29 = 2112;
        v30 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Unable to add or update remote peer info %@ because its rapportEffectiveIdentifier is %@.", (uint8_t *)&v25, 0x20u);
      }
      goto LABEL_24;
    }
    v7 = [(NSMutableDictionary *)self->_remotePeerInfoByRapportEffectiveIdentifier objectForKey:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isEqual:v5])
      {
LABEL_21:

LABEL_24:
        goto LABEL_25;
      }
      [(ADDeviceCircleManager *)self _removeRemotePeerInfoWithRapportEffectiveIdentifier:v6];
    }
    remotePeerInfoByRapportEffectiveIdentifier = self->_remotePeerInfoByRapportEffectiveIdentifier;
    if (!remotePeerInfoByRapportEffectiveIdentifier)
    {
      id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v11 = self->_remotePeerInfoByRapportEffectiveIdentifier;
      self->_remotePeerInfoByRapportEffectiveIdentifier = v10;

      remotePeerInfoByRapportEffectiveIdentifier = self->_remotePeerInfoByRapportEffectiveIdentifier;
    }
    [(NSMutableDictionary *)remotePeerInfoByRapportEffectiveIdentifier setObject:v5 forKey:v6];
    v12 = [v5 idsDeviceUniqueIdentifier];
    if ([v12 length])
    {
      rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier = self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier;
      if (!rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier)
      {
        v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v15 = self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier;
        self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier = v14;

        rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier = self->_rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier;
      }
      [(NSMutableDictionary *)rapportEffectiveIdentifiersByIDSDeviceUniqueIdentifier setObject:v6 forKey:v12];
    }
    v16 = [v5 assistantIdentifier];
    if ([v16 length])
    {
      rapportEffectiveIdentifiersByAssistantIdentifier = self->_rapportEffectiveIdentifiersByAssistantIdentifier;
      if (!rapportEffectiveIdentifiersByAssistantIdentifier)
      {
        v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v19 = self->_rapportEffectiveIdentifiersByAssistantIdentifier;
        self->_rapportEffectiveIdentifiersByAssistantIdentifier = v18;

        rapportEffectiveIdentifiersByAssistantIdentifier = self->_rapportEffectiveIdentifiersByAssistantIdentifier;
      }
      [(NSMutableDictionary *)rapportEffectiveIdentifiersByAssistantIdentifier setObject:v6 forKey:v16];
    }
    v20 = [v5 homeKitAccessoryIdentifier];
    if ([v20 length])
    {
      rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier = self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier;
      if (!rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier)
      {
        v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v23 = self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier;
        self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier = v22;

        rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier = self->_rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier;
      }
      [(NSMutableDictionary *)rapportEffectiveIdentifiersByHomeKitAccessoryIdentifier setObject:v6 forKey:v20];
    }
    [(ADDeviceCircleManager *)self _sendSyncTokenToUpdatedPeer:v5];

    goto LABEL_21;
  }
LABEL_25:
}

- (void)_sendSyncTokenToAccessoryWithHomeKitIdentifier:(id)a3 aceHost:(id)a4 clientLink:(id)a5 transferReason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[ADDeviceCircleManager _sendSyncTokenToAccessoryWithHomeKitIdentifier:aceHost:clientLink:transferReason:]";
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Sending token for aceHost='%@' to peer with HomeKit accessory identifier %@", buf, 0x20u);
  }
  v14 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
  v15 = [v14 getSyncTokenForAceHost:v11];

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v11)
  {
    v21 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADDeviceCircleManager _sendSyncTokenToAccessoryWithHomeKitIdentifier:aceHost:clientLink:transferReason:]";
    v22 = "%s Failed to send sync token as aceHost is nil";
LABEL_13:
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0xCu);
    goto LABEL_14;
  }
  if (!v15)
  {
    v21 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADDeviceCircleManager _sendSyncTokenToAccessoryWithHomeKitIdentifier:aceHost:clientLink:transferReason:]";
    v22 = "%s Failed to send sync token as it is nil";
    goto LABEL_13;
  }
  if (![(ADDeviceCircleManager *)self _doesHomeKitAccessorySupportMUX:v10])
  {
    v21 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADDeviceCircleManager _sendSyncTokenToAccessoryWithHomeKitIdentifier:aceHost:clientLink:transferReason:]";
    v22 = "%s HomeKit accessory does not support MUX";
    goto LABEL_13;
  }
  [v16 setObject:v15 forKey:@"SiriMuxToken"];
  [v16 setObject:v11 forKey:@"SiriMuxTokenHost"];
  v17 = +[NSDate date];
  [v17 timeIntervalSince1970];
  v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v16 setObject:v18 forKey:@"SiriMuxEventTimestamp"];

  v19 = +[NSNumber numberWithInteger:a6];
  [v16 setObject:v19 forKey:@"SiriMuxSyncTokenTransferReason"];

  v20 = [(ADDeviceCircleManager *)self _rapportLinkMessageOptions];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001661E0;
  v23[3] = &unk_100509040;
  id v24 = v11;
  [v12 sendRequestID:@"com.apple.siri.mux.token.exchange" messageType:@"siriMux_tokenExchange" messagePayload:v16 toDeviceWithHomeKitAccessoryIdentifier:v10 options:v20 completion:v23];

LABEL_14:
}

- (BOOL)_doesHomeKitAccessorySupportMUX:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v24 = *(void *)v31;
    int v25 = v5;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "homeKitIdentifier", v24);
        id v12 = v4;
        id v13 = v11;
        if (v13 == v12)
        {

          if (!v4) {
            continue;
          }
LABEL_12:
          id v16 = [v10 siriInfo];
          v14 = [v16 objectForKey:@"deviceCapabilitiesV2"];

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          sub_10026FB40(v14);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          id v17 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v27;
            while (2)
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v12);
                }
                v21 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  BOOL v22 = [v21 supportsMUX] == (id)1;

                  v5 = v25;
                  goto LABEL_28;
                }
              }
              id v18 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v18) {
                continue;
              }
              break;
            }
            uint64_t v8 = v24;
            v5 = v25;
          }
LABEL_22:

          continue;
        }
        v14 = v13;
        if (!v4 || !v13)
        {

          goto LABEL_22;
        }
        unsigned int v15 = [v12 isEqual:v13];

        if (v15) {
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      BOOL v22 = 0;
      if (!v7) {
        goto LABEL_28;
      }
    }
  }
  BOOL v22 = 0;
LABEL_28:

  return v22;
}

- (void)_sendSyncTokenToUpdatedPeer:(id)a3
{
  uint64_t v4 = [(ADDeviceCircleManager *)self _mapPeerToAccessoryWithEnabledPersonalRequests:a3];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(ADDeviceCircleManager *)self _sendSyncTokenToAccessories:v6 transferReason:3];
  }
}

- (id)_mapPeerToAccessoryWithEnabledPersonalRequests:(id)a3
{
  id v4 = a3;
  v5 = +[ADMultiUserMeDevice sharedInstance];
  id v6 = [v5 isMeDevice];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    uint64_t v8 = [v4 homeKitAccessoryIdentifier];

    if (v8)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      int v25 = self;
      id v9 = [(ADDeviceCircleManager *)self personalRequestsEnabledAccessories];
      id v10 = [v9 allObjects];

      id v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            unsigned int v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v16 = [v15 uniqueIdentifier];
            id v17 = [v16 UUIDString];
            id v18 = [v4 homeKitAccessoryIdentifier];
            unsigned int v19 = [v17 isEqual:v18];

            if (v19)
            {
              if ([(ADDeviceCircleManager *)v25 _isSyncTokenAcceptingAccessory:v15])
              {
                id v21 = v15;
              }
              else
              {
                uint64_t v24 = AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  long long v31 = "-[ADDeviceCircleManager _mapPeerToAccessoryWithEnabledPersonalRequests:]";
                  __int16 v32 = 2112;
                  long long v33 = v15;
                  _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Received a syncToken fetch request from a non-HomePod accessory - %@", buf, 0x16u);
                }
                id v21 = 0;
              }

              goto LABEL_15;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      v23 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v31 = "-[ADDeviceCircleManager _mapPeerToAccessoryWithEnabledPersonalRequests:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s PeerInfo doesn't have HomeKit accessory identifier. Failing to map the personal accessory", buf, 0xCu);
      }
    }
  }
  else
  {
    v20 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v31 = "-[ADDeviceCircleManager _mapPeerToAccessoryWithEnabledPersonalRequests:]";
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s This device is not the MeDevice. Mapping peer to personal accessory is bailing out", buf, 0xCu);
    }
  }
  id v21 = 0;
LABEL_15:

  return v21;
}

- (void)sendSyncTokenToPersonalRequestsEnabledAccessories
{
  v3 = +[ADMultiUserMeDevice sharedInstance];
  id v4 = [v3 isMeDevice];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v7 = [(ADDeviceCircleManager *)self personalRequestsEnabledAccessories];
    id v6 = [v7 allObjects];
    [(ADDeviceCircleManager *)self _sendSyncTokenToAccessories:v6 transferReason:1];
  }
}

- (BOOL)_isSyncTokenAcceptingAccessory:(id)a3
{
  v3 = [a3 categoryType];
  unsigned __int8 v4 = [v3 isEqual:HMAccessoryCategoryTypeHomePod];

  return v4;
}

- (void)_sendSyncTokenToAccessories:(id)a3 transferReason:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = +[ADAccount activeAccount];
    uint64_t v8 = [v7 aceHostCluster];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (-[ADDeviceCircleManager _isSyncTokenAcceptingAccessory:](self, "_isSyncTokenAcceptingAccessory:", v14, (void)v16))
          {
            unsigned int v15 = [v14 uniqueIdentifier];
            [(ADDeviceCircleManager *)self _sendSyncTokenToAccessoryWithHomeKitIdentifier:v15 aceHost:v8 clientLink:self->_clientLink transferReason:a4];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)_updateLocalPeerInfo:(id)a3
{
  unsigned __int8 v4 = (AFPeerInfo *)a3;
  localPeerInfo = self->_localPeerInfo;
  if (localPeerInfo != v4 && ([(AFPeerInfo *)localPeerInfo isEqual:v4] & 1) == 0)
  {
    id v6 = self->_localPeerInfo;
    id v7 = v4;
    uint64_t v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      long long v18 = "-[ADDeviceCircleManager _updateLocalPeerInfo:]";
      __int16 v19 = 2112;
      v20 = v6;
      __int16 v21 = 2112;
      BOOL v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ -> %@", buf, 0x20u);
    }
    id v9 = (AFPeerInfo *)[(AFPeerInfo *)v7 copy];
    id v10 = self->_localPeerInfo;
    self->_localPeerInfo = v9;

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100166D80;
    block[3] = &unk_10050DCB8;
    block[4] = self;
    unsigned int v15 = v6;
    long long v16 = v7;
    uint64_t v12 = v7;
    uint64_t v13 = v6;
    dispatch_async(queue, block);
  }
}

- (id)_localPeerInfo
{
  localPeerInfo = self->_localPeerInfo;
  if (!localPeerInfo)
  {
    unsigned __int8 v4 = [(ADDeviceCircleManager *)self _localPeerData];
    unsigned int v5 = sub_100166F18(v4);

    [(ADDeviceCircleManager *)self _updateLocalPeerInfo:v5];
    localPeerInfo = self->_localPeerInfo;
  }
  return localPeerInfo;
}

- (void)_updateSiriInfoWithLocalPeerData:(id)a3
{
  v3 = [a3 buildDictionaryRepresentation];
  unsigned __int8 v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADDeviceCircleManager _updateSiriInfoWithLocalPeerData:]";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Publish peer data %@ to others...", (uint8_t *)&v5, 0x16u);
  }
  +[ADRapportLink updateSiriInfoWithObject:v3 forKey:@"peerData"];
}

- (id)_localPeerData
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100167320;
  v4[3] = &unk_1005042B0;
  v4[4] = self;
  id v2 = +[ADDeviceCirclePeerData newWithBuilder:v4];
  return v2;
}

- (id)_managedPeerInfoMatchingPeerInfo:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2286, @"Invalid parameter not satisfying: %@", @"peerInfoToMatch != nil" object file lineNumber description];
  }
  id v6 = [v5 assistantIdentifier];
  if ([v6 length])
  {
    __int16 v7 = [(ADDeviceCircleManager *)self _managedPeerInfoForAssistantIdentifier:v6];

    if (v7) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  uint64_t v8 = [v5 rapportEffectiveIdentifier];
  if ([v8 length])
  {
    __int16 v7 = [(ADDeviceCircleManager *)self _managedPeerInfoForRapportEffectiveIdentifier:v8];

    if (v7) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v9 = [v5 idsDeviceUniqueIdentifier];
  if (![v9 length])
  {

LABEL_15:
    id v10 = [v5 homeKitAccessoryIdentifier];
    if ([v10 length])
    {
      __int16 v7 = [(ADDeviceCircleManager *)self _managedPeerInfoForHomeKitAccessoryIdentifier:v10];
    }
    else
    {
      __int16 v7 = 0;
    }

    goto LABEL_19;
  }
  __int16 v7 = [(ADDeviceCircleManager *)self _managedPeerInfoForIDSDeviceUniqueIdentifier:v9];

  if (!v7) {
    goto LABEL_15;
  }
LABEL_19:

  return v7;
}

- (id)_managedPeerInfoForRapportEffectiveIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2274, @"Invalid parameter not satisfying: %@", @"[rapportEffectiveIdentifier length] > 0" object file lineNumber description];
  }
  id v6 = [(ADDeviceCircleManager *)self _remotePeerInfoForRapportEffectiveIdentifier:v5];
  if (!v6)
  {
    __int16 v7 = [(ADDeviceCircleManager *)self _localPeerInfo];
    uint64_t v8 = [v7 rapportEffectiveIdentifier];
    unsigned int v9 = [v8 isEqualToString:v5];

    if (v9) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)_managedPeerInfoForHomeKitAccessoryIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2262, @"Invalid parameter not satisfying: %@", @"[homeKitAccessoryIdentifier length] > 0" object file lineNumber description];
  }
  id v6 = [(ADDeviceCircleManager *)self _remotePeerInfoForHomeKitAccessoryIdentifier:v5];
  if (!v6)
  {
    __int16 v7 = [(ADDeviceCircleManager *)self _localPeerInfo];
    uint64_t v8 = [v7 homeKitAccessoryIdentifier];
    unsigned int v9 = [v8 isEqualToString:v5];

    if (v9) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)_managedPeerInfoForIDSDeviceUniqueIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2250, @"Invalid parameter not satisfying: %@", @"[idsDeviceUniqueIdentifier length] > 0" object file lineNumber description];
  }
  id v6 = [(ADDeviceCircleManager *)self _remotePeerInfoForIDSDeviceUniqueIdentifier:v5];
  if (!v6)
  {
    __int16 v7 = [(ADDeviceCircleManager *)self _localPeerInfo];
    uint64_t v8 = [v7 idsDeviceUniqueIdentifier];
    unsigned int v9 = [v8 isEqualToString:v5];

    if (v9) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)_managedPeerInfoForAssistantIdentifier:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ADDeviceCircleManager.m", 2237, @"Invalid parameter not satisfying: %@", @"[assistantIdentifier length] > 0" object file lineNumber description];
  }
  id v6 = [v5 uppercaseString];
  id v7 = [(ADDeviceCircleManager *)self _remotePeerInfoForAssistantIdentifier:v6];
  if (!v7)
  {
    uint64_t v8 = [(ADDeviceCircleManager *)self _localPeerInfo];
    unsigned int v9 = [v8 assistantIdentifier];
    unsigned int v10 = [v9 isEqualToString:v6];

    if (v10) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
  }
  return v7;
}

- (id)_keepAliveLinkToDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[ADRapportLinkConfiguration newWithBuilder:&stru_100504268];
  id v6 = [[ADRapportLink alloc] initWithQueue:self->_queue configuration:v5];
  [(ADRapportLink *)v6 setServiceType:@"com.apple.siri.wakeup"];
  [(ADRapportLink *)v6 setDestinationDevice:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100167BB0;
  v9[3] = &unk_10050C610;
  id v10 = v4;
  id v7 = v4;
  [(ADRapportLink *)v6 activateWithCompletion:v9];

  return v6;
}

- (void)_updateDeviceCountTrend
{
  v3 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v4 = [v3 count];

  id v5 = +[NSDate date];
  id v6 = objc_alloc_init(ADDeviceCountAndTimestamp);
  [(ADDeviceCountAndTimestamp *)v6 setDeviceCount:v4];
  [(ADDeviceCountAndTimestamp *)v6 setTimestamp:v5];
  id v7 = [(NSMutableArray *)self->_deviceCountTrend count];
  deviceCountTrend = self->_deviceCountTrend;
  if (v7)
  {
    unsigned int v9 = [(NSMutableArray *)deviceCountTrend lastObject];
    id v10 = [v9 deviceCount];
    id v11 = [v9 timestamp];
    [v5 timeIntervalSinceDate:v11];
    double v13 = v12;
    if ([(NSMutableArray *)self->_deviceCountTrend indexOfObjectPassingTest:&stru_100504248] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v4 > v10 || v13 > 60.0) {
        [(NSMutableArray *)self->_deviceCountTrend removeAllObjects];
      }
      [(NSMutableArray *)self->_deviceCountTrend addObject:v6];
      goto LABEL_23;
    }
    if (v4 < v10)
    {
LABEL_23:

      goto LABEL_24;
    }
    v14 = [(NSMutableArray *)self->_deviceCountTrend firstObject];
    unsigned int v15 = [v14 deviceCount];
    unint64_t v16 = v4 - v15;
    if (v4 - v15 < 0) {
      unint64_t v16 = v15 - v4;
    }
    if (v16 <= 1 && (unint64_t)v4 > 2 || v4 == (unsigned char *)2 && v15 == (unsigned char *)2)
    {
      if (v13 <= 60.0)
      {
        long long v17 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v18 = 136315138;
          __int16 v19 = "-[ADDeviceCircleManager _updateDeviceCountTrend]";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s #hal Local device likely has dropped out of network and back in. Adding 5 point penalty", (uint8_t *)&v18, 0xCu);
        }
        self->_rapportInstabilityPenalty += 5;
      }
    }
    else if (!v10 || v13 <= 60.0)
    {
      goto LABEL_22;
    }
    [(NSMutableArray *)self->_deviceCountTrend removeAllObjects];
LABEL_22:
    [(NSMutableArray *)self->_deviceCountTrend addObject:v6];

    goto LABEL_23;
  }
  [(NSMutableArray *)deviceCountTrend addObject:v6];
LABEL_24:
}

- (void)_updateStationaryScore
{
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0;
  char v23 = 0;
  id v3 = objc_alloc_init((Class)SiriCoreWiFiManagerClient);
  id v21 = 0;
  id v22 = 0;
  [v3 hasAssociatedNetworkWithRSSI:&v26 andSNR:&v25 andCCA:&v24 andPhyMode:&v22 andChannelInfo:&v21 isCaptive:&v23];
  id v4 = v22;
  id v5 = v21;
  self->_rollingRSSI = (float)((float)v26 + (float)(self->_rollingRSSI * (float)self->_rollingRSSICount))
                     / (float)(self->_rollingRSSICount + 1);
  id v6 = sub_1001FD474(@"assistantdDidLaunch");
  id v7 = +[NSDate date];
  [v7 timeIntervalSinceDate:v6];
  float v9 = v8 / 3600.0;

  float v10 = log((float)((float)(v9 * 2.0) + 1.0));
  id v11 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v12 = [v11 count];

  if (AFIsHorseman()) {
    unint64_t v13 = 20;
  }
  else {
    unint64_t v13 = 0;
  }
  v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    unint64_t rapportInstabilityPenalty = self->_rapportInstabilityPenalty;
    *(_DWORD *)buf = 136316162;
    long long v28 = "-[ADDeviceCircleManager _updateStationaryScore]";
    __int16 v29 = 2048;
    double v30 = v10;
    __int16 v31 = 2048;
    unint64_t v32 = rapportInstabilityPenalty;
    __int16 v33 = 2048;
    id v34 = v12;
    __int16 v35 = 2048;
    unint64_t v36 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s #hal normalized assistantd longevity score: %f, rapport link penalty: %lu, # devices seen: %lu, device boost: %lu", buf, 0x34u);
  }
  unint64_t rollingRSSICount = self->_rollingRSSICount;
  self->_float currentStationaryScore = (float)((float)((float)(self->_rollingRSSI + v10)
                                                - (float)((float)self->_rapportInstabilityPenalty - v10))
                                        + (float)(unint64_t)(2 * (void)v12))
                                + (float)v13;
  self->_unint64_t rollingRSSICount = rollingRSSICount + 1;
  unint64_t v16 = +[ADRapportLink siriInfoToBeBroadcasted];
  long long v17 = [v16 objectForKey:@"stationaryScore"];

  if (!v17
    || (float currentStationaryScore = self->_currentStationaryScore,
        [v17 floatValue],
        vabds_f32(currentStationaryScore, v19) >= 25.0))
  {
    [(ADDeviceCircleManager *)self _updateClientLinkSiriInfo];
  }
}

- (void)_updateStationaryScoreAndResetTimer
{
  [(ADDeviceCircleManager *)self _stopStationaryScoreTimer];
  [(ADDeviceCircleManager *)self _updateStationaryScore];
  [(ADDeviceCircleManager *)self _startStationaryScoreTimer];
}

- (void)_updateStationaryScoreBroadcasting
{
  if ([(ADDeviceCircleManager *)self _isLocalDeviceCollectorCandidate]
    && ([(ADRapportLink *)self->_clientLink activeDevices],
        id v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        v4))
  {
    if (!self->_stationaryScoreTimer)
    {
      [(ADDeviceCircleManager *)self _updateStationaryScoreAndResetTimer];
    }
  }
  else
  {
    [(ADDeviceCircleManager *)self _stopStationaryScoreTimer];
  }
}

- (void)_stopStationaryScoreTimer
{
  stationaryScoreTimer = self->_stationaryScoreTimer;
  if (stationaryScoreTimer)
  {
    [(AFWatchdogTimer *)stationaryScoreTimer cancel];
    id v4 = self->_stationaryScoreTimer;
    self->_stationaryScoreTimer = 0;
  }
}

- (void)_startStationaryScoreTimer
{
  if (!self->_stationaryScoreTimer)
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc((Class)AFWatchdogTimer);
    queue = self->_queue;
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    float v9 = sub_1001684B8;
    float v10 = &unk_10050B790;
    objc_copyWeak(&v11, &location);
    id v5 = (AFWatchdogTimer *)[v3 initWithTimeoutInterval:queue onQueue:&v7 timeoutHandler:600.0];
    stationaryScoreTimer = self->_stationaryScoreTimer;
    self->_stationaryScoreTimer = v5;

    [(AFWatchdogTimer *)self->_stationaryScoreTimer start];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)isMeDeviceDidChange:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    float v9 = "-[ADDeviceCircleManager isMeDeviceDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100168624;
  block[3] = &unk_10050B790;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)sharedDataDidChange:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    float v10 = "-[ADDeviceCircleManager sharedDataDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ((AFIsNano() & 1) == 0)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001687D4;
    v7[3] = &unk_10050C7C8;
    v7[4] = self;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_async(queue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)myriadTrialBoostsUpdated:(id)a3
{
  id v4 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = +[ADMyriadSettingsManager sharedSettingsManager];
    id v7 = [v6 treatmentId];
    int v10 = 136315394;
    id v11 = "-[ADDeviceCircleManager myriadTrialBoostsUpdated:]";
    __int16 v12 = 2112;
    unint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Trial Boost Notification Recieved For TreatmentID: %@", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [(ADDeviceCircleManager *)self _syncCompanionLinkDeviceLocalPeerData];
  float v9 = [(ADDeviceCircleManager *)self _localPeerData];
  [(ADDeviceCircleManager *)self _updateSiriInfoWithLocalPeerData:v9];
}

- (void)_updateCurrentAccessoryInfo:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    unsigned int v15 = "-[ADDeviceCircleManager _updateCurrentAccessoryInfo:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s currentAccessoryInfo = %@", (uint8_t *)&v14, 0x16u);
  }
  id v6 = [(ADRapportLink *)self->_clientLink localDevice];
  id v7 = self->_currentAccessoryInfo;
  id v8 = (AFHomeAccessoryInfo *)v4;
  float v9 = v8;
  if (v7 == v8)
  {
  }
  else
  {
    if (v8 && v7)
    {
      unsigned __int8 v10 = [(AFHomeAccessoryInfo *)v7 isEqual:v8];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v11 = (AFHomeAccessoryInfo *)[(AFHomeAccessoryInfo *)v9 copy];
    currentAccessoryInfo = self->_currentAccessoryInfo;
    self->_currentAccessoryInfo = v11;

    id v13 = [(ADDeviceCircleManager *)self _syncCompanionLinkDeviceLocalPeerData];
  }
LABEL_11:
}

- (void)_updateAssistantIdentifierAndSharedUserIdentifier
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100168D48;
  v9[3] = &unk_1005041E0;
  void v9[4] = self;
  id v3 = objc_retainBlock(v9);
  id v4 = +[AFPreferences sharedPreferences];
  unsigned int v5 = [v4 assistantIsEnabled];

  if (v5)
  {
    id v6 = +[ADCommandCenter sharedCommandCenter];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100168ECC;
    v7[3] = &unk_100509930;
    v7[4] = self;
    id v8 = v3;
    [v6 fetchActiveAccount:v7];
  }
  else
  {
    ((void (*)(void *, void, void))v3[2])(v3, 0, 0);
  }
}

- (void)preferencesSharedUserIdentifierDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100169090;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)activeAccountIdentifierDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016910C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)preferencesEnabledBitsDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100169188;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)homeInfoManager:(id)a3 didUpdateCurrentAccessoryInfo:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016925C;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void (**)(id, uint64_t, void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v12 isEqualToString:@"svdCapabilities_fetch"] && self->_isCollector)
  {
    uint64_t v15 = [(ADDeviceCircleManager *)self _handleSVDCapabilitiesFetch:v11 fromPeer:v13];
LABEL_9:
    __int16 v16 = (void *)v15;
    v14[2](v14, v15, 0);
LABEL_10:

    goto LABEL_11;
  }
  if ([v12 isEqualToString:@"device_capabilities_fetch"] && self->_isCollector)
  {
    uint64_t v15 = [(ADDeviceCircleManager *)self _handleDeviceCapabilitiesFetch:v11 fromPeer:v13];
    goto LABEL_9;
  }
  if ([v12 isEqualToString:@"peers_svdCapabilities_fetch"])
  {
    uint64_t v15 = [(ADDeviceCircleManager *)self _handlePeersAndSVDCapabilitiesFetch:v11 fromPeer:v13];
    goto LABEL_9;
  }
  if ([v12 isEqualToString:@"execute_command_request"])
  {
    [(ADDeviceCircleManager *)self _handleExecuteCommand:v11 fromPeer:v13 completion:v14];
    goto LABEL_11;
  }
  if ([v12 isEqualToString:@"siriMux_tokenExchange"])
  {
    id v17 = [v11 objectForKey:@"SiriMuxEventTimestamp"];
    +[ADMUXReverseSyncInstrumentationUtil logSyncTokenFetchRequestReceivedRequestCreatedAt:v17];

    __int16 v16 = [(ADDeviceCircleManager *)self _mapPeerToAccessoryWithEnabledPersonalRequests:v13];
    if (v16)
    {
      int v18 = +[ADMUXCompanionSyncTokenContainer sharedInstance];
      [v18 handleMuxTokenExchangeMessage:v11 fromPeer:v13 completion:v14];
    }
    else
    {
      long long v27 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        long long v28 = v27;
        __int16 v29 = [v13 idsDeviceUniqueIdentifier];
        *(_DWORD *)buf = 136315394;
        __int16 v33 = "-[ADDeviceCircleManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
        __int16 v34 = 2112;
        id v35 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Received token fetch request from unexpected device with IDS identifier=%@", buf, 0x16u);
      }
      int v18 = +[AFError errorWithCode:8000];
      ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v18);
    }

    goto LABEL_10;
  }
  float v19 = [(NSMapTable *)self->_requestHandlers keyEnumerator];
  v20 = [v19 allObjects];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100169730;
  v30[3] = &unk_1005041B8;
  id v21 = v12;
  id v31 = v21;
  id v22 = objc_msgSend(v20, "af_firstObjectPassingTest:", v30);

  char v23 = [(NSMapTable *)self->_requestHandlers objectForKey:v22];
  uint64_t v24 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[ADDeviceCircleManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
    __int16 v34 = 2112;
    id v35 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback handler:%@", buf, 0x16u);
  }
  if ([v23 conformsToProtocol:&OBJC_PROTOCOL___ADDeviceCircleRequestHandler])
  {
    id v25 = v23;
    if (objc_opt_respondsToSelector()) {
      [v25 handle:v11 fromPeer:v13 completion:v14];
    }
  }
  else
  {
    uint64_t v26 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v33 = "-[ADDeviceCircleManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
      __int16 v34 = 2112;
      id v35 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s #hal Unexpected message type: %@", buf, 0x16u);
    }
    id v25 = +[AFError errorWithCode:1014];
    ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v25);
  }

LABEL_11:
}

- (void)_handleExecuteCommand:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v12 = +[ADFMDMonitor sharedManager];
  unsigned int v13 = [v12 isLostModeActive];

  if (!v13)
  {
    if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled])
    {
      uint64_t v15 = [v8 objectForKeyedSubscript:@"recipient_assistant_identifier"];
      if ([v15 length])
      {
        __int16 v16 = [(ADDeviceCircleManager *)self _localPeerData];
        id v17 = [v16 assistantIdentifier];
        unsigned __int8 v18 = [v15 isEqualToString:v17];

        if ((v18 & 1) == 0)
        {
          long long v28 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
            __int16 v45 = 2112;
            v46 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s #hal Received execute command with recipient of %@. Will attempt to forward.", buf, 0x16u);
          }
          __int16 v29 = [(ADDeviceCircleManager *)self _managedPeerInfoForAssistantIdentifier:v15];
          if (v29)
          {
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_100169FB4;
            v38[3] = &unk_100504BB8;
            id v39 = v15;
            id v40 = v10;
            [(ADDeviceCircleManager *)self _forwardExecuteCommandToDevice:v39 message:v8 from:v9 completion:v38];

            double v30 = v39;
          }
          else
          {
            __int16 v34 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
              __int16 v45 = 2112;
              v46 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s #hal Unable to find recipient peerInfo with assistantId: %@.", buf, 0x16u);
            }
            double v30 = +[AFError errorWithCode:1017];
            (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v30);
          }

          goto LABEL_45;
        }
      }
    }
    uint64_t v15 = [v8 objectForKeyedSubscript:@"serialized_command"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = 0;
      goto LABEL_16;
    }
    float v19 = +[AceObject aceObjectWithPlistData:v15];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [v19 dictionary];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v31 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s Invalid command received. Ignoring.", buf, 0xCu);
        }
        CFStringRef v41 = @"execute_command_response";
        id v32 = objc_alloc_init((Class)SACommandIgnored);
        __int16 v33 = [v32 dictionary];
        v42 = v33;
        uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

        if (v10) {
          (*((void (**)(id, ADPeerInfo *, void))v10 + 2))(v10, v26, 0);
        }
        goto LABEL_43;
      }

LABEL_16:
      float v19 = [v8 objectForKeyedSubscript:@"execution_context"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v21 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Received malformed execution context. Continuing with execution.", buf, 0xCu);
        }

        float v19 = 0;
      }
      id v22 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s Dispatching commandDict to ADCommandCenter", buf, 0xCu);
        if (v19) {
          goto LABEL_22;
        }
      }
      else if (v19)
      {
LABEL_22:
        id v23 = [objc_alloc((Class)AFCommandExecutionInfo) initWithDictionaryRepresentation:v19];
        uint64_t v24 = [ADPeerInfo alloc];
        id v25 = [v23 originPeerInfo];
        uint64_t v26 = [(ADPeerInfo *)v24 initWithAFPeerInfo:v25];

LABEL_42:
        id v35 = +[ADCommandCenter sharedCommandCenter];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10016A0BC;
        v36[3] = &unk_100504BB8;
        v36[4] = self;
        id v37 = v10;
        [v35 executeCommand:v20 fromPeer:v26 remoteExecutionInfo:v19 reply:v36];

        goto LABEL_43;
      }
      uint64_t v26 = 0;
      goto LABEL_42;
    }
    long long v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Invalid command received. Ignoring.", buf, 0xCu);
      if (v10) {
        goto LABEL_25;
      }
    }
    else if (v10)
    {
LABEL_25:
      uint64_t v26 = +[AFError errorWithCode:1015];
      (*((void (**)(id, void, ADPeerInfo *))v10 + 2))(v10, 0, v26);
      v20 = 0;
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }
    v20 = 0;
    goto LABEL_44;
  }
  int v14 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[ADDeviceCircleManager _handleExecuteCommand:fromPeer:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Lost mode is active, rejecting incoming request", buf, 0xCu);
    if (!v10) {
      goto LABEL_46;
    }
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v15 = +[AFError errorWithCode:1003];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
LABEL_45:
  }
LABEL_46:
}

- (id)_handleDeviceCapabilitiesFetch:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKey:@"get_capabilities_for_devices"];
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    long long v28 = "-[ADDeviceCircleManager _handleDeviceCapabilitiesFetch:fromPeer:]";
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal capabilities fetch request from %@: %@", buf, 0x20u);
  }
  v20 = v6;
  id v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "idsDeviceIdentifier", v20);
        if ([v7 containsObject:v15])
        {
          __int16 v16 = [v14 siriInfo];
          id v17 = [v16 objectForKey:@"deviceCapabilities"];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v21 setObject:v17 forKey:v15];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v18 = [v21 copy];
  return v18;
}

- (id)_handlePeersAndSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = +[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled];
  id v7 = AFSiriLogContextDaemon;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[ADDeviceCircleManager _handlePeersAndSVDCapabilitiesFetch:fromPeer:]";
      __int16 v47 = 2112;
      id v48 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s #hal Peers and SVD capabilities fetch request from %@: ", buf, 0x16u);
    }
    id v34 = v5;
    id v35 = objc_opt_new();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    __int16 v33 = self;
    id v8 = [(ADRapportLink *)self->_clientLink activeDevices];
    id v9 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          int v14 = [v13 idsDeviceIdentifier];
          uint64_t v15 = sub_10016A850(v14);

          __int16 v16 = [v15 assistantIdentifier];
          id v17 = [v16 length];

          if (v17)
          {
            id v18 = [v13 siriInfo];
            float v19 = [v18 objectForKey:@"deviceCapabilitiesV2"];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v42[0] = @"peerData";
              v20 = [v15 buildDictionaryRepresentation];
              v42[1] = @"deviceCapabilitiesV2";
              v43[0] = v20;
              v43[1] = v19;
              id v21 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];

              long long v22 = [v15 assistantIdentifier];
              [v35 setObject:v21 forKey:v22];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v10);
    }

    long long v23 = [(ADRapportLink *)v33->_clientLink localDevice];

    if (v23)
    {
      long long v24 = [(ADDeviceCircleManager *)v33 localPeerInfo];
      long long v25 = [(ADRapportLink *)v33->_clientLink localDevice];
      uint64_t v26 = [v25 siriInfo];
      long long v27 = [v26 objectForKey:@"deviceCapabilitiesV2"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40[0] = @"peerData";
        long long v28 = [v24 buildDictionaryRepresentation];
        v40[1] = @"deviceCapabilitiesV2";
        v41[0] = v28;
        v41[1] = v27;
        __int16 v29 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

        id v30 = [v24 assistantIdentifier];
        [v35 setObject:v29 forKey:v30];
      }
    }
    id v31 = [v35 copy];

    id v5 = v34;
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[ADDeviceCircleManager _handlePeersAndSVDCapabilitiesFetch:fromPeer:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s #hal Peers and SVD capabilities fetch request not supported on this device.", buf, 0xCu);
    }
    id v31 = &__NSDictionary0__struct;
  }

  return v31;
}

- (id)_handleSVDCapabilitiesFetch:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKey:@"get_capabilities_for_assistant_identifiers"];
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v30 = "-[ADDeviceCircleManager _handleSVDCapabilitiesFetch:fromPeer:]";
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s #hal SVD capabilities fetch request from %@: %@", buf, 0x20u);
  }
  long long v22 = v6;
  id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "effectiveIdentifier", v22);
        __int16 v16 = [(ADDeviceCircleManager *)self _managedPeerInfoForRapportEffectiveIdentifier:v15];
        id v17 = [v16 assistantIdentifier];

        if ([v7 containsObject:v17])
        {
          id v18 = [v14 siriInfo];
          float v19 = [v18 objectForKey:@"deviceCapabilitiesV2"];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v23 setObject:v19 forKey:v17];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  id v20 = [v23 copy];
  return v20;
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceCircleManager rapportLinkDidInvalidate:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s #hal", (uint8_t *)&v5, 0xCu);
  }
  [(ADDeviceCircleManager *)self _resetRapportLinkAndReconnectNow:0];
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADDeviceCircleManager rapportLinkDidInterrupt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s #hal", (uint8_t *)&v5, 0xCu);
  }
  [(ADDeviceCircleManager *)self _resetRapportLinkAndReconnectNow:1];
}

- (void)_resetRapportLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  currentCollectorIDs = self->_currentCollectorIDs;
  self->_currentCollectorIDs = 0;

  self->_isCollector = 0;
  [(ADRapportLink *)self->_clientLink removeListener:self];
  [(ADRapportLink *)self->_clientLink invalidate];
  clientLink = self->_clientLink;
  self->_clientLink = 0;

  self->_rapportInstabilityPenalty += 10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10016B24C;
  v13[3] = &unk_10050E138;
  v13[4] = self;
  id v7 = objc_retainBlock(v13);
  id v8 = v7;
  if (v3)
  {
    ((void (*)(void *))v7[2])(v7);
  }
  else
  {
    dispatch_time_t v9 = dispatch_time(0, 20000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016B2A8;
    block[3] = &unk_10050E188;
    void block[4] = self;
    id v12 = v8;
    dispatch_after(v9, queue, block);
  }
}

- (void)rapportLink:(id)a3 didUpdateLocalDevice:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    dispatch_time_t v9 = "-[ADDeviceCircleManager rapportLink:didUpdateLocalDevice:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s #hal %@", (uint8_t *)&v8, 0x16u);
  }
  [(ADDeviceCircleManager *)self _updateStationaryScoreBroadcasting];
  [(ADDeviceCircleManager *)self _reelectCollectorIfNecessary];
  id v7 = [(ADDeviceCircleManager *)self _syncCompanionLinkDeviceLocalPeerData];
}

- (void)rapportLink:(id)a3 didUpdateDevice:(id)a4 changes:(unsigned int)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    __int16 v16 = "-[ADDeviceCircleManager rapportLink:didUpdateDevice:changes:]";
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s #hal %@", (uint8_t *)&v15, 0x16u);
  }
  unsigned int v11 = [(ADDeviceCircleManager *)self _isRemoteDeviceCollectorCandidate:v9];
  if ((v5 & 2) != 0 && v11) {
    [(ADDeviceCircleManager *)self _reelectCollectorIfNecessary];
  }
  id v12 = sub_10016B52C(v9, 0);
  os_unfair_lock_lock(&self->_peerInfoLock);
  [(ADDeviceCircleManager *)self _updateRemotePeerInfo:v12];
  os_unfair_lock_unlock(&self->_peerInfoLock);
  unsigned int v13 = [v12 assistantIdentifier];
  int v14 = [v12 idsDeviceUniqueIdentifier];
  [(ADDeviceCircleManager *)self _setAssistantId:v13 forDeviceWithIdsDeviceUniqueIdentifier:v14];
}

- (void)rapportLink:(id)a3 didLoseDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    unsigned int v13 = "-[ADDeviceCircleManager rapportLink:didLoseDevice:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #hal %@", (uint8_t *)&v12, 0x16u);
  }
  currentCollectorIDs = self->_currentCollectorIDs;
  __int16 v10 = [v7 idsDeviceIdentifier];
  LODWORD(currentCollectorIDs) = [(NSArray *)currentCollectorIDs containsObject:v10];

  if (currentCollectorIDs) {
    [(ADDeviceCircleManager *)self _reelectCollectorDeviceForReason:3 completion:0];
  }
  else {
    [(ADDeviceCircleManager *)self _updateStationaryScoreBroadcasting];
  }
  [(ADDeviceCircleManager *)self _updateDeviceCountTrend];
  os_unfair_lock_lock(&self->_peerInfoLock);
  unsigned int v11 = [v7 effectiveIdentifier];
  [(ADDeviceCircleManager *)self _removeRemotePeerInfoWithRapportEffectiveIdentifier:v11];

  os_unfair_lock_unlock(&self->_peerInfoLock);
}

- (void)rapportLink:(id)a3 didFindDevice:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    unsigned int v11 = "-[ADDeviceCircleManager rapportLink:didFindDevice:]";
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s #hal %@", (uint8_t *)&v10, 0x16u);
  }
  [(ADDeviceCircleManager *)self _updateStationaryScoreBroadcasting];
  [(ADDeviceCircleManager *)self _reelectCollectorIfNecessary];
  [(ADDeviceCircleManager *)self _updateDeviceCountTrend];
  id v7 = sub_10016B52C(v5, 0);
  os_unfair_lock_lock(&self->_peerInfoLock);
  [(ADDeviceCircleManager *)self _updateRemotePeerInfo:v7];
  os_unfair_lock_unlock(&self->_peerInfoLock);
  id v8 = [v7 assistantIdentifier];
  id v9 = [v7 idsDeviceUniqueIdentifier];
  [(ADDeviceCircleManager *)self _setAssistantId:v8 forDeviceWithIdsDeviceUniqueIdentifier:v9];
}

- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 fromCollectorWithIndex:(unint64_t)a4 existingCapabilities:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  __int16 v12 = (void (**)(id, id))a6;
  if ([(NSArray *)self->_currentCollectorIDs count] <= a4)
  {
    v12[2](v12, v11);
  }
  else if ([v10 count])
  {
    long long v24 = [(NSArray *)self->_currentCollectorIDs objectAtIndex:a4];
    id v13 = objc_alloc_init((Class)NSMutableSet);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10016C620;
    v33[3] = &unk_1005044E0;
    id v14 = v10;
    id v34 = v14;
    id v15 = v13;
    id v35 = v15;
    long long v36 = self;
    unint64_t v39 = a4;
    id v16 = v11;
    id v37 = v16;
    long long v38 = v12;
    __int16 v17 = objc_retainBlock(v33);
    long long v25 = objc_msgSend(v14, "af_lenientMappedArray:", &stru_100504120);
    clientLink = self->_clientLink;
    CFStringRef v40 = @"get_capabilities_for_assistant_identifiers";
    CFStringRef v41 = v25;
    id v18 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    float v19 = [(ADDeviceCircleManager *)self _rapportLinkMessageOptions];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10016C710;
    v26[3] = &unk_100504190;
    id v27 = v14;
    id v28 = v16;
    id v29 = v15;
    id v30 = self;
    id v31 = v24;
    id v32 = v17;
    id v20 = v24;
    id v21 = v17;
    id v22 = v15;
    [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.rapport-link.request.device-circle-manager" messageType:@"svdCapabilities_fetch" messagePayload:v18 toDeviceWithIDSDeviceID:v20 options:v19 completion:v26];
  }
  else
  {
    v12[2](v12, 0);
  }
}

- (void)_fetchDeviceCapabilitiesForDevices:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10016CF1C;
    v9[3] = &unk_10050D080;
    id v10 = v7;
    [(ADDeviceCircleManager *)self _fetchDeviceCapabilitiesForDevices:v6 fromCollectorWithIndex:0 existingCapabilities:v8 completion:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_updateSiriInfoWithDeviceCapabilities
{
  if (!AFSupportsHALCapabilitiesDonation()) {
    return;
  }
  BOOL v3 = +[AFInstanceContext currentContext];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[AFPreferences sharedPreferences];
  if ([v5 assistantIsEnabled]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }

  id v7 = [objc_alloc((Class)SVDAssistantEnabledCapability) initWithStatus:v6];
  [v4 addObject:v7];
  if ((AFIsATV() & 1) == 0)
  {
    id v8 = [objc_alloc((Class)SVDAlarmTimerIntentsHandlingCapability) initWithStatus:1];
    [v4 addObject:v8];
  }
  if (AFIsATV())
  {
    id v9 = [objc_alloc((Class)SVDAppLaunchCapability) initWithStatus:1];
    [v4 addObject:v9];
    id v10 = [objc_alloc((Class)SVDVideoPlaybackCapability) initWithStatus:1];
    [v4 addObject:v10];
    id v11 = [objc_alloc((Class)SVDSeymourRoutingCapability) initWithStatus:1];
    [v4 addObject:v11];
    if (+[AFFeatureFlags isLassoEnabled])
    {
      id v12 = [objc_alloc((Class)SVDProfileSwitchingCapability) initWithStatus:1];
      [v4 addObject:v12];
    }
  }
  else
  {
    if (!AFIsHorseman() || (AFIsHorseman() & 1) == 0 && !AFIsIOS()) {
      goto LABEL_16;
    }
    id v9 = [objc_alloc((Class)SVDCustomTimerIntentHandlingCapability) initWithStatus:1];
    [v4 addObject:v9];
  }

LABEL_16:
  svdCapabilities = self->_svdCapabilities;
  p_svdCapabilities = &self->_svdCapabilities;
  if (![(NSArray *)svdCapabilities isEqualToArray:v4])
  {
    id v15 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315394;
      id v18 = "-[ADDeviceCircleManager _updateSiriInfoWithDeviceCapabilities]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s #hal Updating device capabilities V2 to %@", (uint8_t *)&v17, 0x16u);
    }
    id v16 = objc_msgSend(v4, "af_lenientMappedArray:", &stru_1005084D8);
    +[ADRapportLink updateSiriInfoWithObject:v16 forKey:@"deviceCapabilitiesV2"];
    objc_storeStrong((id *)p_svdCapabilities, v4);
  }
}

- (void)_executeCommandThroughOnDemandClientLinkToContextCollector:(id)a3 onPeer:(id)a4 debugID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (AFSupportsHALOnDemandRapportConnection())
  {
    id obj = [(ADDeviceCircleManager *)self _setUpOnDemandClientLinkToContextCollector];
    [(ADRapportLink *)self->_onDemandClientLinkToContextCollector invalidate];
    objc_storeStrong((id *)&self->_onDemandClientLinkToContextCollector, obj);
    id v14 = +[NSMutableDictionary dictionaryWithDictionary:v10];
    id v15 = [v11 assistantIdentifier];

    if (v15)
    {
      id v16 = [v11 assistantIdentifier];
      [v14 setObject:v16 forKeyedSubscript:@"recipient_assistant_identifier"];
    }
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = sub_10016D65C;
    v47[4] = sub_10016D66C;
    id v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_10016D65C;
    v45[4] = sub_10016D66C;
    id v46 = 0;
    id v17 = objc_alloc((Class)AFSafetyBlock);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10016D674;
    v38[3] = &unk_100504068;
    id v18 = v12;
    id v39 = v18;
    id v40 = 0;
    CFStringRef v41 = self;
    id v42 = v13;
    v43 = v47;
    v44 = v45;
    id v19 = [v17 initWithBlock:v38];
    id v20 = objc_alloc((Class)AFWatchdogTimer);
    queue = self->_queue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10016D7E4;
    v36[3] = &unk_10050E138;
    id v22 = v19;
    id v37 = v22;
    id v23 = [v20 initWithTimeoutInterval:queue onQueue:v36 timeoutHandler:1.7];
    [v23 start];
    long long v24 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[ADDeviceCircleManager _executeCommandThroughOnDemandClientLinkToContextCollector:onPeer:debugID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s #hal activating #on-demand connection to context collector...", buf, 0xCu);
    }
    onDemandClientLinkToContextCollector = self->_onDemandClientLinkToContextCollector;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10016D824;
    v30[3] = &unk_1005040E0;
    void v30[4] = self;
    id v34 = v45;
    id v26 = v22;
    id v31 = v26;
    id v27 = v14;
    id v32 = v27;
    id v33 = v18;
    id v35 = v47;
    [(ADDeviceCircleManager *)self _activateOnDemandClientLinkToContextCollector:onDemandClientLinkToContextCollector completion:v30];

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);
  }
  else
  {
    id v28 = +[AFError errorWithCode:13];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v28);
  }
}

- (void)_executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandConnectionToContextCollector:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[ADDeviceCircleManager _executeCommand:onPeer:executionContext:throughOnDemandConnectionToContextCollector:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v12 && v13)
  {
    queue = self->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10016DE6C;
    v19[3] = &unk_1005065D0;
    id v20 = v14;
    id v21 = self;
    id v22 = v12;
    id v23 = v13;
    BOOL v25 = a6;
    id v24 = v15;
    dispatch_async(queue, v19);

    id v18 = v20;
  }
  else
  {
    id v18 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:31 userInfo:0];
    if (v15) {
      (*((void (**)(id, void *, void *))v15 + 2))(v15, &__NSDictionary0__struct, v18);
    }
  }
}

- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 throughOnDemandRapportConnection:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  if (AFSupportsHALOnDemandRapportConnection())
  {
    [(ADDeviceCircleManager *)self _executeCommand:v14 onPeer:v10 executionContext:v11 throughOnDemandConnectionToContextCollector:1 completion:v12];
  }
  else if (v12)
  {
    id v13 = +[AFError errorWithCode:13];
    v12[2](v12, 0, v13);
  }
}

- (void)executeCommand:(id)a3 onPeer:(id)a4 executionContext:(id)a5 completion:(id)a6
{
}

- (void)_reelectCollectorDeviceForReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  if (AFSupportsHALContextCollectorElection())
  {
    id v7 = [(ADRapportLink *)self->_clientLink localDevice];
    id v8 = [v7 idsDeviceIdentifier];
    v93 = self;
    unsigned int v9 = [(ADDeviceCircleManager *)self _isLocalDeviceCollectorCandidate];
    id v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 > 5) {
        id v11 = 0;
      }
      else {
        id v11 = off_100504320[a3];
      }
      *(_DWORD *)buf = 136315394;
      v123 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
      __int16 v124 = 2112;
      v125 = v11;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s #hal Re-election reason: %@", buf, 0x16u);
    }
    id v13 = [(ADRapportLink *)v93->_clientLink activeDevices];

    if (!v13)
    {
      id v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v123 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s #hal No other devices nearby", buf, 0xCu);
      }
      if (v93->_isCollector)
      {
        BOOL isCollector = 1;
      }
      else
      {
        currentCollectorIDs = v93->_currentCollectorIDs;
        if (currentCollectorIDs)
        {
          v93->_currentCollectorIDs = 0;

          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v23 = v93->_listeners;
          id v24 = [(NSHashTable *)v23 countByEnumeratingWithState:&v116 objects:v130 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v117;
            do
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(void *)v117 != v26) {
                  objc_enumerationMutation(v23);
                }
                [*(id *)(*((void *)&v116 + 1) + 8 * i) contextCollectorChangedToDevicesWithIdentifiers:v93->_currentCollectorIDs localDeviceIsCollector:v93->_isCollector];
              }
              id v25 = [(NSHashTable *)v23 countByEnumeratingWithState:&v116 objects:v130 count:16];
            }
            while (v25);
          }

          BOOL isCollector = v93->_isCollector;
        }
        else
        {
          BOOL isCollector = 0;
        }
      }
      [(ADDeviceCircleManager *)v93 _updateContextCollectorStatusToRapport:isCollector];
      if (v6) {
        v6[2](v6);
      }
      goto LABEL_72;
    }
    v85 = v6;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    v91 = v14;
    id v92 = objc_alloc_init((Class)NSMutableDictionary);
    unint64_t v15 = 0;
    char v82 = v9;
    if (v9 && v8)
    {
      [v92 setObject:v7 forKey:v8];
      id v16 = +[ADRapportLink siriInfoToBeBroadcasted];
      id v17 = [v16 mutableCopy];
      id v18 = v17;
      if (v17) {
        id v19 = v17;
      }
      else {
        id v19 = objc_alloc_init((Class)NSMutableDictionary);
      }
      id v28 = v19;

      [v28 setObject:v8 forKey:@"idsDeviceIdentifier"];
      id v29 = [v16 objectForKey:@"stationaryScore"];
      if (!v29)
      {
        [(ADDeviceCircleManager *)v93 _updateStationaryScore];
        *(float *)&double v30 = v93->_currentStationaryScore;
        id v31 = +[NSNumber numberWithFloat:v30];
        [v28 setObject:v31 forKey:@"stationaryScore"];
      }
      id v32 = [v28 objectForKey:@"isCollector"];
      unsigned int v33 = [v32 BOOLValue];

      [v14 addObject:v28];
      unint64_t v15 = v33;
      id v34 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v78 = v34;
        v79 = [v28 objectForKey:@"stationaryScore"];
        [v79 floatValue];
        *(_DWORD *)buf = 136315906;
        v123 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
        __int16 v124 = 2112;
        v125 = v8;
        __int16 v126 = 2048;
        double v127 = v80;
        __int16 v128 = 1024;
        int v129 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "%s #hal Collector candidate (local) %@: score %.2f, isCollector %d", buf, 0x26u);
      }
    }
    v83 = v8;
    v84 = v7;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v35 = v93;
    long long v36 = [(ADRapportLink *)v93->_clientLink activeDevices];
    id v37 = [v36 countByEnumeratingWithState:&v112 objects:v121 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v113;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v113 != v39) {
            objc_enumerationMutation(v36);
          }
          CFStringRef v41 = *(void **)(*((void *)&v112 + 1) + 8 * (void)j);
          id v42 = [v41 siriInfo];
          v43 = [v41 idsDeviceIdentifier];
          if ([(ADDeviceCircleManager *)v35 _isRemoteDeviceCollectorCandidate:v41])
          {
            BOOL v44 = v43 == 0;
          }
          else
          {
            BOOL v44 = 1;
          }
          if (!v44)
          {
            __int16 v45 = [v42 objectForKey:@"stationaryScore"];

            if (v45)
            {
              [v92 setObject:v41 forKey:v43];
              id v46 = [v42 mutableCopy];
              [v46 setObject:v43 forKey:@"idsDeviceIdentifier"];
              [v91 addObject:v46];
              __int16 v47 = [v46 objectForKey:@"isCollector"];
              unsigned int v48 = [v47 BOOLValue];

              v49 = (void *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
              {
                v50 = v49;
                v89 = [v46 objectForKey:@"stationaryScore"];
                [v89 floatValue];
                *(_DWORD *)buf = 136315906;
                v123 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
                __int16 v124 = 2112;
                v125 = v43;
                __int16 v126 = 2048;
                double v127 = v51;
                __int16 v128 = 1024;
                int v129 = v48;
                _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%s #hal Collector candidate %@: score %.2f, isCollector %d", buf, 0x26u);
              }
              v15 += v48;

              id v35 = v93;
            }
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v112 objects:v121 count:16];
      }
      while (v38);
    }

    v52 = v91;
    [v91 sortUsingComparator:&stru_100503FC8];
    id v53 = objc_alloc_init((Class)NSMutableArray);
    id v90 = objc_alloc_init((Class)NSMutableSet);
    id v88 = objc_alloc_init((Class)NSMutableDictionary);
    v54 = dispatch_group_create();
    v55 = &unk_1003E2000;
    if (v15 < 2)
    {
      v73 = [v91 firstObject];

      id v7 = v84;
      uint64_t v6 = v85;
      id v8 = v83;
      char v72 = v82;
      if (!v73)
      {
LABEL_68:
        queue = v93->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = v55[237];
        block[2] = sub_10016F1EC;
        block[3] = &unk_1005065D0;
        void block[4] = v93;
        id v95 = v53;
        id v96 = v88;
        char v99 = v72;
        v97 = v8;
        v98 = v6;
        id v76 = v88;
        id v77 = v53;
        dispatch_group_notify(v54, queue, block);

LABEL_72:
        goto LABEL_73;
      }
      v56 = [v91 firstObject];
      v74 = [v56 objectForKey:@"idsDeviceIdentifier"];
      [v53 addObject:v74];
    }
    else
    {
      v56 = +[ADHomeInfoManager sharedInfoManager];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id obj = v91;
      id v57 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
      if (v57)
      {
        id v59 = v57;
        uint64_t v60 = *(void *)v109;
        v87 = v56;
        *(void *)&long long v58 = 136315394;
        long long v81 = v58;
LABEL_51:
        uint64_t v61 = 0;
        while (1)
        {
          if (*(void *)v109 != v60) {
            objc_enumerationMutation(obj);
          }
          v62 = *(void **)(*((void *)&v108 + 1) + 8 * v61);
          v63 = objc_msgSend(v62, "objectForKey:", @"isCollector", v81);
          unsigned int v64 = [v63 BOOLValue];

          if (!v64) {
            break;
          }
          v65 = [v62 objectForKey:@"idsDeviceIdentifier"];
          v66 = [v92 objectForKey:v65];
          v67 = [(__CFString *)v66 homeKitIdentifier];
          if (v67)
          {
            dispatch_group_enter(v54);
            v68 = [(__CFString *)v66 homeKitIdentifier];
            v100[0] = _NSConcreteStackBlock;
            v100[1] = 3221225472;
            v100[2] = sub_10016F0B8;
            v100[3] = &unk_100504018;
            v100[4] = v35;
            v101 = v66;
            id v69 = v87;
            id v102 = v69;
            id v103 = v53;
            id v104 = v65;
            id v105 = v90;
            id v106 = v88;
            v107 = v54;
            v70 = v69;
            id v35 = v93;
            [v70 getHomeIdForAccessoryId:v68 completion:v100];
          }
          else
          {
            v71 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v81;
              v123 = "-[ADDeviceCircleManager _reelectCollectorDeviceForReason:completion:]";
              __int16 v124 = 2112;
              v125 = v66;
              _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%s Unable to get HomeKit identifier for %@", buf, 0x16u);
            }
            [v53 addObject:v65];
          }

          if (v59 == (id)++v61)
          {
            id v59 = [obj countByEnumeratingWithState:&v108 objects:v120 count:16];
            if (v59) {
              goto LABEL_51;
            }
            break;
          }
        }
        id v7 = v84;
        uint64_t v6 = v85;
        id v8 = v83;
        char v72 = v82;
        v55 = (void *)&unk_1003E2000;
        v56 = v87;
      }
      else
      {
        id v7 = v84;
        uint64_t v6 = v85;
        id v8 = v83;
        char v72 = v82;
      }
      v74 = obj;
    }

    v52 = v91;
    goto LABEL_68;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_73:
}

- (void)_reelectCollectorIfNecessary
{
  id v9 = [(ADDeviceCircleManager *)self _collectorDeviceIdentifiersWithFlags];
  id v3 = [v9 count];
  if ([(NSArray *)self->_currentCollectorIDs count]) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = +[NSSet setWithArray:v9];
    id v7 = +[NSSet setWithArray:self->_currentCollectorIDs];
    unsigned int v8 = [v6 isEqualToSet:v7];

    if (v8)
    {
      if ((unint64_t)v3 < 2) {
        goto LABEL_12;
      }
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 4;
    }
  }
  [(ADDeviceCircleManager *)self _reelectCollectorDeviceForReason:v5 completion:0];
LABEL_12:
}

- (void)_updateCollectorElectionVersion
{
  if (AFSupportsHALContextCollectorElection())
  {
    id v2 = +[AFPreferences sharedPreferences];
    unsigned int v3 = [v2 assistantIsEnabled];

    if (v3)
    {
      +[ADRapportLink updateSiriInfoWithObject:&off_100523F48 forKey:@"collectorElectionVersion"];
    }
    else
    {
      BOOL v4 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        uint64_t v6 = "-[ADDeviceCircleManager _updateCollectorElectionVersion]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Siri is turned off", (uint8_t *)&v5, 0xCu);
      }
      +[ADRapportLink updateSiriInfoWithObject:&off_100523F58 forKey:@"collectorElectionVersion"];
    }
  }
}

- (BOOL)_isRemoteDeviceCollectorCandidate:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 siriInfo];
  int v5 = [v4 objectForKey:@"collectorElectionVersion"];
  [v5 floatValue];
  float v7 = v6;

  unsigned int v8 = [v3 homeKitIdentifier];
  if (v8)
  {
    id v9 = [v3 idsDeviceIdentifier];
    BOOL v11 = v7 >= 1.0 && v9 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_isLocalDeviceCollectorCandidate
{
  id v2 = [(ADRapportLink *)self->_clientLink localDevice];
  if (AFSupportsHALContextCollecting())
  {
    id v3 = [v2 homeKitIdentifier];
    if (v3)
    {
      BOOL v4 = [v2 idsDeviceIdentifier];
      if (v4)
      {
        int v5 = +[AFPreferences sharedPreferences];
        unsigned __int8 v6 = [v5 assistantIsEnabled];
      }
      else
      {
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)_collectorDeviceIdentifiersWithFlags
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  BOOL v4 = +[ADRapportLink siriInfoToBeBroadcasted];
  int v5 = [v4 objectForKey:@"isCollector"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    float v7 = [(ADRapportLink *)self->_clientLink localDevice];
    unsigned int v8 = [v7 idsDeviceIdentifier];

    if (v8) {
      [v3 addObject:v8];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v25;
    *(void *)&long long v11 = 136315138;
    long long v23 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "siriInfo", v23);
        id v17 = [v16 objectForKey:@"isCollector"];
        unsigned int v18 = [v17 BOOLValue];

        if (v18)
        {
          id v19 = [v15 idsDeviceIdentifier];

          if (v19)
          {
            id v20 = [v15 idsDeviceIdentifier];
            [v3 addObject:v20];
          }
          else
          {
            id v21 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              id v29 = "-[ADDeviceCircleManager _collectorDeviceIdentifiersWithFlags]";
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Collector device does not have idsDeviceIdentifier. Skipping.", buf, 0xCu);
            }
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v12);
  }

  return v3;
}

- (void)_updateClientLinkSiriInfo
{
  if ((AFIsNano() & 1) == 0)
  {
    id v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      double currentStationaryScore = self->_currentStationaryScore;
      BOOL isCollector = self->_isCollector;
      int v9 = 136315650;
      id v10 = "-[ADDeviceCircleManager _updateClientLinkSiriInfo]";
      __int16 v11 = 2048;
      double v12 = currentStationaryScore;
      __int16 v13 = 1024;
      BOOL v14 = isCollector;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #hal Updating score to %.2f, isCollector to %d", (uint8_t *)&v9, 0x1Cu);
    }
    *(float *)&double v4 = self->_currentStationaryScore;
    int v5 = +[NSNumber numberWithFloat:v4];
    +[ADRapportLink updateSiriInfoWithObject:v5 forKey:@"stationaryScore"];

    unsigned int v6 = +[NSNumber numberWithBool:self->_isCollector];
    +[ADRapportLink updateSiriInfoWithObject:v6 forKey:@"isCollector"];
  }
}

- (void)_updateContextCollectorStatusToRapport:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled])
  {
    int v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      float v7 = "-[ADDeviceCircleManager _updateContextCollectorStatusToRapport:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", (uint8_t *)&v6, 0xCu);
    }
    [(ADRapportLink *)self->_clientLink updateLocalDeviceIsContextCollector:v3];
  }
}

- (id)_syncCompanionLinkDeviceLocalPeerData
{
  BOOL v3 = [(ADRapportLink *)self->_clientLink localDevice];
  os_unfair_lock_lock(&self->_peerInfoLock);
  double v4 = [(ADDeviceCircleManager *)self _localPeerData];
  int v5 = v4;
  if (v3) {
    sub_10016B52C(v3, v4);
  }
  else {
  int v6 = sub_100166F18(v4);
  }
  [(ADDeviceCircleManager *)self _updateLocalPeerInfo:v6];
  os_unfair_lock_unlock(&self->_peerInfoLock);

  return v5;
}

- (id)localPeerInfo
{
  p_peerInfoLock = &self->_peerInfoLock;
  os_unfair_lock_lock(&self->_peerInfoLock);
  double v4 = [(ADDeviceCircleManager *)self _localPeerInfo];
  os_unfair_lock_unlock(p_peerInfoLock);
  return v4;
}

- (id)managedPeerInfoMatchingPeerInfo:(id)a3
{
  if (a3)
  {
    p_peerInfoLock = &self->_peerInfoLock;
    id v5 = a3;
    os_unfair_lock_lock(p_peerInfoLock);
    int v6 = [(ADDeviceCircleManager *)self _managedPeerInfoMatchingPeerInfo:v5];

    os_unfair_lock_unlock(p_peerInfoLock);
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (void)sendRequestType:(id)a3 data:(id)a4 toDeviceWithAssistantIdentifier:(id)a5 onQueue:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  clientLink = self->_clientLink;
  id v16 = a4;
  id v17 = a3;
  unsigned int v18 = [(ADDeviceCircleManager *)self _rapportLinkMessageOptions];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100170324;
  v22[3] = &unk_1005072C8;
  id v24 = v13;
  id v25 = v14;
  id v23 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  [(ADRapportLink *)clientLink sendRequestID:@"com.apple.siri.rapport-link.request.device-circle-manager" messageType:v17 messagePayload:v16 toDeviceWithAssistantIdentifier:v21 options:v18 completion:v22];
}

- (void)_forwardExecuteCommandToDevice:(id)a3 message:(id)a4 from:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled])
  {
    id v12 = [v10 objectForKeyedSubscript:@"type"];
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      id v20 = "-[ADDeviceCircleManager _forwardExecuteCommandToDevice:message:from:completion:]";
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s #hal Forward executeCommand of type: %@ to device: %@", buf, 0x20u);
    }
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001706F8;
    v16[3] = &unk_100504BB8;
    id v17 = v9;
    id v18 = v11;
    [(ADDeviceCircleManager *)self sendRequestType:v12 data:v10 toDeviceWithAssistantIdentifier:v17 onQueue:queue completion:v16];
  }
  else
  {
    unint64_t v15 = +[AFError errorWithCode:13];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v15);
  }
}

- (void)_registerRequestHandlerForRequestId:(id)a3 messageType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    id v11 = +[NSString stringWithFormat:@"%@/%@", v8, v9];
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ADDeviceCircleManager _registerRequestHandlerForRequestId:messageType:handler:]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #hal combinedKey: %@", buf, 0x16u);
    }
    [(NSMapTable *)self->_requestHandlers setObject:v10 forKey:v11];
    id v13 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      requestHandlers = self->_requestHandlers;
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ADDeviceCircleManager _registerRequestHandlerForRequestId:messageType:handler:]";
      __int16 v17 = 2112;
      id v18 = requestHandlers;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s #hal registered handlers: %@", buf, 0x16u);
    }
  }
}

- (id)locationSharingDevice
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v20 != v5) {
        objc_enumerationMutation(v2);
      }
      float v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
      id v8 = [v7 siriInfo];
      id v9 = [v8 objectForKeyedSubscript:@"peerData"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 objectForKeyedSubscript:@"isLocationSharingDevice"];
        unsigned __int8 v11 = [v10 BOOLValue];

        if (v11) {
          break;
        }
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v12 = [v7 effectiveIdentifier];
    id v13 = [(NSMutableDictionary *)self->_remotePeerInfoByRapportEffectiveIdentifier objectForKey:v12];

    if (v13) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_10:
  }
  id v14 = +[ADMultiUserMeDevice sharedInstance];
  unint64_t v15 = [v14 isMeDevice];
  unsigned int v16 = [v15 BOOLValue];

  if (v16) {
    id v13 = self->_localPeerInfo;
  }
  else {
    id v13 = 0;
  }
LABEL_15:
  return v13;
}

- (void)wakeUpNearbyDevices
{
  if (AFSupportsHALContextCollecting())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100170C48;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)getManagedLocalAndRemotePeerInfoWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100170F08;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v16 = "-[ADDeviceCircleManager getCapabilitiesAndPeersFromContextCollectorThroughOnDemandRapportConnection:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal", buf, 0xCu);
    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  if ((AFSupportsHALOnDemandRapportConnection() & 1) == 0) {
    v4[2](v4, 0);
  }
  uint64_t v6 = +[NSUUID UUID];
  float v7 = [v6 UUIDString];
  id v8 = [v7 componentsSeparatedByString:@"-"];
  id v9 = [v8 firstObject];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100171154;
  block[3] = &unk_10050E1D8;
  void block[4] = self;
  id v13 = v9;
  id v14 = v4;
  id v11 = v9;
  dispatch_async(queue, block);

LABEL_6:
}

- (void)getCapabilitiesForReachableDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100171DB4;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getCapabilitiesForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017210C;
      block[3] = &unk_10050E1D8;
      void block[4] = self;
      id v11 = v6;
      id v12 = v8;
      dispatch_async(queue, block);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (id)_rpDeviceMatchingPeerInfo:(id)a3
{
  id v4 = [(ADDeviceCircleManager *)self _managedPeerInfoMatchingPeerInfo:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(ADRapportLink *)self->_clientLink activeDevices];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 effectiveIdentifier];
        id v11 = [v4 rapportEffectiveIdentifier];
        unsigned int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)reelectContextCollectorWithBestScore
{
  if (AFSupportsHALContextCollectorElection())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017274C;
    block[3] = &unk_10050E138;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100172904;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001729A8;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getContextCollectorDeviceIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (AFSupportsHALContextCollectorElection())
    {
      queue = self->_queue;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100172A80;
      v6[3] = &unk_10050E188;
      void v6[4] = self;
      id v7 = v4;
      dispatch_async(queue, v6);
    }
    else
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (id)idsDeviceUniqueIdentifierForDeviceWithAssistantId:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [v4 uppercaseString];
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = sub_10016D65C;
    id v18 = sub_10016D66C;
    id v19 = 0;
    p_assistantIdMapLock = &self->_assistantIdMapLock;
    os_unfair_lock_lock(&self->_assistantIdMapLock);
    assistantIdsByDeviceIDSID = self->_assistantIdsByDeviceIDSID;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100172FBC;
    v11[3] = &unk_100503F38;
    id v8 = v5;
    id v12 = v8;
    id v13 = &v14;
    [(NSMutableDictionary *)assistantIdsByDeviceIDSID enumerateKeysAndObjectsUsingBlock:v11];
    os_unfair_lock_unlock(p_assistantIdMapLock);
    id v9 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_setAssistantId:(id)a3 forDeviceWithIdsDeviceUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    id v8 = [v6 uppercaseString];
    os_unfair_lock_lock(&self->_assistantIdMapLock);
    assistantIdsByDeviceIDSID = self->_assistantIdsByDeviceIDSID;
    if (!assistantIdsByDeviceIDSID)
    {
      id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v11 = self->_assistantIdsByDeviceIDSID;
      self->_assistantIdsByDeviceIDSID = v10;

      assistantIdsByDeviceIDSID = self->_assistantIdsByDeviceIDSID;
    }
    [(NSMutableDictionary *)assistantIdsByDeviceIDSID setObject:v8 forKey:v7];
    os_unfair_lock_unlock(&self->_assistantIdMapLock);
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      uint64_t v14 = "-[ADDeviceCircleManager _setAssistantId:forDeviceWithIdsDeviceUniqueIdentifier:]";
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s #hal Updated assistantId %@ for device %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (id)assistantIdForDeviceWithIdsDeviceUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_assistantIdMapLock = &self->_assistantIdMapLock;
    os_unfair_lock_lock(&self->_assistantIdMapLock);
    id v6 = [(NSMutableDictionary *)self->_assistantIdsByDeviceIDSID objectForKey:v4];
    os_unfair_lock_unlock(p_assistantIdMapLock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_rapportLinkMessageOptions
{
  uint64_t v4 = RPOptionStatusFlags;
  uint64_t v5 = &off_1005236A8;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (void)_cleanupOnDemandClientLinkToContextCollector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[ADDeviceCircleManager _cleanupOnDemandClientLinkToContextCollector:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s #hal #on-demand clean up #on-demand connection: %@", (uint8_t *)&v7, 0x16u);
  }
  [v4 invalidate];
  onDemandClientLinkToContextCollector = self->_onDemandClientLinkToContextCollector;
  self->_onDemandClientLinkToContextCollector = 0;
}

- (void)_activateOnDemandClientLinkToContextCollector:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017344C;
  v7[3] = &unk_10050DF38;
  v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  [v6 activateWithCompletion:v7];
}

- (id)_setUpOnDemandClientLinkToContextCollector
{
  id v3 = +[ADRapportLinkConfiguration newWithBuilder:&stru_100503ED0];
  id v4 = [[ADRapportLink alloc] initWithQueue:self->_queue configuration:v3];
  [(ADRapportLink *)v4 addListener:self];
  id v5 = [(ADDeviceCircleManager *)self _rapportLinkMessageOptions];
  [(ADRapportLink *)v4 registerRequestID:@"com.apple.siri.rapport-link.request.device-circle-manager" options:v5];

  return v4;
}

- (void)_setupClientLink
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173900;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)updatePersonalRequestsEnabledAccessories:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100173E88;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updatePersonalRequestsEnabledAccessories
{
  id v3 = +[ADHomeInfoManager sharedInfoManager];
  id v4 = [v3 accessoriesWithPersonalRequestsEnabled];
  id v10 = +[NSMutableSet setWithArray:v4];

  id v5 = [(ADDeviceCircleManager *)self personalRequestsEnabledAccessories];
  id v6 = +[ADHomeInfoManager sharedInfoManager];
  int v7 = [v6 accessoriesInHome];
  [v10 addObjectsFromArray:v7];

  if (([v5 isEqual:v10] & 1) == 0)
  {
    id v8 = [v10 mutableCopy];
    [v8 minusSet:v5];
    [(ADDeviceCircleManager *)self setPersonalRequestsEnabledAccessories:v10];
    id v9 = [v8 allObjects];
    [(ADDeviceCircleManager *)self _sendSyncTokenToAccessories:v9 transferReason:3];
  }
}

- (void)setPersonalRequestsEnabledAccessories:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_multiUserLock);
  id v5 = (NSSet *)[v4 copy];
  personalRequestsEnabledAccessories = self->_personalRequestsEnabledAccessories;
  self->_personalRequestsEnabledAccessories = v5;

  os_unfair_lock_unlock(&self->_multiUserLock);
  if (v4)
  {
    int v7 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      id v8 = v7;
      int v9 = 136315394;
      id v10 = "-[ADDeviceCircleManager setPersonalRequestsEnabledAccessories:]";
      __int16 v11 = 2048;
      id v12 = [v4 count];
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Added %lu accessories as personal accessories", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (NSSet)personalRequestsEnabledAccessories
{
  p_multiUserLock = &self->_multiUserLock;
  os_unfair_lock_lock(&self->_multiUserLock);
  id v4 = [(NSSet *)self->_personalRequestsEnabledAccessories copy];
  os_unfair_lock_unlock(p_multiUserLock);
  return (NSSet *)v4;
}

- (id)_initWithQueue:(id)a3 rapportLink:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)ADDeviceCircleManager;
  int v9 = [(ADDeviceCircleManager *)&v46 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    __int16 v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("ADDeviceCircleManagerMUXSync", v11);

    muxSyncQueue = v10->_muxSyncQueue;
    v10->_muxSyncQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v14;

    v10->_rollingRSSI = 0.0;
    v10->_unint64_t rollingRSSICount = 0;
    v10->_double currentStationaryScore = 0.0;
    uint64_t v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    deviceCountTrend = v10->_deviceCountTrend;
    v10->_deviceCountTrend = v16;

    v10->_assistantIdMapLock._os_unfair_lock_opaque = 0;
    v10->_peerInfoLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = +[NSMutableArray array];
    svdCapabilities = v10->_svdCapabilities;
    v10->_svdCapabilities = (NSArray *)v18;

    long long v20 = (NSMapTable *)objc_alloc_init((Class)NSMapTable);
    requestHandlers = v10->_requestHandlers;
    v10->_requestHandlers = v20;

    onDemandClientLinkToContextCollector = v10->_onDemandClientLinkToContextCollector;
    v10->_onDemandClientLinkToContextCollector = 0;

    objc_storeStrong((id *)&v10->_clientLink, a4);
    [(ADDeviceCircleManager *)v10 _setupClientLink];
    __int16 v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v10 selector:"preferencesEnabledBitsDidChange:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];

    id v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v10 selector:"activeAccountIdentifierDidChange:" name:@"ADActiveAccountIdentifierDidChangeNotification" object:0];

    id v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v10 selector:"preferencesSharedUserIdentifierDidChange:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];

    long long v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v10 selector:"sharedDataDidChange:" name:@"ADSharedDataDidChangeNotification" object:0];

    long long v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v10 selector:"isMeDeviceDidChange:" name:@"ADMultiUserMeDeviceEvaluatedNotification" object:0];

    id v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v10 selector:"isMeDeviceDidChange:" name:@"ADMultiUserMeDeviceChangedNotification" object:0];

    queue = v10->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100174540;
    block[3] = &unk_10050E138;
    double v30 = v10;
    __int16 v45 = v30;
    dispatch_async(queue, block);
    id v31 = +[ADHomeInfoManager sharedInfoManager];
    [v31 addListener:v30];
    id v32 = v10->_queue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    void v41[2] = sub_100174548;
    v41[3] = &unk_10050E160;
    id v42 = v31;
    unsigned int v33 = v30;
    v43 = v33;
    id v34 = v31;
    dispatch_async(v32, v41);
    [(ADDeviceCircleManager *)v33 _setupMUXSupport];
    AFLogInitIfNeeded();
    id v35 = v10->_queue;
    long long v36 = +[ADQueueMonitor sharedMonitor];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001745D0;
    v39[3] = &unk_10050C458;
    id v40 = v35;
    id v37 = v35;
    [v36 addQueue:v37 heartBeatInterval:v39 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v10;
}

- (void)_setupMUXSupport
{
  self->_multiUserLock._os_unfair_lock_opaque = 0;
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"updatePersonalRequestsEnabledAccessories:" name:@"ADHomeInfoCurrentHomeIsReady" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"updatePersonalRequestsEnabledAccessories:" name:@"ADHomeInfoAccessoryAddedNotification" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"updatePersonalRequestsEnabledAccessories:" name:@"ADHomeInfoAccessoryRemovedNotification" object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"updatePersonalRequestsEnabledAccessories:" name:@"ADHomeInfoPersonalDomainsChangedNotification" object:0];

  [(ADDeviceCircleManager *)self _updatePersonalRequestsEnabledAccessories];
}

+ (id)_rapportLinkWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = [ADRapportLink alloc];
  id v5 = +[ADRapportLinkConfiguration newWithBuilder:&stru_100503E70];
  id v6 = [(ADRapportLink *)v4 initWithQueue:v3 configuration:v5];

  return v6;
}

+ (ADDeviceCircleManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100174B14;
  block[3] = &unk_10050E350;
  void block[4] = a1;
  if (qword_100585D08 != -1) {
    dispatch_once(&qword_100585D08, block);
  }
  id v2 = (void *)qword_100585D00;
  return (ADDeviceCircleManager *)v2;
}

@end