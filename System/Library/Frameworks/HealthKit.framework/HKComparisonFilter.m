@interface HKComparisonFilter
@end

@implementation HKComparisonFilter

uint64_t __54___HKComparisonFilter_areValidTypes_forKeyPath_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __68___HKComparisonFilter__isValidValue_forKeyPath_allowedClases_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  if (*(void *)(a1 + 32)) {
    return 0;
  }
  return objc_opt_class() == a2;
}

uint64_t __68___HKComparisonFilter__isValidValue_forKeyPath_allowedClases_error___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

@end