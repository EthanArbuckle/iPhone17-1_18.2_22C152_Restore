@interface AVVCSessionFactory
+ (id)sharedInstance;
- (AVVCSessionFactory)init;
- (AVVCSessionManager)primarySessionManager;
- (NSMutableDictionary)sessionManagerMap;
- (OS_dispatch_queue)workQueue;
- (id)_wqCreatePrimarySessionManagerIfNeeded:(id)a3 clientType:(int64_t)a4 error:(id *)a5;
- (id)auxSessionManagers;
- (id)sessionForContext:(id)a3 clientType:(int64_t)a4 error:(id *)a5;
- (id)sessionForContext:(id)a3 error:(id *)a4;
- (id)sessionManagerForContext:(id)a3 clientType:(int64_t)a4 error:(id *)a5;
- (id)sessionWasCreatedBlock;
- (id)sessionWillBeDestroyedBlock;
- (void)_wqCreateAuxSessionAndManagerForDeviceUID:(id)a3 clientType:(int64_t)a4 session:(id *)a5 manager:(id *)a6 error:(id *)a7;
- (void)_wqSessionAndManagerForContext:(id)a3 clientType:(int64_t)a4 session:(id *)a5 manager:(id *)a6 error:(id *)a7;
- (void)cleanupContext:(id)a3;
- (void)releasePrimarySessionManager;
- (void)sessionForContext:(id)a3 clientType:(int64_t)a4 completion:(id)a5;
- (void)sessionForContext:(id)a3 completion:(id)a4;
- (void)sessionManagerForContext:(id)a3 clientType:(int64_t)a4 completion:(id)a5;
- (void)setPrimarySessionManager:(id)a3;
- (void)setSessionManagerMap:(id)a3;
- (void)setSessionWasCreatedBlock:(id)a3;
- (void)setSessionWillBeDestroyedBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation AVVCSessionFactory

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionWillBeDestroyedBlock, 0);
  objc_storeStrong(&self->_sessionWasCreatedBlock, 0);
  objc_storeStrong((id *)&self->_primarySessionManager, 0);
  objc_storeStrong((id *)&self->_sessionManagerMap, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setSessionWillBeDestroyedBlock:(id)a3
{
}

- (id)sessionWillBeDestroyedBlock
{
  return self->_sessionWillBeDestroyedBlock;
}

- (void)setSessionWasCreatedBlock:(id)a3
{
}

- (id)sessionWasCreatedBlock
{
  return self->_sessionWasCreatedBlock;
}

- (void)setPrimarySessionManager:(id)a3
{
}

- (AVVCSessionManager)primarySessionManager
{
  return self->_primarySessionManager;
}

- (void)setSessionManagerMap:(id)a3
{
}

- (NSMutableDictionary)sessionManagerMap
{
  return self->_sessionManagerMap;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)releasePrimarySessionManager
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AVVCSessionFactory_releasePrimarySessionManager__block_invoke;
  block[3] = &unk_1E5965AD8;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

uint64_t __50__AVVCSessionFactory_releasePrimarySessionManager__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v2 = *(id *)kAVVCScope;
    if (!v2) {
      return [*(id *)(a1 + 32) setPrimarySessionManager:0];
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) primarySessionManager];
    int v7 = 136315650;
    v8 = "AVVCSessionFactory.mm";
    __int16 v9 = 1024;
    int v10 = 351;
    __int16 v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Releasing primary session manager (%p)", (uint8_t *)&v7, 0x1Cu);
  }
  return [*(id *)(a1 + 32) setPrimarySessionManager:0];
}

- (id)auxSessionManagers
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1244;
  int v10 = __Block_byref_object_dispose__1245;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AVVCSessionFactory_auxSessionManagers__block_invoke;
  v5[3] = &unk_1E59649C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__AVVCSessionFactory_auxSessionManagers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) sessionManagerMap];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cleanupContext:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AVVCSessionFactory_cleanupContext___block_invoke;
  v7[3] = &unk_1E59648A8;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __37__AVVCSessionFactory_cleanupContext___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!contextIsRemora(*(AVVCContextSettings **)(a1 + 32)))
  {
    if (kAVVCScope)
    {
      id v10 = *(id *)kAVVCScope;
      if (!v10) {
        return;
      }
    }
    else
    {
      id v10 = (id)MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    id v8 = v10;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v30, [*(id *)(a1 + 32) activationMode]);
      uint64_t v13 = [*(id *)(a1 + 32) activationDeviceUID];
      *(_DWORD *)buf = 136315906;
      v32 = "AVVCSessionFactory.mm";
      __int16 v33 = 1024;
      int v34 = 333;
      __int16 v35 = 2080;
      v36 = v30;
      __int16 v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Nothing to clean up for context(%s, %@)", buf, 0x26u);
    }
LABEL_19:
    int v7 = v8;
LABEL_42:

    return;
  }
  uint64_t v2 = [*(id *)(a1 + 32) activationDeviceUID];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) activationDeviceUID];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) sessionManagerMap];
      id v6 = [*(id *)(a1 + 32) activationDeviceUID];
      int v7 = [v5 objectForKeyedSubscript:v6];

      id v8 = [v7 audioSession];
      if (kAVVCScope)
      {
        id v9 = *(id *)kAVVCScope;
        if (!v9) {
          goto LABEL_24;
        }
      }
      else
      {
        id v9 = (id)MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v30, [*(id *)(a1 + 32) activationMode]);
        v18 = [*(id *)(a1 + 32) activationDeviceUID];
        v19 = [v7 audioSession];
        *(_DWORD *)buf = 136316418;
        v32 = "AVVCSessionFactory.mm";
        __int16 v33 = 1024;
        int v34 = 311;
        __int16 v35 = 2080;
        v36 = v30;
        __int16 v37 = 2112;
        v38 = v18;
        __int16 v39 = 2048;
        v40 = v19;
        __int16 v41 = 2048;
        v42 = v7;
        _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Clean up context(%s, %@), about to release session(%p) and manager(%p)", buf, 0x3Au);
      }
LABEL_24:
      if (!v8)
      {
        if (kAVVCScope)
        {
          v23 = *(id *)kAVVCScope;
          if (!v23) {
            goto LABEL_41;
          }
        }
        else
        {
          v23 = MEMORY[0x1E4F14500];
          id v25 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v32 = "AVVCSessionFactory.mm";
          __int16 v33 = 1024;
          int v34 = 323;
          _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected missing session when cleaning up context", buf, 0x12u);
        }
        goto LABEL_40;
      }
      v20 = [*(id *)(a1 + 40) sessionWillBeDestroyedBlock];
      BOOL v21 = v20 == 0;

      if (v21)
      {
LABEL_41:
        v27 = [*(id *)(a1 + 40) sessionManagerMap];
        v28 = [*(id *)(a1 + 32) activationDeviceUID];
        [v27 setObject:0 forKeyedSubscript:v28];

        goto LABEL_42;
      }
      v22 = [*(id *)(a1 + 40) sessionWillBeDestroyedBlock];
      id v29 = 0;
      ((void (**)(void, void *, id *))v22)[2](v22, v7, &v29);
      v23 = v29;

      if (v23)
      {
        if (kAVVCScope)
        {
          v24 = *(id *)kAVVCScope;
          if (!v24) {
            goto LABEL_40;
          }
        }
        else
        {
          v24 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "AVVCSessionFactory.mm";
          __int16 v33 = 1024;
          int v34 = 318;
          __int16 v35 = 2112;
          v36 = (uint8_t *)v23;
          _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected error cleaning up context: %@", buf, 0x1Cu);
        }
      }
LABEL_40:

      goto LABEL_41;
    }
  }
  if (!kAVVCScope)
  {
    id v11 = (id)MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
LABEL_17:
    id v8 = v11;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v30, [*(id *)(a1 + 32) activationMode]);
      v15 = [*(id *)(a1 + 32) activationDeviceUID];
      *(_DWORD *)buf = 136315906;
      v32 = "AVVCSessionFactory.mm";
      __int16 v33 = 1024;
      int v34 = 328;
      __int16 v35 = 2080;
      v36 = v30;
      __int16 v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Can't cleanup because devID is missing in context(%s, %@)", buf, 0x26u);
    }
    goto LABEL_19;
  }
  id v11 = *(id *)kAVVCScope;
  if (v11) {
    goto LABEL_17;
  }
}

- (id)sessionManagerForContext:(id)a3 clientType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1244;
  v28 = __Block_byref_object_dispose__1245;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy__1244;
  v22 = __Block_byref_object_dispose__1245;
  id v23 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__AVVCSessionFactory_sessionManagerForContext_clientType_error___block_invoke;
  block[3] = &unk_1E59648F8;
  block[4] = self;
  id v10 = v8;
  id v14 = v10;
  v15 = &v24;
  id v16 = &v18;
  int64_t v17 = a4;
  dispatch_sync(workQueue, block);
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __64__AVVCSessionFactory_sessionManagerForContext_clientType_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  uint64_t v5 = a1[8];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(id *)(v6 + 40);
  id obj = v4;
  [v2 _wqSessionAndManagerForContext:v1 clientType:v5 session:0 manager:&obj error:&v7];
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v7);
}

- (void)sessionManagerForContext:(id)a3 clientType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__AVVCSessionFactory_sessionManagerForContext_clientType_completion___block_invoke;
  v13[3] = &unk_1E59648D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

void __69__AVVCSessionFactory_sessionManagerForContext_clientType_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  id v8 = 0;
  id v9 = 0;
  [v2 _wqSessionAndManagerForContext:v3 clientType:v4 session:0 manager:&v9 error:&v8];
  id v5 = v9;
  id v6 = v8;
  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

- (id)sessionForContext:(id)a3 clientType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1244;
  v28 = __Block_byref_object_dispose__1245;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = __Block_byref_object_copy__1244;
  v22 = __Block_byref_object_dispose__1245;
  id v23 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVVCSessionFactory_sessionForContext_clientType_error___block_invoke;
  block[3] = &unk_1E59648F8;
  block[4] = self;
  id v10 = v8;
  id v14 = v10;
  id v15 = &v24;
  int64_t v16 = &v18;
  int64_t v17 = a4;
  dispatch_sync(workQueue, block);
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __57__AVVCSessionFactory_sessionForContext_clientType_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  uint64_t v5 = a1[8];
  uint64_t v6 = *(void *)(a1[7] + 8);
  id v7 = *(id *)(v6 + 40);
  id obj = v4;
  [v2 _wqSessionAndManagerForContext:v1 clientType:v5 session:&obj manager:0 error:&v7];
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v7);
}

- (void)sessionForContext:(id)a3 clientType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__AVVCSessionFactory_sessionForContext_clientType_completion___block_invoke;
  v13[3] = &unk_1E59648D0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

void __62__AVVCSessionFactory_sessionForContext_clientType_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  id v8 = 0;
  id v9 = 0;
  [v2 _wqSessionAndManagerForContext:v3 clientType:v4 session:&v9 manager:0 error:&v8];
  id v5 = v9;
  id v6 = v8;
  uint64_t v7 = a1[6];
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

- (id)sessionForContext:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(AVVCSessionFactory *)self sessionForContext:a3 clientType:1 error:a4];

  return v4;
}

- (void)sessionForContext:(id)a3 completion:(id)a4
{
}

- (void)_wqSessionAndManagerForContext:(id)a3 clientType:(int64_t)a4 session:(id *)a5 manager:(id *)a6 error:(id *)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = (AVVCContextSettings *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (contextIsRemora(v12))
  {
    uint64_t v13 = [(AVVCContextSettings *)v12 activationDeviceUID];
    if (v13)
    {
      id v14 = [(AVVCContextSettings *)v12 activationDeviceUID];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        sessionManagerMap = self->_sessionManagerMap;
        int64_t v17 = [(AVVCContextSettings *)v12 activationDeviceUID];
        uint64_t v18 = [(NSMutableDictionary *)sessionManagerMap objectForKeyedSubscript:v17];

        v19 = [v18 audioSession];
        id v20 = v19;
        if (!v19 || !v18)
        {
          id v37 = v18;
          id v38 = v19;
          [(AVVCSessionFactory *)self _wqCreateAuxSessionAndManagerForDeviceUID:v12 clientType:a4 session:&v38 manager:&v37 error:a7];
          id v21 = v38;

          id v22 = v37;
          uint64_t v18 = v22;
          id v20 = v21;
        }
        goto LABEL_18;
      }
    }
    if (kAVVCScope)
    {
      id v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_17:
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
        uint64_t v18 = 0;
        id v20 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      id v25 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "AVVCSessionFactory.mm";
      __int16 v42 = 1024;
      int v43 = 200;
      _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqSessionForContext: activationDeviceUID must be specified for this mode", buf, 0x12u);
    }

    goto LABEL_17;
  }
  id v23 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  __int16 v33 = __86__AVVCSessionFactory__wqSessionAndManagerForContext_clientType_session_manager_error___block_invoke;
  int v34 = &unk_1E59648A8;
  id v20 = v23;
  id v35 = v20;
  uint64_t v24 = v12;
  v36 = v24;
  if (-[AVVCSessionFactory _wqSessionAndManagerForContext:clientType:session:manager:error:]::onceToken != -1) {
    dispatch_once(&-[AVVCSessionFactory _wqSessionAndManagerForContext:clientType:session:manager:error:]::onceToken, &v31);
  }
  uint64_t v18 = -[AVVCSessionFactory _wqCreatePrimarySessionManagerIfNeeded:clientType:error:](self, "_wqCreatePrimarySessionManagerIfNeeded:clientType:error:", v24, a4, a7, v31, v32, v33, v34);

LABEL_18:
  if (kAVVCScope)
  {
    id v27 = *(id *)kAVVCScope;
    if (!v27) {
      goto LABEL_25;
    }
  }
  else
  {
    id v27 = (id)MEMORY[0x1E4F14500];
    id v28 = MEMORY[0x1E4F14500];
  }
  id v29 = v27;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)v39, [(AVVCContextSettings *)v12 activationMode]);
    v30 = [(AVVCContextSettings *)v12 activationDeviceUID];
    *(_DWORD *)buf = 136316418;
    __int16 v41 = "AVVCSessionFactory.mm";
    __int16 v42 = 1024;
    int v43 = 217;
    __int16 v44 = 2048;
    id v45 = v20;
    __int16 v46 = 2048;
    v47 = v18;
    __int16 v48 = 2080;
    v49 = v39;
    __int16 v50 = 2112;
    v51 = v30;
    _os_log_impl(&dword_19D794000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d retrieved session (%p) and sessionManager (%p) for context(%s, %@)", buf, 0x3Au);
  }
LABEL_25:
  if (a5) {
    *a5 = v20;
  }
  if (a6) {
    *a6 = v18;
  }
}

void __86__AVVCSessionFactory__wqSessionAndManagerForContext_clientType_session_manager_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v2 = *(id *)kAVVCScope;
    if (!v2) {
      return;
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  uint64_t v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    CAX4CCString::CAX4CCString((CAX4CCString *)v7, [*(id *)(a1 + 40) activationMode]);
    id v6 = [*(id *)(a1 + 40) activationDeviceUID];
    *(_DWORD *)buf = 136316162;
    id v9 = "AVVCSessionFactory.mm";
    __int16 v10 = 1024;
    int v11 = 211;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2080;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    int64_t v17 = v6;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d First time primary session (%p) retrieved. Context(%s, %@)", buf, 0x30u);
  }
}

- (id)_wqCreatePrimarySessionManagerIfNeeded:(id)a3 clientType:(int64_t)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  primarySessionManager = self->_primarySessionManager;
  if (!primarySessionManager)
  {
    __int16 v10 = [AVVCSessionManager alloc];
    int v11 = [MEMORY[0x1E4F4E9F8] sharedInstance];
    __int16 v12 = [(AVVCSessionManager *)v10 initWithSession:v11];
    uint64_t v13 = self->_primarySessionManager;
    self->_primarySessionManager = v12;

    int v14 = [(AVVCSessionManager *)self->_primarySessionManager setupOneTimeSessionSettingsForClient:a4];
    if (a5 && v14)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
    if (kAVVCScope)
    {
      id v15 = *(id *)kAVVCScope;
      if (!v15)
      {
LABEL_12:
        primarySessionManager = self->_primarySessionManager;
        goto LABEL_13;
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    int64_t v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = self->_primarySessionManager;
      CAX4CCString::CAX4CCString((CAX4CCString *)v22, [v8 activationMode]);
      v19 = [v8 activationDeviceUID];
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = "AVVCSessionFactory.mm";
      __int16 v25 = 1024;
      int v26 = 175;
      __int16 v27 = 2048;
      id v28 = v18;
      __int16 v29 = 2080;
      v30 = v22;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created primary session manager (%p) and setup onetime settings for context(%s, %@)", buf, 0x30u);
    }
    goto LABEL_12;
  }
LABEL_13:
  id v20 = primarySessionManager;

  return v20;
}

- (void)_wqCreateAuxSessionAndManagerForDeviceUID:(id)a3 clientType:(int64_t)a4 session:(id *)a5 manager:(id *)a6 error:(id *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ((MGGetSInt32Answer() == 4
     || ((int v10 = MGGetSInt32Answer(), v11 = MGGetBoolAnswer(), v10 == 7) ? (v12 = 1) : (v12 = v11), v12 == 1))
    && (MGGetBoolAnswer() & 1) == 0)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F4E9F8] auxiliarySession];
  }
  sessionManagerMap = self->_sessionManagerMap;
  id v15 = [v9 activationDeviceUID];
  id v16 = [(NSMutableDictionary *)sessionManagerMap objectForKeyedSubscript:v15];

  if (v16)
  {
    if (kAVVCScope)
    {
      id v17 = *(id *)kAVVCScope;
      if (!v17) {
        goto LABEL_17;
      }
    }
    else
    {
      id v17 = (id)MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = self->_sessionManagerMap;
      uint64_t v52 = [v9 activationDeviceUID];
      id v21 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v52];
      id v22 = self->_sessionManagerMap;
      id v23 = [v9 activationDeviceUID];
      uint64_t v24 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v23];
      __int16 v25 = [v24 audioSession];
      CAX4CCString::CAX4CCString((CAX4CCString *)v56, [v9 activationMode]);
      int v26 = [v9 activationDeviceUID];
      *(_DWORD *)buf = 136316418;
      v58 = "AVVCSessionFactory.mm";
      __int16 v59 = 1024;
      int v60 = 129;
      __int16 v61 = 2048;
      v62 = v21;
      __int16 v63 = 2048;
      v64 = v25;
      __int16 v65 = 2080;
      v66 = v56;
      __int16 v67 = 2112;
      v68 = v26;
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqCreateAuxSessionAndManagerForDeviceUID: unexpected existing session manager(%p) audioSession(%p) for context(%s, %@)", buf, 0x3Au);
    }
  }
LABEL_17:
  id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "activationMode"));
  __int16 v29 = [v9 activationDeviceUID];
  v30 = objc_msgSend(v27, "initWithObjectsAndKeys:", v28, @"activation trigger", v29, @"activation device uid", 0);

  [v13 setActivationContext:v30 error:a7];
  if (*a7 && [*a7 code])
  {
    if (kAVVCScope)
    {
      id v31 = *(id *)kAVVCScope;
      if (!v31) {
        goto LABEL_26;
      }
    }
    else
    {
      id v31 = (id)MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }
    uint64_t v33 = v31;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v34 = [*a7 code];
      *(_DWORD *)buf = 136315650;
      v58 = "AVVCSessionFactory.mm";
      __int16 v59 = 1024;
      int v60 = 140;
      __int16 v61 = 1024;
      LODWORD(v62) = v34;
      _os_log_impl(&dword_19D794000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqCreateAuxSessionAndManagerForDeviceUID: setActivationContext returned error(%d)", buf, 0x18u);
    }
  }
LABEL_26:
  id v35 = [[AVVCSessionManager alloc] initWithSession:v13];
  [(AVVCSessionManager *)v35 setupOneTimeSessionSettingsForClient:a4];
  v36 = self->_sessionManagerMap;
  id v37 = [v9 activationDeviceUID];
  id v38 = [(NSMutableDictionary *)v36 objectForKeyedSubscript:v37];
  LOBYTE(v36) = v38 == 0;

  if (v36) {
    goto LABEL_34;
  }
  if (kAVVCScope)
  {
    id v39 = *(id *)kAVVCScope;
    if (!v39) {
      goto LABEL_34;
    }
  }
  else
  {
    id v39 = (id)MEMORY[0x1E4F14500];
    id v40 = MEMORY[0x1E4F14500];
  }
  __int16 v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    __int16 v42 = self->_sessionManagerMap;
    int v43 = [v9 activationDeviceUID];
    __int16 v44 = [(NSMutableDictionary *)v42 objectForKeyedSubscript:v43];
    *(_DWORD *)buf = 136315650;
    v58 = "AVVCSessionFactory.mm";
    __int16 v59 = 1024;
    int v60 = 146;
    __int16 v61 = 2048;
    v62 = v44;
    _os_log_impl(&dword_19D794000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d _wqCreateAuxSessionAndManagerForDeviceUID: unexpected existing sessionManager(%p)", buf, 0x1Cu);
  }
LABEL_34:
  id v45 = self->_sessionManagerMap;
  __int16 v46 = [v9 activationDeviceUID];
  [(NSMutableDictionary *)v45 setObject:v35 forKeyedSubscript:v46];

  if (kAVVCScope)
  {
    id v47 = *(id *)kAVVCScope;
    if (!v47) {
      goto LABEL_41;
    }
  }
  else
  {
    id v47 = (id)MEMORY[0x1E4F14500];
    id v48 = MEMORY[0x1E4F14500];
  }
  v49 = v47;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)v56, [v9 activationMode]);
    __int16 v50 = [v9 activationDeviceUID];
    *(_DWORD *)buf = 136316418;
    v58 = "AVVCSessionFactory.mm";
    __int16 v59 = 1024;
    int v60 = 150;
    __int16 v61 = 2048;
    v62 = v13;
    __int16 v63 = 2048;
    v64 = v35;
    __int16 v65 = 2080;
    v66 = v56;
    __int16 v67 = 2112;
    v68 = v50;
    _os_log_impl(&dword_19D794000, v49, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created aux session (%p) and session manager (%p) and setup onetime settings for context(%s, %@)", buf, 0x3Au);
  }
LABEL_41:
  sessionWasCreatedBlock = (void (**)(id, AVVCSessionManager *, id *))self->_sessionWasCreatedBlock;
  if (sessionWasCreatedBlock) {
    sessionWasCreatedBlock[2](sessionWasCreatedBlock, v35, a7);
  }
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v35;
  }
}

- (AVVCSessionFactory)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVVCSessionFactory;
  id v2 = [(AVVCSessionFactory *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("AVVCSessionFactory Work Queue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionManagerMap = v2->_sessionManagerMap;
    v2->_sessionManagerMap = v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVVCSessionFactory_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVVCSessionFactory sharedInstance]::onceToken != -1) {
    dispatch_once(&+[AVVCSessionFactory sharedInstance]::onceToken, block);
  }
  id v2 = (void *)sSharedInstance;

  return v2;
}

void __36__AVVCSessionFactory_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v1;

  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      return;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "AVVCSessionFactory.mm";
    __int16 v7 = 1024;
    int v8 = 71;
    __int16 v9 = 2048;
    uint64_t v10 = sSharedInstance;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created AVVCSessionFactory (%p)", (uint8_t *)&v5, 0x1Cu);
  }
}

@end