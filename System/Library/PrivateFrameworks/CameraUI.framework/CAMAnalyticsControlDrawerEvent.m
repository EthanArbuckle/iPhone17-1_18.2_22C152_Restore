@interface CAMAnalyticsControlDrawerEvent
- (BOOL)_hasDismissingControlType;
- (BOOL)_hasOpeningControlType;
- (CAMAnalyticsControlDrawerEvent)initWithReason:(int64_t)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5;
- (NSMutableSet)_changedControlTypes;
- (double)_duration;
- (double)_startTime;
- (id)eventName;
- (int64_t)_captureMode;
- (int64_t)_devicePosition;
- (int64_t)_dismissingControlType;
- (int64_t)_dismissingReason;
- (int64_t)_openingControlType;
- (int64_t)_openingReason;
- (void)didChangeValueForControlType:(int64_t)a3;
- (void)dismissedControlDrawerWithReason:(int64_t)a3;
- (void)publish;
- (void)setDismissingControlType:(int64_t)a3;
- (void)setOpeningControlType:(int64_t)a3;
- (void)set_dismissingControlType:(int64_t)a3;
- (void)set_dismissingReason:(int64_t)a3;
- (void)set_duration:(double)a3;
- (void)set_hasDismissingControlType:(BOOL)a3;
- (void)set_hasOpeningControlType:(BOOL)a3;
- (void)set_openingControlType:(int64_t)a3;
@end

@implementation CAMAnalyticsControlDrawerEvent

- (CAMAnalyticsControlDrawerEvent)initWithReason:(int64_t)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CAMAnalyticsControlDrawerEvent;
  v8 = [(CAMAnalyticsEvent *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->__openingReason = a3;
    v8->__captureMode = a4;
    v8->__devicePosition = a5;
    v8->__startTime = CFAbsoluteTimeGetCurrent();
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    changedControlTypes = v9->__changedControlTypes;
    v9->__changedControlTypes = v10;
  }
  return v9;
}

- (id)eventName
{
  return @"control.drawer";
}

- (void)setOpeningControlType:(int64_t)a3
{
  [(CAMAnalyticsControlDrawerEvent *)self set_openingControlType:a3];
  [(CAMAnalyticsControlDrawerEvent *)self set_hasOpeningControlType:1];
}

- (void)setDismissingControlType:(int64_t)a3
{
  [(CAMAnalyticsControlDrawerEvent *)self set_dismissingControlType:a3];
  [(CAMAnalyticsControlDrawerEvent *)self set_hasDismissingControlType:1];
}

- (void)dismissedControlDrawerWithReason:(int64_t)a3
{
  [(CAMAnalyticsControlDrawerEvent *)self set_dismissingReason:a3];
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsControlDrawerEvent *)self _startTime];
  [(CAMAnalyticsControlDrawerEvent *)self set_duration:Current - v5];
  [(CAMAnalyticsControlDrawerEvent *)self publish];
}

- (void)didChangeValueForControlType:(int64_t)a3
{
  double v5 = [(CAMAnalyticsControlDrawerEvent *)self _changedControlTypes];
  v6 = [NSNumber numberWithInteger:a3];
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    id v9 = [(CAMAnalyticsControlDrawerEvent *)self _changedControlTypes];
    v8 = [NSNumber numberWithInteger:a3];
    [v9 addObject:v8];
  }
}

- (void)publish
{
  v3 = [(CAMAnalyticsEvent *)self _eventMap];
  unint64_t v4 = [(CAMAnalyticsControlDrawerEvent *)self _openingReason];
  if (v4 > 0xA) {
    double v5 = 0;
  }
  else {
    double v5 = off_263FA0EE8[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"openingReason"];
  unint64_t v6 = [(CAMAnalyticsControlDrawerEvent *)self _captureMode];
  if (v6 > 9) {
    char v7 = 0;
  }
  else {
    char v7 = off_263FA0E98[v6];
  }
  [v3 setObject:v7 forKeyedSubscript:@"captureMode"];
  int64_t v8 = [(CAMAnalyticsControlDrawerEvent *)self _devicePosition];
  id v9 = @"Front";
  if (v8 != 1) {
    id v9 = 0;
  }
  if (v8) {
    v10 = v9;
  }
  else {
    v10 = @"Back";
  }
  [v3 setObject:v10 forKeyedSubscript:@"devicePosition"];
  if ([(CAMAnalyticsControlDrawerEvent *)self _hasOpeningControlType]
    && [(CAMAnalyticsControlDrawerEvent *)self _openingReason] != 2)
  {
    unint64_t v11 = [(CAMAnalyticsControlDrawerEvent *)self _openingControlType];
    if (v11 > 0xF) {
      v12 = 0;
    }
    else {
      v12 = off_263FA0F40[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"openingControlType"];
  }
  objc_super v13 = NSNumber;
  [(CAMAnalyticsControlDrawerEvent *)self _duration];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  [v3 setObject:v14 forKeyedSubscript:@"duration"];

  v15 = objc_opt_class();
  [(CAMAnalyticsControlDrawerEvent *)self _duration];
  v16 = objc_msgSend(v15, "durationRangeStringForDuration:");
  [v3 setObject:v16 forKeyedSubscript:@"durationRange"];

  unint64_t v17 = [(CAMAnalyticsControlDrawerEvent *)self _dismissingReason];
  if (v17 > 0xA) {
    v18 = 0;
  }
  else {
    v18 = off_263FA0EE8[v17];
  }
  [v3 setObject:v18 forKeyedSubscript:@"dismissingReason"];
  if ([(CAMAnalyticsControlDrawerEvent *)self _hasDismissingControlType]
    && [(CAMAnalyticsControlDrawerEvent *)self _dismissingReason] != 2)
  {
    unint64_t v19 = [(CAMAnalyticsControlDrawerEvent *)self _dismissingControlType];
    if (v19 > 0xF) {
      v20 = 0;
    }
    else {
      v20 = off_263FA0F40[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"dismissingControlType"];
  }
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  v22 = [(CAMAnalyticsControlDrawerEvent *)self _changedControlTypes];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __41__CAMAnalyticsControlDrawerEvent_publish__block_invoke;
  v26[3] = &unk_263FA0E78;
  id v23 = v21;
  id v27 = v23;
  [v22 enumerateObjectsUsingBlock:v26];

  [v23 sortUsingSelector:sel_compare_];
  if ([v23 count])
  {
    v24 = [v23 componentsJoinedByString:@","];
    [v3 setObject:v24 forKeyedSubscript:@"changedControls"];
  }
  v25.receiver = self;
  v25.super_class = (Class)CAMAnalyticsControlDrawerEvent;
  [(CAMAnalyticsEvent *)&v25 publish];
}

uint64_t __41__CAMAnalyticsControlDrawerEvent_publish__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 integerValue];
  if (v3 > 0xF) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = off_263FA0F40[v3];
  }
  double v5 = *(void **)(a1 + 32);
  return [v5 addObject:v4];
}

- (int64_t)_openingReason
{
  return self->__openingReason;
}

- (int64_t)_dismissingReason
{
  return self->__dismissingReason;
}

- (void)set_dismissingReason:(int64_t)a3
{
  self->__dismissingReason = a3;
}

- (int64_t)_openingControlType
{
  return self->__openingControlType;
}

- (void)set_openingControlType:(int64_t)a3
{
  self->__openingControlType = a3;
}

- (BOOL)_hasOpeningControlType
{
  return self->__hasOpeningControlType;
}

- (void)set_hasOpeningControlType:(BOOL)a3
{
  self->__hasOpeningControlType = a3;
}

- (int64_t)_dismissingControlType
{
  return self->__dismissingControlType;
}

- (void)set_dismissingControlType:(int64_t)a3
{
  self->__dismissingControlType = a3;
}

- (BOOL)_hasDismissingControlType
{
  return self->__hasDismissingControlType;
}

- (void)set_hasDismissingControlType:(BOOL)a3
{
  self->__hasDismissingControlType = a3;
}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (int64_t)_devicePosition
{
  return self->__devicePosition;
}

- (double)_startTime
{
  return self->__startTime;
}

- (double)_duration
{
  return self->__duration;
}

- (void)set_duration:(double)a3
{
  self->__duration = a3;
}

- (NSMutableSet)_changedControlTypes
{
  return self->__changedControlTypes;
}

- (void).cxx_destruct
{
}

@end