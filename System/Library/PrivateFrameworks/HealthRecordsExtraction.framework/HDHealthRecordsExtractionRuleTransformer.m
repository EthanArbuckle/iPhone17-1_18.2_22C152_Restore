@interface HDHealthRecordsExtractionRuleTransformer
+ (id)_transformDSTU2Value:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6;
+ (id)_transformR4Value:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6;
+ (id)transformValue:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6;
@end

@implementation HDHealthRecordsExtractionRuleTransformer

+ (id)transformValue:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v11 FHIRVersion];
  v14 = [v13 FHIRRelease];

  if (v14 == (void *)*MEMORY[0x263F09550])
  {
    uint64_t v18 = [a1 _transformDSTU2Value:v10 rootResource:v11 extractionRule:v12 error:a6];
  }
  else
  {
    if (v14 != (void *)*MEMORY[0x263F09558])
    {
      v15 = (void *)MEMORY[0x263F087E8];
      v16 = [v11 FHIRVersion];
      objc_msgSend(v15, "hk_assignError:code:format:", a6, 3, @"Unsupported FHIR version for extraction transforms: %@", v16);

      v17 = 0;
      goto LABEL_7;
    }
    uint64_t v18 = [a1 _transformR4Value:v10 rootResource:v11 extractionRule:v12 error:a6];
  }
  v17 = (void *)v18;
LABEL_7:

  return v17;
}

+ (id)_transformDSTU2Value:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  v26 = v12;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"HDHealthRecordsExtractionRuleTransformer.m", 111, @"Invalid parameter not satisfying: %@", @"[resource isKindOfClass:[HDOriginalFHIRResourceObject class]]" object file lineNumber description];
  }
  v27 = [MEMORY[0x263F0A378] primaryDSTU2Version];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v14 = [v13 transforms];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v19 isEqualToString:@"inspectableValueCollectionWithRange"] & 1) == 0)
        {
          if ([v19 isEqualToString:@"inspectableValueCollectionWithRatio"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithRatio:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithQuantity"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithQuantity:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithDateTime"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithDateTime:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithPeriod"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithPeriod:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithTime"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithTime:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithString"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithString:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"localeFromLanguage"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities localeFromLanguage:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingsArrayWithCodeableConcept"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingsArrayWithCodeableConcept:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingCollectionWithCodeableConcept"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingCollectionWithCodeableConcept:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingCollectionArrayWithCodeableConcepts"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingCollectionArrayWithCodeableConcepts:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingsWithCodeableConcept"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcept:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingsWithCodeableConcepts"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcepts:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"referenceRangesWithObservationReferenceRanges"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities referenceRangesWithObservationReferenceRanges:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingsWithReference"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingsWithReference:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithCodeableConcept"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithCodeableConcept:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithObservationComponents"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationComponents:v11 FHIRVersion:v27 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueCollectionWithObservationValues"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationValues:v11 FHIRVersion:v27 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueWithAbatementValue"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueWithAbatementValue:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"inspectableValueWithOnsetValue"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities inspectableValueWithOnsetValue:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithCoding"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithCoding:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithDiagnosticReportStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithDiagnosticReportStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithMedicationDispenseStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationDispenseStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithMedicationOrderStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationOrderStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithProcedureStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithProcedureStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalDateWithDateTimeString"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalDateWithDateTimeString:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalDateWithDateString"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalDateWithDateString:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalDateWithInstantString"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalDateWithInstantString:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"identifiersWithReferences"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities identifiersWithReferences:v11 parentResource:v26 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithAllergyIntoleranceStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithAllergyIntoleranceCategoryCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceCategoryCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithAllergyIntoleranceCriticalityCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceCriticalityCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithAllergyIntoleranceTypeCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceTypeCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithConditionClinicalStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithConditionClinicalStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithConditionVerificationStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithConditionVerificationStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithMedicationAdminStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationAdminStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"preferredNameWithHumanNames"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities preferredNameWithHumanNames:v11 FHIRVersion:v27 error:a6];
          }
          else if ([v19 isEqualToString:@"enteredInErrorWithStatusString"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities enteredInErrorWithStatusString:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"allergyReactionsWithAllergyIntoleranceReaction"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities allergyReactionsWithAllergyIntoleranceReaction:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"codedQuantityWithQuantity"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities codedQuantityWithQuantity:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithObservationStatus"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithObservationStatus:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithMedicationStatementStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationStatementStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"earliestDosageDateWithMedicationStatementDosageArray"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationStatementDosageArray:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"earliestDosageDateWithMedicationOrderDosageArray"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationOrderDosageArray:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"earliestDosageDateWithMedicationDispenseDosageArray"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationDispenseDosageArray:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicationDosagesWithStatementDosageArray"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicationDosagesWithStatementDosageInstructionArray:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicationDosagesWithDispenseDosageInstructionArray"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicationDosagesWithDispenseDosageInstructionArray:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicationDosagesWithOrderDosageInstructionArray"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicationDosagesWithOrderDosageInstructionArray:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"observationCategoryWithObservationCategory"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities observationCategoryWithObservationCategory:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"referencedMedicationStatementActorTypeWithString"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities referencedMedicationStatementActorTypeWithString:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"stringWithRTF"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities stringWithRTF:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithDeviceStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithDeviceStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithCarePlanStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithCarePlanStatusCode:v11 error:a6];
          }
          else if ([v19 isEqualToString:@"medicalCodingWithGoalStatusCode"])
          {
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities medicalCodingWithGoalStatusCode:v11 error:a6];
          }
          else
          {
            if (![v19 isEqualToString:@"wrapInArray"])
            {
              [NSString stringWithFormat:@"Unsupported DSTU2 extraction transform '%@'", v19];
              id v25 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
              objc_exception_throw(v25);
            }
            uint64_t v20 = +[HDHealthRecordsExtractionUtilities wrapInArray:v11 error:a6];
          }
          v21 = (void *)v20;

          id v11 = v21;
        }
        if (!v11)
        {

          id v22 = 0;
          goto LABEL_123;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v22 = v11;
LABEL_123:

  return v22;
}

+ (id)_transformR4Value:(id)a3 rootResource:(id)a4 extractionRule:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"HDHealthRecordsExtractionRuleTransformer.m", 248, @"Invalid parameter not satisfying: %@", @"[resource isKindOfClass:[HDOriginalFHIRResourceObject class]]" object file lineNumber description];
  }
  id v25 = [MEMORY[0x263F0A378] primaryR4Version];
  v26 = v13;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = [v13 transforms];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
LABEL_5:
    uint64_t v18 = 0;
    v19 = v11;
    while (1)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
      if ([v20 isEqualToString:@"codedQuantityWithQuantity"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities codedQuantityWithQuantity:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"enteredInErrorWithStatusString"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities enteredInErrorWithStatusString:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"identifierFromReference"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities identifierFromReference:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"localeFromLanguage"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities localeFromLanguage:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingCollectionWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingCollectionWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingCollectionArrayWithCodeableConcepts"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingCollectionArrayWithCodeableConcepts:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingsWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingsWithCodeableConcepts"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingsWithCodeableConcepts:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingsArrayWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingsArrayWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithEventStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithEventStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalDateWithDateString"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalDateWithDateString:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalDateWithDateTimeString"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalDateWithDateTimeString:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalDateWithInstantString"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalDateWithInstantString:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"wrapInArray"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities wrapInArray:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"allergyReactionsWithAllergyIntoleranceReaction"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities allergyReactionsWithAllergyIntoleranceReaction:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"allergyIntoleranceClinicalStatusCodingWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities allergyIntoleranceClinicalStatusCodingWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"allergyIntoleranceVerificationStatusCodingWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities allergyIntoleranceVerificationStatusCodingWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithAllergyIntoleranceCategoryCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceCategoryCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithAllergyIntoleranceCriticalityCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithR4AllergyIntoleranceCriticalityCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithAllergyIntoleranceTypeCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithAllergyIntoleranceTypeCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"clinicalStatusCodingWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities conditionClinicalStatusCodingWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"enteredInErrorWithConditionVerificationStatusCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities enteredInErrorWithConditionVerificationStatusCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"inspectableValueWithAbatementValue"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities inspectableValueWithAbatementValue:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"inspectableValueWithOnsetValue"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities inspectableValueWithOnsetValue:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"conditionVerificationStatusCodingWithCodeableConcept"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities conditionVerificationStatusCodingWithCodeableConcept:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithDeviceStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithDeviceStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithDiagnosticReportStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithDiagnosticReportStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"identifiersWithReferences"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities identifiersWithReferences:v19 parentResource:v12 error:a6];
      }
      else if ([v20 isEqualToString:@"BOOLeanNotDoneFromStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities BOOLeanNotDoneFromStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithImmunizationStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithImmunizationStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"BOOLeanNotTakenFromStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities BOOLeanNotTakenFromStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"earliestDosageDateWithDosageArray"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities earliestDosageDateWithMedicationOrderDosageArray:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicationDosagesWithDosageArray"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicationDosagesWithDosageArray:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithMedicationDispenseStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithR4MedicationDispenseStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithMedicationRequestStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithR4MedicationRequestStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithMedicationStatementStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithMedicationStatementStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"referencedMedicationStatementActorTypeWithString"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities referencedMedicationStatementActorTypeWithString:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"inspectableValueCollectionWithObservationComponents"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationComponents:v19 FHIRVersion:v25 error:a6];
      }
      else if ([v20 isEqualToString:@"inspectableValueCollectionWithObservationValues"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities inspectableValueCollectionWithObservationValues:v19 FHIRVersion:v25 error:a6];
      }
      else if ([v20 isEqualToString:@"referenceRangesWithObservationReferenceRanges"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities referenceRangesWithObservationReferenceRanges:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"observationCategoryWithObservationCategories"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities observationCategoryWithObservationCategories:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithObservationStatus"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithObservationStatus:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"medicalCodingWithCoverageStatusCode"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities medicalCodingWithCoverageStatusCode:v19 error:a6];
      }
      else if ([v20 isEqualToString:@"coverageClassificationWithClassElements"])
      {
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities coverageClassificationWithClassElements:v19 error:a6];
      }
      else
      {
        if (![v20 isEqualToString:@"preferredNameWithHumanNames"])
        {
          [NSString stringWithFormat:@"Unsupported R4 extraction transform '%@'", v20];
          id v24 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
          objc_exception_throw(v24);
        }
        uint64_t v21 = +[HDHealthRecordsExtractionUtilities preferredNameWithHumanNames:v19 FHIRVersion:v25 error:a6];
      }
      id v11 = (id)v21;

      if (!v11) {
        break;
      }
      ++v18;
      v19 = v11;
      if (v16 == v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v16) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  return v11;
}

@end