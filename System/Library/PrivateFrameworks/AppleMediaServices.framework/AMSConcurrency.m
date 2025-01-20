@interface AMSConcurrency
+ (void)logFaultFromSwiftConcurrencyOnInternalBuild;
- (AMSConcurrency)init;
@end

@implementation AMSConcurrency

+ (void)logFaultFromSwiftConcurrencyOnInternalBuild
{
}

- (AMSConcurrency)init
{
  return (AMSConcurrency *)Concurrency.init()();
}

@end