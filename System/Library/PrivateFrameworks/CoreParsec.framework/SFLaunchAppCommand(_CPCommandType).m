@interface SFLaunchAppCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFLaunchAppCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 10;
}

@end