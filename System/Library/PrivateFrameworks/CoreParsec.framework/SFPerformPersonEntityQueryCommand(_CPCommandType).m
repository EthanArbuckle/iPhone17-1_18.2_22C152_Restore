@interface SFPerformPersonEntityQueryCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFPerformPersonEntityQueryCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 26;
}

@end