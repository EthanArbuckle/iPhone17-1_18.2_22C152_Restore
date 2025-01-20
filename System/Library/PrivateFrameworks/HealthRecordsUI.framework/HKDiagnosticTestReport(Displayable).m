@interface HKDiagnosticTestReport(Displayable)
- (id)codings;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKDiagnosticTestReport(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"LAB_PANEL_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 diagnosticTestCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_LAB_TITLE");
}

@end