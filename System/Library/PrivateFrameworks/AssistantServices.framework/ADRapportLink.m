@interface ADRapportLink
+ (id)_sharedLinkForSiriInfo;
+ (id)siriInfoToBeBroadcasted;
+ (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4;
- (ADRapportLink)initWithQueue:(id)a3 configuration:(id)a4;
- (ADRapportLinkConfiguration)configuration;
- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 messageID:(id *)a6 messageType:(id *)a7 messagePayload:(id *)a8 senderPeerInfo:(id *)a9;
- (BOOL)canReachPersonalDevices;
- (BOOL)isInvalidated;
- (BOOL)usingOnDemandConnection;
- (NSArray)activeDevices;
- (NSString)serviceType;
- (RPCompanionLinkDevice)destinationDevice;
- (RPCompanionLinkDevice)localDevice;
- (id)_buildRequestFromMessageType:(id)a3 andMessagePayload:(id)a4;
- (id)_buildResponse;
- (id)_destinationIDForDeviceAssistantIdentifier:(id)a3;
- (id)_destinationIDForDeviceHomeKitAccessoryIdentifier:(id)a3;
- (id)_destinationIDForDeviceIDSIdentifier:(id)a3;
- (id)_destinationIDForPeerInfo:(id)a3;
- (id)_remoteDeviceForPeerInfo:(id)a3;
- (id)_siriInfo;
- (void)_activateWithCompletion:(id)a3;
- (void)_addLocalDeviceInfoToDictionary:(id)a3;
- (void)_enumerateListenersUsingBlock:(id)a3;
- (void)_handleDidFindDevice:(id)a3;
- (void)_handleDidInterrupt;
- (void)_handleDidInvalidate;
- (void)_handleDidLoseDevice:(id)a3;
- (void)_handleDidUpdateDevice:(id)a3 changes:(unsigned int)a4;
- (void)_handleDidUpdateLocalDevice:(id)a3;
- (void)_invalidate;
- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 destinationID:(id)a6 options:(id)a7 completion:(id)a8;
- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)_setSiriInfo:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)registerRequestID:(id)a3 options:(id)a4;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)removeListener:(id)a3;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithAssistantIdentifier:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithHomeKitAccessoryIdentifier:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithIDSDeviceID:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toPeer:(id)a6 options:(id)a7 completion:(id)a8;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestToContextCollectorThroughOnDemandConnection:(id)a3 messageType:(id)a4 messagePayload:(id)a5 options:(id)a6 completion:(id)a7;
- (void)setDestinationDevice:(id)a3;
- (void)setRequestHandler:(id)a3 forRequestID:(id)a4 messageType:(id)a5;
- (void)setServiceType:(id)a3;
- (void)setStateUpdateHandler:(id)a3;
- (void)updateLocalDeviceIsContextCollector:(BOOL)a3;
@end

@implementation ADRapportLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_handlersByRequestIDAndMessageType, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (ADRapportLinkConfiguration)configuration
{
  return self->_configuration;
}

- (void)_setSiriInfo:(id)a3
{
}

- (id)_siriInfo
{
  v2 = [(RPCompanionLinkClient *)self->_client siriInfo];
  id v3 = [v2 copy];

  return v3;
}

- (id)_remoteDeviceForPeerInfo:(id)a3
{
  id v4 = a3;
  v5 = [(RPCompanionLinkClient *)self->_client activeDevices];
  v6 = [v4 idsDeviceUniqueIdentifier];
  if (![v6 length]) {
    goto LABEL_11;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (!v8)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v58;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v58 != v10) {
      objc_enumerationMutation(v7);
    }
    v12 = *(void **)(*((void *)&v57 + 1) + 8 * v11);
    v13 = [v12 idsDeviceIdentifier];
    unsigned __int8 v14 = [v13 isEqualToString:v6];

    if (v14) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v37 = v12;

  if (v37) {
    goto LABEL_54;
  }
LABEL_12:
  v15 = [v4 rapportEffectiveIdentifier];
  if (![v15 length])
  {
LABEL_22:

    goto LABEL_23;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (!v17)
  {
LABEL_21:

    goto LABEL_22;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v54;
LABEL_15:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v54 != v19) {
      objc_enumerationMutation(v16);
    }
    v21 = *(void **)(*((void *)&v53 + 1) + 8 * v20);
    v22 = [v21 effectiveIdentifier];
    unsigned __int8 v23 = [v22 isEqualToString:v15];

    if (v23) {
      break;
    }
    if (v18 == (id)++v20)
    {
      id v18 = [v16 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v18) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  id v37 = v21;

  if (v37) {
    goto LABEL_54;
  }
LABEL_23:
  v24 = [v4 homeKitAccessoryIdentifier];
  if ([v24 length])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v44 = v5;
    id v25 = v5;
    id v26 = [v25 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v50;
LABEL_26:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v49 + 1) + 8 * v29);
        v31 = [v30 homeKitIdentifier];
        v32 = [v31 UUIDString];
        unsigned __int8 v33 = [v32 isEqualToString:v24];

        if (v33) {
          break;
        }
        if (v27 == (id)++v29)
        {
          id v27 = [v25 countByEnumeratingWithState:&v49 objects:v62 count:16];
          if (v27) {
            goto LABEL_26;
          }
          goto LABEL_32;
        }
      }
      id v37 = v30;

      v5 = v44;
      if (v37) {
        goto LABEL_54;
      }
      goto LABEL_34;
    }
LABEL_32:

    v5 = v44;
  }

LABEL_34:
  v34 = [v4 assistantIdentifier];
  v35 = [v34 uppercaseString];

  if ([v35 length])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v36 = v5;
    id v37 = [v36 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v46;
      while (2)
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v41 = sub_100174F00(v40);
          unsigned int v42 = [v41 isEqualToString:v35];

          if (v42)
          {
            id v37 = v40;
            goto LABEL_51;
          }
        }
        id v37 = [v36 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }
LABEL_51:
  }
  else
  {
    id v37 = 0;
  }

LABEL_54:
  return v37;
}

- (id)_destinationIDForPeerInfo:(id)a3
{
  id v4 = a3;
  v5 = [(ADRapportLink *)self _remoteDeviceForPeerInfo:v4];
  if (!v5)
  {
    LOBYTE(v11) = 0;
    v6 = sub_10016A938(v4, &v11);
    id v7 = v6;
    if ((_BYTE)v11)
    {
      v5 = [(ADRapportLink *)self _remoteDeviceForPeerInfo:v6];

      if (v5) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[ADRapportLink _destinationIDForPeerInfo:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s unable to find device with peer info: %@", (uint8_t *)&v11, 0x16u);
    }
    v5 = 0;
  }
LABEL_9:
  id v9 = [v5 identifier];

  return v9;
}

- (id)_destinationIDForDeviceAssistantIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(RPCompanionLinkClient *)self->_client activeDevices];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          int v11 = sub_100174F00(v10);
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v14 = [v10 identifier];

            goto LABEL_15;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  __int16 v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADRapportLink _destinationIDForDeviceAssistantIdentifier:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s unable to find device with assistantIdentifier: %@", buf, 0x16u);
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (id)_destinationIDForDeviceHomeKitAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(RPCompanionLinkClient *)self->_client activeDevices];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          int v11 = [v10 homeKitIdentifier];
          unsigned __int8 v12 = [v11 isEqual:v4];

          if (v12)
          {
            id v14 = [v10 identifier];

            goto LABEL_15;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  __int16 v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADRapportLink _destinationIDForDeviceHomeKitAccessoryIdentifier:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s unable to find device with homeKitAccessoryIdentifier: %@", buf, 0x16u);
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (id)_destinationIDForDeviceIDSIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(RPCompanionLinkClient *)self->_client activeDevices];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          int v11 = [v10 idsDeviceIdentifier];
          unsigned __int8 v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v14 = [v10 identifier];

            goto LABEL_15;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  __int16 v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ADRapportLink _destinationIDForDeviceIDSIdentifier:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s unable to find device with uniqueIDSIdentifier: %@", buf, 0x16u);
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = +[ADFMDMonitor sharedManager];
  unsigned int v18 = [v17 isLostModeActive];

  if (v18)
  {
    long long v19 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      v21 = "-[ADRapportLink _sendRequestID:request:destinationID:options:responseHandler:]";
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Lost mode is active, not sending any outbound requests", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    [(RPCompanionLinkClient *)self->_client sendRequestID:v12 request:v13 destinationID:v14 options:v15 responseHandler:v16];
  }
}

- (void)_sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 destinationID:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  long long v19 = [(ADRapportLink *)self _buildRequestFromMessageType:v15 andMessagePayload:a5];
  int v20 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v29 = "-[ADRapportLink _sendRequestID:messageType:messagePayload:destinationID:options:completion:]";
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    __int16 v34 = 2112;
    v35 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s Sending request for requestID=%@, messageType=%@ : %@", buf, 0x2Au);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100082A38;
  v24[3] = &unk_100500108;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  [(ADRapportLink *)self _sendRequestID:v23 request:v19 destinationID:v18 options:v17 responseHandler:v24];
}

- (BOOL)_validateIncomingRequest:(id)a3 options:(id)a4 error:(id *)a5 messageID:(id *)a6 messageType:(id *)a7 messagePayload:(id *)a8 senderPeerInfo:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
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
  if (a9) {
    *a9 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [v14 objectForKey:@"messageID"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v25 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s malformed message id", buf, 0xCu);
      }
      id v26 = +[AFError errorWithCode:11 description:@"Malformed message id."];
      id v23 = v26;
      if (a5)
      {
        id v23 = v26;
        BOOL v24 = 0;
        *a5 = v23;
      }
      else
      {
        BOOL v24 = 0;
      }
      goto LABEL_101;
    }
    id v62 = v15;
    id v17 = v16;
    uint64_t v18 = [v14 objectForKey:@"type"];
    objc_opt_class();
    id v64 = (id)v18;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v27 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s malformed message type", buf, 0xCu);
      }
      uint64_t v28 = +[AFError errorWithCode:11 description:@"Malformed message type."];
      id v23 = v28;
      id v16 = v17;
      if (a5)
      {
        id v23 = v28;
        BOOL v24 = 0;
        *a5 = v23;
      }
      else
      {
        BOOL v24 = 0;
      }
      id v15 = v62;
      id v31 = v64;
      goto LABEL_100;
    }
    uint64_t v19 = [v14 objectForKey:@"payload"];
    objc_opt_class();
    id v61 = (id)v19;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v29 = AFSiriLogContextDaemon;
      id v16 = v17;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s malformed message payload", buf, 0xCu);
      }
      __int16 v30 = +[AFError errorWithCode:11 description:@"Malformed message payload."];
      id v23 = v30;
      id v15 = v62;
      if (a5)
      {
        id v23 = v30;
        BOOL v24 = 0;
        *a5 = v23;
      }
      else
      {
        BOOL v24 = 0;
      }
      id v31 = v64;
      __int16 v34 = v61;
      goto LABEL_99;
    }
    int v20 = [v14 objectForKey:@"idsDeviceId"];
    id v16 = v17;
    if (v20)
    {
      objc_opt_class();
      id v15 = v62;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s malformed IDS id", buf, 0xCu);
        }
        long long v60 = v20;
        id v36 = +[AFError errorWithCode:11 description:@"Malformed IDS id."];
        id v23 = v36;
        if (a5)
        {
          id v23 = v36;
          BOOL v24 = 0;
          *a5 = v23;
        }
        else
        {
          BOOL v24 = 0;
        }
        id v31 = v64;
        __int16 v34 = v61;
        goto LABEL_98;
      }
      if (![v20 length])
      {

        int v20 = 0;
      }
    }
    else
    {
      id v15 = v62;
    }
    long long v60 = v20;
    uint64_t v32 = [v14 objectForKey:@"rapportDeviceId"];
    if (v32)
    {
      id v33 = (void *)v32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v59 = v33;
        id v37 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s malformed Rapport id", buf, 0xCu);
        }
        uint64_t v38 = +[AFError errorWithCode:11 description:@"Malformed Rapport id."];
        id v23 = v38;
        if (a5)
        {
          id v23 = v38;
          BOOL v24 = 0;
          *a5 = v23;
        }
        else
        {
          BOOL v24 = 0;
        }
        id v31 = v64;
        __int16 v34 = v61;
        goto LABEL_97;
      }
      if ([v33 length])
      {
        long long v59 = v33;
        goto LABEL_58;
      }
    }
    long long v59 = 0;
LABEL_58:
    uint64_t v39 = [v14 objectForKey:@"homeDeviceId"];
    if (v39)
    {
      v40 = (void *)v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v41 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s malformed HomeKit id", buf, 0xCu);
        }
        v63 = v40;
        unsigned int v42 = +[AFError errorWithCode:11 description:@"Malformed HomeKit id."];
        id v23 = v42;
        if (a5)
        {
          id v23 = v42;
          BOOL v24 = 0;
          *a5 = v23;
        }
        else
        {
          BOOL v24 = 0;
        }
        id v31 = v64;
        __int16 v34 = v61;
        goto LABEL_96;
      }
      if ([v40 length])
      {
        v63 = v40;
        goto LABEL_70;
      }
    }
    v63 = 0;
LABEL_70:
    uint64_t v43 = [v14 objectForKey:@"assistantId"];
    if (v43)
    {
      v44 = (void *)v43;
      objc_opt_class();
      long long v45 = v44;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v53 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s malformed Assistant id", buf, 0xCu);
        }
        long long v54 = +[AFError errorWithCode:11 description:@"Malformed Assistant id."];
        id v23 = v54;
        if (a5)
        {
          id v23 = v54;
          BOOL v24 = 0;
          *a5 = v23;
        }
        else
        {
          BOOL v24 = 0;
        }
        id v31 = v64;
        __int16 v34 = v61;
        goto LABEL_95;
      }
      id v46 = [v44 length];
      long long v47 = v63;
      if (!v46)
      {

        long long v45 = 0;
      }
    }
    else
    {
      long long v45 = 0;
      long long v47 = v63;
    }
    v63 = v47;
    long long v48 = +[ADDeviceCircleManager sharedInstance];
    long long v49 = v48;
    if (v60 && v45) {
      [v48 _setAssistantId:v45 forDeviceWithIdsDeviceUniqueIdentifier:v60];
    }
    long long v57 = v49;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10008372C;
    v67[3] = &unk_1005000E0;
    id v68 = v60;
    id v69 = v59;
    id v70 = v47;
    id v58 = v45;
    id v71 = v58;
    id v50 = +[AFPeerInfo newWithBuilder:v67];
    long long v51 = sub_10016A938(v50, 0);

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000837A0;
    v65[3] = &unk_10050DB08;
    id v66 = v15;
    id v52 = +[AFPeerInfo newWithBuilder:v65];
    AFPeerInfoMerge();
    id v56 = (id)objc_claimAutoreleasedReturnValue();

    if (a6) {
      *a6 = v16;
    }
    id v31 = v64;
    __int16 v34 = v61;
    if (a7) {
      *a7 = v64;
    }
    long long v45 = v58;
    if (a8) {
      *a8 = v61;
    }
    if (a9) {
      *a9 = v56;
    }

    id v23 = 0;
    BOOL v24 = 1;
LABEL_95:

LABEL_96:
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
LABEL_101:

    goto LABEL_102;
  }
  id v21 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v73 = "-[ADRapportLink _validateIncomingRequest:options:error:messageID:messageType:messagePayload:senderPeerInfo:]";
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s malformed request dictionary", buf, 0xCu);
  }
  id v22 = +[AFError errorWithCode:11 description:@"Malformed request dictionary."];
  id v23 = v22;
  if (a5)
  {
    id v23 = v22;
    BOOL v24 = 0;
    *a5 = v23;
  }
  else
  {
    BOOL v24 = 0;
  }
LABEL_102:

  return v24;
}

- (void)_addLocalDeviceInfoToDictionary:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v17)
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ADRapportLink.m", 717, @"Invalid parameter not satisfying: %@", @"dictionary != nil" object file lineNumber description];
  }
  v5 = [(RPCompanionLinkClient *)self->_client localDevice];
  id v6 = +[ADDeviceCircleManager sharedInstance];
  id v7 = [v6 localPeerInfo];

  uint64_t v8 = [v5 idsDeviceIdentifier];
  if (![v8 length])
  {
    uint64_t v9 = [v7 idsDeviceUniqueIdentifier];

    uint64_t v8 = (void *)v9;
  }
  if ([v8 length]) {
    [v17 setObject:v8 forKey:@"idsDeviceId"];
  }
  uint64_t v10 = [v5 effectiveIdentifier];
  if (![v10 length])
  {
    uint64_t v11 = [v7 rapportEffectiveIdentifier];

    uint64_t v10 = (void *)v11;
  }
  if ([v10 length]) {
    [v17 setObject:v10 forKey:@"rapportDeviceId"];
  }
  id v12 = [v5 homeKitIdentifier];
  id v13 = [v12 UUIDString];

  if (![v13 length])
  {
    uint64_t v14 = [v7 homeKitAccessoryIdentifier];

    id v13 = (void *)v14;
  }
  if ([v13 length]) {
    [v17 setObject:v13 forKey:@"homeDeviceId"];
  }
  id v15 = [v7 assistantIdentifier];
  if ([v15 length]) {
    [v17 setObject:v15 forKey:@"assistantId"];
  }
}

- (id)_buildRequestFromMessageType:(id)a3 andMessagePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = +[NSUUID UUID];
  uint64_t v10 = [v9 UUIDString];

  [v8 setObject:v10 forKey:@"messageID"];
  if ([v6 length]) {
    [v8 setObject:v6 forKey:@"type"];
  }
  if (v7) {
    [v8 setObject:v7 forKey:@"payload"];
  }
  [(ADRapportLink *)self _addLocalDeviceInfoToDictionary:v8];

  return v8;
}

- (id)_buildResponse
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(ADRapportLink *)self _addLocalDeviceInfoToDictionary:v3];
  return v3;
}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a5;
  client = self->_client;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100083C78;
  v11[3] = &unk_1005000B8;
  id v12 = v8;
  id v10 = v8;
  [(RPCompanionLinkClient *)client registerRequestID:a3 options:a4 handler:v11];
}

- (void)_enumerateListenersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(NSHashTable *)self->_listeners setRepresentation];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_handleDidLoseDevice:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008401C;
  v4[3] = &unk_100500068;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ADRapportLink *)v5 _enumerateListenersUsingBlock:v4];
}

- (void)_handleDidUpdateDevice:(id)a3 changes:(unsigned int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100084118;
  v6[3] = &unk_100500090;
  id v7 = self;
  id v8 = a3;
  unsigned int v9 = a4;
  id v5 = v8;
  [(ADRapportLink *)v7 _enumerateListenersUsingBlock:v6];
}

- (void)_handleDidFindDevice:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084210;
  v4[3] = &unk_100500068;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ADRapportLink *)v5 _enumerateListenersUsingBlock:v4];
}

- (void)_handleDidUpdateLocalDevice:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084304;
  v4[3] = &unk_100500068;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ADRapportLink *)v5 _enumerateListenersUsingBlock:v4];
}

- (void)_handleDidInvalidate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000843D0;
  v2[3] = &unk_100500040;
  v2[4] = self;
  [(ADRapportLink *)self _enumerateListenersUsingBlock:v2];
}

- (void)_handleDidInterrupt
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008449C;
  v2[3] = &unk_100500040;
  v2[4] = self;
  [(ADRapportLink *)self _enumerateListenersUsingBlock:v2];
}

- (void)_invalidate
{
  client = self->_client;
  if (client)
  {
    [(RPCompanionLinkClient *)client invalidate];
    id v4 = self->_client;
    self->_client = 0;
  }
  listeners = self->_listeners;
  [(NSHashTable *)listeners removeAllObjects];
}

- (void)_activateWithCompletion:(id)a3
{
}

- (void)invalidate
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    client = self->_client;
    *(_DWORD *)buf = 136315650;
    id v8 = "-[ADRapportLink invalidate]";
    __int16 v9 = 2112;
    long long v10 = self;
    __int16 v11 = 2112;
    long long v12 = client;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084668;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setStateUpdateHandler:(id)a3
{
}

- (void)updateLocalDeviceIsContextCollector:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled])
  {
    client = self->_client;
    if (v3)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100084760;
      v8[3] = &unk_100500018;
      BOOL v9 = v3;
      [(RPCompanionLinkClient *)client setLocalDeviceAsContextCollectorWithCompletion:v8];
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100084864;
      v6[3] = &unk_100500018;
      char v7 = 0;
      [(RPCompanionLinkClient *)client removeLocalDeviceAsContextCollectorWithCompletion:v6];
    }
  }
}

- (void)sendRequestToContextCollectorThroughOnDemandConnection:(id)a3 messageType:(id)a4 messagePayload:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    if (+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]&& AFSupportsHALOnDemandRapportConnection())
    {
      id v17 = [(ADRapportLink *)self _buildRequestFromMessageType:v13 andMessagePayload:v14];
      uint64_t v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        client = self->_client;
        *(_DWORD *)buf = 136315394;
        id v25 = "-[ADRapportLink sendRequestToContextCollectorThroughOnDemandConnection:messageType:messagePayload:options:completion:]";
        __int16 v26 = 2112;
        id v27 = client;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s #hal #on-demand sendRequestToContextCollector client: %@", buf, 0x16u);
      }
      int v20 = self->_client;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100084B70;
      v22[3] = &unk_100507C18;
      id v23 = v16;
      [(RPCompanionLinkClient *)v20 sendRequestID:v12 request:v17 options:v15 responseHandler:v22];
    }
    else
    {
      id v21 = +[AFError errorWithCode:1017 description:0 underlyingError:0];
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v21);
    }
  }
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toPeer:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084CF4;
  block[3] = &unk_100507D58;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithAssistantIdentifier:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084F10;
  block[3] = &unk_100507D58;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithHomeKitAccessoryIdentifier:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008512C;
  block[3] = &unk_100507D58;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 messageType:(id)a4 messagePayload:(id)a5 toDeviceWithIDSDeviceID:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085348;
  block[3] = &unk_100507D58;
  block[4] = self;
  id v28 = v17;
  id v32 = v18;
  id v33 = v19;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v21 = v18;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  id v25 = v19;
  id v26 = v17;
  dispatch_async(queue, block);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100085534;
  v23[3] = &unk_100508278;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

- (void)setRequestHandler:(id)a3 forRequestID:(id)a4 messageType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length] && objc_msgSend(v10, "length"))
  {
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000856EC;
    v13[3] = &unk_10050DC68;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(queue, v13);
  }
  else
  {
    id v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[ADRapportLink setRequestHandler:forRequestID:messageType:]";
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Empty requestID or messageType: %@, %@", buf, 0x20u);
    }
  }
}

- (void)registerRequestID:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085834;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100085EFC;
  v15[3] = &unk_10050E228;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (BOOL)usingOnDemandConnection
{
  return [(RPCompanionLinkClient *)self->_client usingOnDemandConnection];
}

- (BOOL)canReachPersonalDevices
{
  v2 = [(ADRapportLink *)self localDevice];
  BOOL v3 = [v2 homeKitIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setDestinationDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100086264;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (RPCompanionLinkDevice)destinationDevice
{
  return (RPCompanionLinkDevice *)[(RPCompanionLinkClient *)self->_client destinationDevice];
}

- (void)setServiceType:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100086310;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (NSString)serviceType
{
  return (NSString *)[(RPCompanionLinkClient *)self->_client serviceType];
}

- (NSArray)activeDevices
{
  return (NSArray *)[(RPCompanionLinkClient *)self->_client activeDevices];
}

- (RPCompanionLinkDevice)localDevice
{
  return (RPCompanionLinkDevice *)[(RPCompanionLinkClient *)self->_client localDevice];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000863CC;
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
  v7[2] = sub_100086470;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    client = self->_client;
    *(_DWORD *)buf = 136315650;
    id v12 = "-[ADRapportLink activateWithCompletion:]";
    __int16 v13 = 2112;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = client;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000865BC;
  v9[3] = &unk_10050E188;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(queue, v9);
}

- (BOOL)isInvalidated
{
  return self->_client == 0;
}

- (ADRapportLink)initWithQueue:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v96.receiver = self;
  v96.super_class = (Class)ADRapportLink;
  id v8 = [(ADRapportLink *)&v96 init];
  if (!v8) {
    goto LABEL_96;
  }
  if (v6)
  {
    id v9 = (OS_dispatch_queue *)v6;
    queue = v8->_queue;
    v8->_queue = v9;
  }
  else
  {
    __int16 v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistant.rapport-link", v12);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;
  }

  id v14 = (ADRapportLinkConfiguration *)[v7 copy];
  configuration = v8->_configuration;
  v8->_configuration = v14;

  uint64_t v16 = +[NSHashTable weakObjectsHashTable];
  listeners = v8->_listeners;
  v8->_listeners = (NSHashTable *)v16;

  id v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  handlersByRequestIDAndMessageType = v8->_handlersByRequestIDAndMessageType;
  v8->_handlersByRequestIDAndMessageType = v18;

  id v20 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
  client = v8->_client;
  v8->_client = v20;

  [(RPCompanionLinkClient *)v8->_client setDispatchQueue:v8->_queue];
  id v22 = [(RPCompanionLinkClient *)v8->_client flags];
  unint64_t v23 = (unint64_t)[(RPCompanionLinkClient *)v8->_client controlFlags];
  id v24 = [(ADRapportLinkConfiguration *)v8->_configuration discoveryOptions];
  id v25 = [v24 includesFamily];

  if (v25 == (id)2)
  {
    id v27 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s iCloud Family included", buf, 0xCu);
    }
    v23 |= 0x1000uLL;
  }
  else if (v25 == (id)1)
  {
    id v26 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s iCloud Family excluded", buf, 0xCu);
    }
    v23 &= ~0x1000uLL;
  }
  id v28 = [(ADRapportLinkConfiguration *)v8->_configuration discoveryOptions];
  id v29 = [v28 includesHome];

  if (v29 == (id)2)
  {
    id v31 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s HomeKit shared homes included", buf, 0xCu);
    }
    v23 |= 0x800uLL;
  }
  else if (v29 == (id)1)
  {
    id v30 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s HomeKit shared homes excluded", buf, 0xCu);
    }
    v23 &= ~0x800uLL;
  }
  id v32 = [(ADRapportLinkConfiguration *)v8->_configuration connectionOptions];
  id v33 = [v32 usesOnDemandConnection];

  if (v33 == (id)2)
  {
    uint64_t v38 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s On-demand Connection enabled", buf, 0xCu);
    }
    v23 |= 0x200uLL;
    goto LABEL_37;
  }
  if (v33 == (id)1) {
    goto LABEL_26;
  }
  if (!v33)
  {
    __int16 v34 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s usesOnDemandConnection Unspecified - default false", buf, 0xCu);
    }
LABEL_26:
    v35 = [(ADRapportLinkConfiguration *)v8->_configuration discoveryOptions];
    id v36 = [v35 includesRemoraDevices];

    if (v36 == (id)2)
    {
      uint64_t v39 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "-[ADRapportLink initWithQueue:configuration:]";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Sidekick endpoints included", buf, 0xCu);
      }
      v23 |= 0x400000000uLL;
      id v22 = (id)(v22 | 0x2000);
    }
    else if (v36 == (id)1)
    {
      id v37 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "-[ADRapportLink initWithQueue:configuration:]";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Sidekick endpoints excluded", buf, 0xCu);
      }
      v23 &= ~0x400000000uLL;
      id v22 = (id)(v22 & 0xFFFFDFFF);
    }
  }
LABEL_37:
  v40 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v41 = [v40 allowsAWDL];

  if (v41 == (id)2)
  {
    uint64_t v43 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s AWDL enabled", buf, 0xCu);
    }
    unint64_t v23 = v23 & 0xFFFFFFFFFFBFFFF7 | 8;
  }
  else if (v41 == (id)1)
  {
    unsigned int v42 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s AWDL disabled", buf, 0xCu);
    }
    unint64_t v23 = v23 & 0xFFFFFFFFFFBFFFF7 | 0x400000;
  }
  v44 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v45 = [v44 allowsBLE];

  if (v45 == (id)2)
  {
    long long v47 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s BLE enabled", buf, 0xCu);
    }
    v23 |= 2uLL;
  }
  else if (v45 == (id)1)
  {
    id v46 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s BLE disabled", buf, 0xCu);
    }
    v23 &= ~2uLL;
  }
  long long v48 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v49 = [v48 allowsForceAWDL];

  if (v49 == (id)2)
  {
    id v50 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s ForceAWDL connection enabled", buf, 0xCu);
    }
    unint64_t v23 = v23 & 0xFFFFFFFFFFBDFFF7 | 0x20008;
  }
  long long v51 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v52 = [v51 allowsForceBLE];

  if (v52 == (id)2)
  {
    long long v53 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s ForceBLE enabled", buf, 0xCu);
    }
    v23 |= 0x8002uLL;
  }
  long long v54 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v55 = [v54 allowsBTPipe];

  if (v55 == (id)2)
  {
    long long v57 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s BTPipe enabled", buf, 0xCu);
    }
    v23 |= 0x20uLL;
  }
  else if (v55 == (id)1)
  {
    id v56 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s BTPipe disabled", buf, 0xCu);
    }
    v23 &= ~0x20uLL;
  }
  id v58 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v59 = [v58 allowsInfraWiFi];

  if (v59 == (id)2)
  {
    id v61 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%s Infra WiFi enabled", buf, 0xCu);
    }
    unint64_t v23 = v23 & 0xFFFFFFFFFFDFFFFBLL | 4;
  }
  else if (v59 == (id)1)
  {
    long long v60 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "%s Infra WiFi disabled", buf, 0xCu);
    }
    unint64_t v23 = v23 & 0xFFFFFFFFFFDFFFFBLL | 0x200000;
  }
  id v62 = [(ADRapportLinkConfiguration *)v8->_configuration enablesProximityTracking];
  if (v62 == (id)2)
  {
    id v64 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%s Proximity enabled", buf, 0xCu);
    }
    v23 |= 0x200000000uLL;
  }
  else if (v62 == (id)1)
  {
    v63 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s Proximity disabled", buf, 0xCu);
    }
    v23 &= ~0x200000000uLL;
  }
  v65 = [(ADRapportLinkConfiguration *)v8->_configuration transportOptions];
  id v66 = [v65 noL2Cap];

  if (v66 == (id)2)
  {
    v67 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s Disable Bluetooth L2Cap connection", buf, 0xCu);
    }
    unint64_t v23 = v23 & 0xFFFFFDFFFFFFFEFFLL | 0x20000000000;
  }
  uint64_t v68 = v23 | 0x4000000000000;
  [(RPCompanionLinkClient *)v8->_client setControlFlags:v68];
  [(RPCompanionLinkClient *)v8->_client setFlags:v22];
  id v69 = [(ADRapportLinkConfiguration *)v8->_configuration connectionOptions];
  BOOL v70 = [v69 usesOnDemandConnection] == (id)2;

  if (v70)
  {
    id v71 = objc_alloc_init((Class)RPCompanionLinkDevice);
    [v71 setIdentifier:@"rapport:rdid:ContextCollector"];
    [(RPCompanionLinkClient *)v8->_client setDestinationDevice:v71];
    v72 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v73 = v8->_client;
      *(_DWORD *)buf = 136315650;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      __int16 v99 = 2112;
      v100 = (RPCompanionLinkClient *)v71;
      __int16 v101 = 2112;
      v102 = v73;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "%s #hal #on-demand Setting destination device:%@ on rapportLink:%@", buf, 0x20u);
    }
  }
  else
  {
    v74 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v75 = v8->_client;
      v76 = v8->_configuration;
      *(_DWORD *)buf = 136316162;
      v98 = "-[ADRapportLink initWithQueue:configuration:]";
      __int16 v99 = 2112;
      v100 = v75;
      __int16 v101 = 2112;
      v102 = v76;
      __int16 v103 = 2048;
      uint64_t v104 = v68;
      __int16 v105 = 1024;
      int v106 = (int)v22;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s #hal init rapportLink:%@ configuration:%@ controlFlags:%llx flags:%dx", buf, 0x30u);
    }
  }
  objc_initWeak((id *)buf, v8);
  v77 = v8->_client;
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_10008762C;
  v94[3] = &unk_10050B790;
  objc_copyWeak(&v95, (id *)buf);
  [(RPCompanionLinkClient *)v77 setInterruptionHandler:v94];
  v78 = v8->_client;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_10008766C;
  v92[3] = &unk_10050B790;
  objc_copyWeak(&v93, (id *)buf);
  [(RPCompanionLinkClient *)v78 setInvalidationHandler:v92];
  v79 = v8->_client;
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1000876AC;
  v90[3] = &unk_1004FFF58;
  objc_copyWeak(&v91, (id *)buf);
  [(RPCompanionLinkClient *)v79 setLocalDeviceUpdatedHandler:v90];
  v80 = v8->_client;
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100087708;
  v88[3] = &unk_1004FFF58;
  objc_copyWeak(&v89, (id *)buf);
  [(RPCompanionLinkClient *)v80 setDeviceLostHandler:v88];
  v81 = v8->_client;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_100087764;
  v86[3] = &unk_1004FFF58;
  objc_copyWeak(&v87, (id *)buf);
  [(RPCompanionLinkClient *)v81 setDeviceFoundHandler:v86];
  v82 = v8->_client;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1000877C0;
  v84[3] = &unk_1004FFF80;
  objc_copyWeak(&v85, (id *)buf);
  [(RPCompanionLinkClient *)v82 setDeviceChangedHandler:v84];
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v91);
  objc_destroyWeak(&v93);
  objc_destroyWeak(&v95);
  objc_destroyWeak((id *)buf);
LABEL_96:

  return v8;
}

- (void)dealloc
{
  [(ADRapportLink *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADRapportLink;
  [(ADRapportLink *)&v3 dealloc];
}

+ (void)updateSiriInfoWithObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _sharedLinkForSiriInfo];
  [v8 updateSiriInfoWithObject:v7 forKey:v6];
}

+ (id)siriInfoToBeBroadcasted
{
  v2 = [a1 _sharedLinkForSiriInfo];
  objc_super v3 = [v2 siriInfoToBeBroadcasted];

  return v3;
}

+ (id)_sharedLinkForSiriInfo
{
  if (qword_100585878 != -1) {
    dispatch_once(&qword_100585878, &stru_100500128);
  }
  v2 = (void *)qword_100585880;
  return v2;
}

@end