@interface HKVerifiableClinicalRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (HKVerifiableClinicalRecord)verifiableClinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 recordTypes:(id)a8 issuedDate:(id)a9 relevantDate:(id)a10 expirationDate:(id)a11 issuerIdentifier:(id)a12 subject:(id)a13 itemNames:(id)a14 dataRepresentation:(id)a15 originIdentifier:(id)a16 sourceType:(int64_t)a17;
+ (id)sourceTypeForInternalType:(int64_t)a3;
+ (int64_t)_privateSourceTypeForExternalType:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (HKVerifiableClinicalRecord)init;
- (HKVerifiableClinicalRecord)initWithCoder:(id)a3;
- (HKVerifiableClinicalRecordSourceType)sourceType;
- (HKVerifiableClinicalRecordSubject)subject;
- (NSArray)itemNames;
- (NSArray)recordTypes;
- (NSData)JWSRepresentation;
- (NSData)dataRepresentation;
- (NSDate)expirationDate;
- (NSDate)issuedDate;
- (NSDate)relevantDate;
- (NSString)issuerIdentifier;
- (NSString)recordIssuerDisplayName;
- (NSString)recordItemsDisplayName;
- (NSString)recordTypeDisplayName;
- (NSUUID)originIdentifier;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)description;
- (void)_setDataRepresentation:(id)a3;
- (void)_setExpirationDate:(id)a3;
- (void)_setIssuedDate:(id)a3;
- (void)_setIssuerIdentifier:(id)a3;
- (void)_setItemNames:(id)a3;
- (void)_setOriginIdentifier:(id)a3;
- (void)_setRecordTypes:(id)a3;
- (void)_setRelevantDate:(id)a3;
- (void)_setSourceType:(int64_t)a3;
- (void)_setSubject:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKVerifiableClinicalRecord

+ (HKVerifiableClinicalRecord)verifiableClinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 recordTypes:(id)a8 issuedDate:(id)a9 relevantDate:(id)a10 expirationDate:(id)a11 issuerIdentifier:(id)a12 subject:(id)a13 itemNames:(id)a14 dataRepresentation:(id)a15 originIdentifier:(id)a16 sourceType:(int64_t)a17
{
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __230__HKVerifiableClinicalRecord_verifiableClinicalRecordWithType_startDate_endDate_device_metadata_recordTypes_issuedDate_relevantDate_expirationDate_issuerIdentifier_subject_itemNames_dataRepresentation_originIdentifier_sourceType___block_invoke;
  aBlock[3] = &unk_1E58C78B0;
  id v52 = v18;
  id v53 = v19;
  id v54 = v20;
  id v55 = v21;
  id v56 = v22;
  id v57 = v23;
  id v58 = v24;
  id v59 = v25;
  id v60 = v26;
  id v61 = a1;
  id v27 = a1;
  int64_t v62 = a17;
  id v43 = v26;
  id v49 = v25;
  id v48 = v24;
  id v47 = v23;
  id v46 = v22;
  id v45 = v21;
  id v44 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = a7;
  id v31 = a6;
  id v32 = a5;
  id v33 = a4;
  id v34 = a3;
  v35 = _Block_copy(aBlock);
  v50.receiver = v27;
  v50.super_class = (Class)&OBJC_METACLASS___HKVerifiableClinicalRecord;
  id v36 = objc_msgSendSuper2(&v50, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v34, v33, v32, v31, v30, v35);

  return (HKVerifiableClinicalRecord *)v36;
}

void __230__HKVerifiableClinicalRecord_verifiableClinicalRecordWithType_startDate_endDate_device_metadata_recordTypes_issuedDate_relevantDate_expirationDate_issuerIdentifier_subject_itemNames_dataRepresentation_originIdentifier_sourceType___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  uint64_t v5 = [v3 copy];
  v6 = (void *)v4[12];
  v4[12] = v5;

  uint64_t v7 = [*(id *)(a1 + 40) copy];
  v8 = (void *)v4[15];
  v4[15] = v7;

  uint64_t v9 = [*(id *)(a1 + 48) copy];
  v10 = (void *)v4[16];
  v4[16] = v9;

  uint64_t v11 = [*(id *)(a1 + 56) copy];
  v12 = (void *)v4[17];
  v4[17] = v11;

  uint64_t v13 = [*(id *)(a1 + 64) copy];
  v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [*(id *)(a1 + 72) copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [*(id *)(a1 + 80) copy];
  id v18 = (void *)v4[18];
  v4[18] = v17;

  uint64_t v19 = [*(id *)(a1 + 88) copy];
  id v20 = (void *)v4[21];
  v4[21] = v19;

  uint64_t v21 = [*(id *)(a1 + 88) copy];
  id v22 = (void *)v4[20];
  v4[20] = v21;

  uint64_t v23 = [*(id *)(a1 + 96) copy];
  id v24 = (void *)v4[22];
  v4[22] = v23;

  id v27 = [(id)objc_opt_class() sourceTypeForInternalType:*(void *)(a1 + 112)];
  uint64_t v25 = [v27 copy];
  id v26 = (void *)v4[19];
  v4[19] = v25;
}

- (HKVerifiableClinicalRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v9.receiver = self;
  v9.super_class = (Class)HKVerifiableClinicalRecord;
  v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@, recordTypes = %@, issuedDate = %@, relevantDate = %@, expirationDate = %@, issuerIdentifier = %@, subject = %@, itemNames = %@, dataRepresentation = %@, sourceType = %@, originIdentifier = %@>", v5, self, v6, self->_recordTypes, self->_issuedDate, self->_relevantDate, self->_expirationDate, self->_issuerIdentifier, self->_subject, self->_itemNames, self->_dataRepresentation, self->_sourceType, self->_originIdentifier, 0];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecord;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordTypes, @"RecordTypes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_issuedDate forKey:@"IssuedDate"];
  [v4 encodeObject:self->_relevantDate forKey:@"RelevantDate"];
  [v4 encodeObject:self->_expirationDate forKey:@"ExpirationDate"];
  [v4 encodeObject:self->_issuerIdentifier forKey:@"IssuerIdentifier"];
  [v4 encodeObject:self->_subject forKey:@"Subject"];
  [v4 encodeObject:self->_itemNames forKey:@"ItemNames"];
  [v4 encodeObject:self->_dataRepresentation forKey:@"DataRepresentation"];
  [v4 encodeObject:self->_sourceType forKey:@"SourceType"];
  [v4 encodeObject:self->_originIdentifier forKey:@"OriginIdentifier"];
}

- (HKVerifiableClinicalRecord)initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HKVerifiableClinicalRecord;
  objc_super v5 = [(HKSample *)&v38 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"RecordTypes"];
    recordTypes = v5->_recordTypes;
    v5->_recordTypes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssuedDate"];
    issuedDate = v5->_issuedDate;
    v5->_issuedDate = (NSDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelevantDate"];
    relevantDate = v5->_relevantDate;
    v5->_relevantDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IssuerIdentifier"];
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Subject"];
    subject = v5->_subject;
    v5->_subject = (HKVerifiableClinicalRecordSubject *)v19;

    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v23 = [v21 setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"ItemNames"];
    itemNames = v5->_itemNames;
    v5->_itemNames = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataRepresentation"];
    dataRepresentation = v5->_dataRepresentation;
    v5->_dataRepresentation = (NSData *)v26;

    id v28 = v5->_dataRepresentation;
    if (!v28)
    {
      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JWSRepresentation"];
      id v30 = v5->_dataRepresentation;
      v5->_dataRepresentation = (NSData *)v29;

      id v28 = v5->_dataRepresentation;
    }
    uint64_t v31 = [(NSData *)v28 copy];
    JWSRepresentation = v5->_JWSRepresentation;
    v5->_JWSRepresentation = (NSData *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceType"];
    sourceType = v5->_sourceType;
    v5->_sourceType = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginIdentifier"];
    originIdentifier = v5->_originIdentifier;
    v5->_originIdentifier = (NSUUID *)v35;
  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  objc_super v5 = (HKVerifiableClinicalRecord *)a3;
  if (self == v5)
  {
    char v12 = 1;
  }
  else
  {
    v112.receiver = self;
    v112.super_class = (Class)HKVerifiableClinicalRecord;
    if ([(HKSample *)&v112 isEquivalent:v5])
    {
      v6 = v5;
      recordTypes = self->_recordTypes;
      v8 = [(HKVerifiableClinicalRecord *)v6 recordTypes];
      if (recordTypes != v8)
      {
        uint64_t v9 = [(HKVerifiableClinicalRecord *)v6 recordTypes];
        if (!v9)
        {
          char v12 = 0;
LABEL_114:

          goto LABEL_115;
        }
        v10 = self->_recordTypes;
        uint64_t v11 = [(HKVerifiableClinicalRecord *)v6 recordTypes];
        if (![(NSArray *)v10 isEqualToArray:v11])
        {
          char v12 = 0;
LABEL_72:

          goto LABEL_114;
        }
        v3 = v9;
        v109 = v11;
      }
      v111 = recordTypes;
      issuedDate = self->_issuedDate;
      v14 = [(HKVerifiableClinicalRecord *)v6 issuedDate];
      BOOL v108 = issuedDate != v14;
      if (issuedDate != v14)
      {
        uint64_t v15 = [(HKVerifiableClinicalRecord *)v6 issuedDate];
        if (!v15)
        {

          char v12 = 0;
          uint64_t v24 = v111;
          uint64_t v11 = v109;
          uint64_t v9 = v3;
          if (v111 == v8)
          {
LABEL_113:
            if (v24 != v8) {
              goto LABEL_114;
            }
            goto LABEL_115;
          }
LABEL_112:

          goto LABEL_113;
        }
        v16 = (void *)v15;
        uint64_t v17 = self->_issuedDate;
        v107 = [(HKVerifiableClinicalRecord *)v6 issuedDate];
        if (!-[NSDate isEqual:](v17, "isEqual:"))
        {
          char v12 = 0;
          uint64_t v11 = v109;
          uint64_t v23 = v14;
          uint64_t v9 = v3;
          goto LABEL_71;
        }
        v104 = v16;
      }
      relevantDate = self->_relevantDate;
      v110 = [(HKVerifiableClinicalRecord *)v6 relevantDate];
      v106 = relevantDate;
      BOOL v19 = relevantDate != v110;
      if (relevantDate != v110)
      {
        uint64_t v20 = [(HKVerifiableClinicalRecord *)v6 relevantDate];
        if (!v20)
        {

          char v12 = 0;
          BOOL v26 = issuedDate == v14;
          uint64_t v23 = v14;
          if (!v26)
          {
            LOBYTE(v30) = 1;
            uint64_t v11 = v109;
            uint64_t v31 = v104;
            uint64_t v9 = v3;
            goto LABEL_109;
          }
          BOOL v30 = 0;
          uint64_t v11 = v109;
          uint64_t v31 = v104;
          uint64_t v9 = v3;
LABEL_117:
          if (!v30) {
            goto LABEL_111;
          }
LABEL_110:

          goto LABEL_111;
        }
        v101 = (void *)v20;
        uint64_t v21 = self->_relevantDate;
        v103 = [(HKVerifiableClinicalRecord *)v6 relevantDate];
        if (!-[NSDate isEqual:](v21, "isEqual:"))
        {
          char v12 = 0;
          id v22 = issuedDate;
          uint64_t v23 = v14;
          uint64_t v9 = v3;
          goto LABEL_70;
        }
      }
      expirationDate = self->_expirationDate;
      v105 = [(HKVerifiableClinicalRecord *)v6 expirationDate];
      v102 = expirationDate;
      BOOL v26 = expirationDate == v105;
      BOOL v27 = expirationDate != v105;
      if (v26)
      {
        BOOL v94 = v27;
      }
      else
      {
        uint64_t v28 = [(HKVerifiableClinicalRecord *)v6 expirationDate];
        if (!v28)
        {

          char v12 = 0;
          id v22 = issuedDate;
          if (v106 != v110)
          {
            LOBYTE(v37) = 1;
            BOOL v30 = issuedDate != v14;
            uint64_t v23 = v14;
            uint64_t v9 = v3;
            goto LABEL_106;
          }
          BOOL v37 = 0;
          BOOL v30 = issuedDate != v14;
          uint64_t v23 = v14;
          uint64_t v9 = v3;
LABEL_119:
          if (!v37) {
            goto LABEL_108;
          }
LABEL_107:

          goto LABEL_108;
        }
        v96 = (void *)v28;
        uint64_t v29 = self->_expirationDate;
        v97 = [(HKVerifiableClinicalRecord *)v6 expirationDate];
        if (!-[NSDate isEqual:](v29, "isEqual:"))
        {
          char v12 = 0;
          uint64_t v35 = v106;
          id v22 = issuedDate;
          uint64_t v23 = v14;
          uint64_t v9 = v3;
          goto LABEL_69;
        }
        BOOL v94 = v27;
      }
      issuerIdentifier = self->_issuerIdentifier;
      v100 = [(HKVerifiableClinicalRecord *)v6 issuerIdentifier];
      v95 = issuerIdentifier;
      BOOL v93 = issuerIdentifier != v100;
      v99 = issuedDate;
      BOOL v98 = v19;
      if (issuerIdentifier == v100)
      {
        uint64_t v23 = v14;
      }
      else
      {
        uint64_t v33 = [(HKVerifiableClinicalRecord *)v6 issuerIdentifier];
        if (!v33)
        {

          char v12 = 0;
          uint64_t v35 = v106;
          uint64_t v23 = v14;
          if (v102 != v105)
          {
            LOBYTE(v42) = 1;
            uint64_t v9 = v3;
            id v22 = v99;
            goto LABEL_103;
          }
          BOOL v42 = 0;
          uint64_t v9 = v3;
          id v22 = v99;
LABEL_121:
          if (!v42) {
            goto LABEL_105;
          }
LABEL_104:

          goto LABEL_105;
        }
        v90 = (void *)v33;
        id v34 = self->_issuerIdentifier;
        v91 = [(HKVerifiableClinicalRecord *)v6 issuerIdentifier];
        uint64_t v23 = v14;
        if (!-[NSString isEqualToString:](v34, "isEqualToString:"))
        {
          char v12 = 0;
          uint64_t v35 = v106;
          uint64_t v9 = v3;
          id v36 = v100;
          id v22 = v99;
          goto LABEL_68;
        }
      }
      subject = self->_subject;
      v92 = [(HKVerifiableClinicalRecord *)v6 subject];
      BOOL v88 = subject != v92;
      if (subject == v92)
      {
        uint64_t v9 = v3;
      }
      else
      {
        uint64_t v39 = [(HKVerifiableClinicalRecord *)v6 subject];
        uint64_t v9 = v3;
        if (!v39)
        {

          char v12 = 0;
          id v36 = v100;
          uint64_t v35 = v106;
          if (issuerIdentifier != v100)
          {
            LOBYTE(v47) = 1;
            id v22 = v99;
            goto LABEL_100;
          }
          BOOL v47 = 0;
          id v22 = v99;
LABEL_123:
          if (!v47) {
            goto LABEL_102;
          }
LABEL_101:

          goto LABEL_102;
        }
        v86 = (void *)v39;
        v40 = self->_subject;
        v87 = [(HKVerifiableClinicalRecord *)v6 subject];
        if (!-[HKVerifiableClinicalRecordSubject isEqual:](v40, "isEqual:"))
        {
          char v12 = 0;
          uint64_t v35 = v106;
          id v22 = v99;
          v41 = v92;
          goto LABEL_67;
        }
      }
      itemNames = self->_itemNames;
      v89 = [(HKVerifiableClinicalRecord *)v6 itemNames];
      v85 = itemNames;
      BOOL v26 = itemNames == v89;
      BOOL v44 = itemNames != v89;
      if (v26)
      {
        BOOL v79 = v44;
      }
      else
      {
        uint64_t v45 = [(HKVerifiableClinicalRecord *)v6 itemNames];
        if (!v45)
        {

          char v12 = 0;
          v41 = v92;
          BOOL v26 = subject == v92;
          uint64_t v35 = v106;
          id v22 = v99;
          if (!v26)
          {
            LOBYTE(v54) = 1;
            goto LABEL_97;
          }
          BOOL v54 = 0;
          goto LABEL_125;
        }
        v82 = (void *)v45;
        id v46 = self->_itemNames;
        v83 = [(HKVerifiableClinicalRecord *)v6 itemNames];
        if (!-[NSArray isEqualToArray:](v46, "isEqualToArray:"))
        {
          v84 = subject;
          char v12 = 0;
          uint64_t v35 = v106;
          id v22 = v99;
          v41 = v92;
          goto LABEL_66;
        }
        BOOL v79 = v44;
      }
      dataRepresentation = self->_dataRepresentation;
      uint64_t v49 = [(HKVerifiableClinicalRecord *)v6 dataRepresentation];
      objc_super v50 = dataRepresentation;
      v51 = (NSData *)v49;
      v84 = subject;
      v81 = v50;
      if (v50 == (NSData *)v49)
      {
        v78 = (NSData *)v49;
      }
      else
      {
        uint64_t v52 = [(HKVerifiableClinicalRecord *)v6 dataRepresentation];
        if (!v52)
        {

          char v12 = 0;
          uint64_t v35 = v106;
          id v22 = v99;
          v41 = v92;
          BOOL v61 = v79;
          if (v85 != v89) {
            goto LABEL_91;
          }
          goto LABEL_94;
        }
        v77 = (void *)v52;
        id v53 = self->_dataRepresentation;
        v76 = [(HKVerifiableClinicalRecord *)v6 dataRepresentation];
        if (!-[NSData isEqual:](v53, "isEqual:"))
        {
          char v12 = 0;
          uint64_t v35 = v106;
          id v22 = v99;
          v41 = v92;
LABEL_89:

          if (v85 != v89)
          {
            LOBYTE(v61) = 1;
LABEL_91:

            if (!v61) {
              goto LABEL_96;
            }
LABEL_95:

            goto LABEL_96;
          }
          BOOL v61 = 0;
LABEL_94:
          if (!v61) {
            goto LABEL_96;
          }
          goto LABEL_95;
        }
        v78 = v51;
      }
      sourceType = self->_sourceType;
      v80 = [(HKVerifiableClinicalRecord *)v6 sourceType];
      v75 = sourceType;
      if (sourceType == v80)
      {
        v51 = v78;
      }
      else
      {
        uint64_t v56 = [(HKVerifiableClinicalRecord *)v6 sourceType];
        v51 = v78;
        if (!v56)
        {
          char v12 = 0;
          goto LABEL_88;
        }
        v74 = (void *)v56;
        id v57 = self->_sourceType;
        uint64_t v58 = [(HKVerifiableClinicalRecord *)v6 sourceType];
        id v59 = v57;
        id v60 = (void *)v58;
        if (![(NSString *)v59 isEqualToString:v58])
        {
          v69 = v78;

          char v12 = 0;
          goto LABEL_132;
        }
        v72 = v60;
      }
      originIdentifier = self->_originIdentifier;
      uint64_t v63 = [(HKVerifiableClinicalRecord *)v6 originIdentifier];
      v64 = originIdentifier;
      char v12 = originIdentifier == (NSUUID *)v63;
      if (!v12)
      {
        v73 = (NSUUID *)v63;
        uint64_t v65 = [(HKVerifiableClinicalRecord *)v6 originIdentifier];
        if (v65)
        {
          v66 = self->_originIdentifier;
          v67 = (void *)v65;
          v68 = [(HKVerifiableClinicalRecord *)v6 originIdentifier];
          char v12 = [(NSUUID *)v66 isEqual:v68];

          if (v75 == v80)
          {
          }
          else
          {
          }
          v69 = v51;
LABEL_132:
          if (v81 != v51)
          {
          }
          if (v85 != v89)
          {
          }
          if (v84 != v92)
          {
          }
          if (v95 != v100)
          {
          }
          if (v102 != v105)
          {
          }
          if (v106 != v110)
          {
          }
          if (v99 != v23)
          {
          }
          uint64_t v11 = v109;
          if (v111 == v8) {
            goto LABEL_115;
          }
          goto LABEL_72;
        }
        v64 = v73;
      }

      if (v75 == v80)
      {

        v70 = v81;
        uint64_t v35 = v106;
        id v22 = v99;
        v41 = v92;
        if (v81 != v51) {
          goto LABEL_89;
        }
LABEL_128:

        if (v85 == v89)
        {
LABEL_96:

          BOOL v54 = v88;
          if (v84 != v41)
          {
LABEL_97:

            if (!v54) {
              goto LABEL_99;
            }
            goto LABEL_98;
          }
LABEL_125:
          if (v54) {
LABEL_98:
          }

LABEL_99:
          id v36 = v100;
          BOOL v47 = v93;
          if (v95 != v100)
          {
LABEL_100:

            if (!v47) {
              goto LABEL_102;
            }
            goto LABEL_101;
          }
          goto LABEL_123;
        }
LABEL_66:

        if (v84 != v41)
        {
LABEL_67:

          id v36 = v100;
          if (v95 != v100)
          {
LABEL_68:

            if (v102 != v105)
            {
LABEL_69:

              BOOL v30 = v108;
              if (v35 != v110)
              {
LABEL_70:

                BOOL v26 = v22 == v23;
                uint64_t v11 = v109;
                v16 = v104;
                if (!v26)
                {
LABEL_71:

                  if (v111 != v8) {
                    goto LABEL_72;
                  }
LABEL_115:

                  goto LABEL_116;
                }
LABEL_111:

                uint64_t v24 = v111;
                if (v111 == v8) {
                  goto LABEL_113;
                }
                goto LABEL_112;
              }
LABEL_108:

              BOOL v26 = v22 == v23;
              uint64_t v11 = v109;
              uint64_t v31 = v104;
              if (!v26)
              {
LABEL_109:

                if (!v30) {
                  goto LABEL_111;
                }
                goto LABEL_110;
              }
              goto LABEL_117;
            }
LABEL_105:

            BOOL v26 = v35 == v110;
            BOOL v30 = v108;
            BOOL v37 = v98;
            if (!v26)
            {
LABEL_106:

              if (!v37) {
                goto LABEL_108;
              }
              goto LABEL_107;
            }
            goto LABEL_119;
          }
LABEL_102:

          BOOL v42 = v94;
          if (v102 != v105)
          {
LABEL_103:

            if (!v42) {
              goto LABEL_105;
            }
            goto LABEL_104;
          }
          goto LABEL_121;
        }
        goto LABEL_99;
      }

LABEL_88:
      uint64_t v35 = v106;
      id v22 = v99;
      v41 = v92;

      v70 = v81;
      if (v81 != v51) {
        goto LABEL_89;
      }
      goto LABEL_128;
    }
    char v12 = 0;
  }
LABEL_116:

  return v12;
}

- (void)_setIssuedDate:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  issuedDate = self->_issuedDate;
  self->_issuedDate = v4;

  MEMORY[0x1F41817F8](v4, issuedDate);
}

- (void)_setExpirationDate:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v4;

  MEMORY[0x1F41817F8](v4, expirationDate);
}

- (void)_setIssuerIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  issuerIdentifier = self->_issuerIdentifier;
  self->_issuerIdentifier = v4;

  MEMORY[0x1F41817F8](v4, issuerIdentifier);
}

- (void)_setItemNames:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  itemNames = self->_itemNames;
  self->_itemNames = v4;

  MEMORY[0x1F41817F8](v4, itemNames);
}

- (void)_setDataRepresentation:(id)a3
{
  id v4 = a3;
  objc_super v5 = (NSData *)[v4 copy];
  dataRepresentation = self->_dataRepresentation;
  self->_dataRepresentation = v5;

  uint64_t v7 = (NSData *)[v4 copy];
  JWSRepresentation = self->_JWSRepresentation;
  self->_JWSRepresentation = v7;
}

- (void)_setOriginIdentifier:(id)a3
{
  id v4 = (NSUUID *)[a3 copy];
  originIdentifier = self->_originIdentifier;
  self->_originIdentifier = v4;

  MEMORY[0x1F41817F8](v4, originIdentifier);
}

- (void)_setRecordTypes:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  recordTypes = self->_recordTypes;
  self->_recordTypes = v4;

  MEMORY[0x1F41817F8](v4, recordTypes);
}

- (void)_setRelevantDate:(id)a3
{
  id v4 = (NSDate *)[a3 copy];
  relevantDate = self->_relevantDate;
  self->_relevantDate = v4;

  MEMORY[0x1F41817F8](v4, relevantDate);
}

- (void)_setSourceType:(int64_t)a3
{
  id v6 = [(id)objc_opt_class() sourceTypeForInternalType:a3];
  id v4 = (NSString *)[v6 copy];
  sourceType = self->_sourceType;
  self->_sourceType = v4;
}

- (void)_setSubject:(id)a3
{
  id v4 = (HKVerifiableClinicalRecordSubject *)[a3 copy];
  subject = self->_subject;
  self->_subject = v4;

  MEMORY[0x1F41817F8](v4, subject);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKVerifiableClinicalRecord;
  objc_super v5 = -[HKSample _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if ([(NSArray *)self->_recordTypes count])
    {
      if (self->_issuedDate)
      {
        if (self->_relevantDate)
        {
          if (self->_issuerIdentifier)
          {
            if (self->_subject)
            {
              if ([(NSArray *)self->_itemNames count])
              {
                if (self->_dataRepresentation)
                {
                  if (self->_originIdentifier)
                  {
                    v8 = 0;
                    goto LABEL_22;
                  }
                  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v10 = objc_opt_class();
                  uint64_t v11 = @"%@: originIdentifier must not be nil";
                }
                else
                {
                  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v10 = objc_opt_class();
                  uint64_t v11 = @"%@: dataRepresentation must not be nil";
                }
              }
              else
              {
                uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v10 = objc_opt_class();
                uint64_t v11 = @"%@: itemNames must not be empty";
              }
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
            uint64_t v11 = @"%@: issuerIdentifier must not be nil";
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
      uint64_t v11 = @"%@: recordTypes must not be empty";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_22:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (int64_t)_privateSourceTypeForExternalType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SMARTHealthCard"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"EUDigitalCOVIDCertificate"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)sourceTypeForInternalType:(int64_t)a3
{
  id v3 = @"EUDigitalCOVIDCertificate";
  if (a3 != 2) {
    id v3 = 0;
  }
  if (a3 == 1) {
    return @"SMARTHealthCard";
  }
  else {
    return v3;
  }
}

- (NSArray)recordTypes
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)issuerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (HKVerifiableClinicalRecordSubject)subject
{
  return (HKVerifiableClinicalRecordSubject *)objc_getProperty(self, a2, 112, 1);
}

- (NSDate)issuedDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (NSDate)relevantDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)itemNames
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (HKVerifiableClinicalRecordSourceType)sourceType
{
  return (HKVerifiableClinicalRecordSourceType)objc_getProperty(self, a2, 152, 1);
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (NSData)JWSRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (NSUUID)originIdentifier
{
  return self->_originIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_JWSRepresentation, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_sourceType, 0);
  objc_storeStrong((id *)&self->_itemNames, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_issuedDate, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);

  objc_storeStrong((id *)&self->_recordTypes, 0);
}

- (NSString)recordTypeDisplayName
{
  v2 = [(HKVerifiableClinicalRecord *)self recordTypes];
  id v3 = +[HKSignedClinicalDataUtilities recordTypeDisplayNameWithTypes:v2];

  return (NSString *)v3;
}

- (NSString)recordItemsDisplayName
{
  v2 = [(HKVerifiableClinicalRecord *)self itemNames];
  id v3 = +[HKSignedClinicalDataUtilities recordItemsDisplayNameWithItems:v2];

  return (NSString *)v3;
}

- (NSString)recordIssuerDisplayName
{
  id v3 = [(HKVerifiableClinicalRecord *)self issuerIdentifier];
  int64_t v4 = +[HKSignedClinicalDataUtilities preferredRecordIssuerDisplayNameWithIssuerIdentifier:v3];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(HKObject *)self sourceRevision];
    id v7 = [v6 source];
    v8 = [v7 name];

    if ([v8 length])
    {
      id v5 = v8;
    }
    else
    {
      uint64_t v9 = [(HKVerifiableClinicalRecord *)self issuerIdentifier];
      id v5 = +[HKSignedClinicalDataUtilities recordIssuerDisplayNameWithIssuerIdentifier:v9];
    }
  }

  return (NSString *)v5;
}

@end