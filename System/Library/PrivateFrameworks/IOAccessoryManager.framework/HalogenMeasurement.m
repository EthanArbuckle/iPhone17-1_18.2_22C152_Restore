@interface HalogenMeasurement
- (BOOL)_allocBuffers;
- (BOOL)_connectToAccessoryManager:(int)a3;
- (BOOL)_createSleepWakeNotifier;
- (BOOL)_doHalogenLdcmCalc:(BOOL)a3 isReceptacleWet:(BOOL)a4 withWetTransitionThreshold:(double)a5 withDryTransitionThreshold:(double)a6;
- (BOOL)_initArbiter;
- (BOOL)_initAudioPath;
- (BOOL)arbiterLocked;
- (BOOL)arbitrationRequired;
- (BOOL)isBoundViolation_currentGainCorrection;
- (BOOL)isBoundViolation_currentPhaseCompensation;
- (BOOL)isBoundViolation_measurementCondetSNR;
- (BOOL)isBoundViolation_voltageGainCorrection;
- (BOOL)isCalibrationDone;
- (BOOL)isLowerBoundViolation_goertzelImpedance;
- (BOOL)isLowerBoundViolation_goertzelPhase;
- (BOOL)isMeasurementDone;
- (BOOL)isUpperBoundViolation_goertzelImpedance;
- (BOOL)isUpperBoundViolation_goertzelPhase;
- (BOOL)shouldInvertData;
- (BaseResourceArbiterClient)arbiterClient;
- (HalogenLdcmCalc)halogenLdcmCalc;
- (HalogenMeasurement)initWithSize:(int)a3 onPort:(int)a4;
- (IONotificationPort)systemPowerNotifyPortRef;
- (NSCondition)audioTimeoutCond;
- (NSCondition)powerStateCond;
- (NSMutableData)currentData;
- (NSMutableData)pcmInputData;
- (NSMutableData)pcmOutputData;
- (NSMutableData)voltageData;
- (OS_dispatch_queue)systemPowerQueue;
- (OpaqueAudioComponentInstance)audioComponentInst;
- (double)calCurrentNoiseLevel;
- (double)calCurrentSNR;
- (double)calCurrentSignalLevel;
- (double)calVoltageNoiseLevel;
- (double)calVoltageSNR;
- (double)calVoltageSignalLevel;
- (double)capacitanceInNanoF;
- (double)clippingScore;
- (double)compensatedImpedance;
- (double)compensatedPhase;
- (double)currentGainCorrection;
- (double)currentPhaseCompensation;
- (double)goertzelImpedance;
- (double)goertzelPhase;
- (double)measurementCondetSNR;
- (double)measurementCurrentNoiseLevel;
- (double)measurementCurrentSNR;
- (double)measurementCurrentSignalLevel;
- (double)measurementVoltageNoiseLevel;
- (double)measurementVoltageSNR;
- (double)measurementVoltageSignalLevel;
- (double)precalCurrentNoiseLevel;
- (double)precalCurrentSNR;
- (double)precalCurrentSignalLevel;
- (double)precalVoltageNoiseLevel;
- (double)precalVoltageSNR;
- (double)precalVoltageSignalLevel;
- (double)resistanceInOhms;
- (double)signalFreq;
- (double)voltageGainCorrection;
- (id)getResultString;
- (int)audioTimeoutInSec;
- (int)bitDepth;
- (int)calibrationSampleOffsetInFrames;
- (int)doMeasurement:(BOOL)a3 onPin:(int)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8;
- (int)halogenResult;
- (int)hydraSettlingTimeInMs;
- (int)initalPhaseInDegrees;
- (int)inputFrameSizeInBytes;
- (int)measurementSampleOffsetInFrames;
- (int)nHydraSettlingSamples;
- (int)nInputChannels;
- (int)nMeasurementSamples;
- (int)nOutputChannels;
- (int)nPaddingSamples;
- (int)nTotalSamples;
- (int)nWarmupSamples;
- (int)outputFrameSizeInBytes;
- (int)pcmInputDataIndexInBytes;
- (int)pcmInputDataMaxSzInBytes;
- (int)pcmInputDataSampleCnt;
- (int)pcmOutputDataIndexInBytes;
- (int)pcmOutputDataMaxSzInBytes;
- (int)pinToMeasure;
- (int)powerState;
- (int)precalibrationSampleOffsetInFrames;
- (int)sampleRate;
- (int)saveAsWav:(id)a3;
- (int)warmupTimeInMs;
- (unint64_t)eisPinToken1;
- (unint64_t)eisPinToken2;
- (unsigned)connect;
- (unsigned)maxOutputAmplitude;
- (unsigned)service;
- (unsigned)signalOffset;
- (unsigned)systemPowerIterator;
- (unsigned)systemPowerPort;
- (void)_deinitArbiter;
- (void)_deinitAudioPath;
- (void)_destroySleepWakeNotifier;
- (void)_disconnectFromAccessoryManager;
- (void)_freeBuffers;
- (void)_generateSineWave;
- (void)_resetCalcValues;
- (void)dealloc;
- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3;
- (void)setAudioTimeoutCond:(id)a3;
- (void)setAudioTimeoutInSec:(int)a3;
- (void)setBitDepth:(int)a3;
- (void)setConnect:(unsigned int)a3;
- (void)setCurrentData:(id)a3;
- (void)setEisPinToken1:(unint64_t)a3;
- (void)setEisPinToken2:(unint64_t)a3;
- (void)setHalogenLdcmCalc:(id)a3;
- (void)setHydraSettlingTimeInMs:(int)a3;
- (void)setInitalPhaseInDegrees:(int)a3;
- (void)setInputFrameSizeInBytes:(int)a3;
- (void)setIsCalibrationDone:(BOOL)a3;
- (void)setIsMeasurementDone:(BOOL)a3;
- (void)setMeasurementSampleOffsetInFrames:(int)a3;
- (void)setNHydraSettlingSamples:(int)a3;
- (void)setNInputChannels:(int)a3;
- (void)setNMeasurementSamples:(int)a3;
- (void)setNOutputChannels:(int)a3;
- (void)setNPaddingSamples:(int)a3;
- (void)setNTotalSamples:(int)a3;
- (void)setNWarmupSamples:(int)a3;
- (void)setOutputFrameSizeInBytes:(int)a3;
- (void)setPcmInputData:(id)a3;
- (void)setPcmInputDataIndexInBytes:(int)a3;
- (void)setPcmInputDataMaxSzInBytes:(int)a3;
- (void)setPcmInputDataSampleCnt:(int)a3;
- (void)setPcmOutputData:(id)a3;
- (void)setPcmOutputDataIndexInBytes:(int)a3;
- (void)setPcmOutputDataMaxSzInBytes:(int)a3;
- (void)setPinToMeasure:(int)a3;
- (void)setPowerState:(int)a3;
- (void)setPowerStateCond:(id)a3;
- (void)setSampleRate:(int)a3;
- (void)setService:(unsigned int)a3;
- (void)setSignalFreq:(double)a3;
- (void)setSystemPowerIterator:(unsigned int)a3;
- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3;
- (void)setSystemPowerPort:(unsigned int)a3;
- (void)setSystemPowerQueue:(id)a3;
- (void)setVoltageData:(id)a3;
- (void)setWarmupTimeInMs:(int)a3;
@end

@implementation HalogenMeasurement

- (HalogenMeasurement)initWithSize:(int)a3 onPort:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HalogenMeasurement;
  v6 = [(HalogenMeasurement *)&v12 init];
  v7 = (HalogenMeasurement *)v6;
  if (!v6) {
    return v7;
  }
  *(_OWORD *)(v6 + 36) = xmmword_1D964D540;
  *(_OWORD *)(v6 + 52) = xmmword_1D964D550;
  *((_DWORD *)v6 + 17) = v5;
  *((void *)v6 + 9) = 0x780000012C0;
  *((_DWORD *)v6 + 20) = 2 * v5 + 10816;
  *((_DWORD *)v6 + 21) = 4096;
  *(void *)(v6 + 20) = 0x12C000000EC0;
  *((void *)v6 + 54) = objc_alloc_init(MEMORY[0x1E4F28BB0]);
  v7->_audioTimeoutInSec = 1;
  v7->_signalFreq = 110.0;
  v7->_initalPhaseInDegrees = 0;
  v7->_halogenLdcmCalc = [[HalogenLdcmCalc alloc] initWithSize:v5];
  if (![(HalogenMeasurement *)v7 _allocBuffers])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = MEMORY[0x1E4F14500];
      v10 = "HalogenMeasurement:_allocBuffers() failed";
      uint32_t v11 = 2;
LABEL_15:
      _os_log_impl(&dword_1D9622000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  [(HalogenMeasurement *)v7 _generateSineWave];
  if (![(HalogenMeasurement *)v7 _connectToAccessoryManager:v4])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v4;
      v9 = MEMORY[0x1E4F14500];
      v10 = "HalogenMeasurement:_connectToAccessoryManager() failed for port %d";
LABEL_14:
      uint32_t v11 = 8;
      goto LABEL_15;
    }
LABEL_16:

    return 0;
  }
  if (![(HalogenMeasurement *)v7 _createSleepWakeNotifier])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v4;
      v9 = MEMORY[0x1E4F14500];
      v10 = "HalogenMeasurement:_createSleepWakeNotifier() failed for port %d";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  [(HalogenMeasurement *)v7 _initArbiter];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:HalogenMeasurement Started!", buf, 2u);
  }
  return v7;
}

- (void)dealloc
{
  [(HalogenMeasurement *)self _destroySleepWakeNotifier];
  [(HalogenMeasurement *)self _disconnectFromAccessoryManager];
  [(HalogenMeasurement *)self _deinitArbiter];
  [(HalogenMeasurement *)self _freeBuffers];

  v3.receiver = self;
  v3.super_class = (Class)HalogenMeasurement;
  [(HalogenMeasurement *)&v3 dealloc];
}

- (BOOL)_connectToAccessoryManager:(int)a3
{
  kern_return_t v6;
  BOOL result;
  BOOL v8;
  NSObject *v9;
  const char *v10;
  kern_return_t v11;
  BOOL v12;
  int v13;
  int v14;
  uint64_t v15;

  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  self->_service = ServiceWithPrimaryPort;
  if (ServiceWithPrimaryPort)
  {
    v6 = IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x1E4F14960], 0, &self->_connect);
    if (!v6) {
      return 1;
    }
    uint32_t v11 = v6;
    objc_super v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v12)
    {
      v13 = 67109120;
      int v14 = v11;
      v9 = MEMORY[0x1E4F14500];
      v10 = "HalogenMeasurement:Failed to open IOAccessoryManager manager (ret = 0x%x)";
      goto LABEL_9;
    }
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v8)
    {
      v13 = 67109120;
      int v14 = a3;
      v9 = MEMORY[0x1E4F14500];
      v10 = "HalogenMeasurement:Could not find IOAccessoryManager service for port=%d";
LABEL_9:
      _os_log_impl(&dword_1D9622000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 8u);
      return 0;
    }
  }
  return result;
}

- (void)_disconnectFromAccessoryManager
{
  io_connect_t connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_io_connect_t connect = 0;
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
}

- (BOOL)_initArbiter
{
  self->_arbiterLocked = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(self->_service, @"SupportsEisAfe", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFBooleanRef v5 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(self->_service, @"RequiresEisAfeArbiter", v3, 0);
  CFBooleanRef v6 = v5;
  self->_arbitrationRequired = 1;
  if (!v5)
  {
    if (!CFProperty) {
      goto LABEL_9;
    }
    if (CFBooleanGetValue(CFProperty))
    {
      self->_arbitrationRequired = 0;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Skipping arbitration.", buf, 2u);
    }
    if (self->_arbitrationRequired) {
      goto LABEL_9;
    }
LABEL_10:
    v8 = (BaseResourceArbiterClient *)objc_alloc_init(MEMORY[0x1E4FB9E68]);
    goto LABEL_11;
  }
  BOOL v7 = CFBooleanGetValue(v5) != 0;
  self->_arbitrationRequired = v7;
  if (!v7) {
    goto LABEL_10;
  }
LABEL_9:
  v8 = (BaseResourceArbiterClient *)[objc_alloc(MEMORY[0x1E4FB9E70]) initWithID:0];
LABEL_11:
  v9 = v8;
  self->_arbiterClient = v8;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v11 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:failed to allocate halogen ResourceArbiterClient", v11, 2u);
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (v6) {
    CFRelease(v6);
  }
  return v9 != 0;
}

- (void)_deinitArbiter
{
  if (self->_arbiterLocked) {
    [(BaseResourceArbiterClient *)self->_arbiterClient releaseResourceAccess];
  }
  arbiterClient = self->_arbiterClient;
}

- (BOOL)_allocBuffers
{
  int v3 = self->_inputFrameSizeInBytes * self->_nTotalSamples;
  *(void *)&self->_pcmInputDataIndexInBytes = 0;
  self->_pcmInputDataMaxSzInBytes = v3;
  uint64_t v4 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_pcmInputData = v4;
  if (!v4)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    __int16 v19 = 0;
    v10 = MEMORY[0x1E4F14500];
    uint32_t v11 = "HalogenMeasurement:Failed to alloc _pcmInputData";
    objc_super v12 = (uint8_t *)&v19;
    goto LABEL_15;
  }
  *(void *)&self->_pcmOutputDataMaxSzInBytes = (self->_outputFrameSizeInBytes * self->_nTotalSamples);
  CFBooleanRef v5 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_pcmOutputData = v5;
  if (!v5)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    __int16 v18 = 0;
    v10 = MEMORY[0x1E4F14500];
    uint32_t v11 = "HalogenMeasurement:Failed to alloc _pcmOutputData";
    objc_super v12 = (uint8_t *)&v18;
    goto LABEL_15;
  }
  CFBooleanRef v6 = (NSMutableData *)(id)[MEMORY[0x1E4F1CA58] dataWithLength:8 * self->_nMeasurementSamples];
  self->_currentData = v6;
  if (!v6)
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v14) {
      return result;
    }
    __int16 v17 = 0;
    v10 = MEMORY[0x1E4F14500];
    uint32_t v11 = "HalogenMeasurement:Failed to alloc _currentData";
    objc_super v12 = (uint8_t *)&v17;
LABEL_15:
    _os_log_impl(&dword_1D9622000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    return 0;
  }
  BOOL v7 = (NSMutableData *)(id)[MEMORY[0x1E4F1CA58] dataWithLength:8 * self->_nMeasurementSamples];
  self->_voltageData = v7;
  if (v7) {
    return 1;
  }
  BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v15)
  {
    __int16 v16 = 0;
    v10 = MEMORY[0x1E4F14500];
    uint32_t v11 = "HalogenMeasurement:Failed to alloc _voltageData";
    objc_super v12 = (uint8_t *)&v16;
    goto LABEL_15;
  }
  return result;
}

- (void)_freeBuffers
{
  voltageData = self->_voltageData;
}

- (void)_generateSineWave
{
  uint64_t v3 = [(NSMutableData *)self->_pcmOutputData bytes];
  if (self->_nTotalSamples >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    double v6 = self->_signalFreq * 6.28318531 / (double)self->_sampleRate;
    double v7 = ((double)self->_initalPhaseInDegrees / 360.0 + (double)self->_initalPhaseInDegrees / 360.0) * 3.14159265;
    do
    {
      double v8 = sin(v7);
      double v9 = (double)[(HalogenMeasurement *)self maxOutputAmplitude];
      *(_WORD *)(v4 + 2 * v5) = (int)-((double)[(HalogenMeasurement *)self signalOffset] - v8 * v9);
      double v7 = v6 + v7;
      ++v5;
    }
    while (v5 < self->_nTotalSamples);
  }
}

- (BOOL)_initAudioPath
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v57 = (void *)0xAAAAAAAAAAAAAAAALL;
  v58 = (HalogenMeasurement *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v56 = 0;
  unsigned int bitDepth = self->_bitDepth;
  double sampleRate = (double)self->_sampleRate;
  int nOutputChannels = self->_nOutputChannels;
  int inputFrameSizeInBytes = self->_inputFrameSizeInBytes;
  int outputFrameSizeInBytes = self->_outputFrameSizeInBytes;
  int nInputChannels = self->_nInputChannels;
  LODWORD(v56) = bitDepth;
  int v49 = nOutputChannels;
  uint64_t v50 = bitDepth;
  int v52 = inputFrameSizeInBytes;
  int v53 = 1;
  int v54 = inputFrameSizeInBytes;
  *(double *)v51 = sampleRate;
  v51[1] = 0xC6C70636DLL;
  int v47 = 1;
  int v48 = outputFrameSizeInBytes;
  int v46 = outputFrameSizeInBytes;
  *(double *)v45 = sampleRate;
  v45[1] = 0xC6C70636DLL;
  *(_OWORD *)&inDesc.componentType = xmmword_1D964CE50;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
  {
    BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v24)
    {
      *(_WORD *)buf = 0;
      v22 = MEMORY[0x1E4F14500];
      v23 = "HalogenMeasurement:AudioComponentFindNext() failed to find kAudioUnitSubType_LDCMIO";
      uint32_t v25 = 2;
LABEL_35:
      _os_log_impl(&dword_1D9622000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      return 0;
    }
    return result;
  }
  p_audioComponentInst = &self->_audioComponentInst;
  OSStatus v10 = AudioComponentInstanceNew(Next, &self->_audioComponentInst);
  if (v10 || (uint32_t v11 = *p_audioComponentInst) == 0)
  {
    BOOL v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v21) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v10;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioComponentInstanceNew() failed (status = 0x%x) ";
    goto LABEL_34;
  }
  int inData = 1;
  OSStatus v12 = AudioUnitSetProperty(v11, 0x7D3u, 1u, 1u, &inData, 4u);
  if (v12)
  {
    OSStatus v26 = v12;
    BOOL v27 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v27) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v26;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/1 (status = 0x%x)";
    goto LABEL_34;
  }
  OSStatus v13 = AudioUnitSetProperty(*p_audioComponentInst, 0x7D3u, 2u, 0, &inData, 4u);
  if (v13)
  {
    OSStatus v28 = v13;
    BOOL v29 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v29) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v28;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/0 (status = 0x%x)";
    goto LABEL_34;
  }
  OSStatus v14 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 1u, 0, v45, 0x28u);
  if (v14)
  {
    OSStatus v30 = v14;
    BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v31) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v30;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Input (status = 0x%x)";
    goto LABEL_34;
  }
  int v42 = 0;
  OSStatus v15 = AudioUnitSetProperty(*p_audioComponentInst, 0x33u, 2u, 1u, &v42, 4u);
  if (v15)
  {
    OSStatus v32 = v15;
    BOOL v33 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v33) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v32;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioUnitProperty_ShouldAllocateBuffer (status = 0x%x)";
    goto LABEL_34;
  }
  OSStatus v16 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 2u, 1u, v51, 0x28u);
  if (v16)
  {
    OSStatus v34 = v16;
    BOOL v35 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v35) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v34;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Output"
          " (status = 0x%x)";
    goto LABEL_34;
  }
  v57 = recordCallback_0;
  v58 = self;
  OSStatus v17 = AudioUnitSetProperty(self->_audioComponentInst, 0x7D5u, 0, 1u, &v57, 0x10u);
  if (v17)
  {
    OSStatus v36 = v17;
    BOOL v37 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v37) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v36;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetInputCallback (status = 0x%x)";
    goto LABEL_34;
  }
  v57 = playbackCallback_0;
  v58 = self;
  OSStatus v18 = AudioUnitSetProperty(self->_audioComponentInst, 0x17u, 0, 0, &v57, 0x10u);
  if (v18)
  {
    OSStatus v38 = v18;
    BOOL v39 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v39) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v38;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetRenderCallback (status = 0x%x)";
LABEL_34:
    uint32_t v25 = 8;
    goto LABEL_35;
  }
  OSStatus v19 = AudioUnitInitialize(*p_audioComponentInst);
  if (!v19) {
    return 1;
  }
  OSStatus v40 = v19;
  BOOL v41 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v41)
  {
    *(_DWORD *)buf = 67109120;
    OSStatus v60 = v40;
    v22 = MEMORY[0x1E4F14500];
    v23 = "HalogenMeasurement:AudioUnitInitialize() failed (status = 0x%x)";
    goto LABEL_34;
  }
  return result;
}

- (void)_deinitAudioPath
{
  audioComponentInst = self->_audioComponentInst;
  if (audioComponentInst)
  {
    AudioUnitUninitialize(audioComponentInst);
    AudioComponentInstanceDispose(self->_audioComponentInst);
    self->_audioComponentInst = 0;
  }
}

- (BOOL)_createSleepWakeNotifier
{
  [(HalogenMeasurement *)self setPowerState:2];
  [(HalogenMeasurement *)self setSystemPowerPort:0];
  [(HalogenMeasurement *)self setSystemPowerIterator:0];
  [(HalogenMeasurement *)self setSystemPowerNotifyPortRef:0];
  [(HalogenMeasurement *)self setSystemPowerQueue:dispatch_queue_create("com.apple.ioaccessorymanager.halogenMeasurement.systemPower.queue", 0)];
  if (![(HalogenMeasurement *)self systemPowerQueue])
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v4) {
      return result;
    }
    __int16 v12 = 0;
    uint64_t v5 = MEMORY[0x1E4F14500];
    double v6 = "HalogenMeasurement:dispatch_queue_create() failed";
    double v7 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  [(HalogenMeasurement *)self setSystemPowerPort:IORegisterForSystemPower(self, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)systemPowerCallback_0, &self->_systemPowerIterator)];
  if (![(HalogenMeasurement *)self systemPowerPort])
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    __int16 v11 = 0;
    uint64_t v5 = MEMORY[0x1E4F14500];
    double v6 = "HalogenMeasurement:IORegisterForSystemPower() failed";
    double v7 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    return 0;
  }
  [(HalogenMeasurement *)self setPowerStateCond:objc_alloc_init(MEMORY[0x1E4F28BB0])];
  if ([(HalogenMeasurement *)self powerStateCond])
  {
    IONotificationPortSetDispatchQueue([(HalogenMeasurement *)self systemPowerNotifyPortRef], (dispatch_queue_t)[(HalogenMeasurement *)self systemPowerQueue]);
    return 1;
  }
  BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v9)
  {
    __int16 v10 = 0;
    uint64_t v5 = MEMORY[0x1E4F14500];
    double v6 = "HalogenMeasurement:Failed to create NSCondition: powerStateCond";
    double v7 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  return result;
}

- (void)_destroySleepWakeNotifier
{
  if ([(HalogenMeasurement *)self systemPowerIterator]) {
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  }
  if ([(HalogenMeasurement *)self systemPowerNotifyPortRef]) {
    IONotificationPortDestroy([(HalogenMeasurement *)self systemPowerNotifyPortRef]);
  }
  if ([(HalogenMeasurement *)self systemPowerPort]) {
    IOServiceClose([(HalogenMeasurement *)self systemPowerPort]);
  }
  if ([(HalogenMeasurement *)self systemPowerQueue]) {
    dispatch_release((dispatch_object_t)[(HalogenMeasurement *)self systemPowerQueue]);
  }
  uint64_t v3 = [(HalogenMeasurement *)self powerStateCond];
}

- (int)doMeasurement:(BOOL)a3 onPin:(int)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  *(void *)&self->_pcmInputDataIndexInBytes = 0;
  self->_pcmOutputDataIndexInBytes = 0;
  *(_WORD *)&self->_isCalibrationDone = 0;
  self->_pinToMeasure = a4;
  char v13 = [(BaseResourceArbiterClient *)self->_arbiterClient synchRequestResourceAccess];
  self->_arbiterLocked = v13;
  if ((v13 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 6;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Arbiter failed to grant access to Halogen", buf, 2u);
    int v23 = 0;
    int v25 = 0;
    int v24 = 6;
    goto LABEL_29;
  }
  int v14 = IOAccessoryManagerSelectEisPin();
  if (v14)
  {
    int v27 = v14;
    if (v14 != -536870187)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v35 = v27;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin() failed (ret = 0x%x)", buf, 8u);
      }
      int v23 = 0;
      int v25 = 0;
      goto LABEL_68;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v35 = -536870187;
      int v24 = 8;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin() device busy (ret = 0x%x)", buf, 8u);
      int v23 = 0;
      int v25 = 0;
    }
    else
    {
      int v23 = 0;
      int v25 = 0;
      int v24 = 8;
    }
    goto LABEL_29;
  }
  self->_unint64_t eisPinToken2 = self->_eisPinToken1;
  if (![(HalogenMeasurement *)self powerState])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      OSStatus v28 = MEMORY[0x1E4F14500];
      BOOL v29 = "HalogenMeasurement:abort measurement... system going to sleep";
LABEL_49:
      _os_log_impl(&dword_1D9622000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    }
LABEL_50:
    int v25 = 0;
    int v23 = 1;
    int v24 = 4;
    goto LABEL_29;
  }
  if ([(HalogenMeasurement *)self powerState] == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Waiting for kHalogenPowerStateAwake", buf, 2u);
    }
    [(NSCondition *)[(HalogenMeasurement *)self powerStateCond] lock];
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
    if ([(HalogenMeasurement *)self powerState] == 1)
    {
      do
        BOOL v16 = [(NSCondition *)self->_powerStateCond waitUntilDate:v15];
      while ([(HalogenMeasurement *)self powerState] == 1 && v16);
    }
    [(NSCondition *)[(HalogenMeasurement *)self powerStateCond] unlock];
  }
  if ([(HalogenMeasurement *)self powerState] != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      OSStatus v28 = MEMORY[0x1E4F14500];
      BOOL v29 = "HalogenMeasurement:abort measurement... system is not yet awake";
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if ([(HalogenMeasurement *)self _initAudioPath])
  {
    OSStatus v17 = AudioOutputUnitStart(self->_audioComponentInst);
    if (v17)
    {
      OSStatus v30 = v17;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v35 = v30;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:AudioUnitStart() failed (status = 0x%x)", buf, 8u);
      }
      int v23 = 1;
      int v24 = 3;
      goto LABEL_28;
    }
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)self->_audioTimeoutInSec];
    [(NSCondition *)self->_audioTimeoutCond lock];
    if (self->_isMeasurementDone)
    {
      int v19 = 0;
    }
    else
    {
      do
        BOOL v20 = [(NSCondition *)self->_audioTimeoutCond waitUntilDate:v18];
      while (!self->_isMeasurementDone && v20);
      int v19 = !v20;
    }
    [(NSCondition *)self->_audioTimeoutCond unlock];
    AudioOutputUnitStop(self->_audioComponentInst);
    [(BaseResourceArbiterClient *)self->_arbiterClient releaseResourceAccess];
    self->_arbiterLocked = 0;
    int v21 = IOAccessoryManagerSelectEisPin();
    if (v21)
    {
      int v31 = v21;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v35 = v31;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin() failed (ret = 0x%x)", buf, 8u);
      }
      int v23 = 1;
      int v24 = 2;
      goto LABEL_28;
    }
    unint64_t eisPinToken2 = self->_eisPinToken2;
    if (eisPinToken2 == 0xAAAAAAAAAAAAAAAALL)
    {
      if (self->_pinToMeasure == 6 || eisPinToken2 == LODWORD(self->_eisPinToken1) + 1)
      {
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Timeout!", buf, 2u);
          }
          int v23 = 0;
          int v24 = 1;
        }
        else
        {
          [(HalogenMeasurement *)self _doHalogenLdcmCalc:v9 isReceptacleWet:v8 withWetTransitionThreshold:a7 withDryTransitionThreshold:a8];
          int v24 = 0;
          int v23 = 0;
        }
LABEL_28:
        int v25 = 1;
        goto LABEL_29;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      *(_DWORD *)buf = 67109120;
      int v35 = v19;
      OSStatus v32 = MEMORY[0x1E4F14500];
      BOOL v33 = "HalogenMeasurement:_eisPinToken2 != _eisPinToken1+1 due to change on lightning port. isTimeout=%d";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
LABEL_67:
        int v23 = 0;
        int v25 = 1;
LABEL_68:
        int v24 = 2;
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      int v35 = v19;
      OSStatus v32 = MEMORY[0x1E4F14500];
      BOOL v33 = "HalogenMeasurement:_eisPinToken2 != eisPinTokenFinal due to change on lightning port. isTimeout=%d";
    }
    _os_log_impl(&dword_1D9622000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 8u);
    goto LABEL_67;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:AudioUnit is not initialized", buf, 2u);
  }
  int v25 = 0;
  int v23 = 1;
  int v24 = 3;
LABEL_29:
  if (self->_arbiterLocked)
  {
    self->_arbiterLocked = 0;
    [(BaseResourceArbiterClient *)self->_arbiterClient releaseResourceAccess];
    if (v23) {
      goto LABEL_31;
    }
  }
  else if (v23)
  {
LABEL_31:
    IOAccessoryManagerSelectEisPin();
    if ((v25 & 1) == 0) {
      return v24;
    }
    goto LABEL_35;
  }
  if (v25) {
LABEL_35:
  }
    [(HalogenMeasurement *)self _deinitAudioPath];
  return v24;
}

- (int)saveAsWav:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ExtAudioFileRef outExtAudioFile = (ExtAudioFileRef)0xAAAAAAAAAAAAAAAALL;
  BOOL v4 = (const char *)[a3 UTF8String];
  if (!self->_isMeasurementDone)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(inStreamDesc.mSampleRate) = 0;
      BOOL v16 = MEMORY[0x1E4F14500];
      OSStatus v17 = "HalogenMeasurement:Measurement did not complete... cannot save WAV file";
LABEL_11:
      _os_log_impl(&dword_1D9622000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&inStreamDesc, 2u);
    }
    return -1;
  }
  uint64_t v5 = (const UInt8 *)v4;
  size_t v6 = strlen(v4);
  CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(0, v5, v6, 0);
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(inStreamDesc.mSampleRate) = 0;
      BOOL v16 = MEMORY[0x1E4F14500];
      OSStatus v17 = "HalogenMeasurement:CFURLCreateFromFileSystemRepresentation() returned NULL.";
      goto LABEL_11;
    }
    return -1;
  }
  CFURLRef v8 = v7;
  *(void *)&inStreamDesc.mBitsPerChannel = 0;
  UInt32 bitDepth = self->_bitDepth;
  Float64 sampleRate = (double)self->_sampleRate;
  inStreamDesc.mChannelsPerFrame = self->_nInputChannels;
  inStreamDesc.mBitsPerChannel = bitDepth;
  inStreamDesc.mBytesPerPacket = self->_inputFrameSizeInBytes;
  inStreamDesc.mFramesPerPacket = 1;
  inStreamDesc.mBytesPerFrame = inStreamDesc.mBytesPerPacket;
  inStreamDesc.mSampleRate = sampleRate;
  *(void *)&inStreamDesc.mFormatID = 0xC6C70636DLL;
  OSStatus v11 = ExtAudioFileCreateWithURL(v7, 0x57415645u, &inStreamDesc, 0, 1u, &outExtAudioFile);
  if (v11)
  {
    OSStatus v18 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v23 = v18;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:AudioFileCreateWithURL() returned ostatus=0x%x", buf, 8u);
    }
    int v14 = -1;
  }
  else
  {
    v19.mBuffers[0].mData = (void *)[(NSMutableData *)self->_pcmInputData bytes];
    UInt32 pcmInputDataSampleCnt = self->_pcmInputDataSampleCnt;
    UInt32 v13 = self->_inputFrameSizeInBytes * pcmInputDataSampleCnt;
    v19.mBuffers[0].mNumberChannels = self->_nInputChannels;
    v19.mBuffers[0].mDataByteSize = v13;
    ExtAudioFileWrite(outExtAudioFile, pcmInputDataSampleCnt, &v19);
    ExtAudioFileDispose(outExtAudioFile);
    int v14 = 0;
  }
  CFRelease(v8);
  return v14;
}

- (void)_resetCalcValues
{
  self->_precalVoltageSNR = 0.0;
  self->_calVoltageSNR = 0.0;
  self->_measurementVoltageSNR = 0.0;
  *(_OWORD *)&self->_precalCurrentSNR = 0u;
  *(_OWORD *)&self->_currentGainCorrection = 0u;
  *(_OWORD *)&self->_calCurrentSNR = 0u;
  *(_OWORD *)&self->_goertzelPhase = 0u;
  *(_OWORD *)&self->_compensatedPhase = 0u;
  *(_OWORD *)&self->_capacitanceInNanoF = 0u;
  self->_measurementCurrentSNR = 0.0;
  self->_measurementCondetSNR = 0.0;
}

- (BOOL)_doHalogenLdcmCalc:(BOOL)a3 isReceptacleWet:(BOOL)a4 withWetTransitionThreshold:(double)a5 withDryTransitionThreshold:(double)a6
{
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v11 = [(NSMutableData *)self->_pcmInputData bytes];
  BOOL v12 = [(HalogenMeasurement *)self shouldInvertData];
  if (v12) {
    uint64_t v13 = 424;
  }
  else {
    uint64_t v13 = 416;
  }
  if (v12) {
    uint64_t v14 = 416;
  }
  else {
    uint64_t v14 = 424;
  }
  uint64_t v15 = (double *)[*(id *)((char *)&self->super.isa + v13) bytes];
  BOOL v16 = (double *)[*(id *)((char *)&self->super.isa + v14) bytes];
  [(HalogenMeasurement *)self _resetCalcValues];
  uint64_t nMeasurementSamples = self->_nMeasurementSamples;
  if ((int)nMeasurementSamples >= 1)
  {
    int v18 = 2 * self->_precalibrationSampleOffsetInFrames;
    AudioBufferList v19 = v15;
    BOOL v20 = v16;
    do
    {
      *v19++ = (double)*(__int16 *)(v11 + 2 * v18) * 0.0000305175781;
      *v20++ = (double)*(__int16 *)(v11 + 2 * (v18 + 1)) * 0.0000305175781;
      v18 += 2;
      --nMeasurementSamples;
    }
    while (nMeasurementSamples);
  }
  int v21 = [(HalogenLdcmCalc *)self->_halogenLdcmCalc doPreCalibration:self->_voltageData withCurrentData:self->_currentData];
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc precalVoltageSignalLevel];
  self->_precalVoltageSignalLevel = v22;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc precalVoltageNoiseLevel];
  self->_precalVoltageNoiseLevel = v23;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc precalVoltageSNR];
  self->_precalVoltageSNR = v24;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc precalCurrentSignalLevel];
  self->_precalCurrentSignalLevel = v25;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc precalCurrentNoiseLevel];
  self->_precalCurrentNoiseLevel = v26;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc precalCurrentSNR];
  self->_precalCurrentSNR = v27;
  uint64_t v28 = self->_nMeasurementSamples;
  if ((int)v28 >= 1)
  {
    int v29 = 2 * self->_calibrationSampleOffsetInFrames;
    OSStatus v30 = v15;
    int v31 = v16;
    do
    {
      *v30++ = (double)*(__int16 *)(v11 + 2 * v29) * 0.0000305175781;
      *v31++ = (double)*(__int16 *)(v11 + 2 * (v29 + 1)) * 0.0000305175781;
      v29 += 2;
      --v28;
    }
    while (v28);
  }
  int v32 = [(HalogenLdcmCalc *)self->_halogenLdcmCalc doCalibration:self->_voltageData withCurrentData:self->_currentData];
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc calVoltageSignalLevel];
  self->_calVoltageSignalLevel = v33;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc calVoltageNoiseLevel];
  self->_calVoltageNoiseLevel = v34;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc calVoltageSNR];
  self->_calVoltageSNR = v35;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc calCurrentSignalLevel];
  self->_calCurrentSignalLevel = v36;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc calCurrentNoiseLevel];
  self->_calCurrentNoiseLevel = v37;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc calCurrentSNR];
  self->_calCurrentSNR = v38;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc voltageGainCorrection];
  self->_voltageGainCorrection = v39;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc currentGainCorrection];
  self->_currentGainCorrection = v40;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc currentPhaseCompensation];
  self->_currentPhaseCompensation = v41;
  uint64_t v42 = self->_nMeasurementSamples;
  if ((int)v42 >= 1)
  {
    int v43 = 2 * self->_measurementSampleOffsetInFrames;
    do
    {
      *v15++ = (double)*(__int16 *)(v11 + 2 * v43) * 0.0000305175781;
      *v16++ = (double)*(__int16 *)(v11 + 2 * (v43 + 1)) * 0.0000305175781;
      v43 += 2;
      --v42;
    }
    while (v42);
  }
  int v44 = [(HalogenLdcmCalc *)self->_halogenLdcmCalc doLiquidDetection:self->_voltageData withCurrentData:self->_currentData isReceptacleEmpty:v9 isReceptacleWet:v8 withWetTransitionThreshold:a5 withDryTransitionThreshold:a6];
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc goertzelImpedance];
  self->_goertzelImpedance = v45;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc goertzelPhase];
  self->_goertzelPhase = v46;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc compensatedImpedance];
  self->_compensatedImpedance = v47;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc compensatedPhase];
  self->_compensatedPhase = v48;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc resistanceInOhms];
  self->_resistanceInOhms = v49;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc capacitanceInNanoF];
  self->_capacitanceInNanoF = v50;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc clippingScore];
  self->_clippingScore = v51;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementVoltageSignalLevel];
  self->_measurementVoltageSignalLevel = v52;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementVoltageNoiseLevel];
  self->_measurementVoltageNoiseLevel = v53;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementVoltageSNR];
  self->_measurementVoltageSNR = v54;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementCurrentSignalLevel];
  self->_measurementCurrentSignalLevel = v55;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementCurrentNoiseLevel];
  self->_measurementCurrentNoiseLevel = v56;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementCurrentSNR];
  self->_measurementCurrentSNR = v57;
  [(HalogenLdcmCalc *)self->_halogenLdcmCalc measurementCondetSNR];
  self->_measurementCondetSNR = v58;
  if (v21 == 2)
  {
    int v44 = 5;
    goto LABEL_22;
  }
  switch(v32)
  {
    case 1:
      int v44 = 4;
      goto LABEL_22;
    case 2:
      int v44 = 6;
LABEL_22:
      self->_halogenResult = v44;
      return 1;
    case 0:
      goto LABEL_22;
  }
  return 1;
}

- (id)getResultString
{
  uint64_t halogenResult = self->_halogenResult;
  if (halogenResult > 8) {
    return @"Unknown";
  }
  else {
    return off_1E6B6D8A8[halogenResult];
  }
}

- (unsigned)maxOutputAmplitude
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HalogenMeasurement_maxOutputAmplitude__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  if (maxOutputAmplitude_onceToken != -1) {
    dispatch_once(&maxOutputAmplitude_onceToken, block);
  }
  return self->_maxOutputAmplitude;
}

void __40__HalogenMeasurement_maxOutputAmplitude__block_invoke(uint64_t a1)
{
  id v3 = (id)MGGetStringAnswer();
  __int16 v2 = 0x7FFF;
  if (([v3 hasPrefix:@"iPhone12,8"] & 1) == 0)
  {
    if ([v3 hasPrefix:@"iPhone11"]) {
      __int16 v2 = 0x7FFF;
    }
    else {
      __int16 v2 = 1057;
    }
  }
  *(_WORD *)(*(void *)(a1 + 32) + 14) = v2;
  if (v3)
  {
  }
}

- (unsigned)signalOffset
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HalogenMeasurement_signalOffset__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  if (signalOffset_onceToken != -1) {
    dispatch_once(&signalOffset_onceToken, block);
  }
  return self->_signalOffset;
}

void __34__HalogenMeasurement_signalOffset__block_invoke(uint64_t a1)
{
  id v3 = (id)MGGetStringAnswer();
  if ([v3 hasPrefix:@"iPhone12,8"])
  {
    __int16 v2 = 0;
  }
  else if ([v3 hasPrefix:@"iPhone11"])
  {
    __int16 v2 = 0;
  }
  else
  {
    __int16 v2 = 15308;
  }
  *(_WORD *)(*(void *)(a1 + 32) + 16) = v2;
  if (v3)
  {
  }
}

- (BOOL)shouldInvertData
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HalogenMeasurement_shouldInvertData__block_invoke;
  block[3] = &unk_1E6B6D5A0;
  block[4] = self;
  if (shouldInvertData_onceToken != -1) {
    dispatch_once(&shouldInvertData_onceToken, block);
  }
  return self->_shouldInvertData;
}

void __38__HalogenMeasurement_shouldInvertData__block_invoke(uint64_t a1)
{
  id v3 = (id)MGGetStringAnswer();
  if ([v3 hasPrefix:@"iPhone12,8"]) {
    char v2 = 0;
  }
  else {
    char v2 = [v3 hasPrefix:@"iPhone11"] ^ 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = v2;
  if (v3)
  {
  }
}

- (BOOL)isBoundViolation_voltageGainCorrection
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isBoundViolation_voltageGainCorrection];
}

- (BOOL)isBoundViolation_currentGainCorrection
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isBoundViolation_currentGainCorrection];
}

- (BOOL)isBoundViolation_currentPhaseCompensation
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isBoundViolation_currentGainCorrection];
}

- (BOOL)isLowerBoundViolation_goertzelImpedance
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isLowerBoundViolation_goertzelImpedance];
}

- (BOOL)isUpperBoundViolation_goertzelImpedance
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isUpperBoundViolation_goertzelImpedance];
}

- (BOOL)isLowerBoundViolation_goertzelPhase
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isLowerBoundViolation_goertzelPhase];
}

- (BOOL)isUpperBoundViolation_goertzelPhase
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isUpperBoundViolation_goertzelPhase];
}

- (BOOL)isBoundViolation_measurementCondetSNR
{
  return [(HalogenLdcmCalc *)self->_halogenLdcmCalc isBoundViolation_measurementCondetSNR];
}

- (int)precalibrationSampleOffsetInFrames
{
  return self->_precalibrationSampleOffsetInFrames;
}

- (double)precalVoltageSignalLevel
{
  return self->_precalVoltageSignalLevel;
}

- (double)precalVoltageNoiseLevel
{
  return self->_precalVoltageNoiseLevel;
}

- (double)precalVoltageSNR
{
  return self->_precalVoltageSNR;
}

- (double)precalCurrentSignalLevel
{
  return self->_precalCurrentSignalLevel;
}

- (double)precalCurrentNoiseLevel
{
  return self->_precalCurrentNoiseLevel;
}

- (double)precalCurrentSNR
{
  return self->_precalCurrentSNR;
}

- (int)calibrationSampleOffsetInFrames
{
  return self->_calibrationSampleOffsetInFrames;
}

- (double)voltageGainCorrection
{
  return self->_voltageGainCorrection;
}

- (double)currentGainCorrection
{
  return self->_currentGainCorrection;
}

- (double)currentPhaseCompensation
{
  return self->_currentPhaseCompensation;
}

- (double)calVoltageSignalLevel
{
  return self->_calVoltageSignalLevel;
}

- (double)calVoltageNoiseLevel
{
  return self->_calVoltageNoiseLevel;
}

- (double)calVoltageSNR
{
  return self->_calVoltageSNR;
}

- (double)calCurrentSignalLevel
{
  return self->_calCurrentSignalLevel;
}

- (double)calCurrentNoiseLevel
{
  return self->_calCurrentNoiseLevel;
}

- (double)calCurrentSNR
{
  return self->_calCurrentSNR;
}

- (int)measurementSampleOffsetInFrames
{
  return self->_measurementSampleOffsetInFrames;
}

- (void)setMeasurementSampleOffsetInFrames:(int)a3
{
  self->_measurementSampleOffsetInFrames = a3;
}

- (double)goertzelImpedance
{
  return self->_goertzelImpedance;
}

- (double)goertzelPhase
{
  return self->_goertzelPhase;
}

- (double)compensatedImpedance
{
  return self->_compensatedImpedance;
}

- (double)compensatedPhase
{
  return self->_compensatedPhase;
}

- (double)resistanceInOhms
{
  return self->_resistanceInOhms;
}

- (double)capacitanceInNanoF
{
  return self->_capacitanceInNanoF;
}

- (double)clippingScore
{
  return self->_clippingScore;
}

- (double)measurementVoltageSignalLevel
{
  return self->_measurementVoltageSignalLevel;
}

- (double)measurementVoltageNoiseLevel
{
  return self->_measurementVoltageNoiseLevel;
}

- (double)measurementVoltageSNR
{
  return self->_measurementVoltageSNR;
}

- (double)measurementCurrentSignalLevel
{
  return self->_measurementCurrentSignalLevel;
}

- (double)measurementCurrentNoiseLevel
{
  return self->_measurementCurrentNoiseLevel;
}

- (double)measurementCurrentSNR
{
  return self->_measurementCurrentSNR;
}

- (double)measurementCondetSNR
{
  return self->_measurementCondetSNR;
}

- (int)halogenResult
{
  return self->_halogenResult;
}

- (HalogenLdcmCalc)halogenLdcmCalc
{
  return self->_halogenLdcmCalc;
}

- (void)setHalogenLdcmCalc:(id)a3
{
  self->_halogenLdcmCalc = (HalogenLdcmCalc *)a3;
}

- (int)nInputChannels
{
  return self->_nInputChannels;
}

- (void)setNInputChannels:(int)a3
{
  self->_int nInputChannels = a3;
}

- (int)nOutputChannels
{
  return self->_nOutputChannels;
}

- (void)setNOutputChannels:(int)a3
{
  self->_int nOutputChannels = a3;
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int)a3
{
  self->_Float64 sampleRate = a3;
}

- (int)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(int)a3
{
  self->_UInt32 bitDepth = a3;
}

- (int)inputFrameSizeInBytes
{
  return self->_inputFrameSizeInBytes;
}

- (void)setInputFrameSizeInBytes:(int)a3
{
  self->_int inputFrameSizeInBytes = a3;
}

- (int)outputFrameSizeInBytes
{
  return self->_outputFrameSizeInBytes;
}

- (void)setOutputFrameSizeInBytes:(int)a3
{
  self->_int outputFrameSizeInBytes = a3;
}

- (OpaqueAudioComponentInstance)audioComponentInst
{
  return self->_audioComponentInst;
}

- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3
{
  self->_audioComponentInst = a3;
}

- (int)warmupTimeInMs
{
  return self->_warmupTimeInMs;
}

- (void)setWarmupTimeInMs:(int)a3
{
  self->_warmupTimeInMs = a3;
}

- (int)hydraSettlingTimeInMs
{
  return self->_hydraSettlingTimeInMs;
}

- (void)setHydraSettlingTimeInMs:(int)a3
{
  self->_hydraSettlingTimeInMs = a3;
}

- (int)nMeasurementSamples
{
  return self->_nMeasurementSamples;
}

- (void)setNMeasurementSamples:(int)a3
{
  self->_uint64_t nMeasurementSamples = a3;
}

- (int)nWarmupSamples
{
  return self->_nWarmupSamples;
}

- (void)setNWarmupSamples:(int)a3
{
  self->_nWarmupSamples = a3;
}

- (int)nHydraSettlingSamples
{
  return self->_nHydraSettlingSamples;
}

- (void)setNHydraSettlingSamples:(int)a3
{
  self->_nHydraSettlingSamples = a3;
}

- (int)nTotalSamples
{
  return self->_nTotalSamples;
}

- (void)setNTotalSamples:(int)a3
{
  self->_nTotalSamples = a3;
}

- (int)nPaddingSamples
{
  return self->_nPaddingSamples;
}

- (void)setNPaddingSamples:(int)a3
{
  self->_nPaddingSamples = a3;
}

- (double)signalFreq
{
  return self->_signalFreq;
}

- (void)setSignalFreq:(double)a3
{
  self->_signalFreq = a3;
}

- (int)initalPhaseInDegrees
{
  return self->_initalPhaseInDegrees;
}

- (void)setInitalPhaseInDegrees:(int)a3
{
  self->_initalPhaseInDegrees = a3;
}

- (NSMutableData)pcmInputData
{
  return self->_pcmInputData;
}

- (void)setPcmInputData:(id)a3
{
  self->_pcmInputData = (NSMutableData *)a3;
}

- (int)pcmInputDataMaxSzInBytes
{
  return self->_pcmInputDataMaxSzInBytes;
}

- (void)setPcmInputDataMaxSzInBytes:(int)a3
{
  self->_pcmInputDataMaxSzInBytes = a3;
}

- (int)pcmInputDataIndexInBytes
{
  return self->_pcmInputDataIndexInBytes;
}

- (void)setPcmInputDataIndexInBytes:(int)a3
{
  self->_pcmInputDataIndexInBytes = a3;
}

- (int)pcmInputDataSampleCnt
{
  return self->_pcmInputDataSampleCnt;
}

- (void)setPcmInputDataSampleCnt:(int)a3
{
  self->_UInt32 pcmInputDataSampleCnt = a3;
}

- (BOOL)isCalibrationDone
{
  return self->_isCalibrationDone;
}

- (void)setIsCalibrationDone:(BOOL)a3
{
  self->_isCalibrationDone = a3;
}

- (BOOL)isMeasurementDone
{
  return self->_isMeasurementDone;
}

- (void)setIsMeasurementDone:(BOOL)a3
{
  self->_isMeasurementDone = a3;
}

- (NSMutableData)pcmOutputData
{
  return self->_pcmOutputData;
}

- (void)setPcmOutputData:(id)a3
{
  self->_pcmOutputData = (NSMutableData *)a3;
}

- (int)pcmOutputDataMaxSzInBytes
{
  return self->_pcmOutputDataMaxSzInBytes;
}

- (void)setPcmOutputDataMaxSzInBytes:(int)a3
{
  self->_pcmOutputDataMaxSzInBytes = a3;
}

- (int)pcmOutputDataIndexInBytes
{
  return self->_pcmOutputDataIndexInBytes;
}

- (void)setPcmOutputDataIndexInBytes:(int)a3
{
  self->_pcmOutputDataIndexInBytes = a3;
}

- (NSMutableData)currentData
{
  return self->_currentData;
}

- (void)setCurrentData:(id)a3
{
  self->_currentData = (NSMutableData *)a3;
}

- (NSMutableData)voltageData
{
  return self->_voltageData;
}

- (void)setVoltageData:(id)a3
{
  self->_voltageData = (NSMutableData *)a3;
}

- (int)audioTimeoutInSec
{
  return self->_audioTimeoutInSec;
}

- (void)setAudioTimeoutInSec:(int)a3
{
  self->_audioTimeoutInSec = a3;
}

- (NSCondition)audioTimeoutCond
{
  return self->_audioTimeoutCond;
}

- (void)setAudioTimeoutCond:(id)a3
{
  self->_audioTimeoutCond = (NSCondition *)a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_io_connect_t connect = a3;
}

- (int)pinToMeasure
{
  return self->_pinToMeasure;
}

- (void)setPinToMeasure:(int)a3
{
  self->_pinToMeasure = a3;
}

- (unint64_t)eisPinToken1
{
  return self->_eisPinToken1;
}

- (void)setEisPinToken1:(unint64_t)a3
{
  self->_eisPinToken1 = a3;
}

- (unint64_t)eisPinToken2
{
  return self->_eisPinToken2;
}

- (void)setEisPinToken2:(unint64_t)a3
{
  self->_unint64_t eisPinToken2 = a3;
}

- (OS_dispatch_queue)systemPowerQueue
{
  return self->_systemPowerQueue;
}

- (void)setSystemPowerQueue:(id)a3
{
  self->_systemPowerQueue = (OS_dispatch_queue *)a3;
}

- (unsigned)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(unsigned int)a3
{
  self->_systemPowerPort = a3;
}

- (IONotificationPort)systemPowerNotifyPortRef
{
  return self->_systemPowerNotifyPortRef;
}

- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3
{
  self->_systemPowerNotifyPortRef = a3;
}

- (unsigned)systemPowerIterator
{
  return self->_systemPowerIterator;
}

- (void)setSystemPowerIterator:(unsigned int)a3
{
  self->_systemPowerIterator = a3;
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int)a3
{
  self->_powerState = a3;
}

- (NSCondition)powerStateCond
{
  return self->_powerStateCond;
}

- (void)setPowerStateCond:(id)a3
{
  self->_powerStateCond = (NSCondition *)a3;
}

- (BaseResourceArbiterClient)arbiterClient
{
  return self->_arbiterClient;
}

- (BOOL)arbiterLocked
{
  return self->_arbiterLocked;
}

- (BOOL)arbitrationRequired
{
  return self->_arbitrationRequired;
}

@end