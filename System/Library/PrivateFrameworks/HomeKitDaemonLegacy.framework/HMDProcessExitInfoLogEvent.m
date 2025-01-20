@interface HMDProcessExitInfoLogEvent
- (HMDProcessExitInfoLogEvent)initWithExitType:(id)a3 reason:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)exitReason;
- (NSString)exitType;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDProcessExitInfoLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_exitType, 0);
}

- (NSString)exitReason
{
  return self->_exitReason;
}

- (NSString)exitType
{
  return self->_exitType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"exitType";
  v3 = [(HMDProcessExitInfoLogEvent *)self exitType];
  if (v3) {
    [(HMDProcessExitInfoLogEvent *)self exitType];
  }
  else {
  v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[0] = v4;
  v9[1] = @"exitReason";
  v5 = [(HMDProcessExitInfoLogEvent *)self exitReason];
  if (v5) {
    [(HMDProcessExitInfoLogEvent *)self exitReason];
  }
  else {
  v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[2] = @"exitCount";
  v10[1] = v6;
  v10[2] = &unk_1F2DC7678;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.processLaunch.exitInfo";
}

- (HMDProcessExitInfoLogEvent)initWithExitType:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDProcessExitInfoLogEvent;
  v9 = [(HMMLogEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exitType, a3);
    objc_storeStrong((id *)&v10->_exitReason, a4);
  }

  return v10;
}

@end