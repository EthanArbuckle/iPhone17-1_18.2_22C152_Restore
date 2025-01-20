@interface VCAudioCaptionsBufferInfo
- (AudioStreamBasicDescription)format;
- (BOOL)isEqual:(id)a3;
- (VCAudioCaptionsBufferInfo)initWithStreamConfig:(const tagVCAudioCaptionsStreamConfig *)a3 bufferLength:(double)a4;
- (id)description;
- (int64_t)token;
- (unint64_t)hash;
- (unsigned)countOfLowPrioritySamples;
- (unsigned)priority;
- (void)dealloc;
@end

@implementation VCAudioCaptionsBufferInfo

- (VCAudioCaptionsBufferInfo)initWithStreamConfig:(const tagVCAudioCaptionsStreamConfig *)a3 bufferLength:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)VCAudioCaptionsBufferInfo;
  v6 = [(VCAudioCaptionsBufferInfo *)&v21 init];
  v7 = (VCAudioCaptionsBufferInfo *)v6;
  if (v6)
  {
    if (a3)
    {
      *((void *)v6 + 9) = a3->var0;
      v6[56] = 0;
      long long v8 = *(_OWORD *)&a3->var1.mSampleRate;
      long long v9 = *(_OWORD *)&a3->var1.mBytesPerPacket;
      *((void *)v6 + 5) = *(void *)&a3->var1.mBitsPerChannel;
      *(_OWORD *)(v6 + 24) = v9;
      *(_OWORD *)(v6 + 8) = v8;
      v6[64] = a3->var2;
      int v10 = (*((double *)v6 + 1) * a4);
      unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
      long long v11 = *(_OWORD *)(v6 + 8);
      long long v12 = *(_OWORD *)(v6 + 24);
      *(void *)&buf[32] = *((void *)v6 + 5);
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v12;
      VCAudioBufferList_Allocate((long long *)buf, v10, &v20);
      if (v20)
      {
        v7->_buffer = (opaqueVCAudioBufferList *)v20;
        return v7;
      }
      if ((VCAudioCaptionsBufferInfo *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:]();
          }
        }
        goto LABEL_25;
      }
      if (objc_opt_respondsToSelector()) {
        v15 = (__CFString *)[(VCAudioCaptionsBufferInfo *)v7 performSelector:sel_logPrefix];
      }
      else {
        v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v19 = VRTraceErrorLogLevelToCSTR(),
            v17 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_25:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 41;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v15;
      *(_WORD *)&buf[38] = 2048;
      v23 = v7;
      v18 = " [%s] %s:%d %@(%p) Failed to allocate buffer for buffer info.";
    }
    else
    {
      if ((char *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:]();
          }
        }
        goto LABEL_25;
      }
      if (objc_opt_respondsToSelector()) {
        v14 = (__CFString *)[(VCAudioCaptionsBufferInfo *)v7 performSelector:sel_logPrefix];
      }
      else {
        v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_25;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioCaptionsBufferInfo initWithStreamConfig:bufferLength:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 33;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v14;
      *(_WORD *)&buf[38] = 2048;
      v23 = v7;
      v18 = " [%s] %s:%d %@(%p) Stream config is NULL";
    }
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x30u);
    goto LABEL_25;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  buffer = self->_buffer;
  p_buffer = (uint64_t *)&self->_buffer;
  if (buffer) {
    VCAudioBufferList_Destroy(p_buffer);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCAudioCaptionsBufferInfo;
  [(VCAudioCaptionsBufferInfo *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@<%p> streamToken=%ld priority=%d", NSStringFromClass(v4), self, self->_token, self->_priority];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t v5 = [(VCAudioCaptionsBufferInfo *)self token];
  if (v5 != [a3 token]) {
    return 0;
  }
  int v6 = [(VCAudioCaptionsBufferInfo *)self priority];
  return v6 == [a3 priority];
}

- (unint64_t)hash
{
  return (2654435761 * self->_priority) ^ (2654435761 * self->_token);
}

- (int64_t)token
{
  return self->_token;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)countOfLowPrioritySamples
{
  return self->_countOfLowPrioritySamples;
}

- (AudioStreamBasicDescription)format
{
  long long v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (void)initWithStreamConfig:bufferLength:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream config is NULL", v2, v3, v4, v5, v6);
}

- (void)initWithStreamConfig:bufferLength:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate buffer for buffer info.", v2, v3, v4, v5, v6);
}

@end