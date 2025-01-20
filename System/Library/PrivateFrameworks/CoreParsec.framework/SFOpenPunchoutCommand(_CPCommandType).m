@interface SFOpenPunchoutCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFOpenPunchoutCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 4;
}

@end