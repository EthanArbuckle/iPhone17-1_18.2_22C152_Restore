@interface MSPSharedTripRelay
- (BOOL)hasValidIDSAccount;
- (MSPSharedTripAvailabiltyDelegate)availabilityDelegate;
- (MSPSharedTripRelay)init;
- (MSPSharedTripRelayDelegate)delegate;
- (MSPSharedTripSharingIdentity)sharingIdentity;
- (MSPSharedTripStorageController)storageController;
- (NSArray)accountAliases;
- (NSString)sharingHandle;
- (NSString)sharingName;
- (id)groupSessionForIdentifier:(id)a3;
- (id)removeSharingWith:(id)a3;
- (id)startSharingGroupSessionWithTripIdentifer:(id)a3;
- (void)_fetchDisplayName;
- (void)_handleChunk:(id)a3 fromID:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6;
- (void)_handleCommand:(id)a3 fromID:(id)a4;
- (void)_handleIncomingMessage:(id)a3 info:(id)a4 fromID:(id)a5 receivingHandle:(id)a6 receivingAccountIdentifier:(id)a7;
- (void)_removeFinishedSession:(id)a3;
- (void)_startService;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setAvailabilityDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStorageController:(id)a3;
- (void)stopSharing;
@end

@implementation MSPSharedTripRelay

- (MSPSharedTripSharingIdentity)sharingIdentity
{
  v3 = [MSPSharedTripSharingIdentity alloc];
  BOOL v4 = [(MSPSharedTripRelay *)self hasValidIDSAccount];
  v5 = [(MSPSharedTripRelay *)self sharingName];
  v6 = [(MSPSharedTripRelay *)self sharingHandle];
  v7 = [(MSPSharedTripRelay *)self accountAliases];
  v8 = [(MSPSharedTripSharingIdentity *)v3 initWithValidAccount:v4 name:v5 handle:v6 aliases:v7];

  return v8;
}

- (NSString)sharingName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    [(MSPSharedTripRelay *)self _fetchDisplayName];
    displayName = self->_displayName;
  }

  return displayName;
}

- (NSString)sharingHandle
{
  return (NSString *)[(IDSService *)self->_sharingService _msp_currentAccountIdentifier];
}

- (BOOL)hasValidIDSAccount
{
  return [(IDSService *)self->_sharingService _msp_hasValidIDSAccount];
}

- (NSArray)accountAliases
{
  v2 = [(IDSService *)self->_sharingService _msp_currentAccount];
  v3 = [v2 aliasStrings];

  return (NSArray *)v3;
}

- (MSPSharedTripStorageController)storageController
{
  return self->_storageController;
}

- (MSPSharedTripRelay)init
{
  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripRelay;
  v2 = [(MSPSharedTripRelay *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    clientID = v2->_clientID;
    v2->_clientID = (NSString *)v4;

    v6 = objc_alloc_init(MSPSharedTripStorageController);
    storageController = v2->_storageController;
    v2->_storageController = v6;

    [(MSPSharedTripRelay *)v2 _startService];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    v6 = "-[MSPSharedTripRelay dealloc]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[RELAY] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripRelay;
  [(MSPSharedTripRelay *)&v4 dealloc];
}

- (void)_fetchDisplayName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  objc_super v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  v6 = objc_msgSend(v4, "aa_firstName");
  [v5 setGivenName:v6];

  uint64_t v7 = objc_msgSend(v4, "aa_middleName");
  [v5 setMiddleName:v7];

  v8 = objc_msgSend(v4, "aa_lastName");
  [v5 setFamilyName:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  [v9 setStyle:2];
  uint64_t v10 = [v9 stringFromPersonNameComponents:v5];
  displayName = self->_displayName;
  p_displayName = (id *)&self->_displayName;
  id *p_displayName = (id)v10;

  if (*p_displayName) {
    v13 = (__CFString *)*p_displayName;
  }
  else {
    v13 = &stru_1F11F3CF0;
  }
  objc_storeStrong(p_displayName, v13);
  v14 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = *p_displayName;
    int v16 = 138412290;
    id v17 = v15;
    _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[RELAY] fetched displayName %@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_startService
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (IDSService *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.maps.eta"];
  sharingService = self->_sharingService;
  self->_sharingService = v3;

  [(IDSService *)self->_sharingService addDelegate:self queue:MEMORY[0x1E4F14428]];
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(IDSService *)self->_sharingService activeAliases];
    uint64_t v7 = [(IDSService *)self->_sharingService _msp_currentAccount];
    displayName = self->_displayName;
    int v9 = 138413058;
    uint64_t v10 = @"com.apple.private.alloy.maps.eta";
    __int16 v11 = 2112;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    int v16 = displayName;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[RELAY] startService: %@, active alias: %@, account: %@, displayName: %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (id)startSharingGroupSessionWithTripIdentifer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sharingETAGroupSession = self->_sharingETAGroupSession;
  if (!sharingETAGroupSession)
  {
    v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "[RELAY] creating _sharingGroupSession for identifier %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v7 = [MSPSharedTripGroupSession alloc];
    sharingService = self->_sharingService;
    int v9 = [(IDSService *)sharingService _msp_currentAccountIdentifier];
    uint64_t v10 = [(MSPSharedTripGroupSession *)v7 initWithService:sharingService groupID:v4 initiator:1 initiatorIdentifier:v9];
    __int16 v11 = self->_sharingETAGroupSession;
    self->_sharingETAGroupSession = v10;

    [(MSPSharedTripRelay *)self _fetchDisplayName];
    v12 = [(MSPSharedTripRelay *)self sharingName];
    [(MSPSharedTripGroupSession *)self->_sharingETAGroupSession setInitiatorDisplayName:v12];

    sharingETAGroupSession = self->_sharingETAGroupSession;
  }
  __int16 v13 = sharingETAGroupSession;

  return v13;
}

- (id)removeSharingWith:(id)a3
{
  if (![(MSPSharedTripGroupSession *)self->_sharingETAGroupSession sessionIsAliveAfterRemovingSharingIdentifiers:a3])
  {
    sharingETAGroupSession = self->_sharingETAGroupSession;
    self->_sharingETAGroupSession = 0;
  }
  id v5 = self->_sharingETAGroupSession;

  return v5;
}

- (void)stopSharing
{
  self->_sharingETAGroupSession = 0;
  MEMORY[0x1F41817F8]();
}

- (id)groupSessionForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_sharedTripGroupIDSSessions objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v6 = [(MSPSharedTripStorageController *)self->_storageController groupSessionInfoForKey:v4];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      v8 = [MSPSharedTripGroupSession alloc];
      sharingService = self->_sharingService;
      uint64_t v10 = [v7 fromID];
      id v5 = [(MSPSharedTripGroupSession *)v8 initWithService:sharingService groupID:v4 initiator:0 initiatorIdentifier:v10];

      [(NSMutableDictionary *)self->_sharedTripGroupIDSSessions setObject:v5 forKeyedSubscript:v4];
      __int16 v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_DEFAULT, "[RELAY] group session created %@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      v12 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "[RELAY] unknown group session %@", (uint8_t *)&v14, 0xCu);
      }

      [(MSPSharedTripRelay *)self _removeFinishedSession:v4];
      id v5 = 0;
    }
  }

  return v5;
}

- (void)_handleChunk:(id)a3 fromID:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v10 objectForKeyedSubscript:@"commandKey"];

  if (v14)
  {
    id v15 = [v10 objectForKeyedSubscript:@"commandKey"];
    [(MSPSharedTripRelay *)self _handleCommand:v15 fromID:v11];

    goto LABEL_39;
  }
  uint64_t v16 = [v10 objectForKeyedSubscript:@"chunkMessageIDKey"];
  if (!v16) {
    goto LABEL_36;
  }
  uint64_t v17 = (void *)v16;
  uint64_t v18 = [v10 objectForKeyedSubscript:@"chunkNumberKey"];
  if (!v18) {
    goto LABEL_35;
  }
  v19 = (void *)v18;
  v54 = self;
  uint64_t v20 = [v10 objectForKeyedSubscript:@"chunkIndexKey"];
  if (!v20)
  {
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  v21 = (void *)v20;
  uint64_t v22 = [v10 objectForKeyedSubscript:@"chunkDataKey"];
  if (!v22)
  {

    goto LABEL_34;
  }
  v23 = (void *)v22;
  v24 = [v10 objectForKeyedSubscript:@"chunkGroupIDKey"];

  if (v24)
  {
    if (!self->_packetBuckets)
    {
      v25 = [MEMORY[0x1E4F1CA60] dictionary];
      packetBuckets = self->_packetBuckets;
      self->_packetBuckets = v25;
    }
    v27 = [v10 objectForKeyedSubscript:@"chunkMessageIDKey"];
    v28 = MSPGetSharedTripIDSTransportLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v63 = (uint64_t)v10;
      __int16 v64 = 2114;
      v65 = v27;
      _os_log_impl(&dword_1B87E5000, v28, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage %@ from %{public}@", buf, 0x16u);
    }

    v29 = [v10 objectForKeyedSubscript:@"chunkNumberKey"];
    uint64_t v30 = [v29 unsignedIntegerValue];

    v31 = [(NSMutableDictionary *)self->_packetBuckets objectForKeyedSubscript:v27];
    if (!v31)
    {
      v31 = objc_opt_new();
      [(NSMutableDictionary *)self->_packetBuckets setObject:v31 forKeyedSubscript:v27];
    }
    [v31 addObject:v10];
    v32 = MSPGetSharedTripIDSTransportLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = [v31 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v63 = v33;
      __int16 v64 = 2112;
      v65 = v31;
      _os_log_impl(&dword_1B87E5000, v32, OS_LOG_TYPE_INFO, "[RELAY] handleChunk %lu %@", buf, 0x16u);
    }

    if ([v31 count] == v30)
    {
      v50 = v27;
      id v51 = v12;
      id v52 = v11;
      id v53 = v10;
      uint64_t v34 = [MEMORY[0x1E4F1CA58] data];
      uint64_t v35 = v30;
      v36 = (void *)v34;
      uint64_t v56 = v35;
      if (v35)
      {
        uint64_t v37 = 0;
        v55 = v31;
        do
        {
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v38 = v31;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v58 != v41) {
                  objc_enumerationMutation(v38);
                }
                v43 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                v44 = [v43 objectForKeyedSubscript:@"chunkIndexKey"];
                uint64_t v45 = [v44 unsignedIntegerValue];

                if (v45 == v37)
                {
                  v46 = [v43 objectForKeyedSubscript:@"chunkDataKey"];
                  [v36 appendData:v46];
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v61 count:16];
            }
            while (v40);
          }

          ++v37;
          v31 = v55;
        }
        while (v37 != v56);
      }
      v47 = MSPGetSharedTripIDSTransportLog();
      v27 = v50;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "length"));
        *(_DWORD *)buf = 138412546;
        uint64_t v63 = (uint64_t)v48;
        __int16 v64 = 2114;
        v65 = v50;
        _os_log_impl(&dword_1B87E5000, v47, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage full message ready %@ messageID %{public}@", buf, 0x16u);
      }
      id v10 = v53;
      id v12 = v51;
      id v11 = v52;
      [(MSPSharedTripRelay *)v54 _handleIncomingMessage:v36 info:v53 fromID:v52 receivingHandle:v51 receivingAccountIdentifier:v13];
      [(NSMutableDictionary *)v54->_packetBuckets setObject:0 forKeyedSubscript:v50];
    }
    goto LABEL_39;
  }
LABEL_36:
  v49 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v63 = (uint64_t)v10;
    _os_log_impl(&dword_1B87E5000, v49, OS_LOG_TYPE_ERROR, "[RELAY] cannot handle message %@", buf, 0xCu);
  }

LABEL_39:
}

- (void)_handleCommand:(id)a3 fromID:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"j"])
  {
    [(MSPSharedTripGroupSession *)self->_sharingETAGroupSession participantDidJoin:v7];
  }
  else if ([v6 isEqualToString:@"l"])
  {
    [(MSPSharedTripGroupSession *)self->_sharingETAGroupSession participantDidLeave:v7];
  }
  else
  {
    v8 = MSPGetSharedTripIDSTransportLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_ERROR, "[RELAY] cannot handle command %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_handleIncomingMessage:(id)a3 info:(id)a4 fromID:(id)a5 receivingHandle:(id)a6 receivingAccountIdentifier:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v13 objectForKeyedSubscript:@"chunkGroupIDKey"];
  uint64_t v18 = (void *)v17;
  if (v12 && v17)
  {
    v19 = [(MSPSharedTripStorageController *)self->_storageController groupSessionInfoForKey:v17];

    if (!v19)
    {
      uint64_t v20 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v18;
        _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_DEFAULT, "[RELAY] add new session %@", (uint8_t *)&v22, 0xCu);
      }

      [(MSPSharedTripStorageController *)self->_storageController addNewSession:v18 originator:v14 receivingHandle:v15 receivingAccountIdentifier:v16];
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained relay:self receiveData:v12 info:v13 fromID:v14];
  }
  else
  {
    WeakRetained = MSPGetSharedTripIDSTransportLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v13;
      _os_log_impl(&dword_1B87E5000, WeakRetained, OS_LOG_TYPE_ERROR, "[RELAY] identifier or data missing %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)_removeFinishedSession:(id)a3
{
  id v7 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedTripGroupIDSSessions, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    [v4 leaveLiveModeForced:0];
    [(NSMutableDictionary *)self->_sharedTripGroupIDSSessions setObject:0 forKeyedSubscript:v7];
  }
  [(MSPSharedTripStorageController *)self->_storageController removeSession:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained relay:self sharingClosed:v7];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412802;
    id v19 = v12;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage %@ from %@ to %@", (uint8_t *)&v18, 0x20u);
  }

  id v16 = [v14 toID];

  uint64_t v17 = [v11 uniqueID];
  [(MSPSharedTripRelay *)self _handleChunk:v12 fromID:v13 receivingHandle:v16 receivingAccountIdentifier:v17];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_INFO, "[RELAY] incomingData from %@ to %@", (uint8_t *)&v19, 0x16u);
  }

  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithPlistData:v14];

  uint64_t v17 = [v13 toID];

  int v18 = [v11 uniqueID];
  [(MSPSharedTripRelay *)self _handleChunk:v16 fromID:v12 receivingHandle:v17 receivingAccountIdentifier:v18];
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a5;
  int v18 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_INFO, "[RELAY] incomingMessage URL %@ from %@ to %@", buf, 0x20u);
  }

  int v19 = (void *)MEMORY[0x1E4F1C9B8];
  id v20 = [v17 path];

  id v25 = 0;
  __int16 v21 = [v19 dataWithContentsOfFile:v20 options:1 error:&v25];
  id v22 = v25;

  if (v22)
  {
    uint64_t v23 = MSPGetSharedTripIDSTransportLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v22;
      _os_log_impl(&dword_1B87E5000, v23, OS_LOG_TYPE_ERROR, "[RELAY] incomingMessage error %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v23 = [v16 toID];
    uint64_t v24 = [v13 uniqueID];
    [(MSPSharedTripRelay *)self _handleIncomingMessage:v21 info:v14 fromID:v15 receivingHandle:v23 receivingAccountIdentifier:v24];
  }
}

- (void)service:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  id v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[RELAY] receivedGroupSessionParticipantUpdate %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  id v13 = a8;
  id v14 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [NSNumber numberWithBool:v10];
    int v16 = 138544130;
    id v17 = v11;
    __int16 v18 = 2112;
    int v19 = v15;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[RELAY] Did send message {identifier: %{public}@, success: %@, error: %@ context %@}", (uint8_t *)&v16, 0x2Au);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  id v11 = a7;
  id v12 = MSPGetSharedTripIDSTransportLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543874;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_INFO, "[RELAY] Message hasBeenDelivered {identifier: %{public}@, context: %@ fromID %@}", (uint8_t *)&v13, 0x20u);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5 = [(MSPSharedTripRelay *)self availabilityDelegate];
  objc_msgSend(v5, "relay:accountStatusChanged:", self, -[MSPSharedTripRelay hasValidIDSAccount](self, "hasValidIDSAccount"));
}

- (void)setStorageController:(id)a3
{
}

- (MSPSharedTripRelayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSharedTripRelayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MSPSharedTripAvailabiltyDelegate)availabilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_availabilityDelegate);

  return (MSPSharedTripAvailabiltyDelegate *)WeakRetained;
}

- (void)setAvailabilityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_availabilityDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong((id *)&self->_packetBuckets, 0);
  objc_storeStrong((id *)&self->_sharedTripGroupIDSSessions, 0);
  objc_storeStrong((id *)&self->_sharingETAGroupSession, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);

  objc_storeStrong((id *)&self->_sharingService, 0);
}

@end