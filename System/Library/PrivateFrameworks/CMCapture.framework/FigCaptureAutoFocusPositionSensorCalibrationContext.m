@interface FigCaptureAutoFocusPositionSensorCalibrationContext
+ (id)calibrationDataStringForInternalLogging:(id)a3;
+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3;
+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3;
+ (void)initialize;
+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3;
+ (void)setStatusForCalibrationData:(id)a3 status:(int)a4;
- (BOOL)_calibrationDataCompassHeadingHasMovedPastMinimum:(id)a3 basedOnCalibrationHistory:(id)a4;
- (BOOL)_calibrationDataIsWithinIStopZEstimateLimits:(id)a3 basedOnCalibrationHistory:(id)a4;
- (BOOL)_shouldRejectCalibrationData:(id)a3;
- (BOOL)disableHistoryChecking;
- (FigCaptureAutoFocusPositionSensorCalibrationContext)initWithSupportedDeviceNames:(id)a3;
- (double)currentAngleDelta;
- (double)previousAngleDelta;
- (id)_initForUnitTests;
- (id)calibrationDataHistory;
- (int)currentIStopZEstimateDeltaForPosition:(id)a3;
- (int)passingIStopZEstimateDeltaForPosition:(id)a3;
- (int)previousIStopZEstimateDeltaForPosition:(id)a3;
- (uint64_t)_ensureIStopZEstimateDeltasForKey:(uint64_t)result;
- (void)_pushToCalibrationHistoryQueue:(id)a3;
- (void)_updateIStopZEstimateDelta:(void *)result;
- (void)pushCalibrationDataToHistory:(id)a3 isRejected:(BOOL *)a4;
- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5;
- (void)setDisableHistoryChecking:(BOOL)a3;
- (void)setLastSuccessfulCalibrationData:(id)a3;
@end

@implementation FigCaptureAutoFocusPositionSensorCalibrationContext

+ (void)initialize
{
}

+ (void)printDebugInfoForRawStreamCalibrationData:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  [a3 getBytes:v3 length:120];
}

- (void)reportLoggingWithCalibrationData:(id)a3 isValid:(BOOL)a4 magneticFieldMagnitude:(double)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    if (a4) {
      v7 = @"com.apple.coremedia.camera.aps.fieldcal.NumCalSuccesses";
    }
    else {
      v7 = 0;
    }
    v8 = +[BWAggdDataReporter sharedInstance];
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", 0x1EFA6EDE0), "doubleValue");
    -[BWAggdDataReporter reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:](v8, "reportCalibrationStatisticsWithTime:timeValue:attemptsField:attemptsValue:successField:successValue:magneticFieldMagnitudeField:magneticFieldMagnitudeValue:", @"com.apple.coremedia.camera.aps.fieldcal.time", @"com.apple.coremedia.camera.aps.fieldcal.NumCalAttempts", 1, v7, 1, @"com.apple.coremedia.camera.aps.fieldcal.fieldMagnitude");
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      uint64_t v33 = *(void *)v49;
      id v34 = v6;
      do
      {
        uint64_t v12 = 0;
        uint64_t v36 = v10;
        do
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
          if (([v13 isEqualToString:0x1EFA54160] & 1) != 0
            || [v13 isEqualToString:0x1EFA54180])
          {
            uint64_t v14 = [v6 objectForKeyedSubscript:v13];
            if (v14)
            {
              v15 = (void *)v14;
              int v16 = [v13 isEqualToString:0x1EFA54160];
              uint64_t v59 = 0;
              if (v16) {
                int v17 = 1;
              }
              else {
                int v17 = 2;
              }
              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v52 = 0u;
              [v15 getBytes:&v52 length:120];
              __int16 v18 = WORD2(v52);
              __int16 v19 = WORD3(v52);
              unsigned int v20 = v56;
              unsigned int v21 = DWORD2(v53);
              uint64_t v22 = HIDWORD(v55);
              __int16 v40 = WORD5(v52);
              int v39 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v13), "lastPassingIStopZEstimateDelta");
              unsigned int v38 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v13), "currentIStopZEstimateDelta");
              unsigned int v23 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v13), "previousIStopZEstimateDelta");
              double currentAngleDelta = self->_currentAngleDelta;
              double previousAngleDelta = self->_previousAngleDelta;
              uint64_t v46 = 0;
              uint64_t v47 = 0;
              uint64_t v45 = 0;
              unsigned int v43 = v20;
              unsigned int v44 = v17;
              __int16 v41 = v18;
              unsigned int v42 = v21;
              if ((_WORD)v52)
              {
                LODWORD(v47) = (int)*((float *)&v58 + 1);
                HIDWORD(v47) = HIDWORD(v58);
                LODWORD(v46) = (int)*((float *)&v57 + 3);
                HIDWORD(v46) = (int)*((float *)&v58 + 2);
                HIDWORD(v45) = (int)*(float *)&v59;
                if ((unsigned __int16)v52 == 2)
                {
                  v26 = &v45;
                  v37 = (char *)&v47 + 4;
                  LODWORD(v45) = (int)*((float *)&v59 + 1);
                }
                else
                {
                  v26 = 0;
                  v37 = (char *)&v47 + 4;
                }
                v30 = &v47;
                v29 = (char *)&v46 + 4;
                v28 = &v46;
                v27 = (char *)&v45 + 4;
              }
              else
              {
                v27 = 0;
                v28 = 0;
                v29 = 0;
                v30 = 0;
                v37 = 0;
                v26 = 0;
              }
              BYTE1(v32) = BYTE1(v22) & 1;
              LOBYTE(v32) = a4;
              HIDWORD(v31) = v39;
              LOWORD(v31) = v40;
              -[BWAggdDataReporter reportAutoFocusPositionSensorCalibrationForPosition:iStopZEstimate:eSensorOutput:wSensorOutput:gravityZ:calibrationStatus:sensorTemp:successfulInfinityEndStopDelta:currentInfinityEndStopDelta:previousInfinityEndStopDelta:currentAngleDelta:previousAngleDelta:factoryCalibrationOffset:estimatedNeutralZ:deltaNeutralZFromNVM:estimatedSagZ:combinedSensorOutput:deltaSagFromNVM:isValid:dataWasRejectedByHistory:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportAutoFocusPositionSensorCalibrationForPosition:iStopZEstimate:eSensorOutput:wSensorOutput:gravityZ:calibrationStatus:sensorTemp:successfulInfinityEndStopDelta:currentInfinityEndStopDelta:previousInfinityEndStopDelta:currentAngleDelta:previousAngleDelta:factoryCalibrationOffset:estimatedNeutralZ:deltaNeutralZFromNVM:estimatedSagZ:combinedSensorOutput:deltaSagFromNVM:isValid:dataWasRejectedByHistory:", v44, v42, v41, v19, v43, v22, v31, __PAIR64__(v23, v38), __PAIR64__((int)previousAngleDelta, (int)currentAngleDelta), v37, v30, v29, v28, v27,
                v26,
                v32);
              uint64_t v11 = v33;
              id v6 = v34;
              uint64_t v10 = v36;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v6 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v10);
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
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v4, 0, sizeof(v4));
  [a3 getBytes:v4 length:120];
  return HIDWORD(v5);
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v20 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (([v9 isEqualToString:0x1EFA54160] & 1) != 0
            || [v9 isEqualToString:0x1EFA54180])
          {
            uint64_t v10 = (void *)[a3 objectForKeyedSubscript:v9];
            if (v10)
            {
              *(void *)uint64_t v32 = 0;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v29 = 0u;
              long long v27 = 0u;
              memset(v28, 0, sizeof(v28));
              long long v26 = 0u;
              [v10 getBytes:&v26 length:120];
              int v11 = (unsigned __int16)v26;
              long long v24 = *(_OWORD *)((char *)v28 + 8);
              __int16 v25 = WORD4(v28[1]);
              uint64_t v12 = HIDWORD(v28[1]);
              [v4 appendFormat:@"%@, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, ", v9, (unsigned __int16)v26, SWORD2(v26), SWORD3(v26), SWORD4(v26), SWORD5(v26), HIDWORD(v26), v27, SWORD2(v27), SWORD3(v27), DWORD2(v27), HIDWORD(v27), LODWORD(v28[0]), DWORD1(v28[0]), v29];
              if (v11)
              {
                uint64_t v13 = *(void *)((char *)&v30 + 4);
                float v14 = *((float *)&v31 + 2);
                float v15 = *((float *)&v30 + 3);
                float v16 = *((float *)&v31 + 1);
                float v17 = v32[0];
                uint64_t v18 = HIDWORD(v31);
                [v4 appendFormat:@"%f, %f, %f, %f ", *((float *)&v29 + 1), *((float *)&v29 + 2), *((float *)&v29 + 3), *(float *)&v30];
                [v4 appendFormat:@"%f, %f, ", *(float *)&v13, *((float *)&v13 + 1)];
                [v4 appendFormat:@"%f, %f, %f, %d, %f, ", v15, v14, v16, v18, v17];
                if (v11 == 2) {
                  [v4 appendFormat:@"%f, ", v32[1]];
                }
              }
              [v4 appendFormat:@"%s, %d, ", &v24, v12];
            }
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v20 objects:v33 count:16];
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
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v4, 0, sizeof(v4));
  HIDWORD(v5) = a3 | 1;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:120];
}

+ (void)setStatusForCalibrationData:(id)a3 status:(int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v6 = (void *)[a3 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v11 isEqualToString:0x1EFA54160] & 1) != 0
            || [v11 isEqualToString:0x1EFA54180])
          {
            uint64_t v12 = (void *)[a3 objectForKeyedSubscript:v11];
            uint64_t v22 = 0;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            memset(v17, 0, sizeof(v17));
            [v12 getBytes:v17 length:120];
            if (LOWORD(v17[0]) <= 2u) {
              HIDWORD(v18) = a4;
            }
            objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v17, 120), v11);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v23 count:16];
      }
      while (v8);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (FigCaptureAutoFocusPositionSensorCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint64_t v6 = FigGetCFPreferenceNumberWithDefault();
  uint64_t v7 = *MEMORY[0x1E4F547D8];
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
  uint64_t v8 = [(FigCaptureCalibrationContext *)&v23 initWithPreferenceString:@"AutoFocusPositionSensorCalibrationData" withActivityName:@"com.apple.coremedia.aps.calibration" withPropertyName:v7 withExpectedDataSize:120 withInterval:CFPreferenceNumberWithDefault withMinimumBatteryLevel:v6 withInternalLogName:@"apscal" supportedDeviceNames:a3];
  if (v8)
  {
    v24[0] = @"aps_cal_data";
    v24[1] = @"aps_cal_attempts";
    v24[2] = @"aps_cal_lastsuccess";
    CFArrayRef v9 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFDictionaryRef v12 = CFPreferencesCopyMultiple(v9, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if ([(__CFDictionary *)v12 count])
    {
      uint64_t v13 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"aps_cal_data"];
      uint64_t v14 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"aps_cal_lastsuccess"];
      if (v13)
      {
        long long v15 = (void *)v14;
        v22.receiver = v8;
        v22.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
        [(FigCaptureCalibrationContext *)&v22 setLastSuccessfulCalibrationData:v13];
        if (v15)
        {
          [v15 doubleValue];
          v21.receiver = v8;
          v21.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
          -[FigCaptureCalibrationContext setLastSuccessfulCalibrationTimeStamp:](&v21, sel_setLastSuccessfulCalibrationTimeStamp_);
        }
      }
      v8->_shouldDeleteOldVersion = 1;
    }
    long long v16 = (void *)CFPreferencesCopyValue(@"AutoFocusPositionSensorCalibrationData", @"com.apple.cameracapture.volatile", v10, v11);
    v8->_maxHistoryBuffer = 2;
    float v17 = (NSMutableArray *)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", 0x1EFA6EE60), "mutableCopy");
    v8->_calibrationDataHistoryQueue = v17;
    if (v17)
    {
      if ([(NSMutableArray *)v17 count] > (unint64_t)v8->_maxHistoryBuffer) {
        -[NSMutableArray removeObjectsInRange:](v8->_calibrationDataHistoryQueue, "removeObjectsInRange:", 0, [(NSMutableArray *)v8->_calibrationDataHistoryQueue count] - v8->_maxHistoryBuffer);
      }
    }
    else
    {
      v8->_calibrationDataHistoryQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20.receiver = v8;
      v20.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
      long long v18 = [(FigCaptureCalibrationContext *)&v20 lastSuccessfulCalibrationData];
      if (v18) {
        [(NSMutableArray *)v8->_calibrationDataHistoryQueue addObject:v18];
      }
    }
    v8->_maxIStopZEstimateDifference = 10;
    v8->_minCompassHeadingChange = 5;

    v8->_iStopZEstimateDeltaHistory = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v8;
}

- (void)pushCalibrationDataToHistory:(id)a3 isRejected:(BOOL *)a4
{
  if (a4) {
    *a4 = [(FigCaptureAutoFocusPositionSensorCalibrationContext *)self _shouldRejectCalibrationData:a3];
  }
  [(FigCaptureAutoFocusPositionSensorCalibrationContext *)self _pushToCalibrationHistoryQueue:a3];
}

- (id)calibrationDataHistory
{
  v2 = (void *)[(NSMutableArray *)self->_calibrationDataHistoryQueue copy];
  return v2;
}

- (void)setLastSuccessfulCalibrationData:(id)a3
{
  -[FigCaptureAutoFocusPositionSensorCalibrationContext _updateIStopZEstimateDelta:](self, a3);
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
  [(FigCaptureCalibrationContext *)&v7 setLastSuccessfulCalibrationData:a3];
  if (self->_shouldDeleteOldVersion)
  {
    CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFPreferencesSetValue(@"aps_cal_data", 0, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFPreferencesSetValue(@"aps_cal_attempts", 0, @"com.apple.cameracapture.volatile", v5, v6);
    CFPreferencesSetValue(@"aps_cal_lastsuccess", 0, @"com.apple.cameracapture.volatile", v5, v6);
    self->_shouldDeleteOldVersion = 0;
  }
}

- (void)_updateIStopZEstimateDelta:(void *)result
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = (uint64_t)result;
      uint64_t v4 = (void *)[result lastSuccessfulCalibrationData];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      result = (void *)[a2 countByEnumeratingWithState:&v14 objects:v34 count:16];
      if (result)
      {
        CFStringRef v5 = result;
        uint64_t v6 = *(void *)v15;
        do
        {
          objc_super v7 = 0;
          do
          {
            if (*(void *)v15 != v6) {
              objc_enumerationMutation(a2);
            }
            uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v7);
            if (([v8 isEqualToString:0x1EFA54160] & 1) != 0
              || [v8 isEqualToString:0x1EFA54180])
            {
              CFArrayRef v9 = (void *)[v4 objectForKeyedSubscript:v8];
              uint64_t v10 = [a2 objectForKeyedSubscript:v8];
              if (v9) {
                BOOL v11 = v10 == 0;
              }
              else {
                BOOL v11 = 1;
              }
              if (!v11)
              {
                CFDictionaryRef v12 = (void *)v10;
                uint64_t v33 = 0;
                long long v31 = 0u;
                long long v32 = 0u;
                long long v29 = 0u;
                long long v30 = 0u;
                long long v27 = 0u;
                long long v28 = 0u;
                long long v26 = 0u;
                [v9 getBytes:&v26 length:120];
                uint64_t v25 = 0;
                long long v23 = 0u;
                long long v24 = 0u;
                long long v21 = 0u;
                long long v22 = 0u;
                long long v19 = 0u;
                long long v20 = 0u;
                long long v18 = 0u;
                [v12 getBytes:&v18 length:120];
                LODWORD(v12) = DWORD2(v27);
                int v13 = DWORD2(v19);
                -[FigCaptureAutoFocusPositionSensorCalibrationContext _ensureIStopZEstimateDeltasForKey:](v3, (uint64_t)v8);
                objc_msgSend((id)objc_msgSend(*(id *)(v3 + 112), "objectForKeyedSubscript:", v8), "setLastPassingIStopZEstimateDelta:", (v13 - v12));
              }
            }
            objc_super v7 = (char *)v7 + 1;
          }
          while (v5 != v7);
          result = (void *)[a2 countByEnumeratingWithState:&v14 objects:v34 count:16];
          CFStringRef v5 = result;
        }
        while (result);
      }
    }
    else
    {
      fig_log_get_emitter();
      return (void *)FigDebugAssert3();
    }
  }
  return result;
}

- (uint64_t)_ensureIStopZEstimateDeltasForKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    result = [*(id *)(result + 112) objectForKeyedSubscript:a2];
    if (!result)
    {
      uint64_t v4 = objc_alloc_init(FigCaptureAutoFocusPositionSensorCalibrationIStopZEstimateDeltaHistory);
      CFStringRef v5 = *(void **)(v3 + 112);
      return [v5 setObject:v4 forKeyedSubscript:a2];
    }
  }
  return result;
}

- (id)_initForUnitTests
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureAutoFocusPositionSensorCalibrationContext;
  v2 = [(FigCaptureCalibrationContext *)&v5 initWithPreferenceString:@"fakeprefstring" withActivityName:0 withPropertyName:0 withExpectedDataSize:0 withInterval:0 withMinimumBatteryLevel:0 withInternalLogName:0 supportedDeviceNames:0];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_maxHistoryBuffer = 2;
    v2->_maxIStopZEstimateDifference = 10;
    v2->_minCompassHeadingChange = 5;
    v2->_calibrationDataHistoryQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_iStopZEstimateDeltaHistory = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)_pushToCalibrationHistoryQueue:(id)a3
{
  [(NSMutableArray *)self->_calibrationDataHistoryQueue addObject:a3];
  if ([(NSMutableArray *)self->_calibrationDataHistoryQueue count] > (unint64_t)self->_maxHistoryBuffer)
  {
    calibrationDataHistoryQueue = self->_calibrationDataHistoryQueue;
    uint64_t v5 = [(NSMutableArray *)calibrationDataHistoryQueue count] - self->_maxHistoryBuffer;
    -[NSMutableArray removeObjectsInRange:](calibrationDataHistoryQueue, "removeObjectsInRange:", 0, v5);
  }
}

- (BOOL)_shouldRejectCalibrationData:(id)a3
{
  if (self->_disableHistoryChecking) {
    return 0;
  }
  calibrationDataHistoryQueue = self->_calibrationDataHistoryQueue;
  BOOL v7 = [(FigCaptureAutoFocusPositionSensorCalibrationContext *)self _calibrationDataIsWithinIStopZEstimateLimits:a3 basedOnCalibrationHistory:calibrationDataHistoryQueue];
  return v7 & [(FigCaptureAutoFocusPositionSensorCalibrationContext *)self _calibrationDataCompassHeadingHasMovedPastMinimum:a3 basedOnCalibrationHistory:calibrationDataHistoryQueue] ^ 1;
}

- (BOOL)_calibrationDataIsWithinIStopZEstimateLimits:(id)a3 basedOnCalibrationHistory:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ([a4 count] == self->_maxHistoryBuffer)
  {
    uint64_t v6 = self;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v27 = [a4 countByEnumeratingWithState:&v35 objects:v56 count:16];
    if (v27)
    {
      BOOL v30 = 0;
      int v7 = 0;
      id obj = a4;
      uint64_t v26 = *(void *)v36;
      do
      {
        uint64_t v8 = 0;
        int v24 = v7;
        do
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v8;
          CFArrayRef v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v55 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v32 != v12) {
                  objc_enumerationMutation(v9);
                }
                long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                if (([v14 isEqualToString:0x1EFA54160] & 1) != 0
                  || [v14 isEqualToString:0x1EFA54180])
                {
                  long long v15 = (void *)[v9 objectForKeyedSubscript:v14];
                  uint64_t v16 = [a3 objectForKeyedSubscript:v14];
                  if (v15 && v16 != 0)
                  {
                    long long v18 = (void *)v16;
                    uint64_t v54 = 0;
                    long long v52 = 0u;
                    long long v53 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    long long v48 = 0u;
                    long long v49 = 0u;
                    long long v47 = 0u;
                    [v15 getBytes:&v47 length:120];
                    uint64_t v46 = 0;
                    long long v44 = 0u;
                    long long v45 = 0u;
                    long long v42 = 0u;
                    long long v43 = 0u;
                    long long v40 = 0u;
                    long long v41 = 0u;
                    long long v39 = 0u;
                    [v18 getBytes:&v39 length:120];
                    uint64_t v19 = (DWORD2(v40) - DWORD2(v48));
                    if ((int)v19 / 255 >= 0) {
                      int v20 = (int)v19 / 255;
                    }
                    else {
                      int v20 = (int)v19 / -255;
                    }
                    -[FigCaptureAutoFocusPositionSensorCalibrationContext _ensureIStopZEstimateDeltasForKey:]((uint64_t)v6, (uint64_t)v14);
                    if (v7 == 1)
                    {
                      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v6->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v14), "setCurrentIStopZEstimateDelta:", v19);
                    }
                    else if (!v7)
                    {
                      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v6->_iStopZEstimateDeltaHistory, "objectForKeyedSubscript:", v14), "setPreviousIStopZEstimateDelta:", v19);
                    }
                    BOOL v21 = v30 || v20 > v6->_maxIStopZEstimateDifference;
                    BOOL v30 = v21;
                  }
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v55 count:16];
            }
            while (v11);
          }
          ++v7;
          uint64_t v8 = v28 + 1;
        }
        while (v28 + 1 != v27);
        int v7 = v24 + v27;
        uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v56 count:16];
      }
      while (v27);
    }
    else
    {
      BOOL v30 = 0;
    }
    return !v30;
  }
  else
  {
    return 0;
  }
}

- (BOOL)_calibrationDataCompassHeadingHasMovedPastMinimum:(id)a3 basedOnCalibrationHistory:(id)a4
{
  if ([a4 count] == self->_maxHistoryBuffer)
  {
    if ([a4 count])
    {
      uint64_t v7 = 0;
      BOOL v8 = 0;
      while (1)
      {
        CFArrayRef v9 = (void *)[a4 objectAtIndexedSubscript:v7];
        id v10 = a3;
        if (v7 != [a4 count] - 1) {
          id v10 = (id)[a4 objectAtIndexedSubscript:v7 + 1];
        }
        uint64_t v11 = (void *)[v9 objectForKeyedSubscript:0x1EFA6EE40];
        uint64_t v12 = [v10 objectForKeyedSubscript:0x1EFA6EE40];
        if (!v11) {
          goto LABEL_17;
        }
        int v13 = (void *)v12;
        if (!v12) {
          goto LABEL_17;
        }
        double v23 = 0.0;
        double v24 = 0.0;
        double v25 = 0.0;
        [v11 getBytes:&v23 length:24];
        double v20 = 0.0;
        double v21 = 0.0;
        double v22 = 0.0;
        [v13 getBytes:&v20 length:24];
        double v14 = sqrt(v24 * v24 + v23 * v23 + v25 * v25);
        double v15 = sqrt(v21 * v21 + v20 * v20 + v22 * v22);
        double v16 = acos(v24 / v14 * (v21 / v15) + v20 / v15 * (v23 / v14) + v22 / v15 * (v25 / v14)) * 57.2957795;
        if (!v7) {
          break;
        }
        if (v7 == 1)
        {
          long long v17 = &OBJC_IVAR___FigCaptureAutoFocusPositionSensorCalibrationContext__currentAngleDelta;
LABEL_12:
          *(double *)((char *)&self->super.super.isa + *v17) = v16;
        }
        BOOL v8 = v8 || v16 < (double)self->_minCompassHeadingChange;
LABEL_17:
        if ([a4 count] <= (unint64_t)++v7) {
          return !v8;
        }
      }
      long long v17 = &OBJC_IVAR___FigCaptureAutoFocusPositionSensorCalibrationContext__previousAngleDelta;
      goto LABEL_12;
    }
    BOOL v8 = 0;
    return !v8;
  }
  else
  {
    return 0;
  }
}

- (int)passingIStopZEstimateDeltaForPosition:(id)a3
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_iStopZEstimateDeltaHistory objectForKeyedSubscript:a3];
  return [v3 lastPassingIStopZEstimateDelta];
}

- (int)previousIStopZEstimateDeltaForPosition:(id)a3
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_iStopZEstimateDeltaHistory objectForKeyedSubscript:a3];
  return [v3 previousIStopZEstimateDelta];
}

- (int)currentIStopZEstimateDeltaForPosition:(id)a3
{
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_iStopZEstimateDeltaHistory objectForKeyedSubscript:a3];
  return [v3 currentIStopZEstimateDelta];
}

- (double)previousAngleDelta
{
  return self->_previousAngleDelta;
}

- (double)currentAngleDelta
{
  return self->_currentAngleDelta;
}

- (BOOL)disableHistoryChecking
{
  return self->_disableHistoryChecking;
}

- (void)setDisableHistoryChecking:(BOOL)a3
{
  self->_disableHistoryChecking = a3;
}

@end