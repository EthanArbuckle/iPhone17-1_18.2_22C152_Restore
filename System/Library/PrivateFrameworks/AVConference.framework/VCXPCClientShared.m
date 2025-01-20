@interface VCXPCClientShared
- (NSMutableDictionary)registeredUUIDServiceBlocks;
- (OS_dispatch_queue)registeredBlocksQueue;
- (VCXPCClientShared)init;
- (void)dealloc;
- (void)deregisterFromNotifications;
- (void)deregisterWithUUID:(id)a3 service:(char *)a4;
- (void)registerBlockWithUUID:(id)a3 service:(char *)a4 block:(id)a5;
@end

@implementation VCXPCClientShared

- (VCXPCClientShared)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCXPCClientShared;
  v2 = [(AVConferenceXPCClient *)&v7 init];
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        v11 = "-[VCXPCClientShared init]";
        __int16 v12 = 1024;
        int v13 = 42;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
      }
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_registeredBlocksQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCXPCClientShared.registeredBlocksQueue", 0, CustomRootQueue);
    v2->_registeredUUIDServiceBlocks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCXPCClientShared *)self deregisterFromNotifications];

  v3.receiver = self;
  v3.super_class = (Class)VCXPCClientShared;
  [(AVConferenceXPCClient *)&v3 dealloc];
}

- (void)deregisterFromNotifications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_registeredUUIDServiceBlocks allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[AVConferenceXPCClient deregisterFromService:](self, "deregisterFromService:", [*(id *)(*((void *)&v9 + 1) + 8 * v7++) UTF8String]);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (void)registerBlockWithUUID:(id)a3 service:(char *)a4 block:(id)a5
{
  block[8] = *MEMORY[0x1E4F143B8];
  registeredBlocksQueue = self->_registeredBlocksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke;
  block[3] = &unk_1E6DB87B8;
  block[4] = a3;
  block[5] = self;
  block[6] = a5;
  block[7] = a4;
  dispatch_async(registeredBlocksQueue, block);
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[[NSString alloc] initWithCString:*(void *)(a1 + 56) encoding:4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 56);
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        uint64_t v14 = v3;
        __int16 v15 = 2080;
        v16 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 68;
        __int16 v19 = 2080;
        uint64_t v20 = v6;
        __int16 v21 = 2112;
        v22 = v2;
        __int16 v23 = 2112;
        uint64_t v24 = v7;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered service %s with key %@, particiantID: %@", buf, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = v3;
      __int16 v15 = 2080;
      v16 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 68;
      __int16 v19 = 2080;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      v22 = v2;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_debug_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Registered service %s with key %@, particiantID: %@", buf, 0x3Au);
    }
  }
  if (![*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v2])
  {
    uint64_t v8 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:*(void *)(a1 + 40)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_6;
    v12[3] = &unk_1E6DB4338;
    v12[4] = v8;
    [*(id *)(a1 + 40) registerBlockForService:*(void *)(a1 + 56) block:v12];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(*(void *)(a1 + 40) + 48) setObject:v9 forKeyedSubscript:v2];
  }
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "objectForKeyedSubscript:", v2), "setObject:forKeyedSubscript:", *(void *)(a1 + 48), *(void *)(a1 + 32));
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 registeredBlocksQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_2;
    v8[3] = &unk_1E6DB43D8;
    v8[4] = a2;
    v8[5] = v6;
    v8[6] = a3;
    dispatch_sync(v7, v8);
  }
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"vcSessionParticipantID"];
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"vcServiceType"];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "registeredUUIDServiceBlocks"), "objectForKeyedSubscript:", v3))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "registeredUUIDServiceBlocks"), "objectForKeyedSubscript:", v3), "objectForKeyedSubscript:", v2);
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_21;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      id v9 = *MEMORY[0x1E4F47A50];
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v28 = v8;
          __int16 v29 = 2080;
          v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke_2";
          __int16 v31 = 1024;
          int v32 = 85;
          __int16 v33 = 2112;
          uint64_t v34 = v3;
          __int16 v35 = 2112;
          uint64_t v36 = v2;
          uint64_t v11 = " [%s] %s:%d Received callback for service %@ with particiantID: %@";
          long long v12 = v9;
          uint32_t v13 = 48;
LABEL_17:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
LABEL_21:
        id v22 = *(id *)(a1 + 40);
        CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_16;
        v24[3] = &unk_1E6DB50A0;
        uint64_t v26 = v4;
        v24[4] = *(void *)(a1 + 32);
        int8x16_t v25 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
        dispatch_async(CustomRootQueue, v24);
        return;
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v8;
      __int16 v29 = 2080;
      v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
      __int16 v31 = 1024;
      int v32 = 85;
      __int16 v33 = 2112;
      uint64_t v34 = v3;
      __int16 v35 = 2112;
      uint64_t v36 = v2;
      __int16 v19 = " [%s] %s:%d Received callback for service %@ with particiantID: %@";
      uint64_t v20 = v9;
      uint32_t v21 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_21;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      v16 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316674;
          uint64_t v28 = v14;
          __int16 v29 = 2080;
          v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
          __int16 v31 = 1024;
          int v32 = 85;
          __int16 v33 = 2112;
          uint64_t v34 = (uint64_t)v5;
          __int16 v35 = 2048;
          uint64_t v36 = v17;
          __int16 v37 = 2112;
          uint64_t v38 = v3;
          __int16 v39 = 2112;
          uint64_t v40 = v2;
          uint64_t v11 = " [%s] %s:%d %@(%p) Received callback for service %@ with particiantID: %@";
          long long v12 = v15;
          uint32_t v13 = 68;
          goto LABEL_17;
        }
        goto LABEL_21;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316674;
      uint64_t v28 = v14;
      __int16 v29 = 2080;
      v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke";
      __int16 v31 = 1024;
      int v32 = 85;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v5;
      __int16 v35 = 2048;
      uint64_t v36 = v18;
      __int16 v37 = 2112;
      uint64_t v38 = v3;
      __int16 v39 = 2112;
      uint64_t v40 = v2;
      __int16 v19 = " [%s] %s:%d %@(%p) Received callback for service %@ with particiantID: %@";
      uint64_t v20 = v15;
      uint32_t v21 = 68;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_21;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v6;
      __int16 v29 = 2080;
      v30 = "-[VCXPCClientShared registerBlockWithUUID:service:block:]_block_invoke_2";
      __int16 v31 = 1024;
      int v32 = 97;
      __int16 v33 = 2112;
      uint64_t v34 = v3;
      __int16 v35 = 2112;
      uint64_t v36 = v2;
      _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot find block for serviceType %@, particiantID: %@", buf, 0x30u);
    }
  }
}

void __57__VCXPCClientShared_registerBlockWithUUID_service_block___block_invoke_16(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, a1[4], a1[5]);
  }
  uint64_t v3 = (void *)a1[6];
}

- (void)deregisterWithUUID:(id)a3 service:(char *)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  registeredBlocksQueue = self->_registeredBlocksQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VCXPCClientShared_deregisterWithUUID_service___block_invoke;
  v5[3] = &unk_1E6DB5450;
  v5[5] = a3;
  v5[6] = a4;
  v5[4] = self;
  dispatch_async(registeredBlocksQueue, v5);
}

void __48__VCXPCClientShared_deregisterWithUUID_service___block_invoke(void *a1)
{
  id v2 = (id)[[NSString alloc] initWithCString:a1[6] encoding:4];
  objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", v2), "removeObjectForKey:", a1[5]);
}

- (NSMutableDictionary)registeredUUIDServiceBlocks
{
  return self->_registeredUUIDServiceBlocks;
}

- (OS_dispatch_queue)registeredBlocksQueue
{
  return self->_registeredBlocksQueue;
}

@end