@interface HDHealthRecordsExtractionUtilities
+ (BOOL)_determineEnteredInError:(id)a3;
+ (id)BOOLeanNotDoneFromStatusCode:(id)a3 error:(id *)a4;
+ (id)BOOLeanNotTakenFromStatusCode:(id)a3 error:(id *)a4;
+ (id)_FHIRMedicalCodingWithCode:(id)a3 medicalCodingSystem:(id)a4 codingVersion:(id)a5 error:(id *)a6;
+ (id)_earliestDosageDateWithMedicationDosageArray:(id)a3 error:(id *)a4;
+ (id)_firstCodingForSystem:(id)a3 inCodeableConcept:(id)a4 error:(id *)a5;
+ (id)_medicalDateIntervalWithDosage:(id)a3 error:(id *)a4;
+ (id)_medicalDateWithDateTimeString:(id)a3 range:(_NSRange)a4 error:(id *)a5;
+ (id)_medicalDateWithOnlyDateString:(id)a3 range:(_NSRange)a4 error:(id *)a5;
+ (id)_medicationDosagesWithDosageArray:(id)a3 FHIRRelease:(id)a4 error:(id *)a5;
+ (id)_transformArray:(id)a3 error:(id *)a4 transformBlock:(id)a5;
+ (id)allergyIntoleranceClinicalStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)allergyIntoleranceVerificationStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)allergyReactionsWithAllergyIntoleranceReaction:(id)a3 error:(id *)a4;
+ (id)codedQuantityWithQuantity:(id)a3 error:(id *)a4;
+ (id)codedValueWithObservationComponent:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
+ (id)conditionClinicalStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)conditionVerificationStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)coverageClassificationWithClassElements:(id)a3 error:(id *)a4;
+ (id)enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept:(id)a3 error:(id *)a4;
+ (id)enteredInErrorWithConditionVerificationStatusCodeableConcept:(id)a3 error:(id *)a4;
+ (id)enteredInErrorWithStatusString:(id)a3 error:(id *)a4;
+ (id)identifierFromReference:(id)a3 error:(id *)a4;
+ (id)identifierWithReference:(id)a3 parentResource:(id)a4 error:(id *)a5;
+ (id)identifiersWithReferences:(id)a3 parentResource:(id)a4 error:(id *)a5;
+ (id)inspectableValueCollectionWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)inspectableValueCollectionWithDateTime:(id)a3 error:(id *)a4;
+ (id)inspectableValueCollectionWithObservationComponents:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
+ (id)inspectableValueCollectionWithObservationValues:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
+ (id)inspectableValueCollectionWithPeriod:(id)a3 error:(id *)a4;
+ (id)inspectableValueCollectionWithQuantity:(id)a3 error:(id *)a4;
+ (id)inspectableValueCollectionWithRatio:(id)a3 error:(id *)a4;
+ (id)inspectableValueCollectionWithString:(id)a3 error:(id *)a4;
+ (id)inspectableValueCollectionWithTime:(id)a3 error:(id *)a4;
+ (id)inspectableValueWithAbatementValue:(id)a3 error:(id *)a4;
+ (id)inspectableValueWithObservationValues:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
+ (id)inspectableValueWithOnsetValue:(id)a3 error:(id *)a4;
+ (id)localeFromLanguage:(id)a3 error:(id *)a4;
+ (id)medicalCodingCollectionArrayWithCodeableConcepts:(id)a3 error:(id *)a4;
+ (id)medicalCodingCollectionWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithAllergyIntoleranceCategoryCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithAllergyIntoleranceCriticalityCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithAllergyIntoleranceSeverityCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithAllergyIntoleranceStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithAllergyIntoleranceTypeCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithCarePlanStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithCoding:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithConditionClinicalStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithConditionVerificationStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithCoverageStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithDeviceStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithDiagnosticReportStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithEventStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithGoalStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithImmunizationStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithMedicationAdminStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithMedicationDispenseStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithMedicationOrderStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithMedicationStatementStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithObservationStatus:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithProcedureStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithR4AllergyIntoleranceCriticalityCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithR4MedicationDispenseStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingWithR4MedicationRequestStatusCode:(id)a3 error:(id *)a4;
+ (id)medicalCodingsArrayWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)medicalCodingsWithCodeableConcept:(id)a3 error:(id *)a4;
+ (id)medicalCodingsWithCodeableConcepts:(id)a3 error:(id *)a4;
+ (id)medicalCodingsWithReference:(id)a3 error:(id *)a4;
+ (id)medicalDateIntervalWithPeriod:(id)a3 error:(id *)a4;
+ (id)medicalDateWithDateString:(id)a3 error:(id *)a4;
+ (id)medicalDateWithDateTimeString:(id)a3 error:(id *)a4;
+ (id)medicalDateWithInstantString:(id)a3 error:(id *)a4;
+ (id)medicationDosagesWithDispenseDosageInstructionArray:(id)a3 error:(id *)a4;
+ (id)medicationDosagesWithDosageArray:(id)a3 error:(id *)a4;
+ (id)medicationDosagesWithOrderDosageInstructionArray:(id)a3 error:(id *)a4;
+ (id)medicationDosagesWithStatementDosageInstructionArray:(id)a3 error:(id *)a4;
+ (id)observationCategoryWithObservationCategories:(id)a3 error:(id *)a4;
+ (id)observationCategoryWithObservationCategory:(id)a3 error:(id *)a4;
+ (id)preferredNameWithHumanNames:(id)a3 FHIRVersion:(id)a4 error:(id *)a5;
+ (id)preferredSupporedCategory:(id)a3 unsupportedCategories:(id)a4 error:(id *)a5;
+ (id)ratioValueWithRatio:(id)a3 error:(id *)a4;
+ (id)referenceRangeWithObservationReferenceRange:(id)a3 error:(id *)a4;
+ (id)referenceRangesWithObservationReferenceRanges:(id)a3 error:(id *)a4;
+ (id)referencedMedicationStatementActorTypeWithString:(id)a3 error:(id *)a4;
+ (id)resourceReferencedBy:(id)a3 containedIn:(id)a4 error:(id *)a5;
+ (id)stringArrayWithStrings:(id)a3 error:(id *)a4;
+ (id)stringWithAttachment:(id)a3 error:(id *)a4;
+ (id)stringWithRTF:(id)a3 error:(id *)a4;
+ (id)timeSinceMidnightWithTimeString:(id)a3 error:(id *)a4;
+ (id)wasEnteredInError:(id)a3 error:(id *)a4;
+ (id)wrapInArray:(id)a3 error:(id *)a4;
+ (int64_t)_integerFromTextCheckingResult:(id)a3 string:(id)a4 index:(int64_t)a5;
@end

@implementation HDHealthRecordsExtractionUtilities

+ (id)_FHIRMedicalCodingWithCode:(id)a3 medicalCodingSystem:(id)a4 codingVersion:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  v11 = HKSafeObject();

  if (v11)
  {
    v11 = [MEMORY[0x263F0A4A0] medicalCodingWithSystem:v9 codingVersion:v10 code:v8 displayString:0];
  }

  return v11;
}

+ (id)_firstCodingForSystem:(id)a3 inCodeableConcept:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 medicalCodingsWithCodeableConcept:v9 error:a5];
  if (v10)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __84__HDHealthRecordsExtractionUtilities__firstCodingForSystem_inCodeableConcept_error___block_invoke;
    v16[3] = &unk_264BD9808;
    id v11 = v8;
    id v17 = v11;
    v12 = objc_msgSend(v10, "hk_firstObjectPassingTest:", v16);
    v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 3, @"Expecting codeable concept with system %@ but none was present in %@", v11, v9);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __84__HDHealthRecordsExtractionUtilities__firstCodingForSystem_inCodeableConcept_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 codingSystem];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (id)wrapInArray:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x263EF8340];
  v8[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)stringArrayWithStrings:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          id v11 = HKSafeObject();

          if (!v11)
          {

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = v6;
  }
  else
  {
LABEL_12:
    id v12 = 0;
  }

  return v12;
}

+ (id)medicalCodingWithCoding:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (!v6) {
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"system"))
  {
    uint64_t v7 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"system", a4);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:v7];

      goto LABEL_7;
    }
LABEL_5:
    id v10 = 0;
    goto LABEL_23;
  }
  uint64_t v9 = 0;
LABEL_7:
  if (!objc_msgSend(v5, "hk_hasValueForKeyPath:", @"version"))
  {
    id v11 = 0;
LABEL_11:
    if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"code"))
    {
      id v12 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"code", a4);
      if (!v12)
      {
        id v10 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      id v12 = 0;
    }
    if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"display"))
    {
      v13 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"display", a4);
      if (!v13)
      {
        id v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v13 = 0;
    }
    id v10 = [MEMORY[0x263F0A4A0] medicalCodingWithSystem:v9 codingVersion:v11 code:v12 displayString:v13];

    goto LABEL_20;
  }
  id v11 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"version", a4);
  if (v11) {
    goto LABEL_11;
  }
  id v10 = 0;
LABEL_22:

LABEL_23:
  return v10;
}

+ (id)medicalCodingCollectionWithCodeableConcept:(id)a3 error:(id *)a4
{
  id v4 = [a1 medicalCodingsWithCodeableConcept:a3 error:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263F0A4A8] collectionWithCodings:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)medicalCodingsWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v7 = HKSafeObject();

  if (!v7) {
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"text"))
  {
    uint64_t v8 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"text", a4);
    if (!v8)
    {
LABEL_4:
      uint64_t v9 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (!objc_msgSend(v6, "hk_hasValueForKeyPath:", @"coding"))
  {
    id v10 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_10;
  }
  id v10 = objc_msgSend(v6, "hk_safeArrayForKeyPath:error:", @"coding", a4);
  if (v10)
  {
LABEL_10:
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v8)
    {
      id v12 = (void *)MEMORY[0x263F0A4A0];
      v13 = [MEMORY[0x263F0A4B0] textSystem];
      long long v14 = [v12 medicalCodingWithSystem:v13 codingVersion:*MEMORY[0x263F09998] code:v8 displayString:v8];
      [v11 addObject:v14];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = objc_msgSend(a1, "medicalCodingWithCoding:error:", *(void *)(*((void *)&v23 + 1) + 8 * i), a4, (void)v23);
          if (!v20)
          {

            goto LABEL_23;
          }
          v21 = (void *)v20;
          [v11 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if ([v11 count])
    {
      uint64_t v9 = (void *)[v11 copy];
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Medical codings has no valid text or coding");
LABEL_23:
      uint64_t v9 = 0;
    }

    goto LABEL_25;
  }
  uint64_t v9 = 0;
LABEL_25:

LABEL_26:
  return v9;
}

+ (id)_transformArray:(id)a3 error:(id *)a4 transformBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, id *))a5;
  objc_opt_class();
  uint64_t v9 = HKSafeObject();

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = v8[2](v8, *(void *)(*((void *)&v20 + 1) + 8 * i), a4);
          if (!v16)
          {

            id v18 = 0;
            goto LABEL_12;
          }
          uint64_t v17 = (void *)v16;
          objc_msgSend(v10, "addObject:", v16, (void)v20);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v18 = v10;
LABEL_12:
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)medicalCodingCollectionArrayWithCodeableConcepts:(id)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __93__HDHealthRecordsExtractionUtilities_medicalCodingCollectionArrayWithCodeableConcepts_error___block_invoke;
  v6[3] = &__block_descriptor_40_e12__24__0_8__16l;
  v6[4] = a1;
  id v4 = [a1 _transformArray:a3 error:a4 transformBlock:v6];
  return v4;
}

uint64_t __93__HDHealthRecordsExtractionUtilities_medicalCodingCollectionArrayWithCodeableConcepts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) medicalCodingCollectionWithCodeableConcept:a2 error:a3];
}

+ (id)medicalCodingsWithCodeableConcepts:(id)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__HDHealthRecordsExtractionUtilities_medicalCodingsWithCodeableConcepts_error___block_invoke;
  v6[3] = &__block_descriptor_40_e12__24__0_8__16l;
  v6[4] = a1;
  id v4 = [a1 _transformArray:a3 error:a4 transformBlock:v6];
  return v4;
}

uint64_t __79__HDHealthRecordsExtractionUtilities_medicalCodingsWithCodeableConcepts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) medicalCodingsWithCodeableConcept:a2 error:a3];
}

+ (id)medicalCodingsArrayWithCodeableConcept:(id)a3 error:(id *)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = [a1 medicalCodingsWithCodeableConcept:a3 error:a4];
  v7[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v5;
}

+ (id)medicalCodingWithCode:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = [&unk_26E6B35B8 objectForKeyedSubscript:v4];
    id v7 = (void *)MEMORY[0x263F0A4A0];
    uint64_t v8 = [MEMORY[0x263F0A4B0] FHIRQuantityComparatorSystem];
    id v5 = [v7 medicalCodingWithSystem:v8 codingVersion:0 code:v4 displayString:v6];
  }
  return v5;
}

+ (id)codedQuantityWithQuantity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (!v7)
  {
    uint64_t v12 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", @"value", a4);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 stringValue];
    if (!v10)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Unable to convert number to string");
LABEL_10:
      uint64_t v12 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"unit"))
    {
      uint64_t v11 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"unit", a4);
      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"system"))
    {
      uint64_t v13 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"system", a4);
      if (!v13)
      {
        uint64_t v12 = 0;
        goto LABEL_29;
      }
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:v13];
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"code"))
    {
      uint64_t v16 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"code", a4);
      if (!v16)
      {
        uint64_t v12 = 0;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      id v18 = 0;
      if (!(v11 | v15)) {
        goto LABEL_21;
      }
    }
    id v18 = [MEMORY[0x263F0A4A0] medicalCodingWithSystem:v15 codingVersion:0 code:v16 displayString:v11];
    uint64_t v17 = (void *)v16;
LABEL_21:
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"comparator"))
    {
      uint64_t v19 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"comparator", a4);
      if (!v19
        || (long long v20 = (void *)v19,
            [a1 medicalCodingWithCode:v19 error:a4],
            long long v21 = objc_claimAutoreleasedReturnValue(),
            v20,
            !v21))
      {
        uint64_t v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      long long v21 = 0;
    }
    uint64_t v12 = [MEMORY[0x263F0A1D8] codedQuantityWithValue:v10 comparatorCoding:v21 unitCoding:v18];

    goto LABEL_27;
  }
  uint64_t v12 = 0;
LABEL_31:

LABEL_32:
  return v12;
}

+ (id)ratioValueWithRatio:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"numerator"];
    uint64_t v9 = [a1 codedQuantityWithQuantity:v8 error:a4];

    if (v9)
    {
      id v10 = [v6 objectForKeyedSubscript:@"denominator"];
      uint64_t v11 = [a1 codedQuantityWithQuantity:v10 error:a4];

      if (v11)
      {
        uint64_t v12 = [MEMORY[0x263F0A690] ratioValueWithNumerator:v9 andDenominator:v11];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)stringWithAttachment:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (!v7)
  {
    uint64_t v16 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"contentType", a4);
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8)
  {
    if (v8 == @"text/plain"
      || (char v10 = [(__CFString *)v8 isEqualToString:@"text/plain"],
          v9 == @"application/rtf")
      || (v10 & 1) != 0
      || ([(__CFString *)v9 isEqualToString:@"application/rtf"] & 1) != 0)
    {
      uint64_t v11 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"data", a4);
      if (v11)
      {
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v11 options:0];
        uint64_t v13 = v12;
        if (v12 && [v12 length])
        {
          uint64_t v14 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
          if (v14)
          {
            uint64_t v15 = [a1 stringWithRTF:v14 error:a4];
            uint64_t v16 = v15;
            if (v15)
            {
              id v17 = v15;
            }
            else
            {
              objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Error RTF scrubbing valueAttachment.data");
              _HKInitializeLogging();
              v34 = *MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
                +[HDHealthRecordsExtractionUtilities stringWithAttachment:error:](v34, v35, v36, v37, v38, v39, v40, v41);
              }
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Decoded valueAttachment.data is not a UTF8 String");
            _HKInitializeLogging();
            long long v26 = *MEMORY[0x263F09908];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
              +[HDHealthRecordsExtractionUtilities stringWithAttachment:error:](v26, v27, v28, v29, v30, v31, v32, v33);
            }
            uint64_t v16 = 0;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Could not Base64 decode valueAttachment.data");
          _HKInitializeLogging();
          id v18 = *MEMORY[0x263F09908];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
            +[HDHealthRecordsExtractionUtilities stringWithAttachment:error:](v18, v19, v20, v21, v22, v23, v24, v25);
          }
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }

      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Unsupported MIME type for valueAttachment.contentType %@", v9);
  }
  uint64_t v16 = 0;
LABEL_29:

LABEL_30:
  return v16;
}

+ (id)observationCategoryWithObservationCategory:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", a3);
  if (v5)
  {
    uint64_t v20 = a4;
    if (observationCategoryWithObservationCategory_error__onceToken != -1) {
      dispatch_once(&observationCategoryWithObservationCategory_error__onceToken, &__block_literal_global);
    }
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v21 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "codingSystem", v20);
          if ([v14 isEqual:observationCategoryWithObservationCategory_error__observationCategorySystem])
          {
            uint64_t v15 = [v13 code];

            if (!v15) {
              continue;
            }
            uint64_t v16 = [v13 code];
            uint64_t v14 = HKDiagnosticTestResultCategoryFromNSString();

            if (v14)
            {
              [v6 addObject:v14];
            }
            else
            {
              id v17 = [v13 code];
              [v7 addObject:v17];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    id v18 = +[HDHealthRecordsExtractionUtilities preferredSupporedCategory:v6 unsupportedCategories:v7 error:v20];

    id v5 = v21;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __87__HDHealthRecordsExtractionUtilities_observationCategoryWithObservationCategory_error___block_invoke()
{
  observationCategoryWithObservationCategory_error__observationCategorySystem = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:@"http://hl7.org/fhir/observation-category"];
  return MEMORY[0x270F9A758]();
}

+ (id)observationCategoryWithObservationCategories:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(a1, "medicalCodingCollectionArrayWithCodeableConcepts:error:", a3);
  if (!v5)
  {
    long long v23 = 0;
    goto LABEL_29;
  }
  uint64_t v32 = a4;
  if (observationCategoryWithObservationCategories_error__onceToken != -1) {
    dispatch_once(&observationCategoryWithObservationCategories_error__onceToken, &__block_literal_global_535);
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v33 = v5;
  id v34 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v5;
  uint64_t v29 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v29) {
    goto LABEL_25;
  }
  uint64_t v8 = *(void *)v40;
  uint64_t v31 = v7;
  uint64_t v28 = *(void *)v40;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(v7);
      }
      uint64_t v30 = v9;
      uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v11 = [v10 codings];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (!v12) {
        goto LABEL_23;
      }
      uint64_t v13 = v12;
      int v14 = 0;
      uint64_t v15 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v18 = [v17 codingSystem];
          if ([v18 isEqual:observationCategoryWithObservationCategories_error__observationCategorySystem])
          {
            uint64_t v19 = [v17 code];

            if (!v19) {
              continue;
            }
            uint64_t v20 = [v17 code];
            id v18 = HKDiagnosticTestResultCategoryFromNSString();

            if (v18)
            {
              [v6 addObject:v18];
              if (v14 > 0)
              {
                long long v24 = (void *)MEMORY[0x263F087E8];
                long long v25 = [v6 allObjects];
                long long v26 = [v25 componentsJoinedByString:@", "];
                objc_msgSend(v24, "hk_assignError:code:format:", v32, 3, @"More than 1 supported Observation category in same R4 coding: %@", v26);

                long long v23 = 0;
                long long v22 = v34;
                goto LABEL_27;
              }
              int v14 = 1;
            }
            else
            {
              uint64_t v21 = [v17 code];
              [v34 addObject:v21];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_23:

      uint64_t v9 = v30 + 1;
      id v7 = v31;
      uint64_t v8 = v28;
    }
    while (v30 + 1 != v29);
    uint64_t v29 = [v31 countByEnumeratingWithState:&v39 objects:v44 count:16];
  }
  while (v29);
LABEL_25:

  long long v22 = v34;
  long long v23 = +[HDHealthRecordsExtractionUtilities preferredSupporedCategory:v6 unsupportedCategories:v34 error:v32];
LABEL_27:

  id v5 = v33;
LABEL_29:

  return v23;
}

uint64_t __89__HDHealthRecordsExtractionUtilities_observationCategoryWithObservationCategories_error___block_invoke()
{
  observationCategoryWithObservationCategories_error__observationCategorySystem = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/observation-category"];
  return MEMORY[0x270F9A758]();
}

+ (id)preferredSupporedCategory:(id)a3 unsupportedCategories:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count] && !objc_msgSend(v7, "count"))
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = [v8 allObjects];
    int v14 = [v13 componentsJoinedByString:@", "];
    objc_msgSend(v12, "hk_assignError:code:format:", a5, 3, @"unsupported Observation categories: %@", v14);
  }
  else
  {
    if ((unint64_t)[v7 count] < 2)
    {
      id v10 = [v7 anyObject];
      goto LABEL_8;
    }
    uint64_t v9 = (void *)*MEMORY[0x263F09510];
    if ([v7 containsObject:*MEMORY[0x263F09510]]
      || (uint64_t v9 = (void *)*MEMORY[0x263F09508], [v7 containsObject:*MEMORY[0x263F09508]]))
    {
      id v10 = v9;
LABEL_8:
      uint64_t v11 = v10;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 3, @"No supported Observation categories found");
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

+ (id)referenceRangesWithObservationReferenceRanges:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(a1, "referenceRangeWithObservationReferenceRange:error:", *(void *)(*((void *)&v18 + 1) + 8 * i), a4, (void)v18);
          if (!v14)
          {

            id v16 = 0;
            goto LABEL_12;
          }
          uint64_t v15 = (void *)v14;
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v16 = v8;
LABEL_12:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)referenceRangeWithObservationReferenceRange:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (!v7) {
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"low"))
  {
    id v8 = [v6 objectForKeyedSubscript:@"low"];
    id v9 = [a1 codedQuantityWithQuantity:v8 error:a4];

    if (!v9)
    {
LABEL_4:
      uint64_t v10 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    id v9 = 0;
  }
  if (!objc_msgSend(v6, "hk_hasValueForKeyPath:", @"high"))
  {
    uint64_t v12 = 0;
LABEL_10:
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"meaning"))
    {
      uint64_t v13 = [v6 objectForKeyedSubscript:@"meaning"];
      uint64_t v14 = [a1 medicalCodingsWithCodeableConcept:v13 error:a4];

      if (!v14)
      {
        uint64_t v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = __Block_byref_object_copy_;
    long long v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__HDHealthRecordsExtractionUtilities_referenceRangeWithObservationReferenceRange_error___block_invoke;
    v17[3] = &unk_264BD9870;
    v17[4] = &v18;
    [v14 enumerateObjectsUsingBlock:v17];
    if (v9 && v12)
    {
      uint64_t v15 = [MEMORY[0x263F0A698] referenceRangeWithIdentifier:v19[5] minValue:v9 maxValue:v12];
    }
    else if (v9)
    {
      uint64_t v15 = [MEMORY[0x263F0A698] referenceRangeWithIdentifier:v19[5] minValue:v9];
    }
    else
    {
      if (!v12)
      {
        if ((objc_msgSend(v6, "hk_hasValueForKeyPath:", @"text") & 1) == 0) {
          objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Observation.ReferenceRange missing high, low and text");
        }
        uint64_t v10 = 0;
        goto LABEL_22;
      }
      uint64_t v15 = [MEMORY[0x263F0A698] referenceRangeWithIdentifier:v19[5] maxValue:v12];
    }
    uint64_t v10 = (void *)v15;
LABEL_22:
    _Block_object_dispose(&v18, 8);

    goto LABEL_23;
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"high"];
  uint64_t v12 = [a1 codedQuantityWithQuantity:v11 error:a4];

  if (v12) {
    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_24:

LABEL_25:
  return v10;
}

void __88__HDHealthRecordsExtractionUtilities_referenceRangeWithObservationReferenceRange_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = [v12 codingSystem];
  id v7 = [MEMORY[0x263F0A4B0] textSystem];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v12 displayString];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

+ (id)medicalCodingWithObservationStatus:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F0A4A0];
    id v7 = [MEMORY[0x263F0A4B0] FHIRObservationStatus];
    id v5 = [v6 medicalCodingWithSystem:v7 codingVersion:*MEMORY[0x263F09978] code:v4 displayString:0];
  }
  return v5;
}

+ (id)medicalCodingWithMedicationStatementStatusCode:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F0A4A0];
    id v7 = [MEMORY[0x263F0A4B0] FHIRMedicationStatementStatus];
    id v5 = [v6 medicalCodingWithSystem:v7 codingVersion:*MEMORY[0x263F09978] code:v4 displayString:0];
  }
  return v5;
}

+ (id)BOOLeanNotDoneFromStatusCode:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = NSNumber;
    id v7 = [v4 lowercaseString];
    id v5 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isEqualToString:", @"not-done"));
  }
  return v5;
}

+ (id)BOOLeanNotTakenFromStatusCode:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = NSNumber;
    id v7 = [v4 lowercaseString];
    id v5 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isEqualToString:", @"not-taken"));
  }
  return v5;
}

+ (id)medicalCodingsWithReference:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (v6)
  {
    if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"display"))
    {
      id v6 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"display", a4);
      if (!v6) {
        goto LABEL_7;
      }
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      int v8 = (void *)MEMORY[0x263F0A4A0];
      uint64_t v9 = [MEMORY[0x263F0A4B0] textSystem];
      uint64_t v10 = [v8 medicalCodingWithSystem:v9 codingVersion:*MEMORY[0x263F09998] code:v6 displayString:v6];
      [v7 addObject:v10];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v6 = (void *)[v7 copy];
  }
LABEL_7:

  return v6;
}

+ (id)resourceReferencedBy:(id)a3 containedIn:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  uint64_t v9 = HKSafeObject();

  if (v9)
  {
    uint64_t v10 = +[HDFHIRReferenceProcessor resourceReferenceInReference:v7 error:a5];
    if (v10)
    {
      uint64_t v11 = +[HDFHIRReferenceProcessor resourceContainedInResource:v8 reference:v10 error:a5];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)inspectableValueWithObservationValues:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueQuantity"))
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"valueQuantity"];
    id v12 = [a1 codedQuantityWithQuantity:v11 error:a5];

    if (!v12) {
      goto LABEL_51;
    }
    uint64_t v13 = [MEMORY[0x263F0A450] inspectableValueWithCodedQuantity:v12];
    [v10 addObject:v13];
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueCodeableConcept"))
  {
    uint64_t v14 = [v8 objectForKeyedSubscript:@"valueCodeableConcept"];
    uint64_t v15 = [a1 medicalCodingsWithCodeableConcept:v14 error:a5];

    if (!v15) {
      goto LABEL_51;
    }
    id v16 = [MEMORY[0x263F0A450] inspectableValueWithMedicalCodings:v15];
    [v10 addObject:v16];
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueString"))
  {
    uint64_t v17 = objc_msgSend(v8, "hk_safeStringForKeyPath:error:", @"valueString", a5);
    if (!v17) {
      goto LABEL_51;
    }
    uint64_t v18 = (void *)v17;
    long long v19 = [MEMORY[0x263F0A450] inspectableValueWithString:v17];
    [v10 addObject:v19];
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueBoolean")
    && ([v9 FHIRRelease],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        long long v21 = (void *)*MEMORY[0x263F09558],
        v20,
        v20 == v21))
  {
    uint64_t v22 = objc_msgSend(v8, "hk_safeNumberForKeyPath:error:", @"valueBoolean", a5);
    if (!v22) {
      goto LABEL_51;
    }
    id v23 = (void *)v22;
    long long v24 = [MEMORY[0x263F0A450] inspectableValueWithBoolean:v22];
    [v10 addObject:v24];
  }
  else if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", @"valueBoolean", a5))
  {
    goto LABEL_51;
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueInteger")
    && ([v9 FHIRRelease],
        long long v25 = objc_claimAutoreleasedReturnValue(),
        long long v26 = (void *)*MEMORY[0x263F09558],
        v25,
        v25 == v26))
  {
    uint64_t v27 = objc_msgSend(v8, "hk_safeNumberForKeyPath:error:", @"valueInteger", a5);
    if (!v27) {
      goto LABEL_51;
    }
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [MEMORY[0x263F0A450] inspectableValueWithInteger:v27];
    [v10 addObject:v29];
  }
  else if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", @"valueInteger", a5))
  {
    goto LABEL_51;
  }
  if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", @"valueRange", a5)) {
    goto LABEL_51;
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueRatio"))
  {
    uint64_t v30 = [v8 objectForKeyedSubscript:@"valueRatio"];
    uint64_t v31 = [a1 ratioValueWithRatio:v30 error:a5];

    if (!v31) {
      goto LABEL_51;
    }
    uint64_t v32 = [MEMORY[0x263F0A450] inspectableValueWithRatio:v31];
    [v10 addObject:v32];
  }
  if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", @"valueSampledData", a5)) {
    goto LABEL_51;
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueAttachment")
    && ([v9 FHIRRelease],
        uint64_t v33 = objc_claimAutoreleasedReturnValue(),
        id v34 = (void *)*MEMORY[0x263F09550],
        v33,
        v33 == v34))
  {
    long long v35 = [v8 objectForKeyedSubscript:@"valueAttachment"];
    long long v36 = [a1 stringWithAttachment:v35 error:a5];

    if (!v36) {
      goto LABEL_51;
    }
    long long v37 = [MEMORY[0x263F0A450] inspectableValueWithString:v36];
    [v10 addObject:v37];
  }
  else if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", @"valueAttachment", a5))
  {
    goto LABEL_51;
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueTime"))
  {
    uint64_t v38 = objc_msgSend(v8, "hk_safeStringForKeyPath:error:", @"valueTime", a5);
    if (!v38) {
      goto LABEL_51;
    }
    long long v39 = (void *)v38;
    uint64_t v40 = [a1 timeSinceMidnightWithTimeString:v38 error:a5];
    if (!v40) {
      goto LABEL_50;
    }
    long long v41 = (void *)v40;
    long long v42 = [MEMORY[0x263F0A450] inspectableValueWithDateComponents:v40];
    [v10 addObject:v42];
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valueDateTime"))
  {
    uint64_t v43 = objc_msgSend(v8, "hk_safeStringForKeyPath:error:", @"valueDateTime", a5);
    if (!v43) {
      goto LABEL_51;
    }
    long long v39 = (void *)v43;
    uint64_t v44 = [a1 medicalDateWithDateTimeString:v43 error:a5];
    if (!v44) {
      goto LABEL_50;
    }
    uint64_t v45 = (void *)v44;
    v46 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDate:v44];
    [v10 addObject:v46];
  }
  if (!objc_msgSend(v8, "hk_hasValueForKeyPath:", @"valuePeriod")) {
    goto LABEL_45;
  }
  uint64_t v47 = objc_msgSend(v8, "hk_safeDictionaryForKeyPath:error:", @"valuePeriod", a5);
  if (!v47) {
    goto LABEL_51;
  }
  long long v39 = (void *)v47;
  uint64_t v48 = [a1 medicalDateIntervalWithPeriod:v47 error:a5];
  if (!v48)
  {
LABEL_50:

    goto LABEL_51;
  }
  v49 = (void *)v48;
  v50 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDateInterval:v48];
  [v10 addObject:v50];

LABEL_45:
  if (!objc_msgSend(v8, "hk_hasValueForKeyPath:", @"dataAbsentReason")) {
    goto LABEL_48;
  }
  v51 = [v8 objectForKeyedSubscript:@"dataAbsentReason"];
  v52 = [a1 medicalCodingsWithCodeableConcept:v51 error:a5];

  if (!v52)
  {
LABEL_51:
    v54 = 0;
    goto LABEL_52;
  }
  v53 = [MEMORY[0x263F0A450] inspectableValueWithDataAbsentReasonCodings:v52];
  [v10 addObject:v53];

LABEL_48:
  if ((unint64_t)[v10 count] >= 2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"Encountered values of more than one type");
    goto LABEL_51;
  }
  v54 = [v10 firstObject];
LABEL_52:

  return v54;
}

+ (id)inspectableValueWithAbatementValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"abatementAge"))
    {
      id v9 = [v6 objectForKeyedSubscript:@"abatementAge"];
      id v10 = [a1 codedQuantityWithQuantity:v9 error:a4];

      if (!v10) {
        goto LABEL_26;
      }
      uint64_t v11 = [MEMORY[0x263F0A450] inspectableValueWithCodedQuantity:v10];
      [v8 addObject:v11];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"abatementQuantity"))
    {
      id v12 = [v6 objectForKeyedSubscript:@"abatementQuantity"];
      uint64_t v13 = [a1 codedQuantityWithQuantity:v12 error:a4];

      if (!v13) {
        goto LABEL_26;
      }
      uint64_t v14 = [MEMORY[0x263F0A450] inspectableValueWithCodedQuantity:v13];
      [v8 addObject:v14];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"abatementDateTime"))
    {
      uint64_t v15 = [v6 objectForKeyedSubscript:@"abatementDateTime"];
      id v16 = [a1 medicalDateWithDateTimeString:v15 error:a4];

      if (!v16) {
        goto LABEL_26;
      }
      uint64_t v17 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDate:v16];
      [v8 addObject:v17];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"abatementBoolean"))
    {
      uint64_t v18 = objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", @"abatementBoolean", a4);
      if (!v18) {
        goto LABEL_26;
      }
      long long v19 = v18;
      if ([v18 BOOLValue]) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      long long v21 = [MEMORY[0x263F0A450] inspectableValueWithString:v20];
      [v8 addObject:v21];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"abatementPeriod"))
    {
      uint64_t v22 = [v6 objectForKeyedSubscript:@"abatementPeriod"];
      id v23 = [a1 medicalDateIntervalWithPeriod:v22 error:a4];

      if (!v23) {
        goto LABEL_26;
      }
      long long v24 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDateInterval:v23];
      [v8 addObject:v24];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"abatementString"))
    {
      uint64_t v25 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"abatementString", a4);
      if (!v25) {
        goto LABEL_26;
      }
      long long v26 = (void *)v25;
      uint64_t v27 = [MEMORY[0x263F0A450] inspectableValueWithString:v25];
      [v8 addObject:v27];
    }
    if (objc_msgSend(v6, "hk_expectMissingKeyPath:error:", @"abatementRange", a4))
    {
      if ((unint64_t)[v8 count] < 2)
      {
        uint64_t v28 = [v8 firstObject];
        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Encountered values of more than one type");
    }
LABEL_26:
    uint64_t v28 = 0;
LABEL_27:

    goto LABEL_29;
  }
  uint64_t v28 = 0;
LABEL_29:

  return v28;
}

+ (id)medicalCodingWithConditionClinicalStatusCode:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRConditionClinicalStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithConditionVerificationStatusCode:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRConditionVerificationStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)inspectableValueWithOnsetValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"onsetQuantity"))
    {
      id v9 = [v6 objectForKeyedSubscript:@"onsetQuantity"];
      id v10 = [a1 codedQuantityWithQuantity:v9 error:a4];

      if (!v10) {
        goto LABEL_17;
      }
      uint64_t v11 = [MEMORY[0x263F0A450] inspectableValueWithCodedQuantity:v10];
      [v8 addObject:v11];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"onsetDateTime"))
    {
      id v12 = [v6 objectForKeyedSubscript:@"onsetDateTime"];
      uint64_t v13 = [a1 medicalDateWithDateTimeString:v12 error:a4];

      if (!v13) {
        goto LABEL_17;
      }
      uint64_t v14 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDate:v13];
      [v8 addObject:v14];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"onsetPeriod"))
    {
      uint64_t v15 = [v6 objectForKeyedSubscript:@"onsetPeriod"];
      id v16 = [a1 medicalDateIntervalWithPeriod:v15 error:a4];

      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDateInterval:v16];
      [v8 addObject:v17];
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"onsetString"))
    {
      uint64_t v18 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"onsetString", a4);
      if (!v18) {
        goto LABEL_17;
      }
      long long v19 = (void *)v18;
      uint64_t v20 = [MEMORY[0x263F0A450] inspectableValueWithString:v18];
      [v8 addObject:v20];
    }
    if (objc_msgSend(v6, "hk_expectMissingKeyPath:error:", @"onsetRange", a4))
    {
      if ((unint64_t)[v8 count] < 2)
      {
        long long v21 = [v8 firstObject];
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Encountered values of more than one type");
    }
LABEL_17:
    long long v21 = 0;
LABEL_18:

    goto LABEL_20;
  }
  long long v21 = 0;
LABEL_20:

  return v21;
}

+ (id)conditionClinicalStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6 = conditionClinicalStatusCodingWithCodeableConcept_error__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&conditionClinicalStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_596);
  }
  id v8 = [a1 _firstCodingForSystem:conditionClinicalStatusCodingWithCodeableConcept_error__conditionClinicalStatusCoding inCodeableConcept:v7 error:a4];

  return v8;
}

uint64_t __93__HDHealthRecordsExtractionUtilities_conditionClinicalStatusCodingWithCodeableConcept_error___block_invoke()
{
  conditionClinicalStatusCodingWithCodeableConcept_error__conditionClinicalStatusCoding = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/condition-clinical"];
  return MEMORY[0x270F9A758]();
}

+ (id)conditionVerificationStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6 = conditionVerificationStatusCodingWithCodeableConcept_error__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&conditionVerificationStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_601);
  }
  id v8 = [a1 _firstCodingForSystem:conditionVerificationStatusCodingWithCodeableConcept_error__conditionVerificationStatusCoding inCodeableConcept:v7 error:a4];

  return v8;
}

uint64_t __97__HDHealthRecordsExtractionUtilities_conditionVerificationStatusCodingWithCodeableConcept_error___block_invoke()
{
  conditionVerificationStatusCodingWithCodeableConcept_error__conditionVerificationStatusCoding = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/condition-ver-status"];
  return MEMORY[0x270F9A758]();
}

+ (id)enteredInErrorWithConditionVerificationStatusCodeableConcept:(id)a3 error:(id *)a4
{
  id v5 = [a1 conditionVerificationStatusCodingWithCodeableConcept:a3 error:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = NSNumber;
    id v8 = [v5 code];
    id v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v8));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)medicalCodingWithCoverageStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRCoverageStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)coverageClassificationWithClassElements:(id)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__HDHealthRecordsExtractionUtilities_coverageClassificationWithClassElements_error___block_invoke;
  v6[3] = &__block_descriptor_40_e26__24__0__NSDictionary_8__16l;
  v6[4] = a1;
  id v4 = [a1 _transformArray:a3 error:a4 transformBlock:v6];
  return v4;
}

id __84__HDHealthRecordsExtractionUtilities_coverageClassificationWithClassElements_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  uint64_t v6 = HKSafeObject();

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 objectForKeyedSubscript:@"type"];
    id v9 = [v7 medicalCodingsWithCodeableConcept:v8 error:a3];

    if (v9)
    {
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"value"))
      {
        id v10 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"value", a3);
      }
      else
      {
        id v10 = 0;
      }
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"name"))
      {
        id v12 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"name", a3);
      }
      else
      {
        id v12 = 0;
      }
      uint64_t v11 = [MEMORY[0x263F0A290] coverageClassificationWithTypeCodings:v9 value:v10 name:v12];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)medicalCodingWithDeviceStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRDeviceStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)medicalCodingWithCarePlanStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRCarePlanStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithGoalStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRGoalStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithDiagnosticReportStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRDiagnosticReportStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithEventStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIREventStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)medicalCodingWithImmunizationStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRImmunizationStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)medicalCodingWithMedicationAdminStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRMedicationAdminStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithMedicationDispenseStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRMedicationDispenseStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithR4MedicationDispenseStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRMedicationDispenseStatusR4];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)medicalCodingWithMedicationOrderStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRMedicationOrderStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithR4MedicationRequestStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRMedicationRequestStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)medicalCodingWithProcedureStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRProcedureStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceStatusCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRAllergyIntoleranceStatus];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceCategoryCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRAllergyIntoleranceCategory];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceCriticalityCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRAllergyIntoleranceCriticality];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceSeverityCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRAllergyIntoleranceSeverity];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceTypeCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRAllergyIntoleranceType];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09978] error:a4];

  return v9;
}

+ (id)medicalCodingWithR4AllergyIntoleranceCriticalityCode:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F0A4B0];
  id v7 = a3;
  id v8 = [v6 FHIRAllergyIntoleranceCriticality];
  id v9 = [a1 _FHIRMedicalCodingWithCode:v7 medicalCodingSystem:v8 codingVersion:*MEMORY[0x263F09980] error:a4];

  return v9;
}

+ (id)allergyIntoleranceClinicalStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6 = allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_612);
  }
  id v8 = [a1 _firstCodingForSystem:allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__codingSystem inCodeableConcept:v7 error:a4];

  return v8;
}

uint64_t __102__HDHealthRecordsExtractionUtilities_allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error___block_invoke()
{
  allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__codingSystem = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"];
  return MEMORY[0x270F9A758]();
}

+ (id)allergyIntoleranceVerificationStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6 = allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__onceToken;
  id v7 = a3;
  if (v6 != -1) {
    dispatch_once(&allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_617);
  }
  id v8 = [a1 _firstCodingForSystem:allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__codingSystem inCodeableConcept:v7 error:a4];

  return v8;
}

uint64_t __106__HDHealthRecordsExtractionUtilities_allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error___block_invoke()
{
  allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__codingSystem = [MEMORY[0x263F0A4B0] codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"];
  return MEMORY[0x270F9A758]();
}

+ (id)enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept:(id)a3 error:(id *)a4
{
  id v5 = [a1 allergyIntoleranceVerificationStatusCodingWithCodeableConcept:a3 error:a4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = NSNumber;
    id v8 = [v5 code];
    id v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v8));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)allergyReactionsWithAllergyIntoleranceReaction:(id)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__HDHealthRecordsExtractionUtilities_allergyReactionsWithAllergyIntoleranceReaction_error___block_invoke;
  v6[3] = &__block_descriptor_40_e26__24__0__NSDictionary_8__16l;
  v6[4] = a1;
  id v4 = [a1 _transformArray:a3 error:a4 transformBlock:v6];
  return v4;
}

id __91__HDHealthRecordsExtractionUtilities_allergyReactionsWithAllergyIntoleranceReaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  uint64_t v6 = HKSafeObject();

  if (!v6)
  {
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 objectForKeyedSubscript:@"manifestation"];
  id v9 = [v7 medicalCodingsWithCodeableConcepts:v8 error:a3];

  if (!v9) {
    goto LABEL_5;
  }
  if (!objc_msgSend(v5, "hk_hasValueForKeyPath:", @"onset"))
  {
    id v12 = 0;
LABEL_8:
    if (objc_msgSend(v5, "hk_hasValueForKeyPath:", @"severity"))
    {
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = [v5 objectForKeyedSubscript:@"severity"];
      id v16 = [v14 medicalCodingWithAllergyIntoleranceSeverityCode:v15 error:a3];

      if (!v16)
      {
        uint64_t v13 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      id v16 = 0;
    }
    uint64_t v13 = [MEMORY[0x263F0A0A0] allergyReactionWithManifestationCodings:v9 onsetDate:v12 severityCoding:v16];

    goto LABEL_13;
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v5 objectForKeyedSubscript:@"onset"];
  id v12 = [v10 medicalDateWithDateTimeString:v11 error:a3];

  if (v12) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v13 = 0;
LABEL_14:

LABEL_15:
  return v13;
}

+ (id)identifierWithReference:(id)a3 parentResource:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[HDFHIRReferenceProcessor resourceReferenceInReference:a3 error:a5];
  if (!v8) {
    goto LABEL_5;
  }
  if (+[HDFHIRReferenceProcessor referenceRequiresContaining:v8])
  {
    uint64_t v9 = +[HDFHIRReferenceProcessor resourceContainedInResource:v7 reference:v8 error:a5];
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = +[HDFHIRReferenceProcessor identifierForResource:v9 containedInResource:v7 error:a5];
LABEL_8:
      id v12 = (void *)v11;

      goto LABEL_10;
    }
LABEL_5:
    id v12 = 0;
    goto LABEL_10;
  }
  if (+[HDFHIRReferenceProcessor referenceIsAbsolute:v8])
  {
    id v10 = [NSURL URLWithString:v8];
    uint64_t v11 = +[HDFHIRReferenceProcessor identifierFromAbsoluteReferenceURL:v10];
    goto LABEL_8;
  }
  id v12 = [MEMORY[0x263F0A360] FHIRIdentifierWithString:v8 error:a5];
LABEL_10:

  return v12;
}

+ (id)identifiersWithReferences:(id)a3 parentResource:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  id v10 = HKSafeObject();

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(a1, "identifierWithReference:parentResource:error:", *(void *)(*((void *)&v21 + 1) + 8 * i), v9, a5, (void)v21);
          if (!v17)
          {

            long long v19 = 0;
            goto LABEL_12;
          }
          uint64_t v18 = (void *)v17;
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    long long v19 = (void *)[v11 copy];
LABEL_12:
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

+ (id)identifierFromReference:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    id v8 = objc_msgSend(v6, "hk_safeDictionaryIfExistsForKeyPath:error:", @"identifier", a4);
    id v9 = v8;
    if (v8)
    {
      id v10 = objc_msgSend(v8, "hk_safeDictionaryIfExistsForKeyPath:error:", @"type", a4);
      if (v10)
      {
        id v11 = [a1 medicalCodingsWithCodeableConcept:v10 error:a4];
        id v12 = objc_msgSend(v9, "hk_safeStringIfExistsForKeyPath:error:", @"value", a4);
        uint64_t v13 = [MEMORY[0x263F0A368] identifierWithTypeCodings:v11 value:v12];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)codedValueWithObservationComponent:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  id v10 = HKSafeObject();

  if (!v10)
  {
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  id v11 = [v8 objectForKeyedSubscript:@"code"];
  id v12 = [a1 medicalCodingsWithCodeableConcept:v11 error:a5];

  if (!v12) {
    goto LABEL_5;
  }
  if (!objc_msgSend(v8, "hk_hasValueForKeyPath:", @"referenceRange"))
  {
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = [v8 objectForKeyedSubscript:@"referenceRange"];
  uint64_t v14 = [a1 referenceRangesWithObservationReferenceRanges:v13 error:a5];

  if (v14)
  {
LABEL_8:
    id v16 = [a1 inspectableValueWithObservationValues:v8 FHIRVersion:v9 error:a5];
    if (v16)
    {
      uint64_t v15 = [MEMORY[0x263F0A1E0] codedValueWithCodings:v12 value:v16 referenceRanges:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }

    goto LABEL_12;
  }
LABEL_5:
  uint64_t v15 = 0;
LABEL_12:

LABEL_13:
  return v15;
}

+ (id)inspectableValueCollectionWithQuantity:(id)a3 error:(id *)a4
{
  id v4 = [a1 codedQuantityWithQuantity:a3 error:a4];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F0A458];
    id v6 = [MEMORY[0x263F0A450] inspectableValueWithCodedQuantity:v4];
    id v7 = [v5 inspectableValueCollectionSingleWithValue:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)inspectableValueCollectionWithRatio:(id)a3 error:(id *)a4
{
  id v4 = [a1 ratioValueWithRatio:a3 error:a4];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F0A458];
    id v6 = [MEMORY[0x263F0A450] inspectableValueWithRatio:v4];
    id v7 = [v5 inspectableValueCollectionSingleWithValue:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)inspectableValueCollectionWithString:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F0A458];
    id v7 = [MEMORY[0x263F0A450] inspectableValueWithString:v4];
    id v5 = [v6 inspectableValueCollectionSingleWithValue:v7];
  }
  return v5;
}

+ (id)inspectableValueCollectionWithCodeableConcept:(id)a3 error:(id *)a4
{
  id v4 = [a1 medicalCodingsWithCodeableConcept:a3 error:a4];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F0A458];
    id v6 = [MEMORY[0x263F0A450] inspectableValueWithMedicalCodings:v4];
    id v7 = [v5 inspectableValueCollectionSingleWithValue:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)inspectableValueCollectionWithObservationComponents:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  id v10 = HKSafeObject();

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(a1, "codedValueWithObservationComponent:FHIRVersion:error:", *(void *)(*((void *)&v23 + 1) + 8 * i), v9, a5, (void)v23);
          if (!v17)
          {
            long long v21 = 0;
            goto LABEL_12;
          }
          uint64_t v18 = (void *)v17;
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v12 = [MEMORY[0x263F0A1E8] codedValueCollectionWithCodedValues:v11];
    long long v19 = (void *)MEMORY[0x263F0A458];
    uint64_t v20 = [MEMORY[0x263F0A450] inspectableValueWithCodedValueCollection:v12];
    long long v21 = [v19 inspectableValueCollectionSingleWithValue:v20];

LABEL_12:
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

+ (id)inspectableValueCollectionWithObservationValues:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v22 = 0;
  id v10 = [a1 inspectableValueWithObservationValues:v8 FHIRVersion:v9 error:&v22];
  id v11 = v22;
  id v12 = v11;
  if (v10)
  {
    uint64_t v13 = [MEMORY[0x263F0A458] inspectableValueCollectionSingleWithValue:v10];
    goto LABEL_3;
  }
  if (!v11)
  {
    uint64_t v13 = 0;
LABEL_3:
    if (!objc_msgSend(v8, "hk_hasValueForKeyPath:", @"component"))
    {
      id v17 = v13;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"No Observation value provided");
        goto LABEL_24;
      }
      uint64_t v18 = 0;
LABEL_10:

LABEL_24:
      goto LABEL_25;
    }
    id v21 = v12;
    uint64_t v14 = objc_msgSend(v8, "hk_safeArrayForKeyPath:error:", @"component", &v21);
    id v15 = v21;

    if (v14)
    {
      id v20 = v15;
      id v16 = [a1 inspectableValueCollectionWithObservationComponents:v14 FHIRVersion:v9 error:&v20];
      id v12 = v20;

      if (v16)
      {

        if (v13)
        {
          objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"Encountered values of more than one type");

LABEL_23:
          id v17 = 0;
          goto LABEL_24;
        }
        id v17 = v16;
        uint64_t v18 = v17;
        goto LABEL_10;
      }
      id v12 = v12;
      if (v12)
      {
        if (!a5) {
          goto LABEL_21;
        }
LABEL_16:
        id v12 = v12;
        *a5 = v12;
      }
    }
    else
    {
      id v12 = v15;
      if (v12)
      {
        if (!a5)
        {
LABEL_21:
          _HKLogDroppedError();
          goto LABEL_22;
        }
        goto LABEL_16;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (a5)
  {
    id v12 = v11;
    id v17 = 0;
    *a5 = v12;
  }
  else
  {
    _HKLogDroppedError();
    id v17 = 0;
  }
LABEL_25:

  return v17;
}

+ (id)inspectableValueCollectionWithDateTime:(id)a3 error:(id *)a4
{
  id v4 = [a1 medicalDateWithDateTimeString:a3 error:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDate:v4];
    id v6 = [MEMORY[0x263F0A458] inspectableValueCollectionSingleWithValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)inspectableValueCollectionWithTime:(id)a3 error:(id *)a4
{
  id v4 = [a1 timeSinceMidnightWithTimeString:a3 error:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263F0A450] inspectableValueWithDateComponents:v4];
    id v6 = [MEMORY[0x263F0A458] inspectableValueCollectionSingleWithValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)inspectableValueCollectionWithPeriod:(id)a3 error:(id *)a4
{
  id v4 = [a1 medicalDateIntervalWithPeriod:a3 error:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263F0A450] inspectableValueWithMedicalDateInterval:v4];
    id v6 = [MEMORY[0x263F0A458] inspectableValueCollectionSingleWithValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (int64_t)_integerFromTextCheckingResult:(id)a3 string:(id)a4 index:(int64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [a3 rangeAtIndex:a5];
  id v10 = objc_msgSend(v7, "substringWithRange:", v8, v9);

  int64_t v11 = [v10 integerValue];
  return v11;
}

+ (id)_medicalDateWithDateTimeString:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = _DateTimeFormatRegularExpressionYearMonthDayTime();
  int64_t v11 = objc_msgSend(v10, "matchesInString:options:range:", v9, 0, location, length);
  id v12 = 0;
  if ([v11 count] == 1)
  {
    uint64_t v13 = [v11 firstObject];
    uint64_t v25 = [a1 _integerFromTextCheckingResult:v13 string:v9 index:1];
    uint64_t v14 = [a1 _integerFromTextCheckingResult:v13 string:v9 index:2];
    uint64_t v15 = [a1 _integerFromTextCheckingResult:v13 string:v9 index:3];
    uint64_t v16 = [a1 _integerFromTextCheckingResult:v13 string:v9 index:4];
    uint64_t v17 = [a1 _integerFromTextCheckingResult:v13 string:v9 index:5];
    uint64_t v18 = [a1 _integerFromTextCheckingResult:v13 string:v9 index:6];
    uint64_t v19 = [v13 rangeAtIndex:7];
    uint64_t v21 = objc_msgSend(v9, "substringWithRange:", v19, v20);
    id v22 = a5;
    long long v23 = (void *)v21;
    id v12 = [MEMORY[0x263F0A4B8] medicalDateWithYear:v25 month:v14 day:v15 hour:v16 minute:v17 second:v18 originalTimeZoneString:v21 error:v22];
  }
  return v12;
}

+ (id)_medicalDateWithOnlyDateString:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  if (_DateTimeFormatRegularExpressionYear_onceToken != -1) {
    dispatch_once(&_DateTimeFormatRegularExpressionYear_onceToken, &__block_literal_global_864);
  }
  id v10 = (id)_DateTimeFormatRegularExpressionYear_regex;
  int64_t v11 = objc_msgSend(v10, "matchesInString:options:range:", v9, 0, location, length);
  if ([v11 count] == 1)
  {
    id v12 = [v11 firstObject];
    uint64_t v13 = [a1 _integerFromTextCheckingResult:v12 string:v9 index:1];
    uint64_t v14 = [MEMORY[0x263F0A4B8] medicalDateWithYear:v13 error:a5];
LABEL_13:
    uint64_t v19 = (void *)v14;
    goto LABEL_14;
  }
  if (_DateTimeFormatRegularExpressionYearMonth_onceToken != -1) {
    dispatch_once(&_DateTimeFormatRegularExpressionYearMonth_onceToken, &__block_literal_global_869);
  }
  id v15 = (id)_DateTimeFormatRegularExpressionYearMonth_regex;

  uint64_t v16 = objc_msgSend(v15, "matchesInString:options:range:", v9, 0, location, length);

  if ([v16 count] == 1)
  {
    id v12 = [v16 firstObject];
    uint64_t v17 = [a1 _integerFromTextCheckingResult:v12 string:v9 index:1];
    uint64_t v18 = [a1 _integerFromTextCheckingResult:v12 string:v9 index:2];
    uint64_t v19 = [MEMORY[0x263F0A4B8] medicalDateWithYear:v17 month:v18 error:a5];
    int64_t v11 = v16;
    id v10 = v15;
LABEL_14:

    goto LABEL_15;
  }
  if (_DateTimeFormatRegularExpressionYearMonthDay_onceToken != -1) {
    dispatch_once(&_DateTimeFormatRegularExpressionYearMonthDay_onceToken, &__block_literal_global_874);
  }
  id v10 = (id)_DateTimeFormatRegularExpressionYearMonthDay_regex;

  int64_t v11 = objc_msgSend(v10, "matchesInString:options:range:", v9, 0, location, length);

  if ([v11 count] == 1)
  {
    id v12 = [v11 firstObject];
    uint64_t v20 = [a1 _integerFromTextCheckingResult:v12 string:v9 index:1];
    uint64_t v21 = [a1 _integerFromTextCheckingResult:v12 string:v9 index:2];
    uint64_t v22 = [a1 _integerFromTextCheckingResult:v12 string:v9 index:3];
    uint64_t v14 = [MEMORY[0x263F0A4B8] medicalDateWithYear:v20 month:v21 day:v22 error:a5];
    goto LABEL_13;
  }
  uint64_t v19 = 0;
LABEL_15:

  return v19;
}

+ (id)medicalDateWithDateTimeString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    uint64_t v8 = [v6 length];
    id v9 = objc_msgSend(a1, "_medicalDateWithDateTimeString:range:error:", v6, 0, v8, a4);
    if (!v9)
    {
      id v9 = objc_msgSend(a1, "_medicalDateWithOnlyDateString:range:error:", v6, 0, v8, a4);
      if (!v9) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"FHIR date string not parseable");
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)medicalDateWithDateString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    uint64_t v8 = [v6 length];
    id v9 = _DateTimeFormatRegularExpressionYearMonthDayTime();
    id v10 = objc_msgSend(v9, "matchesInString:options:range:", v6, 0, 0, v8);
    if ([v10 count] == 1)
    {
      _HKInitializeLogging();
      int64_t v11 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_232E63000, v11, OS_LOG_TYPE_DEFAULT, "HDHealthRecordsExtractionUtilities: received 'date' string with time, dropping time", v17, 2u);
      }
      id v12 = objc_msgSend(v6, "substringWithRange:", 0, objc_msgSend(v6, "rangeOfString:", @"T"));

      uint64_t v8 = [v12 length];
      id v6 = v12;
    }
    uint64_t v14 = objc_msgSend(a1, "_medicalDateWithOnlyDateString:range:error:", v6, 0, v8, a4);
    uint64_t v13 = v14;
    if (v14) {
      id v15 = v14;
    }
    else {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"FHIR instant string not parseable");
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)medicalDateWithInstantString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    uint64_t v8 = objc_msgSend(a1, "_medicalDateWithDateTimeString:range:error:", v6, 0, objc_msgSend(v6, "length"), a4);
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"FHIR instant string not parseable");
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)timeSinceMidnightWithTimeString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    uint64_t v8 = [v6 length];
    if (_TimeFormatRegularExpressionTimeSinceMidnight_onceToken != -1) {
      dispatch_once(&_TimeFormatRegularExpressionTimeSinceMidnight_onceToken, &__block_literal_global_879);
    }
    id v9 = objc_msgSend((id)_TimeFormatRegularExpressionTimeSinceMidnight_regex, "matchesInString:options:range:", v6, 0, 0, v8);
    if ([v9 count] == 1)
    {
      id v10 = [v9 firstObject];
      id v11 = objc_alloc_init(MEMORY[0x263EFF918]);
      objc_msgSend(v11, "setHour:", objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v10, v6, 1));
      objc_msgSend(v11, "setMinute:", objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v10, v6, 2));
      objc_msgSend(v11, "setSecond:", objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v10, v6, 3));
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"FHIR time string not parseable");
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)medicalDateIntervalWithPeriod:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (!v7) {
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"start"))
  {
    uint64_t v8 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"start", a4);
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [a1 medicalDateWithDateTimeString:v8 error:a4];

      goto LABEL_7;
    }
LABEL_5:
    id v11 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = 0;
LABEL_7:
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", @"end"))
  {
    uint64_t v12 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"end", a4);
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [a1 medicalDateWithDateTimeString:v12 error:a4];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v10 | v14)
  {
    if (v14)
    {
      if (v10) {
        [MEMORY[0x263F0A4C0] medicalDateIntervalWithStartDate:v10 endDate:v14 error:a4];
      }
      else {
      id v11 = [MEMORY[0x263F0A4C0] medicalDateIntervalWithEndDate:v14];
      }
    }
    else
    {
      id v11 = [MEMORY[0x263F0A4C0] medicalDateIntervalWithStartDate:v10];
    }
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"FHIR Period must have either start or end");
LABEL_13:
  id v11 = 0;
LABEL_20:

LABEL_21:
  return v11;
}

+ (id)_earliestDosageDateWithMedicationDosageArray:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (v7)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v25 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v30;
      id v26 = a1;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = objc_msgSend(a1, "_medicalDateIntervalWithDosage:error:", *(void *)(*((void *)&v29 + 1) + 8 * i), a4, v25);
          uint64_t v14 = [v13 startDate];

          if (v14)
          {
            uint64_t v15 = [v10 dateForUTC];
            if (!v15) {
              goto LABEL_10;
            }
            uint64_t v16 = (void *)v15;
            [v13 startDate];
            v18 = uint64_t v17 = a4;
            [v18 dateForUTC];
            v20 = uint64_t v19 = v9;
            uint64_t v21 = [v10 dateForUTC];
            int v22 = objc_msgSend(v20, "hk_isBeforeDate:", v21);

            uint64_t v9 = v19;
            a4 = v17;
            a1 = v26;
            uint64_t v11 = v27;

            if (v22)
            {
LABEL_10:
              uint64_t v23 = [v13 startDate];

              uint64_t v10 = (void *)v23;
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }

    id v6 = v25;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_medicationDosagesWithDosageArray:(id)a3 FHIRRelease:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  HKSafeObject();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    uint64_t v33 = [MEMORY[0x263EFF980] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = (id)*MEMORY[0x263F09550];
      uint64_t v15 = *(void *)v35;
      do
      {
        uint64_t v16 = 0;
        uint64_t v32 = v13;
        do
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
          if (v14 == v9
            || !objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v16), "hk_hasValueForKeyPath:", @"patientInstruction"))
          {
            if (!objc_msgSend(v17, "hk_hasValueForKeyPath:", @"text"))
            {
              uint64_t v20 = 0;
              goto LABEL_15;
            }
            uint64_t v18 = v17;
            uint64_t v19 = @"text";
          }
          else
          {
            uint64_t v18 = v17;
            uint64_t v19 = @"patientInstruction";
          }
          uint64_t v20 = objc_msgSend(v18, "hk_safeStringForKeyPath:error:", v19, a5);
          if (!v20)
          {

            id v10 = 0;
            id v8 = v31;
            long long v29 = v33;
            goto LABEL_25;
          }
LABEL_15:
          uint64_t v21 = [a1 _medicalDateIntervalWithDosage:v17 error:a5];
          if (v20 | v21)
          {
            [MEMORY[0x263F0A500] dosageWithInstruction:v20 timingPeriod:v21];
            int v22 = a5;
            uint64_t v23 = v15;
            long long v24 = v14;
            id v25 = a1;
            id v26 = v9;
            uint64_t v28 = v27 = v11;
            [v33 addObject:v28];

            id v11 = v27;
            id v9 = v26;
            a1 = v25;
            id v14 = v24;
            uint64_t v15 = v23;
            a5 = v22;
            uint64_t v13 = v32;
          }

          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v13);
    }

    long long v29 = v33;
    if ([v33 count])
    {
      id v10 = v33;
    }
    else
    {
      if (![v11 count]) {
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"Dosage array must be nonempty if present");
      }
      id v10 = 0;
    }
    id v8 = v31;
LABEL_25:
  }
  return v10;
}

+ (id)medicationDosagesWithStatementDosageInstructionArray:(id)a3 error:(id *)a4
{
  return (id)[a1 _medicationDosagesWithDosageArray:a3 FHIRRelease:*MEMORY[0x263F09550] error:a4];
}

+ (id)medicationDosagesWithDispenseDosageInstructionArray:(id)a3 error:(id *)a4
{
  return (id)[a1 _medicationDosagesWithDosageArray:a3 FHIRRelease:*MEMORY[0x263F09550] error:a4];
}

+ (id)medicationDosagesWithOrderDosageInstructionArray:(id)a3 error:(id *)a4
{
  return (id)[a1 _medicationDosagesWithDosageArray:a3 FHIRRelease:*MEMORY[0x263F09550] error:a4];
}

+ (id)medicationDosagesWithDosageArray:(id)a3 error:(id *)a4
{
  return (id)[a1 _medicationDosagesWithDosageArray:a3 FHIRRelease:*MEMORY[0x263F09558] error:a4];
}

+ (id)_medicalDateIntervalWithDosage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();

  if (!v7
    || !objc_msgSend(v6, "hk_hasValueForKeyPath:", @"timing")
    || (objc_msgSend(v6, "hk_safeDictionaryForKeyPath:error:", @"timing", a4),
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  id v9 = v8;
  if (!objc_msgSend(v8, "hk_hasValueForKeyPath:", @"repeat"))
  {
    id v11 = 0;
LABEL_13:
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  id v10 = objc_msgSend(v9, "hk_safeDictionaryForKeyPath:error:", @"repeat", a4);
  id v11 = v10;
  if (!v10 || !objc_msgSend(v10, "hk_hasValueForKeyPath:", @"boundsPeriod")) {
    goto LABEL_13;
  }
  uint64_t v12 = [v11 objectForKeyedSubscript:@"boundsPeriod"];
  uint64_t v13 = [a1 medicalDateIntervalWithPeriod:v12 error:a4];

LABEL_14:
LABEL_9:

  return v13;
}

+ (id)referencedMedicationStatementActorTypeWithString:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = [NSURL URLWithString:v4];
    id v7 = +[HDFHIRReferenceProcessor identifierFromAbsoluteReferenceURL:v6];
    id v8 = [v7 resourceType];
    if ([v8 length])
    {
      if ([v8 isEqualToString:@"Organization"])
      {
        id v9 = &unk_26E6B35F8;
      }
      else if ([v8 isEqualToString:@"Patient"])
      {
        id v9 = &unk_26E6B3610;
      }
      else if (([v8 isEqualToString:@"Practitioner"] & 1) != 0 {
             || ([v8 isEqualToString:@"PractitionerRole"] & 1) != 0)
      }
      {
        id v9 = &unk_26E6B3628;
      }
      else if ([v8 isEqualToString:@"RelatedPerson"])
      {
        id v9 = &unk_26E6B3640;
      }
      else
      {
        id v9 = &unk_26E6B3658;
      }
    }
    else
    {
      id v9 = &unk_26E6B35E0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)preferredNameWithHumanNames:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[HDHealthRecordParsedHumanName parsedNamesWithHumanNames:a3 FHIRVersion:v7 error:a5];
  if (v8)
  {
    id v9 = +[HDHealthRecordParsedHumanName preferredNameInNames:v8 FHIRVersion:v7];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 fullName];
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"no preferred name available");
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)stringWithRTF:(id)a3 error:(id *)a4
{
  v25[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();

  if (v5)
  {
    id v6 = [v4 dataUsingEncoding:4];
    id v7 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    id v8 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
    uint64_t v23 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
    if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr)
    {
      id v9 = (void *)UIFoundationLibrary();
      v21[3] = (uint64_t)dlsym(v9, "NSDocumentTypeDocumentAttribute");
      getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = v21[3];
      id v8 = (id *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v8) {
      +[HDHealthRecordsExtractionUtilities stringWithRTF:error:]();
    }
    id v10 = *v8;
    id v24 = v10;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    id v11 = (id *)getNSRTFTextDocumentTypeSymbolLoc_ptr;
    uint64_t v23 = getNSRTFTextDocumentTypeSymbolLoc_ptr;
    if (!getNSRTFTextDocumentTypeSymbolLoc_ptr)
    {
      uint64_t v12 = (void *)UIFoundationLibrary();
      v21[3] = (uint64_t)dlsym(v12, "NSRTFTextDocumentType");
      getNSRTFTextDocumentTypeSymbolLoc_ptr = v21[3];
      id v11 = (id *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v11) {
      +[HDHealthRecordsExtractionUtilities stringWithRTF:error:]();
    }
    v25[0] = *v11;
    uint64_t v13 = NSDictionary;
    id v14 = v25[0];
    uint64_t v15 = [v13 dictionaryWithObjects:v25 forKeys:&v24 count:1];

    uint64_t v16 = (void *)[v7 initWithData:v6 options:v15 documentAttributes:0 error:0];
    if (v16)
    {
      id v17 = [v16 string];
    }
    else
    {
      id v17 = v4;
    }
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (BOOL)_determineEnteredInError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 lowercaseString];
    id v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" -"];
    id v7 = [v5 componentsSeparatedByCharactersInSet:v6];
    id v8 = [v7 componentsJoinedByString:@"-"];

    LOBYTE(v4) = [v8 isEqualToString:@"entered-in-error"];
    LOBYTE(v3) = (_BYTE)v4;
  }
  return (char)v3;
}

+ (id)enteredInErrorWithStatusString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v5));
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)wasEnteredInError:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"status"];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 objectForKeyedSubscript:@"verificationStatus"];
  }
  id v10 = v9;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v10));
LABEL_8:
    uint64_t v12 = (void *)v11;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [a1 enteredInErrorWithConditionVerificationStatusCodeableConcept:v10 error:a4];
    goto LABEL_8;
  }
  uint64_t v13 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, @"Unexpected class for status (expected %@ or %@, found %@)", v14, v15, objc_opt_class());
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

+ (id)localeFromLanguage:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)stringWithAttachment:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)stringWithAttachment:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)stringWithAttachment:(uint64_t)a3 error:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)stringWithRTF:error:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNSDocumentTypeDocumentAttribute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HDHealthRecordsExtractionUtilities.m", 25, @"%s", dlerror());

  __break(1u);
}

+ (void)stringWithRTF:error:.cold.2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNSRTFTextDocumentType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HDHealthRecordsExtractionUtilities.m", 26, @"%s", dlerror());

  __break(1u);
}

@end