@interface SFPerformContactQueryCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFPerformContactQueryCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 19;
}

@end