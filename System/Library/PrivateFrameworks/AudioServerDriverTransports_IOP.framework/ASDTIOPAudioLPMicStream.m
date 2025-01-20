@interface ASDTIOPAudioLPMicStream
+ (id)ioServiceDependenciesForConfig:(id)a3;
- (ASDTIOPAudioIOBufferDevice)ioBufferDevice;
- (ASDTIOPAudioIsolatedIOBufferDevice)isolatedIOBufferDevice;
- (ASDTIOPAudioLPMicStream)initWithConfig:(id)a3 withDevice:(id)a4;
- (BOOL)mapIOBuffer;
- (BOOL)updateFromStreamDescription:(StreamDescription *)a3;
- (char)ioBuffer;
- (id)exclavesReadInput;
- (id)readIsolatedInputBlock;
- (int)pmIdleStream:(int)a3;
- (int)pmPrepareStream:(int)a3;
- (int)pmPrewarmStream:(int)a3;
- (int)setupIsolatedIOForUseCase:(unint64_t)a3 withFrameSize:(unsigned int)a4;
- (int)teardownIsolatedIOForUseCase:(unint64_t)a3;
- (unsigned)ioBufferSize;
- (void)ioThreadStateChange:(id)a3;
- (void)releaseIOBuffer;
- (void)setIoBufferDevice:(id)a3;
- (void)setIsolatedIOBufferDevice:(id)a3;
- (void)startStream;
- (void)stopStream;
@end

@implementation ASDTIOPAudioLPMicStream

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 asdtExclavesBufferName];
  v5 = [v3 asdtServiceID];
  v6 = off_265247320;
  if (v4) {
    v6 = off_265247330;
  }
  uint64_t v7 = [(__objc2_class *)*v6 dependencyForID:v5 andConfiguration:v3];
  v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v7;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ASDTIOPAudioLPMicStream)initWithConfig:(id)a3 withDevice:(id)a4
{
  v68[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v6 mutableCopy];
  v67[0] = *MEMORY[0x263F28D40];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = *MEMORY[0x263F28D28];
  uint64_t v12 = *MEMORY[0x263F28CA8];
  v68[0] = v10;
  v68[1] = v12;
  uint64_t v13 = *MEMORY[0x263F28CF0];
  v67[1] = v11;
  v67[2] = v13;
  v68[2] = @"RX";
  v67[3] = *MEMORY[0x263F28D30];
  uint64_t v14 = *MEMORY[0x263F28CE0];
  v64[0] = *MEMORY[0x263F28CD8];
  v64[1] = v14;
  uint64_t v15 = *MEMORY[0x263F28CA0];
  v65[0] = &unk_26FCB4458;
  v65[1] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
  v66 = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
  v67[4] = *MEMORY[0x263F28D38];
  v68[3] = v17;
  v68[4] = &unk_26FCB4470;
  v18 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:5];
  [v8 asdtAddMissingEntriesFromDictionary:v18];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [v6 asdtServiceID];
    uint64_t v20 = [v6 asdtExclavesBufferName];
    v58 = (void *)v20;
    v21 = 0;
    if (v19)
    {
      if (v20)
      {
        uint64_t v22 = +[ASDTIOServiceManager matchedIOServiceForID:v19];
      }
      else
      {
        uint64_t v25 = +[ASDTIOServiceManager matchedIOServiceForID:v19];
        uint64_t v22 = 0;
        v21 = (void *)v25;
      }
      uint64_t v24 = (uint64_t)v21;
      v21 = (void *)v22;
      if (!(v24 | v22))
      {
        uint64_t v24 = ASDTIOPLogType();
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          [(ASDTIOPAudioLPMicStream *)v29 initWithConfig:buf withDevice:(os_log_t)v24];
        }
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
    v59.receiver = self;
    v59.super_class = (Class)ASDTIOPAudioLPMicStream;
    v26 = [(ASDTExclavesStream *)&v59 initWithConfig:v8 withDevice:v7];
    self = v26;
    if (!v26) {
      goto LABEL_39;
    }
    [(ASDTIOPAudioLPMicStream *)v26 setIoBufferDevice:v24];
    [(ASDTIOPAudioLPMicStream *)self setIsolatedIOBufferDevice:v21];
    v27 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];
    if (v27)
    {
    }
    else
    {
      v30 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
      BOOL v31 = v30 == 0;

      if (v31)
      {
        v43 = ASDTIOPLogType();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v53 = [(ASDTStream *)self device];
          v57 = [v53 deviceUID];
          v54 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          id v61 = v57;
          __int16 v62 = 2112;
          v63 = v54;
          _os_log_error_impl(&dword_248A68000, v43, OS_LOG_TYPE_ERROR, "%@:%@: No (Isolated)IOBuffer defined for this stream.", buf, 0x16u);
        }
        goto LABEL_35;
      }
    }
    v32 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];
    if (!v32
      || ([(ASDTIOPAudioLPMicStream *)self ioBufferDevice],
          v33 = objc_claimAutoreleasedReturnValue(),
          char v34 = [v33 open],
          v33,
          v32,
          (v34 & 1) != 0))
    {
      v35 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
      BOOL v36 = v35 == 0;

      if (!v36)
      {
        v37 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
        char v38 = [v37 open];

        if (v38)
        {
          if (![(ASDTStream *)self isolatedUseCaseID])
          {
            id v39 = [v19 identifier];
            uint64_t v40 = [v39 UTF8String];
            if (v40)
            {
              uint64_t v41 = 0;
              unsigned int v42 = 0;
              do
              {
                if (!*(unsigned char *)(v40 + v41)) {
                  break;
                }
                unsigned int v42 = *(unsigned __int8 *)(v40 + v41++) | (v42 << 8);
              }
              while (v41 != 4);
            }
            else
            {
              unsigned int v42 = 0;
            }
            [(ASDTStream *)self setIsolatedUseCaseID:v42];
          }
          goto LABEL_39;
        }
        v43 = ASDTIOPLogType();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v51 = [(ASDTStream *)self device];
          v56 = [v51 deviceUID];
          v52 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          id v61 = v56;
          __int16 v62 = 2112;
          v63 = v52;
          _os_log_error_impl(&dword_248A68000, v43, OS_LOG_TYPE_ERROR, "%@:%@: Failed to open connection to IsolatedIOBuffer user client", buf, 0x16u);
        }
        goto LABEL_35;
      }
LABEL_39:
      self = self;

      v23 = self;
      goto LABEL_40;
    }
    v43 = ASDTIOPLogType();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v49 = [(ASDTStream *)self device];
      v55 = [v49 deviceUID];
      v50 = [(ASDStream *)self streamName];
      *(_DWORD *)buf = 138412546;
      id v61 = v55;
      __int16 v62 = 2112;
      v63 = v50;
      _os_log_error_impl(&dword_248A68000, v43, OS_LOG_TYPE_ERROR, "%@:%@: Failed to open connection to IOBuffer user client", buf, 0x16u);
    }
LABEL_35:

LABEL_36:
    v23 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v19 = ASDTIOPLogType();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    *(_DWORD *)buf = 138412546;
    id v61 = v45;
    __int16 v62 = 2112;
    v63 = v47;
    _os_log_error_impl(&dword_248A68000, v19, OS_LOG_TYPE_ERROR, "%@: Bad parent device class: %@", buf, 0x16u);
  }
  v23 = 0;
LABEL_41:

  return v23;
}

- (BOOL)updateFromStreamDescription:(StreamDescription *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamBasicDescription:a3];
  id v6 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];

  if (v6)
  {
    uint64_t v7 = [v5 asdtEquivalentNativeFloatPacked];

    v5 = (void *)v7;
  }
  if (v5)
  {
    [(ASDStream *)self setLatency:a3->var9];
    [(ASDTStream *)self setSafetyOffset:a3->var10];
    v17 = v5;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    [(ASDStream *)self setPhysicalFormats:v8];

    [(ASDTStream *)self setPhysicalFormat:v5];
    v9 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
    if (!v9)
    {
      char v12 = 1;
      goto LABEL_11;
    }
    v10 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
    uint64_t v11 = [(ASDTIOPAudioLPMicStream *)self parent];
    char v12 = objc_msgSend(v10, "setStreamDescription:withBufferFrameSize:", a3, objc_msgSend(v11, "ioBufferSizeFrames"));
  }
  else
  {
    v9 = ASDTIOPLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(ASDTStream *)self device];
      uint64_t v15 = [v14 deviceUID];
      v16 = [(ASDStream *)self streamName];
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_248A68000, v9, OS_LOG_TYPE_ERROR, "%@:%@: Failed to allocate stream format.", buf, 0x16u);
    }
    char v12 = 0;
  }

LABEL_11:
  return v12;
}

- (char)ioBuffer
{
  return self->_ioBuffer;
}

- (unsigned)ioBufferSize
{
  return self->_ioBufferSize;
}

- (BOOL)mapIOBuffer
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [(ASDTIOPAudioLPMicStream *)self parent];
  int v4 = [v3 ioBufferSizeFrames];

  v5 = [(ASDTExclavesStream *)self exclavesBufferName];

  if (v5)
  {
    id v6 = [(ASDStream *)self physicalFormat];
    uint64_t v7 = [v6 bytesPerFrame] << 12;

    if ([(ASDTExclavesStream *)self allocExclavesAudioBuffer:v7])
    {
      self->_ioBuffer = 0;
      self->_ioBufferSize = v7;
      return 1;
    }
    v16 = ASDTIOPLogType();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [(ASDTStream *)self device];
      v18 = [v17 deviceUID];
      v19 = [(ASDStream *)self streamName];
      int v27 = 138412546;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_error_impl(&dword_248A68000, v16, OS_LOG_TYPE_ERROR, "%@:%@: Failed to map exclaves named buffer", (uint8_t *)&v27, 0x16u);
    }
LABEL_16:

    return 0;
  }
  v9 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];

  if (v9)
  {
    v10 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];
    self->_ioBuffer = (char *)[v10 mapIOBuffer];

    if (self->_ioBuffer)
    {
      uint64_t v11 = [(ASDStream *)self physicalFormat];
      int v12 = [v11 bytesPerFrame];

      uint64_t v13 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];
      unsigned int v14 = [v13 ioBufferSize];
      unsigned int v15 = v12 * v4;

      if (v14 >= v12 * v4)
      {
        self->_ioBufferSize = v15;
        return 1;
      }
      v16 = ASDTIOPLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v23 = [(ASDTStream *)self device];
        uint64_t v24 = [v23 deviceUID];
        uint64_t v25 = [(ASDStream *)self streamName];
        v26 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];
        int v27 = 138413058;
        v28 = v24;
        __int16 v29 = 2112;
        v30 = v25;
        __int16 v31 = 1024;
        int v32 = [v26 ioBufferSize];
        __int16 v33 = 1024;
        unsigned int v34 = v15;
        _os_log_error_impl(&dword_248A68000, v16, OS_LOG_TYPE_ERROR, "%@:%@: Mapped IO buffer is too small: %u < %u", (uint8_t *)&v27, 0x22u);
      }
    }
    else
    {
      v16 = ASDTIOPLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = [(ASDTStream *)self device];
        v21 = [v20 deviceUID];
        uint64_t v22 = [(ASDStream *)self streamName];
        int v27 = 138412546;
        v28 = v21;
        __int16 v29 = 2112;
        v30 = v22;
        _os_log_error_impl(&dword_248A68000, v16, OS_LOG_TYPE_ERROR, "%@:%@: Failed to map IO buffer", (uint8_t *)&v27, 0x16u);
      }
    }
    goto LABEL_16;
  }
  return 0;
}

- (void)releaseIOBuffer
{
  id v3 = [(ASDTExclavesStream *)self exclavesBufferName];

  if (v3) {
    [(ASDTExclavesStream *)self freeExclavesAudioBuffer];
  }
  int v4 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];

  if (v4)
  {
    v5 = [(ASDTIOPAudioLPMicStream *)self ioBufferDevice];
    [v5 releaseIOBuffer];

    self->_ioBuffer = 0;
  }
  self->_ioBufferSize = 0;
}

- (int)pmPrewarmStream:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOPAudioLPMicStream;
  int result = -[ASDTStream pmPrewarmStream:](&v9, sel_pmPrewarmStream_);
  if (a3 == 1970304877 && !result)
  {
    id v6 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];

    if (v6
      && ([(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 setupIO],
          v7,
          (v8 & 1) == 0))
    {
      return 1852990585;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)pmPrepareStream:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1685090418)
  {
    id v6 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];

    if (v6)
    {
      uint64_t v7 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
      [v7 teardownIO];
    }
  }
  else if (a3 == 1970303090 && ![(ASDTIOPAudioLPMicStream *)self mapIOBuffer])
  {
    return 561214578;
  }
  v8.receiver = self;
  v8.super_class = (Class)ASDTIOPAudioLPMicStream;
  return [(ASDTExclavesStream *)&v8 pmPrepareStream:v3];
}

- (int)pmIdleStream:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1684628588) {
    [(ASDTIOPAudioLPMicStream *)self releaseIOBuffer];
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOPAudioLPMicStream;
  return [(ASDTExclavesStream *)&v6 pmIdleStream:v3];
}

- (void)ioThreadStateChange:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 asdtIOThreadChangeIsolatedUseCase];
  objc_super v6 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];

  if (v6 && !v5)
  {
    int v7 = [v4 asdtIOThreadUseCaseIsFirstOrWasLast];
    int v8 = [v4 asdtIOThreadChangeEvent];
    if (v8 == 1937010544)
    {
      if (v7)
      {
        int v12 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
        objc_msgSend(v12, "teardownClientIO:", -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"));
      }
      goto LABEL_17;
    }
    if (v8 == 1937011316)
    {
      if ([(ASDStream *)self isActive])
      {
        if (!v7) {
          goto LABEL_17;
        }
        objc_super v9 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
        char v10 = objc_msgSend(v9, "setupClientIO:withBufferFrameSize:", -[ASDTStream isolatedUseCaseID](self, "isolatedUseCaseID"), 0);

        if (v10) {
          goto LABEL_17;
        }
        uint64_t v11 = ASDTIOPLogType();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v16 = [(ASDTStream *)self device];
          v17 = [v16 deviceUID];
          v18 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v17;
          __int16 v23 = 2112;
          uint64_t v24 = v18;
          _os_log_error_impl(&dword_248A68000, v11, OS_LOG_TYPE_ERROR, "%@:%@: Failed to setup non-secure input path.", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v11 = ASDTIOPLogType();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [(ASDTStream *)self device];
          unsigned int v14 = [v13 deviceUID];
          unsigned int v15 = [(ASDStream *)self streamName];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v14;
          __int16 v23 = 2112;
          uint64_t v24 = v15;
          _os_log_debug_impl(&dword_248A68000, v11, OS_LOG_TYPE_DEBUG, "%@:%@: Stream not active for ioThread start.", buf, 0x16u);
        }
      }
    }
LABEL_17:
    v19.receiver = self;
    v19.super_class = (Class)ASDTIOPAudioLPMicStream;
    [(ASDTExclavesStream *)&v19 ioThreadStateChange:v4];
    goto LABEL_18;
  }
  v20.receiver = self;
  v20.super_class = (Class)ASDTIOPAudioLPMicStream;
  [(ASDTExclavesStream *)&v20 ioThreadStateChange:v4];
LABEL_18:
}

- (void)startStream
{
  [(ASDTExclavesStream *)self clearBuffer];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOPAudioLPMicStream;
  [(ASDStream *)&v3 startStream];
}

- (void)stopStream
{
  v2.receiver = self;
  v2.super_class = (Class)ASDTIOPAudioLPMicStream;
  [(ASDStream *)&v2 stopStream];
}

- (id)exclavesReadInput
{
  objc_super v3 = [(ASDStream *)self physicalFormat];
  int v4 = [v3 bytesPerFrame];

  unint64_t v5 = [(ASDTStream *)self isolatedUseCaseID];
  objc_super v6 = [(ASDTExclavesStream *)self exclavesAudioBuffer];
  if (v6)
  {
    int v7 = v6;
    int v8 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
    uint64_t v9 = [v8 userClient];

    if (v9)
    {
      char v10 = [(ASDTExclavesStream *)self exclavesSensorManager];
      uint64_t v11 = [v10 statusTracker];

      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke;
      aBlock[3] = &__block_descriptor_68_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
      aBlock[4] = v9;
      aBlock[5] = v5;
      int v14 = v4;
      aBlock[6] = v7;
      aBlock[7] = v11;
      objc_super v6 = _Block_copy(aBlock);
    }
    else
    {
      objc_super v6 = 0;
    }
  }
  return v6;
}

ASDTTime *__44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_1();
  }
  if (!a4) {
    __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_2();
  }
  if (!ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput(*(ASDT::IOPAudio::IsolatedIOBuffer::UserClient **)(a1 + 32))) {
    return (ASDTTime *)560227702;
  }
  int v12 = 0;
  unint64_t v5 = (ASDTTime *)ASDT::Exclaves::AudioBuffer::Read();
  objc_super v6 = v5;
  if (*(void *)(a1 + 56))
  {
    int v7 = v12;
    ASDTTime::machAbsoluteTime(v9, v5);
    int v10 = v7;
    int v11 = 3;
    ASDT::Exclaves::StatusTracker::Push();
  }
  return v6;
}

- (id)readIsolatedInputBlock
{
  objc_super v2 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
  uint64_t v3 = [v2 userClient];

  if (v3)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke;
    aBlock[3] = &__block_descriptor_40_e187_i28__0Q8I16r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_20l;
    aBlock[4] = v3;
    int v4 = _Block_copy(aBlock);
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

uint64_t __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if (!a4) {
    __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke_cold_1();
  }
  if (ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput(*(ASDT::IOPAudio::IsolatedIOBuffer::UserClient **)(a1 + 32))) {
    return 0;
  }
  else {
    return 560227702;
  }
}

- (int)setupIsolatedIOForUseCase:(unint64_t)a3 withFrameSize:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_super v6 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
  LODWORD(v4) = [v6 setupClientIO:a3 withBufferFrameSize:v4];

  if (v4) {
    return 0;
  }
  else {
    return 561214578;
  }
}

- (int)teardownIsolatedIOForUseCase:(unint64_t)a3
{
  uint64_t v4 = [(ASDTIOPAudioLPMicStream *)self isolatedIOBufferDevice];
  LODWORD(a3) = [v4 teardownClientIO:a3];

  if (a3) {
    return 0;
  }
  else {
    return 561214578;
  }
}

- (ASDTIOPAudioIsolatedIOBufferDevice)isolatedIOBufferDevice
{
  return self->_isolatedIOBufferDevice;
}

- (void)setIsolatedIOBufferDevice:(id)a3
{
}

- (ASDTIOPAudioIOBufferDevice)ioBufferDevice
{
  return self->_ioBufferDevice;
}

- (void)setIoBufferDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioBufferDevice, 0);
  objc_storeStrong((id *)&self->_isolatedIOBufferDevice, 0);
}

- (void)initWithConfig:(uint8_t *)buf withDevice:(os_log_t)log .cold.1(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  unint64_t v5 = "Isolated";
  if (a2) {
    unint64_t v5 = (const char *)&unk_248A7B67A;
  }
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl(&dword_248A68000, log, OS_LOG_TYPE_ERROR, "%@: Failed to create %sIOBufferDevice user client", buf, 0x16u);
}

void __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_1()
{
}

void __44__ASDTIOPAudioLPMicStream_exclavesReadInput__block_invoke_cold_2()
{
}

void __49__ASDTIOPAudioLPMicStream_readIsolatedInputBlock__block_invoke_cold_1()
{
}

@end