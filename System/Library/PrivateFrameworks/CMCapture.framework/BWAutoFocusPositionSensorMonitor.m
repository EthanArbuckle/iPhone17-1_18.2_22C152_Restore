@interface BWAutoFocusPositionSensorMonitor
+ (id)sharedInstance;
+ (void)clientHasBeenBackgrounded;
+ (void)initialize;
+ (void)logStillImageAPSStatistics:(id)a3;
+ (void)logVideoRecordingAPSStatistics:(BWAPSStatistics *)a3;
+ (void)processAPSOffsetEstimatorInfo:(id)a3 portType:(id)a4;
- (BWAutoFocusPositionSensorMonitor)init;
- (uint64_t)_appendApsMotionData:(void *)a3 sphereMotionData:(void *)a4 toDataString:;
- (uint64_t)_highMagneticFieldCountOfOtherCameras:(void *)a3 portType:;
- (uint64_t)_reportStillImageAPSStatisticsToAggd:(uint64_t)result;
- (uint64_t)_reportVideoRecordingAPSStatisticsToAggd:(uint64_t)result;
- (void)_getLogFileHandle;
- (void)_logAPSOffsetEstimatorInfo:(void *)a3 portType:;
- (void)_logStillImageAPSStatistics:(uint64_t)a1;
- (void)_logVideoRecordingAPSStatistics:(uint64_t)a1;
- (void)_postMagneticDetectionUserNotification;
- (void)_processAPSOffsetEstimatorInfo:(void *)a3 portType:;
- (void)_reportAPSOffsetEstimatorInfoToAggdAndCoreAnalytics:(void *)a3 portType:;
- (void)clientHasBeenBackgrounded;
- (void)dealloc;
- (void)logStillImageAPSStatistics:(uint64_t)a1;
- (void)logVideoRecordingAPSStatistics:(uint64_t)a1;
- (void)processAPSOffsetEstimatorInfo:(uint64_t)a3 portType:;
@end

@implementation BWAutoFocusPositionSensorMonitor

+ (void)initialize
{
}

+ (id)sharedInstance
{
  if (sharedInstance_initSharedAutoFocusPositionSensorMonitor != -1) {
    dispatch_once(&sharedInstance_initSharedAutoFocusPositionSensorMonitor, &__block_literal_global_83);
  }
  return (id)sharedInstance_sharedAutoFocusPositionSensorMonitor;
}

BWAutoFocusPositionSensorMonitor *__50__BWAutoFocusPositionSensorMonitor_sharedInstance__block_invoke()
{
  result = objc_alloc_init(BWAutoFocusPositionSensorMonitor);
  sharedInstance_sharedAutoFocusPositionSensorMonitor = (uint64_t)result;
  return result;
}

+ (void)processAPSOffsetEstimatorInfo:(id)a3 portType:(id)a4
{
  v6 = +[BWAutoFocusPositionSensorMonitor sharedInstance];
  -[BWAutoFocusPositionSensorMonitor processAPSOffsetEstimatorInfo:portType:]((uint64_t)v6, (uint64_t)a3, (uint64_t)a4);
}

- (void)processAPSOffsetEstimatorInfo:(uint64_t)a3 portType:
{
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__BWAutoFocusPositionSensorMonitor_processAPSOffsetEstimatorInfo_portType___block_invoke;
    block[3] = &unk_1E5C248A0;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_async(v3, block);
  }
}

+ (void)logStillImageAPSStatistics:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F53CD0]];
  uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F54278]];
  uint64_t v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F53DD8]];
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && v6 != 0)
  {
    v9 = +[BWAutoFocusPositionSensorMonitor sharedInstance];
    -[BWAutoFocusPositionSensorMonitor logStillImageAPSStatistics:]((uint64_t)v9, (uint64_t)a3);
  }
}

- (void)logStillImageAPSStatistics:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63__BWAutoFocusPositionSensorMonitor_logStillImageAPSStatistics___block_invoke;
    v3[3] = &unk_1E5C24458;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

+ (void)logVideoRecordingAPSStatistics:(BWAPSStatistics *)a3
{
  uint64_t v4 = +[BWAutoFocusPositionSensorMonitor sharedInstance];
  -[BWAutoFocusPositionSensorMonitor logVideoRecordingAPSStatistics:]((uint64_t)v4, (uint64_t)a3);
}

- (void)logVideoRecordingAPSStatistics:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__BWAutoFocusPositionSensorMonitor_logVideoRecordingAPSStatistics___block_invoke;
    v3[3] = &unk_1E5C24F10;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

+ (void)clientHasBeenBackgrounded
{
  if (sShouldPostNotification == 1)
  {
    v2 = +[BWAutoFocusPositionSensorMonitor sharedInstance];
    -[BWAutoFocusPositionSensorMonitor clientHasBeenBackgrounded]((uint64_t)v2);
  }
}

- (void)clientHasBeenBackgrounded
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (BWAutoFocusPositionSensorMonitor)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWAutoFocusPositionSensorMonitor;
  v2 = [(BWAutoFocusPositionSensorMonitor *)&v4 init];
  if (v2) {
    v2->_apsMonitorQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAutoFocusPositionSensorMonitor;
  [(BWAutoFocusPositionSensorMonitor *)&v3 dealloc];
}

void __75__BWAutoFocusPositionSensorMonitor_processAPSOffsetEstimatorInfo_portType___block_invoke(uint64_t a1)
{
}

- (void)_processAPSOffsetEstimatorInfo:(void *)a3 portType:
{
  if (!a1) {
    return;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
  {
    uint64_t v6 = @"BackHighMagneticFieldCount";
    BOOL v7 = @"BackLowMagneticFieldCount";
    v8 = @"BackFirstLowMagneticFieldTime";
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F52DF0]])
  {
    uint64_t v6 = @"BackTelephotoHighMagneticFieldCount";
    BOOL v7 = @"BackTelephotoLowMagneticFieldCount";
    v8 = @"BackTelephotoFirstLowMagneticFieldTime";
  }
  else
  {
    if (![a3 isEqualToString:*MEMORY[0x1E4F52DE8]])
    {
      value = 0;
      v11 = 0;
      goto LABEL_27;
    }
    uint64_t v6 = @"BackSuperWideHighMagneticFieldCount";
    BOOL v7 = @"BackSuperWideLowMagneticFieldCount";
    v8 = @"BackSuperWideFirstLowMagneticFieldTime";
  }
  v21 = v8;
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  v11 = (void *)CFPreferencesCopyValue(@"AutoFocusPositionSensorMonitorInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  v24 = v7;
  if (v11) {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v11];
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  value = v12;
  int v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"NumPostedNotifications"), "intValue");
  int v14 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"LastNotificationTime"), "intValue");
  v23 = v6;
  int v15 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v6), "intValue");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
  double v17 = v16;
  if ((objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53758]), "intValue") & 2) != 0)
  {
    v22 = a2;
    if (v15 >= 9 && v17 - (double)v14 > (float)((float)(powf(5.0, (float)v13) * 1209600.0) / 5.0)) {
      sShouldPostNotification = 1;
    }
    objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v15 + 1)), v23);
    v20 = v24;
    goto LABEL_24;
  }
  if (v13 <= 0 && v15 < 1) {
    goto LABEL_26;
  }
  v22 = a2;
  int v18 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v24), "intValue");
  if (!v18) {
    objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v17), v21);
  }
  int v19 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v21), "intValue");
  objc_msgSend(value, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v18 + 1)), v24);
  if (v18 >= 9 && v17 - (double)v19 > 86400.0)
  {
    [value setObject:&unk_1EFB00B30 forKeyedSubscript:v24];
    [value setObject:&unk_1EFB00B30 forKeyedSubscript:v23];
    if (!-[BWAutoFocusPositionSensorMonitor _highMagneticFieldCountOfOtherCameras:portType:](a1, v11, a3))
    {
      [value setObject:&unk_1EFB00B30 forKeyedSubscript:@"NumPostedNotifications"];
      v20 = @"LastNotificationTime";
LABEL_24:
      [value setObject:&unk_1EFB00B30 forKeyedSubscript:v20];
    }
  }
  CFPreferencesSetValue(@"AutoFocusPositionSensorMonitorInfo", value, @"com.apple.cameracapture.volatile", v9, v10);
  CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v9, v10);
  a2 = v22;
LABEL_26:
  -[BWAutoFocusPositionSensorMonitor _reportAPSOffsetEstimatorInfoToAggdAndCoreAnalytics:portType:](a1, a2, a3);
  -[BWAutoFocusPositionSensorMonitor _logAPSOffsetEstimatorInfo:portType:](a1, a2, a3);
LABEL_27:
}

void __63__BWAutoFocusPositionSensorMonitor_logStillImageAPSStatistics___block_invoke(uint64_t a1)
{
  -[BWAutoFocusPositionSensorMonitor _reportStillImageAPSStatisticsToAggd:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(a1 + 40);
  -[BWAutoFocusPositionSensorMonitor _logStillImageAPSStatistics:](v2, v3);
}

- (uint64_t)_reportStillImageAPSStatisticsToAggd:(uint64_t)result
{
  if (result)
  {
    objc_super v3 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F53CD0]];
    objc_super v4 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54278]];
    uint64_t v5 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F53DD8]];
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6 || v5 == 0)
    {
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
    else
    {
      v8 = (void *)v5;
      uint64_t v9 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F536F8]), "floatValue");
      int v11 = v10;
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54E50]), "floatValue");
      int v13 = v12;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53928]), "floatValue");
      int v15 = v14;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53930]), "floatValue");
      int v17 = v16;
      uint64_t v18 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54058]), "intValue");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EB0]), "floatValue");
      int v20 = v19;
      uint64_t v21 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue");
      v22 = +[BWAggdDataReporter sharedInstance];
      LODWORD(v23) = v11;
      LODWORD(v24) = v13;
      LODWORD(v25) = v15;
      LODWORD(v26) = v17;
      LODWORD(v27) = v20;
      return [(BWAggdDataReporter *)v22 reportStillImageAPSStatisticsForPortType:v9 logicalFocusPosition:v18 apsMotion:v21 sphereMotion:v23 accelMotion:v24 gyroMotion:v25 subjectDistance:v26 luxLevel:v27];
    }
  }
  return result;
}

- (void)_logStillImageAPSStatistics:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1 && MGGetBoolAnswer())
  {
    uint64_t v36 = *MEMORY[0x1E4F53CD0];
    objc_super v3 = objc_msgSend(a2, "objectForKeyedSubscript:");
    uint64_t v4 = *MEMORY[0x1E4F54278];
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54278]];
    uint64_t v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F53DD8]];
    if (v3) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7 || v6 == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      uint64_t v9 = (void *)v6;
      LogFile = -[BWAutoFocusPositionSensorMonitor _getLogFileHandle](a1);
      if (LogFile)
      {
        v33 = LogFile;
        uint64_t v11 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
        id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v12 setDateFormat:@"HH:mm:ss"];
        uint64_t v13 = objc_msgSend(v12, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));

        id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        [v14 appendFormat:@"%@ ", v13];
        [v14 appendFormat:@"Photo, "];
        uint64_t v34 = v11;
        [v14 appendFormat:@"%@, ", v11];
        [v14 appendFormat:@"<FocusPos>%d</FocusPos>, ", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54058]), "intValue")];
        [v14 appendFormat:@"<Lux>%d</Lux>, ", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue")];
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EB0]), "floatValue");
        [v14 appendFormat:@"<SubjectDistance>%f</SubjectDistance>, ", v15];
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53928]), "floatValue");
        [v14 appendFormat:@"<AccelStd>%f</AccelStd>, ", v16];
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53908]), "floatValue");
        [v14 appendFormat:@"<AccelMax>%f</AccelMax>, ", v17];
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53918]), "floatValue");
        [v14 appendFormat:@"<AccelMin>%f</AccelMin>, ", v18];
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53930]), "floatValue");
        [v14 appendFormat:@"<GyroStd>%f</GyroStd>, ", v19];
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53910]), "floatValue");
        [v14 appendFormat:@"<GyroMax>%f</GyroMax>, ", v20];
        objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F53920]), "floatValue");
        [v14 appendFormat:@"<GyroMin>%f</GyroMin>, ", v21];
        -[BWAutoFocusPositionSensorMonitor _appendApsMotionData:sphereMotionData:toDataString:](a1, v3, v5, v14);
        v22 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F54300]];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        double v23 = (void *)[v22 allKeys];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v38 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = (void *)[v22 objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * i)];
              v29 = (void *)[v28 objectForKeyedSubscript:v36];
              uint64_t v30 = [v28 objectForKeyedSubscript:v4];
              if (v29) {
                BOOL v31 = v30 == 0;
              }
              else {
                BOOL v31 = 1;
              }
              if (!v31)
              {
                v32 = (void *)v30;
                [v14 appendFormat:@"SlaveCamera (%@), ", v34];
                -[BWAutoFocusPositionSensorMonitor _appendApsMotionData:sphereMotionData:toDataString:](a1, v29, v32, v14);
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v25);
        }
        [v14 appendString:@"\n"];
        objc_msgSend(v33, "writeData:", objc_msgSend(v14, "dataUsingEncoding:", 4));
        [v33 closeFile];
      }
    }
  }
}

void __67__BWAutoFocusPositionSensorMonitor_logVideoRecordingAPSStatistics___block_invoke(uint64_t a1)
{
  -[BWAutoFocusPositionSensorMonitor _reportVideoRecordingAPSStatisticsToAggd:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(float **)(a1 + 40);
  -[BWAutoFocusPositionSensorMonitor _logVideoRecordingAPSStatistics:](v2, v3);
}

- (uint64_t)_reportVideoRecordingAPSStatisticsToAggd:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      objc_super v3 = +[BWAggdDataReporter sharedInstance];
      LODWORD(v4) = *(_DWORD *)a2;
      LODWORD(v5) = *(_DWORD *)(a2 + 4);
      LODWORD(v6) = *(_DWORD *)(a2 + 24);
      LODWORD(v7) = *(_DWORD *)(a2 + 28);
      LODWORD(v8) = *(_DWORD *)(a2 + 12);
      LODWORD(v9) = *(_DWORD *)(a2 + 36);
      LODWORD(v10) = *(_DWORD *)(a2 + 48);
      LODWORD(v11) = *(_DWORD *)(a2 + 60);
      LODWORD(v14) = *(_DWORD *)(a2 + 20);
      HIDWORD(v14) = *(_DWORD *)(a2 + 44);
      LODWORD(v13) = *(_DWORD *)(a2 + 16);
      HIDWORD(v13) = *(_DWORD *)(a2 + 40);
      LODWORD(v12) = *(_DWORD *)(a2 + 8);
      HIDWORD(v12) = *(_DWORD *)(a2 + 32);
      return -[BWAggdDataReporter reportVideoRecordingAPSStatistics:stdDataFromAPSForTele:stdDataFromSphereForWide:stdDataFromSphereForTele:stdDataFromAccel:stdDataFromGyro:maxDataFromAPSForWide:maxDataFromAPSForTele:minDataFromAPSForWide:minDataFromAPSForTele:maxDataFromSphereForWide:maxDataFromSphereForTele:minDataFromSphereForWide:minDataFromSphereForTele:maxDataFromAccel:minDataFromAccel:maxDataFromGyro:minDataFromGyro:](v3, "reportVideoRecordingAPSStatistics:stdDataFromAPSForTele:stdDataFromSphereForWide:stdDataFromSphereForTele:stdDataFromAccel:stdDataFromGyro:maxDataFromAPSForWide:maxDataFromAPSForTele:minDataFromAPSForWide:minDataFromAPSForTele:maxDataFromSphereForWide:maxDataFromSphereForTele:minDataFromSphereForWide:minDataFromSphereForTele:maxDataFromAccel:minDataFromAccel:maxDataFromGyro:minDataFromGyro:", v4, v6, v8, v9, v10, v11, v5, v7, v12, v13, v14, *(void *)(a2 + 52), *(void *)(a2 + 64));
    }
    else
    {
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)_logVideoRecordingAPSStatistics:(uint64_t)a1
{
  if (a1 && MGGetBoolAnswer())
  {
    if (a2)
    {
      LogFile = -[BWAutoFocusPositionSensorMonitor _getLogFileHandle](a1);
      if (LogFile)
      {
        double v5 = LogFile;
        id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v6 setDateFormat:@"HH:mm:ss"];
        uint64_t v7 = objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));

        id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        [v8 appendFormat:@"%@ ", v7];
        [v8 appendFormat:@"Video, "];
        [v8 appendFormat:@"<AccelStd>%f</AccelStd>, ", a2[12]];
        [v8 appendFormat:@"<AccelMax>%f</AccelMax>, ", a2[13]];
        [v8 appendFormat:@"<AccelMin>%f</AccelMin>, ", a2[14]];
        [v8 appendFormat:@"<GyroStd>%f</GyroStd>, ", a2[15]];
        [v8 appendFormat:@"<GyroMax>%f</GyroMax>, ", a2[16]];
        [v8 appendFormat:@"<GyroMin>%f</GyroMin>, ", a2[17]];
        [v8 appendFormat:@"PortTypeBack, "];
        [v8 appendFormat:@"<AFStd>%f</AFStd>, ", *a2];
        [v8 appendFormat:@"<AFMax>%f</AFMax>, ", a2[1]];
        [v8 appendFormat:@"<AFMin>%f</AFMin>, ", a2[2]];
        [v8 appendFormat:@"<OISStd>%f</OISStd>, ", a2[3]];
        [v8 appendFormat:@"<OISMax>%f</OISMax>, ", a2[4]];
        [v8 appendFormat:@"<OISMin>%f</OISMin>, ", a2[5]];
        [v8 appendFormat:@"PortTypeBackTele, "];
        [v8 appendFormat:@"<AFStd>%f</AFStd>, ", a2[6]];
        [v8 appendFormat:@"<AFMax>%f</AFMax>, ", a2[7]];
        [v8 appendFormat:@"<AFMin>%f</AFMin>, ", a2[8]];
        [v8 appendFormat:@"<OISStd>%f</OISStd>, ", a2[9]];
        [v8 appendFormat:@"<OISMax>%f</OISMax>, ", a2[10]];
        [v8 appendFormat:@"<OISMin>%f</OISMin>, ", a2[11]];
        [v8 appendString:@"\n"];
        objc_msgSend(v5, "writeData:", objc_msgSend(v8, "dataUsingEncoding:", 4));
        [v5 closeFile];
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

void __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16)) {
    *(void *)(*(void *)(a1 + 32) + 16) = +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor];
  }
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(NSObject **)(v3 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke_2;
  block[3] = &unk_1E5C24430;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

void __61__BWAutoFocusPositionSensorMonitor_clientHasBeenBackgrounded__block_invoke_2(uint64_t a1)
{
  if (sShouldPostNotification == 1
    && [*(id *)(*(void *)(a1 + 32) + 16) isOnHomeScreen])
  {
    sShouldPostNotification = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    -[BWAutoFocusPositionSensorMonitor _postMagneticDetectionUserNotification](v2);
  }
}

- (void)_postMagneticDetectionUserNotification
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    uint64_t v3 = (void *)CFPreferencesCopyValue(@"AutoFocusPositionSensorMonitorInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v3) {
      id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
    }
    else {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    double v5 = v4;
    int v6 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"NumPostedNotifications"), "intValue");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v6 + 1)), @"NumPostedNotifications");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"LastNotificationTime");
    [v5 setObject:&unk_1EFB00B30 forKeyedSubscript:@"BackHighMagneticFieldCount"];
    [v5 setObject:&unk_1EFB00B30 forKeyedSubscript:@"BackTelephotoHighMagneticFieldCount"];
    [v5 setObject:&unk_1EFB00B30 forKeyedSubscript:@"BackSuperWideHighMagneticFieldCount"];
    [v5 setObject:&unk_1EFB00B30 forKeyedSubscript:@"BackLowMagneticFieldCount"];
    [v5 setObject:&unk_1EFB00B30 forKeyedSubscript:@"BackTelephotoLowMagneticFieldCount"];
    [v5 setObject:&unk_1EFB00B30 forKeyedSubscript:@"BackSuperWideLowMagneticFieldCount"];
    CFPreferencesSetValue(@"AutoFocusPositionSensorMonitorInfo", v5, @"com.apple.cameracapture.volatile", v1, v2);
    CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v1, v2);
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Celestial"];
    uint64_t v8 = [v7 localizedStringForKey:@"OK" value:&stru_1EFA403E0 table:@"MagneticNotification"];
    uint64_t v9 = [v7 localizedStringForKey:@"Learn More" value:&stru_1EFA403E0 table:@"MagneticNotification"];
    uint64_t v10 = [v7 localizedStringForKey:@"Alert Message" value:&stru_1EFA403E0 table:@"MagneticNotification"];
    uint64_t v11 = *MEMORY[0x1E4F1D9D0];
    v17[0] = *MEMORY[0x1E4F1D9E0];
    v17[1] = v11;
    v18[0] = v8;
    v18[1] = v9;
    v17[2] = *MEMORY[0x1E4F1D9A8];
    v18[2] = v10;
    CFDictionaryRef v12 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    CFUserNotificationRef v13 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, v12);
    if (v13)
    {
      CFUserNotificationRef v14 = v13;
      global_queue = dispatch_get_global_queue(0, 0);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__BWAutoFocusPositionSensorMonitor__postMagneticDetectionUserNotification__block_invoke;
      v16[3] = &__block_descriptor_40_e5_v8__0l;
      v16[4] = v14;
      dispatch_async(global_queue, v16);
    }
  }
}

- (uint64_t)_highMagneticFieldCountOfOtherCameras:(void *)a3 portType:
{
  if (result)
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
    {
      double v5 = @"BackSuperWideHighMagneticFieldCount";
      int v6 = @"BackTelephotoHighMagneticFieldCount";
    }
    else
    {
      if ([a3 isEqualToString:*MEMORY[0x1E4F52DF0]])
      {
        double v5 = @"BackSuperWideHighMagneticFieldCount";
      }
      else
      {
        result = [a3 isEqualToString:*MEMORY[0x1E4F52DE8]];
        if (!result) {
          return result;
        }
        double v5 = @"BackTelephotoHighMagneticFieldCount";
      }
      int v6 = @"BackHighMagneticFieldCount";
    }
    int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v6), "intValue");
    return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v5), "intValue") + v7;
  }
  return result;
}

- (void)_reportAPSOffsetEstimatorInfoToAggdAndCoreAnalytics:(void *)a3 portType:
{
  if (a1)
  {
    if (a2)
    {
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53760]), "floatValue");
      int v6 = v5;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53768]), "floatValue");
      int v8 = v7;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53718]), "floatValue");
      float v10 = v9;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53728]), "floatValue");
      int v12 = v11;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53730]), "floatValue");
      int v14 = v13;
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53720]), "floatValue");
      int v16 = v15;
      unsigned int v17 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53758]), "intValue");
      uint64_t v18 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53770]), "intValue");
      int v19 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53700]), "intValue");
      id v53 = (id)CFPreferencesCopyValue(@"AutoFocusPositionSensorMonitorInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      v49 = a3;
      if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
      {
        float v20 = @"BackLastSessionOffset";
      }
      else if ([a3 isEqualToString:*MEMORY[0x1E4F52DE8]])
      {
        float v20 = @"BackSuperWideLastSessionOffset";
      }
      else
      {
        float v20 = @"BackTelephotoLastSessionOffset";
      }
      int v21 = (v17 >> 7) & 1;
      uint64_t v22 = (v17 >> 1) & 1;
      int v23 = (v17 >> 6) & 1;
      BOOL v51 = v19 == 6;
      BOOL v52 = v19 == 1;
      unsigned int v46 = (v17 >> 4) & 1;
      unsigned int v47 = (v17 >> 5) & 1;
      unsigned int v45 = (v17 >> 3) & 1;
      BOOL v50 = v17 == 0;
      uint64_t v24 = (v17 >> 2) & 1;
      uint64_t v25 = (v17 >> 9) & 1;
      unsigned int v48 = v25;
      objc_msgSend((id)objc_msgSend(v53, "objectForKeyedSubscript:", v20), "floatValue");
      float v27 = v26;
      v28 = +[BWAggdDataReporter sharedInstance];
      float v29 = v10 - v27;
      BYTE1(v44) = v52;
      LOBYTE(v44) = v51;
      HIDWORD(v43) = v18;
      BYTE3(v43) = v50;
      BYTE2(v43) = v21;
      BYTE1(v43) = v22;
      LOBYTE(v43) = v23;
      LODWORD(v30) = v6;
      LODWORD(v31) = v8;
      *(float *)&double v32 = v10;
      LODWORD(v33) = v12;
      LODWORD(v34) = v14;
      LODWORD(v35) = v16;
      *(float *)&double v36 = v29;
      -[BWAggdDataReporter reportAPSOffsetEstimatorForPortType:accelMotion:gyroMotion:inSessionOffset:deltaOffsetFC:deltaOffsetMI:deltaOffsetFATP:deltaOffsetLastSession:errorHeadroomViolated:errorConvergenceFailed:errorMotionTooLarge:errorConfidenceTooLow:errorOffsetTooLarge:errorDeltaTooLarge:errorSaturated:errorCouldNotRun:successRun:startAPSVoltage:modeGCOL:modeOL:](v28, "reportAPSOffsetEstimatorForPortType:accelMotion:gyroMotion:inSessionOffset:deltaOffsetFC:deltaOffsetMI:deltaOffsetFATP:deltaOffsetLastSession:errorHeadroomViolated:errorConvergenceFailed:errorMotionTooLarge:errorConfidenceTooLow:errorOffsetTooLarge:errorDeltaTooLarge:errorSaturated:errorCouldNotRun:successRun:startAPSVoltage:modeGCOL:modeOL:", v49, v25, v24, v45, v46, v47, v30, v31, v32, v33, v34, v35, v36, v43, v44);
      long long v37 = objc_alloc_init(BWStartupCalibrationAnalyticsPayload);
      [(BWStartupCalibrationAnalyticsPayload *)v37 setPortType:v49];
      LODWORD(v38) = v6;
      [(BWStartupCalibrationAnalyticsPayload *)v37 setAccelStandardDeviation:v38];
      LODWORD(v39) = v8;
      [(BWStartupCalibrationAnalyticsPayload *)v37 setGyroStandardDeviation:v39];
      *(float *)&double v40 = v10;
      [(BWStartupCalibrationAnalyticsPayload *)v37 setSessionOffset:v40];
      *(float *)&double v41 = v29;
      [(BWStartupCalibrationAnalyticsPayload *)v37 setDeltaOffset:v41];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setApsVoltage:v18];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setHeadroomErrorOccurred:v48];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setConvergeErrorOccurred:v24];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setMotionErrorOccurred:v45];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setConfidenceErrorOccurred:v46];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setLargeOffsetErrorOccurred:v47];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setSaturationErrorOccurred:v22];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setSuccess:v50];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setGcolEntry:v51];
      [(BWStartupCalibrationAnalyticsPayload *)v37 setClosedLoopEntry:v52];
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53750]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setMaxAcceleration:](v37, "setMaxAcceleration:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53710]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setDeltaAcceleration:](v37, "setDeltaAcceleration:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53738]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setGravityX:](v37, "setGravityX:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53740]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setGravityY:](v37, "setGravityY:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53748]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setGravityZ:](v37, "setGravityZ:");
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53708]), "floatValue");
      -[BWStartupCalibrationAnalyticsPayload setCompletionTime:](v37, "setCompletionTime:");
      [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v37];
      uint64_t v42 = v53;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v42 = 0;
    }
  }
}

- (void)_logAPSOffsetEstimatorInfo:(void *)a3 portType:
{
  if (!a1) {
    return;
  }
  if (MGGetBoolAnswer())
  {
    if (a2)
    {
      LogFile = -[BWAutoFocusPositionSensorMonitor _getLogFileHandle](a1);
      if (LogFile)
      {
        int v7 = LogFile;
        id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v8 setDateFormat:@"HH:mm:ss"];
        uint64_t v9 = objc_msgSend(v8, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));

        id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        [v10 appendFormat:@"%@, ", v9];
        [v10 appendFormat:@"OffsetEstimatorInfo, "];
        [v10 appendFormat:@"%@, ", a3];
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53718]), "floatValue");
        float v12 = v11;
        [v10 appendFormat:@"<InSessionOffset>%f</InSessionOffset>, ", v11];
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53728]), "floatValue");
        [v10 appendFormat:@"<DeltaOffsetFC>%f</DeltaOffsetFC>, ", v13];
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53730]), "floatValue");
        [v10 appendFormat:@"<DeltaOffsetMI>%f</DeltaOffsetMI>, ", v14];
        objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53720]), "floatValue");
        [v10 appendFormat:@"<DeltaOffsetFATP>%f</DeltaOffsetFATP>, ", v15];
        CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
        CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
        uint64_t v18 = (void *)CFPreferencesCopyValue(@"AutoFocusPositionSensorMonitorInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
        if ([a3 isEqualToString:*MEMORY[0x1E4F52DD8]])
        {
          int v19 = @"BackLastSessionOffset";
        }
        else if ([a3 isEqualToString:*MEMORY[0x1E4F52DE8]])
        {
          int v19 = @"BackSuperWideLastSessionOffset";
        }
        else
        {
          int v19 = @"BackTelephotoLastSessionOffset";
        }
        objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v19), "floatValue");
        [v10 appendFormat:@"<DeltaOffsetLastSession>%f</DeltaOffsetLastSession>, ", (float)(v12 - v20)];
        uint64_t v21 = *MEMORY[0x1E4F53758];
        if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53758]), "intValue"))
        {
          value = 0;
        }
        else
        {
          if (v18) {
            id v22 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v18];
          }
          else {
            id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          value = v22;
          *(float *)&double v23 = v12;
          objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), v19);
          CFPreferencesSetValue(@"AutoFocusPositionSensorMonitorInfo", value, @"com.apple.cameracapture.volatile", v16, v17);
          CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v16, v17);
        }
        [v10 appendFormat:@"<InSessionStatus>%d</InSessionStatus>, ", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v21), "intValue")];
        [v10 appendFormat:@"<StartupAPSVoltage>%d</StartupAPSVoltage>, ", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53770]), "intValue")];
        objc_msgSend(v10, "appendFormat:", @"<AFMode>%d</AFMode>", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F53700]), "intValue"));
        [v10 appendString:@"\n"];
        objc_msgSend(v7, "writeData:", objc_msgSend(v10, "dataUsingEncoding:", 4));
        [v7 closeFile];

        goto LABEL_17;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  value = 0;
  uint64_t v18 = 0;
LABEL_17:
}

void __74__BWAutoFocusPositionSensorMonitor__postMagneticDetectionUserNotification__block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MEMORY[0x1A6272C70]();
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 32), 0.0, &responseFlags);
  if (responseFlags == 1)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT208747"];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace"), "openURL:", v3);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)_getLogFileHandle
{
  if (!a1) {
    return 0;
  }
  uint64_t v10 = 0;
  id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend(v1, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "localTimeZone"));
  [v1 setDateFormat:@"yyyy-MM-dd"];
  uint64_t v2 = objc_msgSend(v1, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
  if (FigCaptureCameracapturedEnabled()) {
    uint64_t v3 = @"cameracaptured";
  }
  else {
    uint64_t v3 = @"mediaserverd";
  }
  uint64_t v4 = [NSString stringWithFormat:@"%@-capture-NOT-A-CRASH.afdebug-%@.txt", v3, v2];
  uint64_t v5 = [NSString stringWithFormat:@"/private/var/mobile/Library/Logs/CrashReporter/%@", v3];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v10);
  uint64_t v6 = [NSString stringWithFormat:@"%@/%@", v5, v4];
  if (!v10)
  {
    uint64_t v7 = v6;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v6) & 1) == 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createFileAtPath:contents:attributes:", v7, 0, 0);
    }
    id v8 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForUpdatingAtPath:v7];
    if ([v8 seekToEndOfFile] < 200001) {
      goto LABEL_11;
    }
    [v8 closeFile];
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (uint64_t)_appendApsMotionData:(void *)a3 sphereMotionData:(void *)a4 toDataString:
{
  if (result)
  {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F536F8]), "floatValue");
    [a4 appendFormat:@"<AFStd>%f</AFStd>, ", v7];
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F536E8]), "floatValue");
    [a4 appendFormat:@"<AFMax>%f</AFMax>, ", v8];
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F536F0]), "floatValue");
    [a4 appendFormat:@"<AFMin>%f</AFMin>, ", v9];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54E50]), "floatValue");
    [a4 appendFormat:@"<OISStd>%f</OISStd>, ", v10];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54E40]), "floatValue");
    [a4 appendFormat:@"<OISMax>%f</OISMax>, ", v11];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54E48]), "floatValue");
    return [a4 appendFormat:@"<OISMin>%f</OISMin>, ", v12];
  }
  return result;
}

@end