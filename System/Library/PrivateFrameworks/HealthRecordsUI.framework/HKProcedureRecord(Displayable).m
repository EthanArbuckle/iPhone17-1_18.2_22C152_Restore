@interface HKProcedureRecord(Displayable)
- (id)codings;
- (id)meaningfulDateTitle;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
@end

@implementation HKProcedureRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"PROCEDURE_DETAIL_TITLE");
}

- (id)codings
{
  v1 = [a1 procedureCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (id)meaningfulDateTitle
{
  if ([a1 notPerformed]) {
    HRLocalizedString(@"PROCEDURE_RECORD_SORT_DATE_TITLE_NOT_PERFORMED");
  }
  else {
  v2 = [a1 sortDateTitle];
  }
  return v2;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_PROCEDURE_TITLE");
}

@end