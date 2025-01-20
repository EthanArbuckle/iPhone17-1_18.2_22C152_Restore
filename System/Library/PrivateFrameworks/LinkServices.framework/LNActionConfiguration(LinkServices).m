@interface LNActionConfiguration(LinkServices)
- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices;
- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices context:;
@end

@implementation LNActionConfiguration(LinkServices)

- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices context:
{
  return 0;
}

- (uint64_t)actionConfigurationByEvaluatingAction:()LinkServices
{
  return [a1 actionConfigurationByEvaluatingAction:a3 context:0];
}

@end