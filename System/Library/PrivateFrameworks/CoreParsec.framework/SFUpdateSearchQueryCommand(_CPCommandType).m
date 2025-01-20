@interface SFUpdateSearchQueryCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFUpdateSearchQueryCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 16;
}

@end