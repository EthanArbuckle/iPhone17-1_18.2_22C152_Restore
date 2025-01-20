@interface IDSDSessionSharedState
- ($06B915653E2C05AC2325F9D1AF63EDA9)encryptionState;
- ($06B915653E2C05AC2325F9D1AF63EDA9)encryptionStateStruct;
- (BOOL)connectionTimerCleared;
- (BOOL)destinationIsDefaultPairedDevice:(id)a3;
- (BOOL)destinationIsGuestDevice:(id)a3;
- (BOOL)disableEncryption;
- (BOOL)disableRemoteDeviceEncryption;
- (BOOL)enableQuickRelay;
- (BOOL)enableSKE;
- (BOOL)enableSingleChannelDirectMode;
- (BOOL)encryptionInitialized;
- (BOOL)endSessionTimerCleared;
- (BOOL)forceInternetInvitation;
- (BOOL)inviteTimerCleared;
- (BOOL)isInUPlusOneMode;
- (BOOL)isInitiator;
- (BOOL)isScreenSharingSession;
- (BOOL)sharedSession;
- (BOOL)supportsReinitiate;
- (BOOL)useBTDatagramPipe;
- (BOOL)useQRDirectly;
- (BOOL)useSecureQRControlMessage;
- (IDSDSession)delegate;
- (IDSDSessionSharedState)initWithDictionary:(id)a3 serviceName:(id)a4 isInitiator:(BOOL)a5 uniqueID:(id)a6 accountID:(id)a7 destinations:(id)a8;
- (IDSMPFullLegacyIdentity)localUnauthenticatedFullIdentity;
- (IDSMPPublicLegacyIdentity)remoteUnauthenticatedPublicIdentity;
- (IDSURI)fromURI;
- (IMTimer)connectionTimer;
- (IMTimer)endSessionTimer;
- (IMTimer)inviteTimer;
- (IMTimer)packetLossTimer;
- (NSArray)requiredCapabilities;
- (NSArray)requiredLackOfCapabilities;
- (NSData)localBlob;
- (NSDate)startConnectingDate;
- (NSDictionary)destinationsLightweightStatus;
- (NSError)error;
- (NSNumber)remoteUseCloudPairedControlChannel;
- (NSNumber)remoteUsePhoneContinuityLocalMessage;
- (NSSet)destinations;
- (NSString)accountID;
- (NSString)groupID;
- (NSString)participantID;
- (NSString)pushTopic;
- (NSString)serviceName;
- (NSString)uniqueID;
- (NSUUID)clientUUID;
- (_IDSSessionConnection)connection;
- (double)connectionTimeout;
- (double)endSessionTimeout;
- (double)inviteSentTime;
- (double)inviteTimeout;
- (double)lastPacketTime;
- (id)getQuickRelayAllocateOptions:(id)a3;
- (id)publicIdentityFromData:(id)a3;
- (int64_t)clientType;
- (int64_t)transportType;
- (unint64_t)connectionCountHint;
- (unsigned)invitationRetryCount;
- (unsigned)peerProtocolVersion;
- (unsigned)seqSend;
- (unsigned)state;
- (void)_clearConnectionTimer;
- (void)_clearEndSessionTimeoutTimer;
- (void)_clearInvitationTimer;
- (void)_clearPacketLossTimer;
- (void)_connectionTimedOut;
- (void)_connectionTimerFiredOnMain;
- (void)_endSessionTimedOut;
- (void)_endSessionTimerFiredOnMain;
- (void)_inviteTimedOut;
- (void)_inviteTimerFiredOnMain;
- (void)clearAllTimers;
- (void)setAccountID:(id)a3;
- (void)setClientType:(int64_t)a3;
- (void)setClientUUID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionCountHint:(unint64_t)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setConnectionTimer;
- (void)setConnectionTimer:(id)a3;
- (void)setConnectionTimerCleared:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setDestinationsLightweightStatus:(id)a3;
- (void)setDisableEncryption:(BOOL)a3;
- (void)setDisableRemoteDeviceEncryption:(BOOL)a3;
- (void)setEnableQuickRelay:(BOOL)a3;
- (void)setEnableSKE:(BOOL)a3;
- (void)setEnableSingleChannelDirectMode:(BOOL)a3;
- (void)setEncryptionInitialized:(BOOL)a3;
- (void)setEncryptionStateStruct:(id *)a3;
- (void)setEndSessionTimeout:(double)a3;
- (void)setEndSessionTimeoutTimer;
- (void)setEndSessionTimer:(id)a3;
- (void)setEndSessionTimerCleared:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setForceInternetInvitation:(BOOL)a3;
- (void)setFromURI:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setInvitationRetryCount:(unsigned int)a3;
- (void)setInvitationTimer;
- (void)setInviteSentTime:(double)a3;
- (void)setInviteTimeout:(double)a3;
- (void)setInviteTimer:(id)a3;
- (void)setInviteTimerCleared:(BOOL)a3;
- (void)setIsInUPlusOneMode:(BOOL)a3;
- (void)setIsInitiator:(BOOL)a3;
- (void)setIsScreenSharingSession:(BOOL)a3;
- (void)setLastPacketTime:(double)a3;
- (void)setLocalBlob:(id)a3;
- (void)setLocalUnauthenticatedFullIdentity:(id)a3;
- (void)setPacketLossTimer:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setPeerProtocolVersion:(unsigned int)a3;
- (void)setRemoteUnauthenticatedPublicIdentity:(id)a3;
- (void)setRemoteUseCloudPairedControlChannel:(id)a3;
- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredLackOfCapabilities:(id)a3;
- (void)setSeqSend:(unsigned int)a3;
- (void)setServiceName:(id)a3;
- (void)setSharedSession:(BOOL)a3;
- (void)setStartConnectingDate:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)setUseBTDatagramPipe:(BOOL)a3;
- (void)setUseQRDirectly:(BOOL)a3;
- (void)setUseSecureQRControlMessage:(BOOL)a3;
@end

@implementation IDSDSessionSharedState

- (IDSDSessionSharedState)initWithDictionary:(id)a3 serviceName:(id)a4 isInitiator:(BOOL)a5 uniqueID:(id)a6 accountID:(id)a7 destinations:(id)a8
{
  id v14 = a3;
  id v114 = a4;
  id v120 = a6;
  id v119 = a7;
  id v118 = a8;
  v131.receiver = self;
  v131.super_class = (Class)IDSDSessionSharedState;
  v15 = [(IDSDSessionSharedState *)&v131 init];
  v16 = v15;
  if (!v15)
  {
LABEL_85:
    v100 = v16;
    goto LABEL_86;
  }
  objc_storeStrong((id *)&v15->_serviceName, a4);
  v16->_isInitiator = a5;
  if ([v120 length])
  {
    v17 = (NSString *)v120;
  }
  else
  {
    v17 = +[NSString stringGUID];
  }
  uniqueID = v16->_uniqueID;
  v16->_uniqueID = v17;

  uint64_t v19 = +[NSString stringGUID];
  participantID = v16->_participantID;
  v16->_participantID = (NSString *)v19;

  objc_storeStrong((id *)&v16->_accountID, a7);
  objc_storeStrong((id *)&v16->_destinations, a8);
  uint64_t v21 = IDSSessionPeerProtocolVersionKey;
  v22 = [v14 objectForKey:IDSSessionPeerProtocolVersionKey];
  if (v22) {
    [v14 objectForKey:v21];
  }
  else {
  v23 = _IDSSessionProtocolVersionNumber();
  }
  v16->_peerProtocolVersion = [v23 unsignedIntValue];

  v24 = [v14 objectForKey:IDSSessionWaitForPreConnectionDataKey];
  v16->_enableSKE = [v24 BOOLValue];

  v25 = [v14 objectForKey:IDSSessionDisableEncryptionKey];
  v16->_disableEncryption = [v25 BOOLValue];

  v26 = [v14 objectForKey:IDSSessionForceInternetInvitationKey];
  v16->_forceInternetInvitation = [v26 BOOLValue];

  v27 = [v14 objectForKey:IDSSessionSingleChannelDirectModeKey];
  v16->_enableSingleChannelDirectMode = [v27 BOOLValue];

  v28 = [v14 objectForKey:IDSSessionUseSecureQRControlMessageKey];
  v16->_useSecureQRControlMessage = [v28 BOOLValue];

  uint64_t v111 = IDSSessionIsRealTimeKey;
  v29 = objc_msgSend(v14, "objectForKey:");
  v16->_useBTDatagramPipe = [v29 BOOLValue];

  v30 = [v14 objectForKey:IDSSessionInvitationIsRetryKey];
  v16->_invitationRetryCount = [v30 BOOLValue];

  v16->_lastPacketTime = 0.0;
  uint64_t v31 = [v14 objectForKey:IDSGroupSessionMessagesGroupIDKey];
  groupID = v16->_groupID;
  v16->_groupID = (NSString *)v31;

  v116 = [v14 objectForKey:IDSSessionClientUUIDKey];
  if (v116)
  {
    v33 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v116];
    clientUUID = v16->_clientUUID;
    v16->_clientUUID = v33;
  }
  v16->_useQRDirectly = IMGetDomainBoolForKey();
  v35 = +[IDSDAccountController sharedInstance];
  v121 = [v35 accountWithUniqueID:v119];

  v117 = [v121 service];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v36 = v118;
  id v37 = [v36 countByEnumeratingWithState:&v127 objects:v143 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v128;
    while (2)
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v128 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = *(void **)(*((void *)&v127 + 1) + 8 * i);
        v41 = [v40 prefixedURI];
        unsigned int v42 = [v41 hasSuffix:@"inbox.appleid.apple.com"];

        if (v42)
        {
          v43 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = [(IDSDSessionSharedState *)v16 uniqueID];
            v45 = [(IDSDSessionSharedState *)v16 destinations];
            *(_DWORD *)buf = 138412802;
            uint64_t v134 = (uint64_t)v40;
            __int16 v135 = 2114;
            CFStringRef v136 = v44;
            __int16 v137 = 2112;
            uint64_t v138 = (uint64_t)v45;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "At least one destination is mako {destinationURI: %@, uniqueID: %{public}@, destinations: %@}", buf, 0x20u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v46 = [(IDSDSessionSharedState *)v16 uniqueID];
              [(IDSDSessionSharedState *)v16 destinations];
              v110 = v109 = v46;
              v107 = v40;
              _IDSLogTransport();

              if (_IDSShouldLog())
              {
                v47 = [(IDSDSessionSharedState *)v16 uniqueID];
                [(IDSDSessionSharedState *)v16 destinations];
                v110 = v109 = v47;
                v107 = v40;
                _IDSLogV();
              }
            }
          }
          goto LABEL_25;
        }
      }
      id v37 = [v36 countByEnumeratingWithState:&v127 objects:v143 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  v48 = [v121 primaryRegistration];
  v49 = [v48 dsHandle];
  v112 = [v49 _stripFZIDPrefix];

  v50 = [v121 service];
  [v50 shouldRegisterUsingDSHandle];

  v51 = [v121 service];
  v52 = [v51 identifier];
  _IDSPrefersPhoneNumbersForServiceIdentifier();

  v113 = [v14 objectForKey:IDSSessionToIDKey];
  v53 = [v14 objectForKey:IDSGroupSessionMessagesCallerIDKey];
  v115 = v53;
  if (v53)
  {
    id v54 = v53;
  }
  else
  {
    if (v113) {
      [v113 prefixedURI];
    }
    else {
    v55 = [v121 displayName];
    }
    v56 = objc_msgSend(v121, "unprefixedURIStringsFromRegistration", v107, v109, v110);
    v57 = [v121 pseudonyms];
    id v54 = (id)_IDSCopyCallerIDWithSelfMessagingHint();
  }
  v58 = objc_msgSend(v117, "identifier", v107);
  uint64_t v59 = +[IDSURI URIWithUnprefixedURI:v54 withServiceLoggingHint:v58];
  fromURI = v16->_fromURI;
  v16->_fromURI = (IDSURI *)v59;

  v61 = [v121 unprefixedURIStringsFromRegistration];
  v62 = [(IDSURI *)v16->_fromURI unprefixedURI];
  unsigned __int8 v63 = [v61 containsObject:v62];

  v64 = +[IDSFoundationLog IDSDSession];
  v65 = v64;
  if (v63)
  {
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v16->_uniqueID;
      v67 = v16->_fromURI;
      accountID = v16->_accountID;
      v69 = [v121 unprefixedURIStringsFromRegistration];
      *(_DWORD *)buf = 138413314;
      uint64_t v134 = (uint64_t)v66;
      __int16 v135 = 2112;
      CFStringRef v136 = (const __CFString *)v67;
      __int16 v137 = 2112;
      uint64_t v138 = (uint64_t)v115;
      __int16 v139 = 2112;
      v140 = accountID;
      __int16 v141 = 2112;
      v142 = v69;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Resolved IDSDSession fromID { sessionID: %@, fromID: %@, clientSpecifiedFromID: %@, accountID: %@, accountAliasStrings: %@ }", buf, 0x34u);
    }
  }
  else if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    v103 = v16->_uniqueID;
    v104 = v16->_fromURI;
    v105 = v16->_accountID;
    v106 = [v121 unprefixedURIStringsFromRegistration];
    *(_DWORD *)buf = 138413314;
    uint64_t v134 = (uint64_t)v103;
    __int16 v135 = 2112;
    CFStringRef v136 = (const __CFString *)v104;
    __int16 v137 = 2112;
    uint64_t v138 = (uint64_t)v115;
    __int16 v139 = 2112;
    v140 = v105;
    __int16 v141 = 2112;
    v142 = v106;
    _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Resolved IDSDSession fromID is not a valid selected alias on the account! This may cause messaging failures. { sessionID: %@, fromID: %@, clientSpecifiedFromID: %@, accountID: %@, accountAliasStrings: %@ }", buf, 0x34u);
  }
  v70 = [v117 identifier];
  if ([v70 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"])
  {
    v71 = +[IMLockdownManager sharedInstance];
    unsigned int v72 = [v71 isInternalInstall];

    if (v72 && IMGetDomainBoolForKey()) {
      v16->_enableQuickRelay = 1;
    }
    v73 = [v14 objectForKey:v111];
    BOOL v74 = v73 == 0;

    if (v74) {
      v16->_useBTDatagramPipe = 1;
    }
    v16->_useBTDatagramPipe = IMGetDomainBoolForKeyWithDefaultValue();
    v82 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = [(IDSDSessionSharedState *)v16 uniqueID];
      *(_DWORD *)buf = 138412546;
      uint64_t v134 = (uint64_t)v70;
      __int16 v135 = 2112;
      CFStringRef v136 = v83;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "QuickRelay is disabled for service: %@, session: %@.", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        [(IDSDSessionSharedState *)v16 uniqueID];
        v109 = v108 = v70;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          [(IDSDSessionSharedState *)v16 uniqueID];
          v109 = v108 = v70;
          _IDSLogV();
        }
      }
    }
    v16->_connectionTimeout = 5.0;
  }
  else
  {
    v16->_enableQuickRelay = 1;
    v16->_connectionTimeout = 30.0;
    v75 = [v14 objectForKey:IDSGroupSessionStartedAsUPlusOneKey];
    unsigned int v76 = [v75 BOOLValue];

    v77 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v78 = [(IDSDSessionSharedState *)v16 uniqueID];
      v79 = (void *)v78;
      CFStringRef v80 = &stru_10099BE78;
      *(_DWORD *)buf = 138412802;
      uint64_t v134 = (uint64_t)v70;
      __int16 v135 = 2112;
      if (v76) {
        CFStringRef v80 = @" (U+1)";
      }
      CFStringRef v136 = v80;
      __int16 v137 = 2112;
      uint64_t v138 = v78;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "QuickRelay is enabled for service: %@%@, session: %@.", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v81 = v76 ? @" (U+1)" : &stru_10099BE78;
      [(IDSDSessionSharedState *)v16 uniqueID];
      v110 = v109 = v81;
      v108 = v70;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        [(IDSDSessionSharedState *)v16 uniqueID];
        v110 = v109 = v81;
        v108 = v70;
        _IDSLogV();
      }
    }
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v84 = v36;
  id v85 = [v84 countByEnumeratingWithState:&v123 objects:v132 count:16];
  if (!v85)
  {
LABEL_78:

    uint64_t v92 = [v14 objectForKey:IDSSessionDestinationLightWeightStatusesKey];
    destinationsLightweightStatus = v16->_destinationsLightweightStatus;
    v16->_destinationsLightweightStatus = (NSDictionary *)v92;

    if (v16->_destinationsLightweightStatus)
    {
      v94 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v95 = [(NSDictionary *)v16->_destinationsLightweightStatus description];
        v96 = IDSLoggableDescriptionForObjectOnService();
        *(_DWORD *)buf = 138412290;
        uint64_t v134 = (uint64_t)v96;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Destinations lightweight status: %@", buf, 0xCu);
      }
    }
    v97 = objc_msgSend(v14, "objectForKey:", IDSSessionUnauthenticatedPublicKey, v108);
    if (v97)
    {
      uint64_t v98 = [(IDSDSessionSharedState *)v16 publicIdentityFromData:v97];
      remoteUnauthenticatedPublicIdentity = v16->_remoteUnauthenticatedPublicIdentity;
      v16->_remoteUnauthenticatedPublicIdentity = (IDSMPPublicLegacyIdentity *)v98;
    }
    goto LABEL_85;
  }
  uint64_t v86 = *(void *)v124;
LABEL_63:
  uint64_t v87 = 0;
  while (1)
  {
    if (*(void *)v124 != v86) {
      objc_enumerationMutation(v84);
    }
    if (-[IDSDSessionSharedState destinationIsGuestDevice:](v16, "destinationIsGuestDevice:", *(void *)(*((void *)&v123 + 1) + 8 * v87), v108, v109, v110))
    {
      break;
    }
    if (v85 == (id)++v87)
    {
      id v85 = [v84 countByEnumeratingWithState:&v123 objects:v132 count:16];
      if (v85) {
        goto LABEL_63;
      }
      goto LABEL_78;
    }
  }
  id v122 = 0;
  uint64_t v88 = +[IDSMPFullLegacyIdentity identityWithError:&v122];
  id v89 = v122;
  if (v88)
  {
    v90 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v134 = v88;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Created local unauthenticated full identity {fullIdentity: %{private}@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v108 = (void *)v88;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v108 = (void *)v88;
          _IDSLogV();
        }
      }
    }
    localUnauthenticatedFullIdentity = v16->_localUnauthenticatedFullIdentity;
    v16->_localUnauthenticatedFullIdentity = (IDSMPFullLegacyIdentity *)v88;

    goto LABEL_78;
  }
  v102 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v134 = (uint64_t)v84;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "Failed to create full identity for unauthenticated destination {destinations: %{private}@}", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
  }

  v100 = 0;
LABEL_86:

  return v100;
}

- ($06B915653E2C05AC2325F9D1AF63EDA9)encryptionState
{
  return ($06B915653E2C05AC2325F9D1AF63EDA9 *)&self->_encryptionStateStruct;
}

- (void)clearAllTimers
{
  [(IDSDSessionSharedState *)self _clearInvitationTimer];
  [(IDSDSessionSharedState *)self _clearConnectionTimer];
  [(IDSDSessionSharedState *)self _clearPacketLossTimer];

  [(IDSDSessionSharedState *)self _clearEndSessionTimeoutTimer];
}

- (void)setInvitationTimer
{
  atomic_store(0, (unsigned __int8 *)&self->_inviteTimerCleared);
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100337E60;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_inviteTimerFiredOnMain
{
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033804C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_inviteTimedOut
{
  if (![(IDSDSessionSharedState *)self inviteTimerCleared])
  {
    v3 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [(IDSDSessionSharedState *)self inviteTimeout];
      int v8 = 134217984;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Session invite timed out after %f seconds", (uint8_t *)&v8, 0xCu);
    }

    if ([(IDSDSessionSharedState *)self isInitiator]) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 3;
    }
    v6 = [(IDSDSessionSharedState *)self delegate];
    [v6 sendCancelInvitationMessage];

    v7 = [(IDSDSessionSharedState *)self delegate];
    [v7 endSessionWithReason:v5];
  }
}

- (void)_clearInvitationTimer
{
  atomic_store(1u, (unsigned __int8 *)&self->_inviteTimerCleared);
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003381F4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_clearConnectionTimer
{
  atomic_store(1u, (unsigned __int8 *)&self->_connectionTimerCleared);
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100338338;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setConnectionTimer
{
  [(IDSDSessionSharedState *)self _clearConnectionTimer];
  atomic_store(0, (unsigned __int8 *)&self->_connectionTimerCleared);
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033847C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_connectionTimerFiredOnMain
{
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033872C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_connectionTimedOut
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_connectionTimerCleared);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [(IDSDSessionSharedState *)self connectionTimeout];
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session connection timed out after %f seconds", (uint8_t *)&v7, 0xCu);
    }

    v6 = [(IDSDSessionSharedState *)self delegate];
    [v6 endSessionWithReason:6];
  }
}

- (void)_clearPacketLossTimer
{
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100338898;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_clearEndSessionTimeoutTimer
{
  atomic_store(1u, (unsigned __int8 *)&self->_endSessionTimerCleared);
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003389B4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setEndSessionTimeoutTimer
{
  atomic_store(0, (unsigned __int8 *)&self->_endSessionTimerCleared);
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100338AF4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_endSessionTimerFiredOnMain
{
  v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100338CD8;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_endSessionTimedOut
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_endSessionTimerCleared);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [(IDSDSessionSharedState *)self endSessionTimeout];
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "End session timed out after %f seconds", (uint8_t *)&v8, 0xCu);
    }

    if (self->_isInitiator) {
      uint64_t v6 = 11;
    }
    else {
      uint64_t v6 = 12;
    }
    int v7 = [(IDSDSessionSharedState *)self delegate];
    [v7 endSessionWithReason:v6];
  }
}

- (BOOL)supportsReinitiate
{
  if ([(IDSDSessionSharedState *)self sharedSession]
    && ![(IDSDSessionSharedState *)self isInUPlusOneMode]
    || (id)[(IDSDSessionSharedState *)self clientType] != (id)1
    && (id)[(IDSDSessionSharedState *)self clientType] != (id)5
    && (id)[(IDSDSessionSharedState *)self clientType] != (id)6
    || ![(IDSDSessionSharedState *)self enableQuickRelay])
  {
    return 0;
  }

  return [(IDSDSessionSharedState *)self useQRDirectly];
}

- (id)getQuickRelayAllocateOptions:(id)a3
{
  id v4 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v6 = +[IDSDAccountController sharedInstance];
  int v7 = [(IDSDSessionSharedState *)self accountID];
  int v8 = [v6 accountWithUniqueID:v7];
  uint64_t v9 = [v8 service];
  v10 = [v9 pushTopic];

  if (v10)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071F4FC();
  }

  id v11 = v4;
  if (v11)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateType, v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071F474();
  }

  if (([v11 intValue] & 0xFFFFFFFD) == 1)
  {
    v12 = +[NSNumber numberWithInt:0];
    if (v12)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_SelfAllocationCount, v12);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071F3EC();
    }
  }
  if ([(IDSDSessionSharedState *)self invitationRetryCount])
  {
    v13 = +[NSNumber numberWithUnsignedInt:[(IDSDSessionSharedState *)self invitationRetryCount]];
    if (v13)
    {
      CFDictionarySetValue(Mutable, IDSSessionInvitationRetryCountKey, v13);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071F364();
    }
  }
  id v14 = IMGetDomainValueForKey();
  if (v14) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_QRForceExperiment, v14);
  }

  return Mutable;
}

- (BOOL)destinationIsGuestDevice:(id)a3
{
  v3 = [a3 prefixedURI];
  unsigned __int8 v4 = [v3 hasPrefix:@"guest-device:"];

  return v4;
}

- (BOOL)destinationIsDefaultPairedDevice:(id)a3
{
  unsigned __int8 v4 = [a3 prefixedURI];
  uint64_t v5 = [(IDSDSessionSharedState *)self accountID];
  uint64_t v6 = [(IDSDSessionSharedState *)self serviceName];
  BOOL v7 = +[IDSDAccountController isDefaultPairedDeviceFromID:v4 accountUniqueID:v5 serviceName:v6];

  return v7;
}

- (id)publicIdentityFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    unsigned __int8 v4 = +[IDSMPPublicLegacyIdentity identityWithData:v3 error:&v10];
    id v5 = v10;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      int v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        id v12 = v5;
        __int16 v13 = 2113;
        id v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create unauthenticated public identity from data {error: %{public}@, data: %{private}@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    BOOL v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to create unauthenticated public identity from data becuase data is nil", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSString)pushTopic
{
  id v3 = +[IDSDAccountController sharedInstance];
  unsigned __int8 v4 = [(IDSDSessionSharedState *)self accountID];
  id v5 = [v3 accountWithUniqueID:v4];
  id v6 = [v5 service];
  BOOL v7 = [v6 pushTopic];

  return (NSString *)v7;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (NSUUID)clientUUID
{
  return self->_clientUUID;
}

- (void)setClientUUID:(id)a3
{
}

- (_IDSSessionConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (unint64_t)connectionCountHint
{
  return self->_connectionCountHint;
}

- (void)setConnectionCountHint:(unint64_t)a3
{
  self->_connectionCountHint = a3;
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (IMTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (BOOL)connectionTimerCleared
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_connectionTimerCleared);
  return v2 & 1;
}

- (void)setConnectionTimerCleared:(BOOL)a3
{
}

- (NSSet)destinations
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDestinations:(id)a3
{
}

- (NSDictionary)destinationsLightweightStatus
{
  return self->_destinationsLightweightStatus;
}

- (void)setDestinationsLightweightStatus:(id)a3
{
}

- (BOOL)disableEncryption
{
  return self->_disableEncryption;
}

- (void)setDisableEncryption:(BOOL)a3
{
  self->_disableEncryption = a3;
}

- (BOOL)disableRemoteDeviceEncryption
{
  return self->_disableRemoteDeviceEncryption;
}

- (void)setDisableRemoteDeviceEncryption:(BOOL)a3
{
  self->_disableRemoteDeviceEncryption = a3;
}

- (BOOL)enableQuickRelay
{
  return self->_enableQuickRelay;
}

- (void)setEnableQuickRelay:(BOOL)a3
{
  self->_enableQuickRelay = a3;
}

- (BOOL)enableSingleChannelDirectMode
{
  return self->_enableSingleChannelDirectMode;
}

- (void)setEnableSingleChannelDirectMode:(BOOL)a3
{
  self->_enableSingleChannelDirectMode = a3;
}

- (BOOL)enableSKE
{
  return self->_enableSKE;
}

- (void)setEnableSKE:(BOOL)a3
{
  self->_enableSKE = a3;
}

- (BOOL)encryptionInitialized
{
  return self->_encryptionInitialized;
}

- (void)setEncryptionInitialized:(BOOL)a3
{
  self->_encryptionInitialized = a3;
}

- (double)endSessionTimeout
{
  return self->_endSessionTimeout;
}

- (void)setEndSessionTimeout:(double)a3
{
  self->_endSessionTimeout = a3;
}

- (IMTimer)endSessionTimer
{
  return self->_endSessionTimer;
}

- (void)setEndSessionTimer:(id)a3
{
}

- (BOOL)endSessionTimerCleared
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_endSessionTimerCleared);
  return v2 & 1;
}

- (void)setEndSessionTimerCleared:(BOOL)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)forceInternetInvitation
{
  return self->_forceInternetInvitation;
}

- (void)setForceInternetInvitation:(BOOL)a3
{
  self->_forceInternetInvitation = a3;
}

- (IDSURI)fromURI
{
  return self->_fromURI;
}

- (void)setFromURI:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (double)inviteSentTime
{
  return self->_inviteSentTime;
}

- (void)setInviteSentTime:(double)a3
{
  self->_inviteSentTime = a3;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (void)setIsInitiator:(BOOL)a3
{
  self->_isInitiator = a3;
}

- (BOOL)isInUPlusOneMode
{
  return self->_isInUPlusOneMode;
}

- (void)setIsInUPlusOneMode:(BOOL)a3
{
  self->_isInUPlusOneMode = a3;
}

- (BOOL)isScreenSharingSession
{
  return self->_isScreenSharingSession;
}

- (void)setIsScreenSharingSession:(BOOL)a3
{
  self->_isScreenSharingSession = a3;
}

- (unsigned)invitationRetryCount
{
  return self->_invitationRetryCount;
}

- (void)setInvitationRetryCount:(unsigned int)a3
{
  self->_invitationRetryCount = a3;
}

- (double)inviteTimeout
{
  return self->_inviteTimeout;
}

- (void)setInviteTimeout:(double)a3
{
  self->_inviteTimeout = a3;
}

- (IMTimer)inviteTimer
{
  return self->_inviteTimer;
}

- (void)setInviteTimer:(id)a3
{
}

- (BOOL)inviteTimerCleared
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_inviteTimerCleared);
  return v2 & 1;
}

- (void)setInviteTimerCleared:(BOOL)a3
{
}

- (double)lastPacketTime
{
  return self->_lastPacketTime;
}

- (void)setLastPacketTime:(double)a3
{
  self->_lastPacketTime = a3;
}

- (NSData)localBlob
{
  return self->_localBlob;
}

- (void)setLocalBlob:(id)a3
{
}

- (IMTimer)packetLossTimer
{
  return self->_packetLossTimer;
}

- (void)setPacketLossTimer:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (unsigned)peerProtocolVersion
{
  return self->_peerProtocolVersion;
}

- (void)setPeerProtocolVersion:(unsigned int)a3
{
  self->_peerProtocolVersion = a3;
}

- (NSNumber)remoteUseCloudPairedControlChannel
{
  return self->_remoteUseCloudPairedControlChannel;
}

- (void)setRemoteUseCloudPairedControlChannel:(id)a3
{
}

- (NSNumber)remoteUsePhoneContinuityLocalMessage
{
  return self->_remoteUsePhoneContinuityLocalMessage;
}

- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (unsigned)seqSend
{
  return self->_seqSend;
}

- (void)setSeqSend:(unsigned int)a3
{
  self->_seqSend = a3;
}

- (BOOL)sharedSession
{
  return self->_sharedSession;
}

- (void)setSharedSession:(BOOL)a3
{
  self->_sharedSession = a3;
}

- (NSDate)startConnectingDate
{
  return self->_startConnectingDate;
}

- (void)setStartConnectingDate:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)useBTDatagramPipe
{
  return self->_useBTDatagramPipe;
}

- (void)setUseBTDatagramPipe:(BOOL)a3
{
  self->_useBTDatagramPipe = a3;
}

- (BOOL)useSecureQRControlMessage
{
  return self->_useSecureQRControlMessage;
}

- (void)setUseSecureQRControlMessage:(BOOL)a3
{
  self->_useSecureQRControlMessage = a3;
}

- (BOOL)useQRDirectly
{
  return self->_useQRDirectly;
}

- (void)setUseQRDirectly:(BOOL)a3
{
  self->_useQRDirectly = a3;
}

- (NSArray)requiredLackOfCapabilities
{
  return self->_requiredLackOfCapabilities;
}

- (void)setRequiredLackOfCapabilities:(id)a3
{
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (IDSMPFullLegacyIdentity)localUnauthenticatedFullIdentity
{
  return self->_localUnauthenticatedFullIdentity;
}

- (void)setLocalUnauthenticatedFullIdentity:(id)a3
{
}

- (IDSMPPublicLegacyIdentity)remoteUnauthenticatedPublicIdentity
{
  return self->_remoteUnauthenticatedPublicIdentity;
}

- (void)setRemoteUnauthenticatedPublicIdentity:(id)a3
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

- ($06B915653E2C05AC2325F9D1AF63EDA9)encryptionStateStruct
{
  return ($06B915653E2C05AC2325F9D1AF63EDA9 *)memcpy(retstr, &self->_encryptionStateStruct, sizeof($06B915653E2C05AC2325F9D1AF63EDA9));
}

- (void)setEncryptionStateStruct:(id *)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteUnauthenticatedPublicIdentity, 0);
  objc_storeStrong((id *)&self->_localUnauthenticatedFullIdentity, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredLackOfCapabilities, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_startConnectingDate, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_remoteUsePhoneContinuityLocalMessage, 0);
  objc_storeStrong((id *)&self->_remoteUseCloudPairedControlChannel, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_packetLossTimer, 0);
  objc_storeStrong((id *)&self->_localBlob, 0);
  objc_storeStrong((id *)&self->_inviteTimer, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_fromURI, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_endSessionTimer, 0);
  objc_storeStrong((id *)&self->_destinationsLightweightStatus, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end