@interface HKSignedClinicalDataRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newSignedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 credentialTypes:(id)a15 issuerIdentifier:(id)a16 issuedDate:(id)a17 relevantDate:(id)a18 expirationDate:(id)a19 signatureStatus:(int64_t)a20 subject:(id)a21 items:(id)a22 dataValue:(id)a23 sourceType:(int64_t)a24 config:(id)a25;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)indexableConceptKeyPaths;
+ (id)signedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 credentialTypes:(id)a14 issuerIdentifier:(id)a15 issuedDate:(id)a16 relevantDate:(id)a17 expirationDate:(id)a18 signatureStatus:(int64_t)a19 subject:(id)a20 items:(id)a21 dataValue:(id)a22 sourceType:(int64_t)a23;
+ (id)signedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 credentialTypes:(id)a15 issuerIdentifier:(id)a16 issuedDate:(id)a17 relevantDate:(id)a18 expirationDate:(id)a19 signatureStatus:(int64_t)a20 subject:(id)a21 items:(id)a22 dataValue:(id)a23 sourceType:(int64_t)a24;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKSignedClinicalDataRecord)init;
- (HKSignedClinicalDataRecord)initWithCoder:(id)a3;
- (HKSignedClinicalDataSubject)subject;
- (NSArray)credentialTypes;
- (NSArray)items;
- (NSData)dataValue;
- (NSDate)expirationDate;
- (NSDate)issuedDate;
- (NSDate)relevantDate;
- (NSString)description;
- (NSString)issuerIdentifier;
- (NSString)recordIssuerDisplayName;
- (NSString)recordItemsDisplayName;
- (NSString)recordTypeDisplayName;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (int64_t)signatureStatus;
- (int64_t)sourceType;
- (void)_setCredentialTypes:(id)a3;
- (void)_setDataValue:(id)a3;
- (void)_setExpirationDate:(id)a3;
- (void)_setIssuedDate:(id)a3;
- (void)_setIssuerIdentifier:(id)a3;
- (void)_setItems:(id)a3;
- (void)_setRelevantDate:(id)a3;
- (void)_setSignatureStatus:(int64_t)a3;
- (void)_setSourceType:(int64_t)a3;
- (void)_setSubject:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataRecord

+ (id)signedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 credentialTypes:(id)a15 issuerIdentifier:(id)a16 issuedDate:(id)a17 relevantDate:(id)a18 expirationDate:(id)a19 signatureStatus:(int64_t)a20 subject:(id)a21 items:(id)a22 dataValue:(id)a23 sourceType:(int64_t)a24
{
  v24 = objc_msgSend(a1, "_newSignedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  a23,
                  a24,
                  0);

  return v24;
}

+ (id)_newSignedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 credentialTypes:(id)a15 issuerIdentifier:(id)a16 issuedDate:(id)a17 relevantDate:(id)a18 expirationDate:(id)a19 signatureStatus:(int64_t)a20 subject:(id)a21 items:(id)a22 dataValue:(id)a23 sourceType:(int64_t)a24 config:(id)a25
{
  BOOL v60 = a5;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  id v30 = a21;
  id v31 = a22;
  id v32 = a23;
  id v33 = a25;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __311__HKSignedClinicalDataRecord__newSignedClinicalDataRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_credentialTypes_issuerIdentifier_issuedDate_relevantDate_expirationDate_signatureStatus_subject_items_dataValue_sourceType_config___block_invoke;
  aBlock[3] = &unk_1E58BF478;
  id v64 = v25;
  id v65 = v26;
  id v66 = v27;
  id v67 = v28;
  id v68 = v29;
  id v69 = v30;
  id v70 = v31;
  id v71 = v32;
  int64_t v73 = a20;
  int64_t v74 = a24;
  id v72 = v33;
  id v59 = v33;
  id v58 = v32;
  id v57 = v31;
  id v56 = v30;
  id v55 = v29;
  id v54 = v28;
  id v53 = v27;
  id v52 = v26;
  id v51 = v25;
  id v34 = a13;
  id v35 = a12;
  id v36 = a11;
  id v37 = a10;
  id v38 = a8;
  id v39 = a7;
  id v40 = a6;
  id v41 = a4;
  id v42 = a3;
  v43 = _Block_copy(aBlock);
  v62.receiver = a1;
  v62.super_class = (Class)&OBJC_METACLASS___HKSignedClinicalDataRecord;
  id v61 = objc_msgSendSuper2(&v62, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v42, v41, v60, v40, v39, v38, a9, v37, v36, v35, v34, a14, v43);

  return v61;
}

uint64_t __311__HKSignedClinicalDataRecord__newSignedClinicalDataRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_credentialTypes_issuerIdentifier_issuedDate_relevantDate_expirationDate_signatureStatus_subject_items_dataValue_sourceType_config___block_invoke(uint64_t a1, void *a2)
{
  v21 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  v4 = (void *)v21[22];
  v21[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  v6 = (void *)v21[23];
  v21[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  v8 = (void *)v21[24];
  v21[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v21[25];
  v21[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v21[26];
  v21[26] = v11;

  v21[27] = *(void *)(a1 + 104);
  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v21[28];
  v21[28] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v21[29];
  v21[29] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v21[30];
  v21[30] = v17;

  v21[31] = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 96);
  if (v19) {
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);
  }

  return MEMORY[0x1F41817F8]();
}

- (HKSignedClinicalDataRecord)init
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
  v9.super_class = (Class)HKSignedClinicalDataRecord;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@credentialTypes = %@issuerIdentifier = %@issuedDate = %@relevantDate = %@expirationDate = %@signatureStatus = %ldsubject = %@items = %@dataValue = %@sourceType = %ld>", v5, self, v6, self->_credentialTypes, self->_issuerIdentifier, self->_issuedDate, self->_relevantDate, self->_expirationDate, self->_signatureStatus, self->_subject, self->_items, self->_dataValue, self->_sourceType];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSignedClinicalDataRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialTypes, @"CredentialTypes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_issuerIdentifier forKey:@"IssuerIdentifier"];
  [v4 encodeObject:self->_issuedDate forKey:@"IssuedDate"];
  [v4 encodeObject:self->_relevantDate forKey:@"RelevantDate"];
  [v4 encodeObject:self->_expirationDate forKey:@"ExpirationDate"];
  [v4 encodeInteger:self->_signatureStatus forKey:@"SignatureStatus"];
  [v4 encodeObject:self->_subject forKey:@"Subject"];
  [v4 encodeObject:self->_items forKey:@"Items"];
  [v4 encodeObject:self->_dataValue forKey:@"DataValue"];
  [v4 encodeInteger:self->_sourceType forKey:@"SourceType"];
}

- (HKSignedClinicalDataRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKSignedClinicalDataRecord;
  objc_super v5 = [(HKMedicalRecord *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"CredentialTypes"];
    credentialTypes = v5->_credentialTypes;
    v5->_credentialTypes = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssuerIdentifier"];
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssuedDate"];
    issuedDate = v5->_issuedDate;
    v5->_issuedDate = (NSDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelevantDate"];
    relevantDate = v5->_relevantDate;
    v5->_relevantDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    v5->_signatureStatus = [v4 decodeIntegerForKey:@"SignatureStatus"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Subject"];
    subject = v5->_subject;
    v5->_subject = (HKSignedClinicalDataSubject *)v17;

    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"Items"];
    items = v5->_items;
    v5->_items = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataValue"];
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v22;

    v5->_sourceType = [v4 decodeIntegerForKey:@"SourceType"];
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
    v60.receiver = self;
    v60.super_class = (Class)HKSignedClinicalDataRecord;
    if (![(HKMedicalRecord *)&v60 isEquivalent:v5]) {
      goto LABEL_45;
    }
    v6 = [(HKSignedClinicalDataRecord *)self credentialTypes];
    uint64_t v7 = [v5 credentialTypes];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      uint64_t v9 = [v5 credentialTypes];
      if (!v9) {
        goto LABEL_44;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKSignedClinicalDataRecord *)self credentialTypes];
      v12 = [v5 credentialTypes];
      int v13 = [v11 isEqualToArray:v12];

      if (!v13) {
        goto LABEL_45;
      }
    }
    v6 = [(HKSignedClinicalDataRecord *)self issuerIdentifier];
    uint64_t v15 = [v5 issuerIdentifier];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      v8 = (void *)v15;
      uint64_t v16 = [v5 issuerIdentifier];
      if (!v16) {
        goto LABEL_44;
      }
      uint64_t v17 = (void *)v16;
      v18 = [(HKSignedClinicalDataRecord *)self issuerIdentifier];
      uint64_t v19 = [v5 issuerIdentifier];
      int v20 = [v18 isEqualToString:v19];

      if (!v20) {
        goto LABEL_45;
      }
    }
    v6 = [(HKSignedClinicalDataRecord *)self issuedDate];
    uint64_t v21 = [v5 issuedDate];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      v8 = (void *)v21;
      uint64_t v22 = [v5 issuedDate];
      if (!v22) {
        goto LABEL_44;
      }
      v23 = (void *)v22;
      v24 = [(HKSignedClinicalDataRecord *)self issuedDate];
      objc_super v25 = [v5 issuedDate];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_45;
      }
    }
    v6 = [(HKSignedClinicalDataRecord *)self relevantDate];
    uint64_t v27 = [v5 relevantDate];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      v8 = (void *)v27;
      uint64_t v28 = [v5 relevantDate];
      if (!v28) {
        goto LABEL_44;
      }
      id v29 = (void *)v28;
      id v30 = [(HKSignedClinicalDataRecord *)self relevantDate];
      id v31 = [v5 relevantDate];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_45;
      }
    }
    v6 = [(HKSignedClinicalDataRecord *)self expirationDate];
    uint64_t v33 = [v5 expirationDate];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      v8 = (void *)v33;
      uint64_t v34 = [v5 expirationDate];
      if (!v34) {
        goto LABEL_44;
      }
      id v35 = (void *)v34;
      id v36 = [(HKSignedClinicalDataRecord *)self expirationDate];
      id v37 = [v5 expirationDate];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_45;
      }
    }
    int64_t v39 = [(HKSignedClinicalDataRecord *)self signatureStatus];
    if (v39 != [v5 signatureStatus]) {
      goto LABEL_45;
    }
    v6 = [(HKSignedClinicalDataRecord *)self subject];
    uint64_t v40 = [v5 subject];
    if (v6 == (void *)v40)
    {
    }
    else
    {
      v8 = (void *)v40;
      uint64_t v41 = [v5 subject];
      if (!v41) {
        goto LABEL_44;
      }
      id v42 = (void *)v41;
      v43 = [(HKSignedClinicalDataRecord *)self subject];
      v44 = [v5 subject];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_45;
      }
    }
    v6 = [(HKSignedClinicalDataRecord *)self items];
    uint64_t v46 = [v5 items];
    if (v6 == (void *)v46)
    {
    }
    else
    {
      v8 = (void *)v46;
      uint64_t v47 = [v5 items];
      if (!v47) {
        goto LABEL_44;
      }
      v48 = (void *)v47;
      v49 = [(HKSignedClinicalDataRecord *)self items];
      v50 = [v5 items];
      int v51 = [v49 isEqualToArray:v50];

      if (!v51) {
        goto LABEL_45;
      }
    }
    v6 = [(HKSignedClinicalDataRecord *)self dataValue];
    uint64_t v52 = [v5 dataValue];
    if (v6 == (void *)v52)
    {

LABEL_49:
      int64_t v59 = [(HKSignedClinicalDataRecord *)self sourceType];
      BOOL v14 = v59 == [v5 sourceType];
      goto LABEL_46;
    }
    v8 = (void *)v52;
    uint64_t v53 = [v5 dataValue];
    if (v53)
    {
      id v54 = (void *)v53;
      id v55 = [(HKSignedClinicalDataRecord *)self dataValue];
      id v56 = [v5 dataValue];
      int v57 = [v55 isEqual:v56];

      if (v57) {
        goto LABEL_49;
      }
LABEL_45:
      BOOL v14 = 0;
LABEL_46:

      goto LABEL_47;
    }
LABEL_44:

    goto LABEL_45;
  }
  BOOL v14 = 0;
LABEL_47:

  return v14;
}

- (NSArray)credentialTypes
{
  return self->_credentialTypes;
}

- (void)_setCredentialTypes:(id)a3
{
  self->_credentialTypes = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)_setIssuerIdentifier:(id)a3
{
  self->_issuerIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSDate)issuedDate
{
  return self->_issuedDate;
}

- (void)_setIssuedDate:(id)a3
{
  self->_issuedDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (void)_setRelevantDate:(id)a3
{
  self->_relevantDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)_setExpirationDate:(id)a3
{
  self->_expirationDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int64_t)signatureStatus
{
  return self->_signatureStatus;
}

- (void)_setSignatureStatus:(int64_t)a3
{
  self->_signatureStatus = a3;
}

- (HKSignedClinicalDataSubject)subject
{
  return self->_subject;
}

- (void)_setSubject:(id)a3
{
  self->_subject = (HKSignedClinicalDataSubject *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSArray)items
{
  return self->_items;
}

- (void)_setItems:(id)a3
{
  self->_items = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)_setDataValue:(id)a3
{
  self->_dataValue = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)_setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKSignedClinicalDataRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_credentialTypes)
    {
      if (self->_issuerIdentifier)
      {
        if (self->_issuedDate)
        {
          if (self->_relevantDate)
          {
            if (self->_subject)
            {
              if (self->_items)
              {
                v8 = 0;
                goto LABEL_18;
              }
              uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v10 = objc_opt_class();
              uint64_t v11 = @"%@: items must not be nil";
            }
            else
            {
              uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v10 = objc_opt_class();
              uint64_t v11 = @"%@: subject must not be nil";
            }
          }
          else
          {
            uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v10 = objc_opt_class();
            uint64_t v11 = @"%@: relevantDate must not be nil";
          }
        }
        else
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = @"%@: issuedDate must not be nil";
        }
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: issuerIdentifier must not be nil";
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: credentialTypes must not be nil";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_18:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_issuedDate, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);

  objc_storeStrong((id *)&self->_credentialTypes, 0);
}

- (NSString)recordTypeDisplayName
{
  v2 = [(HKSignedClinicalDataRecord *)self credentialTypes];
  uint64_t v3 = +[HKSignedClinicalDataUtilities recordTypeDisplayNameWithTypes:v2];

  return (NSString *)v3;
}

- (NSString)recordItemsDisplayName
{
  v2 = [(HKSignedClinicalDataRecord *)self items];
  uint64_t v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_56);
  id v4 = +[HKSignedClinicalDataUtilities recordItemsDisplayNameWithItems:v3];

  return (NSString *)v4;
}

id __67__HKSignedClinicalDataRecord_HealthRecords__recordItemsDisplayName__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 primaryConcept];
  uint64_t v3 = [v2 preferredName];

  return v3;
}

- (NSString)recordIssuerDisplayName
{
  uint64_t v3 = [(HKSignedClinicalDataRecord *)self issuerIdentifier];
  id v4 = +[HKSignedClinicalDataUtilities preferredRecordIssuerDisplayNameWithIssuerIdentifier:v3];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(HKObject *)self sourceRevision];
    id v7 = [v6 source];
    v8 = [v7 name];

    if ([v8 length])
    {
      id v5 = v8;
    }
    else
    {
      uint64_t v9 = [(HKSignedClinicalDataRecord *)self issuerIdentifier];
      id v5 = +[HKSignedClinicalDataUtilities recordIssuerDisplayNameWithIssuerIdentifier:v9];
    }
  }

  return (NSString *)v5;
}

+ (id)indexableConceptKeyPaths
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSignedClinicalDataRecord;
  v2 = objc_msgSendSuper2(&v6, sel_indexableConceptKeyPaths);
  uint64_t v3 = (void *)[v2 mutableCopy];

  id v4 = +[HKSignedClinicalDataItem indexableKeyPathsWithPrefix:@"items"];
  [v3 addObjectsFromArray:v4];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKSignedClinicalDataRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"items"])
    {
      uint64_t v9 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v6 error:a4];
      if (v9)
      {
        uint64_t v10 = [(HKSignedClinicalDataRecord *)self items];
        uint64_t v11 = [v10 codingsForKeyPath:v9 error:a4];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)HKSignedClinicalDataRecord;
      uint64_t v11 = [(HKMedicalRecord *)&v13 codingsForKeyPath:v6 error:a4];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 isEqualToString:@"items"])
    {
      v12 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v9 error:a5];
      if (v12)
      {
        objc_super v13 = [(HKSignedClinicalDataRecord *)self items];

        if (v13)
        {
          BOOL v14 = [(HKSignedClinicalDataRecord *)self items];
          unsigned __int8 v15 = [v14 applyConcepts:v8 forKeyPath:v12 error:a5];
        }
        else
        {
          unsigned __int8 v15 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)HKSignedClinicalDataRecord;
      unsigned __int8 v15 = [(HKMedicalRecord *)&v17 applyConcepts:v8 forKeyPath:v9 error:a5];
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

+ (id)signedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 credentialTypes:(id)a14 issuerIdentifier:(id)a15 issuedDate:(id)a16 relevantDate:(id)a17 expirationDate:(id)a18 signatureStatus:(int64_t)a19 subject:(id)a20 items:(id)a21 dataValue:(id)a22 sourceType:(int64_t)a23
{
  BOOL v40 = a5;
  id v42 = a16;
  id v23 = a22;
  id v24 = a21;
  id v32 = a20;
  id v31 = a18;
  id v30 = a17;
  id v29 = a15;
  id v25 = a14;
  id v43 = a12;
  id v44 = a11;
  id v47 = a10;
  id v34 = a8;
  id v46 = a7;
  id v26 = a6;
  id v37 = a4;
  id v27 = a3;
  int64_t v39 = +[HKSemanticDate semanticDateWithKeyPath:@"issuedDate" date:v42];
  +[HKSignedClinicalDataRecord signedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:](HKSignedClinicalDataRecord, "signedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:", v27, v37, v40, v26, v46, v34, a9, v47, v44, v39, v43, a13, v25, v29, v42,
    v30,
    v31,
    a19,
    v32,
    v24,
    v23,
  uint64_t v41 = a23);

  return v41;
}

@end