@interface SFPerformEntityQueryCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFPerformEntityQueryCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 29;
}

@end