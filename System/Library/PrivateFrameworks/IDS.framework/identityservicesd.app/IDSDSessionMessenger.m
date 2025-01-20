@interface IDSDSessionMessenger
- (BOOL)_canSendMessageLocally:(id)a3 toDestinations:(id)a4 withCommand:(id)a5;
- (BOOL)alwaysSkipSelf;
- (IDSDAccountController)accountController;
- (IDSDSession)delegate;
- (IDSDSessionMessenger)initWithDictionary:(id)a3 sharedState:(id)a4 accountController:(id)a5;
- (IDSDSessionSharedState)sharedState;
- (IDSPushHandler)pushHandler;
- (NSNumber)remoteUsePhoneContinuityLocalMessage;
- (void)_sendSinglePathMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 forceLocalDelivery:(BOOL)a6 messageGUID:(id)a7 fromURI:(id)a8 willSendBlock:(id)a9 completionBlock:(id)a10;
- (void)receivedEndMessage:(id)a3 fromURI:(id)a4;
- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6;
- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6 willSendBlock:(id)a7 completionBlock:(id)a8;
- (void)sendMessage:(id)a3 withCommand:(id)a4;
- (void)sendReinitiateMessageWithSubcommand:(int64_t)a3;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setAlwaysSkipSelf:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3;
- (void)setSharedState:(id)a3;
@end

@implementation IDSDSessionMessenger

- (IDSDSessionMessenger)initWithDictionary:(id)a3 sharedState:(id)a4 accountController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IDSDSessionMessenger;
  v11 = [(IDSDSessionMessenger *)&v20 init];
  if (v11)
  {
    uint64_t v19 = 0;
    IMGetConferenceSettings();
    id v12 = 0;
    uint64_t v13 = +[IDSPushHandler sharedInstance];
    pushHandler = v11->_pushHandler;
    v11->_pushHandler = (IDSPushHandler *)v13;

    objc_storeStrong((id *)&v11->_accountController, a5);
    if (!v11->_pushHandler)
    {
      v15 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not create IDSPushHandler for session", v18, 2u);
      }
    }
    v16 = [v8 objectForKey:IDSSessionAlwaysSkipSelfKey];
    v11->_alwaysSkipSelf = [v16 BOOLValue];

    objc_storeStrong((id *)&v11->_sharedState, a4);
  }

  return v11;
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v9 = _IDSSessionProtocolVersionNumber();
  if (v9)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageVersion, v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B260();
  }

  id v10 = [(IDSDSessionMessenger *)self sharedState];
  v11 = [v10 uniqueID];

  if (v11)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageSessionID, v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B1D8();
  }

  id v12 = [(IDSDSessionMessenger *)self sharedState];
  uint64_t v13 = [v12 participantID];

  if (v13)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageParticipantID, v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B150();
  }

  if (v6) {
    CFDictionarySetValue(v8, IDSDSessionMessageInfo, v6);
  }
  v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(IDSDSessionMessenger *)self sharedState];
    v16 = [v15 uniqueID];
    *(_DWORD *)buf = 138412802;
    id v24 = v7;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending MESSAGE to %@, %@ <%@>", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v17 = [(IDSDSessionMessenger *)self sharedState];
      v21 = [v17 uniqueID];
      v22 = v8;
      id v20 = v7;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        v18 = [(IDSDSessionMessenger *)self sharedState];
        v21 = [v18 uniqueID];
        v22 = v8;
        id v20 = v7;
        _IDSLogV();
      }
    }
  }
  uint64_t v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 236, v20, v21, v22);
  [(IDSDSessionMessenger *)self sendMessage:v8 toDestinations:v7 withCommand:v19];
}

- (void)sendMessage:(id)a3 withCommand:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(IDSDSessionMessenger *)self sharedState];
  id v8 = [v9 destinations];
  [(IDSDSessionMessenger *)self sendMessage:v7 toDestinations:v8 withCommand:v6];
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5
{
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6
{
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 fromURI:(id)a6 willSendBlock:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v17)
  {
    id v20 = [(IDSDSessionMessenger *)self sharedState];
    id v17 = [v20 fromURI];
  }
  v35 = v19;
  v36 = v17;
  v37 = v18;
  v38 = v16;
  v39 = v14;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v15;
  id v21 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v21)
  {
    id v22 = v21;
    v41 = 0;
    v42 = 0;
    uint64_t v43 = *(void *)v45;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        __int16 v25 = [v24 prefixedURI];
        v26 = [(IDSDSessionMessenger *)self sharedState];
        __int16 v27 = [v26 accountID];
        v28 = [(IDSDSessionMessenger *)self sharedState];
        v29 = [v28 serviceName];
        unsigned int v30 = +[IDSDAccountController isDefaultPairedDeviceFromID:v25 accountUniqueID:v27 serviceName:v29];

        if (v30)
        {
          id v31 = v42;
          if (!v42)
          {
            id v31 = objc_alloc_init((Class)NSMutableSet);
            v42 = v31;
          }
        }
        else
        {
          id v31 = v41;
          if (!v41)
          {
            id v31 = objc_alloc_init((Class)NSMutableSet);
            v41 = v31;
          }
        }
        [v31 addObject:v24];
      }
      id v22 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v22);
  }
  else
  {
    v41 = 0;
    v42 = 0;
  }

  if ([v42 count])
  {
    v32 = +[NSString stringGUID];
    [(IDSDSessionMessenger *)self _sendSinglePathMessage:v39 toDestinations:v42 withCommand:v38 forceLocalDelivery:0 messageGUID:v32 fromURI:v36 willSendBlock:v37 completionBlock:v35];
  }
  v33 = v41;
  if ([v41 count])
  {
    v34 = +[NSString stringGUID];
    [(IDSDSessionMessenger *)self _sendSinglePathMessage:v39 toDestinations:v41 withCommand:v38 forceLocalDelivery:0 messageGUID:v34 fromURI:v36 willSendBlock:v37 completionBlock:v35];
    if ([(IDSDSessionMessenger *)self _canSendMessageLocally:v39 toDestinations:obj withCommand:v38])
    {
      [(IDSDSessionMessenger *)self _sendSinglePathMessage:v39 toDestinations:v41 withCommand:v38 forceLocalDelivery:1 messageGUID:v34 fromURI:v36 willSendBlock:v37 completionBlock:v35];
    }

    v33 = v41;
  }
}

- (void)_sendSinglePathMessage:(id)a3 toDestinations:(id)a4 withCommand:(id)a5 forceLocalDelivery:(BOOL)a6 messageGUID:(id)a7 fromURI:(id)a8 willSendBlock:(id)a9 completionBlock:(id)a10
{
  BOOL v82 = a6;
  id v85 = a3;
  id v87 = a4;
  id v88 = a5;
  id v89 = a7;
  v86 = (__CFString *)a8;
  id v83 = a9;
  id v84 = a10;
  v91 = self;
  id v15 = [(IDSDSessionMessenger *)self accountController];
  id v16 = [(IDSDSessionMessenger *)self sharedState];
  id v17 = [v16 accountID];
  v90 = [v15 accountWithUniqueID:v17];

  if (v90)
  {
    id v18 = [(IDSDSessionMessenger *)self pushHandler];
    id v19 = [v18 pushToken];

    id v20 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v103 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "My token -> %@", buf, 0xCu);
    }

    id v21 = objc_alloc_init((Class)NSMutableSet);
    long long v100 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v97 = 0u;
    id v22 = v87;
    v23 = 0;
    id v24 = [v22 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v98;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v98 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          v28 = [v27 pushToken];

          v23 = v28;
          v29 = [v28 rawToken];
          unsigned __int8 v30 = [v29 isEqualToData:v19];

          if ((v30 & 1) == 0) {
            [v21 addObject:v27];
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v97 objects:v108 count:16];
      }
      while (v24);
    }

    if ([v21 count])
    {
      id v31 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [v90 unprefixedURIStringsFromRegistration];
        v33 = [v21 allObjects];
        v34 = IMLoggingStringForArray();
        *(_DWORD *)buf = 138412802;
        CFStringRef v103 = v86;
        __int16 v104 = 2112;
        v105 = v32;
        __int16 v106 = 2112;
        v107 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "sendMessage - using fromID %@ given aliases %@  destinations: %@", buf, 0x20u);
      }
      v81 = [v22 anyObject];
      v35 = [v81 prefixedURI];
      v36 = [(IDSDSessionMessenger *)v91 sharedState];
      v37 = [v36 accountID];
      v38 = [(IDSDSessionMessenger *)v91 sharedState];
      v39 = [v38 serviceName];
      unsigned int v80 = +[IDSDAccountController isDefaultPairedDeviceFromID:v35 accountUniqueID:v37 serviceName:v39];

      v40 = [v22 anyObject];
      v41 = [v40 prefixedURI];
      LODWORD(v36) = [v41 hasPrefix:@"guest-device:"];

      if ((v80 | v82 | v36) == 1)
      {
        v42 = [(IDSDSessionMessenger *)v91 sharedState];
        if ([v42 forceInternetInvitation])
        {
          id v43 = 0;
        }
        else
        {
          v50 = [v90 service];
          id v43 = [v50 allowLocalDelivery];
        }
      }
      else
      {
        id v43 = 0;
      }
      id v51 = objc_alloc_init((Class)IDSSendParameters);
      [v51 setPriority:300];
      v52 = +[IDSDestination destinationWithDestinations:v21];
      [v51 setDestinations:v52];

      [v51 setMessage:v85];
      [v51 setCommand:v88];
      v53 = [(__CFString *)v86 unprefixedURI];
      [v51 setFromID:v53];

      [v51 setEncryptPayload:1];
      [v51 setIdentifier:v89];
      v54 = IDSGetUUIDData();
      [v51 setMessageUUID:v54];

      [v51 setFireAndForget:1];
      [v51 setLocalDelivery:v43];
      objc_msgSend(v51, "setAlwaysSkipSelf:", -[IDSDSessionMessenger alwaysSkipSelf](v91, "alwaysSkipSelf"));
      uint64_t v101 = IDSRegistrationPropertyIsC2KEquipment;
      v55 = +[NSArray arrayWithObjects:&v101 count:1];
      [v51 setInterestingRegistrationProperties:v55];

      v56 = [(IDSDSessionMessenger *)v91 sharedState];
      objc_msgSend(v51, "setSessionForceInternetInvitation:", objc_msgSend(v56, "forceInternetInvitation"));

      if ([v88 integerValue] == (id)232)
      {
        v57 = [(IDSDSessionMessenger *)v91 sharedState];
        [v57 inviteTimeout];
        double v59 = v58;

        [v51 setTimeout:v59];
        [v51 setEnforceRemoteTimeouts:1];
      }
      v60 = [(IDSDSessionMessenger *)v91 sharedState];
      v61 = [v60 requiredLackOfCapabilities];
      id v62 = [v61 count];

      if (v62)
      {
        v63 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [(IDSDSessionMessenger *)v91 sharedState];
          v65 = [v64 requiredLackOfCapabilities];
          *(_DWORD *)buf = 138412290;
          CFStringRef v103 = v65;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "sendMessage - requires lack of properties {requiredLackOfCapabilities: %@}", buf, 0xCu);
        }
        v66 = [(IDSDSessionMessenger *)v91 sharedState];
        v67 = [v66 requiredLackOfCapabilities];
        [v51 setRequireLackOfRegistrationProperties:v67];
      }
      v68 = [(IDSDSessionMessenger *)v91 sharedState];
      v69 = [v68 requiredCapabilities];
      id v70 = [v69 count];

      if (v70)
      {
        v71 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v72 = [(IDSDSessionMessenger *)v91 sharedState];
          v73 = [v72 requiredCapabilities];
          *(_DWORD *)buf = 138412290;
          CFStringRef v103 = v73;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "sendMessage - requires properties {requiredCapabilities: %@}", buf, 0xCu);
        }
        v74 = [(IDSDSessionMessenger *)v91 sharedState];
        v75 = [v74 requiredCapabilities];
        [v51 setRequireAllRegistrationProperties:v75];
      }
      if (((!v82 | v80) & 1) == 0 && [v88 integerValue] == (id)236)
      {
        v76 = [(IDSDSessionMessenger *)v91 sharedState];
        v77 = [v76 uniqueID];
        [v51 setSessionID:v77];
      }
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_10005AEF4;
      v95[3] = &unk_100980188;
      id v96 = v83;
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_10005AF0C;
      v92[3] = &unk_1009801B0;
      id v93 = v89;
      id v94 = v84;
      [v90 sendMessageWithSendParameters:v51 willSendBlock:v95 completionBlock:v92];
    }
    else
    {
      v49 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "No destinations to send message to, ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }

    goto LABEL_45;
  }
  long long v44 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    long long v45 = [(IDSDSessionMessenger *)self sharedState];
    long long v46 = [v45 accountID];
    *(_DWORD *)buf = 138412546;
    CFStringRef v103 = @"IDSDSession";
    __int16 v104 = 2112;
    v105 = v46;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@ - No account with unique ID %@ found to send a message, bailing...", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    long long v47 = [(IDSDSessionMessenger *)self sharedState];
    v78 = [v47 accountID];
    _IDSWarnV();

    v48 = [(IDSDSessionMessenger *)self sharedState];
    v79 = [v48 accountID];
    _IDSLogV();

    id v19 = [(IDSDSessionMessenger *)self sharedState];
    v23 = [(__CFString *)v19 accountID];
    _IDSLogTransport();
LABEL_45:
  }
}

- (BOOL)_canSendMessageLocally:(id)a3 toDestinations:(id)a4 withCommand:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(IDSDSessionMessenger *)self sharedState];
  if ([v11 clientType] != (id)4) {
    goto LABEL_14;
  }
  id v12 = +[NSNumber numberWithInt:236];
  if (([v10 isEqualToNumber:v12] & 1) == 0)
  {
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v13 = [(IDSDSessionMessenger *)self sharedState];
  if ([v13 state] != 5)
  {

    goto LABEL_13;
  }
  id v14 = [(IDSDSessionMessenger *)self remoteUsePhoneContinuityLocalMessage];

  if (!v14)
  {
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  id v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "This Phone Continuity session supports the local message. Trying the local...", v18, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSessionMessenger *)self sharedState];
    id v10 = [v9 uniqueID];
    int v24 = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received MESSAGE %@ from %@, %@", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v11 = IDSDSessionMessageInfo;
  id v12 = [v6 objectForKey:IDSDSessionMessageInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v6 objectForKey:v11];
    uint64_t v14 = +[NSData _IDSDataFromBase64String:v13];
  }
  else
  {
    uint64_t v13 = [v6 objectForKey:v11];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = 0;
      goto LABEL_9;
    }
    uint64_t v14 = [v6 objectForKey:v11];
  }
  id v15 = (void *)v14;
LABEL_9:

  id v16 = objc_alloc_init((Class)IMMessageContext);
  [v16 setShouldBoost:1];
  id v17 = +[IDSDaemon sharedInstance];
  id v18 = [(IDSDSessionMessenger *)self sharedState];
  id v19 = [v18 pushTopic];
  id v20 = [v17 broadcasterForTopic:v19 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v16];

  id v21 = [(IDSDSessionMessenger *)self sharedState];
  id v22 = [v21 uniqueID];
  v23 = [v7 prefixedURI];
  [v20 sessionMessageReceived:v22 fromID:v23 withData:v15];
}

- (void)receivedEndMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSessionMessenger *)self sharedState];
    id v10 = [v9 uniqueID];
    int v25 = 138412802;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    unsigned __int8 v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received END %@ from %@, %@", (uint8_t *)&v25, 0x20u);
  }
  uint64_t v11 = IDSDSessionMessageContext;
  id v12 = [v6 objectForKey:IDSDSessionMessageContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v6 objectForKey:v11];
    uint64_t v14 = +[NSData _IDSDataFromBase64String:v13];
  }
  else
  {
    uint64_t v13 = [v6 objectForKey:v11];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = 0;
      goto LABEL_9;
    }
    uint64_t v14 = [v6 objectForKey:v11];
  }
  id v15 = (void *)v14;
LABEL_9:

  id v16 = objc_alloc_init((Class)IMMessageContext);
  [v16 setShouldBoost:1];
  id v17 = +[IDSDaemon sharedInstance];
  id v18 = [(IDSDSessionMessenger *)self sharedState];
  id v19 = [v18 pushTopic];
  id v20 = [v17 broadcasterForTopic:v19 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v16];

  id v21 = [(IDSDSessionMessenger *)self sharedState];
  id v22 = [v21 uniqueID];
  v23 = [v7 prefixedURI];
  [v20 sessionEndReceived:v22 fromID:v23 withData:v15];

  int v24 = [(IDSDSessionMessenger *)self delegate];
  [v24 endSessionWithReason:7];
}

- (void)sendReinitiateMessageWithSubcommand:(int64_t)a3
{
  v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v6 = _IDSSessionProtocolVersionNumber();
  if (v6)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageVersion, v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B260();
  }

  id v7 = [(IDSDSessionMessenger *)self sharedState];
  id v8 = [v7 uniqueID];

  if (v8)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageSessionID, v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B1D8();
  }

  id v9 = [(IDSDSessionMessenger *)self sharedState];
  id v10 = [v9 participantID];

  if (v10)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageParticipantID, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B150();
  }

  uint64_t v11 = +[NSNumber numberWithInteger:a3];
  if (v11)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageReinitiateSubcommand, v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B2E8();
  }

  id v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = +[NSNumber numberWithInteger:a3];
    uint64_t v14 = [(IDSDSessionMessenger *)self sharedState];
    id v15 = [v14 destinations];
    id v16 = [(IDSDSessionMessenger *)self sharedState];
    id v17 = [v16 uniqueID];
    *(_DWORD *)buf = 138413058;
    v33 = v13;
    __int16 v34 = 2112;
    v35 = v5;
    __int16 v36 = 2112;
    v37 = v15;
    __int16 v38 = 2112;
    v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending REINITIATE (subcommand %@) %@ to %@, %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v18 = +[NSNumber numberWithInteger:a3];
      id v19 = [(IDSDSessionMessenger *)self sharedState];
      id v20 = [v19 destinations];
      id v21 = [(IDSDSessionMessenger *)self sharedState];
      [v21 uniqueID];
      v31 = unsigned __int8 v30 = v20;
      id v28 = v18;
      __int16 v29 = v5;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v18, v5, v20, v31);
        v23 = [(IDSDSessionMessenger *)self sharedState];
        int v24 = [v23 destinations];
        int v25 = [(IDSDSessionMessenger *)self sharedState];
        [v25 uniqueID];
        v31 = unsigned __int8 v30 = v24;
        id v28 = v22;
        __int16 v29 = v5;
        _IDSLogV();
      }
    }
  }
  id v26 = [(IDSDSessionMessenger *)self sharedState];
  __int16 v27 = [v26 destinations];
  [(IDSDSessionMessenger *)self sendMessage:v5 toDestinations:v27 withCommand:&off_1009D0C18];
}

- (BOOL)alwaysSkipSelf
{
  return self->_alwaysSkipSelf;
}

- (void)setAlwaysSkipSelf:(BOOL)a3
{
  self->_alwaysSkipSelf = a3;
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSDSession)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSDSession *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)remoteUsePhoneContinuityLocalMessage
{
  return self->_remoteUsePhoneContinuityLocalMessage;
}

- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3
{
}

- (IDSDSessionSharedState)sharedState
{
  return self->_sharedState;
}

- (void)setSharedState:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_sharedState, 0);
  objc_storeStrong((id *)&self->_remoteUsePhoneContinuityLocalMessage, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_pushHandler, 0);
}

@end