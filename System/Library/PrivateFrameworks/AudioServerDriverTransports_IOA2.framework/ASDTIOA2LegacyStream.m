@interface ASDTIOA2LegacyStream
- (ASDTIOA2LegacyStream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)marked;
- (char)ioBuffer;
- (id)physicalFormat;
- (id)updateClientPositionBlock;
- (unsigned)ioBufferSize;
- (unsigned)userClientID;
- (void)_buildFormatList;
- (void)_getStartingChannel;
- (void)_mapIOBuffer;
- (void)_pushActiveState;
- (void)_releaseIOBuffer;
- (void)_synchronizeWithHardware;
- (void)setMarked:(BOOL)a3;
- (void)setPhysicalFormat:(id)a3;
@end

@implementation ASDTIOA2LegacyStream

- (ASDTIOA2LegacyStream)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 direction:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDTIOA2LegacyStream;
  v9 = [(ASDTStream *)&v12 initWithDirection:v5 withDevice:v8];
  v10 = v9;
  if (v9)
  {
    v9->_userClientID = a4;
    [(ASDStream *)v9 setIsActive:1];
    [(ASDTIOA2LegacyStream *)v10 _synchronizeWithHardware];
  }

  return v10;
}

- (void)_pushActiveState
{
  id v3 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  objc_msgSend(v3, "_setStreamActive:streamUCID:", -[ASDStream isActive](self, "isActive"), self->_userClientID);
}

- (void)_mapIOBuffer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  [v3 _mapIOBuffer:&self->_ioBuffer ofSize:&self->_ioBufferByteSize forStream:self->_userClientID];

  v4 = ASDTIOA2LogType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int ioBufferByteSize = self->_ioBufferByteSize;
    v6[0] = 67109120;
    v6[1] = ioBufferByteSize;
    _os_log_impl(&dword_248A1B000, v4, OS_LOG_TYPE_DEFAULT, "Buffer mapped with size %d", (uint8_t *)v6, 8u);
  }
}

- (void)_releaseIOBuffer
{
  id v3 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  [v3 _releaseIOBuffer:self->_ioBuffer forStream:self->_userClientID];

  v4 = ASDTIOA2LogType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_248A1B000, v4, OS_LOG_TYPE_DEFAULT, "Buffer released", v5, 2u);
  }

  self->_ioBuffer = 0;
  self->_unsigned int ioBufferByteSize = 0;
}

- (void)_synchronizeWithHardware
{
  [(ASDTIOA2LegacyStream *)self _getStartingChannel];
  [(ASDTIOA2LegacyStream *)self _buildFormatList];
}

- (void)_getStartingChannel
{
  id v3 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  unsigned int v4 = [v3 _streamStartingChannel:self->_userClientID];

  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  [(ASDStream *)self setStartingChannel:v5];
}

- (void)_buildFormatList
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  unsigned int v4 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    [v3 _availableFormatsForStream:self->_userClientID];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (ASDT::IOA2UCDevice::ConstructASRDFromDictionary(*(ASDT::IOA2UCDevice **)(*((void *)&v12 + 1) + 8 * v9), (const __CFDictionary *)v11, v6))
          {
            v10 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamRangedDescription:v11];
            [v4 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  [(ASDStream *)self setPhysicalFormats:v4];
}

- (id)physicalFormat
{
  id v3 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  unsigned int v4 = v3;
  if (v3)
  {
    [v3 scopedLock];
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    objc_msgSend(v4, "_currentFormatForStream:", self->_userClientID, 0, 0, 0, 0, 0);
  }
  else
  {
    v10 = 0;
    uint64_t v11 = 0;
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamBasicDescription:&v7];
  if ((_BYTE)v11) {
    std::recursive_mutex::unlock(v10);
  }

  return v5;
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDTIOA2LegacyStream *)self ioa2Device];
  if (v4)
  {
    [v4 audioStreamBasicDescription];
  }
  else
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  [v5 _setCurrentFormat:v6 forStream:self->_userClientID];
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDTIOA2LegacyStream *)self physicalFormat];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [(ASDTStream *)self device];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__ASDTIOA2LegacyStream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_265246248;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [v7 requestConfigurationChange:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __45__ASDTIOA2LegacyStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPhysicalFormat:v2];

  id v13 = objc_loadWeakRetained(v3);
  id v4 = [v13 device];
  [v4 samplingRate];
  double v6 = v5;
  [*(id *)(a1 + 32) sampleRate];
  double v8 = v7;

  if (v6 != v8)
  {
    [*(id *)(a1 + 32) sampleRate];
    double v10 = v9;
    id v14 = objc_loadWeakRetained(v3);
    id v11 = [v14 device];
    [v11 setSamplingRate:v10];
  }
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
  id v4 = [(ASDTIOA2LegacyStream *)self ioa2Device];
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

- (BOOL)marked
{
  return self->_marked;
}

- (void)setMarked:(BOOL)a3
{
  self->_marked = a3;
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

@end