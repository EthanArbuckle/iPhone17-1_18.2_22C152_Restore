@interface OldIDSDSessionKeyValueDelivery
- (NSMutableDictionary)groupIDToDesiredMaterialSet;
- (NSMutableDictionary)localKeyToEntry;
- (NSMutableSet)localMaterials;
- (OldIDSDSessionKeyValueDelivery)initWithDelegate:(id)a3 forGroupID:(id)a4 sessionID:(id)a5 metricsCollector:(id)a6;
- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3;
- (int)_getTypeFromDataKey:(id)a3;
- (unsigned)_getKeyFromType:(int)a3;
- (void)_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5;
- (void)_updateSendData;
- (void)addDeliveryHandler:(id)a3 uuid:(id)a4;
- (void)dealloc;
- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5;
- (void)removeDeliveryHandler:(id)a3;
- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 withCompletion:(id)a7;
@end

@implementation OldIDSDSessionKeyValueDelivery

- (OldIDSDSessionKeyValueDelivery)initWithDelegate:(id)a3 forGroupID:(id)a4 sessionID:(id)a5 metricsCollector:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)OldIDSDSessionKeyValueDelivery;
  v14 = [(OldIDSDSessionKeyValueDelivery *)&v26 init];
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->_groupID, a4);
    objc_storeStrong((id *)&v15->_sessionID, a5);
    uint64_t v16 = +[NSMutableDictionary dictionary];
    deliveryHandlersByUUID = v15->_deliveryHandlersByUUID;
    v15->_deliveryHandlersByUUID = (NSMutableDictionary *)v16;

    uint64_t v18 = +[NSMutableDictionary dictionary];
    localKeyToEntry = v15->_localKeyToEntry;
    v15->_localKeyToEntry = (NSMutableDictionary *)v18;

    uint64_t v20 = +[NSMutableDictionary dictionary];
    remoteKeyToParticipantIDToData = v15->_remoteKeyToParticipantIDToData;
    v15->_remoteKeyToParticipantIDToData = (NSMutableDictionary *)v20;

    uint64_t v22 = +[NSMutableDictionary dictionary];
    groupIDToDesiredMaterialSet = v15->_groupIDToDesiredMaterialSet;
    v15->_groupIDToDesiredMaterialSet = (NSMutableDictionary *)v22;

    objc_storeStrong((id *)&v15->_metricsCollector, a6);
    v24 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "IDSDSessionKeyValueDelivery init: groupID: %@, sessionID: %@", buf, 0x16u);
    }
  }
  return v15;
}

- (void)dealloc
{
  deliveryHandlersByUUID = self->_deliveryHandlersByUUID;
  self->_deliveryHandlersByUUID = 0;

  localKeyToEntry = self->_localKeyToEntry;
  self->_localKeyToEntry = 0;

  remoteKeyToParticipantIDToData = self->_remoteKeyToParticipantIDToData;
  self->_remoteKeyToParticipantIDToData = 0;

  groupIDToDesiredMaterialSet = self->_groupIDToDesiredMaterialSet;
  self->_groupIDToDesiredMaterialSet = 0;

  v7.receiver = self;
  v7.super_class = (Class)OldIDSDSessionKeyValueDelivery;
  [(OldIDSDSessionKeyValueDelivery *)&v7 dealloc];
}

- (void)addDeliveryHandler:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "add delivery handler with uuid %@: %@", (uint8_t *)&v14, 0x16u);
  }

  id v10 = [(NSMutableDictionary *)self->_deliveryHandlersByUUID objectForKeyedSubscript:v7];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    [(NSMutableDictionary *)self->_deliveryHandlersByUUID setObject:v6 forKeyedSubscript:v7];
    id v13 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sending all cached data to new delivery handler", (uint8_t *)&v14, 2u);
    }

    [v6 handleGroupSessionKeyValues:self->_remoteKeyToParticipantIDToData];
    id v12 = [(IDSGFTMetricsCollector *)self->_metricsCollector keyValueDelivery];
    [v12 event:@"addDeliveryHandler"];
  }
  else
  {
    id v12 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "... already added handler with uuid %@: %@", (uint8_t *)&v14, 0x16u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([v4 isEqualToString:self->_groupID])
  {
    [(OldIDSDSessionKeyValueDelivery *)self _updateSendData];
    id v6 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      localMaterials = self->_localMaterials;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = localMaterials;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "getAllKeyValueDeliveryLocalMaterialSetForGroupID: %@, _localMaterials: %@", (uint8_t *)&v12, 0x16u);
    }

    id v8 = [(NSMutableSet *)self->_localMaterials copy];
  }
  else
  {
    v9 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      groupID = self->_groupID;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = (NSMutableSet *)groupID;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "getAllKeyValueDeliveryLocalMaterialSetForGroupID: groupID doesn't match: %@, %@", (uint8_t *)&v12, 0x16u);
    }

    id v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)removeDeliveryHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_deliveryHandlersByUUID removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = [(OldIDSDSessionKeyValueDelivery *)self _getKeyFromType:v6];
  if (v9)
  {
    uint64_t v10 = v9;
    BOOL v11 = [v8 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionWrapModeKey];
    int v12 = [v11 intValue];

    if (v12 > 0)
    {
      id v13 = [v8 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionEncryptedData];
      if (!v13)
      {
        id v24 = 0;
        __int16 v16 = 0;
LABEL_33:

        goto LABEL_34;
      }
      __int16 v14 = +[IDSGroupEncryptionController sharedInstance];
      id v15 = [v14 identityForDevice];

      v35 = v15;
      if (IMGetDomainBoolForKey())
      {
        __int16 v16 = v13;
        id v17 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v39 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "receiveDictionaryData: disableEncryptionForData, use plain data: %@", buf, 0xCu);
        }

        uint64_t v18 = +[IMLockdownManager sharedInstance];
        unsigned __int8 v19 = [v18 isInternalInstall];

        if ((v19 & 1) == 0)
        {
          uint64_t v20 = [(IDSGFTMetricsCollector *)self->_metricsCollector error:@"kvd"];
          [v20 event:@"disableEncryption"];
        }
        id v21 = 0;
        goto LABEL_31;
      }
      if (v15)
      {
        id v37 = 0;
        __int16 v16 = +[GFTKeyWrapping decrypt:usingKey:error:](GFTKeyWrapping, "decrypt:usingKey:error:", v13, [v15 fullIdentity], &v37);
        id v27 = v37;
        id v24 = v27;
        if (v16)
        {
          id v21 = 0;
          if (!v27) {
            goto LABEL_31;
          }
        }
      }
      else
      {
        __int16 v16 = 0;
        id v24 = 0;
      }
      id v28 = +[IDSGroupEncryptionController sharedInstance];
      __int16 v29 = [v28 previousIdentityForDevice];

      id v30 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v39 = v24;
        *(_WORD *)&v39[8] = 2112;
        v40 = v35;
        __int16 v41 = 2112;
        v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "receiveDictionaryData: failed SecMWCopyUnwrappedSessionSeed error: %@, local identity: %@, try again using previous identity: %@", buf, 0x20u);
      }

      if (v29)
      {

        id v36 = 0;
        uint64_t v31 = +[GFTKeyWrapping decrypt:usingKey:error:](GFTKeyWrapping, "decrypt:usingKey:error:", v13, [v29 fullIdentity], &v36);
        id v24 = v36;
        v32 = v16;
        __int16 v16 = v31;
      }
      else
      {
        v32 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "receiveDictionaryData: No previous identity", buf, 2u);
        }
      }

      if (!v16)
      {
        v33 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10071DF44((uint64_t)v24, v33);
        }

        v34 = [(IDSGFTMetricsCollector *)self->_metricsCollector error:@"kvd"];
        [v34 event:@"decryptionError"];

        __int16 v16 = 0;
        goto LABEL_32;
      }
      id v21 = v24;
LABEL_31:
      [(OldIDSDSessionKeyValueDelivery *)self _receiveData:v16 forKey:v10 fromParticipant:a5];
      id v24 = v21;
LABEL_32:

      goto LABEL_33;
    }
    objc_super v26 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10071DECC(v12, v26);
    }

    v23 = [(IDSGFTMetricsCollector *)self->_metricsCollector error:@"kvd"];
    id v24 = v23;
    CFStringRef v25 = @"unsupportedWrapMode";
  }
  else
  {
    uint64_t v22 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v39 = 0;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "receiveDictionaryData: unsupported key: %u, type: %d", buf, 0xEu);
    }

    v23 = [(IDSGFTMetricsCollector *)self->_metricsCollector error:@"kvd"];
    id v24 = v23;
    CFStringRef v25 = @"unsupportedKey";
  }
  [v23 event:v25];
LABEL_34:
}

- (void)_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v29 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v40 = v6;
    *(_WORD *)&v40[4] = 2048;
    *(void *)&v40[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_receiveData: key: %d particitant: %llu", buf, 0x12u);
  }

  uint64_t v9 = [(IDSGFTMetricsCollector *)self->_metricsCollector keyValueDelivery];
  [v9 event:@"receiveFirstData"];

  uint64_t v10 = +[NSNumber numberWithUnsignedInt:v6];
  BOOL v11 = +[NSNumber numberWithUnsignedLongLong:a5];
  int v12 = [(NSMutableDictionary *)self->_remoteKeyToParticipantIDToData objectForKeyedSubscript:v10];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteKeyToParticipantIDToData, "setObject:forKeyedSubscript:", Mutable, v10, lock);
  }
  id v15 = objc_msgSend(v29, "copy", lock);
  __int16 v16 = [(NSMutableDictionary *)self->_remoteKeyToParticipantIDToData objectForKeyedSubscript:v10];
  [v16 setObject:v15 forKeyedSubscript:v11];

  id v17 = [(NSMutableDictionary *)self->_deliveryHandlersByUUID allValues];
  uint64_t v18 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v17 count];
    *(_DWORD *)buf = 134217984;
    *(void *)v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_receiveData: notifying %lu handlers", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v17;
  id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v23);
        v34 = v11;
        id v35 = v29;
        id v36 = v10;
        CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v37 = v25;
        objc_super v26 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        [v24 handleGroupSessionKeyValues:v26];

        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  os_unfair_lock_unlock(locka);
}

- (unsigned)_getKeyFromType:(int)a3
{
  return a3 == 5;
}

- (int)_getTypeFromDataKey:(id)a3
{
  if ([a3 isEqualToNumber:&off_1009D1CE0]) {
    return 5;
  }
  else {
    return 0;
  }
}

- (void)_updateSendData
{
  v2 = self;
  if (!self->_groupID)
  {
    v3 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10071DFBC(v3);
    }
  }
  id v4 = +[IDSDGroupStatusNotificationController sharedInstance];
  v5 = [v4 groupIDToCapabilityToParticipantPushTokens];
  uint64_t v6 = [v5 objectForKeyedSubscript:v2->_groupID];
  id v7 = [v6 copy];

  int v78 = IMGetDomainBoolForKey();
  if (!v2->_localMaterials)
  {
    id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    localMaterials = v2->_localMaterials;
    v2->_localMaterials = v8;
  }
  uint64_t v10 = +[IDSDSessionController sharedInstance];
  v88 = [v10 sessionWithUniqueID:v2->_sessionID];

  BOOL v11 = +[IDSDSessionController sharedInstance];
  v80 = [v11 sessionWithUniqueID:v2->_groupID];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obj = v2->_localKeyToEntry;
  id v12 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v94 objects:v101 count:16];
  BOOL v13 = &IDSRegistrationPropertySupportsAVLess_ptr;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v95;
    if (v78) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    CFStringRef v75 = v16;
    v74 = v2;
    uint64_t v69 = *(void *)v95;
    id v70 = v7;
    do
    {
      id v17 = 0;
      id v73 = v14;
      do
      {
        if (*(void *)v95 != v15) {
          objc_enumerationMutation(obj);
        }
        v77 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v17);
        uint64_t v18 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_localKeyToEntry, "objectForKeyedSubscript:", v69, v70);
        id v19 = [v18 capability];
        v79 = [v7 objectForKeyedSubscript:v19];

        id v20 = [v13[288] GroupSessionKeyValueDelivery];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = v17;
          unsigned int v22 = [v77 intValue];
          [v18 data];
          id v24 = v23 = v15;
          unsigned int v25 = [v18 encryption];
          objc_super v26 = [v18 capability];
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v100 = v22;
          id v17 = v21;
          *(_WORD *)&v100[4] = 2112;
          *(void *)&v100[6] = v24;
          *(_WORD *)&v100[14] = 2112;
          *(void *)&v100[16] = v75;
          *(_WORD *)&v100[24] = 1024;
          *(_DWORD *)&v100[26] = v25;
          *(_WORD *)&v100[30] = 2112;
          *(void *)&v100[32] = v26;
          *(_WORD *)&v100[40] = 2112;
          *(void *)&v100[42] = v79;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_updateSendData: key: %d data: %@ encryptedDataForAllParticipants: %@, encryption: %d capability: %@, remotesPushTokens: %@", buf, 0x36u);

          v2 = v74;
          uint64_t v15 = v23;
          id v14 = v73;
        }

        if ([v18 encryption] == 1)
        {
          id v27 = [v18 data];

          if (v27)
          {
            v76 = v18;
            v72 = v17;
            id v28 = +[IDSGroupEncryptionController sharedInstance];
            id v29 = [v28 getParticipantsInfoForGroup:v2->_groupID];

            long long v92 = 0u;
            long long v93 = 0u;
            long long v90 = 0u;
            long long v91 = 0u;
            id v81 = v29;
            id v84 = [v81 countByEnumeratingWithState:&v90 objects:v98 count:16];
            if (!v84) {
              goto LABEL_54;
            }
            uint64_t v83 = *(void *)v91;
            long long v30 = &IDSRegistrationPropertySupportsAVLess_ptr;
            while (1)
            {
              for (i = 0; i != v84; i = (char *)i + 1)
              {
                if (*(void *)v91 != v83) {
                  objc_enumerationMutation(v81);
                }
                long long v32 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                long long v33 = +[IDSGroupEncryptionController sharedInstance];
                v34 = v30[377];
                id v35 = [v32 participantPushToken];
                id v36 = [v34 pushTokenWithData:v35];
                id v37 = [v33 realTimeEncryptionPublicKeyForDevice:v36];

                if (v37)
                {
                  v38 = [v37 fromID];
                  v87 = v38;
                }
                else
                {
                  v38 = [v32 participantURI];
                  v82 = v38;
                }
                v39 = sub_1003EA6DC(v38);
                v40 = +[IDSURI URIWithPrefixedURI:v39];

                if (v37)
                {

                  __int16 v41 = v30[377];
                  v86 = [v37 pushToken];
                  uint64_t v42 = [v86 rawToken];
                  v85 = (void *)v42;
                  v43 = v89;
                }
                else
                {

                  __int16 v41 = v30[377];
                  uint64_t v42 = [v32 participantPushToken];
                  v43 = (void *)v42;
                }
                v44 = [v41 pushTokenWithData:v42];
                v45 = [v40 URIByAddingPushToken:v44];

                v46 = v43;
                if (v37)
                {

                  v46 = v86;
                }
                v89 = v43;

                if (![v88 destinationsContainFromURI:v45]
                  || ([v80 destinationsContainFromURI:v45] & 1) == 0)
                {
                  v58 = [v13[288] GroupSessionKeyValueDelivery];
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    groupID = v2->_groupID;
                    sessionID = v2->_sessionID;
                    v66 = [v88 destinations];
                    *(_DWORD *)buf = 138413058;
                    *(void *)v100 = v45;
                    *(_WORD *)&v100[8] = 2112;
                    *(void *)&v100[10] = groupID;
                    long long v30 = &IDSRegistrationPropertySupportsAVLess_ptr;
                    *(_WORD *)&v100[18] = 2112;
                    *(void *)&v100[20] = sessionID;
                    BOOL v13 = &IDSRegistrationPropertySupportsAVLess_ptr;
                    *(_WORD *)&v100[28] = 2112;
                    *(void *)&v100[30] = v66;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "_updateSendData: aborting send to %@ for group %@ and session %@ since this destination is not in group membership: %@", buf, 0x2Au);
                  }
                  goto LABEL_51;
                }
                v47 = [v32 participantPushToken];
                unsigned int v48 = [v79 containsObject:v47];

                int v49 = v78 | v48;
                v50 = [v13[288] GroupSessionKeyValueDelivery];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v51 = @"NO";
                  if (v49) {
                    CFStringRef v51 = @"YES";
                  }
                  *(void *)v100 = v75;
                  *(_WORD *)&v100[8] = 2112;
                  *(void *)&v100[10] = v51;
                  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "encryptedDataForAllParticipants: %@, shouldSendToParticipant: %@", buf, 0x16u);
                }

                char v52 = v49 ^ 1;
                if (!v37) {
                  char v52 = 1;
                }
                long long v30 = &IDSRegistrationPropertySupportsAVLess_ptr;
                if ((v52 & 1) == 0)
                {
                  id v53 = (id)[(OldIDSDSessionKeyValueDelivery *)v2 _getTypeFromDataKey:v77];
                  v54 = [v13[288] GroupSessionKeyValueDelivery];
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                  {
                    v55 = [v76 data];
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v100 = v53;
                    *(_WORD *)&v100[4] = 2112;
                    *(void *)&v100[6] = v77;
                    *(_WORD *)&v100[14] = 2112;
                    *(void *)&v100[16] = v37;
                    *(_WORD *)&v100[24] = 2112;
                    *(void *)&v100[26] = v32;
                    *(_WORD *)&v100[34] = 2112;
                    *(void *)&v100[36] = v55;
                    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "_updateSendData: type: %d, key: %@, publicIdentity: %@, participant: %@, data: %@", buf, 0x30u);
                  }
                  if (v53)
                  {
                    v56 = v2->_localMaterials;
                    v57 = [IDSServerDesiredEncryptedDataSet alloc];
                    v58 = [v76 data];
                    id v59 = [v37 publicIdentity];
                    id v60 = [v32 participantIdentifier];
                    v61 = v57;
                    BOOL v13 = &IDSRegistrationPropertySupportsAVLess_ptr;
                    id v62 = v59;
                    v2 = v74;
                    v63 = [(IDSServerDesiredEncryptedDataSet *)v61 initWithEncryptedData:v58 type:v53 forPublicIdentity:v62 forParticipantID:v60];
                    [(NSMutableSet *)v56 addObject:v63];
                    goto LABEL_49;
                  }
                  v58 = [v13[288] GroupSessionKeyValueDelivery];
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    v63 = [v76 capability];
                    *(_DWORD *)buf = 138412290;
                    *(void *)v100 = v63;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "_updateSendData: unknown type for capability: %@", buf, 0xCu);
LABEL_49:
                  }
                  long long v30 = &IDSRegistrationPropertySupportsAVLess_ptr;
LABEL_51:
                }
              }
              id v84 = [v81 countByEnumeratingWithState:&v90 objects:v98 count:16];
              if (!v84)
              {
LABEL_54:

                uint64_t v15 = v69;
                id v7 = v70;
                id v17 = v72;
                id v14 = v73;
                uint64_t v18 = v76;
                break;
              }
            }
          }
        }

        id v17 = (char *)v17 + 1;
      }
      while (v17 != v14);
      id v14 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v94 objects:v101 count:16];
    }
    while (v14);
  }

  v67 = [v13[288] GroupSessionKeyValueDelivery];
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = v2->_localMaterials;
    *(_DWORD *)buf = 138412290;
    *(void *)v100 = v68;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "_updateSendData: _localMaterials: %@", buf, 0xCu);
  }
}

- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 withCompletion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  BOOL v13 = (void (**)(id, void))a7;
  id v14 = a6;
  uint64_t v15 = +[IDSFoundationLog GroupSessionKeyValueDelivery];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 67109634;
    v23[1] = v10;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sendData: send %d with encryption %d: %@", (uint8_t *)v23, 0x18u);
  }

  os_unfair_lock_lock(&self->_lock);
  CFStringRef v16 = [[OldIDSDSessionKeyValueDeliveryLocalEntry alloc] initWithData:v12 encryption:v9 capability:v14];

  localKeyToEntry = self->_localKeyToEntry;
  uint64_t v18 = +[NSNumber numberWithUnsignedInt:v10];
  [(NSMutableDictionary *)localKeyToEntry setObject:v16 forKeyedSubscript:v18];

  os_unfair_lock_unlock(&self->_lock);
  id v19 = [(IDSGFTMetricsCollector *)self->_metricsCollector keyValueDelivery];
  [v19 event:@"firstSendData"];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v16) = objc_opt_respondsToSelector();

  if (v16)
  {
    id v22 = objc_loadWeakRetained((id *)p_delegate);
    [v22 updateServerDesiredKeyValueDeliveryMaterialsNeeded];
  }
  v13[2](v13, 0);
}

- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained requestKeyValueDeliveryDataForKey:v5 participantID:a4];
}

- (NSMutableDictionary)localKeyToEntry
{
  return self->_localKeyToEntry;
}

- (NSMutableDictionary)groupIDToDesiredMaterialSet
{
  return self->_groupIDToDesiredMaterialSet;
}

- (NSMutableSet)localMaterials
{
  return self->_localMaterials;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMaterials, 0);
  objc_storeStrong((id *)&self->_groupIDToDesiredMaterialSet, 0);
  objc_storeStrong((id *)&self->_localKeyToEntry, 0);
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_remoteKeyToParticipantIDToWaitingBlock, 0);
  objc_storeStrong((id *)&self->_remoteKeyToParticipantIDToData, 0);
  objc_storeStrong((id *)&self->_deliveryHandlersByUUID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end