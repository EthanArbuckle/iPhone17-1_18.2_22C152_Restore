@interface HKMedicationUserDomainConceptSemanticIdentifier
+ (id)semanticIdentifierWithComponents:(id)a3;
- (HKMedicalCoding)medicalCoding;
- (HKMedicationUserDomainConceptSemanticIdentifier)init;
- (HKMedicationUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3;
- (HKMedicationUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3 medicalCoding:(id)a4;
- (NSUUID)UUID;
- (id)stringValue;
@end

@implementation HKMedicationUserDomainConceptSemanticIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalCoding, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)stringValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"medication"];
  v4 = [&unk_1F1719058 stringValue];
  [v3 addObject:v4];

  medicalCoding = self->_medicalCoding;
  if (medicalCoding)
  {
    v6 = [(HKMedicalCoding *)medicalCoding codingSystem];
    uint64_t v7 = [v6 identifier];
    v8 = (void *)v7;
    uint64_t v9 = *MEMORY[0x1E4F2AA68];
    if (v7) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = *MEMORY[0x1E4F2AA68];
    }
    [v3 addObject:v10];

    uint64_t v11 = [(HKMedicalCoding *)self->_medicalCoding code];
    v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v9;
    }
    [v3 addObject:v13];
  }
  else
  {
    [v3 addObject:*MEMORY[0x1E4F2AA78]];
    v12 = [(HKMedicationUserDomainConceptSemanticIdentifier *)self UUID];
    v14 = [v12 UUIDString];
    [v3 addObject:v14];
  }
  v15 = [v3 componentsJoinedByString:*MEMORY[0x1E4F2AA70]];

  return v15;
}

- (HKMedicationUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3 medicalCoding:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ((v8 != 0) != (v9 == 0))
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKMedicationUserDomainConceptSemanticIdentifier.m", 27, @"Trying to initialize a medication user domain concept semantic identifier, but UUID and Medical coding are both populated, or both unpopulated" object file lineNumber description];
  }
  uint64_t v10 = [MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationUserDomainConceptSemanticIdentifier;
  uint64_t v11 = [(HKUserDomainConceptSemanticIdentifier *)&v14 initWithTypeIdentifier:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_UUID, a3);
    objc_storeStrong((id *)&v11->_medicalCoding, a4);
  }

  return v11;
}

- (HKMedicationUserDomainConceptSemanticIdentifier)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] != 2)
  {
    v15 = 0;
    goto LABEL_19;
  }
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = *MEMORY[0x1E4F2AA68];
  if ([v4 isEqualToString:*MEMORY[0x1E4F2AA68]]) {
    v6 = 0;
  }
  else {
    v6 = v4;
  }
  id v7 = v6;
  id v8 = [v3 objectAtIndexedSubscript:1];
  if ([v8 isEqualToString:v5]) {
    id v9 = 0;
  }
  else {
    id v9 = v8;
  }
  id v10 = v9;
  if (![v7 isEqualToString:*MEMORY[0x1E4F2AA78]])
  {
    if (v7)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F2B170]);
      v17 = [MEMORY[0x1E4F2B180] codeSystemWithIdentifier:v7];
      uint64_t v11 = (void *)[v16 initWithCodingSystem:v17 codingVersion:0 code:v10 displayString:0];

      id v12 = objc_alloc((Class)objc_opt_class());
      uint64_t v13 = 0;
      objc_super v14 = v11;
      goto LABEL_15;
    }
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
  if (!v11)
  {
    v15 = 0;
    goto LABEL_16;
  }
  id v12 = objc_alloc((Class)objc_opt_class());
  uint64_t v13 = v11;
  objc_super v14 = 0;
LABEL_15:
  v15 = (void *)[v12 initWithUUID:v13 medicalCoding:v14];
LABEL_16:

LABEL_18:
LABEL_19:

  return v15;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (HKMedicalCoding)medicalCoding
{
  return self->_medicalCoding;
}

@end