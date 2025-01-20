@interface MSPSharedTripStorageController
+ (id)_receivedNotificationRulesPath;
+ (id)_receivedSessionsPath;
+ (id)_senderSessionStoragePath;
+ (id)_sentNotificationRulesPath;
+ (void)removeFilesFromBackupsIfNeeded;
- (MSPGroupSessionStorage)senderSessionStorage;
- (MSPSharedTripStorageController)init;
- (MSPSharedTripStorageDelegate)delegate;
- (NSMutableDictionary)receiverRules;
- (NSMutableDictionary)senderRules;
- (NSMutableDictionary)sharedTripGroupSessionInfo;
- (id)_identifiersOfStaleSessions:(id)a3;
- (id)groupSessionInfoForKey:(id)a3;
- (id)receivingRulesForIdentifier:(id)a3;
- (id)sendingRulesForIdentifier:(id)a3;
- (void)_loadSenderSession;
- (void)_loadStoredSessions;
- (void)_saveReceivingRules;
- (void)_saveSenderSession;
- (void)_saveSendingRules;
- (void)_saveStoredSessions;
- (void)addNewSession:(id)a3 originator:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6;
- (void)dealloc;
- (void)initialiseStoredSessionsIfNeeded;
- (void)removeSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setReceiverRules:(id)a3;
- (void)setSenderRules:(id)a3;
- (void)setSenderSessionStorage:(id)a3;
- (void)setSharedTripGroupSessionInfo:(id)a3;
- (void)updateGroupSessionStorageWithState:(id)a3;
@end

@implementation MSPSharedTripStorageController

- (void)initialiseStoredSessionsIfNeeded
{
  if (!self->_initalisedStoredSessions)
  {
    v3 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[STORAGE] Triggering immediate load of stored sessions", v4, 2u);
    }

    [(MSPSharedTripStorageController *)self _loadStoredSessions];
  }
}

- (MSPSharedTripStorageController)init
{
  v16.receiver = self;
  v16.super_class = (Class)MSPSharedTripStorageController;
  v2 = [(MSPSharedTripStorageController *)&v16 init];
  if (v2)
  {
    v3 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[STORAGE] initializing new MSPSharedTripStorageController", (uint8_t *)buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    sharedTripGroupSessionInfo = v2->_sharedTripGroupSessionInfo;
    v2->_sharedTripGroupSessionInfo = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    receiverRules = v2->_receiverRules;
    v2->_receiverRules = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    senderRules = v2->_senderRules;
    v2->_senderRules = (NSMutableDictionary *)v8;

    [(MSPSharedTripStorageController *)v2 _loadSenderSession];
    v10 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "[STORAGE] Scheduling deferred load of stored sessions", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MSPSharedTripStorageController_init__block_invoke;
    block[3] = &unk_1E617C9A8;
    objc_copyWeak(&v14, buf);
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __38__MSPSharedTripStorageController_init__block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = WeakRetained[8];
    uint64_t v4 = MSPGetSharedTripStorageLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] Ignoring deferred load of stored sessions, already completed", buf, 2u);
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] Triggering deferred load of stored sessions", v6, 2u);
      }

      [v2 _loadStoredSessions];
    }
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    uint64_t v6 = "-[MSPSharedTripStorageController dealloc]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "[STORAGE] %{private}s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripStorageController;
  [(MSPSharedTripStorageController *)&v4 dealloc];
}

- (void)setSenderSessionStorage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (MSPGroupSessionStorage *)a3;
  if ([(MSPGroupSessionStorage *)v4 hasGroupIdentifier]
    && [(MSPGroupSessionStorage *)self->_senderSessionStorage hasGroupIdentifier])
  {
    BOOL v5 = [(MSPGroupSessionStorage *)v4 groupIdentifier];
    uint64_t v6 = [(MSPGroupSessionStorage *)self->_senderSessionStorage groupIdentifier];
    int v7 = [v5 isEqualToString:v6];

    if (v4 && (v7 & 1) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"NO";
    if (v7) {
      v9 = @"YES";
    }
    v10 = v9;
    dispatch_time_t v11 = [(MSPGroupSessionStorage *)v4 groupIdentifier];
    v12 = [(MSPGroupSessionStorage *)self->_senderSessionStorage groupIdentifier];
    int v15 = 138412802;
    objc_super v16 = v10;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[STORAGE] setSenderSessionStorage clearing storage (sameGroup: %@, incoming: %@, existing: %@)", (uint8_t *)&v15, 0x20u);
  }
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  [(MSPSharedTripStorageController *)self setSenderRules:v13];

LABEL_12:
  senderSessionStorage = self->_senderSessionStorage;
  self->_senderSessionStorage = v4;

  [(MSPSharedTripStorageController *)self _saveSenderSession];
}

- (id)groupSessionInfoForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sharedTripGroupSessionInfo objectForKeyedSubscript:a3];
}

- (void)setDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  BOOL v5 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
    int v8 = 138412290;
    v9 = sharedTripGroupSessionInfo;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[STORAGE] setDelegate %@", (uint8_t *)&v8, 0xCu);
  }

  if ([(NSMutableDictionary *)self->_sharedTripGroupSessionInfo count])
  {
    int v7 = (void *)[(NSMutableDictionary *)self->_sharedTripGroupSessionInfo copy];
    [v4 storageController:self updatedSharedTripGroupStorage:v7];
  }
}

- (void)addNewSession:(id)a3 originator:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  dispatch_time_t v11 = +[MSPGroupSessionStorage groupStorageWithIdentifier:v10 originator:a4 receivingHandle:a5 receivingAccountIdentifier:a6];
  [(NSMutableDictionary *)self->_sharedTripGroupSessionInfo setObject:v11 forKeyedSubscript:v10];

  [(MSPSharedTripStorageController *)self _saveStoredSessions];
  v12 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
    int v16 = 138412290;
    __int16 v17 = sharedTripGroupSessionInfo;
    _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_DEFAULT, "[STORAGE] addNewSession %@", (uint8_t *)&v16, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v15 = (void *)[(NSMutableDictionary *)self->_sharedTripGroupSessionInfo copy];
  [WeakRetained storageController:self updatedSharedTripGroupStorage:v15];
}

- (void)removeSession:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
  id v5 = a3;
  [(NSMutableDictionary *)sharedTripGroupSessionInfo setObject:0 forKeyedSubscript:v5];
  uint64_t v6 = [(MSPSharedTripStorageController *)self receiverRules];
  [v6 setObject:0 forKeyedSubscript:v5];

  [(MSPSharedTripStorageController *)self _saveStoredSessions];
  int v7 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = self->_sharedTripGroupSessionInfo;
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "[STORAGE] removeSession %@", (uint8_t *)&v11, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = (void *)[(NSMutableDictionary *)self->_sharedTripGroupSessionInfo copy];
  [WeakRetained storageController:self updatedSharedTripGroupStorage:v10];
}

- (void)updateGroupSessionStorageWithState:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 groupIdentifier];
  uint64_t v6 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[STORAGE] updateGroupSessionStorageWithState %@", (uint8_t *)&v8, 0xCu);
  }

  int v7 = [(NSMutableDictionary *)self->_sharedTripGroupSessionInfo objectForKeyedSubscript:v5];
  [v7 updateWithState:v4];

  [(MSPSharedTripStorageController *)self _saveStoredSessions];
}

- (id)receivingRulesForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MSPSharedTripStorageController *)self receiverRules];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    int v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEFAULT, "MSPSharedTripStorageController allocated receiving MSPSharedTripNotificationRules for groupIdentifier %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v6 = objc_alloc_init(MSPSharedTripNotificationRules);
    int v8 = [(MSPSharedTripStorageController *)self receiverRules];
    [v8 setObject:v6 forKeyedSubscript:v4];
  }

  return v6;
}

- (id)sendingRulesForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = NSString;
  senderSessionStorage = self->_senderSessionStorage;
  id v6 = a3;
  int v7 = [(MSPGroupSessionStorage *)senderSessionStorage groupIdentifier];
  int v8 = [v4 stringWithFormat:@"%@+%@", v7, v6];

  v9 = [(NSMutableDictionary *)self->_senderRules objectForKeyedSubscript:v8];
  if (!v9)
  {
    int v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v15 = v8;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_DEFAULT, "MSPSharedTripStorageController allocated sending MSPSharedTripNotificationRules for key %@", buf, 0xCu);
    }

    id v11 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      senderRules = self->_senderRules;
      *(_DWORD *)buf = 138412290;
      int v15 = senderRules;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_INFO, "rules %@", buf, 0xCu);
    }

    v9 = [[MSPSharedTripNotificationRules alloc] initWithMaximumNumberOfNotifications:GEOConfigGetUInteger()];
    [(NSMutableDictionary *)self->_senderRules setObject:v9 forKeyedSubscript:v8];
  }

  return v9;
}

+ (id)_receivedSessionsPath
{
  v2 = +[MSPMapsPaths mapsApplicationContainerPaths];
  int v3 = [v2 groupDirectory];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = +[MSPMapsPaths mapsApplicationContainerPaths];
    id v5 = [v6 mapsDirectory];
  }
  int v7 = [v5 stringByAppendingPathComponent:@"receivedsessions.data"];

  return v7;
}

+ (id)_receivedNotificationRulesPath
{
  v2 = +[MSPMapsPaths mapsApplicationContainerPaths];
  int v3 = [v2 groupDirectory];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = +[MSPMapsPaths mapsApplicationContainerPaths];
    id v5 = [v6 mapsDirectory];
  }
  int v7 = [v5 stringByAppendingPathComponent:@"rules.data"];

  return v7;
}

- (void)_loadStoredSessions
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() _receivedSessionsPath];
  id v4 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadStoredSessions %@", buf, 0xCu);
  }

  id v5 = MSPGetSharedTripLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  int v7 = v5;
  int v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_loadStoredSessions", (const char *)&unk_1B8876199, buf, 2u);
  }
  os_signpost_id_t spid = v6;

  v49 = (void *)v3;
  int v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
  unint64_t v11 = 0x1E4F28000uLL;
  if (v10)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, v46, objc_opt_class(), 0);
    id v51 = 0;
    __int16 v17 = [v12 unarchivedObjectOfClasses:v16 fromData:v10 error:&v51];
    id v18 = v51;

    if (v18)
    {
      __int16 v19 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v18;
        _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_ERROR, "[STORAGE] _loadStoredSessions unarchiving error %@", buf, 0xCu);
      }

      v20 = v8;
      uint64_t v21 = v20;
      unint64_t v11 = 0x1E4F28000;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B87E5000, v21, OS_SIGNPOST_EVENT, spid, "_loadStoredSessionsUnarchiveError", (const char *)&unk_1B8876199, buf, 2u);
      }
    }
    else
    {
      v22 = (NSMutableDictionary *)[v17 mutableCopy];
      sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
      self->_sharedTripGroupSessionInfo = v22;

      uint64_t v21 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v24 = self->_sharedTripGroupSessionInfo;
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v24;
        _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_INFO, "[STORAGE] cached group %@", buf, 0xCu);
      }
      unint64_t v11 = 0x1E4F28000uLL;
    }
  }
  v25 = [(MSPSharedTripStorageController *)self _identifiersOfStaleSessions:self->_sharedTripGroupSessionInfo];
  v26 = [v25 allObjects];

  [(NSMutableDictionary *)self->_sharedTripGroupSessionInfo removeObjectsForKeys:v26];
  v27 = [(id)objc_opt_class() _receivedNotificationRulesPath];
  v28 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v53 = (uint64_t)v27;
    _os_log_impl(&dword_1B87E5000, v28, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadStoredSessions rulesPath %@", buf, 0xCu);
  }

  v29 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v27];
  if (v29)
  {
    v47 = v10;
    v30 = *(void **)(v11 + 3520);
    v31 = +[MSPSharedTripNotificationRules unarchivingObjectsSet];
    id v50 = 0;
    v32 = [v30 unarchivedObjectOfClasses:v31 fromData:v29 error:&v50];
    id v33 = v50;

    if (v33)
    {
      v34 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v33;
        _os_log_impl(&dword_1B87E5000, v34, OS_LOG_TYPE_ERROR, "[STORAGE] rules unarchiving error %@", buf, 0xCu);
      }

      v35 = v8;
      v36 = v35;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B87E5000, v36, OS_SIGNPOST_EVENT, spid, "_loadStoredSessionsRulesUnarchiveError", (const char *)&unk_1B8876199, buf, 2u);
      }
    }
    else
    {
      v37 = (void *)[v32 mutableCopy];
      [(MSPSharedTripStorageController *)self setReceiverRules:v37];

      v36 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v38 = [(MSPSharedTripStorageController *)self receiverRules];
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v38;
        _os_log_impl(&dword_1B87E5000, v36, OS_LOG_TYPE_INFO, "[STORAGE] cached rules %@", buf, 0xCu);
      }
    }

    [(NSMutableDictionary *)self->_receiverRules removeObjectsForKeys:v26];
    int v10 = v47;
  }
  else
  {
    [(NSMutableDictionary *)self->_receiverRules removeObjectsForKeys:v26];
    if (!v10) {
      goto LABEL_32;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v40 = (void *)[(NSMutableDictionary *)self->_sharedTripGroupSessionInfo copy];
  [WeakRetained storageController:self updatedSharedTripGroupStorage:v40];

LABEL_32:
  v41 = v8;
  v42 = v41;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v42, OS_SIGNPOST_INTERVAL_END, spid, "_loadStoredSessions", (const char *)&unk_1B8876199, buf, 2u);
  }

  if ([v26 count])
  {
    v43 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      uint64_t v44 = [v26 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v53 = v44;
      _os_log_impl(&dword_1B87E5000, v43, OS_LOG_TYPE_INFO, "[STORAGE] %lu sessions are stale, re-saving remaining sessions", buf, 0xCu);
    }

    [(MSPSharedTripStorageController *)self _saveStoredSessions];
    [(MSPSharedTripStorageController *)self _saveReceivingRules];
  }
  if (!self->_initalisedStoredSessions)
  {
    v45 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v45, OS_LOG_TYPE_DEFAULT, "[STORAGE] initialised stored sessions", buf, 2u);
    }

    self->_initalisedStoredSessions = 1;
  }
}

- (id)_identifiersOfStaleSessions:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    [v3 keysOfEntriesPassingTest:&__block_literal_global_5];
  }
  else {
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v4;
}

uint64_t __62__MSPSharedTripStorageController__identifiersOfStaleSessions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  os_signpost_id_t v6 = [v5 state];
  int v7 = v6;
  if (v6)
  {
    if ([v6 hasArrived]) {
      int v8 = [v7 arrived];
    }
    else {
      int v8 = 0;
    }
    if ([v7 hasClosed]) {
      int v11 = [v7 closed];
    }
    else {
      int v11 = 0;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v13 = [v7 etaInfo];
    [v13 etaTimestamp];
    uint64_t v14 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    [v14 timeIntervalSinceNow];
    double v16 = v15;

    __int16 v17 = (void *)MEMORY[0x1E4F1C9C8];
    [v5 lastUpdateTimestamp];
    unint64_t v9 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
    [v9 timeIntervalSinceNow];
    double v19 = v18;
    GEOConfigGetDouble();
    double v21 = -v20;
    int v22 = v8 | v11;
    if (v16 < 0.0) {
      int v22 = 1;
    }
    if (v19 >= v21 || v22 == 0)
    {
      uint64_t v10 = 0;
    }
    else
    {
      v24 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        if (v8) {
          v26 = @"YES";
        }
        else {
          v26 = @"NO";
        }
        v27 = v26;
        if (v11) {
          v28 = @"YES";
        }
        else {
          v28 = @"NO";
        }
        v29 = v28;
        if (v16 >= 0.0) {
          v30 = @"NO";
        }
        else {
          v30 = @"YES";
        }
        v31 = v30;
        int v33 = 138413058;
        id v34 = v4;
        __int16 v35 = 2112;
        v36 = v27;
        __int16 v37 = 2112;
        v38 = v29;
        __int16 v39 = 2112;
        v40 = v31;
        _os_log_impl(&dword_1B87E5000, v24, OS_LOG_TYPE_INFO, "restored session %@ is stale: arrived %@ closed %@ etaInPast %@", (uint8_t *)&v33, 0x2Au);
      }
      uint64_t v10 = 1;
    }
  }
  else
  {
    unint64_t v9 = MSPGetSharedTripLog();
    uint64_t v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v33 = 138412290;
      id v34 = v4;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "restored session %@ is stale: no trip state", (uint8_t *)&v33, 0xCu);
    }
  }

  return v10;
}

- (void)_saveStoredSessions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _receivedSessionsPath];
  id v4 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sharedTripGroupSessionInfo = self->_sharedTripGroupSessionInfo;
    *(_DWORD *)buf = 138412546;
    v27 = sharedTripGroupSessionInfo;
    __int16 v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveStoredSessions groupsData %@ at path %@", buf, 0x16u);
  }

  os_signpost_id_t v6 = MSPGetSharedTripLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  int v8 = v6;
  unint64_t v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveStoredSessions", (const char *)&unk_1B8876199, buf, 2u);
  }

  int v11 = self->_sharedTripGroupSessionInfo;
  id v25 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v25];
  uint64_t v13 = (NSMutableDictionary *)v25;
  if (v13 || !v3)
  {
    double v19 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_ERROR, "[STORAGE] groupArchivingError %@", buf, 0xCu);
    }

    double v20 = v9;
    double v21 = v20;
    if (v10 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v23 = v21;
      goto LABEL_26;
    }
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v21, OS_SIGNPOST_EVENT, v7, "_saveStoredSessionsArchiveError", (const char *)&unk_1B8876199, buf, 2u);
    }

    int v22 = v21;
    goto LABEL_23;
  }
  id v24 = 0;
  [v12 writeToFile:v3 options:1 error:&v24];
  uint64_t v14 = (NSMutableDictionary *)v24;
  MSPExcludePathFromBackup(v3);
  if (v14)
  {
    double v15 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_ERROR, "[STORAGE] groupWriteError %@", buf, 0xCu);
    }

    double v16 = v9;
    __int16 v17 = v16;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v17, OS_SIGNPOST_EVENT, v7, "_saveStoredSessionsWriteError", (const char *)&unk_1B8876199, buf, 2u);
    }
  }
  double v18 = v9;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_23:
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_END, v7, "_saveStoredSessions", (const char *)&unk_1B8876199, buf, 2u);
    }
  }
LABEL_26:
}

- (void)_saveReceivingRules
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _receivedNotificationRulesPath];
  id v4 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MSPSharedTripStorageController *)self receiverRules];
    *(_DWORD *)buf = 138412546;
    id v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveRules %@ at path %@", buf, 0x16u);
  }
  os_signpost_id_t v6 = MSPGetSharedTripLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  int v8 = v6;
  unint64_t v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveReceivingRules", (const char *)&unk_1B8876199, buf, 2u);
  }

  int v11 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v12 = [(MSPSharedTripStorageController *)self receiverRules];
  id v26 = 0;
  uint64_t v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v26];
  id v14 = v26;

  if (v14 || !v3)
  {
    double v20 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v14;
      _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_ERROR, "[STORAGE] rulesArchivingError %@", buf, 0xCu);
    }

    double v21 = v9;
    int v22 = v21;
    if (v10 > 0xFFFFFFFFFFFFFFFDLL)
    {

      id v24 = v22;
      goto LABEL_26;
    }
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v22, OS_SIGNPOST_EVENT, v7, "_saveReceivingRulesArchiveError", (const char *)&unk_1B8876199, buf, 2u);
    }

    v23 = v22;
    goto LABEL_23;
  }
  id v25 = 0;
  [v13 writeToFile:v3 options:1 error:&v25];
  id v15 = v25;
  MSPExcludePathFromBackup(v3);
  if (v15)
  {
    double v16 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_ERROR, "[STORAGE] rulesWriteError %@", buf, 0xCu);
    }

    __int16 v17 = v9;
    double v18 = v17;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v18, OS_SIGNPOST_EVENT, v7, "_saveReceivingRulesWriteError", (const char *)&unk_1B8876199, buf, 2u);
    }
  }
  double v19 = v9;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_23:
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_END, v7, "_saveReceivingRules", (const char *)&unk_1B8876199, buf, 2u);
    }
  }
LABEL_26:
}

+ (id)_senderSessionStoragePath
{
  v2 = +[MSPMapsPaths mapsApplicationContainerPaths];
  id v3 = [v2 groupDirectory];

  id v4 = [v3 stringByAppendingPathComponent:@"sender.data"];

  return v4;
}

+ (id)_sentNotificationRulesPath
{
  v2 = +[MSPMapsPaths mapsApplicationContainerPaths];
  id v3 = [v2 groupDirectory];

  id v4 = [v3 stringByAppendingPathComponent:@"senderRules.data"];

  return v4;
}

- (void)_loadSenderSession
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = MSPGetSharedTripLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  os_signpost_id_t v6 = v5;
  unint64_t v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_loadSenderSession", (const char *)&unk_1B8876199, buf, 2u);
  }
  os_signpost_id_t spid = v4;

  int v8 = [(id)objc_opt_class() _sentNotificationRulesPath];
  unint64_t v9 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v8;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadSenderSession rulesPath %@", buf, 0xCu);
  }

  unint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
  if (v10)
  {
    int v11 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v12 = +[MSPSharedTripNotificationRules unarchivingObjectsSet];
    id v34 = 0;
    uint64_t v13 = [v11 unarchivedObjectOfClasses:v12 fromData:v10 error:&v34];
    id v14 = v34;

    if (v14)
    {
      id v15 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v14;
        _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_ERROR, "[STORAGE] sender rules unarchiving error %@", buf, 0xCu);
      }

      double v16 = v6;
      __int16 v17 = v16;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B87E5000, v17, OS_SIGNPOST_EVENT, spid, "_loadSenderSessionRulesUnarchiveError", (const char *)&unk_1B8876199, buf, 2u);
      }
    }
    else
    {
      double v18 = (void *)[v13 mutableCopy];
      [(MSPSharedTripStorageController *)self setSenderRules:v18];

      __int16 v17 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        double v19 = [(MSPSharedTripStorageController *)self senderRules];
        *(_DWORD *)buf = 138412290;
        id v36 = v19;
        _os_log_impl(&dword_1B87E5000, v17, OS_LOG_TYPE_INFO, "[STORAGE] cached sender rules %@", buf, 0xCu);
      }
    }
  }
  double v20 = [(id)objc_opt_class() _senderSessionStoragePath];
  double v21 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v20;
    _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_DEFAULT, "[STORAGE] _loadSenderSession %@", buf, 0xCu);
  }

  int v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v20];
  if (v22)
  {
    id v33 = 0;
    v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:&v33];
    id v24 = v33;
    if (v24)
    {
      id v25 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v24;
        _os_log_impl(&dword_1B87E5000, v25, OS_LOG_TYPE_ERROR, "[STORAGE] _loadSenderSession unarchiver error %@", buf, 0xCu);
      }

      id v26 = v6;
      v27 = v26;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B87E5000, v27, OS_SIGNPOST_EVENT, spid, "_loadSenderSessionUnarchiveError", (const char *)&unk_1B8876199, buf, 2u);
      }
    }
    else
    {
      p_senderSessionStorage = &self->_senderSessionStorage;
      objc_storeStrong((id *)&self->_senderSessionStorage, v23);
      v27 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int16 v29 = [(MSPGroupSessionStorage *)*p_senderSessionStorage groupIdentifier];
        *(_DWORD *)buf = 138412290;
        id v36 = v29;
        _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_INFO, "[STORAGE] cached session for group id %@", buf, 0xCu);
      }
    }
  }
  uint64_t v30 = v6;
  uint64_t v31 = v30;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v31, OS_SIGNPOST_INTERVAL_END, spid, "_loadSenderSession", (const char *)&unk_1B8876199, buf, 2u);
  }
}

- (void)_saveSenderSession
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _senderSessionStoragePath];
  if (!v3) {
    goto LABEL_37;
  }
  os_signpost_id_t v4 = MSPGetSharedTripStorageLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MSPGroupSessionStorage *)self->_senderSessionStorage groupIdentifier];
    *(_DWORD *)buf = 138412546;
    v32 = v5;
    __int16 v33 = 2112;
    id v34 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveSenderSession session for group id: %@ path: %@", buf, 0x16u);
  }
  os_signpost_id_t v6 = MSPGetSharedTripLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  int v8 = v6;
  unint64_t v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveSenderSession", (const char *)&unk_1B8876199, buf, 2u);
  }

  senderSessionStorage = self->_senderSessionStorage;
  if (senderSessionStorage)
  {
    id v30 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:senderSessionStorage requiringSecureCoding:1 error:&v30];
    uint64_t v13 = v30;
    if (v13)
    {
      id v14 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v13;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_ERROR, "[STORAGE] archiveError %@", buf, 0xCu);
      }

      id v15 = v9;
      double v16 = v15;
      if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B87E5000, v16, OS_SIGNPOST_EVENT, v7, "_saveSenderSessionArchiveError", (const char *)&unk_1B8876199, buf, 2u);
      }
    }
    if (v12)
    {
      id v29 = 0;
      [v12 writeToFile:v3 options:1 error:&v29];
      __int16 v17 = v29;
      MSPExcludePathFromBackup(v3);
      if (v17)
      {
        double v18 = MSPGetSharedTripStorageLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v17;
          _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_ERROR, "[STORAGE] writeError %@", buf, 0xCu);
        }

        double v19 = v9;
        double v20 = v19;
        if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B87E5000, v20, OS_SIGNPOST_EVENT, v7, "_saveSenderSessionWriteError", (const char *)&unk_1B8876199, buf, 2u);
        }
      }
LABEL_31:

      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  double v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v22 = [v21 fileExistsAtPath:v3];

  if (!v22) {
    goto LABEL_33;
  }
  v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = 0;
  [v23 removeItemAtPath:v3 error:&v28];
  uint64_t v12 = v28;

  if (v12)
  {
    id v24 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v12;
      _os_log_impl(&dword_1B87E5000, v24, OS_LOG_TYPE_ERROR, "[STORAGE] deleteError %@", buf, 0xCu);
    }

    id v25 = v9;
    __int16 v17 = v25;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v17, OS_SIGNPOST_EVENT, v7, "_saveSenderSessionDeleteError", (const char *)&unk_1B8876199, buf, 2u);
    }
    goto LABEL_31;
  }
LABEL_32:

LABEL_33:
  id v26 = v9;
  v27 = v26;
  if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v27, OS_SIGNPOST_INTERVAL_END, v7, "_saveSenderSession", (const char *)&unk_1B8876199, buf, 2u);
  }

LABEL_37:
}

- (void)_saveSendingRules
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _sentNotificationRulesPath];
  if (v3)
  {
    os_signpost_id_t v4 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      senderRules = self->_senderRules;
      *(_DWORD *)buf = 138412546;
      v27 = senderRules;
      __int16 v28 = 2112;
      id v29 = v3;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] _saveSendingRules rules %@ at path %@", buf, 0x16u);
    }

    os_signpost_id_t v6 = MSPGetSharedTripLog();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);
    int v8 = v6;
    unint64_t v9 = v8;
    unint64_t v10 = v7 - 1;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "_saveSendingRules", (const char *)&unk_1B8876199, buf, 2u);
    }

    int v11 = self->_senderRules;
    id v25 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v25];
    uint64_t v13 = (NSMutableDictionary *)v25;
    if (v13)
    {
      id v14 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_ERROR, "[STORAGE] _saveSendingRules archiving error %@", buf, 0xCu);
      }

      id v15 = v9;
      double v16 = v15;
      if (v10 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v23 = v16;
LABEL_25:

        goto LABEL_26;
      }
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B87E5000, v16, OS_SIGNPOST_EVENT, v7, "_saveSendingRulesArchiveError", (const char *)&unk_1B8876199, buf, 2u);
      }

      __int16 v17 = v16;
    }
    else
    {
      id v24 = 0;
      [v12 writeToFile:v3 options:1 error:&v24];
      double v18 = (NSMutableDictionary *)v24;
      MSPExcludePathFromBackup(v3);
      if (v18)
      {
        double v19 = MSPGetSharedTripStorageLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v18;
          _os_log_impl(&dword_1B87E5000, v19, OS_LOG_TYPE_ERROR, "[STORAGE] _saveSendingRules write error %@", buf, 0xCu);
        }

        double v20 = v9;
        double v21 = v20;
        if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B87E5000, v21, OS_SIGNPOST_EVENT, v7, "_saveSendingRulesWriteError", (const char *)&unk_1B8876199, buf, 2u);
        }
      }
      int v22 = v9;
      if (v10 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_25;
      }
    }
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v9, OS_SIGNPOST_INTERVAL_END, v7, "_saveSendingRules", (const char *)&unk_1B8876199, buf, 2u);
    }
    goto LABEL_25;
  }
LABEL_26:
}

+ (void)removeFilesFromBackupsIfNeeded
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__MSPSharedTripStorageController_removeFilesFromBackupsIfNeeded__block_invoke;
  v10[3] = &unk_1E617C9F0;
  id v11 = v3;
  id v4 = v3;
  id v5 = (void (**)(void, void))MEMORY[0x1BA9C2AF0](v10);
  os_signpost_id_t v6 = [a1 _senderSessionStoragePath];
  ((void (**)(void, void *))v5)[2](v5, v6);

  os_signpost_id_t v7 = [a1 _sentNotificationRulesPath];
  ((void (**)(void, void *))v5)[2](v5, v7);

  int v8 = [a1 _receivedSessionsPath];
  ((void (**)(void, void *))v5)[2](v5, v8);

  unint64_t v9 = [a1 _receivedNotificationRulesPath];
  ((void (**)(void, void *))v5)[2](v5, v9);
}

void __64__MSPSharedTripStorageController_removeFilesFromBackupsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3
    && [*(id *)(a1 + 32) fileExistsAtPath:v3]
    && (MSPIsExcludedFromBackup((uint64_t)v3) & 1) == 0)
  {
    id v4 = MSPGetSharedTripStorageLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 lastPathComponent];
      int v8 = 138412290;
      unint64_t v9 = v5;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[STORAGE] Found file not excluded from backup, excluding now: %@", (uint8_t *)&v8, 0xCu);
    }
    if ((MSPExcludePathFromBackup(v3) & 1) == 0)
    {
      os_signpost_id_t v6 = MSPGetSharedTripStorageLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        os_signpost_id_t v7 = [v3 lastPathComponent];
        int v8 = 138412290;
        unint64_t v9 = v7;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[STORAGE] Failed to exclude file from backup: %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (MSPSharedTripStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPSharedTripStorageDelegate *)WeakRetained;
}

- (MSPGroupSessionStorage)senderSessionStorage
{
  return self->_senderSessionStorage;
}

- (NSMutableDictionary)sharedTripGroupSessionInfo
{
  return self->_sharedTripGroupSessionInfo;
}

- (void)setSharedTripGroupSessionInfo:(id)a3
{
}

- (NSMutableDictionary)receiverRules
{
  return self->_receiverRules;
}

- (void)setReceiverRules:(id)a3
{
}

- (NSMutableDictionary)senderRules
{
  return self->_senderRules;
}

- (void)setSenderRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderRules, 0);
  objc_storeStrong((id *)&self->_receiverRules, 0);
  objc_storeStrong((id *)&self->_sharedTripGroupSessionInfo, 0);
  objc_storeStrong((id *)&self->_senderSessionStorage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end