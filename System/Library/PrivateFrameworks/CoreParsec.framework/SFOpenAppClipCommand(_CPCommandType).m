@interface SFOpenAppClipCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFOpenAppClipCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 6;
}

@end