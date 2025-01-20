@interface SFPlayVideoCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFPlayVideoCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 21;
}

@end