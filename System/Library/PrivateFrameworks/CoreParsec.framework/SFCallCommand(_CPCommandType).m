@interface SFCallCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFCallCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 22;
}

@end