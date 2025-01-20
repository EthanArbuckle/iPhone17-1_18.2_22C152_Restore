@interface VCVideoSourceTokenManager
+ (id)sharedManager;
- (VCVideoSourceTokenManager)init;
- (_VCVideoSourceToken)createtokenForDeviceName:(id)a3 sourceType:(int)a4;
- (_VCVideoSourceToken)tokenForDeviceName:(id)a3 sourceType:(int)a4;
- (id)deviceNameForToken:(_VCVideoSourceToken)a3;
- (void)dealloc;
@end

@implementation VCVideoSourceTokenManager

uint64_t __48__VCVideoSourceTokenManager_deviceNameForToken___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(unsigned int *)(a1 + 48)));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)deviceNameForToken:(_VCVideoSourceToken)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  tokenManagerQueue = self->_tokenManagerQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCVideoSourceTokenManager_deviceNameForToken___block_invoke;
  v6[3] = &unk_1E6DB6470;
  $948446A44E2BC96870B572155DF52E0B var0 = a3.var0.var0;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(tokenManagerQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_29);
  }
  return (id)sharedManager__tokenManager;
}

void __42__VCVideoSourceTokenManager_sharedManager__block_invoke()
{
  if (!sharedManager__tokenManager) {
    sharedManager__tokenManager = objc_alloc_init(VCVideoSourceTokenManager);
  }
}

- (VCVideoSourceTokenManager)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoSourceTokenManager;
  v2 = [(VCVideoSourceTokenManager *)&v7 init];
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        v11 = "-[VCVideoSourceTokenManager init]";
        __int16 v12 = 1024;
        int v13 = 48;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
      }
    }
    v2->_sourceNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_videoSourceTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    memset_pattern16(&v2->_identifierSeeds[1], &xmmword_1E259EC90, 0x20uLL);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_tokenManagerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoSourceTokenManager.tokenManagerQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_tokenManagerQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoSourceTokenManager;
  [(VCVideoSourceTokenManager *)&v3 dealloc];
}

- (_VCVideoSourceToken)createtokenForDeviceName:(id)a3 sourceType:(int)a4
{
  *(void *)&v32[5] = *MEMORY[0x1E4F143B8];
  if (!a3 || (a4 - 5) <= 0xFFFFFFFB)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v23 = 136316162;
        uint64_t v24 = v10;
        __int16 v25 = 2080;
        v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
        __int16 v27 = 1024;
        int v28 = 75;
        __int16 v29 = 1024;
        int v30 = a4;
        __int16 v31 = 2112;
        *(void *)v32 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d kVCVideoSourceTokenInvalid. type=%d, deviceName=%@", (uint8_t *)&v23, 0x2Cu);
      }
    }
    return (_VCVideoSourceToken)0;
  }
  if ([(NSMutableDictionary *)self->_videoSourceTokens objectForKeyedSubscript:a3])
  {
    v7.var0.$948446A44E2BC96870B572155DF52E0B var0 = ($948446A44E2BC96870B572155DF52E0B)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoSourceTokens, "objectForKeyedSubscript:", a3), "unsignedIntegerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316162;
        uint64_t v24 = v8;
        __int16 v25 = 2080;
        v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
        __int16 v27 = 1024;
        int v28 = 81;
        __int16 v29 = 1024;
        int v30 = a4;
        __int16 v31 = 2112;
        *(void *)v32 = a3;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sourceToken was created before. type=%d, deviceName=%@", (uint8_t *)&v23, 0x2Cu);
      }
    }
    return v7;
  }
  unint64_t v12 = self->_identifierSeeds[a4];
  unint64_t v13 = v12 & 0xFFFFFF | (a4 << 24);
  if (v12 > 0xFFFFFE)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
    {
      unint64_t v14 = 1;
    }
    else
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      unint64_t v14 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316418;
        uint64_t v24 = v15;
        __int16 v25 = 2080;
        v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
        __int16 v27 = 1024;
        int v28 = 92;
        __int16 v29 = 1024;
        int v30 = 0xFFFFFF;
        __int16 v31 = 1024;
        v32[0] = a4;
        LOWORD(v32[1]) = 1024;
        *(_DWORD *)((char *)&v32[1] + 2) = 1;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reached VCVIDEOSOURCETOKEN_MAX_IDENTIFIER=0x%x, reset _identifierSeeds %d to %d", (uint8_t *)&v23, 0x2Eu);
      }
    }
  }
  else
  {
    unint64_t v14 = v12 + 1;
  }
  self->_identifierSeeds[a4] = v14;
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:v13];
  if ([(NSMutableDictionary *)self->_sourceNames objectForKeyedSubscript:v17]
    || [(NSMutableDictionary *)self->_videoSourceTokens objectForKeyedSubscript:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      v7.var0.$948446A44E2BC96870B572155DF52E0B var0 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v7;
      }
      int v23 = 136316162;
      uint64_t v24 = v18;
      __int16 v25 = 2080;
      v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
      __int16 v27 = 1024;
      int v28 = 99;
      __int16 v29 = 1024;
      int v30 = v13;
      __int16 v31 = 2112;
      *(void *)v32 = a3;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sourceToken(0x%x) deviceName (%@) was in look up table _sourceNames. Either token is colliding ,or VCVideoSourceType is not correct", (uint8_t *)&v23, 0x2Cu);
    }
    return (_VCVideoSourceToken)0;
  }
  [(NSMutableDictionary *)self->_sourceNames setObject:a3 forKeyedSubscript:v17];
  [(NSMutableDictionary *)self->_videoSourceTokens setObject:v17 forKeyedSubscript:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136316418;
      uint64_t v24 = v21;
      __int16 v25 = 2080;
      v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
      __int16 v27 = 1024;
      int v28 = 106;
      __int16 v29 = 1024;
      int v30 = v13;
      __int16 v31 = 1024;
      v32[0] = a4;
      LOWORD(v32[1]) = 2112;
      *(void *)((char *)&v32[1] + 2) = a3;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created sourceToken=0x%x, type=%d, deviceName=%@", (uint8_t *)&v23, 0x32u);
    }
  }
  return (_VCVideoSourceToken)v13;
}

- (_VCVideoSourceToken)tokenForDeviceName:(id)a3 sourceType:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2410000000;
  unint64_t v12 = "";
  int v13 = 0;
  tokenManagerQueue = self->_tokenManagerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__VCVideoSourceTokenManager_tokenForDeviceName_sourceType___block_invoke;
  v7[3] = &unk_1E6DB6448;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v9;
  int v8 = a4;
  dispatch_sync(tokenManagerQueue, v7);
  v5.var0.$948446A44E2BC96870B572155DF52E0B var0 = ($948446A44E2BC96870B572155DF52E0B)*((_DWORD *)v10 + 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __59__VCVideoSourceTokenManager_tokenForDeviceName_sourceType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  objc_super v3 = *(id **)(a1 + 32);
  if (v2) {
    uint64_t result = objc_msgSend((id)objc_msgSend(v3[2], "objectForKeyedSubscript:", *(void *)(a1 + 40)), "unsignedIntegerValue");
  }
  else {
    uint64_t result = [v3 createtokenForDeviceName:*(void *)(a1 + 40) sourceType:*(unsigned int *)(a1 + 56)];
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = result;
  return result;
}

@end