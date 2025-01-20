@interface NSBundle(FeedbackCore)
+ (uint64_t)FeedbackCore;
@end

@implementation NSBundle(FeedbackCore)

+ (uint64_t)FeedbackCore
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();

  return [v0 bundleForClass:v1];
}

@end