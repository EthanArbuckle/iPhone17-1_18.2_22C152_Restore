@interface HKCoverageRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newCoverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 coverageTypeCodingCollection:(id)a16 subscriber:(id)a17 subscriberId:(id)a18 beneficiary:(id)a19 policyHolder:(id)a20 payor:(id)a21 relationshipCodingCollection:(id)a22 classification:(id)a23 network:(id)a24 periodStartDate:(id)a25 periodEndDate:(id)a26 subscriberIdentifier:(id)a27 beneficiaryIdentifier:(id)a28 config:(id)a29;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)coverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 statusCoding:(id)a14 coverageTypeCodingCollection:(id)a15 subscriber:(id)a16 subscriberId:(id)a17 beneficiary:(id)a18 policyHolder:(id)a19 payor:(id)a20 relationshipCodingCollection:(id)a21 classification:(id)a22 network:(id)a23 periodStartDate:(id)a24 periodEndDate:(id)a25 subscriberIdentifier:(id)a26 beneficiaryIdentifier:(id)a27;
+ (id)coverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 coverageTypeCodingCollection:(id)a16 subscriber:(id)a17 subscriberId:(id)a18 beneficiary:(id)a19 policyHolder:(id)a20 payor:(id)a21 relationshipCodingCollection:(id)a22 classification:(id)a23 network:(id)a24 periodStartDate:(id)a25 periodEndDate:(id)a26 subscriberIdentifier:(id)a27 beneficiaryIdentifier:(id)a28;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKConcept)coverageType;
- (HKConcept)relationship;
- (HKConcept)status;
- (HKCoverageRecord)init;
- (HKCoverageRecord)initWithCoder:(id)a3;
- (HKFHIRIdentifierElement)beneficiaryIdentifier;
- (HKFHIRIdentifierElement)subscriberIdentifier;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)coverageTypeCodingCollection;
- (HKMedicalCodingCollection)relationshipCodingCollection;
- (HKMedicalDate)periodEndDate;
- (HKMedicalDate)periodStartDate;
- (NSArray)classification;
- (NSArray)payor;
- (NSString)beneficiary;
- (NSString)description;
- (NSString)network;
- (NSString)policyHolder;
- (NSString)subscriber;
- (NSString)subscriberId;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setBeneficiary:(id)a3;
- (void)_setBeneficiaryIdentifier:(id)a3;
- (void)_setClassification:(id)a3;
- (void)_setCoverageType:(id)a3;
- (void)_setCoverageTypeCodingCollection:(id)a3;
- (void)_setNetwork:(id)a3;
- (void)_setPayor:(id)a3;
- (void)_setPeriodEndDate:(id)a3;
- (void)_setPeriodStartDate:(id)a3;
- (void)_setPolicyHolder:(id)a3;
- (void)_setRelationship:(id)a3;
- (void)_setRelationshipCodingCollection:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)_setSubscriber:(id)a3;
- (void)_setSubscriberId:(id)a3;
- (void)_setSubscriberIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCoverageRecord

- (id)medicalRecordCodings
{
  v2 = [(HKCoverageRecord *)self coverageTypeCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_COVERAGE" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

+ (id)indexableConceptKeyPaths
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKCoverageRecord;
  v2 = objc_msgSendSuper2(&v6, sel_indexableConceptKeyPaths);
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"status"];
  [v3 addObject:@"coverageType"];
  [v3 addObject:@"relationship"];
  v4 = +[HKCoverageClassification indexableKeyPathsWithPrefix:@"classification"];
  [v3 addObjectsFromArray:v4];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKCoverageRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (!v7)
  {
    v12 = 0;
    goto LABEL_12;
  }
  if ([v7 isEqualToString:@"status"])
  {
    v9 = [(HKCoverageRecord *)self statusCoding];
    v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
    v11 = +[HKIndexableObject indexableObjectWithObject:v10];
    v24[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"coverageType"])
  {
    v13 = [(HKCoverageRecord *)self coverageTypeCodingCollection];
    v14 = +[HKIndexableObject indexableObjectWithObject:v13];
    v23 = v14;
    v15 = (void *)MEMORY[0x1E4F1C978];
    v16 = &v23;
LABEL_10:
    v12 = [v15 arrayWithObjects:v16 count:1];

LABEL_11:
    goto LABEL_12;
  }
  if ([v8 isEqualToString:@"relationship"])
  {
    v17 = [(HKCoverageRecord *)self relationshipCodingCollection];

    if (v17)
    {
      v13 = [(HKCoverageRecord *)self relationshipCodingCollection];
      v14 = +[HKIndexableObject indexableObjectWithObject:v13];
      v22 = v14;
      v15 = (void *)MEMORY[0x1E4F1C978];
      v16 = &v22;
      goto LABEL_10;
    }
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"classification"])
  {
    v19 = [(HKCoverageRecord *)self classification];

    if (v19)
    {
      v13 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v6 error:a4];
      if (v13)
      {
        v20 = [(HKCoverageRecord *)self classification];
        v12 = [v20 codingsForKeyPath:v13 error:a4];
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_11;
    }
LABEL_19:
    v12 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  v21.receiver = self;
  v21.super_class = (Class)HKCoverageRecord;
  v12 = [(HKMedicalRecord *)&v21 codingsForKeyPath:v6 error:a4];
LABEL_12:

  return v12;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_12;
  }
  if ([v10 isEqualToString:@"status"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      v12 = [v8 firstObject];
      v13 = [v12 object];
      [(HKCoverageRecord *)self _setStatus:v13];
LABEL_11:

      unsigned __int8 v17 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ([v11 isEqualToString:@"coverageType"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      v12 = [v8 firstObject];
      v13 = [v12 object];
      [(HKCoverageRecord *)self _setCoverageType:v13];
      goto LABEL_11;
    }
LABEL_12:
    unsigned __int8 v17 = 0;
    goto LABEL_13;
  }
  if ([v11 isEqualToString:@"relationship"])
  {
    uint64_t v14 = [v8 count];
    v15 = [(HKCoverageRecord *)self relationshipCodingCollection];
    BOOL v16 = HKIndexableObjectCheckCardinalityForIndexRestore(v14, v15 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v16)
    {
      v12 = [v8 firstObject];
      v13 = [v12 object];
      [(HKCoverageRecord *)self _setRelationship:v13];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if ([v11 isEqualToString:@"classification"])
  {
    v19 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v9 error:a5];
    if (v19)
    {
      v20 = [(HKCoverageRecord *)self classification];

      if (v20)
      {
        objc_super v21 = [(HKCoverageRecord *)self classification];
        unsigned __int8 v17 = [v21 applyConcepts:v8 forKeyPath:v19 error:a5];
      }
      else
      {
        unsigned __int8 v17 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
      }
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HKCoverageRecord;
    unsigned __int8 v17 = [(HKMedicalRecord *)&v22 applyConcepts:v8 forKeyPath:v9 error:a5];
  }
LABEL_13:

  return v17;
}

- (int64_t)recordCategoryType
{
  return 9;
}

+ (id)coverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 statusCoding:(id)a14 coverageTypeCodingCollection:(id)a15 subscriber:(id)a16 subscriberId:(id)a17 beneficiary:(id)a18 policyHolder:(id)a19 payor:(id)a20 relationshipCodingCollection:(id)a21 classification:(id)a22 network:(id)a23 periodStartDate:(id)a24 periodEndDate:(id)a25 subscriberIdentifier:(id)a26 beneficiaryIdentifier:(id)a27
{
  BOOL v52 = a5;
  id v65 = a3;
  id v64 = a4;
  id v31 = a6;
  id v63 = a7;
  id v62 = a8;
  id v59 = a10;
  id v58 = a11;
  id v57 = a12;
  id v61 = a14;
  id v60 = a15;
  id v56 = a16;
  id v51 = a17;
  id v55 = a18;
  id v50 = a19;
  id v54 = a20;
  id v49 = a21;
  id v32 = a22;
  id v33 = a23;
  id v34 = a24;
  id v35 = a25;
  id v48 = a26;
  id v47 = a27;
  v36 = @"modifiedDate";
  id v66 = v31;
  if (v34)
  {
    v37 = @"periodStartDate";

    v38 = [v34 dateForUTC];

    v36 = v37;
    if (!v35) {
      goto LABEL_7;
    }
  }
  else
  {
    v38 = v66;
    if (!v35) {
      goto LABEL_7;
    }
  }
  v39 = [v35 dateForUTC];
  [v39 timeIntervalSinceNow];
  double v41 = v40;

  if (v41 < 0.0)
  {
    v42 = @"periodEndDate";

    v43 = v35;
    uint64_t v44 = [v35 dateForUTC];

    v38 = (void *)v44;
    v36 = v42;
    goto LABEL_8;
  }
LABEL_7:
  v43 = v35;
LABEL_8:
  v45 = +[HKSemanticDate semanticDateWithKeyPath:v36 date:v38];
  +[HKCoverageRecord coverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:](HKCoverageRecord, "coverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:", v65, v64, v52, v66, v63, v62, a9, v59, v58, v45, v57, a13, v61, v60, v56,
    v51,
    v55,
    v50,
    v54,
    v49,
    v32,
    v33,
    v34,
    v43,
    v48,
  v53 = v47);

  return v53;
}

+ (id)coverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 coverageTypeCodingCollection:(id)a16 subscriber:(id)a17 subscriberId:(id)a18 beneficiary:(id)a19 policyHolder:(id)a20 payor:(id)a21 relationshipCodingCollection:(id)a22 classification:(id)a23 network:(id)a24 periodStartDate:(id)a25 periodEndDate:(id)a26 subscriberIdentifier:(id)a27 beneficiaryIdentifier:(id)a28
{
  v28 = objc_msgSend(a1, "_newCoverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                  a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  a23,
                  a24,
                  a25,
                  a26,
                  a27,
                  a28,
                  0);

  return v28;
}

+ (id)_newCoverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 coverageTypeCodingCollection:(id)a16 subscriber:(id)a17 subscriberId:(id)a18 beneficiary:(id)a19 policyHolder:(id)a20 payor:(id)a21 relationshipCodingCollection:(id)a22 classification:(id)a23 network:(id)a24 periodStartDate:(id)a25 periodEndDate:(id)a26 subscriberIdentifier:(id)a27 beneficiaryIdentifier:(id)a28 config:(id)a29
{
  BOOL v68 = a5;
  id v76 = a15;
  id v74 = a16;
  id v72 = a17;
  id v70 = a18;
  id v29 = a19;
  id v30 = a20;
  id v31 = a21;
  id v32 = a22;
  id v33 = a23;
  id v34 = a24;
  id v35 = a25;
  id v36 = a26;
  id v37 = a27;
  id v38 = a28;
  id v39 = a29;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __390__HKCoverageRecord__newCoverageRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_coverageTypeCodingCollection_subscriber_subscriberId_beneficiary_policyHolder_payor_relationshipCodingCollection_classification_network_periodStartDate_periodEndDate_subscriberIdentifier_beneficiaryIdentifier_config___block_invoke;
  aBlock[3] = &unk_1E58C58F0;
  id v80 = v76;
  id v81 = v74;
  id v82 = v72;
  id v83 = v70;
  id v84 = v29;
  id v85 = v30;
  id v86 = v31;
  id v87 = v32;
  id v88 = v33;
  id v89 = v34;
  id v90 = v35;
  id v91 = v36;
  id v92 = v37;
  id v93 = v38;
  id v94 = v39;
  id v67 = v39;
  id v66 = v38;
  id v65 = v37;
  id v64 = v36;
  id v63 = v35;
  id v62 = v34;
  id v61 = v33;
  id v60 = v32;
  id v59 = v31;
  id v58 = v30;
  id v57 = v29;
  id v71 = v70;
  id v73 = v72;
  id v75 = v74;
  id v77 = v76;
  id v40 = a13;
  id v41 = a12;
  id v42 = a11;
  id v43 = a10;
  id v44 = a8;
  id v45 = a7;
  id v46 = a6;
  id v47 = a4;
  id v48 = a3;
  id v49 = _Block_copy(aBlock);
  v78.receiver = a1;
  v78.super_class = (Class)&OBJC_METACLASS___HKCoverageRecord;
  id v69 = objc_msgSendSuper2(&v78, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v48, v47, v68, v46, v45, v44, a9, v43, v42, v41, v40, a14, v49);

  return v69;
}

void __390__HKCoverageRecord__newCoverageRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_coverageTypeCodingCollection_subscriber_subscriberId_beneficiary_policyHolder_payor_relationshipCodingCollection_classification_network_periodStartDate_periodEndDate_subscriberIdentifier_beneficiaryIdentifier_config___block_invoke(uint64_t a1, void *a2)
{
  id v32 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  objc_super v4 = (void *)v32[22];
  v32[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  id v6 = (void *)v32[23];
  v32[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  id v8 = (void *)v32[24];
  v32[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v32[25];
  v32[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v32[26];
  v32[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  uint64_t v14 = (void *)v32[27];
  v32[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  BOOL v16 = (void *)v32[28];
  v32[28] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v32[29];
  v32[29] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  v20 = (void *)v32[30];
  v32[30] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  objc_super v22 = (void *)v32[31];
  v32[31] = v21;

  uint64_t v23 = [*(id *)(a1 + 112) copy];
  v24 = (void *)v32[32];
  v32[32] = v23;

  uint64_t v25 = [*(id *)(a1 + 120) copy];
  v26 = (void *)v32[33];
  v32[33] = v25;

  uint64_t v27 = [*(id *)(a1 + 128) copy];
  v28 = (void *)v32[34];
  v32[34] = v27;

  uint64_t v29 = [*(id *)(a1 + 136) copy];
  id v30 = (void *)v32[35];
  v32[35] = v29;

  uint64_t v31 = *(void *)(a1 + 144);
  if (v31) {
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v32);
  }
}

- (HKCoverageRecord)init
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
  v9.super_class = (Class)HKCoverageRecord;
  id v6 = [(HKSample *)&v9 description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p super=%@statusCoding = %@coverageTypeCodingCollection = %@subscriber = %@subscriberId = %@beneficiary = %@policyHolder = %@payor = %@relationshipCodingCollection = %@classification = %@network = %@periodStartDate = %@periodEndDate = %@subscriberIdentifier = %@beneficiaryIdentifier = %@>", v5, self, v6, self->_statusCoding, self->_coverageTypeCodingCollection, self->_subscriber, self->_subscriberId, self->_beneficiary, self->_policyHolder, self->_payor, self->_relationshipCodingCollection, self->_classification, self->_network, self->_periodStartDate, self->_periodEndDate, self->_subscriberIdentifier,
  uint64_t v7 = self->_beneficiaryIdentifier);

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKCoverageRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, @"StatusCoding", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_coverageTypeCodingCollection forKey:@"CoverageTypeCodingCollection"];
  [v4 encodeObject:self->_subscriber forKey:@"Subscriber"];
  [v4 encodeObject:self->_subscriberId forKey:@"SubscriberId"];
  [v4 encodeObject:self->_beneficiary forKey:@"Beneficiary"];
  [v4 encodeObject:self->_policyHolder forKey:@"PolicyHolder"];
  [v4 encodeObject:self->_payor forKey:@"Payor"];
  [v4 encodeObject:self->_relationshipCodingCollection forKey:@"RelationshipCodingCollection"];
  [v4 encodeObject:self->_classification forKey:@"Classification"];
  [v4 encodeObject:self->_network forKey:@"Network"];
  [v4 encodeObject:self->_periodStartDate forKey:@"PeriodStartDate"];
  [v4 encodeObject:self->_periodEndDate forKey:@"PeriodEndDate"];
  [v4 encodeObject:self->_subscriberIdentifier forKey:@"SubscriberIdentifier"];
  [v4 encodeObject:self->_beneficiaryIdentifier forKey:@"BeneficiaryIdentifier"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_coverageType forKey:@"CoverageType"];
  [v4 encodeObject:self->_relationship forKey:@"Relationship"];
}

- (HKCoverageRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HKCoverageRecord;
  objc_super v5 = [(HKMedicalRecord *)&v43 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CoverageTypeCodingCollection"];
    coverageTypeCodingCollection = v5->_coverageTypeCodingCollection;
    v5->_coverageTypeCodingCollection = (HKMedicalCodingCollection *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Subscriber"];
    subscriber = v5->_subscriber;
    v5->_subscriber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubscriberId"];
    subscriberId = v5->_subscriberId;
    v5->_subscriberId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Beneficiary"];
    beneficiary = v5->_beneficiary;
    v5->_beneficiary = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PolicyHolder"];
    policyHolder = v5->_policyHolder;
    v5->_policyHolder = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"Payor"];
    payor = v5->_payor;
    v5->_payor = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelationshipCodingCollection"];
    relationshipCodingCollection = v5->_relationshipCodingCollection;
    v5->_relationshipCodingCollection = (HKMedicalCodingCollection *)v21;

    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"Classification"];
    classification = v5->_classification;
    v5->_classification = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Network"];
    network = v5->_network;
    v5->_network = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PeriodStartDate"];
    periodStartDate = v5->_periodStartDate;
    v5->_periodStartDate = (HKMedicalDate *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PeriodEndDate"];
    periodEndDate = v5->_periodEndDate;
    v5->_periodEndDate = (HKMedicalDate *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SubscriberIdentifier"];
    subscriberIdentifier = v5->_subscriberIdentifier;
    v5->_subscriberIdentifier = (HKFHIRIdentifierElement *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BeneficiaryIdentifier"];
    beneficiaryIdentifier = v5->_beneficiaryIdentifier;
    v5->_beneficiaryIdentifier = (HKFHIRIdentifierElement *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CoverageType"];
    coverageType = v5->_coverageType;
    v5->_coverageType = (HKConcept *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Relationship"];
    relationship = v5->_relationship;
    v5->_relationship = (HKConcept *)v40;
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
    v112.receiver = self;
    v112.super_class = (Class)HKCoverageRecord;
    if (![(HKMedicalRecord *)&v112 isEquivalent:v5]) {
      goto LABEL_89;
    }
    uint64_t v6 = [(HKCoverageRecord *)self statusCoding];
    uint64_t v7 = [v5 statusCoding];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 statusCoding];
      if (!v9) {
        goto LABEL_88;
      }
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [(HKCoverageRecord *)self statusCoding];
      uint64_t v12 = [v5 statusCoding];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self coverageTypeCodingCollection];
    uint64_t v15 = [v5 coverageTypeCodingCollection];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [v5 coverageTypeCodingCollection];
      if (!v16) {
        goto LABEL_88;
      }
      uint64_t v17 = (void *)v16;
      v18 = [(HKCoverageRecord *)self coverageTypeCodingCollection];
      uint64_t v19 = [v5 coverageTypeCodingCollection];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self subscriber];
    uint64_t v21 = [v5 subscriber];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      uint64_t v8 = (void *)v21;
      uint64_t v22 = [v5 subscriber];
      if (!v22) {
        goto LABEL_88;
      }
      uint64_t v23 = (void *)v22;
      uint64_t v24 = [(HKCoverageRecord *)self subscriber];
      uint64_t v25 = [v5 subscriber];
      int v26 = [v24 isEqualToString:v25];

      if (!v26) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self subscriberId];
    uint64_t v27 = [v5 subscriberId];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      uint64_t v8 = (void *)v27;
      uint64_t v28 = [v5 subscriberId];
      if (!v28) {
        goto LABEL_88;
      }
      uint64_t v29 = (void *)v28;
      uint64_t v30 = [(HKCoverageRecord *)self subscriberId];
      uint64_t v31 = [v5 subscriberId];
      int v32 = [v30 isEqualToString:v31];

      if (!v32) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self beneficiary];
    uint64_t v33 = [v5 beneficiary];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      uint64_t v8 = (void *)v33;
      uint64_t v34 = [v5 beneficiary];
      if (!v34) {
        goto LABEL_88;
      }
      id v35 = (void *)v34;
      uint64_t v36 = [(HKCoverageRecord *)self beneficiary];
      id v37 = [v5 beneficiary];
      int v38 = [v36 isEqualToString:v37];

      if (!v38) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self policyHolder];
    uint64_t v39 = [v5 policyHolder];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      uint64_t v8 = (void *)v39;
      uint64_t v40 = [v5 policyHolder];
      if (!v40) {
        goto LABEL_88;
      }
      id v41 = (void *)v40;
      id v42 = [(HKCoverageRecord *)self policyHolder];
      objc_super v43 = [v5 policyHolder];
      int v44 = [v42 isEqualToString:v43];

      if (!v44) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self payor];
    uint64_t v45 = [v5 payor];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      uint64_t v8 = (void *)v45;
      uint64_t v46 = [v5 payor];
      if (!v46) {
        goto LABEL_88;
      }
      id v47 = (void *)v46;
      id v48 = [(HKCoverageRecord *)self payor];
      id v49 = [v5 payor];
      int v50 = [v48 isEqualToArray:v49];

      if (!v50) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self relationshipCodingCollection];
    uint64_t v51 = [v5 relationshipCodingCollection];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      uint64_t v8 = (void *)v51;
      uint64_t v52 = [v5 relationshipCodingCollection];
      if (!v52) {
        goto LABEL_88;
      }
      v53 = (void *)v52;
      id v54 = [(HKCoverageRecord *)self relationshipCodingCollection];
      id v55 = [v5 relationshipCodingCollection];
      int v56 = [v54 isEqual:v55];

      if (!v56) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self classification];
    uint64_t v57 = [v5 classification];
    if (v6 == (void *)v57)
    {
    }
    else
    {
      uint64_t v8 = (void *)v57;
      uint64_t v58 = [v5 classification];
      if (!v58) {
        goto LABEL_88;
      }
      id v59 = (void *)v58;
      id v60 = [(HKCoverageRecord *)self classification];
      id v61 = [v5 classification];
      int v62 = [v60 isEqualToArray:v61];

      if (!v62) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self network];
    uint64_t v63 = [v5 network];
    if (v6 == (void *)v63)
    {
    }
    else
    {
      uint64_t v8 = (void *)v63;
      uint64_t v64 = [v5 network];
      if (!v64) {
        goto LABEL_88;
      }
      id v65 = (void *)v64;
      id v66 = [(HKCoverageRecord *)self network];
      id v67 = [v5 network];
      int v68 = [v66 isEqualToString:v67];

      if (!v68) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self periodStartDate];
    uint64_t v69 = [v5 periodStartDate];
    if (v6 == (void *)v69)
    {
    }
    else
    {
      uint64_t v8 = (void *)v69;
      uint64_t v70 = [v5 periodStartDate];
      if (!v70) {
        goto LABEL_88;
      }
      id v71 = (void *)v70;
      id v72 = [(HKCoverageRecord *)self periodStartDate];
      id v73 = [v5 periodStartDate];
      int v74 = [v72 isEqual:v73];

      if (!v74) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self periodEndDate];
    uint64_t v75 = [v5 periodEndDate];
    if (v6 == (void *)v75)
    {
    }
    else
    {
      uint64_t v8 = (void *)v75;
      uint64_t v76 = [v5 periodEndDate];
      if (!v76) {
        goto LABEL_88;
      }
      id v77 = (void *)v76;
      objc_super v78 = [(HKCoverageRecord *)self periodEndDate];
      v79 = [v5 periodEndDate];
      int v80 = [v78 isEqual:v79];

      if (!v80) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self subscriberIdentifier];
    uint64_t v81 = [v5 subscriberIdentifier];
    if (v6 == (void *)v81)
    {
    }
    else
    {
      uint64_t v8 = (void *)v81;
      uint64_t v82 = [v5 subscriberIdentifier];
      if (!v82) {
        goto LABEL_88;
      }
      id v83 = (void *)v82;
      id v84 = [(HKCoverageRecord *)self subscriberIdentifier];
      id v85 = [v5 subscriberIdentifier];
      int v86 = [v84 isEqual:v85];

      if (!v86) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self beneficiaryIdentifier];
    uint64_t v87 = [v5 beneficiaryIdentifier];
    if (v6 == (void *)v87)
    {
    }
    else
    {
      uint64_t v8 = (void *)v87;
      uint64_t v88 = [v5 beneficiaryIdentifier];
      if (!v88) {
        goto LABEL_88;
      }
      id v89 = (void *)v88;
      id v90 = [(HKCoverageRecord *)self beneficiaryIdentifier];
      id v91 = [v5 beneficiaryIdentifier];
      int v92 = [v90 isEqual:v91];

      if (!v92) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self status];
    uint64_t v93 = [v5 status];
    if (v6 == (void *)v93)
    {
    }
    else
    {
      uint64_t v8 = (void *)v93;
      uint64_t v94 = [v5 status];
      if (!v94) {
        goto LABEL_88;
      }
      v95 = (void *)v94;
      v96 = [(HKCoverageRecord *)self status];
      v97 = [v5 status];
      int v98 = [v96 isEqual:v97];

      if (!v98) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self coverageType];
    uint64_t v99 = [v5 coverageType];
    if (v6 == (void *)v99)
    {
    }
    else
    {
      uint64_t v8 = (void *)v99;
      uint64_t v100 = [v5 coverageType];
      if (!v100) {
        goto LABEL_88;
      }
      v101 = (void *)v100;
      v102 = [(HKCoverageRecord *)self coverageType];
      v103 = [v5 coverageType];
      int v104 = [v102 isEqual:v103];

      if (!v104) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKCoverageRecord *)self relationship];
    uint64_t v105 = [v5 relationship];
    if (v6 == (void *)v105)
    {

LABEL_93:
      BOOL v14 = 1;
      goto LABEL_90;
    }
    uint64_t v8 = (void *)v105;
    uint64_t v106 = [v5 relationship];
    if (v106)
    {
      v107 = (void *)v106;
      v108 = [(HKCoverageRecord *)self relationship];
      v109 = [v5 relationship];
      char v110 = [v108 isEqual:v109];

      if (v110) {
        goto LABEL_93;
      }
LABEL_89:
      BOOL v14 = 0;
LABEL_90:

      goto LABEL_91;
    }
LABEL_88:

    goto LABEL_89;
  }
  BOOL v14 = 0;
LABEL_91:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKCoverageRecord *)self statusCoding];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCoding:v2];

  return v3;
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

  id v8 = [(HKCoverageRecord *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (HKMedicalCodingCollection)coverageTypeCodingCollection
{
  return self->_coverageTypeCodingCollection;
}

- (void)_setCoverageTypeCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  coverageTypeCodingCollection = self->_coverageTypeCodingCollection;
  self->_coverageTypeCodingCollection = v4;

  id v8 = [(HKCoverageRecord *)self coverageTypeCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  coverageType = self->_coverageType;
  self->_coverageType = v6;
}

- (NSString)subscriber
{
  return self->_subscriber;
}

- (void)_setSubscriber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  subscriber = self->_subscriber;
  self->_subscriber = v4;

  MEMORY[0x1F41817F8](v4, subscriber);
}

- (NSString)subscriberId
{
  return self->_subscriberId;
}

- (void)_setSubscriberId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  subscriberId = self->_subscriberId;
  self->_subscriberId = v4;

  MEMORY[0x1F41817F8](v4, subscriberId);
}

- (NSString)beneficiary
{
  return self->_beneficiary;
}

- (void)_setBeneficiary:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  beneficiary = self->_beneficiary;
  self->_beneficiary = v4;

  MEMORY[0x1F41817F8](v4, beneficiary);
}

- (NSString)policyHolder
{
  return self->_policyHolder;
}

- (void)_setPolicyHolder:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  policyHolder = self->_policyHolder;
  self->_policyHolder = v4;

  MEMORY[0x1F41817F8](v4, policyHolder);
}

- (NSArray)payor
{
  return self->_payor;
}

- (void)_setPayor:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  payor = self->_payor;
  self->_payor = v4;

  MEMORY[0x1F41817F8](v4, payor);
}

- (HKMedicalCodingCollection)relationshipCodingCollection
{
  return self->_relationshipCodingCollection;
}

- (void)_setRelationshipCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  relationshipCodingCollection = self->_relationshipCodingCollection;
  self->_relationshipCodingCollection = v4;

  if (self->_relationshipCodingCollection)
  {
    uint64_t v9 = [(HKCoverageRecord *)self relationshipCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    relationship = self->_relationship;
    self->_relationship = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_relationship;
    self->_relationship = 0;
  }
}

- (NSArray)classification
{
  return self->_classification;
}

- (void)_setClassification:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  classification = self->_classification;
  self->_classification = v4;

  MEMORY[0x1F41817F8](v4, classification);
}

- (NSString)network
{
  return self->_network;
}

- (void)_setNetwork:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  network = self->_network;
  self->_network = v4;

  MEMORY[0x1F41817F8](v4, network);
}

- (HKMedicalDate)periodStartDate
{
  return self->_periodStartDate;
}

- (void)_setPeriodStartDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  periodStartDate = self->_periodStartDate;
  self->_periodStartDate = v4;

  MEMORY[0x1F41817F8](v4, periodStartDate);
}

- (HKMedicalDate)periodEndDate
{
  return self->_periodEndDate;
}

- (void)_setPeriodEndDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  periodEndDate = self->_periodEndDate;
  self->_periodEndDate = v4;

  MEMORY[0x1F41817F8](v4, periodEndDate);
}

- (HKFHIRIdentifierElement)subscriberIdentifier
{
  return self->_subscriberIdentifier;
}

- (void)_setSubscriberIdentifier:(id)a3
{
  id v4 = (HKFHIRIdentifierElement *)[a3 copy];
  subscriberIdentifier = self->_subscriberIdentifier;
  self->_subscriberIdentifier = v4;

  MEMORY[0x1F41817F8](v4, subscriberIdentifier);
}

- (HKFHIRIdentifierElement)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)_setBeneficiaryIdentifier:(id)a3
{
  id v4 = (HKFHIRIdentifierElement *)[a3 copy];
  beneficiaryIdentifier = self->_beneficiaryIdentifier;
  self->_beneficiaryIdentifier = v4;

  MEMORY[0x1F41817F8](v4, beneficiaryIdentifier);
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
    id v4 = [(HKCoverageRecord *)self statusCodingCollection];
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
      -[HKCoverageRecord _setStatus:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v6;
}

- (HKConcept)coverageType
{
  coverageType = self->_coverageType;
  if (coverageType)
  {
    uint64_t v3 = coverageType;
  }
  else
  {
    id v4 = [(HKCoverageRecord *)self coverageTypeCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setCoverageType:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKCoverageRecord _setCoverageType:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  coverageType = self->_coverageType;
  self->_coverageType = v6;
}

- (HKConcept)relationship
{
  if (self->_relationshipCodingCollection)
  {
    relationship = self->_relationship;
    if (relationship)
    {
      uint64_t v3 = relationship;
    }
    else
    {
      id v4 = [(HKCoverageRecord *)self relationshipCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setRelationship:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  relationship = self->_relationship;
  self->_relationship = v4;

  MEMORY[0x1F41817F8](v4, relationship);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKCoverageRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_statusCoding)
    {
      if (self->_coverageTypeCodingCollection)
      {
        if (self->_subscriberId)
        {
          id v8 = 0;
          goto LABEL_12;
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: subscriberId must not be nil";
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"%@: coverageTypeCodingCollection must not be nil";
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: statusCoding must not be nil";
    }
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v10, a2, v11, self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;
LABEL_12:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_coverageType, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriberIdentifier, 0);
  objc_storeStrong((id *)&self->_periodEndDate, 0);
  objc_storeStrong((id *)&self->_periodStartDate, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_relationshipCodingCollection, 0);
  objc_storeStrong((id *)&self->_payor, 0);
  objc_storeStrong((id *)&self->_policyHolder, 0);
  objc_storeStrong((id *)&self->_beneficiary, 0);
  objc_storeStrong((id *)&self->_subscriberId, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_coverageTypeCodingCollection, 0);

  objc_storeStrong((id *)&self->_statusCoding, 0);
}

- (void)_setStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property status for record type HKCoverageRecord.", v1, 2u);
}

- (void)_setCoverageType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property coverageType for record type HKCoverageRecord.", v1, 2u);
}

@end