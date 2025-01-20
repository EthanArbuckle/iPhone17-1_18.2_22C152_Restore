@interface VCAirPlayAudioHALPlugin
+ (AudioServerPlugInDriverInterface)createInterface;
+ (AudioServerPlugInDriverInterface)sharedAudioServerPluginDriver;
+ (__CFDictionary)createConduitCreationOptionsWithDeviceInfo:(id)a3 inOptions:(__CFDictionary *)a4;
+ (id)sharedAirPlayAudioHALPluginNullDevice;
+ (tagVCAudioHALPluginConfiguration)convertASBDToInterleavedFormat:(SEL)a3;
+ (void)createInterface;
+ (void)registerAudioServerPluginDriver:(AudioServerPlugInDriverInterface *)a3 onQueue:(id)a4;
+ (void)sharedAirPlayAudioHALPluginNullDevice;
- (BOOL)start;
- (BOOL)stop;
- (VCAirPlayAudioHALPlugin)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3;
- (VCAirPlayAudioHALPlugin)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3 loadBinary:(BOOL)a4 conduitCreateOptions:(__CFDictionary *)a5;
- (void)dealloc;
- (void)invalidate;
- (void)start;
- (void)stop;
- (void)suspendAndReleaseConduitDeviceLocked;
@end

@implementation VCAirPlayAudioHALPlugin

+ (__CFDictionary)createConduitCreationOptionsWithDeviceInfo:(id)a3 inOptions:(__CFDictionary *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if (a3)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (Mutable) {
        goto LABEL_7;
      }
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]();
          }
        }
        return 0;
      }
      if (objc_opt_respondsToSelector()) {
        v29 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        v29 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v34 = 136316162;
          *(void *)&v34[4] = v33;
          *(_WORD *)&v34[12] = 2080;
          *(void *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
          *(_WORD *)&v34[22] = 1024;
          LODWORD(v35) = 59;
          WORD2(v35) = 2112;
          *(void *)((char *)&v35 + 6) = v29;
          HIWORD(v35) = 2048;
          id v36 = a1;
          v32 = " [%s] %s:%d %@(%p) Could not create mutable dictionary";
          goto LABEL_58;
        }
      }
    }
    else
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        *(_DWORD *)v34 = 136315650;
        *(void *)&v34[4] = v20;
        *(_WORD *)&v34[12] = 2080;
        *(void *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
        *(_WORD *)&v34[22] = 1024;
        LODWORD(v35) = 61;
        v22 = " [%s] %s:%d No options to configure";
        v23 = v21;
        uint32_t v24 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v19 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          v19 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        *(_DWORD *)v34 = 136316162;
        *(void *)&v34[4] = v25;
        *(_WORD *)&v34[12] = 2080;
        *(void *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
        *(_WORD *)&v34[22] = 1024;
        LODWORD(v35) = 61;
        WORD2(v35) = 2112;
        *(void *)((char *)&v35 + 6) = v19;
        HIWORD(v35) = 2048;
        id v36 = a1;
        v22 = " [%s] %s:%d %@(%p) No options to configure";
        v23 = v26;
        uint32_t v24 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, v34, v24);
    }
    return 0;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a4);
  if (!MutableCopy)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      v28 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v34 = 136316162;
        *(void *)&v34[4] = v30;
        *(_WORD *)&v34[12] = 2080;
        *(void *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
        *(_WORD *)&v34[22] = 1024;
        LODWORD(v35) = 56;
        WORD2(v35) = 2112;
        *(void *)((char *)&v35 + 6) = v28;
        HIWORD(v35) = 2048;
        id v36 = a1;
        v32 = " [%s] %s:%d %@(%p) Could not create mutable dictionary copy";
LABEL_58:
        _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, v32, v34, 0x30u);
        return 0;
      }
    }
    return 0;
  }
  Mutable = MutableCopy;
  if (!a3) {
    return Mutable;
  }
LABEL_7:
  if ((id)objc_opt_class() != a1)
  {
    if (objc_opt_respondsToSelector()) {
      v8 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_18;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)v34 = 136317186;
    *(void *)&v34[4] = v14;
    *(_WORD *)&v34[12] = 2080;
    *(void *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = 64;
    WORD2(v35) = 2112;
    *(void *)((char *)&v35 + 6) = v8;
    HIWORD(v35) = 2048;
    id v36 = a1;
    *(_WORD *)v37 = 2048;
    *(void *)&v37[2] = a3;
    *(_WORD *)&v37[10] = 2112;
    *(void *)&v37[12] = [a3 deviceName];
    *(_WORD *)&v37[20] = 2112;
    *(void *)&v37[22] = [a3 deviceUID];
    *(_WORD *)&v37[30] = 2112;
    uint64_t v38 = [a3 modelUID];
    v11 = " [%s] %s:%d %@(%p) remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@";
    v12 = v15;
    uint32_t v13 = 88;
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v34 = 136316674;
      *(void *)&v34[4] = v9;
      *(_WORD *)&v34[12] = 2080;
      *(void *)&v34[14] = "+[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:inOptions:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 64;
      WORD2(v35) = 2048;
      *(void *)((char *)&v35 + 6) = a3;
      HIWORD(v35) = 2112;
      id v36 = (id)[a3 deviceName];
      *(_WORD *)v37 = 2112;
      *(void *)&v37[2] = [a3 deviceUID];
      *(_WORD *)&v37[10] = 2112;
      *(void *)&v37[12] = [a3 modelUID];
      v11 = " [%s] %s:%d remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@";
      v12 = v10;
      uint32_t v13 = 68;
LABEL_17:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v34, v13);
    }
  }
LABEL_18:
  uint64_t v16 = objc_msgSend(a3, "deviceName", *(_OWORD *)v34, *(void *)&v34[16], v35, v36, *(_OWORD *)v37, *(_OWORD *)&v37[16], v38, v39);
  v17 = (const void *)*MEMORY[0x1E4F216E0];
  if (v16) {
    v18 = (__CFString *)[a3 deviceName];
  }
  else {
    v18 = @"Airplay Audio HAL Device";
  }
  CFDictionarySetValue(Mutable, v17, v18);
  if ([a3 deviceUID]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F216E8], (const void *)[a3 deviceUID]);
  }
  if ([a3 modelUID]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F216F0], (const void *)[a3 modelUID]);
  }
  return Mutable;
}

+ (tagVCAudioHALPluginConfiguration)convertASBDToInterleavedFormat:(SEL)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  retstr->remoteDeviceInfo = 0;
  *(_OWORD *)&retstr->sinkFormat.format.UInt32 mBitsPerChannel = 0u;
  *(_OWORD *)&retstr->sinkContext = 0u;
  *(_OWORD *)&retstr->sinkFormat.format.float mSampleRate = 0u;
  *(_OWORD *)&retstr->sinkFormat.format.UInt32 mBytesPerPacket = 0u;
  if (a4)
  {
    long long v6 = *(_OWORD *)&a4->sinkFormat.format.mBytesPerPacket;
    *(_OWORD *)&retstr->sinkFormat.format.float mSampleRate = *(_OWORD *)&a4->sinkFormat.format.mSampleRate;
    *(_OWORD *)&retstr->sinkFormat.format.UInt32 mBytesPerPacket = v6;
    long long v7 = *(_OWORD *)&a4->sinkContext;
    *(_OWORD *)&retstr->sinkFormat.format.UInt32 mBitsPerChannel = *(_OWORD *)&a4->sinkFormat.format.mBitsPerChannel;
    *(_OWORD *)&retstr->sinkContext = v7;
    retstr->remoteDeviceInfo = a4->remoteDeviceInfo;
    AudioFormatFlags mFormatFlags = retstr->sinkFormat.format.mFormatFlags;
    UInt32 mChannelsPerFrame = retstr->sinkFormat.format.mChannelsPerFrame;
    if ((mFormatFlags & 0x20) != 0 && mChannelsPerFrame == 2)
    {
      mFormatFlags &= ~0x20u;
      UInt32 v10 = 2 * retstr->sinkFormat.format.mBytesPerPacket;
      retstr->sinkFormat.format.AudioFormatFlags mFormatFlags = mFormatFlags;
      retstr->sinkFormat.format.UInt32 mBytesPerPacket = v10;
      retstr->sinkFormat.format.mBytesPerFrame *= 2;
    }
    if ((id)objc_opt_class() == a2)
    {
      result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
      if ((int)result >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        if (result)
        {
          float mSampleRate = retstr->sinkFormat.format.mSampleRate;
          AudioFormatID mFormatID = retstr->sinkFormat.format.mFormatID;
          UInt32 mBytesPerPacket = retstr->sinkFormat.format.mBytesPerPacket;
          UInt32 mFramesPerPacket = retstr->sinkFormat.format.mFramesPerPacket;
          UInt32 mBytesPerFrame = retstr->sinkFormat.format.mBytesPerFrame;
          UInt32 mBitsPerChannel = retstr->sinkFormat.format.mBitsPerChannel;
          UInt32 mReserved = retstr->sinkFormat.format.mReserved;
          int v37 = 136317954;
          uint64_t v38 = v13;
          __int16 v39 = 2080;
          v40 = "+[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]";
          __int16 v41 = 1024;
          int v42 = 94;
          __int16 v43 = 2048;
          double v44 = mSampleRate;
          __int16 v45 = 1024;
          *(_DWORD *)v46 = mFormatID;
          *(_WORD *)&v46[4] = 1024;
          *(_DWORD *)&v46[6] = mFormatFlags;
          LOWORD(v47) = 1024;
          *(_DWORD *)((char *)&v47 + 2) = mBytesPerPacket;
          HIWORD(v47) = 1024;
          *(_DWORD *)v48 = mFramesPerPacket;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)v49 = mBytesPerFrame;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)v50 = mChannelsPerFrame;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)v51 = mBitsPerChannel;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)v52 = mReserved;
          v22 = " [%s] %s:%d VCAirPlayAudioHALPlugin ASBD: mSampleRate=%.1f mFormatID=%d mFormatFlags=0x%x mBytesPerPacke"
                "t=%d mFramesPerPacket=%d mBytesPerFrame=%d mChannelsPerFrame=%d mBitsPerChannel=%d mReserved=0x%x";
          v23 = v14;
          uint32_t v24 = 86;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v37, v24);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v11 = (__CFString *)[a2 performSelector:sel_logPrefix];
      }
      else {
        v11 = &stru_1F3D3E450;
      }
      result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
      if ((int)result >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E4F47A50];
        result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        if (result)
        {
          float v27 = retstr->sinkFormat.format.mSampleRate;
          AudioFormatID v28 = retstr->sinkFormat.format.mFormatID;
          UInt32 v29 = retstr->sinkFormat.format.mBytesPerPacket;
          UInt32 v30 = retstr->sinkFormat.format.mFramesPerPacket;
          UInt32 v31 = retstr->sinkFormat.format.mBytesPerFrame;
          UInt32 v32 = retstr->sinkFormat.format.mBitsPerChannel;
          UInt32 v33 = retstr->sinkFormat.format.mReserved;
          int v37 = 136318466;
          uint64_t v38 = v25;
          __int16 v39 = 2080;
          v40 = "+[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]";
          __int16 v41 = 1024;
          int v42 = 94;
          __int16 v43 = 2112;
          double v44 = *(double *)&v11;
          __int16 v45 = 2048;
          *(void *)v46 = a2;
          *(_WORD *)&v46[8] = 2048;
          double v47 = v27;
          *(_WORD *)v48 = 1024;
          *(_DWORD *)&v48[2] = v28;
          *(_WORD *)v49 = 1024;
          *(_DWORD *)&v49[2] = mFormatFlags;
          *(_WORD *)v50 = 1024;
          *(_DWORD *)&v50[2] = v29;
          *(_WORD *)v51 = 1024;
          *(_DWORD *)&v51[2] = v30;
          *(_WORD *)v52 = 1024;
          *(_DWORD *)&v52[2] = v31;
          __int16 v53 = 1024;
          UInt32 v54 = mChannelsPerFrame;
          __int16 v55 = 1024;
          UInt32 v56 = v32;
          __int16 v57 = 1024;
          UInt32 v58 = v33;
          v22 = " [%s] %s:%d %@(%p) VCAirPlayAudioHALPlugin ASBD: mSampleRate=%.1f mFormatID=%d mFormatFlags=0x%x mBytesP"
                "erPacket=%d mFramesPerPacket=%d mBytesPerFrame=%d mChannelsPerFrame=%d mBitsPerChannel=%d mReserved=0x%x";
          v23 = v26;
          uint32_t v24 = 106;
          goto LABEL_15;
        }
      }
    }
  }
  else if ((id)objc_opt_class() == a2)
  {
    result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (result) {
        +[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v34 = (__CFString *)[a2 performSelector:sel_logPrefix];
    }
    else {
      v34 = &stru_1F3D3E450;
    }
    result = (tagVCAudioHALPluginConfiguration *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 3)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      id v36 = *MEMORY[0x1E4F47A50];
      result = (tagVCAudioHALPluginConfiguration *)os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (result)
      {
        int v37 = 136316162;
        uint64_t v38 = v35;
        __int16 v39 = 2080;
        v40 = "+[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:]";
        __int16 v41 = 1024;
        int v42 = 84;
        __int16 v43 = 2112;
        double v44 = *(double *)&v34;
        __int16 v45 = 2048;
        *(void *)v46 = a2;
        _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid config parameter", (uint8_t *)&v37, 0x30u);
      }
    }
  }
  return result;
}

- (VCAirPlayAudioHALPlugin)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3
{
  return [(VCAirPlayAudioHALPlugin *)self initWithConfig:a3 loadBinary:1 conduitCreateOptions:0];
}

- (VCAirPlayAudioHALPlugin)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3 loadBinary:(BOOL)a4 conduitCreateOptions:(__CFDictionary *)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)VCAirPlayAudioHALPlugin;
  v8 = [(VCAirPlayAudioHALPlugin *)&v25 init];
  if (v8)
  {
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAirPlayAudioHALPlugin-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      UInt32 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 110;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = v6;
        *(_WORD *)&buf[44] = 2112;
        *(void *)&buf[46] = a5;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-init (%p) loadBinary=%d conduitCreateOptions=%@", buf, 0x36u);
      }
    }
    if (a3)
    {
      pthread_mutex_init((pthread_mutex_t *)(v8 + 168), 0);
      *((void *)v8 + 12) = +[VCAirPlayAudioHALPlugin createConduitCreationOptionsWithDeviceInfo:a3->remoteDeviceInfo inOptions:a5];
      if (v6
        && !+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver])
      {
        if ((char *)objc_opt_class() == v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]();
            }
          }
          goto LABEL_42;
        }
        if (objc_opt_respondsToSelector()) {
          v19 = (__CFString *)[v8 performSelector:sel_logPrefix];
        }
        else {
          v19 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 117;
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = v19;
            *(_WORD *)&buf[38] = 2048;
            *(void *)&buf[40] = v8;
            v22 = " [%s] %s:%d %@(%p) Could not create plugin driver";
            goto LABEL_41;
          }
        }
      }
      else
      {
        v11 = [[VCAudioHALPluginMockAudioInject alloc] initWithConfig:a3];
        *((void *)v8 + 1) = v11;
        if (v11)
        {
          +[VCAirPlayAudioHALPlugin convertASBDToInterleavedFormat:a3];
          uint64_t v12 = v27;
          long long v13 = *(_OWORD *)&buf[48];
          *((_OWORD *)v8 + 3) = *(_OWORD *)&buf[32];
          *((_OWORD *)v8 + 4) = v13;
          *((void *)v8 + 10) = v12;
          long long v14 = *(_OWORD *)&buf[16];
          *((_OWORD *)v8 + 1) = *(_OWORD *)buf;
          *((_OWORD *)v8 + 2) = v14;
          long long v15 = *((_OWORD *)v8 + 2);
          *(_OWORD *)(v8 + 104) = *((_OWORD *)v8 + 1);
          *(_OWORD *)(v8 + 120) = v15;
          *((void *)v8 + 17) = *((void *)v8 + 6);
          *((_DWORD *)v8 + 36) = *((_DWORD *)v8 + 14);
          *(void *)(v8 + 148) = _VCAirPlayAudioHALPlugin_handleAudioFrame;
          *(void *)(v8 + 156) = v8 + 16;
          return (VCAirPlayAudioHALPlugin *)v8;
        }
        if ((char *)objc_opt_class() == v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]();
            }
          }
          goto LABEL_42;
        }
        if (objc_opt_respondsToSelector()) {
          v18 = (__CFString *)[v8 performSelector:sel_logPrefix];
        }
        else {
          v18 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 120;
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = v18;
            *(_WORD *)&buf[38] = 2048;
            *(void *)&buf[40] = v8;
            v22 = " [%s] %s:%d %@(%p) could not allocate mock audio inject";
            goto LABEL_41;
          }
        }
      }
    }
    else
    {
      if ((char *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]();
          }
        }
        goto LABEL_42;
      }
      if (objc_opt_respondsToSelector()) {
        v17 = (__CFString *)[v8 performSelector:sel_logPrefix];
      }
      else {
        v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAirPlayAudioHALPlugin initWithConfig:loadBinary:conduitCreateOptions:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 111;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v17;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = v8;
          v22 = " [%s] %s:%d %@(%p) invalid config parameter";
LABEL_41:
          _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
        }
      }
    }
LABEL_42:

    return 0;
  }
  return (VCAirPlayAudioHALPlugin *)v8;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAirPlayAudioHALPlugin-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      UInt32 v10 = "-[VCAirPlayAudioHALPlugin dealloc]";
      __int16 v11 = 1024;
      int v12 = 139;
      __int16 v13 = 2048;
      long long v14 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-dealloc (%p)", buf, 0x26u);
    }
  }

  conduitCreateOptions = self->_conduitCreateOptions;
  if (conduitCreateOptions)
  {
    CFRelease(conduitCreateOptions);
    self->_conduitCreateOptions = 0;
  }
  pthread_mutex_destroy(&self->_stateLock);
  v6.receiver = self;
  v6.super_class = (Class)VCAirPlayAudioHALPlugin;
  [(VCAirPlayAudioHALPlugin *)&v6 dealloc];
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAirPlayAudioHALPlugin-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCAirPlayAudioHALPlugin invalidate]";
      __int16 v9 = 1024;
      int v10 = 147;
      __int16 v11 = 2048;
      int v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)suspendAndReleaseConduitDeviceLocked
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCAirPlayAudioHALPlugin suspendAndReleaseConduitDeviceLocked]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Suspend and invalidate conduit returned error=%i", v2, *(const char **)v3, (unint64_t)"-[VCAirPlayAudioHALPlugin suspendAndReleaseConduitDeviceLocked]" >> 16, v4);
}

- (BOOL)start
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAirPlayAudioHALPlugin-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315906;
      uint64_t v29 = v3;
      __int16 v30 = 2080;
      UInt32 v31 = "-[VCAirPlayAudioHALPlugin start]";
      __int16 v32 = 1024;
      int v33 = 164;
      __int16 v34 = 2048;
      uint64_t v35 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-start (%p)", (uint8_t *)&v28, 0x26u);
    }
  }
  pthread_mutex_lock(&self->_stateLock);
  if (self->_resumed)
  {
    if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAirPlayAudioHALPlugin start].cold.5();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      int v10 = (__CFString *)[(VCAirPlayAudioHALPlugin *)self performSelector:sel_logPrefix];
    }
    else {
      int v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_65;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_65;
    }
    int v28 = 136316162;
    uint64_t v29 = v18;
    __int16 v30 = 2080;
    UInt32 v31 = "-[VCAirPlayAudioHALPlugin start]";
    __int16 v32 = 1024;
    int v33 = 169;
    __int16 v34 = 2112;
    uint64_t v35 = (VCAirPlayAudioHALPlugin *)v10;
    __int16 v36 = 2048;
    int v37 = self;
    uint64_t v20 = " [%s] %s:%d %@(%p) Plugin already started";
    goto LABEL_47;
  }
  if (!self->_conduitDevice)
  {
    int v5 = FigHALAudioConduitDeviceCreate();
    if (v5)
    {
      int v16 = v5;
      if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAirPlayAudioHALPlugin start].cold.4();
          }
        }
        goto LABEL_65;
      }
      if (objc_opt_respondsToSelector()) {
        v17 = (__CFString *)[(VCAirPlayAudioHALPlugin *)self performSelector:sel_logPrefix];
      }
      else {
        v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        objc_super v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v28 = 136316418;
          uint64_t v29 = v27;
          __int16 v30 = 2080;
          UInt32 v31 = "-[VCAirPlayAudioHALPlugin start]";
          __int16 v32 = 1024;
          int v33 = 173;
          __int16 v34 = 2112;
          uint64_t v35 = (VCAirPlayAudioHALPlugin *)v17;
          __int16 v36 = 2048;
          int v37 = self;
          __int16 v38 = 1024;
          int v39 = v16;
          uint64_t v20 = " [%s] %s:%d %@(%p) Create conduit device returned error=%i";
          goto LABEL_63;
        }
      }
      goto LABEL_65;
    }
    if (!self->_conduitDevice)
    {
      if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAirPlayAudioHALPlugin start]();
          }
        }
        goto LABEL_65;
      }
      if (objc_opt_respondsToSelector()) {
        __int16 v11 = (__CFString *)[(VCAirPlayAudioHALPlugin *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_65;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      int v28 = 136316162;
      uint64_t v29 = v21;
      __int16 v30 = 2080;
      UInt32 v31 = "-[VCAirPlayAudioHALPlugin start]";
      __int16 v32 = 1024;
      int v33 = 175;
      __int16 v34 = 2112;
      uint64_t v35 = (VCAirPlayAudioHALPlugin *)v11;
      __int16 v36 = 2048;
      int v37 = self;
      uint64_t v20 = " [%s] %s:%d %@(%p) No conduit device";
LABEL_47:
      v22 = v19;
      uint32_t v23 = 48;
LABEL_64:
      _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v28, v23);
      goto LABEL_65;
    }
  }
  int v6 = FigHALAudioConduitDeviceSetClientReceiveAudioIODelegate();
  if (v6)
  {
    int v12 = v6;
    if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAirPlayAudioHALPlugin start]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCAirPlayAudioHALPlugin *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      objc_super v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v28 = 136316418;
        uint64_t v29 = v24;
        __int16 v30 = 2080;
        UInt32 v31 = "-[VCAirPlayAudioHALPlugin start]";
        __int16 v32 = 1024;
        int v33 = 178;
        __int16 v34 = 2112;
        uint64_t v35 = (VCAirPlayAudioHALPlugin *)v13;
        __int16 v36 = 2048;
        int v37 = self;
        __int16 v38 = 1024;
        int v39 = v12;
        uint64_t v20 = " [%s] %s:%d %@(%p) Set audio delegate returned error=%i";
LABEL_63:
        v22 = v25;
        uint32_t v23 = 54;
        goto LABEL_64;
      }
    }
  }
  else
  {
    int v7 = FigHALAudioConduitDeviceResume();
    if (!v7)
    {
      [(VCAudioHALPluginMockAudioInject *)self->_mockAudioInject start];
      BOOL v8 = 1;
      self->_resumed = 1;
      goto LABEL_11;
    }
    int v14 = v7;
    if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAirPlayAudioHALPlugin start]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCAirPlayAudioHALPlugin *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      objc_super v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v28 = 136316418;
        uint64_t v29 = v26;
        __int16 v30 = 2080;
        UInt32 v31 = "-[VCAirPlayAudioHALPlugin start]";
        __int16 v32 = 1024;
        int v33 = 181;
        __int16 v34 = 2112;
        uint64_t v35 = (VCAirPlayAudioHALPlugin *)v15;
        __int16 v36 = 2048;
        int v37 = self;
        __int16 v38 = 1024;
        int v39 = v14;
        uint64_t v20 = " [%s] %s:%d %@(%p) Resume conduit returned error=%i";
        goto LABEL_63;
      }
    }
  }
LABEL_65:
  if (!self->_resumed) {
    [(VCAirPlayAudioHALPlugin *)self suspendAndReleaseConduitDeviceLocked];
  }
  BOOL v8 = 0;
LABEL_11:
  pthread_mutex_unlock(&self->_stateLock);
  return v8;
}

- (BOOL)stop
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAirPlayAudioHALPlugin-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCAirPlayAudioHALPlugin stop]";
      __int16 v14 = 1024;
      int v15 = 199;
      __int16 v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAirPlayAudioHALPlugin-stop (%p)", (uint8_t *)&v10, 0x26u);
    }
  }
  pthread_mutex_lock(&self->_stateLock);
  BOOL resumed = self->_resumed;
  if (self->_resumed)
  {
    [(VCAudioHALPluginMockAudioInject *)self->_mockAudioInject stop];
    [(VCAirPlayAudioHALPlugin *)self suspendAndReleaseConduitDeviceLocked];
  }
  else if ((VCAirPlayAudioHALPlugin *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAirPlayAudioHALPlugin stop]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v7 = (__CFString *)[(VCAirPlayAudioHALPlugin *)self performSelector:sel_logPrefix];
    }
    else {
      int v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316162;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCAirPlayAudioHALPlugin stop]";
        __int16 v14 = 1024;
        int v15 = 203;
        __int16 v16 = 2112;
        v17 = (VCAirPlayAudioHALPlugin *)v7;
        __int16 v18 = 2048;
        v19 = self;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Pluging is not started", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  pthread_mutex_unlock(&self->_stateLock);
  return resumed;
}

+ (void)registerAudioServerPluginDriver:(AudioServerPlugInDriverInterface *)a3 onQueue:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = (id)objc_opt_class();
    if (a4)
    {
      if (v7 == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          int v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v37 = v9;
            __int16 v38 = 2080;
            int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            __int16 v40 = 1024;
            int v41 = 222;
            uint64_t v11 = " [%s] %s:%d Registering remote audio server plugin driver";
            __int16 v12 = v10;
            uint32_t v13 = 28;
LABEL_13:
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          int v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v37 = v14;
            __int16 v38 = 2080;
            int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            __int16 v40 = 1024;
            int v41 = 222;
            __int16 v42 = 2112;
            __int16 v43 = v8;
            __int16 v44 = 2048;
            id v45 = a1;
            uint64_t v11 = " [%s] %s:%d %@(%p) Registering remote audio server plugin driver";
            __int16 v12 = v15;
            uint32_t v13 = 48;
            goto LABEL_13;
          }
        }
      }
      block[6] = MEMORY[0x1E4F143A8];
      block[7] = 3221225472;
      block[8] = __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke;
      block[9] = &unk_1E6DB5450;
      block[10] = a1;
      block[11] = a4;
      block[12] = a3;
      int v16 = AudioServerPlugInRegisterRemote();
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v37 = v18;
            __int16 v38 = 2080;
            int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            __int16 v40 = 1024;
            int v41 = 229;
            __int16 v42 = 1024;
            LODWORD(v43) = v16;
            uint64_t v20 = " [%s] %s:%d Plugin register remote returned=%i";
            uint64_t v21 = v19;
            uint32_t v22 = 34;
LABEL_24:
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v17 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          v17 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          uint64_t v24 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v37 = v23;
            __int16 v38 = 2080;
            int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
            __int16 v40 = 1024;
            int v41 = 229;
            __int16 v42 = 2112;
            __int16 v43 = v17;
            __int16 v44 = 2048;
            id v45 = a1;
            __int16 v46 = 1024;
            int v47 = v16;
            uint64_t v20 = " [%s] %s:%d %@(%p) Plugin register remote returned=%i";
            uint64_t v21 = v24;
            uint32_t v22 = 54;
            goto LABEL_24;
          }
        }
      }
      if (v16)
      {
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            objc_super v25 = (__CFString *)[a1 performSelector:sel_logPrefix];
          }
          else {
            objc_super v25 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            uint64_t v27 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316674;
              uint64_t v37 = v26;
              __int16 v38 = 2080;
              int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
              __int16 v40 = 1024;
              int v41 = 232;
              __int16 v42 = 2112;
              __int16 v43 = v25;
              __int16 v44 = 2048;
              id v45 = a1;
              __int16 v46 = 1024;
              int v47 = 5;
              __int16 v48 = 1024;
              int v49 = v16;
              _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Re-register remote delay=%d sec because register returned error=%i", buf, 0x3Cu);
            }
          }
        }
        dispatch_time_t v28 = dispatch_time(0, 5000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_12;
        block[3] = &unk_1E6DB4568;
        block[4] = a4;
        block[5] = a3;
        dispatch_after(v28, (dispatch_queue_t)a4, block);
      }
      return;
    }
    if (v7 != a1)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v30 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        __int16 v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      __int16 v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v37 = v34;
      __int16 v38 = 2080;
      int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
      __int16 v40 = 1024;
      int v41 = 220;
      __int16 v42 = 2112;
      __int16 v43 = v30;
      __int16 v44 = 2048;
      id v45 = a1;
      int v33 = " [%s] %s:%d %@(%p) Invalid queue parameter";
      goto LABEL_58;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]();
      }
    }
  }
  else
  {
    if ((id)objc_opt_class() != a1)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v29 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v29 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      __int16 v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v37 = v31;
      __int16 v38 = 2080;
      int v39 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
      __int16 v40 = 1024;
      int v41 = 219;
      __int16 v42 = 2112;
      __int16 v43 = v29;
      __int16 v44 = 2048;
      id v45 = a1;
      int v33 = " [%s] %s:%d %@(%p) Invalid plugin driver parameter";
LABEL_58:
      _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]();
      }
    }
  }
}

void __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        uint64_t v11 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 224;
        __int16 v14 = 2112;
        int v15 = v2;
        __int16 v16 = 2048;
        uint64_t v17 = v6;
        __int16 v18 = 1024;
        int v19 = 5;
        _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Re-register remote delay=%d sec because plugin was interrupted", buf, 0x36u);
      }
    }
  }
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_10;
  v7[3] = &unk_1E6DB4568;
  dispatch_after(v5, *(dispatch_queue_t *)(a1 + 40), v7);
}

uint64_t __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_10(uint64_t a1)
{
  return +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:*(void *)(a1 + 40) onQueue:*(void *)(a1 + 32)];
}

uint64_t __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_12(uint64_t a1)
{
  return +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:*(void *)(a1 + 40) onQueue:*(void *)(a1 + 32)];
}

+ (AudioServerPlugInDriverInterface)createInterface
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  UInt32 v58 = 0;
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, @"/System/Library/Audio/Plug-Ins/AVC/AVCHalogen.driver", kCFURLPOSIXPathStyle, 1u);
  if (v3)
  {
    CFURLRef v4 = v3;
    CFPlugInRef v5 = CFPlugInCreate(0, v3);
    if (!v5)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAirPlayAudioHALPlugin createInterface]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v32 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          __int16 v32 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v42 = VRTraceErrorLogLevelToCSTR();
          __int16 v43 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v60 = v42;
            __int16 v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            __int16 v63 = 1024;
            int v64 = 251;
            __int16 v65 = 2112;
            v66 = v32;
            __int16 v67 = 2048;
            id v68 = a1;
            _os_log_error_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create plugin", buf, 0x30u);
          }
        }
      }
      uint64_t v29 = v4;
      goto LABEL_23;
    }
    uint64_t v6 = v5;
    CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
    CFArrayRef FactoriesForPlugInTypeInPlugIn = CFPlugInFindFactoriesForPlugInTypeInPlugIn(v7, v6);
    if (!FactoriesForPlugInTypeInPlugIn)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAirPlayAudioHALPlugin createInterface]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v33 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          int v33 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          id v45 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v60 = v44;
            __int16 v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            __int16 v63 = 1024;
            int v64 = 254;
            __int16 v65 = 2112;
            v66 = v33;
            __int16 v67 = 2048;
            id v68 = a1;
            _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create factory object for plugins", buf, 0x30u);
          }
        }
      }
      CFArrayRef v9 = v4;
      goto LABEL_22;
    }
    CFArrayRef v9 = FactoriesForPlugInTypeInPlugIn;
    if (CFArrayGetCount(FactoriesForPlugInTypeInPlugIn) <= 0)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAirPlayAudioHALPlugin createInterface].cold.4();
          }
        }
        goto LABEL_21;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v34 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v34 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_21;
      }
      uint64_t v46 = VRTraceErrorLogLevelToCSTR();
      int v47 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v46;
      __int16 v61 = 2080;
      v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
      __int16 v63 = 1024;
      int v64 = 255;
      __int16 v65 = 2112;
      v66 = v34;
      __int16 v67 = 2048;
      id v68 = a1;
      __int16 v48 = " [%s] %s:%d %@(%p) There are no factories for AudioServerPlugInType";
    }
    else
    {
      CFUUIDRef ValueAtIndex = (const __CFUUID *)CFArrayGetValueAtIndex(v9, 0);
      if (ValueAtIndex)
      {
        CFUUIDRef v11 = ValueAtIndex;
        CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
        int v13 = CFPlugInInstanceCreate(0, v11, v12);
        if (v13)
        {
          __int16 v14 = v13;
          int v15 = *(uint64_t (**)(void *, void, void, AudioServerPlugInDriverInterface ***))(*(void *)v13 + 8);
          CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0xEEu, 0xA5u, 0x77u, 0x3Du, 0xCCu, 0x43u, 0x49u, 0xF1u, 0x8Eu, 0, 0x8Fu, 0x96u, 0xE7u, 0xD2u, 0x3Bu, 0x17u);
          CFUUIDBytes v17 = CFUUIDGetUUIDBytes(v16);
          int v18 = v15(v14, *(void *)&v17.byte0, *(void *)&v17.byte8, &v58);
          if (v18)
          {
            int v37 = v18;
            if ((id)objc_opt_class() == a1)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  +[VCAirPlayAudioHALPlugin createInterface].cold.8();
                }
              }
              goto LABEL_20;
            }
            if (objc_opt_respondsToSelector()) {
              __int16 v38 = (__CFString *)[a1 performSelector:sel_logPrefix];
            }
            else {
              __int16 v38 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_20;
            }
            uint64_t v51 = VRTraceErrorLogLevelToCSTR();
            v52 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_20;
            }
            *(_DWORD *)buf = 136316418;
            uint64_t v60 = v51;
            __int16 v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            __int16 v63 = 1024;
            int v64 = 262;
            __int16 v65 = 2112;
            v66 = v38;
            __int16 v67 = 2048;
            id v68 = a1;
            __int16 v69 = 1024;
            int v70 = v37;
            __int16 v53 = " [%s] %s:%d %@(%p) Query interface returned error=%i";
            UInt32 v54 = v52;
            uint32_t v55 = 54;
          }
          else
          {
            int v19 = v58;
            id v20 = (id)objc_opt_class();
            if (v19)
            {
              if (v20 == a1)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                  goto LABEL_20;
                }
                uint64_t v22 = VRTraceErrorLogLevelToCSTR();
                uint64_t v23 = *MEMORY[0x1E4F47A50];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_20;
                }
                *(_DWORD *)buf = 136315650;
                uint64_t v60 = v22;
                __int16 v61 = 2080;
                v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
                __int16 v63 = 1024;
                int v64 = 264;
                uint64_t v24 = " [%s] %s:%d Plugin loaded!";
                objc_super v25 = v23;
                uint32_t v26 = 28;
              }
              else
              {
                if (objc_opt_respondsToSelector()) {
                  uint64_t v21 = (__CFString *)[a1 performSelector:sel_logPrefix];
                }
                else {
                  uint64_t v21 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                  goto LABEL_20;
                }
                uint64_t v27 = VRTraceErrorLogLevelToCSTR();
                dispatch_time_t v28 = *MEMORY[0x1E4F47A50];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_20;
                }
                *(_DWORD *)buf = 136316162;
                uint64_t v60 = v27;
                __int16 v61 = 2080;
                v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
                __int16 v63 = 1024;
                int v64 = 264;
                __int16 v65 = 2112;
                v66 = v21;
                __int16 v67 = 2048;
                id v68 = a1;
                uint64_t v24 = " [%s] %s:%d %@(%p) Plugin loaded!";
                objc_super v25 = v28;
                uint32_t v26 = 48;
              }
              _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_20:
              (*(void (**)(void *))(*(void *)v14 + 24))(v14);
              goto LABEL_21;
            }
            if (v20 == a1)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  +[VCAirPlayAudioHALPlugin createInterface].cold.7();
                }
              }
              goto LABEL_20;
            }
            if (objc_opt_respondsToSelector()) {
              int v39 = (__CFString *)[a1 performSelector:sel_logPrefix];
            }
            else {
              int v39 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_20;
            }
            uint64_t v56 = VRTraceErrorLogLevelToCSTR();
            __int16 v57 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_20;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v60 = v56;
            __int16 v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            __int16 v63 = 1024;
            int v64 = 263;
            __int16 v65 = 2112;
            v66 = v39;
            __int16 v67 = 2048;
            id v68 = a1;
            __int16 v53 = " [%s] %s:%d %@(%p) Query interface returned nil interface";
            UInt32 v54 = v57;
            uint32_t v55 = 48;
          }
          _os_log_error_impl(&dword_1E1EA4000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
          goto LABEL_20;
        }
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              +[VCAirPlayAudioHALPlugin createInterface].cold.6();
            }
          }
          goto LABEL_21;
        }
        if (objc_opt_respondsToSelector()) {
          __int16 v36 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          __int16 v36 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v50 = VRTraceErrorLogLevelToCSTR();
          int v47 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v60 = v50;
            __int16 v61 = 2080;
            v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
            __int16 v63 = 1024;
            int v64 = 259;
            __int16 v65 = 2112;
            v66 = v36;
            __int16 v67 = 2048;
            id v68 = a1;
            __int16 v48 = " [%s] %s:%d %@(%p) Could not create interface";
            goto LABEL_99;
          }
        }
LABEL_21:
        CFRelease(v4);
LABEL_22:
        CFRelease(v9);
        uint64_t v29 = v6;
LABEL_23:
        CFRelease(v29);
        return v58;
      }
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAirPlayAudioHALPlugin createInterface].cold.5();
          }
        }
        goto LABEL_21;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v35 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v35 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_21;
      }
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      int v47 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v49;
      __int16 v61 = 2080;
      v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
      __int16 v63 = 1024;
      int v64 = 257;
      __int16 v65 = 2112;
      v66 = v35;
      __int16 v67 = 2048;
      id v68 = a1;
      __int16 v48 = " [%s] %s:%d %@(%p) Could not access first listed factory";
    }
LABEL_99:
    _os_log_error_impl(&dword_1E1EA4000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0x30u);
    goto LABEL_21;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCAirPlayAudioHALPlugin createInterface]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v31 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v31 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      int v41 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v60 = v40;
        __int16 v61 = 2080;
        v62 = "+[VCAirPlayAudioHALPlugin createInterface]";
        __int16 v63 = 1024;
        int v64 = 248;
        __int16 v65 = 2112;
        v66 = v31;
        __int16 v67 = 2048;
        id v68 = a1;
        _os_log_error_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create URL with path to plugin", buf, 0x30u);
      }
    }
  }
  return v58;
}

+ (AudioServerPlugInDriverInterface)sharedAudioServerPluginDriver
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = a1;
  if (sharedAudioServerPluginDriver_onceToken != -1) {
    dispatch_once(&sharedAudioServerPluginDriver_onceToken, v3);
  }
  return (AudioServerPlugInDriverInterface **)sharedAudioServerPluginDriver__pluginInterface;
}

void __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  sharedAudioServerPluginDriver__pluginReqisterQueue = (uint64_t)dispatch_queue_create("com.apple.VideoConference.pluginRegisterQueue", 0);
  if (sharedAudioServerPluginDriver__pluginReqisterQueue)
  {
    sharedAudioServerPluginDriver__pluginInterface = +[VCAirPlayAudioHALPlugin createInterface];
    if (sharedAudioServerPluginDriver__pluginInterface)
    {
      dispatch_sync((dispatch_queue_t)sharedAudioServerPluginDriver__pluginReqisterQueue, &__block_literal_global_33);
      goto LABEL_4;
    }
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_2();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        CFUUIDRef v12 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        CFUUIDRef v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        __int16 v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v19 = 136316162;
          uint64_t v20 = v17;
          __int16 v21 = 2080;
          uint64_t v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke";
          __int16 v23 = 1024;
          int v24 = 286;
          __int16 v25 = 2112;
          uint64_t v26 = (uint64_t)v12;
          __int16 v27 = 2048;
          uint64_t v28 = v18;
          CFUUIDRef v16 = " [%s] %s:%d %@(%p) Create interface returned nil interface";
          goto LABEL_39;
        }
      }
    }
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      CFUUIDRef v11 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      CFUUIDRef v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v19 = 136316162;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 283;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v11;
        __int16 v27 = 2048;
        uint64_t v28 = v15;
        CFUUIDRef v16 = " [%s] %s:%d %@(%p) Could not create dispatch queue";
LABEL_39:
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, 0x30u);
      }
    }
  }
LABEL_4:
  if (!sharedAudioServerPluginDriver__pluginInterface && sharedAudioServerPluginDriver__pluginReqisterQueue) {
    dispatch_release((dispatch_object_t)sharedAudioServerPluginDriver__pluginReqisterQueue);
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      CFURLRef v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315906;
        uint64_t v20 = v3;
        __int16 v21 = 2080;
        uint64_t v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke_2";
        __int16 v23 = 1024;
        int v24 = 295;
        __int16 v25 = 2048;
        uint64_t v26 = sharedAudioServerPluginDriver__pluginInterface;
        CFPlugInRef v5 = " [%s] %s:%d Shared AirPlay Audio HAL plugin interface=%p";
        uint64_t v6 = v4;
        uint32_t v7 = 38;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v19, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      CFArrayRef v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v19 = 136316418;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        uint64_t v22 = "+[VCAirPlayAudioHALPlugin sharedAudioServerPluginDriver]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 295;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v2;
        __int16 v27 = 2048;
        uint64_t v28 = v10;
        __int16 v29 = 2048;
        uint64_t v30 = sharedAudioServerPluginDriver__pluginInterface;
        CFPlugInRef v5 = " [%s] %s:%d %@(%p) Shared AirPlay Audio HAL plugin interface=%p";
        uint64_t v6 = v9;
        uint32_t v7 = 58;
        goto LABEL_17;
      }
    }
  }
}

uint64_t __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_17()
{
  return +[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:sharedAudioServerPluginDriver__pluginInterface onQueue:sharedAudioServerPluginDriver__pluginReqisterQueue];
}

+ (id)sharedAirPlayAudioHALPluginNullDevice
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (+[VCDefaults BOOLeanValueForKey:@"startAirPlayAudioHALPluginNullDevice" defaultValue:0])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__VCAirPlayAudioHALPlugin_sharedAirPlayAudioHALPluginNullDevice__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = a1;
    if (sharedAirPlayAudioHALPluginNullDevice_onceToken != -1) {
      dispatch_once(&sharedAirPlayAudioHALPluginNullDevice_onceToken, block);
    }
    if (!sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          CFURLRef v4 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          CFURLRef v4 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v9 = v5;
            __int16 v10 = 2080;
            CFUUIDRef v11 = "+[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]";
            __int16 v12 = 1024;
            int v13 = 311;
            __int16 v14 = 2112;
            uint64_t v15 = v4;
            __int16 v16 = 2048;
            id v17 = a1;
            _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Shared AirPlay Audio HAL plugin object does not exist", buf, 0x30u);
          }
        }
      }
    }
  }
  return (id)sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin;
}

void __64__VCAirPlayAudioHALPlugin_sharedAirPlayAudioHALPluginNullDevice__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin = [[VCAirPlayAudioHALPlugin alloc] initWithConfig:&v11];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      CFURLRef v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v3;
        __int16 v18 = 2080;
        int v19 = "+[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 308;
        __int16 v22 = 2048;
        uint64_t v23 = sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin;
        uint64_t v5 = " [%s] %s:%d Created shared AirPlay Audio HAL plugin object=%p";
        uint64_t v6 = v4;
        uint32_t v7 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix, v11, v12, v13, v14, v15);
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        int v19 = "+[VCAirPlayAudioHALPlugin sharedAirPlayAudioHALPluginNullDevice]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 308;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v2;
        __int16 v24 = 2048;
        uint64_t v25 = v10;
        __int16 v26 = 2048;
        uint64_t v27 = sharedAirPlayAudioHALPluginNullDevice__sharedAirPlayHALPlugin;
        uint64_t v5 = " [%s] %s:%d %@(%p) Created shared AirPlay Audio HAL plugin object=%p";
        uint64_t v6 = v9;
        uint32_t v7 = 58;
        goto LABEL_11;
      }
    }
  }
}

+ (void)createConduitCreationOptionsWithDeviceInfo:inOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create mutable dictionary", v2, v3, v4, v5, v6);
}

+ (void)createConduitCreationOptionsWithDeviceInfo:inOptions:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create mutable dictionary copy", v2, v3, v4, v5, v6);
}

+ (void)convertASBDToInterleavedFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid config parameter", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:loadBinary:conduitCreateOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid config parameter", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:loadBinary:conduitCreateOptions:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create plugin driver", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:loadBinary:conduitCreateOptions:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate mock audio inject", v2, v3, v4, v5, v6);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Plugin already started", v2, v3, v4, v5, v6);
}

- (void)stop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Pluging is not started", v2, v3, v4, v5, v6);
}

+ (void)registerAudioServerPluginDriver:onQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid plugin driver parameter", v2, v3, v4, v5, v6);
}

+ (void)registerAudioServerPluginDriver:onQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid queue parameter", v2, v3, v4, v5, v6);
}

+ (void)registerAudioServerPluginDriver:onQueue:.cold.3()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]";
  OUTLINED_FUNCTION_3();
  int v5 = 232;
  __int16 v6 = v0;
  int v7 = 5;
  __int16 v8 = v0;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Re-register remote delay=%d sec because register returned error=%i", v3, 0x28u);
}

void __67__VCAirPlayAudioHALPlugin_registerAudioServerPluginDriver_onQueue___block_invoke_cold_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "+[VCAirPlayAudioHALPlugin registerAudioServerPluginDriver:onQueue:]_block_invoke";
  OUTLINED_FUNCTION_3();
  int v4 = 224;
  __int16 v5 = v0;
  int v6 = 5;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Re-register remote delay=%d sec because plugin was interrupted", v2, 0x22u);
}

+ (void)createInterface
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "+[VCAirPlayAudioHALPlugin createInterface]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Query interface returned error=%i", v2, *(const char **)v3, (unint64_t)"+[VCAirPlayAudioHALPlugin createInterface]" >> 16, v4);
}

void __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create dispatch queue", v2, v3, v4, v5, v6);
}

void __56__VCAirPlayAudioHALPlugin_sharedAudioServerPluginDriver__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Create interface returned nil interface", v2, v3, v4, v5, v6);
}

+ (void)sharedAirPlayAudioHALPluginNullDevice
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Shared AirPlay Audio HAL plugin object does not exist", v2, v3, v4, v5, v6);
}

@end