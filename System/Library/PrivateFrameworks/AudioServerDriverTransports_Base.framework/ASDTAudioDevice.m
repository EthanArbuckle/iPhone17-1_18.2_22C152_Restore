@interface ASDTAudioDevice
+ (double)defaultSamplingRate;
+ (id)deviceForConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5;
- (ASDTAudioDevice)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5;
- (ASDTDeviceManager)deviceManager;
- (ASDTPMSequencer)pmSequencer;
- (BOOL)addControls:(id)a3;
- (BOOL)addCustomProperties:(id)a3;
- (BOOL)addPMDevices:(id)a3;
- (BOOL)addStreams:(id)a3;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)configurationChangesPending;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)pmNoStateChangeOnFailure;
- (BOOL)terminated;
- (BOOL)updateCustomProperty:(id)a3 withAddress:(id)a4;
- (BOOL)willDoReadInputInPlace;
- (BOOL)willDoWriteMixInPlace;
- (NSArray)statusProtocolObjects;
- (NSDictionary)inputLatencies;
- (NSDictionary)outputLatencies;
- (NSDictionary)status;
- (NSMutableDictionary)ioThreads;
- (NSSet)relatedDeviceObjectIDs;
- (NSSet)relatedDeviceUIDs;
- (id)allStreams;
- (id)customPropertyForAddress:(id)a3;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)updateIOThreadStateChangeDescription:(id)a3;
- (id)willDoReadInputBlock;
- (id)willDoWriteMixBlock;
- (int)performPowerStateIdle:(int)a3;
- (int)performPowerStateOn;
- (int)performPowerStatePrepare:(int)a3;
- (int)performPowerStateSleep;
- (int)performStartIO;
- (int)performStopIO;
- (int)powerState;
- (int)streamPowerStateTransition:(int)a3;
- (int)systemCompletedPowerOn;
- (int)systemSleepPending;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)numberOfIOThreadsForUseCaseID:(unsigned int)a3;
- (unsigned)numberOfIOThreadsForUseCaseInDescription:(id)a3;
- (unsigned)pmOrderPowerDown;
- (unsigned)pmOrderPowerUp;
- (void)_updateSafetyOffsets:(double)a3;
- (void)addStatusProtocolObject:(id)a3 toArray:(id)a4;
- (void)doTerminate;
- (void)ioThreadStateChange:(id)a3;
- (void)performIOThreadStateChange:(id)a3;
- (void)performStopIO;
- (void)setDeviceManager:(id)a3;
- (void)setInputLatencies:(id)a3;
- (void)setIoThreads:(id)a3;
- (void)setOutputLatencies:(id)a3;
- (void)setPmNoStateChangeOnFailure:(BOOL)a3;
- (void)setPmOrderPowerDown:(unsigned int)a3;
- (void)setPmOrderPowerUp:(unsigned int)a3;
- (void)setPmSequencer:(id)a3;
- (void)setPowerState:(int)a3;
- (void)setRelatedDeviceUIDs:(id)a3;
- (void)setSamplingRate:(double)a3;
- (void)setStatusProtocolObjects:(id)a3;
- (void)setTerminated:(BOOL)a3;
- (void)setWillDoReadInputInPlace:(BOOL)a3;
- (void)setWillDoWriteMixInPlace:(BOOL)a3;
- (void)setupStatusProtocol;
- (void)terminate;
- (void)updateInputLatency;
- (void)updateOutputLatency;
@end

@implementation ASDTAudioDevice

+ (id)deviceForConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)[v7 asdtSubclass];
  if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
  {
    v11 = (void *)[[v10 alloc] initWithConfig:v7 withDeviceManager:v8 andPlugin:v9];
  }
  else
  {
    v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v7 objectForKeyedSubscript:@"Subclass"];
      objc_claimAutoreleasedReturnValue();
      +[ASDTAudioDevice deviceForConfig:withDeviceManager:andPlugin:]();
    }

    v11 = 0;
  }

  return v11;
}

+ (double)defaultSamplingRate
{
  return 48000.0;
}

- (ASDTAudioDevice)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 asdtDeviceUID];
  if (!v11) {
    goto LABEL_15;
  }
  v40.receiver = self;
  v40.super_class = (Class)ASDTAudioDevice;
  self = [(ASDAudioDevice *)&v40 initWithDeviceUID:v11 withPlugin:v10];
  if (self)
  {
    v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    [(ASDTAudioDevice *)self setIoThreads:v12];

    -[ASDAudioDevice setCanBeDefaultInputDevice:](self, "setCanBeDefaultInputDevice:", [v8 asdtCanBeDefaultInputDevice]);
    -[ASDAudioDevice setCanBeDefaultOutputDevice:](self, "setCanBeDefaultOutputDevice:", [v8 asdtCanBeDefaultOutputDevice]);
    -[ASDAudioDevice setCanBeDefaultSystemDevice:](self, "setCanBeDefaultSystemDevice:", [v8 asdtCanBeDefaultSystemDevice]);
    [(ASDTAudioDevice *)self setDeviceManager:v9];
    -[ASDAudioDevice setClockDomain:](self, "setClockDomain:", [v8 asdtClockDomain]);
    v13 = [v8 asdtName];
    [(ASDAudioDevice *)self setDeviceName:v13];

    [(ASDAudioDevice *)self setManufacturerName:@"Apple Inc."];
    v14 = [v8 asdtDeviceModel];
    [(ASDAudioDevice *)self setModelName:v14];

    -[ASDAudioDevice setTransportType:](self, "setTransportType:", [v8 asdtTransportType]);
    -[ASDTAudioDevice setPmOrderPowerUp:](self, "setPmOrderPowerUp:", [v8 asdtPMOrderWithDefaultForPowerUp:1]);
    -[ASDTAudioDevice setPmOrderPowerDown:](self, "setPmOrderPowerDown:", [v8 asdtPMOrderWithDefaultForPowerUp:0]);
    -[ASDTAudioDevice setPmNoStateChangeOnFailure:](self, "setPmNoStateChangeOnFailure:", [v8 asdtPMNoStateChangeOnFailure]);
    [(ASDTAudioDevice *)self setPowerState:0];
    v15 = [v8 asdtRelatedDeviceUIDs];
    [(ASDTAudioDevice *)self setRelatedDeviceUIDs:v15];

    v16 = [(ASDAudioDevice *)self modelName];
    LODWORD(v15) = v16 == 0;

    if (v15)
    {
      v17 = [(ASDAudioDevice *)self deviceUID];
      [(ASDAudioDevice *)self setModelName:v17];
    }
    v18 = [(ASDAudioDevice *)self deviceName];
    BOOL v19 = v18 == 0;

    if (v19)
    {
      v20 = [(ASDAudioDevice *)self modelName];
      [(ASDAudioDevice *)self setDeviceName:v20];
    }
    [(ASDTAudioDevice *)self setWillDoReadInputInPlace:1];
    [(ASDTAudioDevice *)self setWillDoWriteMixInPlace:1];
    double v39 = 0.0;
    [(id)objc_opt_class() defaultSamplingRate];
    id v38 = 0;
    char v21 = objc_msgSend(v8, "asdtSamplingRate:andSamplingRates:withDefault:", &v39, &v38);
    id v22 = v38;
    if ((v21 & 1) == 0) {
      goto LABEL_14;
    }
    [(ASDTAudioDevice *)self setSamplingRate:v39];
    [(ASDAudioDevice *)self setSamplingRates:v22];
    v23 = [(ASDAudioDevice *)self samplingRates];
    v24 = [v8 asdtInputLatenciesForSamplingRates:v23];
    [(ASDTAudioDevice *)self setInputLatencies:v24];

    v25 = [(ASDAudioDevice *)self samplingRates];
    uint64_t v26 = [v8 asdtOutputLatenciesForSamplingRates:v25];
    [(ASDTAudioDevice *)self setOutputLatencies:v26];

    v27 = [v8 asdtCustomProperties];
    LOBYTE(v26) = [(ASDTAudioDevice *)self addCustomProperties:v27];

    if ((v26 & 1) == 0) {
      goto LABEL_14;
    }
    v28 = [v8 asdtControls];
    BOOL v29 = [(ASDTAudioDevice *)self addControls:v28];

    if (!v29) {
      goto LABEL_14;
    }
    v30 = [v8 asdtStreams];
    BOOL v31 = [(ASDTAudioDevice *)self addStreams:v30];

    if (v31)
    {
      v32 = [v8 asdtPMDevices];
      uint64_t v33 = +[ASDTPMSequencer pmSequencerWithPMDeviceConfig:v32 withParent:self];
      [(ASDTAudioDevice *)self setPmSequencer:v33];

      v34 = [(ASDTAudioDevice *)self pmSequencer];
      LOBYTE(v33) = v34 == 0;

      if ((v33 & 1) == 0)
      {

        goto LABEL_13;
      }
      v37 = ASDTBaseLogType();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTAudioDevice initWithConfig:withDeviceManager:andPlugin:]();
      }
    }
    else
    {
LABEL_14:
    }
LABEL_15:
    v35 = 0;
    goto LABEL_16;
  }
LABEL_13:
  self = self;
  v35 = self;
LABEL_16:

  return v35;
}

- (BOOL)addCustomProperties:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v62 count:16];
  if (v3)
  {
    uint64_t v28 = *(void *)v38;
    while (2)
    {
      uint64_t v26 = v3;
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        v5 = +[ASDTCustomProperty customPropertyForConfig:](ASDTCustomProperty, "customPropertyForConfig:", *(void *)(*((void *)&v37 + 1) + 8 * i), v26);
        if (!v5)
        {
          v6 = ASDTBaseLogType();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            [(ASDAudioDevice *)self deviceUID];
            objc_claimAutoreleasedReturnValue();
            -[ASDTAudioDevice addCustomProperties:]();
          }
LABEL_20:

          BOOL v14 = 0;
          goto LABEL_22;
        }
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v6 = [(ASDTAudioDevice *)self customProperties];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v61 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v34;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v34 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              v11 = [v10 address];
              v12 = [v5 address];
              int v13 = [v11 isEqual:v12];

              if (v13)
              {
                v15 = ASDTBaseLogType();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  BOOL v31 = [(ASDAudioDevice *)self deviceUID];
                  if ([v10 selector] >> 29
                    && [v10 selector] >> 24 <= 0x7E)
                  {
                    unsigned int v17 = [v10 selector] >> 24;
                  }
                  else
                  {
                    unsigned int v17 = 32;
                  }
                  unsigned int v29 = v17;
                  if (([v10 selector] & 0xE00000) != 0
                    && ([v10 selector] >> 16) <= 0x7Eu)
                  {
                    int v18 = ([v10 selector] >> 16);
                  }
                  else
                  {
                    int v18 = 32;
                  }
                  LODWORD(v26) = v18;
                  if ((objc_msgSend(v10, "selector", v26) & 0xE000) != 0
                    && ((unsigned __int16)[v10 selector] >> 8) <= 0x7Eu)
                  {
                    int v19 = ((unsigned __int16)[v10 selector] >> 8);
                  }
                  else
                  {
                    int v19 = 32;
                  }
                  if (([v10 selector] & 0xE0) != 0
                    && [v10 selector] <= 0x7Eu)
                  {
                    int v20 = [v10 selector];
                  }
                  else
                  {
                    int v20 = 32;
                  }
                  if ([v10 scope] >> 29
                    && [v10 scope] >> 24 <= 0x7E)
                  {
                    unsigned int v21 = [v10 scope] >> 24;
                  }
                  else
                  {
                    unsigned int v21 = 32;
                  }
                  if (([v10 scope] & 0xE00000) != 0
                    && ([v10 scope] >> 16) <= 0x7Eu)
                  {
                    int v22 = ([v10 scope] >> 16);
                  }
                  else
                  {
                    int v22 = 32;
                  }
                  if (([v10 scope] & 0xE000) != 0
                    && ((unsigned __int16)[v10 scope] >> 8) <= 0x7Eu)
                  {
                    int v23 = ((unsigned __int16)[v10 scope] >> 8);
                  }
                  else
                  {
                    int v23 = 32;
                  }
                  if (([v10 scope] & 0xE0) != 0 && objc_msgSend(v10, "scope") <= 0x7Eu) {
                    int v24 = [v10 scope];
                  }
                  else {
                    int v24 = 32;
                  }
                  int v25 = [v10 element];
                  *(_DWORD *)buf = 138414594;
                  v42 = v31;
                  __int16 v43 = 1024;
                  unsigned int v44 = v29;
                  __int16 v45 = 1024;
                  int v46 = v27;
                  __int16 v47 = 1024;
                  int v48 = v19;
                  __int16 v49 = 1024;
                  int v50 = v20;
                  __int16 v51 = 1024;
                  unsigned int v52 = v21;
                  __int16 v53 = 1024;
                  int v54 = v22;
                  __int16 v55 = 1024;
                  int v56 = v23;
                  __int16 v57 = 1024;
                  int v58 = v24;
                  __int16 v59 = 1024;
                  int v60 = v25;
                  _os_log_error_impl(&dword_2489BC000, v15, OS_LOG_TYPE_ERROR, "%@: Device already has property '%c%c%c%c' with scope '%c%c%c%c' and element %u", buf, 0x42u);
                }
                goto LABEL_20;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v61 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }

        [(ASDTAudioDevice *)self addCustomProperty:v5];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v62 count:16];
      BOOL v14 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_22:

  return v14;
}

- (BOOL)addControls:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = +[ASDTControlFactory controlForConfig:withDevice:](ASDTControlFactory, "controlForConfig:withDevice:", *(void *)(*((void *)&v12 + 1) + 8 * i), self, (void)v12);
        if (!v8)
        {
          id v10 = ASDTBaseLogType();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            [(ASDAudioDevice *)self deviceUID];
            objc_claimAutoreleasedReturnValue();
            -[ASDTAudioDevice addControls:]();
          }

          BOOL v9 = 0;
          goto LABEL_13;
        }
        [(ASDAudioDevice *)self addControl:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)addStreams:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = +[ASDTStream streamForConfig:withDevice:](ASDTStream, "streamForConfig:withDevice:", *(void *)(*((void *)&v13 + 1) + 8 * i), self, (void)v13);
        BOOL v9 = v8;
        if (!v8)
        {
          v11 = ASDTBaseLogType();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            [(ASDAudioDevice *)self deviceUID];
            objc_claimAutoreleasedReturnValue();
            -[ASDTAudioDevice addStreams:]();
          }

          BOOL v10 = 0;
          goto LABEL_16;
        }
        if ([v8 direction] == 1768845428) {
          [(ASDAudioDevice *)self addInputStream:v9];
        }
        else {
          [(ASDAudioDevice *)self addOutputStream:v9];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (BOOL)addPMDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASDTAudioDevice *)self pmSequencer];
  char v6 = [v5 addPMDevicesWithConfig:v4];

  return v6;
}

- (void)updateInputLatency
{
  uint64_t v3 = [(ASDTAudioDevice *)self inputLatencies];

  if (v3)
  {
    id v4 = NSNumber;
    [(ASDAudioDevice *)self samplingRate];
    objc_msgSend(v4, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [(ASDTAudioDevice *)self inputLatencies];
    char v6 = [v5 objectForKey:v7];
    -[ASDAudioDevice setInputLatency:](self, "setInputLatency:", [v6 unsignedIntValue]);
  }
}

- (void)updateOutputLatency
{
  uint64_t v3 = [(ASDTAudioDevice *)self outputLatencies];

  if (v3)
  {
    id v4 = NSNumber;
    [(ASDAudioDevice *)self samplingRate];
    objc_msgSend(v4, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [(ASDTAudioDevice *)self outputLatencies];
    char v6 = [v5 objectForKey:v7];
    -[ASDAudioDevice setOutputLatency:](self, "setOutputLatency:", [v6 unsignedIntValue]);
  }
}

- (void)setInputLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_inputLatencies, a3);
  [(ASDTAudioDevice *)self updateInputLatency];
}

- (void)setOutputLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_outputLatencies, a3);
  [(ASDTAudioDevice *)self updateOutputLatency];
}

- (void)_updateSafetyOffsets:(double)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [(ASDAudioDevice *)self outputStreams];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    char v6 = [(ASDAudioDevice *)self outputStreams];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (!v7)
    {
LABEL_17:

      goto LABEL_18;
    }
    char v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v13 = [v12 safetyOffset];
          if (v13 <= v9) {
            uint64_t v9 = v9;
          }
          else {
            uint64_t v9 = v13;
          }
          char v8 = 1;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);

    if (v8)
    {
      [(ASDAudioDevice *)self setOutputSafetyOffset:v9];
      char v6 = ASDTBaseLogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTAudioDevice _updateSafetyOffsets:]();
      }
      goto LABEL_17;
    }
  }
LABEL_18:
  long long v14 = [(ASDAudioDevice *)self inputStreams];
  BOOL v15 = [v14 count] == 0;

  if (v15) {
    return;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v16 = [(ASDAudioDevice *)self inputStreams];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v17) {
    goto LABEL_34;
  }
  char v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)v25;
  do
  {
    for (uint64_t j = 0; j != v17; ++j)
    {
      if (*(void *)v25 != v20) {
        objc_enumerationMutation(v16);
      }
      int v22 = *(void **)(*((void *)&v24 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v23 = [v22 safetyOffset];
        if (v23 <= v19) {
          uint64_t v19 = v19;
        }
        else {
          uint64_t v19 = v23;
        }
        char v18 = 1;
      }
    }
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  }
  while (v17);

  if (v18)
  {
    [(ASDAudioDevice *)self setInputSafetyOffset:v19];
    long long v16 = ASDTBaseLogType();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      [(ASDAudioDevice *)self deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTAudioDevice _updateSafetyOffsets:]();
    }
LABEL_34:
  }
}

- (void)setSamplingRate:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASDTAudioDevice;
  [(ASDAudioDevice *)&v4 setSamplingRate:a3];
  [(ASDTAudioDevice *)self updateInputLatency];
  [(ASDTAudioDevice *)self updateOutputLatency];
}

- (BOOL)changeSamplingRate:(double)a3
{
  objc_initWeak(&location, self);
  [(ASDAudioDevice *)self samplingRate];
  if (v5 != a3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__ASDTAudioDevice_changeSamplingRate___block_invoke;
    v7[3] = &unk_265244028;
    objc_copyWeak(v8, &location);
    v8[1] = *(id *)&a3;
    [(ASDAudioDevice *)self requestConfigurationChange:v7];
    objc_destroyWeak(v8);
  }
  objc_destroyWeak(&location);
  return 1;
}

void __38__ASDTAudioDevice_changeSamplingRate___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSamplingRate:v1];
}

- (id)willDoReadInputBlock
{
  BOOL v3 = [(ASDAudioDevice *)self hasInput];
  BOOL v4 = [(ASDTAudioDevice *)self willDoReadInputInPlace];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__ASDTAudioDevice_willDoReadInputBlock__block_invoke;
  aBlock[3] = &__block_descriptor_34_e14_i28__0I8_12_20l;
  BOOL v8 = v3;
  BOOL v9 = v4;
  double v5 = _Block_copy(aBlock);
  return v5;
}

uint64_t __39__ASDTAudioDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  *a3 = *(unsigned char *)(a1 + 32);
  *a4 = *(unsigned char *)(a1 + 33);
  return 0;
}

- (id)willDoWriteMixBlock
{
  BOOL v3 = [(ASDAudioDevice *)self hasOutput];
  BOOL v4 = [(ASDTAudioDevice *)self willDoWriteMixInPlace];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__ASDTAudioDevice_willDoWriteMixBlock__block_invoke;
  aBlock[3] = &__block_descriptor_34_e14_i28__0I8_12_20l;
  BOOL v8 = v3;
  BOOL v9 = v4;
  double v5 = _Block_copy(aBlock);
  return v5;
}

uint64_t __38__ASDTAudioDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  *a3 = *(unsigned char *)(a1 + 32);
  *a4 = *(unsigned char *)(a1 + 33);
  return 0;
}

- (id)allStreams
{
  BOOL v3 = [(ASDAudioDevice *)self inputStreams];
  BOOL v4 = [(ASDAudioDevice *)self outputStreams];
  double v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (int)streamPowerStateTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(ASDTAudioDevice *)self allStreams];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v10 = objc_msgSend(v9, "pmStateTransition:", v3, (void)v12);
        if (!v5) {
          int v5 = v10;
        }
        if (v10 && (asdtPowerTransitionUpwards(v3) & 1) != 0) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5;
}

- (int)performPowerStateSleep
{
  return [(ASDTAudioDevice *)self streamPowerStateTransition:1685286000];
}

- (int)performPowerStateIdle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1684628588 && [(ASDAudioDevice *)self isRunning])
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTAudioDevice;
    unsigned int v5 = [(ASDAudioDevice *)&v10 performStopIO];
  }
  else
  {
    unsigned int v5 = 0;
  }
  int v6 = [(ASDTAudioDevice *)self streamPowerStateTransition:v3];
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    int v8 = v6;
  }
  else {
    int v8 = v5;
  }
  [(ASDTAudioDevice *)self setStatusProtocolObjects:0];
  return v8;
}

- (int)performPowerStatePrepare:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1970303090) {
    [(ASDTAudioDevice *)self setupStatusProtocol];
  }
  return [(ASDTAudioDevice *)self streamPowerStateTransition:v3];
}

- (int)performPowerStateOn
{
  v4.receiver = self;
  v4.super_class = (Class)ASDTAudioDevice;
  int result = [(ASDAudioDevice *)&v4 performStartIO];
  if (!result) {
    return [(ASDTAudioDevice *)self streamPowerStateTransition:1970435438];
  }
  return result;
}

- (int)performStartIO
{
  if ([(ASDTAudioDevice *)self terminated]) {
    return 1852990585;
  }
  objc_super v4 = [(ASDTAudioDevice *)self pmSequencer];
  int v3 = [v4 executeSequenceToState:1920298606];

  return v3;
}

- (int)performStopIO
{
  int v3 = [(ASDTAudioDevice *)self pmSequencer];
  int v4 = [v3 executeSequenceToState:1768189029];

  unsigned int v5 = [(ASDTAudioDevice *)self ioThreads];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(ASDTAudioDevice *)self ioThreads];
      objc_claimAutoreleasedReturnValue();
      -[ASDTAudioDevice performStopIO]();
    }

    int v8 = [(ASDTAudioDevice *)self ioThreads];
    [v8 removeAllObjects];
  }
  return v4;
}

- (id)updateIOThreadStateChangeDescription:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [v5 asdtIOThreadChangeEvent];
  uint64_t v7 = [v5 asdtIOThreadChangeIsolatedUseCase];
  unsigned int v32 = [v5 asdtIOThreadChangeContextID];
  int v8 = [(ASDTAudioDevice *)self ioThreads];

  if (!v8)
  {
    BOOL v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASDTAudioDevice updateIOThreadStateChangeDescription:](v9);
    }

    objc_super v10 = [(ASDTAudioDevice *)self ioThreads];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      long long v31 = [MEMORY[0x263F08690] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"ASDTAudioDevice.mm" lineNumber:480 description:@"Failed to allocate self.ioThreads"];
    }
  }
  long long v12 = [(ASDTAudioDevice *)self ioThreads];
  long long v13 = [NSNumber numberWithUnsignedInt:v7];
  long long v14 = [v12 objectForKey:v13];

  if (v6 == 1937010544)
  {
    unsigned int v21 = [NSNumber numberWithUnsignedInt:v32];
    [v14 removeObject:v21];

    if (v14 && ![v14 count])
    {
      int v22 = [(ASDTAudioDevice *)self ioThreads];
      unsigned int v23 = [NSNumber numberWithUnsignedInt:v7];
      [v22 removeObjectForKey:v23];

      long long v14 = 0;
    }
    BOOL v19 = [v14 count] == 0;
    uint64_t v20 = "stop";
  }
  else if (v6 == 1937011316)
  {
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
      long long v16 = [(ASDTAudioDevice *)self ioThreads];
      uint64_t v17 = [NSNumber numberWithUnsignedInt:v7];
      [v16 setObject:v15 forKey:v17];

      long long v14 = (void *)v15;
    }
    char v18 = [NSNumber numberWithUnsignedInt:v32];
    [v14 addObject:v18];

    BOOL v19 = [v14 count] == 1;
    uint64_t v20 = "start";
  }
  else
  {
    BOOL v19 = 0;
    uint64_t v20 = "unknown";
  }
  uint64_t v24 = [v14 count];
  long long v25 = (void *)[v5 mutableCopy];
  long long v26 = [NSNumber numberWithUnsignedInt:v24];
  [v25 setObject:v26 forKey:@"useCaseThreadCount"];

  long long v27 = [NSNumber numberWithBool:v19];
  [v25 setObject:v27 forKey:@"isFirstOrWasLast"];

  long long v28 = ASDTBaseLogType();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    long long v29 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)buf = 138413314;
    uint64_t v34 = v29;
    __int16 v35 = 1024;
    unsigned int v36 = v32;
    __int16 v37 = 2080;
    long long v38 = v20;
    __int16 v39 = 1024;
    int v40 = v7;
    __int16 v41 = 1024;
    int v42 = v24;
    _os_log_impl(&dword_2489BC000, v28, OS_LOG_TYPE_DEFAULT, "%@: Thread context %u %s with use case %u, count: %u", buf, 0x28u);
  }
  return v25;
}

- (void)ioThreadStateChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDAudioDevice *)self ioReferenceQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ASDTAudioDevice_ioThreadStateChange___block_invoke;
  v7[3] = &unk_265244070;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__ASDTAudioDevice_ioThreadStateChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateIOThreadStateChangeDescription:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "performIOThreadStateChange:");
}

- (void)performIOThreadStateChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 ioThreadStateChange:v4];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (unsigned)numberOfIOThreadsForUseCaseID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTAudioDevice *)self ioThreads];
  id v5 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  LODWORD(v4) = [v6 count];
  return v4;
}

- (unsigned)numberOfIOThreadsForUseCaseInDescription:(id)a3
{
  id v4 = a3;
  LODWORD(self) = -[ASDTAudioDevice numberOfIOThreadsForUseCaseID:](self, "numberOfIOThreadsForUseCaseID:", [v4 asdtIOThreadChangeIsolatedUseCase]);

  return self;
}

- (int)systemSleepPending
{
  id v2 = [(ASDTAudioDevice *)self pmSequencer];
  int v3 = [v2 executeSequenceToState:1936483696];

  return v3;
}

- (int)systemCompletedPowerOn
{
  id v2 = [(ASDTAudioDevice *)self pmSequencer];
  int v3 = [v2 executeSequenceToState:1768189029];

  return v3;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)ASDTAudioDevice;
  id v61 = [(ASDAudioDevice *)&v74 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  uint64_t v7 = [(ASDTAudioDevice *)self inputLatencies];
  BOOL v8 = [v7 count] == 0;

  if (!v8)
  {
    [v61 appendFormat:@"%@|    input latencies (sampeRate : frames):\n", v6];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    BOOL v9 = [(ASDTAudioDevice *)self inputLatencies];
    long long v10 = [v9 allKeys];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v71 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          uint64_t v15 = [(ASDTAudioDevice *)self inputLatencies];
          long long v16 = [v15 objectForKeyedSubscript:v14];

          [v14 doubleValue];
          [v61 appendFormat:@"%@|        %6.0lf : %u\n", v6, v17, objc_msgSend(v16, "unsignedIntValue")];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v11);
    }
  }
  char v18 = [(ASDTAudioDevice *)self outputLatencies];
  BOOL v19 = [v18 count] == 0;

  if (!v19)
  {
    [v61 appendFormat:@"%@|    output latencies (sampleRate : frames):\n", v6];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v20 = [(ASDTAudioDevice *)self outputLatencies];
    unsigned int v21 = [v20 allKeys];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v67 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          long long v26 = [(ASDTAudioDevice *)self outputLatencies];
          long long v27 = [v26 objectForKeyedSubscript:v25];

          [v25 doubleValue];
          [v61 appendFormat:@"%@|        %6.0lf : %u\n", v6, v28, objc_msgSend(v27, "unsignedIntValue")];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v22);
    }
  }
  [v61 appendFormat:@"%@|    Custom Properties:\n", v6];
  long long v29 = [(ASDTAudioDevice *)self customProperties];
  BOOL v30 = [v29 count] == 0;

  if (!v30)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v31 = self;
    obuint64_t j = [v31 customProperties];

    id v57 = v6;
    uint64_t v32 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v32)
    {
      uint64_t v59 = 0;
      uint64_t v56 = *(void *)v63;
      do
      {
        uint64_t v33 = 0;
        uint64_t v58 = v32;
        do
        {
          if (*(void *)v63 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void **)(*((void *)&v62 + 1) + 8 * v33);
          uint64_t v60 = v59 + v33;
          if (objc_opt_respondsToSelector())
          {
            if ([v34 selector] >> 29
              && [v34 selector] >> 24 <= 0x7E)
            {
              uint64_t v35 = [v34 selector] >> 24;
            }
            else
            {
              uint64_t v35 = 32;
            }
            uint64_t v55 = v35;
            if (([v34 selector] & 0xE00000) != 0
              && ([v34 selector] >> 16) <= 0x7Eu)
            {
              uint64_t v37 = ([v34 selector] >> 16);
            }
            else
            {
              uint64_t v37 = 32;
            }
            if (([v34 selector] & 0xE000) != 0
              && ((unsigned __int16)[v34 selector] >> 8) <= 0x7Eu)
            {
              uint64_t v39 = ((unsigned __int16)[v34 selector] >> 8);
            }
            else
            {
              uint64_t v39 = 32;
            }
            if (([v34 selector] & 0xE0) != 0 && objc_msgSend(v34, "selector") <= 0x7Eu) {
              uint64_t v41 = [v34 selector];
            }
            else {
              uint64_t v41 = 32;
            }
            if ([v34 scope] >> 29
              && [v34 scope] >> 24 <= 0x7E)
            {
              uint64_t v43 = [v34 scope] >> 24;
            }
            else
            {
              uint64_t v43 = 32;
            }
            if (([v34 scope] & 0xE00000) != 0
              && ([v34 scope] >> 16) <= 0x7Eu)
            {
              uint64_t v44 = ([v34 scope] >> 16);
            }
            else
            {
              uint64_t v44 = 32;
            }
            if (([v34 scope] & 0xE000) != 0
              && ((unsigned __int16)[v34 scope] >> 8) <= 0x7Eu)
            {
              uint64_t v47 = ((unsigned __int16)[v34 scope] >> 8);
            }
            else
            {
              uint64_t v47 = 32;
            }
            if (([v34 scope] & 0xE0) != 0 && objc_msgSend(v34, "scope") <= 0x7Eu) {
              uint64_t v49 = [v34 scope];
            }
            else {
              uint64_t v49 = 32;
            }
            uint64_t v51 = [v34 element];
            unsigned int v52 = [v34 value];
            [v61 appendFormat:@"%@|        %u: %c%c%c%c (%c%c%c%c, %u): %@\n", v57, v60, v55, v37, v39, v41, v43, v44, v47, v49, v51, v52];
          }
          else
          {
            if ([v34 selector] >> 29
              && [v34 selector] >> 24 <= 0x7E)
            {
              uint64_t v36 = [v34 selector] >> 24;
            }
            else
            {
              uint64_t v36 = 32;
            }
            if (([v34 selector] & 0xE00000) != 0
              && ([v34 selector] >> 16) <= 0x7Eu)
            {
              uint64_t v38 = ([v34 selector] >> 16);
            }
            else
            {
              uint64_t v38 = 32;
            }
            if (([v34 selector] & 0xE000) != 0
              && ((unsigned __int16)[v34 selector] >> 8) <= 0x7Eu)
            {
              uint64_t v40 = ((unsigned __int16)[v34 selector] >> 8);
            }
            else
            {
              uint64_t v40 = 32;
            }
            if (([v34 selector] & 0xE0) != 0 && objc_msgSend(v34, "selector") <= 0x7Eu) {
              uint64_t v42 = [v34 selector];
            }
            else {
              uint64_t v42 = 32;
            }
            if ([v34 scope] >> 29
              && [v34 scope] >> 24 <= 0x7E)
            {
              uint64_t v45 = [v34 scope] >> 24;
            }
            else
            {
              uint64_t v45 = 32;
            }
            if (([v34 scope] & 0xE00000) != 0
              && ([v34 scope] >> 16) <= 0x7Eu)
            {
              uint64_t v46 = ([v34 scope] >> 16);
            }
            else
            {
              uint64_t v46 = 32;
            }
            if (([v34 scope] & 0xE000) != 0
              && ((unsigned __int16)[v34 scope] >> 8) <= 0x7Eu)
            {
              uint64_t v48 = ((unsigned __int16)[v34 scope] >> 8);
            }
            else
            {
              uint64_t v48 = 32;
            }
            if (([v34 scope] & 0xE0) != 0 && objc_msgSend(v34, "scope") <= 0x7Eu) {
              uint64_t v50 = [v34 scope];
            }
            else {
              uint64_t v50 = 32;
            }
            [v61 appendFormat:@"%@|        %u: %c%c%c%c (%c%c%c%c, %u) (value unknown)\n", v57, v60, v36, v38, v40, v42, v45, v46, v48, v50, objc_msgSend(v34, "element")];
          }
          ++v33;
        }
        while (v58 != v33);
        uint64_t v32 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
        uint64_t v59 = (v59 + v33);
      }
      while (v32);
    }

    id v6 = v57;
  }

  return v61;
}

- (id)customPropertyForAddress:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(ASDTAudioDevice *)self customProperties];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "address", (void)v15);
        int v11 = [v10 selector];
        if (v11 == [v4 selector])
        {
          int v12 = [v10 element];
          if (v12 == [v4 element])
          {
            int v13 = [v10 scope];
            if (v13 == [v4 scope])
            {
              id v6 = v9;

              goto LABEL_13;
            }
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)updateCustomProperty:(id)a3 withAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 address];

  if (v8)
  {
    uint64_t v9 = [v6 address];

    id v7 = (id)v9;
  }
  uint64_t v10 = [(ASDTAudioDevice *)self customPropertyForAddress:v7];
  int v11 = (void *)v10;
  if ((id)v10 == v6) {
    goto LABEL_9;
  }
  if (!v6)
  {
    [(ASDTAudioDevice *)self removeCustomProperty:v10];
LABEL_13:
    BOOL v15 = 1;
    goto LABEL_14;
  }
  if (!v10)
  {
LABEL_12:
    [(ASDTAudioDevice *)self addCustomProperty:v6];
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [(ASDTAudioDevice *)self removeCustomProperty:v11];
    goto LABEL_12;
  }
  int v12 = [v11 value];
  int v13 = [v6 value];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    long long v17 = [v6 propertyValue];
    [v11 setPropertyValue:v17];

    goto LABEL_13;
  }
LABEL_9:
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (NSSet)relatedDeviceObjectIDs
{
  int v3 = [MEMORY[0x263EFF9C0] setWithCapacity:3];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ASDTAudioDevice objectID](self, "objectID"));
  [v3 addObject:v4];

  id v5 = [(ASDTAudioDevice *)self plugin];
  id v6 = [(ASDTAudioDevice *)self relatedDeviceUIDs];
  id v7 = [v5 objectIDsForDeviceUIDs:v6];
  [v3 unionSet:v7];

  BOOL v8 = (void *)[v3 copy];
  return (NSSet *)v8;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1634429294)
  {
    id v5 = [(ASDTAudioDevice *)self relatedDeviceObjectIDs];
    unsigned int v6 = 4 * [v5 count];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ASDTAudioDevice;
    return -[ASDAudioDevice dataSizeForProperty:withQualifierSize:andQualifierData:](&v8, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return v6;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8 = 0;
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a6)
    {
      uint64_t v10 = a7;
      if (a7)
      {
        uint64_t v11 = *(void *)&a8;
        uint64_t v13 = *(void *)&a4;
        if (a3->mSelector == 1936879204)
        {
          uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F28C60]), "initWithAddress:", ((unint64_t)a3->mScope << 32) | 0x73726464, 0);
          uint64_t v23 = [(ASDTAudioDevice *)self customPropertyForAddress:v22];
          uint64_t v24 = v23;
          if (v23)
          {
            unsigned __int8 v25 = [v23 getPropertyWithQualifierSize:v13 qualifierData:a5 dataSize:a6 andData:v10 forClient:v11];
          }
          else
          {
            v28.receiver = self;
            v28.super_class = (Class)ASDTAudioDevice;
            unsigned __int8 v25 = [(ASDAudioDevice *)&v28 getProperty:a3 withQualifierSize:v13 qualifierData:a5 dataSize:a6 andData:v10 forClient:v11];
          }
          BOOL v8 = v25;
        }
        else if (a3->mSelector == 1634429294)
        {
          long long v16 = [(ASDTAudioDevice *)self relatedDeviceObjectIDs];
          int v17 = [v16 count];
          BOOL v8 = *a6 >= 4 * v17;
          if (*a6 >= 4 * v17)
          {
            *a6 = 4 * v17;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v18 = v16;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v30 != v20) {
                    objc_enumerationMutation(v18);
                  }
                  *v10++ = [*(id *)(*((void *)&v29 + 1) + 8 * i) unsignedIntValue];
                }
                uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
              }
              while (v19);
            }
          }
        }
        else
        {
          v27.receiver = self;
          v27.super_class = (Class)ASDTAudioDevice;
          return [(ASDAudioDevice *)&v27 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
        }
      }
    }
  }
  return v8;
}

- (void)terminate
{
  objc_initWeak(&location, self);
  int v3 = [(ASDAudioDevice *)self ioReferenceQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__ASDTAudioDevice_terminate__block_invoke;
  v4[3] = &unk_2652439D8;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __28__ASDTAudioDevice_terminate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained doTerminate];
}

- (void)doTerminate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (![(ASDTAudioDevice *)self terminated])
  {
    int v3 = ASDTBaseLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(ASDAudioDevice *)self deviceUID];
      id v5 = (objc_class *)objc_opt_class();
      unsigned int v6 = NSStringFromClass(v5);
      int v7 = 138412546;
      BOOL v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_2489BC000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ Terminated.", (uint8_t *)&v7, 0x16u);
    }
    [(ASDTAudioDevice *)self setTerminated:1];
    [(ASDTAudioDevice *)self performTerminate];
  }
}

- (void)addStatusProtocolObject:(id)a3 toArray:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 conformsToProtocol:&unk_26FCB6270])
  {
    id v6 = v8;
    int v7 = [v6 status];

    if (v7) {
      [v5 addObject:v6];
    }
  }
}

- (void)setupStatusProtocol
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        [(ASDTAudioDevice *)self addStatusProtocolObject:*(void *)(*((void *)&v26 + 1) + 8 * v7++) toArray:v3];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(ASDTAudioDevice *)self pmSequencer];
  __int16 v9 = [v8 pmDevicesPowerUp];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        [(ASDTAudioDevice *)self addStatusProtocolObject:*(void *)(*((void *)&v22 + 1) + 8 * v12++) toArray:v3];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = [(ASDAudioDevice *)self controls];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        [(ASDTAudioDevice *)self addStatusProtocolObject:*(void *)(*((void *)&v18 + 1) + 8 * v16++) toArray:v3];
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v14);
  }

  if ([v3 count])
  {
    int v17 = (void *)[v3 copy];
    [(ASDTAudioDevice *)self setStatusProtocolObjects:v17];
  }
  else
  {
    [(ASDTAudioDevice *)self setStatusProtocolObjects:0];
  }
}

- (NSDictionary)status
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(ASDTAudioDevice *)self statusProtocolObjects];
  int v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) status];
        if (v7)
        {
          if (!v3)
          {
            int v3 = [MEMORY[0x263EFF9A0] dictionary];
          }
          [v3 addEntriesFromDictionary:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  id v8 = (void *)[v3 copy];
  return (NSDictionary *)v8;
}

- (BOOL)configurationChangesPending
{
  int v3 = [(ASDAudioDevice *)self configurationChangeDelegate];
  int v4 = [v3 conformsToProtocol:&unk_26FCB37E8];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(ASDAudioDevice *)self configurationChangeDelegate];
  char v6 = [v5 configurationChangePendingForObject:self];

  return v6;
}

- (int)powerState
{
  return self->powerState;
}

- (void)setPowerState:(int)a3
{
  self->powerState = a3;
}

- (NSDictionary)inputLatencies
{
  return self->_inputLatencies;
}

- (NSDictionary)outputLatencies
{
  return self->_outputLatencies;
}

- (unsigned)pmOrderPowerUp
{
  return self->_pmOrderPowerUp;
}

- (void)setPmOrderPowerUp:(unsigned int)a3
{
  self->_pmOrderPowerUp = a3;
}

- (unsigned)pmOrderPowerDown
{
  return self->_pmOrderPowerDown;
}

- (void)setPmOrderPowerDown:(unsigned int)a3
{
  self->_pmOrderPowerDown = a3;
}

- (BOOL)pmNoStateChangeOnFailure
{
  return self->_pmNoStateChangeOnFailure;
}

- (void)setPmNoStateChangeOnFailure:(BOOL)a3
{
  self->_pmNoStateChangeOnFailure = a3;
}

- (ASDTPMSequencer)pmSequencer
{
  return self->_pmSequencer;
}

- (void)setPmSequencer:(id)a3
{
}

- (ASDTDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (BOOL)willDoReadInputInPlace
{
  return self->_willDoReadInputInPlace;
}

- (void)setWillDoReadInputInPlace:(BOOL)a3
{
  self->_willDoReadInputInPlace = a3;
}

- (BOOL)willDoWriteMixInPlace
{
  return self->_willDoWriteMixInPlace;
}

- (void)setWillDoWriteMixInPlace:(BOOL)a3
{
  self->_willDoWriteMixInPlace = a3;
}

- (NSSet)relatedDeviceUIDs
{
  return self->_relatedDeviceUIDs;
}

- (void)setRelatedDeviceUIDs:(id)a3
{
}

- (NSArray)statusProtocolObjects
{
  return self->_statusProtocolObjects;
}

- (void)setStatusProtocolObjects:(id)a3
{
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (NSMutableDictionary)ioThreads
{
  return self->_ioThreads;
}

- (void)setIoThreads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioThreads, 0);
  objc_storeStrong((id *)&self->_statusProtocolObjects, 0);
  objc_storeStrong((id *)&self->_relatedDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_pmSequencer, 0);
  objc_storeStrong((id *)&self->_outputLatencies, 0);
  objc_storeStrong((id *)&self->_inputLatencies, 0);
}

+ (void)deviceForConfig:withDeviceManager:andPlugin:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_2489BC000, v3, OS_LOG_TYPE_ERROR, "Invalid subclass name: %@", v4, 0xCu);
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed creating PM seqeucner with config: %@", v4, v5);
}

- (void)addCustomProperties:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed creating custom property with config: %@", v4, v5);
}

- (void)addControls:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed creating control with config: %@", v4, v5);
}

- (void)addStreams:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed to create stream for config:\n%@", v4, v5);
}

- (void)_updateSafetyOffsets:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_3(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEBUG, "%@: Input safety offset: %u frames", v4, 0x12u);
}

- (void)_updateSafetyOffsets:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_3(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEBUG, "%@: Output safety offset: %u frames", v4, 0x12u);
}

- (void)performStopIO
{
  OUTLINED_FUNCTION_1_3();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_error_impl(&dword_2489BC000, v3, OS_LOG_TYPE_ERROR, "IOThread dictionary not empty. Contents: %@", v4, 0xCu);
}

- (void)updateIOThreadStateChangeDescription:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Failed to allocate self.ioThreads", v1, 2u);
}

@end