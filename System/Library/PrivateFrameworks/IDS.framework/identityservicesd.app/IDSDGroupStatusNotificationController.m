@interface IDSDGroupStatusNotificationController
+ (IDSDGroupStatusNotificationController)sharedInstance;
- (IDSDGroupStatusNotificationController)init;
- (IDSDGroupStatusNotificationController)initWithSessionController:(id)a3 realTimeEncryptionController:(id)a4 broadcaster:(id)a5;
- (IDSDGroupStatusNotificationControllerBroadcaster)broadcaster;
- (IDSDSessionController)sessionController;
- (IDSGroupEncryptionController)realTimeEncryptionController;
- (NSMutableDictionary)events;
- (NSMutableDictionary)groupIDToCapabilityToParticipantPushTokens;
- (NSMutableDictionary)groupMemberPushTokens;
- (NSMutableSet)groups;
- (OS_dispatch_queue)queue;
- (double)_multiwayFTMessageSendTimeout;
- (id)_currentDateString;
- (id)_specificOriginatorfromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5;
- (id)getURIFromPushToken:(id)a3 forGroup:(id)a4;
- (id)participantsForGroupID:(id)a3;
- (id)pushTokensForGroupID:(id)a3 capability:(id)a4;
- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 commandContext:(id)a8 toGroup:(id)a9 sessionID:(id)a10 reason:(unsigned __int8)a11 waitForMadridAcks:(BOOL)a12 isUPlusOne:(BOOL)a13 isInitiator:(id)a14 quickRelayUserType:(id)a15 requiredCapabilites:(id)a16 requiredLackOfCapabilities:(id)a17 completionBlock:(id)a18;
- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13;
- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13 requiredCapabilites:(id)a14 requiredLackOfCapabilities:(id)a15;
- (void)dealloc;
- (void)notifyJoinToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 completionBlock:(id)a10;
- (void)notifyJoinToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11;
- (void)notifyLeaveToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9;
- (void)notifyLeaveToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11;
- (void)processIncomingParticipantDataUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8;
- (void)processIncomingParticipantUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8;
- (void)pushTokenLookup:(id)a3 forGroup:(id)a4 sessionID:(id)a5 fromURI:(id)a6 account:(id)a7 completionBlock:(id)a8;
- (void)updateMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 messagingCapabilities:(id)a10 reason:(unsigned __int8)a11 isUPlusOne:(BOOL)a12 completionBlock:(id)a13;
- (void)updateParticipantDataToMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 isUPlusOne:(BOOL)a10;
@end

@implementation IDSDGroupStatusNotificationController

+ (IDSDGroupStatusNotificationController)sharedInstance
{
  if (qword_100A4A620 != -1) {
    dispatch_once(&qword_100A4A620, &stru_1009819F8);
  }
  v2 = (void *)qword_100A4A628;

  return (IDSDGroupStatusNotificationController *)v2;
}

- (IDSDGroupStatusNotificationController)init
{
  v3 = +[IDSDSessionController sharedInstance];
  v4 = +[IDSGroupEncryptionController sharedInstance];
  v5 = objc_alloc_init(IDSDGroupStatusNotificationControllerBroadcaster);
  v6 = [(IDSDGroupStatusNotificationController *)self initWithSessionController:v3 realTimeEncryptionController:v4 broadcaster:v5];

  return v6;
}

- (IDSDGroupStatusNotificationController)initWithSessionController:(id)a3 realTimeEncryptionController:(id)a4 broadcaster:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)IDSDGroupStatusNotificationController;
  v12 = [(IDSDGroupStatusNotificationController *)&v26 init];
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notifiers = v12->_notifiers;
    v12->_notifiers = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    groups = v12->_groups;
    v12->_groups = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    events = v12->_events;
    v12->_events = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToCapabilityToParticipantPushTokens = v12->_groupIDToCapabilityToParticipantPushTokens;
    v12->_groupIDToCapabilityToParticipantPushTokens = v19;

    objc_storeStrong((id *)&v12->_sessionController, a3);
    objc_storeStrong((id *)&v12->_realTimeEncryptionController, a4);
    objc_storeStrong((id *)&v12->_broadcaster, a5);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.ids.IDSDGroupStatusNotificationController"];
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], v21);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v23;
  }
  return v12;
}

- (void)dealloc
{
  queue = self->_queue;
  self->_queue = 0;

  notifiers = self->_notifiers;
  self->_notifiers = 0;

  groups = self->_groups;
  self->_groups = 0;

  events = self->_events;
  self->_events = 0;

  groupMemberPushTokens = self->_groupMemberPushTokens;
  self->_groupMemberPushTokens = 0;

  groupIDToCapabilityToParticipantPushTokens = self->_groupIDToCapabilityToParticipantPushTokens;
  self->_groupIDToCapabilityToParticipantPushTokens = 0;

  v9.receiver = self;
  v9.super_class = (Class)IDSDGroupStatusNotificationController;
  [(IDSDGroupStatusNotificationController *)&v9 dealloc];
}

- (id)pushTokensForGroupID:(id)a3 capability:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_groupIDToCapabilityToParticipantPushTokens objectForKeyedSubscript:a3];
  v8 = v7;
  if (v7)
  {
    objc_super v9 = [v7 objectForKeyedSubscript:v6];
    if (v9)
    {
      id v10 = +[NSMutableArray array];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = +[IDSPushToken pushTokenWithData:](IDSPushToken, "pushTokenWithData:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
            [v10 addObject:v16];
          }
          id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
    else
    {
      id v10 = +[NSArray array];
    }
  }
  else
  {
    id v10 = +[NSArray array];
  }

  return v10;
}

- (id)participantsForGroupID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_groups;
    id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      uint64_t v8 = IDSGroupStatusNotificationControllerGroupIDKey;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        id v11 = [v10 objectForKey:v8];
        if ([v11 isEqualToString:v4]) {
          break;
        }

        if (v6 == (id)++v9)
        {
          id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
      }
      id v12 = [v10 objectForKey:IDSGroupStatusNotificationControllerGroupParticipantsKey];

      if (v12) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_19:
    }
  }
  else
  {
    id v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot get participantsForGroupID, no groupID!", buf, 2u);
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
  }
  id v12 = +[NSArray array];
LABEL_21:
  uint64_t v14 = +[IDSFoundationLog SessionController];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found participants for group %@", buf, 0xCu);
  }

  id v15 = [v4 copy];
  [v12 description];
  v21 = long long v20 = v15;
  id v16 = v21;
  id v17 = v15;
  cut_dispatch_log_queue();
  id v18 = objc_msgSend(v12, "copy", _NSConcreteStackBlock, 3221225472, sub_1000DB698, &unk_10097E440);

  return v18;
}

- (id)_currentDateString
{
  v2 = +[NSDate date];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ssz"];
  id v4 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v3 setLocale:v4];

  v5 = [v3 stringFromDate:v2];

  return v5;
}

- (void)notifyJoinToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 completionBlock:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v60 = a6;
  id v59 = a7;
  id v18 = a8;
  id v57 = a10;
  long long v19 = im_primary_base_queue();
  dispatch_assert_queue_V2(v19);

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  long long v21 = +[NSNumber numberWithUnsignedChar:1];
  if (v21)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v21);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F5B4();
  }

  id v22 = v15;
  if (v22)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v22);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F52C();
  }

  long long v23 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &stru_100981B70);
  if (v23)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v23);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F4A4();
  }

  id v24 = v18;
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F41C();
  }

  long long v25 = [v17 isInitiator];
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F394();
  }

  objc_super v26 = +[NSNumber numberWithBool:a9];
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v26);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F30C();
  }

  id v27 = [(IDSDGroupStatusNotificationController *)self sessionController];
  v28 = [v27 sessionWithUniqueID:v24];

  if (v28 && [v28 handOffOverQREnabled])
  {
    [v28 getIDSContextTimeStamp];
    v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    if (v29)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v29);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070F284();
    }
  }
  v30 = [v17 participantID];
  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v30);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F1FC();
  }

  v31 = [v17 participantData];
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v31);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F174();
  }

  v32 = [v17 urisToParticipantIDs];
  if (v32) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v32);
  }
  v56 = v28;

  v33 = [v17 clientJoinContextData];
  if (v33) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v33);
  }

  v34 = [v60 primaryRegistration];
  v35 = [v34 pushToken];
  v36 = [v60 service];
  v37 = [v36 identifier];
  v54 = +[IDSPushToken pushTokenWithData:v35 withServiceLoggingHint:v37];

  BOOL v38 = a9;
  if (a9)
  {
    v39 = [v17 commandContext];
    v40 = v16;
  }
  else
  {
    v41 = [v17 joinType];
    id v42 = [v41 integerValue];

    v40 = v16;
    if (v42 == (id)1)
    {
      v39 = +[NSNumber numberWithUnsignedInteger:1];
    }
    else
    {
      v39 = 0;
    }
    BOOL v38 = 0;
  }
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000DBEB8;
  v62[3] = &unk_100981A20;
  v62[4] = self;
  v63 = Mutable;
  id v64 = v60;
  id v65 = v40;
  uint64_t v72 = 207;
  id v66 = v59;
  id v67 = v39;
  id v68 = v22;
  id v69 = v24;
  BOOL v73 = v38;
  id v70 = v17;
  id v71 = v57;
  id v58 = v57;
  id v55 = v17;
  id v53 = v24;
  id v43 = v22;
  id v44 = v39;
  id v45 = v59;
  id v46 = v40;
  id v47 = v60;
  v48 = Mutable;
  v49 = objc_retainBlock(v62);
  v50 = [(IDSDGroupStatusNotificationController *)self realTimeEncryptionController];
  id v51 = [v50 createRealTimeEncryptionFullIdentityForDevice:v54 completionBlock:v49];

  v52 = [(IDSDGroupStatusNotificationController *)self sessionController];
  [v52 updateCriticalReliabilityState];
}

- (void)notifyJoinToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v65 = a6;
  id v64 = a7;
  id v19 = a8;
  id v62 = a10;
  id v60 = a11;
  long long v20 = im_primary_base_queue();
  dispatch_assert_queue_V2(v20);

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v22 = +[NSNumber numberWithUnsignedChar:1];
  if (v22)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v22);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F5B4();
  }

  id v23 = v16;
  if (v23)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v23);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F52C();
  }
  id v58 = v23;

  id v24 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_100981B70);
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F4A4();
  }

  id v25 = v19;
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F41C();
  }

  objc_super v26 = [v18 isInitiator];
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v26);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F394();
  }

  id v27 = +[NSNumber numberWithBool:a9];
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v27);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F30C();
  }

  v28 = [(IDSDGroupStatusNotificationController *)self sessionController];
  v56 = v25;
  v29 = [v28 sessionWithUniqueID:v25];

  if (v29 && [v29 handOffOverQREnabled])
  {
    [v29 getIDSContextTimeStamp];
    v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    if (v30)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v30);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070F284();
    }
  }
  v31 = [v18 participantID];
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v31);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F1FC();
  }

  v32 = [v18 participantData];
  if (v32)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v32);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F174();
  }

  v33 = [v18 urisToParticipantIDs];
  if (v33) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v33);
  }
  id v59 = v29;

  v34 = [v18 clientJoinContextData];
  if (v34) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v34);
  }

  v35 = [v65 primaryRegistration];
  v36 = [v35 pushToken];
  v37 = [v65 service];
  BOOL v38 = [v37 identifier];
  id v55 = +[IDSPushToken pushTokenWithData:v36 withServiceLoggingHint:v38];

  if (a9)
  {
    v39 = v17;
    v40 = [v18 commandContext];
    v41 = v18;
  }
  else
  {
    v41 = v18;
    id v42 = [v18 joinType];
    id v43 = [v42 integerValue];

    if (v43 == (id)1)
    {
      v39 = v17;
      v40 = +[NSNumber numberWithUnsignedInteger:1];
    }
    else
    {
      v39 = v17;
      v40 = 0;
    }
  }
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1000DC718;
  v67[3] = &unk_100981A48;
  v67[4] = self;
  id v68 = Mutable;
  id v69 = v65;
  id v70 = v39;
  id v71 = v64;
  id v72 = v40;
  id v73 = v58;
  id v74 = v56;
  BOOL v79 = a9;
  id v75 = v41;
  id v76 = v62;
  uint64_t v78 = 207;
  id v77 = v60;
  id v61 = v60;
  id v63 = v62;
  id v54 = v41;
  id v57 = v56;
  id v44 = v58;
  id v45 = v40;
  id v46 = v64;
  id v47 = v39;
  id v48 = v65;
  v49 = Mutable;
  v50 = objc_retainBlock(v67);
  id v51 = [(IDSDGroupStatusNotificationController *)self realTimeEncryptionController];
  id v52 = [v51 createRealTimeEncryptionFullIdentityForDevice:v55 completionBlock:v50];

  id v53 = [(IDSDGroupStatusNotificationController *)self sessionController];
  [v53 updateCriticalReliabilityState];
}

- (void)notifyLeaveToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9
{
  id v15 = a3;
  id v39 = a4;
  id v16 = a5;
  id v38 = a6;
  id v37 = a7;
  id v17 = a8;
  id v18 = im_primary_base_queue();
  dispatch_assert_queue_V2(v18);

  id v19 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "notify Leave To Group", buf, 2u);
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
  if (a9)
  {
    v36 = [v16 commandContext];
  }
  else
  {
    v36 = 0;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  long long v21 = +[NSNumber numberWithUnsignedChar:2];
  if (v21)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v21);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F5B4();
  }

  id v22 = [v16 clientLeaveContextData];
  if (v22) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v22);
  }

  id v23 = v17;
  if (v23)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v23);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F41C();
  }

  id v24 = v15;
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F52C();
  }

  id v25 = objc_msgSend(v39, "__imArrayByApplyingBlock:", &stru_100981B70);
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F4A4();
  }

  objc_super v26 = [v16 participantID];
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v26);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F1FC();
  }

  id v27 = [v16 isInitiator];
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v27);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F394();
  }

  v28 = +[NSNumber numberWithBool:a9];
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v28);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F30C();
  }

  v29 = [(IDSDGroupStatusNotificationController *)self sessionController];
  v30 = [v29 sessionWithUniqueID:v23];

  if (v30 && [v30 handOffOverQREnabled])
  {
    [v30 getIDSContextTimeStamp];
    v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    if (v31)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v31);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070F284();
    }
  }
  v32 = [v16 isInitiator];
  v33 = [v16 quickRelayUserType];
  BYTE2(v35) = a9;
  LOWORD(v35) = 0;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:](self, "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:", Mutable, v38, v39, v37, 208, v36, v24, v23, v35, v32, v33, 0, 0, 0);

  v34 = [(IDSDGroupStatusNotificationController *)self sessionController];
  [v34 updateCriticalReliabilityState];
}

- (void)notifyLeaveToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v41 = a6;
  id v40 = a7;
  id v19 = a8;
  id v39 = a10;
  id v38 = a11;
  long long v20 = im_primary_base_queue();
  dispatch_assert_queue_V2(v20);

  long long v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "notify Leave To Group", buf, 2u);
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
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v23 = +[NSNumber numberWithUnsignedChar:2];
  if (v23)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v23);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F5B4();
  }

  id v24 = v19;
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F41C();
  }

  id v25 = v16;
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F52C();
  }
  id v37 = v25;

  objc_super v26 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_100981B70);
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v26);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F4A4();
  }

  id v27 = [v18 participantID];
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v27);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F1FC();
  }

  v28 = [v18 isInitiator];
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v28);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F394();
  }

  v29 = +[NSNumber numberWithBool:a9];
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v29);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F30C();
  }

  v30 = [(IDSDGroupStatusNotificationController *)self sessionController];
  v31 = [v30 sessionWithUniqueID:v24];

  if (v31 && [v31 handOffOverQREnabled])
  {
    [v31 getIDSContextTimeStamp];
    v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    if (v32)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v32);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070F284();
    }
  }
  v33 = [v18 isInitiator];
  v34 = [v18 quickRelayUserType];
  BYTE1(v36) = a9;
  LOBYTE(v36) = 0;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:](self, "_sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:", Mutable, v41, v17, v40, 208, v37, v24, v36, v33, v34, v39, v38);

  uint64_t v35 = [(IDSDGroupStatusNotificationController *)self sessionController];
  [v35 updateCriticalReliabilityState];
}

- (void)updateMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 messagingCapabilities:(id)a10 reason:(unsigned __int8)a11 isUPlusOne:(BOOL)a12 completionBlock:(id)a13
{
  id v46 = a3;
  id v18 = a4;
  id v45 = a5;
  id v19 = a6;
  id v20 = a9;
  id v43 = a13;
  id v21 = a10;
  id v41 = a8;
  id v40 = a7;
  id v22 = im_primary_base_queue();
  dispatch_assert_queue_V2(v22);

  id v23 = +[NSNumber numberWithUnsignedChar:3];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v25 = v18;
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F52C();
  }

  id v26 = v20;
  id v42 = v25;
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v26);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F41C();
  }

  id v27 = objc_msgSend(v46, "__imArrayByApplyingBlock:", &stru_100981B70);
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v27);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F4A4();
  }

  id v28 = v23;
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v28);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F5B4();
  }
  id v39 = v28;

  v29 = [v19 isInitiator];
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v29);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F394();
  }

  v30 = [v19 participantID];
  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v30);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F1FC();
  }

  v31 = [v19 participantData];
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v31);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F174();
  }

  v32 = [v19 urisToParticipantIDs];
  if (v32) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v32);
  }

  if (v45) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v45);
  }
  id v37 = [v19 isInitiator];
  id v38 = [v21 requiredCapabilities];
  v33 = [v38 allObjects];
  v34 = [v21 requiredMissingCapabilities];

  uint64_t v35 = [v34 allObjects];
  BYTE2(v36) = a12;
  BYTE1(v36) = 1;
  LOBYTE(v36) = a11;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:](self, "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:", Mutable, v40, v46, v41, 209, 0, v42, v26, v36, v37, 0, v33, v35, v43);
}

- (void)updateParticipantDataToMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 isUPlusOne:(BOOL)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v33 = a8;
  id v19 = a7;
  id v20 = a3;
  id v21 = im_primary_base_queue();
  dispatch_assert_queue_V2(v21);

  id v22 = +[NSNumber numberWithUnsignedChar:4];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v24 = v15;
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F52C();
  }

  id v25 = v18;
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F41C();
  }

  id v26 = v22;
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v26);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F5B4();
  }

  id v27 = [v17 isInitiator];
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v27);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F394();
  }

  id v28 = [v17 participantID];
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v28);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F1FC();
  }

  v29 = [v17 participantData];
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v29);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070F174();
  }

  if (v16) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v16);
  }
  v30 = [v17 urisToParticipantIDs];
  if (v30) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v30);
  }

  v31 = [v17 isInitiator];
  BYTE1(v32) = a10;
  LOBYTE(v32) = 0;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:](self, "_sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:", Mutable, v19, v20, v33, 239, v24, v25, v32, v31, 0);
}

- (double)_multiwayFTMessageSendTimeout
{
  v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"ids-multiway-ftmessage-send-timeout"];

  double v4 = 605.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      if (v5 > 0.0)
      {
        double v6 = v5;
        uint64_t v7 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v10 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a send timeout of %f ", buf, 0xCu);
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
        double v4 = v6;
      }
    }
  }

  return v4;
}

- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13
{
  BYTE2(v13) = a11;
  LOWORD(v13) = a10;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:](self, "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:", a3, a4, a5, a6, a7, 0, a8, a9, v13, a12, a13, 0, 0, 0);
}

- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13 requiredCapabilites:(id)a14 requiredLackOfCapabilities:(id)a15
{
  BYTE2(v15) = a11;
  LOWORD(v15) = a10;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:](self, "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:", a3, a4, a5, a6, a7, 0, a8, a9, v15, a12, a13, a14, a15, 0);
}

- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 commandContext:(id)a8 toGroup:(id)a9 sessionID:(id)a10 reason:(unsigned __int8)a11 waitForMadridAcks:(BOOL)a12 isUPlusOne:(BOOL)a13 isInitiator:(id)a14 quickRelayUserType:(id)a15 requiredCapabilites:(id)a16 requiredLackOfCapabilities:(id)a17 completionBlock:(id)a18
{
  id v59 = a3;
  id v62 = (__CFString *)a4;
  id v22 = a5;
  id v63 = a6;
  id v65 = a8;
  id v58 = a9;
  id v66 = a10;
  id v60 = a14;
  id v61 = a15;
  unint64_t v23 = (unint64_t)a16;
  unint64_t v24 = (unint64_t)a17;
  id v64 = a18;
  if (v22)
  {
    id v55 = +[NSSet setWithArray:v22];
    v56 = +[IDSDestination destinationWithDestinations:v55];
    id v25 = +[NSString stringGUID];
    id v26 = objc_alloc_init((Class)IDSSendParameters);
    [v26 setQuickRelayUserType:v61];
    [v26 setMessage:v59];
    [v26 setEncryptPayload:1];
    [v26 setPriority:300];
    [v26 setDestinations:v56];
    id v27 = +[NSNumber numberWithInteger:a7];
    [v26 setCommand:v27];

    [v26 setCommandContext:v65];
    [v26 setIdentifier:v25];
    [v26 setAlwaysSkipSelf:1];
    id v28 = IDSGetUUIDData();
    [v26 setMessageUUID:v28];

    v29 = [v63 unprefixedURI];
    [v26 setFromID:v29];

    [(IDSDGroupStatusNotificationController *)self _multiwayFTMessageSendTimeout];
    objc_msgSend(v26, "setTimeout:");
    [v26 setIgnoreMaxRetryCount:1];
    [v26 setWantsResponse:1];
    [v26 setIsUPlusOne:a13];
    [v26 setIsInitiator:v60];
    if (_os_feature_enabled_impl())
    {
      v30 = +[IDSDSessionActiveParticipantsCache sharedInstance];
      v31 = [v30 vendTokenListForSessionID:v66];
      [v26 setPrioritizedTokenList:v31];
    }
    if (v23 | v24)
    {
      if ([(id)v23 count])
      {
        uint64_t v32 = +[IDSFoundationLog SessionController];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v78 = v23;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Group status notification requires properties -- manual {requiredCapabilites: %@}", buf, 0xCu);
        }

        [v26 setRequireAllRegistrationProperties:v23];
      }
      if ([(id)v24 count])
      {
        id v33 = +[IDSFoundationLog SessionController];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v78 = v24;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Group status notification requires lack of properties -- manual {requiredLackOfCapabilities: %@}", buf, 0xCu);
        }

        [v26 setRequireLackOfRegistrationProperties:v24];
      }
    }
    else
    {
      uint64_t v35 = [(IDSDGroupStatusNotificationController *)self sessionController];
      uint64_t v36 = [v35 sessionWithUniqueID:v66];

      id v37 = [v36 requiredLackOfCapabilities];
      id v38 = [v37 count];

      if (v38)
      {
        id v39 = +[IDSFoundationLog SessionController];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [v36 requiredLackOfCapabilities];
          *(_DWORD *)buf = 138412290;
          unint64_t v78 = (unint64_t)v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Group status notification requires lack of properties {requiredLackOfCapabilities: %@}", buf, 0xCu);
        }
        id v41 = [v36 requiredLackOfCapabilities];
        [v26 setRequireLackOfRegistrationProperties:v41];
      }
      id v42 = [v36 requiredCapabilities];
      id v43 = [v42 count];

      if (v43)
      {
        id v44 = +[IDSFoundationLog SessionController];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = [v36 requiredCapabilities];
          *(_DWORD *)buf = 138412290;
          unint64_t v78 = (unint64_t)v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Group status notification requires properties {requiredCapabilities: %@}", buf, 0xCu);
        }
        id v46 = [v36 requiredCapabilities];
        [v26 setRequireAllRegistrationProperties:v46];
      }
    }
    id v47 = +[IDSFoundationLog SessionController];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = +[NSNumber numberWithInteger:a7];
      if (a12) {
        CFStringRef v49 = @"YES";
      }
      else {
        CFStringRef v49 = @"NO";
      }
      id v50 = objc_retainBlock(v64);
      *(_DWORD *)buf = 138413314;
      unint64_t v78 = (unint64_t)v25;
      __int16 v79 = 2112;
      v80 = v48;
      __int16 v81 = 2112;
      id v82 = v65;
      __int16 v83 = 2112;
      CFStringRef v84 = v49;
      __int16 v85 = 2112;
      id v86 = v50;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Sending group status notification fanout message { GUID: %@, command: %@, commandContext: %@, waitForMadridAcks: %@, completionBlock: %@ }", buf, 0x34u);
    }
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    v75[3] = sub_1000DE638;
    v75[4] = sub_1000DE664;
    id v76 = (id)0xAAAAAAAAAAAAAAAALL;
    id v76 = objc_retainBlock(v64);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1000DE66C;
    v67[3] = &unk_100981A70;
    id v51 = v25;
    BOOL v73 = a12;
    id v68 = v51;
    id v72 = v75;
    id v69 = v22;
    id v70 = v58;
    id v71 = v66;
    unsigned __int8 v74 = a11;
    [(__CFString *)v62 sendMessageWithSendParameters:v26 willSendBlock:0 completionBlock:v67];
    id v52 = +[IDSFoundationLog SessionController];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      id v53 = +[NSNumber numberWithInteger:a7];
      *(_DWORD *)buf = 138413314;
      unint64_t v78 = (unint64_t)v51;
      __int16 v79 = 2112;
      v80 = v56;
      __int16 v81 = 2112;
      id v82 = v53;
      __int16 v83 = 2112;
      CFStringRef v84 = v62;
      __int16 v85 = 2112;
      id v86 = v63;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Sent messageID %@ to the destination %@ command %@ (account %@, fromURI %@)", buf, 0x34u);
    }
    _Block_object_dispose(v75, 8);
  }
  else
  {
    v34 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No Group, bailing...", buf, 2u);
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
  }
}

- (void)processIncomingParticipantUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8
{
  id v14 = a3;
  v123 = (__CFString *)a4;
  v124 = (__CFString *)a5;
  id v116 = a6;
  id v121 = a7;
  id v125 = a8;
  uint64_t v15 = objc_alloc_init(IDSGroupStatusNotificationParameters);
  v118 = self;
  id v16 = [(IDSDAccount *)self->_account uniqueID];
  v117 = [(IDSDGroupStatusNotificationController *)self _specificOriginatorfromURI:v124 senderToken:v123 accountUniqueID:v16];

  uint64_t v17 = objc_opt_class();
  sub_1000DFDC8(v17, v14, IDSFanoutMessageGroupIDKey);
  v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = objc_opt_class();
  id v19 = sub_1000DFDC8(v18, v14, IDSDSessionMessageJoinNotificationKey);
  v120 = (char *)[v19 unsignedIntegerValue];

  id v20 = [v125 objectForKey:IDSMessageContextCommandContextKey];
  id v21 = [v20 integerValue];
  if ((unint64_t)v21 >= 2) {
    id v22 = 0;
  }
  else {
    id v22 = v21;
  }
  id v109 = v22;

  uint64_t v23 = objc_opt_class();
  unint64_t v24 = (void *)IDSMessageContextFromServerStorageKey;
  id v25 = sub_1000DFDC8(v23, v125, IDSMessageContextFromServerStorageKey);
  uint64_t v26 = objc_opt_class();
  id v27 = sub_1000DFDC8(v26, v125, v24);
  unsigned int v110 = [v27 BOOLValue];

  id v28 = [v125 objectForKey:IDSMessageContextServerTimestampKey];
  [v28 doubleValue];
  v115 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

  uint64_t v29 = objc_opt_class();
  v30 = sub_1000DFDC8(v29, v14, IDSSessionParticipantIDKey);
  [(IDSGroupStatusNotificationParameters *)v15 setParticipantID:v30];

  uint64_t v31 = IDSSessionParticipantDataKey;
  uint64_t v32 = [v14 objectForKey:IDSSessionParticipantDataKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v14 objectForKey:v31];
    uint64_t v34 = +[NSData _IDSDataFromBase64String:v33];
LABEL_8:
    uint64_t v35 = (void *)v34;
    [(IDSGroupStatusNotificationParameters *)v15 setParticipantData:v34];

    goto LABEL_10;
  }
  id v33 = [v14 objectForKey:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v34 = [v14 objectForKey:v31];
    goto LABEL_8;
  }
  [(IDSGroupStatusNotificationParameters *)v15 setParticipantData:0];
LABEL_10:

  uint64_t v36 = IDSGroupSessionClientContextDataKey;
  id v37 = [v14 objectForKey:IDSGroupSessionClientContextDataKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = [v14 objectForKey:v36];
    uint64_t v39 = +[NSData _IDSDataFromBase64String:v38];
LABEL_14:
    id v40 = (void *)v39;
    [(IDSGroupStatusNotificationParameters *)v15 setClientJoinContextData:v39];

    goto LABEL_16;
  }
  id v38 = [v14 objectForKey:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v39 = [v14 objectForKey:v36];
    goto LABEL_14;
  }
  [(IDSGroupStatusNotificationParameters *)v15 setClientJoinContextData:0];
LABEL_16:

  uint64_t v41 = objc_opt_class();
  id v42 = sub_1000DFDC8(v41, v14, IDSGroupSessionURIToParticipantID);
  [(IDSGroupStatusNotificationParameters *)v15 setUrisToParticipantIDs:v42];

  uint64_t v43 = objc_opt_class();
  id v44 = sub_1000DFDC8(v43, v14, IDSGroupSessionIsInitiatorKey);
  [(IDSGroupStatusNotificationParameters *)v15 setIsInitiator:v44];

  uint64_t v45 = objc_opt_class();
  v111 = sub_1000DFDC8(v45, v14, IDSContextTimeStamp);
  uint64_t v46 = objc_opt_class();
  id v47 = (void *)IDSGroupSessionIsUPlusOneKey;
  id v48 = sub_1000DFDC8(v46, v14, IDSGroupSessionIsUPlusOneKey);
  uint64_t v49 = objc_opt_class();
  id v50 = sub_1000DFDC8(v49, v14, v47);
  unsigned int v51 = [v50 BOOLValue];

  id v52 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    IDSLoggableDescriptionForObjectOnService();
    id v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFStringRef v54 = @"NO";
    *(_DWORD *)buf = 138413570;
    CFStringRef v127 = v53;
    if (v110) {
      CFStringRef v55 = @"YES";
    }
    else {
      CFStringRef v55 = @"NO";
    }
    if (v51) {
      CFStringRef v54 = @"YES";
    }
    __int16 v128 = 2112;
    CFStringRef v129 = v123;
    __int16 v130 = 2112;
    v131 = v124;
    __int16 v132 = 2112;
    v133 = v117;
    __int16 v134 = 2112;
    CFStringRef v135 = v55;
    __int16 v136 = 2112;
    CFStringRef v137 = v54;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Process incoming fanout message: %@, fromToken: %@, fromURI: %@, specificOriginator: %@ fromStorage %@ isUPlusOne %@", buf, 0x3Eu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    v56 = IDSLoggableDescriptionForObjectOnService();
    id v57 = v110 ? @"YES" : @"NO";
    id v58 = v51 ? @"YES" : @"NO";
    v106 = v57;
    v107 = v58;
    v105 = v117;
    v100 = v123;
    v104 = v124;
    v98 = v56;
    _IDSLogTransport();

    if (_IDSShouldLog())
    {
      IDSLoggableDescriptionForObjectOnService();
      v106 = v57;
      v107 = v58;
      v105 = v117;
      v100 = v123;
      v98 = v104 = v124;
      _IDSLogV();
    }
  }
  uint64_t v59 = objc_opt_class();
  v119 = sub_1000DFDC8(v59, v14, IDSFanoutMessageGroupMembersKey);
  v114 = objc_msgSend(v119, "__imArrayByApplyingBlock:", &stru_100981A90);
  id v60 = [objc_alloc((Class)NSUUID) initWithUUIDString:v122];
  if (v120 == (char *)1)
  {
    v112 = [(IDSGroupStatusNotificationParameters *)v15 participantData];
  }
  else
  {
    v112 = 0;
  }
  v113 = [(IDSGroupStatusNotificationParameters *)v15 clientJoinContextData];
  id v61 = [v60 UUIDString];
  unsigned __int8 v62 = [v61 isEqualToString:v122];

  if (v62)
  {
    id v63 = [(IDSDGroupStatusNotificationController *)v118 sessionController];
    id v64 = [v63 sessionWithGroupUUID:v60];

    if (v64
      && ([(__CFString *)v124 URIByAddingOptionalPushToken:v123],
          id v65 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v66 = [v64 destinationsContainFromURI:v65],
          v65,
          (v66 & 1) == 0))
    {
      id v75 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v127 = v122;
        __int16 v128 = 2112;
        CFStringRef v129 = v124;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "processIncomingParticipantUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v99 = v122;
          v101 = v124;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v99 = v122;
            v101 = v124;
            _IDSLogV();
          }
        }
      }
      id v76 = +[IDSFoundationLog SessionController];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      {
        v97 = [v64 destinations];
        *(_DWORD *)buf = 134218498;
        CFStringRef v127 = (const __CFString *)v120;
        __int16 v128 = 2112;
        CFStringRef v129 = v124;
        __int16 v130 = 2112;
        v131 = v97;
        _os_log_fault_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_FAULT, "Dropping group session participant update due to membership mismatch { type: %lu, fromURI: %@, destinations: %@ }", buf, 0x20u);
      }
    }
    else
    {
      id v67 = [(IDSGroupStatusNotificationParameters *)v15 isInitiator];
      unsigned int v108 = [v67 BOOLValue];

      if (v120 == (char *)2)
      {
        id v68 = [(IDSDGroupStatusNotificationController *)v118 realTimeEncryptionController];
        [v68 removeActiveParticipant:v123 forGroup:v122];

        goto LABEL_59;
      }
      if (v120 != (char *)1)
      {
LABEL_59:
        if (!v64) {
          goto LABEL_92;
        }
        goto LABEL_60;
      }
      if (v64)
      {
        id v69 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v70 = @"NO";
          if (v108) {
            CFStringRef v70 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v127 = v70;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Receive join from initiator: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          id v71 = v108 ? @"YES" : @"NO";
          v99 = v71;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v99 = v71;
            _IDSLogV();
          }
        }
        if ((v108 & 1) == 0) {
          [v64 receiveJoinNotificationFromAParticipant];
        }
        id v72 = [(__CFString *)v123 rawToken];
        [v64 reportJoinReceivedOverPushFromToken:v72];

LABEL_60:
        if ([v64 handOffOverQREnabled])
        {
          if ((unint64_t)(v120 - 1) <= 1 && v111)
          {
            BOOL v73 = [(IDSGroupStatusNotificationParameters *)v15 participantID];
            [v111 doubleValue];
            unsigned __int8 v74 = -[NSObject shouldReportToClient:timeStamp:type:](v64, "shouldReportToClient:timeStamp:type:", v73, v120);

            if ((v74 & 1) == 0) {
              goto LABEL_110;
            }
          }
          else
          {
            id v77 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              [v111 doubleValue];
              *(_DWORD *)buf = 134218240;
              CFStringRef v127 = (const __CFString *)v120;
              __int16 v128 = 2048;
              CFStringRef v129 = v78;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Should not dedup, updateType: %lu, timeStamp: %f", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                [v111 doubleValue];
                uint64_t v102 = v79;
                v99 = (__CFString *)v120;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  objc_msgSend(v111, "doubleValue", v120, v102);
                  v99 = (__CFString *)v120;
                  _IDSLogV();
                }
              }
            }
          }
          goto LABEL_109;
        }
LABEL_92:
        __int16 v83 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v84 = [v64 handOffOverQREnabled];
          CFStringRef v85 = @"NO";
          if (v64) {
            CFStringRef v86 = @"NO";
          }
          else {
            CFStringRef v86 = @"YES";
          }
          if (v84) {
            CFStringRef v85 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v127 = v86;
          __int16 v128 = 2112;
          CFStringRef v129 = v85;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Should not dedup, session == nil: %@ Handoff Over QR Feature is Enabled: %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          v87 = v64 ? @"NO" : @"YES";
          v88 = [v64 handOffOverQREnabled]
              ? @"YES"
              : @"NO";
          v99 = v87;
          v103 = v88;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            [v64 handOffOverQREnabled];
            v99 = v87;
            _IDSLogV();
          }
        }
LABEL_109:
        id v89 = objc_alloc((Class)IDSGroupSessionParticipantUpdate);
        v90 = [(IDSGroupStatusNotificationParameters *)v15 participantID];
        id v91 = [v90 unsignedLongLongValue];
        v92 = [(__CFString *)v124 URIByAddingPushToken:v123];
        v93 = [(IDSGroupStatusNotificationParameters *)v15 urisToParticipantIDs];
        LOBYTE(v99) = v110;
        id v94 = [v89 initWithGroupUUID:v60 isInitiator:v108 participantIdentifier:v91 participantDestinationURI:v92 participantUpdateType:v120 participantUpdateSubtype:v109 fromServer:v99 serverDate:v115 participantData:v112 clientContextData:v113 members:v114 participantIDs:v93 relaySessionID:0];

        v95 = [(IDSDGroupStatusNotificationController *)v118 broadcaster];
        [v95 broadcastGroupSessionParticipantUpdate:v94 onTopic:v121 toURI:v116 fromURI:v124 context:v125];

        goto LABEL_110;
      }
      if ((v108 | v51 ^ 1))
      {
        v80 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v81 = @"NO";
          if (v51) {
            CFStringRef v81 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v127 = v122;
          __int16 v128 = 2112;
          CFStringRef v129 = v81;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Passing the join event to client/s. There is no session for groupID %@ and isUPlusOne:%@ but the join push is from Initiator", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          id v82 = v51 ? @"YES" : @"NO";
          v99 = v122;
          v101 = v82;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v99 = v122;
            v101 = v82;
            _IDSLogV();
          }
        }
        goto LABEL_92;
      }
      v96 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v127 = v122;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Couldn't pass the join event to clients. There is no U + 1 session for groupID %@ and the join push is not from Initiator.", buf, 0xCu);
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
    }
  }
  else
  {
    id v64 = +[IDSFoundationLog SessionController];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
      sub_10070F63C(v60);
    }
  }
LABEL_110:
}

- (void)processIncomingParticipantDataUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8
{
  id v14 = a3;
  id v80 = a4;
  id v82 = a5;
  id v73 = a6;
  id v78 = a7;
  id v81 = a8;
  __int16 v83 = objc_alloc_init(IDSGroupStatusNotificationParameters);
  id v75 = self;
  uint64_t v15 = [(IDSDAccount *)self->_account uniqueID];
  id v76 = [(IDSDGroupStatusNotificationController *)self _specificOriginatorfromURI:v82 senderToken:v80 accountUniqueID:v15];

  uint64_t v16 = objc_opt_class();
  uint64_t v79 = sub_1000DFDC8(v16, v14, IDSFanoutMessageGroupIDKey);
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = sub_1000DFDC8(v17, v14, IDSDSessionMessageJoinNotificationKey);
  id v68 = [v18 unsignedIntegerValue];

  uint64_t v19 = objc_opt_class();
  id v20 = (void *)IDSMessageContextFromServerStorageKey;
  id v21 = sub_1000DFDC8(v19, v81, IDSMessageContextFromServerStorageKey);
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = sub_1000DFDC8(v22, v81, v20);
  unsigned int v69 = [v23 BOOLValue];

  unint64_t v24 = [v81 objectForKey:IDSMessageContextServerTimestampKey];
  [v24 doubleValue];
  unsigned __int8 v74 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

  uint64_t v25 = objc_opt_class();
  uint64_t v26 = sub_1000DFDC8(v25, v14, IDSGroupSessionIsInitiatorKey);
  [(IDSGroupStatusNotificationParameters *)v83 setIsInitiator:v26];

  uint64_t v27 = objc_opt_class();
  id v28 = sub_1000DFDC8(v27, v14, IDSSessionParticipantIDKey);
  [(IDSGroupStatusNotificationParameters *)v83 setParticipantID:v28];

  uint64_t v29 = IDSSessionParticipantDataKey;
  v30 = [v14 objectForKey:IDSSessionParticipantDataKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = [v14 objectForKey:v29];
    uint64_t v32 = +[NSData _IDSDataFromBase64String:v31];
LABEL_5:
    id v33 = (void *)v32;
    [(IDSGroupStatusNotificationParameters *)v83 setParticipantData:v32];

    goto LABEL_7;
  }
  uint64_t v31 = [v14 objectForKey:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v32 = [v14 objectForKey:v29];
    goto LABEL_5;
  }
  [(IDSGroupStatusNotificationParameters *)v83 setParticipantData:0];
LABEL_7:

  uint64_t v34 = IDSGroupSessionClientContextDataKey;
  uint64_t v35 = [v14 objectForKey:IDSGroupSessionClientContextDataKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v36 = [v14 objectForKey:v34];
    uint64_t v37 = +[NSData _IDSDataFromBase64String:v36];
LABEL_11:
    id v38 = (void *)v37;
    [(IDSGroupStatusNotificationParameters *)v83 setClientJoinContextData:v37];

    goto LABEL_13;
  }
  uint64_t v36 = [v14 objectForKey:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v37 = [v14 objectForKey:v34];
    goto LABEL_11;
  }
  [(IDSGroupStatusNotificationParameters *)v83 setClientJoinContextData:0];
LABEL_13:

  uint64_t v39 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = IDSLoggableDescriptionForObjectOnService();
    CFStringRef v41 = @"NO";
    *(_DWORD *)buf = 138413314;
    id v85 = v40;
    if (v69) {
      CFStringRef v41 = @"YES";
    }
    __int16 v86 = 2112;
    id v87 = v80;
    __int16 v88 = 2112;
    id v89 = v82;
    __int16 v90 = 2112;
    id v91 = v76;
    __int16 v92 = 2112;
    CFStringRef v93 = v41;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Process incoming fanout message: %@, fromToken: %@, fromID: %@, specificOriginator: %@ fromStorage %@", buf, 0x34u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v42 = IDSLoggableDescriptionForObjectOnService();
    uint64_t v43 = v69 ? @"YES" : @"NO";
    unsigned __int8 v66 = v76;
    id v67 = v43;
    id v64 = v80;
    id v65 = v82;
    id v63 = v42;
    _IDSLogTransport();

    if (_IDSShouldLog())
    {
      IDSLoggableDescriptionForObjectOnService();
      unsigned __int8 v66 = v76;
      id v67 = v43;
      id v64 = v80;
      v63 = id v65 = v82;
      _IDSLogV();
    }
  }
  uint64_t v44 = objc_opt_class();
  id v77 = sub_1000DFDC8(v44, v14, IDSFanoutMessageGroupMembersKey);
  id v72 = objc_msgSend(v77, "__imArrayByApplyingBlock:", &stru_100981AB0);
  id v45 = [objc_alloc((Class)NSUUID) initWithUUIDString:v79];
  id v71 = [(IDSGroupStatusNotificationParameters *)v83 participantData];
  CFStringRef v70 = [(IDSGroupStatusNotificationParameters *)v83 clientJoinContextData];
  uint64_t v46 = [v45 UUIDString];
  unsigned __int8 v47 = [v46 isEqualToString:v79];

  if (v47)
  {
    id v48 = [(IDSDGroupStatusNotificationController *)self sessionController];
    uint64_t v49 = [v48 sessionWithGroupUUID:v45];

    if (v49
      && ([v82 URIByAddingOptionalPushToken:v80],
          id v50 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v51 = [v49 destinationsContainFromURI:v50],
          v50,
          (v51 & 1) == 0))
    {
      id v61 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v85 = v79;
        __int16 v86 = 2112;
        id v87 = v82;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "processIncomingParticipantDataUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v63 = v79;
          id v64 = v82;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v63 = v79;
            id v64 = v82;
            _IDSLogV();
          }
        }
      }
      uint64_t v59 = +[IDSFoundationLog SessionController];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      {
        unsigned __int8 v62 = [v49 destinations];
        *(_DWORD *)buf = 134218498;
        id v85 = v68;
        __int16 v86 = 2112;
        id v87 = v82;
        __int16 v88 = 2112;
        id v89 = v62;
        _os_log_fault_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_FAULT, "Dropping group session participant data update due to membership mismatch { type: %lu, fromURI: %@, destinations: %@ }", buf, 0x20u);
      }
    }
    else
    {
      id v52 = objc_alloc((Class)IDSGroupSessionParticipantUpdate);
      id v53 = [(IDSGroupStatusNotificationParameters *)v83 isInitiator];
      id v54 = [v53 BOOLValue];
      CFStringRef v55 = [(IDSGroupStatusNotificationParameters *)v83 participantID];
      id v56 = [v55 unsignedLongLongValue];
      id v57 = [v82 URIByAddingPushToken:v80];
      id v58 = [(IDSGroupStatusNotificationParameters *)v83 urisToParticipantIDs];
      LOBYTE(v63) = v69;
      uint64_t v59 = [v52 initWithGroupUUID:v45 isInitiator:v54 participantIdentifier:v56 participantDestinationURI:v57 participantUpdateType:v68 participantUpdateSubtype:0 fromServer:v63 serverDate:v74 participantData:v71 clientContextData:v70 members:v72 participantIDs:v58 relaySessionID:0];

      id v60 = [(IDSDGroupStatusNotificationController *)v75 broadcaster];
      [v60 broadcastGroupSessionParticipantDataUpdate:v59 onTopic:v78 toURI:v73 fromURI:v82];
    }
  }
  else
  {
    uint64_t v49 = +[IDSFoundationLog SessionController];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
      sub_10070F75C(v45);
    }
  }
}

- (void)pushTokenLookup:(id)a3 forGroup:(id)a4 sessionID:(id)a5 fromURI:(id)a6 account:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v32 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = v14;
  id v20 = [v17 _registrationCert];
  id v21 = [v17 service];
  uint64_t v22 = [v21 identifier];

  if (!self->_groupMemberPushTokens)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    groupMemberPushTokens = self->_groupMemberPushTokens;
    self->_groupMemberPushTokens = Mutable;
  }
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000E0C08;
  v40[3] = &unk_100981AD8;
  objc_copyWeak(&v46, location);
  id v25 = v16;
  id v41 = v25;
  id v26 = v15;
  id v42 = v26;
  id v27 = v19;
  id v43 = v27;
  uint64_t v44 = self;
  id v28 = v18;
  id v45 = v28;
  uint64_t v29 = objc_retainBlock(v40);
  if ([v27 count])
  {
    v30 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E168C;
    block[3] = &unk_100981B00;
    id v35 = v27;
    id v36 = v20;
    id v37 = v32;
    id v38 = v22;
    uint64_t v39 = v29;
    dispatch_async(v30, block);
  }
  else
  {
    uint64_t v31 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Cannot find the push tokens, missing recipientIDs.", buf, 2u);
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
  }

  objc_destroyWeak(&v46);
  objc_destroyWeak(location);
}

- (id)_specificOriginatorfromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v7 prefixedURI];
  unsigned int v11 = [v10 hasPrefix:@"device:"];

  if (v11)
  {
    id v12 = [v7 unprefixedURI];
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = +[IDSPairingManager sharedInstance];
  id v14 = [v13 pairedDeviceUniqueID];
  unsigned int v15 = [v12 isEqualToIgnoringCase:v14];

  id v16 = [v7 prefixedURI];
  unsigned int v17 = [v16 isEqualToIgnoringCase:IDSDefaultPairedDevice];

  if (v8)
  {
    if (!v7)
    {
      id v19 = 0;
      goto LABEL_11;
    }
    id v18 = [v7 URIByAddingPushToken:v8];
LABEL_9:
    id v19 = v18;
LABEL_11:
    id v19 = v19;
    id v20 = v19;
    goto LABEL_12;
  }
  if ((v17 | v15) == 1)
  {
    id v18 = v7;
    goto LABEL_9;
  }
  uint64_t v22 = +[IDSDAccountController sharedInstance];
  uint64_t v23 = [v22 accountWithUniqueID:v9];

  if (!v23)
  {
    id v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v38 = "GroupStatusNotificationController";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s - No account found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    goto LABEL_34;
  }
  unint64_t v24 = [v23 dependentRegistrationMatchingUUID:v12];
  id v25 = v24;
  if (!v24)
  {
    id v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v38 = "GroupStatusNotificationController";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s - No device found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }

LABEL_34:
    id v19 = 0;
    goto LABEL_47;
  }
  id v26 = [v24 _dataForKey:IDSDevicePropertyPushToken];
  if ([v26 length])
  {
    id v36 = [v25 _arrayForKey:IDSDevicePropertyIdentities];
    if ([v36 count])
    {
      id v27 = [v36 firstObject];
      id v28 = [v27 _stringForKey:@"uri"];

      uint64_t v29 = (void *)_IDSCopyIDForTokenWithURI();
      id v19 = +[IDSURI URIWithPrefixedURI:v29];

      v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = (const char *)v7;
        __int16 v39 = 2112;
        id v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "original fromID %@ -> resulting specificOriginator %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }

      int v31 = 0;
    }
    else
    {
      id v35 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v38 = "GroupStatusNotificationController";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s - No device identity found to build specificOriginator, bailing...", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      id v19 = 0;
      int v31 = 1;
    }
  }
  else
  {
    uint64_t v34 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v38 = "GroupStatusNotificationController";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s - No device push token found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v19 = 0;
    int v31 = 1;
  }

  if (!v31) {
    goto LABEL_11;
  }
LABEL_47:
  id v20 = 0;
LABEL_12:

  return v20;
}

- (id)getURIFromPushToken:(id)a3 forGroup:(id)a4
{
  id v25 = a3;
  id v23 = a4;
  unint64_t v24 = -[NSMutableDictionary objectForKeyedSubscript:](self->_groupMemberPushTokens, "objectForKeyedSubscript:");
  if (!v24)
  {
    id v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Couldn't find the tokens for group %@", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_26;
    }
LABEL_25:
    _IDSLogV();
    goto LABEL_26;
  }
  double v6 = [v25 rawToken];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Coudln't find the URI for the given token for group %@. the pushToken is not NSData.", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v24;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    uint64_t v11 = kIDSQRAllocateKey_RecipientPushToken;
    uint64_t v12 = kIDSQRAllocateKey_RecipientURI;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unsigned int v15 = [v14 objectForKeyedSubscript:v11];
        id v16 = [v14 objectForKeyedSubscript:v12];
        unsigned int v17 = [v25 rawToken];
        unsigned __int8 v18 = [v17 isEqualToData:v15];

        if (v18)
        {

          goto LABEL_27;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v25;
    __int16 v32 = 2112;
    id v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Coudln't find the URI for the given token %@ for group %@.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_26:
  id v16 = 0;
LABEL_27:

  return v16;
}

- (NSMutableSet)groups
{
  return self->_groups;
}

- (NSMutableDictionary)events
{
  return self->_events;
}

- (NSMutableDictionary)groupMemberPushTokens
{
  return self->_groupMemberPushTokens;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSDSessionController)sessionController
{
  return self->_sessionController;
}

- (IDSGroupEncryptionController)realTimeEncryptionController
{
  return self->_realTimeEncryptionController;
}

- (IDSDGroupStatusNotificationControllerBroadcaster)broadcaster
{
  return self->_broadcaster;
}

- (NSMutableDictionary)groupIDToCapabilityToParticipantPushTokens
{
  return self->_groupIDToCapabilityToParticipantPushTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIDToCapabilityToParticipantPushTokens, 0);
  objc_storeStrong((id *)&self->_broadcaster, 0);
  objc_storeStrong((id *)&self->_realTimeEncryptionController, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_groupMemberPushTokens, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_groups, 0);

  objc_storeStrong((id *)&self->_notifiers, 0);
}

@end