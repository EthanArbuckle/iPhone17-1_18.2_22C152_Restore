@interface HalogenTypeC
- ($DE2CA4548F4C2DB4D89410195F9427A4)getMeasurementInfo;
- ($DE2CA4548F4C2DB4D89410195F9427A4)measurementInfoDefault;
- (BOOL)_allocBuffers;
- (BOOL)_connectToAccessoryManager:(int)a3;
- (BOOL)_createSleepWakeNotifier;
- (BOOL)_doLDCMCalculation:(BOOL)a3 isReceptacleWet:(BOOL)a4 withWetTransitionThreshold:(double)a5 withDryTransitionThreshold:(double)a6 pinParasitics:(double)a7 measurementType:(int)a8;
- (BOOL)_readCalibrationParameters:(id)a3;
- (BOOL)_writeCalResults:(id)a3;
- (BOOL)isCalibrationDone;
- (BOOL)isHWSelfTestCapable;
- (BOOL)isInternalBuild;
- (BOOL)isMeasurementDone;
- (BOOL)measureSBU;
- (BOOL)selfTestCapable;
- (BOOL)setLiquidDetected:(BOOL)a3;
- (BOOL)setMitigations:(BOOL)a3;
- (BOOL)supportsSelfTest;
- (BOOL)wetTooLong;
- (HalogenAudio)halogenAudioUnit;
- (HalogenCalcTypeC)halogenCalcTypeC;
- (HalogenTypeC)initWithParams:(int)a3 onPort:(int)a4;
- (IONotificationPort)systemPowerNotifyPortRef;
- (NSCondition)audioTimeoutCond;
- (NSCondition)powerStateCond;
- (NSMutableData)currentData;
- (NSMutableData)pcmInputData;
- (NSMutableData)pcmOutputData;
- (NSMutableData)voltageData;
- (NSMutableString)measurementInfoAcchalogenOutputString;
- (NSMutableString)measurementInfoOutputString;
- (OS_dispatch_queue)systemPowerQueue;
- (OpaqueAudioComponentInstance)audioComponentInst;
- (double)calCurrentAmplitude;
- (double)calCurrentNoiseLevel;
- (double)calCurrentSNR;
- (double)calCurrentSignalLevel;
- (double)calVoltageAmplitude;
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
- (double)measurementCurrentAmplitude;
- (double)measurementCurrentNoiseLevel;
- (double)measurementCurrentPhase;
- (double)measurementCurrentSNR;
- (double)measurementCurrentSignalLevel;
- (double)measurementLoadImpedanceMagnitude;
- (double)measurementLoadImpedancePhase;
- (double)measurementVoltageAmplitude;
- (double)measurementVoltageNoiseLevel;
- (double)measurementVoltagePhase;
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
- (id)_buildMeasurementOutputString:(id *)a3;
- (id)_buildVerboseMeasurementOutputString:(id *)a3;
- (id)_getHalogenMeasurementTypeString:(int)a3;
- (id)_getLDCMPinString:(int)a3;
- (id)getHalogenResultString:(int)a3;
- (id)getMeasurementOutputString;
- (id)getVerboseMeasurementOutputString;
- (int)AceSettlingTimeInMs;
- (int)_doLDCMMeasurement:(int)a3 isReceptacleEmpty:(BOOL)a4 isReceptacleWet:(BOOL)a5 withWetTransitionThreshold:(double)a6 withDryTransitionThreshold:(double)a7 measurementType:(int)a8;
- (int)audioTimeoutInSec;
- (int)bitDepth;
- (int)calibrationSampleOffsetInFrames;
- (int)doLDCMMeasurement:(int)a3 isCalibrationNeeded:(BOOL)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8;
- (int)halogenResult;
- (int)initalPhaseInDegrees;
- (int)inputFrameSizeInBytes;
- (int)ldcmState;
- (int)measurementSampleOffsetInFrames;
- (int)nAceSettlingSamples;
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
- (int)playbackCallBackFunc:(unsigned int *)a3 AudioTimeStamp:(const AudioTimeStamp *)a4 busNum:(unsigned int)a5 numFrames:(unsigned int)a6 AudioBufferList:(AudioBufferList *)a7;
- (int)powerState;
- (int)precalibrationSampleOffsetInFrames;
- (int)recordCallBackFunc:(unsigned int *)a3 AudioTimeStamp:(const AudioTimeStamp *)a4 busNum:(unsigned int)a5 numFrames:(unsigned int)a6 AudioBufferList:(AudioBufferList *)a7;
- (int)sampleRate;
- (int)saveAsWav:(id)a3;
- (int)warmupTimeInMs;
- (unsigned)connect;
- (unsigned)maxOutputAmplitude;
- (unsigned)service;
- (unsigned)signalOffset;
- (unsigned)systemPowerIterator;
- (unsigned)systemPowerPort;
- (void)_destroySleepWakeNotifier;
- (void)_disconnectFromAccessoryManager;
- (void)_freeBuffers;
- (void)_generateSineWave;
- (void)_resetCalcValues;
- (void)_runHPMTool:(BOOL)a3;
- (void)_storeMeasurementData:(int)a3 measurementType:(int)a4 measurementInfo:(id *)a5 halogenResult:(int)a6;
- (void)dealloc;
- (void)setAceSettlingTimeInMs:(int)a3;
- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3;
- (void)setAudioTimeoutCond:(id)a3;
- (void)setAudioTimeoutInSec:(int)a3;
- (void)setBitDepth:(int)a3;
- (void)setConnect:(unsigned int)a3;
- (void)setCurrentData:(id)a3;
- (void)setHalogenAudioUnit:(id)a3;
- (void)setHalogenCalcTypeC:(id)a3;
- (void)setInitalPhaseInDegrees:(int)a3;
- (void)setInputFrameSizeInBytes:(int)a3;
- (void)setIsCalibrationDone:(BOOL)a3;
- (void)setIsInternalBuild:(BOOL)a3;
- (void)setIsMeasurementDone:(BOOL)a3;
- (void)setLdcmState:(int)a3;
- (void)setMeasureSBU:(BOOL)a3;
- (void)setMeasurementInfoAcchalogenOutputString:(id)a3;
- (void)setMeasurementInfoDefault:(id *)a3;
- (void)setMeasurementInfoOutputString:(id)a3;
- (void)setMeasurementSampleOffsetInFrames:(int)a3;
- (void)setNAceSettlingSamples:(int)a3;
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
- (void)setSelfTestCapable:(BOOL)a3;
- (void)setService:(unsigned int)a3;
- (void)setSignalFreq:(double)a3;
- (void)setSystemPowerIterator:(unsigned int)a3;
- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3;
- (void)setSystemPowerPort:(unsigned int)a3;
- (void)setSystemPowerQueue:(id)a3;
- (void)setVoltageData:(id)a3;
- (void)setWarmupTimeInMs:(int)a3;
- (void)setWetTooLong:(BOOL)a3;
@end

@implementation HalogenTypeC

- (HalogenTypeC)initWithParams:(int)a3 onPort:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HalogenTypeC;
  v6 = [(HalogenTypeC *)&v19 init];
  v7 = (HalogenTypeC *)v6;
  if (!v6) {
    return v7;
  }
  *(_OWORD *)(v6 + 36) = xmmword_1D964CDA0;
  *(_DWORD *)(v6 + 14) = 1;
  *(_OWORD *)(v6 + 52) = xmmword_1D964CDB0;
  *((_DWORD *)v6 + 17) = a3;
  *((void *)v6 + 9) = 0x3840000012C0;
  *((_DWORD *)v6 + 20) = 2 * a3 + 23296;
  *((_DWORD *)v6 + 21) = 4096;
  *((_DWORD *)v6 + 6) = 4800;
  v8 = [HalogenAudio alloc];
  LODWORD(v18) = v7->_outputFrameSizeInBytes;
  uint64_t v9 = [(HalogenAudio *)v8 initAudioWithParameters:v7 nInputChannels:v7->_nInputChannels nOutputChannels:v7->_nOutputChannels sampleRate:v7->_sampleRate bitDepth:v7->_bitDepth inputFrameSizeInBytes:v7->_inputFrameSizeInBytes outputFrameSizeInBytes:v18];
  v7->_halogenAudioUnit = (HalogenAudio *)v9;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E4F14500];
    v13 = "HalogenTypeC:Could not initialize HalogenAudio.";
    goto LABEL_11;
  }
  v7->_audioTimeoutCond = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
  v7->_audioTimeoutInSec = 1;
  v7->_signalFreq = 110.0;
  v7->_initalPhaseInDegrees = 0;
  v10 = (const void *)MGCopyAnswer();
  if (v10)
  {
    v11 = v10;
    v7->_isInternalBuild = CFEqual(v10, @"Internal") != 0;
    CFRelease(v11);
  }
  else
  {
    v7->_isInternalBuild = 0;
  }
  v7->_selfTestCapable = [(HalogenTypeC *)v7 supportsSelfTest];
  v7->_measurementInfoOutputString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (![(HalogenTypeC *)v7 _allocBuffers])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E4F14500];
      v16 = "HalogenTypeC:_allocBuffers() failed";
      uint32_t v17 = 2;
LABEL_22:
      _os_log_impl(&dword_1D9622000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (![(HalogenTypeC *)v7 _connectToAccessoryManager:v4])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v4;
      v15 = MEMORY[0x1E4F14500];
      v16 = "HalogenTypeC:_connectToAccessoryManager() failed for port %d";
LABEL_21:
      uint32_t v17 = 8;
      goto LABEL_22;
    }
LABEL_23:

    return 0;
  }
  if (![(HalogenTypeC *)v7 _createSleepWakeNotifier])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v4;
      v15 = MEMORY[0x1E4F14500];
      v16 = "HalogenTypeC:_createSleepWakeNotifier() failed for port %d";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  [(HalogenTypeC *)v7 _generateSineWave];
  v7->_halogenCalcTypeC = [[HalogenCalcTypeC alloc] initWithParams:v7->_nMeasurementSamples signalFrequency:v7->_sampleRate sampleRate:v7->_signalFreq tiaGain:12400.0 adcGain:1.0 parasiticCap:4.0e-12];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E4F14500];
    v13 = "HalogenTypeC:HalogenTypeC Started!";
LABEL_11:
    _os_log_impl(&dword_1D9622000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
  }
  return v7;
}

- (void)dealloc
{
  [(HalogenTypeC *)self _destroySleepWakeNotifier];
  [(HalogenTypeC *)self _disconnectFromAccessoryManager];
  [(HalogenTypeC *)self _freeBuffers];

  v3.receiver = self;
  v3.super_class = (Class)HalogenTypeC;
  [(HalogenTypeC *)&v3 dealloc];
}

- (BOOL)_createSleepWakeNotifier
{
  [(HalogenTypeC *)self setPowerState:2];
  [(HalogenTypeC *)self setSystemPowerPort:0];
  [(HalogenTypeC *)self setSystemPowerIterator:0];
  [(HalogenTypeC *)self setSystemPowerNotifyPortRef:0];
  [(HalogenTypeC *)self setSystemPowerQueue:dispatch_queue_create("com.apple.ioaccessorymanager.halogenTypeC.systemPower.queue", 0)];
  if (![(HalogenTypeC *)self systemPowerQueue])
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v4) {
      return result;
    }
    __int16 v12 = 0;
    v5 = MEMORY[0x1E4F14500];
    v6 = "HalogenTypeC:dispatch_queue_create() failed";
    v7 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  [(HalogenTypeC *)self setSystemPowerPort:IORegisterForSystemPower(self, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)systemPowerCallback, &self->_systemPowerIterator)];
  if (![(HalogenTypeC *)self systemPowerPort])
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    __int16 v11 = 0;
    v5 = MEMORY[0x1E4F14500];
    v6 = "HalogenTypeC:IORegisterForSystemPower() failed";
    v7 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    return 0;
  }
  [(HalogenTypeC *)self setPowerStateCond:objc_alloc_init(MEMORY[0x1E4F28BB0])];
  if ([(HalogenTypeC *)self powerStateCond])
  {
    IONotificationPortSetDispatchQueue([(HalogenTypeC *)self systemPowerNotifyPortRef], (dispatch_queue_t)[(HalogenTypeC *)self systemPowerQueue]);
    return 1;
  }
  BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v9)
  {
    __int16 v10 = 0;
    v5 = MEMORY[0x1E4F14500];
    v6 = "HalogenTypeC:Failed to create NSCondition: powerStateCond";
    v7 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  return result;
}

- (void)_destroySleepWakeNotifier
{
  if ([(HalogenTypeC *)self systemPowerIterator]) {
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  }
  if ([(HalogenTypeC *)self systemPowerNotifyPortRef]) {
    IONotificationPortDestroy([(HalogenTypeC *)self systemPowerNotifyPortRef]);
  }
  if ([(HalogenTypeC *)self systemPowerPort]) {
    IOServiceClose([(HalogenTypeC *)self systemPowerPort]);
  }
  if ([(HalogenTypeC *)self systemPowerQueue]) {
    dispatch_release((dispatch_object_t)[(HalogenTypeC *)self systemPowerQueue]);
  }
  objc_super v3 = [(HalogenTypeC *)self powerStateCond];
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

  v15 = *MEMORY[0x1E4F143B8];
  unsigned int ServiceWithSupportedFeature = IOAccessoryManagerGetServiceWithSupportedFeature();
  self->_service = ServiceWithSupportedFeature;
  if (ServiceWithSupportedFeature)
  {
    v6 = IOServiceOpen(ServiceWithSupportedFeature, *MEMORY[0x1E4F14960], 0, &self->_connect);
    if (!v6) {
      return 1;
    }
    __int16 v11 = v6;
    __int16 v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v12)
    {
      v13 = 67109120;
      v14 = v11;
      BOOL v9 = MEMORY[0x1E4F14500];
      __int16 v10 = "HalogenTypeC:Failed to open IOAccessoryManager manager (ret = 0x%x)";
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v8)
    {
      v13 = 67109120;
      v14 = a3;
      BOOL v9 = MEMORY[0x1E4F14500];
      __int16 v10 = "HalogenTypeC:Could not find IOAccessoryManager service for port=%d";
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

- (BOOL)_allocBuffers
{
  int v3 = self->_inputFrameSizeInBytes * self->_nTotalSamples;
  *(void *)&self->_pcmInputDataIndexInBytes = 0;
  self->_pcmInputDataMaxSzInBytes = v3;
  BOOL v4 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_pcmInputData = v4;
  if (!v4)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    __int16 v19 = 0;
    __int16 v10 = MEMORY[0x1E4F14500];
    __int16 v11 = "HalogenTypeC:Failed to alloc _pcmInputData";
    __int16 v12 = (uint8_t *)&v19;
    goto LABEL_15;
  }
  *(void *)&self->_pcmOutputDataMaxSzInBytes = (self->_outputFrameSizeInBytes * self->_nTotalSamples);
  v5 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  self->_pcmOutputData = v5;
  if (!v5)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    __int16 v18 = 0;
    __int16 v10 = MEMORY[0x1E4F14500];
    __int16 v11 = "HalogenTypeC:Failed to alloc _pcmOutputData";
    __int16 v12 = (uint8_t *)&v18;
    goto LABEL_15;
  }
  v6 = (NSMutableData *)(id)[MEMORY[0x1E4F1CA58] dataWithLength:8 * self->_nMeasurementSamples];
  self->_currentData = v6;
  if (!v6)
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v14) {
      return result;
    }
    __int16 v17 = 0;
    __int16 v10 = MEMORY[0x1E4F14500];
    __int16 v11 = "HalogenTypeC:Failed to alloc _currentData";
    __int16 v12 = (uint8_t *)&v17;
LABEL_15:
    _os_log_impl(&dword_1D9622000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    return 0;
  }
  v7 = (NSMutableData *)(id)[MEMORY[0x1E4F1CA58] dataWithLength:8 * self->_nMeasurementSamples];
  self->_voltageData = v7;
  if (v7) {
    return 1;
  }
  BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v15)
  {
    __int16 v16 = 0;
    __int16 v10 = MEMORY[0x1E4F14500];
    __int16 v11 = "HalogenTypeC:Failed to alloc _voltageData";
    __int16 v12 = (uint8_t *)&v16;
    goto LABEL_15;
  }
  return result;
}

- (void)_freeBuffers
{
  voltageData = self->_voltageData;
}

- (BOOL)supportsSelfTest
{
  v2 = (void *)MGGetStringAnswer();
  int v3 = v2;
  if (v2 && [v2 length])
  {
    BOOL v4 = ([v3 isEqualToString:@"iPad13,1"] & 1) == 0
      && ![v3 isEqualToString:@"iPad13,2"];
LABEL_7:

    return v4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Product Type string is NULL - No support for SelfTest", v6, 2u);
  }
  BOOL v4 = 0;
  BOOL result = 0;
  if (v3) {
    goto LABEL_7;
  }
  return result;
}

- (void)_generateSineWave
{
  uint64_t v3 = [(NSMutableData *)self->_pcmOutputData bytes];
  if (self->_nTotalSamples >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    float v6 = self->_signalFreq * 6.28318531 / (double)self->_sampleRate;
    float v7 = ((double)self->_initalPhaseInDegrees / 360.0 + (double)self->_initalPhaseInDegrees / 360.0) * 3.14159265;
    do
    {
      double v8 = sin(v7);
      double v9 = (double)[(HalogenTypeC *)self maxOutputAmplitude];
      float v10 = -((double)[(HalogenTypeC *)self signalOffset] - v8 * v9);
      *(float *)(v4 + 4 * v5) = v10;
      float v7 = v7 + v6;
      ++v5;
    }
    while (v5 < self->_nTotalSamples);
  }
}

- (void)_runHPMTool:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processIdentifier");
  uint64_t v4 = (void *)[MEMORY[0x1E4F28F48] pipe];
  uint64_t v5 = (void *)[v4 fileHandleForReading];
  id v6 = objc_alloc_init(MEMORY[0x1E4F29038]);
  [v6 setLaunchPath:@"/usr/local/bin/hpmtool"];
  float v7 = @"--data=0x110B0402";
  if (v3) {
    float v7 = @"--data=0x110B0400";
  }
  v10[0] = @"--command=DVEn";
  v10[1] = v7;
  objc_msgSend(v6, "setArguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 2));
  [v6 setStandardOutput:v4];
  [v6 launch];
  uint64_t v8 = [v5 readDataToEndOfFile];
  [v5 closeFile];
  double v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  NSLog(&cfstr_HpmtoolReturne.isa, v9);
}

- (int)recordCallBackFunc:(unsigned int *)a3 AudioTimeStamp:(const AudioTimeStamp *)a4 busNum:(unsigned int)a5 numFrames:(unsigned int)a6 AudioBufferList:(AudioBufferList *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  *(void *)&ioData.mNumberBuffers = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&ioData.mBuffers[0].mNumberChannels = 0xAAAAAAAAAAAAAAAALL;
  signed int v8 = self->_inputFrameSizeInBytes * a6;
  int pcmInputDataMaxSzInBytes = self->_pcmInputDataMaxSzInBytes;
  int pcmInputDataIndexInBytes = self->_pcmInputDataIndexInBytes;
  if (pcmInputDataMaxSzInBytes - pcmInputDataIndexInBytes < v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = a6;
    __int16 v30 = 1024;
    int v31 = pcmInputDataMaxSzInBytes;
    __int16 v32 = 1024;
    int v33 = pcmInputDataIndexInBytes;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenTypeC:recordCallback() insufficient space in pcmInputData buffer to render %d frames.  bufsize = %d idx=%d";
    uint32_t v25 = 20;
LABEL_23:
    _os_log_impl(&dword_1D9622000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
    return 0;
  }
  if (self->_isMeasurementDone) {
    return 0;
  }
  ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mData = (void *)([(NSMutableData *)self->_pcmInputData bytes]
                                    + self->_pcmInputDataIndexInBytes);
  ioData.mBuffers[0].mDataByteSize = v8;
  halogenAudioUnit = self->_halogenAudioUnit;
  if (!halogenAudioUnit)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenTypeC:Could not find a valid HalogenAudio instance.";
    uint32_t v25 = 2;
    goto LABEL_23;
  }
  OSStatus v16 = AudioUnitRender([(HalogenAudio *)halogenAudioUnit getAudioComponentInstance], a3, a4, a5, a6, &ioData);
  if (v16)
  {
    OSStatus v17 = v16;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:render failed osstatus=0x%x", buf, 8u);
    }
  }
  [(HalogenTypeC *)self setPcmInputDataIndexInBytes:(self->_pcmInputDataIndexInBytes + v8)];
  [(HalogenTypeC *)self setPcmInputDataSampleCnt:self->_pcmInputDataSampleCnt + a6];
  int pcmInputDataSampleCnt = self->_pcmInputDataSampleCnt;
  int nMeasurementSamples = self->_nMeasurementSamples;
  if (pcmInputDataSampleCnt >= nMeasurementSamples + self->_calibrationSampleOffsetInFrames)
  {
    if (!self->_isCalibrationDone)
    {
      self->_isCalibrationDone = 1;
      self->_measurementSampleOffsetInFrames = self->_nAceSettlingSamples + pcmInputDataSampleCnt;
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      if (self->_pinToMeasure == 4 && self->_isInternalBuild)
      {
        -[HalogenTypeC _runHPMTool:](self, "_runHPMTool:", 1, 0xAAAAAAAAAAAAAAAALL);
      }
      else
      {
        int v20 = IOAccessoryManagerSetLDCM();
        if (v20)
        {
          int v21 = v20;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v27 = 67109120;
            int v28 = v21;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:IOAccessoryManagerSetLDCM failed with: 0x%x", v27, 8u);
          }
        }
      }
      int pcmInputDataSampleCnt = self->_pcmInputDataSampleCnt;
      int nMeasurementSamples = self->_nMeasurementSamples;
    }
    if (pcmInputDataSampleCnt >= nMeasurementSamples + self->_measurementSampleOffsetInFrames)
    {
      self->_isMeasurementDone = 1;
      [(NSCondition *)self->_audioTimeoutCond signal];
    }
  }
  return 0;
}

- (int)playbackCallBackFunc:(unsigned int *)a3 AudioTimeStamp:(const AudioTimeStamp *)a4 busNum:(unsigned int)a5 numFrames:(unsigned int)a6 AudioBufferList:(AudioBufferList *)a7
{
  uint64_t v9 = [(NSMutableData *)self->_pcmOutputData bytes];
  uint64_t pcmOutputDataIndexInBytes = self->_pcmOutputDataIndexInBytes;
  unint64_t mNumberBuffers = a7->mNumberBuffers;
  if (mNumberBuffers)
  {
    uint64_t v12 = v9;
    unint64_t v13 = 0;
    int pcmOutputDataMaxSzInBytes = self->_pcmOutputDataMaxSzInBytes;
    p_mData = &a7->mBuffers[0].mData;
    do
    {
      unsigned int v16 = *((_DWORD *)p_mData - 1);
      if (pcmOutputDataMaxSzInBytes - (int)pcmOutputDataIndexInBytes >= v16) {
        size_t v17 = v16;
      }
      else {
        size_t v17 = (pcmOutputDataMaxSzInBytes - pcmOutputDataIndexInBytes);
      }
      if (v17)
      {
        memcpy(*p_mData, (const void *)(v12 + self->_pcmOutputDataIndexInBytes), v17);
        uint64_t pcmOutputDataIndexInBytes = (v17 + pcmOutputDataIndexInBytes);
        unint64_t mNumberBuffers = a7->mNumberBuffers;
      }
      p_mData += 2;
      ++v13;
    }
    while (v13 < mNumberBuffers);
  }
  [(HalogenTypeC *)self setPcmOutputDataIndexInBytes:pcmOutputDataIndexInBytes];
  return 0;
}

- (int)saveAsWav:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ExtAudioFileRef outExtAudioFile = (ExtAudioFileRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = (const char *)[a3 UTF8String];
  if (!self->_isMeasurementDone)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(inStreamDesc.mSampleRate) = 0;
      unsigned int v16 = MEMORY[0x1E4F14500];
      size_t v17 = "HalogenTypeC:Measurement did not complete... cannot save WAV file";
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
      unsigned int v16 = MEMORY[0x1E4F14500];
      size_t v17 = "HalogenTypeC:CFURLCreateFromFileSystemRepresentation() returned NULL.";
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
  *(void *)&inStreamDesc.mFormatID = 0x96C70636DLL;
  OSStatus v11 = ExtAudioFileCreateWithURL(v7, 0x57415645u, &inStreamDesc, 0, 1u, &outExtAudioFile);
  if (v11)
  {
    OSStatus v18 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v23 = v18;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:AudioFileCreateWithURL() returned ostatus=0x%x", buf, 8u);
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

- (int)doLDCMMeasurement:(int)a3 isCalibrationNeeded:(BOOL)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_halogenResult = 11;
  self->_measurementInfoDefault.halogenResult = 11;
  [(HalogenTypeC *)self _resetCalcValues];
  self->_ldcmState = 3;
  if (v12 == 1)
  {
    uint64_t v14 = 2;
    goto LABEL_7;
  }
  if (v12 != 3)
  {
    uint64_t v14 = 0;
LABEL_7:
    int v15 = [(HalogenTypeC *)self _doLDCMMeasurement:v12 isReceptacleEmpty:v11 isReceptacleWet:v10 withWetTransitionThreshold:v14 withDryTransitionThreshold:a7 measurementType:a8];
    if (v15)
    {
      int v16 = v15;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67109120;
        v18[1] = v16;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:_doLDCMMeasurement failed (HalogenMeasurementStatus = 0x%x)", (uint8_t *)v18, 8u);
      }
    }
    else
    {
      [(NSMutableString *)self->_measurementInfoOutputString setString:&stru_1F3381008];
      [(HalogenTypeC *)self _storeMeasurementData:v12 measurementType:v14 measurementInfo:&self->_measurementInfoDefault halogenResult:self->_halogenResult];
      [(NSMutableString *)self->_measurementInfoOutputString appendString:[(HalogenTypeC *)self _buildMeasurementOutputString:&self->_measurementInfoDefault]];
      return 0;
    }
    return v16;
  }
  if (self->_selfTestCapable)
  {
    self->_ldcmState = 4;
    uint64_t v14 = 1;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:This device does not support self-test. Exiting...", (uint8_t *)v18, 2u);
  }
  return 9;
}

- (int)_doLDCMMeasurement:(int)a3 isReceptacleEmpty:(BOOL)a4 isReceptacleWet:(BOOL)a5 withWetTransitionThreshold:(double)a6 withDryTransitionThreshold:(double)a7 measurementType:(int)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&self->_int pcmInputDataIndexInBytes = 0;
  self->_uint64_t pcmOutputDataIndexInBytes = 0;
  *(_WORD *)&self->_isCalibrationDone = 0;
  if ((a3 - 5) > 0xFFFFFFFB)
  {
    uint64_t v10 = *(void *)&a8;
    BOOL v11 = a5;
    BOOL v12 = a4;
    self->_int pinToMeasure = a3;
    switch(a3)
    {
      case 1:
        double v15 = 0.0;
        goto LABEL_8;
      case 2:
      case 3:
        double v15 = 4.0e-11;
        goto LABEL_8;
      case 4:
        if (self->_isInternalBuild)
        {
          -[HalogenTypeC _runHPMTool:](self, "_runHPMTool:", 0, 0xAAAAAAAAAAAAAAAALL);
          double v15 = 2.26e-10;
LABEL_8:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int pinToMeasure = self->_pinToMeasure;
            *(_DWORD *)buf = 136315906;
            *(void *)__int16 v30 = "-[HalogenTypeC _doLDCMMeasurement:isReceptacleEmpty:isReceptacleWet:withWetTransitionThresh"
                             "old:withDryTransitionThreshold:measurementType:]";
            *(_WORD *)&v30[8] = 1024;
            *(_DWORD *)&v30[10] = a3;
            __int16 v31 = 1024;
            int v32 = pinToMeasure;
            __int16 v33 = 1024;
            int v34 = v10;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:%s pin:%d _pinToMeasure:%d measurementType:%d", buf, 0x1Eu);
          }
          int v17 = IOAccessoryManagerSetLDCM();
          if (!v17)
          {
            if ([(HalogenTypeC *)self powerState])
            {
              if ([(HalogenTypeC *)self powerState] == 1)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Waiting for kHalogenPowerStateAwake", buf, 2u);
                }
                [(NSCondition *)[(HalogenTypeC *)self powerStateCond] lock];
                uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
                if ([(HalogenTypeC *)self powerState] == 1)
                {
                  do
                    BOOL v19 = [(NSCondition *)self->_powerStateCond waitUntilDate:v18];
                  while ([(HalogenTypeC *)self powerState] == 1 && v19);
                }
                [(NSCondition *)[(HalogenTypeC *)self powerStateCond] unlock];
              }
              if ([(HalogenTypeC *)self powerState] == 2)
              {
                if ([(HalogenAudio *)self->_halogenAudioUnit startAudioUnit])
                {
                  uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)self->_audioTimeoutInSec];
                  [(NSCondition *)self->_audioTimeoutCond lock];
                  if (self->_isMeasurementDone)
                  {
                    [(NSCondition *)self->_audioTimeoutCond unlock];
                    [(HalogenAudio *)self->_halogenAudioUnit stopAudioUnit];
LABEL_26:
                    IOAccessoryManagerLDCMGetMeasurementStatus();
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)__int16 v30 = 789;
                      *(_WORD *)&v30[4] = 2048;
                      *(void *)&v30[6] = 0;
                      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:%d:Measurement status:%llu", buf, 0x12u);
                    }
                    IOAccessoryManagerSetLDCM();
                    [(HalogenTypeC *)self _doLDCMCalculation:v12 isReceptacleWet:v11 withWetTransitionThreshold:v10 withDryTransitionThreshold:a6 pinParasitics:a7 measurementType:v15];
                    goto LABEL_29;
                  }
                  do
                  {
                    BOOL v21 = [(NSCondition *)self->_audioTimeoutCond waitUntilDate:v20];
                    BOOL v22 = v21;
                  }
                  while (!self->_isMeasurementDone && v21);
                  [(NSCondition *)self->_audioTimeoutCond unlock];
                  [(HalogenAudio *)self->_halogenAudioUnit stopAudioUnit];
                  if (v22) {
                    goto LABEL_26;
                  }
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Timeout!", buf, 2u);
                  }
                  int v23 = 1;
                }
                else
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Could not start Halogen AudioUnit! Exiting ...", buf, 2u);
                  }
                  int v23 = 3;
                }
                goto LABEL_33;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v26 = MEMORY[0x1E4F14500];
                v27 = "HalogenTypeC:abort measurement... system is not yet awake";
                goto LABEL_48;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v26 = MEMORY[0x1E4F14500];
              v27 = "HalogenTypeC:abort measurement... system going to sleep";
LABEL_48:
              _os_log_impl(&dword_1D9622000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
            }
            int v23 = 4;
            goto LABEL_33;
          }
          int v25 = v17;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)__int16 v30 = v25;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:IOAccessoryManagerSetLDCM() failed (ret = 0x%x)", buf, 8u);
          }
          int v23 = 2;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Not an internal build, desired measurement pin SBU. Abort measurement.", buf, 2u);
          }
          int v23 = 9;
        }
LABEL_33:
        [(HalogenAudio *)self->_halogenAudioUnit releaseAudioUnitInstance];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)__int16 v30 = v23;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Setting LDCM back to Idle with HalogenReturnStatus: %u", buf, 8u);
        }
        IOAccessoryManagerSetLDCM();
        goto LABEL_36;
      default:
        double v15 = NAN;
        goto LABEL_8;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v30 = a3;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Invalid pin to measure: %d. Exiting measurement...", buf, 8u);
  }
LABEL_29:
  [(HalogenAudio *)self->_halogenAudioUnit releaseAudioUnitInstance];
  int v23 = 0;
LABEL_36:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v30 = v23;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Exiting function with HalogenReturnStatus: %u", buf, 8u);
  }
  return v23;
}

- (BOOL)_doLDCMCalculation:(BOOL)a3 isReceptacleWet:(BOOL)a4 withWetTransitionThreshold:(double)a5 withDryTransitionThreshold:(double)a6 pinParasitics:(double)a7 measurementType:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  BOOL v12 = a4;
  BOOL v13 = a3;
  uint64_t v15 = [(NSMutableData *)self->_pcmInputData bytes];
  int v16 = (double *)[(NSMutableData *)self->_voltageData bytes];
  int v17 = (double *)[(NSMutableData *)self->_currentData bytes];
  [(HalogenTypeC *)self _resetCalcValues];
  uint64_t nMeasurementSamples = self->_nMeasurementSamples;
  if ((int)nMeasurementSamples >= 1)
  {
    int v19 = 2 * self->_calibrationSampleOffsetInFrames;
    uint64_t v20 = v16;
    BOOL v21 = v17;
    do
    {
      *v20++ = *(float *)(v15 + 4 * v19);
      *v21++ = *(float *)(v15 + 4 * (v19 + 1));
      v19 += 2;
      --nMeasurementSamples;
    }
    while (nMeasurementSamples);
  }
  uint64_t v22 = [(HalogenCalcTypeC *)self->_halogenCalcTypeC doCalibration:self->_voltageData withCurrentData:self->_currentData];
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC calVoltageSNR];
  self->_calVoltageSNR = v23;
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC calCurrentSNR];
  self->_calCurrentSNR = v24;
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC calVoltageAmplitude];
  self->_calVoltageAmplitude = v25;
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC calCurrentAmplitude];
  self->_calCurrentAmplitude = v26;
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC voltageGainCorrection];
  self->_voltageGainCorrection = v27;
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC currentGainCorrection];
  self->_currentGainCorrection = v28;
  [(HalogenCalcTypeC *)self->_halogenCalcTypeC currentPhaseCompensation];
  self->_currentPhaseCompensation = v29;
  if (v22)
  {
    NSLog(&cfstr_ErrorCalibrati.isa, v22);
    int v32 = 11;
  }
  else
  {
    [(HalogenTypeC *)self _writeCalResults:@"/var/logs/calibrationData.plist"];
    uint64_t v30 = self->_nMeasurementSamples;
    if ((int)v30 >= 1)
    {
      int v31 = 2 * self->_measurementSampleOffsetInFrames;
      do
      {
        *v16++ = *(float *)(v15 + 4 * v31);
        *v17++ = *(float *)(v15 + 4 * (v31 + 1));
        v31 += 2;
        --v30;
      }
      while (v30);
    }
    int v32 = [(HalogenCalcTypeC *)self->_halogenCalcTypeC doLiquidDetection:self->_voltageData withCurrentData:self->_currentData isReceptacleEmpty:v13 isReceptacleWet:v12 withWetTransitionThreshold:v8 withDryTransitionThreshold:a5 pinParasitics:a6 measurementType:a7];
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC goertzelImpedance];
    self->_goertzelImpedance = v33;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC goertzelPhase];
    self->_goertzelPhase = v34;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC compensatedImpedance];
    self->_compensatedImpedance = v35;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC compensatedPhase];
    self->_compensatedPhase = v36;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC resistanceInOhms];
    self->_resistanceInOhms = v37;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC capacitanceInNanoF];
    self->_capacitanceInNanoF = v38;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementVoltageSignalLevel];
    self->_measurementVoltageSignalLevel = v39;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementVoltageNoiseLevel];
    self->_measurementVoltageNoiseLevel = v40;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementVoltageSNR];
    self->_measurementVoltageSNR = v41;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementCurrentSignalLevel];
    self->_measurementCurrentSignalLevel = v42;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementCurrentNoiseLevel];
    self->_measurementCurrentNoiseLevel = v43;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementCurrentSNR];
    self->_measurementCurrentSNR = v44;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementVoltageAmplitude];
    self->_measurementVoltageAmplitude = v45;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementCurrentAmplitude];
    self->_measurementCurrentAmplitude = v46;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementVoltagePhase];
    self->_measurementVoltagePhase = v47;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC measurementCurrentPhase];
    self->_measurementCurrentPhase = v48;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC loadImpedanceInOhms];
    self->_measurementLoadImpedanceMagnitude = v49;
    [(HalogenCalcTypeC *)self->_halogenCalcTypeC loadPhase];
    self->_measurementLoadImpedancePhase = v50;
  }
  self->_halogenResult = v32;
  if ((v22 - 1) <= 2) {
    self->_halogenResult = dword_1D964CE40[(int)v22 - 1];
  }
  return 1;
}

- (BOOL)setMitigations:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = IOAccessoryManagerLDCMEnableMitigations();
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v4) {
      return v3 == 0;
    }
    v9[0] = 67109120;
    v9[1] = v3;
    uint64_t v5 = MEMORY[0x1E4F14500];
    size_t v6 = "HalogenTypeC:ERROR: Could not set EnableMitigations. %d";
    uint32_t v7 = 8;
    goto LABEL_4;
  }
  if (v4)
  {
    LOWORD(v9[0]) = 0;
    uint64_t v5 = MEMORY[0x1E4F14500];
    size_t v6 = "HalogenTypeC:Mitigations Enabled: Turning off Type-C Port.";
    uint32_t v7 = 2;
LABEL_4:
    _os_log_impl(&dword_1D9622000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v9, v7);
  }
  return v3 == 0;
}

- (BOOL)setLiquidDetected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = IOAccessoryManagerLDCMSetLiquidDetected();
  BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v5) {
      return v4 == 0;
    }
    int v9 = 67109120;
    BOOL v10 = v4;
    size_t v6 = MEMORY[0x1E4F14500];
    uint32_t v7 = "HalogenTypeC:ERROR: Could not set LiquidDetected. %d";
    goto LABEL_4;
  }
  if (v5)
  {
    int v9 = 67109120;
    BOOL v10 = v3;
    size_t v6 = MEMORY[0x1E4F14500];
    uint32_t v7 = "HalogenTypeC:Liquid Detected Set:%d.";
LABEL_4:
    _os_log_impl(&dword_1D9622000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 8u);
  }
  return v4 == 0;
}

- (BOOL)_writeCalResults:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  size_t v6 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_voltageGainCorrection];
  uint32_t v7 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_currentGainCorrection];
  uint64_t v8 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_currentPhaseCompensation];
  [v5 setObject:v6 forKey:@"VoltageGainCorrection"];
  [v5 setObject:v7 forKey:@"CurrentGainCorrection"];
  [v5 setObject:v8 forKey:@"CurrentPhaseCompensation"];
  char v9 = [v5 writeToFile:a3 atomically:1];

  if ((v9 & 1) == 0) {
    NSLog(&cfstr_ErrorCouldNotW.isa);
  }
  return v9;
}

- (BOOL)_readCalibrationParameters:(id)a3
{
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:a3];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->_voltageGainCorrection = _Q0;
  self->_currentPhaseCompensation = 0.0;
  if ([v4 objectForKey:@"VoltageGainCorrection"])
  {
    objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"VoltageGainCorrection"), "doubleValue");
    self->_voltageGainCorrection = v10;
  }
  else
  {
    NSLog(&cfstr_CouldNotFindVo.isa);
  }
  if ([v4 objectForKey:@"CurrentGainCorrection"])
  {
    objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"CurrentGainCorrection"), "doubleValue");
    self->_currentGainCorrection = v11;
  }
  else
  {
    NSLog(&cfstr_CouldNotFindCu.isa);
  }
  if ([v4 objectForKey:@"CurrentPhaseCompensation"])
  {
    objc_msgSend((id)objc_msgSend(v4, "objectForKey:", @"CurrentPhaseCompensation"), "doubleValue");
    self->_currentPhaseCompensation = v12;
  }
  else
  {
    NSLog(&cfstr_CouldNotFindCu_0.isa);
  }
  return 1;
}

- (void)setWetTooLong:(BOOL)a3
{
  self->_wetTooLong = a3;
  halogenCalcTypeC = self->_halogenCalcTypeC;
  if (halogenCalcTypeC) {
    -[HalogenCalcTypeC setWetTooLong:](halogenCalcTypeC, "setWetTooLong:");
  }
}

- (id)_buildMeasurementOutputString:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  size_t v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%@\n%@\n%@\n%@\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n", objc_msgSend(v5, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")), -[HalogenTypeC _getHalogenMeasurementTypeString:](self, "_getHalogenMeasurementTypeString:", a3->var0), -[HalogenTypeC _getLDCMPinString:](self, "_getLDCMPinString:", a3->var1), -[HalogenTypeC getHalogenResultString:](self, "getHalogenResultString:", a3->var2), *(void *)&a3->var3, *(void *)&a3->var4, *(void *)&a3->var5, *(void *)&a3->var16, *(void *)&a3->var17, *(void *)&a3->var18, a3->var19 * 10000000.0, *(void *)&a3->var20, *(void *)&a3->var21,
                 *(void *)&a3->var10,
                 *(void *)&a3->var11,
                 *(void *)&a3->var14,
                 *(void *)&a3->var15,
                 *(void *)&a3->var22,
                 *(void *)&a3->var23);

  return v6;
}

- (id)_buildVerboseMeasurementOutputString:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  size_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"TimeStamp,%@\nMeasurementType,%@\nMeasurementPin,%@\nMeasurementResult,%@\nVolGainCorrection,%.12f\nCurGainCorrection,%.12f\nCurPhaseCompensation,%.12f\nVolSNR,%.12f\nCurSNR,%.12f\nVolAmplitude,%.12f\nCurAmplitudeMicroA,%.12f\nVolPhase,%.12f\nCurPhase,%.12f\nGoertzelImpedance,%.12f\nGoertzelPhase,%.12f\nResistanceInOhms,%.12f\nCapacitanceInNanoF,%.12f\nLoadImpedenceMagnitude,%.12f\nLoadImpedancePhase,%.12f\n", objc_msgSend(v5, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")), -[HalogenTypeC _getHalogenMeasurementTypeString:](self, "_getHalogenMeasurementTypeString:", a3->var0), -[HalogenTypeC _getLDCMPinString:](self, "_getLDCMPinString:", a3->var1), -[HalogenTypeC getHalogenResultString:](self, "getHalogenResultString:", a3->var2), *(void *)&a3->var3, *(void *)&a3->var4, *(void *)&a3->var5, *(void *)&a3->var16, *(void *)&a3->var17, *(void *)&a3->var18, a3->var19 * 10000000.0, *(void *)&a3->var20, *(void *)&a3->var21,
                 *(void *)&a3->var10,
                 *(void *)&a3->var11,
                 *(void *)&a3->var14,
                 *(void *)&a3->var15,
                 *(void *)&a3->var22,
                 *(void *)&a3->var23);

  return v6;
}

- (id)getVerboseMeasurementOutputString
{
  id v2 = [(HalogenTypeC *)self _buildVerboseMeasurementOutputString:&self->_measurementInfoDefault];
  return (id)[v2 copy];
}

- (id)getMeasurementOutputString
{
  return self->_measurementInfoOutputString;
}

- (void)_storeMeasurementData:(int)a3 measurementType:(int)a4 measurementInfo:(id *)a5 halogenResult:(int)a6
{
  a5->var0 = a4;
  a5->var1 = a3;
  a5->var2 = a6;
  [(HalogenTypeC *)self voltageGainCorrection];
  a5->var3 = v8;
  [(HalogenTypeC *)self currentGainCorrection];
  a5->var4 = v9;
  [(HalogenTypeC *)self calVoltageSNR];
  a5->var6 = v10;
  [(HalogenTypeC *)self calCurrentSNR];
  a5->var7 = v11;
  [(HalogenTypeC *)self calVoltageAmplitude];
  a5->var8 = v12;
  [(HalogenTypeC *)self calCurrentAmplitude];
  a5->var9 = v13;
  [(HalogenTypeC *)self currentPhaseCompensation];
  a5->var5 = v14;
  [(HalogenTypeC *)self measurementVoltageSNR];
  a5->var16 = v15;
  [(HalogenTypeC *)self measurementCurrentSNR];
  a5->var17 = v16;
  [(HalogenTypeC *)self measurementVoltageAmplitude];
  a5->var18 = v17;
  [(HalogenTypeC *)self measurementCurrentAmplitude];
  a5->var19 = v18;
  [(HalogenTypeC *)self measurementVoltagePhase];
  a5->var20 = v19;
  [(HalogenTypeC *)self measurementCurrentPhase];
  a5->var21 = v20;
  [(HalogenTypeC *)self goertzelImpedance];
  a5->var10 = v21;
  [(HalogenTypeC *)self goertzelPhase];
  a5->var11 = v22;
  [(HalogenTypeC *)self resistanceInOhms];
  a5->var14 = v23;
  [(HalogenTypeC *)self capacitanceInNanoF];
  a5->var15 = v24;
  [(HalogenTypeC *)self measurementLoadImpedanceMagnitude];
  a5->var22 = v25;
  [(HalogenTypeC *)self measurementLoadImpedancePhase];
  a5->var23 = v26;
}

- (id)getHalogenResultString:(int)a3
{
  if (a3 > 0xB) {
    return @"Unknown";
  }
  else {
    return off_1E6B6D5C0[a3];
  }
}

- (id)_getHalogenMeasurementTypeString:(int)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B6D620[a3];
  }
}

- (id)_getLDCMPinString:(int)a3
{
  if (a3 > 4) {
    return @"Undefined";
  }
  else {
    return off_1E6B6D638[a3];
  }
}

- (void)_resetCalcValues
{
  self->_calVoltageSNR = 0.0;
  self->_measurementVoltageSNR = 0.0;
  self->_measurementCurrentSNR = 0.0;
  self->_currentGainCorrection = 0.0;
  self->_currentPhaseCompensation = 0.0;
  self->_voltageGainCorrection = 0.0;
  *(_OWORD *)&self->_calCurrentSNR = 0u;
  *(_OWORD *)&self->_calCurrentAmplitude = 0u;
  *(_OWORD *)&self->_goertzelPhase = 0u;
  *(_OWORD *)&self->_compensatedPhase = 0u;
  self->_capacitanceInNanoF = 0.0;
  *(_OWORD *)&self->_measurementVoltageAmplitude = 0u;
  *(_OWORD *)&self->_measurementVoltagePhase = 0u;
  *(_OWORD *)&self->_measurementLoadImpedanceMagnitude = 0u;
}

- ($DE2CA4548F4C2DB4D89410195F9427A4)getMeasurementInfo
{
  retstr->var23 = self[3].var23;
  long long v3 = *(_OWORD *)&self[3].var19;
  *(_OWORD *)&retstr->var17 = *(_OWORD *)&self[3].var17;
  *(_OWORD *)&retstr->var19 = v3;
  *(_OWORD *)&retstr->var21 = *(_OWORD *)&self[3].var21;
  long long v4 = *(_OWORD *)&self[3].var11;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[3].var9;
  *(_OWORD *)&retstr->var11 = v4;
  long long v5 = *(_OWORD *)&self[3].var15;
  *(_OWORD *)&retstr->var13 = *(_OWORD *)&self[3].var13;
  *(_OWORD *)&retstr->var15 = v5;
  long long v6 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var3 = v6;
  long long v7 = *(_OWORD *)&self[3].var7;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->var7 = v7;
  return self;
}

- (BOOL)isHWSelfTestCapable
{
  return self->_selfTestCapable;
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

- (double)calVoltageAmplitude
{
  return self->_calVoltageAmplitude;
}

- (double)calCurrentAmplitude
{
  return self->_calCurrentAmplitude;
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

- (double)measurementVoltageAmplitude
{
  return self->_measurementVoltageAmplitude;
}

- (double)measurementCurrentAmplitude
{
  return self->_measurementCurrentAmplitude;
}

- (double)measurementVoltagePhase
{
  return self->_measurementVoltagePhase;
}

- (double)measurementCurrentPhase
{
  return self->_measurementCurrentPhase;
}

- (double)measurementLoadImpedanceMagnitude
{
  return self->_measurementLoadImpedanceMagnitude;
}

- (double)measurementLoadImpedancePhase
{
  return self->_measurementLoadImpedancePhase;
}

- (BOOL)wetTooLong
{
  return self->_wetTooLong;
}

- (int)halogenResult
{
  return self->_halogenResult;
}

- (int)nInputChannels
{
  return self->_nInputChannels;
}

- (void)setNInputChannels:(int)a3
{
  self->_nInputChannels = a3;
}

- (int)nOutputChannels
{
  return self->_nOutputChannels;
}

- (void)setNOutputChannels:(int)a3
{
  self->_nOutputChannels = a3;
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
  self->_inputFrameSizeInBytes = a3;
}

- (int)outputFrameSizeInBytes
{
  return self->_outputFrameSizeInBytes;
}

- (void)setOutputFrameSizeInBytes:(int)a3
{
  self->_outputFrameSizeInBytes = a3;
}

- (OpaqueAudioComponentInstance)audioComponentInst
{
  return self->_audioComponentInst;
}

- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3
{
  self->_audioComponentInst = a3;
}

- (HalogenAudio)halogenAudioUnit
{
  return self->_halogenAudioUnit;
}

- (void)setHalogenAudioUnit:(id)a3
{
  self->_halogenAudioUnit = (HalogenAudio *)a3;
}

- (int)warmupTimeInMs
{
  return self->_warmupTimeInMs;
}

- (void)setWarmupTimeInMs:(int)a3
{
  self->_warmupTimeInMs = a3;
}

- (int)AceSettlingTimeInMs
{
  return self->_AceSettlingTimeInMs;
}

- (void)setAceSettlingTimeInMs:(int)a3
{
  self->_AceSettlingTimeInMs = a3;
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

- (int)nAceSettlingSamples
{
  return self->_nAceSettlingSamples;
}

- (void)setNAceSettlingSamples:(int)a3
{
  self->_nAceSettlingSamples = a3;
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

- (unsigned)maxOutputAmplitude
{
  return self->_maxOutputAmplitude;
}

- (unsigned)signalOffset
{
  return self->_signalOffset;
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
  self->_int pcmInputDataMaxSzInBytes = a3;
}

- (int)pcmInputDataIndexInBytes
{
  return self->_pcmInputDataIndexInBytes;
}

- (void)setPcmInputDataIndexInBytes:(int)a3
{
  self->_int pcmInputDataIndexInBytes = a3;
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

- (BOOL)selfTestCapable
{
  return self->_selfTestCapable;
}

- (void)setSelfTestCapable:(BOOL)a3
{
  self->_selfTestCapable = a3;
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
  self->_int pcmOutputDataMaxSzInBytes = a3;
}

- (int)pcmOutputDataIndexInBytes
{
  return self->_pcmOutputDataIndexInBytes;
}

- (void)setPcmOutputDataIndexInBytes:(int)a3
{
  self->_uint64_t pcmOutputDataIndexInBytes = a3;
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

- (HalogenCalcTypeC)halogenCalcTypeC
{
  return self->_halogenCalcTypeC;
}

- (void)setHalogenCalcTypeC:(id)a3
{
  self->_halogenCalcTypeC = (HalogenCalcTypeC *)a3;
}

- ($DE2CA4548F4C2DB4D89410195F9427A4)measurementInfoDefault
{
  retstr->var23 = self[3].var23;
  long long v3 = *(_OWORD *)&self[3].var19;
  *(_OWORD *)&retstr->var17 = *(_OWORD *)&self[3].var17;
  *(_OWORD *)&retstr->var19 = v3;
  *(_OWORD *)&retstr->var21 = *(_OWORD *)&self[3].var21;
  long long v4 = *(_OWORD *)&self[3].var11;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[3].var9;
  *(_OWORD *)&retstr->var11 = v4;
  long long v5 = *(_OWORD *)&self[3].var15;
  *(_OWORD *)&retstr->var13 = *(_OWORD *)&self[3].var13;
  *(_OWORD *)&retstr->var15 = v5;
  long long v6 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var3 = v6;
  long long v7 = *(_OWORD *)&self[3].var7;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->var7 = v7;
  return self;
}

- (void)setMeasurementInfoDefault:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var3;
  long long v5 = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_measurementInfoDefault.currentPhaseCompensation = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_measurementInfoDefault.calCurrentSNR = v5;
  *(_OWORD *)&self->_measurementInfoDefault.type = v3;
  *(_OWORD *)&self->_measurementInfoDefault.voltageGainCorrection = v4;
  long long v6 = *(_OWORD *)&a3->var9;
  long long v7 = *(_OWORD *)&a3->var11;
  long long v8 = *(_OWORD *)&a3->var15;
  *(_OWORD *)&self->_measurementInfoDefault.compensatedPhase = *(_OWORD *)&a3->var13;
  *(_OWORD *)&self->_measurementInfoDefault.capacitanceInNanoF = v8;
  *(_OWORD *)&self->_measurementInfoDefault.calCurrentAmplitude = v6;
  *(_OWORD *)&self->_measurementInfoDefault.goertzelPhase = v7;
  long long v9 = *(_OWORD *)&a3->var17;
  long long v10 = *(_OWORD *)&a3->var19;
  long long v11 = *(_OWORD *)&a3->var21;
  self->_measurementInfoDefault.measurementLoadImpedancePhase = a3->var23;
  *(_OWORD *)&self->_measurementInfoDefault.measurementCurrentAmplitude = v10;
  *(_OWORD *)&self->_measurementInfoDefault.measurementCurrentPhase = v11;
  *(_OWORD *)&self->_measurementInfoDefault.measurementCurrentSNR = v9;
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

- (BOOL)measureSBU
{
  return self->_measureSBU;
}

- (void)setMeasureSBU:(BOOL)a3
{
  self->_measureSBU = a3;
}

- (int)pinToMeasure
{
  return self->_pinToMeasure;
}

- (void)setPinToMeasure:(int)a3
{
  self->_int pinToMeasure = a3;
}

- (int)ldcmState
{
  return self->_ldcmState;
}

- (void)setLdcmState:(int)a3
{
  self->_ldcmState = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSMutableString)measurementInfoOutputString
{
  return self->_measurementInfoOutputString;
}

- (void)setMeasurementInfoOutputString:(id)a3
{
  self->_measurementInfoOutputString = (NSMutableString *)a3;
}

- (NSMutableString)measurementInfoAcchalogenOutputString
{
  return self->_measurementInfoAcchalogenOutputString;
}

- (void)setMeasurementInfoAcchalogenOutputString:(id)a3
{
  self->_measurementInfoAcchalogenOutputString = (NSMutableString *)a3;
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

@end