@interface HKMedicalCodingSystem
+ (BOOL)supportsSecureCoding;
+ (id)CVXSystem;
+ (id)FHIRAllergyIntoleranceCategory;
+ (id)FHIRAllergyIntoleranceClinicalStatus;
+ (id)FHIRAllergyIntoleranceCriticality;
+ (id)FHIRAllergyIntoleranceSeverity;
+ (id)FHIRAllergyIntoleranceStatus;
+ (id)FHIRAllergyIntoleranceType;
+ (id)FHIRAllergyIntoleranceVerificationStatus;
+ (id)FHIRCarePlanStatus;
+ (id)FHIRConditionClinicalStatus;
+ (id)FHIRConditionVerificationStatus;
+ (id)FHIRCoverageClassification;
+ (id)FHIRCoverageStatus;
+ (id)FHIRCoverageType;
+ (id)FHIRDeviceStatus;
+ (id)FHIRDiagnosticReportStatus;
+ (id)FHIRDocumentReferenceClinicalNoteCategorySystem;
+ (id)FHIRDocumentReferenceClinicalNoteDocStatus;
+ (id)FHIRDocumentReferenceClinicalNoteStatus;
+ (id)FHIREventStatus;
+ (id)FHIRGoalStatus;
+ (id)FHIRImmunizationStatus;
+ (id)FHIRMedicationAdminStatus;
+ (id)FHIRMedicationDispenseStatus;
+ (id)FHIRMedicationDispenseStatusR4;
+ (id)FHIRMedicationOrderStatus;
+ (id)FHIRMedicationRequestStatus;
+ (id)FHIRMedicationStatementStatus;
+ (id)FHIRObservationStatus;
+ (id)FHIRProcedureStatus;
+ (id)FHIRQuantityComparatorSystem;
+ (id)ICD10System;
+ (id)ICD9System;
+ (id)LOINCCodeSystem;
+ (id)NDCSystem;
+ (id)RxNormCodeSystem;
+ (id)SNOMEDCodeSystem;
+ (id)UCUMSystem;
+ (id)adHocConceptSystem;
+ (id)appleHealthDataTypeSystem;
+ (id)appleOntologySystem;
+ (id)argonautHL7System;
+ (id)codeSystemWithIdentifier:(id)a3;
+ (id)externalCodeSystems;
+ (id)systemWithSystemDefinition:(id *)a3;
+ (id)textSystem;
+ (id)unknownSystem;
- (BOOL)hasDisplayStrings;
- (BOOL)isEqual:(id)a3;
- (HKMedicalCodingSystem)initWithCoder:(id)a3;
- (HKMedicalCodingSystem)initWithCustomIdentifier:(id)a3;
- (HKMedicalCodingSystem)initWithIdentifier:(id)a3 name:(id)a4 OID:(id)a5 type:(unint64_t)a6 synonyms:(id)a7 hasDisplayStrings:(BOOL)a8;
- (NSArray)synonyms;
- (NSString)OID;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (id)ontology_hasCodingSystemAttributeIdentifier;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setHasDisplayStrings:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setOID:(id)a3;
- (void)setSynonyms:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation HKMedicalCodingSystem

- (HKMedicalCodingSystem)initWithIdentifier:(id)a3 name:(id)a4 OID:(id)a5 type:(unint64_t)a6 synonyms:(id)a7 hasDisplayStrings:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HKMedicalCodingSystem;
  v18 = [(HKMedicalCodingSystem *)&v30 init];
  if (v18)
  {
    v19 = standardizeIdentifier(v14);
    uint64_t v20 = [v19 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    name = v18->_name;
    v18->_name = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    OID = v18->_OID;
    v18->_OID = (NSString *)v24;

    v18->_type = a6;
    uint64_t v26 = [v17 copy];
    v27 = (void *)v26;
    if (v26) {
      v28 = (void *)v26;
    }
    else {
      v28 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v18->_synonyms, v28);

    v18->_hasDisplayStrings = a8;
  }

  return v18;
}

- (HKMedicalCodingSystem)initWithCustomIdentifier:(id)a3
{
  return [(HKMedicalCodingSystem *)self initWithIdentifier:a3 name:0 OID:0 type:2 synonyms:0 hasDisplayStrings:0];
}

+ (id)codeSystemWithIdentifier:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v4 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EEC60288];
  v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];
  v7 = standardizeIdentifier(v6);

  if ([v7 isEqualToString:@"urn:apple:medicalrecords:text"])
  {
    uint64_t v8 = [a1 textSystem];
LABEL_5:
    v9 = (HKMedicalCodingSystem *)v8;
    goto LABEL_30;
  }
  if ([v7 isEqualToString:@"urn:apple:medicalrecords:unknown"])
  {
    uint64_t v8 = [a1 unknownSystem];
    goto LABEL_5;
  }
  unint64_t v10 = 0x1E4F1C000uLL;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
  v12 = [v7 stringByReplacingOccurrencesOfString:@"urn:oid:" withString:&stru_1EEC60288];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v13 = +[HKMedicalCodingSystem externalCodeSystems];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v46;
    uint64_t v36 = *(void *)v46;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v37 = v14;
      do
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v38 = v16;
        v9 = *(HKMedicalCodingSystem **)(*((void *)&v45 + 1) + 8 * v16);
        id v17 = (void *)MEMORY[0x19F395970]();
        id v18 = objc_alloc(*(Class *)(v10 + 2832));
        v19 = [(HKMedicalCodingSystem *)v9 identifier];
        uint64_t v20 = (void *)[v18 initWithString:v19];

        if ([v20 isEqual:v11]
          || ([(HKMedicalCodingSystem *)v9 OID],
              v21 = objc_claimAutoreleasedReturnValue(),
              uint64_t v22 = [v12 caseInsensitiveCompare:v21],
              v21,
              !v22))
        {
          v34 = v9;
LABEL_28:

          goto LABEL_29;
        }
        context = v17;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v23 = [(HKMedicalCodingSystem *)v9 synonyms];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v42;
          v39 = v13;
          while (2)
          {
            v27 = v11;
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * i);
              if (![v7 caseInsensitiveCompare:v29]
                || ![v12 caseInsensitiveCompare:v29])
              {
                v32 = v9;

                v11 = v27;
                v13 = v39;
                goto LABEL_27;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
            v11 = v27;
            v13 = v39;
            if (v25) {
              continue;
            }
            break;
          }
        }

        objc_super v30 = [(HKMedicalCodingSystem *)v9 name];
        uint64_t v31 = [v7 caseInsensitiveCompare:v30];

        if (!v31)
        {
          v35 = v9;
LABEL_27:
          id v17 = context;
          goto LABEL_28;
        }

        uint64_t v16 = v38 + 1;
        unint64_t v10 = 0x1E4F1C000;
        uint64_t v15 = v36;
      }
      while (v38 + 1 != v37);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v9 = [[HKMedicalCodingSystem alloc] initWithCustomIdentifier:v7];
LABEL_29:

LABEL_30:

  return v9;
}

+ (id)systemWithSystemDefinition:(id *)a3
{
  v4 = objc_msgSend([NSString alloc], "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3->var0, strnlen(a3->var0, 0x200uLL), 4, 0);
  v5 = standardizeIdentifier(v4);

  v6 = HKHealthKitFrameworkBundle();
  v7 = (void *)[[NSString alloc] initWithBytesNoCopy:a3->var1 length:strlen(a3->var1) encoding:4 freeWhenDone:0];
  uint64_t v8 = &stru_1EEC60288;
  v9 = [v6 localizedStringForKey:v7 value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];

  unint64_t v10 = (void *)[[NSString alloc] initWithBytesNoCopy:a3->var2 length:strlen(a3->var2) encoding:4 freeWhenDone:0];
  if (a3->var3) {
    uint64_t v8 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:a3->var3 length:strlen(a3->var3) encoding:4 freeWhenDone:0];
  }
  v11 = [(__CFString *)v8 componentsSeparatedByString:@","];
  v12 = [[HKMedicalCodingSystem alloc] initWithIdentifier:v5 name:v9 OID:v10 type:a3->var4 synonyms:v11 hasDisplayStrings:a3->var5];

  return v12;
}

+ (id)LOINCCodeSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://loinc.org"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://loinc.org"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:154 description:v5];
  }

  return v4;
}

+ (id)SNOMEDCodeSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://snomed.info/sct"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://snomed.info/sct"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:158 description:v5];
  }

  return v4;
}

+ (id)RxNormCodeSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://www.nlm.nih.gov/research/umls/rxnorm"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://www.nlm.nih.gov/research/umls/rxnorm"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:162 description:v5];
  }

  return v4;
}

+ (id)UCUMSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://unitsofmeasure.org"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://unitsofmeasure.org"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:166 description:v5];
  }

  return v4;
}

+ (id)CVXSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/sid/cvx"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/sid/cvx"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:170 description:v5];
  }

  return v4;
}

+ (id)NDCSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/sid/ndc"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/sid/ndc"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:174 description:v5];
  }

  return v4;
}

+ (id)ICD10System
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/sid/icd-10"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/sid/icd-10"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:178 description:v5];
  }

  return v4;
}

+ (id)ICD9System
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/sid/icd-9"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/sid/icd-9"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:182 description:v5];
  }

  return v4;
}

+ (id)argonautHL7System
{
  v4 = [a1 codeSystemWithIdentifier:@"http://argonaut.hl7.org"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://argonaut.hl7.org"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:186 description:v5];
  }

  return v4;
}

+ (id)FHIRDeviceStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/devicestatus"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/devicestatus"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:190 description:v5];
  }

  return v4;
}

+ (id)FHIRDiagnosticReportStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/diagnostic-report-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/diagnostic-report-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:194 description:v5];
  }

  return v4;
}

+ (id)FHIREventStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/event-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/event-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:198 description:v5];
  }

  return v4;
}

+ (id)FHIRImmunizationStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/event-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/event-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:202 description:v5];
  }

  return v4;
}

+ (id)FHIRObservationStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/observation-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/observation-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:206 description:v5];
  }

  return v4;
}

+ (id)FHIRMedicationAdminStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/medication-admin-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/medication-admin-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:210 description:v5];
  }

  return v4;
}

+ (id)FHIRMedicationOrderStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/medication-order-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/medication-order-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:214 description:v5];
  }

  return v4;
}

+ (id)FHIRMedicationRequestStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/medicationrequest-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/medicationrequest-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:218 description:v5];
  }

  return v4;
}

+ (id)FHIRMedicationStatementStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/medication-statement-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/medication-statement-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:222 description:v5];
  }

  return v4;
}

+ (id)FHIRCarePlanStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/care-plan-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/care-plan-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:226 description:v5];
  }

  return v4;
}

+ (id)FHIRGoalStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/goal-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/ValueSet/goal-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:230 description:v5];
  }

  return v4;
}

+ (id)FHIRCoverageStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/fm-status"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://hl7.org/fhir/fm-status"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:234 description:v5];
  }

  return v4;
}

+ (id)FHIRCoverageClassification
{
  v4 = [a1 codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/coverage-class"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://terminology.hl7.org/CodeSystem/coverage-class"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:238 description:v5];
  }

  return v4;
}

+ (id)FHIRCoverageType
{
  v4 = [a1 codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/v3-ActCode"];
  if (!v4)
  {
    v5 = [NSString stringWithFormat:@"%@ code system should never be nil", @"http://terminology.hl7.org/CodeSystem/v3-ActCode"];
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:242 description:v5];
  }

  return v4;
}

+ (id)FHIRMedicationDispenseStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/medication-dispense-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:249 description:@"FHIR Diagnostic Medication Dispense code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRMedicationDispenseStatusR4
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/medicationdispense-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:255 description:@"FHIR Diagnostic Medication Dispense code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRProcedureStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/procedure-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:261 description:@"FHIR Procedure code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/allergy-intolerance-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:267 description:@"FHIR AllergyIntoleranceStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceCategory
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/allergy-intolerance-category"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:273 description:@"FHIR AllergyIntoleranceCategory code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceCriticality
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:279 description:@"FHIR AllergyIntoleranceCriticality code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceSeverity
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/reaction-event-severity"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:285 description:@"FHIR AllergyIntoleranceSeverity code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceType
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/allergy-intolerance-type"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:291 description:@"FHIR AllergyIntoleranceType code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceClinicalStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:297 description:@"FHIR AllergyIntoleranceClinicalStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRAllergyIntoleranceVerificationStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:303 description:@"FHIR AllergyIntoleranceVerificationStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRConditionClinicalStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/condition-clinical"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:309 description:@"FHIR ConditionClinicalStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRConditionVerificationStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/condition-ver-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:315 description:@"FHIR ConditionVerificationStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRQuantityComparatorSystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/ValueSet/quantity-comparator"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:322 description:@"FHIR Quantity Comparator code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRDocumentReferenceClinicalNoteStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/document-reference-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:330 description:@"FHIR DocumentReferenceClinicalNoteStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRDocumentReferenceClinicalNoteDocStatus
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/composition-status"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:336 description:@"FHIR DocumentReferenceClinicalNoteDocStatus code system should never be nil"];
  }

  return v4;
}

+ (id)FHIRDocumentReferenceClinicalNoteCategorySystem
{
  v4 = [a1 codeSystemWithIdentifier:@"http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKMedicalCodingSystem.m" lineNumber:342 description:@"FHIR DocumentReferenceClinicalNoteCategorySystem code system should never be nil"];
  }

  return v4;
}

+ (id)textSystem
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__HKMedicalCodingSystem_textSystem__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (textSystem_onceToken != -1) {
    dispatch_once(&textSystem_onceToken, v4);
  }
  v2 = (void *)textSystem_ret;

  return v2;
}

void __35__HKMedicalCodingSystem_textSystem__block_invoke(uint64_t a1)
{
  v2 = [HKMedicalCodingSystem alloc];
  v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"MEDICAL_CODING_SYSTEM_TEXT" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];
  uint64_t v5 = [(HKMedicalCodingSystem *)v2 initWithIdentifier:@"urn:apple:medicalrecords:text" name:v4 OID:0 type:3 synonyms:0 hasDisplayStrings:0];
  v6 = (void *)textSystem_ret;
  textSystem_ret = v5;

  if (!textSystem_ret)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"HKMedicalCodingSystem.m" lineNumber:357 description:@"Apple Text System should never be nil"];
  }
}

+ (id)unknownSystem
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__HKMedicalCodingSystem_unknownSystem__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (unknownSystem_onceToken != -1) {
    dispatch_once(&unknownSystem_onceToken, v4);
  }
  v2 = (void *)unknownSystem_ret;

  return v2;
}

void __38__HKMedicalCodingSystem_unknownSystem__block_invoke(uint64_t a1)
{
  v2 = [HKMedicalCodingSystem alloc];
  v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"MEDICAL_CODING_SYSTEM_UNKNOWN" value:&stru_1EEC60288 table:@"Localizable-Clinical-Health-Records"];
  uint64_t v5 = [(HKMedicalCodingSystem *)v2 initWithIdentifier:@"urn:apple:medicalrecords:unknown" name:v4 OID:0 type:3 synonyms:0 hasDisplayStrings:0];
  v6 = (void *)unknownSystem_ret;
  unknownSystem_ret = v5;

  if (!unknownSystem_ret)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"HKMedicalCodingSystem.m" lineNumber:374 description:@"Apple Text System should never be nil"];
  }
}

+ (id)appleOntologySystem
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__HKMedicalCodingSystem_appleOntologySystem__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (appleOntologySystem_onceToken != -1) {
    dispatch_once(&appleOntologySystem_onceToken, v4);
  }
  v2 = (void *)appleOntologySystem_ret;

  return v2;
}

void __44__HKMedicalCodingSystem_appleOntologySystem__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) codeSystemWithIdentifier:@"urn:apple:health:ontology"];
  v3 = (void *)appleOntologySystem_ret;
  appleOntologySystem_ret = v2;

  if (!appleOntologySystem_ret)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HKMedicalCodingSystem.m" lineNumber:386 description:@"Appple ontology System should never be nil"];
  }
}

+ (id)adHocConceptSystem
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__HKMedicalCodingSystem_adHocConceptSystem__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (adHocConceptSystem_onceToken != -1) {
    dispatch_once(&adHocConceptSystem_onceToken, v4);
  }
  uint64_t v2 = (void *)adHocConceptSystem_ret;

  return v2;
}

void __43__HKMedicalCodingSystem_adHocConceptSystem__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) codeSystemWithIdentifier:@"urn:apple:health:ontology:ad-hoc"];
  v3 = (void *)adHocConceptSystem_ret;
  adHocConceptSystem_ret = v2;

  if (!adHocConceptSystem_ret)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HKMedicalCodingSystem.m" lineNumber:398 description:@"Ad-Hoc Concept System should never be nil"];
  }
}

+ (id)appleHealthDataTypeSystem
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HKMedicalCodingSystem_appleHealthDataTypeSystem__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (appleHealthDataTypeSystem_onceToken != -1) {
    dispatch_once(&appleHealthDataTypeSystem_onceToken, v4);
  }
  uint64_t v2 = (void *)appleHealthDataTypeSystem_ret;

  return v2;
}

void __50__HKMedicalCodingSystem_appleHealthDataTypeSystem__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) codeSystemWithIdentifier:@"urn:apple:health:data-type"];
  v3 = (void *)appleHealthDataTypeSystem_ret;
  appleHealthDataTypeSystem_ret = v2;

  if (!appleHealthDataTypeSystem_ret)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HKMedicalCodingSystem.m" lineNumber:410 description:@"Apple Data Type System should never be nil"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicalCodingSystem *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = [(HKMedicalCodingSystem *)v4 identifier];
      uint64_t v8 = [(HKMedicalCodingSystem *)self identifier];
      char v6 = [v7 isEqualToString:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = +[HKMedicalCodingSystem hash];
  return [(NSString *)self->_identifier hash] ^ v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(HKMedicalCodingSystem *)self identifier];
  uint64_t v5 = [(HKMedicalCodingSystem *)self name];
  char v6 = [(HKMedicalCodingSystem *)self OID];
  id v7 = [v3 stringWithFormat:@"Code System (Identifier: %@, Name: %@, OID: %@)", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalCodingSystem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  char v6 = +[HKMedicalCodingSystem codeSystemWithIdentifier:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKMedicalCodingSystem *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

+ (id)externalCodeSystems
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HKMedicalCodingSystem_externalCodeSystems__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (externalCodeSystems_onceToken != -1) {
    dispatch_once(&externalCodeSystems_onceToken, block);
  }
  uint64_t v2 = (void *)externalCodeSystems_externalCodeSystems;

  return v2;
}

void __44__HKMedicalCodingSystem_externalCodeSystems__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 365; i += 5)
  {
    id v4 = (void *)MEMORY[0x19F395970]();
    long long v5 = *(_OWORD *)&HKCodeSystemDefinitionsWithCount_systemDefinitions[i + 2];
    v9[0] = *(_OWORD *)&HKCodeSystemDefinitionsWithCount_systemDefinitions[i];
    v9[1] = v5;
    unint64_t v10 = HKCodeSystemDefinitionsWithCount_systemDefinitions[i + 4];
    char v6 = [*(id *)(a1 + 32) systemWithSystemDefinition:v9];
    [v2 addObject:v6];
  }
  uint64_t v7 = [v2 copy];
  uint64_t v8 = (void *)externalCodeSystems_externalCodeSystems;
  externalCodeSystems_externalCodeSystems = v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)OID
{
  return self->_OID;
}

- (void)setOID:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
}

- (BOOL)hasDisplayStrings
{
  return self->_hasDisplayStrings;
}

- (void)setHasDisplayStrings:(BOOL)a3
{
  self->_hasDisplayStrings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_OID, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)ontology_hasCodingSystemAttributeIdentifier
{
  id v2 = [(HKMedicalCodingSystem *)self identifier];
  uint64_t v3 = [&unk_1EECE6590 objectForKeyedSubscript:v2];

  return v3;
}

@end