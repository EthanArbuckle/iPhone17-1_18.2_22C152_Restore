@interface _IDSGroupSession
+ (id)keyValueDeliveryForSessionID:(id)a3;
+ (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4;
- (BOOL)isLightweightParticipant;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)uniqueID;
- (_IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6;
- (_IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6 delegate:(id)a7 queue:(id)a8;
- (id)boostContext;
- (id)getDestinations;
- (id)getDestinationsLightweightStatusDict;
- (id)getURIsToParticipantIDRequests;
- (id)keyValueDelivery;
- (id)sessionIDAliasWithSalt:(id)a3;
- (unint64_t)localParticipantID;
- (unsigned)sessionEndedReason;
- (unsigned)state;
- (void)_broadcastNewSessionToDaemon;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_checkAndSendDataCryptor;
- (void)_cleanupSocketPairConnections;
- (void)_setupSession:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6;
- (void)createAliasForLocalParticipantIDWithSalt:(id)a3 delegateQueueCompletionHandler:(id)a4;
- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5;
- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 delegateQueueCompletionHandler:(id)a5;
- (void)createSessionIDAliasWithSalt:(id)a3 delegateQueueCompletionHandler:(id)a4;
- (void)daemonDisconnected;
- (void)dealloc;
- (void)emptyXPCReply;
- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5;
- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 delegateQueueCompletionHandler:(id)a5;
- (void)groupSessionDidConnectUnderlyingLinks:(id)a3;
- (void)groupSessionDidDisconnectUnderlyingLinks:(id)a3;
- (void)groupSessionDidInitialize:(id)a3 error:(id)a4;
- (void)groupSessionDidTerminate:(id)a3;
- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)invalidate;
- (void)joinWithOptions:(id)a3;
- (void)leaveGroupSessionWithOptions:(id)a3;
- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4;
- (void)participantUpdatedForSession:(id)a3;
- (void)reconnectUPlusOneSession;
- (void)registerPluginWithOptions:(id)a3;
- (void)removeParticipantIDs:(id)a3;
- (void)requestActiveParticipants;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3;
- (void)requestURIsForParticipantIDs:(id)a3 completionHandler:(id)a4;
- (void)session:(id)a3 didCreateParticipantIDAlias:(unint64_t)a4 forParticipantID:(unint64_t)a5 salt:(id)a6;
- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveKeyMaterial:(id)a4;
- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveParticipantID:(unint64_t)a4 forParticipantIDAlias:(unint64_t)a5 salt:(id)a6;
- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6;
- (void)session:(id)a3 didReceiveQueryBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 isTruncated:(BOOL)a6;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)session:(id)a3 didReceiveURIsForParticipantIDs:(id)a4 withRequestID:(id)a5;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 didRemoveParticipantIDs:(id)a4 withCode:(unsigned int)a5 isTruncated:(BOOL)a6;
- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 hasOutdatedSKI:(id)a4;
- (void)session:(id)a3 participantDidJoinGroupWithInfo:(id)a4;
- (void)session:(id)a3 participantDidLeaveGroupWithInfo:(id)a4;
- (void)session:(id)a3 rejectedKeyRecoveryRequestFromURI:(id)a4 reason:(unsigned int)a5;
- (void)session:(id)a3 shouldInvalidateKeyMaterialByKeyIndexes:(id)a4;
- (void)sessionDidJoinGroup:(id)a3 participantInfo:(id)a4 error:(id)a5;
- (void)sessionDidJoinGroup:(id)a3 participantUpdateDictionary:(id)a4 error:(id)a5;
- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4;
- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5;
- (void)setBoostContext:(id)a3;
- (void)setCallScreeningMode:(BOOL)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3;
- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3;
- (void)setKeyMaterialCache:(id)a3;
- (void)setParticipantInfo:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)setUniqueID:(id)a3;
- (void)unregisterPluginWithOptions:(id)a3;
- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6;
- (void)updateMembers:(id)a3 withContext:(id)a4 triggeredLocally:(BOOL)a5;
- (void)updateParticipantData:(id)a3 withContext:(id)a4;
- (void)updateParticipantInfo:(id)a3;
- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 withContext:(id)a5 triggeredLocally:(BOOL)a6;
- (void)xpcObject:(id)a3 objectContext:(id)a4;
@end

@implementation _IDSGroupSession

- (_IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A2F1F8();
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)_IDSGroupSession;
  v17 = [(_IDSGroupSession *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(_IDSGroupSession *)v17 _setupSession:v10 destinations:v11 options:v12 delegateContext:v13];
    [(_IDSGroupSession *)v18 _broadcastNewSessionToDaemon];
  }

  return v18;
}

- (_IDSGroupSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6 delegate:(id)a7 queue:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (CUTWeakReference *)a7;
  id v19 = a8;
  objc_super v20 = +[IDSInternalQueueController sharedInstance];
  int v21 = [v20 assertQueueIsCurrent];

  if (v21)
  {
    v22 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_191A2F290();
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)_IDSGroupSession;
  v23 = [(_IDSGroupSession *)&v29 init];
  v24 = v23;
  if (v23)
  {
    [(_IDSGroupSession *)v23 _setupSession:v14 destinations:v15 options:v16 delegateContext:v17];
    v25 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v18;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Initializing setting up session delegate %p", buf, 0xCu);
    }

    if (v24->_delegate != v18)
    {
      uint64_t v26 = [MEMORY[0x1E4F59E30] weakRefWithObject:v18];
      delegate = v24->_delegate;
      v24->_delegate = (CUTWeakReference *)v26;
    }
    objc_storeStrong((id *)&v24->_queue, a8);
    [(_IDSGroupSession *)v24 _broadcastNewSessionToDaemon];
  }

  return v24;
}

- (void)_setupSession:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *MEMORY[0x1E4F6B398];
  id v13 = a6;
  id v14 = a3;
  id v15 = [v11 objectForKey:v12];
  id v16 = [v15 uppercaseString];

  id v17 = [v11 objectForKey:*MEMORY[0x1E4F6AFC0]];
  stableGroupID = self->_stableGroupID;
  self->_stableGroupID = v17;

  id v19 = [v11 objectForKey:*MEMORY[0x1E4F6AFB0]];
  objc_super v20 = [v19 uppercaseString];
  groupID = self->_groupID;
  self->_groupID = v20;

  uint64_t v22 = [v16 length];
  v23 = (NSString *)v16;
  if (!v22) {
    v23 = self->_groupID;
  }
  objc_storeStrong((id *)&self->_uniqueID, v23);
  v24 = [NSString stringGUID];
  instanceID = self->_instanceID;
  self->_instanceID = v24;

  uint64_t v26 = [v14 _internal];

  v27 = [v26 uniqueID];
  accountID = self->_accountID;
  self->_accountID = v27;

  objc_super v29 = [v11 objectForKey:*MEMORY[0x1E4F6AFA8]];
  fromID = self->_fromID;
  self->_fromID = v29;

  v31 = [MEMORY[0x1E4F6B438] destinationWithDestinations:v10];
  uint64_t v32 = [v31 destinationURIs];
  destinations = self->_destinations;
  self->_destinations = v32;

  v34 = [MEMORY[0x1E4F59E30] weakRefWithObject:v13];

  id delegateContext = self->_delegateContext;
  self->_id delegateContext = v34;

  v36 = [v11 objectForKey:*MEMORY[0x1E4F6B390]];
  self->_transportType = [v36 integerValue];

  uint64_t v37 = *MEMORY[0x1E4F6AF98];
  v38 = [v11 objectForKey:*MEMORY[0x1E4F6AF98]];
  if (v38)
  {
    v39 = [v11 objectForKey:v37];
    self->_isInitiator = [v39 BOOLValue];
  }
  else
  {
    self->_isInitiator = 1;
  }

  v40 = [v11 objectForKey:*MEMORY[0x1E4F6B318]];
  self->_connectionCountHint = [v40 unsignedIntegerValue];

  v41 = [v11 objectForKey:*MEMORY[0x1E4F6B338]];
  self->_disallowCellularInterface = [v41 BOOLValue];

  v42 = [v11 objectForKey:*MEMORY[0x1E4F6B340]];
  self->_disallowWifiInterface = [v42 BOOLValue];

  v43 = [v11 objectForKey:*MEMORY[0x1E4F6B380]];
  self->_preferredAddressFamily = [v43 unsignedIntegerValue];

  v44 = [v11 objectForKey:*MEMORY[0x1E4F6B378]];
  self->_preferCellularForCallSetup = [v44 BOOLValue];

  v45 = [v11 objectForKey:*MEMORY[0x1E4F6B310]];
  clientUUID = self->_clientUUID;
  self->_clientUUID = v45;

  self->_localParticipantID = 0;
  v47 = [v11 objectForKey:*MEMORY[0x1E4F6B008]];
  if ([v47 BOOLValue]) {
    char v48 = 1;
  }
  else {
    char v48 = IMGetDomainBoolForKey();
  }
  self->_startAsUPlusOneSession = v48;

  v49 = [v11 objectForKey:*MEMORY[0x1E4F6AFA0]];
  self->_isLightweightParticipant = [v49 BOOLValue];

  v50 = [v11 objectForKey:*MEMORY[0x1E4F6AF88]];
  self->_callScreeningMode = [v50 BOOLValue];

  v51 = [v11 objectForKey:*MEMORY[0x1E4F6B300]];
  self->_alwaysSkipSelf = [v51 BOOLValue];

  v52 = [v11 objectForKey:*MEMORY[0x1E4F6B6C0]];
  qrReason = self->_qrReason;
  self->_qrReason = v52;

  v54 = [v11 objectForKey:*MEMORY[0x1E4F6B6B8]];
  previousError = self->_previousError;
  self->_previousError = v54;

  v56 = objc_alloc_init(IDSGroupEncryptionKeyMaterialCache);
  keyMaterialCache = self->_keyMaterialCache;
  self->_keyMaterialCache = v56;

  v58 = [MEMORY[0x1E4F1CA48] array];
  dataCryptorRequests = self->_dataCryptorRequests;
  self->_dataCryptorRequests = v58;

  v60 = [MEMORY[0x1E4F1CA60] dictionary];
  createParticipantIDAliasCallbacks = self->_createParticipantIDAliasCallbacks;
  self->_createParticipantIDAliasCallbacks = v60;

  v62 = [MEMORY[0x1E4F1CA60] dictionary];
  getParticipantIDForAliasCallbacks = self->_getParticipantIDForAliasCallbacks;
  self->_getParticipantIDForAliasCallbacks = v62;

  v64 = [MEMORY[0x1E4F1CA48] array];
  getParticipantIDForAliasDelegateQueueCallbacks = self->_getParticipantIDForAliasDelegateQueueCallbacks;
  self->_getParticipantIDForAliasDelegateQueueCallbacks = v64;

  v66 = +[IDSDaemonController sharedInstance];
  v67 = [v66 listener];
  [v67 addHandler:self];

  v68 = (NSMutableDictionary *)[v11 mutableCopy];
  sessionConfig = self->_sessionConfig;
  self->_sessionConfig = v68;

  v70 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    v72 = self->_instanceID;
    int v81 = 134218498;
    v82 = self;
    __int16 v83 = 2112;
    v84 = (__CFString *)uniqueID;
    __int16 v85 = 2112;
    v86 = (NSDictionary *)v72;
    _os_log_impl(&dword_19190B000, v70, OS_LOG_TYPE_DEFAULT, "Initializing _IDSGroupSession { self: %p, uniqueID: %@, instanceID: %@ }", (uint8_t *)&v81, 0x20u);
  }

  if (self->_destinations)
  {
    v73 = [MEMORY[0x1E4F6B438] destinationWithDestinations:v10];
    if (objc_opt_respondsToSelector())
    {
      v74 = [MEMORY[0x1E4F6B438] destinationWithDestinations:v10];
      v75 = [v74 destinationLightweightStatus];
      destinationsLightweightStatus = self->_destinationsLightweightStatus;
      self->_destinationsLightweightStatus = v75;
    }
    [(NSMutableDictionary *)self->_sessionConfig removeObjectForKey:*MEMORY[0x1E4F6AFB8]];
  }
  v77 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isLightweightParticipant) {
      v78 = @"YES";
    }
    else {
      v78 = @"NO";
    }
    v80 = self->_destinationsLightweightStatus;
    v79 = self->_fromID;
    int v81 = 138412802;
    v82 = (_IDSGroupSession *)v79;
    __int16 v83 = 2112;
    v84 = v78;
    __int16 v85 = 2112;
    v86 = v80;
    _os_log_impl(&dword_19190B000, v77, OS_LOG_TYPE_DEFAULT, "_fromID: %@, _isLightweightParticipant: %@, _destinationsLightweightStatus: %@", (uint8_t *)&v81, 0x20u);
  }
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2F328();
    }
  }
  v6 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    instanceID = self->_instanceID;
    int v10 = 134218498;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = uniqueID;
    __int16 v14 = 2112;
    id v15 = instanceID;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating _IDSGroupSession { self: %p, uniqueID: %@, instanceID: %@ }", (uint8_t *)&v10, 0x20u);
  }

  self->_isInvalidated = 1;
  v9 = +[IDSDaemonController sharedInstance];
  [v9 cleanupSessionWithInstanceID:self->_instanceID];
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    instanceID = self->_instanceID;
    *(_DWORD *)buf = 134218498;
    __int16 v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = uniqueID;
    __int16 v15 = 2112;
    uint64_t v16 = instanceID;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating _IDSGroupSession { self: %p, uniqueID: %@, instanceID: %@ }", buf, 0x20u);
  }

  if (!self->_isInvalidated)
  {
    v6 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2F3C0((uint64_t)self, v6);
    }

    v7 = +[IDSDaemonController sharedInstance];
    [v7 cleanupSessionWithInstanceID:self->_instanceID];
  }
  [(_IDSGroupSession *)self _cleanupSocketPairConnections];
  v8 = +[IDSDaemonController sharedInstance];
  v9 = [v8 listener];
  [v9 removeHandler:self];

  v10.receiver = self;
  v10.super_class = (Class)_IDSGroupSession;
  [(_IDSGroupSession *)&v10 dealloc];
}

- (void)daemonDisconnected
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2F450();
    }
  }
  if ([(NSString *)self->_uniqueID length])
  {
    v6 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412290;
      __int16 v12 = uniqueID;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "Disconnected from daemon, notifying client of groupSession %@", buf, 0xCu);
    }

    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", @"IDSSessionEndedReasonComponentCrashed", *MEMORY[0x1E4F28568], 0);
    objc_super v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:13 userInfo:v9];
    [(_IDSGroupSession *)self groupSessionEnded:self->_uniqueID withReason:16 error:v10];
  }
}

- (void)_broadcastNewSessionToDaemon
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2F584();
    }
  }
  if (![(NSString *)self->_uniqueID length])
  {
    v6 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2F550();
    }
  }
  if (![(NSString *)self->_instanceID length])
  {
    v7 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2F51C();
    }
  }
  if (![(NSString *)self->_accountID length])
  {
    id v8 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_191A2F4E8();
    }
  }
  v9 = [NSNumber numberWithBool:self->_isInitiator];
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B358], v9);
  }

  CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B360], MEMORY[0x1E4F1CC38]);
  accountID = self->_accountID;
  if (accountID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B2F8], accountID);
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B398], uniqueID);
  }
  instanceID = self->_instanceID;
  if (instanceID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B350], instanceID);
  }
  stableGroupID = self->_stableGroupID;
  if (stableGroupID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6AFC0], stableGroupID);
  }
  groupID = self->_groupID;
  if (groupID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6AFB0], groupID);
  }
  fromID = self->_fromID;
  if (fromID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6AFA8], fromID);
  }
  uint64_t v16 = [(NSSet *)self->_destinations allObjects];
  if (v16) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B328], v16);
  }

  destinationsLightweightStatus = self->_destinationsLightweightStatus;
  if (destinationsLightweightStatus) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B320], destinationsLightweightStatus);
  }
  v18 = [NSNumber numberWithInteger:self->_transportType];
  if (v18) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B390], v18);
  }

  id v19 = +[IDSDaemonController sharedInstance];
  objc_super v20 = [v19 listenerID];

  if (v20) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B308], v20);
  }

  int v21 = [NSNumber numberWithUnsignedInteger:self->_connectionCountHint];
  if (v21) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B318], v21);
  }

  uint64_t v22 = [NSNumber numberWithBool:self->_needsToWaitForPreConnectionData];
  if (v22) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B3A0], v22);
  }

  v23 = [NSNumber numberWithBool:self->_disallowCellularInterface];
  if (v23) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B338], v23);
  }

  v24 = [NSNumber numberWithBool:self->_disallowWifiInterface];
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B340], v24);
  }

  v25 = [NSNumber numberWithUnsignedInteger:self->_preferredAddressFamily];
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B380], v25);
  }

  uint64_t v26 = [NSNumber numberWithBool:self->_preferCellularForCallSetup];
  if (v26) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B378], v26);
  }

  clientUUID = self->_clientUUID;
  if (clientUUID) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B310], clientUUID);
  }
  v28 = [NSNumber numberWithBool:self->_alwaysSkipSelf];
  if (v28) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B300], v28);
  }

  qrReason = self->_qrReason;
  if (qrReason) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B6C0], qrReason);
  }
  previousError = self->_previousError;
  if (previousError) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B6B8], previousError);
  }
  v31 = [NSNumber numberWithBool:self->_startAsUPlusOneSession];
  if (v31) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6B008], v31);
  }

  uint64_t v32 = [NSNumber numberWithBool:self->_isLightweightParticipant];
  if (v32) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6AFA0], v32);
  }

  v33 = [NSNumber numberWithBool:self->_callScreeningMode];
  if (v33) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E4F6AF88], v33);
  }

  v34 = +[IDSDaemonController sharedInstance];
  [v34 setupNewSessionWithConfiguration:self->_sessionConfig];

  sessionConfig = self->_sessionConfig;
  self->_sessionConfig = 0;
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IDSInternalQueueController sharedInstance];
    int v6 = [v5 assertQueueIsCurrent];

    if (v6)
    {
      v7 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_191A2F61C();
      }
    }
    uint64_t v8 = [(CUTWeakReference *)self->_delegate object];
    v9 = (void *)v8;
    queue = self->_queue;
    if (queue && v8)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_191967CAC;
      v11[3] = &unk_1E5729880;
      id v13 = v4;
      id v12 = v9;
      dispatch_async(queue, v11);
    }
  }
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = (CUTWeakReference *)a3;
  v7 = (OS_dispatch_queue *)a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    objc_super v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2F6B4();
    }
  }
  id v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Setting up session delegate %p", (uint8_t *)&v15, 0xCu);
  }

  if (self->_delegate != v6)
  {
    id v12 = [MEMORY[0x1E4F59E30] weakRefWithObject:v6];
    delegate = self->_delegate;
    self->_delegate = v12;
  }
  queue = self->_queue;
  self->_queue = v7;
}

- (NSString)uniqueID
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2F74C();
    }
  }
  uniqueID = self->_uniqueID;

  return uniqueID;
}

- (void)_cleanupSocketPairConnections
{
  [(IDSBaseSocketPairConnection *)self->_unreliableSocketPairConnection endSession];
  unreliableSocketPairConnection = self->_unreliableSocketPairConnection;
  self->_unreliableSocketPairConnection = 0;
}

- (void)updateMembers:(id)a3 withContext:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A2F7E4();
    }
  }
  id v13 = (void *)MEMORY[0x1E4F6B438];
  __int16 v14 = objc_msgSend(v9, "__imSetFromArray");
  int v15 = [v13 destinationWithDestinations:v14];
  uint64_t v16 = [v15 destinationURIs];
  uint64_t v17 = [v16 allObjects];

  v18 = (void *)MEMORY[0x1E4F6B438];
  id v19 = objc_msgSend(v9, "__imSetFromArray");

  objc_super v20 = [v18 destinationWithDestinations:v19];
  int v21 = [v20 destinationLightweightStatus];

  uint64_t v22 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    destinationsLightweightStatus = self->_destinationsLightweightStatus;
    *(_DWORD *)buf = 138412546;
    v28 = v21;
    __int16 v29 = 2112;
    v30 = destinationsLightweightStatus;
    _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "updateMembers: lightweightStatusDict: %@, _destinationLightweightStatus: %@", buf, 0x16u);
  }

  v24 = self->_destinationsLightweightStatus;
  self->_destinationsLightweightStatus = v21;
  v25 = v21;

  uint64_t v26 = +[IDSDaemonController sharedInstance];
  [v26 updateMembers:v17 forGroup:self->_groupID sessionID:self->_uniqueID withContext:v8 messagingCapabilities:0 triggeredLocally:v5 lightweightStatusDict:v25];
}

- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[IDSInternalQueueController sharedInstance];
  int v14 = [v13 assertQueueIsCurrent];

  if (v14)
  {
    int v15 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_191A2F87C();
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F6B438];
  uint64_t v17 = objc_msgSend(v12, "__imSetFromArray");
  v18 = [v16 destinationWithDestinations:v17];
  id v19 = [v18 destinationURIs];
  objc_super v20 = [v19 allObjects];

  int v21 = (void *)MEMORY[0x1E4F6B438];
  uint64_t v22 = objc_msgSend(v12, "__imSetFromArray");

  v23 = [v21 destinationWithDestinations:v22];
  v24 = [v23 destinationLightweightStatus];

  v25 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    destinationsLightweightStatus = self->_destinationsLightweightStatus;
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v24;
    __int16 v32 = 2112;
    v33 = destinationsLightweightStatus;
    _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "updateMembers (messagingCapabilities): lightweightStatusDict: %@, _destinationLightweightStatus: %@", buf, 0x16u);
  }

  v27 = self->_destinationsLightweightStatus;
  self->_destinationsLightweightStatus = v24;
  v28 = v24;

  __int16 v29 = +[IDSDaemonController sharedInstance];
  [v29 updateMembers:v20 forGroup:self->_groupID sessionID:self->_uniqueID withContext:v11 messagingCapabilities:v10 triggeredLocally:v6 lightweightStatusDict:v28];
}

- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A2F914();
    }
  }
  id v10 = (void *)MEMORY[0x1E4F6B438];
  id v11 = objc_msgSend(v6, "__imSetFromArray");
  id v12 = [v10 destinationWithDestinations:v11];
  id v13 = [v12 destinationURIs];
  int v14 = [v13 allObjects];

  int v15 = +[IDSDaemonController sharedInstance];
  [v15 manageDesignatedMembers:v14 forGroup:self->_groupID sessionID:self->_uniqueID withType:v4];
}

- (void)removeParticipantIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2F9AC();
    }
  }
  int v8 = +[IDSDaemonController sharedInstance];
  [v8 removeParticipantIDs:v4 forGroup:self->_groupID sessionID:self->_uniqueID];
}

- (void)updateParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2FA44();
    }
  }
  id v11 = +[IDSDaemonController sharedInstance];
  [v11 updateParticipantData:v7 forGroup:self->_groupID sessionID:self->_uniqueID withContext:v6];
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2FADC();
    }
  }
  int v8 = +[IDSDaemonController sharedInstance];
  [v8 updateParticipantInfo:v4 forGroup:self->_groupID sessionID:self->_uniqueID];
}

- (void)setParticipantInfo:(id)a3
{
  id v4 = (NSDictionary *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2FB74();
    }
  }
  participantInfo = self->_participantInfo;
  self->_participantInfo = v4;
}

- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 withContext:(id)a5 triggeredLocally:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    int v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A2FC40();
    }
  }
  if (v6)
  {
    destinationsLightweightStatus = self->_destinationsLightweightStatus;
    self->_isLightweightParticipant = v8 == 0;
    uint64_t v16 = (NSDictionary *)[(NSDictionary *)destinationsLightweightStatus mutableCopy];
    uint64_t v17 = v16;
    if (self->_fromID)
    {
      v18 = self->_destinationsLightweightStatus;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_191968AB8;
      v34[3] = &unk_1E572AE80;
      v34[4] = self;
      v35 = v16;
      [(NSDictionary *)v18 enumerateKeysAndObjectsUsingBlock:v34];
    }
    else
    {
      v25 = +[IDSLogging _IDSGroupSession];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_191A2FC0C();
      }
    }
    objc_storeStrong((id *)&self->_destinationsLightweightStatus, v17);
    uint64_t v26 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_destinationsLightweightStatus;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v37 = v8;
      *(_WORD *)&v37[4] = 2112;
      *(void *)&v37[6] = v27;
      _os_log_impl(&dword_19190B000, v26, OS_LOG_TYPE_DEFAULT, "updateParticipantType to %u, _destinationsLightweightStatus: %@", buf, 0x12u);
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F6B438];
    objc_super v20 = objc_msgSend(v10, "__imSetFromArray");
    int v21 = [v19 destinationWithDestinations:v20];
    uint64_t v22 = [v21 destinationLightweightStatus];

    v23 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_destinationsLightweightStatus;
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v37 = v22;
      *(_WORD *)&v37[8] = 2112;
      *(void *)&v37[10] = v24;
      _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, "updateParticipantType: triggered remotely: lightweightStatusDict: %@, _destinationLightweightStatus: %@", buf, 0x16u);
    }

    uint64_t v17 = self->_destinationsLightweightStatus;
    self->_destinationsLightweightStatus = v22;
  }

  v28 = (void *)MEMORY[0x1E4F6B438];
  __int16 v29 = objc_msgSend(v10, "__imSetFromArray");
  v30 = [v28 destinationWithDestinations:v29];
  uint64_t v31 = [v30 destinationURIs];
  __int16 v32 = [v31 allObjects];

  v33 = +[IDSDaemonController sharedInstance];
  [v33 updateParticipantType:v8 forGroup:self->_groupID sessionID:self->_uniqueID members:v32 triggeredLocally:v6 withContext:v11 lightweightStatusDict:self->_destinationsLightweightStatus];
}

- (void)joinWithOptions:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = (NSDictionary *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2FD6C();
    }
  }
  if (self->_state != 2)
  {
    id v11 = [(_IDSGroupSession *)self uniqueID];
    id v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "joinWithOptions called %@", buf, 0xCu);
    }

    int v13 = (void *)[v11 copy];
    int v14 = [(NSDictionary *)v4 description];
    v50[1] = (id)MEMORY[0x1E4F143A8];
    v50[2] = (id)3221225472;
    v50[3] = sub_191969378;
    v50[4] = &unk_1E57291B8;
    id v15 = v13;
    id v51 = v15;
    id v16 = v14;
    id v52 = v16;
    cut_dispatch_log_queue();
    uint64_t v17 = (void *)[(NSDictionary *)v4 mutableCopy];
    uint64_t v18 = *MEMORY[0x1E4F6AFD8];
    id v19 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F6AFD8]];

    objc_super v20 = v4;
    if (!v19)
    {
      participantInfo = self->_participantInfo;
      if (!participantInfo
        || ([(NSDictionary *)participantInfo objectForKey:v18],
            v43 = objc_claimAutoreleasedReturnValue(),
            v43,
            !v43))
      {
        v44 = +[IDSLogging _IDSGroupSession];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19190B000, v44, OS_LOG_TYPE_DEFAULT, "Cannot join a session without the participant data information.", buf, 2u);
        }

        v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v53 = *MEMORY[0x1E4F28228];
        v54 = @"Cannot join a session without the participant data information.";
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        uint64_t v37 = [v45 errorWithDomain:@"joinGroupSessionError" code:-1000 userInfo:v46];

        [(_IDSGroupSession *)self sessionDidJoinGroup:self->_uniqueID participantInfo:0 error:v37];
        goto LABEL_34;
      }
      objc_super v20 = self->_participantInfo;
    }
    int v21 = [(NSDictionary *)v20 objectForKey:v18];
    [v17 setObject:v21 forKeyedSubscript:v18];

    uint64_t v22 = *MEMORY[0x1E4F6AFF0];
    v23 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F6AFF0]];

    if (v23)
    {
      v24 = [(NSDictionary *)v4 objectForKey:v22];
      [v17 setObject:v24 forKeyedSubscript:v22];
    }
    uint64_t v25 = *MEMORY[0x1E4F6B008];
    uint64_t v26 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F6B008]];
    if ([v26 BOOLValue]) {
      char v27 = 1;
    }
    else {
      char v27 = IMGetDomainBoolForKey();
    }
    self->_startAsUPlusOneSession = v27;

    v28 = [NSNumber numberWithBool:self->_startAsUPlusOneSession];
    [v17 setObject:v28 forKeyedSubscript:v25];

    uint64_t v29 = *MEMORY[0x1E4F6AF88];
    v30 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F6AF88]];
    self->_callScreeningMode = [v30 BOOLValue];

    if (IMGetDomainBoolForKeyWithDefaultValue())
    {
      uint64_t v31 = +[IDSLogging _IDSGroupSession];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = uniqueID;
        _os_log_impl(&dword_19190B000, v31, OS_LOG_TYPE_DEFAULT, "Force callScreening mode on for session: %@, due to default.", buf, 0xCu);
      }

      self->_callScreeningMode = 1;
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v33 = dispatch_time(0, 20000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_191969434;
      block[3] = &unk_1E57295B8;
      objc_copyWeak(v50, (id *)buf);
      dispatch_after(v33, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(v50);
      objc_destroyWeak((id *)buf);
    }
    if (self->_callScreeningMode)
    {
      uint64_t v34 = [NSNumber numberWithBool:1];
      [v17 setObject:v34 forKeyedSubscript:v29];
    }
    uint64_t v35 = *MEMORY[0x1E4F6AF90];
    v36 = [(NSDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AF90]];
    uint64_t v37 = v36;
    if (v36)
    {
      uint64_t v38 = [v36 UUIDString];
      [v17 setObject:v38 forKey:v35];
    }
    uint64_t v39 = *MEMORY[0x1E4F6B018];
    v40 = [(NSDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x1E4F6B018]];
    if (v40) {
      [v17 setObject:v40 forKey:v39];
    }
    [v17 removeObjectForKey:*MEMORY[0x1E4F6AFB8]];
    v41 = +[IDSDaemonController sharedInstance];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1919694FC;
    v47[3] = &unk_1E572A590;
    v47[4] = self;
    id v48 = v17;
    [v41 forwardMethodWithReplyIsSync:0 block:v47];

LABEL_34:
    goto LABEL_35;
  }
  uint64_t v8 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "Cannot join a session that is already ended, ignoring...", buf, 2u);
  }

  int v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v56 = *MEMORY[0x1E4F28228];
  v57[0] = @"Cannot join a session that is already ended.";
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
  id v11 = [v9 errorWithDomain:@"joinGroupSessionError" code:-1000 userInfo:v10];

  [(_IDSGroupSession *)self sessionDidJoinGroup:self->_uniqueID participantInfo:0 error:v11];
LABEL_35:
}

- (void)leaveGroupSessionWithOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2FE04();
    }
  }
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v8 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(_IDSGroupSession *)self uniqueID];
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "leaveGroupSessionWithOptions called %@", (uint8_t *)&v11, 0xCu);
  }
  id v10 = +[IDSDaemonController sharedInstance];
  [v10 leaveGroupSession:self->_uniqueID participantInfo:self->_participantInfo options:v4];
}

- (void)reconnectUPlusOneSession
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2FE9C();
    }
  }
  int v6 = +[IDSDaemonController sharedInstance];
  [v6 reconnectSessionWithUniqueID:self->_uniqueID];
}

- (void)setPreferences:(id)a3
{
  int v4 = (NSMutableDictionary *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2FF34();
    }
  }
  if (self->_preferences != v4)
  {
    uint64_t v8 = (NSMutableDictionary *)[(NSMutableDictionary *)v4 mutableCopy];
    preferences = self->_preferences;
    self->_preferences = v8;

    id v10 = +[IDSDaemonController sharedInstance];
    [v10 setPreferences:v4 forSessionWithUniqueID:self->_uniqueID];
  }
}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  int v6 = (NSSet *)a3;
  id v7 = (NSSet *)a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A2FFCC();
    }
  }
  requiredCapabilities = self->_requiredCapabilities;
  self->_requiredCapabilities = v6;
  id v12 = v6;

  requiredLackOfCapabilities = self->_requiredLackOfCapabilities;
  self->_requiredLackOfCapabilities = v7;
  int v14 = v7;

  id v15 = +[IDSDaemonController sharedInstance];
  id v16 = [(NSSet *)v12 allObjects];
  uint64_t v17 = [(NSSet *)v14 allObjects];
  [v15 setRequiredCapabilities:v16 requiredLackOfCapabilities:v17 forSessionWithUniqueID:self->_uniqueID];
}

- (unsigned)sessionEndedReason
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A30064();
    }
  }
  return self->_sessionEndedReason;
}

- (void)requestActiveParticipants
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A300FC();
    }
  }
  int v6 = +[IDSDaemonController sharedInstance];
  [v6 requestActiveParticipantsForGroupSession:self->_uniqueID];
}

- (void)requestURIsForParticipantIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30194();
    }
  }
  if (!v6 || ![v6 count])
  {
    int v11 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs: request has no participants.", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_191969D64;
    block[3] = &unk_1E5728FD8;
    id v30 = v7;
    dispatch_async(queue, block);
  }
  if (self->_isInvalidated)
  {
    uint64_t v13 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "GroupSession is invalidated.", buf, 2u);
    }

    int v14 = self->_queue;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_191969E48;
    char v27 = &unk_1E5728FD8;
    id v28 = v7;
    dispatch_async(v14, &v24);
  }
  if (!self->_URIsToParticipantIDRequests)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    URIsToParticipantIDRequests = self->_URIsToParticipantIDRequests;
    self->_URIsToParticipantIDRequests = Mutable;
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v24, v25, v26, v27);
  uint64_t v18 = self->_URIsToParticipantIDRequests;
  id v19 = (void *)MEMORY[0x192FE03B0](v7);
  [(NSMutableDictionary *)v18 setObject:v19 forKey:v17];

  objc_super v20 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v6 count];
    uint64_t v22 = [(NSMutableDictionary *)self->_URIsToParticipantIDRequests count];
    *(_DWORD *)buf = 138412802;
    __int16 v32 = v17;
    __int16 v33 = 2048;
    uint64_t v34 = v21;
    __int16 v35 = 2048;
    uint64_t v36 = v22;
    _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs {id:%@, participant count:%lu, total requests :%lu}", buf, 0x20u);
  }

  v23 = +[IDSDaemonController sharedInstance];
  [v23 requestURIsForParticipantIDs:v6 withRequestID:v17 forGroupSession:self->_uniqueID];
}

- (void)registerPluginWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A30258();
    }
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AFF8]];
  if (!v8) {
    sub_191A3022C();
  }

  int v9 = +[IDSDaemonController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19196A060;
  v11[3] = &unk_1E572A590;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 forwardMethodWithReplyIsSync:0 block:v11];
}

- (void)unregisterPluginWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A3031C();
    }
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6AFF8]];
  if (!v8) {
    sub_191A302F0();
  }

  int v9 = +[IDSDaemonController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19196A1A4;
  v11[3] = &unk_1E572A590;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 forwardMethodWithReplyIsSync:0 block:v11];
}

- (void)requestEncryptionKeyForParticipants:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A303B4();
    }
  }
  uint64_t v8 = +[IDSDaemonController sharedInstance];
  [v8 requestEncryptionKeyForGroup:self->_uniqueID participants:v4];
}

- (void)_checkAndSendDataCryptor
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A3044C();
    }
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  keyMaterialCache = self->_keyMaterialCache;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_19196A700;
  v34[3] = &unk_1E572AEA8;
  v34[4] = &v35;
  [(IDSGroupEncryptionKeyMaterialCache *)keyMaterialCache enumerateCachedKeyMaterialUsingBlock:v34];
  if (!*((unsigned char *)v36 + 24))
  {
    p_super = +[IDSLogging _IDSGroupSession];
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v23 = "No local key material found. Skip completion handler udpate.";
LABEL_23:
    _os_log_impl(&dword_19190B000, p_super, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    goto LABEL_24;
  }
  if (![(NSMutableArray *)self->_dataCryptorRequests count])
  {
    p_super = +[IDSLogging _IDSGroupSession];
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    v23 = "No completion handlers detected inside _dataCryptorRequests.";
    goto LABEL_23;
  }
  id v7 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(NSMutableArray *)self->_dataCryptorRequests count];
    *(_DWORD *)buf = 134217984;
    uint64_t v41 = v8;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Updating %lu completion handlers in _dataCryptorRequests", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->_dataCryptorRequests;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v13 = [v12 first];
        int v14 = [v12 second];
        id v15 = [v13 dataUsingEncoding:4];
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F6B470]) initWithEncryptionContext:v15 encryptionKeySize:32];
        uint64_t v17 = self->_keyMaterialCache;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = sub_19196A744;
        v28[3] = &unk_1E572AED0;
        id v18 = v16;
        id v29 = v18;
        [(IDSGroupEncryptionKeyMaterialCache *)v17 enumerateCachedKeyMaterialUsingBlock:v28];
        id v19 = [[IDSGroupSessionDataCryptor alloc] initWithTopic:v13 keyManager:v18];
        queue = self->_queue;
        if (queue)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19196A750;
          block[3] = &unk_1E5729880;
          id v27 = v14;
          uint64_t v26 = v19;
          dispatch_async(queue, block);
        }
      }
      uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v9);
  }

  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  p_super = &self->_dataCryptorRequests->super.super;
  self->_dataCryptorRequests = v21;
LABEL_24:

  _Block_object_dispose(&v35, 8);
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A304E8();
    }
  }
  if (!v6 || ![v6 length])
  {
    int v11 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "requestDataCryptorForTopic: topic is empty!", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19196A9F8;
    block[3] = &unk_1E5728FD8;
    id v28 = v7;
    dispatch_async(queue, block);
  }
  if (self->_isInvalidated)
  {
    uint64_t v13 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "GroupSession is invalidated.", buf, 2u);
    }

    int v14 = self->_queue;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_19196AA0C;
    uint64_t v25 = &unk_1E5728FD8;
    id v26 = v7;
    dispatch_async(v14, &v22);
  }
  dataCryptorRequests = self->_dataCryptorRequests;
  if (!dataCryptorRequests)
  {
    id v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v17 = self->_dataCryptorRequests;
    self->_dataCryptorRequests = v16;

    dataCryptorRequests = self->_dataCryptorRequests;
  }
  id v18 = (void *)MEMORY[0x1E4F6C3A8];
  id v19 = objc_msgSend(v6, "copy", v22, v23, v24, v25);
  objc_super v20 = (void *)MEMORY[0x192FE03B0](v7);
  uint64_t v21 = [v18 pairWithFirst:v19 second:v20];
  [(NSMutableArray *)dataCryptorRequests addObject:v21];

  [(_IDSGroupSession *)self _checkAndSendDataCryptor];
}

- (id)sessionIDAliasWithSalt:(id)a3
{
  return (id)IDSIDAliasHashUUIDString();
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F6C3A8];
  int v9 = NSNumber;
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 numberWithUnsignedLongLong:a3];
  id v15 = [v8 pairWithFirst:v12 second:v11];

  uint64_t v13 = (void *)MEMORY[0x192FE03B0](v10);
  [(NSMutableDictionary *)self->_createParticipantIDAliasCallbacks setObject:v13 forKeyedSubscript:v15];

  int v14 = +[IDSDaemonController sharedInstance];
  [v14 createAliasForParticipantID:a3 salt:v11 sessionID:self->_uniqueID];
}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F6C3A8];
  int v9 = NSNumber;
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 numberWithUnsignedLongLong:a3];
  id v15 = [v8 pairWithFirst:v12 second:v11];

  uint64_t v13 = (void *)MEMORY[0x192FE03B0](v10);
  [(NSMutableDictionary *)self->_getParticipantIDForAliasCallbacks setObject:v13 forKeyedSubscript:v15];

  int v14 = +[IDSDaemonController sharedInstance];
  [v14 getParticipantIDForAlias:a3 salt:v11 sessionID:self->_uniqueID];
}

- (void)createSessionIDAliasWithSalt:(id)a3 delegateQueueCompletionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30580();
    }
  }
  id v11 = IDSIDAliasHashUUIDString();
  id v12 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = uniqueID;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "createSessionIDAliasWithSalt(async) created %@ from %@ and %@", buf, 0x20u);
  }

  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19196ADE8;
  v17[3] = &unk_1E5729880;
  id v18 = v11;
  id v19 = v7;
  id v15 = v11;
  id v16 = v7;
  dispatch_async(queue, v17);
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 delegateQueueCompletionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A30618();
    }
  }
  uint64_t v13 = IDSIDAliasHashUInt64();
  int v14 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = v13;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID(async) created %llu from %llu and %@", buf, 0x20u);
  }

  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_19196AFBC;
  v17[3] = &unk_1E572AEF8;
  id v18 = v9;
  uint64_t v19 = v13;
  id v16 = v9;
  dispatch_async(queue, v17);
}

- (void)createAliasForLocalParticipantIDWithSalt:(id)a3 delegateQueueCompletionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A306B0();
    }
  }
  uint64_t v11 = IDSIDAliasHashUInt64();
  id v12 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t localParticipantID = self->_localParticipantID;
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    unint64_t v22 = localParticipantID;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "createAliasForLocalParticipantIDWithSalt(async) created %llu from %llu and %@", buf, 0x20u);
  }

  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_19196B190;
  v16[3] = &unk_1E572AEF8;
  id v17 = v7;
  uint64_t v18 = v11;
  id v15 = v7;
  dispatch_async(queue, v16);
}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 delegateQueueCompletionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A30748();
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F6C3A8];
  int v14 = [NSNumber numberWithUnsignedLongLong:a3];
  id v15 = [v13 pairWithFirst:v14 second:v8];

  id v16 = (void *)MEMORY[0x1E4F6C3A8];
  id v17 = (void *)MEMORY[0x192FE03B0](v9);

  uint64_t v18 = [v16 pairWithFirst:v15 second:v17];

  [(NSMutableArray *)self->_getParticipantIDForAliasDelegateQueueCallbacks addObject:v18];
  uint64_t v19 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    getParticipantIDForAliasDelegateQueueCallbacks = self->_getParticipantIDForAliasDelegateQueueCallbacks;
    int v22 = 138412546;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = getParticipantIDForAliasDelegateQueueCallbacks;
    _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "getParticipantIDForAlias(async) added %@ to %@", (uint8_t *)&v22, 0x16u);
  }

  __int16 v21 = +[IDSDaemonController sharedInstance];
  [v21 getParticipantIDForAlias:a3 salt:v8 sessionID:self->_uniqueID];
}

- (void)setCallScreeningMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    uniqueID = self->_uniqueID;
    if (v3) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = uniqueID;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "setCallScreeningMode:%@ for session:%@", buf, 0x16u);
  }

  if (self->_callScreeningMode != v3)
  {
    self->_callScreeningMode = v3;
    id v8 = +[IDSDaemonController sharedInstance];
    [v8 setQuickRelayUserTypeForSession:self->_uniqueID withUserType:v3];

    if (!v3)
    {
      id v9 = +[IDSDaemonController sharedInstance];
      [v9 enableP2PlinksForSession:self->_uniqueID];

      fromID = self->_fromID;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&fromID count:1];
      [(_IDSGroupSession *)self manageDesignatedMembers:v10 withType:13];
    }
  }
}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    uniqueID = self->_uniqueID;
    if (v3) {
      id v6 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = uniqueID;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "setForceTCPFallbackOnWiFiUsingReinitiate:%@ for session:%@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[IDSDaemonController sharedInstance];
  [v8 setForceTCPFallbackOnWiFiUsingReinitiate:v3 forSessionWithUniqueID:self->_uniqueID];
}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    uniqueID = self->_uniqueID;
    if (v3) {
      id v6 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = uniqueID;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "setForceTCPFallbackOnCellUsingReinitiate:%@ for session:%@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[IDSDaemonController sharedInstance];
  [v8 setForceTCPFallbackOnCellUsingReinitiate:v3 forSessionWithUniqueID:self->_uniqueID];
}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A307E0();
    }
  }
  __int16 v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Session %@ received report", buf, 0xCu);
  }

  id v12 = (void *)[(NSString *)v6 copy];
  uint64_t v13 = [v7 description];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  int v22 = sub_19196B9A8;
  __int16 v23 = &unk_1E57291B8;
  id v14 = v12;
  id v24 = v14;
  id v15 = v13;
  id v25 = v15;
  cut_dispatch_log_queue();
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_19196BA64;
    v18[3] = &unk_1E572AF20;
    v18[4] = self;
    id v19 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v18];
  }
  else
  {
    uint64_t v16 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v27 = uniqueID;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveReport, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)groupSessionDidInitialize:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30878();
    }
  }
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_19196BC9C;
    v13[3] = &unk_1E572AF20;
    v13[4] = self;
    id v14 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v13];
  }
  else
  {
    __int16 v11 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      uint64_t v18 = uniqueID;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidJoinGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)groupSessionDidTerminate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = (NSString *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A30910();
    }
  }
  char v8 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v4];
  int v9 = +[IDSLogging _IDSGroupSession];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Group session %@ was terminated", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19196BEE4;
    v12[3] = &unk_1E572AF48;
    v12[4] = self;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v12];
  }
  else
  {
    if (v10)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v14 = uniqueID;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring group session termination, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)groupSessionDidConnectUnderlyingLinks:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = (NSString *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A309A8();
    }
  }
  char v8 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v4];
  int v9 = +[IDSLogging _IDSGroupSession];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "groupSessionDidConnectUnderlyingLinks:%@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19196C128;
    v12[3] = &unk_1E572AF48;
    v12[4] = self;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v12];
  }
  else
  {
    if (v10)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v14 = uniqueID;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring group session termination, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)groupSessionDidDisconnectUnderlyingLinks:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = (NSString *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A30A40();
    }
  }
  char v8 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v4];
  int v9 = +[IDSLogging _IDSGroupSession];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "groupSessionDidDisconnectUnderlyingLinks:%@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19196C36C;
    v12[3] = &unk_1E572AF48;
    v12[4] = self;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v12];
  }
  else
  {
    if (v10)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v14 = uniqueID;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring group session termination, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v8 = (NSString *)a3;
  int v9 = (NSString *)a5;
  BOOL v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A30AD8();
    }
  }
  uint64_t v13 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    __int16 v23 = v9;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Group session ended %@ with error: %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    [(_IDSGroupSession *)self _cleanupSocketPairConnections];
    self->_state = 2;
    if (a4 <= 1) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = a4;
    }
    self->_sessionEndedReason = v14;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_19196C61C;
    v17[3] = &unk_1E572AF70;
    void v17[4] = self;
    unsigned int v19 = a4;
    uint64_t v18 = v9;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    __int16 v15 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = uniqueID;
      __int16 v22 = 2112;
      __int16 v23 = v8;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring group session ended, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)sessionDidJoinGroup:(id)a3 participantInfo:(id)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v8 = (_IDSGroupSession *)a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A30B70();
    }
  }
  self->_state = 1;
  unsigned int v14 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v31 = v8;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Did join group session %@", buf, 0xCu);
  }

  __int16 v15 = (void *)[(_IDSGroupSession *)v8 copy];
  uint64_t v16 = [v9 description];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_19196C974;
  id v27 = &unk_1E57291B8;
  id v17 = v15;
  id v28 = v17;
  id v18 = v16;
  id v29 = v18;
  cut_dispatch_log_queue();
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_19196CA30;
    v21[3] = &unk_1E572AF98;
    v21[4] = self;
    id v22 = v9;
    id v23 = v10;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v21];
  }
  else
  {
    unsigned int v19 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      long long v31 = self;
      __int16 v32 = 2112;
      long long v33 = uniqueID;
      __int16 v34 = 2112;
      uint64_t v35 = v8;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidJoinGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)sessionDidJoinGroup:(id)a3 participantUpdateDictionary:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v8 = (_IDSGroupSession *)a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  int v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A30C08();
    }
  }
  self->_state = 1;
  unsigned int v14 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Did join group session %@, participantUpdate %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    __int16 v15 = [(NSString *)v9 objectForKey:@"IDSGroupSessionParticipantUpdateParticipantIdentifierKey"];
    uint64_t v16 = v15;
    if (v15)
    {
      self->_unint64_t localParticipantID = [v15 unsignedLongLongValue];
      id v17 = +[IDSLogging _IDSGroupSession];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t localParticipantID = self->_localParticipantID;
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = (_IDSGroupSession *)localParticipantID;
        _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "Received localParticipantID: %llu", buf, 0xCu);
      }
    }
    unsigned int v19 = (void *)[objc_alloc(MEMORY[0x1E4F6B490]) initWithDictionaryRepresentation:v9];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_19196CD8C;
    v22[3] = &unk_1E572AF98;
    v22[4] = self;
    id v23 = v19;
    id v24 = v10;
    id v20 = v19;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v22];
  }
  else
  {
    uint64_t v16 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      uint64_t v26 = self;
      __int16 v27 = 2112;
      id v28 = uniqueID;
      __int16 v29 = 2112;
      uint64_t v30 = v8;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidJoinGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = (_IDSGroupSession *)a3;
  id v7 = a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30CA0();
    }
  }
  int v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Did leave group session %@", buf, 0xCu);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19196D138;
    v14[3] = &unk_1E572AF20;
    v14[4] = self;
    id v15 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    int v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      id v17 = self;
      __int16 v18 = 2112;
      unsigned int v19 = uniqueID;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidLeaveGroup {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 participantDidJoinGroupWithInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = (_IDSGroupSession *)a3;
  id v7 = (NSString *)a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30D38();
    }
  }
  int v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    unsigned int v19 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "ParticipantDidJoin group session %@, participantInfo %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19196D3D0;
    v14[3] = &unk_1E572AF20;
    v14[4] = self;
    id v15 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    int v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      id v17 = self;
      __int16 v18 = 2112;
      unsigned int v19 = uniqueID;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring participantDidJoinGroupWithInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 participantDidLeaveGroupWithInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = (_IDSGroupSession *)a3;
  id v7 = (NSString *)a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30DD0();
    }
  }
  int v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    unsigned int v19 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "ParticipantDidLeave group session %@, participantInfo %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19196D668;
    v14[3] = &unk_1E572AF20;
    v14[4] = self;
    id v15 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    int v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      id v17 = self;
      __int16 v18 = 2112;
      unsigned int v19 = uniqueID;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring participantDidLeaveGroupWithInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A30E68();
    }
  }
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v28 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          unsigned int v19 = (void *)[objc_alloc(MEMORY[0x1E4F6B480]) initWithDictionaryRepresentation:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v16);
    }

    __int16 v20 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v13 count];
      *(_DWORD *)buf = 134218242;
      v44 = (_IDSGroupSession *)v21;
      __int16 v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "didReceiveActiveParticipants: count %lu for group session: %@", buf, 0x16u);
    }

    uint64_t v22 = [v13 description];
    id v23 = (void *)[(NSString *)v8 copy];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    __int16 v34 = sub_19196DA88;
    uint64_t v35 = &unk_1E57291B8;
    id v36 = v22;
    id v37 = v23;
    id v24 = v23;
    uint64_t v25 = v22;
    cut_dispatch_log_queue();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_19196DB44;
    v29[3] = &unk_1E572AFC0;
    v29[4] = self;
    id v30 = v13;
    BOOL v31 = a5;
    id v26 = v13;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v29];

    id v9 = v28;
  }
  else
  {
    uint64_t v25 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v44 = self;
      __int16 v45 = 2112;
      v46 = uniqueID;
      __int16 v47 = 2112;
      id v48 = v8;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveActiveParticipants {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A30F00();
    }
  }
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v28 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          unsigned int v19 = (void *)[objc_alloc(MEMORY[0x1E4F6B480]) initWithDictionaryRepresentation:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v16);
    }

    __int16 v20 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v13 count];
      *(_DWORD *)buf = 134218242;
      v44 = (_IDSGroupSession *)v21;
      __int16 v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_19190B000, v20, OS_LOG_TYPE_DEFAULT, "didReceiveActiveLightweightParticipants: count %lu for group session: %@", buf, 0x16u);
    }

    uint64_t v22 = [v13 description];
    id v23 = (void *)[(NSString *)v8 copy];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    __int16 v34 = sub_19196DF68;
    uint64_t v35 = &unk_1E57291B8;
    id v36 = v22;
    id v37 = v23;
    id v24 = v23;
    uint64_t v25 = v22;
    cut_dispatch_log_queue();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_19196E024;
    v29[3] = &unk_1E572AFC0;
    v29[4] = self;
    id v30 = v13;
    BOOL v31 = a5;
    id v26 = v13;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v29];

    id v9 = v28;
  }
  else
  {
    uint64_t v25 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      v44 = self;
      __int16 v45 = 2112;
      v46 = uniqueID;
      __int16 v47 = 2112;
      id v48 = v8;
      _os_log_impl(&dword_19190B000, v25, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveActiveLightweightParticipants {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = (_IDSGroupSession *)a3;
  id v7 = (NSString *)a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A30F98();
    }
  }
  int v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    unsigned int v19 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "didRegisterPluginAllocationInfo for session: %@, sessionInfo: %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19196E2C0;
    v14[3] = &unk_1E572AF20;
    v14[4] = self;
    uint64_t v15 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    int v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      unsigned int v19 = uniqueID;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring didRegisterPluginAllocationInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = (_IDSGroupSession *)a3;
  id v7 = (NSString *)a4;
  char v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A31030();
    }
  }
  int v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    unsigned int v19 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "didUnregisterPluginAllocationInfo for session: %@, sessionInfo: %@", buf, 0x16u);
  }

  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_19196E558;
    v14[3] = &unk_1E572AF20;
    v14[4] = self;
    uint64_t v15 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    int v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      unsigned int v19 = uniqueID;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring didUnregisterPluginAllocationInfo {self:%p, _uniqueID:%@, identifier:%@}", buf, 0x20u);
    }
  }
}

- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  BOOL v7 = a7;
  int v8 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v12 = (NSString *)a3;
  id v13 = a4;
  id v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A310C8();
    }
  }
  char v17 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v12];
  __int16 v18 = +[IDSLogging _IDSGroupSession];
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      __int16 v20 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v28 = v12;
      if (v7) {
        __int16 v20 = @"YES";
      }
      __int16 v29 = 1024;
      *(_DWORD *)id v30 = a5;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v8;
      __int16 v31 = 2112;
      uint64_t v32 = v20;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, type: %u, isTruncated: %@, didReceiveBlockedParticipantIDs: %@", buf, 0x2Cu);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_19196E828;
    v22[3] = &unk_1E572AFE8;
    v22[4] = self;
    id v23 = v13;
    unsigned int v24 = a5;
    __int16 v25 = v8;
    BOOL v26 = v7;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v22];
  }
  else
  {
    if (v19)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v28 = uniqueID;
      __int16 v29 = 2112;
      *(void *)id v30 = v12;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveBlockedParticipantIDs, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveQueryBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 isTruncated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = (NSString *)a3;
  id v11 = a4;
  int v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A31160();
    }
  }
  char v15 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v10];
  uint64_t v16 = +[IDSLogging _IDSGroupSession];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      __int16 v18 = @"NO";
      *(_DWORD *)buf = 138413058;
      __int16 v26 = 1024;
      __int16 v25 = v10;
      if (v6) {
        __int16 v18 = @"YES";
      }
      *(_DWORD *)__int16 v27 = a5;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v18;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, isTruncated: %@, didReceiveQueryBlockedParticipantIDs: %@", buf, 0x26u);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_19196EB38;
    v20[3] = &unk_1E572B010;
    v20[4] = self;
    id v21 = v11;
    unsigned int v22 = a5;
    BOOL v23 = v6;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v20];
  }
  else
  {
    if (v17)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      __int16 v25 = uniqueID;
      __int16 v26 = 2112;
      *(void *)__int16 v27 = v10;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveQueryBlockedParticipantIDs, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didRemoveParticipantIDs:(id)a4 withCode:(unsigned int)a5 isTruncated:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = (NSString *)a3;
  id v11 = a4;
  int v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A311F8();
    }
  }
  char v15 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v10];
  uint64_t v16 = +[IDSLogging _IDSGroupSession];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      __int16 v18 = @"NO";
      *(_DWORD *)buf = 138413058;
      __int16 v26 = 1024;
      __int16 v25 = v10;
      if (v6) {
        __int16 v18 = @"YES";
      }
      *(_DWORD *)__int16 v27 = a5;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v18;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, isTruncated: %@, didRemoveParticipantIDs: %@", buf, 0x26u);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_19196EE00;
    v20[3] = &unk_1E572B010;
    v20[4] = self;
    id v21 = v11;
    unsigned int v22 = a5;
    BOOL v23 = v6;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v20];
  }
  else
  {
    if (v17)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      __int16 v25 = uniqueID;
      __int16 v26 = 2112;
      *(void *)__int16 v27 = v10;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didRemoveParticipantIDs, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 rejectedKeyRecoveryRequestFromURI:(id)a4 reason:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A31290();
    }
  }
  int v13 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 1024;
    unsigned int v23 = a5;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Group session %@ rejectedKeyRecoveryRequestFromURI: %@, reason: %u", buf, 0x1Cu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_19196F034;
  v15[3] = &unk_1E572AF70;
  v15[4] = self;
  id v16 = v9;
  unsigned int v17 = a5;
  id v14 = v9;
  [(_IDSGroupSession *)self _callDelegateWithBlock:v15];
}

- (void)session:(id)a3 didReceiveKeyMaterial:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (_IDSGroupSession *)a3;
  BOOL v7 = (NSString *)a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A31328();
    }
  }
  if (([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6] & 1) == 0)
  {
    int v12 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 134218498;
      __int16 v33 = self;
      __int16 v34 = 2112;
      uint64_t v35 = uniqueID;
      __int16 v36 = 2112;
      id v37 = v6;
      __int16 v22 = "Ignoring group session didReceiveKeyMaterial {self:%p, _uniqueID:%@, identifier:%@}";
      unsigned int v23 = v12;
      uint32_t v24 = 32;
LABEL_21:
      _os_log_impl(&dword_19190B000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    }
LABEL_22:

    goto LABEL_23;
  }
  keyMaterialCache = self->_keyMaterialCache;
  int v12 = +[IDSLogging _IDSGroupSession];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!keyMaterialCache)
  {
    if (v13)
    {
      __int16 v25 = self->_uniqueID;
      *(_DWORD *)buf = 138412290;
      __int16 v33 = (_IDSGroupSession *)v25;
      __int16 v22 = "Can't store key material for session %@";
      unsigned int v23 = v12;
      uint32_t v24 = 12;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v13)
  {
    *(_DWORD *)buf = 138412546;
    __int16 v33 = v6;
    __int16 v34 = 2112;
    uint64_t v35 = v7;
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Group session %@ didReceiveKeyMaterial SKM: %@", buf, 0x16u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v7;
  uint64_t v15 = [(NSString *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = self->_keyMaterialCache;
        __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F6B478]) initWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [(IDSGroupEncryptionKeyMaterialCache *)v19 recvKeyMaterial:v20];
      }
      uint64_t v16 = [(NSString *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_19196F3D4;
  v26[3] = &unk_1E572AF48;
  v26[4] = self;
  [(_IDSGroupSession *)self _callDelegateWithBlock:v26];
  [(_IDSGroupSession *)self _checkAndSendDataCryptor];
LABEL_23:
}

- (void)session:(id)a3 shouldInvalidateKeyMaterialByKeyIndexes:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  int v9 = [v8 assertQueueIsCurrent];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_191A313C0();
    }
  }
  int v11 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uniqueID = self->_uniqueID;
    int v20 = 138412546;
    id v21 = uniqueID;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "shouldInvalidateKeyMaterialByKeyIndexes for session %@, expiredKeyIndexes: %@", (uint8_t *)&v20, 0x16u);
  }

  if (([(NSString *)self->_uniqueID isEqualToIgnoringCase:v6] & 1) == 0)
  {
    id v14 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = self->_uniqueID;
      int v20 = 138412546;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v6;
      uint64_t v16 = "Ignoring group session shouldInvalidateKeyMaterialByKeyIndexes, session doesn't match %@ vs. %@";
      uint64_t v17 = v14;
      uint32_t v18 = 22;
LABEL_14:
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, v18);
    }
LABEL_15:

    goto LABEL_16;
  }
  keyMaterialCache = self->_keyMaterialCache;
  if (!keyMaterialCache)
  {
    id v14 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = self->_uniqueID;
      int v20 = 138412290;
      id v21 = v19;
      uint64_t v16 = "Can't store key material for session %@";
      uint64_t v17 = v14;
      uint32_t v18 = 12;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  [(IDSGroupEncryptionKeyMaterialCache *)keyMaterialCache invalidateKeyMaterialByKeyIndexes:v7];
LABEL_16:
}

- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5
{
  int v6 = a4;
  *(void *)&v25[13] = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A31458();
    }
  }
  char v13 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v8];
  id v14 = +[IDSLogging _IDSGroupSession];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = v6;
      v25[2] = 2112;
      *(void *)&v25[3] = v9;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "sessionDidReceiveParticipantUpgrade %@, type: %u, error: %@", buf, 0x1Cu);
    }

    if (v9)
    {
      self->_isLightweightParticipant = v6 != 0;
      uint64_t v16 = +[IDSLogging _IDSGroupSession];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = @"YES";
        if (!self->_isLightweightParticipant) {
          uint64_t v17 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        id v23 = v8;
        __int16 v24 = 2112;
        *(void *)__int16 v25 = v17;
        _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "sessionDidReceiveParticipantUpgrade %@, change _isLightweightParticipant to %@", buf, 0x16u);
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_19196F90C;
    v19[3] = &unk_1E572B038;
    v19[4] = self;
    __int16 v21 = v6;
    id v20 = v9;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v19];
  }
  else
  {
    if (v15)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v23 = uniqueID;
      __int16 v24 = 2112;
      *(void *)__int16 v25 = v8;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring sessionDidReceiveParticipantUpgrade, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A314F0();
    }
  }
  char v13 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v8];
  id v14 = +[IDSLogging _IDSGroupSession];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412802;
      __int16 v21 = v8;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "didReceiveJoinedParticipantID identifier: %@, participantID: %llu, clientContext: %@", buf, 0x20u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_19196FBA0;
    v17[3] = &unk_1E572B060;
    void v17[4] = self;
    unint64_t v19 = a4;
    id v18 = v9;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    if (v15)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      __int16 v21 = uniqueID;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v8;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveJoinedParticipantID, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  id v9 = a5;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A31588();
    }
  }
  char v13 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v8];
  id v14 = +[IDSLogging _IDSGroupSession];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412802;
      __int16 v21 = v8;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "didReceiveLeftParticipantID identifier: %@, participantID: %llu, clientContext: %@", buf, 0x20u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_19196FE30;
    v17[3] = &unk_1E572B060;
    void v17[4] = self;
    unint64_t v19 = a4;
    id v18 = v9;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v17];
  }
  else
  {
    if (v15)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      __int16 v21 = uniqueID;
      __int16 v22 = 2112;
      unint64_t v23 = (unint64_t)v8;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveLeftParticipantID, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6
{
  int v6 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = (NSString *)a3;
  id v11 = a4;
  int v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A31620();
    }
  }
  char v15 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v10];
  uint64_t v16 = +[IDSLogging _IDSGroupSession];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138413058;
      __int16 v24 = v10;
      __int16 v25 = 1024;
      *(_DWORD *)uint64_t v26 = a5;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v6;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Group session %@ code: %u, type: %u, didReceiveParticipantIDs: %@", buf, 0x22u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1919700D8;
    v19[3] = &unk_1E572B088;
    v19[4] = self;
    id v20 = v11;
    unsigned int v21 = a5;
    __int16 v22 = v6;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v19];
  }
  else
  {
    if (v17)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      __int16 v24 = uniqueID;
      __int16 v25 = 2112;
      *(void *)uint64_t v26 = v10;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveParticipantIDs:withCode:managementType:, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveURIsForParticipantIDs:(id)a4 withRequestID:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    int v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A316B8();
    }
  }
  char v14 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v8];
  uint64_t v15 = +[IDSLogging _IDSGroupSession];
  BOOL v16 = os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v18 = 138412546;
      unint64_t v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = [v9 count];
      _os_log_impl(&dword_19190B000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Group session %@ didReceiveURIsForParticipantIDs: count:%lu", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v15 = [(NSMutableDictionary *)self->_URIsToParticipantIDRequests objectForKeyedSubscript:v10];
    if (v15)
    {
      [(NSMutableDictionary *)self->_URIsToParticipantIDRequests removeObjectForKey:v10];
      (*(void (**)(uint64_t, id, void))(v15 + 16))(v15, v9, 0);
    }
  }
  else if (v16)
  {
    uniqueID = self->_uniqueID;
    int v18 = 138412546;
    unint64_t v19 = uniqueID;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v8;
    _os_log_impl(&dword_19190B000, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveURIsForParticipantIDs:, session doesn't match %@ vs. %@", (uint8_t *)&v18, 0x16u);
  }
}

- (void)participantUpdatedForSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = (NSString *)a3;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A31750();
    }
  }
  char v8 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v4];
  id v9 = +[IDSLogging _IDSGroupSession];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      char v14 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "participantUpdatedForSession %@", buf, 0xCu);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191970518;
    v12[3] = &unk_1E572AF48;
    v12[4] = self;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v12];
  }
  else
  {
    if (v10)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      char v14 = uniqueID;
      __int16 v15 = 2112;
      BOOL v16 = v4;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring group session participantUpdated, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 hasOutdatedSKI:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  BOOL v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A317E8();
    }
  }
  char v8 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_19190B000, v8, OS_LOG_TYPE_DEFAULT, "hasOutdatedSKI %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)session:(id)a3 didCreateParticipantIDAlias:(unint64_t)a4 forParticipantID:(unint64_t)a5 salt:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = +[IDSInternalQueueController sharedInstance];
  int v11 = [v10 assertQueueIsCurrent];

  if (v11)
  {
    int v12 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_191A31880();
    }
  }
  int v13 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218498;
    unint64_t v20 = a4;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2048;
    unint64_t v24 = a5;
    _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "didCreateParticipantIDAlias %llu salt %@ participantID %llu", (uint8_t *)&v19, 0x20u);
  }

  char v14 = (void *)MEMORY[0x1E4F6C3A8];
  __int16 v15 = [NSNumber numberWithUnsignedLongLong:a5];
  BOOL v16 = [v14 pairWithFirst:v15 second:v9];

  uint64_t v17 = [(NSMutableDictionary *)self->_createParticipantIDAliasCallbacks objectForKeyedSubscript:v16];
  int v18 = (void *)v17;
  if (v17)
  {
    (*(void (**)(uint64_t, unint64_t))(v17 + 16))(v17, a4);
    [(NSMutableDictionary *)self->_createParticipantIDAliasCallbacks setObject:0 forKeyedSubscript:v16];
  }
}

- (void)session:(id)a3 didReceiveParticipantID:(unint64_t)a4 forParticipantIDAlias:(unint64_t)a5 salt:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = +[IDSInternalQueueController sharedInstance];
  int v13 = [v12 assertQueueIsCurrent];

  if (v13)
  {
    char v14 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_191A31918();
    }
  }
  __int16 v15 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v34 = a5;
    _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "didReceiveParticipantID %llu salt %@ participantIDAlias %llu", buf, 0x20u);
  }

  BOOL v16 = (void *)MEMORY[0x1E4F6C3A8];
  uint64_t v17 = [NSNumber numberWithUnsignedLongLong:a5];
  int v18 = [v16 pairWithFirst:v17 second:v11];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v34) = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  getParticipantIDForAliasDelegateQueueCallbacks = self->_getParticipantIDForAliasDelegateQueueCallbacks;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_191970B20;
  v23[3] = &unk_1E572B0B0;
  id v20 = v18;
  id v24 = v20;
  uint64_t v25 = self;
  __int16 v27 = &v29;
  unint64_t v28 = a4;
  uint64_t v26 = buf;
  [(NSMutableArray *)getParticipantIDForAliasDelegateQueueCallbacks enumerateObjectsUsingBlock:v23];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [(NSMutableArray *)self->_getParticipantIDForAliasDelegateQueueCallbacks removeObjectAtIndex:v30[3]];
  }
  else
  {
    uint64_t v21 = [(NSMutableDictionary *)self->_getParticipantIDForAliasCallbacks objectForKeyedSubscript:v20];
    id v22 = (void *)v21;
    if (v21) {
      (*(void (**)(uint64_t, unint64_t))(v21 + 16))(v21, a4);
    }
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);
}

- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v8 = (NSString *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsCurrent];

  if (v12)
  {
    int v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A319B4();
    }
  }
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v8])
  {
    char v14 = (NSString *)[objc_alloc(MEMORY[0x1E4F6B480]) initWithDictionaryRepresentation:v10];
    __int16 v15 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_19190B000, v15, OS_LOG_TYPE_DEFAULT, "session %@ participant: %@, didReceiveDataBlob: %@", buf, 0x20u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_191970E98;
    v18[3] = &unk_1E572AF98;
    v18[4] = self;
    id v19 = v9;
    id v20 = v14;
    BOOL v16 = v14;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v18];
  }
  else
  {
    BOOL v16 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      id v22 = uniqueID;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveDataBlob, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  int v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = (NSString *)a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = +[IDSInternalQueueController sharedInstance];
  int v14 = [v13 assertQueueIsCurrent];

  if (v14)
  {
    __int16 v15 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_191A31A4C();
    }
  }
  if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v10])
  {
    BOOL v16 = (NSString *)[objc_alloc(MEMORY[0x1E4F6B480]) initWithDictionaryRepresentation:v12];
    uint64_t v17 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v25 = v10;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 1024;
      int v29 = v7;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "session %@ participant: %@, type: %u, didReceiveData: %@", buf, 0x26u);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_191971188;
    v20[3] = &unk_1E572B0D8;
    v20[4] = self;
    __int16 v23 = v7;
    id v21 = v11;
    id v22 = v16;
    int v18 = v16;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v20];
  }
  else
  {
    int v18 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      __int16 v25 = uniqueID;
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveData:dataType:forParticipant, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v6 = (NSString *)a3;
  int v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A31AE4();
    }
  }
  char v10 = [(NSString *)self->_uniqueID isEqualToIgnoringCase:v6];
  id v11 = +[IDSLogging _IDSGroupSession];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v6;
      __int16 v18 = 1024;
      LODWORD(v19) = a4;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "session %@ didReceiveServerErrorCode: %u", buf, 0x12u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1919713F0;
    v14[3] = &unk_1E572B100;
    v14[4] = self;
    unsigned int v15 = a4;
    [(_IDSGroupSession *)self _callDelegateWithBlock:v14];
  }
  else
  {
    if (v12)
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = uniqueID;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring group session didReceiveServerErrorCode, session doesn't match %@ vs. %@", buf, 0x16u);
    }
  }
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  id v7 = a4;
  int v8 = [v7 objectForKey:@"object-type"];
  int v9 = [v8 isEqualToIgnoringCase:@"session-device-socket"];

  if (v9)
  {
    char v10 = +[IDSLogging _IDSGroupSession];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      BOOL v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19190B000, v10, OS_LOG_TYPE_DEFAULT, "xpc object: [%@] context: [%@]", (uint8_t *)&v15, 0x16u);
    }

    id v11 = [v7 objectForKey:@"sessionID"];
    if ([(NSString *)self->_uniqueID isEqualToIgnoringCase:v11])
    {
      if (v6) {
        xpc_fd_dup(v6);
      }
      [(_IDSGroupSession *)self _cleanupSocketPairConnections];
      BOOL v12 = [v7 objectForKey:@"error"];
      int v13 = +[IDSLogging _IDSGroupSession];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        BOOL v16 = v12;
        _os_log_impl(&dword_19190B000, v13, OS_LOG_TYPE_DEFAULT, "Received XPC Response Error: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      BOOL v12 = +[IDSLogging _IDSGroupSession];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uniqueID = self->_uniqueID;
        int v15 = 138412546;
        BOOL v16 = uniqueID;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring socket, session doesn't match %@ vs. %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (id)keyValueDelivery
{
  return (id)MEMORY[0x1F4181798](_IDSGroupSession, sel_keyValueDeliveryForSessionID_);
}

+ (id)keyValueDeliveryForSessionID:(id)a3
{
  id v3 = a3;
  id v4 = [[IDSGroupSessionKeyValueDelivery alloc] initWithSessionID:v3];

  return v4;
}

+ (void)keyValueDeliveryForSessionID:(id)a3 completionHandler:(id)a4
{
}

- (void)emptyXPCReply
{
  v2 = +[IDSLogging _IDSGroupSession];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_19190B000, v2, OS_LOG_TYPE_DEFAULT, "received empty XPC reply", v3, 2u);
  }
}

- (void)setUniqueID:(id)a3
{
}

- (void)setKeyMaterialCache:(id)a3
{
}

- (id)getDestinations
{
  return self->_destinations;
}

- (id)getDestinationsLightweightStatusDict
{
  return self->_destinationsLightweightStatus;
}

- (id)getURIsToParticipantIDRequests
{
  return self->_URIsToParticipantIDRequests;
}

- (unsigned)state
{
  return self->_state;
}

- (id)boostContext
{
  return self->_boostContext;
}

- (void)setBoostContext:(id)a3
{
}

- (unint64_t)localParticipantID
{
  return self->_localParticipantID;
}

- (NSSet)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSSet)requiredLackOfCapabilities
{
  return self->_requiredLackOfCapabilities;
}

- (BOOL)isLightweightParticipant
{
  return self->_isLightweightParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredLackOfCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_getParticipantIDForAliasDelegateQueueCallbacks, 0);
  objc_storeStrong((id *)&self->_getParticipantIDForAliasCallbacks, 0);
  objc_storeStrong((id *)&self->_createParticipantIDAliasCallbacks, 0);
  objc_storeStrong((id *)&self->_URIsToParticipantIDRequests, 0);
  objc_storeStrong((id *)&self->_dataCryptorRequests, 0);
  objc_storeStrong((id *)&self->_keyMaterialCache, 0);
  objc_storeStrong((id *)&self->_previousError, 0);
  objc_storeStrong((id *)&self->_qrReason, 0);
  objc_storeStrong((id *)&self->_joinLeaveError, 0);
  objc_storeStrong((id *)&self->_existingParticipants, 0);
  objc_storeStrong((id *)&self->_participantInfo, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_stableGroupID, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_unreliableSocketPairConnection, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_destinationsLightweightStatus, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong(&self->_boostContext, 0);

  objc_storeStrong(&self->_delegateContext, 0);
}

@end