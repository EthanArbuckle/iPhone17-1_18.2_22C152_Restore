@interface VCAudioHALPluginStream
- (VCAudioHALPluginStream)initWithDirection:(unsigned int)a3 plugin:(id)a4 withConfig:(tagVCAudioHALPluginConfiguration *)a5;
- (id)readInputBlock;
- (id)writeMixBlock;
- (void)dealloc;
- (void)invalidate;
- (void)startStream;
- (void)stopStream;
@end

@implementation VCAudioHALPluginStream

- (VCAudioHALPluginStream)initWithDirection:(unsigned int)a3 plugin:(id)a4 withConfig:(tagVCAudioHALPluginConfiguration *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)VCAudioHALPluginStream;
  v7 = -[ASDStream initWithDirection:withPlugin:](&v32, sel_initWithDirection_withPlugin_, *(void *)&a3);
  if (!v7) {
    goto LABEL_41;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v8;
      __int16 v35 = 2080;
      v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
      __int16 v37 = 1024;
      int v38 = 29;
      __int16 v39 = 2048;
      v40 = (__CFString *)v7;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-init (%p)", buf, 0x26u);
    }
  }
  if (!a4)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]();
        }
      }
      goto LABEL_41;
    }
    if (objc_opt_respondsToSelector()) {
      v18 = (__CFString *)[v7 performSelector:sel_logPrefix];
    }
    else {
      v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_41;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v34 = v22;
    __int16 v35 = 2080;
    v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
    __int16 v37 = 1024;
    int v38 = 30;
    __int16 v39 = 2112;
    v40 = v18;
    __int16 v41 = 2048;
    v42 = v7;
    v24 = " [%s] %s:%d %@(%p) invalid plugin";
    goto LABEL_54;
  }
  if (!a5)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]();
        }
      }
      goto LABEL_41;
    }
    if (objc_opt_respondsToSelector()) {
      v19 = (__CFString *)[v7 performSelector:sel_logPrefix];
    }
    else {
      v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v25 = VRTraceErrorLogLevelToCSTR(),
          v23 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_41:
      v13 = 0;
      goto LABEL_42;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v34 = v25;
    __int16 v35 = 2080;
    v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
    __int16 v37 = 1024;
    int v38 = 31;
    __int16 v39 = 2112;
    v40 = v19;
    __int16 v41 = 2048;
    v42 = v7;
    v24 = " [%s] %s:%d %@(%p) invalid config";
LABEL_54:
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x30u);
    goto LABEL_41;
  }
  double mSampleRate = a5->sinkFormat.format.mSampleRate;
  long long v12 = *(_OWORD *)&a5->sinkFormat.format.mBytesPerPacket;
  long long v11 = *(_OWORD *)&a5->sinkFormat.format.mBitsPerChannel;
  *(_OWORD *)(v7 + 280) = *(_OWORD *)&a5->sinkFormat.format.mSampleRate;
  *(_OWORD *)(v7 + 296) = v12;
  *(_OWORD *)(v7 + 312) = v11;
  *((void *)v7 + 41) = a5->sinkContext;
  *((void *)v7 + 42) = a5->sinkProc;
  *((_DWORD *)v7 + 100) = 3;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F4E7D8]) initWithSampleRate:*((unsigned int *)v7 + 77) numChannels:1 commonPCMFormat:1 isInterleaved:mSampleRate];
  if (!v13)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]();
        }
      }
      goto LABEL_42;
    }
    if (objc_opt_respondsToSelector()) {
      v20 = (__CFString *)[v7 performSelector:sel_logPrefix];
    }
    else {
      v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v34 = v27;
        __int16 v35 = 2080;
        v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
        __int16 v37 = 1024;
        int v38 = 38;
        __int16 v39 = 2112;
        v40 = v20;
        __int16 v41 = 2048;
        v42 = v7;
        v29 = " [%s] %s:%d %@(%p) could not allocate stream format";
LABEL_52:
        _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x30u);
      }
    }
LABEL_42:

    return 0;
  }
  v14 = (void *)[MEMORY[0x1E4F1CA48] array];
  v15 = (void *)[v13 copy];
  if (!v15)
  {
    if ((char *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:].cold.4();
        }
      }
      goto LABEL_42;
    }
    if (objc_opt_respondsToSelector()) {
      v21 = (__CFString *)[v7 performSelector:sel_logPrefix];
    }
    else {
      v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v34 = v30;
        __int16 v35 = 2080;
        v36 = "-[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]";
        __int16 v37 = 1024;
        int v38 = 43;
        __int16 v39 = 2112;
        v40 = v21;
        __int16 v41 = 2048;
        v42 = v7;
        v29 = " [%s] %s:%d %@(%p) could not copy format";
        goto LABEL_52;
      }
    }
    goto LABEL_42;
  }
  v16 = v15;
  [v15 setSampleRate:mSampleRate];
  [v16 setMinimumSampleRate:mSampleRate];
  [v16 setMaximumSampleRate:mSampleRate];
  [v14 addObject:v16];

  [v13 setSampleRate:mSampleRate];
  [v7 setPhysicalFormat:v13];
  [v7 setPhysicalFormats:v14];
  uint64_t v17 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v7];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __62__VCAudioHALPluginStream_initWithDirection_plugin_withConfig___block_invoke;
  v31[3] = &unk_1E6DB9080;
  v31[4] = v17;
  *((void *)v7 + 53) = [v31 copy];

  return (VCAudioHALPluginStream *)v7;
}

uint64_t __62__VCAudioHALPluginStream_initWithDirection_plugin_withConfig___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) strong];
  if (!v7) {
    return 561214578;
  }
  *(void *)(v7 + 344) = *(void *)(a3 + 144);
  *(void *)(v7 + 352) = *(void *)(a3 + 24);
  *(_DWORD *)(v7 + 416) = *(_DWORD *)(v7 + 304) * a2 * *(_DWORD *)(v7 + 308);
  *(void *)(v7 + 408) = a4;
  uint64_t v8 = *(void (**)(void))(v7 + 336);
  if (v8) {
    v8(*(void *)(v7 + 328));
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCAudioHALPluginStream dealloc]";
      __int16 v10 = 1024;
      int v11 = 72;
      __int16 v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-dealloc (%p)", buf, 0x26u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginStream;
  [(VCAudioHALPluginStream *)&v5 dealloc];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      __int16 v8 = "-[VCAudioHALPluginStream invalidate]";
      __int16 v9 = 1024;
      int v10 = 78;
      __int16 v11 = 2048;
      __int16 v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  [(VCAudioHALPluginStream *)self stopStream];
}

- (id)readInputBlock
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-readInputBlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCAudioHALPluginStream readInputBlock]";
      __int16 v10 = 1024;
      int v11 = 97;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-readInputBlock (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return 0;
}

- (id)writeMixBlock
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-writeMixBlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCAudioHALPluginStream writeMixBlock]";
      __int16 v10 = 1024;
      int v11 = 102;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-writeMixBlock (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return self->_writeMixBlockProcess;
}

- (void)startStream
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-startStream");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCAudioHALPluginStream startStream]";
      __int16 v10 = 1024;
      int v11 = 107;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-startStream (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginStream;
  [(ASDStream *)&v5 startStream];
}

- (void)stopStream
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginStream-stopStream");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCAudioHALPluginStream stopStream]";
      __int16 v10 = 1024;
      int v11 = 112;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginStream-stopStream (%p)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)VCAudioHALPluginStream;
  [(ASDStream *)&v5 stopStream];
}

- (void)initWithDirection:plugin:withConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid plugin", v2, v3, v4, v5, v6);
}

- (void)initWithDirection:plugin:withConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid config", v2, v3, v4, v5, v6);
}

- (void)initWithDirection:plugin:withConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate stream format", v2, v3, v4, v5, v6);
}

- (void)initWithDirection:plugin:withConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not copy format", v2, v3, v4, v5, v6);
}

@end