@interface MRAVClusterController
+ (BOOL)canBeClusterMember;
+ (id)getClusterLeaderUID;
+ (id)getClusterUID;
+ (id)sharedController;
- (BOOL)needsCommandRedirection;
- (MRAVClusterController)init;
- (NSString)clusterLeaderUID;
- (NSString)clusterUID;
- (unint64_t)clusterStatus;
- (unint64_t)onQueue_computeClusterStatus;
- (unsigned)clusterType;
- (void)deviceInfoDidChangeNotification:(id)a3;
- (void)getClusterLeaderEndpoint:(id)a3;
- (void)getClusterStatus:(id)a3;
- (void)onQueue_notifyObserversWithClusterStatus:(unint64_t)a3;
- (void)onQueue_notifyObserversWithClusterType:(unsigned int)a3;
- (void)onQueue_setClusterStatus:(unint64_t)a3;
- (void)onQueue_setClusterType:(unsigned int)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateClusterInformation;
@end

@implementation MRAVClusterController

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MRAVClusterController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)_MRAVClusterControler_sharedController;

  return v2;
}

- (unsigned)clusterType
{
  if (!+[MRAVClusterController canBeClusterMember]) {
    return 0;
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (unint64_t)clusterStatus
{
  if (!+[MRAVClusterController canBeClusterMember]) {
    return 0;
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

+ (BOOL)canBeClusterMember
{
  return 0;
}

- (BOOL)needsCommandRedirection
{
  return [(MRAVClusterController *)self clusterType] == 2
      && [(MRAVClusterController *)self clusterStatus] == 2;
}

uint64_t __41__MRAVClusterController_sharedController__block_invoke(uint64_t a1)
{
  _MRAVClusterControler_sharedController = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (MRAVClusterController)init
{
  v25.receiver = self;
  v25.super_class = (Class)MRAVClusterController;
  unint64_t v2 = [(MRAVClusterController *)&v25 init];
  if (v2)
  {
    v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"%@-callback", v5];
    uint64_t v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"%@-serial", v13];
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v19;

    if (+[MRAVClusterController canBeClusterMember])
    {
      uint64_t v21 = MRMediaRemoteCopyDeviceUID();
      localPairingIdentity = v2->_localPairingIdentity;
      v2->_localPairingIdentity = (NSString *)v21;
    }
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v2 selector:sel_deviceInfoDidChangeNotification_ name:@"kMRDeviceInfoDidChangeNotification" object:0];

    [(MRAVClusterController *)v2 updateClusterInformation];
  }
  return v2;
}

- (void)updateClusterInformation
{
  if (+[MRAVClusterController canBeClusterMember]) {
    msv_dispatch_sync_on_queue();
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MRAVClusterController_registerObserver___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __42__MRAVClusterController_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MRAVClusterController_unregisterObserver___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __44__MRAVClusterController_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

uint64_t __36__MRAVClusterController_clusterType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 64);
  return result;
}

uint64_t __38__MRAVClusterController_clusterStatus__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (NSString)clusterLeaderUID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__21;
  v10 = __Block_byref_object_dispose__21;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MRAVClusterController_clusterLeaderUID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

uint64_t __41__MRAVClusterController_clusterLeaderUID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (NSString)clusterUID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__21;
  v10 = __Block_byref_object_dispose__21;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MRAVClusterController_clusterUID__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

uint64_t __35__MRAVClusterController_clusterUID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)getClusterStatus:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, unint64_t))a3 + 2))(v5, [(MRAVClusterController *)self clusterStatus]);
}

- (void)getClusterLeaderEndpoint:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[MRAVClusterController canBeClusterMember]
    && [(MRAVClusterController *)self clusterStatus] == 2)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__21;
    v31 = __Block_byref_object_dispose__21;
    id v32 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke;
    block[3] = &unk_1E57D0590;
    block[4] = self;
    void block[5] = &v27;
    dispatch_sync(serialQueue, block);
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    dispatch_queue_t v9 = [v8 UUIDString];

    v10 = [NSString stringWithFormat:@"Discovering cluster leader with UID: %@", v28[5]];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"getClusterLeaderEndpoint", v9];
    v12 = v11;
    if (v10) {
      [v11 appendFormat:@" for %@", v10];
    }
    v13 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    id v14 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    uint64_t v15 = v28[5];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke_32;
    v19[3] = &unk_1E57D4FD8;
    v20 = @"getClusterLeaderEndpoint";
    id v16 = v9;
    id v21 = v16;
    id v17 = v5;
    id v22 = v17;
    id v24 = v4;
    objc_super v25 = &v27;
    id v18 = v10;
    id v23 = v18;
    [(MRAVLightweightReconnaissanceSession *)v14 searchEndpointsForOutputDeviceUID:v15 timeout:@"Discover cluster leader endpoint" reason:v6 queue:v19 completion:5.0];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

void __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke_32(void *a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Failed to discover cluster leader endpoint with UID: %@", *(void *)(*(void *)(a1[9] + 8) + 40)];
    uint64_t v15 = a1[7];
    id v16 = _MRLogForCategory(0xAuLL);
    dispatch_queue_t v9 = v16;
    if (v6 || !v7)
    {
      if (v6)
      {
        BOOL v33 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        if (!v15)
        {
          if (!v33) {
            goto LABEL_37;
          }
LABEL_34:
          __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_cold_1((uint64_t)a1);
          goto LABEL_37;
        }
        if (!v33) {
          goto LABEL_37;
        }
        uint64_t v34 = a1[4];
        uint64_t v35 = a1[5];
        v36 = (void *)a1[7];
        id v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:a1[6]];
        *(_DWORD *)buf = 138544386;
        uint64_t v53 = v34;
        __int16 v54 = 2114;
        uint64_t v55 = v35;
        __int16 v56 = 2114;
        id v57 = v6;
        __int16 v58 = 2114;
        v59 = v36;
        __int16 v60 = 2048;
        uint64_t v61 = v37;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_32:

        goto LABEL_37;
      }
      BOOL v41 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (!v41) {
          goto LABEL_37;
        }
        uint64_t v49 = a1[4];
        uint64_t v50 = a1[5];
        id v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:a1[6]];
        *(_DWORD *)buf = 138543874;
        uint64_t v53 = v49;
        __int16 v54 = 2114;
        uint64_t v55 = v50;
        __int16 v56 = 2048;
        id v57 = v51;
        id v23 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v24 = v9;
        uint32_t v25 = 32;
        goto LABEL_31;
      }
      if (!v41) {
        goto LABEL_37;
      }
      uint64_t v42 = a1[4];
      uint64_t v43 = a1[5];
      v44 = (void *)a1[7];
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138544130;
      uint64_t v53 = v42;
      __int16 v54 = 2114;
      uint64_t v55 = v43;
      __int16 v56 = 2114;
      id v57 = v44;
      __int16 v58 = 2048;
      v59 = v45;
      id v23 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    else
    {
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (!v17) {
          goto LABEL_37;
        }
        uint64_t v18 = a1[4];
        uint64_t v19 = a1[5];
        v20 = (void *)a1[7];
        id v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:a1[6]];
        *(_DWORD *)buf = 138544386;
        uint64_t v53 = v18;
        __int16 v54 = 2114;
        uint64_t v55 = v19;
        __int16 v56 = 2112;
        id v57 = v7;
        __int16 v58 = 2114;
        v59 = v20;
        __int16 v60 = 2048;
        uint64_t v61 = v22;
        id v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v24 = v9;
        uint32_t v25 = 52;
        goto LABEL_31;
      }
      if (!v17) {
        goto LABEL_37;
      }
      uint64_t v46 = a1[4];
      uint64_t v47 = a1[5];
      id v21 = [MEMORY[0x1E4F1C9C8] date];
      [v21 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138544130;
      uint64_t v53 = v46;
      __int16 v54 = 2114;
      uint64_t v55 = v47;
      __int16 v56 = 2112;
      id v57 = v7;
      __int16 v58 = 2048;
      v59 = v48;
      id v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    id v24 = v9;
    uint32_t v25 = 42;
LABEL_31:
    _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    goto LABEL_32;
  }
  uint64_t v7 = [NSString stringWithFormat:@"Discovered leader endpoint: %@", v5];
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  dispatch_queue_t v9 = v8;
  if (!v6)
  {
    BOOL v26 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v26) {
        goto LABEL_37;
      }
      uint64_t v27 = a1[4];
      uint64_t v28 = a1[5];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138544130;
      uint64_t v53 = v27;
      __int16 v54 = 2114;
      uint64_t v55 = v28;
      __int16 v56 = 2114;
      id v57 = v7;
      __int16 v58 = 2048;
      v59 = v29;
      v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v31 = v9;
      uint32_t v32 = 42;
    }
    else
    {
      if (!v26) {
        goto LABEL_37;
      }
      uint64_t v38 = a1[4];
      uint64_t v39 = a1[5];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:a1[6]];
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v38;
      __int16 v54 = 2114;
      uint64_t v55 = v39;
      __int16 v56 = 2048;
      id v57 = v40;
      v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v31 = v9;
      uint32_t v32 = 32;
    }
    _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_23;
  }
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (!v10) {
      goto LABEL_37;
    }
    goto LABEL_34;
  }
  if (v10)
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[6]];
    *(_DWORD *)buf = 138544386;
    uint64_t v53 = v11;
    __int16 v54 = 2114;
    uint64_t v55 = v12;
    __int16 v56 = 2114;
    id v57 = v6;
    __int16 v58 = 2114;
    v59 = v7;
    __int16 v60 = 2048;
    uint64_t v61 = v14;
    _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_23:
  }
LABEL_37:

  (*(void (**)(void))(a1[8] + 16))();
}

- (void)deviceInfoDidChangeNotification:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = MRGetOriginFromUserInfo(v5);
  if ([v4 isLocal]) {
    [(MRAVClusterController *)self updateClusterInformation];
  }
}

void __49__MRAVClusterController_updateClusterInformation__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(id)objc_opt_class() getClusterUID];
  id v3 = [(id)objc_opt_class() getClusterLeaderUID];
  uint64_t v4 = [(id)objc_opt_class() getClusterType];
  int v5 = [v2 isEqual:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 && (v7 = [v3 isEqual:*(void *)(v6 + 48)], uint64_t v6 = *(void *)(a1 + 32), v7))
  {
    int v8 = *(_DWORD *)(v6 + 64);
    objc_storeStrong((id *)(v6 + 40), v2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v3);
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterStatus:", objc_msgSend(*(id *)(a1 + 32), "onQueue_computeClusterStatus"));
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterType:", v4);
    if (v4 == v8) {
      goto LABEL_12;
    }
  }
  else
  {
    objc_storeStrong((id *)(v6 + 40), v2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v3);
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterStatus:", objc_msgSend(*(id *)(a1 + 32), "onQueue_computeClusterStatus"));
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterType:", v4);
  }
  dispatch_queue_t v9 = _MRLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 64) - 1;
    if (v10 > 2) {
      uint64_t v11 = @"None";
    }
    else {
      uint64_t v11 = off_1E57D4FF8[v10];
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v12 + 40);
    uint64_t v13 = *(void *)(v12 + 48);
    int v15 = 138412802;
    id v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "Cluster information updated: type=%@ | clusterUID=%{public}@ | leaderUID=%{public}@", (uint8_t *)&v15, 0x20u);
  }

LABEL_12:
}

- (unint64_t)onQueue_computeClusterStatus
{
  if (!self->_clusterUID) {
    return 0;
  }
  if ([(NSString *)self->_clusterLeaderUID isEqualToString:self->_localPairingIdentity]) {
    return 1;
  }
  return 2;
}

- (void)onQueue_setClusterType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_clusterType != v3)
  {
    self->_clusterType = v3;
    [(MRAVClusterController *)self onQueue_notifyObserversWithClusterType:v3];
  }
}

- (void)onQueue_setClusterStatus:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_clusterStatus != a3)
  {
    self->_clusterStatus = a3;
    [(MRAVClusterController *)self onQueue_notifyObserversWithClusterStatus:a3];
  }
}

- (void)onQueue_notifyObserversWithClusterStatus:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  int v5 = [(NSHashTable *)self->_observers allObjects];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRAVClusterController_onQueue_notifyObserversWithClusterStatus___block_invoke;
  block[3] = &unk_1E57D4358;
  id v9 = v5;
  unsigned int v10 = self;
  unint64_t v11 = a3;
  id v7 = v5;
  dispatch_async(callbackQueue, block);
}

void __66__MRAVClusterController_onQueue_notifyObserversWithClusterStatus___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "clusterController:clusterStatusDidChange:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)onQueue_notifyObserversWithClusterType:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRAVClusterController_onQueue_notifyObserversWithClusterType___block_invoke;
  block[3] = &unk_1E57D1DC8;
  id v9 = v5;
  long long v10 = self;
  unsigned int v11 = a3;
  id v7 = v5;
  dispatch_async(callbackQueue, block);
}

void __64__MRAVClusterController_onQueue_notifyObserversWithClusterType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "clusterController:clusterTypeDidChange:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

+ (id)getClusterUID
{
  id v2 = (void *)MRMediaRemoteCopyLocalClusterID();

  return v2;
}

+ (id)getClusterLeaderUID
{
  id v2 = (void *)MRMediaRemoteCopyLocalClusterLeaderIdentity();

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterLeaderUID, 0);
  objc_storeStrong((id *)&self->_clusterUID, 0);
  objc_storeStrong((id *)&self->_localPairingIdentity, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end