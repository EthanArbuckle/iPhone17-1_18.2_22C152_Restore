@interface SAIntentGroupIntentSignal(INSExtensionService)
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_shouldUseExtendedFlowTimeout;
@end

@implementation SAIntentGroupIntentSignal(INSExtensionService)

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 629;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 628;
}

@end