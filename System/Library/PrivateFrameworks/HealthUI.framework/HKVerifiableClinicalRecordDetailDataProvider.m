@interface HKVerifiableClinicalRecordDetailDataProvider
- (HKSignedClinicalDataRecord)record;
- (HKVerifiableClinicalRecordDetailDataProvider)initWithSignedRecord:(id)a3 medicalRecords:(id)a4;
- (NSArray)medicalRecords;
- (NSMutableDictionary)displayItems;
- (NSMutableDictionary)sectionFooters;
- (NSMutableDictionary)sectionHeaders;
- (id)addressesItem;
- (id)birthSexItem;
- (id)birthdayItem;
- (id)displayItemForSection:(int64_t)a3 row:(int64_t)a4;
- (id)emailAddressesItem;
- (id)ethnicityItem;
- (id)expiresItem;
- (id)footerForSection:(int64_t)a3;
- (id)genderItem;
- (id)headerForSection:(int64_t)a3;
- (id)identifiersItem;
- (id)issuedItem;
- (id)maritalStatusItem;
- (id)nameItem;
- (id)phoneNumbersItem;
- (id)raceItem;
- (id)sourceItem;
- (id)statusItem;
- (int64_t)numberOfRowsForSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionIndex;
- (void)createDisplayItems;
- (void)createPersonalInfoItems;
- (void)createRecordSections;
- (void)createVerificationItems;
- (void)setDisplayItems:(id)a3;
- (void)setMedicalRecords:(id)a3;
- (void)setRecord:(id)a3;
- (void)setSectionFooters:(id)a3;
- (void)setSectionHeaders:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation HKVerifiableClinicalRecordDetailDataProvider

- (HKVerifiableClinicalRecordDetailDataProvider)initWithSignedRecord:(id)a3 medicalRecords:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKVerifiableClinicalRecordDetailDataProvider;
  v9 = [(HKVerifiableClinicalRecordDetailDataProvider *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    uint64_t v11 = [v8 sortedArrayUsingComparator:&__block_literal_global_40];
    medicalRecords = v10->_medicalRecords;
    v10->_medicalRecords = (NSArray *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayItems = v10->_displayItems;
    v10->_displayItems = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionHeaders = v10->_sectionHeaders;
    v10->_sectionHeaders = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionFooters = v10->_sectionFooters;
    v10->_sectionFooters = v17;

    v10->_sectionIndex = 0;
    [(HKVerifiableClinicalRecordDetailDataProvider *)v10 createDisplayItems];
  }

  return v10;
}

uint64_t __84__HKVerifiableClinicalRecordDetailDataProvider_initWithSignedRecord_medicalRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 sortDate];
  v6 = [v4 sortDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (int64_t)numberOfSections
{
  v2 = [(NSMutableDictionary *)self->_displayItems allKeys];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)numberOfRowsForSection:(int64_t)a3
{
  displayItems = self->_displayItems;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)displayItems objectForKeyedSubscript:v4];

  if (v5) {
    int64_t v6 = [v5 count];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)headerForSection:(int64_t)a3
{
  sectionHeaders = self->_sectionHeaders;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)sectionHeaders objectForKeyedSubscript:v4];

  return v5;
}

- (id)footerForSection:(int64_t)a3
{
  sectionFooters = self->_sectionFooters;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)sectionFooters objectForKeyedSubscript:v4];

  return v5;
}

- (id)displayItemForSection:(int64_t)a3 row:(int64_t)a4
{
  int64_t v6 = [(HKVerifiableClinicalRecordDetailDataProvider *)self displayItems];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  v9 = [v8 objectAtIndexedSubscript:a4];

  return v9;
}

- (void)createDisplayItems
{
  [(HKVerifiableClinicalRecordDetailDataProvider *)self createPersonalInfoItems];
  [(HKVerifiableClinicalRecordDetailDataProvider *)self createRecordSections];
  [(HKVerifiableClinicalRecordDetailDataProvider *)self createVerificationItems];
}

- (void)createPersonalInfoItems
{
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v3 = [(HKVerifiableClinicalRecordDetailDataProvider *)self nameItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v3);

  id v4 = [(HKVerifiableClinicalRecordDetailDataProvider *)self birthdayItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v4);

  v5 = [(HKVerifiableClinicalRecordDetailDataProvider *)self genderItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v5);

  int64_t v6 = [(HKVerifiableClinicalRecordDetailDataProvider *)self emailAddressesItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v6);

  uint64_t v7 = [(HKVerifiableClinicalRecordDetailDataProvider *)self phoneNumbersItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v7);

  id v8 = [(HKVerifiableClinicalRecordDetailDataProvider *)self addressesItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v8);

  v9 = [(HKVerifiableClinicalRecordDetailDataProvider *)self maritalStatusItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v9);

  v10 = [(HKVerifiableClinicalRecordDetailDataProvider *)self raceItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v10);

  uint64_t v11 = [(HKVerifiableClinicalRecordDetailDataProvider *)self ethnicityItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v11);

  v12 = [(HKVerifiableClinicalRecordDetailDataProvider *)self birthSexItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v12);

  v13 = [(HKVerifiableClinicalRecordDetailDataProvider *)self identifiersItem];
  objc_msgSend(v21, "hk_addNonNilObject:", v13);

  if ([v21 count])
  {
    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v15 = [v14 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
    v16 = [v15 localizedUppercaseString];
    sectionHeaders = self->_sectionHeaders;
    v18 = [NSNumber numberWithInteger:self->_sectionIndex];
    [(NSMutableDictionary *)sectionHeaders setObject:v16 forKeyedSubscript:v18];

    displayItems = self->_displayItems;
    objc_super v20 = [NSNumber numberWithInteger:self->_sectionIndex];
    [(NSMutableDictionary *)displayItems setObject:v21 forKeyedSubscript:v20];

    ++self->_sectionIndex;
  }
}

- (id)nameItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_NAME_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 fullName];
  uint64_t v7 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v6];

  return v7;
}

- (id)birthdayItem
{
  v2 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v3 = [v2 birthDate];
  id v4 = [v3 dateForUTC];
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t v6 = objc_msgSend(v4, "hk_utcDateAdjustedToCalendar:", v5);

  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_DOB_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v9 = HKLocalizedStringForDateAndTemplate(v6, 10);
  v10 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v8 detailText:v9];

  return v10;
}

- (id)genderItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_GENDER_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 gender];
  uint64_t v7 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v6];

  return v7;
}

- (id)emailAddressesItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_EMAIL_ADDRESSES_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 emailAddresses];
  uint64_t v7 = [v6 componentsJoinedByString:@"\n"];
  id v8 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v7];

  return v8;
}

- (id)phoneNumbersItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_PHONE_NUMBERS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 phoneNumbers];
  uint64_t v7 = [v6 componentsJoinedByString:@"\n"];
  id v8 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v7];

  return v8;
}

- (id)addressesItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_ADDRESSES_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 addresses];
  uint64_t v7 = [v6 componentsJoinedByString:@"\n\n"];
  id v8 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v7];

  return v8;
}

- (id)maritalStatusItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_MARITAL_STATUS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 maritalStatus];
  uint64_t v7 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v6];

  return v7;
}

- (id)raceItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_RACE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 race];
  uint64_t v7 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v6];

  return v7;
}

- (id)ethnicityItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_ETHNICITY_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 ethnicity];
  uint64_t v7 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v6];

  return v7;
}

- (id)birthSexItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_BIRTH_SEX_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v5 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v6 = [v5 birthSex];
  uint64_t v7 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v6];

  return v7;
}

- (id)identifiersItem
{
  v2 = [(HKSignedClinicalDataRecord *)self->_record subject];
  int64_t v3 = [v2 identifiers];
  id v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_372);

  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int64_t v6 = [v5 localizedStringForKey:@"DETAIL_VIEW_SUBJECT_IDENTIFIERS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  uint64_t v7 = [v4 componentsJoinedByString:@"\n"];
  id v8 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v6 detailText:v7];

  return v8;
}

uint64_t __63__HKVerifiableClinicalRecordDetailDataProvider_identifiersItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 componentsJoinedByString:@": "];
}

- (void)createRecordSections
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int64_t sectionIndex = self->_sectionIndex;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_medicalRecords;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    unint64_t v7 = 0x1E4F28000uLL;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v23 + 1) + 8 * v8) displayItems];
        if ([v9 count])
        {
          int64_t v10 = self->_sectionIndex;
          if (v10 == sectionIndex)
          {
            v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
            id v21 = [v22 localizedStringForKey:@"DETAIL_VIEW_RECORDS_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
            uint64_t v11 = [v21 localizedUppercaseString];
            sectionHeaders = self->_sectionHeaders;
            [*(id *)(v7 + 3792) numberWithInteger:self->_sectionIndex];
            unint64_t v13 = v7;
            uint64_t v14 = v5;
            uint64_t v15 = v6;
            v17 = int64_t v16 = sectionIndex;
            [(NSMutableDictionary *)sectionHeaders setObject:v11 forKeyedSubscript:v17];

            int64_t sectionIndex = v16;
            uint64_t v6 = v15;
            uint64_t v5 = v14;
            unint64_t v7 = v13;

            int64_t v10 = self->_sectionIndex;
          }
          displayItems = self->_displayItems;
          v19 = [*(id *)(v7 + 3792) numberWithInteger:v10];
          [(NSMutableDictionary *)displayItems setObject:v9 forKeyedSubscript:v19];

          ++self->_sectionIndex;
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)createVerificationItems
{
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v3 = [(HKVerifiableClinicalRecordDetailDataProvider *)self sourceItem];
  objc_msgSend(v18, "hk_addNonNilObject:", v3);

  uint64_t v4 = [(HKVerifiableClinicalRecordDetailDataProvider *)self statusItem];
  objc_msgSend(v18, "hk_addNonNilObject:", v4);

  uint64_t v5 = [(HKVerifiableClinicalRecordDetailDataProvider *)self issuedItem];
  objc_msgSend(v18, "hk_addNonNilObject:", v5);

  uint64_t v6 = [(HKVerifiableClinicalRecordDetailDataProvider *)self expiresItem];
  objc_msgSend(v18, "hk_addNonNilObject:", v6);

  if ([v18 count])
  {
    unint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v8 = [v7 localizedStringForKey:@"DETAIL_VIEW_VERIFICATION_HEADER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
    v9 = [v8 localizedUppercaseString];
    sectionHeaders = self->_sectionHeaders;
    uint64_t v11 = [NSNumber numberWithInteger:self->_sectionIndex];
    [(NSMutableDictionary *)sectionHeaders setObject:v9 forKeyedSubscript:v11];

    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    unint64_t v13 = [v12 localizedStringForKey:@"DETAIL_VIEW_VERIFICATION_FOOTER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
    sectionFooters = self->_sectionFooters;
    uint64_t v15 = [NSNumber numberWithInteger:self->_sectionIndex];
    [(NSMutableDictionary *)sectionFooters setObject:v13 forKeyedSubscript:v15];

    displayItems = self->_displayItems;
    v17 = [NSNumber numberWithInteger:self->_sectionIndex];
    [(NSMutableDictionary *)displayItems setObject:v18 forKeyedSubscript:v17];
  }
}

- (id)sourceItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_VERIFICATION_SOURCE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  uint64_t v5 = [(HKSignedClinicalDataRecord *)self->_record recordIssuerDisplayName];
  uint64_t v6 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 detailText:v5];

  return v6;
}

- (id)statusItem
{
  int64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v4 = [v3 localizedStringForKey:@"DETAIL_VIEW_VERIFICATION_STATUS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  uint64_t v5 = [(HKSignedClinicalDataRecord *)self->_record signatureStatusDisplayString];
  uint64_t v6 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v4 attributedDetailText:v5];

  return v6;
}

- (id)issuedItem
{
  v2 = [(HKSignedClinicalDataRecord *)self->_record issuedDate];
  int64_t v3 = HKLocalizedStringForDateAndTemplate(v2, 10);

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v5 = [v4 localizedStringForKey:@"DETAIL_VIEW_VERIFICATION_ISSUED_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  uint64_t v6 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v5 detailText:v3];

  return v6;
}

- (id)expiresItem
{
  v2 = [(HKSignedClinicalDataRecord *)self->_record expirationDate];
  int64_t v3 = HKLocalizedStringForDateAndTemplate(v2, 10);

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v5 = [v4 localizedStringForKey:@"DETAIL_VIEW_VERIFICATION_EXPIRES_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  uint64_t v6 = +[HKVerifiableClinicalRecordDisplayItem valueItemWithTitleText:v5 detailText:v3];

  return v6;
}

- (HKSignedClinicalDataRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSArray)medicalRecords
{
  return self->_medicalRecords;
}

- (void)setMedicalRecords:(id)a3
{
}

- (NSMutableDictionary)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
}

- (NSMutableDictionary)sectionHeaders
{
  return self->_sectionHeaders;
}

- (void)setSectionHeaders:(id)a3
{
}

- (NSMutableDictionary)sectionFooters
{
  return self->_sectionFooters;
}

- (void)setSectionFooters:(id)a3
{
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_int64_t sectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFooters, 0);
  objc_storeStrong((id *)&self->_sectionHeaders, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_medicalRecords, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end