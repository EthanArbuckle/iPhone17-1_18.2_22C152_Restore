@interface HKProcedureRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newProcedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 procedureCodingCollection:(id)a15 performers:(id)a16 executionStartDate:(id)a17 executionEndDate:(id)a18 notPerformed:(BOOL)a19 statusCoding:(id)a20 categoryCodingCollection:(id)a21 reasonCodingCollections:(id)a22 reasonsNotPerformedCodingCollections:(id)a23 outcomeCodingCollection:(id)a24 complicationsCodingCollections:(id)a25 followUpsCodingCollections:(id)a26 bodySitesCodingCollections:(id)a27 config:(id)a28;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
+ (id)procedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 procedureCodingCollection:(id)a14 performers:(id)a15 executionStartDate:(id)a16 executionEndDate:(id)a17 notPerformed:(BOOL)a18 statusCoding:(id)a19 categoryCodingCollection:(id)a20 reasonCodingCollections:(id)a21 reasonsNotPerformedCodingCollections:(id)a22 outcomeCodingCollection:(id)a23 complicationsCodingCollections:(id)a24 followUpsCodingCollections:(id)a25 bodySitesCodingCollections:(id)a26;
+ (id)procedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 procedureCodingCollection:(id)a15 performers:(id)a16 executionStartDate:(id)a17 executionEndDate:(id)a18 notPerformed:(BOOL)a19 statusCoding:(id)a20 categoryCodingCollection:(id)a21 reasonCodingCollections:(id)a22 reasonsNotPerformedCodingCollections:(id)a23 outcomeCodingCollection:(id)a24 complicationsCodingCollections:(id)a25 followUpsCodingCollections:(id)a26 bodySitesCodingCollections:(id)a27;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)notPerformed;
- (HKConcept)category;
- (HKConcept)outcome;
- (HKConcept)procedure;
- (HKConcept)status;
- (HKMedicalCoding)statusCoding;
- (HKMedicalCodingCollection)categoryCodingCollection;
- (HKMedicalCodingCollection)outcomeCodingCollection;
- (HKMedicalCodingCollection)procedureCodingCollection;
- (HKMedicalDate)executionEndDate;
- (HKMedicalDate)executionStartDate;
- (HKProcedureRecord)init;
- (HKProcedureRecord)initWithCoder:(id)a3;
- (NSArray)bodySites;
- (NSArray)bodySitesCodingCollections;
- (NSArray)complications;
- (NSArray)complicationsCodingCollections;
- (NSArray)followUps;
- (NSArray)followUpsCodingCollections;
- (NSArray)performers;
- (NSArray)reason;
- (NSArray)reasonCodingCollections;
- (NSArray)reasonsNotPerformed;
- (NSArray)reasonsNotPerformedCodingCollections;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)medicalRecordCodings;
- (id)statusCodingCollection;
- (int64_t)recordCategoryType;
- (void)_setBodySites:(id)a3;
- (void)_setBodySitesCodingCollections:(id)a3;
- (void)_setCategory:(id)a3;
- (void)_setCategoryCodingCollection:(id)a3;
- (void)_setComplications:(id)a3;
- (void)_setComplicationsCodingCollections:(id)a3;
- (void)_setExecutionEndDate:(id)a3;
- (void)_setExecutionStartDate:(id)a3;
- (void)_setFollowUps:(id)a3;
- (void)_setFollowUpsCodingCollections:(id)a3;
- (void)_setNotPerformed:(BOOL)a3;
- (void)_setOutcome:(id)a3;
- (void)_setOutcomeCodingCollection:(id)a3;
- (void)_setPerformers:(id)a3;
- (void)_setProcedure:(id)a3;
- (void)_setProcedureCodingCollection:(id)a3;
- (void)_setReason:(id)a3;
- (void)_setReasonCodingCollections:(id)a3;
- (void)_setReasonsNotPerformed:(id)a3;
- (void)_setReasonsNotPerformedCodingCollections:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKProcedureRecord

- (id)medicalRecordCodings
{
  v2 = [(HKProcedureRecord *)self procedureCodingCollection];
  v3 = [v2 codings];

  return v3;
}

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_PROCEDURE" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

- (int64_t)recordCategoryType
{
  return 5;
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKProcedureRecord;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"procedure"];
  [v3 addObject:@"status"];
  [v3 addObject:@"category"];
  [v3 addObject:@"reason"];
  [v3 addObject:@"reasonsNotPerformed"];
  [v3 addObject:@"outcome"];
  [v3 addObject:@"complications"];
  [v3 addObject:@"followUps"];
  [v3 addObject:@"bodySites"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKProcedureRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_10;
  }
  if ([v7 isEqualToString:@"procedure"])
  {
    v9 = [(HKProcedureRecord *)self procedureCodingCollection];
    v10 = +[HKIndexableObject indexableObjectWithObject:v9];
    v28[0] = v10;
    v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = (void **)v28;
LABEL_4:
    v13 = [v11 arrayWithObjects:v12 count:1];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"status"])
  {
    v9 = [(HKProcedureRecord *)self statusCoding];
    v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
    v14 = +[HKIndexableObject indexableObjectWithObject:v10];
    v27 = v14;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];

    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"category"])
  {
    v16 = [(HKProcedureRecord *)self categoryCodingCollection];

    if (v16)
    {
      v9 = [(HKProcedureRecord *)self categoryCodingCollection];
      v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      v26 = v10;
      v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v26;
      goto LABEL_4;
    }
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"reason"])
  {
    v17 = [(HKProcedureRecord *)self reasonCodingCollections];

    if (v17)
    {
      uint64_t v18 = [(HKProcedureRecord *)self reasonCodingCollections];
LABEL_22:
      v9 = (void *)v18;
      v13 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v18 context:v6 error:a4];
      goto LABEL_9;
    }
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"reasonsNotPerformed"])
  {
    v19 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];

    if (v19)
    {
      uint64_t v18 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];
      goto LABEL_22;
    }
LABEL_35:
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  if ([v8 isEqualToString:@"outcome"])
  {
    v20 = [(HKProcedureRecord *)self outcomeCodingCollection];

    if (v20)
    {
      v9 = [(HKProcedureRecord *)self outcomeCodingCollection];
      v10 = +[HKIndexableObject indexableObjectWithObject:v9];
      v25 = v10;
      v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v25;
      goto LABEL_4;
    }
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"complications"])
  {
    v21 = [(HKProcedureRecord *)self complicationsCodingCollections];

    if (v21)
    {
      uint64_t v18 = [(HKProcedureRecord *)self complicationsCodingCollections];
      goto LABEL_22;
    }
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"followUps"])
  {
    v22 = [(HKProcedureRecord *)self followUpsCodingCollections];

    if (v22)
    {
      uint64_t v18 = [(HKProcedureRecord *)self followUpsCodingCollections];
      goto LABEL_22;
    }
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"bodySites"])
  {
    v23 = [(HKProcedureRecord *)self bodySitesCodingCollections];

    if (v23)
    {
      uint64_t v18 = [(HKProcedureRecord *)self bodySitesCodingCollections];
      goto LABEL_22;
    }
    goto LABEL_35;
  }
  v24.receiver = self;
  v24.super_class = (Class)HKProcedureRecord;
  v13 = [(HKMedicalRecord *)&v24 codingsForKeyPath:v6 error:a4];
LABEL_10:

  return v13;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    LOBYTE(a5) = 0;
    goto LABEL_13;
  }
  if ([v10 isEqualToString:@"procedure"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKProcedureRecord *)self _setProcedure:v12];
LABEL_12:

      LOBYTE(a5) = 1;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if ([v11 isEqualToString:@"status"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKProcedureRecord *)self _setStatus:v12];
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (![v11 isEqualToString:@"category"])
  {
    if ([v11 isEqualToString:@"reason"])
    {
      v16 = [(HKProcedureRecord *)self reasonCodingCollections];

      if (v16)
      {
        v17 = [(HKProcedureRecord *)self reasonCodingCollections];
        uint64_t v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v17 count], v9, a5);

        LOBYTE(a5) = v18 != 0;
        if (v18) {
          [(HKProcedureRecord *)self _setReason:v18];
        }
LABEL_22:

        goto LABEL_13;
      }
    }
    else if ([v11 isEqualToString:@"reasonsNotPerformed"])
    {
      v19 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];

      if (v19)
      {
        v20 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];
        uint64_t v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v20 count], v9, a5);

        LOBYTE(a5) = v18 != 0;
        if (v18) {
          [(HKProcedureRecord *)self _setReasonsNotPerformed:v18];
        }
        goto LABEL_22;
      }
    }
    else
    {
      if ([v11 isEqualToString:@"outcome"])
      {
        uint64_t v21 = [v8 count];
        v22 = [(HKProcedureRecord *)self outcomeCodingCollection];
        LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v21, v22 != 0, (uint64_t)v9, (uint64_t)a5);

        if (!a5) {
          goto LABEL_13;
        }
        a5 = [v8 firstObject];
        v12 = [a5 object];
        [(HKProcedureRecord *)self _setOutcome:v12];
        goto LABEL_12;
      }
      if ([v11 isEqualToString:@"complications"])
      {
        v23 = [(HKProcedureRecord *)self complicationsCodingCollections];

        if (v23)
        {
          objc_super v24 = [(HKProcedureRecord *)self complicationsCodingCollections];
          uint64_t v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v24 count], v9, a5);

          LOBYTE(a5) = v18 != 0;
          if (v18) {
            [(HKProcedureRecord *)self _setComplications:v18];
          }
          goto LABEL_22;
        }
      }
      else if ([v11 isEqualToString:@"followUps"])
      {
        v25 = [(HKProcedureRecord *)self followUpsCodingCollections];

        if (v25)
        {
          v26 = [(HKProcedureRecord *)self followUpsCodingCollections];
          uint64_t v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v26 count], v9, a5);

          LOBYTE(a5) = v18 != 0;
          if (v18) {
            [(HKProcedureRecord *)self _setFollowUps:v18];
          }
          goto LABEL_22;
        }
      }
      else
      {
        if (![v11 isEqualToString:@"bodySites"])
        {
          v30.receiver = self;
          v30.super_class = (Class)HKProcedureRecord;
          BOOL v29 = [(HKMedicalRecord *)&v30 applyConcepts:v8 forKeyPath:v9 error:a5];
          goto LABEL_39;
        }
        v27 = [(HKProcedureRecord *)self bodySitesCodingCollections];

        if (v27)
        {
          v28 = [(HKProcedureRecord *)self bodySitesCodingCollections];
          uint64_t v18 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v28 count], v9, a5);

          LOBYTE(a5) = v18 != 0;
          if (v18) {
            [(HKProcedureRecord *)self _setBodySites:v18];
          }
          goto LABEL_22;
        }
      }
    }
    BOOL v29 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
LABEL_39:
    LOBYTE(a5) = v29;
    goto LABEL_13;
  }
  uint64_t v13 = [v8 count];
  v14 = [(HKProcedureRecord *)self categoryCodingCollection];
  LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v13, v14 != 0, (uint64_t)v9, (uint64_t)a5);

  if (a5)
  {
    a5 = [v8 firstObject];
    v12 = [a5 object];
    [(HKProcedureRecord *)self _setCategory:v12];
    goto LABEL_12;
  }
LABEL_13:

  return (char)a5;
}

+ (id)procedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 procedureCodingCollection:(id)a14 performers:(id)a15 executionStartDate:(id)a16 executionEndDate:(id)a17 notPerformed:(BOOL)a18 statusCoding:(id)a19 categoryCodingCollection:(id)a20 reasonCodingCollections:(id)a21 reasonsNotPerformedCodingCollections:(id)a22 outcomeCodingCollection:(id)a23 complicationsCodingCollections:(id)a24 followUpsCodingCollections:(id)a25 bodySitesCodingCollections:(id)a26
{
  BOOL v51 = a5;
  id v61 = a3;
  id v60 = a4;
  id v30 = a6;
  id v59 = a7;
  id v54 = a8;
  id v58 = a10;
  id v57 = a11;
  id v53 = a12;
  id v56 = a14;
  id v55 = a15;
  id v31 = a16;
  id v32 = a17;
  id v50 = a19;
  id v49 = a20;
  id v33 = a21;
  id v48 = a22;
  id v34 = a23;
  id v47 = a24;
  id v35 = a25;
  id v46 = a26;
  v36 = @"modifiedDate";
  id v37 = v30;
  v38 = v37;
  if (v32)
  {
    v39 = @"executionEndDate";

    v40 = [v32 dateForUTC];

    v36 = v39;
  }
  else
  {
    v40 = v37;
  }
  if (v31)
  {
    v41 = @"executionStartDate";

    uint64_t v42 = [v31 dateForUTC];

    v40 = (void *)v42;
    v36 = v41;
  }
  v43 = +[HKSemanticDate semanticDateWithKeyPath:v36 date:v40];
  LOBYTE(v45) = a18;
  +[HKProcedureRecord procedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:](HKProcedureRecord, "procedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:", v61, v60, v51, v38, v59, v54, a9, v58, v57, v43, v53, a13, v56, v55,
    v31,
    v32,
    v45,
    v50,
    v49,
    v33,
    v48,
    v34,
    v47,
    v35,
  v52 = v46);

  return v52;
}

+ (id)procedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 procedureCodingCollection:(id)a15 performers:(id)a16 executionStartDate:(id)a17 executionEndDate:(id)a18 notPerformed:(BOOL)a19 statusCoding:(id)a20 categoryCodingCollection:(id)a21 reasonCodingCollections:(id)a22 reasonsNotPerformedCodingCollections:(id)a23 outcomeCodingCollection:(id)a24 complicationsCodingCollections:(id)a25 followUpsCodingCollections:(id)a26 bodySitesCodingCollections:(id)a27
{
  LOBYTE(v29) = a19;
  v27 = objc_msgSend(a1, "_newProcedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                  a16,
                  a17,
                  a18,
                  v29,
                  a20,
                  a21,
                  a22,
                  a23,
                  a24,
                  a25,
                  a26,
                  a27,
                  0);

  return v27;
}

+ (id)_newProcedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 procedureCodingCollection:(id)a15 performers:(id)a16 executionStartDate:(id)a17 executionEndDate:(id)a18 notPerformed:(BOOL)a19 statusCoding:(id)a20 categoryCodingCollection:(id)a21 reasonCodingCollections:(id)a22 reasonsNotPerformedCodingCollections:(id)a23 outcomeCodingCollection:(id)a24 complicationsCodingCollections:(id)a25 followUpsCodingCollections:(id)a26 bodySitesCodingCollections:(id)a27 config:(id)a28
{
  BOOL v67 = a5;
  id v71 = a15;
  id v69 = a16;
  id v54 = a17;
  id v28 = a18;
  id v29 = a20;
  id v30 = a21;
  id v31 = a22;
  id v60 = a23;
  id v32 = a24;
  id v33 = a25;
  id v34 = a26;
  id v35 = a27;
  id v36 = a28;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __464__HKProcedureRecord__newProcedureRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_procedureCodingCollection_performers_executionStartDate_executionEndDate_notPerformed_statusCoding_categoryCodingCollection_reasonCodingCollections_reasonsNotPerformedCodingCollections_outcomeCodingCollection_complicationsCodingCollections_followUpsCodingCollections_bodySitesCodingCollections_config___block_invoke;
  aBlock[3] = &unk_1E58C92D8;
  id v75 = v71;
  id v76 = v69;
  id v77 = v54;
  id v78 = v28;
  BOOL v88 = a19;
  id v79 = v29;
  id v80 = v30;
  id v81 = v31;
  id v82 = v60;
  id v83 = v32;
  id v84 = v33;
  id v85 = v34;
  id v86 = v35;
  id v87 = v36;
  id v66 = v36;
  id v65 = v35;
  id v64 = v34;
  id v63 = v33;
  id v62 = v32;
  id v61 = v60;
  id v59 = v31;
  id v58 = v30;
  id v57 = v29;
  id v56 = v28;
  id v55 = v54;
  id v70 = v69;
  id v72 = v71;
  id v37 = a13;
  id v38 = a12;
  id v39 = a11;
  id v40 = a10;
  id v41 = a8;
  id v42 = a7;
  id v43 = a6;
  id v44 = a4;
  id v45 = a3;
  id v46 = _Block_copy(aBlock);
  v73.receiver = a1;
  v73.super_class = (Class)&OBJC_METACLASS___HKProcedureRecord;
  id v68 = objc_msgSendSuper2(&v73, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v45, v44, v67, v43, v42, v41, a9, v40, v39, v38, v37, a14, v46);

  return v68;
}

void __464__HKProcedureRecord__newProcedureRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_procedureCodingCollection_performers_executionStartDate_executionEndDate_notPerformed_statusCoding_categoryCodingCollection_reasonCodingCollections_reasonsNotPerformedCodingCollections_outcomeCodingCollection_complicationsCodingCollections_followUpsCodingCollections_bodySitesCodingCollections_config___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  objc_super v4 = (void *)v28[22];
  v28[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  id v6 = (void *)v28[23];
  v28[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  id v8 = (void *)v28[24];
  v28[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v28[25];
  v28[25] = v9;

  *((unsigned char *)v28 + 208) = *(unsigned char *)(a1 + 136);
  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v28[27];
  v28[27] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v28[28];
  v28[28] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v28[29];
  v28[29] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  uint64_t v18 = (void *)v28[30];
  v28[30] = v17;

  uint64_t v19 = [*(id *)(a1 + 96) copy];
  v20 = (void *)v28[31];
  v28[31] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  v22 = (void *)v28[32];
  v28[32] = v21;

  uint64_t v23 = [*(id *)(a1 + 112) copy];
  objc_super v24 = (void *)v28[33];
  v28[33] = v23;

  uint64_t v25 = [*(id *)(a1 + 120) copy];
  v26 = (void *)v28[34];
  v28[34] = v25;

  uint64_t v27 = *(void *)(a1 + 128);
  if (v27) {
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
  }
}

- (HKProcedureRecord)init
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
  v9.super_class = (Class)HKProcedureRecord;
  id v6 = [(HKSample *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p super=%@procedureCodingCollection = %@performers = %@executionStartDate = %@executionEndDate = %@notPerformed = %ldstatusCoding = %@categoryCodingCollection = %@reasonCodingCollections = %@reasonsNotPerformedCodingCollections = %@outcomeCodingCollection = %@complicationsCodingCollections = %@followUpsCodingCollections = %@bodySitesCodingCollections = %@>", v5, self, v6, self->_procedureCodingCollection, self->_performers, self->_executionStartDate, self->_executionEndDate, self->_notPerformed, self->_statusCoding, self->_categoryCodingCollection, self->_reasonCodingCollections, self->_reasonsNotPerformedCodingCollections, self->_outcomeCodingCollection, self->_complicationsCodingCollections, self->_followUpsCodingCollections, self->_bodySitesCodingCollections];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKProcedureRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_procedureCodingCollection, @"ProcedureCodingCollection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_performers forKey:@"Performers"];
  [v4 encodeObject:self->_executionStartDate forKey:@"ExecutionStartDate"];
  [v4 encodeObject:self->_executionEndDate forKey:@"ExecutionEndDate"];
  [v4 encodeBool:self->_notPerformed forKey:@"NotPerformed"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeObject:self->_categoryCodingCollection forKey:@"CategoryCodingCollection"];
  [v4 encodeObject:self->_reasonCodingCollections forKey:@"ReasonCodingCollections"];
  [v4 encodeObject:self->_reasonsNotPerformedCodingCollections forKey:@"ReasonsNotPerformedCodingCollections"];
  [v4 encodeObject:self->_outcomeCodingCollection forKey:@"OutcomeCodingCollection"];
  [v4 encodeObject:self->_complicationsCodingCollections forKey:@"ComplicationsCodingCollections"];
  [v4 encodeObject:self->_followUpsCodingCollections forKey:@"FollowUpsCodingCollections"];
  [v4 encodeObject:self->_bodySitesCodingCollections forKey:@"BodySitesCodingCollections"];
  [v4 encodeObject:self->_procedure forKey:@"Procedure"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_category forKey:@"Category"];
  [v4 encodeObject:self->_reason forKey:@"Reason"];
  [v4 encodeObject:self->_reasonsNotPerformed forKey:@"ReasonsNotPerformed"];
  [v4 encodeObject:self->_outcome forKey:@"Outcome"];
  [v4 encodeObject:self->_complications forKey:@"Complications"];
  [v4 encodeObject:self->_followUps forKey:@"FollowUps"];
  [v4 encodeObject:self->_bodySites forKey:@"BodySites"];
}

- (HKProcedureRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)HKProcedureRecord;
  objc_super v5 = [(HKMedicalRecord *)&v60 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProcedureCodingCollection"];
    procedureCodingCollection = v5->_procedureCodingCollection;
    v5->_procedureCodingCollection = (HKMedicalCodingCollection *)v6;

    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Performers"];
    performers = v5->_performers;
    v5->_performers = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExecutionStartDate"];
    executionStartDate = v5->_executionStartDate;
    v5->_executionStartDate = (HKMedicalDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExecutionEndDate"];
    executionEndDate = v5->_executionEndDate;
    v5->_executionEndDate = (HKMedicalDate *)v13;

    v5->_notPerformed = [v4 decodeBoolForKey:@"NotPerformed"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CategoryCodingCollection"];
    categoryCodingCollection = v5->_categoryCodingCollection;
    v5->_categoryCodingCollection = (HKMedicalCodingCollection *)v17;

    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"ReasonCodingCollections"];
    reasonCodingCollections = v5->_reasonCodingCollections;
    v5->_reasonCodingCollections = (NSArray *)v20;

    v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"ReasonsNotPerformedCodingCollections"];
    reasonsNotPerformedCodingCollections = v5->_reasonsNotPerformedCodingCollections;
    v5->_reasonsNotPerformedCodingCollections = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OutcomeCodingCollection"];
    outcomeCodingCollection = v5->_outcomeCodingCollection;
    v5->_outcomeCodingCollection = (HKMedicalCodingCollection *)v25;

    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"ComplicationsCodingCollections"];
    complicationsCodingCollections = v5->_complicationsCodingCollections;
    v5->_complicationsCodingCollections = (NSArray *)v28;

    id v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"FollowUpsCodingCollections"];
    followUpsCodingCollections = v5->_followUpsCodingCollections;
    v5->_followUpsCodingCollections = (NSArray *)v31;

    id v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"BodySitesCodingCollections"];
    bodySitesCodingCollections = v5->_bodySitesCodingCollections;
    v5->_bodySitesCodingCollections = (NSArray *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Procedure"];
    procedure = v5->_procedure;
    v5->_procedure = (HKConcept *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Category"];
    category = v5->_category;
    v5->_category = (HKConcept *)v40;

    id v42 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"Reason"];
    reason = v5->_reason;
    v5->_reason = (NSArray *)v43;

    id v45 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"ReasonsNotPerformed"];
    reasonsNotPerformed = v5->_reasonsNotPerformed;
    v5->_reasonsNotPerformed = (NSArray *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Outcome"];
    outcome = v5->_outcome;
    v5->_outcome = (HKConcept *)v48;

    id v50 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"Complications"];
    complications = v5->_complications;
    v5->_complications = (NSArray *)v51;

    id v53 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"FollowUps"];
    followUps = v5->_followUps;
    v5->_followUps = (NSArray *)v54;

    id v56 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v57 = [v4 decodeObjectOfClasses:v56 forKey:@"BodySites"];
    bodySites = v5->_bodySites;
    v5->_bodySites = (NSArray *)v57;
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
    v137.receiver = self;
    v137.super_class = (Class)HKProcedureRecord;
    if (![(HKMedicalRecord *)&v137 isEquivalent:v5]) {
      goto LABEL_110;
    }
    uint64_t v6 = [(HKProcedureRecord *)self procedureCodingCollection];
    uint64_t v7 = [v5 procedureCodingCollection];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 procedureCodingCollection];
      if (!v9) {
        goto LABEL_109;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKProcedureRecord *)self procedureCodingCollection];
      v12 = [v5 procedureCodingCollection];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self performers];
    uint64_t v15 = [v5 performers];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      id v8 = (void *)v15;
      uint64_t v16 = [v5 performers];
      if (!v16) {
        goto LABEL_109;
      }
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(HKProcedureRecord *)self performers];
      uint64_t v19 = [v5 performers];
      int v20 = [v18 isEqualToArray:v19];

      if (!v20) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self executionStartDate];
    uint64_t v21 = [v5 executionStartDate];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      id v8 = (void *)v21;
      uint64_t v22 = [v5 executionStartDate];
      if (!v22) {
        goto LABEL_109;
      }
      uint64_t v23 = (void *)v22;
      objc_super v24 = [(HKProcedureRecord *)self executionStartDate];
      uint64_t v25 = [v5 executionStartDate];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self executionEndDate];
    uint64_t v27 = [v5 executionEndDate];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      id v8 = (void *)v27;
      uint64_t v28 = [v5 executionEndDate];
      if (!v28) {
        goto LABEL_109;
      }
      id v29 = (void *)v28;
      id v30 = [(HKProcedureRecord *)self executionEndDate];
      uint64_t v31 = [v5 executionEndDate];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_110;
      }
    }
    int v33 = [(HKProcedureRecord *)self notPerformed];
    if (v33 != [v5 notPerformed]) {
      goto LABEL_110;
    }
    uint64_t v6 = [(HKProcedureRecord *)self statusCoding];
    uint64_t v34 = [v5 statusCoding];
    if (v6 == (void *)v34)
    {
    }
    else
    {
      id v8 = (void *)v34;
      uint64_t v35 = [v5 statusCoding];
      if (!v35) {
        goto LABEL_109;
      }
      uint64_t v36 = (void *)v35;
      id v37 = [(HKProcedureRecord *)self statusCoding];
      uint64_t v38 = [v5 statusCoding];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self categoryCodingCollection];
    uint64_t v40 = [v5 categoryCodingCollection];
    if (v6 == (void *)v40)
    {
    }
    else
    {
      id v8 = (void *)v40;
      uint64_t v41 = [v5 categoryCodingCollection];
      if (!v41) {
        goto LABEL_109;
      }
      id v42 = (void *)v41;
      uint64_t v43 = [(HKProcedureRecord *)self categoryCodingCollection];
      id v44 = [v5 categoryCodingCollection];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self reasonCodingCollections];
    uint64_t v46 = [v5 reasonCodingCollections];
    if (v6 == (void *)v46)
    {
    }
    else
    {
      id v8 = (void *)v46;
      uint64_t v47 = [v5 reasonCodingCollections];
      if (!v47) {
        goto LABEL_109;
      }
      uint64_t v48 = (void *)v47;
      id v49 = [(HKProcedureRecord *)self reasonCodingCollections];
      id v50 = [v5 reasonCodingCollections];
      int v51 = [v49 isEqualToArray:v50];

      if (!v51) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];
    uint64_t v52 = [v5 reasonsNotPerformedCodingCollections];
    if (v6 == (void *)v52)
    {
    }
    else
    {
      id v8 = (void *)v52;
      uint64_t v53 = [v5 reasonsNotPerformedCodingCollections];
      if (!v53) {
        goto LABEL_109;
      }
      uint64_t v54 = (void *)v53;
      id v55 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];
      id v56 = [v5 reasonsNotPerformedCodingCollections];
      int v57 = [v55 isEqualToArray:v56];

      if (!v57) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self outcomeCodingCollection];
    uint64_t v58 = [v5 outcomeCodingCollection];
    if (v6 == (void *)v58)
    {
    }
    else
    {
      id v8 = (void *)v58;
      uint64_t v59 = [v5 outcomeCodingCollection];
      if (!v59) {
        goto LABEL_109;
      }
      objc_super v60 = (void *)v59;
      id v61 = [(HKProcedureRecord *)self outcomeCodingCollection];
      id v62 = [v5 outcomeCodingCollection];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self complicationsCodingCollections];
    uint64_t v64 = [v5 complicationsCodingCollections];
    if (v6 == (void *)v64)
    {
    }
    else
    {
      id v8 = (void *)v64;
      uint64_t v65 = [v5 complicationsCodingCollections];
      if (!v65) {
        goto LABEL_109;
      }
      id v66 = (void *)v65;
      BOOL v67 = [(HKProcedureRecord *)self complicationsCodingCollections];
      id v68 = [v5 complicationsCodingCollections];
      int v69 = [v67 isEqualToArray:v68];

      if (!v69) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self followUpsCodingCollections];
    uint64_t v70 = [v5 followUpsCodingCollections];
    if (v6 == (void *)v70)
    {
    }
    else
    {
      id v8 = (void *)v70;
      uint64_t v71 = [v5 followUpsCodingCollections];
      if (!v71) {
        goto LABEL_109;
      }
      id v72 = (void *)v71;
      objc_super v73 = [(HKProcedureRecord *)self followUpsCodingCollections];
      v74 = [v5 followUpsCodingCollections];
      int v75 = [v73 isEqualToArray:v74];

      if (!v75) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self bodySitesCodingCollections];
    uint64_t v76 = [v5 bodySitesCodingCollections];
    if (v6 == (void *)v76)
    {
    }
    else
    {
      id v8 = (void *)v76;
      uint64_t v77 = [v5 bodySitesCodingCollections];
      if (!v77) {
        goto LABEL_109;
      }
      id v78 = (void *)v77;
      id v79 = [(HKProcedureRecord *)self bodySitesCodingCollections];
      id v80 = [v5 bodySitesCodingCollections];
      int v81 = [v79 isEqualToArray:v80];

      if (!v81) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self procedure];
    uint64_t v82 = [v5 procedure];
    if (v6 == (void *)v82)
    {
    }
    else
    {
      id v8 = (void *)v82;
      uint64_t v83 = [v5 procedure];
      if (!v83) {
        goto LABEL_109;
      }
      id v84 = (void *)v83;
      id v85 = [(HKProcedureRecord *)self procedure];
      id v86 = [v5 procedure];
      int v87 = [v85 isEqual:v86];

      if (!v87) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self status];
    uint64_t v88 = [v5 status];
    if (v6 == (void *)v88)
    {
    }
    else
    {
      id v8 = (void *)v88;
      uint64_t v89 = [v5 status];
      if (!v89) {
        goto LABEL_109;
      }
      v90 = (void *)v89;
      v91 = [(HKProcedureRecord *)self status];
      v92 = [v5 status];
      int v93 = [v91 isEqual:v92];

      if (!v93) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self category];
    uint64_t v94 = [v5 category];
    if (v6 == (void *)v94)
    {
    }
    else
    {
      id v8 = (void *)v94;
      uint64_t v95 = [v5 category];
      if (!v95) {
        goto LABEL_109;
      }
      v96 = (void *)v95;
      v97 = [(HKProcedureRecord *)self category];
      v98 = [v5 category];
      int v99 = [v97 isEqual:v98];

      if (!v99) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self reason];
    uint64_t v100 = [v5 reason];
    if (v6 == (void *)v100)
    {
    }
    else
    {
      id v8 = (void *)v100;
      uint64_t v101 = [v5 reason];
      if (!v101) {
        goto LABEL_109;
      }
      v102 = (void *)v101;
      v103 = [(HKProcedureRecord *)self reason];
      v104 = [v5 reason];
      int v105 = [v103 isEqualToArray:v104];

      if (!v105) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self reasonsNotPerformed];
    uint64_t v106 = [v5 reasonsNotPerformed];
    if (v6 == (void *)v106)
    {
    }
    else
    {
      id v8 = (void *)v106;
      uint64_t v107 = [v5 reasonsNotPerformed];
      if (!v107) {
        goto LABEL_109;
      }
      v108 = (void *)v107;
      v109 = [(HKProcedureRecord *)self reasonsNotPerformed];
      v110 = [v5 reasonsNotPerformed];
      int v111 = [v109 isEqualToArray:v110];

      if (!v111) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self outcome];
    uint64_t v112 = [v5 outcome];
    if (v6 == (void *)v112)
    {
    }
    else
    {
      id v8 = (void *)v112;
      uint64_t v113 = [v5 outcome];
      if (!v113) {
        goto LABEL_109;
      }
      v114 = (void *)v113;
      v115 = [(HKProcedureRecord *)self outcome];
      v116 = [v5 outcome];
      int v117 = [v115 isEqual:v116];

      if (!v117) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self complications];
    uint64_t v118 = [v5 complications];
    if (v6 == (void *)v118)
    {
    }
    else
    {
      id v8 = (void *)v118;
      uint64_t v119 = [v5 complications];
      if (!v119) {
        goto LABEL_109;
      }
      v120 = (void *)v119;
      v121 = [(HKProcedureRecord *)self complications];
      v122 = [v5 complications];
      int v123 = [v121 isEqualToArray:v122];

      if (!v123) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self followUps];
    uint64_t v124 = [v5 followUps];
    if (v6 == (void *)v124)
    {
    }
    else
    {
      id v8 = (void *)v124;
      uint64_t v125 = [v5 followUps];
      if (!v125) {
        goto LABEL_109;
      }
      v126 = (void *)v125;
      v127 = [(HKProcedureRecord *)self followUps];
      v128 = [v5 followUps];
      int v129 = [v127 isEqualToArray:v128];

      if (!v129) {
        goto LABEL_110;
      }
    }
    uint64_t v6 = [(HKProcedureRecord *)self bodySites];
    uint64_t v130 = [v5 bodySites];
    if (v6 == (void *)v130)
    {

LABEL_114:
      BOOL v14 = 1;
      goto LABEL_111;
    }
    id v8 = (void *)v130;
    uint64_t v131 = [v5 bodySites];
    if (v131)
    {
      v132 = (void *)v131;
      v133 = [(HKProcedureRecord *)self bodySites];
      v134 = [v5 bodySites];
      char v135 = [v133 isEqualToArray:v134];

      if (v135) {
        goto LABEL_114;
      }
LABEL_110:
      BOOL v14 = 0;
LABEL_111:

      goto LABEL_112;
    }
LABEL_109:

    goto LABEL_110;
  }
  BOOL v14 = 0;
LABEL_112:

  return v14;
}

- (id)statusCodingCollection
{
  v2 = [(HKProcedureRecord *)self statusCoding];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCoding:v2];

  return v3;
}

- (HKMedicalCodingCollection)procedureCodingCollection
{
  return self->_procedureCodingCollection;
}

- (void)_setProcedureCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  procedureCodingCollection = self->_procedureCodingCollection;
  self->_procedureCodingCollection = v4;

  id v8 = [(HKProcedureRecord *)self procedureCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  procedure = self->_procedure;
  self->_procedure = v6;
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)_setPerformers:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  performers = self->_performers;
  self->_performers = v4;

  MEMORY[0x1F41817F8](v4, performers);
}

- (HKMedicalDate)executionStartDate
{
  return self->_executionStartDate;
}

- (void)_setExecutionStartDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  executionStartDate = self->_executionStartDate;
  self->_executionStartDate = v4;

  MEMORY[0x1F41817F8](v4, executionStartDate);
}

- (HKMedicalDate)executionEndDate
{
  return self->_executionEndDate;
}

- (void)_setExecutionEndDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  executionEndDate = self->_executionEndDate;
  self->_executionEndDate = v4;

  MEMORY[0x1F41817F8](v4, executionEndDate);
}

- (BOOL)notPerformed
{
  return self->_notPerformed;
}

- (void)_setNotPerformed:(BOOL)a3
{
  self->_notPerformed = a3;
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

  id v8 = [(HKProcedureRecord *)self statusCodingCollection];
  uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  status = self->_status;
  self->_status = v6;
}

- (HKMedicalCodingCollection)categoryCodingCollection
{
  return self->_categoryCodingCollection;
}

- (void)_setCategoryCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  categoryCodingCollection = self->_categoryCodingCollection;
  self->_categoryCodingCollection = v4;

  if (self->_categoryCodingCollection)
  {
    uint64_t v9 = [(HKProcedureRecord *)self categoryCodingCollection];
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
    uint64_t v9 = [(HKProcedureRecord *)self reasonCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_130];
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

id __49__HKProcedureRecord__setReasonCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (NSArray)reasonsNotPerformedCodingCollections
{
  return self->_reasonsNotPerformedCodingCollections;
}

- (void)_setReasonsNotPerformedCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsNotPerformedCodingCollections = self->_reasonsNotPerformedCodingCollections;
  self->_reasonsNotPerformedCodingCollections = v4;

  if (self->_reasonsNotPerformedCodingCollections)
  {
    uint64_t v9 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_161_0];
    reasonsNotPerformed = self->_reasonsNotPerformed;
    self->_reasonsNotPerformed = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_reasonsNotPerformed;
    self->_reasonsNotPerformed = 0;
  }
}

id __62__HKProcedureRecord__setReasonsNotPerformedCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKMedicalCodingCollection)outcomeCodingCollection
{
  return self->_outcomeCodingCollection;
}

- (void)_setOutcomeCodingCollection:(id)a3
{
  id v4 = (HKMedicalCodingCollection *)[a3 copy];
  outcomeCodingCollection = self->_outcomeCodingCollection;
  self->_outcomeCodingCollection = v4;

  if (self->_outcomeCodingCollection)
  {
    uint64_t v9 = [(HKProcedureRecord *)self outcomeCodingCollection];
    uint64_t v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    outcome = self->_outcome;
    self->_outcome = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_outcome;
    self->_outcome = 0;
  }
}

- (NSArray)complicationsCodingCollections
{
  return self->_complicationsCodingCollections;
}

- (void)_setComplicationsCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  complicationsCodingCollections = self->_complicationsCodingCollections;
  self->_complicationsCodingCollections = v4;

  if (self->_complicationsCodingCollections)
  {
    uint64_t v9 = [(HKProcedureRecord *)self complicationsCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_163];
    complications = self->_complications;
    self->_complications = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_complications;
    self->_complications = 0;
  }
}

id __56__HKProcedureRecord__setComplicationsCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (NSArray)followUpsCodingCollections
{
  return self->_followUpsCodingCollections;
}

- (void)_setFollowUpsCodingCollections:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  followUpsCodingCollections = self->_followUpsCodingCollections;
  self->_followUpsCodingCollections = v4;

  if (self->_followUpsCodingCollections)
  {
    uint64_t v9 = [(HKProcedureRecord *)self followUpsCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_165];
    followUps = self->_followUps;
    self->_followUps = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_followUps;
    self->_followUps = 0;
  }
}

id __52__HKProcedureRecord__setFollowUpsCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
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
    uint64_t v9 = [(HKProcedureRecord *)self bodySitesCodingCollections];
    uint64_t v6 = [(NSArray *)v9 hk_map:&__block_literal_global_167];
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

id __52__HKProcedureRecord__setBodySitesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKConcept)procedure
{
  procedure = self->_procedure;
  if (procedure)
  {
    uint64_t v3 = procedure;
  }
  else
  {
    id v4 = [(HKProcedureRecord *)self procedureCodingCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setProcedure:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKProcedureRecord _setProcedure:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  procedure = self->_procedure;
  self->_procedure = v6;
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
    id v4 = [(HKProcedureRecord *)self statusCodingCollection];
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
      -[HKProcedureRecord _setStatus:](v5);
    }
  }
  uint64_t v6 = (HKConcept *)[v4 copy];
  status = self->_status;
  self->_status = v6;
}

- (HKConcept)category
{
  if (self->_categoryCodingCollection)
  {
    category = self->_category;
    if (category)
    {
      uint64_t v3 = category;
    }
    else
    {
      id v4 = [(HKProcedureRecord *)self categoryCodingCollection];
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
      id v4 = [(HKProcedureRecord *)self reasonCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_169);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __27__HKProcedureRecord_reason__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReason:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reason = self->_reason;
  self->_reason = v4;

  MEMORY[0x1F41817F8](v4, reason);
}

- (NSArray)reasonsNotPerformed
{
  if (self->_reasonsNotPerformedCodingCollections)
  {
    reasonsNotPerformed = self->_reasonsNotPerformed;
    if (reasonsNotPerformed)
    {
      uint64_t v3 = reasonsNotPerformed;
    }
    else
    {
      id v4 = [(HKProcedureRecord *)self reasonsNotPerformedCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_171);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __40__HKProcedureRecord_reasonsNotPerformed__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReasonsNotPerformed:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsNotPerformed = self->_reasonsNotPerformed;
  self->_reasonsNotPerformed = v4;

  MEMORY[0x1F41817F8](v4, reasonsNotPerformed);
}

- (HKConcept)outcome
{
  if (self->_outcomeCodingCollection)
  {
    outcome = self->_outcome;
    if (outcome)
    {
      uint64_t v3 = outcome;
    }
    else
    {
      id v4 = [(HKProcedureRecord *)self outcomeCodingCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setOutcome:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  outcome = self->_outcome;
  self->_outcome = v4;

  MEMORY[0x1F41817F8](v4, outcome);
}

- (NSArray)complications
{
  if (self->_complicationsCodingCollections)
  {
    complications = self->_complications;
    if (complications)
    {
      uint64_t v3 = complications;
    }
    else
    {
      id v4 = [(HKProcedureRecord *)self complicationsCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_173);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __34__HKProcedureRecord_complications__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setComplications:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  complications = self->_complications;
  self->_complications = v4;

  MEMORY[0x1F41817F8](v4, complications);
}

- (NSArray)followUps
{
  if (self->_followUpsCodingCollections)
  {
    followUps = self->_followUps;
    if (followUps)
    {
      uint64_t v3 = followUps;
    }
    else
    {
      id v4 = [(HKProcedureRecord *)self followUpsCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_175);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __30__HKProcedureRecord_followUps__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setFollowUps:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  followUps = self->_followUps;
  self->_followUps = v4;

  MEMORY[0x1F41817F8](v4, followUps);
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
      id v4 = [(HKProcedureRecord *)self bodySitesCodingCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_177);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __30__HKProcedureRecord_bodySites__block_invoke(uint64_t a1, uint64_t a2)
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
  v13.super_class = (Class)HKProcedureRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_procedureCodingCollection)
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
      uint64_t v11 = @"%@: procedureCodingCollection must not be nil";
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
  objc_storeStrong((id *)&self->_followUps, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_reasonsNotPerformed, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_procedure, 0);
  objc_storeStrong((id *)&self->_bodySitesCodingCollections, 0);
  objc_storeStrong((id *)&self->_followUpsCodingCollections, 0);
  objc_storeStrong((id *)&self->_complicationsCodingCollections, 0);
  objc_storeStrong((id *)&self->_outcomeCodingCollection, 0);
  objc_storeStrong((id *)&self->_reasonsNotPerformedCodingCollections, 0);
  objc_storeStrong((id *)&self->_reasonCodingCollections, 0);
  objc_storeStrong((id *)&self->_categoryCodingCollection, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_executionEndDate, 0);
  objc_storeStrong((id *)&self->_executionStartDate, 0);
  objc_storeStrong((id *)&self->_performers, 0);

  objc_storeStrong((id *)&self->_procedureCodingCollection, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

- (void)_setProcedure:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property procedure for record type HKProcedureRecord.", v1, 2u);
}

- (void)_setStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property status for record type HKProcedureRecord.", v1, 2u);
}

@end