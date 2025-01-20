@interface VCMediaStreamConfigRemoteDeviceInfo
- (NSString)deviceName;
- (NSString)deviceUID;
- (NSString)modelUID;
- (VCMediaStreamConfigRemoteDeviceInfo)init;
- (void)dealloc;
- (void)setDeviceName:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setModelUID:(id)a3;
@end

@implementation VCMediaStreamConfigRemoteDeviceInfo

- (VCMediaStreamConfigRemoteDeviceInfo)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaStreamConfigRemoteDeviceInfo;
  v2 = [(VCMediaStreamConfigRemoteDeviceInfo *)&v12 init];
  if (v2)
  {
    if ((VCMediaStreamConfigRemoteDeviceInfo *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v14 = v4;
          __int16 v15 = 2080;
          v16 = "-[VCMediaStreamConfigRemoteDeviceInfo init]";
          __int16 v17 = 1024;
          int v18 = 109;
          v6 = " [%s] %s:%d ";
          v7 = v5;
          uint32_t v8 = 28;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[(VCMediaStreamConfigRemoteDeviceInfo *)v2 performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          v16 = "-[VCMediaStreamConfigRemoteDeviceInfo init]";
          __int16 v17 = 1024;
          int v18 = 109;
          __int16 v19 = 2112;
          v20 = v3;
          __int16 v21 = 2048;
          v22 = v2;
          v6 = " [%s] %s:%d %@(%p) ";
          v7 = v10;
          uint32_t v8 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCMediaStreamConfigRemoteDeviceInfo *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCMediaStreamConfigRemoteDeviceInfo dealloc]";
        __int16 v16 = 1024;
        int v17 = 115;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCMediaStreamConfigRemoteDeviceInfo *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCMediaStreamConfigRemoteDeviceInfo dealloc]";
        __int16 v16 = 1024;
        int v17 = 115;
        __int16 v18 = 2112;
        __int16 v19 = v3;
        __int16 v20 = 2048;
        __int16 v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)VCMediaStreamConfigRemoteDeviceInfo;
  [(VCMediaStreamConfigRemoteDeviceInfo *)&v11 dealloc];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
}

@end