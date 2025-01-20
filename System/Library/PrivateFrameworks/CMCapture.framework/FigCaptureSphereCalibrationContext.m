@interface FigCaptureSphereCalibrationContext
+ (id)calibrationDataStringForInternalLogging:(id)a3;
+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3;
+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3;
+ (void)initialize;
+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3;
- (FigCaptureSphereCalibrationContext)initWithSupportedDeviceNames:(id)a3;
- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5;
@end

@implementation FigCaptureSphereCalibrationContext

+ (void)initialize
{
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v4 = 0;
  memset(v3, 0, sizeof(v3));
  [a3 getBytes:v3 length:68];
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  BOOL v40 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = +[BWAggdDataReporter sharedInstance];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x1EFA6EDE0), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", @"com.apple.coremedia.camera.sph.fieldcal.time.s", 0, 0, 0, 0, 0);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v46;
      uint64_t v39 = *MEMORY[0x1E4F52DD8];
      uint64_t v37 = (uint64_t)a5;
      uint64_t v38 = *MEMORY[0x1E4F52DF0];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v46 != v10) {
            objc_enumerationMutation(a3);
          }
          v12 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (([v12 isEqualToString:0x1EFA54160] & 1) != 0
            || [v12 isEqualToString:0x1EFA54180])
          {
            uint64_t v13 = [a3 objectForKeyedSubscript:v12];
            if (v13)
            {
              v14 = (void *)v13;
              if ([v12 isEqualToString:0x1EFA54160]) {
                uint64_t v15 = 1;
              }
              else {
                uint64_t v15 = 2;
              }
              int v16 = [v12 isEqualToString:0x1EFA54160];
              unsigned int v53 = 0;
              if (v16) {
                uint64_t v17 = v39;
              }
              else {
                uint64_t v17 = v38;
              }
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              [v14 getBytes:&v49 length:68];
              uint64_t v18 = *(void *)((char *)&v49 + 4);
              float v20 = *((float *)&v50 + 3);
              float v19 = *(float *)&v51;
              float v21 = *((float *)&v49 + 3);
              float v41 = *((float *)&v49 + 1);
              float v42 = *(float *)&v50;
              unsigned int v22 = DWORD2(v51);
              float v23 = *((float *)&v51 + 1);
              unsigned int v24 = DWORD2(v50);
              float v25 = *((float *)&v50 + 1);
              float v43 = *((float *)&v51 + 2);
              float v44 = *((float *)&v50 + 2);
              uint64_t v26 = v53;
              v27 = +[BWAggdDataReporter sharedInstance];
              *(float *)&double v28 = v41;
              *(float *)&double v29 = v20;
              LODWORD(v30) = HIDWORD(v18);
              *(float *)&double v31 = v19;
              *(float *)&double v32 = v21;
              *(float *)&double v33 = v42;
              *(float *)&double v34 = v23;
              *(float *)&double v35 = v25;
              -[BWAggdDataReporter reportSphereCalibrationForPosition:freqX:deltaFreqX:qX:deltaQX:gainX:freqY:deltaFreqY:qY:deltaQY:gainY:calibrationStatus:isValid:](v27, "reportSphereCalibrationForPosition:freqX:deltaFreqX:qX:deltaQX:gainX:freqY:deltaFreqY:qY:deltaQY:gainY:calibrationStatus:isValid:", v15, v26, v40, v28, v29, v30, v31, v32, v33, v34, v35, __PAIR64__(v24, v22));
              v36 = objc_alloc_init(BWSphereResonanceCalibrationAnalyticsPayload);
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setMagneticFieldMagnitude:v37];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setPortType:v17];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setCalibrationStatus:v26];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setSphereXAxisResonantFrequency:(int)v41];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setSphereYAxisResonantFrequency:(int)v42];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setDeltaSphereXAxisResonantFrequency:(int)v20];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setDeltaSphereYAxisResonantFrequency:(int)v23];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setSphereXAxisDampingCoefficient:(int)*((float *)&v18 + 1)];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setSphereYAxisDampingCoefficient:(int)v25];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setDeltaSphereXAxisDampingCoefficient:(int)v19];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setDeltaSphereYAxisDampingCoefficient:(int)v43];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setSphereXAxisLoopGain:(int)v21];
              [(BWSphereResonanceCalibrationAnalyticsPayload *)v36 setSphereYAxisLoopGain:(int)v44];
              [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v36];
            }
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v9);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = 0;
  memset(v4, 0, sizeof(v4));
  [a3 getBytes:v4 length:68];
  return v5;
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v4 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (([v9 isEqualToString:0x1EFA54160] & 1) != 0
            || [v9 isEqualToString:0x1EFA54180])
          {
            uint64_t v10 = (void *)[a3 objectForKeyedSubscript:v9];
            if (v10)
            {
              unsigned int v21 = 0;
              memset(v20, 0, sizeof(v20));
              long long v18 = 0u;
              long long v19 = 0u;
              [v10 getBytes:&v18 length:68];
              long long v16 = *(_OWORD *)((char *)v20 + 12);
              __int16 v17 = WORD6(v20[1]);
              [v4 appendFormat:@"%@, %d, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %s, %d, ", v9, (unsigned __int16)v18, *((float *)&v18 + 1), *((float *)&v18 + 2), *((float *)&v18 + 3), *(float *)&v19, *((float *)&v19 + 1), *((float *)&v19 + 2), *((float *)&v19 + 3), *(float *)v20, *((float *)v20 + 1), *((float *)v20 + 2), &v16, v21];
            }
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v22 count:16];
      }
      while (v6);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v4;
}

+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  int v5 = a3 | 1;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:68];
}

- (FigCaptureSphereCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint64_t v6 = FigGetCFPreferenceNumberWithDefault();
  uint64_t v7 = *MEMORY[0x1E4F54BB8];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureSphereCalibrationContext;
  return [(FigCaptureCalibrationContext *)&v9 initWithPreferenceString:@"SphereCalibrationData" withActivityName:@"com.apple.coremedia.sphere.calibration" withPropertyName:v7 withExpectedDataSize:68 withInterval:CFPreferenceNumberWithDefault withMinimumBatteryLevel:v6 withInternalLogName:@"spherecal" supportedDeviceNames:a3];
}

@end