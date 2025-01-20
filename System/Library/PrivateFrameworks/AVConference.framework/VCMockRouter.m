@interface VCMockRouter
+ (id)sharedInstance;
- (BOOL)routeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5 fromDatagramChannel:(id)a6 error:(id *)a7;
@end

@implementation VCMockRouter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_79);
  }
  return (id)sharedInstance_sharedInstance_1;
}

void __30__VCMockRouter_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(VCMockRouter);
  if (!sharedInstance_sharedInstance_1 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __30__VCMockRouter_sharedInstance__block_invoke_cold_1(v0, v1);
    }
  }
}

- (BOOL)routeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5 fromDatagramChannel:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = [+[VCDatagramChannelManager sharedInstance] datagramChannels];
  if (v12 && (v13 = v12, (unint64_t)[v12 count] > 1))
  {
    v30 = a7;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v15 = (void *)[v13 allKeys];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = (id)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *(void *)(*((void *)&v44 + 1) + 8 * i)), "idsDatagramChannel");
          if (v20) {
            BOOL v21 = v20 == a6;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            v25 = v20;
            int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (ErrorLogLevelForModule >= 8)
            {
              uint64_t v27 = VRTraceErrorLogLevelToCSTR();
              v28 = *MEMORY[0x1E4F47A50];
              v29 = *MEMORY[0x1E4F47A50];
              if (*MEMORY[0x1E4F47A40])
              {
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316418;
                  uint64_t v32 = v27;
                  __int16 v33 = 2080;
                  v34 = "-[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:]";
                  __int16 v35 = 1024;
                  int v36 = 53;
                  __int16 v37 = 2048;
                  v38 = a3;
                  __int16 v39 = 2048;
                  id v40 = a6;
                  __int16 v41 = 2048;
                  v42 = v25;
                  _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forward datagram[%p] from MockIDSDatagramChannel=%p to MockIDSDatagramChannel=%p", buf, 0x3Au);
                }
              }
              else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316418;
                uint64_t v32 = v27;
                __int16 v33 = 2080;
                v34 = "-[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:]";
                __int16 v35 = 1024;
                int v36 = 53;
                __int16 v37 = 2048;
                v38 = a3;
                __int16 v39 = 2048;
                id v40 = a6;
                __int16 v41 = 2048;
                v42 = v25;
                _os_log_debug_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Forward datagram[%p] from MockIDSDatagramChannel=%p to MockIDSDatagramChannel=%p", buf, 0x3Au);
              }
            }
            return [v25 processDirectIDSPathWithDatagram:a3 datagramSize:v10 datagramOptions:a5 error:v30];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v43 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v32 = v22;
        __int16 v33 = 2080;
        v34 = "-[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:]";
        __int16 v35 = 1024;
        int v36 = 57;
        __int16 v37 = 2048;
        v38 = a3;
        __int16 v39 = 2048;
        id v40 = a6;
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to forward datagram=%p from MockIDSDatagramChannel=%p", buf, 0x30u);
      }
    }
    if (v30)
    {
      uint64_t v24 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:@"Failed to forward datagram"];
      BOOL result = 0;
      id *v30 = (id)v24;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [a6 processDirectIDSPathWithDatagram:a3 datagramSize:v10 datagramOptions:a5 error:a7];
  }
  return result;
}

void __30__VCMockRouter_sharedInstance__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "+[VCMockRouter sharedInstance]_block_invoke";
  __int16 v6 = 1024;
  int v7 = 34;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to instantiate VCMockRouter object", (uint8_t *)&v2, 0x1Cu);
}

@end