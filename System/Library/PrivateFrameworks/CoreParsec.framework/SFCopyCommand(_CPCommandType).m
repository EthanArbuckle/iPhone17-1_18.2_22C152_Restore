@interface SFCopyCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFCopyCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 31;
}

@end