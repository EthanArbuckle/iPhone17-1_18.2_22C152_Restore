@interface SFShowSFCardCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFShowSFCardCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 2;
}

@end