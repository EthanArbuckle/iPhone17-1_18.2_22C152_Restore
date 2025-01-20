@interface HKMedicationRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newMedicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 assertionType:(int64_t)a16 asserter:(id)a17 assertionDate:(id)a18 statusCoding:(id)a19 dosages:(id)a20 earliestDosageDate:(id)a21 reasonForUseCodingCollections:(id)a22 notTaken:(BOOL)a23 reasonsNotTakenCodingCollections:(id)a24 effectiveStartDate:(id)a25 effectiveEndDate:(id)a26 config:(id)a27;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
+ (id)medicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodingCollection:(id)a14 assertionType:(int64_t)a15 asserter:(id)a16 assertionDate:(id)a17 statusCoding:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 reasonForUseCodingCollections:(id)a21 notTaken:(BOOL)a22 reasonsNotTakenCodingCollections:(id)a23 effectiveStartDate:(id)a24 effectiveEndDate:(id)a25;
+ (id)medicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 assertionType:(int64_t)a16 asserter:(id)a17 assertionDate:(id)a18 statusCoding:(id)a19 dosages:(id)a20 earliestDosageDate:(id)a21 reasonForUseCodingCollections:(id)a22 notTaken:(BOOL)a23 reasonsNotTakenCodingCollections:(id)a24 effectiveStartDate:(id)a25 effectiveEndDate:(id)a26;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)notTaken;
- (HKConcept)medication;
- (HKConcept)status;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)medicationCodingCollection;
- (HKMedicalDate)assertionDate;
- (HKMedicalDate)earliestDosageDate;
- (HKMedicalDate)effectiveEndDate;
- (HKMedicalDate)effectiveStartDate;
- (HKMedicationRecord)init;
- (HKMedicationRecord)initWithCoder:(id)a3;
- (NSArray)dosages;
- (NSArray)reasonForUse;
- (NSArray)reasonForUseCodingCollections;
- (NSArray)reasonsNotTaken;
- (NSArray)reasonsNotTakenCodingCollections;
- (NSString)asserter;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)assertionType;
- (int64_t)recordCategoryType;
- (void)_setAsserter:(id)a3;
- (void)_setAssertionDate:(id)a3;
- (void)_setAssertionType:(int64_t)a3;
- (void)_setDosages:(id)a3;
- (void)_setEarliestDosageDate:(id)a3;
- (void)_setEffectiveEndDate:(id)a3;
- (void)_setEffectiveStartDate:(id)a3;
- (void)_setMedication:(id)a3;
- (void)_setMedicationCodingCollection:(id)a3;
- (void)_setNotTaken:(BOOL)a3;
- (void)_setReasonForUse:(id)a3;
- (void)_setReasonForUseCodingCollections:(id)a3;
- (void)_setReasonsNotTaken:(id)a3;
- (void)_setReasonsNotTakenCodingCollections:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationRecord

- (id)medicalRecordCodings
{
  v2 = [(HKMedicationRecord *)self medicationCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_MEDICATION" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

- (int64_t)recordCategoryType
{
  return 1;
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)medicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 assertionType:(int64_t)a16 asserter:(id)a17 assertionDate:(id)a18 statusCoding:(id)a19 dosages:(id)a20 earliestDosageDate:(id)a21 reasonForUseCodingCollections:(id)a22 notTaken:(BOOL)a23 reasonsNotTakenCodingCollections:(id)a24 effectiveStartDate:(id)a25 effectiveEndDate:(id)a26
{
  LOBYTE(v28) = a23;
  v26 = objc_msgSend(a1, "_newMedicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                  a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  v28,
                  a24,
                  a25,
                  a26,
                  0);

  return v26;
}

+ (id)_newMedicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 assertionType:(int64_t)a16 asserter:(id)a17 assertionDate:(id)a18 statusCoding:(id)a19 dosages:(id)a20 earliestDosageDate:(id)a21 reasonForUseCodingCollections:(id)a22 notTaken:(BOOL)a23 reasonsNotTakenCodingCollections:(id)a24 effectiveStartDate:(id)a25 effectiveEndDate:(id)a26 config:(id)a27
{
  BOOL v66 = a5;
  id v27 = a15;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  id v31 = a20;
  id v32 = a21;
  id v33 = a22;
  id v34 = a24;
  id v35 = a25;
  id v36 = a26;
  id v37 = a27;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __384__HKMedicationRecord__newMedicationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_assertionType_asserter_assertionDate_statusCoding_dosages_earliestDosageDate_reasonForUseCodingCollections_notTaken_reasonsNotTakenCodingCollections_effectiveStartDate_effectiveEndDate_config___block_invoke;
  aBlock[3] = &unk_1E58C5E90;
  id v70 = v27;
  id v71 = v28;
  id v72 = v29;
  id v73 = v30;
  id v74 = v31;
  id v75 = v32;
  BOOL v82 = a23;
  id v76 = v33;
  id v77 = v34;
  id v78 = v35;
  id v79 = v36;
  id v80 = v37;
  int64_t v81 = a16;
  id v65 = v37;
  id v64 = v36;
  id v63 = v35;
  id v62 = v34;
  id v61 = v33;
  id v60 = v32;
  id v59 = v31;
  id v58 = v30;
  id v57 = v29;
  id v56 = v28;
  id v55 = v27;
  id v38 = a13;
  id v39 = a12;
  id v40 = a11;
  id v41 = a10;
  id v42 = a8;
  id v43 = a7;
  id v44 = a6;
  id v45 = a4;
  id v46 = a3;
  v47 = _Block_copy(aBlock);
  v68.receiver = a1;
  v68.super_class = (Class)&OBJC_METACLASS___HKMedicationRecord;
  id v67 = objc_msgSendSuper2(&v68, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v46, v45, v66, v44, v43, v42, a9, v41, v40, v39, v38, a14, v47);

  return v67;
}

void __384__HKMedicationRecord__newMedicationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_assertionType_asserter_assertionDate_statusCoding_dosages_earliestDosageDate_reasonForUseCodingCollections_notTaken_reasonsNotTakenCodingCollections_effectiveStartDate_effectiveEndDate_config___block_invoke(uint64_t a1, void *a2)
{
  v24 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v24[22];
  v24[22] = v3;

  v24[23] = *(void *)(a1 + 120);
  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v24[24];
  v24[24] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)v24[25];
  v24[25] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v24[26];
  v24[26] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v24[27];
  v24[27] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v24[28];
  v24[28] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v24[29];
  v24[29] = v15;

  *((unsigned char *)v24 + 240) = *(unsigned char *)(a1 + 128);
  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v24[31];
  v24[31] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  v20 = (void *)v24[32];
  v24[32] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  v22 = (void *)v24[33];
  v24[33] = v21;

  uint64_t v23 = *(void *)(a1 + 112);
  if (v23) {
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

- (HKMedicationRecord)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationRecord;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@medicationCodingCollection = %@assertionType = %ldasserter = %@assertionDate = %@statusCoding = %@dosages = %@earliestDosageDate = %@reasonForUseCodingCollections = %@notTaken = %ldreasonsNotTakenCodingCollections = %@effectiveStartDate = %@effectiveEndDate = %@>", v5, self, v6, self->_medicationCodingCollection, self->_assertionType, self->_asserter, self->_assertionDate, self->_statusCoding, self->_dosages, self->_earliestDosageDate, self->_reasonForUseCodingCollections, self->_notTaken, self->_reasonsNotTakenCodingCollections, self->_effectiveStartDate, self->_effectiveEndDate];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationCodingCollection, @"MedicationCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_assertionType forKey:@"AssertionType"];
  [v4 encodeObject:self->_asserter forKey:@"Asserter"];
  [v4 encodeObject:self->_assertionDate forKey:@"AssertionDate"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeObject:self->_dosages forKey:@"Dosages"];
  [v4 encodeObject:self->_earliestDosageDate forKey:@"EarliestDosageDate"];
  [v4 encodeObject:self->_reasonForUseCodingCollections forKey:@"ReasonForUseCodingCollections"];
  [v4 encodeBool:self->_notTaken forKey:@"NotTaken"];
  [v4 encodeObject:self->_reasonsNotTakenCodingCollections forKey:@"ReasonsNotTakenCodingCollections"];
  [v4 encodeObject:self->_effectiveStartDate forKey:@"EffectiveStartDate"];
  [v4 encodeObject:self->_effectiveEndDate forKey:@"EffectiveEndDate"];
  [v4 encodeObject:self->_medication forKey:@"Medication"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_reasonForUse forKey:@"ReasonForUse"];
  [v4 encodeObject:self->_reasonsNotTaken forKey:@"ReasonsNotTaken"];
}

- (HKMedicationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)HKMedicationRecord;
  objc_super v5 = [(HKMedicalRecord *)&v40 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationCodingCollection"];
    medicationCodingCollection = v5->_medicationCodingCollection;
    v5->_medicationCodingCollection = (HKMedicalCodingCollection *)v6;

    v5->_assertionType = [v4 decodeIntegerForKey:@"AssertionType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Asserter"];
    asserter = v5->_asserter;
    v5->_asserter = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssertionDate"];
    assertionDate = v5->_assertionDate;
    v5->_assertionDate = (HKMedicalDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"Dosages"];
    dosages = v5->_dosages;
    v5->_dosages = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EarliestDosageDate"];
    earliestDosageDate = v5->_earliestDosageDate;
    v5->_earliestDosageDate = (HKMedicalDate *)v17;

    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"ReasonForUseCodingCollections"];
    reasonForUseCodingCollections = v5->_reasonForUseCodingCollections;
    v5->_reasonForUseCodingCollections = (NSArray *)v20;

    v5->_notTaken = [v4 decodeBoolForKey:@"NotTaken"];
    v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"ReasonsNotTakenCodingCollections"];
    reasonsNotTakenCodingCollections = v5->_reasonsNotTakenCodingCollections;
    v5->_reasonsNotTakenCodingCollections = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EffectiveStartDate"];
    effectiveStartDate = v5->_effectiveStartDate;
    v5->_effectiveStartDate = (HKMedicalDate *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EffectiveEndDate"];
    effectiveEndDate = v5->_effectiveEndDate;
    v5->_effectiveEndDate = (HKMedicalDate *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Medication"];
    medication = v5->_medication;
    v5->_medication = (HKConcept *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v31;

    id v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"ReasonForUse"];
    reasonForUse = v5->_reasonForUse;
    v5->_reasonForUse = (NSArray *)v34;

    id v36 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"ReasonsNotTaken"];
    reasonsNotTaken = v5->_reasonsNotTaken;
    v5->_reasonsNotTaken = (NSArray *)v37;
  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v96.receiver = self;
    v96.super_class = (Class)HKMedicationRecord;
    if (![(HKMedicalRecord *)&v96 isEquivalent:v5]) {
      goto LABEL_76;
    }
    uint64_t v6 = [(HKMedicationRecord *)self medicationCodingCollection];
    uint64_t v7 = [v5 medicationCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 medicationCodingCollection];
      if (!v9) {
        goto LABEL_75;
      }
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [(HKMedicationRecord *)self medicationCodingCollection];
      uint64_t v12 = [v5 medicationCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_76;
      }
    }
    int64_t v15 = [(HKMedicationRecord *)self assertionType];
    if (v15 != [v5 assertionType]) {
      goto LABEL_76;
    }
    uint64_t v6 = [(HKMedicationRecord *)self asserter];
    uint64_t v16 = [v5 asserter];
    if (v6 == (void *)v16)
    {
    }
    else
    {
      uint64_t v8 = (void *)v16;
      uint64_t v17 = [v5 asserter];
      if (!v17) {
        goto LABEL_75;
      }
      v18 = (void *)v17;
      uint64_t v19 = [(HKMedicationRecord *)self asserter];
      uint64_t v20 = [v5 asserter];
      int v21 = [v19 isEqualToString:v20];

      if (!v21) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self assertionDate];
    uint64_t v22 = [v5 assertionDate];
    if (v6 == (void *)v22)
    {
    }
    else
    {
      uint64_t v8 = (void *)v22;
      uint64_t v23 = [v5 assertionDate];
      if (!v23) {
        goto LABEL_75;
      }
      v24 = (void *)v23;
      uint64_t v25 = [(HKMedicationRecord *)self assertionDate];
      v26 = [v5 assertionDate];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self statusCoding];
    uint64_t v28 = [v5 statusCoding];
    if (v6 == (void *)v28)
    {
    }
    else
    {
      uint64_t v8 = (void *)v28;
      uint64_t v29 = [v5 statusCoding];
      if (!v29) {
        goto LABEL_75;
      }
      id v30 = (void *)v29;
      uint64_t v31 = [(HKMedicationRecord *)self statusCoding];
      id v32 = [v5 statusCoding];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self dosages];
    uint64_t v34 = [v5 dosages];
    if (v6 == (void *)v34)
    {
    }
    else
    {
      uint64_t v8 = (void *)v34;
      uint64_t v35 = [v5 dosages];
      if (!v35) {
        goto LABEL_75;
      }
      id v36 = (void *)v35;
      uint64_t v37 = [(HKMedicationRecord *)self dosages];
      id v38 = [v5 dosages];
      int v39 = [v37 isEqualToArray:v38];

      if (!v39) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self earliestDosageDate];
    uint64_t v40 = [v5 earliestDosageDate];
    if (v6 == (void *)v40)
    {
    }
    else
    {
      uint64_t v8 = (void *)v40;
      uint64_t v41 = [v5 earliestDosageDate];
      if (!v41) {
        goto LABEL_75;
      }
      id v42 = (void *)v41;
      id v43 = [(HKMedicationRecord *)self earliestDosageDate];
      id v44 = [v5 earliestDosageDate];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self reasonForUseCodingCollections];
    uint64_t v46 = [v5 reasonForUseCodingCollections];
    if (v6 == (void *)v46)
    {
    }
    else
    {
      uint64_t v8 = (void *)v46;
      uint64_t v47 = [v5 reasonForUseCodingCollections];
      if (!v47) {
        goto LABEL_75;
      }
      v48 = (void *)v47;
      v49 = [(HKMedicationRecord *)self reasonForUseCodingCollections];
      v50 = [v5 reasonForUseCodingCollections];
      int v51 = [v49 isEqualToArray:v50];

      if (!v51) {
        goto LABEL_76;
      }
    }
    int v52 = [(HKMedicationRecord *)self notTaken];
    if (v52 != [v5 notTaken]) {
      goto LABEL_76;
    }
    uint64_t v6 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];
    uint64_t v53 = [v5 reasonsNotTakenCodingCollections];
    if (v6 == (void *)v53)
    {
    }
    else
    {
      uint64_t v8 = (void *)v53;
      uint64_t v54 = [v5 reasonsNotTakenCodingCollections];
      if (!v54) {
        goto LABEL_75;
      }
      id v55 = (void *)v54;
      id v56 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];
      id v57 = [v5 reasonsNotTakenCodingCollections];
      int v58 = [v56 isEqualToArray:v57];

      if (!v58) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self effectiveStartDate];
    uint64_t v59 = [v5 effectiveStartDate];
    if (v6 == (void *)v59)
    {
    }
    else
    {
      uint64_t v8 = (void *)v59;
      uint64_t v60 = [v5 effectiveStartDate];
      if (!v60) {
        goto LABEL_75;
      }
      id v61 = (void *)v60;
      id v62 = [(HKMedicationRecord *)self effectiveStartDate];
      id v63 = [v5 effectiveStartDate];
      int v64 = [v62 isEqual:v63];

      if (!v64) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self effectiveEndDate];
    uint64_t v65 = [v5 effectiveEndDate];
    if (v6 == (void *)v65)
    {
    }
    else
    {
      uint64_t v8 = (void *)v65;
      uint64_t v66 = [v5 effectiveEndDate];
      if (!v66) {
        goto LABEL_75;
      }
      id v67 = (void *)v66;
      objc_super v68 = [(HKMedicationRecord *)self effectiveEndDate];
      v69 = [v5 effectiveEndDate];
      int v70 = [v68 isEqual:v69];

      if (!v70) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self medication];
    uint64_t v71 = [v5 medication];
    if (v6 == (void *)v71)
    {
    }
    else
    {
      uint64_t v8 = (void *)v71;
      uint64_t v72 = [v5 medication];
      if (!v72) {
        goto LABEL_75;
      }
      id v73 = (void *)v72;
      id v74 = [(HKMedicationRecord *)self medication];
      id v75 = [v5 medication];
      int v76 = [v74 isEqual:v75];

      if (!v76) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self status];
    uint64_t v77 = [v5 status];
    if (v6 == (void *)v77)
    {
    }
    else
    {
      uint64_t v8 = (void *)v77;
      uint64_t v78 = [v5 status];
      if (!v78) {
        goto LABEL_75;
      }
      id v79 = (void *)v78;
      id v80 = [(HKMedicationRecord *)self status];
      int64_t v81 = [v5 status];
      int v82 = [v80 isEqual:v81];

      if (!v82) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self reasonForUse];
    uint64_t v83 = [v5 reasonForUse];
    if (v6 == (void *)v83)
    {
    }
    else
    {
      uint64_t v8 = (void *)v83;
      uint64_t v84 = [v5 reasonForUse];
      if (!v84) {
        goto LABEL_75;
      }
      v85 = (void *)v84;
      v86 = [(HKMedicationRecord *)self reasonForUse];
      v87 = [v5 reasonForUse];
      int v88 = [v86 isEqualToArray:v87];

      if (!v88) {
        goto LABEL_76;
      }
    }
    uint64_t v6 = [(HKMedicationRecord *)self reasonsNotTaken];
    uint64_t v89 = [v5 reasonsNotTaken];
    if (v6 == (void *)v89)
    {

LABEL_80:
      BOOL v14 = 1;
      goto LABEL_77;
    }
    uint64_t v8 = (void *)v89;
    uint64_t v90 = [v5 reasonsNotTaken];
    if (v90)
    {
      v91 = (void *)v90;
      v92 = [(HKMedicationRecord *)self reasonsNotTaken];
      v93 = [v5 reasonsNotTaken];
      char v94 = [v92 isEqualToArray:v93];

      if (v94) {
        goto LABEL_80;
      }
LABEL_76:
      BOOL v14 = 0;
LABEL_77:

      goto LABEL_78;
    }
LABEL_75:

    goto LABEL_76;
  }
  BOOL v14 = 0;
LABEL_78:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKMedicationRecord *)self statusCoding];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCoding:v2];

  return v3;
}

- (HKMedicalCodingCollection)medicationCodingCollection
{
  return self->_medicationCodingCollection;
}

- (void)_setMedicationCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  medicationCodingCollection = self->_medicationCodingCollection;
  self->_medicationCodingCollection = v4;

  id v8 = [(HKMedicationRecord *)self medicationCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  medication = self->_medication;
  self->_medication = v6;
}

- (int64_t)assertionType
{
  return self->_assertionType;
}

- (void)_setAssertionType:(int64_t)a3
{
  self->_assertionType = a3;
}

- (NSString)asserter
{
  return self->_asserter;
}

- (void)_setAsserter:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  asserter = self->_asserter;
  self->_asserter = v4;

  MEMORY[0x1F41817F8](v4, asserter);
}

- (HKMedicalDate)assertionDate
{
  return self->_assertionDate;
}

- (void)_setAssertionDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  assertionDate = self->_assertionDate;
  self->_assertionDate = v4;

  MEMORY[0x1F41817F8](v4, assertionDate);
}

- (HKMedicalCoding)statusCoding
{
  return self->_statusCoding;
}

- (void)_setStatusCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  id v8 = [(HKMedicationRecord *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (NSArray)dosages
{
  return self->_dosages;
}

- (void)_setDosages:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  dosages = self->_dosages;
  self->_dosages = v4;

  MEMORY[0x1F41817F8](v4, dosages);
}

- (HKMedicalDate)earliestDosageDate
{
  return self->_earliestDosageDate;
}

- (void)_setEarliestDosageDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  earliestDosageDate = self->_earliestDosageDate;
  self->_earliestDosageDate = v4;

  MEMORY[0x1F41817F8](v4, earliestDosageDate);
}

- (NSArray)reasonForUseCodingCollections
{
  return self->_reasonForUseCodingCollections;
}

- (void)_setReasonForUseCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonForUseCodingCollections = self->_reasonForUseCodingCollections;
  self->_reasonForUseCodingCollections = v4;

  if (self->_reasonForUseCodingCollections)
  {
    uint64_t v9 = [(HKMedicationRecord *)self reasonForUseCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_93];
    reasonForUse = self->_reasonForUse;
    self->_reasonForUse = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_reasonForUse;
    self->_reasonForUse = 0;
  }
}

id __56__HKMedicationRecord__setReasonForUseCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (BOOL)notTaken
{
  return self->_notTaken;
}

- (void)_setNotTaken:(BOOL)a3
{
  self->_notTaken = a3;
}

- (NSArray)reasonsNotTakenCodingCollections
{
  return self->_reasonsNotTakenCodingCollections;
}

- (void)_setReasonsNotTakenCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsNotTakenCodingCollections = self->_reasonsNotTakenCodingCollections;
  self->_reasonsNotTakenCodingCollections = v4;

  if (self->_reasonsNotTakenCodingCollections)
  {
    uint64_t v9 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_126_1];
    reasonsNotTaken = self->_reasonsNotTaken;
    self->_reasonsNotTaken = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_reasonsNotTaken;
    self->_reasonsNotTaken = 0;
  }
}

id __59__HKMedicationRecord__setReasonsNotTakenCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKMedicalDate)effectiveStartDate
{
  return self->_effectiveStartDate;
}

- (void)_setEffectiveStartDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  effectiveStartDate = self->_effectiveStartDate;
  self->_effectiveStartDate = v4;

  MEMORY[0x1F41817F8](v4, effectiveStartDate);
}

- (HKMedicalDate)effectiveEndDate
{
  return self->_effectiveEndDate;
}

- (void)_setEffectiveEndDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  effectiveEndDate = self->_effectiveEndDate;
  self->_effectiveEndDate = v4;

  MEMORY[0x1F41817F8](v4, effectiveEndDate);
}

- (HKConcept)medication
{
  medication = self->_medication;
  if (medication)
  {
    uint64_t v3 = medication;
  }
  else
  {
    id v4 = [(HKMedicationRecord *)self medicationCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setMedication:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKMedicationRecord _setMedication:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  medication = self->_medication;
  self->_medication = v6;
}

- (HKConcept)status
{
  status = self->_status;
  if (status)
  {
    uint64_t v3 = status;
  }
  else
  {
    id v4 = [(HKMedicationRecord *)self statusCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setStatus:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKMedicationRecord _setStatus:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v6;
}

- (NSArray)reasonForUse
{
  if (self->_reasonForUseCodingCollections)
  {
    reasonForUse = self->_reasonForUse;
    if (reasonForUse)
    {
      uint64_t v3 = reasonForUse;
    }
    else
    {
      id v4 = [(HKMedicationRecord *)self reasonForUseCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_128_0);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __34__HKMedicationRecord_reasonForUse__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReasonForUse:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonForUse = self->_reasonForUse;
  self->_reasonForUse = v4;

  MEMORY[0x1F41817F8](v4, reasonForUse);
}

- (NSArray)reasonsNotTaken
{
  if (self->_reasonsNotTakenCodingCollections)
  {
    reasonsNotTaken = self->_reasonsNotTaken;
    if (reasonsNotTaken)
    {
      uint64_t v3 = reasonsNotTaken;
    }
    else
    {
      id v4 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_130);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __37__HKMedicationRecord_reasonsNotTaken__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReasonsNotTaken:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsNotTaken = self->_reasonsNotTaken;
  self->_reasonsNotTaken = v4;

  MEMORY[0x1F41817F8](v4, reasonsNotTaken);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_medicationCodingCollection)
    {
      if (self->_statusCoding)
      {
        id v8 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: statusCoding must not be nil";
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: medicationCodingCollection must not be nil";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;
LABEL_10:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonsNotTaken, 0);
  objc_storeStrong((id *)&self->_reasonForUse, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_effectiveEndDate, 0);
  objc_storeStrong((id *)&self->_effectiveStartDate, 0);
  objc_storeStrong((id *)&self->_reasonsNotTakenCodingCollections, 0);
  objc_storeStrong((id *)&self->_reasonForUseCodingCollections, 0);
  objc_storeStrong((id *)&self->_earliestDosageDate, 0);
  objc_storeStrong((id *)&self->_dosages, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_assertionDate, 0);
  objc_storeStrong((id *)&self->_asserter, 0);

  objc_storeStrong((id *)&self->_medicationCodingCollection, 0);
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKMedicationRecord;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"medication"];
  [v3 addObject:@"status"];
  [v3 addObject:@"reasonForUse"];
  [v3 addObject:@"reasonsNotTaken"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKMedicationRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  id v8 = v7;
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"medication"])
  {
    uint64_t v9 = [(HKMedicationRecord *)self medicationCodingCollection];
    uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v19[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"status"])
  {
    uint64_t v9 = [(HKMedicationRecord *)self statusCoding];
    uint64_t v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
    uint64_t v12 = +[HKIndexableObject indexableObjectWithObject:v10];
    v18 = v12;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"reasonForUse"])
  {
    BOOL v14 = [(HKMedicationRecord *)self reasonForUseCodingCollections];

    if (v14)
    {
      uint64_t v15 = [(HKMedicationRecord *)self reasonForUseCodingCollections];
LABEL_18:
      uint64_t v9 = (void *)v15;
      uint64_t v11 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v15 context:v6 error:a4];
      goto LABEL_8;
    }
LABEL_19:
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  if ([v8 isEqualToString:@"reasonsNotTaken"])
  {
    uint64_t v16 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];

    if (v16)
    {
      uint64_t v15 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationRecord;
  uint64_t v11 = [(HKMedicalRecord *)&v17 codingsForKeyPath:v6 error:a4];
LABEL_9:

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  if (![v10 isEqualToString:@"medication"])
  {
    if ([v11 isEqualToString:@"status"])
    {
      if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
      {
        uint64_t v12 = [v8 firstObject];
        objc_super v13 = [v12 object];
        [(HKMedicationRecord *)self _setStatus:v13];
        goto LABEL_8;
      }
LABEL_9:
      BOOL v14 = 0;
      goto LABEL_10;
    }
    if ([v11 isEqualToString:@"reasonForUse"])
    {
      uint64_t v16 = [(HKMedicationRecord *)self reasonForUseCodingCollections];

      if (v16)
      {
        objc_super v17 = [(HKMedicationRecord *)self reasonForUseCodingCollections];
        v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v17 count], v9, a5);

        BOOL v14 = v18 != 0;
        if (v18) {
          [(HKMedicationRecord *)self _setReasonForUse:v18];
        }
LABEL_19:

        goto LABEL_10;
      }
    }
    else
    {
      if (![v11 isEqualToString:@"reasonsNotTaken"])
      {
        v22.receiver = self;
        v22.super_class = (Class)HKMedicationRecord;
        BOOL v21 = [(HKMedicalRecord *)&v22 applyConcepts:v8 forKeyPath:v9 error:a5];
        goto LABEL_22;
      }
      uint64_t v19 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];

      if (v19)
      {
        uint64_t v20 = [(HKMedicationRecord *)self reasonsNotTakenCodingCollections];
        v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v20 count], v9, a5);

        BOOL v14 = v18 != 0;
        if (v18) {
          [(HKMedicationRecord *)self _setReasonsNotTaken:v18];
        }
        goto LABEL_19;
      }
    }
    BOOL v21 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
LABEL_22:
    BOOL v14 = v21;
    goto LABEL_10;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5)) {
    goto LABEL_9;
  }
  uint64_t v12 = [v8 firstObject];
  objc_super v13 = [v12 object];
  [(HKMedicationRecord *)self _setMedication:v13];
LABEL_8:

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

+ (id)medicationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodingCollection:(id)a14 assertionType:(int64_t)a15 asserter:(id)a16 assertionDate:(id)a17 statusCoding:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 reasonForUseCodingCollections:(id)a21 notTaken:(BOOL)a22 reasonsNotTakenCodingCollections:(id)a23 effectiveStartDate:(id)a24 effectiveEndDate:(id)a25
{
  BOOL v52 = a5;
  id v62 = a3;
  id v61 = a4;
  id v29 = a6;
  id v55 = a7;
  id v54 = a8;
  id v60 = a10;
  id v59 = a11;
  id v58 = a12;
  id v57 = a14;
  id v56 = a16;
  id v30 = a17;
  id v51 = a18;
  id v50 = a19;
  id v31 = a20;
  id v49 = a21;
  id v32 = a23;
  id v33 = a24;
  id v34 = a25;
  uint64_t v35 = @"modifiedDate";
  id v36 = v29;
  uint64_t v37 = v36;
  if (v30)
  {
    id v38 = @"assertionDate";

    int v39 = [v30 dateForUTC];

    uint64_t v35 = v38;
    if (!v34) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v39 = v36;
  if (v34)
  {
LABEL_3:
    uint64_t v40 = @"effectiveEndDate";

    uint64_t v41 = [v34 dateForUTC];

    int v39 = (void *)v41;
    uint64_t v35 = v40;
  }
LABEL_4:
  if (v33)
  {
    id v42 = @"effectiveStartDate";

    uint64_t v43 = [v33 dateForUTC];

    int v39 = (void *)v43;
    uint64_t v35 = v42;
  }
  if (v31)
  {
    id v44 = @"earliestDosageDate";

    uint64_t v45 = [v31 dateForUTC];

    int v39 = (void *)v45;
    uint64_t v35 = v44;
  }
  uint64_t v46 = +[HKSemanticDate semanticDateWithKeyPath:v35 date:v39];
  LOBYTE(v48) = a22;
  +[HKMedicationRecord medicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:](HKMedicationRecord, "medicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:", v62, v61, v52, v37, v55, v54, a9, v60, v59, v46, v58, a13, v57, a15, v56,
    v30,
    v51,
    v50,
    v31,
    v49,
    v48,
    v32,
    v33,
  uint64_t v53 = v34);

  return v53;
}

- (void)_setMedication:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property medication for record type HKMedicationRecord.", v1, 2u);
}

- (void)_setStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property status for record type HKMedicationRecord.", v1, 2u);
}

@end