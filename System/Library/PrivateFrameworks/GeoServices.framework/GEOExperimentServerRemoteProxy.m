@interface GEOExperimentServerRemoteProxy
- (GEOABAssignmentResponse)experimentsInfo;
- (GEOExperimentServerProxyDelegate)delegate;
- (GEOExperimentServerRemoteProxy)initWithDelegate:(id)a3;
- (void)_debug_fetchAllAvailableExperiments:(id)a3;
- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3;
- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3;
- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5;
- (void)abAssignUUIDWithCompletionHandler:(id)a3;
- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3;
- (void)dealloc;
- (void)forceUpdate;
- (void)refreshDatasetABStatus:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation GEOExperimentServerRemoteProxy

- (GEOExperimentServerRemoteProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOExperimentServerRemoteProxy;
  v5 = [(GEOExperimentServerRemoteProxy *)&v22 init];
  v6 = v5;
  if (v5)
  {
    [(GEOExperimentServerRemoteProxy *)v5 setDelegate:v4];
    v6->_experimentsInfoLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v6);
    global_queue = geo_get_global_queue();
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __51__GEOExperimentServerRemoteProxy_initWithDelegate___block_invoke;
    v19 = &unk_1E53DD2C0;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("com.apple.GeoServices.experimentsChanged", &v6->_experimentsChangedToken, global_queue, &v16);

    v8 = GEOExperimentConfigurationPath();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E4F1C9B8];
      v10 = GEOExperimentConfigurationPath();
      v11 = objc_msgSend(v9, "dataWithContentsOfFile:", v10, v16, v17, v18, v19);

      if ([v11 length])
      {
        v12 = [[GEOABAssignmentResponse alloc] initWithData:v11];
        experimentsInfo = v6->_experimentsInfo;
        v6->_experimentsInfo = v12;
      }
    }
    v14 = v6;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (GEOABAssignmentResponse)experimentsInfo
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_experimentsInfo;
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

void __51__GEOExperimentServerRemoteProxy_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = GEOFindOrCreateLog("com.apple.GeoServices", "Experiments");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Received experiments change notification. Informing delegate.", v9, 2u);
    }

    v3 = GEOExperimentConfigurationPath();
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
      if ([v4 length]) {
        v5 = [[GEOABAssignmentResponse alloc] initWithData:v4];
      }
      else {
        v5 = 0;
      }
      os_unfair_lock_lock_with_options();
      v6 = (void *)*((void *)WeakRetained + 2);
      *((void *)WeakRetained + 2) = v5;
      v7 = v5;

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
      v8 = [WeakRetained delegate];
      [v8 serverProxy:WeakRetained didChangeExperimentsInfo:v7];
    }
  }
}

- (void)dealloc
{
  [(GEOExperimentServerRemoteProxy *)self setDelegate:0];
  notify_cancel(self->_experimentsChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOExperimentServerRemoteProxy;
  [(GEOExperimentServerRemoteProxy *)&v3 dealloc];
}

- (void)refreshDatasetABStatus:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 hasDatasetId])
  {
    v5 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
    v12 = @"datasetABStatus";
    v6 = [v4 data];
    v13[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    v10[0] = @"message";
    v10[1] = @"userInfo";
    v11[0] = @"experiments.refreshDataset";
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    [v5 sendMessage:v9];
  }
}

- (void)abAssignUUIDWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void *, void *, void))a3;
  os_unfair_lock_lock_with_options();
  id v4 = objc_msgSend((id)qword_1EB2A0600, "dateByAddingTimeInterval:", GEOConfigGetDouble(GeoServicesConfig_ExperimentBucketGUIDExpireInterval, (uint64_t)off_1E9113D58));
  uint64_t v5 = [(id)qword_1EB2A0600 compare:v4];
  v6 = (void *)qword_1EB2A0600;
  v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v6 compare:v7];

  v9 = (void *)qword_1EB2A0608;
  if (qword_1EB2A0608) {
    BOOL v10 = v5 == -1;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10 && v8 == -1)
  {
    uint64_t v16 = (void *)[(id)qword_1EB2A0600 copy];
    uint64_t v17 = (void *)[(id)qword_1EB2A0608 copy];
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_320);
    v3[2](v3, v17, v16, 0);
  }
  else
  {
    qword_1EB2A0608 = 0;

    v12 = (void *)qword_1EB2A0600;
    qword_1EB2A0600 = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_320);
    v13 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"experiments.fetchAssignUUID", @"message", 0);
    global_queue = (void *)geo_get_global_queue();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__GEOExperimentServerRemoteProxy_abAssignUUIDWithCompletionHandler___block_invoke;
    v18[3] = &unk_1E53DA250;
    v19 = v3;
    [v13 sendDictionary:v14 withReply:global_queue handler:v18];
  }
}

void __68__GEOExperimentServerRemoteProxy_abAssignUUIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (!v5)
  {
    v6 = [v13 objectForKey:@"userInfo"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!qword_1EB2A0600)
      {
        uint64_t v7 = [v6 objectForKeyedSubscript:@"uuid"];
        uint64_t v8 = (void *)qword_1EB2A0608;
        qword_1EB2A0608 = v7;

        uint64_t v9 = [v6 objectForKeyedSubscript:@"uuidDate"];
        BOOL v10 = (void *)qword_1EB2A0600;
        qword_1EB2A0600 = v9;
      }
      id v5 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"reply type is not a dictionary"];
    }
  }
  v11 = (void *)[(id)qword_1EB2A0600 copy];
  v12 = (void *)[(id)qword_1EB2A0608 copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_320);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void *, void *, id))a3;
  os_unfair_lock_lock_with_options();
  id v4 = objc_msgSend((id)qword_1EB2A0600, "dateByAddingTimeInterval:", GEOConfigGetDouble(GeoServicesConfig_ExperimentBucketGUIDExpireInterval, (uint64_t)off_1E9113D58));
  uint64_t v5 = [(id)qword_1EB2A0600 compare:v4];
  v6 = (void *)qword_1EB2A0600;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v6 compare:v7];

  uint64_t v9 = (void *)qword_1EB2A0608;
  if (qword_1EB2A0608) {
    BOOL v10 = v5 == -1;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10 && v8 == -1)
  {
    id v16 = 0;
  }
  else
  {
    qword_1EB2A0608 = 0;

    v12 = (void *)qword_1EB2A0600;
    qword_1EB2A0600 = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_320);
    id v13 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"experiments.fetchAssignUUIDSync", @"message", 0);
    id v24 = 0;
    v15 = [v13 sendDictionaryWithReplySync:v14 error:&v24];
    id v16 = v24;
    os_unfair_lock_lock_with_options();
    if (!v16)
    {
      uint64_t v17 = [v15 objectForKey:@"userInfo"];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!qword_1EB2A0600)
        {
          uint64_t v18 = [v17 objectForKeyedSubscript:@"uuid"];
          v19 = (void *)qword_1EB2A0608;
          qword_1EB2A0608 = v18;

          uint64_t v20 = [v17 objectForKeyedSubscript:@"uuidDate"];
          v21 = (void *)qword_1EB2A0600;
          qword_1EB2A0600 = v20;
        }
        id v16 = 0;
      }
      else
      {
        id v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"reply type is not a dictionary"];
      }
    }
  }
  objc_super v22 = (void *)[(id)qword_1EB2A0600 copy];
  v23 = (void *)[(id)qword_1EB2A0608 copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_320);
  v3[2](v3, v23, v22, v16);
}

- (void)forceUpdate
{
  id v4 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"experiments.update", @"message", 0);
  id v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  [v4 sendMessage:v3];
}

- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v14 = a3;
  uint64_t v7 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  BOOL v10 = [NSNumber numberWithInt:v5];
  v11 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"type", v10, @"placeRequestType", 0);

  if ([v14 length]) {
    [v11 setObject:v14 forKey:@"querySubstring"];
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"experiments.setQuerySubstring", @"message", v11, @"userInfo", 0);
  id v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  [v7 sendMessage:v13];
}

- (void)_debug_fetchAllAvailableExperiments:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
  v11 = @"message";
  v12[0] = @"experiments.fetchAllExperiments";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  global_queue = (void *)geo_get_global_queue();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__GEOExperimentServerRemoteProxy__debug_fetchAllAvailableExperiments___block_invoke;
  v9[3] = &unk_1E53E13A8;
  id v10 = v3;
  id v8 = v3;
  [v4 sendMessage:v6 withReply:global_queue handler:v9];
}

void __70__GEOExperimentServerRemoteProxy__debug_fetchAllAvailableExperiments___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (MEMORY[0x18C1213B0]() != MEMORY[0x1E4F145A8])
  {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(&cfstr_SUnexpectedRes.isa, "-[GEOExperimentServerRemoteProxy _debug_fetchAllAvailableExperiments:]_block_invoke", "com.apple.geod");
      goto LABEL_16;
    }
    id v4 = [v3 objectForKey:@"userInfo"];
    uint64_t v5 = objc_msgSend(v4, "_geo_errorForKey:", @"err");
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      id v8 = @"response data is not NSData";
    }
    else
    {
      v6 = [v4 objectForKey:@"response"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [[GEOABAssignmentResponse alloc] initWithData:v6];
        if (v9)
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          id v10 = 0;
        }
        else
        {
          id v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"response is nil"];
        }

        goto LABEL_12;
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      id v8 = @"response is nil";
    }
    id v10 = [v7 GEOErrorWithCode:-11 reason:v8];
LABEL_12:

    if (v10) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

    goto LABEL_15;
  }
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s: Could not connect to geod on %s", "-[GEOExperimentServerRemoteProxy _debug_fetchAllAvailableExperiments:]_block_invoke", "com.apple.geod");
  NSLog(&stru_1ED5215D0.isa, v3);
  id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:v3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_15:

LABEL_16:
}

- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments_Debug" eventHandler:0];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = v5;
  if (v3) {
    [v5 setObject:v3 forKeyedSubscript:@"abdr"];
  }
  v9[0] = @"message";
  v9[1] = @"userInfo";
  v10[0] = @"experiments.setActiveBranch";
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  [v4 sendMessage:v8];
}

- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[GEOXPCConnection createServerConnectionFor:5 debugIdentifier:@"Experiments" eventHandler:0];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = v5;
  if (v3) {
    [v5 setObject:v3 forKeyedSubscript:@"bucketIdDR"];
  }
  v9[0] = @"message";
  v9[1] = @"userInfo";
  v10[0] = @"experiments.setBucketId";
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  [v4 sendMessage:v8];
}

- (GEOExperimentServerProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOExperimentServerProxyDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentsInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end