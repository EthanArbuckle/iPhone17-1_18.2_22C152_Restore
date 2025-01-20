@interface HMDRegionStateCorrectnessLogEvent
+ (id)updateWithFirstAccessory:(int64_t)a3 nearbyHome:(int64_t)a4;
+ (id)updateWithRegion:(int64_t)a3 nearbyHome:(int64_t)a4 accessoryReachable:(BOOL)a5;
- (BOOL)firstAccessoryReachable;
- (BOOL)isStateCorrect;
- (BOOL)regionStateAtHome;
- (BOOL)regionStateNearByHome;
- (BOOL)regionStateUnknown;
- (HMDRegionStateCorrectnessLogEvent)initWithReason:(unint64_t)a3 firstAccessoryReachable:(BOOL)a4 regionStateAtHome:(int64_t)a5 regionStateNearByHome:(int64_t)a6 isStateCorrect:(BOOL)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDRegionStateCorrectnessLogEvent

- (BOOL)isStateCorrect
{
  return self->_isStateCorrect;
}

- (BOOL)regionStateUnknown
{
  return self->_regionStateUnknown;
}

- (BOOL)regionStateNearByHome
{
  return self->_regionStateNearByHome;
}

- (BOOL)regionStateAtHome
{
  return self->_regionStateAtHome;
}

- (BOOL)firstAccessoryReachable
{
  return self->_firstAccessoryReachable;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v17[11] = *MEMORY[0x263EF8340];
  v16[0] = @"firstAccessoryReachable_INT";
  if ([(HMDRegionStateCorrectnessLogEvent *)self firstAccessoryReachable]) {
    v3 = &unk_26E471848;
  }
  else {
    v3 = &unk_26E471860;
  }
  v17[0] = v3;
  v16[1] = @"firstAccessoryReachable_BOOL";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent firstAccessoryReachable](self, "firstAccessoryReachable"));
  v17[1] = v4;
  v16[2] = @"regionStateAtHome_INT";
  if ([(HMDRegionStateCorrectnessLogEvent *)self regionStateAtHome]) {
    v5 = &unk_26E471848;
  }
  else {
    v5 = &unk_26E471860;
  }
  v17[2] = v5;
  v16[3] = @"regionStateAtHome_BOOL";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent regionStateAtHome](self, "regionStateAtHome"));
  v17[3] = v6;
  v16[4] = @"regionStateNearByHome_INT";
  if ([(HMDRegionStateCorrectnessLogEvent *)self regionStateNearByHome]) {
    v7 = &unk_26E471848;
  }
  else {
    v7 = &unk_26E471860;
  }
  v17[4] = v7;
  v16[5] = @"regionStateNearByHome_BOOL";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent regionStateNearByHome](self, "regionStateNearByHome"));
  v17[5] = v8;
  v16[6] = @"regionStateUnknown_INT";
  if ([(HMDRegionStateCorrectnessLogEvent *)self regionStateUnknown]) {
    v9 = &unk_26E471848;
  }
  else {
    v9 = &unk_26E471860;
  }
  v17[6] = v9;
  v16[7] = @"regionStateUnknown_Bool";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent regionStateUnknown](self, "regionStateUnknown"));
  v17[7] = v10;
  v16[8] = @"isStateCorrect_INT";
  if ([(HMDRegionStateCorrectnessLogEvent *)self isStateCorrect]) {
    v11 = &unk_26E471848;
  }
  else {
    v11 = &unk_26E471860;
  }
  v17[8] = v11;
  v16[9] = @"isStateCorrect_Bool";
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent isStateCorrect](self, "isStateCorrect"));
  v17[9] = v12;
  v16[10] = @"isStateIncorrect_INT";
  if ([(HMDRegionStateCorrectnessLogEvent *)self isStateCorrect]) {
    v13 = &unk_26E471860;
  }
  else {
    v13 = &unk_26E471848;
  }
  v17[10] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:11];

  return (NSDictionary *)v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.regionStateCorrectness";
}

- (HMDRegionStateCorrectnessLogEvent)initWithReason:(unint64_t)a3 firstAccessoryReachable:(BOOL)a4 regionStateAtHome:(int64_t)a5 regionStateNearByHome:(int64_t)a6 isStateCorrect:(BOOL)a7
{
  v14.receiver = self;
  v14.super_class = (Class)HMDRegionStateCorrectnessLogEvent;
  result = [(HMMLogEvent *)&v14 init];
  if (result)
  {
    if (a5) {
      BOOL v12 = a6 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    BOOL v13 = v12;
    result->_firstAccessoryReachable = a4;
    result->_regionStateAtHome = a5 == 1;
    result->_regionStateNearByHome = a6 == 1;
    result->_regionStateUnknown = v13;
    result->_isStateCorrect = a7;
  }
  return result;
}

+ (id)updateWithRegion:(int64_t)a3 nearbyHome:(int64_t)a4 accessoryReachable:(BOOL)a5
{
  if (a3 == 1 && a4 == 1) {
    goto LABEL_3;
  }
  if ((a3 != 1 || a4 != 2) && (a3 != 1 || a4))
  {
    if (a3 == 2 && (unint64_t)(a4 - 1) < 2)
    {
LABEL_3:
      uint64_t v5 = 1;
      goto LABEL_9;
    }
    if ((a3 != 2 || a4) && (a3 || a4 != 1))
    {
      if (a3) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = a4 == 2;
      }
      uint64_t v5 = !v8 && (a4 | a3) == 0;
      goto LABEL_9;
    }
  }
  uint64_t v5 = 0;
LABEL_9:
  v6 = [[HMDRegionStateCorrectnessLogEvent alloc] initWithReason:1 firstAccessoryReachable:a5 regionStateAtHome:a3 regionStateNearByHome:a4 isStateCorrect:v5];
  return v6;
}

+ (id)updateWithFirstAccessory:(int64_t)a3 nearbyHome:(int64_t)a4
{
  if (a3 == 1 && a4 == 1) {
    goto LABEL_3;
  }
  if ((a3 != 1 || a4 != 2) && (a3 != 1 || a4))
  {
    if (a3 == 2 && a4 == 1)
    {
LABEL_3:
      uint64_t v4 = 1;
      goto LABEL_9;
    }
    BOOL v8 = a4 == 2 || a4 == 0;
    if ((a3 != 2 || !v8) && (a3 || a4 != 1))
    {
      if (a3) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = a4 == 2;
      }
      uint64_t v4 = !v9 && (a4 | a3) == 0;
      goto LABEL_9;
    }
  }
  uint64_t v4 = 0;
LABEL_9:
  uint64_t v5 = [[HMDRegionStateCorrectnessLogEvent alloc] initWithReason:0 firstAccessoryReachable:1 regionStateAtHome:a3 regionStateNearByHome:a4 isStateCorrect:v4];
  return v5;
}

@end