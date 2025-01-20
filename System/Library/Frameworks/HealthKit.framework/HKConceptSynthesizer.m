@interface HKConceptSynthesizer
+ (id)_popValueForString:(id)a3 startingFromSubstring:(id)a4 untilSubstring:(id)a5 outRemainderString:(id *)a6 outEndOfString:(BOOL *)a7 error:(id *)a8;
+ (id)_substringsInBetweenSequentialDelimiters:(id)a3 poppableString:(id)a4 outReachedEndOfString:(BOOL *)a5 outStringRemainder:(id *)a6 error:(id *)a7;
+ (id)_synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4 additionalAttributes:(id)a5;
+ (id)_synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4 prioritizedCodingSystems:(id)a5 addtionalAttributes:(id)a6;
+ (id)adHocCodingForCodingCollection:(id)a3;
+ (id)bestCodingSystemForDisplayForCodingCollection:(id)a3 prioritizedCodingSystems:(id)a4;
+ (id)bestDisplayNameForCodingCollection:(id)a3;
+ (id)bestDisplayNameForCodingCollection:(id)a3 prioritizedCodingSystems:(id)a4;
+ (id)codingCollectionFromAdHocCode:(id)a3 error:(id *)a4;
+ (id)enumerateCodingsBySystem:(id)a3 prioritizingCodingSystems:(id)a4 handler:(id)a5;
+ (id)prioritizedCodingSystemsForDisplay;
+ (id)privateCodeCreationCodingSortDescriptors;
+ (id)synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4;
+ (id)synthesizeInMemoryConceptForCodingCollection:(id)a3;
+ (id)synthesizeInMemoryConceptForCodingCollection:(id)a3 additionalAttributes:(id)a4;
@end

@implementation HKConceptSynthesizer

+ (id)prioritizedCodingSystemsForDisplay
{
  if (prioritizedCodingSystemsForDisplay_onceToken != -1) {
    dispatch_once(&prioritizedCodingSystemsForDisplay_onceToken, &__block_literal_global_117);
  }
  v2 = (void *)prioritizedCodingSystemsForDisplay_codingSystems;

  return v2;
}

void __58__HKConceptSynthesizer_prioritizedCodingSystemsForDisplay__block_invoke()
{
  v15 = (void *)MEMORY[0x1E4F1CAA0];
  v55 = +[HKMedicalCodingSystem textSystem];
  v54 = +[HKMedicalCodingSystem LOINCCodeSystem];
  v53 = +[HKMedicalCodingSystem RxNormCodeSystem];
  v52 = +[HKMedicalCodingSystem CVXSystem];
  v51 = +[HKMedicalCodingSystem SNOMEDCodeSystem];
  v50 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/allergy-intolerance-category"];
  v49 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/allergy-intolerance-criticality"];
  v48 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/allergy-intolerance-status"];
  v47 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/allergy-intolerance-type"];
  v46 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/condition-category"];
  v45 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/condition-clinical"];
  v44 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/condition-severity"];
  v43 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/condition-ver-status"];
  v42 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/diagnostic-report-status"];
  v41 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/diagnostic-service-sections"];
  v40 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/immunization-reason"];
  v39 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/immunization-route"];
  v38 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/immunization-site"];
  v37 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/medication-admin-status"];
  v36 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/medication-dispense-status"];
  v32 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/medication-order-status"];
  v34 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/medication-statement-status"];
  v35 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/no-immunization-reason"];
  v33 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/observation-category"];
  v29 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/observation-status"];
  v31 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/observation-valueabsentreason"];
  v24 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/procedure-category"];
  v30 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/procedure-followup"];
  v28 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/procedure-not-performed-reason"];
  v14 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/procedure-outcome"];
  v27 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/procedure-status"];
  v13 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/reaction-event-severity"];
  v26 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/reason-medication-not-given-codes"];
  v25 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/referencerange-meaning"];
  v23 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/CodeSystem/medication-statement-status"];
  v22 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/CodeSystem/medicationrequest-status"];
  v12 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/device-status"];
  v21 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/devicestatus"];
  v20 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/event-status"];
  v19 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://hl7.org/fhir/fm-status"];
  v18 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/condition-clinical"];
  v17 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/condition-ver-status"];
  v16 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/coverage-class"];
  v11 = +[HKMedicalCodingSystem FHIRCoverageClassification];
  v10 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/coverage-selfpay"];
  v0 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/medication-statement-category"];
  v1 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/medicationdispense-status"];
  v2 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/medicationrequest-category"];
  v9 = +[HKMedicalCodingSystem codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason"];
  v3 = +[HKMedicalCodingSystem FHIRCoverageType];
  v4 = +[HKMedicalCodingSystem FHIRDocumentReferenceClinicalNoteStatus];
  v5 = +[HKMedicalCodingSystem FHIRDocumentReferenceClinicalNoteDocStatus];
  v6 = +[HKMedicalCodingSystem FHIRDocumentReferenceClinicalNoteCategorySystem];
  objc_msgSend(v15, "orderedSetWithObjects:", v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39,
    v38,
    v37,
    v36,
    v32,
    v34,
    v35,
    v33,
    v29,
    v31,
    v24,
    v30,
    v28,
    v14,
    v27,
    v13,
    v26,
    v25,
    v23,
    v22,
    v12,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v11,
    v10,
    v0,
    v1,
    v2,
    v9,
    v3,
    v4,
    v5,
    v6,
  uint64_t v7 = 0);
  v8 = (void *)prioritizedCodingSystemsForDisplay_codingSystems;
  prioritizedCodingSystemsForDisplay_codingSystems = v7;
}

+ (id)privateCodeCreationCodingSortDescriptors
{
  if (privateCodeCreationCodingSortDescriptors_onceToken != -1) {
    dispatch_once(&privateCodeCreationCodingSortDescriptors_onceToken, &__block_literal_global_158);
  }
  v2 = (void *)privateCodeCreationCodingSortDescriptors_result;

  return v2;
}

void __64__HKConceptSynthesizer_privateCodeCreationCodingSortDescriptors__block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"codingSystem.identifier" ascending:1];
  v6[0] = v0;
  v1 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"codingVersion" ascending:1];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"code" ascending:1];
  v6[2] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"displayString" ascending:1];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v5 = (void *)privateCodeCreationCodingSortDescriptors_result;
  privateCodeCreationCodingSortDescriptors_result = v4;
}

+ (id)synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4
{
  return (id)[a1 _synthesizeConceptWithIdentifier:a3 forCodingCollection:a4 additionalAttributes:0];
}

+ (id)_synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4 additionalAttributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 prioritizedCodingSystemsForDisplay];
  v12 = [a1 _synthesizeConceptWithIdentifier:v10 forCodingCollection:v9 prioritizedCodingSystems:v11 addtionalAttributes:v8];

  return v12;
}

+ (id)bestDisplayNameForCodingCollection:(id)a3 prioritizedCodingSystems:(id)a4
{
  uint64_t v4 = [a1 bestCodingSystemForDisplayForCodingCollection:a3 prioritizedCodingSystems:a4];
  v5 = [v4 displayString];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v4 displayString];
  }
  else
  {
    id v8 = [v4 code];

    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v7 = [v4 code];
  }
  id v8 = (void *)v7;
LABEL_6:

  return v8;
}

+ (id)synthesizeInMemoryConceptForCodingCollection:(id)a3
{
  return (id)[a1 synthesizeInMemoryConceptForCodingCollection:a3 additionalAttributes:0];
}

+ (id)synthesizeInMemoryConceptForCodingCollection:(id)a3 additionalAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HKConceptIdentifier inMemoryConceptIdentifier];
  id v9 = [a1 _synthesizeConceptWithIdentifier:v8 forCodingCollection:v7 additionalAttributes:v6];

  return v9;
}

+ (id)bestDisplayNameForCodingCollection:(id)a3
{
  id v4 = a3;
  v5 = [a1 prioritizedCodingSystemsForDisplay];
  id v6 = [a1 bestDisplayNameForCodingCollection:v4 prioritizedCodingSystems:v5];

  return v6;
}

+ (id)bestCodingSystemForDisplayForCodingCollection:(id)a3 prioritizedCodingSystems:(id)a4
{
  id v5 = a4;
  id v6 = [a3 codingsBySystem];
  id v7 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke;
  v17[3] = &unk_1E58C8028;
  id v8 = v6;
  id v18 = v8;
  id v9 = [v7 enumerateCodingsBySystem:v8 prioritizingCodingSystems:v5 handler:v17];
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v11 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke_2;
    v15[3] = &unk_1E58C8028;
    id v16 = v8;
    v12 = [v11 enumerateCodingsBySystem:v16 prioritizingCodingSystems:v5 handler:v15];
    id v10 = v12;
    if (v12) {
      id v13 = v12;
    }
  }

  return v10;
}

id __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 count];

  if (v5 <= 1)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    id v8 = [v7 anyObject];

    id v9 = [v8 displayString];
    uint64_t v10 = [v9 length];

    if (v10) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  unint64_t v5 = [v4 count];

  if (v5 <= 1)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    id v8 = [v7 anyObject];

    id v9 = [v8 code];
    uint64_t v10 = [v9 length];

    if (v10) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)enumerateCodingsBySystem:(id)a3 prioritizingCodingSystems:(id)a4 handler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, uint64_t))a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = [v7 objectForKeyedSubscript:v15];
        if (v16)
        {
          v17 = (void *)v16;
          id v18 = v9[2](v9, v15, v16);

          if (v18)
          {
            id v21 = v10;
            goto LABEL_22;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v19 = [v7 allKeys];
  v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_176];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
LABEL_12:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v30 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * v25);
      if ((objc_msgSend(v10, "containsObject:", v26, (void)v29) & 1) == 0)
      {
        v27 = [v7 objectForKeyedSubscript:v26];
        id v18 = v9[2](v9, v26, (uint64_t)v27);

        if (v18) {
          break;
        }
      }
      if (v23 == ++v25)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v23) {
          goto LABEL_12;
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    id v18 = 0;
  }

LABEL_22:

  return v18;
}

uint64_t __83__HKConceptSynthesizer_enumerateCodingsBySystem_prioritizingCodingSystems_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4 prioritizedCodingSystems:(id)a5 addtionalAttributes:(id)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = [HKConceptAttribute alloc];
  uint64_t v15 = [a1 adHocCodingForCodingCollection:v10];
  uint64_t v16 = [v15 code];
  v17 = [(HKConceptAttribute *)v14 initWithType:2 stringValue:v16];
  v27[0] = v17;
  id v18 = [[HKConceptAttribute alloc] initWithType:959 stringValue:@"CA,GB,US"];
  v27[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  if (v12)
  {
    uint64_t v20 = [v19 arrayByAddingObjectsFromArray:v12];

    v19 = (void *)v20;
  }
  id v21 = [a1 bestDisplayNameForCodingCollection:v10 prioritizedCodingSystems:v11];
  if (v21)
  {
    uint64_t v22 = [[HKConceptAttribute alloc] initWithType:1012 stringValue:v21];
    uint64_t v23 = [v19 arrayByAddingObject:v22];

    v19 = (void *)v23;
  }
  uint64_t v24 = [HKConcept alloc];
  uint64_t v25 = [(HKConcept *)v24 initWithIdentifier:v13 attributes:v19 relationships:MEMORY[0x1E4F1CBF0] version:0 deleted:0 options:0];

  return v25;
}

+ (id)adHocCodingForCodingCollection:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 privateCodeCreationCodingSortDescriptors];
  long long v31 = v4;
  id v6 = [v4 codings];
  long long v30 = (void *)v5;
  uint64_t v7 = [v6 sortedArrayUsingDescriptors:v5];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v8 appendString:@"system="];
        v14 = [v13 codingSystem];
        uint64_t v15 = [v14 identifier];
        uint64_t v16 = (void *)v15;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        else {
          v17 = @"none";
        }
        [v8 appendString:v17];

        [v8 appendString:@"version="];
        uint64_t v18 = [v13 codingVersion];
        v19 = (void *)v18;
        if (v18) {
          uint64_t v20 = (__CFString *)v18;
        }
        else {
          uint64_t v20 = @"none";
        }
        [v8 appendString:v20];

        [v8 appendString:@"code="];
        uint64_t v21 = [v13 code];
        uint64_t v22 = (void *)v21;
        if (v21) {
          uint64_t v23 = (__CFString *)v21;
        }
        else {
          uint64_t v23 = @"none";
        }
        [v8 appendString:v23];

        [v8 appendString:@"display="];
        uint64_t v24 = [v13 displayString];
        uint64_t v25 = (void *)v24;
        if (v24) {
          uint64_t v26 = (__CFString *)v24;
        }
        else {
          uint64_t v26 = @"none";
        }
        [v8 appendString:v26];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  v27 = +[HKMedicalCodingSystem adHocConceptSystem];
  v28 = +[HKMedicalCoding medicalCodingWithSystem:v27 codingVersion:0 code:v8 displayString:0];

  return v28;
}

+ (id)codingCollectionFromAdHocCode:(id)a3 error:(id *)a4
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 length])
  {
    id v22 = v5;
    id v6 = (id)[v5 copy];
    char v35 = 0;
    uint64_t v7 = @"none";
    v27 = a4;
    while (1)
    {
      id v8 = v7;
      uint64_t v9 = v6;
      v36[0] = @"system=";
      v36[1] = @"version=";
      v36[2] = @"code=";
      v36[3] = @"display=";
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
      id v34 = v6;
      uint64_t v11 = [a1 _substringsInBetweenSequentialDelimiters:v10 poppableString:v6 outReachedEndOfString:&v35 outStringRemainder:&v34 error:a4];
      id v6 = v34;

      if (!v11) {
        break;
      }
      long long v32 = [v11 objectAtIndexedSubscript:0];
      uint64_t v7 = v8;
      uint64_t v12 = 0;
      char v31 = [v32 isEqualToString:v8];
      if ((v31 & 1) == 0)
      {
        uint64_t v24 = [v11 objectAtIndexedSubscript:0];
        uint64_t v12 = +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:");
        uint64_t v23 = (void *)v12;
      }
      long long v30 = [v11 objectAtIndexedSubscript:1];
      char v13 = [v30 isEqualToString:v8];
      if (v13)
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = [v11 objectAtIndexedSubscript:1];
        uint64_t v25 = (void *)v14;
      }
      id v33 = v6;
      uint64_t v15 = [v11 objectAtIndexedSubscript:2];
      char v16 = [v15 isEqualToString:v8];
      if (v16)
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = [v11 objectAtIndexedSubscript:2];
        uint64_t v26 = (void *)v17;
      }
      uint64_t v18 = [v11 objectAtIndexedSubscript:3];
      if ([v18 isEqualToString:v8])
      {
        v19 = +[HKMedicalCoding medicalCodingWithSystem:v12 codingVersion:v14 code:v17 displayString:0];
      }
      else
      {
        uint64_t v20 = [v11 objectAtIndexedSubscript:3];
        v19 = +[HKMedicalCoding medicalCodingWithSystem:v12 codingVersion:v14 code:v17 displayString:v20];

        uint64_t v7 = v8;
      }

      id v6 = v33;
      if ((v16 & 1) == 0) {

      }
      a4 = v27;
      if ((v13 & 1) == 0) {

      }
      if ((v31 & 1) == 0)
      {
      }
      [v29 addObject:v19];

      if (v35)
      {
        uint64_t v11 = +[HKMedicalCodingCollection collectionWithCodings:v29];
        break;
      }
    }

    id v5 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 3, @"Must supply a non-empty string for adhoc code decoding");
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)_substringsInBetweenSequentialDelimiters:(id)a3 poppableString:(id)a4 outReachedEndOfString:(BOOL *)a5 outStringRemainder:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__51;
  v37 = __Block_byref_object_dispose__51;
  id v38 = (id)[v12 copy];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = __Block_byref_object_copy__51;
  char v31 = __Block_byref_object_dispose__51;
  id v32 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __127__HKConceptSynthesizer__substringsInBetweenSequentialDelimiters_poppableString_outReachedEndOfString_outStringRemainder_error___block_invoke;
  v19[3] = &unk_1E58C8070;
  id v14 = v11;
  id v20 = v14;
  id v22 = &v33;
  uint64_t v23 = &v43;
  uint64_t v24 = &v27;
  uint64_t v25 = &v39;
  id v26 = a1;
  id v15 = v13;
  id v21 = v15;
  [v14 enumerateObjectsUsingBlock:v19];
  if (*((unsigned char *)v40 + 24))
  {
    if (a6) {
      *a6 = (id) v34[5];
    }
    if (a5) {
      *a5 = *((unsigned char *)v44 + 24);
    }
    char v16 = (void *)[v15 copy];
  }
  else
  {
    char v16 = 0;
    if (a7) {
      *a7 = (id) v28[5];
    }
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v16;
}

void __127__HKConceptSynthesizer__substringsInBetweenSequentialDelimiters_poppableString_outReachedEndOfString_outStringRemainder_error___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  if ([*(id *)(a1 + 32) count] - 1 > a3)
  {
    uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1];

    id v8 = (void *)v9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v10 + 40);
  id v12 = objc_msgSend(*(id *)(a1 + 80), "_popValueForString:startingFromSubstring:untilSubstring:outRemainderString:outEndOfString:error:", *(void *)(v11 + 40));
  objc_storeStrong((id *)(v10 + 40), obj);
  objc_storeStrong((id *)(v11 + 40), v16);
  if ([*(id *)(a1 + 32) count] - 1 > a3 && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Invalid order of delimiters. Reached end of string before full sequence was parsed.");
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  if (!v12) {
    goto LABEL_8;
  }
  [*(id *)(a1 + 40) addObject:v12];
LABEL_9:
}

+ (id)_popValueForString:(id)a3 startingFromSubstring:(id)a4 untilSubstring:(id)a5 outRemainderString:(id *)a6 outEndOfString:(BOOL *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  unint64_t v15 = [v13 rangeOfString:a4];
  uint64_t v17 = v16;
  unint64_t v18 = [v13 rangeOfString:v14];

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    id v20 = @"Starting substring was not found in string when trying to unwrap adhoc code.";
    id v21 = a8;
    uint64_t v22 = 100;
LABEL_3:
    objc_msgSend(v19, "hk_assignError:code:description:", v21, v22, v20);
    uint64_t v23 = 0;
    goto LABEL_16;
  }
  uint64_t v24 = v15 + v17;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a6) {
      *a6 = 0;
    }
    if (a7) {
      *a7 = 1;
    }
    uint64_t v23 = [v13 substringFromIndex:v24];
  }
  else
  {
    if (v18 <= v15)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      id v20 = @"Starting substring has a location after or equal to the second one. The first substring must come before the first.";
      id v21 = a8;
      uint64_t v22 = 3;
      goto LABEL_3;
    }
    uint64_t v23 = objc_msgSend(v13, "substringWithRange:", v24, v18 - v24);
    uint64_t v25 = [v13 substringFromIndex:v18];
    id v26 = v25;
    if (a6) {
      *a6 = v25;
    }
    if (a7) {
      *a7 = 0;
    }
  }
LABEL_16:

  return v23;
}

@end