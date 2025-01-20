@interface ASDAudioDevice
- (ASDAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4;
- (ASDAudioDevice)initWithPlugin:(id)a3;
- (ASDDeviceConfigurationChangeDelegate)configurationChangeDelegate;
- (BOOL)allowAutoRoute;
- (BOOL)canBeDefaultDevice;
- (BOOL)canBeDefaultInputDevice;
- (BOOL)canBeDefaultOutputDevice;
- (BOOL)canBeDefaultSystemDevice;
- (BOOL)canChangeDeviceName;
- (BOOL)changeClientDescription:(id)a3;
- (BOOL)changeDeviceName:(id)a3;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)clockIsStable;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasInput;
- (BOOL)hasOutput;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isHidden;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isRunning;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)wantsDisplayRouting;
- (NSArray)samplingRates;
- (NSDictionary)clientDescription;
- (NSDictionary)deviceDescription;
- (NSString)configurationBundleID;
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
- (id)getProperty:(id)a3;
- (id)getZeroTimestampBlock;
- (id)getZeroTimestampBlockUnretainedPtr;
- (id)inputStreams;
- (id)outputStreams;
- (id)willDoConvertInputBlock;
- (id)willDoConvertInputBlockUnretainedPtr;
- (id)willDoConvertMixBlock;
- (id)willDoConvertMixBlockUnretainedPtr;
- (id)willDoMixOutputBlock;
- (id)willDoMixOutputBlockUnretainedPtr;
- (id)willDoProcessInputBlock;
- (id)willDoProcessInputBlockUnretainedPtr;
- (id)willDoProcessMixBlock;
- (id)willDoProcessMixBlockUnretainedPtr;
- (id)willDoProcessOutputBlock;
- (id)willDoProcessOutputBlockUnretainedPtr;
- (id)willDoReadInputBlock;
- (id)willDoReadInputBlockUnretainedPtr;
- (id)willDoWriteMixBlock;
- (id)willDoWriteMixBlockUnretainedPtr;
- (int)addClient:(const AudioServerPlugInClientInfo *)a3;
- (int)performStartIO;
- (int)performStopIO;
- (int)removeClient:(const AudioServerPlugInClientInfo *)a3;
- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5;
- (int)startIOForClient:(unsigned int)a3;
- (int)stopIOForClient:(unsigned int)a3;
- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4;
- (unsigned)calculateIOBufferFrameSize:(unsigned int)a3;
- (unsigned)channelLayoutBitmapForScope:(unsigned int)a3;
- (unsigned)channelLayoutTagForScope:(unsigned int)a3;
- (unsigned)clockAlgorithm;
- (unsigned)clockDomain;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)numberOfChannelsInLayoutForScope:(unsigned int)a3;
- (unsigned)objectClass;
- (unsigned)outputLatency;
- (unsigned)outputSafetyOffset;
- (unsigned)timestampPeriod;
- (unsigned)transportType;
- (void)abortConfigurationChange:(void *)a3;
- (void)addControl:(id)a3;
- (void)addInputStream:(id)a3;
- (void)addOutputStream:(id)a3;
- (void)dealloc;
- (void)ioThreadStateChange:(id)a3;
- (void)performConfigurationChange:(void *)a3;
- (void)preferredChannelDescriptions:(AudioChannelDescription *)a3 numberOfChannels:(unsigned int)a4 forScope:(unsigned int)a5;
- (void)preferredChannelsForLeft:(unsigned int *)a3 andRight:(unsigned int *)a4;
- (void)removeControl:(id)a3;
- (void)removeInputStream:(id)a3;
- (void)removeOutputStream:(id)a3;
- (void)requestConfigurationChange:(id)a3;
- (void)setAllowAutoRoute:(BOOL)a3;
- (void)setBeginIOOperationBlock:(id)a3;
- (void)setCanBeDefaultDevice:(BOOL)a3;
- (void)setCanBeDefaultInputDevice:(BOOL)a3;
- (void)setCanBeDefaultOutputDevice:(BOOL)a3;
- (void)setCanBeDefaultSystemDevice:(BOOL)a3;
- (void)setCanChangeDeviceName:(BOOL)a3;
- (void)setClientDescription:(id)a3;
- (void)setClockAlgorithm:(unsigned int)a3;
- (void)setClockDomain:(unsigned int)a3;
- (void)setClockIsStable:(BOOL)a3;
- (void)setConfigurationBundleID:(id)a3;
- (void)setConfigurationChangeDelegate:(id)a3;
- (void)setDeviceDescription:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setEndIOOperationBlock:(id)a3;
- (void)setGetZeroTimestampBlock:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInputLatency:(unsigned int)a3;
- (void)setInputSafetyOffset:(unsigned int)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelUID:(id)a3;
- (void)setOutputLatency:(unsigned int)a3;
- (void)setOutputSafetyOffset:(unsigned int)a3;
- (void)setSamplingRate:(double)a3;
- (void)setSamplingRates:(id)a3;
- (void)setTimestampPeriod:(unsigned int)a3;
- (void)setTransportType:(unsigned int)a3;
- (void)setWantsDisplayRouting:(BOOL)a3;
- (void)setWillDoConvertInputBlock:(id)a3;
- (void)setWillDoConvertMixBlock:(id)a3;
- (void)setWillDoMixOutputBlock:(id)a3;
- (void)setWillDoProcessInputBlock:(id)a3;
- (void)setWillDoProcessMixBlock:(id)a3;
- (void)setWillDoProcessOutputBlock:(id)a3;
- (void)setWillDoReadInputBlock:(id)a3;
- (void)setWillDoWriteMixBlock:(id)a3;
- (void)systemHasPoweredOn;
- (void)systemWillSleep;
- (void)updateTimestampPeriod;
@end

@implementation ASDAudioDevice

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (!a3) {
    goto LABEL_62;
  }
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1818454125)
  {
    if (mSelector <= 1668575851)
    {
      if (mSelector > 1667658617)
      {
        if (mSelector > 1668050794)
        {
          if (mSelector == 1668050795) {
            goto LABEL_61;
          }
          int v4 = 1668510818;
        }
        else
        {
          if (mSelector == 1667658618) {
            goto LABEL_61;
          }
          int v4 = 1668049764;
        }
      }
      else
      {
        if (mSelector <= 1667330159)
        {
          if (mSelector != 1634429294)
          {
            int v4 = 1635087471;
            goto LABEL_60;
          }
LABEL_61:
          char v21 = 1;
          goto LABEL_62;
        }
        if (mSelector == 1667330160)
        {
          v13 = [(ASDAudioDevice *)self configurationBundleID];
          *((unsigned char *)v19 + 24) = v13 != 0;

          goto LABEL_62;
        }
        int v4 = 1667523955;
      }
LABEL_60:
      if (mSelector == v4) {
        goto LABEL_61;
      }
LABEL_64:
      v15.receiver = self;
      v15.super_class = (Class)ASDAudioDevice;
      unsigned __int8 v14 = -[ASDObject hasProperty:](&v15, sel_hasProperty_);
      *((unsigned char *)v19 + 24) = v14;
      goto LABEL_62;
    }
    if (mSelector <= 1685222500)
    {
      if (mSelector > 1684301170)
      {
        if (mSelector == 1684301171) {
          goto LABEL_61;
        }
        int v4 = 1684434036;
        goto LABEL_60;
      }
      if (mSelector == 1668575852) {
        goto LABEL_61;
      }
      int v6 = 1684236338;
      goto LABEL_27;
    }
    if (mSelector <= 1751737453)
    {
      if (mSelector == 1685222501) {
        goto LABEL_61;
      }
      int v4 = 1735354734;
      goto LABEL_60;
    }
    if (mSelector == 1751737454) {
      goto LABEL_61;
    }
    unsigned __int16 v5 = 25454;
    goto LABEL_53;
  }
  if (mSelector > 1853059699)
  {
    if (mSelector > 1936879203)
    {
      if (mSelector > 1953653101)
      {
        if (mSelector == 1969841184) {
          goto LABEL_61;
        }
        int v4 = 1953653102;
        goto LABEL_60;
      }
      if (mSelector != 1936879204)
      {
        int v4 = 1937009955;
        goto LABEL_60;
      }
    }
    else
    {
      if (mSelector <= 1935763059)
      {
        if (mSelector == 1853059700) {
          goto LABEL_61;
        }
        int v4 = 1919512167;
        goto LABEL_60;
      }
      if (mSelector != 1935763060)
      {
        int v4 = 1936092276;
        goto LABEL_60;
      }
    }
    goto LABEL_43;
  }
  if (mSelector > 1819173228)
  {
    if (mSelector > 1836411235)
    {
      if (mSelector == 1836411236) {
        goto LABEL_61;
      }
      int v4 = 1853059619;
      goto LABEL_60;
    }
    if (mSelector == 1819173229) {
      goto LABEL_61;
    }
    int v6 = 1819569763;
LABEL_27:
    if (mSelector != v6) {
      goto LABEL_64;
    }
LABEL_43:
    AudioObjectPropertyScope mScope = a3->mScope;
    if ((mScope == 1869968496 || mScope == 1768845428) && !a3->mElement) {
      goto LABEL_61;
    }
    goto LABEL_62;
  }
  if (mSelector > 1818850925)
  {
    if (mSelector == 1818850926) {
      goto LABEL_61;
    }
    int v4 = 1819107691;
    goto LABEL_60;
  }
  if (mSelector != 1818454126)
  {
    unsigned __int16 v5 = 28270;
LABEL_53:
    if (mSelector != (v5 | 0x6C630000)) {
      goto LABEL_64;
    }
  }
  if (a3->mElement)
  {
    AudioObjectPropertyScope v8 = a3->mScope;
    if (v8 == 1869968496)
    {
      outputStreamQueue = self->_outputStreamQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __30__ASDAudioDevice_hasProperty___block_invoke_2;
      block[3] = &unk_264773338;
      block[4] = self;
      block[5] = &v18;
      block[6] = a3;
      v10 = block;
    }
    else
    {
      if (v8 != 1768845428) {
        goto LABEL_62;
      }
      outputStreamQueue = self->_inputStreamQueue;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __30__ASDAudioDevice_hasProperty___block_invoke;
      v17[3] = &unk_264773338;
      v17[4] = self;
      v17[5] = &v18;
      v17[6] = a3;
      v10 = v17;
    }
    dispatch_sync(outputStreamQueue, v10);
  }
LABEL_62:
  char v11 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  char v109 = 0;
  if (!a3 || !a6 || !a7) {
    goto LABEL_214;
  }
  uint64_t v10 = *(void *)&a8;
  uint64_t v12 = *(void *)&a4;
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1818455661)
  {
    if (mSelector <= 1870098019)
    {
      if (mSelector <= 1819569762)
      {
        if (mSelector <= 1819107690)
        {
          if (mSelector == 1818455662)
          {
            if (*a6 >= 8 && a3->mElement)
            {
              AudioObjectPropertyScope mScope = a3->mScope;
              if (mScope == 1869968496)
              {
                outputStreamQueue = self->_outputStreamQueue;
                v82[0] = MEMORY[0x263EF8330];
                v82[1] = 3221225472;
                v82[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_15;
                v82[3] = &unk_264773388;
                v82[6] = a3;
                v82[7] = a7;
                v82[8] = a6;
                v82[4] = self;
                v82[5] = &v106;
                uint64_t v18 = v82;
                goto LABEL_208;
              }
              if (mScope == 1768845428)
              {
                outputStreamQueue = self->_inputStreamQueue;
                v83[0] = MEMORY[0x263EF8330];
                v83[1] = 3221225472;
                v83[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_14;
                v83[3] = &unk_264773388;
                v83[6] = a3;
                v83[7] = a7;
                v83[8] = a6;
                v83[4] = self;
                v83[5] = &v106;
                uint64_t v18 = v83;
                goto LABEL_208;
              }
            }
            goto LABEL_214;
          }
          if (mSelector == 1818850926)
          {
            if (*a6 >= 4)
            {
              *(_DWORD *)a7 = self->_isAlive;
              *a6 = 4;
              char v109 = 1;
            }
            goto LABEL_214;
          }
          goto LABEL_158;
        }
        if (mSelector == 1819107691)
        {
          if (*a6 < 8) {
            goto LABEL_214;
          }
          v54 = [(ASDAudioDevice *)self manufacturerName];
          *(void *)a7 = v54;

          uint64_t v20 = *(const void **)a7;
          if (!*(void *)a7) {
            goto LABEL_153;
          }
        }
        else
        {
          if (mSelector != 1819173229) {
            goto LABEL_158;
          }
          if (*a6 < 8) {
            goto LABEL_214;
          }
          v28 = [(ASDAudioDevice *)self deviceName];
          *(void *)a7 = v28;

          uint64_t v20 = *(const void **)a7;
          if (!*(void *)a7) {
            goto LABEL_153;
          }
        }
        goto LABEL_152;
      }
      if (mSelector > 1853059618)
      {
        if (mSelector == 1853059619)
        {
          v55 = [(ASDAudioDevice *)self samplingRates];
          unint64_t v56 = *a6;
          if ([v55 count] <= v56 >> 4) {
            unint64_t v57 = [v55 count];
          }
          else {
            unint64_t v57 = (unint64_t)*a6 >> 4;
          }
          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v61 = v55;
          uint64_t v62 = 0;
          uint64_t v63 = [v61 countByEnumeratingWithState:&v93 objects:v110 count:16];
          if (v63)
          {
            uint64_t v64 = *(void *)v94;
            while (2)
            {
              for (uint64_t i = 0; i != v63; ++i)
              {
                if (*(void *)v94 != v64) {
                  objc_enumerationMutation(v61);
                }
                if (v57 == v62)
                {
                  LODWORD(v62) = v57;
                  goto LABEL_174;
                }
                [*(id *)(*((void *)&v93 + 1) + 8 * i) doubleValue];
                *((int64x2_t *)a7 + v62++) = vdupq_lane_s64(v66, 0);
              }
              uint64_t v63 = [v61 countByEnumeratingWithState:&v93 objects:v110 count:16];
              if (v63) {
                continue;
              }
              break;
            }
          }
LABEL_174:

          *a6 = 16 * v62;
          *((unsigned char *)v107 + 24) = 1;

          goto LABEL_214;
        }
        if (mSelector != 1853059700) {
          goto LABEL_158;
        }
        if (*a6 < 8) {
          goto LABEL_214;
        }
        [(ASDAudioDevice *)self samplingRate];
        *(void *)a7 = v31;
        goto LABEL_153;
      }
      if (mSelector != 1819569763)
      {
        if (mSelector != 1836411236) {
          goto LABEL_158;
        }
        if (*a6 < 8) {
          goto LABEL_214;
        }
        v22 = [(ASDAudioDevice *)self modelUID];
        *(void *)a7 = v22;

        uint64_t v20 = *(const void **)a7;
        if (!*(void *)a7) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
      if (*a6 < 4) {
        goto LABEL_214;
      }
      AudioObjectPropertyScope v48 = a3->mScope;
      if (v48 == 1869968496) {
        goto LABEL_182;
      }
      if (v48 == 1768845428) {
        goto LABEL_140;
      }
      if (v48 != 1735159650) {
        goto LABEL_211;
      }
      unsigned int v49 = [(ASDAudioDevice *)self inputLatency];
      if (v49 <= [(ASDAudioDevice *)self outputLatency]) {
LABEL_182:
      }
        unsigned int v21 = [(ASDAudioDevice *)self outputLatency];
      else {
LABEL_140:
      }
        unsigned int v21 = [(ASDAudioDevice *)self inputLatency];
    }
    else
    {
      if (mSelector > 1936879203)
      {
        if (mSelector <= 1937009954)
        {
          if (mSelector != 1936879204)
          {
            if (mSelector != 1937007734) {
              goto LABEL_158;
            }
            if (*a6 < 4) {
              goto LABEL_214;
            }
            *a6 = 4;
            v23 = [(ASDObject *)self owner];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v25 = [(ASDObject *)self owner];
              v26 = [v25 owner];
              *(_DWORD *)a7 = [v26 objectID];
            }
            else
            {
              v25 = [(ASDObject *)self plugin];
              *(_DWORD *)a7 = [v25 objectID];
            }

LABEL_213:
            *((unsigned char *)v107 + 24) = 1;
            goto LABEL_214;
          }
          if ([(ASDAudioDevice *)self channelLayoutTagForScope:a3->mScope])
          {
            if (*a6 < 0xC) {
              goto LABEL_214;
            }
            *(_DWORD *)a7 = [(ASDAudioDevice *)self channelLayoutTagForScope:a3->mScope];
            *(void *)((char *)a7 + 4) = [(ASDAudioDevice *)self channelLayoutBitmapForScope:a3->mScope];
            unsigned int v50 = 12;
          }
          else
          {
            uint64_t v69 = [(ASDAudioDevice *)self numberOfChannelsInLayoutForScope:a3->mScope];
            if (20 * (unint64_t)v69 + 12 > *a6) {
              goto LABEL_214;
            }
            *(void *)a7 = 0;
            *((_DWORD *)a7 + 2) = [(ASDAudioDevice *)self numberOfChannelsInLayoutForScope:a3->mScope];
            [(ASDAudioDevice *)self preferredChannelDescriptions:(char *)a7 + 12 numberOfChannels:v69 forScope:a3->mScope];
            unsigned int v50 = 20 * *((_DWORD *)a7 + 2) + 12;
          }
LABEL_212:
          *a6 = v50;
          goto LABEL_213;
        }
        if (mSelector == 1937009955)
        {
          uint64_t v100 = 0;
          v101 = &v100;
          uint64_t v102 = 0x2020000000;
          uint64_t v103 = 0;
          unint64_t v40 = (unint64_t)*a6 >> 2;
          AudioObjectPropertyScope v41 = a3->mScope;
          if (v41 == 1768845428 || (uint64_t v42 = 0, v41 == 1735159650))
          {
            inputStreamQueue = self->_inputStreamQueue;
            v99[0] = MEMORY[0x263EF8330];
            v99[1] = 3221225472;
            v99[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
            v99[3] = &unk_264773180;
            v99[4] = self;
            v99[5] = &v100;
            v99[6] = v40;
            v99[7] = a7;
            dispatch_sync(inputStreamQueue, v99);
            uint64_t v42 = v101[3];
          }
          if (v42 == v40)
          {
            LODWORD(v42) = v40;
          }
          else
          {
            AudioObjectPropertyScope v59 = a3->mScope;
            if (v59 == 1869968496 || v59 == 1735159650)
            {
              v60 = self->_outputStreamQueue;
              v98[0] = MEMORY[0x263EF8330];
              v98[1] = 3221225472;
              v98[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
              v98[3] = &unk_264773180;
              v98[4] = self;
              v98[5] = &v100;
              v98[6] = v40;
              v98[7] = a7;
              dispatch_sync(v60, v98);
              uint64_t v42 = v101[3];
            }
          }
          unsigned int v33 = 4 * v42;
          goto LABEL_204;
        }
        if (mSelector == 1953653102)
        {
          if (*a6 < 4) {
            goto LABEL_214;
          }
          unsigned int v21 = [(ASDAudioDevice *)self transportType];
          goto LABEL_210;
        }
        if (mSelector != 1969841184) {
          goto LABEL_158;
        }
        if (*a6 < 8) {
          goto LABEL_214;
        }
        v19 = [(ASDAudioDevice *)self deviceUID];
        *(void *)a7 = v19;

        uint64_t v20 = *(const void **)a7;
        if (!*(void *)a7) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
      if (mSelector <= 1935763059)
      {
        if (mSelector != 1870098020)
        {
          if (mSelector != 1919512167) {
            goto LABEL_158;
          }
          if (*a6 < 4) {
            goto LABEL_214;
          }
          unsigned int v21 = [(ASDAudioDevice *)self timestampPeriod];
          goto LABEL_210;
        }
        if (a4)
        {
          if ((a4 & 3) != 0) {
            goto LABEL_214;
          }
          uint64_t v100 = 0;
          v101 = &v100;
          uint64_t v102 = 0x2020000000;
          uint64_t v103 = 0;
          unsigned int v34 = *a6;
          if (v34 >= [(ASDAudioDevice *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])unsigned int v35 = [(ASDAudioDevice *)self dataSizeForProperty:a3 withQualifierSize:v12 andQualifierData:a5]; {
          else
          }
            unsigned int v35 = *a6;
          uint64_t v77 = v35 >> 2;
          if (v101[3] != v77)
          {
            controlQueue = self->_controlQueue;
            v91[0] = MEMORY[0x263EF8330];
            v91[1] = 3221225472;
            v91[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_6;
            v91[3] = &unk_2647733B0;
            unsigned int v92 = v12 >> 2;
            v91[6] = a5;
            v91[7] = a3;
            v91[4] = self;
            v91[5] = &v100;
            v91[8] = v77;
            v91[9] = a7;
            dispatch_sync(controlQueue, v91);
            LODWORD(v77) = *((_DWORD *)v101 + 6);
          }
          unsigned int v33 = 4 * v77;
        }
        else
        {
          uint64_t v100 = 0;
          v101 = &v100;
          uint64_t v102 = 0x2020000000;
          uint64_t v103 = 0;
          unsigned int v67 = *a6;
          if (v67 >= [(ASDAudioDevice *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5])unsigned int v68 = [(ASDAudioDevice *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5]; {
          else
          }
            unsigned int v68 = *a6;
          uint64_t v70 = v68 >> 2;
          uint64_t v71 = v101[3];
          if (v71 != v70)
          {
            AudioObjectPropertyScope v72 = a3->mScope;
            if (v72 == 1768845428 || v72 == 1735159650)
            {
              v73 = self->_inputStreamQueue;
              v90[0] = MEMORY[0x263EF8330];
              v90[1] = 3221225472;
              v90[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_7;
              v90[3] = &unk_264773180;
              v90[4] = self;
              v90[5] = &v100;
              v90[6] = v70;
              v90[7] = a7;
              dispatch_sync(v73, v90);
              uint64_t v71 = v101[3];
            }
            if (v71 != v70)
            {
              AudioObjectPropertyScope v74 = a3->mScope;
              if (v74 == 1869968496 || v74 == 1735159650)
              {
                v75 = self->_outputStreamQueue;
                v89[0] = MEMORY[0x263EF8330];
                v89[1] = 3221225472;
                v89[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8;
                v89[3] = &unk_264773180;
                v89[4] = self;
                v89[5] = &v100;
                v89[6] = v70;
                v89[7] = a7;
                dispatch_sync(v75, v89);
                uint64_t v71 = v101[3];
              }
              if (v71 != v70)
              {
                v76 = self->_controlQueue;
                v88[0] = MEMORY[0x263EF8330];
                v88[1] = 3221225472;
                v88[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9;
                v88[3] = &unk_264773388;
                v88[4] = self;
                v88[5] = &v100;
                v88[6] = a3;
                v88[7] = v70;
                v88[8] = a7;
                dispatch_sync(v76, v88);
                LODWORD(v70) = *((_DWORD *)v101 + 6);
              }
            }
          }
          unsigned int v33 = 4 * v70;
        }
        goto LABEL_204;
      }
      if (mSelector != 1935763060)
      {
        if (mSelector != 1936092276) {
          goto LABEL_158;
        }
        if (*a6 < 4) {
          goto LABEL_214;
        }
        unsigned int v21 = [(ASDAudioDevice *)self canBeDefaultSystemDevice];
        goto LABEL_210;
      }
      if (*a6 < 4) {
        goto LABEL_214;
      }
      AudioObjectPropertyScope v37 = a3->mScope;
      if (v37 == 1869968496) {
        goto LABEL_181;
      }
      if (v37 == 1768845428) {
        goto LABEL_110;
      }
      if (v37 != 1735159650) {
        goto LABEL_211;
      }
      unsigned int v38 = [(ASDAudioDevice *)self inputSafetyOffset];
      if (v38 <= [(ASDAudioDevice *)self outputSafetyOffset]) {
LABEL_181:
      }
        unsigned int v21 = [(ASDAudioDevice *)self outputSafetyOffset];
      else {
LABEL_110:
      }
        unsigned int v21 = [(ASDAudioDevice *)self inputSafetyOffset];
    }
LABEL_210:
    *(_DWORD *)a7 = v21;
    goto LABEL_211;
  }
  if (mSelector <= 1668575851)
  {
    if (mSelector > 1667658617)
    {
      if (mSelector > 1668050794)
      {
        if (mSelector == 1668050795)
        {
          if (*a6 < 4) {
            goto LABEL_214;
          }
          unsigned int v21 = [(ASDAudioDevice *)self clockAlgorithm];
        }
        else
        {
          if (mSelector != 1668510818) {
            goto LABEL_158;
          }
          if (*a6 < 4) {
            goto LABEL_214;
          }
          unsigned int v21 = [(ASDAudioDevice *)self clockIsStable];
        }
      }
      else if (mSelector == 1667658618)
      {
        if (a4 < 4) {
          goto LABEL_214;
        }
        if (*a6 < 4) {
          goto LABEL_214;
        }
        v105.receiver = self;
        v105.super_class = (Class)ASDAudioDevice;
        unsigned __int8 v47 = [(ASDObject *)&v105 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
        *((unsigned char *)v107 + 24) = v47;
        if (v47) {
          goto LABEL_214;
        }
        unsigned int v21 = [(ASDAudioDevice *)self calculateIOBufferFrameSize:*(unsigned int *)a5];
      }
      else
      {
        if (mSelector != 1668049764) {
          goto LABEL_158;
        }
        if (*a6 < 4) {
          goto LABEL_214;
        }
        unsigned int v21 = [(ASDAudioDevice *)self clockDomain];
      }
      goto LABEL_210;
    }
    if (mSelector <= 1667330159)
    {
      if (mSelector == 1634429294)
      {
        int v104 = 1633969526;
        uint64_t v100 = *(void *)&a3->mSelector;
        LODWORD(v101) = a3->mElement;
        LODWORD(v100) = 1870098020;
        v44 = [(ASDObject *)self owner];
        char v45 = [v44 getProperty:&v100 withQualifierSize:4 qualifierData:&v104 dataSize:a6 andData:a7 forClient:v10];
        *((unsigned char *)v107 + 24) = v45;

        goto LABEL_214;
      }
      if (mSelector != 1635087471) {
        goto LABEL_158;
      }
      if (*a6 < 4) {
        goto LABEL_214;
      }
      unsigned int v21 = [(ASDAudioDevice *)self allowAutoRoute];
      goto LABEL_210;
    }
    if (mSelector == 1667330160)
    {
      if (*a6 < 8) {
        goto LABEL_214;
      }
      v51 = [(ASDAudioDevice *)self configurationBundleID];
      BOOL v52 = v51 == 0;

      if (v52) {
        goto LABEL_214;
      }
      v53 = [(ASDAudioDevice *)self configurationBundleID];
      *(void *)a7 = v53;

      uint64_t v20 = *(const void **)a7;
      if (!*(void *)a7) {
        goto LABEL_153;
      }
    }
    else
    {
      if (mSelector != 1667523955) {
        goto LABEL_158;
      }
      if (*a6 < 8) {
        goto LABEL_214;
      }
      v27 = [(ASDAudioDevice *)self clientDescription];
      *(void *)a7 = v27;

      uint64_t v20 = *(const void **)a7;
      if (!*(void *)a7) {
        goto LABEL_153;
      }
    }
    goto LABEL_152;
  }
  if (mSelector <= 1685222500)
  {
    if (mSelector <= 1684301170)
    {
      if (mSelector != 1668575852)
      {
        if (mSelector != 1684236338) {
          goto LABEL_158;
        }
        if (*a6 < 8) {
          goto LABEL_214;
        }
        [(ASDAudioDevice *)self preferredChannelsForLeft:a7 andRight:(char *)a7 + 4];
        goto LABEL_153;
      }
      uint64_t v100 = 0;
      v101 = &v100;
      uint64_t v102 = 0x2020000000;
      uint64_t v103 = 0;
      v32 = self->_controlQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
      block[3] = &unk_264773388;
      block[6] = a6;
      void block[7] = a3;
      block[4] = self;
      block[5] = &v100;
      block[8] = a7;
      dispatch_sync(v32, block);
      unsigned int v33 = 4 * *((_DWORD *)v101 + 6);
LABEL_204:
      *a6 = v33;
      *((unsigned char *)v107 + 24) = 1;
      _Block_object_dispose(&v100, 8);
      goto LABEL_214;
    }
    if (mSelector != 1684301171)
    {
      if (mSelector != 1684434036) {
        goto LABEL_158;
      }
      if (*a6 < 4) {
        goto LABEL_214;
      }
      AudioObjectPropertyScope v29 = a3->mScope;
      switch(v29)
      {
        case 0x6F757470u:
          BOOL v30 = [(ASDAudioDevice *)self canBeDefaultDevice];
          goto LABEL_196;
        case 0x696E7074u:
          if (![(ASDAudioDevice *)self canBeDefaultDevice])
          {
            unsigned int v21 = [(ASDAudioDevice *)self canBeDefaultInputDevice];
            goto LABEL_210;
          }
          goto LABEL_199;
        case 0x676C6F62u:
          if ([(ASDAudioDevice *)self canBeDefaultDevice]) {
            goto LABEL_199;
          }
          BOOL v30 = [(ASDAudioDevice *)self canBeDefaultInputDevice];
LABEL_196:
          if (!v30)
          {
            unsigned int v21 = [(ASDAudioDevice *)self canBeDefaultOutputDevice];
            goto LABEL_210;
          }
LABEL_199:
          unsigned int v21 = 1;
          goto LABEL_210;
      }
LABEL_211:
      unsigned int v50 = 4;
      goto LABEL_212;
    }
    if (*a6 < 8) {
      goto LABEL_214;
    }
    v36 = [(ASDAudioDevice *)self deviceDescription];
    *(void *)a7 = v36;

    uint64_t v20 = *(const void **)a7;
    if (!*(void *)a7)
    {
LABEL_153:
      unsigned int v50 = 8;
      goto LABEL_212;
    }
LABEL_152:
    CFRetain(v20);
    goto LABEL_153;
  }
  if (mSelector <= 1751737453)
  {
    if (mSelector == 1685222501)
    {
      if (*a6 < 4) {
        goto LABEL_214;
      }
      unsigned int v21 = [(ASDAudioDevice *)self wantsDisplayRouting];
    }
    else
    {
      if (mSelector != 1735354734) {
        goto LABEL_158;
      }
      if (*a6 < 4) {
        goto LABEL_214;
      }
      unsigned int v21 = [(ASDAudioDevice *)self isRunning];
    }
    goto LABEL_210;
  }
  if (mSelector == 1751737454)
  {
    if (*a6 < 4) {
      goto LABEL_214;
    }
    unsigned int v21 = [(ASDAudioDevice *)self isHidden];
    goto LABEL_210;
  }
  if (mSelector != 1818452846)
  {
    if (mSelector == 1818454126)
    {
      if (*a6 >= 8 && a3->mElement)
      {
        AudioObjectPropertyScope v16 = a3->mScope;
        if (v16 == 1869968496)
        {
          outputStreamQueue = self->_outputStreamQueue;
          v86[0] = MEMORY[0x263EF8330];
          v86[1] = 3221225472;
          v86[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_11;
          v86[3] = &unk_264773388;
          v86[6] = a3;
          v86[7] = a7;
          v86[8] = a6;
          v86[4] = self;
          v86[5] = &v106;
          uint64_t v18 = v86;
          goto LABEL_208;
        }
        if (v16 == 1768845428)
        {
          outputStreamQueue = self->_inputStreamQueue;
          v87[0] = MEMORY[0x263EF8330];
          v87[1] = 3221225472;
          v87[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10;
          v87[3] = &unk_264773388;
          v87[6] = a3;
          v87[7] = a7;
          v87[8] = a6;
          v87[4] = self;
          v87[5] = &v106;
          uint64_t v18 = v87;
LABEL_208:
          dispatch_sync(outputStreamQueue, v18);
          goto LABEL_214;
        }
      }
      goto LABEL_214;
    }
LABEL_158:
    v81.receiver = self;
    v81.super_class = (Class)ASDAudioDevice;
    unsigned __int8 v58 = [(ASDObject *)&v81 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
    *((unsigned char *)v107 + 24) = v58;
    goto LABEL_214;
  }
  if (*a6 >= 8 && a3->mElement)
  {
    AudioObjectPropertyScope v39 = a3->mScope;
    if (v39 == 1869968496)
    {
      outputStreamQueue = self->_outputStreamQueue;
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_13;
      v84[3] = &unk_264773388;
      v84[6] = a3;
      v84[7] = a7;
      v84[8] = a6;
      v84[4] = self;
      v84[5] = &v106;
      uint64_t v18 = v84;
      goto LABEL_208;
    }
    if (v39 == 1768845428)
    {
      outputStreamQueue = self->_inputStreamQueue;
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_12;
      v85[3] = &unk_264773388;
      v85[6] = a3;
      v85[7] = a7;
      v85[8] = a6;
      v85[4] = self;
      v85[5] = &v106;
      uint64_t v18 = v85;
      goto LABEL_208;
    }
  }
LABEL_214:
  char v79 = *((unsigned char *)v107 + 24);
  _Block_object_dispose(&v106, 8);
  return v79;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (ASDAudioDevice)initWithPlugin:(id)a3
{
  int v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  int v6 = [NSString stringWithUTF8String:"-[ASDAudioDevice initWithPlugin:]"];
  [v4 raise:v5, @"Do not call %@", v6 format];

  return 0;
}

- (ASDAudioDevice)initWithDeviceUID:(id)a3 withPlugin:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)ASDAudioDevice;
  v9 = [(ASDObject *)&v41 initWithPlugin:v8];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_isAlive = 1;
    v9->_transportType = 0;
    v9->_clockAlgorithm = 1768518246;
    v9->_clockIsStable = 1;
    v9->_allowAutoRoute = 1;
    v9->_wantsDisplayRouting = 0;
    p_deviceUID = &v9->_deviceUID;
    objc_storeStrong((id *)&v9->_deviceUID, a3);
    objc_storeWeak((id *)&v10->_configurationChangeDelegate, v8);
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 bundleIdentifier];
    unsigned __int8 v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    inputStreams = v10->_inputStreams;
    v10->_inputStreams = v14;

    id v16 = [NSString stringWithFormat:@"%@.device.%@.inputStreams", v13, *p_deviceUID];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    inputStreamQueue = v10->_inputStreamQueue;
    v10->_inputStreamQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    outputStreams = v10->_outputStreams;
    v10->_outputStreams = v19;

    id v21 = [NSString stringWithFormat:@"%@.device.%@.outputStreams", v13, *p_deviceUID];
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    outputStreamQueue = v10->_outputStreamQueue;
    v10->_outputStreamQueue = (OS_dispatch_queue *)v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    controls = v10->_controls;
    v10->_controls = v24;

    id v26 = [NSString stringWithFormat:@"%@.device.%@.controls", v13, *p_deviceUID];
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 UTF8String], 0);
    controlQueue = v10->_controlQueue;
    v10->_controlQueue = (OS_dispatch_queue *)v27;

    AudioObjectPropertyScope v29 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    samplingRates = v10->_samplingRates;
    v10->_samplingRates = v29;

    id v31 = [NSString stringWithFormat:@"%@.device.%@.sampleRate", v13, *p_deviceUID];
    dispatch_queue_t v32 = dispatch_queue_create((const char *)[v31 UTF8String], 0);
    sampleRateQueue = v10->_sampleRateQueue;
    v10->_sampleRateQueue = (OS_dispatch_queue *)v32;

    id v34 = [NSString stringWithFormat:@"%@.device.%@.ioReference", v13, *p_deviceUID];
    dispatch_queue_t v35 = dispatch_queue_create((const char *)[v34 UTF8String], 0);
    ioReferenceQueue = v10->_ioReferenceQueue;
    v10->_ioReferenceQueue = (OS_dispatch_queue *)v35;

    clientDescription = v10->_clientDescription;
    v10->_clientDescription = (NSDictionary *)&unk_26D978070;

    unsigned int v38 = (NSDictionary *)objc_alloc_init(NSDictionary);
    deviceDescription = v10->_deviceDescription;
    v10->_deviceDescription = v38;

    [(ASDObject *)v10 setupDiagnosticStateDumpHandlerWithTreeWalk:1];
  }

  return v10;
}

- (unsigned)objectClass
{
  return 1633969526;
}

void __30__ASDAudioDevice_hasProperty___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(a1[4] + 64) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1[4] + 64);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      unsigned int v6 = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "physicalFormat", (void)v10);
          v6 += [v9 channelsPerFrame];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    else
    {
      unsigned int v6 = 0;
    }

    if (*(_DWORD *)(a1[6] + 8) <= v6) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
}

void __30__ASDAudioDevice_hasProperty___block_invoke_2(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(a1[4] + 80) count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1[4] + 80);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      unsigned int v6 = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "physicalFormat", (void)v10);
          v6 += [v9 channelsPerFrame];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    else
    {
      unsigned int v6 = 0;
    }

    if (*(_DWORD *)(a1[6] + 8) <= v6) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  unsigned int v8 = 8;
  if ((int)a3->mSelector <= 1818454125)
  {
    if (mSelector > 1668575851)
    {
      if (mSelector > 1685222500)
      {
        if (mSelector <= 1751737453)
        {
          if (mSelector == 1685222501) {
            return 4;
          }
          int v9 = 1735354734;
          goto LABEL_51;
        }
        if (mSelector == 1751737454) {
          return 4;
        }
        unsigned __int16 v10 = 25454;
        goto LABEL_58;
      }
      if (mSelector > 1684301170)
      {
        if (mSelector == 1684301171) {
          return v8;
        }
        int v9 = 1684434036;
        goto LABEL_51;
      }
      if (mSelector == 1668575852)
      {
        uint64_t v32 = 0;
        unsigned int v33 = &v32;
        uint64_t v34 = 0x2020000000;
        controlQueue = self->_controlQueue;
        uint64_t v35 = 0;
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
        v29[3] = &unk_264773338;
        v29[5] = &v32;
        v29[6] = a3;
        v29[4] = self;
        dispatch_queue_t v17 = v29;
        goto LABEL_78;
      }
      int v11 = 1684236338;
    }
    else
    {
      if (mSelector > 1667658617)
      {
        if (mSelector > 1668050794)
        {
          if (mSelector == 1668050795) {
            return 4;
          }
          int v9 = 1668510818;
        }
        else
        {
          if (mSelector == 1667658618) {
            return 4;
          }
          int v9 = 1668049764;
        }
        goto LABEL_51;
      }
      if (mSelector <= 1667330159)
      {
        if (mSelector == 1634429294)
        {
          int v36 = 1633969526;
          uint64_t v32 = *(void *)&a3->mSelector;
          LODWORD(v33) = a3->mElement;
          LODWORD(v32) = 1870098020;
          uint64_t v18 = [(ASDObject *)self owner];
          unsigned int v8 = [v18 dataSizeForProperty:&v32 withQualifierSize:4 andQualifierData:&v36];

          return v8;
        }
        int v9 = 1635087471;
        goto LABEL_51;
      }
      if (mSelector == 1667330160) {
        return v8;
      }
      int v11 = 1667523955;
    }
LABEL_59:
    if (mSelector == v11) {
      return v8;
    }
    goto LABEL_60;
  }
  if (mSelector <= 1853059699)
  {
    if (mSelector > 1819173228)
    {
      if (mSelector > 1836411235)
      {
        if (mSelector == 1836411236) {
          return v8;
        }
        if (mSelector == 1853059619)
        {
          long long v12 = [(ASDAudioDevice *)self samplingRates];
          int v13 = [v12 count];

          return 16 * v13;
        }
        goto LABEL_60;
      }
      if (mSelector == 1819173229) {
        return v8;
      }
      int v9 = 1819569763;
      goto LABEL_51;
    }
    if (mSelector <= 1818850925)
    {
      if (mSelector == 1818454126) {
        return v8;
      }
      unsigned __int16 v10 = 28270;
LABEL_58:
      int v11 = v10 | 0x6C630000;
      goto LABEL_59;
    }
    if (mSelector == 1818850926) {
      return 4;
    }
    int v11 = 1819107691;
    goto LABEL_59;
  }
  if (mSelector <= 1936092275)
  {
    if (mSelector <= 1919512166)
    {
      if (mSelector == 1853059700) {
        return v8;
      }
      if (mSelector != 1870098020) {
        goto LABEL_60;
      }
      if (!a4)
      {
        uint64_t v32 = 0;
        unsigned int v33 = &v32;
        uint64_t v34 = 0x2020000000;
        uint64_t v35 = 0;
        AudioObjectPropertyScope mScope = a3->mScope;
        if (mScope == 1768845428 || mScope == 1735159650)
        {
          inputStreamQueue = self->_inputStreamQueue;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_7;
          v26[3] = &unk_264773158;
          v26[4] = self;
          v26[5] = &v32;
          dispatch_sync(inputStreamQueue, v26);
          AudioObjectPropertyScope mScope = a3->mScope;
        }
        if (mScope == 1869968496 || mScope == 1735159650)
        {
          outputStreamQueue = self->_outputStreamQueue;
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8;
          v25[3] = &unk_264773158;
          v25[4] = self;
          v25[5] = &v32;
          dispatch_sync(outputStreamQueue, v25);
        }
        controlQueue = self->_controlQueue;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9;
        v24[3] = &unk_264773338;
        v24[4] = self;
        v24[5] = &v32;
        v24[6] = a3;
        dispatch_queue_t v17 = v24;
        goto LABEL_78;
      }
      if ((a4 & 3) == 0)
      {
        uint64_t v32 = 0;
        unsigned int v33 = &v32;
        uint64_t v34 = 0x2020000000;
        uint64_t v35 = 0;
        controlQueue = self->_controlQueue;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_6;
        v27[3] = &unk_264773360;
        unsigned int v28 = a4 >> 2;
        v27[6] = a5;
        v27[7] = a3;
        v27[4] = self;
        v27[5] = &v32;
        dispatch_queue_t v17 = v27;
        goto LABEL_78;
      }
      return 0;
    }
    if (mSelector == 1919512167) {
      return 4;
    }
    int v9 = 1935763060;
LABEL_51:
    if (mSelector == v9) {
      return 4;
    }
LABEL_60:
    v23.receiver = self;
    v23.super_class = (Class)ASDAudioDevice;
    return [(ASDObject *)&v23 dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5];
  }
  if (mSelector <= 1937009954)
  {
    if (mSelector != 1936092276)
    {
      if (mSelector != 1936879204) {
        goto LABEL_60;
      }
      if (-[ASDAudioDevice channelLayoutTagForScope:](self, "channelLayoutTagForScope:", a3->mScope, *(void *)&a4, a5))
      {
        return 12;
      }
      else
      {
        return 20
             * [(ASDAudioDevice *)self numberOfChannelsInLayoutForScope:a3->mScope]+ 12;
      }
    }
    return 4;
  }
  if (mSelector == 1937009955)
  {
    uint64_t v32 = 0;
    unsigned int v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    AudioObjectPropertyScope v14 = a3->mScope;
    if (v14 == 1768845428 || v14 == 1735159650)
    {
      uint64_t v15 = self->_inputStreamQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
      block[3] = &unk_264773158;
      block[4] = self;
      block[5] = &v32;
      dispatch_sync(v15, block);
      AudioObjectPropertyScope v14 = a3->mScope;
    }
    if (v14 != 1869968496 && v14 != 1735159650) {
      goto LABEL_79;
    }
    controlQueue = self->_outputStreamQueue;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
    v30[3] = &unk_264773158;
    v30[4] = self;
    v30[5] = &v32;
    dispatch_queue_t v17 = v30;
LABEL_78:
    dispatch_sync(controlQueue, v17);
LABEL_79:
    unsigned int v8 = 4 * *((_DWORD *)v33 + 6);
    _Block_object_dispose(&v32, 8);
    return v8;
  }
  if (mSelector != 1969841184)
  {
    int v9 = 1953653102;
    goto LABEL_51;
  }
  return v8;
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1[4] + 96);
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

void __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 96);
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

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __73__ASDAudioDevice_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1[4] + 96);
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

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(void *a1)
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
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v8 + 1)+ 8 * v7), "objectID", (void)v8);
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1[4] + 80);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v8 + 1)+ 8 * v7), "objectID", (void)v8);
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = **(unsigned int **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 96) count] <= v3 >> 2) {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 96) count];
  }
  else {
    unint64_t v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 96);
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

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 96);
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

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_7(void *a1)
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
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v8 + 1)+ 8 * v7), "objectID", (void)v8);
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1[4] + 80);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v8 + 1)+ 8 * v7), "objectID", (void)v8);
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 96);
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

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    uint64_t v15 = v2;
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 8);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v9 startingChannel];
          long long v11 = [v9 physicalFormat];
          int v12 = [v11 channelsPerFrame];

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(void **)(a1 + 56) = [v9 channelNameForChannelIndex:v3 - v10];
            uint64_t v14 = **(const void ***)(a1 + 56);
            if (v14) {
              CFRetain(v14);
            }
            **(_DWORD **)(a1 + 64) = 8;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_11(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    uint64_t v15 = v2;
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 8);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 80);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v9 startingChannel];
          long long v11 = [v9 physicalFormat];
          int v12 = [v11 channelsPerFrame];

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(void **)(a1 + 56) = [v9 channelNameForChannelIndex:v3 - v10];
            uint64_t v14 = **(const void ***)(a1 + 56);
            if (v14) {
              CFRetain(v14);
            }
            **(_DWORD **)(a1 + 64) = 8;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_12(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    uint64_t v15 = v2;
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 8);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v9 startingChannel];
          long long v11 = [v9 physicalFormat];
          int v12 = [v11 channelsPerFrame];

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(void **)(a1 + 56) = [v9 channelCategoryForChannelIndex:v3 - v10];
            uint64_t v14 = **(const void ***)(a1 + 56);
            if (v14) {
              CFRetain(v14);
            }
            **(_DWORD **)(a1 + 64) = 8;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_13(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    uint64_t v15 = v2;
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 8);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 80);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v9 startingChannel];
          long long v11 = [v9 physicalFormat];
          int v12 = [v11 channelsPerFrame];

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(void **)(a1 + 56) = [v9 channelCategoryForChannelIndex:v3 - v10];
            uint64_t v14 = **(const void ***)(a1 + 56);
            if (v14) {
              CFRetain(v14);
            }
            **(_DWORD **)(a1 + 64) = 8;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_14(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    uint64_t v15 = v2;
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 8);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 64);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v9 startingChannel];
          long long v11 = [v9 physicalFormat];
          int v12 = [v11 channelsPerFrame];

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(void **)(a1 + 56) = [v9 channelNumberForChannelIndex:v3 - v10];
            uint64_t v14 = **(const void ***)(a1 + 56);
            if (v14) {
              CFRetain(v14);
            }
            **(_DWORD **)(a1 + 64) = 8;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
}

void __89__ASDAudioDevice_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_15(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 80) count])
  {
    uint64_t v15 = v2;
    unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 48) + 8);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 80);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v9 startingChannel];
          long long v11 = [v9 physicalFormat];
          int v12 = [v11 channelsPerFrame];

          if (v3 >= v10 && v3 < v12 + v10)
          {
            **(void **)(a1 + 56) = [v9 channelNumberForChannelIndex:v3 - v10];
            uint64_t v14 = **(const void ***)(a1 + 56);
            if (v14) {
              CFRetain(v14);
            }
            **(_DWORD **)(a1 + 64) = 8;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_18;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    v2 = v15;
  }
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if (a3->mSelector == 1667523955 || mSelector == 1853059700) {
    return 1;
  }
  if (mSelector == 1819173229)
  {
    return [(ASDAudioDevice *)self canChangeDeviceName];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ASDAudioDevice;
    return -[ASDObject isPropertySettable:](&v6, sel_isPropertySettable_);
  }
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  if (!-[ASDAudioDevice hasProperty:](self, "hasProperty:")
    || ![(ASDAudioDevice *)self isPropertySettable:a3])
  {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1819173228)
  {
    if (mSelector == 1853059700)
    {
      if (v10 == 8)
      {
        double v20 = *(double *)a7;
        [(ASDAudioDevice *)self samplingRates];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v29 != v24) {
                objc_enumerationMutation(v21);
              }
              [*(id *)(*((void *)&v28 + 1) + 8 * i) doubleValue];
              if (vabdd_f64(v20, v26) < 0.001)
              {

                BOOL v16 = [(ASDAudioDevice *)self changeSamplingRate:v20];
                goto LABEL_33;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        BOOL v16 = 0;
LABEL_33:

        return v16;
      }
      return 0;
    }
    if (mSelector != 1819173229) {
      goto LABEL_15;
    }
    if (v10 != 8) {
      return 0;
    }
    double v17 = *(double *)a7;
    return [(ASDAudioDevice *)self changeDeviceName:*(void *)&v17];
  }
  else
  {
    if (mSelector != 1667523955)
    {
      if (mSelector == 1818850926)
      {
        if (v10 == 4)
        {
          self->_isAlive = *(_DWORD *)a7 != 0;
          return 1;
        }
        return 0;
      }
LABEL_15:
      v27.receiver = self;
      v27.super_class = (Class)ASDAudioDevice;
      return [(ASDObject *)&v27 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
    }
    if (v10 != 8) {
      return 0;
    }
    double v19 = *(double *)a7;
    return [(ASDAudioDevice *)self changeClientDescription:*(void *)&v19];
  }
}

- (void)addInputStream:(id)a3
{
  id v5 = a3;
  objc_super v6 = v5;
  if (v5)
  {
    inputStreamQueue = self->_inputStreamQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__ASDAudioDevice_addInputStream___block_invoke;
    block[3] = &unk_2647731A8;
    block[4] = self;
    id v8 = v5;
    id v17 = v8;
    SEL v18 = a2;
    dispatch_sync(inputStreamQueue, block);
    [v8 setOwner:self];
    if (![v8 startingChannel])
    {
      long long v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 cStringUsingEncoding:4];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[ASDAudioDevice addInputStream:](v11);
      }
    }
    int v15 = 0;
    uint64_t v14 = 0x696E707473746D23;
    uint64_t v12 = [(ASDObject *)self propertyChangedDelegate];
    [v12 changedProperty:&v14 forObject:self];

    uint64_t v14 = 0x676C6F626F776E64;
    uint64_t v13 = [(ASDObject *)self propertyChangedDelegate];
    [v13 changedProperty:&v14 forObject:self];
  }
}

void __33__ASDAudioDevice_addInputStream___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)])
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDAudioDevice.m" lineNumber:1432 description:@"Stream already exists"];
  }
  [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) plugin];
  [v3 addStreamRealTimeOperations:*(void *)(a1 + 40)];
}

- (void)removeInputStream:(id)a3
{
  id v5 = a3;
  objc_super v6 = v5;
  if (v5)
  {
    inputStreamQueue = self->_inputStreamQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__ASDAudioDevice_removeInputStream___block_invoke;
    block[3] = &unk_2647731A8;
    block[4] = self;
    id v13 = v5;
    SEL v14 = a2;
    dispatch_sync(inputStreamQueue, block);
    int v11 = 0;
    uint64_t v10 = 0x696E707473746D23;
    id v8 = [(ASDObject *)self propertyChangedDelegate];
    [v8 changedProperty:&v10 forObject:self];

    uint64_t v10 = 0x676C6F626F776E64;
    long long v9 = [(ASDObject *)self propertyChangedDelegate];
    [v9 changedProperty:&v10 forObject:self];
  }
}

uint64_t __36__ASDAudioDevice_removeInputStream___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_super v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDAudioDevice.m" lineNumber:1462 description:@"Stream doesn't exist"];
  }
  v2 = [*(id *)(a1 + 32) plugin];
  [v2 removeStreamRealTimeOperations:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 64);
  return [v4 removeObject:v3];
}

- (id)inputStreams
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  inputStreamQueue = self->_inputStreamQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ASDAudioDevice_inputStreams__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(inputStreamQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __30__ASDAudioDevice_inputStreams__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 64)];
  return MEMORY[0x270F9A758]();
}

- (void)addOutputStream:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    outputStreamQueue = self->_outputStreamQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__ASDAudioDevice_addOutputStream___block_invoke;
    block[3] = &unk_2647731A8;
    block[4] = self;
    id v8 = v5;
    id v17 = v8;
    SEL v18 = a2;
    dispatch_sync(outputStreamQueue, block);
    [v8 setOwner:self];
    if (![v8 startingChannel])
    {
      long long v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 cStringUsingEncoding:4];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[ASDAudioDevice addInputStream:](v11);
      }
    }
    int v15 = 0;
    uint64_t v14 = 0x6F75747073746D23;
    uint64_t v12 = [(ASDObject *)self propertyChangedDelegate];
    [v12 changedProperty:&v14 forObject:self];

    uint64_t v14 = 0x676C6F626F776E64;
    id v13 = [(ASDObject *)self propertyChangedDelegate];
    [v13 changedProperty:&v14 forObject:self];
  }
}

void __34__ASDAudioDevice_addOutputStream___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 80) containsObject:*(void *)(a1 + 40)])
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDAudioDevice.m" lineNumber:1497 description:@"Stream already exists"];
  }
  [*(id *)(*(void *)(a1 + 32) + 80) addObject:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) plugin];
  [v3 addStreamRealTimeOperations:*(void *)(a1 + 40)];
}

- (void)removeOutputStream:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    outputStreamQueue = self->_outputStreamQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__ASDAudioDevice_removeOutputStream___block_invoke;
    block[3] = &unk_2647731A8;
    block[4] = self;
    id v13 = v5;
    SEL v14 = a2;
    dispatch_sync(outputStreamQueue, block);
    int v11 = 0;
    uint64_t v10 = 0x6F75747073746D23;
    id v8 = [(ASDObject *)self propertyChangedDelegate];
    [v8 changedProperty:&v10 forObject:self];

    uint64_t v10 = 0x676C6F626F776E64;
    long long v9 = [(ASDObject *)self propertyChangedDelegate];
    [v9 changedProperty:&v10 forObject:self];
  }
}

uint64_t __37__ASDAudioDevice_removeOutputStream___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 80) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDAudioDevice.m" lineNumber:1527 description:@"Stream doesn't exist"];
  }
  v2 = [*(id *)(a1 + 32) plugin];
  [v2 removeStreamRealTimeOperations:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v4 removeObject:v3];
}

- (id)outputStreams
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  outputStreamQueue = self->_outputStreamQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__ASDAudioDevice_outputStreams__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputStreamQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __31__ASDAudioDevice_outputStreams__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 80)];
  return MEMORY[0x270F9A758]();
}

- (void)addControl:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    SEL v14 = __29__ASDAudioDevice_addControl___block_invoke;
    int v15 = &unk_2647731F8;
    BOOL v16 = self;
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

uint64_t __29__ASDAudioDevice_addControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
}

- (void)removeControl:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    controlQueue = self->_controlQueue;
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __32__ASDAudioDevice_removeControl___block_invoke;
    SEL v14 = &unk_2647731F8;
    int v15 = self;
    id v16 = v4;
    dispatch_sync(controlQueue, &block);
    LODWORD(v10) = 0;
    id v7 = [(ASDObject *)self propertyChangedDelegate];
    [v7 changedProperty:&v9 forObject:self];

    uint64_t v8 = [(ASDObject *)self propertyChangedDelegate];
    [v8 changedProperty:&v9 forObject:self];
  }
}

uint64_t __32__ASDAudioDevice_removeControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(a1 + 40)];
}

- (id)controls
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  controlQueue = self->_controlQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__ASDAudioDevice_controls__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(controlQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __26__ASDAudioDevice_controls__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 96)];
  return MEMORY[0x270F9A758]();
}

- (void)requestConfigurationChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDAudioDevice *)self configurationChangeDelegate];
  [v5 requestConfigurationChangeForDevice:self withBlock:v4];
}

- (void)performConfigurationChange:(void *)a3
{
  (*((void (**)(void *, SEL))a3 + 2))(a3, a2);
}

- (void)abortConfigurationChange:(void *)a3
{
}

- (void)preferredChannelsForLeft:(unsigned int *)a3 andRight:(unsigned int *)a4
{
  if (a3) {
    *a3 = 1;
  }
  if (a4) {
    *a4 = 2;
  }
}

- (unsigned)numberOfChannelsInLayoutForScope:(unsigned int)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (a3 == 1869968496)
  {
    outputStreamQueue = self->_outputStreamQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke_2;
    v7[3] = &unk_2647733D8;
    v7[4] = self;
    v7[5] = &v9;
    id v4 = v7;
    goto LABEL_5;
  }
  if (a3 == 1768845428)
  {
    outputStreamQueue = self->_inputStreamQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke;
    v8[3] = &unk_2647733D8;
    v8[4] = self;
    v8[5] = &v9;
    id v4 = v8;
LABEL_5:
    dispatch_sync(outputStreamQueue, v4);
  }
  unsigned int v5 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
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
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "physicalFormat", (void)v9);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v8 channelsPerFrame];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __51__ASDAudioDevice_numberOfChannelsInLayoutForScope___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80);
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
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "physicalFormat", (void)v9);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v8 channelsPerFrame];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (unsigned)channelLayoutTagForScope:(unsigned int)a3
{
  return 0;
}

- (unsigned)channelLayoutBitmapForScope:(unsigned int)a3
{
  return 0;
}

- (void)preferredChannelDescriptions:(AudioChannelDescription *)a3 numberOfChannels:(unsigned int)a4 forScope:(unsigned int)a5
{
  if (a5 == 1869968496)
  {
    outputStreamQueue = self->_outputStreamQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_48;
    v7[3] = &unk_264773400;
    unsigned int v8 = a4;
    v7[4] = self;
    v7[5] = a3;
    uint64_t v6 = v7;
  }
  else
  {
    if (a5 != 1768845428) {
      return;
    }
    outputStreamQueue = self->_inputStreamQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke;
    v9[3] = &unk_264773400;
    unsigned int v10 = a4;
    v9[4] = self;
    v9[5] = a3;
    uint64_t v6 = v9;
  }
  dispatch_sync(outputStreamQueue, v6);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A63EEF0]();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v22 = *(void *)v24;
    uint64_t v4 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v7 = [v6 startingChannel];
        if (!v7)
        {
          unsigned int v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          id v9 = objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v9 cStringUsingEncoding:4];

          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_2(&v29, v10, &v30);
          }
          int v7 = 1;
        }
        long long v11 = [v6 physicalFormat];
        int v12 = [v11 channelsPerFrame];

        if (v12)
        {
          unint64_t v13 = 0;
          int v14 = v7 - 1;
          do
          {
            if ((v14 + v13) >= *(_DWORD *)(a1 + 48))
            {
              int v15 = (objc_class *)objc_opt_class();
              NSStringFromClass(v15);
              id v16 = objc_claimAutoreleasedReturnValue();
              uint64_t v17 = [v16 cStringUsingEncoding:4];

              if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
                __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_1(&v27, v17, &v28);
              }
            }
            else
            {
              [v6 preferredChannelDescription:*(void *)(a1 + 40) + 20 * (v14 + v13) forChannelIndex:v13];
            }
            ++v13;
            SEL v18 = [v6 physicalFormat];
            unsigned int v19 = [v18 channelsPerFrame];
          }
          while (v13 < v19);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v3);
  }
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_48(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A63EEF0]();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v22 = *(void *)v24;
    uint64_t v4 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v7 = [v6 startingChannel];
        if (!v7)
        {
          unsigned int v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          id v9 = objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [v9 cStringUsingEncoding:4];

          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_2(&v29, v10, &v30);
          }
          int v7 = 1;
        }
        long long v11 = [v6 physicalFormat];
        int v12 = [v11 channelsPerFrame];

        if (v12)
        {
          unint64_t v13 = 0;
          int v14 = v7 - 1;
          do
          {
            if ((v14 + v13) >= *(_DWORD *)(a1 + 48))
            {
              int v15 = (objc_class *)objc_opt_class();
              NSStringFromClass(v15);
              id v16 = objc_claimAutoreleasedReturnValue();
              uint64_t v17 = [v16 cStringUsingEncoding:4];

              if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
                __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_1(&v27, v17, &v28);
              }
            }
            else
            {
              [v6 preferredChannelDescription:*(void *)(a1 + 40) + 20 * (v14 + v13) forChannelIndex:v13];
            }
            ++v13;
            SEL v18 = [v6 physicalFormat];
            unsigned int v19 = [v18 channelsPerFrame];
          }
          while (v13 < v19);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v3);
  }
}

- (unsigned)calculateIOBufferFrameSize:(unsigned int)a3
{
  return a3;
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
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__ASDAudioDevice_startIOForClient___block_invoke;
  v6[3] = &unk_2647733D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__ASDAudioDevice_startIOForClient___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 136))
  {
    uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) performStartIO];
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    ++*(void *)(*(void *)(a1 + 32) + 136);
  }
}

- (int)stopIOForClient:(unsigned int)a3
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  ioReferenceQueue = self->_ioReferenceQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__ASDAudioDevice_stopIOForClient___block_invoke;
  v6[3] = &unk_2647733D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ioReferenceQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__ASDAudioDevice_stopIOForClient___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 136);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 136) = v4;
    if (!*(void *)(*(void *)(a1 + 32) + 136))
    {
      uint64_t v6 = (void *)MEMORY[0x22A63EEF0]();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) performStopIO];
    }
  }
}

- (int)performStartIO
{
  if ([(ASDAudioDevice *)self isRunning])
  {
    objc_super v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:1817 description:@"performStartIO should only be called when IO is not running"];
  }
  uint64_t v4 = [(ASDAudioDevice *)self getZeroTimestampBlock];
  uint64_t v5 = (void *)[v4 copy];
  id getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_id getZeroTimestampBlock = v5;

  self->_getZeroTimestampBlockUnretained = self->_getZeroTimestampBlock;
  uint64_t v7 = [(ASDAudioDevice *)self willDoReadInputBlock];
  unsigned int v8 = (void *)[v7 copy];
  id willDoReadInputBlock = self->_willDoReadInputBlock;
  self->_id willDoReadInputBlock = v8;

  self->_willDoReadInputBlockUnretained = self->_willDoReadInputBlock;
  int v10 = [(ASDAudioDevice *)self willDoConvertInputBlock];
  long long v11 = (void *)[v10 copy];
  id willDoConvertInputBlock = self->_willDoConvertInputBlock;
  self->_id willDoConvertInputBlock = v11;

  self->_willDoConvertInputBlockUnretained = self->_willDoConvertInputBlock;
  unint64_t v13 = [(ASDAudioDevice *)self willDoProcessInputBlock];
  int v14 = (void *)[v13 copy];
  id willDoProcessInputBlock = self->_willDoProcessInputBlock;
  self->_id willDoProcessInputBlock = v14;

  self->_willDoProcessInputBlockUnretained = self->_willDoProcessInputBlock;
  id v16 = [(ASDAudioDevice *)self willDoProcessOutputBlock];
  uint64_t v17 = (void *)[v16 copy];
  id willDoProcessOutputBlock = self->_willDoProcessOutputBlock;
  self->_id willDoProcessOutputBlock = v17;

  self->_willDoProcessOutputBlockUnretained = self->_willDoProcessOutputBlock;
  unsigned int v19 = [(ASDAudioDevice *)self willDoMixOutputBlock];
  double v20 = (void *)[v19 copy];
  id willDoMixOutputBlock = self->_willDoMixOutputBlock;
  self->_id willDoMixOutputBlock = v20;

  self->_willDoMixOutputBlockUnretained = self->_willDoMixOutputBlock;
  uint64_t v22 = [(ASDAudioDevice *)self willDoProcessMixBlock];
  long long v23 = (void *)[v22 copy];
  id willDoProcessMixBlock = self->_willDoProcessMixBlock;
  self->_id willDoProcessMixBlock = v23;

  self->_willDoProcessMixBlockUnretained = self->_willDoProcessMixBlock;
  long long v25 = [(ASDAudioDevice *)self willDoConvertMixBlock];
  long long v26 = (void *)[v25 copy];
  id willDoConvertMixBlock = self->_willDoConvertMixBlock;
  self->_id willDoConvertMixBlock = v26;

  self->_willDoConvertMixBlockUnretained = self->_willDoConvertMixBlock;
  uint64_t v28 = [(ASDAudioDevice *)self willDoWriteMixBlock];
  float v29 = (void *)[v28 copy];
  id willDoWriteMixBlock = self->_willDoWriteMixBlock;
  self->_id willDoWriteMixBlock = v29;

  self->_willDoWriteMixBlockUnretained = self->_willDoWriteMixBlock;
  long long v31 = [(ASDAudioDevice *)self beginIOOperationBlock];
  uint64_t v32 = (void *)[v31 copy];
  id beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_id beginIOOperationBlock = v32;

  self->_beginIOOperationBlockUnretained = self->_beginIOOperationBlock;
  uint64_t v34 = [(ASDAudioDevice *)self endIOOperationBlock];
  uint64_t v35 = (void *)[v34 copy];
  id endIOOperationBlock = self->_endIOOperationBlock;
  self->_id endIOOperationBlock = v35;

  self->_endIOOperationBlockUnretained = self->_endIOOperationBlock;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 0;
  inputStreamQueue = self->_inputStreamQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ASDAudioDevice_performStartIO__block_invoke;
  block[3] = &unk_2647733D8;
  block[4] = self;
  void block[5] = v48;
  dispatch_sync(inputStreamQueue, block);
  outputStreamQueue = self->_outputStreamQueue;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __32__ASDAudioDevice_performStartIO__block_invoke_2;
  v44[3] = &unk_2647733D8;
  v44[4] = self;
  v44[5] = v46;
  dispatch_sync(outputStreamQueue, v44);
  self->_isRunning = 1;
  LODWORD(v43) = 0;
  AudioObjectPropertyScope v39 = [(ASDObject *)self propertyChangedDelegate];
  [v39 changedProperty:&v42 forObject:self];

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  return 0;
}

void __32__ASDAudioDevice_performStartIO__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "startStream", (void)v8);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __32__ASDAudioDevice_performStartIO__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7), "startStream", (void)v8);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (int)performStopIO
{
  if (![(ASDAudioDevice *)self isRunning])
  {
    unsigned int v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:1893 description:@"performStopIO should only be called when IO is running"];
  }
  outputStreamQueue = self->_outputStreamQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDAudioDevice_performStopIO__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(outputStreamQueue, block);
  inputStreamQueue = self->_inputStreamQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __31__ASDAudioDevice_performStopIO__block_invoke_2;
  v22[3] = &unk_264773220;
  v22[4] = self;
  dispatch_sync(inputStreamQueue, v22);
  self->_isRunning = 0;
  id getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_id getZeroTimestampBlock = 0;

  self->_getZeroTimestampBlockUnretained = 0;
  id willDoReadInputBlock = self->_willDoReadInputBlock;
  self->_id willDoReadInputBlock = 0;

  self->_willDoReadInputBlockUnretained = 0;
  id willDoConvertInputBlock = self->_willDoConvertInputBlock;
  self->_id willDoConvertInputBlock = 0;

  self->_willDoConvertInputBlockUnretained = 0;
  id willDoProcessInputBlock = self->_willDoProcessInputBlock;
  self->_id willDoProcessInputBlock = 0;

  self->_willDoProcessInputBlockUnretained = 0;
  id willDoProcessOutputBlock = self->_willDoProcessOutputBlock;
  self->_id willDoProcessOutputBlock = 0;

  self->_willDoProcessOutputBlockUnretained = 0;
  id willDoMixOutputBlock = self->_willDoMixOutputBlock;
  self->_id willDoMixOutputBlock = 0;

  self->_willDoMixOutputBlockUnretained = 0;
  id willDoProcessMixBlock = self->_willDoProcessMixBlock;
  self->_id willDoProcessMixBlock = 0;

  self->_willDoProcessMixBlockUnretained = 0;
  id willDoConvertMixBlock = self->_willDoConvertMixBlock;
  self->_id willDoConvertMixBlock = 0;

  self->_willDoConvertMixBlockUnretained = 0;
  id willDoWriteMixBlock = self->_willDoWriteMixBlock;
  self->_id willDoWriteMixBlock = 0;

  self->_willDoWriteMixBlockUnretained = 0;
  id beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_id beginIOOperationBlock = 0;

  self->_beginIOOperationBlockUnretained = 0;
  id endIOOperationBlock = self->_endIOOperationBlock;
  self->_id endIOOperationBlock = 0;

  self->_endIOOperationBlockUnretained = 0;
  LODWORD(v21) = 0;
  uint64_t v17 = [(ASDObject *)self propertyChangedDelegate];
  [v17 changedProperty:&v20 forObject:self];

  return 0;
}

void __31__ASDAudioDevice_performStopIO__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "stopStream", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __31__ASDAudioDevice_performStopIO__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "stopStream", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)ioThreadStateChange:(id)a3
{
  id v4 = a3;
  ioReferenceQueue = self->_ioReferenceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__ASDAudioDevice_ioThreadStateChange___block_invoke;
  v7[3] = &unk_2647731F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(ioReferenceQueue, v7);
}

uint64_t __38__ASDAudioDevice_ioThreadStateChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performIOThreadStateChange:*(void *)(a1 + 40)];
}

- (void)setSamplingRate:(double)a3
{
  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASDAudioDevice_setSamplingRate___block_invoke;
  block[3] = &unk_2647732E8;
  block[4] = self;
  *(double *)&void block[5] = a3;
  dispatch_sync(sampleRateQueue, block);
  LODWORD(v7) = 0;
  uint64_t v5 = [(ASDObject *)self propertyChangedDelegate];
  [v5 changedProperty:&v6 forObject:self];
}

void __34__ASDAudioDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  *(void *)(*(void *)(a1 + 32) + 112) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _updateTimestampPeriod:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateSafetyOffsets:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASDAudioDevice_setSamplingRate___block_invoke_2;
  block[3] = &unk_2647732E8;
  block[4] = v3;
  void block[5] = *(void *)(a1 + 40);
  dispatch_sync(v4, block);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 88);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ASDAudioDevice_setSamplingRate___block_invoke_3;
  v7[3] = &unk_2647732E8;
  v7[4] = v5;
  void v7[5] = *(void *)(a1 + 40);
  dispatch_sync(v6, v7);
}

void __34__ASDAudioDevice_setSamplingRate___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "deviceChangedToSamplingRate:", *(double *)(a1 + 40), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __34__ASDAudioDevice_setSamplingRate___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80);
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "deviceChangedToSamplingRate:", *(double *)(a1 + 40), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
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
  v5[2] = __30__ASDAudioDevice_samplingRate__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __30__ASDAudioDevice_samplingRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 112);
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
  int v12 = __35__ASDAudioDevice_setSamplingRates___block_invoke;
  uint64_t v13 = &unk_2647731F8;
  int v14 = self;
  id v15 = v4;
  id v6 = v4;
  dispatch_sync(sampleRateQueue, &block);
  LODWORD(v9) = 0;
  uint64_t v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v8 forObject:self];
}

void __35__ASDAudioDevice_setSamplingRates___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v3;
}

- (NSArray)samplingRates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  long long v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__ASDAudioDevice_samplingRates__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __31__ASDAudioDevice_samplingRates__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 120) copy];
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

- (void)setClientDescription:(id)a3
{
  uint64_t v4 = (NSDictionary *)[a3 copy];
  clientDescription = self->_clientDescription;
  self->_clientDescription = v4;

  LODWORD(v8) = 0;
  uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
  [v6 changedProperty:&v7 forObject:self];
}

- (NSDictionary)clientDescription
{
  return self->_clientDescription;
}

- (BOOL)changeClientDescription:(id)a3
{
  return 0;
}

- (void)setDeviceDescription:(id)a3
{
  uint64_t v4 = (NSDictionary *)[a3 copy];
  deviceDescription = self->_deviceDescription;
  self->_deviceDescription = v4;

  LODWORD(v8) = 0;
  uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
  [v6 changedProperty:&v7 forObject:self];
}

- (NSDictionary)deviceDescription
{
  return self->_deviceDescription;
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
  block[2] = __39__ASDAudioDevice_updateTimestampPeriod__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(sampleRateQueue, block);
}

void __39__ASDAudioDevice_updateTimestampPeriod__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  [*(id *)(a1 + 32) _updateTimestampPeriod:*(double *)(*(void *)(a1 + 32) + 112)];
}

- (BOOL)hasInput
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  inputStreamQueue = self->_inputStreamQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__ASDAudioDevice_hasInput__block_invoke;
  v5[3] = &unk_2647733D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(inputStreamQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__ASDAudioDevice_hasInput__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)hasOutput
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  outputStreamQueue = self->_outputStreamQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__ASDAudioDevice_hasOutput__block_invoke;
  v5[3] = &unk_2647733D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputStreamQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__ASDAudioDevice_hasOutput__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
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

- (void)setInputSafetyOffset:(unsigned int)a3
{
  self->_inputSafetyOffset = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)inputSafetyOffset
{
  return self->_inputSafetyOffset;
}

- (void)setOutputSafetyOffset:(unsigned int)a3
{
  self->_outputSafetyOffset = a3;
  LODWORD(v6) = 0;
  uint64_t v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (unsigned)outputSafetyOffset
{
  return self->_outputSafetyOffset;
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
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2332 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id getZeroTimestampBlock = self->_getZeroTimestampBlock;
  self->_id getZeroTimestampBlock = v5;

  self->_getZeroTimestampBlockUnretained = self->_getZeroTimestampBlock;
}

- (void)setWillDoReadInputBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2339 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoReadInputBlock = self->_willDoReadInputBlock;
  self->_id willDoReadInputBlock = v5;

  self->_willDoReadInputBlockUnretained = self->_willDoReadInputBlock;
}

- (void)setWillDoConvertInputBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2346 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoConvertInputBlock = self->_willDoConvertInputBlock;
  self->_id willDoConvertInputBlock = v5;

  self->_willDoConvertInputBlockUnretained = self->_willDoConvertInputBlock;
}

- (void)setWillDoProcessInputBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2353 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoProcessInputBlock = self->_willDoProcessInputBlock;
  self->_id willDoProcessInputBlock = v5;

  self->_willDoProcessInputBlockUnretained = self->_willDoProcessInputBlock;
}

- (void)setWillDoProcessOutputBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2360 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoProcessOutputBlock = self->_willDoProcessOutputBlock;
  self->_id willDoProcessOutputBlock = v5;

  self->_willDoProcessOutputBlockUnretained = self->_willDoProcessOutputBlock;
}

- (void)setWillDoMixOutputBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2367 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoMixOutputBlock = self->_willDoMixOutputBlock;
  self->_id willDoMixOutputBlock = v5;

  self->_willDoMixOutputBlockUnretained = self->_willDoMixOutputBlock;
}

- (void)setWillDoProcessMixBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2374 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoProcessMixBlock = self->_willDoProcessMixBlock;
  self->_id willDoProcessMixBlock = v5;

  self->_willDoProcessMixBlockUnretained = self->_willDoProcessMixBlock;
}

- (void)setWillDoConvertMixBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2380 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoConvertMixBlock = self->_willDoConvertMixBlock;
  self->_id willDoConvertMixBlock = v5;

  self->_willDoConvertMixBlockUnretained = self->_willDoConvertMixBlock;
}

- (void)setWillDoWriteMixBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2387 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id willDoWriteMixBlock = self->_willDoWriteMixBlock;
  self->_id willDoWriteMixBlock = v5;

  self->_willDoWriteMixBlockUnretained = self->_willDoWriteMixBlock;
}

- (void)setBeginIOOperationBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2394 description:@"Can't set block when IO is running"];
  }
  uint64_t v5 = (void *)[v8 copy];
  id beginIOOperationBlock = self->_beginIOOperationBlock;
  self->_id beginIOOperationBlock = v5;

  self->_beginIOOperationBlockUnretained = self->_beginIOOperationBlock;
}

- (void)setEndIOOperationBlock:(id)a3
{
  id v8 = a3;
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice.m" lineNumber:2401 description:@"Can't set block when IO is running"];
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

- (id)willDoReadInputBlockUnretainedPtr
{
  return &self->_willDoReadInputBlockUnretained;
}

- (id)willDoConvertInputBlockUnretainedPtr
{
  return &self->_willDoConvertInputBlockUnretained;
}

- (id)willDoProcessInputBlockUnretainedPtr
{
  return &self->_willDoProcessInputBlockUnretained;
}

- (id)willDoProcessOutputBlockUnretainedPtr
{
  return &self->_willDoProcessOutputBlockUnretained;
}

- (id)willDoMixOutputBlockUnretainedPtr
{
  return &self->_willDoMixOutputBlockUnretained;
}

- (id)willDoProcessMixBlockUnretainedPtr
{
  return &self->_willDoProcessMixBlockUnretained;
}

- (id)willDoConvertMixBlockUnretainedPtr
{
  return &self->_willDoConvertMixBlockUnretained;
}

- (id)willDoWriteMixBlockUnretainedPtr
{
  return &self->_willDoWriteMixBlockUnretained;
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
  objc_storeStrong((id *)&self->_wakeSemaphore, v4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ASDAudioDevice_systemWillSleep__block_invoke;
  v7[3] = &unk_2647731F8;
  dispatch_semaphore_t v8 = v3;
  dispatch_semaphore_t v9 = v4;
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  [(ASDAudioDevice *)self requestConfigurationChange:v7];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __33__ASDAudioDevice_systemWillSleep__block_invoke(uint64_t a1)
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

- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5
{
  return 1852797029;
}

- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4
{
  return 1852797029;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  wakeSemaphore = self->_wakeSemaphore;
  if (wakeSemaphore)
  {
    dispatch_semaphore_signal(wakeSemaphore);
    dispatch_semaphore_t v4 = self->_wakeSemaphore;
    self->_wakeSemaphore = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_inputStreams;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        id v11 = [(ASDObject *)self plugin];
        [v11 removeStreamRealTimeOperations:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v12 = self->_outputStreams;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        SEL v18 = [(ASDObject *)self plugin];
        [v18 removeStreamRealTimeOperations:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v14);
  }

  v19.receiver = self;
  v19.super_class = (Class)ASDAudioDevice;
  [(ASDObject *)&v19 dealloc];
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v99.receiver = self;
  v99.super_class = (Class)ASDAudioDevice;
  uint64_t v7 = [(ASDObject *)&v99 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  uint64_t v8 = [v6 stringByAppendingString:@"|        "];
  id v9 = [(ASDAudioDevice *)self deviceName];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  id v10 = [(ASDAudioDevice *)self manufacturerName];
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASDAudioDevice *)self modelName];
  [v7 appendFormat:@"%@|    Model Name: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  id v12 = [(ASDAudioDevice *)self deviceUID];
  [v7 appendFormat:@"%@|    Device UID: %s\n", v6, objc_msgSend(v12, "UTF8String")];

  id v13 = [(ASDAudioDevice *)self modelUID];
  [v7 appendFormat:@"%@|    Model UID: %s\n", v6, objc_msgSend(v13, "UTF8String")];

  int v14 = [(ASDAudioDevice *)self transportType];
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
  v82 = v6;
  [v7 appendFormat:@"%@|    Clock Domain: 0x%08x\n", v6, -[ASDAudioDevice clockDomain](self, "clockDomain")];
  unsigned int v20 = [(ASDAudioDevice *)self clockAlgorithm];
  switch(v20)
  {
    case 0x72617777u:
      long long v21 = @"Raw";
      break;
    case 0x6D617667u:
      long long v21 = @"12Pt Moving Window Average";
      break;
    case 0x69697266u:
      long long v21 = @"Simple IIR";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%x)", -[ASDAudioDevice clockAlgorithm](self, "clockAlgorithm"));
      long long v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v80 = v21;
  [v7 appendFormat:@"%@|    Clock Algorithm: %s\n", v6, -[__CFString UTF8String](v80, "UTF8String")];
  if ([(ASDAudioDevice *)self clockIsStable]) {
    long long v22 = @"YES";
  }
  else {
    long long v22 = @"NO";
  }
  [v7 appendFormat:@"%@|    Clock Is Stable: %@\n", v6, v22];
  if (self->_isAlive) {
    long long v23 = @"YES";
  }
  else {
    long long v23 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Active: %@\n", v6, v23];
  if ([(ASDAudioDevice *)self isRunning]) {
    long long v24 = @"YES";
  }
  else {
    long long v24 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Running: %@\n", v6, v24];
  if ([(ASDAudioDevice *)self canBeDefaultDevice]) {
    long long v25 = @"YES";
  }
  else {
    long long v25 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default Device: %@\n", v6, v25];
  if ([(ASDAudioDevice *)self canBeDefaultInputDevice]) {
    long long v26 = @"YES";
  }
  else {
    long long v26 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default Input Device: %@\n", v6, v26];
  if ([(ASDAudioDevice *)self canBeDefaultOutputDevice]) {
    long long v27 = @"YES";
  }
  else {
    long long v27 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default Output Device: %@\n", v6, v27];
  if ([(ASDAudioDevice *)self canBeDefaultSystemDevice]) {
    uint64_t v28 = @"YES";
  }
  else {
    uint64_t v28 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Be Default System Device: %@\n", v6, v28];
  if ([(ASDAudioDevice *)self canChangeDeviceName]) {
    float v29 = @"YES";
  }
  else {
    float v29 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Change Device Name: %@\n", v6, v29];
  [(ASDAudioDevice *)self samplingRate];
  [v7 appendFormat:@"%@|    Nominal Sample Rate: %f\n", v6, v30];
  [v7 appendFormat:@"%@|    Available Nominal Sample Rates:\n", v6];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  objc_super v81 = self;
  long long v31 = [(ASDAudioDevice *)self samplingRates];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = 0;
    uint64_t v35 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v96 != v35) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v95 + 1) + 8 * i) doubleValue];
        [v7 appendFormat:@"%@Rate[%u]: %f\n", v8, v34 + i, v37];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v95 objects:v103 count:16];
      uint64_t v34 = (v34 + i);
    }
    while (v33);
  }

  unsigned int v38 = v81;
  BOOL v39 = [(ASDAudioDevice *)v81 isHidden];
  unint64_t v40 = @"NO";
  if (v39) {
    unint64_t v40 = @"YES";
  }
  [v7 appendFormat:@"%@|    Is Hidden: %@\n", v82, v40];
  [v7 appendFormat:@"%@|    Input Latency: %u\n", v82, -[ASDAudioDevice inputLatency](v81, "inputLatency")];
  [v7 appendFormat:@"%@|    Output Latency: %u\n", v82, -[ASDAudioDevice outputLatency](v81, "outputLatency")];
  [v7 appendFormat:@"%@|    Input Safety Offset: %u\n", v82, -[ASDAudioDevice inputSafetyOffset](v81, "inputSafetyOffset")];
  [v7 appendFormat:@"%@|    Output Safety Offset: %u\n", v82, -[ASDAudioDevice outputSafetyOffset](v81, "outputSafetyOffset")];
  [v7 appendFormat:@"%@|    Zero Timestamp Period: %u\n", v82, -[ASDAudioDevice timestampPeriod](v81, "timestampPeriod")];
  objc_super v41 = [(ASDAudioDevice *)v81 clientDescription];
  uint64_t v42 = [v41 description];
  uint64_t v43 = [v42 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26D970628];

  id v79 = v43;
  [v7 appendFormat:@"%@|    Client Description: %s\n", v82, objc_msgSend(v79, "UTF8String")];
  v44 = [(ASDAudioDevice *)v81 deviceDescription];
  char v45 = [v44 description];
  v46 = [v45 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26D970628];

  id v78 = v46;
  [v7 appendFormat:@"%@|    Device Description: %s\n", v82, objc_msgSend(v78, "UTF8String")];
  [v7 appendFormat:@"%@|    Input Streams:\n", v82];
  char v47 = [(ASDAudioDevice *)v81 inputStreams];
  uint64_t v48 = [v47 count];

  if (v48)
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    char v49 = [(ASDAudioDevice *)v81 inputStreams];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v91 objects:v102 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = 0;
      uint64_t v53 = *(void *)v92;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v92 != v53) {
            objc_enumerationMutation(v49);
          }
          v55 = *(void **)(*((void *)&v91 + 1) + 8 * j);
          if (v4)
          {
            unint64_t v56 = [v55 diagnosticDescriptionWithIndent:v8 walkTree:1];
            [v7 appendString:v56];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v82, v52 + j, objc_msgSend(v55, "objectID")];
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v91 objects:v102 count:16];
        uint64_t v52 = (v52 + j);
      }
      while (v51);
    }

    unsigned int v38 = v81;
  }
  [v7 appendFormat:@"%@|    Output Streams:\n", v82];
  unint64_t v57 = [(ASDAudioDevice *)v38 outputStreams];
  uint64_t v58 = [v57 count];

  if (v58)
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    AudioObjectPropertyScope v59 = [(ASDAudioDevice *)v38 outputStreams];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v87 objects:v101 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = 0;
      uint64_t v63 = *(void *)v88;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v88 != v63) {
            objc_enumerationMutation(v59);
          }
          v65 = *(void **)(*((void *)&v87 + 1) + 8 * k);
          if (v4)
          {
            uint64_t v66 = [v65 diagnosticDescriptionWithIndent:v8 walkTree:1];
            [v7 appendString:v66];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v82, v62 + k, objc_msgSend(v65, "objectID")];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v87 objects:v101 count:16];
        uint64_t v62 = (v62 + k);
      }
      while (v61);
    }

    unsigned int v38 = v81;
  }
  [v7 appendFormat:@"%@|    Controls:\n", v82];
  unsigned int v67 = [(ASDAudioDevice *)v38 controls];
  uint64_t v68 = [v67 count];

  if (v68)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v69 = [(ASDAudioDevice *)v38 controls];
    uint64_t v70 = [v69 countByEnumeratingWithState:&v83 objects:v100 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = 0;
      uint64_t v73 = *(void *)v84;
      do
      {
        for (uint64_t m = 0; m != v71; ++m)
        {
          if (*(void *)v84 != v73) {
            objc_enumerationMutation(v69);
          }
          v75 = *(void **)(*((void *)&v83 + 1) + 8 * m);
          if (v4)
          {
            v76 = [v75 diagnosticDescriptionWithIndent:v8 walkTree:1];
            [v7 appendString:v76];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v82, v72 + m, objc_msgSend(v75, "objectID")];
          }
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v83 objects:v100 count:16];
        uint64_t v72 = (v72 + m);
      }
      while (v71);
    }
  }
  return v7;
}

- (id)driverClassName
{
  return @"AudioDevice";
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

- (NSString)configurationBundleID
{
  return self->_configurationBundleID;
}

- (void)setConfigurationBundleID:(id)a3
{
}

- (BOOL)canBeDefaultDevice
{
  return self->_canBeDefaultDevice;
}

- (void)setCanBeDefaultDevice:(BOOL)a3
{
  self->_canBeDefaultDevice = a3;
}

- (BOOL)canBeDefaultInputDevice
{
  return self->_canBeDefaultInputDevice;
}

- (void)setCanBeDefaultInputDevice:(BOOL)a3
{
  self->_canBeDefaultInputDevice = a3;
}

- (BOOL)canBeDefaultOutputDevice
{
  return self->_canBeDefaultOutputDevice;
}

- (void)setCanBeDefaultOutputDevice:(BOOL)a3
{
  self->_canBeDefaultOutputDevice = a3;
}

- (BOOL)canBeDefaultSystemDevice
{
  return self->_canBeDefaultSystemDevice;
}

- (void)setCanBeDefaultSystemDevice:(BOOL)a3
{
  self->_canBeDefaultSystemDevice = a3;
}

- (BOOL)allowAutoRoute
{
  return self->_allowAutoRoute;
}

- (void)setAllowAutoRoute:(BOOL)a3
{
  self->_allowAutoRoute = a3;
}

- (BOOL)wantsDisplayRouting
{
  return self->_wantsDisplayRouting;
}

- (void)setWantsDisplayRouting:(BOOL)a3
{
  self->_wantsDisplayRouting = a3;
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

- (id)willDoReadInputBlock
{
  return self->_willDoReadInputBlock;
}

- (id)willDoConvertInputBlock
{
  return self->_willDoConvertInputBlock;
}

- (id)willDoProcessInputBlock
{
  return self->_willDoProcessInputBlock;
}

- (id)willDoProcessOutputBlock
{
  return self->_willDoProcessOutputBlock;
}

- (id)willDoMixOutputBlock
{
  return self->_willDoMixOutputBlock;
}

- (id)willDoProcessMixBlock
{
  return self->_willDoProcessMixBlock;
}

- (id)willDoConvertMixBlock
{
  return self->_willDoConvertMixBlock;
}

- (id)willDoWriteMixBlock
{
  return self->_willDoWriteMixBlock;
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
  objc_storeStrong(&self->_willDoWriteMixBlock, 0);
  objc_storeStrong(&self->_willDoConvertMixBlock, 0);
  objc_storeStrong(&self->_willDoProcessMixBlock, 0);
  objc_storeStrong(&self->_willDoMixOutputBlock, 0);
  objc_storeStrong(&self->_willDoProcessOutputBlock, 0);
  objc_storeStrong(&self->_willDoProcessInputBlock, 0);
  objc_storeStrong(&self->_willDoConvertInputBlock, 0);
  objc_storeStrong(&self->_willDoReadInputBlock, 0);
  objc_storeStrong(&self->_getZeroTimestampBlock, 0);
  objc_storeStrong((id *)&self->_configurationBundleID, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelUID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceDescription, 0);
  objc_storeStrong((id *)&self->_clientDescription, 0);
  objc_storeStrong((id *)&self->_wakeSemaphore, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_ioReferenceQueue, 0);
  objc_storeStrong((id *)&self->_sampleRateQueue, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_outputStreamQueue, 0);
  objc_storeStrong((id *)&self->_outputStreams, 0);
  objc_storeStrong((id *)&self->_inputStreamQueue, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
}

- (id)getProperty:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [v5 selector];
  if (v6 <= 1819107690)
  {
    if (v6 <= 1684434035)
    {
      if (v6 <= 1668050794)
      {
        if (v6 == 1634429294) {
          goto LABEL_52;
        }
        if (v6 != 1667523955)
        {
          if (v6 == 1668049764)
          {
            id v7 = objc_alloc(NSNumber);
            uint64_t v8 = [(ASDAudioDevice *)self clockDomain];
            goto LABEL_110;
          }
          goto LABEL_90;
        }
        uint64_t v11 = [(ASDAudioDevice *)self clientDescription];
        goto LABEL_111;
      }
      if (v6 > 1684236337)
      {
        if (v6 == 1684236338) {
          goto LABEL_52;
        }
        if (v6 != 1684301171) {
          goto LABEL_90;
        }
        uint64_t v11 = [(ASDAudioDevice *)self deviceDescription];
        goto LABEL_111;
      }
      if (v6 == 1668050795)
      {
        id v7 = objc_alloc(NSNumber);
        uint64_t v8 = [(ASDAudioDevice *)self clockAlgorithm];
        goto LABEL_110;
      }
      if (v6 != 1668510818) {
        goto LABEL_90;
      }
      id v9 = objc_alloc(NSNumber);
      BOOL v10 = [(ASDAudioDevice *)self clockIsStable];
LABEL_86:
      BOOL v23 = v10;
      id v24 = v9;
LABEL_87:
      uint64_t v11 = [v24 initWithBool:v23];
      goto LABEL_111;
    }
    if (v6 > 1818452845)
    {
      if (v6 > 1818455661)
      {
        if (v6 == 1818455662) {
          goto LABEL_52;
        }
        int v12 = 1818850926;
      }
      else
      {
        if (v6 == 1818452846) {
          goto LABEL_52;
        }
        int v12 = 1818454126;
      }
      goto LABEL_51;
    }
    if (v6 != 1684434036)
    {
      if (v6 == 1735354734)
      {
        id v9 = objc_alloc(NSNumber);
        BOOL v10 = [(ASDAudioDevice *)self isRunning];
      }
      else
      {
        if (v6 != 1751737454) {
          goto LABEL_90;
        }
        id v9 = objc_alloc(NSNumber);
        BOOL v10 = [(ASDAudioDevice *)self isHidden];
      }
      goto LABEL_86;
    }
    int v21 = [v5 scope];
    switch(v21)
    {
      case 1869968496:
        BOOL v22 = [(ASDAudioDevice *)self canBeDefaultOutputDevice];
        break;
      case 1768845428:
        BOOL v22 = [(ASDAudioDevice *)self canBeDefaultInputDevice];
        break;
      case 1735159650:
        BOOL v22 = [(ASDAudioDevice *)self canBeDefaultDevice];
        break;
      default:
        BOOL v36 = 0;
        goto LABEL_119;
    }
    BOOL v36 = v22;
LABEL_119:
    id v24 = objc_alloc(NSNumber);
    BOOL v23 = v36;
    goto LABEL_87;
  }
  if (v6 <= 1919512166)
  {
    if (v6 > 1836411235)
    {
      if (v6 <= 1853059699)
      {
        if (v6 == 1836411236)
        {
          uint64_t v11 = [(ASDAudioDevice *)self modelUID];
        }
        else
        {
          if (v6 != 1853059619) {
            goto LABEL_90;
          }
          uint64_t v11 = [(ASDAudioDevice *)self samplingRates];
        }
        goto LABEL_111;
      }
      if (v6 == 1853059700)
      {
        id v25 = objc_alloc(NSNumber);
        [(ASDAudioDevice *)self samplingRate];
        uint64_t v11 = objc_msgSend(v25, "initWithDouble:");
        goto LABEL_111;
      }
      int v12 = 1870098020;
LABEL_51:
      if (v6 != v12) {
        goto LABEL_90;
      }
LABEL_52:
      id v13 = NSString;
      if ((int)[v5 selector] < 0x20000000 || (int)objc_msgSend(v5, "selector") > 2130706431) {
        uint64_t v14 = 32;
      }
      else {
        uint64_t v14 = ((int)[v5 selector] >> 24);
      }
      if ((int)([v5 selector] << 8) < 0x20000000
        || (int)([v5 selector] << 8) > 2130706431)
      {
        uint64_t v15 = 32;
      }
      else
      {
        uint64_t v15 = ((int)([v5 selector] << 8) >> 24);
      }
      if ((int)([v5 selector] << 16) < 0x20000000
        || (int)([v5 selector] << 16) > 2130706431)
      {
        uint64_t v16 = 32;
      }
      else
      {
        uint64_t v16 = ((__int16)[v5 selector] >> 8);
      }
      if ((int)([v5 selector] << 24) < 520093697
        || [v5 selector] == 127)
      {
        uint64_t v17 = 32;
      }
      else
      {
        uint64_t v17 = (char)[v5 selector];
      }
      SEL v18 = objc_msgSend(v13, "stringWithFormat:", @"Property %c%c%c%c not supported yet", v14, v15, v16, v17);
      uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"ASDAudioDevice+ASDProperties.m" lineNumber:167 description:v18];

      goto LABEL_69;
    }
    if (v6 == 1819107691)
    {
      uint64_t v11 = [(ASDAudioDevice *)self manufacturerName];
      goto LABEL_111;
    }
    if (v6 == 1819173229)
    {
      uint64_t v11 = [(ASDAudioDevice *)self deviceName];
      goto LABEL_111;
    }
    if (v6 != 1819569763) {
      goto LABEL_90;
    }
    if ([v5 scope] == 1768845428)
    {
      id v7 = objc_alloc(NSNumber);
      goto LABEL_37;
    }
    if ([v5 scope] == 1869968496)
    {
      id v7 = objc_alloc(NSNumber);
    }
    else
    {
      if ([v5 scope] != 1735159650) {
        goto LABEL_69;
      }
      id v7 = objc_alloc(NSNumber);
      unsigned int v38 = [(ASDAudioDevice *)self inputLatency];
      if (v38 > [(ASDAudioDevice *)self outputLatency])
      {
LABEL_37:
        uint64_t v8 = [(ASDAudioDevice *)self inputLatency];
        goto LABEL_110;
      }
    }
    uint64_t v8 = [(ASDAudioDevice *)self outputLatency];
    goto LABEL_110;
  }
  if (v6 <= 1937007733)
  {
    if (v6 <= 1936092275)
    {
      if (v6 == 1919512167)
      {
        id v7 = objc_alloc(NSNumber);
        uint64_t v8 = [(ASDAudioDevice *)self timestampPeriod];
        goto LABEL_110;
      }
      if (v6 == 1935763060)
      {
        if ([v5 scope] == 1768845428)
        {
          id v7 = objc_alloc(NSNumber);
LABEL_9:
          uint64_t v8 = [(ASDAudioDevice *)self inputSafetyOffset];
LABEL_110:
          uint64_t v11 = [v7 initWithUnsignedInt:v8];
          goto LABEL_111;
        }
        if ([v5 scope] == 1869968496)
        {
          id v7 = objc_alloc(NSNumber);
          goto LABEL_106;
        }
        if ([v5 scope] == 1735159650)
        {
          id v7 = objc_alloc(NSNumber);
          unsigned int v37 = [(ASDAudioDevice *)self inputSafetyOffset];
          if (v37 > [(ASDAudioDevice *)self outputSafetyOffset]) {
            goto LABEL_9;
          }
LABEL_106:
          uint64_t v8 = [(ASDAudioDevice *)self outputSafetyOffset];
          goto LABEL_110;
        }
LABEL_69:
        unsigned int v20 = 0;
        goto LABEL_112;
      }
LABEL_90:
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v26 = [(ASDObject *)self customProperties];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v43;
LABEL_92:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v42 + 1) + 8 * v30);
          uint64_t v32 = [v31 address];
          char v33 = [v32 isEqual:v5];

          if (v33) {
            break;
          }
          if (v28 == ++v30)
          {
            uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
            if (v28) {
              goto LABEL_92;
            }
            goto LABEL_98;
          }
        }
        unsigned int v20 = [v31 value];

        if (v20) {
          goto LABEL_112;
        }
      }
      else
      {
LABEL_98:
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        if ((int)[v5 selector] < 0x20000000 || (int)objc_msgSend(v5, "selector") > 2130706431) {
          int v34 = 32;
        }
        else {
          int v34 = (int)[v5 selector] >> 24;
        }
        if ((int)([v5 selector] << 8) < 0x20000000
          || (int)([v5 selector] << 8) > 2130706431)
        {
          int v39 = 32;
        }
        else
        {
          int v39 = (int)([v5 selector] << 8) >> 24;
        }
        if ((int)([v5 selector] << 16) < 0x20000000
          || (int)([v5 selector] << 16) > 2130706431)
        {
          int v40 = 32;
        }
        else
        {
          int v40 = (__int16)[v5 selector] >> 8;
        }
        if ((int)([v5 selector] << 24) < 520093697
          || [v5 selector] == 127)
        {
          int v41 = 32;
        }
        else
        {
          int v41 = (char)[v5 selector];
        }
        *(_DWORD *)buf = 67109888;
        int v47 = v34;
        __int16 v48 = 1024;
        int v49 = v39;
        __int16 v50 = 1024;
        int v51 = v40;
        __int16 v52 = 1024;
        int v53 = v41;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Property %c%c%c%c not found", buf, 0x1Au);
      }
      goto LABEL_69;
    }
    if (v6 != 1936092276)
    {
      int v12 = 1936879204;
      goto LABEL_51;
    }
    id v9 = objc_alloc(NSNumber);
    BOOL v10 = [(ASDAudioDevice *)self canBeDefaultSystemDevice];
    goto LABEL_86;
  }
  if (v6 > 1953653101)
  {
    if (v6 == 1953653102)
    {
      id v7 = objc_alloc(NSNumber);
      uint64_t v8 = [(ASDAudioDevice *)self transportType];
      goto LABEL_110;
    }
    if (v6 != 1969841184) {
      goto LABEL_90;
    }
    uint64_t v11 = [(ASDAudioDevice *)self deviceUID];
  }
  else
  {
    if (v6 != 1937007734)
    {
      int v12 = 1937009955;
      goto LABEL_51;
    }
    uint64_t v11 = [(ASDObject *)self owner];
  }
LABEL_111:
  unsigned int v20 = (void *)v11;
LABEL_112:

  return v20;
}

- (void)addInputStream:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Stream %s: starting channel should not be zero!", (uint8_t *)&v1, 0xCu);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_1(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_1_2(a1, a2, a3, 4.8149e-34);
  OUTLINED_FUNCTION_0_2(&dword_225CD5000, &_os_log_internal, v3, "Stream %s indexing past the numberOfChannels", v4);
}

void __73__ASDAudioDevice_preferredChannelDescriptions_numberOfChannels_forScope___block_invoke_cold_2(float *a1, uint64_t a2, void *a3)
{
  OUTLINED_FUNCTION_1_2(a1, a2, a3, 4.8149e-34);
  OUTLINED_FUNCTION_0_2(&dword_225CD5000, &_os_log_internal, v3, "Stream %s starting channel number should not be zero!", v4);
}

@end