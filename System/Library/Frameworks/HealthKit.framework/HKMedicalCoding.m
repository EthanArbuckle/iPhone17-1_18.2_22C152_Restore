@interface HKMedicalCoding
+ (BOOL)supportsSecureCoding;
+ (HKMedicalCoding)loinc_diastolicBloodPressureCoding;
+ (HKMedicalCoding)loinc_systolicBloodPressureCoding;
+ (HKMedicalCoding)medicalCodingWithSystem:(id)a3 codingVersion:(id)a4 code:(id)a5 displayString:(id)a6;
+ (HKMedicalCoding)ucum_centimeterUnitCoding;
+ (HKMedicalCoding)ucum_meterUnitCoding;
+ (id)ICD10CodingWithCode:(id)a3;
+ (id)ICD10CodingWithCode:(id)a3 displayString:(id)a4;
+ (id)ICD9CodingWithCode:(id)a3;
+ (id)ICD9CodingWithCode:(id)a3 displayString:(id)a4;
+ (id)LOINCCodingWithCode:(id)a3;
+ (id)LOINCCodingWithCode:(id)a3 displayString:(id)a4;
+ (id)RxNormCodingWithCode:(id)a3;
+ (id)RxNormCodingWithCode:(id)a3 displayString:(id)a4;
+ (id)SNOMEDCodingWithCode:(id)a3;
+ (id)SNOMEDCodingWithCode:(id)a3 displayString:(id)a4;
+ (id)appleOntologyCodingWithIdentifier:(id)a3;
+ (id)appleOntologyCodingWithRawIdentifier:(int64_t)a3;
+ (id)text_codingWithDisplayString:(id)a3;
+ (id)ucum_codingWithCode:(id)a3 displayString:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (HKMedicalCoding)init;
- (HKMedicalCoding)initWithCoder:(id)a3;
- (HKMedicalCoding)initWithCodingSystem:(id)a3 codingVersion:(id)a4 code:(id)a5 displayString:(id)a6;
- (HKMedicalCodingSystem)codingSystem;
- (NSString)code;
- (NSString)codingVersion;
- (NSString)displayString;
- (id)_validateConfiguration;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalCoding

+ (id)ICD10CodingWithCode:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKMedicalCoding+ICD10.m", 18, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];
  }
  v9 = +[HKMedicalCodingSystem ICD10System];
  v10 = +[HKMedicalCoding medicalCodingWithSystem:v9 codingVersion:0 code:v7 displayString:v8];

  return v10;
}

+ (id)ICD10CodingWithCode:(id)a3
{
  return (id)[a1 ICD10CodingWithCode:a3 displayString:0];
}

+ (id)ucum_codingWithCode:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HKMedicalCoding+UCUM.m", 17, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"HKMedicalCoding+UCUM.m", 18, @"Invalid parameter not satisfying: %@", @"displayString" object file lineNumber description];

LABEL_3:
  v10 = +[HKMedicalCodingSystem UCUMSystem];
  v11 = +[HKMedicalCoding medicalCodingWithSystem:v10 codingVersion:0 code:v7 displayString:v9];

  return v11;
}

+ (HKMedicalCoding)ucum_meterUnitCoding
{
  return (HKMedicalCoding *)objc_msgSend(a1, "ucum_codingWithCode:displayString:", @"m", @"meter");
}

+ (HKMedicalCoding)ucum_centimeterUnitCoding
{
  return (HKMedicalCoding *)objc_msgSend(a1, "ucum_codingWithCode:displayString:", @"cm", @"centimeter");
}

+ (id)LOINCCodingWithCode:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKMedicalCoding+LOINC.m", 18, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];
  }
  v9 = +[HKMedicalCodingSystem LOINCCodeSystem];
  v10 = +[HKMedicalCoding medicalCodingWithSystem:v9 codingVersion:0 code:v7 displayString:v8];

  return v10;
}

+ (id)LOINCCodingWithCode:(id)a3
{
  return (id)[a1 LOINCCodingWithCode:a3 displayString:0];
}

+ (HKMedicalCoding)loinc_diastolicBloodPressureCoding
{
  return (HKMedicalCoding *)[a1 LOINCCodingWithCode:@"8462-4"];
}

+ (HKMedicalCoding)loinc_systolicBloodPressureCoding
{
  return (HKMedicalCoding *)[a1 LOINCCodingWithCode:@"8480-6"];
}

+ (id)ICD9CodingWithCode:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKMedicalCoding+ICD9CM.m", 18, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];
  }
  v9 = +[HKMedicalCodingSystem ICD9System];
  v10 = +[HKMedicalCoding medicalCodingWithSystem:v9 codingVersion:0 code:v7 displayString:v8];

  return v10;
}

+ (id)ICD9CodingWithCode:(id)a3
{
  return (id)[a1 ICD9CodingWithCode:a3 displayString:0];
}

+ (id)RxNormCodingWithCode:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKMedicalCoding+RxNorm.m", 17, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];
  }
  v9 = +[HKMedicalCodingSystem RxNormCodeSystem];
  v10 = +[HKMedicalCoding medicalCodingWithSystem:v9 codingVersion:0 code:v7 displayString:v8];

  return v10;
}

+ (id)RxNormCodingWithCode:(id)a3
{
  return (id)[a1 RxNormCodingWithCode:a3 displayString:0];
}

+ (id)text_codingWithDisplayString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"HKMedicalCoding+Text.m", 16, @"Invalid parameter not satisfying: %@", @"displayString" object file lineNumber description];
  }
  v6 = +[HKMedicalCodingSystem textSystem];
  id v7 = +[HKMedicalCoding medicalCodingWithSystem:v6 codingVersion:@"1" code:v5 displayString:v5];

  return v7;
}

+ (id)SNOMEDCodingWithCode:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKMedicalCoding+SNOMED.m", 18, @"Invalid parameter not satisfying: %@", @"code" object file lineNumber description];
  }
  v9 = +[HKMedicalCodingSystem SNOMEDCodeSystem];
  v10 = +[HKMedicalCoding medicalCodingWithSystem:v9 codingVersion:0 code:v7 displayString:v8];

  return v10;
}

+ (id)SNOMEDCodingWithCode:(id)a3
{
  return (id)[a1 SNOMEDCodingWithCode:a3 displayString:0];
}

+ (id)appleOntologyCodingWithRawIdentifier:(int64_t)a3
{
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", a3);
  v4 = [HKMedicalCoding alloc];
  id v5 = +[HKMedicalCodingSystem appleOntologySystem];
  v6 = [(HKMedicalCoding *)v4 initWithCodingSystem:v5 codingVersion:0 code:v3 displayString:0];

  return v6;
}

+ (id)appleOntologyCodingWithIdentifier:(id)a3
{
  uint64_t v4 = [a3 rawIdentifier];

  return (id)[a1 appleOntologyCodingWithRawIdentifier:v4];
}

+ (HKMedicalCoding)medicalCodingWithSystem:(id)a3 codingVersion:(id)a4 code:(id)a5 displayString:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithCodingSystem:v13 codingVersion:v12 code:v11 displayString:v10];

  return (HKMedicalCoding *)v14;
}

- (HKMedicalCoding)initWithCodingSystem:(id)a3 codingVersion:(id)a4 code:(id)a5 displayString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HKMedicalCoding;
  v14 = [(HKMedicalCoding *)&v29 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    codingSystem = v14->_codingSystem;
    v14->_codingSystem = (HKMedicalCodingSystem *)v15;

    uint64_t v17 = [v11 copy];
    codingVersion = v14->_codingVersion;
    v14->_codingVersion = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    code = v14->_code;
    v14->_code = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    displayString = v14->_displayString;
    v14->_displayString = (NSString *)v21;

    v23 = [(HKMedicalCoding *)v14 _validateConfiguration];
    v24 = v23;
    if (v23)
    {
      v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3C8];
      v27 = [v23 localizedDescription];
      [v25 raise:v26, @"%@", v27 format];
    }
  }

  return v14;
}

- (HKMedicalCoding)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)isEquivalent:(id)a3
{
  uint64_t v4 = (HKMedicalCoding *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HKMedicalCoding *)v4 codingSystem];
      v6 = +[HKMedicalCodingSystem LOINCCodeSystem];
      id v7 = (void *)[v5 isEqual:v6];

      if (v7)
      {
        id v8 = [(HKMedicalCoding *)self codingSystem];
        v9 = [(HKMedicalCoding *)v4 codingSystem];
        if (v8 == v9)
        {
          [(HKMedicalCoding *)self code];
        }
        else
        {
          uint64_t v10 = [(HKMedicalCoding *)v4 codingSystem];
          if (!v10)
          {
            char v13 = 0;
LABEL_21:

            goto LABEL_22;
          }
          id v7 = (void *)v10;
          id v11 = [(HKMedicalCoding *)self codingSystem];
          id v12 = [(HKMedicalCoding *)v4 codingSystem];
          if (![v11 isEqual:v12])
          {
            char v13 = 0;
LABEL_20:

            goto LABEL_21;
          }
          [(HKMedicalCoding *)self code];
        v14 = };
        uint64_t v15 = [(HKMedicalCoding *)v4 code];
        if (v14 == (void *)v15)
        {

          char v13 = 1;
        }
        else
        {
          v16 = (void *)v15;
          uint64_t v17 = [(HKMedicalCoding *)v4 code];
          if (v17)
          {
            v18 = (void *)v17;
            uint64_t v19 = [(HKMedicalCoding *)self code];
            v20 = [(HKMedicalCoding *)v4 code];
            char v13 = [v19 isEqual:v20];
          }
          else
          {

            char v13 = 0;
          }
        }
        id v12 = v23;
        id v11 = v25;
        if (v8 == v9) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      char v13 = [(HKMedicalCoding *)self isEqual:v4];
    }
    else
    {
      char v13 = 0;
    }
  }
LABEL_22:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HKMedicalCoding *)self codingSystem];
  id v7 = [v6 identifier];
  id v8 = [(HKMedicalCoding *)self codingVersion];
  v9 = [(HKMedicalCoding *)self code];
  uint64_t v10 = [(HKMedicalCoding *)self displayString];
  id v11 = [v3 stringWithFormat:@"<%@:%p, system='%@', version=%@, code='%@', displayString='%@'>", v5, self, v7, v8, v9, v10];

  return v11;
}

- (id)_validateConfiguration
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicalCoding *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(HKMedicalCoding *)v5 codingSystem];
      uint64_t v7 = [(HKMedicalCoding *)self codingSystem];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKMedicalCoding *)self codingSystem];
        if (!v9) {
          goto LABEL_24;
        }
        uint64_t v10 = (void *)v9;
        id v11 = [(HKMedicalCoding *)v5 codingSystem];
        id v12 = [(HKMedicalCoding *)self codingSystem];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_25;
        }
      }
      v6 = [(HKMedicalCoding *)v5 codingVersion];
      uint64_t v15 = [(HKMedicalCoding *)self codingVersion];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        id v8 = (void *)v15;
        uint64_t v16 = [(HKMedicalCoding *)self codingVersion];
        if (!v16) {
          goto LABEL_24;
        }
        uint64_t v17 = (void *)v16;
        v18 = [(HKMedicalCoding *)v5 codingVersion];
        uint64_t v19 = [(HKMedicalCoding *)self codingVersion];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_25;
        }
      }
      v6 = [(HKMedicalCoding *)v5 code];
      uint64_t v21 = [(HKMedicalCoding *)self code];
      if (v6 == (void *)v21)
      {
      }
      else
      {
        id v8 = (void *)v21;
        uint64_t v22 = [(HKMedicalCoding *)self code];
        if (!v22) {
          goto LABEL_24;
        }
        v23 = (void *)v22;
        uint64_t v24 = [(HKMedicalCoding *)v5 code];
        v25 = [(HKMedicalCoding *)self code];
        int v26 = [v24 isEqualToString:v25];

        if (!v26) {
          goto LABEL_25;
        }
      }
      v6 = [(HKMedicalCoding *)v5 displayString];
      uint64_t v27 = [(HKMedicalCoding *)self displayString];
      if (v6 == (void *)v27)
      {

LABEL_29:
        BOOL v14 = 1;
        goto LABEL_26;
      }
      id v8 = (void *)v27;
      uint64_t v28 = [(HKMedicalCoding *)self displayString];
      if (v28)
      {
        objc_super v29 = (void *)v28;
        v30 = [(HKMedicalCoding *)v5 displayString];
        v31 = [(HKMedicalCoding *)self displayString];
        char v32 = [v30 isEqualToString:v31];

        if (v32) {
          goto LABEL_29;
        }
LABEL_25:
        BOOL v14 = 0;
LABEL_26:

        goto LABEL_27;
      }
LABEL_24:

      goto LABEL_25;
    }
    BOOL v14 = 0;
  }
LABEL_27:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_code hash];
  NSUInteger v4 = [(NSString *)self->_displayString hash] ^ v3;
  if (!v4) {
    NSUInteger v4 = [(NSString *)self->_displayString hash];
  }
  unint64_t v5 = [(HKMedicalCodingSystem *)self->_codingSystem hash];
  return v5 ^ v4 ^ [(NSString *)self->_codingVersion hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalCoding)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicalCoding;
  unint64_t v5 = [(HKMedicalCoding *)&v17 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CodingSystem"];
  codingSystem = v5->_codingSystem;
  v5->_codingSystem = (HKMedicalCodingSystem *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CodingVersion"];
  codingVersion = v5->_codingVersion;
  v5->_codingVersion = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Code"];
  code = v5->_code;
  v5->_code = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayString"];
  displayString = v5->_displayString;
  v5->_displayString = (NSString *)v12;

  BOOL v14 = [(HKMedicalCoding *)v5 _validateConfiguration];

  if (v14) {
    uint64_t v15 = 0;
  }
  else {
LABEL_4:
  }
    uint64_t v15 = v5;

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  codingSystem = self->_codingSystem;
  id v5 = a3;
  [v5 encodeObject:codingSystem forKey:@"CodingSystem"];
  [v5 encodeObject:self->_codingVersion forKey:@"CodingVersion"];
  [v5 encodeObject:self->_code forKey:@"Code"];
  [v5 encodeObject:self->_displayString forKey:@"DisplayString"];
}

- (HKMedicalCodingSystem)codingSystem
{
  return self->_codingSystem;
}

- (NSString)codingVersion
{
  return self->_codingVersion;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_codingVersion, 0);

  objc_storeStrong((id *)&self->_codingSystem, 0);
}

@end