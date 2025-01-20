@interface VCSessionMediaStreamConfigurationProvider
+ (BOOL)audioConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 supportsDeviceClass:(int64_t)a4;
+ (BOOL)isAudioStreamOnDemand:(_VCMediaStreamConfigurationProviderAudio *)a3 isLowestQualityAudio:(BOOL)a4;
+ (BOOL)isVideoStreamOnDemand:(_VCMediaStreamConfigurationProviderVideo *)a3;
+ (unsigned)maxStreamIDCountFromStreamIndex:(unsigned int)a3;
+ (void)configureAudioStreams:(id)a3 withCodecConfiguration:(_VCMediaStreamConfigurationProviderAudio *)a4 payloadsVersion:(unsigned int)a5;
+ (void)fixAudioStreamConfigurations;
- (BOOL)initializeAudioStreamWithConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 maxIDSStreamIDCount:(unsigned int)a4 supportedAudioRules:(id)a5 isLowestQualityAudio:(BOOL)a6;
- (BOOL)initializeAudioStreamsWithSupportedRules:(id)a3;
- (BOOL)initializeStreamsWithSupportedAudioRules:(id)a3;
- (BOOL)initializeVideoStreamWithConfig:(_VCMediaStreamConfigurationProviderVideo *)a3 streamIndex:(unsigned int)a4;
- (BOOL)initializeVideoStreamWithDefaults;
- (BOOL)initializeVideoStreams;
- (BOOL)isEncodingSqaures;
- (NSArray)audioStreamConfigurations;
- (NSArray)videoStreamConfigurations;
- (VCSessionMediaStreamConfigurationProvider)initWithStreamIDGenerator:(id)a3 sessionMode:(int64_t)a4 supportedAudioRules:(id)a5;
- (id)audioRuleCollectionWithAudioConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 supportedAudioRules:(id)a4;
- (int)streamPayloadFromProviderConfig:(_VCMediaStreamConfigurationProviderVideo *)a3;
- (int64_t)highestEncodingResolution;
- (void)audioStreamConfigs:(_VCMediaStreamConfigurationProviderAudio *)a3 configCount:(unsigned int *)a4;
- (void)dealloc;
- (void)initializeVideoStreamWithDefaults;
- (void)initializeVideoStreams;
@end

@implementation VCSessionMediaStreamConfigurationProvider

- (VCSessionMediaStreamConfigurationProvider)initWithStreamIDGenerator:(id)a3 sessionMode:(int64_t)a4 supportedAudioRules:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCSessionMediaStreamConfigurationProvider;
  v8 = [(VCSessionMediaStreamConfigurationProvider *)&v24 init];
  v9 = v8;
  if (v8)
  {
    _audioStreamConfigurationsCount = 0;
    v8->_sessionMode = a4;
    v10 = (VCIDSStreamIDGenerator *)a3;
    v9->_streamIDGenerator = v10;
    if (v10)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9->_audioStreamConfigurations = v11;
      if (v11)
      {
        v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v9->_videoStreamConfigurations = v12;
        if (v12)
        {
          if ([(VCSessionMediaStreamConfigurationProvider *)v9 initializeStreamsWithSupportedAudioRules:a5])
          {
            return v9;
          }
          if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:].cold.4();
              }
            }
            goto LABEL_48;
          }
          if (objc_opt_respondsToSelector()) {
            v17 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)v9 performSelector:sel_logPrefix];
          }
          else {
            v17 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v23 = VRTraceErrorLogLevelToCSTR();
            v19 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v26 = v23;
              __int16 v27 = 2080;
              v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
              __int16 v29 = 1024;
              int v30 = 399;
              __int16 v31 = 2112;
              v32 = v17;
              __int16 v33 = 2048;
              v34 = v9;
              v20 = " [%s] %s:%d %@(%p) Failed to initialize streams";
              goto LABEL_47;
            }
          }
LABEL_48:

          return 0;
        }
        if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]();
            }
          }
          goto LABEL_48;
        }
        if (objc_opt_respondsToSelector()) {
          v16 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)v9 performSelector:sel_logPrefix];
        }
        else {
          v16 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_48;
        }
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
        __int16 v29 = 1024;
        int v30 = 396;
        __int16 v31 = 2112;
        v32 = v16;
        __int16 v33 = 2048;
        v34 = v9;
        v20 = " [%s] %s:%d %@(%p) Failed to allocate video stream array";
      }
      else
      {
        if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]();
            }
          }
          goto LABEL_48;
        }
        if (objc_opt_respondsToSelector()) {
          v15 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)v9 performSelector:sel_logPrefix];
        }
        else {
          v15 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_48;
        }
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v21;
        __int16 v27 = 2080;
        v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
        __int16 v29 = 1024;
        int v30 = 393;
        __int16 v31 = 2112;
        v32 = v15;
        __int16 v33 = 2048;
        v34 = v9;
        v20 = " [%s] %s:%d %@(%p) Failed to allocate audio stream array";
      }
    }
    else
    {
      if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == v9)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]();
          }
        }
        goto LABEL_48;
      }
      if (objc_opt_respondsToSelector()) {
        v14 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)v9 performSelector:sel_logPrefix];
      }
      else {
        v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_48;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v18;
      __int16 v27 = 2080;
      v28 = "-[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]";
      __int16 v29 = 1024;
      int v30 = 390;
      __int16 v31 = 2112;
      v32 = v14;
      __int16 v33 = 2048;
      v34 = v9;
      v20 = " [%s] %s:%d %@(%p) Invalid stream ID generator provided";
    }
LABEL_47:
    _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x30u);
    goto LABEL_48;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaStreamConfigurationProvider;
  [(VCSessionMediaStreamConfigurationProvider *)&v3 dealloc];
}

- (BOOL)initializeStreamsWithSupportedAudioRules:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(VCSessionMediaStreamConfigurationProvider *)self initializeAudioStreamsWithSupportedRules:a3])
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v5 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_25;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      int v12 = 136316162;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      v15 = "-[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:]";
      __int16 v16 = 1024;
      int v17 = 420;
      __int16 v18 = 2112;
      v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      v9 = " [%s] %s:%d %@(%p) Audio Stream initialization failed";
LABEL_24:
      _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, 0x30u);
      goto LABEL_25;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      -[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:]();
    }
LABEL_25:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (![(VCSessionMediaStreamConfigurationProvider *)self initializeVideoStreams])
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_25;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      int v12 = 136316162;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      v15 = "-[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:]";
      __int16 v16 = 1024;
      int v17 = 424;
      __int16 v18 = 2112;
      v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      v9 = " [%s] %s:%d %@(%p) Video Stream initialization failed";
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      -[VCSessionMediaStreamConfigurationProvider initializeStreamsWithSupportedAudioRules:]();
    }
    goto LABEL_25;
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (BOOL)initializeVideoStreams
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettings isVideoRenderingSupported])
  {
    if ([+[VCDefaults sharedInstance] forceMultiwayHWI])
    {
      LOBYTE(v3) = [(VCSessionMediaStreamConfigurationProvider *)self initializeVideoStreamWithDefaults];
    }
    else
    {
      uint64_t v4 = 0;
      self->_videoStreamConfigurationsCount = 7;
      v5 = &_videoStreamConfigs;
      while ([(VCSessionMediaStreamConfigurationProvider *)self initializeVideoStreamWithConfig:v5 streamIndex:v4])
      {
        int64_t v6 = *v5;
        v5 += 6;
        self->_highestEncodingResolution = v6;
        if (++v4 >= (unint64_t)self->_videoStreamConfigurationsCount) {
          goto LABEL_9;
        }
      }
      if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v3) {
            return v3;
          }
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreams]();
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E4F47A50];
          BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v3) {
            return v3;
          }
          int v11 = 136316162;
          uint64_t v12 = v8;
          __int16 v13 = 2080;
          __int16 v14 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreams]";
          __int16 v15 = 1024;
          int v16 = 442;
          __int16 v17 = 2112;
          __int16 v18 = v7;
          __int16 v19 = 2048;
          __int16 v20 = self;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initialize video multiway stream", (uint8_t *)&v11, 0x30u);
        }
      }
      LOBYTE(v3) = 0;
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (int)streamPayloadFromProviderConfig:(_VCMediaStreamConfigurationProviderVideo *)a3
{
  uint64_t v4 = +[VCVideoRuleCollectionsCamera sharedInstance];
  for (unsigned __int8 i = 1; ; ++i)
  {
    unsigned int v6 = i;
    uint64_t v7 = [[VCVideoRuleCollectionKey alloc] initWithPayload:a3->var6 transportType:i encodingType:1];
    uint64_t v8 = (void *)[(NSMutableDictionary *)[(VCVideoRuleCollections *)v4 rules] objectForKeyedSubscript:v7];

    if (v8)
    {
      if ([v8 count]) {
        break;
      }
    }
    if (v6 >= 2) {
      return 123;
    }
  }
  return a3->var6;
}

- (BOOL)initializeVideoStreamWithConfig:(_VCMediaStreamConfigurationProviderVideo *)a3 streamIndex:(unsigned int)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = -[VCSessionMediaStreamConfigurationProvider streamPayloadFromProviderConfig:](self, "streamPayloadFromProviderConfig:", a3, *(void *)&a4);
  unsigned int var1 = a3->var1;
  if (var1 >= +[VCHardwareSettings maxMultiwayFramerateSupported](VCHardwareSettings, "maxMultiwayFramerateSupported"))unsigned int var1 = +[VCHardwareSettings maxMultiwayFramerateSupported]; {
  int64_t var0 = a3->var0;
  }
  if (a3->var0 == 16)
  {
    if (!+[VCHardwareSettings supportsMultiway720pStream])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 1;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v50 = v27;
      __int16 v51 = 2080;
      v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
      __int16 v53 = 1024;
      int v54 = 480;
      __int16 v29 = " [%s] %s:%d Device does not support 720p stream. Skipping this stream";
      goto LABEL_39;
    }
    int64_t var0 = a3->var0;
  }
  if (var0 == 20
    && !+[VCHardwareSettings supportsMultiway1080pStream])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v50 = v33;
    __int16 v51 = 2080;
    v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
    __int16 v53 = 1024;
    int v54 = 484;
    __int16 v29 = " [%s] %s:%d Device does not support 1080p stream. Skipping this stream";
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x1Cu);
    return 1;
  }
  char v11 = a3->var6 == 100 && v6 == 123 && var1 > 0xF;
  uint64_t v12 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (!v12)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]();
        }
      }
      goto LABEL_73;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v35 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v35 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_73;
    }
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v50 = v39;
    __int16 v51 = 2080;
    v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
    __int16 v53 = 1024;
    int v54 = 496;
    __int16 v55 = 2112;
    v56 = v35;
    __int16 v57 = 2048;
    v58 = self;
    v41 = " [%s] %s:%d %@(%p) Failed to create video multiway config";
    goto LABEL_85;
  }
  __int16 v13 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v13)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]();
        }
      }
      goto LABEL_73;
    }
    if (objc_opt_respondsToSelector()) {
      v36 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v36 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v42 = VRTraceErrorLogLevelToCSTR(),
          v40 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_73:
      int v16 = 0;
      __int16 v14 = 0;
      goto LABEL_83;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v50 = v42;
    __int16 v51 = 2080;
    v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
    __int16 v53 = 1024;
    int v54 = 499;
    __int16 v55 = 2112;
    v56 = v36;
    __int16 v57 = 2048;
    v58 = self;
    v41 = " [%s] %s:%d %@(%p) Failed to create video stream config";
LABEL_85:
    _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, v41, buf, 0x30u);
    goto LABEL_73;
  }
  __int16 v14 = v13;
  __int16 v15 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (v15)
  {
    int v16 = v15;
    uint64_t v17 = var1 >> v11;
    unint64_t v18 = [(VCIDSStreamIDGenerator *)self->_streamIDGenerator generateSSRC:1 streamID:1 repairStreamID:a3->var7 != 0 v2StreamID:0];
    [(VCMediaStreamMultiwayConfig *)v12 setSsrc:v18];
    [(VCMediaStreamMultiwayConfig *)v12 setMaxNetworkBitrate:a3->var3];
    [(VCMediaStreamMultiwayConfig *)v12 setMaxMediaBitrate:a3->var4];
    [(VCMediaStreamMultiwayConfig *)v12 setQualityIndex:a3->var5];
    [(VCMediaStreamMultiwayConfig *)v12 setIdsStreamID:WORD2(v18)];
    if (a3->var7)
    {
      [(VCMediaStreamMultiwayConfig *)v12 setRepairedStreamID:HIWORD(v18)];
      [(VCMediaStreamMultiwayConfig *)v12 setRepairedMaxNetworkBitrate:a3->var7];
    }
    [(VCMediaStreamMultiwayConfigVideo *)v12 setResolution:a3->var0];
    [(VCMediaStreamMultiwayConfigVideo *)v12 setFramerate:v17];
    [(VCMediaStreamMultiwayConfigVideo *)v12 setKeyFrameInterval:a3->var2];
    [(VCMediaStreamMultiwayConfig *)v12 setStartOnDemand:+[VCSessionMediaStreamConfigurationProvider isVideoStreamOnDemand:a3]];
    [(VCMediaStreamMultiwayConfig *)v12 setNegotiationProtocolMask:a3->var9];
    [(VCMediaStreamMultiwayConfig *)v12 setRepairedFECLevel:a3->var10];
    [(VCMediaStreamMultiwayConfigVideo *)v12 addPayload:v6];
    uint64_t var3 = a3->var3;
    uint64_t var4 = a3->var4;
    [(VCMediaStreamConfig *)v14 setMultiwayConfig:v12];
    [(VCMediaStreamConfig *)v14 setDirection:1];
    [(VCVideoStreamConfig *)v14 setVideoResolution:a3->var0];
    [(VCVideoStreamConfig *)v14 setFramerate:v17];
    [(VCVideoStreamConfig *)v14 setKeyFrameInterval:a3->var2];
    [(VCVideoStreamConfig *)v14 setTxMinBitrate:var4];
    [(VCVideoStreamConfig *)v14 setTxMaxBitrate:a3->var4];
    [(VCVideoStreamConfig *)v14 setRxMinBitrate:var3];
    [(VCVideoStreamConfig *)v14 setRxMaxBitrate:a3->var3];
    [(VCVideoStreamConfig *)v14 setType:3];
    [(VCVideoStreamConfig *)v14 setSourceFramerate:30];
    [(VCVideoStreamConfig *)v14 setRemoteVideoInitialOrientation:0];
    [(VCMediaStreamConfig *)v14 setRemoteSSRC:[(VCIDSStreamIDGenerator *)self->_streamIDGenerator generateSSRC]];
    [(VCMediaStreamConfig *)v14 setRateControlConfig:v16];
    [(VCVideoStreamConfig *)v14 setParameterSets:VCVideoParamaterSets_DefaultSupportedSets(v6)];
    [(VCMediaStreamConfig *)v14 setRtpTimestampRate:24000];
    [(VCMediaStreamConfig *)v14 addTxPayloadType:v6 networkPayload:v6];
    [(VCMediaStreamConfig *)v14 addRxPayloadType:v6 networkPayload:v6];
    if ([(VCMediaStreamMultiwayConfig *)v12 isOneToOne]) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 2;
    }
    id v22 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:v21];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v48 = [NSNumber numberWithUnsignedInt:v6];
      BOOL v24 = 1;
      -[VCSessionParticipantVideoStreamConfig setupRxPayloads:featureStrings:](v14, "setupRxPayloads:featureStrings:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1], v23);
      uint64_t v47 = [NSNumber numberWithUnsignedInt:v6];
      -[VCSessionParticipantVideoStreamConfig setupTxPayloads:featureStrings:](v14, "setupTxPayloads:featureStrings:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1], v23);

      [(NSMutableArray *)self->_videoStreamConfigurations addObject:v14];
      +[VideoUtil sizeForVideoResolution:a3->var0];
      if (v26 == v25)
      {
        self->_isEncodingSqaures = 1;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          __int16 v31 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int64_t v32 = a3->var0;
            *(_DWORD *)buf = 136315906;
            uint64_t v50 = v30;
            __int16 v51 = 2080;
            v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
            __int16 v53 = 1024;
            int v54 = 557;
            __int16 v55 = 1024;
            LODWORD(v56) = v32;
            _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoResolution is %d, not encoding squares", buf, 0x22u);
          }
        }
        BOOL v24 = 1;
      }
      goto LABEL_35;
    }
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v38 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        v38 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v45 = VRTraceErrorLogLevelToCSTR();
        v46 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v50 = v45;
          __int16 v51 = 2080;
          v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
          __int16 v53 = 1024;
          int v54 = 547;
          __int16 v55 = 2112;
          v56 = v38;
          __int16 v57 = 2048;
          v58 = self;
          _os_log_error_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create featureStrings", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v37 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        v37 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v43 = VRTraceErrorLogLevelToCSTR();
        v44 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v50 = v43;
          __int16 v51 = 2080;
          v52 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithConfig:streamIndex:]";
          __int16 v53 = 1024;
          int v54 = 502;
          __int16 v55 = 2112;
          v56 = v37;
          __int16 v57 = 2048;
          v58 = self;
          _os_log_error_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create rate control config", buf, 0x30u);
        }
      }
    }
    int v16 = 0;
  }
LABEL_83:
  BOOL v24 = 0;
LABEL_35:

  return v24;
}

- (BOOL)initializeVideoStreamWithDefaults
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", [+[VCDefaults sharedInstance](VCDefaults, "sharedInstance") forceEncodeWidth], [+[VCDefaults sharedInstance] forceEncodeHeight]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v46 = v4;
      __int16 v47 = 2080;
      uint64_t v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
      __int16 v49 = 1024;
      int v50 = 571;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = [+[VCDefaults sharedInstance] forceEncodeWidth];
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = [+[VCDefaults sharedInstance] forceEncodeHeight];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d force encode size width is %d, height is %d", buf, 0x28u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v46 = v6;
      __int16 v47 = 2080;
      uint64_t v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
      __int16 v49 = 1024;
      int v50 = 572;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = v3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video reolution is %d", buf, 0x22u);
    }
  }
  int64_t v36 = v3;
  int v37 = [+[VCDefaults sharedInstance] forceFramerate];
  int v38 = [+[VCDefaults sharedInstance] forceKeyFrameInterval];
  unsigned int v39 = ((double)(1000
                              * [+[VCDefaults sharedInstance] forceBitrate])* 1.2);
  int v40 = 1000
      * [+[VCDefaults sharedInstance] forceBitrate];
  int v41 = 125;
  int v42 = [+[VCDefaults sharedInstance] forceVideoPayload];
  unint64_t v43 = 0xAAAAAA0000000000;
  uint64_t v44 = 0;
  +[VideoUtil sizeForVideoResolution:v3];
  if (v9 == v8) {
    self->_isEncodingSqaures = 1;
  }
  self->_highestEncodingResolution = v3;
  BOOL v10 = [(VCSessionMediaStreamConfigurationProvider *)self initializeVideoStreamWithConfig:&v36 streamIndex:0xFFFFFFFFLL];
  char v11 = (VCSessionMediaStreamConfigurationProvider *)objc_opt_class();
  if (v10)
  {
    if (v11 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = [+[VCDefaults sharedInstance] forceVideoPayload];
          int v17 = [+[VCDefaults sharedInstance] forceEncodeWidth];
          int v18 = [+[VCDefaults sharedInstance] forceEncodeHeight];
          int v19 = [+[VCDefaults sharedInstance] forceFramerate];
          int v20 = [+[VCDefaults sharedInstance] forceBitrate];
          int v21 = [+[VCDefaults sharedInstance] forceKeyFrameInterval];
          *(_DWORD *)buf = 136317186;
          uint64_t v46 = v14;
          __int16 v47 = 2080;
          uint64_t v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
          __int16 v49 = 1024;
          int v50 = 592;
          __int16 v51 = 1024;
          *(_DWORD *)v52 = v16;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v17;
          LOWORD(v53) = 1024;
          *(_DWORD *)((char *)&v53 + 2) = v18;
          HIWORD(v53) = 1024;
          *(_DWORD *)int v54 = v19;
          *(_WORD *)&v54[4] = 1024;
          *(_DWORD *)__int16 v55 = v20;
          *(_WORD *)&v55[4] = 1024;
          *(_DWORD *)v56 = v21;
          id v22 = " [%s] %s:%d Created video stream config with forceHWI to initialize video a multiway stream. Stream[Code"
                "c=%d,W=%d,H=%d,fps=%d,%xkbps, %dIDR/sec]";
          uint64_t v23 = v15;
          uint32_t v24 = 64;
LABEL_26:
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        double v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v35 = [+[VCDefaults sharedInstance] forceVideoPayload];
          int v27 = [+[VCDefaults sharedInstance] forceEncodeWidth];
          int v28 = [+[VCDefaults sharedInstance] forceEncodeHeight];
          int v29 = [+[VCDefaults sharedInstance] forceFramerate];
          int v30 = [+[VCDefaults sharedInstance] forceBitrate];
          int v31 = [+[VCDefaults sharedInstance] forceKeyFrameInterval];
          *(_DWORD *)buf = 136317698;
          uint64_t v46 = v25;
          __int16 v47 = 2080;
          uint64_t v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
          __int16 v49 = 1024;
          int v50 = 592;
          __int16 v51 = 2112;
          *(void *)v52 = v12;
          *(_WORD *)&v52[8] = 2048;
          __int16 v53 = self;
          *(_WORD *)int v54 = 1024;
          *(_DWORD *)&v54[2] = v35;
          *(_WORD *)__int16 v55 = 1024;
          *(_DWORD *)&v55[2] = v27;
          *(_WORD *)v56 = 1024;
          *(_DWORD *)&v56[2] = v28;
          __int16 v57 = 1024;
          int v58 = v29;
          __int16 v59 = 1024;
          int v60 = v30;
          __int16 v61 = 1024;
          int v62 = v31;
          id v22 = " [%s] %s:%d %@(%p) Created video stream config with forceHWI to initialize video a multiway stream. Stre"
                "am[Codec=%d,W=%d,H=%d,fps=%d,%xkbps, %dIDR/sec]";
          uint64_t v23 = v26;
          uint32_t v24 = 84;
          goto LABEL_26;
        }
      }
    }
  }
  else if (v11 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      uint64_t v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v46 = v32;
        __int16 v47 = 2080;
        uint64_t v48 = "-[VCSessionMediaStreamConfigurationProvider initializeVideoStreamWithDefaults]";
        __int16 v49 = 1024;
        int v50 = 589;
        __int16 v51 = 2112;
        *(void *)v52 = v13;
        *(_WORD *)&v52[8] = 2048;
        __int16 v53 = self;
        _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to forceHWI initialize video multiway stream", buf, 0x30u);
      }
    }
  }
  return v10;
}

+ (void)fixAudioStreamConfigurations
{
  int64_t v2 = +[VCHardwareSettings deviceClass];
  if (v2 == 8) {
    int v3 = 31867;
  }
  else {
    int v3 = 31334;
  }
  if (v2 == 8) {
    int v4 = 74000;
  }
  else {
    int v4 = 73400;
  }
  _audioStreamConfigs = v3;
  dword_1EADC43D0 = v4;
  _audioStreamConfigurationsCount = v2 != 8;
}

- (void)audioStreamConfigs:(_VCMediaStreamConfigurationProviderAudio *)a3 configCount:(unsigned int *)a4
{
  +[VCSessionMediaStreamConfigurationProvider fixAudioStreamConfigurations];
  uint64_t v7 = (_VCMediaStreamConfigurationProviderAudio *)&_audioStreamConfigs;
  if (self->_sessionMode == 2) {
    uint64_t v7 = (_VCMediaStreamConfigurationProviderAudio *)&_spatialAudioStreamConfigs;
  }
  if ((self->_sessionMode == 2) | _audioStreamConfigurationsCount & 1) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = 3;
  }
  *a3 = v7;
  *a4 = v8;
}

+ (BOOL)audioConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 supportsDeviceClass:(int64_t)a4
{
  unint64_t var11 = a3->var11;
  if (!var11) {
    return 0;
  }
  if (a3->var12[0] == a4) {
    return 1;
  }
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = v6;
    if (var11 - 1 == v6) {
      break;
    }
    int64_t v8 = a3->var12[++v6];
  }
  while (v8 != a4);
  return v7 + 1 < var11;
}

- (BOOL)initializeAudioStreamsWithSupportedRules:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  unsigned int v18 = 0;
  [(VCSessionMediaStreamConfigurationProvider *)self audioStreamConfigs:&v19 configCount:&v18];
  if (a3)
  {
    int64_t v5 = +[VCHardwareSettings deviceClass];
    if (v18)
    {
      int64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      while (+[VCSessionMediaStreamConfigurationProvider audioConfig:v19 + v7 supportsDeviceClass:v6])
      {
        if (![(VCSessionMediaStreamConfigurationProvider *)self initializeAudioStreamWithConfig:v19 + v7 maxIDSStreamIDCount:v8 + v18 supportedAudioRules:a3 isLowestQualityAudio:v8 == 0])
        {
          if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_30;
            }
            VRTraceErrorLogLevelToCSTR();
            BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (v10)
            {
              -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:]();
              goto LABEL_30;
            }
            return v10;
          }
          if (objc_opt_respondsToSelector()) {
            char v11 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
          }
          else {
            char v11 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_30;
          }
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          __int16 v13 = *MEMORY[0x1E4F47A50];
          BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v10) {
            return v10;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v21 = v12;
          __int16 v22 = 2080;
          uint64_t v23 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:]";
          __int16 v24 = 1024;
          int v25 = 652;
          __int16 v26 = 2112;
          int v27 = v11;
          __int16 v28 = 2048;
          int v29 = self;
          uint64_t v14 = " [%s] %s:%d %@(%p) Failed to create audio stream config";
          goto LABEL_19;
        }
        ++v9;
        --v8;
        v7 += 232;
        if (v9 >= v18) {
          break;
        }
      }
    }
    LOBYTE(v10) = 1;
  }
  else
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v13 = *MEMORY[0x1E4F47A50];
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v16;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamsWithSupportedRules:]";
        __int16 v24 = 1024;
        int v25 = 638;
        __int16 v26 = 2112;
        int v27 = v15;
        __int16 v28 = 2048;
        int v29 = self;
        uint64_t v14 = " [%s] %s:%d %@(%p) Failed to load supported audio rule collection";
LABEL_19:
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x30u);
      }
    }
LABEL_30:
    LOBYTE(v10) = 0;
  }
  return v10;
}

+ (unsigned)maxStreamIDCountFromStreamIndex:(unsigned int)a3
{
  int64_t v4 = +[VCHardwareSettings deviceClass];
  +[VCSessionMediaStreamConfigurationProvider fixAudioStreamConfigurations];
  unint64_t v5 = 0;
  int64_t v6 = &_audioStreamConfigs;
  do
  {
    if (!+[VCSessionMediaStreamConfigurationProvider audioConfig:v6 supportsDeviceClass:v4])break; {
    ++v5;
    }
    unint64_t v7 = _audioStreamConfigurationsCount ? 2 : 3;
    v6 += 58;
  }
  while (v5 < v7);
  if (v5 >= a3) {
    return v5 - a3;
  }
  else {
    return 0;
  }
}

+ (BOOL)isAudioStreamOnDemand:(_VCMediaStreamConfigurationProviderAudio *)a3 isLowestQualityAudio:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t BoolValueForKey = VCDefaults_GetBoolValueForKey(@"forceAudioOnDemand", a3->var8);
  if (v4)
  {
    id v6 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-low-quality-audio-stream-on-demand", @"lowQualityAudioOnDemand", [NSNumber numberWithBool:BoolValueForKey], 0);
    LOBYTE(BoolValueForKey) = [v6 BOOLValue];
  }
  return BoolValueForKey;
}

+ (BOOL)isVideoStreamOnDemand:(_VCMediaStreamConfigurationProviderVideo *)a3
{
  uint64_t BoolValueForKey = VCDefaults_GetBoolValueForKey(@"forceVideoOnDemand", a3->var8);
  if (a3->var5 == dword_1EADC3FE0)
  {
    id v5 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-low-quality-video-stream-on-demand", @"lowQualityVideoOnDemand", [NSNumber numberWithBool:BoolValueForKey], 0);
    LOBYTE(BoolValueForKey) = [v5 BOOLValue];
  }
  return BoolValueForKey;
}

+ (void)configureAudioStreams:(id)a3 withCodecConfiguration:(_VCMediaStreamConfigurationProviderAudio *)a4 payloadsVersion:(unsigned int)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a5 == 2)
  {
    p_var13 = &a4->var13;
    var14 = a4->var14;
    int v6 = 1;
  }
  else
  {
    if (a5 != 1) {
      return;
    }
    int v6 = 0;
    p_var13 = &a4->var3;
    var14 = a4->var4;
  }
  uint64_t v9 = *p_var13;
  if (v9)
  {
    for (unsigned __int8 i = (unsigned int *)&var14->var1; ; i += 4)
    {
      uint64_t v11 = *((void *)i - 1);
      int v12 = +[VCPayloadUtils payloadForCodecType:v11];
      __int16 v13 = [[VCAudioStreamCodecConfig alloc] initWithCodecType:v11];
      if (!v13)
      {
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              +[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            int v17 = (__CFString *)[a1 performSelector:sel_logPrefix];
          }
          else {
            int v17 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v18 = VRTraceErrorLogLevelToCSTR();
            uint64_t v19 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v22 = v18;
              __int16 v23 = 2080;
              __int16 v24 = "+[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:]";
              __int16 v25 = 1024;
              int v26 = 726;
              __int16 v27 = 2112;
              __int16 v28 = v17;
              __int16 v29 = 2048;
              id v30 = a1;
              __int16 v31 = 1024;
              int v32 = v12;
              _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate codec config for payload=%d", buf, 0x36u);
            }
          }
        }
        return;
      }
      uint64_t v14 = v13;
      [(VCAudioStreamCodecConfig *)v13 setPreferredMode:*i];
      if (v12 <= 110) {
        break;
      }
      if (v12 == 113)
      {
        [(VCAudioStreamCodecConfig *)v14 setNetworkPayload:113];
        __int16 v15 = v14;
        uint64_t v16 = &unk_1F3DC7950;
        goto LABEL_16;
      }
      if (v12 == 111) {
        goto LABEL_14;
      }
LABEL_17:
      if (v6) {
        objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "addV2CodecConfiguration:", v14);
      }
      else {
        [a3 addCodecConfiguration:v14];
      }

      if (!--v9) {
        return;
      }
    }
    if ((v12 - 107) >= 2)
    {
      if (v12 == 101) {
        [(VCAudioStreamCodecConfig *)v14 setPTime:10];
      }
      goto LABEL_17;
    }
LABEL_14:
    [(VCAudioStreamCodecConfig *)v14 setDtxEnabled:1];
    __int16 v15 = v14;
    uint64_t v16 = &unk_1F3DC7938;
LABEL_16:
    [(VCAudioStreamCodecConfig *)v15 setSupportedModes:v16];
    goto LABEL_17;
  }
}

- (BOOL)initializeAudioStreamWithConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 maxIDSStreamIDCount:(unsigned int)a4 supportedAudioRules:(id)a5 isLowestQualityAudio:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
  if (!v11)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:]();
        }
      }
      goto LABEL_48;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v29 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_48;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v43 = v33;
    __int16 v44 = 2080;
    uint64_t v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudio"
          "Rules:isLowestQualityAudio:]";
    __int16 v46 = 1024;
    int v47 = 762;
    __int16 v48 = 2112;
    __int16 v49 = v29;
    __int16 v50 = 2048;
    __int16 v51 = self;
    int v35 = " [%s] %s:%d %@(%p) Failed to create video multiway config";
    goto LABEL_60;
  }
  int v12 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v12)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:]();
        }
      }
      goto LABEL_48;
    }
    if (objc_opt_respondsToSelector()) {
      id v30 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      id v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v36 = VRTraceErrorLogLevelToCSTR(),
          v34 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_48:
      __int16 v13 = 0;
LABEL_49:
      __int16 v15 = 0;
LABEL_50:
      BOOL v27 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v43 = v36;
    __int16 v44 = 2080;
    uint64_t v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudio"
          "Rules:isLowestQualityAudio:]";
    __int16 v46 = 1024;
    int v47 = 765;
    __int16 v48 = 2112;
    __int16 v49 = v30;
    __int16 v50 = 2048;
    __int16 v51 = self;
    int v35 = " [%s] %s:%d %@(%p) Failed to create rate control config";
LABEL_60:
    _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0x30u);
    goto LABEL_48;
  }
  __int16 v13 = v12;
  uint64_t v14 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
  if (!v14)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v31 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v31 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        int v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v43 = v37;
          __int16 v44 = 2080;
          uint64_t v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supporte"
                "dAudioRules:isLowestQualityAudio:]";
          __int16 v46 = 1024;
          int v47 = 768;
          __int16 v48 = 2112;
          __int16 v49 = v31;
          __int16 v50 = 2048;
          __int16 v51 = self;
          _os_log_error_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create video stream config", buf, 0x30u);
        }
      }
    }
    goto LABEL_49;
  }
  __int16 v15 = v14;
  [(VCMediaStreamConfig *)v14 setJitterBufferMode:1];
  id v16 = [(VCSessionMediaStreamConfigurationProvider *)self audioRuleCollectionWithAudioConfig:a3 supportedAudioRules:a5];
  if (!v16)
  {
    if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v32 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        int v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        int v40 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v43 = v39;
          __int16 v44 = 2080;
          uint64_t v45 = "-[VCSessionMediaStreamConfigurationProvider initializeAudioStreamWithConfig:maxIDSStreamIDCount:supporte"
                "dAudioRules:isLowestQualityAudio:]";
          __int16 v46 = 1024;
          int v47 = 773;
          __int16 v48 = 2112;
          __int16 v49 = v32;
          __int16 v50 = 2048;
          __int16 v51 = self;
          _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create audio rules multiway config", buf, 0x30u);
        }
      }
    }
    goto LABEL_50;
  }
  id v17 = v16;
  BOOL v41 = v6;
  +[VCSessionMediaStreamConfigurationProvider configureAudioStreams:v15 withCodecConfiguration:a3 payloadsVersion:1];
  uint64_t var7 = a3->var7;
  if (var7 != 128) {
    [(VCAudioStreamConfig *)v15 setupRedWithRxPayload:var7 txPayload:a3->var7];
  }
  uint64_t v19 = v13;
  if (a3->var5)
  {
    unint64_t v20 = 0;
    do
      [(VCAudioStreamConfig *)v15 addSupportedNumRedundantPayload:a3->var6[v20++]];
    while (v20 < a3->var5);
  }
  [(VCSessionParticipantAudioStreamConfig *)v15 setAudioRules:v17];
  [(VCMediaStreamConfig *)v15 setDirection:1];
  [(VCAudioStreamConfig *)v15 setNumRedundantPayloads:LOBYTE(a3->var6[0])];
  [(VCAudioStreamConfig *)v15 setSupportsAdaptation:1];
  [(VCAudioStreamConfig *)v15 setBundlingScheme:1];
  [(VCAudioStreamConfig *)v15 setChannelCount:1];
  [(VCMediaStreamConfig *)v15 setRtpTimestampRate:24000];
  uint64_t v21 = [(VCIDSStreamIDGenerator *)self->_streamIDGenerator generateSSRC:1 streamID:1 repairStreamID:0 v2StreamID:0];
  unsigned __int16 v23 = v22;
  -[VCAudioStreamConfig setIsHigherAudioREDCutoverU1Enabled:](v15, "setIsHigherAudioREDCutoverU1Enabled:", [a5 isHigherAudioREDCutoverU1Enabled]);
  [(VCMediaStreamMultiwayConfig *)v11 setSsrc:v21];
  [(VCMediaStreamMultiwayConfig *)v11 setIdsStreamID:WORD2(v21)];
  int v24 = v23;
  [(VCMediaStreamMultiwayConfig *)v11 setV2StreamID:v23];
  [(VCMediaStreamMultiwayConfig *)v11 setMaxNetworkBitrate:a3->var0];
  [(VCMediaStreamMultiwayConfig *)v11 setMaxMediaBitrate:a3->var2.var1];
  *(float *)&double v25 = (float)a3->var9;
  [(VCMediaStreamMultiwayConfig *)v11 setMaxPacketsPerSecond:v25];
  [(VCMediaStreamMultiwayConfig *)v11 setQualityIndex:a3->var1];
  [(VCMediaStreamMultiwayConfig *)v11 setMaxIDSStreamIdCount:v8];
  [(VCMediaStreamMultiwayConfigAudio *)v11 setAudioRules:v17];
  [(VCMediaStreamMultiwayConfig *)v11 setRepairedMaxNetworkBitrate:a3->var0];
  [(VCMediaStreamMultiwayConfig *)v11 setStartOnDemand:+[VCSessionMediaStreamConfigurationProvider isAudioStreamOnDemand:a3 isLowestQualityAudio:v41]];
  [(VCMediaStreamMultiwayConfig *)v11 setNegotiationProtocolMask:a3->var10];
  [(VCMediaStreamConfig *)v15 setMultiwayConfig:v11];
  __int16 v13 = v19;
  [(VCMediaStreamConfig *)v15 setRateControlConfig:v19];
  if (v24) {
    +[VCSessionMediaStreamConfigurationProvider configureAudioStreams:v15 withCodecConfiguration:a3 payloadsVersion:2];
  }
  if ([+[VCDefaults sharedInstance] forceDisableMediaEncryption])
  {
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 3;
  }
  [(VCMediaStreamConfig *)v15 setSRTPCipherSuite:v26];
  [(NSMutableArray *)self->_audioStreamConfigurations addObject:v15];
  BOOL v27 = 1;
LABEL_16:

  return v27;
}

- (id)audioRuleCollectionWithAudioConfig:(_VCMediaStreamConfigurationProviderAudio *)a3 supportedAudioRules:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v25 = objc_alloc_init(VCAudioRuleCollection);
  if (v25)
  {
    if (a3->var3)
    {
      unint64_t v7 = 0;
      do
      {
        int v8 = +[VCPayloadUtils payloadForCodecType:a3->var4[v7].var0];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v9 = (void *)[a4 rules];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v33 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              if ([v14 payload] == v8)
              {
                [(VCAudioRuleCollection *)v25 addAudioRule:v14];
                goto LABEL_14;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v31 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_14:
        ++v7;
      }
      while (v7 < a3->var3);
    }
    if (a3->var7 != 128)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      __int16 v15 = (void *)[a4 rules];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        while (2)
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            unint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            if ([v20 payload] == a3->var7)
            {
              [(VCAudioRuleCollection *)v25 addAudioRule:v20];
              return v25;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v26 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
  }
  else if ((VCSessionMediaStreamConfigurationProvider *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamConfigurationProvider audioRuleCollectionWithAudioConfig:supportedAudioRules:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned __int16 v22 = (__CFString *)[(VCSessionMediaStreamConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned __int16 v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v37 = v23;
        __int16 v38 = 2080;
        uint64_t v39 = "-[VCSessionMediaStreamConfigurationProvider audioRuleCollectionWithAudioConfig:supportedAudioRules:]";
        __int16 v40 = 1024;
        int v41 = 837;
        __int16 v42 = 2112;
        uint64_t v43 = v22;
        __int16 v44 = 2048;
        uint64_t v45 = self;
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create audio rules collection", buf, 0x30u);
      }
    }
  }
  return v25;
}

- (NSArray)videoStreamConfigurations
{
  return &self->_videoStreamConfigurations->super;
}

- (NSArray)audioStreamConfigurations
{
  return &self->_audioStreamConfigurations->super;
}

- (int64_t)highestEncodingResolution
{
  return self->_highestEncodingResolution;
}

- (BOOL)isEncodingSqaures
{
  return self->_isEncodingSqaures;
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid stream ID generator provided", v2, v3, v4, v5, v6);
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio stream array", v2, v3, v4, v5, v6);
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate video stream array", v2, v3, v4, v5, v6);
}

- (void)initWithStreamIDGenerator:sessionMode:supportedAudioRules:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize streams", v2, v3, v4, v5, v6);
}

- (void)initializeStreamsWithSupportedAudioRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video Stream initialization failed", v2, v3, v4, v5, v6);
}

- (void)initializeStreamsWithSupportedAudioRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio Stream initialization failed", v2, v3, v4, v5, v6);
}

- (void)initializeVideoStreams
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize video multiway stream", v2, v3, v4, v5, v6);
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video stream config", v2, v3, v4, v5, v6);
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rate control config", v2, v3, v4, v5, v6);
}

- (void)initializeVideoStreamWithConfig:streamIndex:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create featureStrings", v2, v3, v4, v5, v6);
}

- (void)initializeVideoStreamWithDefaults
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to forceHWI initialize video multiway stream", v2, v3, v4, v5, v6);
}

- (void)initializeAudioStreamsWithSupportedRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load supported audio rule collection", v2, v3, v4, v5, v6);
}

- (void)initializeAudioStreamsWithSupportedRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio stream config", v2, v3, v4, v5, v6);
}

+ (void)configureAudioStreams:withCodecConfiguration:payloadsVersion:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "+[VCSessionMediaStreamConfigurationProvider configureAudioStreams:withCodecConfiguration:payloadsVersion:]";
  __int16 v6 = 1024;
  int v7 = 726;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate codec config for payload=%d", v3, 0x22u);
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rate control config", v2, v3, v4, v5, v6);
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video stream config", v2, v3, v4, v5, v6);
}

- (void)initializeAudioStreamWithConfig:maxIDSStreamIDCount:supportedAudioRules:isLowestQualityAudio:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio rules multiway config", v2, v3, v4, v5, v6);
}

- (void)audioRuleCollectionWithAudioConfig:supportedAudioRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio rules collection", v2, v3, v4, v5, v6);
}

@end