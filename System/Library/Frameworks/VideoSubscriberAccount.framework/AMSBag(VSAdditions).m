@interface AMSBag(VSAdditions)
+ (uint64_t)vs_defaultBag;
@end

@implementation AMSBag(VSAdditions)

+ (uint64_t)vs_defaultBag
{
  return [MEMORY[0x1E4F4DBD8] bagForProfile:@"VideoSubscriberAccount" profileVersion:@"1"];
}

@end