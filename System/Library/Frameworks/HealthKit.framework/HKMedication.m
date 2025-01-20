@interface HKMedication
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalCodingCollection)codingCollection;
- (HKMedication)init;
- (HKMedication)initWithCoder:(id)a3;
- (HKMedication)initWithIdentifier:(id)a3 displayNameComponents:(id)a4 loggingUnit:(id)a5 components:(id)a6 codingCollection:(id)a7;
- (HKMedicationDisplayNameComponents)displayNameComponents;
- (HKMedicationIdentifier)identifier;
- (HKMedicationLoggingUnit)loggingUnit;
- (NSArray)components;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedication

- (HKMedication)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedication)initWithIdentifier:(id)a3 displayNameComponents:(id)a4 loggingUnit:(id)a5 components:(id)a6 codingCollection:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKMedication;
  v17 = [(HKMedication *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (HKMedicationIdentifier *)v18;

    uint64_t v20 = [v13 copy];
    displayNameComponents = v17->_displayNameComponents;
    v17->_displayNameComponents = (HKMedicationDisplayNameComponents *)v20;

    uint64_t v22 = [v14 copy];
    loggingUnit = v17->_loggingUnit;
    v17->_loggingUnit = (HKMedicationLoggingUnit *)v22;

    uint64_t v24 = [v15 copy];
    components = v17->_components;
    v17->_components = (NSArray *)v24;

    uint64_t v26 = [v16 copy];
    codingCollection = v17->_codingCollection;
    v17->_codingCollection = (HKClinicalCodingCollection *)v26;
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedication *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HKMedication *)v5 identifier];
      uint64_t v7 = [(HKMedication *)self identifier];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HKMedication *)self identifier];
        if (!v9) {
          goto LABEL_29;
        }
        v10 = (void *)v9;
        v11 = [(HKMedication *)v5 identifier];
        id v12 = [(HKMedication *)self identifier];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_30;
        }
      }
      v6 = [(HKMedication *)v5 displayNameComponents];
      uint64_t v15 = [(HKMedication *)self displayNameComponents];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        v8 = (void *)v15;
        uint64_t v16 = [(HKMedication *)self displayNameComponents];
        if (!v16) {
          goto LABEL_29;
        }
        v17 = (void *)v16;
        uint64_t v18 = [(HKMedication *)v5 displayNameComponents];
        v19 = [(HKMedication *)self displayNameComponents];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_30;
        }
      }
      v6 = [(HKMedication *)v5 loggingUnit];
      uint64_t v21 = [(HKMedication *)self loggingUnit];
      if (v6 == (void *)v21)
      {
      }
      else
      {
        v8 = (void *)v21;
        uint64_t v22 = [(HKMedication *)self loggingUnit];
        if (!v22) {
          goto LABEL_29;
        }
        v23 = (void *)v22;
        uint64_t v24 = [(HKMedication *)v5 loggingUnit];
        v25 = [(HKMedication *)self loggingUnit];
        int v26 = [v24 isEqual:v25];

        if (!v26) {
          goto LABEL_30;
        }
      }
      v6 = [(HKMedication *)v5 components];
      uint64_t v27 = [(HKMedication *)self components];
      if (v6 == (void *)v27)
      {
      }
      else
      {
        v8 = (void *)v27;
        uint64_t v28 = [(HKMedication *)self components];
        if (!v28) {
          goto LABEL_29;
        }
        objc_super v29 = (void *)v28;
        v30 = [(HKMedication *)v5 components];
        v31 = [(HKMedication *)self components];
        int v32 = [v30 isEqualToArray:v31];

        if (!v32) {
          goto LABEL_30;
        }
      }
      v6 = [(HKMedication *)v5 codingCollection];
      uint64_t v33 = [(HKMedication *)self codingCollection];
      if (v6 == (void *)v33)
      {

LABEL_34:
        BOOL v14 = 1;
        goto LABEL_31;
      }
      v8 = (void *)v33;
      uint64_t v34 = [(HKMedication *)self codingCollection];
      if (v34)
      {
        v35 = (void *)v34;
        v36 = [(HKMedication *)v5 codingCollection];
        v37 = [(HKMedication *)self codingCollection];
        char v38 = [v36 isEqual:v37];

        if (v38) {
          goto LABEL_34;
        }
LABEL_30:
        BOOL v14 = 0;
LABEL_31:

        goto LABEL_32;
      }
LABEL_29:

      goto LABEL_30;
    }
    BOOL v14 = 0;
  }
LABEL_32:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMedicationIdentifier *)self->_identifier hash];
  unint64_t v4 = [(HKMedicationDisplayNameComponents *)self->_displayNameComponents hash] ^ v3;
  unint64_t v5 = [(HKMedicationLoggingUnit *)self->_loggingUnit hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_components hash];
  return v6 ^ [(HKClinicalCodingCollection *)self->_codingCollection hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedication)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMedication;
  unint64_t v5 = [(HKMedication *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (HKMedicationIdentifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DisplayNameComponentsKey"];
    displayNameComponents = v5->_displayNameComponents;
    v5->_displayNameComponents = (HKMedicationDisplayNameComponents *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LoggingUnitKey"];
    loggingUnit = v5->_loggingUnit;
    v5->_loggingUnit = (HKMedicationLoggingUnit *)v10;

    id v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"ComponentsKey"];
    components = v5->_components;
    v5->_components = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CodingCollectionKey"];
    codingCollection = v5->_codingCollection;
    v5->_codingCollection = (HKClinicalCodingCollection *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"IdentifierKey"];
  [v5 encodeObject:self->_displayNameComponents forKey:@"DisplayNameComponentsKey"];
  [v5 encodeObject:self->_loggingUnit forKey:@"LoggingUnitKey"];
  [v5 encodeObject:self->_components forKey:@"ComponentsKey"];
  [v5 encodeObject:self->_codingCollection forKey:@"CodingCollectionKey"];
}

- (HKMedicationIdentifier)identifier
{
  return self->_identifier;
}

- (HKMedicationDisplayNameComponents)displayNameComponents
{
  return self->_displayNameComponents;
}

- (HKMedicationLoggingUnit)loggingUnit
{
  return self->_loggingUnit;
}

- (NSArray)components
{
  return self->_components;
}

- (HKClinicalCodingCollection)codingCollection
{
  return self->_codingCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingCollection, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_loggingUnit, 0);
  objc_storeStrong((id *)&self->_displayNameComponents, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end