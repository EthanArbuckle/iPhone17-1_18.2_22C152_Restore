@interface IDSPushHandler
+ (id)sharedInstance;
+ (id)sharedInstanceWithPortName:(id)a3;
- (APSConnection)apsConnection;
- (BOOL)_validateHandler:(id)a3 withSelector:(SEL)a4 topic:(id)a5 command:(id)a6;
- (BOOL)isConnected;
- (BOOL)shouldWaitToSetTopics;
- (IDSPushHandler)init;
- (IDSPushHandler)initWithPort:(id)a3;
- (NSData)pushToken;
- (NSString)namedDelegatePort;
- (__SecIdentity)copyPushIdentity;
- (id)_apsConnectionPushToken;
- (id)_getValidPushHandlersWithSelector:(SEL)a3 topic:(id)a4 command:(id)a5;
- (void)_powerLogEvent:(id)a3 dictionary:(id)a4;
- (void)_powerLogIncomingMessage:(id)a3 command:(id)a4 topic:(id)a5;
- (void)_recalculateTopicsCache;
- (void)_updateTopics;
- (void)addListener:(id)a3 topics:(id)a4 commands:(id)a5 queue:(id)a6;
- (void)addListener:(id)a3 wakingTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 commands:(id)a7 queue:(id)a8;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setCommands:(id)a3 forListener:(id)a4;
- (void)setNamedDelegatePort:(id)a3;
- (void)setShouldWaitToSetTopics:(BOOL)a3;
- (void)setTopics:(id)a3 forListener:(id)a4;
- (void)setUltraConstrainedTopics:(id)a3 forListener:(id)a4;
- (void)setWakingTopics:(id)a3 opportunisticTopics:(id)a4 nonWakingTopics:(id)a5 forListener:(id)a6;
- (void)subscribeToChannel:(id)a3 forTopic:(id)a4;
- (void)writePushPayloadToDiskIfEnabled:(id)a3 topic:(id)a4;
@end

@implementation IDSPushHandler

+ (id)sharedInstance
{
  if (qword_1EB2BB728 != -1) {
    dispatch_once(&qword_1EB2BB728, &unk_1EEFCD578);
  }
  v2 = (void *)qword_1EB2BB778;
  return v2;
}

+ (id)sharedInstanceWithPortName:(id)a3
{
  id v3 = a3;
  if (qword_1E944F058 != -1) {
    dispatch_once(&qword_1E944F058, &unk_1EEFCE4B8);
  }
  pthread_mutex_lock(&stru_1E944F060);
  v6 = objc_msgSend_objectForKey_((void *)qword_1E944F050, v4, (uint64_t)v3, v5);
  if (!v6)
  {
    v7 = [IDSPushHandler alloc];
    v10 = objc_msgSend_initWithPort_(v7, v8, (uint64_t)v3, v9);
    objc_msgSend_setObject_forKey_((void *)qword_1E944F050, v11, (uint64_t)v10, v12, v3);
    v6 = objc_msgSend_objectForKey_((void *)qword_1E944F050, v13, (uint64_t)v3, v14);
  }
  pthread_mutex_unlock(&stru_1E944F060);

  return v6;
}

- (IDSPushHandler)init
{
  double v5 = objc_msgSend_pushAdapter(IDSDependencyProvider, a2, v2, v3);
  double v9 = objc_msgSend_placeholderMachPort(v5, v6, v7, v8);
  double v12 = (IDSPushHandler *)objc_msgSend_initWithPort_(self, v10, (uint64_t)v9, v11);

  return v12;
}

- (IDSPushHandler)initWithPort:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IDSPushHandler;
  double v5 = [(IDSPushHandler *)&v38 init];
  if (v5)
  {
    v6 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    recursiveLock = v5->_recursiveLock;
    v5->_recursiveLock = v6;

    if (_os_feature_enabled_impl())
    {
      double v11 = (NSString *)v4;
      namedDelegatePort = v5->_namedDelegatePort;
      v5->_namedDelegatePort = v11;
    }
    else
    {
      v13 = objc_msgSend_sharedInstance(IDSServerBag, v8, v9, v10);
      namedDelegatePort = objc_msgSend_apsEnvironmentName(v13, v14, v15, v16);

      v20 = objc_msgSend_pushAdapter(IDSDependencyProvider, v17, v18, v19);
      v21 = im_primary_queue();
      uint64_t v24 = objc_msgSend_apsConnectionWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_queue_(v20, v22, (uint64_t)namedDelegatePort, v23, v4, 1, v21);
      apsConnection = v5->_apsConnection;
      v5->_apsConnection = (APSConnection *)v24;

      objc_msgSend_setDelegate_(v5->_apsConnection, v26, (uint64_t)v5, v27);
      v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend_publicToken(v5->_apsConnection, v29, v30, v31);
        *(_DWORD *)buf = 138412546;
        v40 = v32;
        __int16 v41 = 2112;
        v42 = namedDelegatePort;
        _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "Cached push token: %@   Environment: %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v37 = objc_msgSend_publicToken(v5->_apsConnection, v33, v34, v35);
        _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Cached push token: %@   Environment: %@");
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend_setDelegate_(self->_apsConnection, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)IDSPushHandler;
  [(IDSPushHandler *)&v4 dealloc];
}

- (APSConnection)apsConnection
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend_lock(self->_recursiveLock, v3, v4, v5);
    if (!self->_apsConnection)
    {
      uint64_t v9 = objc_msgSend_sharedInstance(IDSServerBag, v6, v7, v8);
      v13 = objc_msgSend_apsEnvironmentName(v9, v10, v11, v12);

      v17 = objc_msgSend_pushAdapter(IDSDependencyProvider, v14, v15, v16);
      namedDelegatePort = self->_namedDelegatePort;
      double v19 = im_primary_queue();
      objc_msgSend_apsConnectionWithEnvironmentName_namedDelegatePort_enablePushDuringSleep_queue_(v17, v20, (uint64_t)v13, v21, namedDelegatePort, 1, v19);
      v22 = (APSConnection *)objc_claimAutoreleasedReturnValue();
      apsConnection = self->_apsConnection;
      self->_apsConnection = v22;

      objc_msgSend_setDelegate_(self->_apsConnection, v24, (uint64_t)self, v25);
      v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = objc_msgSend_publicToken(self->_apsConnection, v27, v28, v29);
        *(_DWORD *)buf = 138412546;
        v39 = v30;
        __int16 v40 = 2112;
        __int16 v41 = v13;
        _os_log_impl(&dword_19D9BE000, v26, OS_LOG_TYPE_DEFAULT, "Cached push token: %@   Environment: %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v36 = objc_msgSend_publicToken(self->_apsConnection, v31, v32, v33);
        v37 = v13;
        _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Cached push token: %@   Environment: %@");
      }
    }
    objc_msgSend_unlock(self->_recursiveLock, v6, v7, v8, v36, v37);
  }
  uint64_t v34 = self->_apsConnection;
  return v34;
}

- (void)_powerLogIncomingMessage:(id)a3 command:(id)a4 topic:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_integerValue(v9, v11, v12, v13) == 255) {
    goto LABEL_24;
  }
  v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16);
  v20 = v17;
  if (v9) {
    objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v9, v19, @"CommandID");
  }
  if (v10) {
    objc_msgSend_setObject_forKeyedSubscript_(v20, v18, (uint64_t)v10, v19, @"Topic");
  }
  uint64_t v21 = objc_opt_class();
  double v23 = sub_19DA8E300(v21, v8, @"i");
  if (v23) {
    objc_msgSend_setObject_forKeyedSubscript_(v20, v22, (uint64_t)v23, v24, @"MessageIdentifier");
  }
  double v25 = objc_msgSend_objectForKey_(v8, v22, @"U", v24);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F1C9B8];
    double v29 = objc_msgSend_objectForKey_(v8, v26, @"U", v27);
    uint64_t v32 = objc_msgSend__IDSDataFromBase64String_(v28, v30, (uint64_t)v29, v31);
    uint64_t v33 = JWUUIDPushObjectToString();
  }
  else
  {
    double v29 = objc_msgSend_objectForKey_(v8, v26, @"U", v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = JWUUIDPushObjectToString();
      goto LABEL_14;
    }
    uint64_t v32 = objc_msgSend_objectForKey_(v8, v34, @"U", v35);
    uint64_t v33 = JWUUIDPushObjectToString();
  }
  v36 = (void *)v33;

LABEL_14:
  if (v36) {
    objc_msgSend_setObject_forKeyedSubscript_(v20, v37, (uint64_t)v36, v38, @"MessageGUID");
  }
  uint64_t v39 = objc_opt_class();
  __int16 v41 = sub_19DA8E300(v39, v8, @"cc");
  if (v41) {
    objc_msgSend_setObject_forKeyedSubscript_(v20, v40, (uint64_t)v41, v42, @"CommandContext");
  }
  uint64_t v43 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v20;
    _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "Logging incoming push power event: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v46 = v20;
    _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Logging incoming push power event: %@");
  }
  objc_msgSend__powerLogEvent_dictionary_(self, v44, @"IDS IncomingPushReceived", v45, v20, v46);

LABEL_24:
}

- (void)_powerLogEvent:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (qword_1E944F1A0 != -1) {
    dispatch_once(&qword_1E944F1A0, &unk_1EEFCE778);
  }
  if (off_1E944F198) {
    off_1E944F198(2, v6, v5, 0);
  }
}

- (BOOL)isConnected
{
  uint64_t v4 = objc_msgSend_apsConnection(self, a2, v2, v3);
  char isConnected = objc_msgSend_isConnected(v4, v5, v6, v7);

  return isConnected;
}

- (BOOL)_validateHandler:(id)a3 withSelector:(SEL)a4 topic:(id)a5 command:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  handlerMap = self->_handlerMap;
  id v12 = a3;
  uint64_t v15 = objc_msgSend_objectForKey_(handlerMap, v13, (uint64_t)v12, v14);
  char v16 = objc_opt_respondsToSelector();

  if (v9)
  {
    v20 = objc_msgSend_wakingTopics(v15, v17, v18, v19);
    if (objc_msgSend_containsObject_(v20, v21, @"*", v22))
    {
      char v26 = 1;
    }
    else
    {
      uint64_t v28 = objc_msgSend_wakingTopics(v15, v23, v24, v25);
      if (objc_msgSend_containsObject_(v28, v29, (uint64_t)v9, v30))
      {
        char v26 = 1;
      }
      else
      {
        uint64_t v34 = objc_msgSend_opportunisticTopics(v15, v31, v32, v33);
        if (objc_msgSend_containsObject_(v34, v35, @"*", v36))
        {
          char v26 = 1;
        }
        else
        {
          __int16 v40 = objc_msgSend_opportunisticTopics(v15, v37, v38, v39);
          if (objc_msgSend_containsObject_(v40, v41, (uint64_t)v9, v42))
          {
            char v26 = 1;
          }
          else
          {
            v46 = objc_msgSend_nonWakingTopics(v15, v43, v44, v45);
            if (objc_msgSend_containsObject_(v46, v47, @"*", v48))
            {
              char v26 = 1;
            }
            else
            {
              v58 = objc_msgSend_nonWakingTopics(v15, v49, v50, v51);
              char v26 = objc_msgSend_containsObject_(v58, v52, (uint64_t)v9, v53);
            }
          }
        }
      }
    }
    if (v10) {
      goto LABEL_20;
    }
  }
  else
  {
    char v26 = 1;
    if (v10)
    {
LABEL_20:
      v54 = objc_msgSend_commands(v15, v17, v18, v19);
      char v27 = objc_msgSend_containsObject_(v54, v55, (uint64_t)v10, v56);

      goto LABEL_21;
    }
  }
  char v27 = 1;
LABEL_21:

  return v16 & v26 & v27;
}

- (id)_getValidPushHandlersWithSelector:(SEL)a3 topic:(id)a4 command:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_msgSend_lock(self->_recursiveLock, v9, v10, v11);
  if (objc_msgSend_count(self->_handlerMap, v12, v13, v14))
  {
    objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v15, v16, v17);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v18 = self->_handlerMap;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, v20, v44, 16);
    if (v22)
    {
      uint64_t v24 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(v18);
          }
          uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v21, v26, v23, sel_selector, v7, v8))
          {
            char v27 = objc_msgSend_objectForKey_(self->_handlerMap, v21, v26, v23);
            objc_msgSend_setObject_forKey_(v39, v28, (uint64_t)v27, v29, v26);
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v40, v23, v44, 16);
      }
      while (v22);
    }
    goto LABEL_11;
  }
  double v33 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = NSStringFromSelector(sel_selector);
    *(_DWORD *)buf = 138412802;
    v46 = v34;
    __int16 v47 = 2112;
    id v48 = v7;
    __int16 v49 = 2112;
    id v50 = v8;
    _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    NSStringFromSelector(sel_selector);
    uint64_t v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    id v37 = v7;
    id v38 = v8;
    double v36 = v18;
    _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"No incoming push handler for selector: %@    topic: %@   command: %@");
    id v39 = 0;
LABEL_11:

    goto LABEL_18;
  }
  id v39 = 0;
LABEL_18:
  objc_msgSend_unlock(self->_recursiveLock, v30, v31, v32, v36, v37, v38);

  return v39;
}

- (void)_updateTopics
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x19F3AEEF0](self, a2);
  objc_msgSend_lock(self->_recursiveLock, v4, v5, v6);
  if (self->_shouldWaitToSetTopics)
  {
    objc_msgSend_unlock(self->_recursiveLock, v7, v8, v9);
  }
  else
  {
    uint64_t v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      wakingTopicsCache = self->_wakingTopicsCache;
      opportunisticTopicsCache = self->_opportunisticTopicsCache;
      nonWakingTopicsCache = self->_nonWakingTopicsCache;
      *(_DWORD *)buf = 138412802;
      long long v42 = wakingTopicsCache;
      __int16 v43 = 2112;
      uint64_t v44 = opportunisticTopicsCache;
      __int16 v45 = 2112;
      v46 = nonWakingTopicsCache;
      _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "Updating waking topics to: %@ opportunistic topics to: %@ nonWaking topics to: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        long long v40 = self->_nonWakingTopicsCache;
        long long v39 = *(_OWORD *)&self->_wakingTopicsCache;
        _IDSLogTransport(@"IDSPushHandler", @"IDS", @"Updating waking topics to: %@ opportunistic topics to: %@ nonWaking topics to: %@");
        if (_IDSShouldLog())
        {
          long long v40 = self->_nonWakingTopicsCache;
          long long v39 = *(_OWORD *)&self->_wakingTopicsCache;
          _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Updating waking topics to: %@ opportunistic topics to: %@ nonWaking topics to: %@");
        }
      }
    }
    double v17 = objc_msgSend_allObjects(self->_wakingTopicsCache, v14, v15, v16, v39, v40);
    uint64_t v21 = objc_msgSend_allObjects(self->_opportunisticTopicsCache, v18, v19, v20);
    double v25 = objc_msgSend_allObjects(self->_nonWakingTopicsCache, v22, v23, v24);
    double v29 = objc_msgSend_array(MEMORY[0x1E4F1C978], v26, v27, v28);
    objc_msgSend_unlock(self->_recursiveLock, v30, v31, v32);
    double v36 = objc_msgSend_apsConnection(self, v33, v34, v35);
    objc_msgSend_setEnabledTopics_ignoredTopics_opportunisticTopics_nonWakingTopics_(v36, v37, (uint64_t)v17, v38, v29, v21, v25);
  }
}

- (void)_recalculateTopicsCache
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self->_recursiveLock, a2, v2, v3);
  uint64_t v5 = self->_wakingTopicsCache;
  double v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  wakingTopicsCache = self->_wakingTopicsCache;
  self->_wakingTopicsCache = v6;

  uint64_t v47 = self->_opportunisticTopicsCache;
  uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  opportunisticTopicsCache = self->_opportunisticTopicsCache;
  self->_opportunisticTopicsCache = v8;

  v46 = self->_nonWakingTopicsCache;
  uint64_t v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  nonWakingTopicsCache = self->_nonWakingTopicsCache;
  self->_nonWakingTopicsCache = v10;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = self->_handlerMap;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v48, v14, v52, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v12);
        }
        uint64_t v21 = objc_msgSend_objectForKey_(self->_handlerMap, v16, *(void *)(*((void *)&v48 + 1) + 8 * i), v17, v46);
        double v25 = objc_msgSend_wakingTopics(v21, v22, v23, v24);
        objc_msgSend_unionSet_(self->_wakingTopicsCache, v26, (uint64_t)v25, v27);
        uint64_t v31 = objc_msgSend_opportunisticTopics(v21, v28, v29, v30);
        objc_msgSend_unionSet_(self->_opportunisticTopicsCache, v32, (uint64_t)v31, v33);
        id v37 = objc_msgSend_nonWakingTopics(v21, v34, v35, v36);
        objc_msgSend_unionSet_(self->_nonWakingTopicsCache, v38, (uint64_t)v37, v39);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v48, v17, v52, 16);
    }
    while (v18);
  }

  __int16 v45 = v46;
  if (!objc_msgSend_isEqualToSet_(self->_wakingTopicsCache, v40, (uint64_t)v5, v41)
    || !objc_msgSend_isEqualToSet_(self->_opportunisticTopicsCache, v42, (uint64_t)v47, v44)
    || (objc_msgSend_isEqualToSet_(self->_nonWakingTopicsCache, v42, (uint64_t)v46, v44) & 1) == 0)
  {
    objc_msgSend__updateTopics(self, v42, v43, v44, v46);
  }
  objc_msgSend_unlock(self->_recursiveLock, v42, v43, v44, v46);
}

- (void)addListener:(id)a3 topics:(id)a4 commands:(id)a5 queue:(id)a6
{
}

- (void)addListener:(id)a3 wakingTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 commands:(id)a7 queue:(id)a8
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v118 = a4;
  id v15 = a5;
  id v119 = a6;
  id v120 = a7;
  id v16 = a8;
  double v20 = v16;
  if (v14 && v16)
  {
    objc_msgSend_lock(self->_recursiveLock, v17, v18, v19);
    v117 = objc_msgSend_objectForKey_(self->_handlerMap, v21, (uint64_t)v14, v22);
    uint64_t v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_wakingTopics(v117, v24, v25, v26);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_opportunisticTopics(v117, v28, v29, v30);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_nonWakingTopics(v117, v32, v33, v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      double v39 = objc_msgSend_commands(v117, v36, v37, v38);
      *(_DWORD *)buf = 138414338;
      id v126 = v14;
      __int16 v127 = 2112;
      id v128 = v27;
      __int16 v129 = 2112;
      id v130 = v118;
      __int16 v131 = 2112;
      id v132 = v31;
      __int16 v133 = 2112;
      id v134 = v15;
      __int16 v135 = 2112;
      id v136 = v35;
      __int16 v137 = 2112;
      id v138 = v119;
      __int16 v139 = 2112;
      v140 = v39;
      __int16 v141 = 2112;
      id v142 = v120;
      _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Updating push topics for listener %@   | waking topics were %@ becoming %@ opportunistic topics were %@ becoming %@ nonwaking topics were %@ becoming %@ commands were %@ becoming %@", buf, 0x5Cu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v43 = objc_msgSend_wakingTopics(v117, v40, v41, v42);
      uint64_t v47 = objc_msgSend_opportunisticTopics(v117, v44, v45, v46);
      long long v51 = objc_msgSend_nonWakingTopics(v117, v48, v49, v50);
      v113 = objc_msgSend_commands(v117, v52, v53, v54);
      id v114 = v120;
      v111 = v51;
      id v112 = v119;
      v109 = v47;
      id v110 = v15;
      v107 = v43;
      id v108 = v118;
      id v106 = v14;
      _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Updating push topics for listener %@   | waking topics were %@ becoming %@ opportunistic topics were %@ becoming %@ nonwaking topics were %@ becoming %@ commands were %@ becoming %@");
    }
    if (!self->_handlerMap)
    {
      objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v40, v41, v42);
      v55 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      handlerMap = self->_handlerMap;
      self->_handlerMap = v55;
    }
    if (v15)
    {
      id v115 = v15;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E4F1CAD0], v40, v41, v42);
      id v115 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v118)
    {
      id v116 = v118;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E4F1CAD0], v57, v58, v59);
      id v116 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v119)
    {
      id v63 = v119;
    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E4F1CAD0], v60, v61, v62);
      id v63 = (id)objc_claimAutoreleasedReturnValue();
    }
    v64 = v63;
    v65 = [IDSPushHandlerContext alloc];
    v68 = objc_msgSend_initWithQueue_wakingTopics_opportunisticTopics_nonWakingTopics_commands_(v65, v66, (uint64_t)v20, v67, v116, v15, v64, v120);
    objc_msgSend_setObject_forKey_(self->_handlerMap, v69, (uint64_t)v68, v70, v14);
    if (v117)
    {
      objc_msgSend__recalculateTopicsCache(self, v71, v72, v73);
    }
    else
    {
      wakingTopicsCache = self->_wakingTopicsCache;
      if (!wakingTopicsCache
        || !self->_opportunisticTopicsCache
        || !self->_nonWakingTopicsCache
        || !objc_msgSend_isSubsetOfSet_(v116, v71, (uint64_t)wakingTopicsCache, v73)
        || !objc_msgSend_isSubsetOfSet_(v115, v71, (uint64_t)self->_opportunisticTopicsCache, v73)
        || (objc_msgSend_isSubsetOfSet_(v64, v71, (uint64_t)self->_nonWakingTopicsCache, v73) & 1) == 0)
      {
        opportunisticTopicsCache = self->_opportunisticTopicsCache;
        if (!opportunisticTopicsCache)
        {
          v77 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v78 = self->_opportunisticTopicsCache;
          self->_opportunisticTopicsCache = v77;

          opportunisticTopicsCache = self->_opportunisticTopicsCache;
        }
        objc_msgSend_unionSet_(opportunisticTopicsCache, v71, (uint64_t)v115, v73, v106, v107, v108, v109, v110, v111, v112, v113, v114);
        v81 = self->_wakingTopicsCache;
        if (!v81)
        {
          v82 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v83 = self->_wakingTopicsCache;
          self->_wakingTopicsCache = v82;

          v81 = self->_wakingTopicsCache;
        }
        objc_msgSend_unionSet_(v81, v79, (uint64_t)v116, v80);
        nonWakingTopicsCache = self->_nonWakingTopicsCache;
        if (!nonWakingTopicsCache)
        {
          v87 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v88 = self->_nonWakingTopicsCache;
          self->_nonWakingTopicsCache = v87;

          nonWakingTopicsCache = self->_nonWakingTopicsCache;
        }
        objc_msgSend_unionSet_(nonWakingTopicsCache, v84, (uint64_t)v64, v85);
        objc_msgSend__updateTopics(self, v89, v90, v91);
      }
    }
    v92 = objc_msgSend_copy(self->_cachedPushToken, v71, v74, v73, v106, v107, v108, v109, v110, v111, v112, v113, v114);
    objc_msgSend_unlock(self->_recursiveLock, v93, v94, v95);
    if (v92)
    {
      v96 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v96, OS_LOG_TYPE_DEBUG, "Alerting delegate with our cached token", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV(2, @"IDSFoundation", @"IDSPushHandler", @"Alerting delegate with our cached token");
      }
      if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v97, (uint64_t)v14, v98, sel_handler_pushTokenChanged_, 0, 0))
      {
        v101 = objc_msgSend_objectForKey_(self->_handlerMap, v99, (uint64_t)v14, v100);
        v105 = objc_msgSend_queue(v101, v102, v103, v104);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_19DA8F3E8;
        block[3] = &unk_1E5974100;
        id v122 = v14;
        v123 = self;
        id v124 = v92;
        dispatch_async(v105, block);
      }
    }
  }
}

- (void)removeListener:(id)a3
{
  if (a3)
  {
    recursiveLock = self->_recursiveLock;
    id v5 = a3;
    objc_msgSend_lock(recursiveLock, v6, v7, v8);
    objc_msgSend_removeObjectForKey_(self->_handlerMap, v9, (uint64_t)v5, v10);

    if (!objc_msgSend_count(self->_handlerMap, v11, v12, v13))
    {
      handlerMap = self->_handlerMap;
      self->_handlerMap = 0;
    }
    objc_msgSend__recalculateTopicsCache(self, v14, v15, v16);
    uint64_t v21 = self->_recursiveLock;
    objc_msgSend_unlock(v21, v18, v19, v20);
  }
}

- (void)setTopics:(id)a3 forListener:(id)a4
{
}

- (void)setWakingTopics:(id)a3 opportunisticTopics:(id)a4 nonWakingTopics:(id)a5 forListener:(id)a6
{
  id v53 = a3;
  id v10 = a4;
  id v11 = a5;
  id v14 = a6;
  if (!v14) {
    goto LABEL_20;
  }
  if (!v10)
  {
    objc_msgSend_set(MEMORY[0x1E4F1CAD0], v12, v13, v15);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v53)
  {
    objc_msgSend_set(MEMORY[0x1E4F1CAD0], v12, v13, v15);
    id v53 = (id)objc_claimAutoreleasedReturnValue();
    if (v11) {
      goto LABEL_6;
    }
LABEL_17:
    objc_msgSend_set(MEMORY[0x1E4F1CAD0], v12, v13, v15);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v11) {
    goto LABEL_17;
  }
LABEL_6:
  objc_msgSend_lock(self->_recursiveLock, v12, v13, v15);
  uint64_t v18 = objc_msgSend_objectForKey_(self->_handlerMap, v16, (uint64_t)v14, v17);
  double v22 = v18;
  if (v18)
  {
    uint64_t v23 = objc_msgSend_wakingTopics(v18, v19, v20, v21);
    id v27 = objc_msgSend_opportunisticTopics(v22, v24, v25, v26);
    id v31 = objc_msgSend_nonWakingTopics(v22, v28, v29, v30);
    if (!objc_msgSend_isEqualToSet_(v23, v32, (uint64_t)v53, v33)
      || !objc_msgSend_isEqualToSet_(v27, v34, (uint64_t)v10, v35)
      || (objc_msgSend_isEqualToSet_(v31, v34, (uint64_t)v11, v35) & 1) == 0)
    {
      objc_msgSend_setWakingTopics_(v22, v34, (uint64_t)v53, v35);
      objc_msgSend_setOpportunisticTopics_(v22, v37, (uint64_t)v10, v38);
      objc_msgSend_setNonWakingTopics_(v22, v39, (uint64_t)v11, v40);
      if (objc_msgSend_isSubsetOfSet_(v23, v41, (uint64_t)v53, v42)
        && objc_msgSend_isSubsetOfSet_(v27, v43, (uint64_t)v10, v45)
        && objc_msgSend_isSubsetOfSet_(v31, v43, (uint64_t)v11, v45))
      {
        objc_msgSend_unionSet_(self->_opportunisticTopicsCache, v43, (uint64_t)v10, v45);
        objc_msgSend_unionSet_(self->_wakingTopicsCache, v46, (uint64_t)v53, v47);
        objc_msgSend_unionSet_(self->_nonWakingTopicsCache, v48, (uint64_t)v11, v49);
        objc_msgSend__updateTopics(self, v50, v51, v52);
      }
      else
      {
        objc_msgSend__recalculateTopicsCache(self, v43, v44, v45);
      }
    }
    objc_msgSend_unlock(self->_recursiveLock, v34, v36, v35);
  }
  else
  {
    objc_msgSend_unlock(self->_recursiveLock, v19, v20, v21);
  }

LABEL_20:
}

- (void)setUltraConstrainedTopics:(id)a3 forListener:(id)a4
{
  id v24 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v10 = (uint64_t)v24;
    if (!v24)
    {
      uint64_t v10 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v6, v7, v9);
    }
    id v24 = (id)v10;
    objc_msgSend_lock(self->_recursiveLock, v6, v7, v9);
    double v15 = objc_msgSend_objectForKey_(self->_handlerMap, v11, (uint64_t)v8, v12);
    if (v15)
    {
      double v17 = objc_msgSend_apsConnection(self, v13, v14, v16);
      double v21 = objc_msgSend_allObjects(v24, v18, v19, v20);
      objc_msgSend_setUltraConstrainedTopics_(v17, v22, (uint64_t)v21, v23);
    }
    objc_msgSend_unlock(self->_recursiveLock, v13, v14, v16);
  }
}

- (void)setCommands:(id)a3 forListener:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!v6)
    {
      objc_msgSend_set(MEMORY[0x1E4F1CAD0], v7, v8, v10);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_lock(self->_recursiveLock, v7, v8, v10);
    uint64_t v13 = objc_msgSend_objectForKey_(self->_handlerMap, v11, (uint64_t)v9, v12);
    double v17 = v13;
    if (!v13)
    {
      objc_msgSend_unlock(self->_recursiveLock, v14, v15, v16);
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v18 = objc_msgSend_commands(v13, v14, v15, v16);
    double v22 = v18;
    if (v18 && v6)
    {
      double v23 = objc_msgSend_commands(v17, v19, v20, v21);
      char isEqual = objc_msgSend_isEqual_(v23, v24, (uint64_t)v6, v25);

      if (isEqual)
      {
LABEL_16:
        objc_msgSend_setCommands_(v17, v27, (uint64_t)v6, v28, v38, v39, v40);
        objc_msgSend_unlock(self->_recursiveLock, v35, v36, v37);
        goto LABEL_17;
      }
    }
    else
    {
    }
    uint64_t v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      double v33 = objc_msgSend_commands(v17, v30, v31, v32);
      *(_DWORD *)buf = 138412802;
      id v42 = v9;
      __int16 v43 = 2112;
      uint64_t v44 = v33;
      __int16 v45 = 2112;
      id v46 = v6;
      _os_log_impl(&dword_19D9BE000, v29, OS_LOG_TYPE_DEBUG, "Updating push commands for listener %@ from %@ to %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      double v39 = objc_msgSend_commands(v17, v27, v34, v28);
      id v40 = v6;
      id v38 = v9;
      _IDSLogV(1, @"IDSFoundation", @"IDSPushHandler", @"Updating push commands for listener %@ from %@ to %@");
    }
    goto LABEL_16;
  }
LABEL_18:
}

- (void)setShouldWaitToSetTopics:(BOOL)a3
{
  int v4 = a3;
  objc_msgSend_lock(self->_recursiveLock, a2, a3, v3);
  int shouldWaitToSetTopics = self->_shouldWaitToSetTopics;
  self->_int shouldWaitToSetTopics = v4;
  if (shouldWaitToSetTopics != v4 && shouldWaitToSetTopics != 0) {
    objc_msgSend__updateTopics(self, v6, v7, v8);
  }
  recursiveLock = self->_recursiveLock;
  objc_msgSend_unlock(recursiveLock, v6, v7, v8);
}

- (id)_apsConnectionPushToken
{
  int v4 = objc_msgSend_apsConnection(self, a2, v2, v3);
  double v8 = objc_msgSend_publicToken(v4, v5, v6, v7);

  return v8;
}

- (NSData)pushToken
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  uint64_t v75 = 0;
  v76 = (id *)&v75;
  uint64_t v77 = 0x3032000000;
  v78 = sub_19DA900E8;
  v79 = sub_19DA900F8;
  id v80 = 0;
  uint64_t v4 = objc_msgSend_lock(self->_recursiveLock, a2, v2, COERCE_DOUBLE(0x3032000000));
  cachedPushToken = self->_cachedPushToken;
  if (cachedPushToken)
  {
    BOOL v6 = 0;
  }
  else
  {
    double v7 = (void *)MEMORY[0x19F3AEEF0](v4);
    objc_msgSend__apsConnectionPushToken(self, v8, v9, v10);
    id v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    double v12 = self->_cachedPushToken;
    self->_cachedPushToken = v11;

    cachedPushToken = self->_cachedPushToken;
    BOOL v6 = cachedPushToken != 0;
  }
  objc_storeStrong(v76 + 5, cachedPushToken);
  objc_msgSend_unlock(self->_recursiveLock, v13, v14, v15);
  if (!v6) {
    goto LABEL_30;
  }
  objc_msgSend_lock(self->_recursiveLock, v16, v17, v18);
  if (objc_msgSend_count(self->_handlerMap, v19, v20, v21))
  {
    double v25 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v22, v23, v24);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v72 = 0u;
    long long v71 = 0u;
    double v26 = self->_handlerMap;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v71, v28, v82, 16);
    if (v30)
    {
      uint64_t v32 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v72 != v32) {
            objc_enumerationMutation(v26);
          }
          uint64_t v34 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v29, v34, v31, sel_handler_pushTokenChanged_, 0, 0))
          {
            double v35 = objc_msgSend_objectForKey_(self->_handlerMap, v29, v34, v31);
            objc_msgSend_setObject_forKey_(v25, v36, (uint64_t)v35, v37, v34);
          }
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v71, v31, v82, 16);
      }
      while (v30);
    }
  }
  else
  {
    uint64_t v41 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = NSStringFromSelector(sel_handler_pushTokenChanged_);
      *(_DWORD *)buf = 138413058;
      v84 = v42;
      __int16 v85 = 2112;
      uint64_t v86 = 0;
      __int16 v87 = 2112;
      uint64_t v88 = 0;
      __int16 v89 = 2112;
      uint64_t v90 = 0;
      _os_log_impl(&dword_19D9BE000, v41, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@   context: %@", buf, 0x2Au);
    }
    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
    {
      double v25 = 0;
      goto LABEL_22;
    }
    NSStringFromSelector(sel_handler_pushTokenChanged_);
    double v26 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    double v62 = v26;
    uint64_t v63 = 0;
    _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"No incoming push handler for selector: %@    topic: %@   command: %@   context: %@");
    double v25 = 0;
  }

LABEL_22:
  objc_msgSend_unlock(self->_recursiveLock, v38, v39, v40, v62, v63, v64, v65);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v43 = v25;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v67, v45, v81, 16);
  if (v47)
  {
    uint64_t v49 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v68 != v49) {
          objc_enumerationMutation(v43);
        }
        uint64_t v51 = *(void *)(*((void *)&v67 + 1) + 8 * j);
        double v52 = objc_msgSend_objectForKey_(self->_handlerMap, v46, v51, v48);
        double v56 = objc_msgSend_queue(v52, v53, v54, v55);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_19DA90100;
        block[3] = &unk_1E5973ED0;
        void block[4] = v51;
        block[5] = self;
        block[6] = &v75;
        dispatch_async(v56, block);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v67, v48, v81, 16);
    }
    while (v47);
  }

  objc_msgSend_count(v43, v57, v58, v59);
LABEL_30:
  id v60 = v76[5];
  _Block_object_dispose(&v75, 8);

  return (NSData *)v60;
}

- (__SecIdentity)copyPushIdentity
{
  uint64_t v2 = (void *)CUTWeakLinkClass();
  return (__SecIdentity *)objc_msgSend_copyIdentity(v2, v3, v4, v5);
}

- (void)subscribeToChannel:(id)a3 forTopic:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (a3 && v6)
  {
    id v8 = a3;
    id v9 = objc_alloc((Class)CUTWeakLinkClass());
    double v12 = objc_msgSend_initWithChannelID_(v9, v10, (uint64_t)v8, v11);

    double v16 = objc_msgSend_apsConnection(self, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_19DA90420;
    v20[3] = &unk_1E59747A8;
    id v21 = v12;
    double v22 = self;
    id v23 = v7;
    id v17 = v12;
    objc_msgSend_getRegisteredChannelsForTopic_withCompletion_(v16, v18, (uint64_t)v23, v19, v20);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v6 = (NSData *)a4;
  objc_msgSend_lock(self->_recursiveLock, v7, v8, v9);
  p_cachedPushToken = (id *)&self->_cachedPushToken;
  cachedPushToken = self->_cachedPushToken;
  if (cachedPushToken == v6)
  {
    id v77 = 0;
    double v15 = v6;
  }
  else
  {
    id *p_cachedPushToken = 0;

    double v15 = v6;
    if (objc_msgSend_length(v6, v16, v17, v18))
    {
      objc_storeStrong((id *)&self->_cachedPushToken, a4);
      id v77 = *p_cachedPushToken;
    }
    else
    {
      id v77 = 0;
    }
    double v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = self->_cachedPushToken;
      *(_DWORD *)buf = 138412546;
      v93 = self;
      __int16 v94 = 2112;
      double v95 = v20;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "%@ Received push token: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      long long v69 = self;
      long long v71 = self->_cachedPushToken;
      _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"%@ Received push token: %@");
    }
  }
  uint64_t v75 = v15;
  objc_msgSend_unlock(self->_recursiveLock, v10, v11, v12, v69, v71);
  double v24 = v77;
  if (v77) {
    BOOL v25 = cachedPushToken == v15;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25)
  {
    v79 = objc_msgSend_copy(v77, v21, v22, v23);
    objc_msgSend_lock(self->_recursiveLock, v26, v27, v28);
    if (objc_msgSend_count(self->_handlerMap, v29, v30, v31))
    {
      double v35 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v32, v33, v34);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v87 = 0u;
      long long v86 = 0u;
      uint64_t v36 = self->_handlerMap;
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v86, v38, v91, 16);
      if (v40)
      {
        uint64_t v42 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v87 != v42) {
              objc_enumerationMutation(v36);
            }
            uint64_t v44 = *(void *)(*((void *)&v86 + 1) + 8 * i);
            if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v39, v44, v41, sel_handler_pushTokenChanged_, 0, 0))
            {
              double v45 = objc_msgSend_objectForKey_(self->_handlerMap, v39, v44, v41);
              objc_msgSend_setObject_forKey_(v35, v46, (uint64_t)v45, v47, v44);
            }
          }
          uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v86, v41, v91, 16);
        }
        while (v40);
      }
    }
    else
    {
      uint64_t v51 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(sel_handler_pushTokenChanged_);
        double v52 = (IDSPushHandler *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v93 = v52;
        __int16 v94 = 2112;
        double v95 = 0;
        __int16 v96 = 2112;
        uint64_t v97 = 0;
        __int16 v98 = 2112;
        uint64_t v99 = 0;
        _os_log_impl(&dword_19D9BE000, v51, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@   context: %@", buf, 0x2Au);
      }
      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
      {
        double v35 = 0;
        goto LABEL_32;
      }
      NSStringFromSelector(sel_handler_pushTokenChanged_);
      uint64_t v36 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      uint64_t v73 = 0;
      uint64_t v74 = 0;
      long long v70 = v36;
      uint64_t v72 = 0;
      _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"No incoming push handler for selector: %@    topic: %@   command: %@   context: %@");
      double v35 = 0;
    }

LABEL_32:
    objc_msgSend_unlock(self->_recursiveLock, v48, v49, v50, v70, v72, v73, v74, v75, v76);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    obuint64_t j = v35;
    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v82, v54, v90, 16);
    if (v56)
    {
      uint64_t v58 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v83 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = *(void *)(*((void *)&v82 + 1) + 8 * j);
          uint64_t v61 = objc_msgSend_objectForKey_(self->_handlerMap, v55, v60, v57);
          uint64_t v65 = objc_msgSend_queue(v61, v62, v63, v64);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19DA909E4;
          block[3] = &unk_1E5974100;
          void block[4] = v60;
          block[5] = self;
          id v81 = v79;
          dispatch_async(v65, block);
        }
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v82, v57, v90, 16);
      }
      while (v56);
    }

    objc_msgSend_count(obj, v66, v67, v68);
    double v24 = v77;
  }
}

- (void)writePushPayloadToDiskIfEnabled:(id)a3 topic:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (CUTIsInternalInstall()
    && objc_msgSend_isWritePushPayloadsToDiskEnabled(MEMORY[0x1E4F6C408], v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E4F6C408], v10, v11, v12);

    if (v13)
    {
      objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E4F6C408], v14, v15, v16);
      long long v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v69 = @"/var/mobile/Library/IdentityServices/";
    }
    uint64_t v17 = objc_opt_class();
    double v18 = sub_19DA8E300(v17, v5, @"c");
    double v19 = NSString;
    double v23 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v20, v21, v22);
    uint64_t v27 = objc_msgSend_UUIDString(v23, v24, v25, v26);
    uint64_t v30 = objc_msgSend_stringWithFormat_(v19, v28, @"%@-push-%@.data", v29, v18, v27);

    double v31 = (void *)MEMORY[0x1E4F1CB10];
    double v34 = objc_msgSend_stringByAppendingPathComponent_(v69, v32, (uint64_t)v30, v33);
    double v37 = objc_msgSend_fileURLWithPath_(v31, v35, (uint64_t)v34, v36);

    double v38 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = objc_msgSend_absoluteString(v37, v39, v40, v41);
      *(_DWORD *)buf = 138412290;
      id v76 = v42;
      _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "Writing payload to disk: {%@}", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      double v68 = objc_msgSend_absoluteString(v37, v43, v45, v44);
      _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Writing payload to disk: {%@}");
    }
    v73[0] = @"t";
    v73[1] = @"p";
    v74[0] = v6;
    v74[1] = v5;
    id v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v43, (uint64_t)v74, v44, v73, 2, v68);
    id v72 = 0;
    uint64_t v49 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v47, (uint64_t)v46, v48, 100, 0, &v72);
    id v50 = v72;
    if (v50)
    {
      id v54 = v50;
      double v55 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v76 = v54;
        _os_log_impl(&dword_19D9BE000, v55, OS_LOG_TYPE_DEFAULT, "Error while serializing payload %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Error while serializing payload %@");
      }
    }
    else
    {
      uint64_t v56 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v51, v52, v53);
      uint64_t v60 = objc_msgSend_URLByDeletingLastPathComponent(v37, v57, v58, v59);
      id v71 = 0;
      objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v56, v61, (uint64_t)v60, v62, 1, 0, &v71);
      id v63 = v71;

      id v70 = v63;
      LODWORD(v60) = objc_msgSend_writeToURL_options_error_(v49, v64, (uint64_t)v37, v65, 1, &v70);
      id v54 = v70;

      if (v60)
      {
        v66 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v66, OS_LOG_TYPE_DEFAULT, "Write to disk: Successful", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Write to disk: Successful");
        }
      }
      else
      {
        uint64_t v67 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v76 = v54;
          _os_log_impl(&dword_19D9BE000, v67, OS_LOG_TYPE_DEFAULT, "Write to disk: Unsuccessful with error: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Write to disk: Unsuccessful with error: %@");
        }
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a4;
  double v10 = objc_msgSend_getBlastDoorSharedConnection(IDSBlastDoorConnectionHelper, v7, v8, v9);
  uint64_t v14 = objc_msgSend_topic(v6, v11, v12, v13);
  double v19 = objc_msgSend_userInfo(v6, v15, v16, v17);
  if (a3) {
    objc_msgSend_writePushPayloadToDiskIfEnabled_topic_(self, v18, (uint64_t)v19, v20, v14);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_19DA91248;
  v26[3] = &unk_1E5974848;
  v26[4] = self;
  id v27 = v14;
  id v28 = v6;
  id v29 = v19;
  id v21 = v19;
  id v22 = v6;
  id v23 = v14;
  objc_msgSend_diffuseAPSUserPayload_topic_withCompletionBlock_(v10, v24, (uint64_t)v21, v25, v23, v26);
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19D9BE000, v4, OS_LOG_TYPE_DEFAULT, "APS Connection did reconnect: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"APS Connection did reconnect: %@");
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v58 = a4;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v58) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v72 = v6;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "APS Connection status did change to connected: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    double v10 = @"NO";
    if (v58) {
      double v10 = @"YES";
    }
    uint64_t v51 = v10;
    _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"APS Connection status did change to connected: %@");
  }
  objc_msgSend_lock(self->_recursiveLock, v7, v8, v9, v51);
  if (objc_msgSend_count(self->_handlerMap, v11, v12, v13))
  {
    double v17 = objc_msgSend_weakToStrongObjectsMapTable(MEMORY[0x1E4F28E10], v14, v15, v16);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    double v18 = self->_handlerMap;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v65, v20, v70, 16);
    if (v22)
    {
      uint64_t v24 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(v18);
          }
          uint64_t v26 = *(void *)(*((void *)&v65 + 1) + 8 * i);
          if (objc_msgSend__validateHandler_withSelector_topic_command_(self, v21, v26, v23, sel_handler_isConnectedChanged_, 0, 0))
          {
            id v27 = objc_msgSend_objectForKey_(self->_handlerMap, v21, v26, v23);
            objc_msgSend_setObject_forKey_(v17, v28, (uint64_t)v27, v29, v26);
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v65, v23, v70, 16);
      }
      while (v22);
    }
    goto LABEL_20;
  }
  double v33 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(sel_handler_isConnectedChanged_);
    double v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    id v72 = v34;
    __int16 v73 = 2112;
    uint64_t v74 = 0;
    __int16 v75 = 2112;
    uint64_t v76 = 0;
    __int16 v77 = 2112;
    uint64_t v78 = 0;
    _os_log_impl(&dword_19D9BE000, v33, OS_LOG_TYPE_DEFAULT, "No incoming push handler for selector: %@    topic: %@   command: %@   context: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    NSStringFromSelector(sel_handler_isConnectedChanged_);
    double v18 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v52 = v18;
    uint64_t v53 = 0;
    _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"No incoming push handler for selector: %@    topic: %@   command: %@   context: %@");
    double v17 = 0;
LABEL_20:

    goto LABEL_27;
  }
  double v17 = 0;
LABEL_27:
  objc_msgSend_unlock(self->_recursiveLock, v30, v31, v32, v52, v53, v54, v55);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v17;
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v61, v36, v69, 16);
  if (v38)
  {
    uint64_t v40 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = *(void *)(*((void *)&v61 + 1) + 8 * j);
        id v43 = objc_msgSend_objectForKey_(self->_handlerMap, v37, v42, v39);
        double v47 = objc_msgSend_queue(v43, v44, v45, v46);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_19DA93878;
        block[3] = &unk_1E5974870;
        void block[4] = v42;
        block[5] = self;
        BOOL v60 = v58;
        dispatch_async(v47, block);
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v61, v39, v69, 16);
    }
    while (v38);
  }

  objc_msgSend_count(obj, v48, v49, v50);
}

- (BOOL)shouldWaitToSetTopics
{
  return self->_shouldWaitToSetTopics;
}

- (void)setApsConnection:(id)a3
{
}

- (NSString)namedDelegatePort
{
  return self->_namedDelegatePort;
}

- (void)setNamedDelegatePort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_recursiveLock, 0);
  objc_storeStrong((id *)&self->_nonWakingTopicsCache, 0);
  objc_storeStrong((id *)&self->_opportunisticTopicsCache, 0);
  objc_storeStrong((id *)&self->_wakingTopicsCache, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_cachedPushToken, 0);
}

@end