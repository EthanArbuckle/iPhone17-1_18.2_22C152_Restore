@interface NSNull(CMSCoding)
+ (uint64_t)instanceFromCMSCoded:()CMSCoding;
@end

@implementation NSNull(CMSCoding)

+ (uint64_t)instanceFromCMSCoded:()CMSCoding
{
  return [MEMORY[0x263EFF9D0] null];
}

@end