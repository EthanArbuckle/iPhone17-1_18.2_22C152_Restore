@interface AVAudioDeviceList
+ (BOOL)setInputDevice:(id)a3;
+ (id)currentInputDevice;
+ (id)defaultInputDevice;
+ (id)defaultOutputDevice;
+ (id)deviceForDeviceID:(unsigned int)a3;
+ (id)deviceForUID:(id)a3;
- (AVAudioDeviceList)init;
- (id)changeListener;
- (id)devices;
- (id)inputDevices;
- (id)outputDevices;
- (void)dealloc;
- (void)setChangeListener:(id)a3;
@end

@implementation AVAudioDeviceList

+ (id)defaultInputDevice
{
  return 0;
}

+ (id)defaultOutputDevice
{
  return 0;
}

+ (id)currentInputDevice
{
  return 0;
}

+ (BOOL)setInputDevice:(id)a3
{
  return 1;
}

+ (id)deviceForUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(AVAudioDeviceList);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AVAudioDeviceList *)v4 devices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend(v10, "UID"), "isEqualToString:", a3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  id v11 = v10;

  return v10;
}

+ (id)deviceForDeviceID:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(AVAudioDeviceList);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(AVAudioDeviceList *)v4 devices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend(v10, "deviceID"), "unsignedIntValue") == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  id v11 = v10;

  return v10;
}

- (AVAudioDeviceList)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVAudioDeviceList;
  v2 = [(AVAudioDeviceList *)&v4 init];
  if (v2) {
    v2->_internalList = objc_alloc_init(AVInternalDeviceList);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(AVInternalDeviceList *)self->_internalList cleanup];

  v3.receiver = self;
  v3.super_class = (Class)AVAudioDeviceList;
  [(AVAudioDeviceList *)&v3 dealloc];
}

- (void)setChangeListener:(id)a3
{
}

- (id)changeListener
{
  return [(AVInternalDeviceList *)self->_internalList changeListener];
}

- (id)devices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVInternalDeviceList *)self->_internalList deviceList];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    uint64_t v4 = (const char *)objc_msgSend((id)-[AVAudioDeviceList description](self, "description"), "UTF8String");
    uint64_t v5 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "self=%s devices=%s", v4, v5);
    if (__str)
    {
      __lasts = 0;
      uint64_t v6 = strtok_r(__str, "\n", &__lasts);
      uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v14 = v8;
            __int16 v15 = 2080;
            long long v16 = "-[AVAudioDeviceList devices]";
            __int16 v17 = 1024;
            int v18 = 826;
            __int16 v19 = 2080;
            v20 = "AVAudioDeviceList-devices";
            __int16 v21 = 2080;
            v22 = v6;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
    }
  }
  return v3;
}

- (id)inputDevices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVInternalDeviceList *)self->_internalList deviceList];
  uint64_t v4 = objc_msgSend(v3, "objectsAtIndexes:", objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_57));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    uint64_t v5 = (const char *)objc_msgSend((id)-[AVAudioDeviceList description](self, "description"), "UTF8String");
    uint64_t v6 = v4 ? (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "self=%s inputDevices=%s", v5, v6);
    if (__str)
    {
      __lasts = 0;
      uint64_t v7 = strtok_r(__str, "\n", &__lasts);
      uint64_t v8 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            __int16 v17 = "-[AVAudioDeviceList inputDevices]";
            __int16 v18 = 1024;
            int v19 = 844;
            __int16 v20 = 2080;
            __int16 v21 = "AVAudioDeviceList-inputDevices";
            __int16 v22 = 2080;
            uint64_t v23 = v7;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v7 = strtok_r(0, "\n", &__lasts);
      }
      while (v7);
      free(__str);
    }
  }
  return v4;
}

uint64_t __33__AVAudioDeviceList_inputDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = [a2 inputAvailable];
  if (v3) {
    uint64_t v4 = [a2 isValidInputDevice];
  }
  else {
    uint64_t v4 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      id v11 = "-[AVAudioDeviceList inputDevices]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 839;
      __int16 v14 = 2048;
      uint64_t v15 = a2;
      __int16 v16 = 1024;
      int v17 = v3;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d audioDevice=%p isInputAvailable=%{BOOL}d isValidInputDevice=%{BOOL}d", (uint8_t *)&v8, 0x32u);
    }
  }
  return v4;
}

- (id)outputDevices
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVInternalDeviceList *)self->_internalList deviceList];
  uint64_t v4 = objc_msgSend(v3, "objectsAtIndexes:", objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_110));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    uint64_t v5 = (const char *)objc_msgSend((id)-[AVAudioDeviceList description](self, "description"), "UTF8String");
    uint64_t v6 = v4 ? (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "self=%s outputDevices=%s", v5, v6);
    if (__str)
    {
      __lasts = 0;
      uint64_t v7 = strtok_r(__str, "\n", &__lasts);
      int v8 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          __int16 v10 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            int v17 = "-[AVAudioDeviceList outputDevices]";
            __int16 v18 = 1024;
            int v19 = 858;
            __int16 v20 = 2080;
            __int16 v21 = "AVAudioDeviceList-outputDevices";
            __int16 v22 = 2080;
            uint64_t v23 = v7;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v7 = strtok_r(0, "\n", &__lasts);
      }
      while (v7);
      free(__str);
    }
  }
  return v4;
}

uint64_t __34__AVAudioDeviceList_outputDevices__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 outputAvailable];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVAudioDeviceList outputDevices]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 853;
      __int16 v13 = 2048;
      __int16 v14 = a2;
      __int16 v15 = 1024;
      int v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d audioDevice=%p outputAvailable=%{BOOL}d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return v3;
}

@end