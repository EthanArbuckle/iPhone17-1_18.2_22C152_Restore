@interface SFRequestAppClipInstallCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFRequestAppClipInstallCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 8;
}

@end