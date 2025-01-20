@interface ASDTExclavesStream
- (ASDTExclavesSensorManager)exclavesSensorManager;
- (ASDTExclavesStream)initWithConfig:(id)a3 withDevice:(id)a4;
- (ASDTExclavesStream)initWithDirection:(unsigned int)a3 withDevice:(id)a4;
- (BOOL)allocExclavesAudioBuffer:(unsigned int)a3;
- (BOOL)usesExclavesAudioBuffer;
- (NSDictionary)status;
- (NSString)exclavesBufferName;
- (id).cxx_construct;
- (id)exclavesReadInput;
- (id)exclavesWriteMix;
- (id)readInputBlock;
- (id)writeMixBlock;
- (int)pmIdleStream:(int)a3;
- (int)pmPrepareStream:(int)a3;
- (unsigned)exclavesBufferSize;
- (void)clearBuffer;
- (void)exclavesAudioBuffer;
- (void)exclavesInboundBuffer;
- (void)freeExclavesAudioBuffer;
- (void)ioThreadStateChange:(id)a3;
- (void)setExclavesBufferName:(id)a3;
- (void)setExclavesBufferSize:(unsigned int)a3;
- (void)setExclavesSensorManager:(id)a3;
- (void)updateSensorForIOThreadStateChange:(id)a3;
@end

@implementation ASDTExclavesStream

- (ASDTExclavesStream)initWithConfig:(id)a3 withDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDTExclavesStream;
  v8 = [(ASDTStream *)&v11 initWithConfig:v6 withDevice:v7];
  if (v8)
  {
    v9 = [v6 asdtExclavesBufferName];
    [(ASDTExclavesStream *)v8 setExclavesBufferName:v9];
  }
  return v8;
}

- (ASDTExclavesStream)initWithDirection:(unsigned int)a3 withDevice:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASDTExclavesStream;
  return [(ASDTStream *)&v5 initWithDirection:*(void *)&a3 withDevice:a4];
}

- (BOOL)usesExclavesAudioBuffer
{
  v2 = [(ASDTExclavesStream *)self exclavesBufferName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)allocExclavesAudioBuffer:(unsigned int)a3
{
  value = self->_audioBuffer.__ptr_.__value_;
  self->_audioBuffer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AudioBuffer *, SEL))(*(void *)&value->mNumberChannels + 8))(value, a2);
  }
  id v6 = self->_inboundBuffer.__ptr_.__value_;
  self->_inboundBuffer.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(InboundBuffer *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  id v7 = [(ASDTExclavesStream *)self exclavesBufferName];

  if (v7)
  {
    if ([(ASDStream *)self direction] == 1768845428)
    {
      v8 = [(ASDTExclavesStream *)self exclavesBufferName];
      ASDT::Exclaves::AudioBuffer::Create(v8, (const char *)a3);
    }
    v9 = [(ASDTExclavesStream *)self exclavesBufferName];
    ASDT::Exclaves::InboundBuffer::Create(v9, (const char *)a3);
  }
  [(ASDTExclavesStream *)self setExclavesBufferSize:0];
  return 0;
}

- (void)freeExclavesAudioBuffer
{
  value = self->_audioBuffer.__ptr_.__value_;
  self->_audioBuffer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(AudioBuffer *, SEL))(*(void *)&value->mNumberChannels + 8))(value, a2);
  }
  v4 = self->_inboundBuffer.__ptr_.__value_;
  self->_inboundBuffer.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(InboundBuffer *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  [(ASDTExclavesStream *)self setExclavesBufferSize:0];
}

- (void)exclavesAudioBuffer
{
  return self->_audioBuffer.__ptr_.__value_;
}

- (void)exclavesInboundBuffer
{
  return self->_inboundBuffer.__ptr_.__value_;
}

- (int)pmPrepareStream:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASDTExclavesStream;
  unsigned int v5 = -[ASDTStream pmPrepareStream:](&v9, sel_pmPrepareStream_);
  int v6 = v5;
  if (a3 == 1970303090
    && !v5
    && [(ASDStream *)self direction] == 1768845428
    && [(ASDTExclavesStream *)self usesExclavesAudioBuffer])
  {
    id v7 = +[ASDTExclavesSensorManager forMic];
    [(ASDTExclavesStream *)self setExclavesSensorManager:v7];
  }
  return v6;
}

- (int)pmIdleStream:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(ASDTExclavesStream *)self setExclavesSensorManager:0];
  v6.receiver = self;
  v6.super_class = (Class)ASDTExclavesStream;
  return [(ASDTStream *)&v6 pmIdleStream:v3];
}

- (void)ioThreadStateChange:(id)a3
{
  id v4 = a3;
  [(ASDTExclavesStream *)self updateSensorForIOThreadStateChange:v4];
  v5.receiver = self;
  v5.super_class = (Class)ASDTExclavesStream;
  [(ASDTStream *)&v5 ioThreadStateChange:v4];
}

- (void)updateSensorForIOThreadStateChange:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 asdtIOThreadChangeIsolatedUseCase])
  {
    if ([v4 asdtIOThreadUseCaseIsFirstOrWasLast])
    {
      int v5 = [v4 asdtIOThreadChangeEvent];
      objc_super v6 = [(ASDTExclavesStream *)self exclavesSensorManager];
      [v6 ioThreadStartStop:v5 == 1937011316];

      id v7 = [(ASDTExclavesStream *)self exclavesSensorManager];
      uint64_t v8 = [v7 sensor];

      if (v8)
      {
        int v24 = 4;
        int v25 = 0;
        objc_super v9 = [(ASDTStream *)self device];
        char v10 = [v9 getProperty:"SxEatpni" withQualifierSize:0 qualifierData:0 dataSize:&v24 andData:&v25 forClient:0];

        if ((v10 & 1) == 0) {
          int v25 = 1;
        }
        objc_super v11 = [NSString stringWithUTF8String:"com.apple.sensors.mic"];
        int v23 = 0;
        if (v25)
        {
          v12 = [(ASDTStream *)self device];
          v13 = [v12 deviceUID];

          if (v5 == 1937011316)
          {
            v14 = +[ASDTSystemStatus systemStatus];
            [v14 recordingIsEnabled:1 forDeviceUID:v13];

            int v15 = ASDT::Exclaves::Sensor::Start(v8, &v23);
          }
          else
          {
            int v15 = ASDT::Exclaves::Sensor::Stop(v8, &v23);
            v16 = +[ASDTSystemStatus systemStatus];
            [v16 recordingIsEnabled:0 forDeviceUID:v13];
          }
          if (v15)
          {
            v17 = ASDTBaseLogType();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              [(ASDTExclavesStream *)(uint64_t)v11 updateSensorForIOThreadStateChange:v17];
            }
          }
          else
          {
            v17 = ASDTBaseLogType();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = v23;
              v19 = ASDT::Exclaves::Sensor::StatusString(v23);
              v20 = "stop";
              *(_DWORD *)buf = 138413058;
              v27 = v11;
              __int16 v28 = 2080;
              if (v5 == 1937011316) {
                v20 = "start";
              }
              *(void *)v29 = v20;
              *(_WORD *)&v29[8] = 1024;
              *(_DWORD *)&v29[10] = v18;
              __int16 v30 = 2080;
              v31 = v19;
              _os_log_impl(&dword_2489BC000, v17, OS_LOG_TYPE_DEFAULT, "%@: %s : resulting status: [%u] %s", buf, 0x26u);
            }
          }
        }
        else if (ASDT::Exclaves::Sensor::GetStatus(v8, &v23))
        {
          v13 = ASDTBaseLogType();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[ASDTExclavesStream updateSensorForIOThreadStateChange:]((uint64_t)v11, v13);
          }
        }
        else
        {
          v13 = ASDTBaseLogType();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = v23;
            v22 = ASDT::Exclaves::Sensor::StatusString(v23);
            *(_DWORD *)buf = 138412802;
            v27 = v11;
            __int16 v28 = 1024;
            *(_DWORD *)v29 = v21;
            *(_WORD *)&v29[4] = 2080;
            *(void *)&v29[6] = v22;
            _os_log_impl(&dword_2489BC000, v13, OS_LOG_TYPE_DEFAULT, "%@: current status: [%u] %s", buf, 0x1Cu);
          }
        }
      }
    }
  }
}

- (id)exclavesReadInput
{
  uint64_t v3 = [(ASDStream *)self physicalFormat];
  unsigned int v4 = [v3 bytesPerFrame];

  unsigned int v5 = [(ASDTExclavesStream *)self ioBufferSize];
  objc_super v6 = [(ASDTExclavesStream *)self exclavesSensorManager];
  uint64_t v7 = [v6 statusTracker];

  uint64_t v8 = [(ASDTStream *)self updateClientPositionBlock];
  [(ASDTStream *)self setUpdateClientPositionCopy:v8];

  objc_super v9 = [(ASDTStream *)self getUpdateClientPositionUnretainedAddress];
  value = self->_audioBuffer.__ptr_.__value_;
  if (value)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __39__ASDTExclavesStream_exclavesReadInput__block_invoke;
    v13[3] = &__block_descriptor_64_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
    unsigned int v14 = v4;
    int v15 = v5 / v4;
    v13[4] = value;
    v13[5] = v9;
    v13[6] = v7;
    objc_super v11 = _Block_copy(v13);
  }
  else
  {
    objc_super v11 = 0;
  }
  return v11;
}

uint64_t __39__ASDTExclavesStream_exclavesReadInput__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_1();
  }
  if (!a4) {
    __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_2();
  }
  unint64_t v6 = (unint64_t)*(double *)(a3 + 80);
  int v15 = 0;
  uint64_t v7 = ASDT::Exclaves::AudioBuffer::Read(*(void *)(a1 + 32), a4, a2, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), v6, &v15);
  uint64_t v8 = **(void **)(a1 + 40);
  if (v8) {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, unint64_t))(v8 + 16))(v8, v6 + a2);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    int v10 = v15;
    ASDTTime::machAbsoluteTime((ASDTTime *)v8, (uint64_t)v12 + 8);
    *(void *)&v12[0] = v6;
    int v13 = v10;
    int v14 = 3;
    ASDT::Exclaves::StatusTracker::Push(v9, v12);
  }
  return v7;
}

- (id)readInputBlock
{
  if ([(ASDStream *)self direction] == 1768845428
    && [(ASDTExclavesStream *)self usesExclavesAudioBuffer])
  {
    uint64_t v3 = [(ASDTExclavesStream *)self exclavesReadInput];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ASDTExclavesStream;
    uint64_t v3 = [(ASDTStream *)&v5 readInputBlock];
  }
  return v3;
}

- (id)exclavesWriteMix
{
  uint64_t v3 = [(ASDStream *)self physicalFormat];
  unsigned int v4 = [v3 bytesPerFrame];

  unsigned int v5 = [(ASDTExclavesStream *)self ioBufferSize];
  unint64_t v6 = [(ASDTStream *)self updateClientPositionBlock];
  [(ASDTStream *)self setUpdateClientPositionCopy:v6];

  uint64_t v7 = [(ASDTStream *)self getUpdateClientPositionUnretainedAddress];
  value = self->_inboundBuffer.__ptr_.__value_;
  if (value)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__ASDTExclavesStream_exclavesWriteMix__block_invoke;
    aBlock[3] = &__block_descriptor_56_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
    unsigned int v12 = v4;
    int v13 = v5 / v4;
    aBlock[4] = value;
    aBlock[5] = v7;
    uint64_t v9 = _Block_copy(aBlock);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

uint64_t __38__ASDTExclavesStream_exclavesWriteMix__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned __int8 *a4)
{
  if (!a3) {
    __38__ASDTExclavesStream_exclavesWriteMix__block_invoke_cold_1();
  }
  if (!a4) {
    __38__ASDTExclavesStream_exclavesWriteMix__block_invoke_cold_2();
  }
  unint64_t v6 = (unint64_t)*(double *)(a3 + 144);
  uint64_t v7 = ASDT::Exclaves::InboundBuffer::Write(*(ASDT::Exclaves::InboundBuffer **)(a1 + 32), a4, a2, *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), v6);
  uint64_t v8 = **(void **)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v6 + a2);
  }
  return v7;
}

- (id)writeMixBlock
{
  if ([(ASDStream *)self direction] == 1869968496
    && [(ASDTExclavesStream *)self usesExclavesAudioBuffer])
  {
    uint64_t v3 = [(ASDTExclavesStream *)self exclavesWriteMix];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ASDTExclavesStream;
    uint64_t v3 = [(ASDTStream *)&v5 writeMixBlock];
  }
  return v3;
}

- (void)clearBuffer
{
  if ([(ASDStream *)self direction] == 1869968496 && self->_inboundBuffer.__ptr_.__value_)
  {
    objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", -[ASDTExclavesStream exclavesBufferSize](self, "exclavesBufferSize"));
    id v4 = objc_claimAutoreleasedReturnValue();
    uint64_t v3 = (const unsigned __int8 *)[v4 bytes];
    if (v3) {
      ASDT::Exclaves::InboundBuffer::Write((ASDT::Exclaves::InboundBuffer *)self->_inboundBuffer.__ptr_.__value_, v3, [(ASDTExclavesStream *)self exclavesBufferSize], 1);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ASDTExclavesStream;
    [(ASDTStream *)&v5 clearBuffer];
  }
}

- (NSDictionary)status
{
  v2 = [(ASDTExclavesStream *)self exclavesSensorManager];
  uint64_t v3 = (void *)[v2 sensor];

  if (v3)
  {
    unsigned int v9 = 0;
    if (ASDT::Exclaves::Sensor::GetStatus((uint64_t)v3, &v9)
      || (objc_msgSend(NSString, "stringWithFormat:", @"[%u] %s", v9, ASDT::Exclaves::Sensor::StatusString(v9)), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v3 = 0;
    }
    else
    {
      objc_super v5 = (void *)v4;
      unint64_t v6 = NSDictionary;
      uint64_t v7 = [NSString stringWithUTF8String:"com.apple.sensors.mic"];
      uint64_t v3 = [v6 dictionaryWithObject:v5 forKey:v7];
    }
  }
  return (NSDictionary *)v3;
}

- (NSString)exclavesBufferName
{
  return self->_exclavesBufferName;
}

- (void)setExclavesBufferName:(id)a3
{
}

- (unsigned)exclavesBufferSize
{
  return self->_exclavesBufferSize;
}

- (void)setExclavesBufferSize:(unsigned int)a3
{
  self->_exclavesBufferSize = a3;
}

- (ASDTExclavesSensorManager)exclavesSensorManager
{
  return self->_exclavesSensorManager;
}

- (void)setExclavesSensorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclavesSensorManager, 0);
  objc_storeStrong((id *)&self->_exclavesBufferName, 0);
  value = self->_inboundBuffer.__ptr_.__value_;
  self->_inboundBuffer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(InboundBuffer *))(*(void *)value + 8))(value);
  }
  uint64_t v4 = self->_audioBuffer.__ptr_.__value_;
  self->_audioBuffer.__ptr_.__value_ = 0;
  if (v4)
  {
    objc_super v5 = *(void (**)(void))(*(void *)&v4->mNumberChannels + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  return self;
}

- (void)updateSensorForIOThreadStateChange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to get sensor status", (uint8_t *)&v2, 0xCu);
}

- (void)updateSensorForIOThreadStateChange:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = "start";
  if ((a2 & 1) == 0) {
    uint64_t v3 = "stop";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: Failed to %s sensor", (uint8_t *)&v4, 0x16u);
}

void __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_1()
{
}

void __39__ASDTExclavesStream_exclavesReadInput__block_invoke_cold_2()
{
}

void __38__ASDTExclavesStream_exclavesWriteMix__block_invoke_cold_1()
{
}

void __38__ASDTExclavesStream_exclavesWriteMix__block_invoke_cold_2()
{
}

@end