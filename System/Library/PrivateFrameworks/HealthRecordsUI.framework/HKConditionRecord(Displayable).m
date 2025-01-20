@interface HKConditionRecord(Displayable)
- (id)codings;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKConditionRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"CONDITION_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 conditionCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_CONDITION_TITLE");
}

@end