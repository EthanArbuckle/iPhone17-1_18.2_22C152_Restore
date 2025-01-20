@interface MSMessageLiveLayout
- (NSArray)ppl_requiredCapabilities;
- (void)setPpl_requiredCapabilities:(id)a3;
@end

@implementation MSMessageLiveLayout

- (void)setPpl_requiredCapabilities:(id)a3
{
}

- (NSArray)ppl_requiredCapabilities
{
  return (NSArray *)[(MSMessageLiveLayout *)self requiredCapabilities];
}

@end