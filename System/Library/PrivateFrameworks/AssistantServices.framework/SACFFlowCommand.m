@interface SACFFlowCommand
- (int64_t)ad_getNetworkActivityTracingLabel;
@end

@implementation SACFFlowCommand

- (int64_t)ad_getNetworkActivityTracingLabel
{
  return 8;
}

@end