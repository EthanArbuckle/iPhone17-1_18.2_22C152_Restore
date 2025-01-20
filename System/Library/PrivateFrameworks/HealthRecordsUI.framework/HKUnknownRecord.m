@interface HKUnknownRecord
@end

@implementation HKUnknownRecord

void __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_DEBUG)) {
      __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke_cold_1(v7);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    v9 = HRNewlineJoinedStrings();
    v10 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_EXTRACTION_FAILURE_REASON");
    v11 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v10 subtitle:v9 extraTopPadding:0];

    if (v11) {
      [v8 addObject:v11];
    }
  }
  v12 = [*(id *)(a1 + 32) note];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_NOTE");
    v15 = [*(id *)(a1 + 32) note];
    v16 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v14 subtitle:v15 extraTopPadding:0];
    [v8 addObject:v16];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = HKSensitiveLogItem();
  int v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1C21A1000, v1, OS_LOG_TYPE_DEBUG, "Error stringifying failure reasons: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end