@interface HKDiagnosticTestResult
@end

@implementation HKDiagnosticTestResult

void __102__HKDiagnosticTestResult_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [[HRMedicalRecordFormatter alloc] initWithConceptStore:a1[4] context:0];
  v5 = [(HRMedicalRecordFormatter *)v4 displayItemsFromRecord:a1[5]];
  id v6 = [v3 arrayByAddingObjectsFromArray:v5];

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __106__HKDiagnosticTestResult_Displayable__fetchObservationDetailItemsWithHealthRecordsStore_style_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _displayItemsForValuePreferedStyle:*(void *)(a1 + 56) healthRecordsStore:*(void *)(a1 + 40) signedClinicalDataRecord:a2 completion:*(void *)(a1 + 48)];
}

void __129__HKDiagnosticTestResult_Displayable___displayItemsForValuePreferedStyle_healthRecordsStore_signedClinicalDataRecord_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v39 = a2;
  id v9 = a4;
  if (*(unsigned char *)(a1 + 80)) {
    a3 = *(void **)(a1 + 32);
  }
  id v10 = a3;
  if (v39 && [v39 hasRenderableContent])
  {
    unint64_t v11 = *(void *)(a1 + 72);
    if (v11 >= 2)
    {
      if (v11 != 2) {
        goto LABEL_20;
      }
      id v12 = +[WDMedicalRecordDisplayItem timelineSummaryReferenceRangeItem];
      [v12 setChartValueWithRange:v39];
      [v12 setSeparatorStyle:0];
      [v12 setSeparatorHidden:0];
      [v12 setMedicalRecord:*(void *)(a1 + 40)];
      goto LABEL_18;
    }
    id v12 = +[WDMedicalRecordDisplayItem timelineSummaryReferenceRangeItem];
    [v12 setChartValueWithRange:v39];
    [v12 setSeparatorStyle:0];
    [v12 setSeparatorHidden:0];
  }
  else
  {
    unint64_t v13 = *(void *)(a1 + 72);
    if (v13 >= 2)
    {
      if (v13 != 2) {
        goto LABEL_20;
      }
      if (a5)
      {
        v20 = *(void **)(a1 + 56);
        v21 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_VALUE");
        v22 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT");
        v23 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v21 subtitle:v22];
        [v20 addObject:v23];

        v24 = *(void **)(a1 + 56);
        HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_DATA_ABSENT_REASON");
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        v25 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v12 subtitle:v10];
        [v24 addObject:v25];
      }
      else
      {
        if (v9)
        {
          v34 = NSString;
          v35 = HRLocalizedString(@"MEDICAL_RECORD_VALUE_UNIT_JOINT_%1$@_%2$@");
          objc_msgSend(v34, "stringWithFormat:", v35, v10, v9);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v12 = v10;
        }
        v36 = *(void **)(a1 + 56);
        v37 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_VALUE");
        v38 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v37 subtitle:v12];
        [v36 addObject:v38];
      }
      goto LABEL_19;
    }
    v14 = +[WDMedicalRecordDisplayItem timelineSummaryValueItem];
    id v12 = v14;
    if (!a5)
    {
      [v14 setValueString:v10];
      objc_msgSend(v12, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 40), "recordCategoryType"));
      [v12 setPlacement:5];
      [v12 setSeparatorStyle:0];
      [v12 setSeparatorHidden:1];
      [v12 setMedicalRecord:*(void *)(a1 + 40)];
      v26 = [*(id *)(a1 + 40) meaningfulDateTitle];
      [v12 setSubtitle:v26];

      v27 = *(void **)(a1 + 48);
      v28 = [*(id *)(a1 + 40) meaningfulDateTitle];
      v29 = [v27 attributedMeaningfulDateStringWithDateTitle:v28];
      [v12 setAttributedSubtitle:v29];

      if (v9)
      {
        v30 = +[HRProfileManager sharedInstance];
        v31 = [v30 currentProfile];
        v32 = [v31 ucumDisplayConverter];
        v33 = [v32 synonymForUCUMUnitString:v9];
        [v12 setUnitString:v33];
      }
      goto LABEL_18;
    }
    v15 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT");
    [v12 setValueString:v15];

    objc_msgSend(v12, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 40), "recordCategoryType"));
    [v12 setPlacement:5];
    [v12 setSeparatorStyle:0];
    [v12 setSeparatorHidden:1];
    [v12 setTitle:0];
  }
  [v12 setMedicalRecord:*(void *)(a1 + 40)];
  v16 = [*(id *)(a1 + 40) meaningfulDateTitle];
  [v12 setSubtitle:v16];

  v17 = *(void **)(a1 + 48);
  v18 = [*(id *)(a1 + 40) meaningfulDateTitle];
  v19 = [v17 attributedMeaningfulDateStringWithDateTitle:v18];
  [v12 setAttributedSubtitle:v19];

LABEL_18:
  [*(id *)(a1 + 56) addObject:v12];
LABEL_19:

LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 codings];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) codedValues];
    BOOL v8 = [v7 count] - 1 == a3;

    id v9 = (void *)MEMORY[0x1E4F2B120];
    id v10 = [v5 value];
    unint64_t v11 = [v9 inspectableValueCollectionSingleWithValue:v10];

    id v12 = (void *)MEMORY[0x1E4F2B120];
    unint64_t v13 = [v5 referenceRanges];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2;
    v16[3] = &unk_1E644AAD0;
    uint64_t v14 = *(void *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 64);
    v16[4] = v14;
    BOOL v21 = v8;
    id v17 = v15;
    id v18 = *(id *)(a1 + 56);
    id v19 = v5;
    [v12 parseUncodedValueCollection:v11 referenceRanges:v13 withCompletion:v16];
  }
}

void __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  unint64_t v13 = *(void *)(a1 + 64);
  if (v13 < 2)
  {
    if (a5)
    {
      id v14 = +[WDMedicalRecordDisplayItem timelineSummaryValueItem];
      v15 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT");
      [v14 setValueString:v15];

      objc_msgSend(v14, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 32), "recordCategoryType"));
      [v14 setPlacement:4];
      [v14 setSeparatorStyle:0];
      [v14 setSeparatorHidden:0];
      [v14 setTitle:0];
      [v14 setMedicalRecord:*(void *)(a1 + 32)];
      if (*(unsigned char *)(a1 + 72))
      {
        v16 = [*(id *)(a1 + 32) meaningfulDateTitle];
        [v14 setSubtitle:v16];

        id v17 = *(void **)(a1 + 40);
        id v18 = [*(id *)(a1 + 32) meaningfulDateTitle];
        id v19 = [v17 attributedMeaningfulDateStringWithDateTitle:v18];
        [v14 setAttributedSubtitle:v19];
      }
      [*(id *)(a1 + 48) addObject:v14];
      goto LABEL_24;
    }
    v28 = [*(id *)(a1 + 56) ontologyConcept];
    id v14 = [v28 localizedPreferredName];

    v29 = +[WDMedicalRecordDisplayItem timelineSummaryValueItem];
    [v29 setValueString:v10];
    objc_msgSend(v29, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 32), "recordCategoryType"));
    [v29 setPlacement:4];
    [v29 setSeparatorStyle:0];
    [v29 setSeparatorHidden:0];
    [v29 setTitle:v14];
    [v29 setMedicalRecord:*(void *)(a1 + 32)];
    if (*(unsigned char *)(a1 + 72))
    {
      v30 = [*(id *)(a1 + 32) meaningfulDateTitle];
      [v29 setSubtitle:v30];

      v31 = *(void **)(a1 + 40);
      v32 = [*(id *)(a1 + 32) meaningfulDateTitle];
      v33 = [v31 attributedMeaningfulDateStringWithDateTitle:v32];
      [v29 setAttributedSubtitle:v33];
    }
    if (v12)
    {
      v34 = +[HRProfileManager sharedInstance];
      v35 = [v34 currentProfile];
      v36 = [v35 ucumDisplayConverter];
      v37 = [v36 synonymForUCUMUnitString:v12];
      [v29 setUnitString:v37];
    }
    [*(id *)(a1 + 48) addObject:v29];
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (v13 == 2)
  {
    if (!a5)
    {
      if (v11)
      {
        v38 = NSString;
        id v39 = HRLocalizedString(@"MEDICAL_RECORD_VALUE_UNIT_JOINT_%1$@_%2$@");
        objc_msgSend(v38, "stringWithFormat:", v39, v10, v12);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = v10;
      }
      v40 = [*(id *)(a1 + 56) ontologyConcept];
      v29 = [v40 localizedPreferredName];

      v41 = objc_msgSend(v29, "hk_copyNonEmptyString");
      v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        id v43 = [MEMORY[0x1E4F2AF58] defaultDisplayString];
      }
      v44 = v43;

      v45 = *(void **)(a1 + 48);
      v46 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v44 subtitle:v14 extraTopPadding:0];
      [v45 addObject:v46];

      goto LABEL_23;
    }
    _HKInitializeLogging();
    uint64_t v20 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2_cold_1(v20);
    }
    BOOL v21 = *(void **)(a1 + 48);
    v22 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_VALUE");
    v23 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT");
    v24 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v22 subtitle:v23];
    [v21 addObject:v24];

    v25 = *(void **)(a1 + 48);
    v26 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TITLE_DATA_ABSENT_REASON");
    v27 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v26 subtitle:v10];
    [v25 addObject:v27];
  }
LABEL_25:
}

void __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "Encountered unexpected data absent reason in coded value collection.", v1, 2u);
}

@end