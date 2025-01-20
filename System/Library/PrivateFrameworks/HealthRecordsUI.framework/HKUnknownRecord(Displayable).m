@interface HKUnknownRecord(Displayable)
- (__CFString)meaningfulDateString;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:;
@end

@implementation HKUnknownRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(@"UNKNOWN_DETAIL_TITLE");
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_UNKNOWN_RECORD_TITLE");
}

- (__CFString)meaningfulDateString
{
  return &stru_1F1D9FF30;
}

- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke;
  v9[3] = &unk_1E644AB20;
  v9[4] = a1;
  id v10 = v7;
  id v8 = v7;
  [a3 stringifyExtractionFailureReasonsForRecord:a1 completion:v9];
}

@end