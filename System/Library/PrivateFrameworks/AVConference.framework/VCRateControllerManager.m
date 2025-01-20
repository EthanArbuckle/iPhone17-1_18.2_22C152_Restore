@interface VCRateControllerManager
+ (id)sharedInstance;
- (VCRateControllerManager)init;
- (id)getRateControllerSharingGroupWithConnection:(id)a3 usePolicy:(unsigned int)a4;
- (id)prepareEndPointKeyFromConnection:(id)a3;
- (void)cleanupRateControllerSharingGroupWithConnection:(id)a3 usePolicy:(unsigned int)a4;
- (void)dealloc;
- (void)init;
@end

@implementation VCRateControllerManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_25);
  }
  return (id)sharedInstance_rateControllerManager;
}

VCRateControllerManager *__41__VCRateControllerManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCRateControllerManager);
  sharedInstance_rateControllerManager = (uint64_t)result;
  return result;
}

- (VCRateControllerManager)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCRateControllerManager;
  v2 = [(VCObject *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(VCRateSharingGroup);
    v2->_defaultSharingGroup = v3;
    if (v3)
    {
      pthread_mutex_init(&v2->_sharingGroupMutex, 0);
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v2->_sharingGroup = v4;
      if (v4) {
        return v2;
      }
      if ((VCRateControllerManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCRateControllerManager init]();
          }
        }
        goto LABEL_24;
      }
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCRateControllerManager *)v2 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v11 = VRTraceErrorLogLevelToCSTR(),
            v9 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_24:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      v16 = "-[VCRateControllerManager init]";
      __int16 v17 = 1024;
      int v18 = 39;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2048;
      v22 = v2;
      v10 = " [%s] %s:%d %@(%p) Failed to allocate sharing group dictionary";
    }
    else
    {
      if ((VCRateControllerManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCRateControllerManager init]();
          }
        }
        goto LABEL_24;
      }
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCRateControllerManager *)v2 performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      v16 = "-[VCRateControllerManager init]";
      __int16 v17 = 1024;
      int v18 = 36;
      __int16 v19 = 2112;
      v20 = v6;
      __int16 v21 = 2048;
      v22 = v2;
      v10 = " [%s] %s:%d %@(%p) Failed to allocate default sharing group";
    }
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
    goto LABEL_24;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  pthread_mutex_destroy(&self->_sharingGroupMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCRateControllerManager;
  [(VCObject *)&v3 dealloc];
}

- (id)prepareEndPointKeyFromConnection:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if (![a3 connectionResult])
  {
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControllerManager prepareEndPointKeyFromConnection:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      v9 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
    }
    else {
      v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v12;
    __int16 v23 = 2080;
    v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
    __int16 v25 = 1024;
    int v26 = 64;
    __int16 v27 = 2112;
    v28 = v9;
    __int16 v29 = 2048;
    v30 = self;
    uint64_t v14 = " [%s] %s:%d %@(%p) No connectionResult";
    goto LABEL_46;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  IPToString();
  uint64_t v4 = [NSString stringWithUTF8String:&v18];
  if (!v4)
  {
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControllerManager prepareEndPointKeyFromConnection:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      v10 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
    }
    else {
      v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v15;
    __int16 v23 = 2080;
    v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
    __int16 v25 = 1024;
    int v26 = 69;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2048;
    v30 = self;
    uint64_t v14 = " [%s] %s:%d %@(%p) No sourceIP";
LABEL_46:
    _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x30u);
    return 0;
  }
  uint64_t v5 = v4;
  IPToString();
  uint64_t v6 = [NSString stringWithUTF8String:&v18];
  if (v6)
  {
    id result = (id)[NSString stringWithFormat:@"%@_%@", v5, v6, v18, v19, v20];
    if (result) {
      return result;
    }
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControllerManager prepareEndPointKeyFromConnection:].cold.4();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
        __int16 v25 = 1024;
        int v26 = 76;
        __int16 v27 = 2112;
        v28 = v8;
        __int16 v29 = 2048;
        v30 = self;
        uint64_t v14 = " [%s] %s:%d %@(%p) No endPointKey";
        goto LABEL_46;
      }
    }
  }
  else
  {
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControllerManager prepareEndPointKeyFromConnection:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v17;
        __int16 v23 = 2080;
        v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
        __int16 v25 = 1024;
        int v26 = 73;
        __int16 v27 = 2112;
        v28 = v11;
        __int16 v29 = 2048;
        v30 = self;
        uint64_t v14 = " [%s] %s:%d %@(%p) No destIP";
        goto LABEL_46;
      }
    }
  }
  return 0;
}

- (void)cleanupRateControllerSharingGroupWithConnection:(id)a3 usePolicy:(unsigned int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3 || a4 != 1) {
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(VCRateControllerManager *)self prepareEndPointKeyFromConnection:a3];
    if (v6)
    {
      id v7 = v6;
      pthread_mutex_lock(&self->_sharingGroupMutex);
      [(NSMutableDictionary *)self->_sharingGroup setObject:0 forKeyedSubscript:v7];
      pthread_mutex_unlock(&self->_sharingGroupMutex);
      return;
    }
    if ((VCRateControllerManager *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
      }
      else {
        v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v14 = 136316162;
      uint64_t v15 = v13;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:]";
      __int16 v18 = 1024;
      int v19 = 88;
      __int16 v20 = 2112;
      __int16 v21 = v9;
      __int16 v22 = 2048;
      __int16 v23 = self;
      uint64_t v12 = " [%s] %s:%d %@(%p) No endPointKey";
LABEL_29:
      _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:]();
      }
    }
  }
  else if ((VCRateControllerManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316162;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:]";
        __int16 v18 = 1024;
        int v19 = 86;
        __int16 v20 = 2112;
        __int16 v21 = v8;
        __int16 v22 = 2048;
        __int16 v23 = self;
        uint64_t v12 = " [%s] %s:%d %@(%p) VCConnection type does not match";
        goto LABEL_29;
      }
    }
  }
}

- (id)getRateControllerSharingGroupWithConnection:(id)a3 usePolicy:(unsigned int)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  p_sharingGroupMutex = &self->_sharingGroupMutex;
  pthread_mutex_lock(&self->_sharingGroupMutex);
  uint64_t v8 = self->_defaultSharingGroup;
  if (!a3 || a4 != 1) {
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(VCRateControllerManager *)self prepareEndPointKeyFromConnection:a3];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = [(NSMutableDictionary *)self->_sharingGroup objectForKeyedSubscript:v9];
      uint64_t v12 = (VCRateControllerManager *)objc_opt_class();
      if (v11)
      {
        if (v12 == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_20;
          }
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          __int16 v16 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_DWORD *)v50 = 136315906;
          *(void *)&v50[4] = v15;
          *(_WORD *)&v50[12] = 2080;
          *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
          *(_WORD *)&v50[22] = 1024;
          LODWORD(v51) = 116;
          WORD2(v51) = 2112;
          *(void *)((char *)&v51 + 6) = v10;
          uint64_t v17 = " [%s] %s:%d Sharing group found for key=%@";
          __int16 v18 = v16;
          uint32_t v19 = 38;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v13 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v13 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_20;
          }
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          __int16 v21 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_DWORD *)v50 = 136316418;
          *(void *)&v50[4] = v20;
          *(_WORD *)&v50[12] = 2080;
          *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
          *(_WORD *)&v50[22] = 1024;
          LODWORD(v51) = 116;
          WORD2(v51) = 2112;
          *(void *)((char *)&v51 + 6) = v13;
          HIWORD(v51) = 2048;
          v52 = self;
          *(_WORD *)v53 = 2112;
          *(void *)&v53[2] = v10;
          uint64_t v17 = " [%s] %s:%d %@(%p) Sharing group found for key=%@";
          __int16 v18 = v21;
          uint32_t v19 = 58;
        }
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v50, v19);
LABEL_20:
        uint64_t v8 = (VCRateSharingGroup *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sharingGroup, "objectForKeyedSubscript:", v10, *(_OWORD *)v50, *(void *)&v50[16], v51, v52, *(_OWORD *)v53);
        goto LABEL_31;
      }
      if (v12 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v50 = 136315906;
            *(void *)&v50[4] = v22;
            *(_WORD *)&v50[12] = 2080;
            *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
            *(_WORD *)&v50[22] = 1024;
            LODWORD(v51) = 111;
            WORD2(v51) = 2112;
            *(void *)((char *)&v51 + 6) = v10;
            uint64_t v24 = " [%s] %s:%d No existing sharing group found for key=%@, creating a new one";
            __int16 v25 = v23;
            uint32_t v26 = 38;
LABEL_28:
            _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, v50, v26);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v14 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
        }
        else {
          int v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v27 = VRTraceErrorLogLevelToCSTR();
          v28 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v50 = 136316418;
            *(void *)&v50[4] = v27;
            *(_WORD *)&v50[12] = 2080;
            *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
            *(_WORD *)&v50[22] = 1024;
            LODWORD(v51) = 111;
            WORD2(v51) = 2112;
            *(void *)((char *)&v51 + 6) = v14;
            HIWORD(v51) = 2048;
            v52 = self;
            *(_WORD *)v53 = 2112;
            *(void *)&v53[2] = v10;
            uint64_t v24 = " [%s] %s:%d %@(%p) No existing sharing group found for key=%@, creating a new one";
            __int16 v25 = v28;
            uint32_t v26 = 58;
            goto LABEL_28;
          }
        }
      }
      __int16 v29 = [[VCRateSharingGroup alloc] initWithIdentifier:v10];
      if (v29)
      {
        uint64_t v8 = v29;
        [(NSMutableDictionary *)self->_sharingGroup setObject:v29 forKeyedSubscript:v10];
      }
      else
      {
        if ((VCRateControllerManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v43 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
          }
          else {
            v43 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v48 = VRTraceErrorLogLevelToCSTR();
            v49 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v50 = 136316162;
              *(void *)&v50[4] = v48;
              *(_WORD *)&v50[12] = 2080;
              *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
              *(_WORD *)&v50[22] = 1024;
              LODWORD(v51) = 113;
              WORD2(v51) = 2112;
              *(void *)((char *)&v51 + 6) = v43;
              HIWORD(v51) = 2048;
              v52 = self;
              _os_log_error_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate sharing group", v50, 0x30u);
            }
          }
        }
        uint64_t v8 = 0;
      }
      goto LABEL_31;
    }
    if ((VCRateControllerManager *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v42 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
      }
      else {
        v42 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_31;
      }
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)v50 = 136316162;
      *(void *)&v50[4] = v47;
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
      *(_WORD *)&v50[22] = 1024;
      LODWORD(v51) = 109;
      WORD2(v51) = 2112;
      *(void *)((char *)&v51 + 6) = v42;
      HIWORD(v51) = 2048;
      v52 = self;
      v46 = " [%s] %s:%d %@(%p) No endPointKey";
      goto LABEL_66;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]();
      }
    }
  }
  else
  {
    if ((VCRateControllerManager *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v41 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
      }
      else {
        v41 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_31;
      }
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)v50 = 136316162;
      *(void *)&v50[4] = v44;
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
      *(_WORD *)&v50[22] = 1024;
      LODWORD(v51) = 107;
      WORD2(v51) = 2112;
      *(void *)((char *)&v51 + 6) = v41;
      HIWORD(v51) = 2048;
      v52 = self;
      v46 = " [%s] %s:%d %@(%p) VCConnection type does not match resolve policy";
LABEL_66:
      _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, v46, v50, 0x30u);
      goto LABEL_31;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]();
      }
    }
  }
LABEL_31:
  pthread_mutex_unlock(p_sharingGroupMutex);
  if ((VCRateControllerManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        defaultSharingGroup = self->_defaultSharingGroup;
        *(_DWORD *)v50 = 136316674;
        *(void *)&v50[4] = v31;
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
        *(_WORD *)&v50[22] = 1024;
        LODWORD(v51) = 127;
        WORD2(v51) = 2048;
        *(void *)((char *)&v51 + 6) = v8;
        HIWORD(v51) = 2048;
        v52 = (VCRateControllerManager *)defaultSharingGroup;
        *(_WORD *)v53 = 2048;
        *(void *)&v53[2] = a3;
        *(_WORD *)&v53[10] = 1024;
        *(_DWORD *)&v53[12] = a4;
        v34 = " [%s] %s:%d Returning sharingGroup=%p defaultSharingGroup=%p connection=%p policy=%d";
        v35 = v32;
        uint32_t v36 = 64;
LABEL_41:
        _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v34, v50, v36);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v30 = (__CFString *)[(VCRateControllerManager *)self performSelector:sel_logPrefix];
    }
    else {
      v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v39 = self->_defaultSharingGroup;
        *(_DWORD *)v50 = 136317186;
        *(void *)&v50[4] = v37;
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
        *(_WORD *)&v50[22] = 1024;
        LODWORD(v51) = 127;
        WORD2(v51) = 2112;
        *(void *)((char *)&v51 + 6) = v30;
        HIWORD(v51) = 2048;
        v52 = self;
        *(_WORD *)v53 = 2048;
        *(void *)&v53[2] = v8;
        *(_WORD *)&v53[10] = 2048;
        *(void *)&v53[12] = v39;
        __int16 v54 = 2048;
        id v55 = a3;
        __int16 v56 = 1024;
        unsigned int v57 = a4;
        v34 = " [%s] %s:%d %@(%p) Returning sharingGroup=%p defaultSharingGroup=%p connection=%p policy=%d";
        v35 = v38;
        uint32_t v36 = 84;
        goto LABEL_41;
      }
    }
  }
  return v8;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate sharing group dictionary", v2, v3, v4, v5, v6);
}

- (void)prepareEndPointKeyFromConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No connectionResult", v2, v3, v4, v5, v6);
}

- (void)prepareEndPointKeyFromConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No sourceIP", v2, v3, v4, v5, v6);
}

- (void)prepareEndPointKeyFromConnection:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No destIP", v2, v3, v4, v5, v6);
}

- (void)prepareEndPointKeyFromConnection:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No endPointKey", v2, v3, v4, v5, v6);
}

- (void)cleanupRateControllerSharingGroupWithConnection:usePolicy:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No endPointKey", v2, v3, v4, v5, v6);
}

- (void)cleanupRateControllerSharingGroupWithConnection:usePolicy:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection type does not match", v2, v3, v4, v5, v6);
}

- (void)getRateControllerSharingGroupWithConnection:usePolicy:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No endPointKey", v2, v3, v4, v5, v6);
}

- (void)getRateControllerSharingGroupWithConnection:usePolicy:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate sharing group", v2, v3, v4, v5, v6);
}

- (void)getRateControllerSharingGroupWithConnection:usePolicy:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection type does not match resolve policy", v2, v3, v4, v5, v6);
}

@end