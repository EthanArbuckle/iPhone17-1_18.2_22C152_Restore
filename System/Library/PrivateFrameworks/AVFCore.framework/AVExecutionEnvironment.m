@interface AVExecutionEnvironment
+ (id)currentPlatformIdentifier;
+ (id)sharedExecutionEnvironment;
+ (void)initialize;
+ (void)resetPlatformIdentifierForQueue:(id)a3;
+ (void)setPlatformIdentifier:(id)a3 forQueue:(id)a4;
- (NSString)platformIdentifier;
@end

@implementation AVExecutionEnvironment

- (NSString)platformIdentifier
{
  v2 = objc_opt_class();
  return (NSString *)[v2 currentPlatformIdentifier];
}

+ (id)sharedExecutionEnvironment
{
  if (sharedExecutionEnvironment_onceToken != -1) {
    dispatch_once(&sharedExecutionEnvironment_onceToken, &__block_literal_global_18);
  }
  return (id)sharedExecutionEnvironment_sSharedExecutionEnvironment;
}

+ (id)currentPlatformIdentifier
{
  id result = dispatch_get_specific(@"AVExecutionEnvironmentCurrentPlatformIdentifierKey");
  if (!result) {
    return @"AVPlatformIdentifierIOS";
  }
  return result;
}

AVExecutionEnvironment *__52__AVExecutionEnvironment_sharedExecutionEnvironment__block_invoke()
{
  id result = objc_alloc_init(AVExecutionEnvironment);
  sharedExecutionEnvironment_sSharedExecutionEnvironment = (uint64_t)result;
  return result;
}

+ (void)initialize
{
}

+ (void)setPlatformIdentifier:(id)a3 forQueue:(id)a4
{
  id v5 = a3;
  dispatch_queue_set_specific((dispatch_queue_t)a4, @"AVExecutionEnvironmentCurrentPlatformIdentifierKey", v5, AVExecutionEnvironmentReleaseObject);
}

+ (void)resetPlatformIdentifierForQueue:(id)a3
{
}

@end