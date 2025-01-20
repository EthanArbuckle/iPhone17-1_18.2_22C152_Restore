@interface HKAllergyRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newAllergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 allergyCodingCollection:(id)a15 onsetDate:(id)a16 asserter:(id)a17 reactions:(id)a18 criticalityCoding:(id)a19 lastOccurrenceDate:(id)a20 recordedDate:(id)a21 verificationStatusCoding:(id)a22 clinicalStatusCoding:(id)a23 allergyTypeCoding:(id)a24 categoryCoding:(id)a25 config:(id)a26;
+ (id)allergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 allergyCodingCollection:(id)a14 onsetDate:(id)a15 asserter:(id)a16 reactions:(id)a17 criticalityCoding:(id)a18 lastOccurrenceDate:(id)a19 recordedDate:(id)a20 verificationStatusCoding:(id)a21 clinicalStatusCoding:(id)a22 allergyTypeCoding:(id)a23 categoryCoding:(id)a24;
+ (id)allergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 allergyCodingCollection:(id)a15 onsetDate:(id)a16 asserter:(id)a17 reactions:(id)a18 criticalityCoding:(id)a19 lastOccurrenceDate:(id)a20 recordedDate:(id)a21 verificationStatusCoding:(id)a22 clinicalStatusCoding:(id)a23 allergyTypeCoding:(id)a24 categoryCoding:(id)a25;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKAllergyRecord)init;
- (HKAllergyRecord)initWithCoder:(id)a3;
- (HKConcept)allergy;
- (HKConcept)allergyType;
- (HKConcept)category;
- (HKConcept)clinicalStatus;
- (HKConcept)criticality;
- (HKConcept)verificationStatus;
- (HKMedicalCoding)allergyTypeCoding;
- (HKMedicalCoding)categoryCoding;
- (HKMedicalCoding)clinicalStatusCoding;
- (HKMedicalCoding)criticalityCoding;
- (HKMedicalCoding)verificationStatusCoding;
- (HKMedicalCodingCollection)allergyCodingCollection;
- (HKMedicalDate)lastOccurrenceDate;
- (HKMedicalDate)onsetDate;
- (HKMedicalDate)recordedDate;
- (NSArray)reactions;
- (NSString)asserter;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)allergyTypeCodingCollection;
- (id)categoryCodingCollection;
- (id)clinicalStatusCodingCollection;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)criticalityCodingCollection;
- (id)medicalRecordCodings;
- (id)verificationStatusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setAllergy:(id)a3;
- (void)_setAllergyCodingCollection:(id)a3;
- (void)_setAllergyType:(id)a3;
- (void)_setAllergyTypeCoding:(id)a3;
- (void)_setAsserter:(id)a3;
- (void)_setCategory:(id)a3;
- (void)_setCategoryCoding:(id)a3;
- (void)_setClinicalStatus:(id)a3;
- (void)_setClinicalStatusCoding:(id)a3;
- (void)_setCriticality:(id)a3;
- (void)_setCriticalityCoding:(id)a3;
- (void)_setLastOccurrenceDate:(id)a3;
- (void)_setOnsetDate:(id)a3;
- (void)_setReactions:(id)a3;
- (void)_setRecordedDate:(id)a3;
- (void)_setVerificationStatus:(id)a3;
- (void)_setVerificationStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAllergyRecord

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

- (id)medicalRecordCodings
{
  v2 = [(HKAllergyRecord *)self allergyCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_ALLERGY" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

+ (id)allergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 allergyCodingCollection:(id)a14 onsetDate:(id)a15 asserter:(id)a16 reactions:(id)a17 criticalityCoding:(id)a18 lastOccurrenceDate:(id)a19 recordedDate:(id)a20 verificationStatusCoding:(id)a21 clinicalStatusCoding:(id)a22 allergyTypeCoding:(id)a23 categoryCoding:(id)a24
{
  BOOL v49 = a5;
  id v59 = a3;
  id v58 = a4;
  id v28 = a6;
  id v57 = a7;
  id v51 = a8;
  id v55 = a10;
  id v56 = a11;
  id v54 = a12;
  id v53 = a14;
  id v60 = a15;
  id v52 = a16;
  id v48 = a17;
  id v29 = a18;
  id v30 = a19;
  id v31 = a20;
  id v47 = a21;
  id v46 = a22;
  id v32 = a23;
  id v45 = a24;
  v33 = @"modifiedDate";
  id v34 = v28;
  v35 = v34;
  if (v30)
  {
    v36 = @"lastOccurrenceDate";

    v37 = v30;
    v38 = [v30 dateForUTC];

    v33 = v36;
  }
  else
  {
    v37 = 0;
    v38 = v34;
  }
  if (v60)
  {
    v39 = @"onsetDate";

    uint64_t v40 = [v60 dateForUTC];

    v38 = (void *)v40;
    v33 = v39;
  }
  if (v31)
  {
    v41 = @"recordedDate";

    uint64_t v42 = [v31 dateForUTC];

    v38 = (void *)v42;
    v33 = v41;
  }
  v43 = +[HKSemanticDate semanticDateWithKeyPath:v33 date:v38];
  +[HKAllergyRecord allergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:](HKAllergyRecord, "allergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:", v59, v58, v49, v35, v57, v51, a9, v55, v56, v43, v54, a13, v53, v60, v52,
    v48,
    v29,
    v37,
    v31,
    v47,
    v46,
    v32,
  v50 = v45);

  return v50;
}

+ (id)indexableConceptKeyPaths
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKAllergyRecord;
  v2 = objc_msgSendSuper2(&v6, sel_indexableConceptKeyPaths);
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"allergy"];
  v4 = +[HKAllergyReaction indexableKeyPathsWithPrefix:@"reactions"];
  [v3 addObjectsFromArray:v4];

  [v3 addObject:@"criticality"];
  [v3 addObject:@"verificationStatus"];
  [v3 addObject:@"clinicalStatus"];
  [v3 addObject:@"allergyType"];
  [v3 addObject:@"category"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKAllergyRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_28;
  }
  if ([v7 isEqualToString:@"allergy"])
  {
    v9 = [(HKAllergyRecord *)self allergyCodingCollection];
    v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v31[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

LABEL_4:
    goto LABEL_28;
  }
  if ([v8 isEqualToString:@"reactions"])
  {
    v12 = [(HKAllergyRecord *)self reactions];

    if (v12)
    {
      v9 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v6 error:a4];
      if (v9)
      {
        v13 = [(HKAllergyRecord *)self reactions];
        v11 = [v13 codingsForKeyPath:v9 error:a4];
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_4;
    }
    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"criticality"])
  {
    v14 = [(HKAllergyRecord *)self criticalityCoding];

    if (v14)
    {
      v15 = [(HKAllergyRecord *)self criticalityCoding];
      v16 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v17 = +[HKIndexableObject indexableObjectWithObject:v16];
      id v30 = v17;
      v18 = (void *)MEMORY[0x1E4F1C978];
      v19 = &v30;
LABEL_26:
      v11 = [v18 arrayWithObjects:v19 count:1];

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"verificationStatus"])
  {
    v20 = [(HKAllergyRecord *)self verificationStatusCoding];

    if (v20)
    {
      v15 = [(HKAllergyRecord *)self verificationStatusCoding];
      v16 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v17 = +[HKIndexableObject indexableObjectWithObject:v16];
      id v29 = v17;
      v18 = (void *)MEMORY[0x1E4F1C978];
      v19 = &v29;
      goto LABEL_26;
    }
LABEL_27:
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_28;
  }
  if ([v8 isEqualToString:@"clinicalStatus"])
  {
    v21 = [(HKAllergyRecord *)self clinicalStatusCoding];

    if (v21)
    {
      v15 = [(HKAllergyRecord *)self clinicalStatusCoding];
      v16 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v17 = +[HKIndexableObject indexableObjectWithObject:v16];
      id v28 = v17;
      v18 = (void *)MEMORY[0x1E4F1C978];
      v19 = &v28;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"allergyType"])
  {
    v22 = [(HKAllergyRecord *)self allergyTypeCoding];

    if (v22)
    {
      v15 = [(HKAllergyRecord *)self allergyTypeCoding];
      v16 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v17 = +[HKIndexableObject indexableObjectWithObject:v16];
      v27 = v17;
      v18 = (void *)MEMORY[0x1E4F1C978];
      v19 = &v27;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"category"])
  {
    v23 = [(HKAllergyRecord *)self categoryCoding];

    if (v23)
    {
      v15 = [(HKAllergyRecord *)self categoryCoding];
      v16 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v17 = +[HKIndexableObject indexableObjectWithObject:v16];
      v26 = v17;
      v18 = (void *)MEMORY[0x1E4F1C978];
      v19 = &v26;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  v25.receiver = self;
  v25.super_class = (Class)HKAllergyRecord;
  v11 = [(HKMedicalRecord *)&v25 codingsForKeyPath:v6 error:a4];
LABEL_28:

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_28;
  }
  if ([v10 isEqualToString:@"allergy"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      v12 = [v8 firstObject];
      v13 = [v12 object];
      [(HKAllergyRecord *)self _setAllergy:v13];
LABEL_5:

      unsigned __int8 v14 = 1;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (![v11 isEqualToString:@"reactions"])
  {
    if ([v11 isEqualToString:@"criticality"])
    {
      uint64_t v18 = [v8 count];
      v19 = [(HKAllergyRecord *)self criticalityCoding];
      BOOL v20 = HKIndexableObjectCheckCardinalityForIndexRestore(v18, v19 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v20)
      {
        v12 = [v8 firstObject];
        v13 = [v12 object];
        [(HKAllergyRecord *)self _setCriticality:v13];
        goto LABEL_5;
      }
    }
    else if ([v11 isEqualToString:@"verificationStatus"])
    {
      uint64_t v21 = [v8 count];
      v22 = [(HKAllergyRecord *)self verificationStatusCoding];
      BOOL v23 = HKIndexableObjectCheckCardinalityForIndexRestore(v21, v22 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v23)
      {
        v12 = [v8 firstObject];
        v13 = [v12 object];
        [(HKAllergyRecord *)self _setVerificationStatus:v13];
        goto LABEL_5;
      }
    }
    else if ([v11 isEqualToString:@"clinicalStatus"])
    {
      uint64_t v24 = [v8 count];
      objc_super v25 = [(HKAllergyRecord *)self clinicalStatusCoding];
      BOOL v26 = HKIndexableObjectCheckCardinalityForIndexRestore(v24, v25 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v26)
      {
        v12 = [v8 firstObject];
        v13 = [v12 object];
        [(HKAllergyRecord *)self _setClinicalStatus:v13];
        goto LABEL_5;
      }
    }
    else if ([v11 isEqualToString:@"allergyType"])
    {
      uint64_t v27 = [v8 count];
      id v28 = [(HKAllergyRecord *)self allergyTypeCoding];
      BOOL v29 = HKIndexableObjectCheckCardinalityForIndexRestore(v27, v28 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v29)
      {
        v12 = [v8 firstObject];
        v13 = [v12 object];
        [(HKAllergyRecord *)self _setAllergyType:v13];
        goto LABEL_5;
      }
    }
    else
    {
      if (![v11 isEqualToString:@"category"])
      {
        v34.receiver = self;
        v34.super_class = (Class)HKAllergyRecord;
        unsigned __int8 v14 = [(HKMedicalRecord *)&v34 applyConcepts:v8 forKeyPath:v9 error:a5];
        goto LABEL_29;
      }
      uint64_t v30 = [v8 count];
      id v31 = [(HKAllergyRecord *)self categoryCoding];
      BOOL v32 = HKIndexableObjectCheckCardinalityForIndexRestore(v30, v31 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v32)
      {
        v12 = [v8 firstObject];
        v13 = [v12 object];
        [(HKAllergyRecord *)self _setCategory:v13];
        goto LABEL_5;
      }
    }
LABEL_28:
    unsigned __int8 v14 = 0;
    goto LABEL_29;
  }
  v15 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v9 error:a5];
  if (v15)
  {
    v16 = [(HKAllergyRecord *)self reactions];

    if (v16)
    {
      v17 = [(HKAllergyRecord *)self reactions];
      unsigned __int8 v14 = [v17 applyConcepts:v8 forKeyPath:v15 error:a5];
    }
    else
    {
      unsigned __int8 v14 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

LABEL_29:
  return v14;
}

- (int64_t)recordCategoryType
{
  return 7;
}

+ (id)allergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 allergyCodingCollection:(id)a15 onsetDate:(id)a16 asserter:(id)a17 reactions:(id)a18 criticalityCoding:(id)a19 lastOccurrenceDate:(id)a20 recordedDate:(id)a21 verificationStatusCoding:(id)a22 clinicalStatusCoding:(id)a23 allergyTypeCoding:(id)a24 categoryCoding:(id)a25
{
  objc_super v25 = objc_msgSend(a1, "_newAllergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
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

+ (id)_newAllergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 allergyCodingCollection:(id)a15 onsetDate:(id)a16 asserter:(id)a17 reactions:(id)a18 criticalityCoding:(id)a19 lastOccurrenceDate:(id)a20 recordedDate:(id)a21 verificationStatusCoding:(id)a22 clinicalStatusCoding:(id)a23 allergyTypeCoding:(id)a24 categoryCoding:(id)a25 config:(id)a26
{
  BOOL v65 = a5;
  id v67 = a15;
  id v51 = a16;
  id v53 = a17;
  id v55 = a18;
  id v26 = a19;
  id v27 = a20;
  id v28 = a21;
  id v29 = a22;
  id v30 = a23;
  id v31 = a24;
  id v32 = a25;
  id v33 = a26;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __348__HKAllergyRecord__newAllergyRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_allergyCodingCollection_onsetDate_asserter_reactions_criticalityCoding_lastOccurrenceDate_recordedDate_verificationStatusCoding_clinicalStatusCoding_allergyTypeCoding_categoryCoding_config___block_invoke;
  aBlock[3] = &unk_1E58C9408;
  id v71 = v67;
  id v72 = v51;
  id v73 = v53;
  id v74 = v55;
  id v75 = v26;
  id v76 = v27;
  id v77 = v28;
  id v78 = v29;
  id v79 = v30;
  id v80 = v31;
  id v81 = v32;
  id v82 = v33;
  id v64 = v33;
  id v63 = v32;
  id v62 = v31;
  id v61 = v30;
  id v60 = v29;
  id v59 = v28;
  id v58 = v27;
  id v57 = v26;
  id v56 = v55;
  id v54 = v53;
  id v52 = v51;
  id v68 = v67;
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
  v69.receiver = a1;
  v69.super_class = (Class)&OBJC_METACLASS___HKAllergyRecord;
  id v66 = objc_msgSendSuper2(&v69, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v42, v41, v65, v40, v39, v38, a9, v37, v36, v35, v34, a14, v43);

  return v66;
}

void __348__HKAllergyRecord__newAllergyRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_allergyCodingCollection_onsetDate_asserter_reactions_criticalityCoding_lastOccurrenceDate_recordedDate_verificationStatusCoding_clinicalStatusCoding_allergyTypeCoding_categoryCoding_config___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  objc_super v4 = (void *)v26[22];
  v26[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  id v6 = (void *)v26[23];
  v26[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  id v8 = (void *)v26[24];
  v26[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v26[25];
  v26[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v26[26];
  v26[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  unsigned __int8 v14 = (void *)v26[27];
  v26[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v26[28];
  v26[28] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  uint64_t v18 = (void *)v26[29];
  v26[29] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  BOOL v20 = (void *)v26[30];
  v26[30] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  v22 = (void *)v26[31];
  v26[31] = v21;

  uint64_t v23 = [*(id *)(a1 + 112) copy];
  uint64_t v24 = (void *)v26[32];
  v26[32] = v23;

  uint64_t v25 = *(void *)(a1 + 120);
  if (v25) {
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
}

- (HKAllergyRecord)init
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
  v9.super_class = (Class)HKAllergyRecord;
  id v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@allergyCodingCollection = %@onsetDate = %@asserter = %@reactions = %@criticalityCoding = %@lastOccurrenceDate = %@recordedDate = %@verificationStatusCoding = %@clinicalStatusCoding = %@allergyTypeCoding = %@categoryCoding = %@>", v5, self, v6, self->_allergyCodingCollection, self->_onsetDate, self->_asserter, self->_reactions, self->_criticalityCoding, self->_lastOccurrenceDate, self->_recordedDate, self->_verificationStatusCoding, self->_clinicalStatusCoding, self->_allergyTypeCoding, self->_categoryCoding];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKAllergyRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_allergyCodingCollection, @"AllergyCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_onsetDate forKey:@"OnsetDate"];
  [v4 encodeObject:self->_asserter forKey:@"Asserter"];
  [v4 encodeObject:self->_reactions forKey:@"Reactions"];
  [v4 encodeObject:self->_criticalityCoding forKey:@"CriticalityCoding"];
  [v4 encodeObject:self->_lastOccurrenceDate forKey:@"LastOccurrenceDate"];
  [v4 encodeObject:self->_recordedDate forKey:@"RecordedDate"];
  [v4 encodeObject:self->_verificationStatusCoding forKey:@"VerificationStatusCoding"];
  [v4 encodeObject:self->_clinicalStatusCoding forKey:@"ClinicalStatusCoding"];
  [v4 encodeObject:self->_allergyTypeCoding forKey:@"AllergyTypeCoding"];
  [v4 encodeObject:self->_categoryCoding forKey:@"CategoryCoding"];
  [v4 encodeObject:self->_allergy forKey:@"Allergy"];
  [v4 encodeObject:self->_criticality forKey:@"Criticality"];
  [v4 encodeObject:self->_verificationStatus forKey:@"VerificationStatus"];
  [v4 encodeObject:self->_clinicalStatus forKey:@"ClinicalStatus"];
  [v4 encodeObject:self->_allergyType forKey:@"AllergyType"];
  [v4 encodeObject:self->_category forKey:@"Category"];
}

- (HKAllergyRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HKAllergyRecord;
  objc_super v5 = [(HKMedicalRecord *)&v42 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllergyCodingCollection"];
    allergyCodingCollection = v5->_allergyCodingCollection;
    v5->_allergyCodingCollection = (HKMedicalCodingCollection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OnsetDate"];
    onsetDate = v5->_onsetDate;
    v5->_onsetDate = (HKMedicalDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Asserter"];
    asserter = v5->_asserter;
    v5->_asserter = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"Reactions"];
    reactions = v5->_reactions;
    v5->_reactions = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CriticalityCoding"];
    criticalityCoding = v5->_criticalityCoding;
    v5->_criticalityCoding = (HKMedicalCoding *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastOccurrenceDate"];
    lastOccurrenceDate = v5->_lastOccurrenceDate;
    v5->_lastOccurrenceDate = (HKMedicalDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordedDate"];
    recordedDate = v5->_recordedDate;
    v5->_recordedDate = (HKMedicalDate *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VerificationStatusCoding"];
    verificationStatusCoding = v5->_verificationStatusCoding;
    v5->_verificationStatusCoding = (HKMedicalCoding *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClinicalStatusCoding"];
    clinicalStatusCoding = v5->_clinicalStatusCoding;
    v5->_clinicalStatusCoding = (HKMedicalCoding *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllergyTypeCoding"];
    allergyTypeCoding = v5->_allergyTypeCoding;
    v5->_allergyTypeCoding = (HKMedicalCoding *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CategoryCoding"];
    categoryCoding = v5->_categoryCoding;
    v5->_categoryCoding = (HKMedicalCoding *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Allergy"];
    allergy = v5->_allergy;
    v5->_allergy = (HKConcept *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Criticality"];
    criticality = v5->_criticality;
    v5->_criticality = (HKConcept *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VerificationStatus"];
    verificationStatus = v5->_verificationStatus;
    v5->_verificationStatus = (HKConcept *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClinicalStatus"];
    clinicalStatus = v5->_clinicalStatus;
    v5->_clinicalStatus = (HKConcept *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllergyType"];
    allergyType = v5->_allergyType;
    v5->_allergyType = (HKConcept *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Category"];
    category = v5->_category;
    v5->_category = (HKConcept *)v39;
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
    v112.super_class = (Class)HKAllergyRecord;
    if (![(HKMedicalRecord *)&v112 isEquivalent:v5]) {
      goto LABEL_89;
    }
    uint64_t v6 = [(HKAllergyRecord *)self allergyCodingCollection];
    uint64_t v7 = [v5 allergyCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v5 allergyCodingCollection];
      if (!v9) {
        goto LABEL_88;
      }
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [(HKAllergyRecord *)self allergyCodingCollection];
      v12 = [v5 allergyCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self onsetDate];
    uint64_t v15 = [v5 onsetDate];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [v5 onsetDate];
      if (!v16) {
        goto LABEL_88;
      }
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(HKAllergyRecord *)self onsetDate];
      uint64_t v19 = [v5 onsetDate];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self asserter];
    uint64_t v21 = [v5 asserter];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      uint64_t v8 = (void *)v21;
      uint64_t v22 = [v5 asserter];
      if (!v22) {
        goto LABEL_88;
      }
      uint64_t v23 = (void *)v22;
      uint64_t v24 = [(HKAllergyRecord *)self asserter];
      uint64_t v25 = [v5 asserter];
      int v26 = [v24 isEqualToString:v25];

      if (!v26) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self reactions];
    uint64_t v27 = [v5 reactions];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      uint64_t v8 = (void *)v27;
      uint64_t v28 = [v5 reactions];
      if (!v28) {
        goto LABEL_88;
      }
      uint64_t v29 = (void *)v28;
      id v30 = [(HKAllergyRecord *)self reactions];
      uint64_t v31 = [v5 reactions];
      int v32 = [v30 isEqualToArray:v31];

      if (!v32) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self criticalityCoding];
    uint64_t v33 = [v5 criticalityCoding];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      uint64_t v8 = (void *)v33;
      uint64_t v34 = [v5 criticalityCoding];
      if (!v34) {
        goto LABEL_88;
      }
      uint64_t v35 = (void *)v34;
      id v36 = [(HKAllergyRecord *)self criticalityCoding];
      uint64_t v37 = [v5 criticalityCoding];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self lastOccurrenceDate];
    uint64_t v39 = [v5 lastOccurrenceDate];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      uint64_t v8 = (void *)v39;
      uint64_t v40 = [v5 lastOccurrenceDate];
      if (!v40) {
        goto LABEL_88;
      }
      id v41 = (void *)v40;
      objc_super v42 = [(HKAllergyRecord *)self lastOccurrenceDate];
      v43 = [v5 lastOccurrenceDate];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self recordedDate];
    uint64_t v45 = [v5 recordedDate];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      uint64_t v8 = (void *)v45;
      uint64_t v46 = [v5 recordedDate];
      if (!v46) {
        goto LABEL_88;
      }
      id v47 = (void *)v46;
      id v48 = [(HKAllergyRecord *)self recordedDate];
      BOOL v49 = [v5 recordedDate];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self verificationStatusCoding];
    uint64_t v51 = [v5 verificationStatusCoding];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      uint64_t v8 = (void *)v51;
      uint64_t v52 = [v5 verificationStatusCoding];
      if (!v52) {
        goto LABEL_88;
      }
      id v53 = (void *)v52;
      id v54 = [(HKAllergyRecord *)self verificationStatusCoding];
      id v55 = [v5 verificationStatusCoding];
      int v56 = [v54 isEqual:v55];

      if (!v56) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self clinicalStatusCoding];
    uint64_t v57 = [v5 clinicalStatusCoding];
    if (v6 == (void *)v57)
    {
    }
    else
    {
      uint64_t v8 = (void *)v57;
      uint64_t v58 = [v5 clinicalStatusCoding];
      if (!v58) {
        goto LABEL_88;
      }
      id v59 = (void *)v58;
      id v60 = [(HKAllergyRecord *)self clinicalStatusCoding];
      id v61 = [v5 clinicalStatusCoding];
      int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self allergyTypeCoding];
    uint64_t v63 = [v5 allergyTypeCoding];
    if (v6 == (void *)v63)
    {
    }
    else
    {
      uint64_t v8 = (void *)v63;
      uint64_t v64 = [v5 allergyTypeCoding];
      if (!v64) {
        goto LABEL_88;
      }
      BOOL v65 = (void *)v64;
      id v66 = [(HKAllergyRecord *)self allergyTypeCoding];
      id v67 = [v5 allergyTypeCoding];
      int v68 = [v66 isEqual:v67];

      if (!v68) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self categoryCoding];
    uint64_t v69 = [v5 categoryCoding];
    if (v6 == (void *)v69)
    {
    }
    else
    {
      uint64_t v8 = (void *)v69;
      uint64_t v70 = [v5 categoryCoding];
      if (!v70) {
        goto LABEL_88;
      }
      id v71 = (void *)v70;
      id v72 = [(HKAllergyRecord *)self categoryCoding];
      id v73 = [v5 categoryCoding];
      int v74 = [v72 isEqual:v73];

      if (!v74) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self allergy];
    uint64_t v75 = [v5 allergy];
    if (v6 == (void *)v75)
    {
    }
    else
    {
      uint64_t v8 = (void *)v75;
      uint64_t v76 = [v5 allergy];
      if (!v76) {
        goto LABEL_88;
      }
      id v77 = (void *)v76;
      id v78 = [(HKAllergyRecord *)self allergy];
      id v79 = [v5 allergy];
      int v80 = [v78 isEqual:v79];

      if (!v80) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self criticality];
    uint64_t v81 = [v5 criticality];
    if (v6 == (void *)v81)
    {
    }
    else
    {
      uint64_t v8 = (void *)v81;
      uint64_t v82 = [v5 criticality];
      if (!v82) {
        goto LABEL_88;
      }
      v83 = (void *)v82;
      v84 = [(HKAllergyRecord *)self criticality];
      v85 = [v5 criticality];
      int v86 = [v84 isEqual:v85];

      if (!v86) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self verificationStatus];
    uint64_t v87 = [v5 verificationStatus];
    if (v6 == (void *)v87)
    {
    }
    else
    {
      uint64_t v8 = (void *)v87;
      uint64_t v88 = [v5 verificationStatus];
      if (!v88) {
        goto LABEL_88;
      }
      v89 = (void *)v88;
      v90 = [(HKAllergyRecord *)self verificationStatus];
      v91 = [v5 verificationStatus];
      int v92 = [v90 isEqual:v91];

      if (!v92) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self clinicalStatus];
    uint64_t v93 = [v5 clinicalStatus];
    if (v6 == (void *)v93)
    {
    }
    else
    {
      uint64_t v8 = (void *)v93;
      uint64_t v94 = [v5 clinicalStatus];
      if (!v94) {
        goto LABEL_88;
      }
      v95 = (void *)v94;
      v96 = [(HKAllergyRecord *)self clinicalStatus];
      v97 = [v5 clinicalStatus];
      int v98 = [v96 isEqual:v97];

      if (!v98) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self allergyType];
    uint64_t v99 = [v5 allergyType];
    if (v6 == (void *)v99)
    {
    }
    else
    {
      uint64_t v8 = (void *)v99;
      uint64_t v100 = [v5 allergyType];
      if (!v100) {
        goto LABEL_88;
      }
      v101 = (void *)v100;
      v102 = [(HKAllergyRecord *)self allergyType];
      v103 = [v5 allergyType];
      int v104 = [v102 isEqual:v103];

      if (!v104) {
        goto LABEL_89;
      }
    }
    uint64_t v6 = [(HKAllergyRecord *)self category];
    uint64_t v105 = [v5 category];
    if (v6 == (void *)v105)
    {

LABEL_93:
      BOOL v14 = 1;
      goto LABEL_90;
    }
    uint64_t v8 = (void *)v105;
    uint64_t v106 = [v5 category];
    if (v106)
    {
      v107 = (void *)v106;
      v108 = [(HKAllergyRecord *)self category];
      v109 = [v5 category];
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

- (id)criticalityCodingCollection
{
  uint64_t v3 = [(HKAllergyRecord *)self criticalityCoding];

  if (v3)
  {
    id v4 = [(HKAllergyRecord *)self criticalityCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)verificationStatusCodingCollection
{
  uint64_t v3 = [(HKAllergyRecord *)self verificationStatusCoding];

  if (v3)
  {
    id v4 = [(HKAllergyRecord *)self verificationStatusCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)clinicalStatusCodingCollection
{
  uint64_t v3 = [(HKAllergyRecord *)self clinicalStatusCoding];

  if (v3)
  {
    id v4 = [(HKAllergyRecord *)self clinicalStatusCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)allergyTypeCodingCollection
{
  uint64_t v3 = [(HKAllergyRecord *)self allergyTypeCoding];

  if (v3)
  {
    id v4 = [(HKAllergyRecord *)self allergyTypeCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)categoryCodingCollection
{
  uint64_t v3 = [(HKAllergyRecord *)self categoryCoding];

  if (v3)
  {
    id v4 = [(HKAllergyRecord *)self categoryCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (HKMedicalCodingCollection)allergyCodingCollection
{
  return self->_allergyCodingCollection;
}

- (void)_setAllergyCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  allergyCodingCollection = self->_allergyCodingCollection;
  self->_allergyCodingCollection = v4;

  id v8 = [(HKAllergyRecord *)self allergyCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  allergy = self->_allergy;
  self->_allergy = v6;
}

- (HKMedicalDate)onsetDate
{
  return self->_onsetDate;
}

- (void)_setOnsetDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  onsetDate = self->_onsetDate;
  self->_onsetDate = v4;

  MEMORY[0x1F41817F8](v4, onsetDate);
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

- (NSArray)reactions
{
  return self->_reactions;
}

- (void)_setReactions:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reactions = self->_reactions;
  self->_reactions = v4;

  MEMORY[0x1F41817F8](v4, reactions);
}

- (HKMedicalCoding)criticalityCoding
{
  return self->_criticalityCoding;
}

- (void)_setCriticalityCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  criticalityCoding = self->_criticalityCoding;
  self->_criticalityCoding = v4;

  if (self->_criticalityCoding)
  {
    uint64_t v9 = [(HKAllergyRecord *)self criticalityCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    criticality = self->_criticality;
    self->_criticality = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_criticality;
    self->_criticality = 0;
  }
}

- (HKMedicalDate)lastOccurrenceDate
{
  return self->_lastOccurrenceDate;
}

- (void)_setLastOccurrenceDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  lastOccurrenceDate = self->_lastOccurrenceDate;
  self->_lastOccurrenceDate = v4;

  MEMORY[0x1F41817F8](v4, lastOccurrenceDate);
}

- (HKMedicalDate)recordedDate
{
  return self->_recordedDate;
}

- (void)_setRecordedDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  recordedDate = self->_recordedDate;
  self->_recordedDate = v4;

  MEMORY[0x1F41817F8](v4, recordedDate);
}

- (HKMedicalCoding)verificationStatusCoding
{
  return self->_verificationStatusCoding;
}

- (void)_setVerificationStatusCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  verificationStatusCoding = self->_verificationStatusCoding;
  self->_verificationStatusCoding = v4;

  if (self->_verificationStatusCoding)
  {
    uint64_t v9 = [(HKAllergyRecord *)self verificationStatusCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    verificationStatus = self->_verificationStatus;
    self->_verificationStatus = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_verificationStatus;
    self->_verificationStatus = 0;
  }
}

- (HKMedicalCoding)clinicalStatusCoding
{
  return self->_clinicalStatusCoding;
}

- (void)_setClinicalStatusCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  clinicalStatusCoding = self->_clinicalStatusCoding;
  self->_clinicalStatusCoding = v4;

  if (self->_clinicalStatusCoding)
  {
    uint64_t v9 = [(HKAllergyRecord *)self clinicalStatusCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    clinicalStatus = self->_clinicalStatus;
    self->_clinicalStatus = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_clinicalStatus;
    self->_clinicalStatus = 0;
  }
}

- (HKMedicalCoding)allergyTypeCoding
{
  return self->_allergyTypeCoding;
}

- (void)_setAllergyTypeCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  allergyTypeCoding = self->_allergyTypeCoding;
  self->_allergyTypeCoding = v4;

  if (self->_allergyTypeCoding)
  {
    uint64_t v9 = [(HKAllergyRecord *)self allergyTypeCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    allergyType = self->_allergyType;
    self->_allergyType = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_allergyType;
    self->_allergyType = 0;
  }
}

- (HKMedicalCoding)categoryCoding
{
  return self->_categoryCoding;
}

- (void)_setCategoryCoding:(id)a3
{
  id v4 = (HKMedicalCoding *)[a3 copy];
  categoryCoding = self->_categoryCoding;
  self->_categoryCoding = v4;

  if (self->_categoryCoding)
  {
    uint64_t v9 = [(HKAllergyRecord *)self categoryCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    category = self->_category;
    self->_category = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_category;
    self->_category = 0;
  }
}

- (HKConcept)allergy
{
  allergy = self->_allergy;
  if (allergy)
  {
    uint64_t v3 = allergy;
  }
  else
  {
    id v4 = [(HKAllergyRecord *)self allergyCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setAllergy:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKAllergyRecord _setAllergy:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  allergy = self->_allergy;
  self->_allergy = v6;
}

- (HKConcept)criticality
{
  if (self->_criticalityCoding)
  {
    criticality = self->_criticality;
    if (criticality)
    {
      uint64_t v3 = criticality;
    }
    else
    {
      id v4 = [(HKAllergyRecord *)self criticalityCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setCriticality:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  criticality = self->_criticality;
  self->_criticality = v4;

  MEMORY[0x1F41817F8](v4, criticality);
}

- (HKConcept)verificationStatus
{
  if (self->_verificationStatusCoding)
  {
    verificationStatus = self->_verificationStatus;
    if (verificationStatus)
    {
      uint64_t v3 = verificationStatus;
    }
    else
    {
      id v4 = [(HKAllergyRecord *)self verificationStatusCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setVerificationStatus:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  verificationStatus = self->_verificationStatus;
  self->_verificationStatus = v4;

  MEMORY[0x1F41817F8](v4, verificationStatus);
}

- (HKConcept)clinicalStatus
{
  if (self->_clinicalStatusCoding)
  {
    clinicalStatus = self->_clinicalStatus;
    if (clinicalStatus)
    {
      uint64_t v3 = clinicalStatus;
    }
    else
    {
      id v4 = [(HKAllergyRecord *)self clinicalStatusCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setClinicalStatus:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  clinicalStatus = self->_clinicalStatus;
  self->_clinicalStatus = v4;

  MEMORY[0x1F41817F8](v4, clinicalStatus);
}

- (HKConcept)allergyType
{
  if (self->_allergyTypeCoding)
  {
    allergyType = self->_allergyType;
    if (allergyType)
    {
      uint64_t v3 = allergyType;
    }
    else
    {
      id v4 = [(HKAllergyRecord *)self allergyTypeCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setAllergyType:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  allergyType = self->_allergyType;
  self->_allergyType = v4;

  MEMORY[0x1F41817F8](v4, allergyType);
}

- (HKConcept)category
{
  if (self->_categoryCoding)
  {
    category = self->_category;
    if (category)
    {
      uint64_t v3 = category;
    }
    else
    {
      id v4 = [(HKAllergyRecord *)self categoryCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setCategory:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  category = self->_category;
  self->_category = v4;

  MEMORY[0x1F41817F8](v4, category);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKAllergyRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    id v8 = v7;
    goto LABEL_6;
  }
  if (!self->_allergyCodingCollection)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: allergyCodingCollection must not be nil"", self);
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
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_allergyType, 0);
  objc_storeStrong((id *)&self->_clinicalStatus, 0);
  objc_storeStrong((id *)&self->_verificationStatus, 0);
  objc_storeStrong((id *)&self->_criticality, 0);
  objc_storeStrong((id *)&self->_allergy, 0);
  objc_storeStrong((id *)&self->_categoryCoding, 0);
  objc_storeStrong((id *)&self->_allergyTypeCoding, 0);
  objc_storeStrong((id *)&self->_clinicalStatusCoding, 0);
  objc_storeStrong((id *)&self->_verificationStatusCoding, 0);
  objc_storeStrong((id *)&self->_recordedDate, 0);
  objc_storeStrong((id *)&self->_lastOccurrenceDate, 0);
  objc_storeStrong((id *)&self->_criticalityCoding, 0);
  objc_storeStrong((id *)&self->_reactions, 0);
  objc_storeStrong((id *)&self->_asserter, 0);
  objc_storeStrong((id *)&self->_onsetDate, 0);

  objc_storeStrong((id *)&self->_allergyCodingCollection, 0);
}

- (void)_setAllergy:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property allergy for record type HKAllergyRecord.", v1, 2u);
}

@end