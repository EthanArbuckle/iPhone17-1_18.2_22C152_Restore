@interface AVAudioDevice
- (AVAudioDevice)initWithDeviceID:(id)a3;
- (BOOL)copyStreamIDArray:(unsigned int *)a3 length:(unsigned int *)a4;
- (BOOL)deviceHasNonTapStreamsInStreamList:(unsigned int *)a3 length:(unsigned int)a4;
- (BOOL)hasRealInputStream;
- (BOOL)inputAvailable;
- (BOOL)isAggregableDevice;
- (BOOL)isBluetoothDevice;
- (BOOL)isBuiltInDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreferredDevice;
- (BOOL)isSomethingConnectedToJack;
- (BOOL)isStreamAvailableForScope:(unsigned int)a3;
- (BOOL)isValidDevice;
- (BOOL)isValidInputDevice;
- (BOOL)outputAvailable;
- (NSNumber)deviceID;
- (NSString)UID;
- (NSString)deviceName;
- (id)description;
- (id)newAudioObjectStringPropertyWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5;
- (unint64_t)hash;
- (unsigned)allocDeviceControlListAndSize:(unsigned int *)a3;
- (unsigned)getDataSourceControlID;
- (void)createName;
- (void)createUID;
- (void)dealloc;
@end

@implementation AVAudioDevice

- (AVAudioDevice)initWithDeviceID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)AVAudioDevice;
  v4 = [(AVAudioDevice *)&v8 init];
  if (v4)
  {
    v4->_deviceID = (NSNumber *)[a3 copy];
    v4->_preferredDevice = [(AVAudioDevice *)v4 isBluetoothDevice];
    if (!v4->_deviceName) {
      [(AVAudioDevice *)v4 createName];
    }
    if (!v4->_UID) {
      [(AVAudioDevice *)v4 createUID];
    }
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioDevice-initWithDeviceID");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      v12 = "-[AVAudioDevice initWithDeviceID:]";
      __int16 v13 = 1024;
      int v14 = 78;
      __int16 v15 = 2112;
      v16 = v4;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVAudioDevice-initWithDeviceID self=%@ initDeviceID=%@", buf, 0x30u);
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVAudioDevice;
  [(AVAudioDevice *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@: [%p] deviceName[%@] deviceID[%@] UID[%@] isPreferred[%d] _isLineIn[%d] inputAvailable[%d] outputAvailable[%d]", NSStringFromClass(v4), self, self->_deviceName, self->_deviceID, self->_UID, self->_preferredDevice, self->_isLineIn, self->_inputAvailable, self->_outputAvailable];
}

- (BOOL)isBluetoothDevice
{
  return 0;
}

- (id)newAudioObjectStringPropertyWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  return 0;
}

- (void)createName
{
  if (!self->_deviceName) {
    self->_deviceName = (NSString *)[(AVAudioDevice *)self newAudioObjectStringPropertyWithSelector:1819173229 scope:1735159650 element:0];
  }
}

- (void)createUID
{
  if (!self->_UID) {
    self->_UID = (NSString *)[(AVAudioDevice *)self newAudioObjectStringPropertyWithSelector:1969841184 scope:1735159650 element:0];
  }
}

- (BOOL)isValidDevice
{
  deviceName = self->_deviceName;
  if (deviceName) {
    LOBYTE(deviceName) = [(NSString *)deviceName rangeOfString:@"VPAUAggregateAudioDevice" options:8] == 0x7FFFFFFFFFFFFFFFLL;
  }
  return (char)deviceName;
}

- (BOOL)copyStreamIDArray:(unsigned int *)a3 length:(unsigned int *)a4
{
  uint64_t v4 = self;
  LOBYTE(self) = 0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    return (char)self;
  }
  uint64_t v7 = [(NSNumber *)v4->_deviceID unsignedIntegerValue];
  *(void *)&inAddress.mSelector = *(void *)"#mtstpni";
  inAddress.mElement = 0;
  UInt32 outDataSize = 0;
  OSStatus PropertyDataSize = AudioObjectGetPropertyDataSize(v7, &inAddress, 0, 0, &outDataSize);
  UInt32 v9 = outDataSize;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (PropertyDataSize) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(self) = 0;
      if (!v14) {
        return (char)self;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v32 = v12;
      __int16 v33 = 2080;
      v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
      __int16 v35 = 1024;
      int v36 = 218;
      __int16 v37 = 2048;
      *(void *)v38 = v7;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = outDataSize;
      __int16 v39 = 1024;
      UInt32 v40 = PropertyDataSize;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unable to get size for stream vector - deviceID=%lu, streamListDataSizeBytes=%u, status=%d", buf, 0x32u);
    }
LABEL_28:
    LOBYTE(self) = 0;
    return (char)self;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v32 = v15;
      __int16 v33 = 2080;
      v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
      __int16 v35 = 1024;
      int v36 = 221;
      __int16 v37 = 1024;
      *(_DWORD *)v38 = outDataSize;
      *(_WORD *)&v38[4] = 2048;
      *(void *)&v38[6] = v7;
      __int16 v39 = 1024;
      UInt32 v40 = 0;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AudioObjectGetPropertyDataSize for kAudioDevicePropertyStreams returned streamListDataSizeBytes=%u for deviceID=%lu with status=%d", buf, 0x32u);
    }
  }
  unint64_t v17 = (unint64_t)outDataSize >> 2;
  id v18 = malloc_type_calloc(v17, 4uLL, 0x100004052888210uLL);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!self) {
        return (char)self;
      }
      -[AVAudioDevice copyStreamIDArray:length:](v25, v26);
    }
    goto LABEL_28;
  }
  uint64_t v19 = v18;
  UInt32 ioDataSize = outDataSize;
  OSStatus PropertyData = AudioObjectGetPropertyData(v7, &inAddress, 0, 0, &ioDataSize, v18);
  if (PropertyData || outDataSize != ioDataSize)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v32 = v23;
        __int16 v33 = 2080;
        v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
        __int16 v35 = 1024;
        int v36 = 233;
        __int16 v37 = 2048;
        *(void *)v38 = v19;
        *(_WORD *)&v38[8] = 1024;
        *(_DWORD *)&v38[10] = PropertyData;
        __int16 v39 = 1024;
        UInt32 v40 = outDataSize;
        __int16 v41 = 1024;
        UInt32 v42 = ioDataSize;
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to get stream vector - streamList=%p, status=%d, expectedStreamListDataSizeBytes=%u, actualStreamListDataSizeBytes=%u", buf, 0x38u);
      }
    }
    free(v19);
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v32 = v21;
      __int16 v33 = 2080;
      v34 = "-[AVAudioDevice copyStreamIDArray:length:]";
      __int16 v35 = 1024;
      int v36 = 237;
      __int16 v37 = 2048;
      *(void *)v38 = v19;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = outDataSize;
      __int16 v39 = 1024;
      UInt32 v40 = v17;
      __int16 v41 = 1024;
      UInt32 v42 = 0;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Returning streamList=%p with streamListDataSizeBytes=%u, streamListLength=%u, and status=%d", buf, 0x38u);
    }
  }
  *a3 = (unsigned int *)v19;
  *a4 = v17;
  LOBYTE(self) = 1;
  return (char)self;
}

- (BOOL)deviceHasNonTapStreamsInStreamList:(unsigned int *)a3 length:(unsigned int)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  inAddress.mElement = 0;
  *(void *)&inAddress.mSelector = *(void *)"spatbolg";
  int outData = 0;
  if (a4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a4;
    while (1)
    {
      UInt32 ioDataSize = 4;
      int HasProperty = AudioObjectHasProperty(a3[v5], &inAddress);
      if (!HasProperty) {
        break;
      }
      int v8 = HasProperty;
      OSStatus PropertyData = AudioObjectGetPropertyData(a3[v5], &inAddress, 0, 0, &ioDataSize, &outData);
      if (PropertyData)
      {
        OSStatus v10 = PropertyData;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v13 = a3[v5];
            deviceID = self->_deviceID;
            *(_DWORD *)buf = 136316930;
            uint64_t v25 = v11;
            __int16 v26 = 2080;
            v27 = "-[AVAudioDevice deviceHasNonTapStreamsInStreamList:length:]";
            __int16 v28 = 1024;
            int v29 = 270;
            __int16 v30 = 1024;
            unsigned int v31 = v13;
            __int16 v32 = 2112;
            __int16 v33 = deviceID;
            __int16 v34 = 1024;
            *(_DWORD *)__int16 v35 = v10;
            *(_WORD *)&v35[4] = 1024;
            *(_DWORD *)&v35[6] = v5 + 1;
            LOWORD(v36[0]) = 1024;
            *(_DWORD *)((char *)v36 + 2) = v6;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unable to get kAudioStreamPropertyIsTapStream data from streamID=%u on _deviceID=%@, status=%d - array value i=%u out of total=%u", buf, 0x3Eu);
          }
        }
      }
      else
      {
        if (!outData) {
          break;
        }
        int v8 = 1;
      }
      if (v6 == ++v5) {
        goto LABEL_16;
      }
    }
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
LABEL_16:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    unint64_t v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      deviceName = self->_deviceName;
      id v18 = self->_deviceID;
      *(_DWORD *)buf = 136316674;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      v27 = "-[AVAudioDevice deviceHasNonTapStreamsInStreamList:length:]";
      __int16 v28 = 1024;
      int v29 = 278;
      __int16 v30 = 1024;
      unsigned int v31 = v8;
      __int16 v32 = 2112;
      __int16 v33 = v18;
      __int16 v34 = 2112;
      *(void *)__int16 v35 = deviceName;
      *(_WORD *)&v35[8] = 1024;
      v36[0] = outData;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d deviceHasOnlyTapStreamInputs=%{BOOL}d, _deviceId=%@, _deviceName [%@], isTapStream=%u", buf, 0x3Cu);
    }
  }
  return v8 == 0;
}

- (BOOL)hasRealInputStream
{
  v6[1] = *(void **)MEMORY[0x1E4F143B8];
  v6[0] = 0;
  unsigned int v5 = 0;
  BOOL v3 = 0;
  if ([(AVAudioDevice *)self copyStreamIDArray:v6 length:&v5])
  {
    BOOL v3 = [(AVAudioDevice *)self deviceHasNonTapStreamsInStreamList:v6[0] length:v5];
    free(v6[0]);
  }
  return v3;
}

- (BOOL)isAggregableDevice
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id outData = 0;
  inAddress.mElement = 0;
  UInt32 ioDataSize = 8;
  *(void *)&inAddress.mSelector = *(void *)"glpobolg";
  AudioObjectGetPropertyData([(NSNumber *)self->_deviceID unsignedIntegerValue], &inAddress, 0, 0, &ioDataSize, &outData);
  int v2 = [outData hasPrefix:@"com.apple.audio.CoreAudio"];

  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVAudioDevice isAggregableDevice]";
      __int16 v13 = 1024;
      int v14 = 313;
      __int16 v15 = 1024;
      int v16 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Input device created by CoreAudio result=%{BOOL}d", buf, 0x22u);
    }
  }
  return v2;
}

- (BOOL)isValidInputDevice
{
  BOOL v3 = [(AVAudioDevice *)self hasRealInputStream];
  if (v3)
  {
    BOOL v3 = [(AVAudioDevice *)self isAggregableDevice];
    if (v3)
    {
      if (self->_isLineIn)
      {
        LOBYTE(v3) = [(AVAudioDevice *)self isSomethingConnectedToJack];
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return v3;
}

- (BOOL)isSomethingConnectedToJack
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  UInt32 ioDataSize = 4;
  int outData = 0;
  *(void *)&inAddress.mSelector = *(void *)"kcajtpni";
  inAddress.mElement = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData([(NSNumber *)self->_deviceID unsignedIntValue], &inAddress, 0, 0, &ioDataSize, &outData);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (PropertyData)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = FourccToCStr(PropertyData);
        deviceID = self->_deviceID;
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v5;
        __int16 v17 = 2080;
        id v18 = "-[AVAudioDevice isSomethingConnectedToJack]";
        __int16 v19 = 1024;
        int v20 = 338;
        __int16 v21 = 2080;
        v22 = v7;
        __int16 v23 = 1024;
        OSStatus v24 = PropertyData;
        __int16 v25 = 2112;
        __int16 v26 = deviceID;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d AudioDeviceGetProperty failed for JackIsConnected error=%s [%d] deviceId=%@", buf, 0x36u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      id v18 = "-[AVAudioDevice isSomethingConnectedToJack]";
      __int16 v19 = 1024;
      int v20 = 340;
      __int16 v21 = 1024;
      LODWORD(v22) = outData;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AudioDeviceGetProperty kAudioDevicePropertyJackIsConnected returned nValue=%u", buf, 0x22u);
    }
  }
  return outData != 0;
}

- (BOOL)isBuiltInDevice
{
  return 0;
}

- (unsigned)allocDeviceControlListAndSize:(unsigned int *)a3
{
  return 0;
}

- (unsigned)getDataSourceControlID
{
  return 0;
}

- (BOOL)isStreamAvailableForScope:(unsigned int)a3
{
  return 0;
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_deviceID hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  deviceID = self->_deviceID;
  uint64_t v6 = [a3 deviceID];

  return [(NSNumber *)deviceID isEqualToNumber:v6];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSString)UID
{
  return self->_UID;
}

- (BOOL)inputAvailable
{
  return self->_inputAvailable;
}

- (BOOL)outputAvailable
{
  return self->_outputAvailable;
}

- (BOOL)isPreferredDevice
{
  return self->_preferredDevice;
}

- (void)copyStreamIDArray:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[AVAudioDevice copyStreamIDArray:length:]";
  __int16 v6 = 1024;
  int v7 = 226;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d streamList calloc failed", (uint8_t *)&v2, 0x1Cu);
}

@end