@interface CSPowerLogger
+ (id)sharedPowerLogger;
- (BOOL)selfTriggerSuppressionIsPhoneCallConnected;
- (CSPowerLogger)init;
- (OS_dispatch_queue)queue;
- (double)selfTriggerSuppressionStartTime;
- (unint64_t)numSelfTriggersInInterval;
- (unint64_t)selfTriggerSuppressionAudioSource;
- (unint64_t)selfTriggerSuppressionPlaybackRoute;
- (void)_borealisPowerlog:(id)a3;
- (void)_configPowerlog:(id)a3;
- (void)_emitSelfTriggerSuppressionToBiomeWithStsDuration:(double)a3;
- (void)_updateConfigToPreferencesWithLanguage:(id)a3 withModelVersion:(id)a4;
- (void)powerLogSecondPassWithResult:(unint64_t)a3 withSecondPassScore:(float)a4 withPhId:(unint64_t)a5;
- (void)powerLogSelfTriggerSuppressionDetectedWithSpeakerType:(unint64_t)a3 withAudioSource:(unint64_t)a4 atTime:(double)a5 isPhoneCall:(BOOL)a6;
- (void)powerLogSelfTriggerSuppressionStartWithSpeakerType:(unint64_t)a3 withAudioSource:(unint64_t)a4 atTime:(double)a5 isPhoneCall:(BOOL)a6;
- (void)powerLogSelfTriggerSuppressionStopAtTime:(double)a3;
- (void)powerLogSiriConfigWithVoiceTriggerEnabled:(BOOL)a3 withLanguage:(id)a4 withModelVersion:(id)a5;
- (void)powerLogVoiceTriggerStart;
- (void)powerLogVoiceTriggerStop;
- (void)powerWithNumFalseWakeup:(unint64_t)a3 withDuration:(double)a4 withPhraseDict:(id)a5;
- (void)setNumSelfTriggersInInterval:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSelfTriggerSuppressionAudioSource:(unint64_t)a3;
- (void)setSelfTriggerSuppressionIsPhoneCallConnected:(BOOL)a3;
- (void)setSelfTriggerSuppressionPlaybackRoute:(unint64_t)a3;
- (void)setSelfTriggerSuppressionStartTime:(double)a3;
@end

@implementation CSPowerLogger

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSelfTriggerSuppressionIsPhoneCallConnected:(BOOL)a3
{
  self->_selfTriggerSuppressionIsPhoneCallConnected = a3;
}

- (BOOL)selfTriggerSuppressionIsPhoneCallConnected
{
  return self->_selfTriggerSuppressionIsPhoneCallConnected;
}

- (void)setNumSelfTriggersInInterval:(unint64_t)a3
{
  self->_numSelfTriggersInInterval = a3;
}

- (unint64_t)numSelfTriggersInInterval
{
  return self->_numSelfTriggersInInterval;
}

- (void)setSelfTriggerSuppressionStartTime:(double)a3
{
  self->_selfTriggerSuppressionStartTime = a3;
}

- (double)selfTriggerSuppressionStartTime
{
  return self->_selfTriggerSuppressionStartTime;
}

- (void)setSelfTriggerSuppressionAudioSource:(unint64_t)a3
{
  self->_selfTriggerSuppressionAudioSource = a3;
}

- (unint64_t)selfTriggerSuppressionAudioSource
{
  return self->_selfTriggerSuppressionAudioSource;
}

- (void)setSelfTriggerSuppressionPlaybackRoute:(unint64_t)a3
{
  self->_selfTriggerSuppressionPlaybackRoute = a3;
}

- (unint64_t)selfTriggerSuppressionPlaybackRoute
{
  return self->_selfTriggerSuppressionPlaybackRoute;
}

- (void)_emitSelfTriggerSuppressionToBiomeWithStsDuration:(double)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  selfTriggerSuppressionPlaybackRoute = self->_selfTriggerSuppressionPlaybackRoute;
  selfTriggerSuppressionAudioSource = self->_selfTriggerSuppressionAudioSource;
  if (selfTriggerSuppressionAudioSource) {
    uint64_t v7 = 2 * (selfTriggerSuppressionAudioSource == 1);
  }
  else {
    uint64_t v7 = 1;
  }
  BOOL v8 = selfTriggerSuppressionPlaybackRoute == 2;
  BOOL v9 = selfTriggerSuppressionPlaybackRoute == 1;
  id v10 = objc_alloc(MEMORY[0x1E4F50138]);
  v11 = [NSNumber numberWithUnsignedLongLong:self->_numSelfTriggersInInterval];
  v12 = [NSNumber numberWithDouble:a3];
  v13 = [NSNumber numberWithBool:v8];
  v14 = [NSNumber numberWithBool:v9];
  v15 = (void *)[v10 initWithNumSelfTriggersDetectedDuringEvent:v11 durationOfSelfTriggerEventInSec:v12 audioSource:v7 isBluetoothSpeakerActive:v13 isBuiltInSpeakerActive:v14];

  v16 = BiomeLibrary();
  v17 = [v16 Siri];
  v18 = [v17 SelfTriggerSuppression];

  v19 = [v18 source];
  v20 = [MEMORY[0x1E4F1C9C8] date];
  [v19 sendEvent:v15];
  v21 = [MEMORY[0x1E4F1C9C8] date];
  v22 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    [v21 timeIntervalSinceDate:v20];
    int v25 = 136315394;
    v26 = "-[CSPowerLogger _emitSelfTriggerSuppressionToBiomeWithStsDuration:]";
    __int16 v27 = 2050;
    uint64_t v28 = v24;
    _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s BMSource sentEvent elapsed time = %{public}lf", (uint8_t *)&v25, 0x16u);
  }
}

- (void)_updateConfigToPreferencesWithLanguage:(id)a3 withModelVersion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[CSFPreferences sharedPreferences];
  [v7 setPowerLoggingCurrentLanguage:v6];

  id v8 = +[CSFPreferences sharedPreferences];
  [v8 setPowerLoggingCurrentAssetConfigVersion:v5];
}

- (void)_configPowerlog:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (PLShouldLogRegisteredEvent())
  {
    PLLogRegisteredEvent();
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[CSPowerLogger _configPowerlog:]";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s PowerLog : SiriConfig %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_borealisPowerlog:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (PLShouldLogRegisteredEvent())
  {
    PLLogRegisteredEvent();
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      id v6 = "-[CSPowerLogger _borealisPowerlog:]";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s PowerLog : Borealis %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)powerLogSelfTriggerSuppressionStopAtTime:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CSPowerLogger_powerLogSelfTriggerSuppressionStopAtTime___block_invoke;
  v4[3] = &unk_1E6201378;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __58__CSPowerLogger_powerLogSelfTriggerSuppressionStopAtTime___block_invoke(uint64_t result)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v1 = *(double *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  double v3 = *(double *)(v2 + 32);
  if (v1 >= v3)
  {
    uint64_t v4 = result;
    double v5 = v1 - v3;
    id v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(v2 + 16);
      uint64_t v8 = *(void *)(v2 + 24);
      int v9 = *(unsigned __int8 *)(v2 + 8);
      *(_DWORD *)buf = 136316162;
      v20 = "-[CSPowerLogger powerLogSelfTriggerSuppressionStopAtTime:]_block_invoke";
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      double v26 = v5;
      __int16 v27 = 1024;
      int v28 = v9;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_INFO, "%s PowerLog : SelfTriggerSuppressionEvent for playBackRoute: %lu, audioSource: %lu, duration: %f, _selfTriggerSuppressionIsPhoneCallConnected: %d", buf, 0x30u);
      uint64_t v2 = *(void *)(v4 + 32);
    }
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(v2 + 16), @"AudioPlaybackRouteType");
    v18[0] = v10;
    v17[1] = @"AudioSourceType";
    v11 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(v4 + 32) + 24)];
    v18[1] = v11;
    v17[2] = @"StartTime";
    v12 = [NSNumber numberWithDouble:*(double *)(*(void *)(v4 + 32) + 32)];
    v18[2] = v12;
    v17[3] = @"StopTime";
    v13 = [NSNumber numberWithDouble:*(double *)(v4 + 40)];
    v18[3] = v13;
    v17[4] = @"DurationSec";
    v14 = [NSNumber numberWithDouble:v5];
    v18[4] = v14;
    v17[5] = @"NumSelfTriggersInInterval";
    v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(v4 + 32) + 40)];
    v18[5] = v15;
    v17[6] = @"PhoneCallConnected";
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(v4 + 32) + 8)];
    v18[6] = v16;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];
    PLLogRegisteredEvent();

    result = [*(id *)(v4 + 32) _emitSelfTriggerSuppressionToBiomeWithStsDuration:v5];
    *(void *)(*(void *)(v4 + 32) + 40) = 0;
    *(void *)(*(void *)(v4 + 32) + 32) = 0x7FEFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)powerLogSelfTriggerSuppressionStartWithSpeakerType:(unint64_t)a3 withAudioSource:(unint64_t)a4 atTime:(double)a5 isPhoneCall:(BOOL)a6
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__CSPowerLogger_powerLogSelfTriggerSuppressionStartWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke;
  block[3] = &unk_1E6200F68;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  *(double *)&block[7] = a5;
  BOOL v8 = a6;
  dispatch_async(queue, block);
}

double __103__CSPowerLogger_powerLogSelfTriggerSuppressionStartWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
  double result = *(double *)(a1 + 56);
  *(double *)(*(void *)(a1 + 32) + 32) = result;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 64);
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  return result;
}

- (void)powerLogSelfTriggerSuppressionDetectedWithSpeakerType:(unint64_t)a3 withAudioSource:(unint64_t)a4 atTime:(double)a5 isPhoneCall:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v21 = "-[CSPowerLogger powerLogSelfTriggerSuppressionDetectedWithSpeakerType:withAudioSource:atTime:isPhoneCall:]";
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_INFO, "%s PowerLog : SelfTriggerSuppressionDetected", buf, 0xCu);
  }
  v18[0] = @"AudioPlaybackRouteType";
  v12 = [NSNumber numberWithUnsignedInteger:a3];
  v19[0] = v12;
  v18[1] = @"AudioSourceType";
  v13 = [NSNumber numberWithUnsignedInteger:a4];
  v19[1] = v13;
  v18[2] = @"DetectedTime";
  v14 = [NSNumber numberWithDouble:a5];
  v19[2] = v14;
  v18[3] = @"PhoneCallConnected";
  v15 = [NSNumber numberWithBool:v6];
  v19[3] = v15;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  PLLogRegisteredEvent();

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__CSPowerLogger_powerLogSelfTriggerSuppressionDetectedWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __106__CSPowerLogger_powerLogSelfTriggerSuppressionDetectedWithSpeakerType_withAudioSource_atTime_isPhoneCall___block_invoke(uint64_t result)
{
  return result;
}

- (void)powerLogSecondPassWithResult:(unint64_t)a3 withSecondPassScore:(float)a4 withPhId:(unint64_t)a5
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"secondPassState";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  v12[0] = v7;
  v11[1] = @"secondPassScore";
  *(float *)&double v8 = a4;
  int v9 = [NSNumber numberWithFloat:v8];
  v12[1] = v9;
  v11[2] = @"phID";
  id v10 = [NSNumber numberWithUnsignedInteger:a5];
  v12[2] = v10;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  PLLogRegisteredEvent();
}

- (void)powerLogSiriConfigWithVoiceTriggerEnabled:(BOOL)a3 withLanguage:(id)a4 withModelVersion:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  [(CSPowerLogger *)self _updateConfigToPreferencesWithLanguage:v11 withModelVersion:v8];
  int v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = [NSNumber numberWithBool:v6];
  [v9 setObject:v10 forKey:@"HeySiriEnabled"];

  if (v11) {
    [v9 setObject:v11 forKey:@"Language"];
  }
  if (v8) {
    [v9 setObject:v8 forKey:@"ModelVersion"];
  }
  [(CSPowerLogger *)self _configPowerlog:v9];
}

- (void)powerWithNumFalseWakeup:(unint64_t)a3 withDuration:(double)a4 withPhraseDict:(id)a5
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"numFalseWakeUp";
  uint64_t v7 = NSNumber;
  id v8 = a5;
  int v9 = [v7 numberWithUnsignedLongLong:a3];
  v12[0] = v9;
  v11[1] = @"secondsSinceLastReport";
  id v10 = [NSNumber numberWithDouble:a4];
  v11[2] = @"phraseDict";
  v12[1] = v10;
  v12[2] = v8;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  PLLogRegisteredEvent();
}

- (void)powerLogVoiceTriggerStop
{
}

- (void)powerLogVoiceTriggerStart
{
}

- (CSPowerLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSPowerLogger;
  uint64_t v2 = [(CSPowerLogger *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSPowerLogger queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_selfTriggerSuppressionStartTime = 1.79769313e308;
    v2->_numSelfTriggersInInterval = 0;
  }
  return v2;
}

+ (id)sharedPowerLogger
{
  if (sharedPowerLogger_onceToken != -1) {
    dispatch_once(&sharedPowerLogger_onceToken, &__block_literal_global_12385);
  }
  uint64_t v2 = (void *)sharedPowerLogger_sharedLogger;
  return v2;
}

uint64_t __34__CSPowerLogger_sharedPowerLogger__block_invoke()
{
  sharedPowerLogger_sharedLogger = objc_alloc_init(CSPowerLogger);
  return MEMORY[0x1F41817F8]();
}

@end