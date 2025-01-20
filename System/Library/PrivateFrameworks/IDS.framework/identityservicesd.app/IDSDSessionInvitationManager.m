@interface IDSDSessionInvitationManager
- (BOOL)_isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform;
- (BOOL)_isValidDestination:(id)a3;
- (BOOL)remoteAssumeRemoteDeviceEncryption;
- (BOOL)useStunMICheck;
- (IDSDSession)delegate;
- (IDSDSessionInvitationManager)initWithDictionary:(id)a3 sharedState:(id)a4 messenger:(id)a5;
- (IDSDSessionMessenger)messenger;
- (IDSDSessionSharedState)sharedState;
- (NSData)quickRelaySessionToken;
- (NSData)remoteBlob;
- (NSDictionary)preferences;
- (id)_acceptedDeviceToken;
- (id)_acceptedDeviceUniqueID;
- (id)publicIdentityDataFromLocalFullIdentity;
- (unsigned)SSRCRecv;
- (unsigned)SSRCSend;
- (unsigned)seqRecvStart;
- (unsigned)seqSendStart;
- (void)_sendAcceptMessageWithContext:(id)a3 connectionData:(id)a4;
- (void)_sendCancelInvitationToDestinations:(id)a3 withData:(id)a4;
- (void)_sendInvitationMessageToDestinations:(id)a3 withOptions:(id)a4 contextData:(id)a5 declineOnError:(BOOL)a6 connectionData:(id)a7;
- (void)_sendInvitationWithOptions:(id)a3 data:(id)a4 declineOnError:(BOOL)a5;
- (void)acceptInvitation;
- (void)acceptInvitationWithData:(id)a3;
- (void)cancelInvitation;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)declineInvitation;
- (void)declineInvitationWithData:(id)a3;
- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5;
- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4;
- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4;
- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4;
- (void)sendCancelInvitationToDestinations:(id)a3 remoteEndReason:(unsigned int)a4 data:(id)a5;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setQuickRelaySessionToken:(id)a3;
- (void)setRemoteAssumeRemoteDeviceEncryption:(BOOL)a3;
- (void)setRemoteBlob:(id)a3;
- (void)setSSRCRecv:(unsigned int)a3;
- (void)setSSRCSend:(unsigned int)a3;
- (void)setSeqRecvStart:(unsigned int)a3;
- (void)setSeqSendStart:(unsigned int)a3;
- (void)setSharedState:(id)a3;
- (void)setUseStunMICheck:(BOOL)a3;
@end

@implementation IDSDSessionInvitationManager

- (IDSDSessionInvitationManager)initWithDictionary:(id)a3 sharedState:(id)a4 messenger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSDSessionInvitationManager;
  v11 = [(IDSDSessionInvitationManager *)&v15 init];
  if (v11)
  {
    v12 = [v8 objectForKey:IDSSessionUseStunMessageIntegrityKey];
    v11->_useStunMICheck = [v12 BOOLValue];

    v13 = [v8 objectForKey:IDSDSessionMessageAssumeRemoteDeviceEncryption];
    v11->_remoteAssumeRemoteDeviceEncryption = [v13 BOOLValue];

    objc_storeStrong((id *)&v11->_sharedState, a4);
    objc_storeStrong((id *)&v11->_messenger, a5);
  }

  return v11;
}

- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4
{
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
}

- (void)_sendInvitationWithOptions:(id)a3 data:(id)a4 declineOnError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IDSDSessionInvitationManager *)self sharedState];
  v11 = [v10 connection];
  if (v11)
  {

LABEL_6:
    BOOL v74 = v5;
    v75 = v9;
    v76 = v8;
    objc_super v15 = +[IDSDAccountController sharedInstance];
    v16 = [(IDSDSessionInvitationManager *)self sharedState];
    v17 = [v16 accountID];
    v18 = [v15 accountWithUniqueID:v17];

    v80 = v18;
    unsigned int v79 = [v18 accountType];
    id v19 = objc_alloc((Class)NSMutableSet);
    v20 = [(IDSDSessionInvitationManager *)self sharedState];
    v21 = [v20 destinations];
    v22 = (__CFString *)[v19 initWithSet:v21];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    v23 = [(IDSDSessionInvitationManager *)self sharedState];
    v24 = [v23 destinations];

    id obj = v24;
    id v83 = [v24 countByEnumeratingWithState:&v90 objects:v102 count:16];
    v14 = 0;
    v25 = 0;
    if (!v83) {
      goto LABEL_33;
    }
    uint64_t v82 = *(void *)v91;
    uint64_t v77 = IDSDevicePropertyIsActivePairedDevice;
    uint64_t v78 = IDSDevicePropertyDefaultLocalDevice;
    unsigned int v26 = v79;
    while (1)
    {
      for (i = 0; i != v83; i = (char *)i + 1)
      {
        if (*(void *)v91 != v82) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        v29 = [(IDSDSessionInvitationManager *)self sharedState];
        unsigned int v30 = [v29 destinationIsDefaultPairedDevice:v28];

        if (v30)
        {
          if (!v14) {
            v14 = objc_alloc_init((Class)NSMutableSet);
          }
          v31 = v14;
          goto LABEL_30;
        }
        if (v26 == 2)
        {
          v32 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v28;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Using local account, can only send invitation to active device, ignoring %@...", buf, 0xCu);
          }

          [(__CFString *)v22 removeObject:v28];
        }
        else
        {
          v33 = [v28 prefixedURI];
          unsigned int v34 = [v33 hasPrefix:@"device:"];

          if (!v34) {
            goto LABEL_27;
          }
          v35 = [v28 unprefixedURI];
          v36 = [v80 dependentRegistrationMatchingUUID:v35];

          if (!v36) {
            goto LABEL_26;
          }
          v37 = [v36 objectForKey:v78];
          unsigned int v38 = [v37 BOOLValue];

          [v36 objectForKey:v77];
          v39 = v25;
          v40 = v14;
          v41 = v22;
          v43 = v42 = self;
          unsigned __int8 v44 = [v43 BOOLValue];

          self = v42;
          v22 = v41;
          v14 = v40;
          v25 = v39;
          if (!v38 || (v44 & 1) != 0)
          {
LABEL_26:

            unsigned int v26 = v79;
LABEL_27:
            if (!v25) {
              v25 = objc_alloc_init((Class)NSMutableSet);
            }
            v31 = v25;
LABEL_30:
            [v31 addObject:v28];
            continue;
          }
          v45 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v95 = v28;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Trying to send invite to inactive device, ignoring %@...", buf, 0xCu);
          }

          [(__CFString *)v22 removeObject:v28];
          unsigned int v26 = v79;
        }
      }
      id v83 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
      if (!v83)
      {
LABEL_33:

        v46 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = [(IDSDSessionInvitationManager *)self sharedState];
          v48 = [v47 destinations];
          *(_DWORD *)buf = 138413058;
          v95 = v48;
          __int16 v96 = 2112;
          CFStringRef v97 = v22;
          __int16 v98 = 2112;
          v99 = v14;
          __int16 v100 = 2112;
          v101 = v25;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Send invitation with destinations %@ newDestinations %@ pairedDestinations %@ allOtherDestinations %@", buf, 0x2Au);
        }
        v49 = v25;

        v50 = [(IDSDSessionInvitationManager *)self sharedState];
        [v50 setDestinations:v22];

        id v9 = v75;
        id v8 = v76;
        if ([v14 count])
        {
          v51 = [(IDSDSessionInvitationManager *)self sharedState];
          unsigned __int8 v52 = [v51 forceInternetInvitation];

          if ((v52 & 1) == 0)
          {
            v53 = +[NSData data];
            v54 = +[IDSFoundationLog IDSDSession];
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v55 = [(IDSDSessionInvitationManager *)self sharedState];
              unsigned int v56 = [v55 isScreenSharingSession];
              CFStringRef v57 = @"NO";
              if (v56) {
                CFStringRef v57 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              v95 = v53;
              __int16 v96 = 2112;
              CFStringRef v97 = v57;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Got connection data %@, isScreenSharingSession %@", buf, 0x16u);
            }
            [(IDSDSessionInvitationManager *)self _sendInvitationMessageToDestinations:v14 withOptions:v76 contextData:v75 declineOnError:v74 connectionData:v53];
            v58 = [(IDSDSessionInvitationManager *)self sharedState];
            [v58 setInvitationTimer];
          }
        }
        if ([v25 count]
          || ([(IDSDSessionInvitationManager *)self sharedState],
              v59 = objc_claimAutoreleasedReturnValue(),
              unsigned int v60 = [v59 forceInternetInvitation],
              v59,
              v60))
        {
          v61 = v25;
          v62 = [(IDSDSessionInvitationManager *)self sharedState];
          unsigned int v63 = [v62 forceInternetInvitation];

          if (v63)
          {
            v64 = v14;

            v61 = v64;
          }
          v65 = [(IDSDSessionInvitationManager *)self delegate];
          v84[0] = _NSConcreteStackBlock;
          v84[1] = 3221225472;
          v84[2] = sub_1002E9B28;
          v84[3] = &unk_1009883F0;
          v84[4] = self;
          v85 = v61;
          id v86 = v76;
          id v87 = v75;
          BOOL v89 = v74;
          v88 = v14;
          v66 = v61;
          [v65 networkingIsAvailable:v84];
        }
        v67 = [(IDSDSessionInvitationManager *)self sharedState];
        [v67 setState:3];

        v68 = [(IDSDSessionInvitationManager *)self preferences];
        [(IDSDSessionInvitationManager *)self _setLinkPreferences:v68];

        v69 = [(IDSDSessionInvitationManager *)self delegate];
        v70 = [(IDSDSessionInvitationManager *)self sharedState];
        v71 = [v70 destinations];
        v72 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v71 count]);
        [v69 submitAWDMetricsForIDSSessionInvitationSentWithNumberOfRecipients:v72];

        v73 = +[IDSDSessionController sharedInstance];
        [v73 updateCriticalReliabilityState];

        goto LABEL_48;
      }
    }
  }
  v12 = [(IDSDSessionInvitationManager *)self sharedState];
  unsigned int v13 = [v12 isScreenSharingSession];

  if (!v13) {
    goto LABEL_6;
  }
  v14 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No legacy connection, bailing...", buf, 2u);
  }
LABEL_48:
}

- (void)_sendInvitationMessageToDestinations:(id)a3 withOptions:(id)a4 contextData:(id)a5 declineOnError:(BOOL)a6 connectionData:(id)a7
{
  BOOL v8 = a6;
  id v81 = a3;
  id v12 = a4;
  id v13 = a5;
  id v82 = a7;
  v14 = [(IDSDSessionInvitationManager *)self sharedState];
  objc_super v15 = [v14 uniqueID];

  if (v15)
  {
    v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v17 = _IDSSessionProtocolVersionNumber();
    if (v17)
    {
      CFDictionarySetValue(v16, IDSDSessionMessageVersion, v17);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B260();
    }

    id v19 = v82;
    if (v19)
    {
      CFDictionarySetValue(v16, IDSDSessionMessageBlob, v19);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E578();
    }

    v20 = [(IDSDSessionInvitationManager *)self sharedState];
    v21 = [v20 uniqueID];

    if (v21)
    {
      CFDictionarySetValue(v16, IDSDSessionMessageSessionID, v21);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B1D8();
    }

    v22 = [(IDSDSessionInvitationManager *)self sharedState];
    v23 = [v22 participantID];

    if (v23)
    {
      CFDictionarySetValue(v16, IDSDSessionMessageParticipantID, v23);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B150();
    }

    v24 = [(IDSDSessionInvitationManager *)self sharedState];
    v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 transportType]);

    if (v25)
    {
      CFDictionarySetValue(v16, IDSDSessionMessageTransportType, v25);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E4F0();
    }

    unsigned int v26 = +[NSNumber numberWithBool:v8];
    if (v26)
    {
      CFDictionarySetValue(v16, IDSDSessionMessageDeclineOnNetworkError, v26);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E468();
    }

    if (v12) {
      CFDictionarySetValue(v16, IDSDSessionMessageInviteOptions, v12);
    }
    if (v13) {
      CFDictionarySetValue(v16, IDSDSessionMessageContext, v13);
    }
    v27 = [(IDSDSessionInvitationManager *)self quickRelaySessionToken];
    if (v27) {
      CFDictionarySetValue(v16, IDSDSessionMessageQuickRelaySessionToken, v27);
    }

    v28 = [(IDSDSessionInvitationManager *)self sharedState];
    v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v28 enableSKE]);

    if (v29) {
      CFDictionarySetValue(v16, IDSDSessionMessageNeedsToWaitForPreConnectionData, v29);
    }

    unsigned int v30 = [(IDSDSessionInvitationManager *)self sharedState];
    v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 disableEncryption]);

    if (v31) {
      CFDictionarySetValue(v16, IDSDSessionMessageDisableEncryption, v31);
    }

    v32 = [(IDSDSessionInvitationManager *)self sharedState];
    v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v32 enableSingleChannelDirectMode]);

    if (v33) {
      CFDictionarySetValue(v16, IDSDSessionMessageSingleChannelDirectMode, v33);
    }

    CFDictionarySetValue(v16, IDSDSessionMessageUseStunMessageIntegrity, &__kCFBooleanTrue);
    CFDictionarySetValue(v16, IDSDSessionMessageUseSecureQRControlMessage, &__kCFBooleanTrue);
    unsigned int v34 = [(IDSDSessionInvitationManager *)self sharedState];
    v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v34 useBTDatagramPipe]);

    if (v35) {
      CFDictionarySetValue(v16, IDSDSessionMessageIsRealTime, v35);
    }

    v36 = [(IDSDSessionInvitationManager *)self sharedState];
    v37 = [v36 localUnauthenticatedFullIdentity];

    if (v37)
    {
      unsigned int v38 = [(IDSDSessionInvitationManager *)self publicIdentityDataFromLocalFullIdentity];
      if (!v38)
      {
        unsigned int v56 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to send invitation because failed to create unauthenticated public key", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
        goto LABEL_80;
      }
      CFDictionarySetValue(v16, IDSSessionUnauthenticatedPublicKey, v38);
    }
    v39 = [(IDSDSessionInvitationManager *)self sharedState];
    BOOL v40 = [v39 connectionCountHint] == 0;

    if (!v40)
    {
      v41 = [(IDSDSessionInvitationManager *)self sharedState];
      v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v41 connectionCountHint]);

      if (v42) {
        CFDictionarySetValue(v16, IDSDSessionMessageConnectionCountHint, v42);
      }
    }
    v43 = [(IDSDSessionInvitationManager *)self sharedState];
    unsigned int v44 = [v43 isScreenSharingSession];

    if (v44)
    {
      if (SecRandomCopyBytes(kSecRandomDefault, 0x3CuLL, self->keyMaterial))
      {
        v45 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          int v46 = *__error();
          v47 = __error();
          v48 = strerror(*v47);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v46;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v48;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "SecRandomCopyBytes failed %d (%s), bailing...", buf, 0x12u);
        }

        v49 = [(IDSDSessionInvitationManager *)self sharedState];
        v50 = [v49 serviceName];
        uint64_t v51 = *__error();
        unsigned __int8 v52 = __error();
        v80 = strerror(*v52);
        DLCWarn();

        v53 = [(IDSDSessionInvitationManager *)self delegate];
        [v53 endSessionWithReason:17];

LABEL_80:
        goto LABEL_81;
      }
      id v57 = [objc_alloc((Class)NSData) initWithBytesNoCopy:self->keyMaterial length:60 freeWhenDone:0];
      if (v57) {
        CFDictionarySetValue(v16, IDSDSessionMessageKeyMaterial, v57);
      }
      [(IDSDSessionInvitationManager *)self setSSRCSend:arc4random()];
      v58 = +[NSNumber numberWithUnsignedInt:[(IDSDSessionInvitationManager *)self SSRCSend]];
      if (v58)
      {
        CFDictionarySetValue(v16, IDSDSessionMessageSelfSSRC, v58);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071E3E0();
      }

      uint64_t v59 = arc4random();
      [(IDSDSessionInvitationManager *)self setSeqSendStart:v59];
      unsigned int v60 = [(IDSDSessionInvitationManager *)self sharedState];
      [v60 setSeqSend:v59];

      v61 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)[(IDSDSessionInvitationManager *)self seqSendStart]];
      if (v61)
      {
        CFDictionarySetValue(v16, IDSDSessionMessageSelfSeqStart, v61);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071E358();
      }
    }
    else
    {
      CFDictionarySetValue(v16, IDSDSessionMessageUseCloudPairedControlChannel, &__kCFBooleanTrue);
      CFDictionarySetValue(v16, IDSDSessionMessageUsePhoneContinuityLocalMessage, &__kCFBooleanTrue);
      v54 = [(IDSDSessionInvitationManager *)self delegate];
      int v55 = [v54 isWithDefaultPairedDevice];

      if ((v55 & 1) == 0) {
        CFDictionarySetValue(v16, IDSDSessionMessageAssumeRemoteDeviceEncryption, &__kCFBooleanTrue);
      }
    }
    v62 = [(IDSDSessionInvitationManager *)self delegate];
    [v62 registerClientChannel];

    unsigned int v63 = [(IDSDSessionInvitationManager *)self sharedState];
    [v63 inviteSentTime];
    BOOL v65 = v64 == 0.0;

    if (v65)
    {
      ids_monotonic_time();
      double v67 = v66;
      v68 = [(IDSDSessionInvitationManager *)self sharedState];
      [v68 setInviteSentTime:v67];
    }
    v69 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = [(IDSDSessionInvitationManager *)self sharedState];
      v71 = [v70 uniqueID];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v81;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v71;
      *(_WORD *)&buf[22] = 2112;
      long long v93 = v16;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Sending invitation to %@, %@ <%@>", buf, 0x20u);
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v93) = 0;
    id v72 = objc_alloc_init((Class)IMMessageContext);
    [v72 setShouldBoost:1];
    v73 = +[IDSDaemon sharedInstance];
    BOOL v74 = [(IDSDSessionInvitationManager *)self sharedState];
    v75 = [v74 pushTopic];
    v76 = [v73 broadcasterForTopic:v75 entitlement:kIDSSessionEntitlement command:0 messageContext:v72];

    uint64_t v77 = [(IDSDSessionInvitationManager *)self messenger];
    uint64_t v78 = +[NSNumber numberWithInteger:232];
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_1002EB5F0;
    v87[3] = &unk_100988438;
    objc_copyWeak(&v90, &location);
    v87[4] = self;
    id v88 = v76;
    BOOL v89 = buf;
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1002EBB7C;
    v83[3] = &unk_100988460;
    id v86 = buf;
    id v79 = v88;
    id v84 = v79;
    v85 = self;
    [v77 sendMessage:v16 toDestinations:v81 withCommand:v78 fromURI:0 willSendBlock:v87 completionBlock:v83];

    objc_destroyWeak(&v90);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
    goto LABEL_80;
  }
  v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not sending invitation because of missing uniqueID", buf, 2u);
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
LABEL_81:
}

- (void)_sendCancelInvitationToDestinations:(id)a3 withData:(id)a4
{
}

- (void)sendCancelInvitationToDestinations:(id)a3 remoteEndReason:(unsigned int)a4 data:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(IDSDSessionInvitationManager *)self sharedState];
  unsigned __int8 v11 = [v10 isInitiator];

  if (v11)
  {
    id v12 = [(IDSDSessionInvitationManager *)self sharedState];
    [v12 clearAllTimers];

    if (v6)
    {
      id v13 = +[NSNumber numberWithInt:v6];
    }
    else
    {
      id v13 = 0;
    }
    objc_super v15 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16 = _IDSSessionProtocolVersionNumber();
    if (v16)
    {
      CFDictionarySetValue(v15, IDSDSessionMessageVersion, v16);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B260();
    }

    v17 = [(IDSDSessionInvitationManager *)self sharedState];
    v18 = [v17 uniqueID];

    if (v18)
    {
      CFDictionarySetValue(v15, IDSDSessionMessageSessionID, v18);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B1D8();
    }

    id v19 = [(IDSDSessionInvitationManager *)self sharedState];
    v20 = [v19 participantID];

    if (v20)
    {
      CFDictionarySetValue(v15, IDSDSessionMessageParticipantID, v20);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B150();
    }

    if (v13) {
      CFDictionarySetValue(v15, IDSDSessionMessageRemoteEndReason, v13);
    }
    if (v9) {
      CFDictionarySetValue(v15, IDSDSessionMessageContext, v9);
    }
    if (![v8 count])
    {
      v21 = [(IDSDSessionInvitationManager *)self sharedState];
      uint64_t v22 = [v21 destinations];

      id v8 = (id)v22;
    }
    v23 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(IDSDSessionInvitationManager *)self sharedState];
      v25 = [v24 uniqueID];
      int v30 = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 2112;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending CANCEL %@, %@ <%@>", (uint8_t *)&v30, 0x20u);
    }
    unsigned int v26 = [(IDSDSessionInvitationManager *)self messenger];
    v27 = +[NSNumber numberWithInteger:235];
    [v26 sendMessage:v15 toDestinations:v8 withCommand:v27];

    v28 = [(IDSDSessionInvitationManager *)self delegate];
    v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    [v28 submitAWDMetricsForIDSSessionCancelSentWithRemoteEndReason:v6 numberOfRecipients:v29];
  }
  else
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "We are the receiver, we can only DECLINE the invite, not CANCEL", (uint8_t *)&v30, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    [(IDSDSessionInvitationManager *)self declineInvitationWithData:v9];
  }
}

- (id)_acceptedDeviceUniqueID
{
  v3 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(IDSDSessionInvitationManager *)self sharedState];
    BOOL v5 = [v4 destinations];
    *(_DWORD *)buf = 138412290;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device unique ID in: %@", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [(IDSDSessionInvitationManager *)self sharedState];
  v7 = [v6 destinations];

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138412290;
    long long v20 = v9;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "pushToken", v20);
        v14 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
        }

        if (v13)
        {
          objc_super v15 = +[IDSDAccountController sharedInstance];
          v16 = [v13 rawToken];
          v17 = [v15 deviceIDForPushToken:v16];

          v18 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "    => Found unique ID: %@", buf, 0xCu);
          }

          if ([v17 length])
          {

            goto LABEL_21;
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v7 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "  => No unique ID found", buf, 2u);
  }
  v17 = 0;
LABEL_21:

  return v17;
}

- (id)_acceptedDeviceToken
{
  v3 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(IDSDSessionInvitationManager *)self sharedState];
    BOOL v5 = [v4 destinations];
    *(_DWORD *)buf = 138412290;
    long long v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device token in: %@", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(IDSDSessionInvitationManager *)self sharedState];
  v7 = [v6 destinations];

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v18;
    *(void *)&long long v9 = 138412290;
    long long v16 = v9;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "pushToken", v16);
      v14 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        long long v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
      }

      if (v13) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

    v7 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "  => No token found", buf, 2u);
    }
    id v13 = 0;
  }

  return v13;
}

- (void)cancelInvitation
{
  [(IDSDSessionInvitationManager *)self _sendCancelInvitationToDestinations:0 withData:0];
  id v3 = [(IDSDSessionInvitationManager *)self delegate];
  [v3 endSessionWithReason:5];
}

- (void)cancelInvitationWithData:(id)a3
{
  [(IDSDSessionInvitationManager *)self _sendCancelInvitationToDestinations:0 withData:a3];
  id v4 = [(IDSDSessionInvitationManager *)self delegate];
  [v4 endSessionWithReason:5];
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  [(IDSDSessionInvitationManager *)self sendCancelInvitationToDestinations:0 remoteEndReason:*(void *)&a3 data:0];
  id v4 = [(IDSDSessionInvitationManager *)self delegate];
  [v4 endSessionWithReason:5];
}

- (void)acceptInvitation
{
}

- (void)acceptInvitationWithData:(id)a3
{
  id value = a3;
  id v4 = objc_alloc_init((Class)NSDate);
  v126 = self;
  BOOL v5 = [(IDSDSessionInvitationManager *)self sharedState];
  [v5 setStartConnectingDate:v4];

  uint64_t v6 = [(IDSDSessionInvitationManager *)self delegate];
  unsigned int v7 = [v6 isWithDefaultPairedDevice];

  id v8 = +[IDSFoundationLog IDSDSession];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_21;
  }
  if (v7) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  id v10 = [(IDSDSessionInvitationManager *)v126 sharedState];
  if ([v10 enableQuickRelay]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  uint64_t v12 = [(IDSDSessionInvitationManager *)v126 sharedState];
  if ([v12 useQRDirectly]) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  v14 = [(IDSDSessionInvitationManager *)v126 sharedState];
  id v15 = [v14 clientType];
  if (v15 == (id)1)
  {
    int v16 = 0;
  }
  else
  {
    v124 = [(IDSDSessionInvitationManager *)v126 sharedState];
    if ([v124 clientType] == (id)5)
    {
      int v16 = 0;
    }
    else
    {
      v123 = [(IDSDSessionInvitationManager *)v126 sharedState];
      int v16 = 1;
      if ([v123 clientType] != (id)6)
      {
        CFStringRef v17 = @"NO";
        goto LABEL_16;
      }
    }
  }
  CFStringRef v17 = @"YES";
LABEL_16:
  *(_DWORD *)buf = 138413058;
  CFStringRef v132 = v9;
  __int16 v133 = 2112;
  CFStringRef v134 = v11;
  __int16 v135 = 2112;
  v136 = (void *)v13;
  __int16 v137 = 2112;
  CFStringRef v138 = v17;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "acceptInvitationWithData isWithDefaultDevice (%@) enableQuickRelay (%@), useQRDirectly (%@), isFaceTime(%@)", buf, 0x2Au);
  if (v16) {

  }
  if (v15 != (id)1) {
LABEL_21:
  }

  long long v18 = [(IDSDSessionInvitationManager *)v126 remoteBlob];
  if (v18) {
    int v19 = 1;
  }
  else {
    int v19 = v7;
  }
  if (v19 == 1)
  {
  }
  else
  {
    long long v20 = [(IDSDSessionInvitationManager *)v126 sharedState];
    unsigned __int8 v21 = [v20 enableQuickRelay];

    if ((v21 & 1) == 0)
    {
      v41 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No remote blob, bailing...", buf, 2u);
      }

      v42 = [(IDSDSessionInvitationManager *)v126 delegate];
      [v42 endSessionWithReason:9];
      goto LABEL_121;
    }
  }
  long long v22 = [(IDSDSessionInvitationManager *)v126 sharedState];
  [v22 clearAllTimers];

  long long v23 = [(IDSDSessionInvitationManager *)v126 sharedState];
  [v23 setConnectionTimer];

  long long v24 = [(IDSDSessionInvitationManager *)v126 sharedState];
  [v24 setState:4];

  v25 = [(IDSDSessionInvitationManager *)v126 delegate];
  [v25 registerClientChannel];

  unsigned int v26 = [(IDSDSessionInvitationManager *)v126 sharedState];
  unsigned int v27 = [v26 isScreenSharingSession];

  if (v27)
  {
    v28 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(IDSDSessionInvitationManager *)v126 remoteBlob];
      *(_DWORD *)buf = 138412290;
      CFStringRef v132 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "acceptInvitationWithData remoteBlob %@", buf, 0xCu);
    }
    int v30 = [(IDSDSessionInvitationManager *)v126 sharedState];
    id v31 = [v30 connection];
    __int16 v32 = [(IDSDSessionInvitationManager *)v126 remoteBlob];
    [v31 receivedRemoteConnectionData:v32];

    v33 = [(IDSDSessionInvitationManager *)v126 sharedState];
    __int16 v34 = [v33 connection];
    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_1002ED9E8;
    v129[3] = &unk_100987950;
    v129[4] = v126;
    id v130 = value;
    [v34 createConnectionData:0 handler:v129];

LABEL_120:
    v111 = [(IDSDSessionInvitationManager *)v126 preferences];
    [(IDSDSessionInvitationManager *)v126 _setLinkPreferences:v111];

    v42 = [(IDSDSessionInvitationManager *)v126 delegate];
    [v42 submitAWDMetricsForIDSSessionAcceptSent];
    goto LABEL_121;
  }
  if (v7)
  {
    v35 = [(IDSDSessionInvitationManager *)v126 sharedState];
    unsigned int v36 = [v35 forceInternetInvitation];

    if (!v36)
    {
      unsigned int v63 = [(IDSDSessionInvitationManager *)v126 delegate];
      [v63 openSocketToDevice:kIDSDefaultPairedDeviceID];

      double v64 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      BOOL v65 = _IDSSessionProtocolVersionNumber();
      if (v65)
      {
        CFDictionarySetValue(v64, IDSDSessionMessageVersion, v65);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070B260();
      }

      BOOL v89 = +[NSData data];
      if (v89)
      {
        CFDictionarySetValue(v64, IDSDSessionMessageBlob, v89);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071E578();
      }

      id v90 = [(IDSDSessionInvitationManager *)v126 sharedState];
      long long v91 = [v90 uniqueID];

      if (v91)
      {
        CFDictionarySetValue(v64, IDSDSessionMessageSessionID, v91);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070B1D8();
      }

      long long v92 = [(IDSDSessionInvitationManager *)v126 sharedState];
      long long v93 = [v92 participantID];

      if (v93)
      {
        CFDictionarySetValue(v64, IDSDSessionMessageParticipantID, v93);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070B150();
      }

      if (value) {
        CFDictionarySetValue(v64, IDSDSessionMessageContext, value);
      }
      CFDictionarySetValue(v64, IDSDSessionMessageUseCloudPairedControlChannel, &__kCFBooleanTrue);
      CFDictionarySetValue(v64, IDSDSessionMessageUseStunMessageIntegrity, &__kCFBooleanTrue);
      CFDictionarySetValue(v64, IDSDSessionMessageUseSecureQRControlMessage, &__kCFBooleanTrue);
      v94 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = [(IDSDSessionInvitationManager *)v126 sharedState];
        __int16 v96 = [v95 destinations];
        CFStringRef v97 = [(IDSDSessionInvitationManager *)v126 sharedState];
        __int16 v98 = [v97 uniqueID];
        *(_DWORD *)buf = 138412802;
        CFStringRef v132 = v96;
        __int16 v133 = 2112;
        CFStringRef v134 = v98;
        __int16 v135 = 2112;
        v136 = v64;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Sending accept to %@, %@ <%@>", buf, 0x20u);
      }
      v99 = [(IDSDSessionInvitationManager *)v126 messenger];
      __int16 v100 = +[NSNumber numberWithInteger:233];
      [v99 sendMessage:v64 withCommand:v100];

      goto LABEL_120;
    }
  }
  v37 = [(IDSDSessionInvitationManager *)v126 _acceptedDeviceUniqueID];

  BOOL v38 = v37 == 0;
  v39 = [(IDSDSessionInvitationManager *)v126 sharedState];
  BOOL v40 = v39;
  if (v38)
  {
    unsigned __int8 v43 = [v39 useQRDirectly];

    if ((v43 & 1) == 0
      && ![(IDSDSessionInvitationManager *)v126 remoteAssumeRemoteDeviceEncryption])
    {
      v112 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        v113 = [(IDSDSessionInvitationManager *)v126 sharedState];
        v114 = [v113 fromURI];
        v115 = [(IDSDSessionInvitationManager *)v126 sharedState];
        v116 = [v115 uniqueID];
        *(_DWORD *)buf = 138412546;
        CFStringRef v132 = v114;
        __int16 v133 = 2112;
        CFStringRef v134 = v116;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "At ACCEPT invitaion - from %@, session %@, expecting remote device encryption but remote does not specify", buf, 0x16u);
      }
      v42 = [(IDSDSessionInvitationManager *)v126 delegate];
      [v42 endSessionWithReason:17];
      goto LABEL_121;
    }
  }
  else
  {
    [v39 setDisableRemoteDeviceEncryption:1];
  }
  unsigned int v44 = [(IDSDSessionInvitationManager *)v126 sharedState];
  unsigned int v45 = [v44 enableQuickRelay];

  if (v45)
  {
    int v46 = [(IDSDSessionInvitationManager *)v126 sharedState];
    if (([v46 useQRDirectly] & 1) == 0)
    {
      v47 = [(IDSDSessionInvitationManager *)v126 sharedState];
      if ([v47 clientType] != (id)1)
      {
        v48 = [(IDSDSessionInvitationManager *)v126 sharedState];
        if ([v48 clientType] != (id)5)
        {
          v117 = [(IDSDSessionInvitationManager *)v126 sharedState];
          BOOL v118 = [v117 clientType] == (id)6;

          if (!v118) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
      }
    }

LABEL_49:
    v49 = [(IDSDSessionInvitationManager *)v126 delegate];
    [v49 startQRSession];

LABEL_50:
    v50 = +[IDSQuickRelayAllocator sharedInstance];
    uint64_t v51 = [(IDSDSessionInvitationManager *)v126 sharedState];
    unsigned __int8 v52 = [v51 uniqueID];
    [v50 requestAllocationForRecipient:v52];
    goto LABEL_55;
  }
  v53 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v54 = [(IDSDSessionInvitationManager *)v126 remoteBlob];
    *(_DWORD *)buf = 138412290;
    CFStringRef v132 = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "acceptInvitationWithData remoteBlob %@", buf, 0xCu);
  }
  int v55 = [(IDSDSessionInvitationManager *)v126 sharedState];
  unsigned int v56 = [v55 localBlob];
  BOOL v57 = v56 == 0;

  if (!v57)
  {
    v58 = [(IDSDSessionInvitationManager *)v126 delegate];
    uint64_t v59 = [(IDSDSessionInvitationManager *)v126 sharedState];
    unsigned int v60 = [v59 uniqueID];
    [v58 openSocketToDevice:v60];

    v50 = +[IDSUTunController sharedInstance];
    uint64_t v51 = [(IDSDSessionInvitationManager *)v126 sharedState];
    unsigned __int8 v52 = [v51 uniqueID];
    objc_msgSend(v50, "startConnectionForDevice:isInitiator:remotePartyID:useStunMICheck:", v52, 0, 0, -[IDSDSessionInvitationManager useStunMICheck](v126, "useStunMICheck"));
LABEL_55:

    v61 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v62 = _IDSSessionProtocolVersionNumber();
    if (v62)
    {
      CFDictionarySetValue(v61, IDSDSessionMessageVersion, v62);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B260();
    }

    double v66 = [(IDSDSessionInvitationManager *)v126 sharedState];
    double v67 = [v66 localBlob];

    if (v67)
    {
      CFDictionarySetValue(v61, IDSDSessionMessageBlob, v67);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E578();
    }

    v68 = [(IDSDSessionInvitationManager *)v126 sharedState];
    v69 = [v68 uniqueID];

    if (v69)
    {
      CFDictionarySetValue(v61, IDSDSessionMessageSessionID, v69);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B1D8();
    }

    v70 = [(IDSDSessionInvitationManager *)v126 sharedState];
    v71 = [v70 participantID];

    if (v71)
    {
      CFDictionarySetValue(v61, IDSDSessionMessageParticipantID, v71);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070B150();
    }

    if (value) {
      CFDictionarySetValue(v61, IDSDSessionMessageContext, value);
    }
    CFDictionarySetValue(v61, IDSDSessionMessageUseStunMessageIntegrity, &__kCFBooleanTrue);
    CFDictionarySetValue(v61, IDSDSessionMessageUseSecureQRControlMessage, &__kCFBooleanTrue);
    id v72 = [(IDSDSessionInvitationManager *)v126 _acceptedDeviceUniqueID];
    BOOL v73 = v72 == 0;

    if (v73) {
      CFDictionarySetValue(v61, IDSDSessionMessageAssumeRemoteDeviceEncryption, &__kCFBooleanTrue);
    }
    BOOL v74 = [(IDSDSessionInvitationManager *)v126 sharedState];
    v75 = [v74 localUnauthenticatedFullIdentity];

    if (!v75) {
      goto LABEL_115;
    }
    v76 = [(IDSDSessionInvitationManager *)v126 sharedState];
    uint64_t v77 = [v76 localUnauthenticatedFullIdentity];
    id v128 = 0;
    uint64_t v78 = [v77 publicIdentityWithError:&v128];
    id v79 = (__CFString *)v128;

    if (v78)
    {
      v127 = v79;
      v80 = [(__CFString *)v78 dataRepresentationWithError:&v127];
      id v81 = v127;

      if (v80)
      {
        CFDictionarySetValue(v61, IDSSessionUnauthenticatedPublicKey, v80);
        id v82 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          CFStringRef v132 = v78;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Sending unauthenticated public identity {publicIdentity: %{private}@}", buf, 0xCu);
        }
      }
      else
      {
        v101 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          CFStringRef v132 = v81;
          __int16 v133 = 2113;
          CFStringRef v134 = v78;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "Failed to create data from public public identity {error: %{public}@, publicIdentity: %{private}@}", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          v119 = v81;
          v120 = v78;
          _IDSLogTransport();
        }
      }
    }
    else
    {
      id v83 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        id v84 = [(IDSDSessionInvitationManager *)v126 sharedState];
        v85 = [v84 localUnauthenticatedFullIdentity];
        *(_DWORD *)buf = 138543619;
        CFStringRef v132 = v79;
        __int16 v133 = 2113;
        CFStringRef v134 = v85;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Failed to create public identity from full identity {error: %{public}@, fullIdentity: %{private}@}", buf, 0x16u);
      }
      if (!os_log_shim_legacy_logging_enabled())
      {
        id v81 = v79;
        goto LABEL_114;
      }
      id v86 = [(IDSDSessionInvitationManager *)v126 sharedState];
      v121 = [v86 localUnauthenticatedFullIdentity];
      _IDSWarnV();

      id v87 = [(IDSDSessionInvitationManager *)v126 sharedState];
      v122 = [v87 localUnauthenticatedFullIdentity];
      _IDSLogV();

      v80 = [(IDSDSessionInvitationManager *)v126 sharedState];
      [v80 localUnauthenticatedFullIdentity];
      v120 = v119 = v79;
      _IDSLogTransport();

      id v81 = v79;
    }

LABEL_114:
LABEL_115:
    v102 = [(IDSDSessionInvitationManager *)v126 sharedState];
    unsigned __int8 v103 = [v102 isScreenSharingSession];

    if ((v103 & 1) == 0)
    {
      CFDictionarySetValue(v61, IDSDSessionMessageUseCloudPairedControlChannel, &__kCFBooleanTrue);
      CFDictionarySetValue(v61, IDSDSessionMessageUsePhoneContinuityLocalMessage, &__kCFBooleanTrue);
    }
    v104 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = [(IDSDSessionInvitationManager *)v126 sharedState];
      v106 = [v105 destinations];
      v107 = [(IDSDSessionInvitationManager *)v126 sharedState];
      v108 = [v107 uniqueID];
      *(_DWORD *)buf = 138412802;
      CFStringRef v132 = v106;
      __int16 v133 = 2112;
      CFStringRef v134 = v108;
      __int16 v135 = 2112;
      v136 = v61;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Sending accept to %@, %@ <%@>", buf, 0x20u);
    }
    v109 = [(IDSDSessionInvitationManager *)v126 messenger];
    v110 = +[NSNumber numberWithInteger:233];
    [v109 sendMessage:v61 withCommand:v110];

    goto LABEL_120;
  }
  id v88 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Failed to get local connection data, bailing...", buf, 2u);
  }

  v42 = [(IDSDSessionInvitationManager *)v126 delegate];
  [v42 endSessionWithReason:8];
LABEL_121:
}

- (void)_sendAcceptMessageWithContext:(id)a3 connectionData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v9 = _IDSSessionProtocolVersionNumber();
  if (v9)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageVersion, v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B260();
  }

  id v10 = v7;
  if (v10)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageBlob, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E578();
  }

  CFStringRef v11 = [(IDSDSessionInvitationManager *)self sharedState];
  uint64_t v12 = [v11 uniqueID];

  if (v12)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageSessionID, v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B1D8();
  }

  CFStringRef v13 = [(IDSDSessionInvitationManager *)self sharedState];
  v14 = [v13 participantID];

  if (v14)
  {
    CFDictionarySetValue(v8, IDSDSessionMessageParticipantID, v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B150();
  }

  if (v6) {
    CFDictionarySetValue(v8, IDSDSessionMessageContext, v6);
  }
  id v15 = [(IDSDSessionInvitationManager *)self sharedState];
  int v16 = [v15 localUnauthenticatedFullIdentity];

  if (v16)
  {
    CFStringRef v17 = [(IDSDSessionInvitationManager *)self publicIdentityDataFromLocalFullIdentity];
    if (!v17)
    {
      v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to send IDSSession because failed to create unauthenticatedPublicIdentityData", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      goto LABEL_57;
    }
    long long v18 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [(IDSDSessionInvitationManager *)self sharedState];
      long long v20 = [v19 localUnauthenticatedFullIdentity];
      *(_DWORD *)buf = 138477827;
      *(void *)unsigned int v56 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending unauthenticated public identity {localUnauthenticatedFullIdentity: %{private}@}", buf, 0xCu);
    }
    CFDictionarySetValue(v8, IDSSessionUnauthenticatedPublicKey, v17);
  }
  unsigned __int8 v21 = [(IDSDSessionInvitationManager *)self sharedState];
  unsigned int v22 = [v21 isScreenSharingSession];

  if (!v22)
  {
LABEL_54:
    int v46 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = [(IDSDSessionInvitationManager *)self sharedState];
      v48 = [v47 destinations];
      v49 = [(IDSDSessionInvitationManager *)self sharedState];
      v50 = [v49 uniqueID];
      *(_DWORD *)buf = 138412802;
      *(void *)unsigned int v56 = v48;
      *(_WORD *)&v56[8] = 2112;
      *(void *)&v56[10] = v50;
      __int16 v57 = 2112;
      v58 = v8;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Sending accept to %@, %@, <%@>", buf, 0x20u);
    }
    uint64_t v51 = [(IDSDSessionInvitationManager *)self messenger];
    unsigned __int8 v52 = +[NSNumber numberWithInteger:233];
    [v51 sendMessage:v8 withCommand:v52];

    goto LABEL_57;
  }
  long long v23 = malloc_type_malloc(0x3CuLL, 0x9EB3704BuLL);
  if (v23)
  {
    if (SecRandomCopyBytes(kSecRandomDefault, 0x3CuLL, v23))
    {
      int v24 = *__error();
      v25 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v26 = strerror(v24);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)unsigned int v56 = v24;
        *(_WORD *)&v56[4] = 2080;
        *(void *)&v56[6] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SecRandomCopyBytes failed %d (%s), bailing...", buf, 0x12u);
      }

      unsigned int v27 = [(IDSDSessionInvitationManager *)self delegate];
      [v27 endSessionWithReason:17];

      free(v23);
      goto LABEL_57;
    }
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1002EE4D8;
    v54[3] = &unk_100984DF8;
    v54[4] = v23;
    id v31 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v23 length:60 deallocator:v54];
    v53 = v31;
    if (v31)
    {
      CFDictionarySetValue(v8, IDSDSessionMessageKeyMaterial, v31);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E600();
    }

    uint64_t v32 = arc4random();
    self->_SSRCSend = v32;
    v33 = +[NSNumber numberWithUnsignedInt:v32];
    if (v33)
    {
      CFDictionarySetValue(v8, IDSDSessionMessageSelfSSRC, v33);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E3E0();
    }

    uint64_t v34 = arc4random();
    [(IDSDSessionInvitationManager *)self setSeqSendStart:v34];
    v35 = [(IDSDSessionInvitationManager *)self sharedState];
    [v35 setSeqSend:v34];

    unsigned int v36 = +[NSNumber numberWithUnsignedShort:LOWORD(self->_seqSendStart)];
    if (v36)
    {
      CFDictionarySetValue(v8, IDSDSessionMessageSelfSeqStart, v36);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071E358();
    }

    for (uint64_t i = 0; i != 60; ++i)
      self->keyMaterial[i] ^= *((unsigned char *)v23 + i);
    BOOL v38 = [(IDSDSessionInvitationManager *)self sharedState];
    BOOL v39 = [v38 peerProtocolVersion] > 1;

    BOOL v40 = [(IDSDSessionInvitationManager *)self sharedState];
    v41 = [v40 encryptionState];

    int v42 = sub_100220DA4(v41, (uint64_t)self->keyMaterial, 60, 0, [(IDSDSessionInvitationManager *)self SSRCSend], (__int16)[(IDSDSessionInvitationManager *)self seqSendStart], [(IDSDSessionInvitationManager *)self SSRCRecv], (__int16)[(IDSDSessionInvitationManager *)self seqRecvStart], v39);
    *(_OWORD *)&self->keyMaterial[44] = 0u;
    *(_OWORD *)&self->keyMaterial[16] = 0u;
    *(_OWORD *)&self->keyMaterial[32] = 0u;
    *(_OWORD *)self->keyMaterial = 0u;
    if (v42)
    {
      unsigned __int8 v43 = [(IDSDSessionInvitationManager *)self delegate];
      [v43 endSessionWithReason:17];

      unsigned int v44 = [(IDSDSessionInvitationManager *)self sharedState];
      [v44 setEncryptionInitialized:0];

      goto LABEL_57;
    }
    unsigned int v45 = [(IDSDSessionInvitationManager *)self sharedState];
    [v45 setEncryptionInitialized:1];

    goto LABEL_54;
  }
  v29 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Malloc error when creating key material, ending call...", buf, 2u);
  }

  int v30 = [(IDSDSessionInvitationManager *)self delegate];
  [v30 endSessionWithReason:17];

LABEL_57:
}

- (void)declineInvitation
{
}

- (void)declineInvitationWithData:(id)a3
{
}

- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = [(IDSDSessionInvitationManager *)self sharedState];
  [v11 clearAllTimers];

  uint64_t v12 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v13 = _IDSSessionProtocolVersionNumber();
  if (v13)
  {
    CFDictionarySetValue(v12, IDSDSessionMessageVersion, v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B260();
  }

  v14 = [(IDSDSessionInvitationManager *)self sharedState];
  id v15 = [v14 uniqueID];

  if (v15)
  {
    CFDictionarySetValue(v12, IDSDSessionMessageSessionID, v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B1D8();
  }

  int v16 = [(IDSDSessionInvitationManager *)self sharedState];
  CFStringRef v17 = [v16 participantID];

  if (v17)
  {
    CFDictionarySetValue(v12, IDSDSessionMessageParticipantID, v17);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B150();
  }

  if (v8) {
    CFDictionarySetValue(v12, IDSDSessionMessageContext, v8);
  }
  [(__CFDictionary *)v12 addEntriesFromDictionary:v10];

  long long v18 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [(IDSDSessionInvitationManager *)self sharedState];
    long long v20 = [v19 destinations];
    unsigned __int8 v21 = [(IDSDSessionInvitationManager *)self sharedState];
    unsigned int v22 = [v21 uniqueID];
    int v30 = 138412802;
    id v31 = v20;
    __int16 v32 = 2112;
    v33 = v22;
    __int16 v34 = 2112;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending decline to %@, %@ <%@>", (uint8_t *)&v30, 0x20u);
  }
  if (!v9)
  {
    long long v23 = [(IDSDSessionInvitationManager *)self sharedState];
    id v9 = [v23 fromURI];
  }
  int v24 = [(IDSDSessionInvitationManager *)self messenger];
  v25 = [(IDSDSessionInvitationManager *)self sharedState];
  unsigned int v26 = [v25 destinations];
  unsigned int v27 = +[NSNumber numberWithInteger:234];
  [v24 sendMessage:v12 toDestinations:v26 withCommand:v27 fromURI:v9];

  v28 = [(IDSDSessionInvitationManager *)self delegate];
  [v28 submitAWDMetricsForIDSSessionDeclineSent];

  v29 = [(IDSDSessionInvitationManager *)self delegate];
  [v29 endSessionWithReason:2];
}

- (BOOL)_isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform
{
  return 0;
}

- (id)publicIdentityDataFromLocalFullIdentity
{
  id v3 = [(IDSDSessionInvitationManager *)self sharedState];
  id v4 = [v3 localUnauthenticatedFullIdentity];

  if (v4)
  {
    BOOL v5 = [(IDSDSessionInvitationManager *)self sharedState];
    id v6 = [v5 localUnauthenticatedFullIdentity];
    id v24 = 0;
    id v7 = [v6 publicIdentityWithError:&v24];
    id v8 = (IDSDSessionInvitationManager *)v24;

    if (v7)
    {
      long long v23 = v8;
      id v9 = [v7 dataRepresentationWithError:&v23];
      id v10 = v23;

      if (v9)
      {
        id v9 = v9;
        id v8 = v10;
        CFStringRef v11 = v9;
      }
      else
      {
        long long v18 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543875;
          unsigned int v26 = v10;
          __int16 v27 = 2113;
          v28 = v7;
          __int16 v29 = 2113;
          int v30 = self;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to get data from unauthenticated public identity {error: %{public}@, publicIdentity: %{private}@, session: %{private}@}", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
        id v8 = v10;
        CFStringRef v11 = 0;
      }
    }
    else
    {
      CFStringRef v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [(IDSDSessionInvitationManager *)self sharedState];
        id v15 = [v14 localUnauthenticatedFullIdentity];
        *(_DWORD *)buf = 138543875;
        unsigned int v26 = v8;
        __int16 v27 = 2113;
        v28 = v15;
        __int16 v29 = 2113;
        int v30 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to get unauthenticated public identity from full identity {error: %{public}@, fullIdentity: %{private}@, session: %{private}@}", buf, 0x20u);
      }
      if (!os_log_shim_legacy_logging_enabled())
      {
        CFStringRef v11 = 0;
        goto LABEL_20;
      }
      int v16 = [(IDSDSessionInvitationManager *)self sharedState];
      long long v20 = [v16 localUnauthenticatedFullIdentity];
      _IDSWarnV();

      CFStringRef v17 = [(IDSDSessionInvitationManager *)self sharedState];
      unsigned __int8 v21 = [v17 localUnauthenticatedFullIdentity];
      _IDSLogV();

      id v9 = [(IDSDSessionInvitationManager *)self sharedState];
      unsigned int v22 = [v9 localUnauthenticatedFullIdentity];
      _IDSLogTransport();

      CFStringRef v11 = 0;
    }

LABEL_20:
    goto LABEL_21;
  }
  uint64_t v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    unsigned int v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create unauthenticated public key because of nil full identity {session: %{private}@}", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }
  CFStringRef v11 = 0;
LABEL_21:

  return v11;
}

- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4
{
  id v184 = a3;
  id v185 = a4;
  v188 = self;
  id v6 = [(IDSDSessionInvitationManager *)self delegate];
  [v6 submitAWDMetricsForIDSSessionAcceptReceived];

  id v7 = objc_alloc_init((Class)NSDate);
  id v8 = [(IDSDSessionInvitationManager *)self sharedState];
  [v8 setStartConnectingDate:v7];

  id v9 = [(IDSDSessionInvitationManager *)v188 sharedState];
  LODWORD(v8) = [v9 state];

  if (v8 >= 4)
  {
    id v10 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v197 = v185;
      CFStringRef v11 = "Ignoring incoming accept from %@, session is not waiting for an invite response anymore";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_143;
    }
    goto LABEL_143;
  }
  uint64_t v12 = [(IDSDSessionInvitationManager *)v188 sharedState];
  unsigned __int8 v13 = [v12 isInitiator];

  if (v13)
  {
    v14 = [(IDSDSessionInvitationManager *)v188 sharedState];
    unsigned int v189 = [v14 destinationIsDefaultPairedDevice:v185];

    uint64_t v15 = IDSDSessionMessageBlob;
    int v16 = [v184 objectForKey:IDSDSessionMessageBlob];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v17 = [v184 objectForKey:v15];
      uint64_t v18 = +[NSData _IDSDataFromBase64String:v17];
    }
    else
    {
      CFStringRef v17 = [v184 objectForKey:v15];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v19 = 0;
LABEL_14:

        v183 = v19;
        if ([v19 length]) {
          char v20 = 1;
        }
        else {
          char v20 = v189;
        }
        if ((v20 & 1) == 0)
        {
          unsigned __int8 v21 = [(IDSDSessionInvitationManager *)v188 sharedState];
          unsigned __int8 v22 = [v21 enableQuickRelay];

          if ((v22 & 1) == 0)
          {
            __int16 v29 = +[IDSFoundationLog IDSDSession];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No remote blob, bailing...", buf, 2u);
            }

            int v30 = [(IDSDSessionInvitationManager *)v188 delegate];
            [v30 endSessionWithReason:9];

            goto LABEL_142;
          }
        }
        long long v23 = [(IDSDSessionInvitationManager *)v188 sharedState];
        unsigned int v24 = [v23 destinationIsGuestDevice:v185];

        if (!v24) {
          goto LABEL_31;
        }
        uint64_t v25 = IDSSessionUnauthenticatedPublicKey;
        unsigned int v26 = [v184 objectForKey:IDSSessionUnauthenticatedPublicKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v27 = [v184 objectForKey:v25];
          uint64_t v28 = +[NSData _IDSDataFromBase64String:v27];
        }
        else
        {
          __int16 v27 = [v184 objectForKey:v25];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v31 = 0;
            goto LABEL_29;
          }
          uint64_t v28 = [v184 objectForKey:v25];
        }
        id v31 = (void *)v28;
LABEL_29:

        if (!v31)
        {
          _IMWarn();
          unsigned int v63 = [(IDSDSessionInvitationManager *)v188 delegate];
          [v63 endSessionWithReason:14];

LABEL_142:
          id v10 = v183;
          goto LABEL_143;
        }
        __int16 v32 = [(IDSDSessionInvitationManager *)v188 sharedState];
        v33 = [v32 publicIdentityFromData:v31];

        __int16 v34 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v34 setRemoteUnauthenticatedPublicIdentity:v33];

LABEL_31:
        uint64_t v35 = objc_opt_class();
        v182 = sub_1002F0618(v35, v184, IDSDSessionMessageParticipantID);
        if (![v182 length])
        {
          v61 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "No participantID, bailing...", buf, 2u);
          }

          v181 = [(IDSDSessionInvitationManager *)v188 delegate];
          [v181 endSessionWithReason:14];
          goto LABEL_141;
        }
        uint64_t v36 = objc_opt_class();
        v37 = sub_1002F0618(v36, v184, IDSDSessionMessageVersion);
        v181 = v37;
        if (!v37)
        {
          v62 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "No message version, bailing...", buf, 2u);
          }

          id v186 = [(IDSDSessionInvitationManager *)v188 delegate];
          [v186 endSessionWithReason:14];

          goto LABEL_141;
        }
        id v38 = [v37 unsignedIntValue];
        BOOL v39 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v39 setPeerProtocolVersion:v38];

        BOOL v40 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = [(IDSDSessionInvitationManager *)v188 sharedState];
          *(_DWORD *)buf = 67109120;
          LODWORD(v197) = [v41 peerProtocolVersion];
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Setting peer protocol version to %d", buf, 8u);
        }
        uint64_t v42 = objc_opt_class();
        unsigned __int8 v43 = sub_1002F0618(v42, v184, IDSDSessionMessageUseCloudPairedControlChannel);
        unsigned int v44 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v44 setRemoteUseCloudPairedControlChannel:v43];

        uint64_t v45 = objc_opt_class();
        int v46 = sub_1002F0618(v45, v184, IDSDSessionMessageUsePhoneContinuityLocalMessage);
        v47 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v47 setRemoteUsePhoneContinuityLocalMessage:v46];

        uint64_t v48 = objc_opt_class();
        v49 = (void *)IDSDSessionMessageUseStunMessageIntegrity;
        v50 = sub_1002F0618(v48, v184, IDSDSessionMessageUseStunMessageIntegrity);
        uint64_t v51 = objc_opt_class();
        unsigned __int8 v52 = sub_1002F0618(v51, v184, v49);
        -[IDSDSessionInvitationManager setUseStunMICheck:](v188, "setUseStunMICheck:", [v52 BOOLValue]);

        v53 = [(IDSDSessionInvitationManager *)v188 sharedState];
        LODWORD(v52) = [v53 peerProtocolVersion] < 4;

        if (v52)
        {
          uint64_t v54 = objc_opt_class();
          int v55 = (void *)IDSDSessionMessageUseSecureQRControlMessage;
          unsigned int v56 = sub_1002F0618(v54, v184, IDSDSessionMessageUseSecureQRControlMessage);
          uint64_t v57 = objc_opt_class();
          v58 = sub_1002F0618(v57, v184, v55);
          id v59 = [v58 BOOLValue];
          unsigned int v60 = [(IDSDSessionInvitationManager *)v188 sharedState];
          [v60 setUseSecureQRControlMessage:v59];
        }
        else
        {
          unsigned int v56 = [(IDSDSessionInvitationManager *)v188 sharedState];
          [v56 setUseSecureQRControlMessage:1];
        }

        double v64 = [(IDSDSessionInvitationManager *)v188 sharedState];
        unsigned int v65 = [v64 isScreenSharingSession];

        if (v65)
        {
          uint64_t v66 = IDSDSessionMessageKeyMaterial;
          double v67 = [v184 objectForKey:IDSDSessionMessageKeyMaterial];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v68 = [v184 objectForKey:v66];
            id v187 = +[NSData _IDSDataFromBase64String:v68];
          }
          else
          {
            v68 = [v184 objectForKey:v66];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v187 = [v184 objectForKey:v66];
            }
            else
            {
              id v187 = 0;
            }
          }

          uint64_t v69 = objc_opt_class();
          v70 = sub_1002F0618(v69, v184, IDSDSessionMessageSelfSSRC);
          uint64_t v71 = objc_opt_class();
          uint64_t v72 = sub_1002F0618(v71, v184, IDSDSessionMessageSelfSeqStart);
          BOOL v73 = (void *)v72;
          if (!v187 || !v70 || !v72) {
            goto LABEL_58;
          }
          id v74 = v187;
          v75 = [v74 bytes];
          if ([v74 length] != (id)60)
          {
            v85 = +[IDSFoundationLog IDSDSession];
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "receivedAcceptMessage: remoteKeyMaterialLength is not equal to remoteKeyMaterialLength, bailing...", buf, 2u);
            }

            id v86 = [(IDSDSessionInvitationManager *)v188 delegate];
            [v86 endSessionWithReason:14];

            id v84 = [(IDSDSessionInvitationManager *)v188 sharedState];
            goto LABEL_63;
          }
          -[IDSDSessionInvitationManager setSSRCRecv:](v188, "setSSRCRecv:", [v70 unsignedIntValue]);
          -[IDSDSessionInvitationManager setSeqRecvStart:](v188, "setSeqRecvStart:", [v73 unsignedShortValue]);
          uint64_t v76 = 0;
          keyMaterial = v188->keyMaterial;
          do
          {
            v188->keyMaterial[v76] ^= v75[v76];
            ++v76;
          }
          while (v76 != 60);
          uint64_t v78 = [(IDSDSessionInvitationManager *)v188 sharedState];
          BOOL v79 = [v78 peerProtocolVersion] > 1;

          v80 = [(IDSDSessionInvitationManager *)v188 sharedState];
          id v81 = [v80 encryptionState];

          int v82 = sub_100220DA4(v81, (uint64_t)keyMaterial, 60, 1, [(IDSDSessionInvitationManager *)v188 SSRCSend], (__int16)[(IDSDSessionInvitationManager *)v188 seqSendStart], [(IDSDSessionInvitationManager *)v188 SSRCRecv], (__int16)[(IDSDSessionInvitationManager *)v188 seqRecvStart], v79);
          *(_OWORD *)&v188->keyMaterial[44] = 0u;
          *(_OWORD *)&v188->keyMaterial[16] = 0u;
          *(_OWORD *)&v188->keyMaterial[32] = 0u;
          *(_OWORD *)keyMaterial = 0u;
          if (v82)
          {
LABEL_58:
            id v83 = [(IDSDSessionInvitationManager *)v188 delegate];
            [v83 endSessionWithReason:17];

            id v84 = [(IDSDSessionInvitationManager *)v188 sharedState];
LABEL_63:
            id v87 = v84;
            [v84 setEncryptionInitialized:0];

LABEL_140:
LABEL_141:

            goto LABEL_142;
          }
          id v88 = [(IDSDSessionInvitationManager *)v188 sharedState];
          [v88 setEncryptionInitialized:1];
        }
        BOOL v89 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v89 clearAllTimers];

        id v90 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v90 setState:4];

        id v187 = [v185 pushToken];
        long long v91 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          long long v92 = [(IDSDSessionInvitationManager *)v188 sharedState];
          long long v93 = [v92 uniqueID];
          *(_DWORD *)buf = 138412802;
          id v197 = v185;
          __int16 v198 = 2112;
          v199 = v93;
          __int16 v200 = 2112;
          id v201 = v187;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Received accept from %@, session %@, fromToken %@.", buf, 0x20u);
        }
        id v94 = objc_alloc_init((Class)NSMutableSet);
        v95 = [(IDSDSessionInvitationManager *)v188 sharedState];
        unsigned int v96 = [v95 destinationIsGuestDevice:v185];

        long long v193 = 0u;
        long long v194 = 0u;
        long long v191 = 0u;
        long long v192 = 0u;
        CFStringRef v97 = [(IDSDSessionInvitationManager *)v188 sharedState];
        __int16 v98 = [v97 destinations];

        v99 = 0;
        id v100 = [v98 countByEnumeratingWithState:&v191 objects:v195 count:16];
        if (v100)
        {
          uint64_t v101 = *(void *)v192;
          do
          {
            for (uint64_t i = 0; i != v100; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v192 != v101) {
                objc_enumerationMutation(v98);
              }
              unsigned __int8 v103 = *(void **)(*((void *)&v191 + 1) + 8 * i);
              if (v189)
              {
                v104 = [(IDSDSessionInvitationManager *)v188 sharedState];
                unsigned __int8 v105 = [v104 destinationIsDefaultPairedDevice:v103];

                if (v105) {
                  continue;
                }
              }
              if (!v96 || ([v103 isEqualToURI:v185] & 1) == 0)
              {
                v106 = [v103 pushToken];

                if (([v106 isEqualToPushToken:v187] & 1) == 0)
                {
                  [v94 addObject:v103];
                  v107 = +[IDSFoundationLog IDSDSession];
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v197 = v103;
                    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Adding %@ to set to cancel", buf, 0xCu);
                  }
                }
                v99 = v106;
              }
            }
            id v100 = [v98 countByEnumeratingWithState:&v191 objects:v195 count:16];
          }
          while (v100);
        }

        if ([v94 count])
        {
          v108 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v197 = v94;
            _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Canceling invitations to %@", buf, 0xCu);
          }

          [(IDSDSessionInvitationManager *)v188 sendCancelInvitationToDestinations:v94 remoteEndReason:29 data:0];
        }

        if (v189)
        {
          v109 = [(IDSDSessionInvitationManager *)v188 sharedState];
          unsigned __int8 v110 = [v109 forceInternetInvitation];

          if ((v110 & 1) == 0)
          {
            v111 = +[IDSUTunController sharedInstance];
            v112 = [(IDSDSessionInvitationManager *)v188 sharedState];
            v113 = [v112 uniqueID];
            [v111 stopUDPGlobalLinkForDevice:v113];
          }
        }
        id v114 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v185, 0, v181);
        v115 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v115 setDestinations:v114];

        [(IDSDSessionInvitationManager *)v188 setRemoteBlob:v183];
        v116 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v116 setConnectionTimer];

        v117 = [(IDSDSessionInvitationManager *)v188 sharedState];
        LODWORD(v115) = [v117 isScreenSharingSession];

        if (v115)
        {
          BOOL v118 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "Starting screen sharing connection with remote blob", buf, 2u);
          }

          v119 = [(IDSDSessionInvitationManager *)v188 sharedState];
          v120 = [v119 connection];
          [v120 receivedRemoteConnectionData:v183];

          v121 = [(IDSDSessionInvitationManager *)v188 sharedState];
          v122 = [v121 connection];
          v123 = [(IDSDSessionInvitationManager *)v188 sharedState];
          id v124 = [v123 peerProtocolVersion];
          v190[0] = _NSConcreteStackBlock;
          v190[1] = 3221225472;
          v190[2] = sub_1002F06D4;
          v190[3] = &unk_100981208;
          v190[4] = v188;
          [v122 startConnectionAsInitiator:1 peerProtocolVersion:v124 errorHandler:v190];

          goto LABEL_132;
        }
        v125 = [(IDSDSessionInvitationManager *)v188 _acceptedDeviceUniqueID];
        if (v125) {
          char v126 = 1;
        }
        else {
          char v126 = v189;
        }
        if (v126)
        {
        }
        else if (![(IDSDSessionInvitationManager *)v188 _isLocalDeviceSafeviewAdviserInitiatorOnLoboMacOrLaterAndRemoteDeviceIsPreTiboAnyPlatform])
        {
          v152 = [(IDSDSessionInvitationManager *)v188 sharedState];
          unsigned __int8 v153 = [v152 useQRDirectly];

          if (v153) {
            goto LABEL_102;
          }
          v154 = [v184 objectForKeyedSubscript:IDSDSessionMessageAssumeRemoteDeviceEncryption];
          unsigned int v155 = [v154 BOOLValue];

          v156 = [(IDSDSessionInvitationManager *)v188 sharedState];
          v127 = v156;
          if (!v155)
          {
            int v176 = [v156 disableRemoteDeviceEncryption];

            if ((v176 & 1) == 0)
            {
              v177 = +[IDSFoundationLog IDSDSession];
              if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
              {
                v178 = [(IDSDSessionInvitationManager *)v188 sharedState];
                v179 = [v178 uniqueID];
                *(_DWORD *)buf = 138412546;
                id v197 = v185;
                __int16 v198 = 2112;
                v199 = v179;
                _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "Received accept from %@, session %@, expecting remote device encryption but remote does not specify", buf, 0x16u);
              }
              v166 = [(IDSDSessionInvitationManager *)v188 delegate];
              [v166 endSessionWithReason:17];
              goto LABEL_139;
            }
            goto LABEL_102;
          }
          [v156 setDisableRemoteDeviceEncryption:0];
LABEL_101:

LABEL_102:
          id v128 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "Starting connection with remote blob", buf, 2u);
          }

          v129 = [(IDSDSessionInvitationManager *)v188 sharedState];
          if ([v129 destinationIsDefaultPairedDevice:v185])
          {
            id v130 = [(IDSDSessionInvitationManager *)v188 sharedState];
            unsigned int v131 = [v130 forceInternetInvitation];

            if (!v131)
            {
              CFStringRef v132 = [(IDSDSessionInvitationManager *)v188 delegate];
              [v132 openSocketToDevice:kIDSDefaultPairedDeviceID];

              goto LABEL_132;
            }
          }
          else
          {
          }
          __int16 v133 = [(IDSDSessionInvitationManager *)v188 delegate];
          CFStringRef v134 = [(IDSDSessionInvitationManager *)v188 sharedState];
          __int16 v135 = [v134 uniqueID];
          [v133 openSocketToDevice:v135];

          v136 = [(IDSDSessionInvitationManager *)v188 sharedState];
          LODWORD(v134) = [v136 enableQuickRelay];

          if (v134)
          {
            __int16 v137 = +[IDSQuickRelayAllocator sharedInstance];
            CFStringRef v138 = [(IDSDSessionInvitationManager *)v188 sharedState];
            v139 = [v138 uniqueID];
            v140 = [v187 rawToken];
            v141 = [v137 getRelaySessionIDForIDSSessionID:v139 pushToken:v140];

            v142 = +[IDSQuickRelayAllocator sharedInstance];
            v143 = [(IDSDSessionInvitationManager *)v188 sharedState];
            v144 = [v143 uniqueID];
            v145 = [v187 rawToken];
            [v142 setInitiatorsAcceptedToken:v144 pushToken:v145];

            if (v141)
            {
              Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v147 = [(IDSDSessionInvitationManager *)v188 sharedState];
              v148 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v147 useSecureQRControlMessage]);

              if (v148)
              {
                CFDictionarySetValue(Mutable, IDSGlobalLinkOptionUseSecureControlMessageKey, v148);
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_10071E688();
              }

              v158 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v197 = v141;
                _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "Accepted relay-session-id %@.", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v180 = v141;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v180 = v141;
                    _IDSLogV();
                  }
                }
              }
              v159 = +[IDSUTunController sharedInstance];
              v160 = [(IDSDSessionInvitationManager *)v188 sharedState];
              v161 = [v160 uniqueID];
              [v159 setAcceptedRelaySession:v161 relaySessionID:v141 options:Mutable];
            }
            else
            {
              v157 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v197 = 0;
                _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "Accepted relay-session-id %@ waits for QR connection.", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v180 = 0;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v180 = 0;
                    _IDSLogV();
                  }
                }
              }
            }
          }
          else
          {
            v149 = +[IDSUTunController sharedInstance];
            v150 = [(IDSDSessionInvitationManager *)v188 sharedState];
            v151 = [v150 uniqueID];
            objc_msgSend(v149, "startConnectionForDevice:isInitiator:remotePartyID:useStunMICheck:", v151, 1, v182, -[IDSDSessionInvitationManager useStunMICheck](v188, "useStunMICheck"));
          }
LABEL_132:
          uint64_t v162 = IDSDSessionMessageContext;
          v163 = objc_msgSend(v184, "objectForKey:", IDSDSessionMessageContext, v180);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v164 = [v184 objectForKey:v162];
            uint64_t v165 = +[NSData _IDSDataFromBase64String:v164];
          }
          else
          {
            v164 = [v184 objectForKey:v162];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v166 = 0;
              goto LABEL_138;
            }
            uint64_t v165 = [v184 objectForKey:v162];
          }
          v166 = (void *)v165;
LABEL_138:

          id v167 = objc_alloc_init((Class)IMMessageContext);
          [v167 setShouldBoost:1];
          v168 = +[IDSDaemon sharedInstance];
          v169 = [(IDSDSessionInvitationManager *)v188 sharedState];
          v170 = [v169 pushTopic];
          v171 = [v168 broadcasterForTopic:v170 entitlement:kIDSSessionEntitlement command:0 messageContext:v167];

          v172 = [(IDSDSessionInvitationManager *)v188 sharedState];
          v173 = [v172 uniqueID];
          v174 = [v185 prefixedURI];
          [v171 sessionAcceptReceived:v173 fromID:v174 withData:v166];

          v175 = +[IDSDSessionController sharedInstance];
          [v175 updateCriticalReliabilityState];

LABEL_139:
          goto LABEL_140;
        }
        v127 = [(IDSDSessionInvitationManager *)v188 sharedState];
        [v127 setDisableRemoteDeviceEncryption:1];
        goto LABEL_101;
      }
      uint64_t v18 = [v184 objectForKey:v15];
    }
    int v19 = v18;
    goto LABEL_14;
  }
  id v10 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v197 = v185;
    CFStringRef v11 = "Ignoring incoming accept from %@, session is not the initiator";
    goto LABEL_9;
  }
LABEL_143:
}

- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSessionInvitationManager *)self sharedState];
    id v10 = [v9 uniqueID];
    *(_DWORD *)buf = 138412802;
    id v49 = v6;
    __int16 v50 = 2112;
    id v51 = v7;
    __int16 v52 = 2112;
    v53 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received decline %@ from %@, %@", buf, 0x20u);
  }
  CFStringRef v11 = [(IDSDSessionInvitationManager *)self delegate];
  [v11 submitAWDMetricsForIDSSessionDeclineReceived];

  if ([(IDSDSessionInvitationManager *)self _isValidDestination:v7])
  {
    uint64_t v12 = objc_opt_class();
    unsigned __int8 v13 = sub_1002F0618(v12, v6, IDSDSessionMessageAllowOtherInvites);
    uint64_t v14 = IDSDSessionMessageContext;
    uint64_t v15 = [v6 objectForKey:IDSDSessionMessageContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v16 = [v6 objectForKey:v14];
      uint64_t v17 = +[NSData _IDSDataFromBase64String:v16];
    }
    else
    {
      int v16 = [v6 objectForKey:v14];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v18 = 0;
LABEL_12:

        int v19 = JWDecodeDictionary();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned __int8 v22 = [v19 objectForKey:IDSDSessionMessageDeclineReason];
          unsigned int v23 = [v22 unsignedIntValue];
        }
        else
        {
          unsigned int v23 = 0;
        }
        unsigned int v24 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Invite was declined { givenReason: %u }", buf, 8u);
        }

        if (v23 == 13) {
          int v25 = 15;
        }
        else {
          int v25 = 2;
        }
        unsigned int v47 = v25;
        if ([v13 BOOLValue])
        {
          unsigned int v26 = [(IDSDSessionInvitationManager *)self sharedState];
          __int16 v27 = [v26 destinations];
          id v28 = [v27 mutableCopy];

          [v28 removeObject:v7];
          id v29 = [v28 copy];
          int v30 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v49 = v7;
            __int16 v50 = 2112;
            id v51 = v29;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Invite was declined with reason alias deactivated { fromURI: %@, _inviteTokens: %@ }", buf, 0x16u);
          }

          if ([v29 count])
          {
            id v31 = +[IDSFoundationLog IDSDSession];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Suppressing decline, other recipients", buf, 2u);
            }
LABEL_30:

            goto LABEL_31;
          }
        }
        uint64_t v45 = v19;
        int v46 = v18;
        __int16 v32 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(IDSDSessionInvitationManager *)self sharedState];
          __int16 v34 = [v33 destinations];
          *(_DWORD *)buf = 138412290;
          id v49 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Invite was declined, notifying everyone I invited: %@", buf, 0xCu);
        }
        uint64_t v35 = [(IDSDSessionInvitationManager *)self delegate];
        [v35 invitationDeclined];

        uint64_t v36 = [(IDSDSessionInvitationManager *)self sharedState];
        [v36 clearAllTimers];

        id v37 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v7, 0);
        id v38 = [(IDSDSessionInvitationManager *)self sharedState];
        [v38 setDestinations:v37];

        id v28 = objc_alloc_init((Class)IMMessageContext);
        [v28 setShouldBoost:1];
        BOOL v39 = +[IDSDaemon sharedInstance];
        BOOL v40 = [(IDSDSessionInvitationManager *)self sharedState];
        v41 = [v40 pushTopic];
        id v29 = [v39 broadcasterForTopic:v41 entitlement:kIDSSessionEntitlement command:0 messageContext:v28];

        uint64_t v42 = [(IDSDSessionInvitationManager *)self sharedState];
        unsigned __int8 v43 = [v42 uniqueID];
        unsigned int v44 = [v7 prefixedURI];
        uint64_t v18 = v46;
        [v29 sessionDeclineReceived:v43 fromID:v44 withData:v46];

        id v31 = [(IDSDSessionInvitationManager *)self delegate];
        [v31 endSessionWithReason:v47];
        int v19 = v45;
        goto LABEL_30;
      }
      uint64_t v17 = [v6 objectForKey:v14];
    }
    uint64_t v18 = (void *)v17;
    goto LABEL_12;
  }
  unsigned __int8 v13 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(IDSDSessionInvitationManager *)self sharedState];
    int v19 = [v18 uniqueID];
    char v20 = [(IDSDSessionInvitationManager *)self sharedState];
    unsigned __int8 v21 = [v20 destinations];
    *(_DWORD *)buf = 138412802;
    id v49 = v7;
    __int16 v50 = 2112;
    id v51 = v19;
    __int16 v52 = 2112;
    v53 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring Decline from %@, %@, not in destinations: %@", buf, 0x20u);

LABEL_31:
  }
}

- (BOOL)_isValidDestination:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 prefixedURI];
  unsigned __int8 v6 = [v5 isEqualToIgnoringCase:IDSDefaultPairedDevice];

  if ((v6 & 1) == 0)
  {
    id v8 = [v4 prefixedURI];
    if ([v8 hasPrefix:@"device:"])
    {
    }
    else
    {
      id v9 = [(IDSDSessionInvitationManager *)self sharedState];
      unsigned int v10 = [v9 destinationIsGuestDevice:v4];

      if (!v10)
      {
        uint64_t v12 = [v4 pushToken];
        if (v12)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v17 = [(IDSDSessionInvitationManager *)self sharedState];
          uint64_t v18 = [v17 destinations];

          id v7 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v7)
          {
            uint64_t v19 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v18);
                }
                unsigned __int8 v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) pushToken];
                unsigned __int8 v22 = v21;
                if (v21 && ([v21 isEqualToPushToken:v12] & 1) != 0)
                {

                  LOBYTE(v7) = 1;
                  goto LABEL_29;
                }
              }
              id v7 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v7) {
                continue;
              }
              break;
            }
          }
LABEL_29:

          goto LABEL_30;
        }
LABEL_27:
        LOBYTE(v7) = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CFStringRef v11 = [(IDSDSessionInvitationManager *)self sharedState];
    uint64_t v12 = [v11 destinations];

    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * (void)j) isEqualToURI:v4])
          {
            LOBYTE(v7) = 1;
            goto LABEL_30;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    goto LABEL_27;
  }
  LOBYTE(v7) = 1;
LABEL_31:

  return (char)v7;
}

- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSessionInvitationManager *)self sharedState];
    unsigned int v10 = [v9 uniqueID];
    *(_DWORD *)buf = 138412802;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    long long v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received CANCEL %@ from %@, %@", buf, 0x20u);
  }
  CFStringRef v11 = [(IDSDSessionInvitationManager *)self delegate];
  [v11 submitAWDMetricsForIDSSessionCancelReceived];

  if ([(IDSDSessionInvitationManager *)self _isValidDestination:v7])
  {
    uint64_t v12 = [(IDSDSessionInvitationManager *)self sharedState];
    [v12 clearAllTimers];

    id v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v7, 0);
    id v14 = [(IDSDSessionInvitationManager *)self sharedState];
    [v14 setDestinations:v13];

    char v20 = v6;
    id v21 = v7;
    im_dispatch_after_primary_queue();

    uint64_t v15 = v20;
  }
  else
  {
    uint64_t v15 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [(IDSDSessionInvitationManager *)self sharedState];
      uint64_t v17 = [v16 uniqueID];
      uint64_t v18 = [(IDSDSessionInvitationManager *)self sharedState];
      uint64_t v19 = [v18 destinations];
      *(_DWORD *)buf = 138412802;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2112;
      long long v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ignoring CANCEL from %@, %@, not in destinations: %@", buf, 0x20u);
    }
  }
}

- (IDSDSession)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSDSession *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSData)quickRelaySessionToken
{
  return self->_quickRelaySessionToken;
}

- (void)setQuickRelaySessionToken:(id)a3
{
}

- (NSData)remoteBlob
{
  return self->_remoteBlob;
}

- (void)setRemoteBlob:(id)a3
{
}

- (unsigned)seqRecvStart
{
  return self->_seqRecvStart;
}

- (void)setSeqRecvStart:(unsigned int)a3
{
  self->_seqRecvStart = a3;
}

- (unsigned)SSRCRecv
{
  return self->_SSRCRecv;
}

- (void)setSSRCRecv:(unsigned int)a3
{
  self->_SSRCRecv = a3;
}

- (IDSDSessionMessenger)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (BOOL)remoteAssumeRemoteDeviceEncryption
{
  return self->_remoteAssumeRemoteDeviceEncryption;
}

- (void)setRemoteAssumeRemoteDeviceEncryption:(BOOL)a3
{
  self->_remoteAssumeRemoteDeviceEncryption = a3;
}

- (unsigned)seqSendStart
{
  return self->_seqSendStart;
}

- (void)setSeqSendStart:(unsigned int)a3
{
  self->_seqSendStart = a3;
}

- (IDSDSessionSharedState)sharedState
{
  return self->_sharedState;
}

- (void)setSharedState:(id)a3
{
}

- (unsigned)SSRCSend
{
  return self->_SSRCSend;
}

- (void)setSSRCSend:(unsigned int)a3
{
  self->_SSRCSend = a3;
}

- (BOOL)useStunMICheck
{
  return self->_useStunMICheck;
}

- (void)setUseStunMICheck:(BOOL)a3
{
  self->_useStunMICheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedState, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_remoteBlob, 0);
  objc_storeStrong((id *)&self->_quickRelaySessionToken, 0);
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end