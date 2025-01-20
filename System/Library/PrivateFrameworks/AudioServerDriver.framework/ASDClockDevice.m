@interface ASDClockDevice
- (ASDClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4;
- (ASDClockDevice)initWithPlugin:(id)a3;
- (ASDDeviceConfigurationChangeDelegate)configurationChangeDelegate;
- (BOOL)canChangeDeviceName;
- (BOOL)changeDeviceName:(id)a3;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)clockIsStable;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isHidden;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isRunning;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (NSArray)samplingRates;
- (NSString)deviceName;
- (NSString)deviceUID;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)modelUID;
- (OS_dispatch_queue)ioReferenceQueue;
- (double)samplingRate;
- (id)beginIOOperationBlock;
- (id)beginIOOperationBlockUnretainedPtr;
- (id)controls;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (id)endIOOperationBlock;
- (id)endIOOperationBlockUnretainedPtr;
- (id)getZeroTimestampBlock;
- (id)getZeroTimestampBlockUnretainedPtr;
- (int)addClient:(const AudioServerPlugInClientInfo *)a3;
- (int)performStartIO;
- (int)performStopIO;
- (int)removeClient:(const AudioServerPlugInClientInfo *)a3;
- (int)startIOForClient:(unsigned int)a3;
- (int)stopIOForClient:(unsigned int)a3;
- (unsigned)clockAlgorithm;
- (unsigned)clockDomain;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)inputLatency;
- (unsigned)objectClass;
- (unsigned)outputLatency;
- (unsigned)timestampPeriod;
- (unsigned)transportType;
- (void)abortConfigurationChange:(void *)a3;
- (void)addControl:(id)a3;
- (void)dealloc;
- (void)ioThreadStateChange:(id)a3;
- (void)performConfigurationChange:(void *)a3;
- (void)removeControl:(id)a3;
- (void)requestConfigurationChange:(id)a3;
- (void)setBeginIOOperationBlock:(id)a3;
- (void)setCanChangeDeviceName:(BOOL)a3;
- (void)setClockAlgorithm:(unsigned int)a3;
- (void)setClockDomain:(unsigned int)a3;
- (void)setClockIsStable:(BOOL)a3;
- (void)setConfigurationChangeDelegate:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEndIOOperationBlock:(id)a3;
- (void)setGetZeroTimestampBlock:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInputLatency:(unsigned int)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelUID:(id)a3;
- (void)setOutputLatency:(unsigned int)a3;
- (void)setSamplingRate:(double)a3;
- (void)setSamplingRates:(id)a3;
- (void)setTimestampPeriod:(unsigned int)a3;
- (void)setTransportType:(unsigned int)a3;
- (void)systemHasPoweredOn;
- (void)systemWillSleep;
- (void)updateTimestampPeriod;
@end

@implementation ASDClockDevice

- (ASDClockDevice)initWithPlugin:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = [NSString stringWithUTF8String:"-[ASDClockDevice initWithPlugin:]"];
  [v4 raise:v5, @"Do not call %@", v6 format];

  return 0;
}

- (ASDClockDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ASDClockDevice;
  v9 = [(ASDObject *)&v28 initWithPlugin:v8];
  v10 = v9;
  if (v9)
  {
    v9->_isAlive = 1;
    v9->_transportType = 0;
    v9->_clockAlgorithm = 1768518246;
    v9->_clockIsStable = 1;
    p_deviceUID = &v9->_deviceUID;
    objc_storeStrong((id *)&v9->_deviceUID, a3);
    objc_storeWeak((id *)&v10->_configurationChangeDelegate, v8);
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 bundleIdentifier];
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    controls = v10->_controls;
    v10->_controls = v14;

    id v16 = [NSString stringWithFormat:@"%@.device.%@.controls", v13, *p_deviceUID];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    controlQueue = v10->_controlQueue;
    v10->_controlQueue = (OS_dispatch_queue *)v17;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    samplingRates = v10->_samplingRates;
    v10->_samplingRates = v19;

    id v21 = [NSString stringWithFormat:@"%@.device.%@.sampleRate", v13, *p_deviceUID];
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    sampleRateQueue = v10->_sampleRateQueue;
    v10->_sampleRateQueue = (OS_dispatch_queue *)v22;

    id v24 = [NSString stringWithFormat:@"%@.device.%@.ioReference", v13, *p_deviceUID];
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v24 UTF8String], 0);
    ioReferenceQueue = v10->_ioReferenceQueue;
    v10->_ioReferenceQueue = (OS_dispatch_queue *)v25;

    [(ASDObject *)v10 setupDiagnosticStateDumpHandlerWithTreeWalk:1];
  }

  return v10;
}

- (unsigned)objectClass
{
  return 1633905771;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  BOOL result = 1;
  if ((int)a3->mSelector > 1819107690)
  {
    if (mSelector <= 1853059618)
    {
      if (mSelector > 1819569762)
      {
        if (mSelector == 1819569763) {
          return result;
        }
        int v6 = 1836411236;
      }
      else
      {
        if (mSelector == 1819107691) {
          return result;
        }
        int v6 = 1819173229;
      }
      goto LABEL_28;
    }
    if (mSelector <= 1919512166)
    {
      if (mSelector == 1853059619) {
        return result;
      }
      int v6 = 1853059700;
      goto LABEL_28;
    }
    if (mSelector != 1919512167 && mSelector != 1935763060)
    {
      int v6 = 1953653102;
LABEL_28:
      if (mSelector != v6)
      {
        v7.receiver = self;
        v7.super_class = (Class)ASDClockDevice;
        return -[ASDObject hasProperty:](&v7, sel_hasProperty_);
      }
    }
  }
  else
  {
    if (mSelector <= 1668575851)
    {
      if (mSelector > 1668050794)
      {
        if (mSelector == 1668050795) {
          return result;
        }
        int v6 = 1668510818;
      }
      else
      {
        if (mSelector == 1634429294) {
          return result;
        }
        int v6 = 1668049764;
      }
      goto LABEL_28;
    }
    if (mSelector <= 1735354733)
    {
      if (mSelector == 1668575852) {
        return result;
      }
      int v6 = 1668639076;
      goto LABEL_28;
    }
    if (mSelector != 1735354734 && mSelector != 1751737454)
    {
      int v6 = 1818850926;
      goto LABEL_28;
    }
  }
  return result;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  unsigned int v6 = 8;
  if ((int)a3->mSelector <= 1819107690)
  {
    if (mSelector <= 1668575851)
    {
      if (mSelector > 1668050794)
      {
        if (mSelector == 1668050795) {
          return 4;
        }
        int v8 = 1668510818;
      }
      else
      {
        if (mSelector == 1634429294)
        {
          int v24 = 1633969526;
          uint64_t v20 = *(void *)&a3->mSelector;
          LODWORD(v21) = a3->mElement;
          LODWORD(v20) = 1870098020;
          v10 = [(ASDObject *)self owner];
          unsigned int v6 = [v10 dataSizeForProperty:&v20 withQualifierSize:4 andQualifierData:&v24];

          return v6;
        }
        int v8 = 1668049764;
      }
      goto LABEL_34;
    }
    if (mSelector > 1735354733)
    {
      if (mSelector == 1735354734 || mSelector == 1751737454) {
        return 4;
      }
      int v8 = 1818850926;
      goto LABEL_34;
    }
    if (mSelector != 1668575852)
    {
      int v9 = 1668639076;
LABEL_25:
      if (mSelector == v9) {
        return v6;
      }
      goto LABEL_38;
    }
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    controlQueue = self->_controlQueue;
    uint64_t v23 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
    v19[3] = &unk_264773338;
    v19[5] = &v20;
    v19[6] = a3;
    v19[4] = self;
    v12 = v19;
    goto LABEL_41;
  }
  if (mSelector > 1853059699)
  {
    if (mSelector > 1919512166)
    {
      if (mSelector == 1919512167 || mSelector == 1953653102) {
        return 4;
      }
      int v8 = 1935763060;
LABEL_34:
      if (mSelector == v8) {
        return 4;
      }
LABEL_38:
      v14.receiver = self;
      v14.super_class = (Class)ASDClockDevice;
      return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v14, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
    }
    if (mSelector == 1853059700) {
      return v6;
    }
    if (mSelector != 1870098020) {
      goto LABEL_38;
    }
    if (a4)
    {
      if ((a4 & 3) != 0) {
        return 0;
      }
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x2020000000;
      uint64_t v23 = 0;
      controlQueue = self->_controlQueue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
      v16[3] = &unk_264773360;
      unsigned int v17 = a4 >> 2;
      v16[6] = a5;
      v16[7] = a3;
      v16[4] = self;
      v16[5] = &v20;
      v12 = v16;
    }
    else
    {
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x2020000000;
      controlQueue = self->_controlQueue;
      uint64_t v23 = 0;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4;
      v15[3] = &unk_264773338;
      v15[5] = &v20;
      v15[6] = a3;
      v15[4] = self;
      v12 = v15;
    }
LABEL_41:
    dispatch_sync(controlQueue, v12);
    unsigned int v6 = 4 * *((_DWORD *)v21 + 6);
    goto LABEL_42;
  }
  if (mSelector <= 1819569762)
  {
    if (mSelector == 1819107691) {
      return v6;
    }
    int v9 = 1819173229;
    goto LABEL_25;
  }
  if (mSelector == 1819569763) {
    return 4;
  }
  if (mSelector != 1836411236)
  {
    if (mSelector == 1853059619)
    {
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x2020000000;
      uint64_t v23 = 0;
      sampleRateQueue = self->_sampleRateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
      block[3] = &unk_264773158;
      block[4] = self;
      block[5] = &v20;
      dispatch_sync(sampleRateQueue, block);
      unsigned int v6 = 16 * *((_DWORD *)v21 + 6);
LABEL_42:
      _Block_object_dispose(&v20, 8);
      return v6;
    }
    goto LABEL_38;
  }
  return v6;
}

void __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1[4] + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "controlScope", (void)v8) == *(_DWORD *)(a1[6] + 4))
        {
          ++*(void *)(*(void *)(a1[5] + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

uint64_t __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v8;
    while (1)
    {
      if (*(void *)v8 != v6) {
        objc_enumerationMutation(v3);
      }
      if (!--v5)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

void __73__ASDClockDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1[4] + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "controlScope", (void)v8) == *(_DWORD *)(a1[6] + 4))
        {
          ++*(void *)(*(void *)(a1[5] + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  char v8 = 0;
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (!a3 || !a6 || !a7) {
    return v8;
  }
  uint64_t v11 = *(void *)&a8;
  uint64_t v13 = *(void *)&a4;
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1819173228)
  {
    if (mSelector <= 1870098019)
    {
      if (mSelector <= 1836411235)
      {
        if (mSelector != 1819173229)
        {
          if (mSelector != 1819569763) {
            goto LABEL_77;
          }
          if (*a6 < 4) {
            return 0;
          }
          AudioObjectPropertyScope mScope = a3->mScope;
          if (mScope != 1869968496)
          {
            if (mScope == 1768845428) {
              goto LABEL_41;
            }
            if (mScope != 1735159650) {
              goto LABEL_96;
            }
            unsigned int v25 = [(ASDClockDevice *)self inputLatency];
            if (v25 > [(ASDClockDevice *)self outputLatency])
            {
LABEL_41:
              unsigned int v23 = [(ASDClockDevice *)self inputLatency];
              goto LABEL_95;
            }
          }
          unsigned int v23 = [(ASDClockDevice *)self outputLatency];
          goto LABEL_95;
        }
        if (*a6 < 8) {
          return 0;
        }
        uint64_t v20 = [(ASDClockDevice *)self deviceName];
      }
      else
      {
        if (mSelector != 1836411236)
        {
          if (mSelector == 1853059619)
          {
            v26 = [(ASDClockDevice *)self samplingRates];
            unint64_t v27 = *a6;
            if ([v26 count] <= v27 >> 4) {
              unint64_t v28 = [v26 count];
            }
            else {
              unint64_t v28 = (unint64_t)*a6 >> 4;
            }
            long long v51 = 0u;
            long long v52 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            id v31 = v26;
            uint64_t v32 = 0;
            uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v59 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v50;
              while (2)
              {
                for (uint64_t i = 0; i != v33; ++i)
                {
                  if (*(void *)v50 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  if (v28 == v32)
                  {
                    LODWORD(v32) = v28;
                    goto LABEL_89;
                  }
                  [*(id *)(*((void *)&v49 + 1) + 8 * i) doubleValue];
                  *((int64x2_t *)a7 + v32++) = vdupq_lane_s64(v36, 0);
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v59 count:16];
                if (v33) {
                  continue;
                }
                break;
              }
            }
LABEL_89:

            *a6 = 16 * v32;
            return 1;
          }
          if (mSelector != 1853059700) {
            goto LABEL_77;
          }
          if (*a6 < 8) {
            return 0;
          }
          [(ASDClockDevice *)self samplingRate];
          *(void *)a7 = v19;
LABEL_73:
          unsigned int v30 = 8;
LABEL_97:
          *a6 = v30;
          return 1;
        }
        if (*a6 < 8) {
          return 0;
        }
        uint64_t v20 = [(ASDClockDevice *)self modelUID];
      }
LABEL_71:
      *(void *)a7 = v20;

      if (*(void *)a7) {
        CFRetain(*(CFTypeRef *)a7);
      }
      goto LABEL_73;
    }
    if (mSelector > 1935763059)
    {
      if (mSelector != 1935763060)
      {
        if (mSelector == 1953653102)
        {
          if (*a6 >= 4)
          {
            unsigned int v23 = [(ASDClockDevice *)self transportType];
            goto LABEL_95;
          }
          return 0;
        }
        if (mSelector == 1937007734)
        {
          if (*a6 >= 4)
          {
            *a6 = 4;
            id v21 = [(ASDObject *)self owner];
            uint64_t v22 = [v21 owner];
            *(_DWORD *)a7 = [v22 objectID];

            return 1;
          }
          return 0;
        }
        goto LABEL_77;
      }
      if (*a6 < 4) {
        return 0;
      }
      *(_DWORD *)a7 = 0;
      goto LABEL_96;
    }
    if (mSelector != 1870098020)
    {
      if (mSelector == 1919512167)
      {
        if (*a6 < 4) {
          return 0;
        }
        unsigned int v23 = [(ASDClockDevice *)self timestampPeriod];
        goto LABEL_95;
      }
      goto LABEL_77;
    }
    if (a4)
    {
      if ((a4 & 3) != 0) {
        return 0;
      }
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v57 = 0;
      unsigned int v39 = *a6;
      if (v39 >= [(ASDClockDevice *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])unsigned int v40 = [(ASDClockDevice *)self dataSizeForProperty:a3 withQualifierSize:v13 andQualifierData:a5]; {
      else
      }
        unsigned int v40 = *a6;
      uint64_t v42 = v40 >> 2;
      if (v55[3] == v42)
      {
LABEL_107:
        unsigned int v18 = 4 * v42;
        goto LABEL_108;
      }
      controlQueue = self->_controlQueue;
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
      v47[3] = &unk_2647733B0;
      unsigned int v48 = v13 >> 2;
      v47[6] = a5;
      v47[7] = a3;
      v47[4] = self;
      v47[5] = &v54;
      v47[8] = v42;
      v47[9] = a7;
      v44 = v47;
    }
    else
    {
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v57 = 0;
      unsigned int v37 = *a6;
      if (v37 >= [(ASDClockDevice *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5])unsigned int v38 = [(ASDClockDevice *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5]; {
      else
      }
        unsigned int v38 = *a6;
      uint64_t v42 = v38 >> 2;
      if (v55[3] == v42) {
        goto LABEL_107;
      }
      controlQueue = self->_controlQueue;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
      v46[3] = &unk_264773388;
      v46[4] = self;
      v46[5] = &v54;
      v46[6] = a3;
      v46[7] = v42;
      v46[8] = a7;
      v44 = v46;
    }
    dispatch_sync(controlQueue, v44);
    LODWORD(v42) = *((_DWORD *)v55 + 6);
    goto LABEL_107;
  }
  if (mSelector > 1668639075)
  {
    if (mSelector <= 1751737453)
    {
      if (mSelector != 1668639076)
      {
        if (mSelector == 1735354734)
        {
          if (*a6 < 4) {
            return 0;
          }
          unsigned int v23 = [(ASDClockDevice *)self isRunning];
          goto LABEL_95;
        }
LABEL_77:
        v45.receiver = self;
        v45.super_class = (Class)ASDClockDevice;
        return [(ASDObject *)&v45 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
      }
      if (*a6 < 8) {
        return 0;
      }
      uint64_t v20 = [(ASDClockDevice *)self deviceUID];
      goto LABEL_71;
    }
    if (mSelector == 1751737454)
    {
      if (*a6 >= 4)
      {
        unsigned int v23 = [(ASDClockDevice *)self isHidden];
        goto LABEL_95;
      }
      return 0;
    }
    if (mSelector != 1818850926)
    {
      if (mSelector != 1819107691) {
        goto LABEL_77;
      }
      if (*a6 < 8) {
        return 0;
      }
      uint64_t v20 = [(ASDClockDevice *)self manufacturerName];
      goto LABEL_71;
    }
    if (*a6 < 4) {
      return 0;
    }
    *(_DWORD *)a7 = self->_isAlive;
LABEL_96:
    unsigned int v30 = 4;
    goto LABEL_97;
  }
  if (mSelector > 1668050794)
  {
    if (mSelector != 1668050795)
    {
      if (mSelector != 1668510818)
      {
        if (mSelector == 1668575852)
        {
          uint64_t v54 = 0;
          v55 = &v54;
          uint64_t v56 = 0x2020000000;
          uint64_t v57 = 0;
          unsigned int v17 = self->_controlQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
          block[3] = &unk_264773388;
          void block[6] = a6;
          block[7] = a3;
          block[4] = self;
          block[5] = &v54;
          block[8] = a7;
          dispatch_sync(v17, block);
          unsigned int v18 = 4 * *((_DWORD *)v55 + 6);
LABEL_108:
          *a6 = v18;
          _Block_object_dispose(&v54, 8);
          return 1;
        }
        goto LABEL_77;
      }
      if (*a6 >= 4)
      {
        unsigned int v23 = [(ASDClockDevice *)self clockIsStable];
        goto LABEL_95;
      }
      return 0;
    }
    if (*a6 >= 4)
    {
      unsigned int v23 = [(ASDClockDevice *)self clockAlgorithm];
      goto LABEL_95;
    }
    return 0;
  }
  if (mSelector != 1634429294)
  {
    if (mSelector == 1668049764)
    {
      if (*a6 < 4) {
        return 0;
      }
      unsigned int v23 = [(ASDClockDevice *)self clockDomain];
LABEL_95:
      *(_DWORD *)a7 = v23;
      goto LABEL_96;
    }
    goto LABEL_77;
  }
  int v58 = 1633969526;
  uint64_t v54 = *(void *)&a3->mSelector;
  LODWORD(v55) = a3->mElement;
  LODWORD(v54) = 1870098020;
  v29 = [(ASDObject *)self owner];
  char v8 = [v29 getProperty:&v54 withQualifierSize:4 qualifierData:&v58 dataSize:a6 andData:a7 forClient:v11];

  return v8;
}

void __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = **(unsigned int **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 64) count] <= v3 >> 2) {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) count];
  }
  else {
    unint64_t v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (*(_DWORD *)(*(void *)(a1 + 56) + 4) == 1735159650
          || objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "controlScope", (void)v11) == *(_DWORD *)(*(void *)(a1 + 56) + 4))
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == v4) {
            goto LABEL_15;
          }
          *(_DWORD *)(*(void *)(a1 + 64) + 4 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = [v10 objectID];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
LABEL_15:
}

void __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v8;
    while (1)
    {
      if (*(void *)v8 != v6) {
        objc_enumerationMutation(v3);
      }
      if (!--v5)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

void __89__ASDClockDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (*(_DWORD *)(a1[6] + 4) == 1735159650
          || objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "controlScope", (void)v9) == *(_DWORD *)(a1[6] + 4))
        {
          if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[7]) {
            goto LABEL_12;
          }
          *(_DWORD *)(a1[8] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
LABEL_12:
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1853059700) {
    return 1;
  }
  if (a3->mSelector == 1819173229)
  {
    return [(ASDClockDevice *)self canChangeDeviceName];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDClockDevice;
    return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
  }
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  if (!-[ASDClockDevice hasProperty:](self, "hasProperty:")
    || ![(ASDClockDevice *)self isPropertySettable:a3])
  {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if (a3->mSelector == 1818850926)
  {
    if (v10 == 4)
    {
      self->_isAlive = *(_DWORD *)a7 != 0;
      return 1;
    }
    return 0;
  }
  if (mSelector == 1853059700)
  {
    if (v10 == 8)
    {
      double v19 = *(double *)a7;
      [(ASDClockDevice *)self samplingRates];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v28 != v23) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) doubleValue];
            if (vabdd_f64(v19, v25) < 0.001)
            {

              BOOL v18 = [(ASDClockDevice *)self changeSamplingRate:v19];
              goto LABEL_27;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      BOOL v18 = 0;
LABEL_27:

      return v18;
    }
    return 0;
  }
  if (mSelector != 1819173229)
  {
    v26.receiver = self;
    v26.super_class = (Class)ASDClockDevice;
    return [(ASDObject *)&v26 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
  }
  if (v10 != 8) {
    return 0;
  }
  double v16 = *(double *)a7;
  return [(ASDClockDevice *)self changeDeviceName:*(void *)&v16];
}

- (void)addControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __29__ASDClockDevice_addControl___block_invoke;
    v15 = &unk_2647731F8;
    double v16 = self;
    id v7 = v4;
    id v17 = v7;
    dispatch_sync(controlQueue, &block);
    [v7 setOwner:self];
    LODWORD(v11) = 0;
    uint64_t v8 = [(ASDObject *)self propertyChangedDelegate];
    [v8 changedProperty:&v10 forObject:self];

    long long v9 = [(ASDObject *)self propertyChangedDelegate];
    [v9 changedProperty:&v10 forObject:self];
  }
}

uint64_t __29__ASDClockDevice_addControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)removeControl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __32__ASDClockDevice_removeControl___block_invoke;
    uint64_t v14 = &unk_2647731F8;
    v15 = self;
    id v16 = v4;
    dispatch_sync(controlQueue, &block);
    LODWORD(v10) = 0;
    id v7 = [(ASDObject *)self propertyChangedDelegate];
    [v7 changedProperty:&v9 forObject:self];

    uint64_t v8 = [(ASDObject *)self propertyChangedDelegate];
    [v8 changedProperty:&v9 forObject:self];
  }
}

uint64_t __32__ASDClockDevice_removeControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (id)controls
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  controlQueue = self->_controlQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__ASDClockDevice_controls__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(controlQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __26__ASDClockDevice_controls__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 64)];
  return MEMORY[0x270F9A758]();
}

- (void)requestConfigurationChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDClockDevice *)self configurationChangeDelegate];
  [v5 requestConfigurationChangeForDevice:self withBlock:v4];
}

- (void)abortConfigurationChange:(void *)a3
{
}

- (void)performConfigurationChange:(void *)a3
{
  (*((void (**)(void *, SEL))a3 + 2))(a3, a2);
}

- (int)addClient:(const AudioServerPlugInClientInfo *)a3
{
  return 0;
}

- (int)removeClient:(const AudioServerPlugInClientInfo *)a3
{
  return 0;
}

- (int)startIOForClient:(unsigned int)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__ASDClockDevice_startIOForClient___block_invoke;
  v6[3] = &unk_2647733D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__ASDClockDevice_startIOForClient___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 104))
  {
    v2 = (void *)MEMORY[0x22A63EEF0]();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) performStartIO];
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    ++*(void *)(*(void *)(a1 + 32) + 104);
  }
}

- (int)stopIOForClient:(unsigned int)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__ASDClockDevice_stopIOForClient___block_invoke;
  v6[3] = &unk_2647733D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__ASDClockDevice_stopIOForClient___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 104);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 104) = v4;
    if (!*(void *)(*(void *)(a1 + 32) + 104))
    {
      uint64_t v6 = (void *)MEMORY[0x22A63EEF0]();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) performStopIO];
    }
  }
}

- (int)performStartIO
{
  if ([(ASDClockDevice *)self isRunning])
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ASDClockDevice.m" lineNumber:845 description:@"performStartIO should only be called when IO is not running"];
  }
  self->_isRunning = 1;
  LODWORD(v8) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v7 forObject:self];

  return 0;
}

- (int)performStopIO
{
  if (![(ASDClockDevice *)self isRunning])
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ASDClockDevice.m" lineNumber:863 description:@"performStopIO should only be called when IO is running"];
  }
  self->_isRunning = 0;
  LODWORD(v8) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v7 forObject:self];

  return 0;
}

- (void)ioThreadStateChange:(id)a3
{
  id v4 = a3;
  ioReferenceQueue = self->_ioReferenceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__ASDClockDevice_ioThreadStateChange___block_invoke;
  v7[3] = &unk_2647731F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(ioReferenceQueue, v7);
}

uint64_t __38__ASDClockDevice_ioThreadStateChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performIOThreadStateChange:*(void *)(a1 + 40)];
}

- (void)setSamplingRate:(double)a3
{
  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASDClockDevice_setSamplingRate___block_invoke;
  block[3] = &unk_2647732E8;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(sampleRateQueue, block);
  LODWORD(v7) = 0;
  id v5 = [(ASDObject *)self propertyChangedDelegate];
  [v5 changedProperty:&v6 forObject:self];
}

void __34__ASDClockDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _updateTimestampPeriod:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateSafetyOffsets:*(double *)(a1 + 40)];
}

- (double)samplingRate
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ASDClockDevice_samplingRate__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __30__ASDClockDevice_samplingRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 80);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  return 0;
}

- (void)setSamplingRates:(id)a3
{
  id v4 = a3;
  sampleRateQueue = self->_sampleRateQueue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __35__ASDClockDevice_setSamplingRates___block_invoke;
  uint64_t v13 = &unk_2647731F8;
  uint64_t v14 = self;
  id v15 = v4;
  id v6 = v4;
  dispatch_sync(sampleRateQueue, &block);
  LODWORD(v9) = 0;
  uint64_t v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v8 forObject:self];
}

void __35__ASDClockDevice_setSamplingRates___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v3;
}

- (NSArray)samplingRates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  int v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__ASDClockDevice_samplingRates__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __31__ASDClockDevice_samplingRates__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setDeviceName:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  deviceName = self->_deviceName;
  self->_deviceName = v4;

  LODWORD(v8) = 0;
  uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
  [v6 changedProperty:&v7 forObject:self];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (BOOL)changeDeviceName:(id)a3
{
  return 0;
}

- (void)setTimestampPeriod:(unsigned int)a3
{
  if (self->_timestampPeriod != a3)
  {
    self->_timestampPeriod = a3;
    LODWORD(v6) = 0;
    uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
    [v4 changedProperty:&v5 forObject:self];
  }
}

- (unsigned)timestampPeriod
{
  return self->_timestampPeriod;
}

- (void)updateTimestampPeriod
{
  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ASDClockDevice_updateTimestampPeriod__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(sampleRateQueue, block);
}

void __39__ASDClockDevice_updateTimestampPeriod__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  [*(id *)(a1 + 32) _updateTimestampPeriod:*(double *)(*(void *)(a1 + 32) + 80)];
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (OS_dispatch_queue)ioReferenceQueue
{
  return self->_ioReferenceQueue;
}

- (void)setInputLatency:(unsigned int)a3
{
  self->_inputLatency = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)inputLatency
{
  return self->_inputLatency;
}

- (void)setOutputLatency:(unsigned int)a3
{
  self->_outputLatency = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)outputLatency
{
  return self->_outputLatency;
}

- (void)setClockDomain:(unsigned int)a3
{
  self->_clockDomain = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)clockDomain
{
  return self->_clockDomain;
}

- (void)setClockAlgorithm:(unsigned int)a3
{
  self->_clockAlgorithm = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)clockAlgorithm
{
  return self->_clockAlgorithm;
}

- (void)setClockIsStable:(BOOL)a3
{
  self->_clockIsStable = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (BOOL)clockIsStable
{
  return self->_clockIsStable;
}

- (void)setTransportType:(unsigned int)a3
{
  self->_transportType = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setGetZeroTimestampBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDClockDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDClockDevice.m" lineNumber:1128 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_id getZeroTimestampBlock = v5;

  self->_getZeroTimestampBlockUnretained = self->_getZeroTimestampBlock;
}

- (void)setBeginIOOperationBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDClockDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDClockDevice.m" lineNumber:1136 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_id beginIOOperationBlock = v5;

  self->_beginIOOperationBlockUnretained = self->_beginIOOperationBlock;
}

- (void)setEndIOOperationBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDClockDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDClockDevice.m" lineNumber:1143 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id endIOOperationBlock = self->_endIOOperationBlock;
  self->_id endIOOperationBlock = v5;

  self->_endIOOperationBlockUnretained = self->_endIOOperationBlock;
}

- (id)getZeroTimestampBlockUnretainedPtr
{
  return &self->_getZeroTimestampBlockUnretained;
}

- (id)beginIOOperationBlockUnretainedPtr
{
  return &self->_beginIOOperationBlockUnretained;
}

- (id)endIOOperationBlockUnretainedPtr
{
  return &self->_endIOOperationBlockUnretained;
}

- (void)systemWillSleep
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__ASDClockDevice_systemWillSleep__block_invoke;
  v9[3] = &unk_2647731F8;
  dispatch_semaphore_t v10 = v3;
  uint64_t v5 = v4;
  id v11 = v5;
  uint64_t v6 = v3;
  [(ASDClockDevice *)self requestConfigurationChange:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  wakeSemaphore = self->_wakeSemaphore;
  self->_wakeSemaphore = (OS_dispatch_semaphore *)v5;
  id v8 = v5;
}

intptr_t __33__ASDClockDevice_systemWillSleep__block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)systemHasPoweredOn
{
  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    uint64_t v5 = wakeSemaphore;
    dispatch_semaphore_signal(v5);
    dispatch_semaphore_t v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;
  }
}

- (void)dealloc
{
  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    dispatch_semaphore_signal(wakeSemaphore);
    dispatch_semaphore_t v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDClockDevice;
  [(ASDObject *)&v5 dealloc];
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASDClockDevice;
  uint64_t v7 = [(ASDObject *)&v57 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  id v8 = [v6 stringByAppendingString:@"|        "];
  id v9 = [(ASDClockDevice *)self deviceName];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  id v10 = [(ASDClockDevice *)self manufacturerName];
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASDClockDevice *)self modelName];
  [v7 appendFormat:@"%@|    Model Name: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  id v12 = [(ASDClockDevice *)self deviceUID];
  [v7 appendFormat:@"%@|    Device UID: %s\n", v6, objc_msgSend(v12, "UTF8String")];

  id v13 = [(ASDClockDevice *)self modelUID];
  [v7 appendFormat:@"%@|    Model UID: %s\n", v6, objc_msgSend(v13, "UTF8String")];

  int v14 = [(ASDClockDevice *)self transportType];
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = v15;
  }
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v16;
  }
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = ((__int16)v14 >> 8);
  }
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697) {
    uint64_t v19 = 32;
  }
  else {
    uint64_t v19 = (char)v14;
  }
  [v7 appendFormat:@"%@|    Transport Type: %c%c%c%c\n", v6, v15, v16, v17, v19];
  [v7 appendFormat:@"%@|    Clock Domain: 0x%08x\n", v6, -[ASDClockDevice clockDomain](self, "clockDomain")];
  unsigned int v20 = [(ASDClockDevice *)self clockAlgorithm];
  uint64_t v21 = @"12Pt Moving Window Average";
  if (v20 == 1768518246) {
    uint64_t v22 = @"Simple IIR";
  }
  else {
    uint64_t v22 = @"Unknown";
  }
  if (v20 != 1835103847) {
    uint64_t v21 = v22;
  }
  if (v20 == 1918990199) {
    uint64_t v23 = @"Raw";
  }
  else {
    uint64_t v23 = v21;
  }
  [v7 appendFormat:@"%@|    Clock Algorithm: %s\n", v6, -[__CFString UTF8String](v23, "UTF8String")];
  if ([(ASDClockDevice *)self clockIsStable]) {
    int v24 = @"YES";
  }
  else {
    int v24 = @"NO";
  }
  [v7 appendFormat:@"%@|    Clock Is Stable: %@\n", v6, v24];
  if (self->_isAlive) {
    double v25 = @"YES";
  }
  else {
    double v25 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Active: %@\n", v6, v25];
  if ([(ASDClockDevice *)self isRunning]) {
    objc_super v26 = @"YES";
  }
  else {
    objc_super v26 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Running: %@\n", v6, v26];
  [(ASDClockDevice *)self samplingRate];
  [v7 appendFormat:@"%@|    Nominal Sample Rate: %f\n", v6, v27];
  unsigned int v48 = v6;
  [v7 appendFormat:@"%@|    Available Nominal Sample Rates:\n", v6];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v28 = [(ASDClockDevice *)self samplingRates];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = 0;
    uint64_t v32 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v54 != v32) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * i) doubleValue];
        [v7 appendFormat:@"%@Rate[%u]: %f\n", v8, v31 + i, v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v59 count:16];
      uint64_t v31 = (v31 + i);
    }
    while (v30);
  }

  BOOL v35 = [(ASDClockDevice *)self isHidden];
  uint64_t v36 = @"NO";
  if (v35) {
    uint64_t v36 = @"YES";
  }
  [v7 appendFormat:@"%@|    Is Hidden: %@\n", v48, v36];
  [v7 appendFormat:@"%@|    Input Latency: %u\n", v48, -[ASDClockDevice inputLatency](self, "inputLatency")];
  [v7 appendFormat:@"%@|    Output Latency: %u\n", v48, -[ASDClockDevice outputLatency](self, "outputLatency")];
  [v7 appendFormat:@"%@|    Zero Timestamp Period: %u\n", v48, -[ASDClockDevice timestampPeriod](self, "timestampPeriod")];
  [v7 appendFormat:@"%@|    Controls:\n", v48];
  unsigned int v37 = [(ASDClockDevice *)self controls];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    unsigned int v39 = [(ASDClockDevice *)self controls];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = 0;
      uint64_t v43 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v50 != v43) {
            objc_enumerationMutation(v39);
          }
          objc_super v45 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          if (v4)
          {
            v46 = [v45 diagnosticDescriptionWithIndent:v8 walkTree:1];
            [v7 appendString:v46];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v48, v42 + j, objc_msgSend(v45, "objectID")];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
        uint64_t v42 = (v42 + j);
      }
      while (v41);
    }
  }
  return v7;
}

- (id)driverClassName
{
  return @"ClockDevice";
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)canChangeDeviceName
{
  return self->_canChangeDeviceName;
}

- (void)setCanChangeDeviceName:(BOOL)a3
{
  self->_canChangeDeviceName = a3;
}

- (id)getZeroTimestampBlock
{
  return self->_getZeroTimestampBlock;
}

- (id)beginIOOperationBlock
{
  return self->_beginIOOperationBlock;
}

- (id)endIOOperationBlock
{
  return self->_endIOOperationBlock;
}

- (ASDDeviceConfigurationChangeDelegate)configurationChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationChangeDelegate);
  return (ASDDeviceConfigurationChangeDelegate *)WeakRetained;
}

- (void)setConfigurationChangeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationChangeDelegate);
  objc_storeStrong(&self->_endIOOperationBlock, 0);
  objc_storeStrong(&self->_beginIOOperationBlock, 0);
  objc_storeStrong(&self->_getZeroTimestampBlock, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelUID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_wakeSemaphore, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_ioReferenceQueue, 0);
  objc_storeStrong((id *)&self->_sampleRateQueue, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_controls, 0);
}

@end