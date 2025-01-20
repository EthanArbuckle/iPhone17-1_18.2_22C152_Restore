@interface SFOpenCalculationCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFOpenCalculationCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 20;
}

@end