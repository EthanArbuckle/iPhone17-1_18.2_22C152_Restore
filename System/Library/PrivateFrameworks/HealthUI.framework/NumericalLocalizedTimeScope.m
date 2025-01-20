@interface NumericalLocalizedTimeScope
@end

@implementation NumericalLocalizedTimeScope

uint64_t ___NumericalLocalizedTimeScope_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_NumericalLocalizedTimeScope_numericalTimeScopeFormatter;
  _NumericalLocalizedTimeScope_numericalTimeScopeFormatter = (uint64_t)v0;

  v2 = (void *)_NumericalLocalizedTimeScope_numericalTimeScopeFormatter;
  return [v2 setNumberStyle:0];
}

@end