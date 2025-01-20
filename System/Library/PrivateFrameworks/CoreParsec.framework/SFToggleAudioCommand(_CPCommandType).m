@interface SFToggleAudioCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFToggleAudioCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 25;
}

@end