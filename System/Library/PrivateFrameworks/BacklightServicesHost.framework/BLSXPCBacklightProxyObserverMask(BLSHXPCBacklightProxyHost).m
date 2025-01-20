@interface BLSXPCBacklightProxyObserverMask(BLSHXPCBacklightProxyHost)
- (uint64_t)noActivatingMask;
- (uint64_t)noPerformingEventMask;
@end

@implementation BLSXPCBacklightProxyObserverMask(BLSHXPCBacklightProxyHost)

- (uint64_t)noActivatingMask
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 isObservingDidCompleteUpdateToState];
  uint64_t v4 = [a1 isObservingEventsArray];
  uint64_t v5 = [a1 isObservingDidChangeAlwaysOnEnabled];
  uint64_t v6 = [a1 isObservingPerformingEvent];

  return [v2 maskForObservingDidCompleteUpdateToState:v3 observingEventsArray:v4 didChangeAlwaysOnEnabled:v5 activatingWithEvent:0 deactivatingWithEvent:0 performingEvent:v6];
}

- (uint64_t)noPerformingEventMask
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 isObservingDidCompleteUpdateToState];
  uint64_t v4 = [a1 isObservingEventsArray];
  uint64_t v5 = [a1 isObservingDidChangeAlwaysOnEnabled];
  uint64_t v6 = [a1 isObservingActivatingWithEvent];
  uint64_t v7 = [a1 isObservingDeactivatingWithEvent];

  return [v2 maskForObservingDidCompleteUpdateToState:v3 observingEventsArray:v4 didChangeAlwaysOnEnabled:v5 activatingWithEvent:v6 deactivatingWithEvent:v7 performingEvent:0];
}

@end