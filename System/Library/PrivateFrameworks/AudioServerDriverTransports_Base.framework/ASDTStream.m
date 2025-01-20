@interface ASDTStream
+ (id)streamForConfig:(id)a3 withDevice:(id)a4;
- (ASDTAudioDevice)device;
- (ASDTStream)initWithConfig:(id)a3 withDevice:(id)a4;
- (ASDTStream)initWithDirection:(unsigned int)a3 withDevice:(id)a4;
- (NSDictionary)latencies;
- (char)ioBuffer;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)getUpdateClientPositionUnretainedAddress;
- (id)readInputBlock;
- (id)readOrWriteBlock;
- (id)updateClientPositionBlock;
- (id)updateClientPositionCopy;
- (id)updateClientPositionUnretained;
- (id)writeMixBlock;
- (int)pmIdleStream:(int)a3;
- (int)pmOnStream;
- (int)pmPrepareStream:(int)a3;
- (int)pmPrewarmStream:(int)a3;
- (int)pmSleepStream;
- (int)pmStateTransition:(int)a3;
- (unint64_t)isolatedUseCaseID;
- (unsigned)ioBufferSize;
- (unsigned)safetyOffset;
- (void)clearBuffer;
- (void)setDevice:(id)a3;
- (void)setIsolatedUseCaseID:(unint64_t)a3;
- (void)setLatencies:(id)a3;
- (void)setPhysicalFormat:(id)a3;
- (void)setSafetyOffset:(unsigned int)a3;
- (void)setUpdateClientPositionCopy:(id)a3;
- (void)setUpdateClientPositionUnretained:(id)a3;
- (void)updateLatency;
- (void)writeZerosToMixMilliseconds:(unsigned int)a3 atSampleTime:(unint64_t)a4;
@end

@implementation ASDTStream

+ (id)streamForConfig:(id)a3 withDevice:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (objc_class *)[v5 asdtSubclass];
  if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
  {
    v8 = (void *)[[v7 alloc] initWithConfig:v5 withDevice:v6];
  }
  else
  {
    v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v5 objectForKeyedSubscript:@"Subclass"];
      +[ASDTStream streamForConfig:withDevice:](v10, v12, v9);
    }

    v8 = 0;
  }

  return v8;
}

- (ASDTStream)initWithDirection:(unsigned int)a3 withDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [v6 plugin];
  v10.receiver = self;
  v10.super_class = (Class)ASDTStream;
  v8 = [(ASDStream *)&v10 initWithDirection:v4 withPlugin:v7];

  if (v8) {
    [(ASDTStream *)v8 setDevice:v6];
  }

  return v8;
}

- (ASDTStream)initWithConfig:(id)a3 withDevice:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unsigned int v46 = 0;
  if (([v6 asdtDirection:&v46] & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v8 = v46;
  v9 = [v7 plugin];
  v45.receiver = self;
  v45.super_class = (Class)ASDTStream;
  self = [(ASDStream *)&v45 initWithDirection:v8 withPlugin:v9];

  if (self)
  {
    [(ASDTStream *)self setDevice:v7];
    objc_super v10 = [v7 samplingRates];
    v11 = [v6 asdtLatenciesForSamplingRates:v10];
    [(ASDTStream *)self setLatencies:v11];

    -[ASDStream setStartingChannel:](self, "setStartingChannel:", [v6 asdtStartingChannel]);
    v12 = [v6 asdtName];
    [(ASDStream *)self setStreamName:v12];

    uint64_t v13 = [(ASDStream *)self streamName];
    LODWORD(v12) = v13 == 0;

    if (v12)
    {
      if (v46 == 1768845428) {
        v14 = @"Input";
      }
      else {
        v14 = @"Output";
      }
      [(ASDStream *)self setStreamName:v14];
    }
    -[ASDStream setTerminalType:](self, "setTerminalType:", [v6 asdtTerminalType]);
    -[ASDTStream setIsolatedUseCaseID:](self, "setIsolatedUseCaseID:", [v6 asdtIsolatedUseCaseID]);
    v36 = [v6 asdtFormats];
    v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v36, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v16 = v36;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v21 = [v7 samplingRates];
          v22 = [v20 asdtFormatsWithSamplingRates:v21];

          if (v22) {
            [v15 addObjectsFromArray:v22];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v17);
    }

    if ([v15 count])
    {
      [(ASDStream *)self setPhysicalFormats:v15];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v23 = v15;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v38;
        while (2)
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            [v27 sampleRate];
            double v29 = v28;
            [v7 samplingRate];
            if (v29 == v30)
            {
              [(ASDTStream *)self setPhysicalFormat:v27];
              goto LABEL_28;
            }
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
LABEL_28:

      goto LABEL_29;
    }
    v32 = ASDTBaseLogType();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = [v7 deviceUID];
      v34 = [(ASDStream *)self streamName];
      [(ASDTStream *)v33 initWithConfig:buf withDevice:v32];
    }

LABEL_33:
    v31 = 0;
    goto LABEL_34;
  }
LABEL_29:
  self = self;
  v31 = self;
LABEL_34:

  return v31;
}

- (char)ioBuffer
{
  return 0;
}

- (unsigned)ioBufferSize
{
  return 0;
}

- (id)updateClientPositionBlock
{
  return 0;
}

- (void)setUpdateClientPositionCopy:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)[v6 copy];
  id updateClientPositionCopy = self->_updateClientPositionCopy;
  self->_id updateClientPositionCopy = v4;

  [(ASDTStream *)self setUpdateClientPositionUnretained:self->_updateClientPositionCopy];
}

- (id)getUpdateClientPositionUnretainedAddress
{
  return &self->_updateClientPositionUnretained;
}

- (int)pmSleepStream
{
  return 0;
}

- (int)pmIdleStream:(int)a3
{
  return 0;
}

- (int)pmPrepareStream:(int)a3
{
  return 0;
}

- (int)pmPrewarmStream:(int)a3
{
  return 0;
}

- (int)pmOnStream
{
  return 0;
}

- (int)pmStateTransition:(int)a3
{
  if (a3 <= 1937008995)
  {
    if (a3 > 1685092204)
    {
      if (a3 != 1685092205)
      {
        if (a3 == 1685286000) {
          return [(ASDTStream *)self pmSleepStream];
        }
        return 0;
      }
      return -[ASDTStream pmPrewarmStream:](self, "pmPrewarmStream:");
    }
    if (a3 == 1684628588) {
      return -[ASDTStream pmIdleStream:](self, "pmIdleStream:");
    }
    int v3 = 1685090418;
LABEL_12:
    if (a3 == v3) {
      return -[ASDTStream pmPrepareStream:](self, "pmPrepareStream:");
    }
    return 0;
  }
  if (a3 <= 1970304876)
  {
    if (a3 == 1937008996) {
      return -[ASDTStream pmIdleStream:](self, "pmIdleStream:");
    }
    int v3 = 1970303090;
    goto LABEL_12;
  }
  switch(a3)
  {
    case 1970304877:
      return -[ASDTStream pmPrewarmStream:](self, "pmPrewarmStream:");
    case 1970435438:
      return [(ASDTStream *)self pmOnStream];
    case 1970563428:
      return -[ASDTStream pmIdleStream:](self, "pmIdleStream:");
  }
  return 0;
}

- (void)clearBuffer
{
  if ([(ASDTStream *)self ioBuffer] && [(ASDTStream *)self ioBufferSize])
  {
    int v3 = [(ASDTStream *)self ioBuffer];
    size_t v4 = [(ASDTStream *)self ioBufferSize];
    bzero(v3, v4);
  }
}

- (void)updateLatency
{
  int v3 = [(ASDTStream *)self latencies];

  if (v3)
  {
    size_t v4 = NSNumber;
    id v5 = [(ASDStream *)self physicalFormat];
    [v5 sampleRate];
    objc_msgSend(v4, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = [(ASDTStream *)self latencies];
    id v7 = [v6 objectForKey:v8];
    -[ASDStream setLatency:](self, "setLatency:", [v7 unsignedIntValue]);
  }
}

- (void)setLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_latencies, a3);
  [(ASDTStream *)self updateLatency];
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ASDTStream;
  [(ASDStream *)&v5 setPhysicalFormat:v4];
  [(ASDTStream *)self updateLatency];
}

- (id)readOrWriteBlock
{
  int v3 = [(ASDStream *)self physicalFormat];
  unsigned int v4 = [v3 bytesPerFrame];

  unsigned int v5 = [(ASDTStream *)self ioBufferSize];
  unsigned int v6 = [(ASDStream *)self direction];
  id v7 = [(ASDTStream *)self updateClientPositionBlock];
  [(ASDTStream *)self setUpdateClientPositionCopy:v7];

  id v8 = [(ASDTStream *)self getUpdateClientPositionUnretainedAddress];
  v9 = [(ASDTStream *)self ioBuffer];
  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __30__ASDTStream_readOrWriteBlock__block_invoke;
    v11[3] = &__block_descriptor_64_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
    unsigned int v12 = v4;
    unsigned int v13 = v6;
    int v14 = v5 / v4;
    unsigned int v15 = v5;
    v11[4] = v9;
    v11[5] = v8;
    v9 = (char *)_Block_copy(v11);
  }
  return v9;
}

uint64_t __30__ASDTStream_readOrWriteBlock__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, char *a4)
{
  if (!a3) {
    __30__ASDTStream_readOrWriteBlock__block_invoke_cold_1();
  }
  if (!a4) {
    __30__ASDTStream_readOrWriteBlock__block_invoke_cold_2();
  }
  uint64_t v7 = *(unsigned int *)(a1 + 48);
  int v8 = *(_DWORD *)(a1 + 52);
  uint64_t v9 = 144;
  if (v8 == 1768845428) {
    uint64_t v9 = 80;
  }
  unint64_t v10 = (unint64_t)*(double *)(a3 + v9);
  uint64_t v11 = *(unsigned int *)(a1 + 60);
  size_t v12 = v7 * a2;
  unint64_t v13 = v10 % *(unsigned int *)(a1 + 56) * v7;
  int v14 = *(char **)(a1 + 32);
  if (v8 == 1768845428) {
    unsigned int v15 = &v14[v13];
  }
  else {
    unsigned int v15 = a4;
  }
  if (v8 == 1768845428) {
    id v16 = a4;
  }
  else {
    id v16 = &v14[v13];
  }
  size_t v17 = v11 - v13;
  if (v11 - v13 >= v12) {
    size_t v18 = v12;
  }
  else {
    size_t v18 = v11 - v13;
  }
  memcpy(v16, v15, v18);
  if (v17 < v12)
  {
    if (v8 == 1768845428) {
      v19 = &a4[v18];
    }
    else {
      v19 = v14;
    }
    if (v8 == 1768845428) {
      v20 = v14;
    }
    else {
      v20 = &a4[v18];
    }
    memcpy(v19, v20, v12 - v18);
  }
  uint64_t v21 = **(void **)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, unint64_t))(v21 + 16))(v21, v10 + a2);
  }
  return 0;
}

- (id)writeMixBlock
{
  if ([(ASDStream *)self direction] == 1869968496)
  {
    int v3 = [(ASDTStream *)self readOrWriteBlock];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (id)readInputBlock
{
  if ([(ASDStream *)self direction] == 1768845428)
  {
    int v3 = [(ASDTStream *)self readOrWriteBlock];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (void)writeZerosToMixMilliseconds:(unsigned int)a3 atSampleTime:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(ASDStream *)self physicalFormat];
  [v7 sampleRate];
  double v9 = v8;

  unint64_t v10 = [(ASDStream *)self physicalFormat];
  unsigned int v11 = [v10 bytesPerFrame];

  unsigned int v12 = [(ASDTStream *)self ioBufferSize];
  unint64_t v13 = [(ASDTStream *)self ioBuffer];
  if (v13)
  {
    if (v12)
    {
      int v14 = v13;
      if ([(ASDStream *)self direction] != 1768845428)
      {
        unsigned int v15 = (v9 / 1000.0 * (double)a3);
        uint64_t v16 = v11 * v15;
        if (v16 >= v12)
        {
          [(ASDTStream *)self clearBuffer];
        }
        else
        {
          size_t v17 = ASDTBaseLogType();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
            v26 = [WeakRetained deviceUID];
            *(_DWORD *)buf = 138412802;
            v32 = v26;
            __int16 v33 = 2048;
            unint64_t v34 = a4;
            __int16 v35 = 1024;
            unsigned int v36 = v15;
            _os_log_debug_impl(&dword_2489BC000, v17, OS_LOG_TYPE_DEBUG, "%@ Sample time: %llu, Zero frames: %u", buf, 0x1Cu);
          }
          size_t v18 = [(ASDTStream *)self updateClientPositionBlock];
          unint64_t v19 = a4 % (v12 / v11) * v11;
          if (v12 - v19 >= v16) {
            unint64_t v20 = v11 * v15;
          }
          else {
            unint64_t v20 = v12 - v19;
          }
          uint64_t v21 = ASDTBaseLogType();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            double v30 = [(ASDTStream *)self device];
            v27 = [v30 deviceUID];
            *(_DWORD *)buf = 138412802;
            v32 = v27;
            __int16 v33 = 2048;
            unint64_t v34 = v19;
            __int16 v35 = 1024;
            unsigned int v36 = v20;
            _os_log_debug_impl(&dword_2489BC000, v21, OS_LOG_TYPE_DEBUG, "%@ First fill to offset %llu size %u", buf, 0x1Cu);
          }
          v22 = ASDTBaseLogType();
          uint64_t v23 = v16 - v20;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            double v28 = [(ASDTStream *)self device];
            double v29 = [v28 deviceUID];
            *(_DWORD *)buf = 138412546;
            v32 = v29;
            __int16 v33 = 1024;
            LODWORD(v34) = v23;
            _os_log_debug_impl(&dword_2489BC000, v22, OS_LOG_TYPE_DEBUG, "%@ Second fill to offset 0 size %u", buf, 0x12u);
          }
          if (v20)
          {
            uint64_t v24 = &v14[v19];
            do
            {
              *v24++ = 0;
              --v20;
            }
            while (v20);
          }
          for (; v23; --v23)
            *v14++ = 0;
          if (v18) {
            v18[2](v18, a4 + v15);
          }
        }
      }
    }
  }
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDTStream;
  uint64_t v7 = [(ASDStream *)&v24 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  [v7 appendFormat:@"%@|    ioBufferSize:        %u\n", v6, -[ASDTStream ioBufferSize](self, "ioBufferSize")];
  double v8 = [(ASDTStream *)self latencies];
  BOOL v9 = [v8 count] == 0;

  if (!v9)
  {
    [v7 appendFormat:@"%@|    latencies (sampeRate : frames):\n", v6];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v10 = [(ASDTStream *)self latencies];
    obuint64_t j = [v10 allKeys];

    uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          unsigned int v15 = [(ASDTStream *)self latencies];
          uint64_t v16 = [v15 objectForKeyedSubscript:v14];

          [v14 doubleValue];
          [v7 appendFormat:@"%@|        %6.0lf : %u\n", v6, v17, objc_msgSend(v16, "unsignedIntValue")];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }
  }
  return v7;
}

- (NSDictionary)latencies
{
  return self->_latencies;
}

- (unsigned)safetyOffset
{
  return self->_safetyOffset;
}

- (void)setSafetyOffset:(unsigned int)a3
{
  self->_safetyOffset = a3;
}

- (ASDTAudioDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (ASDTAudioDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (id)updateClientPositionCopy
{
  return self->_updateClientPositionCopy;
}

- (id)updateClientPositionUnretained
{
  return self->_updateClientPositionUnretained;
}

- (void)setUpdateClientPositionUnretained:(id)a3
{
  self->_updateClientPositionUnretained = a3;
}

- (unint64_t)isolatedUseCaseID
{
  return self->_isolatedUseCaseID;
}

- (void)setIsolatedUseCaseID:(unint64_t)a3
{
  self->_isolatedUseCaseID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateClientPositionCopy, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_latencies, 0);
}

+ (void)streamForConfig:(os_log_t)log withDevice:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Invalid subclass name: %@", buf, 0xCu);
}

- (void)initWithConfig:(uint8_t *)buf withDevice:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: %@: Stream has no formats.", buf, 0x16u);
}

void __30__ASDTStream_readOrWriteBlock__block_invoke_cold_1()
{
}

void __30__ASDTStream_readOrWriteBlock__block_invoke_cold_2()
{
}

@end