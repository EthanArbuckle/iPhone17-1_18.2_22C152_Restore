@interface ARUIRingsView(HKActivitySummary)
- (uint64_t)hk_configureWithActivitySummary:()HKActivitySummary animated:;
- (void)hk_configureWithActivitySummary:()HKActivitySummary animated:completion:;
- (void)hk_configureWithActivitySummary:()HKActivitySummary isStandaloneFallback:animated:completion:;
@end

@implementation ARUIRingsView(HKActivitySummary)

- (uint64_t)hk_configureWithActivitySummary:()HKActivitySummary animated:
{
  return objc_msgSend(a1, "hk_configureWithActivitySummary:animated:completion:", a3, a4, 0);
}

- (void)hk_configureWithActivitySummary:()HKActivitySummary animated:completion:
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 ringGroup];
  objc_msgSend(v10, "hk_configureWithActivitySummary:animated:completion:", v9, a4, v8);
}

- (void)hk_configureWithActivitySummary:()HKActivitySummary isStandaloneFallback:animated:completion:
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [a1 ringGroup];
  objc_msgSend(v12, "hk_configureWithActivitySummary:isStandaloneFallback:animated:completion:", v11, a4, a5, v10);
}

@end