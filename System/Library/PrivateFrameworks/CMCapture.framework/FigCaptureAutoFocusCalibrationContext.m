@interface FigCaptureAutoFocusCalibrationContext
+ (id)calibrationDataStringForInternalLogging:(id)a3;
+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3;
+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3;
+ (void)initialize;
+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3;
- (FigCaptureAutoFocusCalibrationContext)initWithSupportedDeviceNames:(id)a3;
- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5;
@end

@implementation FigCaptureAutoFocusCalibrationContext

+ (void)initialize
{
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  [a3 getBytes:v3 length:64];
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    v7 = +[BWAggdDataReporter sharedInstance];
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", 0x1EFA6EDE0), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", @"com.apple.coremedia.camera.af.fieldcal.time.s", 0, 0, 0, 0, 0);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      uint64_t v31 = *MEMORY[0x1E4F52DD8];
      uint64_t v30 = *MEMORY[0x1E4F52DF0];
      uint64_t v32 = *(void *)v42;
      id v33 = v6;
      do
      {
        uint64_t v11 = 0;
        uint64_t v35 = v9;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
          if (([v12 isEqualToString:0x1EFA54160] & 1) != 0
            || [v12 isEqualToString:0x1EFA54180])
          {
            uint64_t v13 = [v6 objectForKeyedSubscript:v12];
            if (v13)
            {
              v14 = (void *)v13;
              if ([v12 isEqualToString:0x1EFA54160]) {
                int v15 = 1;
              }
              else {
                int v15 = 2;
              }
              unsigned int v37 = v15;
              int v16 = [v12 isEqualToString:0x1EFA54160];
              uint64_t v17 = v31;
              if (!v16) {
                uint64_t v17 = v30;
              }
              uint64_t v38 = v17;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              [v14 getBytes:&v45 length:64];
              uint64_t v18 = (int)*((float *)&v45 + 1);
              uint64_t v19 = (int)*(float *)&v46;
              uint64_t v20 = (int)*((float *)&v45 + 2);
              uint64_t v21 = (int)*((float *)&v46 + 1);
              uint64_t v22 = (int)*((float *)&v45 + 3);
              uint64_t v39 = 0;
              uint64_t v40 = 0;
              unsigned int v36 = HIDWORD(v47);
              if ((unsigned __int16)v45 == 1)
              {
                LODWORD(v40) = (int)(*((float *)&v48 + 1) * 10000.0);
                HIDWORD(v40) = (int)(*(float *)&v48 * 10000.0);
                LODWORD(v39) = (int)(*((float *)&v48 + 3) * 10000.0);
                HIDWORD(v39) = (int)(*((float *)&v48 + 2) * 10000.0);
                v23 = &v39;
                v24 = (char *)&v39 + 4;
                v25 = &v40;
                v26 = (char *)&v40 + 4;
              }
              else
              {
                v26 = 0;
                v25 = 0;
                v24 = 0;
                v23 = 0;
              }
              LOBYTE(v29) = a4;
              LODWORD(v28) = HIDWORD(v47);
              [+[BWAggdDataReporter sharedInstance] reportAutoFocusCalibrationForPosition:v37 freqZ:v18 deltaFreqZ:v19 qZ:v20 deltaQZ:v21 gainZ:v22 calibrationStatus:v28 gelModelCoefficientD1:v26 gelModelCoefficientD2:v25 gelModelCoefficientP1:v24 gelModelCoefficientP2:v23 isValid:v29];
              v27 = objc_alloc_init(BWAFResonanceCalibrationAnalyticsPayload);
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setMagneticFieldMagnitude:(uint64_t)a5];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setPortType:v38];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setCalibrationStatus:v36];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfAxisResonantFreq:v18];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setDeltaAFAxisResonantFreq:v19];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfAxisDampingCoefficient:v20];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setDeltaAFAxisDampingCoefficient:v21];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfLoopGain:v22];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfGelModelD1Coefficient:HIDWORD(v40)];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfGelModelD2Coefficient:v40];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfGelModelP1Coefficient:HIDWORD(v39)];
              [(BWAFResonanceCalibrationAnalyticsPayload *)v27 setAfGelModelP2Coefficient:v39];
              [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v27];
              uint64_t v10 = v32;
              id v6 = v33;
              uint64_t v9 = v35;
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v41 objects:v49 count:16];
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
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v4, 0, sizeof(v4));
  [a3 getBytes:v4 length:64];
  return HIDWORD(v5);
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v9 isEqualToString:0x1EFA54160] & 1) != 0
            || [v9 isEqualToString:0x1EFA54180])
          {
            uint64_t v10 = (void *)[a3 objectForKeyedSubscript:v9];
            if (v10)
            {
              long long v20 = 0u;
              memset(v19, 0, sizeof(v19));
              [v10 getBytes:v19 length:64];
              uint64_t v11 = LOWORD(v19[0]);
              long long v17 = *(_OWORD *)((char *)&v19[1] + 8);
              __int16 v18 = WORD4(v19[2]);
              [v4 appendFormat:@"%@, %d, %f, %f, %f, %f, %f, %s, %d, ", v9, LOWORD(v19[0]), *((float *)v19 + 1), *((float *)v19 + 2), *((float *)v19 + 3), *(float *)&v19[1], *((float *)&v19[1] + 1), &v17, HIDWORD(v19[2])];
              if (v11 == 1) {
                [v4 appendFormat:@"%f, %f, %f, %f ", *(float *)&v20, *((float *)&v20 + 1), *((float *)&v20 + 2), *((float *)&v20 + 3)];
              }
            }
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v21 count:16];
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
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v4, 0, sizeof(v4));
  HIDWORD(v5) = a3 | 1;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:64];
}

- (FigCaptureAutoFocusCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint64_t v6 = FigGetCFPreferenceNumberWithDefault();
  uint64_t v7 = *MEMORY[0x1E4F547B8];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureAutoFocusCalibrationContext;
  return [(FigCaptureCalibrationContext *)&v9 initWithPreferenceString:@"AutoFocusCalibrationData" withActivityName:@"com.apple.coremedia.af.calibration" withPropertyName:v7 withExpectedDataSize:64 withInterval:CFPreferenceNumberWithDefault withMinimumBatteryLevel:v6 withInternalLogName:@"afcal" supportedDeviceNames:a3];
}

@end