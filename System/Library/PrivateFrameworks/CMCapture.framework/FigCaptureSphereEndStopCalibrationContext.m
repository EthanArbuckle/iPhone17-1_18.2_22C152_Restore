@interface FigCaptureSphereEndStopCalibrationContext
+ (id)calibrationDataStringForInternalLogging:(id)a3;
+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3;
+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3;
+ (void)initialize;
+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3;
- (FigCaptureSphereEndStopCalibrationContext)initWithSupportedDeviceNames:(id)a3;
- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5;
@end

@implementation FigCaptureSphereEndStopCalibrationContext

+ (void)initialize
{
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, 60);
  [a3 getBytes:v3 length:60];
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    v7 = +[BWAggdDataReporter sharedInstance];
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", 0x1EFA6EDE0), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v7, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", @"com.apple.coremedia.camera.sph.endstopcal.time.s", 0, 0, 0, 0, 0);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      uint64_t v27 = *MEMORY[0x1E4F52DD8];
      uint64_t v26 = *MEMORY[0x1E4F52DF0];
      uint64_t v28 = *(void *)v40;
      id v29 = v6;
      do
      {
        uint64_t v11 = 0;
        uint64_t v31 = v9;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
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
              unsigned int v34 = v15;
              int v16 = [v12 isEqualToString:0x1EFA54160];
              *(_OWORD *)&v45[12] = 0u;
              uint64_t v17 = v27;
              if (!v16) {
                uint64_t v17 = v26;
              }
              uint64_t v35 = v17;
              long long v44 = 0uLL;
              *(_OWORD *)v45 = 0uLL;
              long long v43 = 0uLL;
              [v14 getBytes:&v43 length:60];
              uint64_t v19 = DWORD1(v43);
              uint64_t v18 = DWORD2(v43);
              uint64_t v20 = HIDWORD(v43);
              uint64_t v32 = v44;
              unsigned int v36 = *(_DWORD *)v45;
              unsigned int v37 = DWORD1(v43) - DWORD2(v43);
              unsigned int v38 = HIDWORD(v43) - v44;
              unsigned int v33 = *(_DWORD *)&v45[24];
              LOBYTE(v25) = a4;
              uint64_t v21 = HIDWORD(v44);
              uint64_t v22 = DWORD2(v44);
              -[BWAggdDataReporter reportSphereEndStopCalibrationForPosition:oisPositiveX:oisNegativeX:oisPositiveY:oisNegativeY:maxPositiveXDriftFromNVM:maxNegativeXDriftFromNVM:maxPositiveYDriftFromNVM:maxNegativeYDriftFromNVM:sphereStrokeX:sphereStrokeY:calibrationStatus:isValid:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportSphereEndStopCalibrationForPosition:oisPositiveX:oisNegativeX:oisPositiveY:oisNegativeY:maxPositiveXDriftFromNVM:maxNegativeXDriftFromNVM:maxPositiveYDriftFromNVM:maxNegativeYDriftFromNVM:sphereStrokeX:sphereStrokeY:calibrationStatus:isValid:", v34, DWORD1(v43), DWORD2(v43), HIDWORD(v43), v44, DWORD1(v44), *((void *)&v44 + 1), __PAIR64__(DWORD1(v43) - DWORD2(v43), *(unsigned int *)v45), __PAIR64__(*(unsigned int *)&v45[24], HIDWORD(v43) - (int)v44), v25);
              v23 = objc_alloc_init(BWSphereEndstopCalibrationAnalyticsPayload);
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setMagneticFieldMagnitude:(uint64_t)a5];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setPortType:v35];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setCalibrationStatus:v33];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setSphereXPosEndstop:v19];
              uint64_t v24 = v18;
              uint64_t v10 = v28;
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setSphereXNegEndstop:v24];
              id v6 = v29;
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setSphereYPosEndstop:v20];
              uint64_t v9 = v31;
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setSphereYNegEndstop:v32];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setDeltaSphereXPosEndstop:HIDWORD(v32)];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setDeltaSphereXNegEndstop:v22];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setDeltaSphereYPosEndstop:v21];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setDeltaSphereYNegEndstop:v36];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setSphereXStroke:v37];
              [(BWSphereEndstopCalibrationAnalyticsPayload *)v23 setSphereYStroke:v38];
              [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v23];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
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
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, 60);
  [a3 getBytes:v4 length:60];
  return DWORD2(v4[3]);
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v21 count:16];
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
              long long v19 = 0u;
              memset(v20, 0, sizeof(v20));
              long long v18 = 0u;
              [v10 getBytes:&v18 length:60];
              long long v16 = *(_OWORD *)&v20[1];
              __int16 v17 = v20[5];
              [v4 appendFormat:@"%@, %d, %d, %d, %d, %d, %d, %d, %d, %d, %s, %d, ", v9, (unsigned __int16)v18, DWORD1(v18), DWORD2(v18), HIDWORD(v18), v19, DWORD1(v19), DWORD2(v19), HIDWORD(v19), v20[0], &v16, v20[6]];
            }
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v21 count:16];
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
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  int v6 = a3 | 1;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:60];
}

- (FigCaptureSphereEndStopCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  uint64_t CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint64_t v6 = FigGetCFPreferenceNumberWithDefault();
  uint64_t v7 = *MEMORY[0x1E4F54BC0];
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureSphereEndStopCalibrationContext;
  return [(FigCaptureCalibrationContext *)&v9 initWithPreferenceString:@"SphereEndStopCalibrationData" withActivityName:@"com.apple.coremedia.sphereendstop.calibration" withPropertyName:v7 withExpectedDataSize:60 withInterval:CFPreferenceNumberWithDefault withMinimumBatteryLevel:v6 withInternalLogName:@"sphereendstopcal" supportedDeviceNames:a3];
}

@end