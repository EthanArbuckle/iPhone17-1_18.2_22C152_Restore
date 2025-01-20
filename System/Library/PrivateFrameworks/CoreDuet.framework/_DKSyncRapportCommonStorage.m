@interface _DKSyncRapportCommonStorage
+ (_DKSyncRapportCommonStorage)sharedInstance;
- (BOOL)isAvailable;
- (BOOL)isTransportActiveForPeer:(id)a3;
- (_DKSyncRapportCommonStorage)init;
- (id)client;
- (id)deviceForPeer:(uint64_t)a1;
- (id)myDeviceID;
- (id)name;
- (id)transformCaughtObject:(id)a3 existingError:(id)a4;
- (id)transformResponseError:(id)a3;
- (int64_t)transportType;
- (uint64_t)_additionalFlagsForInternal;
- (void)cancelOutstandingOperations;
- (void)clientForPeer:(void *)a1;
- (void)dealloc;
- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)handleActivateCompanionLinkClient:(void *)a3 forPeer:(void *)a4 error:;
- (void)handleActivateWithError:(uint64_t)a1;
- (void)handleAvailabilityFailureWithPeer:(id)a3 completion:(id)a4;
- (void)handleBeaconWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleDeviceChanged:(int)a3 changes:;
- (void)handleDeviceFound:(void *)a1;
- (void)handleDeviceLost:(void *)a1;
- (void)handleFetchSourceDeviceIDWithRequest:(void *)a3 options:(void *)a4 responseHandler:;
- (void)handleFetchSourceDeviceIDWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:;
- (void)handleInvalidation;
- (void)handshakeWithDuetSyncPeer:(id)a3 orError:(id)a4;
- (void)myDeviceID;
- (void)registerRequestIDsWithClient:(uint64_t)a1;
- (void)removeAllClientsWithRetiring:(uint64_t)a1;
- (void)removeClient:(void *)a3 forPeer:(int)a4 retiring:;
- (void)sendRequestID:(id)a3 request:(id)a4 peer:(id)a5 highPriority:(BOOL)a6 options:(id)a7 responseHandler:(id)a8;
- (void)sendRequestID:(void *)a3 request:(void *)a4 peer:(void *)a5 client:(void *)a6 options:(void *)a7 responseHandler:;
- (void)setDeviceID:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)start;
- (void)startRapport;
@end

@implementation _DKSyncRapportCommonStorage

+ (_DKSyncRapportCommonStorage)sharedInstance
{
  if (sharedInstance_initialized_6 != -1) {
    dispatch_once(&sharedInstance_initialized_6, &__block_literal_global_79);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return (_DKSyncRapportCommonStorage *)v2;
}

- (_DKSyncRapportCommonStorage)init
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_DKSyncRapportCommonStorage;
  v2 = [(_DKSyncRapportCommonStorage *)&v12 init];
  if (v2)
  {
    uint64_t v13 = *MEMORY[0x1E4F94788];
    v14[0] = MEMORY[0x1E4F1CC38];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    failIfAsleepOption = v2->_failIfAsleepOption;
    v2->_failIfAsleepOption = (NSDictionary *)v3;

    uint64_t v5 = +[_DKEventTypeResultStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeResultStatsCounter, @"knowledge_sync", @"rapport_message_sent_with_fail_if_asleep", @"option", &unk_1EDE1E968);
    failIfAsleepStats = v2->_failIfAsleepStats;
    v2->_failIfAsleepStats = (_DKEventTypeResultStatsCounter *)v5;

    uint64_t v7 = objc_opt_new();
    companionLinkClients = v2->_companionLinkClients;
    v2->_companionLinkClients = (NSMutableDictionary *)v7;

    v2->_retryTimeout = 8.0;
    uint64_t v9 = objc_opt_new();
    peerSourceDeviceIDsWithCompletedHandshakes = v2->_peerSourceDeviceIDsWithCompletedHandshakes;
    v2->_peerSourceDeviceIDsWithCompletedHandshakes = (NSMutableSet *)v9;
  }
  return v2;
}

- (void)dealloc
{
  [(RPCompanionLinkClient *)self->_client invalidate];
  -[_DKSyncRapportCommonStorage removeAllClientsWithRetiring:]((uint64_t)self, 1);
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncRapportCommonStorage;
  [(_DKSyncRapportCommonStorage *)&v3 dealloc];
}

- (void)removeAllClientsWithRetiring:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = +[_DKSyncPeerStatusTracker sharedInstance];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "copy", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v11 = [v4 peerWithIDSDeviceIdentifier:v10];
          objc_super v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v10];
          -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:](a1, v12, v11, a2);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)start
{
  objc_super v3 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->_client && !self->_running)
  {
    -[_DKSyncRapportCommonStorage startRapport]((uint64_t)self);
  }
}

- (void)startRapport
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Starting Rapport", v4, 0xCu);
}

- (void)cancelOutstandingOperations
{
  v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);
}

- (id)name
{
  return @"Rapport";
}

- (int64_t)transportType
{
  return 1;
}

- (uint64_t)_additionalFlagsForInternal
{
  if (result)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58___DKSyncRapportCommonStorage__additionalFlagsForInternal__block_invoke;
    block[3] = &unk_1E560D578;
    block[4] = result;
    if (_additionalFlagsForInternal_onceToken != -1) {
      dispatch_once(&_additionalFlagsForInternal_onceToken, block);
    }
    return _additionalFlagsForInternal_flag;
  }
  return result;
}

- (void)handleInvalidation
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "%{public}@: Handling invalidation handler call", v5);
}

- (void)handleDeviceFound:(void *)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  if (a1)
  {
    uint64_t v6 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = [(__CFString *)v5 idsDeviceIdentifier];

    if (v7)
    {
      uint64_t v8 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v20 = [(id)objc_opt_class() description];
        v21 = [(__CFString *)v5 idsDeviceIdentifier];
        v2 = [(__CFString *)v5 identifier];
        *(_DWORD *)buf = 138543874;
        v50 = v20;
        __int16 v51 = 2114;
        v52 = v21;
        __int16 v53 = 2114;
        v54 = v2;
        _os_log_debug_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Found device %{public}@ with companion link identifier %{public}@", buf, 0x20u);
      }
      uint64_t v9 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v22 = [(id)objc_opt_class() description];
        v23 = [(__CFString *)v5 idsDeviceIdentifier];
        *(_DWORD *)buf = 138543874;
        v50 = v22;
        __int16 v51 = 2114;
        v52 = v23;
        __int16 v53 = 2112;
        v54 = v5;
        _os_log_debug_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Device %{public}@ is %@", buf, 0x20u);
      }
      uint64_t v10 = +[_DKSyncPeerStatusTracker sharedInstance];
      v11 = [(__CFString *)v5 idsDeviceIdentifier];
      objc_super v12 = [v10 peerWithIDSDeviceIdentifier:v11];

      long long v13 = [(__CFString *)v5 name];
      [v12 setName:v13];

      long long v14 = [(__CFString *)v5 model];
      [v12 setModel:v14];

      objc_msgSend(v12, "setCompanion:", ((unint64_t)-[__CFString statusFlags](v5, "statusFlags") >> 6) & 1);
      long long v15 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v46 = [(id)objc_opt_class() description];
        v43 = [(__CFString *)v5 idsDeviceIdentifier];
        int v24 = [v12 me];
        v25 = &stru_1EDDE58B8;
        if (v24) {
          v25 = @"pseudo ";
        }
        v41 = v25;
        v26 = [v12 identifier];
        v27 = [v12 model];
        if (v27)
        {
          v34 = NSString;
          objc_super v3 = [v12 model];
          v2 = [v34 stringWithFormat:@" (%@)", v3];
        }
        else
        {
          v2 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        v50 = v46;
        __int16 v51 = 2114;
        v52 = v43;
        __int16 v53 = 2114;
        v54 = v41;
        __int16 v55 = 2114;
        v56 = v26;
        __int16 v57 = 2114;
        v58 = v2;
        _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Device %{public}@ is %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v27)
        {
        }
      }

      if (([(__CFString *)v5 statusFlags] & 0x100) != 0)
      {
        uint64_t v18 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v48 = [(id)objc_opt_class() description];
          if ([v12 me]) {
            v31 = @"pseudo ";
          }
          else {
            v31 = &stru_1EDDE58B8;
          }
          v45 = [v12 identifier];
          v32 = [v12 model];
          if (v32)
          {
            v38 = NSString;
            v2 = [v12 model];
            v33 = [v38 stringWithFormat:@" (%@)", v2];
          }
          else
          {
            v33 = &stru_1EDDE58B8;
          }
          *(_DWORD *)buf = 138544130;
          v50 = v48;
          __int16 v51 = 2114;
          v52 = v31;
          __int16 v53 = 2114;
          v54 = v45;
          __int16 v55 = 2114;
          v56 = v33;
          _os_log_debug_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@: Activating %{public}@peer %{public}@%{public}@ recognizes sync protocol", buf, 0x2Au);
          if (v32)
          {
          }
        }

        [a1 handshakeWithDuetSyncPeer:v12 orError:0];
      }
      else
      {
        long long v16 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v47 = [(id)objc_opt_class() description];
          int v28 = [v12 me];
          v29 = &stru_1EDDE58B8;
          if (v28) {
            v29 = @"pseudo ";
          }
          v40 = v29;
          v44 = [v12 identifier];
          v30 = [v12 model];
          if (v30)
          {
            v35 = NSString;
            v39 = [v12 model];
            v42 = [v35 stringWithFormat:@" (%@)", v39];
          }
          else
          {
            v42 = &stru_1EDDE58B8;
          }
          v36 = [(__CFString *)v5 model];
          v37 = [(__CFString *)v5 name];
          *(_DWORD *)buf = 138544642;
          v50 = v47;
          __int16 v51 = 2114;
          v52 = v40;
          __int16 v53 = 2114;
          v54 = v44;
          __int16 v55 = 2114;
          v56 = v42;
          __int16 v57 = 2114;
          v58 = v36;
          __int16 v59 = 2112;
          v60 = v37;
          _os_log_debug_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Unsupported %{public}@peer %{public}@%{public}@ does not currently recognize sync protocol: %{public}@ (%@)", buf, 0x3Eu);

          if (v30)
          {
          }
        }

        objc_msgSend(v10, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v12);
      }
      v19 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceFound:]();
      }

      [v10 debugLogPeers];
    }
    else
    {
      v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceFound:]();
      }
    }
  }
}

- (void)handleDeviceChanged:(int)a3 changes:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  if (a1)
  {
    uint64_t v8 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v8);

    uint64_t v9 = [(__CFString *)v7 idsDeviceIdentifier];

    if (v9)
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v28 = [(id)objc_opt_class() description];
        v29 = [(__CFString *)v7 idsDeviceIdentifier];
        objc_super v3 = [(__CFString *)v7 identifier];
        *(_DWORD *)buf = 138544130;
        __int16 v55 = v28;
        __int16 v56 = 2114;
        __int16 v57 = v29;
        __int16 v58 = 2112;
        __int16 v59 = v3;
        __int16 v60 = 1024;
        LODWORD(v61) = a3;
        _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Changed device %{public}@ with companion link identifier %@ and changes %x", buf, 0x26u);
      }
      v11 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v30 = [(id)objc_opt_class() description];
        v31 = [(__CFString *)v7 idsDeviceIdentifier];
        *(_DWORD *)buf = 138543874;
        __int16 v55 = v30;
        __int16 v56 = 2114;
        __int16 v57 = v31;
        __int16 v58 = 2112;
        __int16 v59 = v7;
        _os_log_debug_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Changed device %{public}@ is %@", buf, 0x20u);
      }
      objc_super v12 = +[_DKSyncPeerStatusTracker sharedInstance];
      long long v13 = [(__CFString *)v7 idsDeviceIdentifier];
      long long v14 = [v12 peerWithIDSDeviceIdentifier:v13];

      long long v15 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v48 = [(id)objc_opt_class() description];
        v45 = [(__CFString *)v7 idsDeviceIdentifier];
        if ([v14 me]) {
          v32 = @"pseudo ";
        }
        else {
          v32 = &stru_1EDDE58B8;
        }
        v43 = [v14 identifier];
        __int16 v51 = [v14 model];
        if (v51)
        {
          v36 = NSString;
          uint64_t v4 = [v14 model];
          objc_super v3 = [v36 stringWithFormat:@" (%@)", v4];
        }
        else
        {
          objc_super v3 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        __int16 v55 = v48;
        __int16 v56 = 2114;
        __int16 v57 = v45;
        __int16 v58 = 2114;
        __int16 v59 = v32;
        __int16 v60 = 2114;
        uint64_t v61 = v43;
        __int16 v62 = 2114;
        v63 = v3;
        _os_log_debug_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Changed device %{public}@ is %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v51)
        {
        }
      }

      uint64_t v16 = [v12 activeTransportsForPeer:v14];
      if (([(__CFString *)v7 statusFlags] & 0x100) != 0)
      {
        v19 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v49 = [(id)objc_opt_class() description];
          int v33 = [v14 me];
          v34 = &stru_1EDDE58B8;
          if (v33) {
            v34 = @"pseudo ";
          }
          v44 = v34;
          v46 = [v14 identifier];
          v52 = [v14 model];
          if (v52)
          {
            v41 = NSString;
            uint64_t v4 = [v14 model];
            v35 = [v41 stringWithFormat:@" (%@)", v4];
          }
          else
          {
            v35 = &stru_1EDDE58B8;
          }
          *(_DWORD *)buf = 138544130;
          __int16 v55 = v49;
          __int16 v56 = 2114;
          __int16 v57 = v44;
          __int16 v58 = 2114;
          __int16 v59 = v46;
          __int16 v60 = 2114;
          uint64_t v61 = v35;
          _os_log_debug_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Activating %{public}@peer %{public}@%{public}@ now recognizes sync protocol", buf, 0x2Au);
          if (v52)
          {
          }
        }

        if (([a1 transportType] & v16) == 0) {
          [a1 handshakeWithDuetSyncPeer:v14 orError:0];
        }
      }
      else if (([a1 transportType] & v16) != 0)
      {
        objc_msgSend(v12, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v14);
        v17 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __int16 v53 = [(id)objc_opt_class() description];
          int v37 = [v14 me];
          v38 = &stru_1EDDE58B8;
          if (v37) {
            v38 = @"pseudo ";
          }
          v47 = v38;
          v50 = [v14 identifier];
          v39 = [v14 model];
          if (v39)
          {
            v42 = NSString;
            objc_super v3 = [v14 model];
            v40 = [v42 stringWithFormat:@" (%@)", v3];
          }
          else
          {
            v40 = &stru_1EDDE58B8;
          }
          *(_DWORD *)buf = 138544130;
          __int16 v55 = v53;
          __int16 v56 = 2114;
          __int16 v57 = v47;
          __int16 v58 = 2114;
          __int16 v59 = v50;
          __int16 v60 = 2114;
          uint64_t v61 = v40;
          _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Unsupported %{public}@peer %{public}@%{public}@ no longer recognizes sync protocol", buf, 0x2Au);
          if (v39)
          {
          }
        }
      }
      v20 = -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)a1, v14);
      BOOL v21 = v20 == 0;

      if (v21)
      {
        v22 = -[_DKSyncRapportCommonStorage clientForPeer:](a1, v14);
        if (v22) {
          -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:]((uint64_t)a1, v22, v14, 0);
        }
        objc_msgSend(v12, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v14);
      }
      if ((a3 & 2) != 0)
      {
        unint64_t v23 = [(__CFString *)v7 statusFlags] & 0x40;
        if ([v14 isCompanion] != (v23 >> 6))
        {
          if (v23)
          {
            int v24 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              [(id)objc_opt_class() description];
              objc_claimAutoreleasedReturnValue();
              [(__CFString *)v7 idsDeviceIdentifier];
              objc_claimAutoreleasedReturnValue();
              -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:]();
            }
          }
          else
          {
            int v24 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              [(id)objc_opt_class() description];
              objc_claimAutoreleasedReturnValue();
              [(__CFString *)v7 idsDeviceIdentifier];
              objc_claimAutoreleasedReturnValue();
              -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:].cold.4();
            }
          }

          uint64_t v25 = [v12 activeTransportsForPeer:v14];
          uint64_t v26 = [a1 transportType] & v25;
          if (v26) {
            objc_msgSend(v12, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v14);
          }
          [v14 setCompanion:v23 != 0];
          if (v26) {
            objc_msgSend(v12, "addActiveTransports:toPeer:", objc_msgSend(a1, "transportType"), v14);
          }
        }
      }
      v27 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceFound:]();
      }

      [v12 debugLogPeers];
    }
    else
    {
      uint64_t v18 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceChanged:changes:]();
      }
    }
  }
}

- (void)handleDeviceLost:(void *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  if (a1)
  {
    uint64_t v5 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v5);

    uint64_t v6 = [(__CFString *)v4 idsDeviceIdentifier];

    if (v6)
    {
      uint64_t v7 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = [(id)objc_opt_class() description];
        v19 = [(__CFString *)v4 idsDeviceIdentifier];
        v20 = [(__CFString *)v4 identifier];
        *(_DWORD *)buf = 138543874;
        int v33 = v18;
        __int16 v34 = 2114;
        v35 = v19;
        __int16 v36 = 2112;
        int v37 = v20;
        _os_log_debug_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Lost device %{public}@ with companion link identifier %@", buf, 0x20u);
      }
      uint64_t v8 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        BOOL v21 = [(id)objc_opt_class() description];
        v22 = [(__CFString *)v4 idsDeviceIdentifier];
        *(_DWORD *)buf = 138543874;
        int v33 = v21;
        __int16 v34 = 2114;
        v35 = v22;
        __int16 v36 = 2112;
        int v37 = v4;
        _os_log_debug_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: Lost device %{public}@ is %@", buf, 0x20u);
      }
      uint64_t v9 = +[_DKSyncPeerStatusTracker sharedInstance];
      uint64_t v10 = [(__CFString *)v4 idsDeviceIdentifier];
      v11 = [v9 peerWithIDSDeviceIdentifier:v10];

      objc_super v12 = -[_DKSyncRapportCommonStorage clientForPeer:](a1, v11);
      if (v12) {
        -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:]((uint64_t)a1, v12, v11, 0);
      }
      long long v13 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v31 = [(id)objc_opt_class() description];
        v30 = [(__CFString *)v4 idsDeviceIdentifier];
        int v23 = [v11 me];
        int v24 = &stru_1EDDE58B8;
        if (v23) {
          int v24 = @"pseudo ";
        }
        int v28 = v24;
        v29 = [v11 identifier];
        uint64_t v25 = [v11 model];
        if (v25)
        {
          v27 = NSString;
          v2 = [v11 model];
          uint64_t v26 = [v27 stringWithFormat:@" (%@)", v2];
        }
        else
        {
          uint64_t v26 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        int v33 = v31;
        __int16 v34 = 2114;
        v35 = v30;
        __int16 v36 = 2114;
        int v37 = v28;
        __int16 v38 = 2114;
        v39 = v29;
        __int16 v40 = 2114;
        v41 = v26;
        _os_log_debug_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Lost device %{public}@ is %{public}@peer %{public}@%{public}@", buf, 0x34u);
        if (v25)
        {
        }
      }

      long long v14 = -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)a1, v11);
      BOOL v15 = v14 == 0;

      if (v15)
      {
        objc_msgSend(v9, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v11);
        uint64_t v16 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          [(id)objc_opt_class() description];
          objc_claimAutoreleasedReturnValue();
          -[_DKSyncRapportCommonStorage handleDeviceFound:]();
        }

        [v9 debugLogPeers];
      }
    }
    else
    {
      v17 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleDeviceLost:]();
      }
    }
  }
}

- (void)registerRequestIDsWithClient:(uint64_t)a1
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke;
    v5[3] = &unk_1E5610D18;
    v5[4] = a1;
    id v3 = a2;
    [v3 registerRequestID:@"com.apple.coreduet.beacon" options:0 handler:v5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60___DKSyncRapportCommonStorage_registerRequestIDsWithClient___block_invoke_2;
    v4[3] = &unk_1E5610D18;
    v4[4] = a1;
    [v3 registerRequestID:@"com.apple.coreduet.fetch-source-device-id" options:0 handler:v4];
  }
}

- (void)handleActivateWithError:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleActivateWithError:]();
    }

    if (v3)
    {
      uint64_t v6 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        long long v13 = [(id)objc_opt_class() description];
        long long v14 = [v3 domain];
        *(_DWORD *)buf = 138544130;
        v17 = v13;
        __int16 v18 = 2114;
        v19 = v14;
        __int16 v20 = 2048;
        uint64_t v21 = [v3 code];
        __int16 v22 = 2112;
        id v23 = v3;
        _os_log_error_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to start Rapport: %{public}@:%lld (%@)", buf, 0x2Au);
      }
      *(unsigned char *)(a1 + 8) = 0;
      [*(id *)(a1 + 40) invalidate];
      uint64_t v7 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      [(id)a1 setIsAvailable:0];
      uint64_t v8 = +[_CDObservationCenter sharedInstance];
      [v8 postNotificationName:@"_DKRapportTransportAvailablityChangedNotification" userInfo:0 sender:a1];
    }
    else
    {
      uint64_t v9 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleActivateWithError:]();
      }

      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = *MEMORY[0x1E4F947D0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55___DKSyncRapportCommonStorage_handleActivateWithError___block_invoke;
      v15[3] = &unk_1E560D730;
      v15[4] = a1;
      [v10 registerProfileID:v11 completion:v15];
      *(unsigned char *)(a1 + 8) = 1;
      [(id)a1 setIsAvailable:1];
      objc_super v12 = +[_CDObservationCenter sharedInstance];
      [v12 postNotificationName:@"_DKRapportTransportAvailablityChangedNotification" userInfo:0 sender:a1];
      *(void *)(a1 + 72) = 0x4020000000000000;
    }
  }
}

- (void)handleBeaconWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v33 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    uint64_t v9 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v9);

    uint64_t v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.5();
    }

    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:].cold.4();
    }

    objc_super v12 = objc_opt_new();
    long long v13 = [a1 myDeviceID];
    if (v13)
    {
      long long v14 = [v7 objectForKeyedSubscript:@"peer"];
      if (v14)
      {
        BOOL v15 = +[_DKSyncPeerStatusTracker sharedInstance];
        uint64_t v16 = [v15 peerWithIDSDeviceIdentifier:v14];
        v17 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v31 = [(id)objc_opt_class() description];
          int v23 = [v16 me];
          uint64_t v24 = &stru_1EDDE58B8;
          if (v23) {
            uint64_t v24 = @"pseudo ";
          }
          v29 = v24;
          v30 = [v16 identifier];
          v32 = [v16 model];
          if (v32)
          {
            v27 = NSString;
            uint64_t v26 = [v16 model];
            uint64_t v25 = [v27 stringWithFormat:@" (%@)", v26];
          }
          else
          {
            uint64_t v25 = &stru_1EDDE58B8;
          }
          int v28 = v25;
          *(_DWORD *)buf = 138544130;
          int v37 = v31;
          __int16 v38 = 2114;
          v39 = v29;
          __int16 v40 = 2114;
          v41 = v30;
          __int16 v42 = 2114;
          v43 = v25;
          _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Received beacon request from %{public}@peer %{public}@%{public}@", buf, 0x2Au);
          if (v32)
          {
          }
        }

        if (v16)
        {
          [a1 handshakeWithDuetSyncPeer:v16 orError:0];
          __int16 v18 = 0;
        }
        else
        {
          __int16 v20 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            [(id)objc_opt_class() description];
            objc_claimAutoreleasedReturnValue();
            -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:]();
          }

          __int16 v18 = +[_DKSyncErrors internalFailure];
        }
      }
      else
      {
        __int16 v18 = +[_DKSyncErrors invalidRequest];
      }
    }
    else
    {
      v19 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:]();
      }

      +[_DKSyncErrors internalFailure];
      v18 = long long v13 = &stru_1EDDE58B8;
    }
    v34[0] = @"server";
    v34[1] = @"results";
    v35[0] = v13;
    v35[1] = v12;
    v34[2] = @"version";
    v35[2] = @"3.0";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
    __int16 v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleBeaconWithRequest:options:responseHandler:]();
    }

    v8[2](v8, v21, 0, v18);
  }
}

- (void)handleFetchSourceDeviceIDWithRequest:(void *)a3 options:(void *)a4 responseHandler:
{
  v28[7] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v24 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    uint64_t v9 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v9);

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:].cold.4();
    }

    objc_super v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:]();
    }

    uint64_t v13 = [a1 myDeviceID];
    long long v14 = (__CFString *)v13;
    if (v13)
    {
      BOOL v15 = 0;
      v27 = @"deviceID";
      v28[0] = v13;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v17 = v14;
    }
    else
    {
      __int16 v18 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [(id)objc_opt_class() description];
        objc_claimAutoreleasedReturnValue();
        -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:]();
      }

      uint64_t v19 = +[_DKSyncErrors internalFailure];
      v17 = &stru_1EDDE58B8;
      uint64_t v16 = 0;
      BOOL v15 = (void *)v19;
    }
    v25[0] = @"server";
    v25[1] = @"result";
    if (v16) {
      __int16 v20 = v16;
    }
    else {
      __int16 v20 = &stru_1EDDE58B8;
    }
    v26[0] = v17;
    v26[1] = v20;
    v25[2] = @"version";
    v26[2] = @"3.0";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    __int16 v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithRequest:options:responseHandler:]();
    }

    v8[2](v8, v21, 0, v15);
    if (v10)
    {
      int v23 = [MEMORY[0x1E4F1C9C8] date];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v10, v23, 0);
    }
  }
}

- (void)handshakeWithDuetSyncPeer:(id)a3 orError:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_DKSyncPeerStatusTracker sharedInstance];
  if (!v7)
  {
    uint64_t v24 = [v6 sourceDeviceID];
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      uint64_t v26 = [v6 version];
      if (v26)
      {
        v27 = (void *)v26;
        peerSourceDeviceIDsWithCompletedHandshakes = self->_peerSourceDeviceIDsWithCompletedHandshakes;
        v29 = [v6 sourceDeviceID];
        LODWORD(peerSourceDeviceIDsWithCompletedHandshakes) = [(NSMutableSet *)peerSourceDeviceIDsWithCompletedHandshakes containsObject:v29];

        if (peerSourceDeviceIDsWithCompletedHandshakes)
        {
          objc_msgSend(v8, "addActiveTransports:toPeer:", -[_DKSyncRapportCommonStorage transportType](self, "transportType"), v6);
          v30 = [MEMORY[0x1E4F1C9C8] date];
          [v8 setLastSeenDate:v30 onPeer:v6];

          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    v31 = [MEMORY[0x1E4F1C9C8] date];
    v32 = NSString;
    id v33 = [v6 identifier];
    __int16 v18 = [v32 stringWithFormat:@"handshake:%@", v33];

    __int16 v34 = +[_DKThrottledActivity standardInstance];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke;
    v46[3] = &unk_1E560EBB0;
    v46[4] = self;
    id v47 = v6;
    id v48 = v31;
    id v49 = v8;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __65___DKSyncRapportCommonStorage_handshakeWithDuetSyncPeer_orError___block_invoke_156;
    v44[3] = &unk_1E5610D68;
    v44[4] = self;
    id v45 = v47;
    id v35 = v31;
    [v34 performNoMoreOftenInMinutesThan:v18 name:v46 activityBlock:v44 throttleBlock:1.0];

LABEL_21:
    goto LABEL_22;
  }
  if ([v7 code] != -6714
    || ([v7 domain],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToString:*MEMORY[0x1E4F94770]],
        v9,
        !v10))
  {
    __int16 v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(id)objc_opt_class() description];
      __int16 v20 = &stru_1EDDE58B8;
      if ([v6 me]) {
        uint64_t v21 = @"pseudo ";
      }
      else {
        uint64_t v21 = &stru_1EDDE58B8;
      }
      __int16 v22 = [v6 identifier];
      int v23 = [v6 model];
      if (v23)
      {
        __int16 v38 = NSString;
        __int16 v42 = [v6 model];
        __int16 v20 = [v38 stringWithFormat:@" (%@)", v42];
      }
      v39 = [v7 domain];
      *(_DWORD *)buf = 138544898;
      __int16 v51 = v19;
      __int16 v52 = 2114;
      __int16 v53 = v21;
      __int16 v54 = 2114;
      __int16 v55 = v22;
      __int16 v56 = 2114;
      __int16 v57 = v20;
      __int16 v58 = 2114;
      __int16 v59 = v39;
      __int16 v60 = 2048;
      uint64_t v61 = [v7 code];
      __int16 v62 = 2112;
      id v63 = v7;
      _os_log_error_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed while handshaking with %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

      if (v23)
      {
      }
    }
    goto LABEL_21;
  }
  uint64_t v11 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v43 = [(id)objc_opt_class() description];
    int v12 = [v6 me];
    uint64_t v13 = &stru_1EDDE58B8;
    long long v14 = @"pseudo ";
    if (!v12) {
      long long v14 = &stru_1EDDE58B8;
    }
    v41 = v14;
    BOOL v15 = [v6 identifier];
    uint64_t v16 = [v6 model];
    if (v16)
    {
      v17 = NSString;
      __int16 v40 = [v6 model];
      uint64_t v13 = [v17 stringWithFormat:@" (%@)", v40];
    }
    __int16 v36 = [v6 model];
    int v37 = [v6 name];
    *(_DWORD *)buf = 138544642;
    __int16 v51 = v43;
    __int16 v52 = 2114;
    __int16 v53 = v41;
    __int16 v54 = 2114;
    __int16 v55 = v15;
    __int16 v56 = 2114;
    __int16 v57 = v13;
    __int16 v58 = 2114;
    __int16 v59 = v36;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v37;
    _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_INFO, "%{public}@: Unsupported %{public}@peer %{public}@%{public}@ failed to recognize sync protocol beacon: %{public}@ (%@)", buf, 0x3Eu);

    if (v16)
    {
    }
  }

  objc_msgSend(v8, "removeActiveTransports:fromPeer:", -[_DKSyncRapportCommonStorage transportType](self, "transportType"), v6);
LABEL_22:
}

- (id)deviceForPeer:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [*(id *)(a1 + 40) activeDevices];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v3, "idsDeviceIdentifier", (void)v13);
          int v10 = [v8 idsDeviceIdentifier];
          int v11 = [v9 isEqualToString:v10];

          if (v11)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)clientForPeer:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 idsDeviceIdentifier];
    if (v5)
    {
      uint64_t v6 = (void *)a1[6];
      id v7 = [v4 idsDeviceIdentifier];
      a1 = [v6 objectForKeyedSubscript:v7];
    }
    else
    {
      uint64_t v8 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(_DKSyncRapportCommonStorage *)a1 clientForPeer:v8];
      }

      a1 = 0;
    }
  }
  return a1;
}

- (void)removeClient:(void *)a3 forPeer:(int)a4 retiring:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = +[_CDLogging syncChannel];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (a4)
    {
      if (v10) {
        -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:](a1, v8, v9);
      }
    }
    else if (v10)
    {
      -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:](a1, v8, v9);
    }

    int v11 = [v8 idsDeviceIdentifier];
    [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v11];
    [v7 invalidate];
  }
}

- (void)handleActivateCompanionLinkClient:(void *)a3 forPeer:(void *)a4 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    int v12 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v12);

    long long v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v30 = [(id)objc_opt_class() description];
      int v15 = [v10 me];
      long long v16 = &stru_1EDDE58B8;
      if (v15) {
        long long v16 = @"pseudo ";
      }
      int v28 = v16;
      id v4 = [v10 identifier];
      v17 = [v10 model];
      if (v17)
      {
        int v23 = NSString;
        id v5 = [v10 model];
        uint64_t v18 = [v23 stringWithFormat:@" (%@)", v5];
      }
      else
      {
        uint64_t v18 = &stru_1EDDE58B8;
      }
      *(_DWORD *)buf = 138544130;
      id v33 = v30;
      __int16 v34 = 2114;
      id v35 = v28;
      __int16 v36 = 2114;
      int v37 = v4;
      __int16 v38 = 2114;
      v39 = v18;
      _os_log_debug_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Handling client activate of %{public}@peer %{public}@%{public}@", buf, 0x2Au);
      if (v17)
      {
      }
    }

    if (v11)
    {
      long long v14 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v31 = [(id)objc_opt_class() description];
        int v19 = [v10 me];
        __int16 v20 = &stru_1EDDE58B8;
        if (v19) {
          __int16 v20 = @"pseudo ";
        }
        v27 = v20;
        v29 = [v10 identifier];
        uint64_t v21 = [v10 model];
        if (v21)
        {
          uint64_t v24 = NSString;
          id v4 = [v10 model];
          __int16 v22 = [v24 stringWithFormat:@" (%@)", v4];
        }
        else
        {
          __int16 v22 = &stru_1EDDE58B8;
        }
        uint64_t v25 = [v11 domain];
        uint64_t v26 = [v11 code];
        *(_DWORD *)buf = 138544898;
        id v33 = v31;
        __int16 v34 = 2114;
        id v35 = v27;
        __int16 v36 = 2114;
        int v37 = v29;
        __int16 v38 = 2114;
        v39 = v22;
        __int16 v40 = 2114;
        v41 = v25;
        __int16 v42 = 2048;
        uint64_t v43 = v26;
        __int16 v44 = 2112;
        id v45 = v11;
        _os_log_error_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed client activate of %{public}@peer %{public}@%{public}@: %{public}@:%lld (%@)", buf, 0x48u);

        if (v21)
        {
        }
      }

      -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:](a1, v9, v10, 0);
    }
  }
}

- (id)transformResponseError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  uint64_t v6 = *MEMORY[0x1E4F94770];
  if ([v5 isEqualToString:*MEMORY[0x1E4F94770]])
  {
    uint64_t v7 = [v4 code];

    if (v7 == -71156)
    {
      id v8 = +[_DKSyncErrors temporaryFailure];

      goto LABEL_12;
    }
  }
  else
  {
  }
  id v9 = [v4 domain];
  if ([v9 isEqualToString:v6])
  {
    uint64_t v10 = [v4 code];

    id v8 = v4;
    if (v10 != -6722) {
      goto LABEL_12;
    }
    id v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_DKSyncRapportCommonStorage transformResponseError:]((uint64_t)self, v11);
    }
  }
  else
  {
  }
  id v8 = v4;
LABEL_12:

  return v8;
}

- (id)transformCaughtObject:(id)a3 existingError:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_5:
    id v9 = v8;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    int v12 = +[_DKSyncErrors internalFailure];
    long long v13 = [v12 domain];
    long long v14 = +[_DKSyncErrors internalFailure];
    uint64_t v15 = [v14 code];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v16 = [v5 reason];
    v17 = (void *)v16;
    uint64_t v18 = @"Exception Caught";
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    v31[0] = v18;
    int v19 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v20 = (__CFString **)v31;
    uint64_t v21 = &v30;
  }
  else
  {
    char v22 = objc_opt_respondsToSelector();
    id v11 = (void *)MEMORY[0x1E4F28C58];
    int v12 = +[_DKSyncErrors internalFailure];
    long long v13 = [v12 domain];
    long long v14 = +[_DKSyncErrors internalFailure];
    uint64_t v15 = [v14 code];
    if ((v22 & 1) == 0)
    {
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27 = @"Object Caught";
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v9 = [v11 errorWithDomain:v13 code:v15 userInfo:v17];
      goto LABEL_19;
    }
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v23 = [v5 description];
    v17 = (void *)v23;
    uint64_t v24 = @"Object Caught";
    if (v23) {
      uint64_t v24 = (__CFString *)v23;
    }
    v29 = v24;
    int v19 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v20 = &v29;
    uint64_t v21 = &v28;
  }
  uint64_t v25 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
  id v9 = [v11 errorWithDomain:v13 code:v15 userInfo:v25];

LABEL_19:
LABEL_6:

  return v9;
}

- (id)myDeviceID
{
  id v3 = self->_deviceID;
  if (!v3)
  {
    id v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(_DKSyncRapportCommonStorage *)self myDeviceID];
    }

    [(RPCompanionLinkClient *)self->_client invalidate];
    client = self->_client;
    self->_client = 0;

    [(_DKSyncRapportCommonStorage *)self setIsAvailable:0];
    id v6 = +[_CDObservationCenter sharedInstance];
    [v6 postNotificationName:@"_DKRapportTransportAvailablityChangedNotification" userInfo:0 sender:self];
  }
  return v3;
}

- (void)setDeviceID:(id)a3
{
}

- (id)client
{
  return self->_client;
}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v45[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(_DKSyncRapportCommonStorage *)self myDeviceID];
  if ([(_DKSyncRapportCommonStorage *)self isAvailable]
    && ([v8 idsDeviceIdentifier],
        int v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    long long v13 = [MEMORY[0x1E4F1C9C8] date];
    long long v14 = &stru_1EDDE58B8;
    if (v11) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = &stru_1EDDE58B8;
    }
    v44[0] = @"client";
    v44[1] = @"version";
    v45[0] = v15;
    v45[1] = @"3.0";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    v17 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = [(id)objc_opt_class() description];
      int v20 = [v8 me];
      uint64_t v21 = @"pseudo ";
      if (!v20) {
        uint64_t v21 = &stru_1EDDE58B8;
      }
      uint64_t v25 = v21;
      uint64_t v26 = [v8 identifier];
      char v22 = [v8 model];
      if (v22)
      {
        uint64_t v23 = NSString;
        uint64_t v24 = [v8 model];
        long long v14 = [v23 stringWithFormat:@" (%@)", v24];
      }
      *(_DWORD *)buf = 138544386;
      id v35 = v27;
      __int16 v36 = 2114;
      int v37 = v25;
      __int16 v38 = 2114;
      v39 = v26;
      __int16 v40 = 2114;
      v41 = v14;
      __int16 v42 = 2112;
      id v43 = v16;
      _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Sending source device id request to %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
      if (v22)
      {
      }
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke;
    v30[3] = &unk_1E5610D90;
    v30[4] = self;
    id v31 = v8;
    id v32 = v13;
    id v33 = v9;
    id v18 = v9;
    id v19 = v13;
    [(_DKSyncRapportCommonStorage *)self sendRequestID:@"com.apple.coreduet.fetch-source-device-id" request:v16 peer:v31 highPriority:v6 options:0 responseHandler:v30];
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83___DKSyncRapportCommonStorage_fetchSourceDeviceIDFromPeer_highPriority_completion___block_invoke_2;
    v28[3] = &unk_1E560D640;
    id v29 = v9;
    id v16 = v9;
    [(_DKSyncRapportCommonStorage *)self handleAvailabilityFailureWithPeer:v8 completion:v28];
    id v19 = v29;
  }
}

- (void)handleFetchSourceDeviceIDWithResponse:(void *)a3 options:(void *)a4 error:(void *)a5 peer:(void *)a6 plStartDate:(void *)a7 completion:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  long long v13 = a2;
  id v48 = a3;
  id v14 = a4;
  id v49 = a5;
  id v15 = a6;
  id v16 = a7;
  if (a1)
  {
    v17 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v17);

    id v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      -[_DKSyncRapportCommonStorage handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:]();
    }

    if (v14)
    {
      if ([v14 code] == -6714
        && ([v14 domain],
            id v19 = objc_claimAutoreleasedReturnValue(),
            int v20 = [v19 isEqualToString:*MEMORY[0x1E4F94770]],
            v19,
            v20))
      {
        uint64_t v21 = +[_DKSyncPeerStatusTracker sharedInstance];
        objc_msgSend(v21, "removeActiveTransports:fromPeer:", objc_msgSend(a1, "transportType"), v49);
        char v22 = 0;
        uint64_t v23 = 0;
      }
      else
      {
        [a1 transformResponseError:v14];
        char v22 = 0;
        uint64_t v23 = 0;
        uint64_t v21 = v14;
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v24 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v46 = [(id)objc_opt_class() description];
        if ([v49 me]) {
          uint64_t v30 = @"pseudo ";
        }
        else {
          uint64_t v30 = &stru_1EDDE58B8;
        }
        id v31 = [v49 identifier];
        id v32 = [v49 model];
        if (v32)
        {
          __int16 v34 = NSString;
          a5 = [v49 model];
          id v33 = [v34 stringWithFormat:@" (%@)", a5];
        }
        else
        {
          id v33 = &stru_1EDDE58B8;
        }
        *(_DWORD *)buf = 138544386;
        __int16 v51 = v46;
        __int16 v52 = 2114;
        __int16 v53 = v30;
        __int16 v54 = 2114;
        __int16 v55 = v31;
        __int16 v56 = 2114;
        __int16 v57 = v33;
        __int16 v58 = 2112;
        __int16 v59 = v13;
        _os_log_debug_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: Received fetch source device id response from %{public}@peer %{public}@%{public}@: %@", buf, 0x34u);
        if (v32)
        {
        }
      }

      uint64_t v21 = [(__CFString *)v13 objectForKeyedSubscript:@"result"];
      char v22 = [(__CFString *)v13 objectForKeyedSubscript:@"version"];
      if ([v22 length])
      {
        [v22 doubleValue];
        if (v25 <= 0.0)
        {

          char v22 = 0;
        }
      }
      uint64_t v26 = [v21 objectForKeyedSubscript:@"deviceID"];
      if (v26 && (uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v26]) != 0)
      {
        v27 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v45 = [(id)objc_opt_class() description];
          __int16 v44 = [v23 UUIDString];
          int v35 = [v49 me];
          __int16 v36 = &stru_1EDDE58B8;
          if (v35) {
            __int16 v36 = @"pseudo ";
          }
          __int16 v42 = v36;
          id v43 = [v49 identifier];
          id v47 = [v49 model];
          if (v47)
          {
            v41 = NSString;
            uint64_t v38 = [v49 model];
            int v37 = [v41 stringWithFormat:@" (%@)", v38];
            __int16 v40 = (void *)v38;
          }
          else
          {
            int v37 = &stru_1EDDE58B8;
          }
          *(_DWORD *)buf = 138544386;
          __int16 v51 = v45;
          __int16 v52 = 2114;
          __int16 v53 = v44;
          __int16 v54 = 2114;
          __int16 v55 = v42;
          __int16 v56 = 2114;
          __int16 v57 = v43;
          __int16 v58 = 2114;
          __int16 v59 = v37;
          v39 = v37;
          _os_log_debug_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched source device id %{public}@ from %{public}@peer %{public}@%{public}@", buf, 0x34u);
          if (v47)
          {
          }
        }

        id v14 = 0;
      }
      else
      {
        id v14 = +[_DKSyncErrors invalidResponse];
        uint64_t v23 = 0;
      }
    }
    if (v15)
    {
      uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", 0, [a1 transportType], v15, v28, 0);
    }
    if (v16)
    {
      id v29 = (void (*)(void *, void *, void *, id))v16[2];
      if (v14) {
        v29(v16, 0, 0, v14);
      }
      else {
        v29(v16, v23, v22, 0);
      }
    }
  }
}

- (BOOL)isTransportActiveForPeer:(id)a3
{
  id v4 = a3;
  id v5 = +[_DKSyncPeerStatusTracker sharedInstance];
  uint64_t v6 = [v5 activeTransportsForPeer:v4];

  LOBYTE(self) = ([(_DKSyncRapportCommonStorage *)self transportType] & v6) != 0;
  return (char)self;
}

- (void)sendRequestID:(id)a3 request:(id)a4 peer:(id)a5 highPriority:(BOOL)a6 options:(id)a7 responseHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v19);

  uint64_t v20 = -[_DKSyncRapportCommonStorage clientForPeer:](self, v16);
  if (v20)
  {
    id v21 = (id)v20;
    char v22 = -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)self, v16);
    [v21 setDestinationDevice:v22];

    uint64_t v23 = [v21 destinationDevice];

    if (v23)
    {
      -[_DKSyncRapportCommonStorage sendRequestID:request:peer:client:options:responseHandler:]((uint64_t)self, v14, v15, v16, v21, v17, v18);
      goto LABEL_21;
    }
    uint64_t v28 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:]((int)self, (int)v16, (int)v28, v29, v30, v31, v32, v33, v39, v40, (uint8_t)v41, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49,
    }
        v50,
        v51,
        v52,
        v53,
        v54,
        v55,
        v56,
        v57,
        v58);

    -[_DKSyncRapportCommonStorage removeClient:forPeer:retiring:]((uint64_t)self, v21, v16, 0);
    if (v18)
    {
      uint64_t v34 = +[_DKSyncErrors internalFailure];
LABEL_20:
      uint64_t v38 = (void *)v34;
      (*((void (**)(id, void, void, uint64_t))v18 + 2))(v18, 0, 0, v34);
    }
  }
  else
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F946E0]);
    if (v24)
    {
      id v21 = v24;
      double v25 = +[_DKSyncSerializer underlyingQueue];
      [v21 setDispatchQueue:v25];

      objc_msgSend(v21, "setControlFlags:", objc_msgSend(v21, "controlFlags") | -[_DKSyncRapportCommonStorage _additionalFlagsForInternal]((uint64_t)self) | 0x400000);
      uint64_t v26 = -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)self, v16);
      [v21 setDestinationDevice:v26];

      v27 = [v21 destinationDevice];

      if (v27)
      {
        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __95___DKSyncRapportCommonStorage_sendRequestID_request_peer_highPriority_options_responseHandler___block_invoke;
        __int16 v42 = &unk_1E5610DB8;
        id v43 = self;
        id v21 = v21;
        id v44 = v21;
        id v45 = v16;
        id v46 = v17;
        LOBYTE(v50) = a6;
        id v47 = v14;
        id v48 = v15;
        id v49 = v18;
        [v21 activateWithCompletion:&v39];

        goto LABEL_21;
      }
      int v37 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, v16, v37);
      }

      [v21 invalidate];
      if (v18)
      {
        uint64_t v34 = +[_DKSyncErrors temporaryFailure];
        goto LABEL_20;
      }
    }
    else
    {
      int v35 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self, v16, v35);
      }

      if (v18)
      {
        __int16 v36 = +[_DKSyncErrors internalFailure];
        (*((void (**)(id, void, void, void *))v18 + 2))(v18, 0, 0, v36);
      }
      id v21 = 0;
    }
  }
LABEL_21:
}

- (void)sendRequestID:(void *)a3 request:(void *)a4 peer:(void *)a5 client:(void *)a6 options:(void *)a7 responseHandler:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a1)
  {
    id v18 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v18);

    id v19 = [v16 objectForKey:*MEMORY[0x1E4F94788]];

    uint64_t v20 = @"enabled";
    if (!v19) {
      uint64_t v20 = @"disabled";
    }
    id v21 = v20;
    id v22 = (id)*MEMORY[0x1E4F94740];
    if (v16) {
      uint64_t v23 = (void *)[v16 mutableCopy];
    }
    else {
      uint64_t v23 = objc_opt_new();
    }
    id v24 = v23;
    [v23 setObject:&unk_1EDE1E228 forKeyedSubscript:*MEMORY[0x1E4F947C0]];
    double v25 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      id v38 = v13;
      id v45 = [(id)objc_opt_class() description];
      int v28 = [v14 me];
      int v29 = @"pseudo ";
      if (!v28) {
        int v29 = &stru_1EDDE58B8;
      }
      uint64_t v39 = v29;
      id v43 = [v14 identifier];
      v41 = [v14 model];
      if (v41)
      {
        uint64_t v34 = NSString;
        __int16 v36 = [v14 model];
        int v30 = [v34 stringWithFormat:@" (%@)", v36];
      }
      else
      {
        int v30 = &stru_1EDDE58B8;
      }
      id v13 = v38;
      int v37 = v30;
      *(_DWORD *)buf = 138544642;
      uint64_t v53 = v45;
      __int16 v54 = 2114;
      id v55 = v47;
      __int16 v56 = 2114;
      uint64_t v57 = v39;
      __int16 v58 = 2114;
      __int16 v59 = v43;
      __int16 v60 = 2114;
      uint64_t v61 = v30;
      __int16 v62 = 2112;
      id v63 = v13;
      _os_log_debug_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEBUG, "%{public}@: Starting to send request %{public}@ to %{public}@peer %{public}@%{public}@: %@", buf, 0x3Eu);
      if (v41)
      {
      }
    }

    ++*(void *)(a1 + 56);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __89___DKSyncRapportCommonStorage_sendRequestID_request_peer_client_options_responseHandler___block_invoke;
    v48[3] = &unk_1E5610DE0;
    v48[4] = a1;
    uint64_t v26 = v21;
    id v49 = v26;
    id v51 = v17;
    id v50 = v15;
    [v50 sendRequestID:v47 request:v13 destinationID:v22 options:v24 responseHandler:v48];
    v27 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      __int16 v42 = [(id)objc_opt_class() description];
      int v31 = [v14 me];
      int v32 = &stru_1EDDE58B8;
      int v33 = @"pseudo ";
      if (!v31) {
        int v33 = &stru_1EDDE58B8;
      }
      uint64_t v40 = v33;
      id v46 = [v14 identifier];
      id v44 = [v14 model];
      if (v44)
      {
        int v35 = NSString;
        int v37 = [v14 model];
        int v32 = [v35 stringWithFormat:@" (%@)", v37];
      }
      *(_DWORD *)buf = 138544386;
      uint64_t v53 = v42;
      __int16 v54 = 2114;
      id v55 = v47;
      __int16 v56 = 2114;
      uint64_t v57 = v40;
      __int16 v58 = 2114;
      __int16 v59 = v46;
      __int16 v60 = 2114;
      uint64_t v61 = v32;
      _os_log_debug_impl(&dword_18ECEB000, v27, OS_LOG_TYPE_DEBUG, "%{public}@: Done sending request %{public}@ to %{public}@peer %{public}@%{public}@", buf, 0x34u);
      if (v44)
      {
      }
    }
  }
}

- (void)handleAvailabilityFailureWithPeer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = +[_DKSyncErrors internalFailure];
  if (![(_DKSyncRapportCommonStorage *)self isAvailable])
  {
    uint64_t v9 = +[_DKSyncErrors temporaryFailure];

    id v8 = (void *)v9;
  }
  uint64_t v10 = [v6 idsDeviceIdentifier];

  if (!v10)
  {
    uint64_t v11 = +[_DKSyncErrors temporaryFailure];

    int v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:].cold.4(self, v6, v12);
    }

    id v13 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:]();
    }

    id v8 = (void *)v11;
  }
  id v14 = -[_DKSyncRapportCommonStorage deviceForPeer:]((uint64_t)self, v6);

  if (!v14)
  {
    uint64_t v15 = +[_DKSyncErrors temporaryFailure];

    id v16 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:](self, v6, v16);
    }

    id v17 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:]();
    }

    id v8 = (void *)v15;
  }
  if (v7) {
    v7[2](v7, v8);
  }
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerSourceDeviceIDsWithCompletedHandshakes, 0);
  objc_storeStrong((id *)&self->_companionLinkClientsCleanupTimer, 0);
  objc_storeStrong((id *)&self->_companionLinkClients, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_failIfAsleepStats, 0);
  objc_storeStrong((id *)&self->_failIfAsleepOption, 0);
}

- (void)handleDeviceFound:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Ignoring device found with no idsDeviceIdentifier: %@", v4, v5);
}

- (void)handleDeviceFound:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: peers now...", v5);
}

- (void)handleDeviceChanged:changes:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Ignoring device changed with no idsDeviceIdentifier: %@", v4, v5);
}

- (void)handleDeviceChanged:changes:.cold.3()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_40(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Device %{public}@ is now paired companion", v5, v6);
}

- (void)handleDeviceChanged:changes:.cold.4()
{
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_40(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Device %{public}@ is no longer paired companion", v5, v6);
}

- (void)handleDeviceLost:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Ignoring device lost with no idsDeviceIdentifier: %@", v4, v5);
}

- (void)handleActivateWithError:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Started Rapport", v5);
}

- (void)handleActivateWithError:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling activate", v5);
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with beacon response: %@", v4, v5);
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to beacon, missing source device id or delegate", v5);
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_12_5(&dword_18ECEB000, "%{public}@: Failed to instantiate peer with ids device identifier %@", v4, v5);
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received beacon request: %@", v4, v5);
}

- (void)handleBeaconWithRequest:options:responseHandler:.cold.5()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling beacon request", v5);
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Calling response handler with fetch source device id response: %@", v4, v5);
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.2()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_11_5(&dword_18ECEB000, v3, v4, "%{public}@: Failed to start, missing source device id or delegate", v5);
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.3()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0_15(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_39(&dword_18ECEB000, "%{public}@: Received fetch source device id request: %@", v4, v5);
}

- (void)handleFetchSourceDeviceIDWithRequest:options:responseHandler:.cold.4()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch source device id request", v5);
}

- (void)transformResponseError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "%{public}@: Rapport request timed out", v5);
}

- (void)myDeviceID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  id v5 = [(id)OUTLINED_FUNCTION_10() name];
  uint64_t v6 = [a1 name];
  OUTLINED_FUNCTION_25_0();
  __int16 v10 = v7;
  uint64_t v11 = v8;
  _os_log_fault_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_FAULT, "%{public}@: Illegal state, transport %{public}@ running with no device ID, turning off transport %{public}@", v9, 0x20u);
}

- (void)handleFetchSourceDeviceIDWithResponse:options:error:peer:plStartDate:completion:.cold.1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4_11(&dword_18ECEB000, v3, v4, "%{public}@: Handling fetch source device id response", v5);
}

- (void)sendRequestID:(int)a3 request:(int)a4 peer:(int)a5 highPriority:(int)a6 options:(int)a7 responseHandler:(int)a8 .cold.3(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v32;
  a28 = v33;
  OUTLINED_FUNCTION_17_2();
  a18 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18_2();
  uint64_t v34 = &stru_1EDDE58B8;
  [(id)OUTLINED_FUNCTION_8_0() identifier];
  objc_claimAutoreleasedReturnValue();
  int v35 = [(id)OUTLINED_FUNCTION_16_4() model];
  if (v35)
  {
    __int16 v36 = NSString;
    [v31 model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_15_3();
    uint64_t v34 = [v36 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_18ECEB000, v29, OS_LOG_TYPE_FAULT, "%{public}@: Device disappeared for %{public}@peer %{public}@%{public}@", &buf, 0x2Au);
  if (v35)
  {
  }
  OUTLINED_FUNCTION_30();
}

- (void)handleAvailabilityFailureWithPeer:completion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10() debugDescription];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v2, v3, "%{public}@: Peer: %@", v4, v5, v6, v7, v8);
}

@end