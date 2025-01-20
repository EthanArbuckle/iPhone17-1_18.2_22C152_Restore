@interface SFSearchInAppCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFSearchInAppCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 15;
}

@end