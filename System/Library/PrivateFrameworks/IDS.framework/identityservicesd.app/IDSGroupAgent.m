@interface IDSGroupAgent
+ (id)sharedInstance;
- (BOOL)isAirDropSession:(id)a3;
- (BOOL)isAppleEndpointForExistingSession:(id)a3;
- (BOOL)isSessionControlEnabled;
- (IDSGroupAgent)initWithQueue:(id)a3 isSessionControlEnabled:(BOOL)a4;
- (IDSGroupSessionMultiplexer)multiplexer;
- (NEPolicySession)policySession;
- (NEPolicySession)policySessionWithEntitlment;
- (NSMutableDictionary)endpointToClientInfo;
- (NSMutableDictionary)endpointToResolvedParameters;
- (NSMutableDictionary)managedSessions;
- (NSMutableDictionary)membersArrayDict;
- (NSMutableDictionary)portCollisionDetection;
- (NSMutableDictionary)sessionIDToEndpoints;
- (NSMutableDictionary)sessionIDToEvaluators;
- (OS_dispatch_queue)queue;
- (OS_nw_agent)agent;
- (OS_nw_agent)entitledAgent;
- (OS_nw_channel)packetChannel;
- (id)generateSessionIDFromMemberArray:(id)a3;
- (id)resolveAppleEndpoint:(id)a3;
- (unsigned)getPortSignatureForTopic:(id)a3;
- (void)_injectPortTopicMappingForSession:(id)a3 topic:(id)a4 portSignature:(id)a5;
- (void)createNewSessionForClientRequest:(id)a3 isClient:(BOOL)a4 registrationCompletionBlock:(id)a5;
- (void)registerAgent;
- (void)registerEntitledAgent;
- (void)resolveAirDropProEndpointWithParams:(id)a3 options:(id)a4 agentResolveResponse:(id)a5;
- (void)setAgent:(id)a3;
- (void)setEndpointToClientInfo:(id)a3;
- (void)setEndpointToResolvedParameters:(id)a3;
- (void)setEntitledAgent:(id)a3;
- (void)setIsSessionControlEnabled:(BOOL)a3;
- (void)setManagedSessions:(id)a3;
- (void)setMembersArrayDict:(id)a3;
- (void)setMultiplexer:(id)a3;
- (void)setPacketChannel:(id)a3;
- (void)setPolicySession:(id)a3;
- (void)setPolicySessionWithEntitlment:(id)a3;
- (void)setPortCollisionDetection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionIDToEndpoints:(id)a3;
- (void)setSessionIDToEvaluators:(id)a3;
- (void)unregisterAgent;
- (void)unregisterEntitledAgent;
@end

@implementation IDSGroupAgent

+ (id)sharedInstance
{
  if (qword_100A4CA80[0] != -1) {
    dispatch_once(qword_100A4CA80, &stru_10098D358);
  }
  v2 = (void *)qword_100A4CA78;

  return v2;
}

- (IDSGroupAgent)initWithQueue:(id)a3 isSessionControlEnabled:(BOOL)a4
{
  v6 = (OS_dispatch_queue *)a3;
  v24.receiver = self;
  v24.super_class = (Class)IDSGroupAgent;
  v7 = [(IDSGroupAgent *)&v24 init];
  v8 = v7;
  if (v7)
  {
    v7->_queue = v6;
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    endpointToResolvedParameters = v8->_endpointToResolvedParameters;
    v8->_endpointToResolvedParameters = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    endpointToClientInfo = v8->_endpointToClientInfo;
    v8->_endpointToClientInfo = v11;

    uint64_t v13 = +[IDSGroupSessionMultiplexer sharedInstance];
    multiplexer = v8->_multiplexer;
    v8->_multiplexer = (IDSGroupSessionMultiplexer *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    portCollisionDetection = v8->_portCollisionDetection;
    v8->_portCollisionDetection = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    managedSessions = v8->_managedSessions;
    v8->_managedSessions = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionIDToEndpoints = v8->_sessionIDToEndpoints;
    v8->_sessionIDToEndpoints = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionIDToEvaluators = v8->_sessionIDToEvaluators;
    v8->_sessionIDToEvaluators = v21;

    v8->_isSessionControlEnabled = a4;
  }

  return v8;
}

- (void)registerAgent
{
  v3 = [(IDSGroupAgent *)self agent];

  if (!v3)
  {
    id v4 = +[NSString stringWithFormat:@"Agent with domain:%@, class:%@", @"com.apple.ids", @"IDSGroupAgent"];
    [v4 UTF8String];
    v5 = [(IDSGroupAgent *)self queue];
    v6 = (void *)nw_agent_create();
    [(IDSGroupAgent *)self setAgent:v6];

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(IDSGroupAgent *)self setMembersArrayDict:v7];

    v8 = [(IDSGroupAgent *)self agent];
    nw_agent_set_group_handlers();

    v9 = [(IDSGroupAgent *)self agent];
    nw_agent_set_flow_handlers();

    v10 = [(IDSGroupAgent *)self agent];
    nw_agent_add_resolve_handlers();

    v11 = [(IDSGroupAgent *)self agent];
    v12 = IDSRealTimeContext();
    nw_agent_set_flow_context();

    uint64_t v13 = [(IDSGroupAgent *)self agent];
    nw_agent_change_state();

    v27[0] = 0;
    v27[1] = 0;
    v14 = [(IDSGroupAgent *)self agent];
    nw_agent_get_uuid();

    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v27];
    id v16 = objc_alloc_init((Class)NEPolicySession);
    [(IDSGroupAgent *)self setPolicySession:v16];

    id v17 = objc_alloc((Class)NEPolicy);
    v18 = +[NEPolicyResult netAgentUUID:v15];
    v19 = +[NEPolicyCondition allInterfaces];
    v26[0] = v19;
    v20 = +[NEPolicyCondition ipProtocol:17];
    v26[1] = v20;
    v21 = +[NEPolicyCondition requiredAgentDomain:@"com.apple.ids" agentType:@"IDSGroupAgent"];
    v26[2] = v21;
    v22 = +[NSArray arrayWithObjects:v26 count:3];
    id v23 = [v17 initWithOrder:0 result:v18 conditions:v22];

    objc_super v24 = [(IDSGroupAgent *)self policySession];
    [v24 addPolicy:v23];

    v25 = [(IDSGroupAgent *)self policySession];
    [v25 apply];
  }
}

- (void)registerEntitledAgent
{
  v3 = [(IDSGroupAgent *)self entitledAgent];

  if (!v3)
  {
    id v23 = +[NSString stringWithFormat:@"Agent with domain:%@, class:%@", @"com.apple.ids", @"IDSGroupEntitledAgent"];
    [v23 UTF8String];
    id v4 = [(IDSGroupAgent *)self queue];
    v5 = (void *)nw_agent_create();
    [(IDSGroupAgent *)self setEntitledAgent:v5];

    v6 = [(IDSGroupAgent *)self entitledAgent];
    nw_agent_add_resolve_handlers();

    id v7 = [(IDSGroupAgent *)self entitledAgent];
    v8 = IDSRealTimeContext();
    nw_agent_set_flow_context();

    v9 = [(IDSGroupAgent *)self entitledAgent];
    nw_agent_change_state();

    v25[0] = 0;
    v25[1] = 0;
    v10 = [(IDSGroupAgent *)self entitledAgent];
    nw_agent_get_uuid();

    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v25];
    id v12 = objc_alloc_init((Class)NEPolicySession);
    [(IDSGroupAgent *)self setPolicySessionWithEntitlment:v12];

    id v13 = objc_alloc((Class)NEPolicy);
    v14 = +[NEPolicyResult netAgentUUID:v11];
    id v15 = +[NEPolicyCondition allInterfaces];
    v24[0] = v15;
    id v16 = +[NEPolicyCondition ipProtocol:17];
    v24[1] = v16;
    id v17 = +[NEPolicyCondition requiredAgentDomain:@"com.apple.ids" agentType:@"IDSGroupEntitledAgent"];
    v24[2] = v17;
    v18 = +[NEPolicyCondition customEntitlement:@"com.apple.private.ids.agent.GroupRestricted"];
    v24[3] = v18;
    v19 = +[NSArray arrayWithObjects:v24 count:4];
    id v20 = [v13 initWithOrder:0 result:v14 conditions:v19];

    v21 = [(IDSGroupAgent *)self policySessionWithEntitlment];
    [v21 addPolicy:v20];

    v22 = [(IDSGroupAgent *)self policySessionWithEntitlment];
    [v22 apply];
  }
}

- (void)createNewSessionForClientRequest:(id)a3 isClient:(BOOL)a4 registrationCompletionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void (**)(void, void, void))v9;
  if (v8)
  {
    id v11 = +[IDSDServiceController sharedInstance];
    id v12 = (void *)IDSServiceNameAirDropWalkAway;
    id v13 = [v11 serviceWithIdentifier:IDSServiceNameAirDropWalkAway];

    v14 = +[IDSDAccountController sharedInstance];
    id v15 = [v14 appleIDAccountOnService:v13];

    if (!v15)
    {
      v40 = +[IDSFoundationLog TransportLevelAgent];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v94 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "No account found for %@", buf, 0xCu);
      }

      v10[2](v10, 0, 0);
      goto LABEL_68;
    }
    BOOL v72 = v6;
    id v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v17 = [v15 unprefixedURIStringsFromRegistration];
    v18 = (void *)_IDSCopyCallerIDWithSelfMessagingHint();

    v75 = self;
    if ([(IDSGroupAgent *)self isAirDropSession:v8])
    {
      v73 = v18;
      id v19 = +[NSString stringWithFormat:@"%@", v8];
      id v76 = v12;
      id v20 = +[IDSFoundationLog TransportLevelAgent];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        IDSLoggableDescriptionForHandleOnService();
        v22 = v21 = v16;
        *(_DWORD *)buf = 138412290;
        uint64_t v94 = (uint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found airdrop_pro endpoint: %@", buf, 0xCu);

        id v16 = v21;
      }

      id v23 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_alias()];
      objc_super v24 = [v23 componentsSeparatedByString:@":"];
      if ((unint64_t)[v24 count] <= 4) {
        sub_100725590();
      }
      if ([v24 count] == (id)5)
      {
        v65 = v23;
        CFMutableDictionaryRef theDict = v16;
        value = [v24 objectAtIndexedSubscript:4];
        v25 = [v24 objectAtIndexedSubscript:3];
        v26 = +[NSData __imDataWithHexString:v25];
        v27 = [v24 objectAtIndexedSubscript:1];
        [v24 objectAtIndexedSubscript:2];
        v28 = v67 = v15;
        v29 = +[NSString stringWithFormat:@"%@:%@", v27, v28];
        v69 = (void *)IDSCopyIDForTokenWithID();

        id v15 = v67;
        v30 = [v67 primaryRegistration];
        v31 = [v30 pushToken];

        v32 = (void *)IDSCopyBestGuessIDForID();
        uint64_t v33 = IDSCopyIDForTokenWithID();

        v34 = [v24 objectAtIndexedSubscript:3];
        v35 = objc_msgSend(v31, "__imHexString");
        v36 = v35;
        if (v35 && v34)
        {

          if (v33 && v69)
          {
            v92[0] = v33;
            v92[1] = v69;
            v37 = +[NSArray arrayWithObjects:v92 count:2];

            v18 = (void *)v33;
            id v38 = v76;
            id v16 = theDict;
            uint64_t v39 = (uint64_t)value;
LABEL_19:

            if (v39)
            {
              valuea = (void *)v39;
              v74 = v18;
              id v77 = v38;
              theDicta = v16;
              v66 = v13;
              v68 = v15;
              id v45 = objc_alloc_init((Class)NSMutableDictionary);
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              id v46 = v37;
              id v47 = [v46 countByEnumeratingWithState:&v86 objects:v90 count:16];
              if (v47)
              {
                id v48 = v47;
                uint64_t v49 = *(void *)v87;
                do
                {
                  for (i = 0; i != v48; i = (char *)i + 1)
                  {
                    if (*(void *)v87 != v49) {
                      objc_enumerationMutation(v46);
                    }
                    uint64_t v51 = *(void *)(*((void *)&v86 + 1) + 8 * i);
                    v52 = +[NSNumber numberWithBool:1];
                    [v45 setValue:v52 forKey:v51];
                  }
                  id v48 = [v46 countByEnumeratingWithState:&v86 objects:v90 count:16];
                }
                while (v48);
              }

              CFDictionarySetValue(theDicta, IDSSessionUniqueIDKey, valuea);
              CFDictionarySetValue(theDicta, IDSGroupSessionMessagesGroupIDKey, valuea);
              id v15 = v68;
              v53 = [v68 uniqueID];
              if (v53)
              {
                CFDictionarySetValue(theDicta, IDSSessionAccountIDKey, v53);
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_1007257DC();
              }

              id v57 = v46;
              if (v57)
              {
                CFDictionarySetValue(theDicta, IDSSessionDestinationsKey, v57);
                id v13 = v66;
              }
              else
              {
                id v13 = v66;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100725754();
                }
              }

              id v58 = v45;
              if (v58)
              {
                CFDictionarySetValue(theDicta, IDSSessionDestinationLightWeightStatusesKey, v58);
                v59 = v77;
              }
              else
              {
                v59 = v77;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_1007256CC();
                }
              }

              v60 = +[NSNumber numberWithBool:1];
              if (v60)
              {
                CFDictionarySetValue(theDicta, IDSGroupSessionIsLightweightParticipantKey, v60);
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_100725644();
              }

              v61 = +[NSNumber numberWithBool:v72];
              if (v61)
              {
                CFDictionarySetValue(theDicta, IDSSessionIsInitiatorKey, v61);
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_1007255BC();
              }

              CFDictionarySetValue(theDicta, IDSSessionIsMultiwayKey, &__kCFBooleanTrue);
              CFDictionarySetValue(theDicta, IDSSessionDisallowWifiInterfaceKey, &__kCFBooleanFalse);
              CFDictionarySetValue(theDicta, IDSSessionConnectionCountHintKey, &off_1009D2478);
              CFDictionarySetValue(theDicta, IDSSessionAlwaysSkipSelfKey, &__kCFBooleanFalse);
              CFDictionarySetValue(theDicta, IDSSessionWaitForPreConnectionDataKey, &__kCFBooleanFalse);
              id v16 = theDicta;
              CFDictionarySetValue(theDicta, IDSSessionPreferredAddressFamilyKey, &off_1009D2478);
              CFDictionarySetValue(theDicta, IDSSessionTransportTypeKey, &off_1009D2490);
              id v62 = [v10 copy];
              if (v62) {
                CFDictionarySetValue(theDicta, IDSSessionReliableUnicastRegistrationCompletionBlockKey, v62);
              }

              if (v59) {
                CFDictionarySetValue(theDicta, IDSSessionClientID, v59);
              }
              v63 = im_primary_queue();
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100430914;
              block[3] = &unk_100980950;
              v81 = theDicta;
              v82 = v75;
              id v83 = valuea;
              v85 = v10;
              id v38 = v59;
              id v84 = v38;
              id v19 = valuea;
              dispatch_async(v63, block);

              v18 = v74;
            }
            else
            {
              v10[2](v10, 0, 0);

              id v19 = v69;
            }
            goto LABEL_67;
          }
          v64 = +[IDSFoundationLog TransportLevelAgent];
          id v16 = theDict;
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v94 = v33;
            __int16 v95 = 2112;
            v96 = v69;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Can not create destination array from localDestination: %@ and remoteDestination: %@", buf, 0x16u);
          }

          v10[2](v10, 0, 0);
        }
        else
        {
          v56 = +[IDSFoundationLog TransportLevelAgent];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v94 = (uint64_t)v36;
            __int16 v95 = 2112;
            v96 = v34;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Can not create destination array from localPushToken: %@ and remotePushToken: %@", buf, 0x16u);
          }

          v10[2](v10, 0, 0);
          id v15 = v67;
          id v16 = theDict;
        }
        id v23 = v65;
      }
      else
      {
        v55 = +[IDSFoundationLog TransportLevelAgent];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v94 = (uint64_t)v8;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Unexpected format for endpoint: %@", buf, 0xCu);
        }

        v10[2](v10, 0, 0);
        uint64_t v33 = (uint64_t)v73;
      }

      v18 = (void *)v33;
      id v38 = v76;
LABEL_67:

LABEL_68:
      goto LABEL_69;
    }
    id v19 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_name()];
    if (([v19 containsString:@"com.apple.airdrop_pro"] & 1) == 0)
    {
      v54 = +[IDSFoundationLog TransportLevelAgent];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v94 = (uint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Unexpected format for endpoint: %@", buf, 0xCu);
      }

      v10[2](v10, 0, 0);
      id v38 = 0;
      goto LABEL_67;
    }
    uint64_t v41 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_alias()];
    v42 = (void *)IDSCopyBestGuessIDForID();
    v91[0] = v42;
    v69 = (void *)v41;
    v43 = v16;
    v44 = (void *)IDSCopyBestGuessIDForID();
    v91[1] = v44;
    v37 = +[NSArray arrayWithObjects:v91 count:2];

    id v16 = v43;
    uint64_t v39 = [(IDSGroupAgent *)v75 generateSessionIDFromMemberArray:v37];
    id v38 = 0;
    goto LABEL_19;
  }
  (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
LABEL_69:
}

- (id)generateSessionIDFromMemberArray:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)2)
  {
    id v4 = [v3 sortedArrayUsingComparator:&stru_10098D508];
    v5 = [v4 componentsJoinedByString:@","];
    BOOL v6 = [v5 dataUsingEncoding:4];

    memset(md, 170, 20);
    id v7 = v6;
    CC_SHA1([v7 bytes], (CC_LONG)objc_msgSend(v7, "length"), md);
    id v8 = +[NSData dataWithBytes:md length:20];
    if ((unint64_t)[v8 length] <= 0xF) {
      sub_100725864();
    }
    id v9 = v8;
    long long v13 = *(_OWORD *)[v9 bytes];
    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v13];
    id v11 = objc_msgSend(v10, "UUIDString", v13, *(void *)md, *(void *)&md[8], *(void *)&md[16]);
  }
  else
  {
    id v4 = +[IDSFoundationLog TransportLevelAgent];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "generateStringFromMembers received unexpected input", md, 2u);
    }
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isAppleEndpointForExistingSession:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_alias()];
  id v4 = [objc_alloc((Class)IDSGroupSessionConnectionParameters) initWithStringRepresentation:v3];
  v5 = [v4 sessionID];
  if (v5)
  {
    BOOL v6 = [v4 multiplexer];
    unsigned __int8 v7 = [v6 isEqualToString:@"groupsession"];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)isAirDropSession:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_name()];
  uint64_t application_service_alias = nw_endpoint_get_application_service_alias();

  BOOL v6 = +[NSString stringWithFormat:@"%s", application_service_alias];
  unsigned __int8 v7 = [v6 componentsSeparatedByString:@":"];
  if ((unint64_t)[v7 count] >= 4)
  {
    id v9 = [v7 objectAtIndexedSubscript:0];
    if ([v4 containsString:@"com.apple.airdrop_pro"]) {
      unsigned __int8 v8 = [v9 containsString:@"airdroppro"];
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)resolveAirDropProEndpointWithParams:(id)a3 options:(id)a4 agentResolveResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = IDSSessionUniqueIDKey;
  id v26 = a3;
  id v10 = [v7 objectForKeyedSubscript:v9];
  id v11 = [v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastLocalConnectionID];
  id v12 = [v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastRemoteConnectionID];
  long long v13 = [v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastParentConnection];
  uint64_t v14 = IDSGlobalLinkReliableUnicastRemoteType;
  id v15 = [v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastRemoteType];

  if (v15)
  {
    id v16 = [v7 objectForKeyedSubscript:v14];
    unsigned int v17 = [v16 unsignedCharValue];

    int v18 = 2 * (v17 < 9);
    if (v17 == 9) {
      int v18 = 3;
    }
    if (v17) {
      LODWORD(v15) = v18;
    }
    else {
      LODWORD(v15) = 1;
    }
  }
  id v19 = v11;
  dispatch_data_t v20 = dispatch_data_create([v19 bytes], (size_t)objc_msgSend(v19, "length"), 0, 0);
  id v21 = v12;
  dispatch_data_t v22 = dispatch_data_create([v21 bytes], (size_t)objc_msgSend(v21, "length"), 0, 0);
  id v23 = +[IDSFoundationLog TransportLevelAgent];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v13;
    __int16 v30 = 2112;
    id v31 = v19;
    __int16 v32 = 2112;
    id v33 = v21;
    __int16 v34 = 1024;
    int v35 = (int)v15;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "resolve_handler: encode_ids_connection with connection %@, lcid:%@, rcid:%@, remote nw_interface_type:%d", buf, 0x26u);
  }

  v27 = v8;
  id v24 = v8;
  id v25 = v10;
  nw_candidate_endpoint_for_ids_connection();
}

- (id)resolveAppleEndpoint:(id)a3
{
  id v4 = a3;
  __int16 v34 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_name()];
  uint64_t v5 = sub_100431924(v34);
  memset(__str, 170, 6);
  snprintf(__str, 6uLL, "%d", WORD1(v5));
  sub_10042EDC0();
  id v6 = objc_claimAutoreleasedReturnValue();
  nw_endpoint_t host = nw_endpoint_create_host((const char *)[v6 cStringUsingEncoding:134217984], __str);
  id v8 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_application_service_alias()];
  uint64_t v9 = +[NSString stringWithFormat:@"%s", nw_endpoint_get_description()];
  id v10 = [objc_alloc((Class)IDSGroupSessionConnectionParameters) initWithStringRepresentation:v8];
  id v11 = [v10 sessionID];

  if (!v11)
  {
    v27 = 0;
    goto LABEL_15;
  }
  id v31 = host;
  id v32 = v6;
  id v12 = v9;
  id v33 = &v30;
  portCollisionDetection = self->_portCollisionDetection;
  uint64_t v14 = [v10 sessionID];
  id v15 = [(NSMutableDictionary *)portCollisionDetection objectForKeyedSubscript:v14];

  if (!v15)
  {
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    id v16 = self->_portCollisionDetection;
    unsigned int v17 = [v10 sessionID];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];
  }
  int v18 = +[NSNumber numberWithUnsignedInt:v5];
  id v19 = [v15 objectForKeyedSubscript:v18];

  if (v19)
  {
    dispatch_data_t v20 = +[NSNumber numberWithUnsignedInt:v5];
    id v21 = [v15 objectForKeyedSubscript:v20];

    if (([(EndpointResolutionParameters *)v21 isEqual:v34] & 1) == 0)
    {
      v28 = +[IDSFoundationLog TransportLevelAgent];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v37 = v5;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v21;
        *(_WORD *)&v37[14] = 2112;
        *(void *)&v37[16] = v34;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Collision detected for port Signature %d, topics:(%@, %@)", buf, 0x1Cu);
      }

      v27 = 0;
      uint64_t v9 = v12;
      nw_endpoint_t host = v31;
      goto LABEL_14;
    }
  }
  dispatch_data_t v22 = [EndpointResolutionParameters alloc];
  id v23 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)v5];
  id v21 = [(EndpointResolutionParameters *)v22 initWithParams:v8 secondaryPort:v23];

  [(NSMutableDictionary *)self->_endpointToResolvedParameters setObject:v21 forKeyedSubscript:v12];
  id v24 = +[NSNumber numberWithUnsignedInt:v5];
  [v15 setObject:v34 forKeyedSubscript:v24];

  uint64_t v9 = v12;
  id v25 = +[IDSFoundationLog TransportLevelAgent];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t description = nw_endpoint_get_description();
    *(_DWORD *)buf = 138412546;
    *(void *)v37 = v12;
    *(_WORD *)&v37[8] = 2080;
    *(void *)&v37[10] = description;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Resolved endpoint: %@ from %s", buf, 0x16u);
  }

  nw_endpoint_t host = v31;
  v27 = v31;
LABEL_14:

  id v6 = v32;
LABEL_15:

  return v27;
}

- (void)unregisterAgent
{
  id v3 = [(IDSGroupAgent *)self agent];

  if (v3)
  {
    id v4 = [(IDSGroupAgent *)self agent];
    nw_agent_change_state();

    [(IDSGroupAgent *)self setAgent:0];
  }
  uint64_t v5 = [(IDSGroupAgent *)self policySession];

  if (v5)
  {
    id v6 = [(IDSGroupAgent *)self policySession];
    [v6 removeAllPolicies];

    id v7 = [(IDSGroupAgent *)self policySession];
    [v7 apply];

    [(IDSGroupAgent *)self setPolicySession:0];
  }
}

- (void)unregisterEntitledAgent
{
  id v3 = [(IDSGroupAgent *)self entitledAgent];

  if (v3)
  {
    id v4 = [(IDSGroupAgent *)self entitledAgent];
    nw_agent_change_state();

    [(IDSGroupAgent *)self setEntitledAgent:0];
  }
  uint64_t v5 = [(IDSGroupAgent *)self policySessionWithEntitlment];

  if (v5)
  {
    id v6 = [(IDSGroupAgent *)self policySessionWithEntitlment];
    [v6 removeAllPolicies];

    id v7 = [(IDSGroupAgent *)self policySessionWithEntitlment];
    [v7 apply];

    [(IDSGroupAgent *)self setPolicySessionWithEntitlment:0];
  }
}

- (void)_injectPortTopicMappingForSession:(id)a3 topic:(id)a4 portSignature:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_portCollisionDetection objectForKeyedSubscript:v11];
  if (!v10)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->_portCollisionDetection setObject:v10 forKeyedSubscript:v11];
  }
  [v10 setObject:v8 forKeyedSubscript:v9];
}

- (unsigned)getPortSignatureForTopic:(id)a3
{
  return sub_100431924(a3);
}

- (OS_nw_channel)packetChannel
{
  return self->_packetChannel;
}

- (void)setPacketChannel:(id)a3
{
}

- (OS_nw_agent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (OS_nw_agent)entitledAgent
{
  return self->_entitledAgent;
}

- (void)setEntitledAgent:(id)a3
{
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
}

- (NEPolicySession)policySessionWithEntitlment
{
  return self->_policySessionWithEntitlment;
}

- (void)setPolicySessionWithEntitlment:(id)a3
{
}

- (NSMutableDictionary)membersArrayDict
{
  return self->_membersArrayDict;
}

- (void)setMembersArrayDict:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (NSMutableDictionary)endpointToResolvedParameters
{
  return self->_endpointToResolvedParameters;
}

- (void)setEndpointToResolvedParameters:(id)a3
{
}

- (NSMutableDictionary)endpointToClientInfo
{
  return self->_endpointToClientInfo;
}

- (void)setEndpointToClientInfo:(id)a3
{
}

- (NSMutableDictionary)portCollisionDetection
{
  return self->_portCollisionDetection;
}

- (void)setPortCollisionDetection:(id)a3
{
}

- (IDSGroupSessionMultiplexer)multiplexer
{
  return self->_multiplexer;
}

- (void)setMultiplexer:(id)a3
{
}

- (NSMutableDictionary)managedSessions
{
  return self->_managedSessions;
}

- (void)setManagedSessions:(id)a3
{
}

- (NSMutableDictionary)sessionIDToEndpoints
{
  return self->_sessionIDToEndpoints;
}

- (void)setSessionIDToEndpoints:(id)a3
{
}

- (NSMutableDictionary)sessionIDToEvaluators
{
  return self->_sessionIDToEvaluators;
}

- (void)setSessionIDToEvaluators:(id)a3
{
}

- (BOOL)isSessionControlEnabled
{
  return self->_isSessionControlEnabled;
}

- (void)setIsSessionControlEnabled:(BOOL)a3
{
  self->_isSessionControlEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDToEvaluators, 0);
  objc_storeStrong((id *)&self->_sessionIDToEndpoints, 0);
  objc_storeStrong((id *)&self->_managedSessions, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);
  objc_storeStrong((id *)&self->_portCollisionDetection, 0);
  objc_storeStrong((id *)&self->_endpointToClientInfo, 0);
  objc_storeStrong((id *)&self->_endpointToResolvedParameters, 0);
  objc_storeStrong((id *)&self->_membersArrayDict, 0);
  objc_storeStrong((id *)&self->_policySessionWithEntitlment, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_entitledAgent, 0);
  objc_storeStrong((id *)&self->_agent, 0);

  objc_storeStrong((id *)&self->_packetChannel, 0);
}

@end