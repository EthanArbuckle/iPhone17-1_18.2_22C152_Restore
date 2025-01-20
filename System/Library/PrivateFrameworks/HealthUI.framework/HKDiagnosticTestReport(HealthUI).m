@interface HKDiagnosticTestReport(HealthUI)
- (id)displayItems;
- (id)localizedStatusDisplayString;
@end

@implementation HKDiagnosticTestReport(HealthUI)

- (id)localizedStatusDisplayString
{
  v1 = [a1 status];
  v2 = [v1 localizedPreferredName];

  return v2;
}

- (id)displayItems
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [a1 recordItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  v4 = [a1 statusItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  v5 = (void *)[v2 copy];
  return v5;
}

@end