@interface HKMedicationIngredient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalCodingCollection)substanceCodingCollection;
- (HKMedicationIngredient)init;
- (HKMedicationIngredient)initWithCoder:(id)a3;
- (HKMedicationIngredient)initWithSubstanceCodingCollection:(id)a3 numerator:(id)a4 denominator:(id)a5;
- (HKQuantity)denominator;
- (HKQuantity)numerator;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationIngredient

- (HKMedicationIngredient)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationIngredient)initWithSubstanceCodingCollection:(id)a3 numerator:(id)a4 denominator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationIngredient;
  v11 = [(HKMedicationIngredient *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    substanceCodingCollection = v11->_substanceCodingCollection;
    v11->_substanceCodingCollection = (HKClinicalCodingCollection *)v12;

    uint64_t v14 = [v9 copy];
    numerator = v11->_numerator;
    v11->_numerator = (HKQuantity *)v14;

    uint64_t v16 = [v10 copy];
    denominator = v11->_denominator;
    v11->_denominator = (HKQuantity *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationIngredient *)a3;
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
      v6 = [(HKMedicationIngredient *)v5 substanceCodingCollection];
      uint64_t v7 = [(HKMedicationIngredient *)self substanceCodingCollection];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKMedicationIngredient *)self substanceCodingCollection];
        if (!v9) {
          goto LABEL_19;
        }
        id v10 = (void *)v9;
        v11 = [(HKMedicationIngredient *)v5 substanceCodingCollection];
        uint64_t v12 = [(HKMedicationIngredient *)self substanceCodingCollection];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_20;
        }
      }
      v6 = [(HKMedicationIngredient *)v5 numerator];
      uint64_t v15 = [(HKMedicationIngredient *)self numerator];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        id v8 = (void *)v15;
        uint64_t v16 = [(HKMedicationIngredient *)self numerator];
        if (!v16) {
          goto LABEL_19;
        }
        v17 = (void *)v16;
        v18 = [(HKMedicationIngredient *)v5 numerator];
        objc_super v19 = [(HKMedicationIngredient *)self numerator];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_20;
        }
      }
      v6 = [(HKMedicationIngredient *)v5 denominator];
      uint64_t v21 = [(HKMedicationIngredient *)self denominator];
      if (v6 == (void *)v21)
      {

LABEL_24:
        BOOL v14 = 1;
        goto LABEL_21;
      }
      id v8 = (void *)v21;
      uint64_t v22 = [(HKMedicationIngredient *)self denominator];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(HKMedicationIngredient *)v5 denominator];
        v25 = [(HKMedicationIngredient *)self denominator];
        char v26 = [v24 isEqual:v25];

        if (v26) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKClinicalCodingCollection *)self->_substanceCodingCollection hash];
  unint64_t v4 = [(HKQuantity *)self->_numerator hash] ^ v3;
  return v4 ^ [(HKQuantity *)self->_denominator hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationIngredient)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationIngredient;
  v5 = [(HKMedicationIngredient *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Collection"];
    substanceCodingCollection = v5->_substanceCodingCollection;
    v5->_substanceCodingCollection = (HKClinicalCodingCollection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Numerator"];
    numerator = v5->_numerator;
    v5->_numerator = (HKQuantity *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Denominator"];
    denominator = v5->_denominator;
    v5->_denominator = (HKQuantity *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  substanceCodingCollection = self->_substanceCodingCollection;
  id v5 = a3;
  [v5 encodeObject:substanceCodingCollection forKey:@"Collection"];
  [v5 encodeObject:self->_numerator forKey:@"Numerator"];
  [v5 encodeObject:self->_denominator forKey:@"Denominator"];
}

- (HKClinicalCodingCollection)substanceCodingCollection
{
  return self->_substanceCodingCollection;
}

- (HKQuantity)numerator
{
  return self->_numerator;
}

- (HKQuantity)denominator
{
  return self->_denominator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denominator, 0);
  objc_storeStrong((id *)&self->_numerator, 0);

  objc_storeStrong((id *)&self->_substanceCodingCollection, 0);
}

@end