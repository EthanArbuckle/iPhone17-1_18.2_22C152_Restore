@interface INInteraction(CMSCoding)
+ (uint64_t)instanceFromCMSCoded:()CMSCoding;
- (uint64_t)cmsCoded;
@end

@implementation INInteraction(CMSCoding)

- (uint64_t)cmsCoded
{
  return 0;
}

+ (uint64_t)instanceFromCMSCoded:()CMSCoding
{
  return 0;
}

@end