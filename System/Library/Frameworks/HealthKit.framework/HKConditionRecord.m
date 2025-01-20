@interface HKConditionRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newConditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 conditionCodingCollection:(id)a15 categoriesCodingCollections:(id)a16 asserter:(id)a17 abatement:(id)a18 onset:(id)a19 recordedDate:(id)a20 clinicalStatusCoding:(id)a21 verificationStatusCoding:(id)a22 severityCodingCollection:(id)a23 bodySitesCodingCollections:(id)a24 config:(id)a25;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)conditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 conditionCodingCollection:(id)a14 categoriesCodingCollections:(id)a15 asserter:(id)a16 abatement:(id)a17 onset:(id)a18 recordedDate:(id)a19 clinicalStatusCoding:(id)a20 verificationStatusCoding:(id)a21 severityCodingCollection:(id)a22 bodySitesCodingCollections:(id)a23;
+ (id)conditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 conditionCodingCollection:(id)a15 categoriesCodingCollections:(id)a16 asserter:(id)a17 abatement:(id)a18 onset:(id)a19 recordedDate:(id)a20 clinicalStatusCoding:(id)a21 verificationStatusCoding:(id)a22 severityCodingCollection:(id)a23 bodySitesCodingCollections:(id)a24;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (HKConcept)clinicalStatus;
- (HKConcept)condition;
- (HKConcept)severity;
- (HKConcept)verificationStatus;
- (HKConditionRecord)init;
- (HKConditionRecord)initWithCoder:(id)a3;
- (HKInspectableValue)abatement;
- (HKInspectableValue)onset;
- (HKMedicalCoding)clinicalStatusCoding;
- (HKMedicalCoding)verificationStatusCoding;
- (HKMedicalCodingCollection)conditionCodingCollection;
- (HKMedicalCodingCollection)severityCodingCollection;
- (HKMedicalDate)recordedDate;
- (NSArray)bodySites;
- (NSArray)bodySitesCodingCollections;
- (NSArray)categories;
- (NSArray)categoriesCodingCollections;
- (NSString)asserter;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)clinicalStatusCodingCollection;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)verificationStatusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setAbatement:(id)a3;
- (void)_setAsserter:(id)a3;
- (void)_setBodySites:(id)a3;
- (void)_setBodySitesCodingCollections:(id)a3;
- (void)_setCategories:(id)a3;
- (void)_setCategoriesCodingCollections:(id)a3;
- (void)_setClinicalStatus:(id)a3;
- (void)_setClinicalStatusCoding:(id)a3;
- (void)_setCondition:(id)a3;
- (void)_setConditionCodingCollection:(id)a3;
- (void)_setOnset:(id)a3;
- (void)_setRecordedDate:(id)a3;
- (void)_setSeverity:(id)a3;
- (void)_setSeverityCodingCollection:(id)a3;
- (void)_setVerificationStatus:(id)a3;
- (void)_setVerificationStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKConditionRecord

+ (id)conditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 conditionCodingCollection:(id)a14 categoriesCodingCollections:(id)a15 asserter:(id)a16 abatement:(id)a17 onset:(id)a18 recordedDate:(id)a19 clinicalStatusCoding:(id)a20 verificationStatusCoding:(id)a21 severityCodingCollection:(id)a22 bodySitesCodingCollections:(id)a23
{
  BOOL v55 = a5;
  id v66 = a3;
  id v65 = a4;
  id v27 = a6;
  id v64 = a7;
  id v57 = a8;
  id v28 = a10;
  id v63 = a11;
  id v62 = a12;
  id v59 = a14;
  id v61 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v54 = a20;
  id v53 = a21;
  id v33 = a22;
  id v52 = a23;
  v34 = @"modifiedDate";
  id v35 = v27;
  v36 = v35;
  if (v31)
  {
    id v37 = v28;
    v38 = [v31 dateValueForUTC];

    if (v38)
    {
      v39 = @"onset";

      v40 = [v31 dateValueForUTC];

      v34 = v39;
    }
    else
    {
      v40 = v36;
    }
    id v28 = v37;
  }
  else
  {
    v40 = v35;
  }
  v60 = v36;
  v58 = v28;
  if (v32)
  {
    v41 = v31;
    v42 = v30;
    v43 = v29;
    v44 = @"recordedDate";

    v45 = v32;
    uint64_t v46 = [v32 dateForUTC];

    v47 = (void *)v46;
    v34 = v44;
    unint64_t v48 = a13;
  }
  else
  {
    v45 = 0;
    v41 = v31;
    v42 = v30;
    v43 = v29;
    unint64_t v48 = a13;
    v47 = v40;
  }
  v51 = v47;
  v49 = +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v34);
  +[HKConditionRecord conditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:](HKConditionRecord, "conditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:", v66, v65, v55, v60, v64, v57, a9, v58, v63, v49, v62, v48, v59, v61, v43,
    v42,
    v41,
    v45,
    v54,
    v53,
    v33,
  v56 = v52);

  return v56;
}

- (id)medicalRecordCodings
{
  v2 = [(HKConditionRecord *)self conditionCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_CONDITION" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKConditionRecord;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"condition"];
  [v3 addObject:@"categories"];
  [v3 addObject:@"clinicalStatus"];
  [v3 addObject:@"verificationStatus"];
  [v3 addObject:@"severity"];
  [v3 addObject:@"bodySites"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKConditionRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_17;
  }
  if ([v7 isEqualToString:@"condition"])
  {
    v9 = [(HKConditionRecord *)self conditionCodingCollection];
    v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v29[0] = v10;
    v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = (void **)v29;
LABEL_4:
    v13 = [v11 arrayWithObjects:v12 count:1];

    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"categories"])
  {
    uint64_t v14 = [(HKConditionRecord *)self categoriesCodingCollections];
LABEL_8:
    v15 = (void *)v14;
    v13 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v14 context:v6 error:a4];
LABEL_16:

    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"clinicalStatus"])
  {
    v16 = [(HKConditionRecord *)self clinicalStatusCoding];

    if (v16)
    {
      v15 = [(HKConditionRecord *)self clinicalStatusCoding];
      v17 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v18 = +[HKIndexableObject indexableObjectWithObject:v17];
      id v28 = v18;
      v19 = (void *)MEMORY[0x1E4F1C978];
      v20 = &v28;
LABEL_15:
      v13 = [v19 arrayWithObjects:v20 count:1];

      goto LABEL_16;
    }
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"verificationStatus"])
  {
    v21 = [(HKConditionRecord *)self verificationStatusCoding];

    if (v21)
    {
      v15 = [(HKConditionRecord *)self verificationStatusCoding];
      v17 = +[HKMedicalCodingCollection collectionWithCoding:v15];
      v18 = +[HKIndexableObject indexableObjectWithObject:v17];
      id v27 = v18;
      v19 = (void *)MEMORY[0x1E4F1C978];
      v20 = &v27;
      goto LABEL_15;
    }
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"severity"])
  {
    v23 = [(HKConditionRecord *)self severityCodingCollection];

    if (v23)
    {
      v9 = [(HKConditionRecord *)self severityCodingCollection];
      v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      v26 = v10;
      v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v26;
      goto LABEL_4;
    }
LABEL_26:
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"bodySites"])
  {
    v24 = [(HKConditionRecord *)self bodySitesCodingCollections];

    if (v24)
    {
      uint64_t v14 = [(HKConditionRecord *)self bodySitesCodingCollections];
      goto LABEL_8;
    }
    goto LABEL_26;
  }
  v25.receiver = self;
  v25.super_class = (Class)HKConditionRecord;
  v13 = [(HKMedicalRecord *)&v25 codingsForKeyPath:v6 error:a4];
LABEL_17:

  return v13;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_6;
  }
  if (![v10 isEqualToString:@"condition"])
  {
    if ([v11 isEqualToString:@"categories"])
    {
      v13 = [(HKConditionRecord *)self categoriesCodingCollections];
      uint64_t v14 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v13 count], v9, a5);

      LOBYTE(a5) = v14 != 0;
      if (v14) {
        [(HKConditionRecord *)self _setCategories:v14];
      }
LABEL_10:

      goto LABEL_11;
    }
    if ([v11 isEqualToString:@"clinicalStatus"])
    {
      uint64_t v16 = [v8 count];
      v17 = [(HKConditionRecord *)self clinicalStatusCoding];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v16, v17 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!a5) {
        goto LABEL_11;
      }
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKConditionRecord *)self _setClinicalStatus:v12];
      goto LABEL_5;
    }
    if ([v11 isEqualToString:@"verificationStatus"])
    {
      uint64_t v18 = [v8 count];
      v19 = [(HKConditionRecord *)self verificationStatusCoding];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v18, v19 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!a5) {
        goto LABEL_11;
      }
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKConditionRecord *)self _setVerificationStatus:v12];
      goto LABEL_5;
    }
    if ([v11 isEqualToString:@"severity"])
    {
      uint64_t v20 = [v8 count];
      v21 = [(HKConditionRecord *)self severityCodingCollection];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v20, v21 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!a5) {
        goto LABEL_11;
      }
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKConditionRecord *)self _setSeverity:v12];
      goto LABEL_5;
    }
    if ([v11 isEqualToString:@"bodySites"])
    {
      v22 = [(HKConditionRecord *)self bodySitesCodingCollections];

      if (v22)
      {
        v23 = [(HKConditionRecord *)self bodySitesCodingCollections];
        uint64_t v14 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v23 count], v9, a5);

        LOBYTE(a5) = v14 != 0;
        if (v14) {
          [(HKConditionRecord *)self _setBodySites:v14];
        }
        goto LABEL_10;
      }
      BOOL v24 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)HKConditionRecord;
      BOOL v24 = [(HKMedicalRecord *)&v25 applyConcepts:v8 forKeyPath:v9 error:a5];
    }
    LOBYTE(a5) = v24;
    goto LABEL_11;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
  {
LABEL_6:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  a5 = [v8 firstObject];
  v12 = [a5 object];
  [(HKConditionRecord *)self _setCondition:v12];
LABEL_5:

  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

- (int64_t)recordCategoryType
{
  return 4;
}

+ (id)conditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 conditionCodingCollection:(id)a15 categoriesCodingCollections:(id)a16 asserter:(id)a17 abatement:(id)a18 onset:(id)a19 recordedDate:(id)a20 clinicalStatusCoding:(id)a21 verificationStatusCoding:(id)a22 severityCodingCollection:(id)a23 bodySitesCodingCollections:(id)a24
{
  BOOL v24 = objc_msgSend(a1, "_newConditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                  a17,
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

+ (id)_newConditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 conditionCodingCollection:(id)a15 categoriesCodingCollections:(id)a16 asserter:(id)a17 abatement:(id)a18 onset:(id)a19 recordedDate:(id)a20 clinicalStatusCoding:(id)a21 verificationStatusCoding:(id)a22 severityCodingCollection:(id)a23 bodySitesCodingCollections:(id)a24 config:(id)a25
{
  BOOL v64 = a5;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  id v30 = a20;
  id v31 = a21;
  id v32 = a22;
  id v33 = a23;
  id v34 = a24;
  id v35 = a25;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __360__HKConditionRecord__newConditionRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_conditionCodingCollection_categoriesCodingCollections_asserter_abatement_onset_recordedDate_clinicalStatusCoding_verificationStatusCoding_severityCodingCollection_bodySitesCodingCollections_config___block_invoke;
  aBlock[3] = &unk_1E58C8C50;
  id v68 = v25;
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
  id v53 = v25;
  id v36 = a13;
  id v37 = a12;
  id v38 = a11;
  id v39 = a10;
  id v40 = a8;
  id v41 = a7;
  id v42 = a6;
  id v43 = a4;
  id v44 = a3;
  v45 = _Block_copy(aBlock);
  v66.receiver = a1;
  v66.super_class = (Class)&OBJC_METACLASS___HKConditionRecord;
  id v65 = objc_msgSendSuper2(&v66, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v44, v43, v64, v42, v41, v40, a9, v39, v38, v37, v36, a14, v45);

  return v65;
}

void __360__HKConditionRecord__newConditionRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_conditionCodingCollection_categoriesCodingCollections_asserter_abatement_onset_recordedDate_clinicalStatusCoding_verificationStatusCoding_severityCodingCollection_bodySitesCodingCollections_config___block_invoke(uint64_t a1, void *a2)
{
  BOOL v24 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  objc_super v4 = (void *)v24[22];
  v24[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  id v6 = (void *)v24[23];
  v24[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  id v8 = (void *)v24[24];
  v24[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v24[25];
  v24[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v24[26];
  v24[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  uint64_t v14 = (void *)v24[27];
  v24[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  uint64_t v16 = (void *)v24[28];
  v24[28] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  uint64_t v18 = (void *)v24[29];
  v24[29] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  uint64_t v20 = (void *)v24[30];
  v24[30] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  v22 = (void *)v24[31];
  v24[31] = v21;

  uint64_t v23 = *(void *)(a1 + 112);
  if (v23) {
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);
  }
}

- (HKConditionRecord)init
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
  v9.super_class = (Class)HKConditionRecord;
  id v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@conditionCodingCollection = %@categoriesCodingCollections = %@asserter = %@abatement = %@onset = %@recordedDate = %@clinicalStatusCoding = %@verificationStatusCoding = %@severityCodingCollection = %@bodySitesCodingCollections = %@>", v5, self, v6, self->_conditionCodingCollection, self->_categoriesCodingCollections, self->_asserter, self->_abatement, self->_onset, self->_recordedDate, self->_clinicalStatusCoding, self->_verificationStatusCoding, self->_severityCodingCollection, self->_bodySitesCodingCollections];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKConditionRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_conditionCodingCollection, @"ConditionCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_categoriesCodingCollections forKey:@"CategoriesCodingCollections"];
  [v4 encodeObject:self->_asserter forKey:@"Asserter"];
  [v4 encodeObject:self->_abatement forKey:@"Abatement"];
  [v4 encodeObject:self->_onset forKey:@"Onset"];
  [v4 encodeObject:self->_recordedDate forKey:@"RecordedDate"];
  [v4 encodeObject:self->_clinicalStatusCoding forKey:@"ClinicalStatusCoding"];
  [v4 encodeObject:self->_verificationStatusCoding forKey:@"VerificationStatusCoding"];
  [v4 encodeObject:self->_severityCodingCollection forKey:@"SeverityCodingCollection"];
  [v4 encodeObject:self->_bodySitesCodingCollections forKey:@"BodySitesCodingCollections"];
  [v4 encodeObject:self->_condition forKey:@"Condition"];
  [v4 encodeObject:self->_categories forKey:@"Categories"];
  [v4 encodeObject:self->_clinicalStatus forKey:@"ClinicalStatus"];
  [v4 encodeObject:self->_verificationStatus forKey:@"VerificationStatus"];
  [v4 encodeObject:self->_severity forKey:@"Severity"];
  [v4 encodeObject:self->_bodySites forKey:@"BodySites"];
}

- (HKConditionRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HKConditionRecord;
  objc_super v5 = [(HKMedicalRecord *)&v43 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ConditionCodingCollection"];
    conditionCodingCollection = v5->_conditionCodingCollection;
    v5->_conditionCodingCollection = (HKMedicalCodingCollection *)v6;

    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CategoriesCodingCollections"];
    categoriesCodingCollections = v5->_categoriesCodingCollections;
    v5->_categoriesCodingCollections = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Asserter"];
    asserter = v5->_asserter;
    v5->_asserter = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Abatement"];
    abatement = v5->_abatement;
    v5->_abatement = (HKInspectableValue *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Onset"];
    onset = v5->_onset;
    v5->_onset = (HKInspectableValue *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordedDate"];
    recordedDate = v5->_recordedDate;
    v5->_recordedDate = (HKMedicalDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClinicalStatusCoding"];
    clinicalStatusCoding = v5->_clinicalStatusCoding;
    v5->_clinicalStatusCoding = (HKMedicalCoding *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VerificationStatusCoding"];
    verificationStatusCoding = v5->_verificationStatusCoding;
    v5->_verificationStatusCoding = (HKMedicalCoding *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SeverityCodingCollection"];
    severityCodingCollection = v5->_severityCodingCollection;
    v5->_severityCodingCollection = (HKMedicalCodingCollection *)v23;

    id v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"BodySitesCodingCollections"];
    bodySitesCodingCollections = v5->_bodySitesCodingCollections;
    v5->_bodySitesCodingCollections = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Condition"];
    condition = v5->_condition;
    v5->_condition = (HKConcept *)v28;

    id v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"Categories"];
    categories = v5->_categories;
    v5->_categories = (NSArray *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClinicalStatus"];
    clinicalStatus = v5->_clinicalStatus;
    v5->_clinicalStatus = (HKConcept *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VerificationStatus"];
    verificationStatus = v5->_verificationStatus;
    v5->_verificationStatus = (HKConcept *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Severity"];
    severity = v5->_severity;
    v5->_severity = (HKConcept *)v37;

    id v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"BodySites"];
    bodySites = v5->_bodySites;
    v5->_bodySites = (NSArray *)v40;
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
    v106.receiver = self;
    v106.super_class = (Class)HKConditionRecord;
    if (![(HKMedicalRecord *)&v106 isEquivalent:v5]) {
      goto LABEL_84;
    }
    uint64_t v6 = [(HKConditionRecord *)self conditionCodingCollection];
    uint64_t v7 = [v5 conditionCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 conditionCodingCollection];
      if (!v9) {
        goto LABEL_83;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKConditionRecord *)self conditionCodingCollection];
      v12 = [v5 conditionCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self categoriesCodingCollections];
    uint64_t v15 = [v5 categoriesCodingCollections];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      id v8 = (void *)v15;
      uint64_t v16 = [v5 categoriesCodingCollections];
      if (!v16) {
        goto LABEL_83;
      }
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(HKConditionRecord *)self categoriesCodingCollections];
      uint64_t v19 = [v5 categoriesCodingCollections];
      int v20 = [v18 isEqualToArray:v19];

      if (!v20) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self asserter];
    uint64_t v21 = [v5 asserter];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      id v8 = (void *)v21;
      uint64_t v22 = [v5 asserter];
      if (!v22) {
        goto LABEL_83;
      }
      uint64_t v23 = (void *)v22;
      BOOL v24 = [(HKConditionRecord *)self asserter];
      id v25 = [v5 asserter];
      int v26 = [v24 isEqualToString:v25];

      if (!v26) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self abatement];
    uint64_t v27 = [v5 abatement];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      id v8 = (void *)v27;
      uint64_t v28 = [v5 abatement];
      if (!v28) {
        goto LABEL_83;
      }
      id v29 = (void *)v28;
      id v30 = [(HKConditionRecord *)self abatement];
      uint64_t v31 = [v5 abatement];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self onset];
    uint64_t v33 = [v5 onset];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      id v8 = (void *)v33;
      uint64_t v34 = [v5 onset];
      if (!v34) {
        goto LABEL_83;
      }
      uint64_t v35 = (void *)v34;
      id v36 = [(HKConditionRecord *)self onset];
      uint64_t v37 = [v5 onset];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self recordedDate];
    uint64_t v39 = [v5 recordedDate];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      id v8 = (void *)v39;
      uint64_t v40 = [v5 recordedDate];
      if (!v40) {
        goto LABEL_83;
      }
      id v41 = (void *)v40;
      id v42 = [(HKConditionRecord *)self recordedDate];
      objc_super v43 = [v5 recordedDate];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self clinicalStatusCoding];
    uint64_t v45 = [v5 clinicalStatusCoding];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      id v8 = (void *)v45;
      uint64_t v46 = [v5 clinicalStatusCoding];
      if (!v46) {
        goto LABEL_83;
      }
      v47 = (void *)v46;
      unint64_t v48 = [(HKConditionRecord *)self clinicalStatusCoding];
      v49 = [v5 clinicalStatusCoding];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self verificationStatusCoding];
    uint64_t v51 = [v5 verificationStatusCoding];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      id v8 = (void *)v51;
      uint64_t v52 = [v5 verificationStatusCoding];
      if (!v52) {
        goto LABEL_83;
      }
      id v53 = (void *)v52;
      id v54 = [(HKConditionRecord *)self verificationStatusCoding];
      id v55 = [v5 verificationStatusCoding];
      int v56 = [v54 isEqual:v55];

      if (!v56) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self severityCodingCollection];
    uint64_t v57 = [v5 severityCodingCollection];
    if (v6 == (void *)v57)
    {
    }
    else
    {
      id v8 = (void *)v57;
      uint64_t v58 = [v5 severityCodingCollection];
      if (!v58) {
        goto LABEL_83;
      }
      id v59 = (void *)v58;
      id v60 = [(HKConditionRecord *)self severityCodingCollection];
      id v61 = [v5 severityCodingCollection];
      int v62 = [v60 isEqual:v61];

      if (!v62) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self bodySitesCodingCollections];
    uint64_t v63 = [v5 bodySitesCodingCollections];
    if (v6 == (void *)v63)
    {
    }
    else
    {
      id v8 = (void *)v63;
      uint64_t v64 = [v5 bodySitesCodingCollections];
      if (!v64) {
        goto LABEL_83;
      }
      id v65 = (void *)v64;
      objc_super v66 = [(HKConditionRecord *)self bodySitesCodingCollections];
      v67 = [v5 bodySitesCodingCollections];
      int v68 = [v66 isEqualToArray:v67];

      if (!v68) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self condition];
    uint64_t v69 = [v5 condition];
    if (v6 == (void *)v69)
    {
    }
    else
    {
      id v8 = (void *)v69;
      uint64_t v70 = [v5 condition];
      if (!v70) {
        goto LABEL_83;
      }
      id v71 = (void *)v70;
      id v72 = [(HKConditionRecord *)self condition];
      id v73 = [v5 condition];
      int v74 = [v72 isEqual:v73];

      if (!v74) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self categories];
    uint64_t v75 = [v5 categories];
    if (v6 == (void *)v75)
    {
    }
    else
    {
      id v8 = (void *)v75;
      uint64_t v76 = [v5 categories];
      if (!v76) {
        goto LABEL_83;
      }
      id v77 = (void *)v76;
      id v78 = [(HKConditionRecord *)self categories];
      v79 = [v5 categories];
      int v80 = [v78 isEqualToArray:v79];

      if (!v80) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self clinicalStatus];
    uint64_t v81 = [v5 clinicalStatus];
    if (v6 == (void *)v81)
    {
    }
    else
    {
      id v8 = (void *)v81;
      uint64_t v82 = [v5 clinicalStatus];
      if (!v82) {
        goto LABEL_83;
      }
      v83 = (void *)v82;
      v84 = [(HKConditionRecord *)self clinicalStatus];
      v85 = [v5 clinicalStatus];
      int v86 = [v84 isEqual:v85];

      if (!v86) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self verificationStatus];
    uint64_t v87 = [v5 verificationStatus];
    if (v6 == (void *)v87)
    {
    }
    else
    {
      id v8 = (void *)v87;
      uint64_t v88 = [v5 verificationStatus];
      if (!v88) {
        goto LABEL_83;
      }
      v89 = (void *)v88;
      v90 = [(HKConditionRecord *)self verificationStatus];
      v91 = [v5 verificationStatus];
      int v92 = [v90 isEqual:v91];

      if (!v92) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self severity];
    uint64_t v93 = [v5 severity];
    if (v6 == (void *)v93)
    {
    }
    else
    {
      id v8 = (void *)v93;
      uint64_t v94 = [v5 severity];
      if (!v94) {
        goto LABEL_83;
      }
      v95 = (void *)v94;
      v96 = [(HKConditionRecord *)self severity];
      v97 = [v5 severity];
      int v98 = [v96 isEqual:v97];

      if (!v98) {
        goto LABEL_84;
      }
    }
    uint64_t v6 = [(HKConditionRecord *)self bodySites];
    uint64_t v99 = [v5 bodySites];
    if (v6 == (void *)v99)
    {

LABEL_88:
      BOOL v14 = 1;
      goto LABEL_85;
    }
    id v8 = (void *)v99;
    uint64_t v100 = [v5 bodySites];
    if (v100)
    {
      v101 = (void *)v100;
      v102 = [(HKConditionRecord *)self bodySites];
      v103 = [v5 bodySites];
      char v104 = [v102 isEqualToArray:v103];

      if (v104) {
        goto LABEL_88;
      }
LABEL_84:
      BOOL v14 = 0;
LABEL_85:

      goto LABEL_86;
    }
LABEL_83:

    goto LABEL_84;
  }
  BOOL v14 = 0;
LABEL_86:

  return v14;
}

- (id)clinicalStatusCodingCollection
{
  uint64_t v3 = [(HKConditionRecord *)self clinicalStatusCoding];

  if (v3)
  {
    id v4 = [(HKConditionRecord *)self clinicalStatusCoding];
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
  uint64_t v3 = [(HKConditionRecord *)self verificationStatusCoding];

  if (v3)
  {
    id v4 = [(HKConditionRecord *)self verificationStatusCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (HKMedicalCodingCollection)conditionCodingCollection
{
  return self->_conditionCodingCollection;
}

- (void)_setConditionCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  conditionCodingCollection = self->_conditionCodingCollection;
  self->_conditionCodingCollection = v4;

  id v8 = [(HKConditionRecord *)self conditionCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  condition = self->_condition;
  self->_condition = v6;
}

- (NSArray)categoriesCodingCollections
{
  return self->_categoriesCodingCollections;
}

- (void)_setCategoriesCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  categoriesCodingCollections = self->_categoriesCodingCollections;
  self->_categoriesCodingCollections = v4;

  id v8 = [(HKConditionRecord *)self categoriesCodingCollections];
  objc_msgSend(v8, "hk_map:", &__block_literal_global_125);
  uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v6;
}

id __53__HKConditionRecord__setCategoriesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
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

- (HKInspectableValue)abatement
{
  return self->_abatement;
}

- (void)_setAbatement:(id)a3
{
  id v4 = (HKInspectableValue *)[a3 copy];
  abatement = self->_abatement;
  self->_abatement = v4;

  MEMORY[0x1F41817F8](v4, abatement);
}

- (HKInspectableValue)onset
{
  return self->_onset;
}

- (void)_setOnset:(id)a3
{
  id v4 = (HKInspectableValue *)[a3 copy];
  onset = self->_onset;
  self->_onset = v4;

  MEMORY[0x1F41817F8](v4, onset);
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
    uint64_t v9 = [(HKConditionRecord *)self clinicalStatusCodingCollection];
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
    uint64_t v9 = [(HKConditionRecord *)self verificationStatusCodingCollection];
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

- (HKMedicalCodingCollection)severityCodingCollection
{
  return self->_severityCodingCollection;
}

- (void)_setSeverityCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  severityCodingCollection = self->_severityCodingCollection;
  self->_severityCodingCollection = v4;

  if (self->_severityCodingCollection)
  {
    uint64_t v9 = [(HKConditionRecord *)self severityCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    severity = self->_severity;
    self->_severity = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_severity;
    self->_severity = 0;
  }
}

- (NSArray)bodySitesCodingCollections
{
  return self->_bodySitesCodingCollections;
}

- (void)_setBodySitesCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  bodySitesCodingCollections = self->_bodySitesCodingCollections;
  self->_bodySitesCodingCollections = v4;

  if (self->_bodySitesCodingCollections)
  {
    uint64_t v9 = [(HKConditionRecord *)self bodySitesCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_126_2];
    bodySites = self->_bodySites;
    self->_bodySites = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_bodySites;
    self->_bodySites = 0;
  }
}

id __52__HKConditionRecord__setBodySitesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKConcept)condition
{
  condition = self->_condition;
  if (condition)
  {
    uint64_t v3 = condition;
  }
  else
  {
    id v4 = [(HKConditionRecord *)self conditionCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setCondition:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKConditionRecord _setCondition:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  condition = self->_condition;
  self->_condition = v6;
}

- (NSArray)categories
{
  categories = self->_categories;
  if (categories)
  {
    uint64_t v3 = categories;
  }
  else
  {
    id v4 = [(HKConditionRecord *)self categoriesCodingCollections];
    objc_msgSend(v4, "hk_map:", &__block_literal_global_128_2);
    uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __31__HKConditionRecord_categories__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setCategories:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKConditionRecord _setCategories:](v5);
    }
  }
  uint64_t v6 = (NSArray *)[v4 copy];
  categories = self->_categories;
  self->_categories = v6;
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
      id v4 = [(HKConditionRecord *)self clinicalStatusCodingCollection];
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
      id v4 = [(HKConditionRecord *)self verificationStatusCodingCollection];
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

- (HKConcept)severity
{
  if (self->_severityCodingCollection)
  {
    severity = self->_severity;
    if (severity)
    {
      uint64_t v3 = severity;
    }
    else
    {
      id v4 = [(HKConditionRecord *)self severityCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setSeverity:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  severity = self->_severity;
  self->_severity = v4;

  MEMORY[0x1F41817F8](v4, severity);
}

- (NSArray)bodySites
{
  if (self->_bodySitesCodingCollections)
  {
    bodySites = self->_bodySites;
    if (bodySites)
    {
      uint64_t v3 = bodySites;
    }
    else
    {
      id v4 = [(HKConditionRecord *)self bodySitesCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_130_0);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __30__HKConditionRecord_bodySites__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setBodySites:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  bodySites = self->_bodySites;
  self->_bodySites = v4;

  MEMORY[0x1F41817F8](v4, bodySites);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKConditionRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_conditionCodingCollection)
    {
      if (self->_categoriesCodingCollections)
      {
        id v8 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: categoriesCodingCollections must not be nil";
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: conditionCodingCollection must not be nil";
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
  objc_storeStrong((id *)&self->_bodySites, 0);
  objc_storeStrong((id *)&self->_severity, 0);
  objc_storeStrong((id *)&self->_verificationStatus, 0);
  objc_storeStrong((id *)&self->_clinicalStatus, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_bodySitesCodingCollections, 0);
  objc_storeStrong((id *)&self->_severityCodingCollection, 0);
  objc_storeStrong((id *)&self->_verificationStatusCoding, 0);
  objc_storeStrong((id *)&self->_clinicalStatusCoding, 0);
  objc_storeStrong((id *)&self->_recordedDate, 0);
  objc_storeStrong((id *)&self->_onset, 0);
  objc_storeStrong((id *)&self->_abatement, 0);
  objc_storeStrong((id *)&self->_asserter, 0);
  objc_storeStrong((id *)&self->_categoriesCodingCollections, 0);

  objc_storeStrong((id *)&self->_conditionCodingCollection, 0);
}

- (void)_setCondition:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property condition for record type HKConditionRecord.", v1, 2u);
}

- (void)_setCategories:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property categories for record type HKConditionRecord.", v1, 2u);
}

@end