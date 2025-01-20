@interface CAMAnalyticsIgnoredShutterEvent
- (CAMAnalyticsIgnoredShutterEvent)initWithReasons:(unint64_t)a3 timeSinceLastPress:(double)a4 dynamicShutterEnabled:(BOOL)a5 responsiveShutterEnabled:(BOOL)a6;
- (id)_timeSinceLastPressRangeStringForMilliseconds:(int64_t)a3;
- (id)eventName;
@end

@implementation CAMAnalyticsIgnoredShutterEvent

- (CAMAnalyticsIgnoredShutterEvent)initWithReasons:(unint64_t)a3 timeSinceLastPress:(double)a4 dynamicShutterEnabled:(BOOL)a5 responsiveShutterEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsIgnoredShutterEvent;
  v10 = [(CAMAnalyticsEvent *)&v29 init];
  if (v10)
  {
    if (a3)
    {
      uint64_t v11 = 1;
      uint64_t v12 = MEMORY[0x263EFFA88];
      do
      {
        if (a3)
        {
          v13 = [(CAMAnalyticsEvent *)v10 _eventMap];
          v14 = v13;
          if (v11 > 15)
          {
            if (v11 == 128) {
              v16 = @"disabledReasonPurgingDiskSpace";
            }
            else {
              v16 = 0;
            }
            if (v11 == 64) {
              v16 = @"disabledReasonViewfinderOpening";
            }
            if (v11 == 32) {
              v17 = @"disabledReasonPhysicalButtonDown";
            }
            else {
              v17 = 0;
            }
            if (v11 == 16) {
              v17 = @"disabledReasonModeDisabled";
            }
            if (v11 <= 63) {
              v15 = v17;
            }
            else {
              v15 = v16;
            }
          }
          else
          {
            v15 = 0;
            switch(v11)
            {
              case 0:
                v15 = @"disabledReasonNone";
                break;
              case 1:
                v15 = @"disabledReasonCaptureUnavailable";
                break;
              case 2:
                v15 = @"disabledReasonOutOfDiskSpace";
                break;
              case 4:
                v15 = @"disabledReasonViewfinderClosed";
                break;
              case 8:
                v15 = @"disabledReasonPreventingAdditionalCaptures";
                break;
              default:
                break;
            }
          }
          [v13 setObject:v12 forKeyedSubscript:v15];
        }
        v11 *= 2;
        BOOL v18 = a3 > 1;
        a3 >>= 1;
      }
      while (v18);
    }
    v19 = [NSNumber numberWithInteger:(uint64_t)(a4 * 1000.0)];
    v20 = [(CAMAnalyticsEvent *)v10 _eventMap];
    [v20 setObject:v19 forKeyedSubscript:@"timeSinceLastPress"];

    v21 = [(CAMAnalyticsIgnoredShutterEvent *)v10 _timeSinceLastPressRangeStringForMilliseconds:(uint64_t)(a4 * 1000.0)];
    v22 = [(CAMAnalyticsEvent *)v10 _eventMap];
    [v22 setObject:v21 forKeyedSubscript:@"timeSinceLastPressRange"];

    v23 = [NSNumber numberWithBool:v7];
    v24 = [(CAMAnalyticsEvent *)v10 _eventMap];
    [v24 setObject:v23 forKeyedSubscript:@"dynamicShutter"];

    v25 = [NSNumber numberWithBool:v6];
    v26 = [(CAMAnalyticsEvent *)v10 _eventMap];
    [v26 setObject:v25 forKeyedSubscript:@"responsiveShutter"];

    v27 = v10;
  }

  return v10;
}

- (id)eventName
{
  return @"shutter.ignored";
}

- (id)_timeSinceLastPressRangeStringForMilliseconds:(int64_t)a3
{
  if (_timeSinceLastPressRangeStringForMilliseconds__onceToken[0] != -1) {
    dispatch_once(_timeSinceLastPressRangeStringForMilliseconds__onceToken, &__block_literal_global_60);
  }
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  uint64_t v11 = __Block_byref_object_dispose__33;
  uint64_t v12 = @"5000+";
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__CAMAnalyticsIgnoredShutterEvent__timeSinceLastPressRangeStringForMilliseconds___block_invoke_54;
  v6[3] = &unk_263FA7060;
  v6[4] = &v7;
  v6[5] = a3;
  [(id)_timeSinceLastPressRangeStringForMilliseconds__bucketValues enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__CAMAnalyticsIgnoredShutterEvent__timeSinceLastPressRangeStringForMilliseconds___block_invoke()
{
  v0 = (void *)_timeSinceLastPressRangeStringForMilliseconds__bucketValues;
  _timeSinceLastPressRangeStringForMilliseconds__bucketValues = (uint64_t)&unk_26BDE0598;
}

void __81__CAMAnalyticsIgnoredShutterEvent__timeSinceLastPressRangeStringForMilliseconds___block_invoke_54(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (*(void *)(a1 + 40) < (int)[v9 intValue])
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"<%d", objc_msgSend(v9, "intValue"));
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

@end