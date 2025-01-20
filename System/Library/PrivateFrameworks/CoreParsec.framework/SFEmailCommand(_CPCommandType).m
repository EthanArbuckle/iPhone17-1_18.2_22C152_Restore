@interface SFEmailCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFEmailCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 23;
}

@end