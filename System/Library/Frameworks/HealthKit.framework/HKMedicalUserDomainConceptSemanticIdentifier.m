@interface HKMedicalUserDomainConceptSemanticIdentifier
+ (HKMedicalUserDomainConceptSemanticIdentifier)semanticIdentifierWithComponents:(id)a3;
- (HKMedicalCoding)medicalCoding;
- (HKMedicalUserDomainConceptSemanticIdentifier)init;
- (HKMedicalUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3;
- (HKMedicalUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3 countryCode:(id)a4 medicalCoding:(id)a5;
- (NSString)countryCode;
- (NSUUID)UUID;
- (id)stringValue;
@end

@implementation HKMedicalUserDomainConceptSemanticIdentifier

- (HKMedicalUserDomainConceptSemanticIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicalUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HKMedicalUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3 countryCode:(id)a4 medicalCoding:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((v10 != 0) != (v12 == 0))
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKMedicalUserDomainConceptSemanticIdentifier.m", 32, @"Trying to initialize a medical user domain concept semantic identifier, but UUID and Medical coding are both populated, or both unpopulated" object file lineNumber description];
  }
  v13 = +[HKUserDomainConceptTypeIdentifier medicalUserDomainConceptIdentifier];
  v17.receiver = self;
  v17.super_class = (Class)HKMedicalUserDomainConceptSemanticIdentifier;
  v14 = [(HKUserDomainConceptSemanticIdentifier *)&v17 initWithTypeIdentifier:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_UUID, a3);
    objc_storeStrong((id *)&v14->_countryCode, a4);
    objc_storeStrong((id *)&v14->_medicalCoding, a5);
  }

  return v14;
}

+ (HKMedicalUserDomainConceptSemanticIdentifier)semanticIdentifierWithComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] != 3)
  {
    v18 = 0;
    goto LABEL_22;
  }
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  if ([v4 isEqualToString:@"(null)"]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = v5;
  v7 = [v3 objectAtIndexedSubscript:1];
  if ([v7 isEqualToString:@"(null)"]) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }
  id v9 = v8;
  id v10 = [v3 objectAtIndexedSubscript:2];
  if ([v10 isEqualToString:@"(null)"]) {
    id v11 = 0;
  }
  else {
    id v11 = v10;
  }
  id v12 = v11;
  if (![v9 isEqualToString:@"UUID"])
  {
    if (v9)
    {
      v19 = [HKMedicalCoding alloc];
      v20 = +[HKMedicalCodingSystem codeSystemWithIdentifier:v9];
      v13 = [(HKMedicalCoding *)v19 initWithCodingSystem:v20 codingVersion:0 code:v12 displayString:0];

      id v14 = objc_alloc((Class)objc_opt_class());
      v15 = 0;
      id v16 = v6;
      objc_super v17 = v13;
      goto LABEL_18;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  if (!v12) {
    goto LABEL_20;
  }
  v13 = (HKMedicalCoding *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
  if (!v13)
  {
    v18 = 0;
    goto LABEL_19;
  }
  id v14 = objc_alloc((Class)objc_opt_class());
  v15 = v13;
  id v16 = v6;
  objc_super v17 = 0;
LABEL_18:
  v18 = (void *)[v14 initWithUUID:v15 countryCode:v16 medicalCoding:v17];
LABEL_19:

LABEL_21:
LABEL_22:

  return (HKMedicalUserDomainConceptSemanticIdentifier *)v18;
}

- (id)stringValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19.receiver = self;
  v19.super_class = (Class)HKMedicalUserDomainConceptSemanticIdentifier;
  uint64_t v4 = [(HKUserDomainConceptSemanticIdentifier *)&v19 stringValue];
  [v3 addObject:v4];

  uint64_t v5 = [(NSString *)self->_countryCode uppercaseString];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"(null)";
  }
  [v3 addObject:v7];

  medicalCoding = self->_medicalCoding;
  if (medicalCoding)
  {
    id v9 = [(HKMedicalCoding *)medicalCoding codingSystem];
    uint64_t v10 = [v9 identifier];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    else {
      id v12 = @"(null)";
    }
    [v3 addObject:v12];

    uint64_t v13 = [(HKMedicalCoding *)self->_medicalCoding code];
    id v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"(null)";
    }
    [v3 addObject:v15];
  }
  else
  {
    [v3 addObject:@"UUID"];
    id v14 = [(HKMedicalUserDomainConceptSemanticIdentifier *)self UUID];
    id v16 = [v14 UUIDString];
    [v3 addObject:v16];
  }
  objc_super v17 = [v3 componentsJoinedByString:@"|█|"];

  return v17;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (HKMedicalCoding)medicalCoding
{
  return self->_medicalCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalCoding, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end