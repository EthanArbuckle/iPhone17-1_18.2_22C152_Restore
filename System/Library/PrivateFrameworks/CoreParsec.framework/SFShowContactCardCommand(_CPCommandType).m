@interface SFShowContactCardCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFShowContactCardCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 1;
}

@end