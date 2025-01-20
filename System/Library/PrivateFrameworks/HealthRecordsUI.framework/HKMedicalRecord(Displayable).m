@interface HKMedicalRecord(Displayable)
- (BOOL)isRemovedFromRemote;
- (__CFString)subtitle;
- (id)conceptNameItems;
- (id)meaningfulDate;
- (id)meaningfulDateDisplayStringWithPreferredForm:()Displayable showTime:;
- (id)sortDateTitle;
- (uint64_t)canDefineConceptRoom;
- (uint64_t)codings;
- (uint64_t)fetchChartValueWithRangeWithHealthStore:()Displayable completion:;
- (uint64_t)fetchObservationDetailItemsWithHealthRecordsStore:()Displayable style:completion:;
- (uint64_t)isDateLess;
- (uint64_t)isDisplayable;
- (uint64_t)meaningfulDateString;
- (uint64_t)title;
- (uint64_t)titleDisplayStringForDetailViewController;
- (void)fetchAttachmentItemsWithHealthRecordsStore:()Displayable conceptStore:completion:;
- (void)fetchConceptRoomItemsWithHealthRecordsStore:()Displayable conceptStore:completion:;
- (void)fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:()Displayable completion:;
- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:;
- (void)fetchDisplayNameItemWithHealthRecordsStore:()Displayable completion:;
- (void)fetchStructuredFieldItemsWithHealthRecordsStore:()Displayable conceptStore:completion:;
@end

@implementation HKMedicalRecord(Displayable)

- (uint64_t)title
{
  return 0;
}

- (__CFString)subtitle
{
  return &stru_1F1D9FF30;
}

- (BOOL)isRemovedFromRemote
{
  return [a1 state] == 1;
}

- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  v7 = a5;
  id v8 = a4;
  v10 = [[HRMedicalRecordFormatter alloc] initWithConceptStore:v8 context:0];

  v9 = [(HRMedicalRecordFormatter *)v10 displayItemsFromRecord:a1];
  v7[2](v7, v9);
}

- (void)fetchStructuredFieldItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  v7 = a5;
  id v8 = a4;
  v11 = [[HRMedicalRecordFormatter alloc] initWithConceptStore:v8 context:0];

  v9 = [(HRMedicalRecordFormatter *)v11 structuredItemsFromRecord:a1];
  if ([v9 count]) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  ((void (**)(id, void *))v7)[2](v7, v10);
}

- (void)fetchConceptRoomItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  v7 = a5;
  id v8 = a4;
  v10 = [[HRMedicalRecordFormatter alloc] initWithConceptStore:v8 context:1];

  v9 = [(HRMedicalRecordFormatter *)v10 displayItemsFromRecord:a1];
  v7[2](v7, v9);
}

- (void)fetchDisplayNameItemWithHealthRecordsStore:()Displayable completion:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [a1 codings];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v21 = v5;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = [a1 codings];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v15 = [v14 displayString];
          uint64_t v16 = [v15 length];

          if (v16)
          {
            v17 = [v14 displayString];
            if ([v17 length]) {
              [v14 displayString];
            }
            else {
            v18 = HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TEXT_NO_TEXT");
            }

            v19 = [v14 formattedTitle];
            v20 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v19 subtitle:v18 extraTopPadding:0];
            [v6 addObject:v20];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    v5 = v21;
  }
  v5[2](v5, v6);
}

- (void)fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:()Displayable completion:
{
  id v10 = a3;
  id v6 = a4;
  v7 = [a1 originIdentifier];
  uint64_t v8 = [v7 signedClinicalDataRecordIdentifier];

  if (v8)
  {
    v9 = [[WDClinicalSourcesDataProvider alloc] initWithHealthRecordsStore:v10];
    [(WDClinicalSourcesDataProvider *)v9 fetchSignedClinicalDataRecordWithIdentifier:v8 completion:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)fetchAttachmentItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  v7 = a5;
  id v8 = a4;
  uint64_t v12 = [[HRMedicalRecordFormatter alloc] initWithConceptStore:v8 context:0];

  v9 = [(HRMedicalRecordFormatter *)v12 attachmentItemsTitleFromRecord:a1];
  id v10 = [(HRMedicalRecordFormatter *)v12 attachmentItemsFromRecord:a1];
  if ([v10 count]) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  ((void (**)(id, void *, void *))v7)[2](v7, v11, v9);
}

- (id)conceptNameItems
{
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = [a1 primaryConcept];
    v4 = [v3 groupByConcept];

    LODWORD(v3) = [v4 isAdHoc];
    v5 = NSString;
    id v6 = [v4 identifier];
    uint64_t v7 = [v6 numberRepresentation];
    id v8 = (void *)v7;
    if (v3) {
      v9 = @"Grouper Adhoc Concept (%@)";
    }
    else {
      v9 = @"Grouper Concept (%@)";
    }
    id v10 = objc_msgSend(v5, "stringWithFormat:", v9, v7);

    uint64_t v11 = [a1 displayNameForGroupByConcept];
    uint64_t v12 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v10 subtitle:v11 extraTopPadding:0];
    [v2 addObject:v12];

    v13 = [a1 primaryConcept];
    if (([v13 isEqual:v4] & 1) == 0)
    {
      int v14 = [v13 isAdHoc];
      v15 = NSString;
      uint64_t v16 = [v13 identifier];
      uint64_t v17 = [v16 numberRepresentation];
      v18 = (void *)v17;
      if (v14) {
        v19 = @"Primary Adhoc Concept (%@)";
      }
      else {
        v19 = @"Primary Concept (%@)";
      }
      v20 = objc_msgSend(v15, "stringWithFormat:", v19, v17);

      uint64_t v21 = [v13 localizedPreferredName];
      long long v22 = (void *)v21;
      if (v21) {
        long long v23 = (__CFString *)v21;
      }
      else {
        long long v23 = @"Primary Concept without CFN";
      }
      long long v24 = +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:v20 subtitle:v23 extraTopPadding:0];
      [v2 addObject:v24];
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (uint64_t)fetchChartValueWithRangeWithHealthStore:()Displayable completion:
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

- (uint64_t)fetchObservationDetailItemsWithHealthRecordsStore:()Displayable style:completion:
{
  return (*(uint64_t (**)(uint64_t, void))(a5 + 16))(a5, 0);
}

- (uint64_t)codings
{
  return 0;
}

- (id)meaningfulDate
{
  if ([a1 isDateLess])
  {
    id v2 = 0;
    goto LABEL_10;
  }
  v3 = [a1 sortDate];
  v4 = [v3 keyPath];
  v5 = [a1 valueForKeyPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = [a1 sortDate];
      id v2 = [v7 date];

      goto LABEL_9;
    }
    id v6 = [v5 dateForUTC];
  }
  id v2 = v6;
LABEL_9:

LABEL_10:
  return v2;
}

- (uint64_t)meaningfulDateString
{
  return [a1 meaningfulDateDisplayStringWithPreferredForm:0 showTime:1];
}

- (uint64_t)isDisplayable
{
  return 1;
}

- (uint64_t)isDateLess
{
  v1 = [a1 sortDate];
  id v2 = [v1 keyPath];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F29FD8]];

  return v3;
}

- (uint64_t)canDefineConceptRoom
{
  if (![a1 isDisplayable]) {
    return 0;
  }
  id v2 = [a1 primaryConcept];
  uint64_t v3 = [v2 isInMemory] ^ 1;

  return v3;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(@"RECORD_DETAIL_UNKNOWN_RECORD_TITLE");
}

- (id)sortDateTitle
{
  v1 = [a1 sortDate];
  id v2 = [v1 keyPath];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F29FD8]];

  if (v3)
  {
    v4 = HRLocalizedString(@"MEDICAL_RECORD_SORT_DATE_TITLE_MODIFIED_DATE");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)meaningfulDateDisplayStringWithPreferredForm:()Displayable showTime:
{
  if ([a1 isDateLess])
  {
    uint64_t v7 = HRLocalizedString(@"NO_DATE");
    goto LABEL_21;
  }
  id v8 = [a1 sortDate];
  v9 = [v8 keyPath];
  id v10 = [a1 valueForKeyPath:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 date];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v11 = [v10 dateValueForUTC];
  }
  uint64_t v12 = (void *)v11;

  id v10 = v12;
LABEL_8:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [MEMORY[0x1E4F2B188] displayStringForDate:v10 form:a3 originalTimeZoneString:0];
LABEL_19:
    uint64_t v7 = (void *)v13;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v17 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      -[HKMedicalRecord(Displayable) meaningfulDateDisplayStringWithPreferredForm:showTime:](v17);
    }
    uint64_t v13 = HRLocalizedString(@"NO_DATE");
    goto LABEL_19;
  }
  id v14 = v10;
  uint64_t v15 = [v14 form];
  if ((a4 & 1) == 0)
  {
    if (![v14 form])
    {
      uint64_t v16 = 1;
      goto LABEL_15;
    }
    uint64_t v15 = [v14 form];
  }
  uint64_t v16 = v15;
LABEL_15:
  uint64_t v7 = [v14 displayStringWithPreferredForm:v16 includeTimeZone:0];

LABEL_20:
LABEL_21:
  return v7;
}

- (void)meaningfulDateDisplayStringWithPreferredForm:()Displayable showTime:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_1C21A1000, v1, OS_LOG_TYPE_ERROR, "Unexpected sort date class: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end