@interface ASDTIOA2InjectionStream
- (ASDTIOA2InjectionStream)initWithIOA2Device:(id)a3 inputStream:(id)a4 registryDict:(id)a5;
- (ASDTIOA2Stream)inputStream;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)deviceChangedToSamplingRate:(double)a3;
- (BOOL)marked;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (id)physicalFormat;
- (int)pmPrepareStream:(int)a3;
- (int)pmPrewarmStream:(int)a3;
- (unsigned)userClientID;
- (void)asyncDeviceChangedToSamplingRate:(double)a3;
- (void)setInputStream:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMarked:(BOOL)a3;
- (void)setPhysicalFormat:(id)a3;
- (void)setPhysicalFormat:(id)a3 alwaysNotify:(BOOL)a4;
- (void)setPhysicalFormats:(id)a3;
- (void)setUserClientID:(unsigned int)a3;
@end

@implementation ASDTIOA2InjectionStream

- (ASDTIOA2InjectionStream)initWithIOA2Device:(id)a3 inputStream:(id)a4 registryDict:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ASDTIOA2InjectionStream;
  v11 = [(ASDTExclavesStream *)&v22 initWithDirection:1869968496 withDevice:v8];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  [(ASDTIOA2InjectionStream *)v11 setUserClientID:0xFFFFFFFFLL];
  [(ASDTIOA2InjectionStream *)v12 setInputStream:v9];
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%u-Injection", objc_msgSend(v9, "userClientID"));
  [(ASDStream *)v12 setStreamName:v13];

  [(ASDStream *)v12 setTerminalType:1768843885];
  v14 = [v8 exclavesInjectionBufferName];
  [(ASDTExclavesStream *)v12 setExclavesBufferName:v14];

  v15 = [(ASDTExclavesStream *)v12 exclavesBufferName];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    v18 = ASDTIOA2LogType();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [v8 deviceUID];
      v20 = [(ASDStream *)v12 streamName];
      -[ASDTIOA2InjectionStream initWithIOA2Device:inputStream:registryDict:](v19, v20, buf, v18);
    }

    goto LABEL_8;
  }
  if (![(ASDTIOA2InjectionStream *)v12 synchronizeWithRegistryDictionary:v10])
  {
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
LABEL_4:
  v17 = v12;
LABEL_9:

  return v17;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v28, v5);

  CFTypeRef v7 = v28;
  if (v28)
  {
    [(ASDStream *)self setStartingChannel:ASDT::IOA2UserClient::GetStreamInfo_StartingChannel((const __CFDictionary **)&v28, v6)];
    id v8 = [MEMORY[0x263EFF980] array];
    ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats((const __CFDictionary **)&v28, buf);
    id v9 = *(id *)buf;
    id v10 = v9;
    if (v9) {
      CFRelease(v9);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          BOOL v16 = v15;
          if (v15) {
            CFRetain(v15);
          }
          applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v16);

          if (ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)buf, v17))
          {
            v18 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamRangedDescription:buf];
            [v8 addObject:v18];
          }
          if (cf) {
            CFRelease(cf);
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v12);
    }

    [(ASDTIOA2InjectionStream *)self setPhysicalFormats:v8];
  }
  else
  {
    id v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = [(ASDTStream *)self device];
      v21 = [v20 deviceUID];
      objc_super v22 = [(ASDStream *)self streamName];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v21;
      __int16 v30 = 2112;
      v31 = v22;
      _os_log_error_impl(&dword_248A1B000, v8, OS_LOG_TYPE_ERROR, "%@:%@: Bad registry dictionary.", buf, 0x16u);
    }
  }

  if (v28) {
    CFRelease(v28);
  }

  return v7 != 0;
}

- (void)setPhysicalFormats:(id)a3
{
  id v4 = a3;
  v5 = [(ASDStream *)self physicalFormats];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDTIOA2InjectionStream;
    [(ASDStream *)&v7 setPhysicalFormats:v4];
  }
}

- (id)physicalFormat
{
  v3 = [(ASDTIOA2InjectionStream *)self ioa2Device];
  id v4 = [(ASDTIOA2InjectionStream *)self inputStream];
  v5 = objc_msgSend(v3, "_streamInfoForStream:", objc_msgSend(v4, "userClientID"));

  id v6 = v5;
  objc_super v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  if (ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)v11, v8))id v9 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamBasicDescription:v11]; {
  else
  }
    id v9 = 0;
  if (cf) {
    CFRelease(cf);
  }

  return v9;
}

- (void)setPhysicalFormat:(id)a3 alwaysNotify:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(ASDTIOA2InjectionStream *)self physicalFormat];
  if ([v6 isEqual:v7])
  {
    int v8 = 0;
  }
  else
  {
    id v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(ASDTStream *)self device];
      v18 = [v17 deviceUID];
      v19 = [(ASDStream *)self streamName];
      *(_DWORD *)buf = 138412802;
      objc_super v22 = v18;
      __int16 v23 = 2112;
      long long v24 = v19;
      __int16 v25 = 2112;
      long long v26 = v7;
      _os_log_debug_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEBUG, "%@:%@: setPhysicalFormat: Old: %@", buf, 0x20u);
    }
    id v10 = [(ASDTIOA2InjectionStream *)self ioa2Device];
    id v11 = [(ASDTIOA2InjectionStream *)self inputStream];
    int v8 = objc_msgSend(v10, "_setCurrentFormat:forStream:", v6, objc_msgSend(v11, "userClientID"));
  }
  if (a4 || v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)ASDTIOA2InjectionStream;
    [(ASDTStream *)&v20 setPhysicalFormat:v6];
  }
  if (v8)
  {
    uint64_t v12 = ASDTIOA2LogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(ASDTStream *)self device];
      v14 = [v13 deviceUID];
      id v15 = [(ASDStream *)self streamName];
      BOOL v16 = [(ASDTIOA2InjectionStream *)self physicalFormat];
      *(_DWORD *)buf = 138412802;
      objc_super v22 = v14;
      __int16 v23 = 2112;
      long long v24 = v15;
      __int16 v25 = 2112;
      long long v26 = v16;
      _os_log_impl(&dword_248A1B000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: setPhysicalFormat: New: %@", buf, 0x20u);
    }
  }
}

- (void)setPhysicalFormat:(id)a3
{
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4 = a3;
  v5 = [(ASDTIOA2InjectionStream *)self physicalFormat];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    objc_super v7 = [(ASDTStream *)self device];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__ASDTIOA2InjectionStream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_265246248;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v7 requestConfigurationChange:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __48__ASDTIOA2InjectionStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPhysicalFormat:*(void *)(a1 + 32) alwaysNotify:1];

  id v12 = objc_loadWeakRetained(v2);
  v3 = [v12 device];
  [v3 samplingRate];
  double v5 = v4;
  [*(id *)(a1 + 32) sampleRate];
  double v7 = v6;

  if (v5 != v7)
  {
    [*(id *)(a1 + 32) sampleRate];
    double v9 = v8;
    id v13 = objc_loadWeakRetained(v2);
    id v10 = [v13 device];
    [v10 setSamplingRate:v9];
  }
}

- (void)asyncDeviceChangedToSamplingRate:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2InjectionStream;
  [(ASDStream *)&v3 deviceChangedToSamplingRate:a3];
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  objc_initWeak(&location, self);
  double v5 = [(ASDTIOA2InjectionStream *)self ioa2Device];
  double v6 = [v5 concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ASDTIOA2InjectionStream_deviceChangedToSamplingRate___block_invoke;
  block[3] = &unk_265246270;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return 1;
}

void __55__ASDTIOA2InjectionStream_deviceChangedToSamplingRate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained asyncDeviceChangedToSamplingRate:*(double *)(a1 + 40)];
}

- (void)setIsActive:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDTIOA2InjectionStream;
  [(ASDStream *)&v5 setIsActive:a3];
  double v4 = [(ASDTIOA2InjectionStream *)self inputStream];
  [v4 updateActiveState];
}

- (int)pmPrewarmStream:(int)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)ASDTIOA2InjectionStream;
  unsigned int v5 = -[ASDTStream pmPrewarmStream:](&v21, sel_pmPrewarmStream_);
  int v6 = v5;
  if (a3 == 1970304877 && !v5)
  {
    double v7 = [(ASDTIOA2InjectionStream *)self ioa2Device];
    int v8 = [v7 _getIOBufferFrameSize];

    double v9 = [(ASDTIOA2InjectionStream *)self physicalFormat];
    int v10 = [v9 bytesPerFrame];

    LOBYTE(v8) = [(ASDTExclavesStream *)self allocExclavesAudioBuffer:(v10 * v8)];
    id v11 = ASDTIOA2LogType();
    id v12 = v11;
    if (v8)
    {
      int v6 = 0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(ASDTStream *)self device];
        v14 = [v13 deviceUID];
        id v15 = [(ASDStream *)self streamName];
        unsigned int v16 = [(ASDTExclavesStream *)self exclavesBufferSize];
        *(_DWORD *)buf = 138412802;
        __int16 v23 = v14;
        __int16 v24 = 2112;
        __int16 v25 = v15;
        __int16 v26 = 1024;
        unsigned int v27 = v16;
        _os_log_impl(&dword_248A1B000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: Exclaves inbound buffer size: %u", buf, 0x1Cu);

        int v6 = 0;
      }
    }
    else
    {
      int v6 = 1852990585;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = [(ASDTStream *)self device];
        v19 = [v18 deviceUID];
        objc_super v20 = [(ASDStream *)self streamName];
        *(_DWORD *)buf = 138412546;
        __int16 v23 = v19;
        __int16 v24 = 2112;
        __int16 v25 = v20;
        _os_log_error_impl(&dword_248A1B000, v12, OS_LOG_TYPE_ERROR, "%@:%@: Failed to allocate exclaves inbound buffer.", buf, 0x16u);
      }
    }
  }
  return v6;
}

- (int)pmPrepareStream:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1685090418)
  {
    [(ASDTExclavesStream *)self clearBuffer];
    [(ASDTExclavesStream *)self freeExclavesAudioBuffer];
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2InjectionStream;
  return [(ASDTExclavesStream *)&v6 pmPrepareStream:v3];
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (ASDTIOA2Stream)inputStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputStream);

  return (ASDTIOA2Stream *)WeakRetained;
}

- (void)setInputStream:(id)a3
{
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void)setUserClientID:(unsigned int)a3
{
  self->_userClientID = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithIOA2Device:(uint8_t *)buf inputStream:(os_log_t)log registryDict:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_248A1B000, log, OS_LOG_TYPE_ERROR, "%@:%@: Exclaves injection buffer name is not supplied.", buf, 0x16u);
}

@end