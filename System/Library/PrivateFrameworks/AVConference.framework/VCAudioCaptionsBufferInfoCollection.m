@interface VCAudioCaptionsBufferInfoCollection
- (NSArray)streamTokens;
- (VCAudioCaptionsBufferInfoCollection)initWithBufferLength:(double)a3;
- (id)description;
- (void)dealloc;
@end

@implementation VCAudioCaptionsBufferInfoCollection

- (VCAudioCaptionsBufferInfoCollection)initWithBufferLength:(double)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VCAudioCaptionsBufferInfoCollection;
  v4 = [(VCAudioCaptionsBufferInfoCollection *)&v17 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_bufferInfos = v5;
    if (v5)
    {
      v4->_bufferLength = a3;
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptionsBufferInfoCollection.stateQueue", 0, CustomRootQueue);
      v4->_stateQueue = (OS_dispatch_queue *)v7;
      if (v7) {
        return v4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsBufferInfoCollection initWithBufferLength:]();
        }
      }
    }
    else
    {
      if ((VCAudioCaptionsBufferInfoCollection *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_19;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v10;
        __int16 v20 = 2080;
        v21 = "-[VCAudioCaptionsBufferInfoCollection initWithBufferLength:]";
        __int16 v22 = 1024;
        int v23 = 105;
        v12 = " [%s] %s:%d Failed to create buffer infos array.";
        v13 = v11;
        uint32_t v14 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v9 = (__CFString *)[(VCAudioCaptionsBufferInfoCollection *)v4 performSelector:sel_logPrefix];
        }
        else {
          v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_19;
        }
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        v21 = "-[VCAudioCaptionsBufferInfoCollection initWithBufferLength:]";
        __int16 v22 = 1024;
        int v23 = 105;
        __int16 v24 = 2112;
        v25 = v9;
        __int16 v26 = 2048;
        v27 = v4;
        v12 = " [%s] %s:%d %@(%p) Failed to create buffer infos array.";
        v13 = v16;
        uint32_t v14 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
LABEL_19:

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)VCAudioCaptionsBufferInfoCollection;
  [(VCAudioCaptionsBufferInfoCollection *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@<%p> bufferInfos=%@", NSStringFromClass(v4), self, self->_bufferInfos];
}

- (NSArray)streamTokens
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(stateQueue, block);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = (void *)[v4 initWithCapacity:v12[3]];
  v6 = self->_stateQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_2;
  v9[3] = &unk_1E6DB3E40;
  v9[4] = self;
  v9[5] = v5;
  dispatch_sync(v6, v9);
  dispatch_queue_t v7 = v5;
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_2(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_3;
  v3[3] = &unk_1E6DB7D58;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "token"));

  return [v2 addObject:v3];
}

uint64_t __VCAudioCaptionsBufferInfoCollection_GetBufferInfo_block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = *(void **)(a1[4] + 8);
  uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_queue_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = a1[6];
        uint64_t result = [v7 token];
        if (v8 == result)
        {
          *(void *)(*(void *)(a1[5] + 8) + 40) = v7;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void __VCAudioCaptionsBufferInfoCollection_AddBufferInfo_block_invoke(void *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  v2 = (unsigned char *)a1[5];
  if ([*(id *)(v3 + 8) count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = (unsigned char *)[*(id *)(v3 + 8) objectAtIndexedSubscript:v4];
      uint64_t v6 = [v2 token];
      if (v6 == [v5 token]) {
        break;
      }
      if (v2)
      {
        if (v2[64])
        {
          if (v5)
          {
            if (v5[64])
            {
              uint64_t __s2 = -1;
              *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v15 = v7;
              long long v16 = v7;
              [v5 format];
              objc_msgSend(v2, "format", -1, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
              if (memcmp(v13, &__s2, 0x28uLL))
              {
                long long v33 = 0u;
                long long v34 = 0u;
                *(_OWORD *)v31 = 0u;
                long long v32 = 0u;
                long long v29 = 0u;
                long long v30 = 0u;
                *(_OWORD *)__str = 0u;
                long long v28 = 0u;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v9 = VRTraceErrorLogLevelToCSTR();
                  long long v10 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    long long v11 = FormatToCStr((uint64_t)v13, __str, 0x40uLL);
                    long long v12 = FormatToCStr((uint64_t)&__s2, v31, 0x40uLL);
                    *(_DWORD *)buf = 136316162;
                    uint64_t v18 = v9;
                    __int16 v19 = 2080;
                    __int16 v20 = "_VCAudioCaptionsBufferInfoCollection_InsertBufferInfo";
                    __int16 v21 = 1024;
                    int v22 = 178;
                    __int16 v23 = 2080;
                    __int16 v24 = v11;
                    __int16 v25 = 2080;
                    __int16 v26 = v12;
                    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected buffer format. Format=%s doesn't match existing format=%s", buf, 0x30u);
                  }
                }
                break;
              }
            }
          }
        }
      }
      if (++v4 >= (unint64_t)[*(id *)(v3 + 8) count]) {
        goto LABEL_10;
      }
    }
    char v8 = 0;
  }
  else
  {
LABEL_10:
    [*(id *)(v3 + 8) addObject:v2];
    char v8 = 1;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8;
}

uint64_t __VCAudioCaptionsBufferInfoCollection_CopyOrderedBufferInfos_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)initWithBufferLength:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create queue", v2, v3, v4, v5, v6);
}

@end