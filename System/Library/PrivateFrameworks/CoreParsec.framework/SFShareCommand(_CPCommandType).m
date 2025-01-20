@interface SFShareCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFShareCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 30;
}

@end