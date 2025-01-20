@interface SFSubscribeForUpdatesCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFSubscribeForUpdatesCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 39;
}

@end