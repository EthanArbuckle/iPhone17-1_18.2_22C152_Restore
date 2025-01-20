@interface HKCoverageRecord(Displayable)
- (__CFString)meaningfulDateString;
- (id)codings;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKCoverageRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"INSURANCE_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 coverageTypeCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_INSURANCE_TITLE");
}

- (__CFString)meaningfulDateString
{
  v2 = [a1 sortDate];
  v3 = [v2 keyPath];
  if ([v3 isEqualToString:*MEMORY[0x1E4F29968]])
  {

LABEL_4:
    v7 = &stru_1F1D9FF30;
    goto LABEL_6;
  }
  v4 = [a1 sortDate];
  v5 = [v4 keyPath];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F29960]];

  if (v6) {
    goto LABEL_4;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&off_1F1E24B18;
  objc_msgSendSuper2(&v9, sel_meaningfulDateString);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return v7;
}

@end