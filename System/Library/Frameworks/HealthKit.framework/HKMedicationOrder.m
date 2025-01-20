@interface HKMedicationOrder
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newMedicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 prescriber:(id)a16 numberOfFills:(int64_t)a17 dosages:(id)a18 earliestDosageDate:(id)a19 writtenDate:(id)a20 endedDate:(id)a21 statusCoding:(id)a22 reasonCodingCollections:(id)a23 reasonEndedCodingCollection:(id)a24 statusReasonCodingCollection:(id)a25 config:(id)a26;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
+ (id)medicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodingCollection:(id)a14 prescriber:(id)a15 numberOfFills:(int64_t)a16 dosages:(id)a17 earliestDosageDate:(id)a18 writtenDate:(id)a19 endedDate:(id)a20 statusCoding:(id)a21 reasonCodingCollections:(id)a22 reasonEndedCodingCollection:(id)a23 statusReasonCodingCollection:(id)a24;
+ (id)medicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 prescriber:(id)a16 numberOfFills:(int64_t)a17 dosages:(id)a18 earliestDosageDate:(id)a19 writtenDate:(id)a20 endedDate:(id)a21 statusCoding:(id)a22 reasonCodingCollections:(id)a23 reasonEndedCodingCollection:(id)a24 statusReasonCodingCollection:(id)a25;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKConcept)medication;
- (HKConcept)reasonEnded;
- (HKConcept)status;
- (HKConcept)statusReason;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)medicationCodingCollection;
- (HKMedicalCodingCollection)reasonEndedCodingCollection;
- (HKMedicalCodingCollection)statusReasonCodingCollection;
- (HKMedicalDate)earliestDosageDate;
- (HKMedicalDate)endedDate;
- (HKMedicalDate)writtenDate;
- (HKMedicationOrder)init;
- (HKMedicationOrder)initWithCoder:(id)a3;
- (NSArray)dosages;
- (NSArray)reason;
- (NSArray)reasonCodingCollections;
- (NSString)description;
- (NSString)prescriber;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)numberOfFills;
- (int64_t)recordCategoryType;
- (void)_setDosages:(id)a3;
- (void)_setEarliestDosageDate:(id)a3;
- (void)_setEndedDate:(id)a3;
- (void)_setMedication:(id)a3;
- (void)_setMedicationCodingCollection:(id)a3;
- (void)_setNumberOfFills:(int64_t)a3;
- (void)_setPrescriber:(id)a3;
- (void)_setReason:(id)a3;
- (void)_setReasonCodingCollections:(id)a3;
- (void)_setReasonEnded:(id)a3;
- (void)_setReasonEndedCodingCollection:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)_setStatusReason:(id)a3;
- (void)_setStatusReasonCodingCollection:(id)a3;
- (void)_setWrittenDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationOrder

+ (id)medicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 prescriber:(id)a16 numberOfFills:(int64_t)a17 dosages:(id)a18 earliestDosageDate:(id)a19 writtenDate:(id)a20 endedDate:(id)a21 statusCoding:(id)a22 reasonCodingCollections:(id)a23 reasonEndedCodingCollection:(id)a24 statusReasonCodingCollection:(id)a25
{
  v25 = objc_msgSend(a1, "_newMedicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                  a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  a23,
                  a24,
                  a25,
                  0);

  return v25;
}

+ (id)_newMedicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodingCollection:(id)a15 prescriber:(id)a16 numberOfFills:(int64_t)a17 dosages:(id)a18 earliestDosageDate:(id)a19 writtenDate:(id)a20 endedDate:(id)a21 statusCoding:(id)a22 reasonCodingCollections:(id)a23 reasonEndedCodingCollection:(id)a24 statusReasonCodingCollection:(id)a25 config:(id)a26
{
  BOOL v65 = a5;
  id v26 = a15;
  id v27 = a16;
  id v28 = a18;
  id v29 = a19;
  id v30 = a20;
  id v31 = a21;
  id v32 = a22;
  id v33 = a23;
  id v34 = a24;
  id v35 = a25;
  id v36 = a26;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __365__HKMedicationOrder__newMedicationOrderWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_prescriber_numberOfFills_dosages_earliestDosageDate_writtenDate_endedDate_statusCoding_reasonCodingCollections_reasonEndedCodingCollection_statusReasonCodingCollection_config___block_invoke;
  aBlock[3] = &unk_1E58BC120;
  id v69 = v26;
  id v70 = v27;
  id v71 = v28;
  id v72 = v29;
  id v73 = v30;
  id v74 = v31;
  id v75 = v32;
  id v76 = v33;
  id v77 = v34;
  id v78 = v35;
  id v79 = v36;
  int64_t v80 = a17;
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
  id v54 = v26;
  id v37 = a13;
  id v38 = a12;
  id v39 = a11;
  id v40 = a10;
  id v41 = a8;
  id v42 = a7;
  id v43 = a6;
  id v44 = a4;
  id v45 = a3;
  v46 = _Block_copy(aBlock);
  v67.receiver = a1;
  v67.super_class = (Class)&OBJC_METACLASS___HKMedicationOrder;
  id v66 = objc_msgSendSuper2(&v67, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v45, v44, v65, v43, v42, v41, a9, v40, v39, v38, v37, a14, v46);

  return v66;
}

void __365__HKMedicationOrder__newMedicationOrderWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodingCollection_prescriber_numberOfFills_dosages_earliestDosageDate_writtenDate_endedDate_statusCoding_reasonCodingCollections_reasonEndedCodingCollection_statusReasonCodingCollection_config___block_invoke(uint64_t a1, void *a2)
{
  v24 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v24[22];
  v24[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v24[23];
  v24[23] = v5;

  v24[24] = *(void *)(a1 + 120);
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

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v24[30];
  v24[30] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  v20 = (void *)v24[31];
  v24[31] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  v22 = (void *)v24[32];
  v24[32] = v21;

  uint64_t v23 = *(void *)(a1 + 112);
  if (v23) {
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

- (HKMedicationOrder)init
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
  v9.super_class = (Class)HKMedicationOrder;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@medicationCodingCollection = %@prescriber = %@numberOfFills = %lddosages = %@earliestDosageDate = %@writtenDate = %@endedDate = %@statusCoding = %@reasonCodingCollections = %@reasonEndedCodingCollection = %@statusReasonCodingCollection = %@>", v5, self, v6, self->_medicationCodingCollection, self->_prescriber, self->_numberOfFills, self->_dosages, self->_earliestDosageDate, self->_writtenDate, self->_endedDate, self->_statusCoding, self->_reasonCodingCollections, self->_reasonEndedCodingCollection, self->_statusReasonCodingCollection];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationOrder;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationCodingCollection, @"MedicationCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_prescriber forKey:@"Prescriber"];
  [v4 encodeInteger:self->_numberOfFills forKey:@"NumberOfFills"];
  [v4 encodeObject:self->_dosages forKey:@"Dosages"];
  [v4 encodeObject:self->_earliestDosageDate forKey:@"EarliestDosageDate"];
  [v4 encodeObject:self->_writtenDate forKey:@"WrittenDate"];
  [v4 encodeObject:self->_endedDate forKey:@"EndedDate"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeObject:self->_reasonCodingCollections forKey:@"ReasonCodingCollections"];
  [v4 encodeObject:self->_reasonEndedCodingCollection forKey:@"ReasonEndedCodingCollection"];
  [v4 encodeObject:self->_statusReasonCodingCollection forKey:@"StatusReasonCodingCollection"];
  [v4 encodeObject:self->_medication forKey:@"Medication"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_reason forKey:@"Reason"];
  [v4 encodeObject:self->_reasonEnded forKey:@"ReasonEnded"];
  [v4 encodeObject:self->_statusReason forKey:@"StatusReason"];
}

- (HKMedicationOrder)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)HKMedicationOrder;
  objc_super v5 = [(HKMedicalRecord *)&v40 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicationCodingCollection"];
    medicationCodingCollection = v5->_medicationCodingCollection;
    v5->_medicationCodingCollection = (HKMedicalCodingCollection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Prescriber"];
    prescriber = v5->_prescriber;
    v5->_prescriber = (NSString *)v8;

    v5->_numberOfFills = [v4 decodeIntegerForKey:@"NumberOfFills"];
    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Dosages"];
    dosages = v5->_dosages;
    v5->_dosages = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EarliestDosageDate"];
    earliestDosageDate = v5->_earliestDosageDate;
    v5->_earliestDosageDate = (HKMedicalDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WrittenDate"];
    writtenDate = v5->_writtenDate;
    v5->_writtenDate = (HKMedicalDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndedDate"];
    endedDate = v5->_endedDate;
    v5->_endedDate = (HKMedicalDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v19;

    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"ReasonCodingCollections"];
    reasonCodingCollections = v5->_reasonCodingCollections;
    v5->_reasonCodingCollections = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReasonEndedCodingCollection"];
    reasonEndedCodingCollection = v5->_reasonEndedCodingCollection;
    v5->_reasonEndedCodingCollection = (HKMedicalCodingCollection *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusReasonCodingCollection"];
    statusReasonCodingCollection = v5->_statusReasonCodingCollection;
    v5->_statusReasonCodingCollection = (HKMedicalCodingCollection *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Medication"];
    medication = v5->_medication;
    v5->_medication = (HKConcept *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v30;

    id v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"Reason"];
    reason = v5->_reason;
    v5->_reason = (NSArray *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReasonEnded"];
    reasonEnded = v5->_reasonEnded;
    v5->_reasonEnded = (HKConcept *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusReason"];
    statusReason = v5->_statusReason;
    v5->_statusReason = (HKConcept *)v37;
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
    v101.receiver = self;
    v101.super_class = (Class)HKMedicationOrder;
    if (![(HKMedicalRecord *)&v101 isEquivalent:v5]) {
      goto LABEL_80;
    }
    uint64_t v6 = [(HKMedicationOrder *)self medicationCodingCollection];
    uint64_t v7 = [v5 medicationCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 medicationCodingCollection];
      if (!v9) {
        goto LABEL_79;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKMedicationOrder *)self medicationCodingCollection];
      v12 = [v5 medicationCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self prescriber];
    uint64_t v15 = [v5 prescriber];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [v5 prescriber];
      if (!v16) {
        goto LABEL_79;
      }
      uint64_t v17 = (void *)v16;
      v18 = [(HKMedicationOrder *)self prescriber];
      uint64_t v19 = [v5 prescriber];
      int v20 = [v18 isEqualToString:v19];

      if (!v20) {
        goto LABEL_80;
      }
    }
    int64_t v21 = [(HKMedicationOrder *)self numberOfFills];
    if (v21 != [v5 numberOfFills]) {
      goto LABEL_80;
    }
    uint64_t v6 = [(HKMedicationOrder *)self dosages];
    uint64_t v22 = [v5 dosages];
    if (v6 == (void *)v22)
    {
    }
    else
    {
      uint64_t v8 = (void *)v22;
      uint64_t v23 = [v5 dosages];
      if (!v23) {
        goto LABEL_79;
      }
      uint64_t v24 = (void *)v23;
      v25 = [(HKMedicationOrder *)self dosages];
      uint64_t v26 = [v5 dosages];
      int v27 = [v25 isEqualToArray:v26];

      if (!v27) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self earliestDosageDate];
    uint64_t v28 = [v5 earliestDosageDate];
    if (v6 == (void *)v28)
    {
    }
    else
    {
      uint64_t v8 = (void *)v28;
      uint64_t v29 = [v5 earliestDosageDate];
      if (!v29) {
        goto LABEL_79;
      }
      uint64_t v30 = (void *)v29;
      id v31 = [(HKMedicationOrder *)self earliestDosageDate];
      id v32 = [v5 earliestDosageDate];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self writtenDate];
    uint64_t v34 = [v5 writtenDate];
    if (v6 == (void *)v34)
    {
    }
    else
    {
      uint64_t v8 = (void *)v34;
      uint64_t v35 = [v5 writtenDate];
      if (!v35) {
        goto LABEL_79;
      }
      id v36 = (void *)v35;
      uint64_t v37 = [(HKMedicationOrder *)self writtenDate];
      id v38 = [v5 writtenDate];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self endedDate];
    uint64_t v40 = [v5 endedDate];
    if (v6 == (void *)v40)
    {
    }
    else
    {
      uint64_t v8 = (void *)v40;
      uint64_t v41 = [v5 endedDate];
      if (!v41) {
        goto LABEL_79;
      }
      id v42 = (void *)v41;
      id v43 = [(HKMedicationOrder *)self endedDate];
      id v44 = [v5 endedDate];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self statusCoding];
    uint64_t v46 = [v5 statusCoding];
    if (v6 == (void *)v46)
    {
    }
    else
    {
      uint64_t v8 = (void *)v46;
      uint64_t v47 = [v5 statusCoding];
      if (!v47) {
        goto LABEL_79;
      }
      v48 = (void *)v47;
      v49 = [(HKMedicationOrder *)self statusCoding];
      v50 = [v5 statusCoding];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self reasonCodingCollections];
    uint64_t v52 = [v5 reasonCodingCollections];
    if (v6 == (void *)v52)
    {
    }
    else
    {
      uint64_t v8 = (void *)v52;
      uint64_t v53 = [v5 reasonCodingCollections];
      if (!v53) {
        goto LABEL_79;
      }
      id v54 = (void *)v53;
      id v55 = [(HKMedicationOrder *)self reasonCodingCollections];
      id v56 = [v5 reasonCodingCollections];
      int v57 = [v55 isEqualToArray:v56];

      if (!v57) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self reasonEndedCodingCollection];
    uint64_t v58 = [v5 reasonEndedCodingCollection];
    if (v6 == (void *)v58)
    {
    }
    else
    {
      uint64_t v8 = (void *)v58;
      uint64_t v59 = [v5 reasonEndedCodingCollection];
      if (!v59) {
        goto LABEL_79;
      }
      id v60 = (void *)v59;
      id v61 = [(HKMedicationOrder *)self reasonEndedCodingCollection];
      id v62 = [v5 reasonEndedCodingCollection];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self statusReasonCodingCollection];
    uint64_t v64 = [v5 statusReasonCodingCollection];
    if (v6 == (void *)v64)
    {
    }
    else
    {
      uint64_t v8 = (void *)v64;
      uint64_t v65 = [v5 statusReasonCodingCollection];
      if (!v65) {
        goto LABEL_79;
      }
      id v66 = (void *)v65;
      objc_super v67 = [(HKMedicationOrder *)self statusReasonCodingCollection];
      v68 = [v5 statusReasonCodingCollection];
      int v69 = [v67 isEqual:v68];

      if (!v69) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self medication];
    uint64_t v70 = [v5 medication];
    if (v6 == (void *)v70)
    {
    }
    else
    {
      uint64_t v8 = (void *)v70;
      uint64_t v71 = [v5 medication];
      if (!v71) {
        goto LABEL_79;
      }
      id v72 = (void *)v71;
      id v73 = [(HKMedicationOrder *)self medication];
      id v74 = [v5 medication];
      int v75 = [v73 isEqual:v74];

      if (!v75) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self status];
    uint64_t v76 = [v5 status];
    if (v6 == (void *)v76)
    {
    }
    else
    {
      uint64_t v8 = (void *)v76;
      uint64_t v77 = [v5 status];
      if (!v77) {
        goto LABEL_79;
      }
      id v78 = (void *)v77;
      id v79 = [(HKMedicationOrder *)self status];
      int64_t v80 = [v5 status];
      int v81 = [v79 isEqual:v80];

      if (!v81) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self reason];
    uint64_t v82 = [v5 reason];
    if (v6 == (void *)v82)
    {
    }
    else
    {
      uint64_t v8 = (void *)v82;
      uint64_t v83 = [v5 reason];
      if (!v83) {
        goto LABEL_79;
      }
      v84 = (void *)v83;
      v85 = [(HKMedicationOrder *)self reason];
      v86 = [v5 reason];
      int v87 = [v85 isEqualToArray:v86];

      if (!v87) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self reasonEnded];
    uint64_t v88 = [v5 reasonEnded];
    if (v6 == (void *)v88)
    {
    }
    else
    {
      uint64_t v8 = (void *)v88;
      uint64_t v89 = [v5 reasonEnded];
      if (!v89) {
        goto LABEL_79;
      }
      v90 = (void *)v89;
      v91 = [(HKMedicationOrder *)self reasonEnded];
      v92 = [v5 reasonEnded];
      int v93 = [v91 isEqual:v92];

      if (!v93) {
        goto LABEL_80;
      }
    }
    uint64_t v6 = [(HKMedicationOrder *)self statusReason];
    uint64_t v94 = [v5 statusReason];
    if (v6 == (void *)v94)
    {

LABEL_84:
      BOOL v14 = 1;
      goto LABEL_81;
    }
    uint64_t v8 = (void *)v94;
    uint64_t v95 = [v5 statusReason];
    if (v95)
    {
      v96 = (void *)v95;
      v97 = [(HKMedicationOrder *)self statusReason];
      v98 = [v5 statusReason];
      char v99 = [v97 isEqual:v98];

      if (v99) {
        goto LABEL_84;
      }
LABEL_80:
      BOOL v14 = 0;
LABEL_81:

      goto LABEL_82;
    }
LABEL_79:

    goto LABEL_80;
  }
  BOOL v14 = 0;
LABEL_82:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKMedicationOrder *)self statusCoding];
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

  id v8 = [(HKMedicationOrder *)self medicationCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  medication = self->_medication;
  self->_medication = v6;
}

- (NSString)prescriber
{
  return self->_prescriber;
}

- (void)_setPrescriber:(id)a3
{
  self->_prescriber = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int64_t)numberOfFills
{
  return self->_numberOfFills;
}

- (void)_setNumberOfFills:(int64_t)a3
{
  self->_numberOfFills = a3;
}

- (NSArray)dosages
{
  return self->_dosages;
}

- (void)_setDosages:(id)a3
{
  self->_dosages = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)earliestDosageDate
{
  return self->_earliestDosageDate;
}

- (void)_setEarliestDosageDate:(id)a3
{
  self->_earliestDosageDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)writtenDate
{
  return self->_writtenDate;
}

- (void)_setWrittenDate:(id)a3
{
  self->_writtenDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)endedDate
{
  return self->_endedDate;
}

- (void)_setEndedDate:(id)a3
{
  self->_endedDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
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

  id v8 = [(HKMedicationOrder *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (NSArray)reasonCodingCollections
{
  return self->_reasonCodingCollections;
}

- (void)_setReasonCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonCodingCollections = self->_reasonCodingCollections;
  self->_reasonCodingCollections = v4;

  if (self->_reasonCodingCollections)
  {
    uint64_t v9 = [(HKMedicationOrder *)self reasonCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_1];
    reason = self->_reason;
    self->_reason = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_reason;
    self->_reason = 0;
  }
}

id __49__HKMedicationOrder__setReasonCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKMedicalCodingCollection)reasonEndedCodingCollection
{
  return self->_reasonEndedCodingCollection;
}

- (void)_setReasonEndedCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  reasonEndedCodingCollection = self->_reasonEndedCodingCollection;
  self->_reasonEndedCodingCollection = v4;

  if (self->_reasonEndedCodingCollection)
  {
    uint64_t v9 = [(HKMedicationOrder *)self reasonEndedCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    reasonEnded = self->_reasonEnded;
    self->_reasonEnded = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_reasonEnded;
    self->_reasonEnded = 0;
  }
}

- (HKMedicalCodingCollection)statusReasonCodingCollection
{
  return self->_statusReasonCodingCollection;
}

- (void)_setStatusReasonCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  statusReasonCodingCollection = self->_statusReasonCodingCollection;
  self->_statusReasonCodingCollection = v4;

  if (self->_statusReasonCodingCollection)
  {
    uint64_t v9 = [(HKMedicationOrder *)self statusReasonCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    statusReason = self->_statusReason;
    self->_statusReason = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_statusReason;
    self->_statusReason = 0;
  }
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
    id v4 = [(HKMedicationOrder *)self medicationCodingCollection];
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
      -[HKMedicationOrder _setMedication:](v5);
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
    id v4 = [(HKMedicationOrder *)self statusCodingCollection];
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
      -[HKMedicationOrder _setStatus:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v6;
}

- (NSArray)reason
{
  if (self->_reasonCodingCollections)
  {
    reason = self->_reason;
    if (reason)
    {
      uint64_t v3 = reason;
    }
    else
    {
      id v4 = [(HKMedicationOrder *)self reasonCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_126_0);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __27__HKMedicationOrder_reason__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReason:(id)a3
{
  self->_reason = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKConcept)reasonEnded
{
  if (self->_reasonEndedCodingCollection)
  {
    reasonEnded = self->_reasonEnded;
    if (reasonEnded)
    {
      uint64_t v3 = reasonEnded;
    }
    else
    {
      id v4 = [(HKMedicationOrder *)self reasonEndedCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setReasonEnded:(id)a3
{
  self->_reasonEnded = (HKConcept *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKConcept)statusReason
{
  if (self->_statusReasonCodingCollection)
  {
    statusReason = self->_statusReason;
    if (statusReason)
    {
      uint64_t v3 = statusReason;
    }
    else
    {
      id v4 = [(HKMedicationOrder *)self statusReasonCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setStatusReason:(id)a3
{
  self->_statusReason = (HKConcept *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationOrder;
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
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_reasonEnded, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_statusReasonCodingCollection, 0);
  objc_storeStrong((id *)&self->_reasonEndedCodingCollection, 0);
  objc_storeStrong((id *)&self->_reasonCodingCollections, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_endedDate, 0);
  objc_storeStrong((id *)&self->_writtenDate, 0);
  objc_storeStrong((id *)&self->_earliestDosageDate, 0);
  objc_storeStrong((id *)&self->_dosages, 0);
  objc_storeStrong((id *)&self->_prescriber, 0);

  objc_storeStrong((id *)&self->_medicationCodingCollection, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

- (id)medicalRecordCodings
{
  v2 = [(HKMedicationOrder *)self medicationCodingCollection];
  uint64_t v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"UNSPECIFIED_MEDICATION" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

- (int64_t)recordCategoryType
{
  return 1;
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKMedicationOrder;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"medication"];
  [v3 addObject:@"status"];
  [v3 addObject:@"reason"];
  [v3 addObject:@"reasonEnded"];
  [v3 addObject:@"statusReason"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKMedicationOrder;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  id v8 = v7;
  if (!v7)
  {
    objc_super v13 = 0;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"medication"])
  {
    uint64_t v9 = [(HKMedicationOrder *)self medicationCodingCollection];
    uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v25[0] = v10;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = (void **)v25;
LABEL_4:
    objc_super v13 = [v11 arrayWithObjects:v12 count:1];

    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"status"])
  {
    BOOL v14 = [(HKMedicationOrder *)self statusCoding];
    uint64_t v15 = +[HKMedicalCodingCollection collectionWithCoding:v14];
    uint64_t v16 = +[HKIndexableObject indexableObjectWithObject:v15];
    uint64_t v24 = v16;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

LABEL_11:
    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"reason"])
  {
    uint64_t v17 = [(HKMedicationOrder *)self reasonCodingCollections];

    if (v17)
    {
      BOOL v14 = [(HKMedicationOrder *)self reasonCodingCollections];
      objc_super v13 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v14 context:v6 error:a4];
      goto LABEL_11;
    }
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"reasonEnded"])
  {
    uint64_t v19 = [(HKMedicationOrder *)self reasonEndedCodingCollection];

    if (v19)
    {
      uint64_t v9 = [(HKMedicationOrder *)self reasonEndedCodingCollection];
      uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      uint64_t v23 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v23;
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"statusReason"])
  {
    int v20 = [(HKMedicationOrder *)self statusReasonCodingCollection];

    if (v20)
    {
      uint64_t v9 = [(HKMedicationOrder *)self statusReasonCodingCollection];
      uint64_t v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      uint64_t v22 = v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v22;
      goto LABEL_4;
    }
LABEL_21:
    objc_super v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  v21.receiver = self;
  v21.super_class = (Class)HKMedicationOrder;
  objc_super v13 = [(HKMedicalRecord *)&v21 codingsForKeyPath:v6 error:a4];
LABEL_12:

  return v13;
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
  if ([v10 isEqualToString:@"medication"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKMedicationOrder *)self _setMedication:v12];
LABEL_8:

      LOBYTE(a5) = 1;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([v11 isEqualToString:@"status"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKMedicationOrder *)self _setStatus:v12];
      goto LABEL_8;
    }
LABEL_9:
    LOBYTE(a5) = 0;
    goto LABEL_10;
  }
  if (![v11 isEqualToString:@"reason"])
  {
    if ([v11 isEqualToString:@"reasonEnded"])
    {
      uint64_t v17 = [v8 count];
      v18 = [(HKMedicationOrder *)self reasonEndedCodingCollection];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v17, v18 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!a5) {
        goto LABEL_10;
      }
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKMedicationOrder *)self _setReasonEnded:v12];
      goto LABEL_8;
    }
    if ([v11 isEqualToString:@"statusReason"])
    {
      uint64_t v19 = [v8 count];
      int v20 = [(HKMedicationOrder *)self statusReasonCodingCollection];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v19, v20 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!a5) {
        goto LABEL_10;
      }
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKMedicationOrder *)self _setStatusReason:v12];
      goto LABEL_8;
    }
    v22.receiver = self;
    v22.super_class = (Class)HKMedicationOrder;
    BOOL v21 = [(HKMedicalRecord *)&v22 applyConcepts:v8 forKeyPath:v9 error:a5];
LABEL_24:
    LOBYTE(a5) = v21;
    goto LABEL_10;
  }
  BOOL v14 = [(HKMedicationOrder *)self reasonCodingCollections];

  if (!v14)
  {
    BOOL v21 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
    goto LABEL_24;
  }
  uint64_t v15 = [(HKMedicationOrder *)self reasonCodingCollections];
  uint64_t v16 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v15 count], v9, a5);

  LOBYTE(a5) = v16 != 0;
  if (v16) {
    [(HKMedicationOrder *)self _setReason:v16];
  }

LABEL_10:
  return (char)a5;
}

+ (id)medicationOrderWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodingCollection:(id)a14 prescriber:(id)a15 numberOfFills:(int64_t)a16 dosages:(id)a17 earliestDosageDate:(id)a18 writtenDate:(id)a19 endedDate:(id)a20 statusCoding:(id)a21 reasonCodingCollections:(id)a22 reasonEndedCodingCollection:(id)a23 statusReasonCodingCollection:(id)a24
{
  BOOL v48 = a5;
  id v58 = a3;
  id v57 = a4;
  id v28 = a6;
  id v53 = a7;
  id v52 = a8;
  id v51 = a10;
  id v50 = a11;
  id v56 = a12;
  id v29 = a14;
  id v55 = a15;
  id v54 = a17;
  id v30 = a18;
  id v31 = a19;
  id v47 = a20;
  id v32 = a21;
  id v46 = a22;
  id v33 = a23;
  id v45 = a24;
  uint64_t v34 = @"modifiedDate";
  id v35 = v28;
  id v36 = v35;
  if (v30)
  {
    uint64_t v37 = @"earliestDosageDate";

    id v38 = [v30 dateForUTC];

    uint64_t v34 = v37;
    if (!v31) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v38 = v35;
  if (v31)
  {
LABEL_3:
    int v39 = @"writtenDate";

    uint64_t v40 = [v31 dateForUTC];

    id v38 = (void *)v40;
    uint64_t v34 = v39;
  }
LABEL_4:
  id v41 = v31;
  id v44 = v31;
  id v42 = +[HKSemanticDate semanticDateWithKeyPath:v34 date:v38];
  +[HKMedicationOrder medicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:](HKMedicationOrder, "medicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:", v58, v57, v48, v36, v53, v52, a9, v51, v50, v42, v56, a13, v29, v55, a16,
    v54,
    v30,
    v41,
    v47,
    v32,
    v46,
    v33,
  v49 = v45);

  return v49;
}

- (void)_setMedication:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property medication for record type HKMedicationOrder.", v1, 2u);
}

- (void)_setStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property status for record type HKMedicationOrder.", v1, 2u);
}

@end