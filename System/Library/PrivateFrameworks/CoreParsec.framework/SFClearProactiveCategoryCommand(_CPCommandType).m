@interface SFClearProactiveCategoryCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFClearProactiveCategoryCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 43;
}

@end