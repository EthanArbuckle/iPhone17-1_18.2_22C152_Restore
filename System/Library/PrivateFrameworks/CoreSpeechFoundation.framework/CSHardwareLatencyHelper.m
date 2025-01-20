@interface CSHardwareLatencyHelper
+ (id)sharedInstance;
- (BOOL)_valuesAreMinimalyValidForInfoDictionary:(id)a3 type:(unint64_t)a4;
- (BOOL)addHWLatencyToOption:(id)a3 withCorrection:(double)a4 streamHandle:(unint64_t)a5 voiceController:(id)a6;
- (id)_adjustmentSecondsFromLatencyInfo:(id)a3 error:(id *)a4;
- (id)_hardwareLatenciesUsingStreamHandle:(unint64_t)a3 andVoiceController:(id)a4;
- (id)_hardwareLatencyAdjustmentSeconds:(id)a3 hwLatencyType:(unint64_t)a4 error:(id *)a5;
- (id)_hardwareLatencyAdjustmentSecondsUsingStreamHandle:(unint64_t)a3 andVoiceController:(id)a4;
@end

@implementation CSHardwareLatencyHelper

- (BOOL)_valuesAreMinimalyValidForInfoDictionary:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    v7 = (void *)MEMORY[0x1E4F152B8];
  }
  else
  {
    if (a4 != 2)
    {
LABEL_7:
      char isKindOfClass = 0;
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1E4F152C0];
  }
  uint64_t v8 = [v5 objectForKey:*v7];
  if (!v8) {
    goto LABEL_7;
  }
  v9 = (void *)v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

LABEL_8:
  return isKindOfClass & 1;
}

- (id)_hardwareLatencyAdjustmentSeconds:(id)a3 hwLatencyType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (!v8)
  {
    if (!a5) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = &unk_1F13B7F60;
LABEL_14:
    [v10 errorWithDomain:@"com.apple.corespeech" code:114 userInfo:v11];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (![(CSHardwareLatencyHelper *)self _valuesAreMinimalyValidForInfoDictionary:v8 type:a4])
  {
    if (!a5) {
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = &unk_1F13B7F88;
    goto LABEL_14;
  }
  if (a4 == 1)
  {
    v9 = (id *)MEMORY[0x1E4F152B8];
    goto LABEL_11;
  }
  if (a4 == 2)
  {
    v9 = (id *)MEMORY[0x1E4F152C0];
LABEL_11:
    id v12 = *v9;
    v13 = [v8 objectForKey:v12];
    v14 = NSNumber;
    [v13 floatValue];
    v15 = objc_msgSend(v14, "numberWithFloat:");

    goto LABEL_16;
  }
  if (a5)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = &unk_1F13B7FB0;
    goto LABEL_14;
  }
LABEL_15:
  v15 = 0;
LABEL_16:

  return v15;
}

- (id)_adjustmentSecondsFromLatencyInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v20 = 0;
  v7 = [(CSHardwareLatencyHelper *)self _hardwareLatencyAdjustmentSeconds:v6 hwLatencyType:2 error:&v20];
  id v8 = v20;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
      id v9 = v8;
      v10 = 0;
      *a4 = v9;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    id v19 = 0;
    v11 = [(CSHardwareLatencyHelper *)self _hardwareLatencyAdjustmentSeconds:v6 hwLatencyType:1 error:&v19];
    id v12 = v19;
    id v9 = v12;
    if (v12)
    {
      v10 = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      v13 = NSNumber;
      [v7 floatValue];
      float v15 = v14;
      [v11 floatValue];
      *(float *)&double v17 = v15 - v16;
      v10 = [v13 numberWithFloat:v17];
    }
  }
  return v10;
}

- (id)_hardwareLatenciesUsingStreamHandle:(unint64_t)a3 andVoiceController:(id)a4
{
  id v5 = a4;
  uint64_t v13 = 0;
  float v14 = &v13;
  uint64_t v15 = 0x3032000000;
  float v16 = __Block_byref_object_copy__3123;
  double v17 = __Block_byref_object_dispose__3124;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke;
  v9[3] = &unk_1E6200FE0;
  id v6 = v5;
  v11 = &v13;
  unint64_t v12 = a3;
  id v10 = v6;
  +[CSUtils withElapsedTimeLogging:@"CRFetchCarPlayCapabilities" execute:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke_2;
  v8[3] = &unk_1E61FF638;
  v4 = (void *)a1[4];
  uint64_t v10 = a1[5];
  id v5 = v2;
  id v9 = v5;
  [v4 getDeviceLatenciesForStream:v3 withCompletion:v8];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v12 = "-[CSHardwareLatencyHelper _hardwareLatenciesUsingStreamHandle:andVoiceController:]_block_invoke";
      _os_log_fault_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_FAULT, "%s AVVC getDeviceLatenciesForStream:withCompletion timed out", buf, 0xCu);
    }
  }
}

void __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v9 = v8;
      uint64_t v10 = [v7 localizedDescription];
      int v11 = 136315394;
      unint64_t v12 = "-[CSHardwareLatencyHelper _hardwareLatenciesUsingStreamHandle:andVoiceController:]_block_invoke_2";
      __int16 v13 = 2112;
      float v14 = v10;
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s getDeviceLatenciesForStream error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_hardwareLatencyAdjustmentSecondsUsingStreamHandle:(unint64_t)a3 andVoiceController:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(CSHardwareLatencyHelper *)self _hardwareLatenciesUsingStreamHandle:a3 andVoiceController:a4];
  id v12 = 0;
  id v6 = [(CSHardwareLatencyHelper *)self _adjustmentSecondsFromLatencyInfo:v5 error:&v12];
  id v7 = v12;
  if (v7)
  {
    id v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v8;
      int v11 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315650;
      float v14 = "-[CSHardwareLatencyHelper _hardwareLatencyAdjustmentSecondsUsingStreamHandle:andVoiceController:]";
      __int16 v15 = 2114;
      float v16 = v5;
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Error getting adjustment for hardware latency. infoDict=%{public}@; err=%{public}@",
        buf,
        0x20u);
    }
  }

  return v6;
}

- (BOOL)addHWLatencyToOption:(id)a3 withCorrection:(double)a4 streamHandle:(unint64_t)a5 voiceController:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = [(CSHardwareLatencyHelper *)self _hardwareLatencyAdjustmentSecondsUsingStreamHandle:a5 andVoiceController:a6];
  id v12 = v11;
  if (v11 && ([v11 isEqualToNumber:&unk_1F13B8248] & 1) == 0)
  {
    [v12 floatValue];
    double v16 = v15;
    float v17 = v15 + a4;
    double v18 = v17;
    uint64_t v19 = [MEMORY[0x1E4F15400] hostTimeForSeconds:v17];
    id v20 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136316162;
      v23 = "-[CSHardwareLatencyHelper addHWLatencyToOption:withCorrection:streamHandle:voiceController:]";
      __int16 v24 = 2050;
      double v25 = v18;
      __int16 v26 = 2050;
      uint64_t v27 = v19;
      __int16 v28 = 2048;
      double v29 = v16;
      __int16 v30 = 2048;
      double v31 = a4;
      _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Applying adjustment for hardware latency %{public}f secs, %{public}llu ticks (AVF=%f Correction=%f)", (uint8_t *)&v22, 0x34u);
    }
    [v10 adjustStartRecordingHostTime:v19];
    BOOL v14 = 1;
  }
  else
  {
    __int16 v13 = CSLogContextFacilityCoreSpeech;
    BOOL v14 = 0;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      v23 = "-[CSHardwareLatencyHelper addHWLatencyToOption:withCorrection:streamHandle:voiceController:]";
      __int16 v24 = 2112;
      double v25 = *(double *)&v12;
      _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s No adjustment for hardware latency to apply. avfLatencySeconds = %@", (uint8_t *)&v22, 0x16u);
      BOOL v14 = 0;
    }
  }

  return v14;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3142 != -1) {
    dispatch_once(&sharedInstance_onceToken_3142, &__block_literal_global_3143);
  }
  dispatch_semaphore_t v2 = (void *)sharedInstance_sharedInstance_3144;
  return v2;
}

uint64_t __41__CSHardwareLatencyHelper_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_3144 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end