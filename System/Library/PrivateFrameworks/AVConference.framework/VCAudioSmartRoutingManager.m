@interface VCAudioSmartRoutingManager
+ (id)sharedInstance;
+ (void)addClient:(id)a3;
+ (void)removeClient:(id)a3;
- (VCAudioSmartRoutingManager)init;
- (void)addClient:(id)a3;
- (void)applyAudioScoreForOptOutOfSmartRouting:(BOOL)a3 error:(id *)a4;
- (void)dealloc;
- (void)removeClient:(id)a3;
- (void)updateOptOutOfSmartRouting;
@end

@implementation VCAudioSmartRoutingManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  return (id)sharedInstance__sharedSmartRoutingManager;
}

void __44__VCAudioSmartRoutingManager_sharedInstance__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sharedInstance__sharedSmartRoutingManager = objc_alloc_init(VCAudioSmartRoutingManager);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315906;
      uint64_t v3 = v0;
      __int16 v4 = 2080;
      v5 = "+[VCAudioSmartRoutingManager sharedInstance]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 32;
      __int16 v8 = 2048;
      uint64_t v9 = sharedInstance__sharedSmartRoutingManager;
      _os_log_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d creating manager=%p", (uint8_t *)&v2, 0x26u);
    }
  }
}

- (VCAudioSmartRoutingManager)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioSmartRoutingManager;
  int v2 = [(VCObject *)&v4 init];
  if (v2) {
    v2->_optOutOfSmartRouting = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioSmartRoutingManager;
  [(VCObject *)&v3 dealloc];
}

+ (void)addClient:(id)a3
{
  uint64_t v4 = +[VCAudioSmartRoutingManager sharedInstance];

  [(VCAudioSmartRoutingManager *)v4 addClient:a3];
}

+ (void)removeClient:(id)a3
{
  uint64_t v4 = +[VCAudioSmartRoutingManager sharedInstance];

  [(VCAudioSmartRoutingManager *)v4 removeClient:a3];
}

- (void)addClient:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [(VCObject *)self lock];
  if (a3)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
    if (![(NSMutableDictionary *)self->_optOutOfSmartRouting objectForKeyedSubscript:v5])
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_optOutOfSmartRouting, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "optOutOfSmartRouting")), v5);
      if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        __int16 v8 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        int v9 = [a3 optOutOfSmartRouting];
        uint64_t v10 = [(NSMutableDictionary *)self->_optOutOfSmartRouting count];
        *(_DWORD *)v30 = 136316674;
        *(void *)&v30[4] = v7;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioSmartRoutingManager addClient:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 63;
        WORD2(v31) = 2048;
        *(void *)((char *)&v31 + 6) = a3;
        HIWORD(v31) = 2112;
        v32 = (VCAudioSmartRoutingManager *)v5;
        *(_WORD *)v33 = 1024;
        *(_DWORD *)&v33[2] = v9;
        *(_WORD *)&v33[6] = 2048;
        *(void *)&v33[8] = v10;
        v11 = " [%s] %s:%d client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v8;
        uint32_t v13 = 64;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v6 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        int v16 = [a3 optOutOfSmartRouting];
        uint64_t v17 = [(NSMutableDictionary *)self->_optOutOfSmartRouting count];
        *(_DWORD *)v30 = 136317186;
        *(void *)&v30[4] = v14;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioSmartRoutingManager addClient:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 63;
        WORD2(v31) = 2112;
        *(void *)((char *)&v31 + 6) = v6;
        HIWORD(v31) = 2048;
        v32 = self;
        *(_WORD *)v33 = 2048;
        *(void *)&v33[2] = a3;
        *(_WORD *)&v33[10] = 2112;
        *(void *)&v33[12] = v5;
        *(_WORD *)&v33[20] = 1024;
        *(_DWORD *)&v33[22] = v16;
        *(_WORD *)&v33[26] = 2048;
        *(void *)&v33[28] = v17;
        v11 = " [%s] %s:%d %@(%p) client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v15;
        uint32_t v13 = 84;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v30, v13);
LABEL_14:
      [(VCAudioSmartRoutingManager *)self updateOptOutOfSmartRouting];
      goto LABEL_15;
    }
    if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v30 = 136315650;
          *(void *)&v30[4] = v21;
          *(_WORD *)&v30[12] = 2080;
          *(void *)&v30[14] = "-[VCAudioSmartRoutingManager addClient:]";
          *(_WORD *)&v30[22] = 1024;
          LODWORD(v31) = 61;
          v23 = " [%s] %s:%d ignoring already added client";
          v24 = v22;
          uint32_t v25 = 28;
LABEL_36:
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, v30, v25);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v19 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
      }
      else {
        v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v30 = 136316162;
          *(void *)&v30[4] = v28;
          *(_WORD *)&v30[12] = 2080;
          *(void *)&v30[14] = "-[VCAudioSmartRoutingManager addClient:]";
          *(_WORD *)&v30[22] = 1024;
          LODWORD(v31) = 61;
          WORD2(v31) = 2112;
          *(void *)((char *)&v31 + 6) = v19;
          HIWORD(v31) = 2048;
          v32 = self;
          v23 = " [%s] %s:%d %@(%p) ignoring already added client";
          v24 = v29;
          uint32_t v25 = 48;
          goto LABEL_36;
        }
      }
    }
  }
  else if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSmartRoutingManager addClient:](v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v18 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
    }
    else {
      v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = 136316162;
        *(void *)&v30[4] = v26;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioSmartRoutingManager addClient:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 59;
        WORD2(v31) = 2112;
        *(void *)((char *)&v31 + 6) = v18;
        HIWORD(v31) = 2048;
        v32 = self;
        _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", v30, 0x30u);
      }
    }
  }
LABEL_15:
  [(VCObject *)self unlock];
}

- (void)removeClient:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [(VCObject *)self lock];
  if (a3)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
    if ([(NSMutableDictionary *)self->_optOutOfSmartRouting objectForKeyedSubscript:v5])
    {
      [(NSMutableDictionary *)self->_optOutOfSmartRouting setObject:0 forKeyedSubscript:v5];
      if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        __int16 v8 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        int v9 = [a3 optOutOfSmartRouting];
        uint64_t v10 = [(NSMutableDictionary *)self->_optOutOfSmartRouting count];
        *(_DWORD *)v30 = 136316674;
        *(void *)&v30[4] = v7;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioSmartRoutingManager removeClient:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 75;
        WORD2(v31) = 2048;
        *(void *)((char *)&v31 + 6) = a3;
        HIWORD(v31) = 2112;
        v32 = (VCAudioSmartRoutingManager *)v5;
        *(_WORD *)v33 = 1024;
        *(_DWORD *)&v33[2] = v9;
        *(_WORD *)&v33[6] = 2048;
        *(void *)&v33[8] = v10;
        v11 = " [%s] %s:%d client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v8;
        uint32_t v13 = 64;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v6 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_14;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        int v16 = [a3 optOutOfSmartRouting];
        uint64_t v17 = [(NSMutableDictionary *)self->_optOutOfSmartRouting count];
        *(_DWORD *)v30 = 136317186;
        *(void *)&v30[4] = v14;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioSmartRoutingManager removeClient:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 75;
        WORD2(v31) = 2112;
        *(void *)((char *)&v31 + 6) = v6;
        HIWORD(v31) = 2048;
        v32 = self;
        *(_WORD *)v33 = 2048;
        *(void *)&v33[2] = a3;
        *(_WORD *)&v33[10] = 2112;
        *(void *)&v33[12] = v5;
        *(_WORD *)&v33[20] = 1024;
        *(_DWORD *)&v33[22] = v16;
        *(_WORD *)&v33[26] = 2048;
        *(void *)&v33[28] = v17;
        v11 = " [%s] %s:%d %@(%p) client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v15;
        uint32_t v13 = 84;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v30, v13);
LABEL_14:
      [(VCAudioSmartRoutingManager *)self updateOptOutOfSmartRouting];
      goto LABEL_15;
    }
    if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v30 = 136315650;
          *(void *)&v30[4] = v21;
          *(_WORD *)&v30[12] = 2080;
          *(void *)&v30[14] = "-[VCAudioSmartRoutingManager removeClient:]";
          *(_WORD *)&v30[22] = 1024;
          LODWORD(v31) = 73;
          v23 = " [%s] %s:%d ignoring client not added";
          v24 = v22;
          uint32_t v25 = 28;
LABEL_36:
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, v30, v25);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v19 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
      }
      else {
        v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v30 = 136316162;
          *(void *)&v30[4] = v28;
          *(_WORD *)&v30[12] = 2080;
          *(void *)&v30[14] = "-[VCAudioSmartRoutingManager removeClient:]";
          *(_WORD *)&v30[22] = 1024;
          LODWORD(v31) = 73;
          WORD2(v31) = 2112;
          *(void *)((char *)&v31 + 6) = v19;
          HIWORD(v31) = 2048;
          v32 = self;
          v23 = " [%s] %s:%d %@(%p) ignoring client not added";
          v24 = v29;
          uint32_t v25 = 48;
          goto LABEL_36;
        }
      }
    }
  }
  else if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSmartRoutingManager removeClient:](v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v18 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
    }
    else {
      v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v30 = 136316162;
        *(void *)&v30[4] = v26;
        *(_WORD *)&v30[12] = 2080;
        *(void *)&v30[14] = "-[VCAudioSmartRoutingManager removeClient:]";
        *(_WORD *)&v30[22] = 1024;
        LODWORD(v31) = 71;
        WORD2(v31) = 2112;
        *(void *)((char *)&v31 + 6) = v18;
        HIWORD(v31) = 2048;
        v32 = self;
        _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", v30, 0x30u);
      }
    }
  }
LABEL_15:
  [(VCObject *)self unlock];
}

- (void)updateOptOutOfSmartRouting
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v23 = 0;
  obj = self->_optOutOfSmartRouting;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (!v3)
  {
LABEL_20:
    uint64_t v20 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = v3;
  uint64_t v6 = *(void *)v40;
  uint64_t v7 = &selRef_isInputAvailable;
  *(void *)&long long v4 = 136316162;
  long long v21 = v4;
  do
  {
    uint64_t v8 = 0;
    int v9 = v7[417];
    do
    {
      if (*(void *)v40 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(__CFString **)(*((void *)&v39 + 1) + 8 * v8);
      int v11 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_optOutOfSmartRouting, "objectForKeyedSubscript:", v10, v21), "BOOLValue");
      if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            uint64_t v25 = v18;
            __int16 v26 = 2080;
            v27 = "-[VCAudioSmartRoutingManager updateOptOutOfSmartRouting]";
            __int16 v28 = 1024;
            int v29 = 88;
            __int16 v30 = 2112;
            long long v31 = v10;
            __int16 v32 = 1024;
            LODWORD(v33) = v11;
            v15 = v19;
            int v16 = " [%s] %s:%d clientHash=%@ clientOptOut=%d";
            uint32_t v17 = 44;
            goto LABEL_15;
          }
        }
      }
      else
      {
        v12 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          v12 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:v9];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316674;
            uint64_t v25 = v13;
            __int16 v26 = 2080;
            v27 = "-[VCAudioSmartRoutingManager updateOptOutOfSmartRouting]";
            __int16 v28 = 1024;
            int v29 = 88;
            __int16 v30 = 2112;
            long long v31 = v12;
            __int16 v32 = 2048;
            v33 = self;
            __int16 v34 = 2112;
            v35 = v10;
            __int16 v36 = 1024;
            int v37 = v11;
            v15 = v14;
            int v16 = " [%s] %s:%d %@(%p) clientHash=%@ clientOptOut=%d";
            uint32_t v17 = 64;
LABEL_15:
            _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
          }
        }
      }
      if (!v11) {
        goto LABEL_20;
      }
      ++v8;
    }
    while (v5 != v8);
    uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v39 objects:v38 count:16];
    uint64_t v7 = &selRef_isInputAvailable;
  }
  while (v5);
  uint64_t v20 = 1;
LABEL_21:
  [(VCAudioSmartRoutingManager *)self applyAudioScoreForOptOutOfSmartRouting:v20 error:&v23];
}

- (void)applyAudioScoreForOptOutOfSmartRouting:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        uint32_t v17 = "-[VCAudioSmartRoutingManager applyAudioScoreForOptOutOfSmartRouting:error:]";
        __int16 v18 = 1024;
        int v19 = 100;
        __int16 v20 = 1024;
        LODWORD(v21) = v4;
        int v9 = " [%s] %s:%d optOutOfSmartRouting=%d";
        uint64_t v10 = v8;
        uint32_t v11 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAudioSmartRoutingManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316418;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        uint32_t v17 = "-[VCAudioSmartRoutingManager applyAudioScoreForOptOutOfSmartRouting:error:]";
        __int16 v18 = 1024;
        int v19 = 100;
        __int16 v20 = 2112;
        long long v21 = v6;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        __int16 v24 = 1024;
        BOOL v25 = v4;
        int v9 = " [%s] %s:%d %@(%p) optOutOfSmartRouting=%d";
        uint64_t v10 = v13;
        uint32_t v11 = 54;
        goto LABEL_11;
      }
    }
  }
}

- (void)addClient:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 59;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d nil client", (uint8_t *)&v2, 0x1Cu);
}

- (void)removeClient:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 71;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d nil client", (uint8_t *)&v2, 0x1Cu);
}

@end