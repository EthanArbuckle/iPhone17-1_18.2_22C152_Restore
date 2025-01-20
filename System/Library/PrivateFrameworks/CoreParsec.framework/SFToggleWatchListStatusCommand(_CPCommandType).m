@interface SFToggleWatchListStatusCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFToggleWatchListStatusCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 32;
}

@end