@interface ASDTIOA2Stream
- (ASDTIOA2InjectionStream)injectionStream;
- (ASDTIOA2Stream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5;
- (ASDTIOA2Stream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5 registryDict:(id)a6;
- (BOOL)_mapIOBuffer;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)deviceChangedToSamplingRate:(double)a3;
- (BOOL)marked;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (BOOL)usesIsolatedIO;
- (NSDictionary)isolatedIOFormatMap;
- (char)ioBuffer;
- (id)exclavesReadInput;
- (id)physicalFormat;
- (id)readIsolatedInputBlock;
- (id)updateClientPositionBlock;
- (int)pmPrepareStream:(int)a3;
- (int)pmPrewarmStream:(int)a3;
- (unsigned)ioBufferSize;
- (unsigned)userClientID;
- (void)_releaseIOBuffer;
- (void)asyncDeviceChangedToSamplingRate:(double)a3;
- (void)dealloc;
- (void)ioThreadStateChange:(id)a3;
- (void)setInjectionStream:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsolatedIOFormatMap:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setPhysicalFormat:(id)a3;
- (void)setPhysicalFormat:(id)a3 alwaysNotify:(BOOL)a4;
- (void)setPhysicalFormats:(id)a3;
- (void)setUserClientID:(unsigned int)a3;
- (void)setUsesIsolatedIO:(BOOL)a3;
- (void)updateActiveState;
@end

@implementation ASDTIOA2Stream

- (ASDTIOA2Stream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5 registryDict:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ASDTIOA2Stream;
  v12 = [(ASDTExclavesStream *)&v17 initWithDirection:v7 withDevice:v10];
  v13 = v12;
  if (v12)
  {
    v12->_userClientID = v8;
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v8);
    [(ASDStream *)v13 setStreamName:v14];

    if (![(ASDTIOA2Stream *)v13 synchronizeWithRegistryDictionary:v11])
    {
      v15 = 0;
      goto LABEL_6;
    }
    [(ASDTIOA2Stream *)v13 setIsActive:1];
  }
  v15 = v13;
LABEL_6:

  return v15;
}

- (ASDTIOA2Stream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [v8 _streamInfoForStream:v6];
  id v10 = [(ASDTIOA2Stream *)self initWithIOA2Device:v8 userClientID:v6 direction:v5 registryDict:v9];

  return v10;
}

- (void)dealloc
{
  [(ASDTIOA2Stream *)self _releaseIOBuffer];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2Stream;
  [(ASDTIOA2Stream *)&v3 dealloc];
}

- (void)updateActiveState
{
  if ([(ASDStream *)self isActive])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [(ASDTIOA2Stream *)self injectionStream];
    uint64_t v3 = [v4 isActive];
  }
  id v5 = [(ASDTIOA2Stream *)self ioa2Device];
  [v5 _setStreamActive:v3 streamUCID:self->_userClientID];
}

- (void)setIsActive:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2Stream;
  [(ASDStream *)&v4 setIsActive:a3];
  [(ASDTIOA2Stream *)self updateActiveState];
}

- (BOOL)_mapIOBuffer
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(ASDStream *)self direction] == 1768845428
    && [(ASDTExclavesStream *)self usesExclavesAudioBuffer])
  {
    uint64_t v3 = [(ASDTIOA2Stream *)self physicalFormat];
    uint64_t v4 = [(id)v3 bytesPerFrame] << 12;

    LOBYTE(v3) = [(ASDTExclavesStream *)self allocExclavesAudioBuffer:v4];
    self->_unsigned int ioBufferByteSize = [(ASDTExclavesStream *)self exclavesBufferSize];
    if ((v3 & 1) == 0)
    {
LABEL_4:
      id v5 = ASDTIOA2LogType();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v14 = [(ASDTStream *)self device];
        v15 = [v14 deviceUID];
        v16 = [(ASDStream *)self streamName];
        int v17 = 138412546;
        v18 = v15;
        __int16 v19 = 2112;
        v20 = v16;
        _os_log_error_impl(&dword_248A1B000, v5, OS_LOG_TYPE_ERROR, "%@:%@: Failed to map IO buffer", (uint8_t *)&v17, 0x16u);
      }
      BOOL v6 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = [(ASDTIOA2Stream *)self ioa2Device];
    char v8 = [v7 _mapIOBuffer:&self->_ioBuffer ofSize:&self->_ioBufferByteSize forStream:self->_userClientID];

    if ((v8 & 1) == 0) {
      goto LABEL_4;
    }
  }
  id v5 = ASDTIOA2LogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(ASDTStream *)self device];
    id v10 = [v9 deviceUID];
    id v11 = [(ASDStream *)self streamName];
    unsigned int ioBufferByteSize = self->_ioBufferByteSize;
    int v17 = 138412802;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    __int16 v21 = 1024;
    unsigned int v22 = ioBufferByteSize;
    _os_log_impl(&dword_248A1B000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: Buffer mapped with size %d", (uint8_t *)&v17, 0x1Cu);
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (void)_releaseIOBuffer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ASDTExclavesStream *)self exclavesAudioBuffer];
  BOOL v4 = v3 != 0;
  if (v3) {
    [(ASDTExclavesStream *)self freeExclavesAudioBuffer];
  }
  ioBuffer = self->_ioBuffer;
  if (ioBuffer)
  {
    self->_ioBuffer = 0;
    BOOL v6 = [(ASDTIOA2Stream *)self ioa2Device];
    [v6 _releaseIOBuffer:ioBuffer];

    BOOL v4 = 1;
  }
  if (self->_ioBufferByteSize) {
    self->_unsigned int ioBufferByteSize = 0;
  }
  if (v4)
  {
    uint64_t v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [(ASDTStream *)self device];
      v9 = [v8 deviceUID];
      id v10 = [(ASDStream *)self streamName];
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_248A1B000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Buffer released", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v42, v5);
  v33 = v5;

  CFTypeRef v32 = v42;
  if (v42)
  {
    [(ASDStream *)self setStartingChannel:ASDT::IOA2UserClient::GetStreamInfo_StartingChannel((const __CFDictionary **)&v42, v6)];
    [(ASDStream *)self setTerminalType:ASDT::IOA2UserClient::GetStreamInfo_TerminalType((const __CFDictionary **)&v42, v7)];
    [(ASDTIOA2Stream *)self setUsesIsolatedIO:ASDT::IOA2UserClient::GetStreamInfo_UsesIsolatedIO((ASDT::IOA2UserClient *)&v42, v8)];
    if ([(ASDTIOA2Stream *)self usesIsolatedIO])
    {
      uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    }
    else
    {
      uint64_t v9 = 0;
    }
    v35 = v9;
    v36 = objc_msgSend(MEMORY[0x263EFF980], "array", v32, v33);
    ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats((const __CFDictionary **)&v42, buf);
    id v14 = *(id *)buf;
    uint64_t v15 = v14;
    if (v14) {
      CFRelease(v14);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          __int16 v21 = v20;
          if (v20) {
            CFRetain(v20);
          }
          applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v21);

          if (ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)buf, v22))
          {
            uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamRangedDescription:buf];
            if ([(ASDTIOA2Stream *)self usesIsolatedIO])
            {
              v24 = [v23 asdtEquivalentNativeFloatPacked];
              v25 = [v35 objectForKey:v24];
              BOOL v26 = v25 == 0;

              if (v26)
              {
                [v35 setObject:v23 forKey:v24];
                [v36 addObject:v24];
              }
              else
              {
                v27 = ASDTIOA2LogType();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v34 = [(ASDTStream *)self device];
                  v28 = [v34 deviceUID];
                  v29 = [(ASDStream *)self streamName];
                  *(_DWORD *)v43 = 138412802;
                  v44 = v28;
                  __int16 v45 = 2112;
                  v46 = v29;
                  __int16 v47 = 2112;
                  v48 = v23;
                  _os_log_error_impl(&dword_248A1B000, v27, OS_LOG_TYPE_ERROR, "%@:%@: Duplicate isolated IO format: %@", v43, 0x20u);
                }
              }
            }
            else
            {
              [v36 addObject:v23];
            }
          }
          if (cf) {
            CFRelease(cf);
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v52 count:16];
      }
      while (v17);
    }

    id v30 = [v35 copy];
    [(ASDTIOA2Stream *)self setIsolatedIOFormatMap:v30];

    [(ASDTIOA2Stream *)self setPhysicalFormats:v36];
    id v10 = v35;
  }
  else
  {
    id v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = [(ASDTStream *)self device];
      v12 = [v11 deviceUID];
      __int16 v13 = [(ASDStream *)self streamName];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v12;
      __int16 v50 = 2112;
      v51 = v13;
      _os_log_error_impl(&dword_248A1B000, v10, OS_LOG_TYPE_ERROR, "%@:%@: Bad registry dictionary.", buf, 0x16u);
    }
  }

  if (v42) {
    CFRelease(v42);
  }

  return v32 != 0;
}

- (void)setPhysicalFormats:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDStream *)self physicalFormats];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDTIOA2Stream;
    [(ASDStream *)&v7 setPhysicalFormats:v4];
  }
}

- (id)physicalFormat
{
  uint64_t v3 = [(ASDTIOA2Stream *)self ioa2Device];
  id v4 = [v3 _streamInfoForStream:self->_userClientID];
  id v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v5);

  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  if (ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)v10, v6))
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamBasicDescription:v10];
    if ([(ASDTIOA2Stream *)self usesIsolatedIO])
    {
      uint64_t v8 = [v7 asdtEquivalentNativeFloatPacked];

      objc_super v7 = (void *)v8;
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }

  return v7;
}

- (void)setPhysicalFormat:(id)a3 alwaysNotify:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(ASDTIOA2Stream *)self physicalFormat];
  if ([v6 isEqual:v7])
  {
    int v8 = 0;
  }
  else
  {
    uint64_t v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = [(ASDTStream *)self device];
      id v20 = [v19 deviceUID];
      __int16 v21 = [(ASDStream *)self streamName];
      *(_DWORD *)buf = 138412802;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      v31 = v7;
      _os_log_debug_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEBUG, "%@:%@: setPhysicalFormat: Old: %@", buf, 0x20u);
    }
    id v10 = v6;
    if ([(ASDTIOA2Stream *)self usesIsolatedIO])
    {
      uint64_t v11 = [(ASDTIOA2Stream *)self isolatedIOFormatMap];
      uint64_t v12 = [v11 objectForKey:v10];

      id v10 = (id)v12;
      if (!v12)
      {
        id v14 = ASDTIOA2LogType();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          unsigned int v22 = [(ASDTStream *)self device];
          uint64_t v23 = [v22 deviceUID];
          v24 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          v27 = v23;
          __int16 v28 = 2112;
          v29 = v24;
          _os_log_error_impl(&dword_248A1B000, v14, OS_LOG_TYPE_ERROR, "%@:%@: setPhysicalFormat: Failed to identify physical format from map.", buf, 0x16u);
        }
        goto LABEL_16;
      }
    }
    __int16 v13 = [(ASDTIOA2Stream *)self ioa2Device];
    int v8 = [v13 _setCurrentFormat:v10 forStream:self->_userClientID];
  }
  if (a4 || v8)
  {
    v25.receiver = self;
    v25.super_class = (Class)ASDTIOA2Stream;
    [(ASDTStream *)&v25 setPhysicalFormat:v6];
  }
  if (v8)
  {
    id v14 = ASDTIOA2LogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(ASDTStream *)self device];
      id v16 = [v15 deviceUID];
      uint64_t v17 = [(ASDStream *)self streamName];
      uint64_t v18 = [(ASDTIOA2Stream *)self physicalFormat];
      *(_DWORD *)buf = 138412802;
      v27 = v16;
      __int16 v28 = 2112;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_248A1B000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: setPhysicalFormat: New: %@", buf, 0x20u);
    }
LABEL_16:
  }
}

- (void)setPhysicalFormat:(id)a3
{
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDTIOA2Stream *)self physicalFormat];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    objc_super v7 = [(ASDTStream *)self device];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__ASDTIOA2Stream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_265246248;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v7 requestConfigurationChange:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __39__ASDTIOA2Stream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPhysicalFormat:*(void *)(a1 + 32) alwaysNotify:1];

  id v12 = objc_loadWeakRetained(v2);
  uint64_t v3 = [v12 device];
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
  v3.super_class = (Class)ASDTIOA2Stream;
  [(ASDStream *)&v3 deviceChangedToSamplingRate:a3];
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  objc_initWeak(&location, self);
  double v5 = [(ASDTIOA2Stream *)self ioa2Device];
  double v6 = [v5 concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ASDTIOA2Stream_deviceChangedToSamplingRate___block_invoke;
  block[3] = &unk_265246270;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  dispatch_async(v6, block);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return 1;
}

void __46__ASDTIOA2Stream_deviceChangedToSamplingRate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained asyncDeviceChangedToSamplingRate:*(double *)(a1 + 40)];
}

- (char)ioBuffer
{
  return self->_ioBuffer;
}

- (unsigned)ioBufferSize
{
  return self->_ioBufferByteSize;
}

- (id)updateClientPositionBlock
{
  unsigned int v3 = [(ASDStream *)self direction];
  double v4 = [(ASDTIOA2Stream *)self ioa2Device];
  double v5 = v4;
  if (v3 == 1768845428) {
    [v4 updateClientInputPositionBlock];
  }
  else {
  double v6 = [v4 updateClientOutputPositionBlock];
  }
  double v7 = (void *)MEMORY[0x24C588C90]();

  return v7;
}

- (int)pmPrewarmStream:(int)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)ASDTIOA2Stream;
  int result = -[ASDTStream pmPrewarmStream:](&v14, sel_pmPrewarmStream_);
  if (a3 == 1970304877 && !result)
  {
    if ([(ASDTIOA2Stream *)self _mapIOBuffer])
    {
      double v6 = [(ASDTIOA2Stream *)self ioa2Device];
      double v7 = (ASDT::IOUserClient *)[v6 ioa2UserClient];

      double v8 = ASDTIOA2LogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = [(ASDTStream *)self device];
        id v10 = [v9 deviceUID];
        id v11 = [(ASDStream *)self streamName];
        if (v7)
        {
          int UserClientRefCount = ASDT::IOUserClient::GetUserClientRefCount(v7);
          int ConnectionRefCount = ASDT::IOUserClient::GetConnectionRefCount(v7);
        }
        else
        {
          int UserClientRefCount = -1;
          int ConnectionRefCount = -1;
        }
        *(_DWORD *)buf = 138413058;
        id v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        __int16 v19 = 1024;
        int v20 = UserClientRefCount;
        __int16 v21 = 1024;
        int v22 = ConnectionRefCount;
        _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: Clearing buffer; user client refs: %u, connection refs: %u",
          buf,
          0x22u);
      }
      [(ASDTExclavesStream *)self clearBuffer];
      return 0;
    }
    else
    {
      return 1852990585;
    }
  }
  return result;
}

- (int)pmPrepareStream:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1685090418) {
    [(ASDTIOA2Stream *)self _releaseIOBuffer];
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2Stream;
  return [(ASDTExclavesStream *)&v6 pmPrepareStream:v3];
}

- (void)ioThreadStateChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 asdtIOThreadChangeIsolatedUseCase];
  if ([(ASDTIOA2Stream *)self usesIsolatedIO]
    && [(ASDStream *)self direction] == 1768845428
    && !v5)
  {
    int v6 = [v4 asdtIOThreadUseCaseIsFirstOrWasLast];
    int v7 = [v4 asdtIOThreadChangeEvent];
    if (v7 == 1937010544)
    {
      if (v6)
      {
        id v11 = [(ASDTIOA2Stream *)self ioa2Device];
        objc_msgSend(v11, "_teardownForIsolatedIO:forUseCase:", self->_userClientID, -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"));
      }
      goto LABEL_18;
    }
    if (v7 == 1937011316)
    {
      if ([(ASDStream *)self isActive])
      {
        if (!v6) {
          goto LABEL_18;
        }
        double v8 = [(ASDTIOA2Stream *)self ioa2Device];
        char v9 = objc_msgSend(v8, "_setupForIsolatedIO:forUseCase:withIOFrameBufferSize:", self->_userClientID, -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"), 0);

        if (v9) {
          goto LABEL_18;
        }
        id v10 = ASDTIOA2LogType();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = [(ASDTStream *)self device];
          id v16 = [v15 deviceUID];
          __int16 v17 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          __int16 v21 = v16;
          __int16 v22 = 2112;
          uint64_t v23 = v17;
          _os_log_error_impl(&dword_248A1B000, v10, OS_LOG_TYPE_ERROR, "%@:%@: Failed to setup non-secure input path.", buf, 0x16u);
        }
      }
      else
      {
        id v10 = ASDTIOA2LogType();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v12 = [(ASDTStream *)self device];
          id v13 = [v12 deviceUID];
          objc_super v14 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          __int16 v21 = v13;
          __int16 v22 = 2112;
          uint64_t v23 = v14;
          _os_log_debug_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEBUG, "%@:%@: Stream not active for ioThread start.", buf, 0x16u);
        }
      }
    }
LABEL_18:
    v18.receiver = self;
    v18.super_class = (Class)ASDTIOA2Stream;
    [(ASDTExclavesStream *)&v18 ioThreadStateChange:v4];
    goto LABEL_19;
  }
  v19.receiver = self;
  v19.super_class = (Class)ASDTIOA2Stream;
  [(ASDTExclavesStream *)&v19 ioThreadStateChange:v4];
LABEL_19:
}

- (id)exclavesReadInput
{
  uint64_t v3 = [(ASDTIOA2Stream *)self physicalFormat];
  int v4 = [v3 bytesPerFrame];

  unsigned int v5 = [(ASDTIOA2Stream *)self userClientID];
  unint64_t v6 = [(ASDTStream *)self isolatedUseCaseID];
  int v7 = [(ASDTIOA2Stream *)self updateClientPositionBlock];
  [(ASDTStream *)self setUpdateClientPositionCopy:v7];

  double v8 = [(ASDTStream *)self getUpdateClientPositionUnretainedAddress];
  char v9 = [(ASDTExclavesStream *)self exclavesAudioBuffer];
  if (v9)
  {
    id v10 = v9;
    id v11 = [(ASDTIOA2Stream *)self ioa2Device];
    uint64_t v12 = [v11 ioa2UserClient];

    if (v12)
    {
      id v13 = [(ASDTExclavesStream *)self exclavesSensorManager];
      uint64_t v14 = [v13 statusTracker];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __35__ASDTIOA2Stream_exclavesReadInput__block_invoke;
      v16[3] = &__block_descriptor_80_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
      v16[4] = v12;
      v16[5] = v6;
      unsigned int v17 = v5;
      int v18 = v4;
      v16[6] = v10;
      v16[7] = v14;
      v16[8] = v8;
      char v9 = (void *)MEMORY[0x24C588C90](v16);
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

uint64_t __35__ASDTIOA2Stream_exclavesReadInput__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_1();
  }
  if (!a4) {
    __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_2();
  }
  uint64_t v6 = (unint64_t)*(double *)(a3 + 80);
  if (ASDT::IOA2UserClient::DoIsolatedIO(*(ASDT::IOA2UserClient **)(a1 + 32), *(_DWORD *)(a1 + 72), *(void *)(a1 + 40), 0x72656164u, a2, v6, *(void *)(a3 + 88)))
  {
    int v15 = 0;
    int v7 = (ASDTTime *)ASDT::Exclaves::AudioBuffer::Read();
    uint64_t v8 = (uint64_t)v7;
    if (*(void *)(a1 + 56))
    {
      int v9 = v15;
      ASDTTime::machAbsoluteTime(v12, v7);
      int v13 = v9;
      int v14 = 3;
      ASDT::Exclaves::StatusTracker::Push();
    }
  }
  else
  {
    uint64_t v8 = 560227702;
  }
  uint64_t v10 = **(void **)(a1 + 64);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v6 + a2);
  }
  return v8;
}

- (id)readIsolatedInputBlock
{
  unsigned int v3 = [(ASDTIOA2Stream *)self userClientID];
  int v4 = [(ASDTIOA2Stream *)self ioa2Device];
  uint64_t v5 = [v4 ioa2UserClient];

  if (v5 && [(ASDTIOA2Stream *)self usesIsolatedIO])
  {
    uint64_t v6 = [(ASDTStream *)self getUpdateClientPositionUnretainedAddress];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke;
    v9[3] = &__block_descriptor_52_e187_i28__0Q8I16r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_20l;
    unsigned int v10 = v3;
    void v9[4] = v5;
    v9[5] = v6;
    int v7 = (void *)MEMORY[0x24C588C90](v9);
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

uint64_t __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  if (!a4) {
    __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke_cold_1();
  }
  uint64_t v6 = (unint64_t)*(double *)(a4 + 80);
  int v7 = ASDT::IOA2UserClient::DoIsolatedIO(*(ASDT::IOA2UserClient **)(a1 + 32), *(_DWORD *)(a1 + 48), a2, 0x72656164u, a3, v6, *(void *)(a4 + 88));
  uint64_t v8 = **(void **)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v6 + a3);
  }
  if (v7) {
    return 0;
  }
  else {
    return 560227702;
  }
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (BOOL)usesIsolatedIO
{
  return self->_usesIsolatedIO;
}

- (void)setUsesIsolatedIO:(BOOL)a3
{
  self->_usesIsolatedIO = a3;
}

- (ASDTIOA2InjectionStream)injectionStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_injectionStream);
  return (ASDTIOA2InjectionStream *)WeakRetained;
}

- (void)setInjectionStream:(id)a3
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

- (NSDictionary)isolatedIOFormatMap
{
  return self->_isolatedIOFormatMap;
}

- (void)setIsolatedIOFormatMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolatedIOFormatMap, 0);
  objc_destroyWeak((id *)&self->_injectionStream);
}

void __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_1()
{
}

void __35__ASDTIOA2Stream_exclavesReadInput__block_invoke_cold_2()
{
}

void __40__ASDTIOA2Stream_readIsolatedInputBlock__block_invoke_cold_1()
{
}

@end