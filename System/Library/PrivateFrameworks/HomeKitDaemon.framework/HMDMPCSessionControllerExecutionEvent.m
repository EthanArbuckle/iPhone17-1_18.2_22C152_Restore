@interface HMDMPCSessionControllerExecutionEvent
+ (id)identifier;
- (BOOL)didPartiallySucceed;
- (NSString)resultString;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
- (void)setDidPartiallySucceed:(BOOL)a3;
@end

@implementation HMDMPCSessionControllerExecutionEvent

- (void)setDidPartiallySucceed:(BOOL)a3
{
  self->_didPartiallySucceed = a3;
}

- (BOOL)didPartiallySucceed
{
  return self->_didPartiallySucceed;
}

- (id)coreAnalyticsEventDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)HMDMPCSessionControllerExecutionEvent;
  v3 = [(HMDMediaPlaybackActionEvent *)&v7 coreAnalyticsEventDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDMPCSessionControllerExecutionEvent *)self resultString];
  [v4 setObject:v5 forKeyedSubscript:@"executionResult"];

  return v4;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.media.playbackAction.execution";
}

- (NSString)resultString
{
  uint64_t v3 = [(HMMLogEvent *)self error];
  if (v3)
  {
    v4 = (void *)v3;
    BOOL v5 = [(HMDMPCSessionControllerExecutionEvent *)self didPartiallySucceed];

    if (v5) {
      return (NSString *)@"Partial Success";
    }
  }
  objc_super v7 = [(HMMLogEvent *)self error];

  if (v7) {
    return (NSString *)@"Failure";
  }
  else {
    return (NSString *)@"Success";
  }
}

+ (id)identifier
{
  if (identifier_onceToken != -1) {
    dispatch_once(&identifier_onceToken, &__block_literal_global_261358);
  }
  v2 = (void *)identifier_identifier;
  return v2;
}

void __51__HMDMPCSessionControllerExecutionEvent_identifier__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08C38] UUID];
  v1 = (void *)identifier_identifier;
  identifier_identifier = v0;
}

@end