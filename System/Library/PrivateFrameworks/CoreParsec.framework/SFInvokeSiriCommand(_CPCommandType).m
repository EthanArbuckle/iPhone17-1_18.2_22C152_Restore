@interface SFInvokeSiriCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFInvokeSiriCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 18;
}

@end