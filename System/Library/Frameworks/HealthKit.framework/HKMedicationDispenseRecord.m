@interface HKMedicationDispenseRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newMedicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodings:(id)a15 quantityDispensed:(id)a16 preparationDate:(id)a17 handOverDate:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 statusCoding:(id)a21 daysSupplyQuantity:(id)a22 config:(id)a23;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
+ (id)medicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodings:(id)a14 quantityDispensed:(id)a15 preparationDate:(id)a16 handOverDate:(id)a17 dosages:(id)a18 earliestDosageDate:(id)a19 statusCoding:(id)a20 daysSupplyQuantity:(id)a21;
+ (id)medicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodings:(id)a15 quantityDispensed:(id)a16 preparationDate:(id)a17 handOverDate:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 statusCoding:(id)a21 daysSupplyQuantity:(id)a22;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKCodedQuantity)daysSupplyQuantity;
- (HKCodedQuantity)quantityDispensed;
- (HKConcept)medication;
- (HKConcept)status;
- (HKMedicalCoding)statusCoding;
- (HKMedicalDate)earliestDosageDate;
- (HKMedicalDate)handOverDate;
- (HKMedicalDate)preparationDate;
- (HKMedicationDispenseRecord)init;
- (HKMedicationDispenseRecord)initWithCoder:(id)a3;
- (NSArray)dosages;
- (NSArray)medicationCodings;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicationCodingsCollection;
- (id)statusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setDaysSupplyQuantity:(id)a3;
- (void)_setDosages:(id)a3;
- (void)_setEarliestDosageDate:(id)a3;
- (void)_setHandOverDate:(id)a3;
- (void)_setMedication:(id)a3;
- (void)_setMedicationCodings:(id)a3;
- (void)_setPreparationDate:(id)a3;
- (void)_setQuantityDispensed:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationDispenseRecord

+ (id)medicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodings:(id)a15 quantityDispensed:(id)a16 preparationDate:(id)a17 handOverDate:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 statusCoding:(id)a21 daysSupplyQuantity:(id)a22
{
  v22 = objc_msgSend(a1, "_newMedicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  0);

  return v22;
}

+ (id)_newMedicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 medicationCodings:(id)a15 quantityDispensed:(id)a16 preparationDate:(id)a17 handOverDate:(id)a18 dosages:(id)a19 earliestDosageDate:(id)a20 statusCoding:(id)a21 daysSupplyQuantity:(id)a22 config:(id)a23
{
  BOOL v54 = a5;
  id v23 = a15;
  id v24 = a16;
  id v25 = a17;
  id v26 = a18;
  id v27 = a19;
  id v28 = a20;
  id v29 = a21;
  id v30 = a22;
  id v31 = a23;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __312__HKMedicationDispenseRecord__newMedicationDispenseRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodings_quantityDispensed_preparationDate_handOverDate_dosages_earliestDosageDate_statusCoding_daysSupplyQuantity_config___block_invoke;
  aBlock[3] = &unk_1E58BC078;
  id v62 = v23;
  id v63 = v24;
  id v64 = v25;
  id v65 = v26;
  id v66 = v27;
  id v67 = v28;
  id v68 = v29;
  id v69 = v30;
  id v70 = v31;
  id v59 = v31;
  id v58 = v30;
  id v57 = v29;
  id v56 = v28;
  id v53 = v27;
  id v52 = v26;
  id v51 = v25;
  id v50 = v24;
  id v49 = v23;
  id v32 = a13;
  id v33 = a12;
  id v34 = a11;
  id v35 = a10;
  id v36 = a8;
  id v37 = a7;
  id v38 = a6;
  id v39 = a4;
  id v40 = a3;
  v41 = _Block_copy(aBlock);
  v60.receiver = a1;
  v60.super_class = (Class)&OBJC_METACLASS___HKMedicationDispenseRecord;
  id v55 = objc_msgSendSuper2(&v60, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v40, v39, v54, v38, v37, v36, a9, v35, v34, v33, v32, a14, v41);

  return v55;
}

void __312__HKMedicationDispenseRecord__newMedicationDispenseRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_medicationCodings_quantityDispensed_preparationDate_handOverDate_dosages_earliestDosageDate_statusCoding_daysSupplyQuantity_config___block_invoke(uint64_t a1, void *a2)
{
  v20 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v20[22];
  v20[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v20[23];
  v20[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)v20[24];
  v20[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v20[25];
  v20[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v20[26];
  v20[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v20[27];
  v20[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v20[28];
  v20[28] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v20[29];
  v20[29] = v17;

  uint64_t v19 = *(void *)(a1 + 96);
  if (v19) {
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
}

- (HKMedicationDispenseRecord)init
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
  v9.super_class = (Class)HKMedicationDispenseRecord;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@medicationCodings = %@quantityDispensed = %@preparationDate = %@handOverDate = %@dosages = %@earliestDosageDate = %@statusCoding = %@daysSupplyQuantity = %@>", v5, self, v6, self->_medicationCodings, self->_quantityDispensed, self->_preparationDate, self->_handOverDate, self->_dosages, self->_earliestDosageDate, self->_statusCoding, self->_daysSupplyQuantity];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicationDispenseRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicationCodings, @"MedicationCodings", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_quantityDispensed forKey:@"QuantityDispensed"];
  [v4 encodeObject:self->_preparationDate forKey:@"PreparationDate"];
  [v4 encodeObject:self->_handOverDate forKey:@"HandOverDate"];
  [v4 encodeObject:self->_dosages forKey:@"Dosages"];
  [v4 encodeObject:self->_earliestDosageDate forKey:@"EarliestDosageDate"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeObject:self->_daysSupplyQuantity forKey:@"DaysSupplyQuantity"];
  [v4 encodeObject:self->_medication forKey:@"Medication"];
  [v4 encodeObject:self->_status forKey:@"Status"];
}

- (HKMedicationDispenseRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HKMedicationDispenseRecord;
  objc_super v5 = [(HKMedicalRecord *)&v29 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"MedicationCodings"];
    medicationCodings = v5->_medicationCodings;
    v5->_medicationCodings = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"QuantityDispensed"];
    quantityDispensed = v5->_quantityDispensed;
    v5->_quantityDispensed = (HKCodedQuantity *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreparationDate"];
    preparationDate = v5->_preparationDate;
    v5->_preparationDate = (HKMedicalDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HandOverDate"];
    handOverDate = v5->_handOverDate;
    v5->_handOverDate = (HKMedicalDate *)v13;

    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"Dosages"];
    dosages = v5->_dosages;
    v5->_dosages = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EarliestDosageDate"];
    earliestDosageDate = v5->_earliestDosageDate;
    v5->_earliestDosageDate = (HKMedicalDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DaysSupplyQuantity"];
    daysSupplyQuantity = v5->_daysSupplyQuantity;
    v5->_daysSupplyQuantity = (HKCodedQuantity *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Medication"];
    medication = v5->_medication;
    v5->_medication = (HKConcept *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v26;
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
    v70.receiver = self;
    v70.super_class = (Class)HKMedicationDispenseRecord;
    if (![(HKMedicalRecord *)&v70 isEquivalent:v5]) {
      goto LABEL_54;
    }
    v6 = [(HKMedicationDispenseRecord *)self medicationCodings];
    uint64_t v7 = [v5 medicationCodings];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      uint64_t v9 = [v5 medicationCodings];
      if (!v9) {
        goto LABEL_53;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKMedicationDispenseRecord *)self medicationCodings];
      v12 = [v5 medicationCodings];
      int v13 = [v11 isEqualToArray:v12];

      if (!v13) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self quantityDispensed];
    uint64_t v15 = [v5 quantityDispensed];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      v8 = (void *)v15;
      uint64_t v16 = [v5 quantityDispensed];
      if (!v16) {
        goto LABEL_53;
      }
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(HKMedicationDispenseRecord *)self quantityDispensed];
      uint64_t v19 = [v5 quantityDispensed];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self preparationDate];
    uint64_t v21 = [v5 preparationDate];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      v8 = (void *)v21;
      uint64_t v22 = [v5 preparationDate];
      if (!v22) {
        goto LABEL_53;
      }
      id v23 = (void *)v22;
      uint64_t v24 = [(HKMedicationDispenseRecord *)self preparationDate];
      id v25 = [v5 preparationDate];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self handOverDate];
    uint64_t v27 = [v5 handOverDate];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      v8 = (void *)v27;
      uint64_t v28 = [v5 handOverDate];
      if (!v28) {
        goto LABEL_53;
      }
      objc_super v29 = (void *)v28;
      id v30 = [(HKMedicationDispenseRecord *)self handOverDate];
      id v31 = [v5 handOverDate];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self dosages];
    uint64_t v33 = [v5 dosages];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      v8 = (void *)v33;
      uint64_t v34 = [v5 dosages];
      if (!v34) {
        goto LABEL_53;
      }
      id v35 = (void *)v34;
      id v36 = [(HKMedicationDispenseRecord *)self dosages];
      id v37 = [v5 dosages];
      int v38 = [v36 isEqualToArray:v37];

      if (!v38) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self earliestDosageDate];
    uint64_t v39 = [v5 earliestDosageDate];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      v8 = (void *)v39;
      uint64_t v40 = [v5 earliestDosageDate];
      if (!v40) {
        goto LABEL_53;
      }
      v41 = (void *)v40;
      v42 = [(HKMedicationDispenseRecord *)self earliestDosageDate];
      v43 = [v5 earliestDosageDate];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self statusCoding];
    uint64_t v45 = [v5 statusCoding];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      v8 = (void *)v45;
      uint64_t v46 = [v5 statusCoding];
      if (!v46) {
        goto LABEL_53;
      }
      v47 = (void *)v46;
      v48 = [(HKMedicationDispenseRecord *)self statusCoding];
      id v49 = [v5 statusCoding];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self daysSupplyQuantity];
    uint64_t v51 = [v5 daysSupplyQuantity];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      v8 = (void *)v51;
      uint64_t v52 = [v5 daysSupplyQuantity];
      if (!v52) {
        goto LABEL_53;
      }
      id v53 = (void *)v52;
      BOOL v54 = [(HKMedicationDispenseRecord *)self daysSupplyQuantity];
      id v55 = [v5 daysSupplyQuantity];
      int v56 = [v54 isEqual:v55];

      if (!v56) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self medication];
    uint64_t v57 = [v5 medication];
    if (v6 == (void *)v57)
    {
    }
    else
    {
      v8 = (void *)v57;
      uint64_t v58 = [v5 medication];
      if (!v58) {
        goto LABEL_53;
      }
      id v59 = (void *)v58;
      objc_super v60 = [(HKMedicationDispenseRecord *)self medication];
      v61 = [v5 medication];
      int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_54;
      }
    }
    v6 = [(HKMedicationDispenseRecord *)self status];
    uint64_t v63 = [v5 status];
    if (v6 == (void *)v63)
    {

LABEL_58:
      BOOL v14 = 1;
      goto LABEL_55;
    }
    v8 = (void *)v63;
    uint64_t v64 = [v5 status];
    if (v64)
    {
      id v65 = (void *)v64;
      id v66 = [(HKMedicationDispenseRecord *)self status];
      id v67 = [v5 status];
      char v68 = [v66 isEqual:v67];

      if (v68) {
        goto LABEL_58;
      }
LABEL_54:
      BOOL v14 = 0;
LABEL_55:

      goto LABEL_56;
    }
LABEL_53:

    goto LABEL_54;
  }
  BOOL v14 = 0;
LABEL_56:

  return v14;
}

- (id)medicationCodingsCollection
{
  v2 = [(HKMedicationDispenseRecord *)self medicationCodings];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCodings:v2];

  return v3;
}

- (id)statusCodingCollection
{
  uint64_t v3 = [(HKMedicationDispenseRecord *)self statusCoding];

  if (v3)
  {
    id v4 = [(HKMedicationDispenseRecord *)self statusCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSArray)medicationCodings
{
  return self->_medicationCodings;
}

- (void)_setMedicationCodings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  medicationCodings = self->_medicationCodings;
  self->_medicationCodings = v4;

  id v8 = [(HKMedicationDispenseRecord *)self medicationCodingsCollection];
  v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  medication = self->_medication;
  self->_medication = v6;
}

- (HKCodedQuantity)quantityDispensed
{
  return self->_quantityDispensed;
}

- (void)_setQuantityDispensed:(id)a3
{
  self->_quantityDispensed = (HKCodedQuantity *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)preparationDate
{
  return self->_preparationDate;
}

- (void)_setPreparationDate:(id)a3
{
  self->_preparationDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKMedicalDate)handOverDate
{
  return self->_handOverDate;
}

- (void)_setHandOverDate:(id)a3
{
  self->_handOverDate = (HKMedicalDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
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

- (HKMedicalCoding)statusCoding
{
  return self->_statusCoding;
}

- (void)_setStatusCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  if (self->_statusCoding)
  {
    uint64_t v9 = [(HKMedicationDispenseRecord *)self statusCodingCollection];
    v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    status = self->_status;
    self->_status = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_status;
    self->_status = 0;
  }
}

- (HKCodedQuantity)daysSupplyQuantity
{
  return self->_daysSupplyQuantity;
}

- (void)_setDaysSupplyQuantity:(id)a3
{
  self->_daysSupplyQuantity = (HKCodedQuantity *)[a3 copy];

  MEMORY[0x1F41817F8]();
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
    id v4 = [(HKMedicationDispenseRecord *)self medicationCodingsCollection];
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
      -[HKMedicationDispenseRecord _setMedication:](v5);
    }
  }
  v6 = (HKConcept *)[v4 copy];
  medication = self->_medication;
  self->_medication = v6;
}

- (HKConcept)status
{
  if (self->_statusCoding)
  {
    status = self->_status;
    if (status)
    {
      uint64_t v3 = status;
    }
    else
    {
      id v4 = [(HKMedicationDispenseRecord *)self statusCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setStatus:(id)a3
{
  self->_status = (HKConcept *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationDispenseRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    id v8 = v7;
    goto LABEL_6;
  }
  if (!self->_medicationCodings)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: medicationCodings must not be nil"", self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_medication, 0);
  objc_storeStrong((id *)&self->_daysSupplyQuantity, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_earliestDosageDate, 0);
  objc_storeStrong((id *)&self->_dosages, 0);
  objc_storeStrong((id *)&self->_handOverDate, 0);
  objc_storeStrong((id *)&self->_preparationDate, 0);
  objc_storeStrong((id *)&self->_quantityDispensed, 0);

  objc_storeStrong((id *)&self->_medicationCodings, 0);
}

+ (id)medicationDispenseRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 medicationCodings:(id)a14 quantityDispensed:(id)a15 preparationDate:(id)a16 handOverDate:(id)a17 dosages:(id)a18 earliestDosageDate:(id)a19 statusCoding:(id)a20 daysSupplyQuantity:(id)a21
{
  BOOL v43 = a5;
  id v53 = a3;
  id v52 = a4;
  id v25 = a6;
  id v51 = a7;
  id v46 = a8;
  id v45 = a10;
  id v47 = a11;
  id v50 = a12;
  id v49 = a14;
  id v48 = a15;
  id v26 = a16;
  id v27 = a17;
  id v42 = a18;
  id v28 = a19;
  id v41 = a20;
  id v40 = a21;
  objc_super v29 = @"modifiedDate";
  id v30 = v25;
  id v31 = v30;
  if (v28)
  {
    int v32 = @"earliestDosageDate";

    uint64_t v33 = [v28 dateForUTC];

    objc_super v29 = v32;
    if (!v26) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v33 = v30;
  if (v26)
  {
LABEL_3:
    uint64_t v34 = @"preparationDate";

    uint64_t v35 = [v26 dateForUTC];

    uint64_t v33 = (void *)v35;
    objc_super v29 = v34;
  }
LABEL_4:
  if (v27)
  {
    id v36 = @"handOverDate";

    uint64_t v37 = [v27 dateForUTC];

    uint64_t v33 = (void *)v37;
    objc_super v29 = v36;
  }
  int v38 = +[HKSemanticDate semanticDateWithKeyPath:v29 date:v33];
  +[HKMedicationDispenseRecord medicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:](HKMedicationDispenseRecord, "medicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:", v53, v52, v43, v31, v51, v46, a9, v45, v47, v38, v50, a13, v49, v48, v26,
    v27,
    v42,
    v28,
    v41,
  int v44 = v40);

  return v44;
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

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKMedicationDispenseRecord;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"medication"];
  [v3 addObject:@"status"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKMedicationDispenseRecord;
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
    BOOL v14 = 0;
    goto LABEL_11;
  }
  if ([v7 isEqualToString:@"medication"])
  {
    uint64_t v9 = [(HKMedicationDispenseRecord *)self medicationCodings];
    objc_super v10 = +[HKMedicalCodingCollection collectionWithCodings:v9];
    uint64_t v11 = +[HKIndexableObject indexableObjectWithObject:v10];
    v19[0] = v11;
    v12 = (void *)MEMORY[0x1E4F1C978];
    int v13 = (void **)v19;
LABEL_8:
    BOOL v14 = [v12 arrayWithObjects:v13 count:1];

    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"status"])
  {
    uint64_t v15 = [(HKMedicationDispenseRecord *)self statusCoding];

    if (v15)
    {
      uint64_t v9 = [(HKMedicationDispenseRecord *)self statusCoding];
      objc_super v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
      uint64_t v11 = +[HKIndexableObject indexableObjectWithObject:v10];
      uint64_t v18 = v11;
      v12 = (void *)MEMORY[0x1E4F1C978];
      int v13 = &v18;
      goto LABEL_8;
    }
    BOOL v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HKMedicationDispenseRecord;
    BOOL v14 = [(HKMedicalRecord *)&v17 codingsForKeyPath:v6 error:a4];
  }
LABEL_11:

  return v14;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  if (![v10 isEqualToString:@"medication"])
  {
    if (![v11 isEqualToString:@"status"])
    {
      v19.receiver = self;
      v19.super_class = (Class)HKMedicationDispenseRecord;
      BOOL v17 = [(HKMedicalRecord *)&v19 applyConcepts:v8 forKeyPath:v9 error:a5];
      goto LABEL_10;
    }
    uint64_t v14 = [v8 count];
    uint64_t v15 = [(HKMedicationDispenseRecord *)self statusCoding];
    BOOL v16 = HKIndexableObjectCheckCardinalityForIndexRestore(v14, v15 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v16)
    {
      v12 = [v8 firstObject];
      int v13 = [v12 object];
      [(HKMedicationDispenseRecord *)self _setStatus:v13];
      goto LABEL_8;
    }
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5)) {
    goto LABEL_9;
  }
  v12 = [v8 firstObject];
  int v13 = [v12 object];
  [(HKMedicationDispenseRecord *)self _setMedication:v13];
LABEL_8:

  BOOL v17 = 1;
LABEL_10:

  return v17;
}

- (void)_setMedication:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property medication for record type HKMedicationDispenseRecord.", v1, 2u);
}

@end