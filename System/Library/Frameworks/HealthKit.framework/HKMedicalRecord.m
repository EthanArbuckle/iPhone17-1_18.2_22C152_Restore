@interface HKMedicalRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newMedicalRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 config:(id)a15;
+ (id)_sortDateIntervalFromStartDateComponents:(id)a3 endDateComponents:(id)a4 error:(id *)a5;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)enteredInError;
- (BOOL)isEquivalent:(id)a3;
- (HKConcept)primaryConcept;
- (HKFHIRIdentifier)FHIRIdentifier;
- (HKMedicalRecord)initWithCoder:(id)a3;
- (HKMedicalRecordOriginIdentifier)originIdentifier;
- (HKSemanticDate)sortDate;
- (NSArray)medicalRecordCodings;
- (NSDate)modifiedDate;
- (NSLocale)locale;
- (NSString)country;
- (NSString)note;
- (id)_init;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)attachmentObjectIdentifier;
- (id)attachmentSchemaIdentifier;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)fallbackDisplayString;
- (int64_t)extractionVersion;
- (int64_t)recordCategoryType;
- (unint64_t)medicalRecordOriginType;
- (unint64_t)state;
- (void)_setCountry:(id)a3;
- (void)_setEnteredInError:(BOOL)a3;
- (void)_setExtractionVersion:(int64_t)a3;
- (void)_setLocale:(id)a3;
- (void)_setModifiedDate:(id)a3;
- (void)_setNote:(id)a3;
- (void)_setOriginIdentifier:(id)a3;
- (void)_setPrimaryConcept:(id)a3;
- (void)_setSortDate:(id)a3;
- (void)_setState:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalRecord

- (NSArray)medicalRecordCodings
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)fallbackDisplayString
{
  v2 = objc_opt_class();

  return (id)[v2 defaultDisplayString];
}

+ (id)defaultDisplayString
{
  return &stru_1EEC60288;
}

- (int64_t)recordCategoryType
{
  return 0;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalRecord;
  v2 = [(HKSample *)&v5 _init];
  v3 = (void *)v2[12];
  v2[12] = 0;

  return v2;
}

+ (id)_newMedicalRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 config:(id)a15
{
  id v38 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a12;
  id v23 = a13;
  id v24 = a15;
  id v43 = a11;
  id v25 = a10;
  id v26 = a3;
  [v19 timeIntervalSinceReferenceDate];
  double v28 = v27;
  [v19 timeIntervalSinceReferenceDate];
  double v30 = v29;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __166__HKMedicalRecord__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config___block_invoke;
  v45[3] = &unk_1E58C26C8;
  BOOL v55 = a5;
  id v46 = v38;
  id v47 = v19;
  id v48 = v20;
  id v49 = v21;
  id v50 = v22;
  id v51 = v23;
  int64_t v53 = a9;
  unint64_t v54 = a14;
  id v52 = v24;
  v44.receiver = a1;
  v44.super_class = (Class)&OBJC_METACLASS___HKMedicalRecord;
  id v42 = v24;
  id v40 = v23;
  id v31 = v22;
  id v32 = v21;
  id v33 = v20;
  id v34 = v19;
  id v35 = v38;
  id v36 = objc_msgSendSuper2(&v44, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v26, v25, v43, v45, v28, v30);

  return v36;
}

uint64_t __166__HKMedicalRecord__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config___block_invoke(uint64_t a1, void *a2)
{
  v17 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v17[14];
  v17[14] = v3;

  *((unsigned char *)v17 + 104) = *(unsigned char *)(a1 + 104);
  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v17[15];
  v17[15] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)v17[16];
  v17[16] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v17[17];
  v17[17] = v9;

  v17[18] = *(void *)(a1 + 88);
  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v17[19];
  v17[19] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v17[20];
  v17[20] = v13;

  v17[21] = *(void *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 80);
  if (v15) {
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v17);
  }

  return MEMORY[0x1F41817F8]();
}

- (HKFHIRIdentifier)FHIRIdentifier
{
  return [(HKMedicalRecordOriginIdentifier *)self->_originIdentifier fhirIdentifier];
}

- (unint64_t)medicalRecordOriginType
{
  v2 = [(HKMedicalRecordOriginIdentifier *)self->_originIdentifier signedClinicalDataRecordIdentifier];

  if (v2) {
    return 3;
  }
  else {
    return 1;
  }
}

- (id)attachmentObjectIdentifier
{
  return +[HKAttachmentObjectIdentifierUtilities attachmentObjectIdentifierForMedicalRecord:self];
}

- (id)attachmentSchemaIdentifier
{
  return @"HKClinicalRecord";
}

- (HKConcept)primaryConcept
{
  primaryConcept = self->_primaryConcept;
  if (primaryConcept)
  {
    uint64_t v3 = primaryConcept;
  }
  else
  {
    v4 = [(HKMedicalRecord *)self medicalRecordCodings];
    uint64_t v5 = +[HKMedicalCodingCollection collectionWithCodings:v4];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v5];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalRecord;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_note, @"Note", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_enteredInError forKey:@"EnteredInError"];
  [v4 encodeObject:self->_modifiedDate forKey:@"ModifiedDate"];
  [v4 encodeObject:self->_originIdentifier forKey:@"MedicalRecordOriginIdentifier"];
  [v4 encodeObject:self->_locale forKey:@"Locale"];
  [v4 encodeInteger:self->_extractionVersion forKey:@"ExtractionVersion"];
  [v4 encodeObject:self->_sortDate forKey:@"SortDate"];
  [v4 encodeObject:self->_primaryConcept forKey:@"PrimaryConcept"];
  [v4 encodeObject:self->_country forKey:@"Country"];
  [v4 encodeInteger:self->_state forKey:@"State"];
}

- (HKMedicalRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKMedicalRecord;
  objc_super v5 = [(HKSample *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Note"];
    note = v5->_note;
    v5->_note = (NSString *)v6;

    v5->_enteredInError = [v4 decodeBoolForKey:@"EnteredInError"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModifiedDate"];
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MedicalRecordOriginIdentifier"];
    originIdentifier = v5->_originIdentifier;
    v5->_originIdentifier = (HKMedicalRecordOriginIdentifier *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v12;

    v5->_extractionVersion = [v4 decodeIntegerForKey:@"ExtractionVersion"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SortDate"];
    sortDate = v5->_sortDate;
    v5->_sortDate = (HKSemanticDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryConcept"];
    primaryConcept = v5->_primaryConcept;
    v5->_primaryConcept = (HKConcept *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Country"];
    country = v5->_country;
    v5->_country = (NSString *)v18;

    v5->_state = [v4 decodeIntegerForKey:@"State"];
  }

  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = (HKMedicalRecord *)a3;
  if (self == v4)
  {
    BOOL v19 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v40.receiver = self;
    v40.super_class = (Class)HKMedicalRecord;
    if ([(HKMedicalRecord *)&v40 isKindOfClass:v5])
    {
      v39.receiver = self;
      v39.super_class = (Class)HKMedicalRecord;
      if ([(HKSample *)&v39 isEquivalent:v4])
      {
        uint64_t v6 = v4;
        BOOL v7 = [(HKMedicalRecord *)self enteredInError];
        if (v7 != [(HKMedicalRecord *)v6 enteredInError]) {
          goto LABEL_28;
        }
        uint64_t v8 = [(HKMedicalRecord *)self sortDate];
        uint64_t v9 = [(HKMedicalRecord *)v6 sortDate];
        int v10 = [v8 isEqual:v9];

        if (!v10) {
          goto LABEL_28;
        }
        uint64_t v11 = [(HKMedicalRecord *)self modifiedDate];
        uint64_t v12 = [(HKMedicalRecord *)v6 modifiedDate];
        if (v11 == (void *)v12)
        {
        }
        else
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [(HKMedicalRecord *)v6 modifiedDate];
          if (!v14) {
            goto LABEL_27;
          }
          uint64_t v15 = (void *)v14;
          uint64_t v16 = [(HKMedicalRecord *)self modifiedDate];
          v17 = [(HKMedicalRecord *)v6 modifiedDate];
          int v18 = [v16 isEqual:v17];

          if (!v18) {
            goto LABEL_28;
          }
        }
        uint64_t v11 = [(HKMedicalRecord *)self locale];
        uint64_t v13 = [(HKMedicalRecord *)v6 locale];
        if ((v11 != 0) != (v13 == 0))
        {
          uint64_t v20 = [(HKMedicalRecord *)v6 locale];
          if (v20)
          {
            objc_super v21 = (void *)v20;
            id v22 = [(HKMedicalRecord *)self locale];
            id v23 = [(HKMedicalRecord *)v6 locale];
            int v24 = objc_msgSend(v22, "hk_isEquivalent:", v23);

            if (!v24) {
              goto LABEL_28;
            }
          }
          else
          {
          }
          uint64_t v11 = [(HKMedicalRecord *)self note];
          uint64_t v25 = [(HKMedicalRecord *)v6 note];
          if (v11 == (void *)v25)
          {
          }
          else
          {
            uint64_t v13 = (void *)v25;
            uint64_t v26 = [(HKMedicalRecord *)v6 note];
            if (!v26) {
              goto LABEL_27;
            }
            double v27 = (void *)v26;
            double v28 = [(HKMedicalRecord *)self note];
            double v29 = [(HKMedicalRecord *)v6 note];
            int v30 = [v28 isEqualToString:v29];

            if (!v30) {
              goto LABEL_28;
            }
          }
          uint64_t v11 = [(HKMedicalRecord *)self country];
          uint64_t v31 = [(HKMedicalRecord *)v6 country];
          if (v11 == (void *)v31)
          {

LABEL_32:
            unint64_t v38 = [(HKMedicalRecord *)self state];
            BOOL v19 = v38 == [(HKMedicalRecord *)v6 state];
            goto LABEL_29;
          }
          uint64_t v13 = (void *)v31;
          uint64_t v32 = [(HKMedicalRecord *)v6 country];
          if (v32)
          {
            id v33 = (void *)v32;
            id v34 = [(HKMedicalRecord *)self country];
            id v35 = [(HKMedicalRecord *)v6 country];
            int v36 = [v34 isEqualToString:v35];

            if (v36) {
              goto LABEL_32;
            }
LABEL_28:
            BOOL v19 = 0;
LABEL_29:

            goto LABEL_30;
          }
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    BOOL v19 = 0;
  }
LABEL_30:

  return v19;
}

- (void)_setNote:(id)a3
{
  self->_note = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setEnteredInError:(BOOL)a3
{
  self->_enteredInError = a3;
}

- (void)_setModifiedDate:(id)a3
{
  self->_modifiedDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setOriginIdentifier:(id)a3
{
  self->_originIdentifier = (HKMedicalRecordOriginIdentifier *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setLocale:(id)a3
{
  self->_locale = (NSLocale *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setExtractionVersion:(int64_t)a3
{
  self->_extractionVersion = a3;
}

- (void)_setSortDate:(id)a3
{
  self->_sortDate = (HKSemanticDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setPrimaryConcept:(id)a3
{
  id v4 = (HKConcept *)a3;
  if (!v4)
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKMedicalRecord _setPrimaryConcept:](v5);
    }
  }
  primaryConcept = self->_primaryConcept;
  self->_primaryConcept = v4;
}

- (void)_setCountry:(id)a3
{
  self->_country = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKMedicalRecord;
  uint64_t v5 = -[HKSample _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_modifiedDate)
    {
      if (self->_sortDate)
      {
        if (self->_originIdentifier)
        {
          if (self->_extractionVersion)
          {
            uint64_t v8 = 0;
            goto LABEL_14;
          }
          uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = @"%@: _extractionVersion must not be nil";
        }
        else
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = @"%@: originIdentifier must not be nil";
        }
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: sortDate must not be nil";
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: modifiedDate must not be nil";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;
LABEL_14:

  return v8;
}

+ (id)_sortDateIntervalFromStartDateComponents:(id)a3 endDateComponents:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"start and end date components must be nonnull");
    objc_super v13 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
  if ([v7 isValidDateInCalendar:v10])
  {
    if ([v9 isValidDateInCalendar:v10])
    {
      uint64_t v11 = [v10 dateFromComponents:v7];
      uint64_t v12 = [v10 dateFromComponents:v9];
      if (objc_msgSend(v11, "hk_isAfterDate:", v12))
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"start date components after end date components");
        objc_super v13 = 0;
      }
      else
      {
        objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v12];
      }

      goto LABEL_13;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = @"end date components are not a valid date";
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = @"start date components are not a valid date";
  }
  objc_msgSend(v14, "hk_assignError:code:format:", a5, 3, v15);
  objc_super v13 = 0;
LABEL_13:

LABEL_14:

  return v13;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (NSString)note
{
  return self->_note;
}

- (BOOL)enteredInError
{
  return self->_enteredInError;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (HKMedicalRecordOriginIdentifier)originIdentifier
{
  return self->_originIdentifier;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int64_t)extractionVersion
{
  return self->_extractionVersion;
}

- (HKSemanticDate)sortDate
{
  return self->_sortDate;
}

- (NSString)country
{
  return self->_country;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_sortDate, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_primaryConcept, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 0;
}

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 indexableConceptKeyPaths];
  uint64_t v6 = +[HKConceptIndexUtilities keyPaths:v5 prefix:v4];

  return v6;
}

+ (id)indexableConceptKeyPaths
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"primaryConcept";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"primaryConcept.groupByConcept";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"primaryConcept"])
  {
    id v7 = [(HKMedicalRecord *)self medicalRecordCodings];
    id v8 = +[HKMedicalCodingCollection collectionWithCodings:v7];

    uint64_t v9 = +[HKIndexableObject indexableObjectWithObject:v8];
    v12[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 isEqualToString:@"primaryConcept"];
  if (v10)
  {
    BOOL v11 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5);

    if (!v11)
    {
      LOBYTE(v10) = 0;
      goto LABEL_7;
    }
    uint64_t v12 = [v8 firstObject];
    id v9 = [v12 object];
    [(HKMedicalRecord *)self _setPrimaryConcept:v9];
  }
  else
  {
    objc_super v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v14);
    objc_msgSend(v13, "hk_assignError:code:format:", a5, 3, @"%@ does not support applying concepts for key-path %@", v12, v9);
  }

LABEL_7:
  return v10;
}

- (void)_setPrimaryConcept:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_19C023000, v1, OS_LOG_TYPE_FAULT, "Tried to set a nil primaryConcept in class %@", (uint8_t *)&v4, 0xCu);
}

@end