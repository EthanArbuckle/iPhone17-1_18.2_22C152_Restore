@interface HMTrigger
@end

@implementation HMTrigger

id __65__HMTrigger_HREAdditions__hre_triggerComparisonIdentifierInHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "hre_verboseHashForEvent:inHome:", v3, *(void *)(a1 + 40));

  return v4;
}

uint64_t __65__HMTrigger_HREAdditions__hre_triggerComparisonIdentifierInHome___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end