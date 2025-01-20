@interface HKVaccinationRecord
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)groupsByUserDomainConcept;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_newVaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 vaccinationCodings:(id)a15 expirationDate:(id)a16 doseNumber:(id)a17 doseQuantity:(id)a18 lotNumber:(id)a19 performer:(id)a20 bodySiteCodings:(id)a21 reaction:(id)a22 notGiven:(BOOL)a23 administrationDate:(id)a24 statusCoding:(id)a25 patientReported:(BOOL)a26 routeCodings:(id)a27 reasonsCodings:(id)a28 reasonsNotGivenCodings:(id)a29 config:(id)a30;
+ (id)cachedConceptRelationshipKeyPaths;
+ (id)defaultDisplayString;
+ (id)indexableConceptKeyPaths;
+ (id)vaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 vaccinationCodings:(id)a14 expirationDate:(id)a15 doseNumber:(id)a16 doseQuantity:(id)a17 lotNumber:(id)a18 performer:(id)a19 bodySiteCodings:(id)a20 reaction:(id)a21 notGiven:(BOOL)a22 administrationDate:(id)a23 statusCoding:(id)a24 patientReported:(BOOL)a25 routeCodings:(id)a26 reasonsCodings:(id)a27 reasonsNotGivenCodings:(id)a28;
+ (id)vaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 vaccinationCodings:(id)a15 expirationDate:(id)a16 doseNumber:(id)a17 doseQuantity:(id)a18 lotNumber:(id)a19 performer:(id)a20 bodySiteCodings:(id)a21 reaction:(id)a22 notGiven:(BOOL)a23 administrationDate:(id)a24 statusCoding:(id)a25 patientReported:(BOOL)a26 routeCodings:(id)a27 reasonsCodings:(id)a28 reasonsNotGivenCodings:(id)a29;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)notGiven;
- (BOOL)patientReported;
- (HKConcept)bodySite;
- (HKConcept)route;
- (HKConcept)status;
- (HKConcept)vaccination;
- (HKMedicalCoding)statusCoding;
- (HKMedicalDate)administrationDate;
- (HKMedicalDate)expirationDate;
- (HKVaccinationRecord)init;
- (HKVaccinationRecord)initWithCoder:(id)a3;
- (NSArray)bodySiteCodings;
- (NSArray)reasons;
- (NSArray)reasonsCodings;
- (NSArray)reasonsNotGiven;
- (NSArray)reasonsNotGivenCodings;
- (NSArray)routeCodings;
- (NSArray)vaccinationCodings;
- (NSString)description;
- (NSString)doseNumber;
- (NSString)doseQuantity;
- (NSString)lotNumber;
- (NSString)performer;
- (NSString)reaction;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)bodySiteCodingsCollection;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (id)reasonsCodingsCollections;
- (id)reasonsNotGivenCodingsCollections;
- (id)routeCodingsCollection;
- (id)statusCodingCollection;
- (id)vaccinationCodingsCollection;
- (int64_t)recordCategoryType;
- (void)_setAdministrationDate:(id)a3;
- (void)_setBodySite:(id)a3;
- (void)_setBodySiteCodings:(id)a3;
- (void)_setDoseNumber:(id)a3;
- (void)_setDoseQuantity:(id)a3;
- (void)_setExpirationDate:(id)a3;
- (void)_setLotNumber:(id)a3;
- (void)_setNotGiven:(BOOL)a3;
- (void)_setPatientReported:(BOOL)a3;
- (void)_setPerformer:(id)a3;
- (void)_setReaction:(id)a3;
- (void)_setReasons:(id)a3;
- (void)_setReasonsCodings:(id)a3;
- (void)_setReasonsNotGiven:(id)a3;
- (void)_setReasonsNotGivenCodings:(id)a3;
- (void)_setRoute:(id)a3;
- (void)_setRouteCodings:(id)a3;
- (void)_setStatus:(id)a3;
- (void)_setStatusCoding:(id)a3;
- (void)_setVaccination:(id)a3;
- (void)_setVaccinationCodings:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKVaccinationRecord

+ (id)defaultDisplayString
{
  v2 = HKHealthKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"UNSPECIFIED_VACCINATION" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  return v3;
}

+ (id)indexableConceptKeyPaths
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKVaccinationRecord;
  v2 = objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"vaccination"];
  [v3 addObject:@"bodySite"];
  [v3 addObject:@"status"];
  [v3 addObject:@"route"];
  [v3 addObject:@"reasons"];
  [v3 addObject:@"reasonsNotGiven"];

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HKVaccinationRecord;
  v2 = objc_msgSendSuper2(&v4, sel_cachedConceptRelationshipKeyPaths);

  return v2;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (!v7)
  {
    v14 = 0;
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"vaccination"])
  {
    v9 = [(HKVaccinationRecord *)self vaccinationCodings];
    v10 = +[HKMedicalCodingCollection collectionWithCodings:v9];
    v11 = +[HKIndexableObject indexableObjectWithObject:v10];
    v26[0] = v11;
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = (void **)v26;
LABEL_14:
    v14 = [v12 arrayWithObjects:v13 count:1];

LABEL_15:
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"bodySite"])
  {
    v15 = [(HKVaccinationRecord *)self bodySiteCodings];

    if (v15)
    {
      v9 = [(HKVaccinationRecord *)self bodySiteCodings];
      v10 = +[HKMedicalCodingCollection collectionWithCodings:v9];
      v11 = +[HKIndexableObject indexableObjectWithObject:v10];
      v25 = v11;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = &v25;
      goto LABEL_14;
    }
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"status"])
  {
    v16 = [(HKVaccinationRecord *)self statusCoding];

    if (v16)
    {
      v9 = [(HKVaccinationRecord *)self statusCoding];
      v10 = +[HKMedicalCodingCollection collectionWithCoding:v9];
      v11 = +[HKIndexableObject indexableObjectWithObject:v10];
      v24 = v11;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = &v24;
      goto LABEL_14;
    }
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"route"])
  {
    v17 = [(HKVaccinationRecord *)self routeCodings];

    if (v17)
    {
      v9 = [(HKVaccinationRecord *)self routeCodings];
      v10 = +[HKMedicalCodingCollection collectionWithCodings:v9];
      v11 = +[HKIndexableObject indexableObjectWithObject:v10];
      v23 = v11;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = &v23;
      goto LABEL_14;
    }
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"reasons"])
  {
    v19 = [(HKVaccinationRecord *)self reasonsCodings];

    if (v19)
    {
      uint64_t v20 = [(HKVaccinationRecord *)self reasonsCodingsCollections];
LABEL_25:
      v9 = (void *)v20;
      v14 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v20 context:v6 error:a4];
      goto LABEL_15;
    }
    goto LABEL_26;
  }
  if ([v8 isEqualToString:@"reasonsNotGiven"])
  {
    v21 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];

    if (v21)
    {
      uint64_t v20 = [(HKVaccinationRecord *)self reasonsNotGivenCodingsCollections];
      goto LABEL_25;
    }
LABEL_26:
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_16;
  }
  v22.receiver = self;
  v22.super_class = (Class)HKVaccinationRecord;
  v14 = [(HKMedicalRecord *)&v22 codingsForKeyPath:v6 error:a4];
LABEL_16:

  return v14;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  v11 = v10;
  if (!v10)
  {
LABEL_5:
    LOBYTE(a5) = 0;
    goto LABEL_16;
  }
  if ([v10 isEqualToString:@"vaccination"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 1, (uint64_t)v9, (uint64_t)a5))
    {
      a5 = [v8 firstObject];
      v12 = [a5 object];
      [(HKVaccinationRecord *)self _setVaccination:v12];
LABEL_15:

      LOBYTE(a5) = 1;
      goto LABEL_16;
    }
    goto LABEL_5;
  }
  if (![v11 isEqualToString:@"bodySite"])
  {
    if ([v11 isEqualToString:@"status"])
    {
      uint64_t v15 = [v8 count];
      v16 = [(HKVaccinationRecord *)self statusCoding];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v15, v16 != 0, (uint64_t)v9, (uint64_t)a5);

      if (a5)
      {
        a5 = [v8 firstObject];
        v12 = [a5 object];
        [(HKVaccinationRecord *)self _setStatus:v12];
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if ([v11 isEqualToString:@"route"])
    {
      uint64_t v17 = [v8 count];
      v18 = [(HKVaccinationRecord *)self routeCodings];
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v17, v18 != 0, (uint64_t)v9, (uint64_t)a5);

      if (a5)
      {
        a5 = [v8 firstObject];
        v12 = [a5 object];
        [(HKVaccinationRecord *)self _setRoute:v12];
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if ([v11 isEqualToString:@"reasons"])
    {
      uint64_t v20 = [(HKVaccinationRecord *)self reasonsCodings];

      if (v20)
      {
        v21 = [(HKVaccinationRecord *)self reasonsCodings];
        objc_super v22 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v21 count], v9, a5);

        LOBYTE(a5) = v22 != 0;
        if (v22) {
          [(HKVaccinationRecord *)self _setReasons:v22];
        }
LABEL_25:

        goto LABEL_16;
      }
    }
    else
    {
      if (![v11 isEqualToString:@"reasonsNotGiven"])
      {
        v26.receiver = self;
        v26.super_class = (Class)HKVaccinationRecord;
        BOOL v25 = [(HKMedicalRecord *)&v26 applyConcepts:v8 forKeyPath:v9 error:a5];
        goto LABEL_28;
      }
      v23 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];

      if (v23)
      {
        v24 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];
        objc_super v22 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, [v24 count], v9, a5);

        LOBYTE(a5) = v22 != 0;
        if (v22) {
          [(HKVaccinationRecord *)self _setReasonsNotGiven:v22];
        }
        goto LABEL_25;
      }
    }
    BOOL v25 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
LABEL_28:
    LOBYTE(a5) = v25;
    goto LABEL_16;
  }
  uint64_t v13 = [v8 count];
  v14 = [(HKVaccinationRecord *)self bodySiteCodings];
  LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v13, v14 != 0, (uint64_t)v9, (uint64_t)a5);

  if (a5)
  {
    a5 = [v8 firstObject];
    v12 = [a5 object];
    [(HKVaccinationRecord *)self _setBodySite:v12];
    goto LABEL_15;
  }
LABEL_16:

  return (char)a5;
}

- (int64_t)recordCategoryType
{
  return 6;
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)vaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 vaccinationCodings:(id)a14 expirationDate:(id)a15 doseNumber:(id)a16 doseQuantity:(id)a17 lotNumber:(id)a18 performer:(id)a19 bodySiteCodings:(id)a20 reaction:(id)a21 notGiven:(BOOL)a22 administrationDate:(id)a23 statusCoding:(id)a24 patientReported:(BOOL)a25 routeCodings:(id)a26 reasonsCodings:(id)a27 reasonsNotGivenCodings:(id)a28
{
  BOOL v49 = a5;
  id v44 = a28;
  id v28 = a27;
  id v41 = a26;
  id v29 = a24;
  id v30 = a23;
  id v38 = a21;
  id v37 = a20;
  id v36 = a19;
  id v60 = a18;
  id v59 = a17;
  id v56 = a16;
  id v54 = a15;
  id v58 = a14;
  id v57 = a12;
  id v55 = a11;
  id v53 = a10;
  id v40 = a8;
  id v52 = a7;
  id v31 = a6;
  id v43 = a4;
  id v32 = a3;
  v48 = [v30 dateForUTC];
  v46 = +[HKSemanticDate semanticDateWithKeyPath:@"administrationDate" date:v48];
  LOBYTE(v35) = a25;
  LOBYTE(v34) = a22;
  +[HKVaccinationRecord vaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:](HKVaccinationRecord, "vaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:", v32, v43, v49, v31, v52, v40, a9, v53, v55, v46, v57, a13, v58, v54, v56,
    v59,
    v60,
    v36,
    v37,
    v38,
    v34,
    v30,
    v29,
    v35,
    v41,
    v28,
  v50 = v44);

  return v50;
}

+ (id)vaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 vaccinationCodings:(id)a15 expirationDate:(id)a16 doseNumber:(id)a17 doseQuantity:(id)a18 lotNumber:(id)a19 performer:(id)a20 bodySiteCodings:(id)a21 reaction:(id)a22 notGiven:(BOOL)a23 administrationDate:(id)a24 statusCoding:(id)a25 patientReported:(BOOL)a26 routeCodings:(id)a27 reasonsCodings:(id)a28 reasonsNotGivenCodings:(id)a29
{
  LOBYTE(v32) = a26;
  LOBYTE(v31) = a23;
  id v29 = objc_msgSend(a1, "_newVaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                  a17,
                  a18,
                  a19,
                  a20,
                  a21,
                  a22,
                  v31,
                  a24,
                  a25,
                  v32,
                  a27,
                  a28,
                  a29,
                  0);

  return v29;
}

+ (id)_newVaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 vaccinationCodings:(id)a15 expirationDate:(id)a16 doseNumber:(id)a17 doseQuantity:(id)a18 lotNumber:(id)a19 performer:(id)a20 bodySiteCodings:(id)a21 reaction:(id)a22 notGiven:(BOOL)a23 administrationDate:(id)a24 statusCoding:(id)a25 patientReported:(BOOL)a26 routeCodings:(id)a27 reasonsCodings:(id)a28 reasonsNotGivenCodings:(id)a29 config:(id)a30
{
  BOOL v69 = a5;
  id v75 = a15;
  id v73 = a16;
  id v71 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a22;
  id v35 = a24;
  id v36 = a25;
  id v37 = a27;
  id v38 = a28;
  id v39 = a29;
  id v40 = a30;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __385__HKVaccinationRecord__newVaccinationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_vaccinationCodings_expirationDate_doseNumber_doseQuantity_lotNumber_performer_bodySiteCodings_reaction_notGiven_administrationDate_statusCoding_patientReported_routeCodings_reasonsCodings_reasonsNotGivenCodings_config___block_invoke;
  aBlock[3] = &unk_1E58C9700;
  id v79 = v75;
  id v80 = v73;
  id v81 = v71;
  id v82 = v30;
  id v83 = v31;
  id v84 = v32;
  id v85 = v33;
  id v86 = v34;
  BOOL v93 = a23;
  id v87 = v35;
  id v88 = v36;
  BOOL v94 = a26;
  id v89 = v37;
  id v90 = v38;
  id v91 = v39;
  id v92 = v40;
  id v68 = v40;
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
  id v72 = v71;
  id v74 = v73;
  id v76 = v75;
  id v41 = a13;
  id v42 = a12;
  id v43 = a11;
  id v44 = a10;
  id v45 = a8;
  id v46 = a7;
  id v47 = a6;
  id v48 = a4;
  id v49 = a3;
  v50 = _Block_copy(aBlock);
  v77.receiver = a1;
  v77.super_class = (Class)&OBJC_METACLASS___HKVaccinationRecord;
  id v70 = objc_msgSendSuper2(&v77, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v49, v48, v69, v47, v46, v45, a9, v44, v43, v42, v41, a14, v50);

  return v70;
}

void __385__HKVaccinationRecord__newVaccinationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_vaccinationCodings_expirationDate_doseNumber_doseQuantity_lotNumber_performer_bodySiteCodings_reaction_notGiven_administrationDate_statusCoding_patientReported_routeCodings_reasonsCodings_reasonsNotGivenCodings_config___block_invoke(uint64_t a1, void *a2)
{
  id v30 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) copy];
  objc_super v4 = (void *)v30[22];
  v30[22] = v3;

  uint64_t v5 = [*(id *)(a1 + 40) copy];
  id v6 = (void *)v30[23];
  v30[23] = v5;

  uint64_t v7 = [*(id *)(a1 + 48) copy];
  id v8 = (void *)v30[24];
  v30[24] = v7;

  uint64_t v9 = [*(id *)(a1 + 56) copy];
  v10 = (void *)v30[25];
  v30[25] = v9;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  v12 = (void *)v30[26];
  v30[26] = v11;

  uint64_t v13 = [*(id *)(a1 + 72) copy];
  v14 = (void *)v30[27];
  v30[27] = v13;

  uint64_t v15 = [*(id *)(a1 + 80) copy];
  v16 = (void *)v30[28];
  v30[28] = v15;

  uint64_t v17 = [*(id *)(a1 + 88) copy];
  v18 = (void *)v30[29];
  v30[29] = v17;

  *((unsigned char *)v30 + 240) = *(unsigned char *)(a1 + 144);
  uint64_t v19 = [*(id *)(a1 + 96) copy];
  uint64_t v20 = (void *)v30[31];
  v30[31] = v19;

  uint64_t v21 = [*(id *)(a1 + 104) copy];
  objc_super v22 = (void *)v30[32];
  v30[32] = v21;

  *((unsigned char *)v30 + 264) = *(unsigned char *)(a1 + 145);
  uint64_t v23 = [*(id *)(a1 + 112) copy];
  v24 = (void *)v30[34];
  v30[34] = v23;

  uint64_t v25 = [*(id *)(a1 + 120) copy];
  objc_super v26 = (void *)v30[35];
  v30[35] = v25;

  uint64_t v27 = [*(id *)(a1 + 128) copy];
  id v28 = (void *)v30[36];
  v30[36] = v27;

  uint64_t v29 = *(void *)(a1 + 136);
  if (v29) {
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);
  }
}

- (HKVaccinationRecord)init
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
  v9.super_class = (Class)HKVaccinationRecord;
  id v6 = [(HKSample *)&v9 description];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p super=%@vaccinationCodings = %@expirationDate = %@doseNumber = %@doseQuantity = %@lotNumber = %@performer = %@bodySiteCodings = %@reaction = %@notGiven = %ldadministrationDate = %@statusCoding = %@patientReported = %ldrouteCodings = %@reasonsCodings = %@reasonsNotGivenCodings = %@>", v5, self, v6, self->_vaccinationCodings, self->_expirationDate, self->_doseNumber, self->_doseQuantity, self->_lotNumber, self->_performer, self->_bodySiteCodings, self->_reaction, self->_notGiven, self->_administrationDate, self->_statusCoding, self->_patientReported, self->_routeCodings,
    self->_reasonsCodings,
  uint64_t v7 = self->_reasonsNotGivenCodings);

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKVaccinationRecord;
  id v4 = a3;
  [(HKMedicalRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_vaccinationCodings, @"VaccinationCodings", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_expirationDate forKey:@"ExpirationDate"];
  [v4 encodeObject:self->_doseNumber forKey:@"DoseNumber"];
  [v4 encodeObject:self->_doseQuantity forKey:@"DoseQuantity"];
  [v4 encodeObject:self->_lotNumber forKey:@"LotNumber"];
  [v4 encodeObject:self->_performer forKey:@"Performer"];
  [v4 encodeObject:self->_bodySiteCodings forKey:@"BodySiteCodings"];
  [v4 encodeObject:self->_reaction forKey:@"Reaction"];
  [v4 encodeBool:self->_notGiven forKey:@"NotGiven"];
  [v4 encodeObject:self->_administrationDate forKey:@"AdministrationDate"];
  [v4 encodeObject:self->_statusCoding forKey:@"StatusCoding"];
  [v4 encodeBool:self->_patientReported forKey:@"PatientReported"];
  [v4 encodeObject:self->_routeCodings forKey:@"RouteCodings"];
  [v4 encodeObject:self->_reasonsCodings forKey:@"ReasonsCodings"];
  [v4 encodeObject:self->_reasonsNotGivenCodings forKey:@"ReasonsNotGivenCodings"];
  [v4 encodeObject:self->_vaccination forKey:@"Vaccination"];
  [v4 encodeObject:self->_bodySite forKey:@"BodySite"];
  [v4 encodeObject:self->_status forKey:@"Status"];
  [v4 encodeObject:self->_route forKey:@"Route"];
  [v4 encodeObject:self->_reasons forKey:@"Reasons"];
  [v4 encodeObject:self->_reasonsNotGiven forKey:@"ReasonsNotGiven"];
}

- (HKVaccinationRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HKVaccinationRecord;
  objc_super v5 = [(HKMedicalRecord *)&v52 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"VaccinationCodings"];
    vaccinationCodings = v5->_vaccinationCodings;
    v5->_vaccinationCodings = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (HKMedicalDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DoseNumber"];
    doseNumber = v5->_doseNumber;
    v5->_doseNumber = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DoseQuantity"];
    doseQuantity = v5->_doseQuantity;
    v5->_doseQuantity = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LotNumber"];
    lotNumber = v5->_lotNumber;
    v5->_lotNumber = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Performer"];
    performer = v5->_performer;
    v5->_performer = (NSString *)v17;

    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"BodySiteCodings"];
    bodySiteCodings = v5->_bodySiteCodings;
    v5->_bodySiteCodings = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Reaction"];
    reaction = v5->_reaction;
    v5->_reaction = (NSString *)v22;

    v5->_notGiven = [v4 decodeBoolForKey:@"NotGiven"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AdministrationDate"];
    administrationDate = v5->_administrationDate;
    v5->_administrationDate = (HKMedicalDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StatusCoding"];
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v26;

    v5->_patientReported = [v4 decodeBoolForKey:@"PatientReported"];
    id v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"RouteCodings"];
    routeCodings = v5->_routeCodings;
    v5->_routeCodings = (NSArray *)v29;

    id v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"ReasonsCodings"];
    reasonsCodings = v5->_reasonsCodings;
    v5->_reasonsCodings = (NSArray *)v32;

    id v34 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"ReasonsNotGivenCodings"];
    reasonsNotGivenCodings = v5->_reasonsNotGivenCodings;
    v5->_reasonsNotGivenCodings = (NSArray *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Vaccination"];
    vaccination = v5->_vaccination;
    v5->_vaccination = (HKConcept *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BodySite"];
    bodySite = v5->_bodySite;
    v5->_bodySite = (HKConcept *)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Status"];
    status = v5->_status;
    v5->_status = (HKConcept *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Route"];
    route = v5->_route;
    v5->_route = (HKConcept *)v43;

    id v45 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"Reasons"];
    reasons = v5->_reasons;
    v5->_reasons = (NSArray *)v46;

    id v48 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"ReasonsNotGiven"];
    reasonsNotGiven = v5->_reasonsNotGiven;
    v5->_reasonsNotGiven = (NSArray *)v49;
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
    v126.receiver = self;
    v126.super_class = (Class)HKVaccinationRecord;
    if (![(HKMedicalRecord *)&v126 isEquivalent:v5]) {
      goto LABEL_101;
    }
    id v6 = [(HKVaccinationRecord *)self vaccinationCodings];
    uint64_t v7 = [v5 vaccinationCodings];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 vaccinationCodings];
      if (!v9) {
        goto LABEL_100;
      }
      v10 = (void *)v9;
      uint64_t v11 = [(HKVaccinationRecord *)self vaccinationCodings];
      v12 = [v5 vaccinationCodings];
      int v13 = [v11 isEqualToArray:v12];

      if (!v13) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self expirationDate];
    uint64_t v15 = [v5 expirationDate];
    if (v6 == (void *)v15)
    {
    }
    else
    {
      id v8 = (void *)v15;
      uint64_t v16 = [v5 expirationDate];
      if (!v16) {
        goto LABEL_100;
      }
      uint64_t v17 = (void *)v16;
      v18 = [(HKVaccinationRecord *)self expirationDate];
      uint64_t v19 = [v5 expirationDate];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self doseNumber];
    uint64_t v21 = [v5 doseNumber];
    if (v6 == (void *)v21)
    {
    }
    else
    {
      id v8 = (void *)v21;
      uint64_t v22 = [v5 doseNumber];
      if (!v22) {
        goto LABEL_100;
      }
      uint64_t v23 = (void *)v22;
      uint64_t v24 = [(HKVaccinationRecord *)self doseNumber];
      uint64_t v25 = [v5 doseNumber];
      int v26 = [v24 isEqualToString:v25];

      if (!v26) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self doseQuantity];
    uint64_t v27 = [v5 doseQuantity];
    if (v6 == (void *)v27)
    {
    }
    else
    {
      id v8 = (void *)v27;
      uint64_t v28 = [v5 doseQuantity];
      if (!v28) {
        goto LABEL_100;
      }
      uint64_t v29 = (void *)v28;
      id v30 = [(HKVaccinationRecord *)self doseQuantity];
      id v31 = [v5 doseQuantity];
      int v32 = [v30 isEqualToString:v31];

      if (!v32) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self lotNumber];
    uint64_t v33 = [v5 lotNumber];
    if (v6 == (void *)v33)
    {
    }
    else
    {
      id v8 = (void *)v33;
      uint64_t v34 = [v5 lotNumber];
      if (!v34) {
        goto LABEL_100;
      }
      uint64_t v35 = (void *)v34;
      id v36 = [(HKVaccinationRecord *)self lotNumber];
      uint64_t v37 = [v5 lotNumber];
      int v38 = [v36 isEqualToString:v37];

      if (!v38) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self performer];
    uint64_t v39 = [v5 performer];
    if (v6 == (void *)v39)
    {
    }
    else
    {
      id v8 = (void *)v39;
      uint64_t v40 = [v5 performer];
      if (!v40) {
        goto LABEL_100;
      }
      uint64_t v41 = (void *)v40;
      id v42 = [(HKVaccinationRecord *)self performer];
      uint64_t v43 = [v5 performer];
      int v44 = [v42 isEqualToString:v43];

      if (!v44) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self bodySiteCodings];
    uint64_t v45 = [v5 bodySiteCodings];
    if (v6 == (void *)v45)
    {
    }
    else
    {
      id v8 = (void *)v45;
      uint64_t v46 = [v5 bodySiteCodings];
      if (!v46) {
        goto LABEL_100;
      }
      id v47 = (void *)v46;
      id v48 = [(HKVaccinationRecord *)self bodySiteCodings];
      uint64_t v49 = [v5 bodySiteCodings];
      int v50 = [v48 isEqualToArray:v49];

      if (!v50) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self reaction];
    uint64_t v51 = [v5 reaction];
    if (v6 == (void *)v51)
    {
    }
    else
    {
      id v8 = (void *)v51;
      uint64_t v52 = [v5 reaction];
      if (!v52) {
        goto LABEL_100;
      }
      id v53 = (void *)v52;
      id v54 = [(HKVaccinationRecord *)self reaction];
      id v55 = [v5 reaction];
      int v56 = [v54 isEqualToString:v55];

      if (!v56) {
        goto LABEL_101;
      }
    }
    int v57 = [(HKVaccinationRecord *)self notGiven];
    if (v57 != [v5 notGiven]) {
      goto LABEL_101;
    }
    id v6 = [(HKVaccinationRecord *)self administrationDate];
    uint64_t v58 = [v5 administrationDate];
    if (v6 == (void *)v58)
    {
    }
    else
    {
      id v8 = (void *)v58;
      uint64_t v59 = [v5 administrationDate];
      if (!v59) {
        goto LABEL_100;
      }
      id v60 = (void *)v59;
      id v61 = [(HKVaccinationRecord *)self administrationDate];
      id v62 = [v5 administrationDate];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self statusCoding];
    uint64_t v64 = [v5 statusCoding];
    if (v6 == (void *)v64)
    {
    }
    else
    {
      id v8 = (void *)v64;
      uint64_t v65 = [v5 statusCoding];
      if (!v65) {
        goto LABEL_100;
      }
      id v66 = (void *)v65;
      id v67 = [(HKVaccinationRecord *)self statusCoding];
      id v68 = [v5 statusCoding];
      int v69 = [v67 isEqual:v68];

      if (!v69) {
        goto LABEL_101;
      }
    }
    int v70 = [(HKVaccinationRecord *)self patientReported];
    if (v70 != [v5 patientReported]) {
      goto LABEL_101;
    }
    id v6 = [(HKVaccinationRecord *)self routeCodings];
    uint64_t v71 = [v5 routeCodings];
    if (v6 == (void *)v71)
    {
    }
    else
    {
      id v8 = (void *)v71;
      uint64_t v72 = [v5 routeCodings];
      if (!v72) {
        goto LABEL_100;
      }
      id v73 = (void *)v72;
      id v74 = [(HKVaccinationRecord *)self routeCodings];
      id v75 = [v5 routeCodings];
      int v76 = [v74 isEqualToArray:v75];

      if (!v76) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self reasonsCodings];
    uint64_t v77 = [v5 reasonsCodings];
    if (v6 == (void *)v77)
    {
    }
    else
    {
      id v8 = (void *)v77;
      uint64_t v78 = [v5 reasonsCodings];
      if (!v78) {
        goto LABEL_100;
      }
      id v79 = (void *)v78;
      id v80 = [(HKVaccinationRecord *)self reasonsCodings];
      id v81 = [v5 reasonsCodings];
      int v82 = [v80 isEqualToArray:v81];

      if (!v82) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];
    uint64_t v83 = [v5 reasonsNotGivenCodings];
    if (v6 == (void *)v83)
    {
    }
    else
    {
      id v8 = (void *)v83;
      uint64_t v84 = [v5 reasonsNotGivenCodings];
      if (!v84) {
        goto LABEL_100;
      }
      id v85 = (void *)v84;
      id v86 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];
      id v87 = [v5 reasonsNotGivenCodings];
      int v88 = [v86 isEqualToArray:v87];

      if (!v88) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self vaccination];
    uint64_t v89 = [v5 vaccination];
    if (v6 == (void *)v89)
    {
    }
    else
    {
      id v8 = (void *)v89;
      uint64_t v90 = [v5 vaccination];
      if (!v90) {
        goto LABEL_100;
      }
      id v91 = (void *)v90;
      id v92 = [(HKVaccinationRecord *)self vaccination];
      BOOL v93 = [v5 vaccination];
      int v94 = [v92 isEqual:v93];

      if (!v94) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self bodySite];
    uint64_t v95 = [v5 bodySite];
    if (v6 == (void *)v95)
    {
    }
    else
    {
      id v8 = (void *)v95;
      uint64_t v96 = [v5 bodySite];
      if (!v96) {
        goto LABEL_100;
      }
      v97 = (void *)v96;
      v98 = [(HKVaccinationRecord *)self bodySite];
      v99 = [v5 bodySite];
      int v100 = [v98 isEqual:v99];

      if (!v100) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self status];
    uint64_t v101 = [v5 status];
    if (v6 == (void *)v101)
    {
    }
    else
    {
      id v8 = (void *)v101;
      uint64_t v102 = [v5 status];
      if (!v102) {
        goto LABEL_100;
      }
      v103 = (void *)v102;
      v104 = [(HKVaccinationRecord *)self status];
      v105 = [v5 status];
      int v106 = [v104 isEqual:v105];

      if (!v106) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self route];
    uint64_t v107 = [v5 route];
    if (v6 == (void *)v107)
    {
    }
    else
    {
      id v8 = (void *)v107;
      uint64_t v108 = [v5 route];
      if (!v108) {
        goto LABEL_100;
      }
      v109 = (void *)v108;
      v110 = [(HKVaccinationRecord *)self route];
      v111 = [v5 route];
      int v112 = [v110 isEqual:v111];

      if (!v112) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self reasons];
    uint64_t v113 = [v5 reasons];
    if (v6 == (void *)v113)
    {
    }
    else
    {
      id v8 = (void *)v113;
      uint64_t v114 = [v5 reasons];
      if (!v114) {
        goto LABEL_100;
      }
      v115 = (void *)v114;
      v116 = [(HKVaccinationRecord *)self reasons];
      v117 = [v5 reasons];
      int v118 = [v116 isEqualToArray:v117];

      if (!v118) {
        goto LABEL_101;
      }
    }
    id v6 = [(HKVaccinationRecord *)self reasonsNotGiven];
    uint64_t v119 = [v5 reasonsNotGiven];
    if (v6 == (void *)v119)
    {

LABEL_105:
      BOOL v14 = 1;
      goto LABEL_102;
    }
    id v8 = (void *)v119;
    uint64_t v120 = [v5 reasonsNotGiven];
    if (v120)
    {
      v121 = (void *)v120;
      v122 = [(HKVaccinationRecord *)self reasonsNotGiven];
      v123 = [v5 reasonsNotGiven];
      char v124 = [v122 isEqualToArray:v123];

      if (v124) {
        goto LABEL_105;
      }
LABEL_101:
      BOOL v14 = 0;
LABEL_102:

      goto LABEL_103;
    }
LABEL_100:

    goto LABEL_101;
  }
  BOOL v14 = 0;
LABEL_103:

  return v14;
}

- (id)vaccinationCodingsCollection
{
  v2 = [(HKVaccinationRecord *)self vaccinationCodings];
  uint64_t v3 = +[HKMedicalCodingCollection collectionWithCodings:v2];

  return v3;
}

- (id)bodySiteCodingsCollection
{
  uint64_t v3 = [(HKVaccinationRecord *)self bodySiteCodings];

  if (v3)
  {
    id v4 = [(HKVaccinationRecord *)self bodySiteCodings];
    id v5 = +[HKMedicalCodingCollection collectionWithCodings:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)statusCodingCollection
{
  uint64_t v3 = [(HKVaccinationRecord *)self statusCoding];

  if (v3)
  {
    id v4 = [(HKVaccinationRecord *)self statusCoding];
    id v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)routeCodingsCollection
{
  uint64_t v3 = [(HKVaccinationRecord *)self routeCodings];

  if (v3)
  {
    id v4 = [(HKVaccinationRecord *)self routeCodings];
    id v5 = +[HKMedicalCodingCollection collectionWithCodings:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)reasonsCodingsCollections
{
  uint64_t v3 = [(HKVaccinationRecord *)self reasonsCodings];

  if (v3)
  {
    id v4 = [(HKVaccinationRecord *)self reasonsCodings];
    id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_137);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

HKMedicalCodingCollection *__48__HKVaccinationRecord_reasonsCodingsCollections__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKMedicalCodingCollection collectionWithCodings:a2];
}

- (id)reasonsNotGivenCodingsCollections
{
  uint64_t v3 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];

  if (v3)
  {
    id v4 = [(HKVaccinationRecord *)self reasonsNotGivenCodings];
    id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_154_0);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

HKMedicalCodingCollection *__56__HKVaccinationRecord_reasonsNotGivenCodingsCollections__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKMedicalCodingCollection collectionWithCodings:a2];
}

- (NSArray)vaccinationCodings
{
  return self->_vaccinationCodings;
}

- (void)_setVaccinationCodings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  vaccinationCodings = self->_vaccinationCodings;
  self->_vaccinationCodings = v4;

  id v8 = [(HKVaccinationRecord *)self vaccinationCodingsCollection];
  id v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v8];
  vaccination = self->_vaccination;
  self->_vaccination = v6;
}

- (HKMedicalDate)expirationDate
{
  return self->_expirationDate;
}

- (void)_setExpirationDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v4;

  MEMORY[0x1F41817F8](v4, expirationDate);
}

- (NSString)doseNumber
{
  return self->_doseNumber;
}

- (void)_setDoseNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  doseNumber = self->_doseNumber;
  self->_doseNumber = v4;

  MEMORY[0x1F41817F8](v4, doseNumber);
}

- (NSString)doseQuantity
{
  return self->_doseQuantity;
}

- (void)_setDoseQuantity:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  doseQuantity = self->_doseQuantity;
  self->_doseQuantity = v4;

  MEMORY[0x1F41817F8](v4, doseQuantity);
}

- (NSString)lotNumber
{
  return self->_lotNumber;
}

- (void)_setLotNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  lotNumber = self->_lotNumber;
  self->_lotNumber = v4;

  MEMORY[0x1F41817F8](v4, lotNumber);
}

- (NSString)performer
{
  return self->_performer;
}

- (void)_setPerformer:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  performer = self->_performer;
  self->_performer = v4;

  MEMORY[0x1F41817F8](v4, performer);
}

- (NSArray)bodySiteCodings
{
  return self->_bodySiteCodings;
}

- (void)_setBodySiteCodings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  bodySiteCodings = self->_bodySiteCodings;
  self->_bodySiteCodings = v4;

  if (self->_bodySiteCodings)
  {
    uint64_t v9 = [(HKVaccinationRecord *)self bodySiteCodingsCollection];
    id v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    bodySite = self->_bodySite;
    self->_bodySite = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_bodySite;
    self->_bodySite = 0;
  }
}

- (NSString)reaction
{
  return self->_reaction;
}

- (void)_setReaction:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  reaction = self->_reaction;
  self->_reaction = v4;

  MEMORY[0x1F41817F8](v4, reaction);
}

- (BOOL)notGiven
{
  return self->_notGiven;
}

- (void)_setNotGiven:(BOOL)a3
{
  self->_notGiven = a3;
}

- (HKMedicalDate)administrationDate
{
  return self->_administrationDate;
}

- (void)_setAdministrationDate:(id)a3
{
  id v4 = (HKMedicalDate *)[a3 copy];
  administrationDate = self->_administrationDate;
  self->_administrationDate = v4;

  MEMORY[0x1F41817F8](v4, administrationDate);
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
    uint64_t v9 = [(HKVaccinationRecord *)self statusCodingCollection];
    id v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
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

- (BOOL)patientReported
{
  return self->_patientReported;
}

- (void)_setPatientReported:(BOOL)a3
{
  self->_patientReported = a3;
}

- (NSArray)routeCodings
{
  return self->_routeCodings;
}

- (void)_setRouteCodings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  routeCodings = self->_routeCodings;
  self->_routeCodings = v4;

  if (self->_routeCodings)
  {
    uint64_t v9 = [(HKVaccinationRecord *)self routeCodingsCollection];
    id v6 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v9];
    route = self->_route;
    self->_route = v6;

    id v8 = (HKConcept *)v9;
  }
  else
  {
    id v8 = self->_route;
    self->_route = 0;
  }
}

- (NSArray)reasonsCodings
{
  return self->_reasonsCodings;
}

- (void)_setReasonsCodings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsCodings = self->_reasonsCodings;
  self->_reasonsCodings = v4;

  if (self->_reasonsCodings)
  {
    uint64_t v9 = [(HKVaccinationRecord *)self reasonsCodingsCollections];
    id v6 = [(NSArray *)v9 hk_map:&__block_literal_global_158_0];
    reasons = self->_reasons;
    self->_reasons = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_reasons;
    self->_reasons = 0;
  }
}

id __42__HKVaccinationRecord__setReasonsCodings___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (NSArray)reasonsNotGivenCodings
{
  return self->_reasonsNotGivenCodings;
}

- (void)_setReasonsNotGivenCodings:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsNotGivenCodings = self->_reasonsNotGivenCodings;
  self->_reasonsNotGivenCodings = v4;

  if (self->_reasonsNotGivenCodings)
  {
    uint64_t v9 = [(HKVaccinationRecord *)self reasonsNotGivenCodingsCollections];
    id v6 = [(NSArray *)v9 hk_map:&__block_literal_global_160_0];
    reasonsNotGiven = self->_reasonsNotGiven;
    self->_reasonsNotGiven = v6;

    id v8 = v9;
  }
  else
  {
    id v8 = self->_reasonsNotGiven;
    self->_reasonsNotGiven = 0;
  }
}

id __50__HKVaccinationRecord__setReasonsNotGivenCodings___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKConcept)vaccination
{
  vaccination = self->_vaccination;
  if (vaccination)
  {
    uint64_t v3 = vaccination;
  }
  else
  {
    id v4 = [(HKVaccinationRecord *)self vaccinationCodingsCollection];
    uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setVaccination:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    id v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKVaccinationRecord _setVaccination:](v5);
    }
  }
  id v6 = (HKConcept *)[v4 copy];
  vaccination = self->_vaccination;
  self->_vaccination = v6;
}

- (HKConcept)bodySite
{
  if (self->_bodySiteCodings)
  {
    bodySite = self->_bodySite;
    if (bodySite)
    {
      uint64_t v3 = bodySite;
    }
    else
    {
      id v4 = [(HKVaccinationRecord *)self bodySiteCodingsCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setBodySite:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  bodySite = self->_bodySite;
  self->_bodySite = v4;

  MEMORY[0x1F41817F8](v4, bodySite);
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
      id v4 = [(HKVaccinationRecord *)self statusCodingCollection];
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
  id v4 = (HKConcept *)[a3 copy];
  status = self->_status;
  self->_status = v4;

  MEMORY[0x1F41817F8](v4, status);
}

- (HKConcept)route
{
  if (self->_routeCodings)
  {
    route = self->_route;
    if (route)
    {
      uint64_t v3 = route;
    }
    else
    {
      id v4 = [(HKVaccinationRecord *)self routeCodingsCollection];
      uint64_t v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_setRoute:(id)a3
{
  id v4 = (HKConcept *)[a3 copy];
  route = self->_route;
  self->_route = v4;

  MEMORY[0x1F41817F8](v4, route);
}

- (NSArray)reasons
{
  if (self->_reasonsCodings)
  {
    reasons = self->_reasons;
    if (reasons)
    {
      uint64_t v3 = reasons;
    }
    else
    {
      id v4 = [(HKVaccinationRecord *)self reasonsCodingsCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_162);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __30__HKVaccinationRecord_reasons__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReasons:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasons = self->_reasons;
  self->_reasons = v4;

  MEMORY[0x1F41817F8](v4, reasons);
}

- (NSArray)reasonsNotGiven
{
  if (self->_reasonsNotGivenCodings)
  {
    reasonsNotGiven = self->_reasonsNotGiven;
    if (reasonsNotGiven)
    {
      uint64_t v3 = reasonsNotGiven;
    }
    else
    {
      id v4 = [(HKVaccinationRecord *)self reasonsNotGivenCodingsCollections];
      objc_msgSend(v4, "hk_map:", &__block_literal_global_164);
      uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __38__HKVaccinationRecord_reasonsNotGiven__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (void)_setReasonsNotGiven:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  reasonsNotGiven = self->_reasonsNotGiven;
  self->_reasonsNotGiven = v4;

  MEMORY[0x1F41817F8](v4, reasonsNotGiven);
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKVaccinationRecord;
  id v5 = -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if (self->_vaccinationCodings)
    {
      if (self->_administrationDate)
      {
        id v8 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: administrationDate must not be nil";
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = @"%@: vaccinationCodings must not be nil";
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
  objc_storeStrong((id *)&self->_reasonsNotGiven, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_bodySite, 0);
  objc_storeStrong((id *)&self->_vaccination, 0);
  objc_storeStrong((id *)&self->_reasonsNotGivenCodings, 0);
  objc_storeStrong((id *)&self->_reasonsCodings, 0);
  objc_storeStrong((id *)&self->_routeCodings, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_administrationDate, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_bodySiteCodings, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_lotNumber, 0);
  objc_storeStrong((id *)&self->_doseQuantity, 0);
  objc_storeStrong((id *)&self->_doseNumber, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_vaccinationCodings, 0);
}

- (void)_setVaccination:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property vaccination for record type HKVaccinationRecord.", v1, 2u);
}

@end