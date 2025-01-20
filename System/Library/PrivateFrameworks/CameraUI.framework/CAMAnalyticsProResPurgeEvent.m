@interface CAMAnalyticsProResPurgeEvent
- (BOOL)_didUpdateForFirstPurgeOperation;
- (CAMAnalyticsProResPurgeEvent)initWithRequestType:(int64_t)a3 graphConfiguration:(id)a4 totalBytesInSystem:(int64_t)a5;
- (CAMCaptureGraphConfiguration)_graphConfiguration;
- (double)_startTime;
- (id)eventName;
- (int64_t)_bucketedCount:(int64_t)a3;
- (int64_t)_purgeOperationCount;
- (int64_t)_totalBytesPurged;
- (void)_setDidUpdateForFirstPurgeOperation:(BOOL)a3;
- (void)_setPurgeOperationCount:(int64_t)a3;
- (void)_setTotalBytesPurged:(int64_t)a3;
- (void)_updateForIsBeforePurge:(BOOL)a3 withFreeBytes:(int64_t)a4 fastPurgeableBytes:(int64_t)a5 slowPurgeableBytes:(int64_t)a6 maxRecordingTimeSeconds:(double)a7;
- (void)publish;
- (void)updateAfterPurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6 bytesPurged:(int64_t)a7;
- (void)updateBeforePurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6;
- (void)updateForCancelRequest;
- (void)updateForSkippedPurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6;
@end

@implementation CAMAnalyticsProResPurgeEvent

- (CAMAnalyticsProResPurgeEvent)initWithRequestType:(int64_t)a3 graphConfiguration:(id)a4 totalBytesInSystem:(int64_t)a5
{
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsProResPurgeEvent;
  v10 = [(CAMAnalyticsEvent *)&v29 init];
  if (v10)
  {
    v10->__startTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v10->__graphConfiguration, a4);
    v11 = +[CAMCaptureCapabilities capabilities];
    uint64_t v12 = [v9 mode];
    uint64_t v13 = [v9 device];
    uint64_t v14 = [v9 videoEncodingBehavior];
    uint64_t v15 = [v9 videoConfiguration];
    LOBYTE(v28) = [v9 prefersHDR10BitVideo];
    uint64_t v16 = [v11 resolvedVideoConfigurationForMode:v12 device:v13 videoEncodingBehavior:v14 videoConfiguration:v15 outputToExternalStorage:0 spatialVideoEnabled:0 prefersHDR10BitVideo:v28];
    v17 = [(CAMAnalyticsEvent *)v10 _eventMap];
    v18 = v17;
    v19 = @"UserInitiated";
    if (a3 != 1) {
      v19 = 0;
    }
    if (a3) {
      v20 = v19;
    }
    else {
      v20 = @"Auto";
    }
    [v17 setObject:v20 forKeyedSubscript:@"requestType"];
    switch(v16)
    {
      case 0:
        v21 = @"Auto";
        break;
      case 1:
        v21 = @"1080p60";
        break;
      case 2:
        v21 = @"720p120";
        break;
      case 3:
        v21 = @"720p240";
        break;
      case 4:
        v21 = @"1080p120";
        break;
      case 5:
        v21 = @"4k30";
        break;
      case 6:
        v21 = @"720p30";
        break;
      case 7:
        v21 = @"1080p30";
        break;
      case 8:
        v21 = @"1080p240";
        break;
      case 9:
        v21 = @"4k60";
        break;
      case 10:
        v21 = @"4k24";
        break;
      case 11:
        v21 = @"1080p25";
        break;
      case 12:
        v21 = @"4k25";
        break;
      case 13:
        v21 = @"4k120";
        break;
      case 14:
        v21 = @"4k100";
        break;
      default:
        switch(v16)
        {
          case 10000:
            v21 = @"ImagePickerHigh";
            break;
          case 10001:
            v21 = @"ImagePickerMedium";
            break;
          case 10002:
            v21 = @"ImagePickerLow";
            break;
          case 10003:
            v21 = @"ImagePickerVGA";
            break;
          case 10004:
            v21 = @"ImagePickeriFrame720p";
            break;
          case 10005:
            v21 = @"ImagePickeriFrame540p";
            break;
          default:
            v21 = 0;
            break;
        }
        break;
    }
    [v18 setObject:v21 forKeyedSubscript:@"videoConfiguration"];
    v22 = NSNumber;
    [(id)objc_opt_class() gigabytesForBytes:a5];
    v23 = objc_msgSend(v22, "numberWithDouble:");
    [v18 setObject:v23 forKeyedSubscript:@"totalSystemGB"];

    v24 = [(id)objc_opt_class() bucketedGigabytesStringForBytes:a5 allowZero:0 minPositiveValue:64.0 maxValue:4096.0];
    [v18 setObject:v24 forKeyedSubscript:@"totalSystemGBRange"];

    uint64_t v25 = MEMORY[0x263EFFA80];
    [v18 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"didPurge"];
    [v18 setObject:v25 forKeyedSubscript:@"didCancel"];
    v26 = v10;
  }
  return v10;
}

- (id)eventName
{
  return @"prores.purge";
}

- (void)publish
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CAMAnalyticsEvent *)self _eventMap];
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsProResPurgeEvent *)self _startTime];
  double v6 = Current - v5;
  v7 = [NSNumber numberWithDouble:v6];
  [v3 setObject:v7 forKeyedSubscript:@"duration"];

  v8 = [(id)objc_opt_class() durationRangeStringForDuration:v6];
  [v3 setObject:v8 forKeyedSubscript:@"durationRange"];

  id v9 = NSNumber;
  objc_msgSend((id)objc_opt_class(), "gigabytesForBytes:", -[CAMAnalyticsProResPurgeEvent _totalBytesPurged](self, "_totalBytesPurged"));
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"totalPurgedGB"];

  v11 = objc_msgSend((id)objc_opt_class(), "bucketedGigabytesStringForBytes:", -[CAMAnalyticsProResPurgeEvent _totalBytesPurged](self, "_totalBytesPurged"));
  [v3 setObject:v11 forKeyedSubscript:@"totalPurgedGBRange"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount"));
  [v3 setObject:v12 forKeyedSubscript:@"purgeOperationCount"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsProResPurgeEvent _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount")));
  [v3 setObject:v13 forKeyedSubscript:@"purgeOperationCountRange"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount") > 0);
  [v3 setObject:v14 forKeyedSubscript:@"didPurge"];

  v17.receiver = self;
  v17.super_class = (Class)CAMAnalyticsProResPurgeEvent;
  [(CAMAnalyticsEvent *)&v17 publish];
  uint64_t v15 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [(CAMAnalyticsProResPurgeEvent *)self eventName];
    *(_DWORD *)buf = 138543618;
    v19 = v16;
    __int16 v20 = 2114;
    v21 = v3;
    _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "CoreAnalytics: %{public}@: %{public}@", buf, 0x16u);
  }
}

- (void)updateBeforePurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6
{
  if (![(CAMAnalyticsProResPurgeEvent *)self _didUpdateForFirstPurgeOperation])
  {
    [(CAMAnalyticsProResPurgeEvent *)self _updateForIsBeforePurge:1 withFreeBytes:a3 fastPurgeableBytes:a4 slowPurgeableBytes:a5 maxRecordingTimeSeconds:a6];
    [(CAMAnalyticsProResPurgeEvent *)self _setDidUpdateForFirstPurgeOperation:1];
  }
}

- (void)updateAfterPurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6 bytesPurged:(int64_t)a7
{
  [(CAMAnalyticsProResPurgeEvent *)self _updateForIsBeforePurge:0 withFreeBytes:a3 fastPurgeableBytes:a4 slowPurgeableBytes:a5 maxRecordingTimeSeconds:a6];
  [(CAMAnalyticsProResPurgeEvent *)self _setTotalBytesPurged:[(CAMAnalyticsProResPurgeEvent *)self _totalBytesPurged] + a7];
  int64_t v9 = [(CAMAnalyticsProResPurgeEvent *)self _purgeOperationCount] + 1;
  [(CAMAnalyticsProResPurgeEvent *)self _setPurgeOperationCount:v9];
}

- (void)_updateForIsBeforePurge:(BOOL)a3 withFreeBytes:(int64_t)a4 fastPurgeableBytes:(int64_t)a5 slowPurgeableBytes:(int64_t)a6 maxRecordingTimeSeconds:(double)a7
{
  BOOL v8 = a3;
  id v43 = [(CAMAnalyticsEvent *)self _eventMap];
  BOOL v9 = !v8;
  if (v8) {
    v10 = @"freeGBBefore";
  }
  else {
    v10 = @"freeGBAfter";
  }
  if (v8) {
    v11 = @"freeGBBeforeRange";
  }
  else {
    v11 = @"freeGBAfterRange";
  }
  if (v8) {
    uint64_t v12 = @"fastPurgeableGBBefore";
  }
  else {
    uint64_t v12 = @"fastPurgeableGBAfter";
  }
  if (v9) {
    uint64_t v13 = @"fastPurgeableGBAfterRange";
  }
  else {
    uint64_t v13 = @"fastPurgeableGBBeforeRange";
  }
  if (v9) {
    uint64_t v14 = @"slowPurgeableGBAfter";
  }
  else {
    uint64_t v14 = @"slowPurgeableGBBefore";
  }
  if (v9) {
    uint64_t v15 = @"slowPurgeableGBAfterRange";
  }
  else {
    uint64_t v15 = @"slowPurgeableGBBeforeRange";
  }
  if (v9) {
    uint64_t v16 = @"maxRecordingTimeSecondsAfter";
  }
  else {
    uint64_t v16 = @"maxRecordingTimeSecondsBefore";
  }
  if (v9) {
    objc_super v17 = @"maxRecordingTimeSecondsAfterRange";
  }
  else {
    objc_super v17 = @"maxRecordingTimeSecondsBeforeRange";
  }
  v18 = @"captureAllowedBefore";
  if (v9) {
    v18 = @"captureAllowedAfter";
  }
  v19 = NSNumber;
  v42 = v18;
  v39 = v17;
  __int16 v20 = v16;
  v21 = v15;
  uint64_t v22 = v14;
  v23 = v13;
  v24 = v12;
  uint64_t v25 = v11;
  v26 = v10;
  [(id)objc_opt_class() gigabytesForBytes:a4];
  v27 = objc_msgSend(v19, "numberWithDouble:");
  [v43 setObject:v27 forKeyedSubscript:v26];

  uint64_t v28 = [(id)objc_opt_class() bucketedGigabytesStringForBytes:a4];
  [v43 setObject:v28 forKeyedSubscript:v25];

  objc_super v29 = NSNumber;
  [(id)objc_opt_class() gigabytesForBytes:a5];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  [v43 setObject:v30 forKeyedSubscript:v24];

  v31 = [(id)objc_opt_class() bucketedGigabytesStringForBytes:a5];
  [v43 setObject:v31 forKeyedSubscript:v23];

  v32 = NSNumber;
  [(id)objc_opt_class() gigabytesForBytes:a6];
  v33 = objc_msgSend(v32, "numberWithDouble:");
  [v43 setObject:v33 forKeyedSubscript:v22];

  v34 = [(id)objc_opt_class() bucketedGigabytesStringForBytes:a6];
  [v43 setObject:v34 forKeyedSubscript:v21];

  v35 = [NSNumber numberWithDouble:a7];
  [v43 setObject:v35 forKeyedSubscript:v20];

  v36 = [(id)objc_opt_class() durationRangeStringForDuration:a7];
  [v43 setObject:v36 forKeyedSubscript:v39];

  v37 = [NSNumber numberWithInt:a7 > 0.0];
  [v43 setObject:v37 forKeyedSubscript:v42];
}

- (void)updateForSkippedPurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6
{
  if ([(CAMAnalyticsProResPurgeEvent *)self _didUpdateForFirstPurgeOperation])
  {
    [(CAMAnalyticsProResPurgeEvent *)self _updateForIsBeforePurge:1 withFreeBytes:a3 fastPurgeableBytes:a4 slowPurgeableBytes:a5 maxRecordingTimeSeconds:a6];
    [(CAMAnalyticsProResPurgeEvent *)self _updateForIsBeforePurge:0 withFreeBytes:a3 fastPurgeableBytes:a4 slowPurgeableBytes:a5 maxRecordingTimeSeconds:a6];
    [(CAMAnalyticsProResPurgeEvent *)self _setDidUpdateForFirstPurgeOperation:1];
  }
}

- (void)updateForCancelRequest
{
  id v2 = [(CAMAnalyticsEvent *)self _eventMap];
  [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"didCancel"];
}

- (int64_t)_bucketedCount:(int64_t)a3
{
  [(id)objc_opt_class() bucketedPowerOf2ForValue:1 allowZero:(double)a3 minPositiveValue:1.0 maxValue:128.0];
  return (uint64_t)v3;
}

- (double)_startTime
{
  return self->__startTime;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (BOOL)_didUpdateForFirstPurgeOperation
{
  return self->__didUpdateForFirstPurgeOperation;
}

- (void)_setDidUpdateForFirstPurgeOperation:(BOOL)a3
{
  self->__didUpdateForFirstPurgeOperation = a3;
}

- (int64_t)_totalBytesPurged
{
  return self->__totalBytesPurged;
}

- (void)_setTotalBytesPurged:(int64_t)a3
{
  self->__totalBytesPurged = a3;
}

- (int64_t)_purgeOperationCount
{
  return self->__purgeOperationCount;
}

- (void)_setPurgeOperationCount:(int64_t)a3
{
  self->__purgeOperationCount = a3;
}

- (void).cxx_destruct
{
}

@end