@interface VCAudioHALPluginDevice
+ (id)sharedAudioHALPluginNullDevice;
+ (id)sharedAudioServerDriverPlugin;
+ (void)sharedAudioHALPluginNullDevice;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)start;
- (BOOL)stop;
- (VCAudioHALPluginDevice)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3;
- (id).cxx_construct;
- (id)getZeroTimestampBlock;
- (id)willDoReadInputBlock;
- (id)willDoWriteMixBlock;
- (int)performStartIO;
- (int)performStopIO;
- (unsigned)calculateIOBufferFrameSize:(unsigned int)a3;
- (void)configureRemoteDeviceInfo:(id)a3;
- (void)dealloc;
- (void)initialZeroTimestamp;
- (void)invalidate;
- (void)start;
- (void)stop;
- (void)updateZeroTimestamp:(unint64_t)a3;
@end

@implementation VCAudioHALPluginDevice

- (VCAudioHALPluginDevice)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a3 && [(VCAudioHALPluginRemoteDeviceInfo *)a3->remoteDeviceInfo deviceUID]) {
    v5 = [(VCAudioHALPluginRemoteDeviceInfo *)a3->remoteDeviceInfo deviceUID];
  }
  else {
    v5 = @"CC4B9AAD-7DF1-4EEA-8E0A-EB7CEE94C512";
  }
  id v6 = +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin];
  v33.receiver = self;
  v33.super_class = (Class)VCAudioHALPluginDevice;
  v7 = [(ASDAudioDevice *)&v33 initWithDeviceUID:v5 withPlugin:v6];
  if (!v7) {
    goto LABEL_65;
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginDevice-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v36 = v8;
      __int16 v37 = 2080;
      v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
      __int16 v39 = 1024;
      int v40 = 68;
      __int16 v41 = 2048;
      v42 = v7;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-init (%p)", buf, 0x26u);
    }
  }
  if (!a3)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice initWithConfig:]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      v20 = (__CFString *)[(VCAudioHALPluginDevice *)v7 performSelector:sel_logPrefix];
    }
    else {
      v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_65;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_65;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v36 = v24;
    __int16 v37 = 2080;
    v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
    __int16 v39 = 1024;
    int v40 = 69;
    __int16 v41 = 2112;
    v42 = v20;
    __int16 v43 = 2048;
    v44 = v7;
    v26 = " [%s] %s:%d %@(%p) invalid config";
    goto LABEL_64;
  }
  if (!v6)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice initWithConfig:]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      v21 = (__CFString *)[(VCAudioHALPluginDevice *)v7 performSelector:sel_logPrefix];
    }
    else {
      v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_65;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_65;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v36 = v27;
    __int16 v37 = 2080;
    v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
    __int16 v39 = 1024;
    int v40 = 70;
    __int16 v41 = 2112;
    v42 = v21;
    __int16 v43 = 2048;
    v44 = v7;
    v26 = " [%s] %s:%d %@(%p) nil plugin";
LABEL_64:
    _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x30u);
    goto LABEL_65;
  }
  [(ASDAudioDevice *)v7 setManufacturerName:@"Apple Inc."];
  [(ASDAudioDevice *)v7 setCanBeDefaultDevice:1];
  [(ASDAudioDevice *)v7 setCanBeDefaultSystemDevice:1];
  [(ASDAudioDevice *)v7 setCanChangeDeviceName:0];
  uint64_t v34 = [NSNumber numberWithDouble:a3->sinkFormat.format.mSampleRate];
  -[ASDAudioDevice setSamplingRates:](v7, "setSamplingRates:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1]);
  [(ASDAudioDevice *)v7 setSamplingRate:a3->sinkFormat.format.mSampleRate];
  [(ASDAudioDevice *)v7 setInputSafetyOffset:0];
  [(ASDAudioDevice *)v7 setOutputSafetyOffset:0];
  [(ASDAudioDevice *)v7 setTransportType:1668506482];
  v7->_samplesPerFrame = a3->sinkFormat.samplesPerFrame;
  [(ASDAudioDevice *)v7 setTimestampPeriod:(a3->sinkFormat.format.mSampleRate * 0.26)];
  [(VCAudioHALPluginDevice *)v7 configureRemoteDeviceInfo:a3->remoteDeviceInfo];
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&info);
  LODWORD(v10) = info.denom;
  LODWORD(v11) = info.numer;
  v7->_clockFrequency = (double)v10 / (double)v11 * 1000000000.0;
  v12 = NSString;
  uint64_t v13 = [v6 bundleID];
  v14 = (objc_class *)objc_opt_class();
  v15 = (const char *)[(id)objc_msgSend(v12 stringWithFormat:@"%@.%@.%@", v13, NSStringFromClass(v14), v5), "UTF8String"];
  dispatch_queue_t v16 = dispatch_queue_create(v15, 0);
  v7->_timeQueue = (OS_dispatch_queue *)v16;
  if (!v16)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice initWithConfig:]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[(VCAudioHALPluginDevice *)v7 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v29;
        __int16 v37 = 2080;
        v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
        __int16 v39 = 1024;
        int v40 = 92;
        __int16 v41 = 2112;
        v42 = v22;
        __int16 v43 = 2048;
        v44 = v7;
        v26 = " [%s] %s:%d %@(%p) could not create dispatch queue";
        goto LABEL_64;
      }
    }
    goto LABEL_65;
  }
  v17 = [[VCAudioHALPluginStream alloc] initWithDirection:1869968496 plugin:v6 withConfig:a3];
  v7->_outputStream = v17;
  if (!v17)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice initWithConfig:].cold.4();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      v23 = (__CFString *)[(VCAudioHALPluginDevice *)v7 performSelector:sel_logPrefix];
    }
    else {
      v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v30;
        __int16 v37 = 2080;
        v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
        __int16 v39 = 1024;
        int v40 = 94;
        __int16 v41 = 2112;
        v42 = v23;
        __int16 v43 = 2048;
        v44 = v7;
        v26 = " [%s] %s:%d %@(%p) could not allocate stream";
        goto LABEL_64;
      }
    }
    goto LABEL_65;
  }
  [(ASDStream *)v17 setStreamName:@"AVConference Output Stream"];
  [(ASDAudioDevice *)v7 addOutputStream:v7->_outputStream];
  v18 = [[VCAudioHALPluginMockAudioInject alloc] initWithConfig:a3];
  v7->_mockAudioInject = v18;
  if (!v18)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice initWithConfig:].cold.5();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      v19 = (__CFString *)[(VCAudioHALPluginDevice *)v7 performSelector:sel_logPrefix];
    }
    else {
      v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v28;
        __int16 v37 = 2080;
        v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
        __int16 v39 = 1024;
        int v40 = 98;
        __int16 v41 = 2112;
        v42 = v19;
        __int16 v43 = 2048;
        v44 = v7;
        v26 = " [%s] %s:%d %@(%p) could not allocate mock audio inject";
        goto LABEL_64;
      }
    }
LABEL_65:

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginDevice-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      unint64_t v10 = "-[VCAudioHALPluginDevice dealloc]";
      __int16 v11 = 1024;
      int v12 = 110;
      __int16 v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-dealloc (%p)", buf, 0x26u);
    }
  }
  timeQueue = self->_timeQueue;
  if (timeQueue)
  {
    dispatch_release(timeQueue);
    self->_timeQueue = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)VCAudioHALPluginDevice;
  [(ASDAudioDevice *)&v6 dealloc];
}

- (void)configureRemoteDeviceInfo:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    -[ASDAudioDevice setDeviceName:](self, "setDeviceName:", [a3 deviceName]);
    -[ASDAudioDevice setModelUID:](self, "setModelUID:", [a3 modelUID]);
  }
  else
  {
    [(ASDAudioDevice *)self setDeviceName:@"AVConference Audio Device"];
  }
  [(ASDAudioDevice *)self setModelName:[(ASDAudioDevice *)self deviceUID]];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(ASDAudioDevice *)self deviceName];
        __int16 v9 = [(ASDAudioDevice *)self deviceUID];
        unint64_t v10 = [(ASDAudioDevice *)self modelUID];
        __int16 v11 = [(ASDAudioDevice *)self manufacturerName];
        int v12 = [(ASDAudioDevice *)self modelName];
        __int16 v13 = [(ASDAudioDevice *)self configurationBundleID];
        [(ASDAudioDevice *)self samplingRate];
        *(_DWORD *)buf = 136317698;
        uint64_t v28 = v6;
        __int16 v29 = 2080;
        uint64_t v30 = "-[VCAudioHALPluginDevice configureRemoteDeviceInfo:]";
        __int16 v31 = 1024;
        int v32 = 129;
        __int16 v33 = 2048;
        id v34 = a3;
        __int16 v35 = 2112;
        uint64_t v36 = (VCAudioHALPluginDevice *)v8;
        __int16 v37 = 2112;
        id v38 = v9;
        __int16 v39 = 2112;
        int v40 = v10;
        __int16 v41 = 2112;
        v42 = v11;
        __int16 v43 = 2112;
        v44 = v12;
        __int16 v45 = 2112;
        v46 = v13;
        __int16 v47 = 2048;
        v48 = v14;
        uint64_t v15 = " [%s] %s:%d remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@ manufacturerName=%@ modelName=%@ co"
              "nfigurationBundleID=%@ samplingRate=%f";
        dispatch_queue_t v16 = v7;
        uint32_t v17 = 108;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(ASDAudioDevice *)self deviceName];
        v20 = [(ASDAudioDevice *)self deviceUID];
        v21 = [(ASDAudioDevice *)self modelUID];
        v22 = [(ASDAudioDevice *)self manufacturerName];
        v23 = [(ASDAudioDevice *)self modelName];
        uint64_t v24 = [(ASDAudioDevice *)self configurationBundleID];
        [(ASDAudioDevice *)self samplingRate];
        *(_DWORD *)buf = 136318210;
        uint64_t v28 = v18;
        __int16 v29 = 2080;
        uint64_t v30 = "-[VCAudioHALPluginDevice configureRemoteDeviceInfo:]";
        __int16 v31 = 1024;
        int v32 = 129;
        __int16 v33 = 2112;
        id v34 = v5;
        __int16 v35 = 2048;
        uint64_t v36 = self;
        __int16 v37 = 2048;
        id v38 = a3;
        __int16 v39 = 2112;
        int v40 = v26;
        __int16 v41 = 2112;
        v42 = v20;
        __int16 v43 = 2112;
        v44 = v21;
        __int16 v45 = 2112;
        v46 = v22;
        __int16 v47 = 2112;
        v48 = v23;
        __int16 v49 = 2112;
        v50 = v24;
        __int16 v51 = 2048;
        uint64_t v52 = v25;
        uint64_t v15 = " [%s] %s:%d %@(%p) remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@ manufacturerName=%@ modelNam"
              "e=%@ configurationBundleID=%@ samplingRate=%f";
        dispatch_queue_t v16 = v19;
        uint32_t v17 = 128;
        goto LABEL_14;
      }
    }
  }
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginDevice-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCAudioHALPluginDevice invalidate]";
      __int16 v9 = 1024;
      int v10 = 133;
      __int16 v11 = 2048;
      int v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  [(ASDAudioDevice *)self removeOutputStream:self->_outputStream];
  [(VCAudioHALPluginStream *)self->_outputStream invalidate];
}

- (BOOL)start
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315650;
        uint64_t v21 = v4;
        __int16 v22 = 2080;
        v23 = "-[VCAudioHALPluginDevice start]";
        __int16 v24 = 1024;
        int v25 = 139;
        uint64_t v6 = " [%s] %s:%d ";
        __int16 v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316162;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        v23 = "-[VCAudioHALPluginDevice start]";
        __int16 v24 = 1024;
        int v25 = 139;
        __int16 v26 = 2112;
        uint64_t v27 = v3;
        __int16 v28 = 2048;
        __int16 v29 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        __int16 v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (self->_isRunning)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice start]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      v14 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint32_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v20 = 136316162;
    uint64_t v21 = v16;
    __int16 v22 = 2080;
    v23 = "-[VCAudioHALPluginDevice start]";
    __int16 v24 = 1024;
    int v25 = 142;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    __int16 v28 = 2048;
    __int16 v29 = self;
    uint64_t v18 = " [%s] %s:%d %@(%p) audio server driver already running";
    goto LABEL_37;
  }
  id v11 = +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin];
  if (!v11)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice start]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint32_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v20 = 136316162;
    uint64_t v21 = v19;
    __int16 v22 = 2080;
    v23 = "-[VCAudioHALPluginDevice start]";
    __int16 v24 = 1024;
    int v25 = 144;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2048;
    __int16 v29 = self;
    uint64_t v18 = " [%s] %s:%d %@(%p) audio server driver plug in does not exist";
LABEL_37:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x30u);
    return 0;
  }
  [v11 addAudioDevice:self];
  BOOL v12 = 1;
  self->_isRunning = 1;
  [(VCAudioHALPluginMockAudioInject *)self->_mockAudioInject start];
  return v12;
}

- (BOOL)stop
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v25 = 136315650;
        *(void *)&v25[4] = v4;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 154;
        uint64_t v6 = " [%s] %s:%d ";
        __int16 v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v25, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v25 = 136316162;
        *(void *)&v25[4] = v9;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 154;
        WORD2(v26) = 2112;
        *(void *)((char *)&v26 + 6) = v3;
        HIWORD(v26) = 2048;
        uint64_t v27 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        __int16 v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (!self->_isRunning)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      {
LABEL_37:
        BOOL v12 = 0;
        goto LABEL_15;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint32_t v17 = *MEMORY[0x1E4F47A50];
      BOOL v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)int v25 = 136315650;
      *(void *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 157;
      uint64_t v18 = " [%s] %s:%d audio server driver not running";
      uint64_t v19 = v17;
      uint32_t v20 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v14 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
      }
      else {
        v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_37;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      BOOL v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)int v25 = 136316162;
      *(void *)&v25[4] = v21;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 157;
      WORD2(v26) = 2112;
      *(void *)((char *)&v26 + 6) = v14;
      HIWORD(v26) = 2048;
      uint64_t v27 = self;
      uint64_t v18 = " [%s] %s:%d %@(%p) audio server driver not running";
      uint64_t v19 = v22;
      uint32_t v20 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, v25, v20);
    goto LABEL_37;
  }
  id v11 = +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin];
  if (!v11)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioHALPluginDevice stop]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        __int16 v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int v25 = 136316162;
          *(void *)&v25[4] = v23;
          *(_WORD *)&v25[12] = 2080;
          *(void *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
          *(_WORD *)&v25[22] = 1024;
          LODWORD(v26) = 159;
          WORD2(v26) = 2112;
          *(void *)((char *)&v26 + 6) = v15;
          HIWORD(v26) = 2048;
          uint64_t v27 = self;
          _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audio server driver plug in does not exist", v25, 0x30u);
        }
      }
    }
    goto LABEL_37;
  }
  [v11 removeAudioDevice:self];
  self->_isRunning = 0;
  BOOL v12 = 1;
LABEL_15:
  [(VCAudioHALPluginMockAudioInject *)self->_mockAudioInject stop];
  return v12;
}

+ (id)sharedAudioServerDriverPlugin
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = a1;
  if (+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::onceToken != -1) {
    dispatch_once(&+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::onceToken, v3);
  }
  return (id)+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::_sharedAsdPlugIn;
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F4E7D0]);
  +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::_sharedAsdPlugIn = (uint64_t)v2;
  if (!v2)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_1();
        }
      }
      goto LABEL_35;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_35;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136316162;
    uint64_t v20 = v8;
    __int16 v21 = 2080;
    __int16 v22 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 179;
    __int16 v25 = 2112;
    long long v26 = v4;
    __int16 v27 = 2048;
    uint64_t v28 = v10;
    id v11 = " [%s] %s:%d %@(%p) can not create audio server driver plug in";
LABEL_31:
    v14 = v9;
    uint32_t v15 = 48;
    goto LABEL_37;
  }
  if (![v2 driverRef])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_2();
        }
      }
      goto LABEL_35;
    }
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_35;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136316162;
    uint64_t v20 = v12;
    __int16 v21 = 2080;
    __int16 v22 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 181;
    __int16 v25 = 2112;
    long long v26 = v5;
    __int16 v27 = 2048;
    uint64_t v28 = v13;
    id v11 = " [%s] %s:%d %@(%p) no driver reference for audio server driver plug in";
    goto LABEL_31;
  }
  int v3 = AudioServerPlugInRegisterRemote();
  if (v3)
  {
    int v6 = v3;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_3();
        }
      }
      goto LABEL_35;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      __int16 v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v16 = VRTraceErrorLogLevelToCSTR(),
          uint32_t v17 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_35:

      +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::_sharedAsdPlugIn = 0;
      return;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136316418;
    uint64_t v20 = v16;
    __int16 v21 = 2080;
    __int16 v22 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 183;
    __int16 v25 = 2112;
    long long v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = v18;
    __int16 v29 = 1024;
    int v30 = v6;
    id v11 = " [%s] %s:%d %@(%p) not able to register audio server driver plug in with error: %i";
    v14 = v17;
    uint32_t v15 = 54;
LABEL_37:
    _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v11, buf, v15);
    goto LABEL_35;
  }
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_2_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 136316162;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        uint64_t v9 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 175;
        __int16 v12 = 2112;
        uint64_t v13 = v2;
        __int16 v14 = 2048;
        uint64_t v15 = v5;
        _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audio server driver plugin interrupted", (uint8_t *)&v6, 0x30u);
      }
    }
  }
}

- (int)performStartIO
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginDevice-performStartIO");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCAudioHALPluginDevice performStartIO]";
      __int16 v14 = 1024;
      int v15 = 195;
      __int16 v16 = 2048;
      uint32_t v17 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-performStartIO (%p)", buf, 0x26u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)VCAudioHALPluginDevice;
  int v5 = [(ASDAudioDevice *)&v9 performStartIO];
  if (!v5)
  {
    timeQueue = self->_timeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__VCAudioHALPluginDevice_performStartIO__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    dispatch_async(timeQueue, block);
  }
  return v5;
}

uint64_t __40__VCAudioHALPluginDevice_performStartIO__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) initialZeroTimestamp];
}

- (int)performStopIO
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAudioHALPluginDevice-performStopIO");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCAudioHALPluginDevice performStopIO]";
      __int16 v13 = 1024;
      int v14 = 207;
      __int16 v15 = 2048;
      __int16 v16 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-performStopIO (%p)", buf, 0x26u);
    }
  }
  timeQueue = self->_timeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCAudioHALPluginDevice_performStopIO__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(timeQueue, block);
  v7.receiver = self;
  v7.super_class = (Class)VCAudioHALPluginDevice;
  return [(ASDAudioDevice *)&v7 performStopIO];
}

double __39__VCAudioHALPluginDevice_performStopIO__block_invoke(uint64_t a1)
{
  return VCAudioHALPluginTimestamp::reset((VCAudioHALPluginTimestamp *)(*(void *)(a1 + 32) + 488));
}

- (id)getZeroTimestampBlock
{
  v5[5] = *MEMORY[0x1E4F143B8];
  p_timestamp = &self->_timestamp;

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__VCAudioHALPluginDevice_getZeroTimestampBlock__block_invoke;
  v5[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  v5[4] = p_timestamp;
  id result = (id)[v5 copy];
  self->_zeroTimestampBlock = result;
  return result;
}

uint64_t __47__VCAudioHALPluginDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, void *a2, void *a3, unint64_t *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v9.n128_u64[0] = -1;
  v9.n128_u64[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  VCAudioHALPluginTimestamp::read(*(VCAudioHALPluginTimestamp **)(a1 + 32), &v9);
  *a2 = v9.n128_u64[0];
  unint64_t v7 = v10;
  *a3 = v9.n128_u64[1];
  *a4 = v7;
  return 0;
}

- (id)willDoReadInputBlock
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v4;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCAudioHALPluginDevice willDoReadInputBlock]";
        __int16 v19 = 1024;
        int v20 = 230;
        int v6 = " [%s] %s:%d ";
        unint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      unint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCAudioHALPluginDevice willDoReadInputBlock]";
        __int16 v19 = 1024;
        int v20 = 230;
        __int16 v21 = 2112;
        __int16 v22 = v3;
        __int16 v23 = 2048;
        int v24 = self;
        int v6 = " [%s] %s:%d %@(%p) ";
        unint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  BOOL v11 = [(ASDAudioDevice *)self hasInput];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__VCAudioHALPluginDevice_willDoReadInputBlock__block_invoke;
  v13[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  BOOL v14 = v11;
  id result = (id)[v13 copy];
  self->_willDoReadInputBlock = result;
  return result;
}

uint64_t __46__VCAudioHALPluginDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  uint64_t result = 1970171760;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *(unsigned char *)(a1 + 32);
      *a4 = 1;
    }
  }
  return result;
}

- (id)willDoWriteMixBlock
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v4;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCAudioHALPluginDevice willDoWriteMixBlock]";
        __int16 v19 = 1024;
        int v20 = 247;
        int v6 = " [%s] %s:%d ";
        unint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      unint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCAudioHALPluginDevice willDoWriteMixBlock]";
        __int16 v19 = 1024;
        int v20 = 247;
        __int16 v21 = 2112;
        __int16 v22 = v3;
        __int16 v23 = 2048;
        int v24 = self;
        int v6 = " [%s] %s:%d %@(%p) ";
        unint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  BOOL v11 = [(ASDAudioDevice *)self hasOutput];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__VCAudioHALPluginDevice_willDoWriteMixBlock__block_invoke;
  v13[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  BOOL v14 = v11;
  id result = (id)[v13 copy];
  self->_willDoWriteMixBlock = result;
  return result;
}

uint64_t __45__VCAudioHALPluginDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  uint64_t result = 1970171760;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *(unsigned char *)(a1 + 32);
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__VCAudioHALPluginDevice_changeSamplingRate___block_invoke;
  v4[3] = &unk_1E6DB4568;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  [(ASDAudioDevice *)self requestConfigurationChange:v4];
  return 1;
}

void __45__VCAudioHALPluginDevice_changeSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setSamplingRate:*(double *)(a1 + 40)];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(__CFString **)(a1 + 40);
        int v13 = 136315906;
        uint64_t v14 = v3;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCAudioHALPluginDevice changeSamplingRate:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 266;
        __int16 v19 = 2048;
        int v20 = v5;
        int v6 = " [%s] %s:%d newRate=%f";
        unint64_t v7 = v4;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      unint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCAudioHALPluginDevice changeSamplingRate:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 266;
        __int16 v19 = 2112;
        int v20 = v2;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        __int16 v23 = 2048;
        uint64_t v24 = v12;
        int v6 = " [%s] %s:%d %@(%p) newRate=%f";
        unint64_t v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)initialZeroTimestamp
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = mach_absolute_time();
  unint64_t currentSeed = self->_currentSeed;
  v12.sampleTime = 0.0;
  v12.hostTime = v3;
  v12.seed = currentSeed;
  *(void *)&double v5 = VCAudioHALPluginTimestamp::write(&self->_timestamp, &v12).n128_u64[0];
  double clockFrequency = self->_clockFrequency;
  [(ASDAudioDevice *)self samplingRate];
  dispatch_time_t v8 = v3 + (unint64_t)(clockFrequency / v7 * (double)[(ASDAudioDevice *)self timestampPeriod]);
  uint64_t v9 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  timeQueue = self->_timeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCAudioHALPluginDevice_initialZeroTimestamp__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = v9;
  dispatch_after(v8, timeQueue, block);
}

void *__46__VCAudioHALPluginDevice_initialZeroTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) strong];
  if (result)
  {
    uint64_t v2 = result[69];
    return (void *)[result updateZeroTimestamp:v2];
  }
  return result;
}

- (void)updateZeroTimestamp:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_currentSeed == a3)
  {
    v24.n128_u64[0] = -1;
    v24.n128_u64[1] = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
    p_timestamp = &self->_timestamp;
    *(void *)&double v6 = VCAudioHALPluginTimestamp::read(&self->_timestamp, &v24).n128_u64[0];
    double v7 = v24.n128_f64[0];
    double v8 = v7 + (double)[(ASDAudioDevice *)self timestampPeriod];
    unint64_t v9 = v24.n128_u64[1];
    double clockFrequency = self->_clockFrequency;
    [(ASDAudioDevice *)self samplingRate];
    double v12 = clockFrequency / v11;
    unsigned int v13 = [(ASDAudioDevice *)self timestampPeriod];
    unint64_t currentSeed = self->_currentSeed;
    unint64_t v15 = v9 + (unint64_t)(v12 * (double)v13);
    v23.sampleTime = v8;
    v23.hostTime = v15;
    v23.seed = currentSeed;
    *(void *)&double v16 = VCAudioHALPluginTimestamp::write(p_timestamp, &v23).n128_u64[0];
    double v17 = self->_clockFrequency;
    [(ASDAudioDevice *)self samplingRate];
    double v19 = v17 / v18 * (double)[(ASDAudioDevice *)self timestampPeriod] + (double)v15;
    uint64_t v20 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    timeQueue = self->_timeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__VCAudioHALPluginDevice_updateZeroTimestamp___block_invoke;
    block[3] = &unk_1E6DB4568;
    block[4] = v20;
    void block[5] = a3;
    dispatch_after((unint64_t)v19, timeQueue, block);
  }
}

void *__46__VCAudioHALPluginDevice_updateZeroTimestamp___block_invoke(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) strong];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return (void *)[result updateZeroTimestamp:v3];
  }
  return result;
}

- (unsigned)calculateIOBufferFrameSize:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int samplesPerFrame = self->_samplesPerFrame;
        int v16 = 136316162;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        double v19 = "-[VCAudioHALPluginDevice calculateIOBufferFrameSize:]";
        __int16 v20 = 1024;
        int v21 = 327;
        __int16 v22 = 1024;
        *(_DWORD *)tagVCAudioHALPluginTimestampInfo v23 = a3;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = samplesPerFrame;
        unint64_t v9 = " [%s] %s:%d requestedSize=%d configuring for samplesPerFrame=%d";
        unint64_t v10 = v7;
        uint32_t v11 = 40;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v5 = (__CFString *)[(VCAudioHALPluginDevice *)self performSelector:sel_logPrefix];
    }
    else {
      double v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      unsigned int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = self->_samplesPerFrame;
        int v16 = 136316674;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        double v19 = "-[VCAudioHALPluginDevice calculateIOBufferFrameSize:]";
        __int16 v20 = 1024;
        int v21 = 327;
        __int16 v22 = 2112;
        *(void *)tagVCAudioHALPluginTimestampInfo v23 = v5;
        *(_WORD *)&v23[8] = 2048;
        __n128 v24 = self;
        __int16 v25 = 1024;
        unsigned int v26 = a3;
        __int16 v27 = 1024;
        unsigned int v28 = v14;
        unint64_t v9 = " [%s] %s:%d %@(%p) requestedSize=%d configuring for samplesPerFrame=%d";
        unint64_t v10 = v13;
        uint32_t v11 = 60;
        goto LABEL_11;
      }
    }
  }
  return self->_samplesPerFrame;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCAudioHALPluginDevice;
  BOOL result = [(ASDAudioDevice *)&v14 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
  if (a3 && a6 && a7 && a3->mSelector == 1667658618)
  {
    *(_DWORD *)a7 = [(VCAudioHALPluginDevice *)self calculateIOBufferFrameSize:*(unsigned int *)a5];
    *a6 = 4;
    return 1;
  }
  return result;
}

+ (id)sharedAudioHALPluginNullDevice
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (+[VCDefaults BOOLeanValueForKey:@"startAudioHALPluginNullDevice" defaultValue:0])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__VCAudioHALPluginDevice_sharedAudioHALPluginNullDevice__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = a1;
    if (+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::onceToken != -1) {
      dispatch_once(&+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::onceToken, block);
    }
    if (!+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v4 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v4 = &stru_1F3D3E450;
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
            uint32_t v11 = "+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]";
            __int16 v12 = 1024;
            int v13 = 365;
            __int16 v14 = 2112;
            uint64_t v15 = v4;
            __int16 v16 = 2048;
            id v17 = a1;
            _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audio server driver plug in null device does not exist", buf, 0x30u);
          }
        }
      }
    }
  }
  return (id)+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice;
}

void __56__VCAudioHALPluginDevice_sharedAudioHALPluginNullDevice__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  Format_Float((uint64_t)&v19, 2, 48000);
  long long v12 = v19;
  long long v13 = v20;
  uint64_t v14 = v21;
  unint64_t v15 = 0xAAAAAAAA000001E0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = v2;
  +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice = [[VCAudioHALPluginDevice alloc] initWithConfig:&v12];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = v4;
        __int16 v24 = 2080;
        __int16 v25 = "+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]_block_invoke";
        __int16 v26 = 1024;
        int v27 = 363;
        __int16 v28 = 2048;
        uint64_t v29 = +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice;
        uint64_t v6 = " [%s] %s:%d created audio server driver plug in null device=%p";
        double v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix, v12, v13, v14, v15, v16, v17, v18);
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v9;
        __int16 v24 = 2080;
        __int16 v25 = "+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]_block_invoke";
        __int16 v26 = 1024;
        int v27 = 363;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v3;
        __int16 v30 = 2048;
        uint64_t v31 = v11;
        __int16 v32 = 2048;
        uint64_t v33 = +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice;
        uint64_t v6 = " [%s] %s:%d %@(%p) created audio server driver plug in null device=%p";
        double v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void).cxx_destruct
{
  p_timestamp = &self->_timestamp;
  begin = self->_timestamp.timestamps.__begin_;
  if (begin)
  {
    p_timestamp->timestamps.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  p_timestamp = &self->_timestamp;
  self->_timestamp.numberOfSlots = 4;
  std::vector<tagVCAudioHALPluginTimestampInfo>::vector(&self->_timestamp.timestamps.__begin_, 4uLL, (long long *)&self->_timestamp.initLocklessTimestampInfo);
  *(_OWORD *)&p_timestamp->timestampIndex.__a_.__a_value = 0u;
  *(_OWORD *)&p_timestamp->initLocklessTimestampInfo.hostTime = 0u;
  return self;
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid config", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil plugin", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create dispatch queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate stream", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate mock audio inject", v2, v3, v4, v5, v6);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audio server driver already running", v2, v3, v4, v5, v6);
}

- (void)stop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audio server driver plug in does not exist", v2, v3, v4, v5, v6);
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d can not create audio server driver plug in", v2, v3, v4, v5, v6);
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d no driver reference for audio server driver plug in", v2, v3, v4, v5, v6);
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_3()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
  __int16 v6 = 1024;
  int v7 = 183;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d not able to register audio server driver plug in with error: %i", v3, 0x22u);
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audio server driver plugin interrupted", v2, v3, v4, v5, v6);
}

+ (void)sharedAudioHALPluginNullDevice
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audio server driver plug in null device does not exist", v2, v3, v4, v5, v6);
}

@end