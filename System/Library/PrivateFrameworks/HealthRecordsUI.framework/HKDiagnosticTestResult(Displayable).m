@interface HKDiagnosticTestResult(Displayable)
- (id)codings;
- (id)title;
- (id)titleDisplayStringForDetailViewController;
- (void)_displayItemsForCodedValueCollection:()Displayable healthRecordsStore:preferredStyle:signedClinicalDataRecord:completion:;
- (void)_displayItemsForValuePreferedStyle:()Displayable healthRecordsStore:signedClinicalDataRecord:completion:;
- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:;
- (void)fetchObservationDetailItemsWithHealthRecordsStore:()Displayable style:completion:;
@end

@implementation HKDiagnosticTestResult(Displayable)

- (id)title
{
  v1 = [a1 category];
  v2 = HKDiagnosticTestResultCategoryFromNSString();

  if (v2 == (void *)*MEMORY[0x1E4F29A40])
  {
    v4 = @"LAB_DETAIL_TITLE";
  }
  else
  {
    if (v2 != (void *)*MEMORY[0x1E4F29A48])
    {
      v3 = 0;
      goto LABEL_7;
    }
    v4 = @"VITAL_DETAIL_TITLE";
  }
  v3 = HRLocalizedString(v4);
LABEL_7:

  return v3;
}

- (id)codings
{
  v1 = [a1 diagnosticTestCodingCollection];
  v2 = [v1 codings];

  return v2;
}

- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__HKDiagnosticTestResult_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke;
  v12[3] = &unk_1E644AA58;
  id v13 = v8;
  v14 = a1;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [a1 _displayItemsForValuePreferedStyle:2 healthRecordsStore:a3 signedClinicalDataRecord:0 completion:v12];
}

- (void)fetchObservationDetailItemsWithHealthRecordsStore:()Displayable style:completion:
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__HKDiagnosticTestResult_Displayable__fetchObservationDetailItemsWithHealthRecordsStore_style_completion___block_invoke;
  v12[3] = &unk_1E644AA80;
  void v12[4] = a1;
  id v13 = v8;
  id v14 = v9;
  uint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [a1 fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:v11 completion:v12];
}

- (void)_displayItemsForValuePreferedStyle:()Displayable healthRecordsStore:signedClinicalDataRecord:completion:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a1 value];
  id v14 = [v13 inspectableValue];
  uint64_t v15 = [v14 codedValueCollection];
  v16 = [v15 canonicalBloodPressureDisplay];

  v17 = [a1 primaryConcept];
  v18 = [v17 groupByConcept];
  char v19 = [v18 chartsBloodPressure];
  if (v16) {
    char v20 = v19;
  }
  else {
    char v20 = 0;
  }

  v21 = [a1 value];
  v22 = [v21 inspectableValue];
  uint64_t v23 = [v22 valueType];

  v24 = [a1 value];
  v25 = v24;
  if (v23 != 8 || (v20 & 1) != 0)
  {

    if (v25)
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v32 = (void *)MEMORY[0x1E4F2B120];
      v29 = [a1 value];
      v30 = [a1 referenceRanges];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __129__HKDiagnosticTestResult_Displayable___displayItemsForValuePreferedStyle_healthRecordsStore_signedClinicalDataRecord_completion___block_invoke;
      v33[3] = &unk_1E644AAA8;
      char v40 = v20;
      uint64_t v39 = a3;
      id v34 = v16;
      v35 = a1;
      id v36 = v11;
      id v37 = v28;
      id v38 = v12;
      id v31 = v28;
      [v32 parseValueCollection:v29 referenceRanges:v30 healthRecordsStore:v10 withCompletion:v33];
    }
    else
    {
      (*((void (**)(id, void))v12 + 2))(v12, MEMORY[0x1E4F1CBF0]);
    }
  }
  else
  {
    v26 = [v24 inspectableValue];
    v27 = [v26 codedValueCollection];
    [a1 _displayItemsForCodedValueCollection:v27 healthRecordsStore:v10 preferredStyle:a3 signedClinicalDataRecord:v11 completion:v12];
  }
}

- (void)_displayItemsForCodedValueCollection:()Displayable healthRecordsStore:preferredStyle:signedClinicalDataRecord:completion:
{
  id v11 = a3;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F1CA48];
  id v14 = a7;
  uint64_t v15 = [v13 array];
  v16 = [v11 codedValues];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke;
  v20[3] = &unk_1E644AAF8;
  id v24 = v15;
  uint64_t v25 = a5;
  id v21 = v11;
  uint64_t v22 = a1;
  id v23 = v12;
  id v17 = v15;
  id v18 = v12;
  id v19 = v11;
  [v16 enumerateObjectsUsingBlock:v20];

  v14[2](v14, v17);
}

- (id)titleDisplayStringForDetailViewController
{
  v1 = [a1 category];
  v2 = HKDiagnosticTestResultCategoryFromNSString();

  if (v2 == (void *)*MEMORY[0x1E4F29A48]) {
    v3 = @"RECORD_DETAIL_VITAL_TITLE";
  }
  else {
    v3 = @"RECORD_DETAIL_UNKNOWN_RECORD_TITLE";
  }
  if (v2 == (void *)*MEMORY[0x1E4F29A40]) {
    v4 = @"RECORD_DETAIL_LAB_TITLE";
  }
  else {
    v4 = v3;
  }
  v5 = HRLocalizedString(v4);

  return v5;
}

@end