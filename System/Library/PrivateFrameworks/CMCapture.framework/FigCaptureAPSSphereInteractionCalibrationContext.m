@interface FigCaptureAPSSphereInteractionCalibrationContext
+ (id)calibrationDataStringForInternalLogging:(id)a3;
+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3;
+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3;
+ (void)initialize;
+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3;
- (FigCaptureAPSSphereInteractionCalibrationContext)initWithSupportedDeviceNames:(id)a3;
- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5;
@end

@implementation FigCaptureAPSSphereInteractionCalibrationContext

+ (void)initialize
{
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v4 = 0;
  memset(v3, 0, sizeof(v3));
  [a3 getBytes:v3 length:84];
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  BOOL v30 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = +[BWAggdDataReporter sharedInstance];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", 0x1EFA6EDE0), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", @"com.apple.coremedia.camera.aps.sphcal.time.s", 0, 0, 0, 0, 0);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v29 = *MEMORY[0x1E4F52DD8];
      uint64_t v28 = *MEMORY[0x1E4F52DF0];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(a3);
          }
          v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (([v12 isEqualToString:0x1EFA54160] & 1) != 0
            || [v12 isEqualToString:0x1EFA54180])
          {
            uint64_t v13 = [a3 objectForKeyedSubscript:v12];
            if (v13)
            {
              v14 = (void *)v13;
              int v15 = [v12 isEqualToString:0x1EFA54160];
              unsigned int v39 = 0;
              if (v15) {
                uint64_t v16 = 1;
              }
              else {
                uint64_t v16 = 2;
              }
              long long v37 = 0u;
              long long v38 = 0u;
              long long v36 = 0u;
              memset(v35, 0, sizeof(v35));
              if ([v12 isEqualToString:0x1EFA54160]) {
                uint64_t v17 = v29;
              }
              else {
                uint64_t v17 = v28;
              }
              [v14 getBytes:v35 length:84];
              uint64_t v18 = *(void *)((char *)&v37 + 4);
              float v19 = *((float *)&v36 + 3);
              float v20 = *(float *)&v37;
              uint64_t v21 = v39;
              v22 = +[BWAggdDataReporter sharedInstance];
              LODWORD(v23) = v18;
              *(float *)&double v24 = v19;
              LODWORD(v25) = HIDWORD(v18);
              *(float *)&double v26 = v20;
              [(BWAggdDataReporter *)v22 reportAPSSphereInteractionCalibrationForPosition:v16 residualErrorNeutral:v21 calibrationZHeightNeutral:v30 residualErrorMacro:v23 calibrationZHeightMacro:v24 calibrationStatus:v25 isValid:v26];
              v27 = objc_alloc_init(BWSphereInteractionCalibrationAnalyticsPayload);
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setMagneticFieldMagnitude:(uint64_t)a5];
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setPortType:v17];
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setCalibrationStatus:v21];
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setSphereNeutralPositionError:(int)*(float *)&v18];
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setSphereNeutralPosition:(int)v19];
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setSphereMacroPositionError:(int)*((float *)&v18 + 1)];
              [(BWSphereInteractionCalibrationAnalyticsPayload *)v27 setSphereMacroPosition:(int)v20];
              [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v27];
            }
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
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
  [a3 getBytes:v4 length:84];
  return v5;
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v4 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v23 count:16];
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
              unsigned int v22 = 0;
              memset(v21, 0, sizeof(v21));
              long long v19 = 0u;
              long long v20 = 0u;
              long long v18 = 0u;
              [v10 getBytes:&v18 length:84];
              long long v16 = *(_OWORD *)((char *)v21 + 12);
              __int16 v17 = WORD6(v21[1]);
              objc_msgSend(v4, "appendFormat:", @"%@, %d, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %s, %d, ", v9, (unsigned __int16)v18, *((float *)&v18 + 1), *((float *)&v18 + 2), *((float *)&v18 + 3), *(float *)&v19, *((float *)&v19 + 1), *((float *)&v19 + 2), *((float *)&v19 + 3), *(float *)&v20, *((float *)&v20 + 1), *((float *)&v20 + 2), *((float *)&v20 + 3), *(float *)v21, *((float *)v21 + 1), *((float *)v21 + 2),
                &v16,
                v22);
            }
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v23 count:16];
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
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:84];
}

- (FigCaptureAPSSphereInteractionCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint64_t v6 = FigGetCFPreferenceNumberWithDefault();
  uint64_t v7 = *MEMORY[0x1E4F547F8];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureAPSSphereInteractionCalibrationContext;
  return [(FigCaptureCalibrationContext *)&v9 initWithPreferenceString:@"APSSphereInteractionCalibrationData" withActivityName:@"com.apple.coremedia.apssphere.calibration" withPropertyName:v7 withExpectedDataSize:84 withInterval:CFPreferenceNumberWithDefault withMinimumBatteryLevel:v6 withInternalLogName:@"apsspherecal" supportedDeviceNames:a3];
}

@end