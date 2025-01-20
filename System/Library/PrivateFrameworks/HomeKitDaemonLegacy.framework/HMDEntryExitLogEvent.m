@interface HMDEntryExitLogEvent
+ (id)entryLogEvent:(double)a3 isFalse:(BOOL)a4 isInitial:(BOOL)a5;
+ (id)exitLogEvent:(double)a3 isFalse:(BOOL)a4 isInitial:(BOOL)a5;
- (BOOL)isEntry;
- (BOOL)isExit;
- (BOOL)isFalse;
- (BOOL)isInitial;
- (HMDEntryExitLogEvent)initWithReason:(unint64_t)a3 isFalse:(BOOL)a4 lastFired:(double)a5 isInitial:(BOOL)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (double)secondsLastFired;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDEntryExitLogEvent

- (double)secondsLastFired
{
  return self->_secondsLastFired;
}

- (BOOL)isInitial
{
  return self->_isInitial;
}

- (BOOL)isFalse
{
  return self->_isFalse;
}

- (BOOL)isExit
{
  return self->_isExit;
}

- (BOOL)isEntry
{
  return self->_isEntry;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v19[6] = *MEMORY[0x1E4F143B8];
  if ([(HMDEntryExitLogEvent *)self isInitial])
  {
    v18[0] = @"isEntry_INT";
    if ([(HMDEntryExitLogEvent *)self isEntry]) {
      v3 = &unk_1F2DC7E28;
    }
    else {
      v3 = &unk_1F2DC7E40;
    }
    v19[0] = v3;
    v18[1] = @"isEntry_BOOL";
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEntryExitLogEvent isEntry](self, "isEntry"));
    v19[1] = v4;
    v18[2] = @"isExit_INT";
    if ([(HMDEntryExitLogEvent *)self isExit]) {
      v5 = &unk_1F2DC7E28;
    }
    else {
      v5 = &unk_1F2DC7E40;
    }
    v19[2] = v5;
    v18[3] = @"isExit_BOOL";
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEntryExitLogEvent isExit](self, "isExit"));
    v19[3] = v6;
    v18[4] = @"isFalse_INT";
    if ([(HMDEntryExitLogEvent *)self isFalse]) {
      v7 = &unk_1F2DC7E28;
    }
    else {
      v7 = &unk_1F2DC7E40;
    }
    v19[4] = v7;
    v18[5] = @"isFalse_BOOL";
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEntryExitLogEvent isFalse](self, "isFalse"));
    v19[5] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  }
  else
  {
    v16[0] = @"isEntry_INT";
    if ([(HMDEntryExitLogEvent *)self isEntry]) {
      v10 = &unk_1F2DC7E28;
    }
    else {
      v10 = &unk_1F2DC7E40;
    }
    v17[0] = v10;
    v16[1] = @"isEntry_BOOL";
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEntryExitLogEvent isEntry](self, "isEntry"));
    v17[1] = v4;
    v16[2] = @"isExit_INT";
    if ([(HMDEntryExitLogEvent *)self isExit]) {
      v11 = &unk_1F2DC7E28;
    }
    else {
      v11 = &unk_1F2DC7E40;
    }
    v17[2] = v11;
    v16[3] = @"isExit_BOOL";
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEntryExitLogEvent isExit](self, "isExit"));
    v17[3] = v6;
    v16[4] = @"isFalse_INT";
    if ([(HMDEntryExitLogEvent *)self isFalse]) {
      v12 = &unk_1F2DC7E28;
    }
    else {
      v12 = &unk_1F2DC7E40;
    }
    v17[4] = v12;
    v16[5] = @"isFalse_BOOL";
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEntryExitLogEvent isFalse](self, "isFalse"));
    v17[5] = v8;
    v16[6] = @"secondsLastFired_DOUBLE";
    v13 = NSNumber;
    [(HMDEntryExitLogEvent *)self secondsLastFired];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    v17[6] = v14;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];
  }
  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.entryExit";
}

- (HMDEntryExitLogEvent)initWithReason:(unint64_t)a3 isFalse:(BOOL)a4 lastFired:(double)a5 isInitial:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HMDEntryExitLogEvent;
  result = [(HMMLogEvent *)&v11 init];
  if (result)
  {
    result->_isEntry = a3 == 0;
    result->_isExit = a3 == 1;
    result->_secondsLastFired = a5;
    result->_isFalse = a4;
    result->_isInitial = a6;
  }
  return result;
}

+ (id)exitLogEvent:(double)a3 isFalse:(BOOL)a4 isInitial:(BOOL)a5
{
  v5 = [[HMDEntryExitLogEvent alloc] initWithReason:1 isFalse:a4 lastFired:a5 isInitial:a3];
  return v5;
}

+ (id)entryLogEvent:(double)a3 isFalse:(BOOL)a4 isInitial:(BOOL)a5
{
  v5 = [[HMDEntryExitLogEvent alloc] initWithReason:0 isFalse:a4 lastFired:a5 isInitial:a3];
  return v5;
}

@end