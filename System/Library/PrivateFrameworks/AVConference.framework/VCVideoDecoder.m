@interface VCVideoDecoder
+ (id)decoderForStreamToken:(int64_t)a3 withConfig:(tagVideoDecoderConfig *)a4;
+ (id)streamTokenDecoderMap;
+ (void)releaseVideoDecoderForStreamToken:(int64_t)a3;
- (VCVideoDecoder)initWithConfig:(tagVideoDecoderConfig *)a3;
- (tagHANDLE)videoPlayerHandle;
- (void)dealloc;
@end

@implementation VCVideoDecoder

- (VCVideoDecoder)initWithConfig:(tagVideoDecoderConfig *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoDecoder;
  v4 = [(VCVideoDecoder *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t streamToken = a3->var0;
    v4->_clientCount = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t streamToken = v5->_streamToken;
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        v16 = "-[VCVideoDecoder initWithConfig:]";
        __int16 v17 = 1024;
        int v18 = 36;
        __int16 v19 = 1024;
        int v20 = streamToken;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%u", buf, 0x22u);
      }
    }
    if (a3->var5)
    {
      VideoDecoder_Create((uint64_t *)&v5->_videoPlayerHandle, (uint64_t)a3);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoDecoder initWithConfig:](v9, v10);
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VideoDecoder_Destroy();
  v3.receiver = self;
  v3.super_class = (Class)VCVideoDecoder;
  [(VCVideoDecoder *)&v3 dealloc];
}

- (tagHANDLE)videoPlayerHandle
{
  return self->_videoPlayerHandle;
}

+ (id)streamTokenDecoderMap
{
  if (streamTokenDecoderMap_token != -1) {
    dispatch_once(&streamTokenDecoderMap_token, &__block_literal_global_63);
  }
  return (id)_streamTokenDecoderMap;
}

id __39__VCVideoDecoder_streamTokenDecoderMap__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  _streamTokenDecoderMap = (uint64_t)result;
  return result;
}

+ (id)decoderForStreamToken:(int64_t)a3 withConfig:(tagVideoDecoderConfig *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&_lock);
  id v6 = +[VCVideoDecoder streamTokenDecoderMap];
  uint64_t v7 = objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
  if (v7)
  {
    v8 = (VCVideoDecoder *)v7;
    ++*(_DWORD *)(v7 + 24);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        __int16 v17 = "+[VCVideoDecoder decoderForStreamToken:withConfig:]";
        __int16 v18 = 1024;
        int v19 = 71;
        __int16 v20 = 2048;
        uint64_t v21 = v8;
        __int16 v22 = 1024;
        int v23 = a3;
        v11 = " [%s] %s:%d VCVideoDecoder %p exists for streamToken=%u";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x2Cu);
      }
    }
  }
  else
  {
    v8 = [[VCVideoDecoder alloc] initWithConfig:a4];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, objc_msgSend(NSNumber, "numberWithInteger:", a3));

    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        __int16 v17 = "+[VCVideoDecoder decoderForStreamToken:withConfig:]";
        __int16 v18 = 1024;
        int v19 = 77;
        __int16 v20 = 2048;
        uint64_t v21 = v8;
        __int16 v22 = 1024;
        int v23 = a3;
        v11 = " [%s] %s:%d VCVideoDecoder %p created for streamToken=%u";
        goto LABEL_8;
      }
    }
  }
  pthread_mutex_unlock(&_lock);
  return v8;
}

+ (void)releaseVideoDecoderForStreamToken:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&_lock);
  id v4 = +[VCVideoDecoder streamTokenDecoderMap];
  uint64_t v5 = objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = *(_DWORD *)(v5 + 24);
    BOOL v8 = __OFSUB__(v7--, 1);
    *(_DWORD *)(v5 + 24) = v7;
    if ((v7 < 0) ^ v8 | (v7 == 0))
    {
      objc_msgSend(v4, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136316162;
          uint64_t v21 = v9;
          __int16 v22 = 2080;
          int v23 = "+[VCVideoDecoder releaseVideoDecoderForStreamToken:]";
          __int16 v24 = 1024;
          int v25 = 91;
          __int16 v26 = 2048;
          uint64_t v27 = v6;
          __int16 v28 = 1024;
          int v29 = a3;
          v11 = " [%s] %s:%d VCVideoDecoder %p released for streamToken=%u";
          uint64_t v12 = v10;
          uint32_t v13 = 44;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, v13);
        }
      }
    }
    else
    {
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        __int16 v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = *(_DWORD *)(v6 + 24);
          int v20 = 136316418;
          uint64_t v21 = v17;
          __int16 v22 = 2080;
          int v23 = "+[VCVideoDecoder releaseVideoDecoderForStreamToken:]";
          __int16 v24 = 1024;
          int v25 = 93;
          __int16 v26 = 2048;
          uint64_t v27 = v6;
          __int16 v28 = 1024;
          int v29 = a3;
          __int16 v30 = 1024;
          int v31 = v19;
          v11 = " [%s] %s:%d VCVideoDecoder %p streamToken=%u clientCount=%d";
          uint64_t v12 = v18;
          uint32_t v13 = 50;
          goto LABEL_13;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCVideoDecoder releaseVideoDecoderForStreamToken:v15];
    }
  }
  pthread_mutex_unlock(&_lock);
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCVideoDecoder initWithConfig:]";
  __int16 v6 = 1024;
  int v7 = 38;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to init VCVideoDecoder with NULL frame callback", (uint8_t *)&v2, 0x1Cu);
}

+ (void)releaseVideoDecoderForStreamToken:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "+[VCVideoDecoder releaseVideoDecoderForStreamToken:]";
  __int16 v7 = 1024;
  int v8 = 96;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCVideoDecoder cannot be found via streamToken=%u", (uint8_t *)&v3, 0x22u);
}

@end