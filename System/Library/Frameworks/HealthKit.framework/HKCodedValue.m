@interface HKCodedValue
+ (BOOL)supportsSecureCoding;
+ (id)codedValueWithCodings:(id)a3 value:(id)a4 referenceRanges:(id)a5;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKCodedValue)init;
- (HKCodedValue)initWithCoder:(id)a3;
- (HKCodedValue)initWithCodings:(id)a3 value:(id)a4 referenceRanges:(id)a5;
- (HKConcept)ontologyConcept;
- (HKInspectableValue)value;
- (NSArray)codings;
- (NSArray)referenceRanges;
- (id)chartableCodedQuantitySetWithDate:(id)a3 error:(id *)a4;
- (id)chartableCodedQuantityWithError:(id *)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_setOntologyConcept:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCodedValue

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8 = @"concept";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:&v8 count:1];
  v6 = +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v5, v4, v8, v9);

  return v6;
}

+ (id)codedValueWithCodings:(id)a3 value:(id)a4 referenceRanges:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithCodings:v10 value:v9 referenceRanges:v8];

  return v11;
}

- (HKCodedValue)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKCodedValue)initWithCodings:(id)a3 value:(id)a4 referenceRanges:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HKCodedValue.m", 56, @"Invalid parameter not satisfying: %@", @"codings" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"HKCodedValue.m", 57, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)HKCodedValue;
  v12 = [(HKCodedValue *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    codings = v12->_codings;
    v12->_codings = (NSArray *)v13;

    uint64_t v15 = [v10 copy];
    value = v12->_value;
    v12->_value = (HKInspectableValue *)v15;

    uint64_t v17 = [v11 copy];
    referenceRanges = v12->_referenceRanges;
    v12->_referenceRanges = (NSArray *)v17;
  }
  return v12;
}

- (void)_setOntologyConcept:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKCodedValue.m", 68, @"Invalid parameter not satisfying: %@", @"ontologyConcept" object file lineNumber description];

    id v5 = 0;
  }
  v6 = (HKConcept *)[v5 copy];
  ontologyConcept = self->_ontologyConcept;
  self->_ontologyConcept = v6;
}

- (HKConcept)ontologyConcept
{
  ontologyConcept = self->_ontologyConcept;
  v3 = +[HKMedicalCodingCollection collectionWithCodings:self->_codings];
  uint64_t v4 = HKSafeConcept(ontologyConcept, v3);

  return (HKConcept *)v4;
}

- (id)chartableCodedQuantityWithError:(id *)a3
{
  id v5 = [(HKInspectableValue *)self->_value codedQuantityValue];
  if (v5)
  {
    v6 = [(NSArray *)self->_referenceRanges firstObject];
    codings = self->_codings;
    id v8 = [v6 valueRange];
    id v9 = [v8 min];
    id v10 = [v9 codedQuantityValue];
    id v11 = [v6 valueRange];
    v12 = [v11 max];
    uint64_t v13 = [v12 codedQuantityValue];
    v14 = +[HKChartableCodedQuantity chartableCodedQuantityWithCodings:codings originalCodedQuantity:v5 originalRangeLowCodedQuantity:v10 originalRangeHighCodedQuantity:v13 error:a3];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)chartableCodedQuantitySetWithDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HKInspectableValue *)self->_value codedQuantityValue];

  if (v7)
  {
    id v8 = [(HKCodedValue *)self chartableCodedQuantityWithError:a4];
    if (v8)
    {
      id v9 = +[HKChartableCodedQuantitySet setWithChartableQuantity:v8 date:v6];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v10 = [(HKInspectableValue *)self->_value codedValueCollection];

    if (v10)
    {
      uint64_t v21 = 0;
      objc_super v22 = &v21;
      uint64_t v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0;
      id v11 = [(HKInspectableValue *)self->_value codedValueCollection];
      v12 = [v11 codedValues];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__HKCodedValue_chartableCodedQuantitySetWithDate_error___block_invoke;
      v20[3] = &unk_1E58BBFE0;
      v20[4] = &v21;
      uint64_t v13 = objc_msgSend(v12, "hk_map:", v20);

      v14 = (void *)v22[5];
      if (v14)
      {
        id v15 = v14;
        v16 = v15;
        if (a4) {
          *a4 = v15;
        }
        else {
          _HKLogDroppedError(v15);
        }

        id v9 = 0;
      }
      else
      {
        codings = self->_codings;
        uint64_t v19 = 0;
        id v9 = +[HKChartableCodedQuantitySet setWithMedicalCodings:codings quantities:v13 date:v6 error:&v19];
      }

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to create chartable quantity set from coded value %@", self);
      id v9 = 0;
    }
  }

  return v9;
}

id __56__HKCodedValue_chartableCodedQuantitySetWithDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  v3 = [a2 chartableCodedQuantityWithError:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCodedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKCodedValue;
  id v5 = [(HKCodedValue *)&v18 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"Codings"];
    codings = v5->_codings;
    v5->_codings = (NSArray *)v7;

    if (!v5->_codings)
    {
      v16 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ontologyConcept"];
    ontologyConcept = v5->_ontologyConcept;
    v5->_ontologyConcept = (HKConcept *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    value = v5->_value;
    v5->_value = (HKInspectableValue *)v11;

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"ReferenceRanges"];
    referenceRanges = v5->_referenceRanges;
    v5->_referenceRanges = (NSArray *)v14;
  }
  v16 = v5;
LABEL_6:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  codings = self->_codings;
  id v5 = a3;
  [v5 encodeObject:codings forKey:@"Codings"];
  [v5 encodeObject:self->_ontologyConcept forKey:@"ontologyConcept"];
  [v5 encodeObject:self->_value forKey:@"Value"];
  [v5 encodeObject:self->_referenceRanges forKey:@"ReferenceRanges"];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_codings hash];
  unint64_t v4 = [(HKConcept *)self->_ontologyConcept hash] ^ v3;
  unint64_t v5 = [(HKInspectableValue *)self->_value hash];
  return v4 ^ v5 ^ [(NSArray *)self->_referenceRanges hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKCodedValue *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      codings = self->_codings;
      uint64_t v7 = v5->_codings;
      BOOL v14 = 0;
      if (codings == v7 || v7 && -[NSArray isEqual:](codings, "isEqual:"))
      {
        ontologyConcept = self->_ontologyConcept;
        uint64_t v9 = v5->_ontologyConcept;
        if (ontologyConcept == v9 || v9 && -[HKConcept isEqual:](ontologyConcept, "isEqual:"))
        {
          value = self->_value;
          uint64_t v11 = v5->_value;
          if (value == v11 || v11 && -[HKInspectableValue isEqual:](value, "isEqual:"))
          {
            referenceRanges = self->_referenceRanges;
            uint64_t v13 = v5->_referenceRanges;
            if (referenceRanges == v13 || v13 && -[NSArray isEqual:](referenceRanges, "isEqual:")) {
              BOOL v14 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"concept"])
  {
    if (self->_codings)
    {
      uint64_t v7 = +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:");
      id v8 = +[HKIndexableObject indexableObjectWithObject:v7];
      v11[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 isEqualToString:@"concept"];
  if (v10)
  {
    BOOL v11 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], self->_codings != 0, (uint64_t)v9, (uint64_t)a5);

    if (!v11)
    {
      LOBYTE(v10) = 0;
      goto LABEL_7;
    }
    id v9 = [v8 firstObject];
    v12 = [v9 object];
    uint64_t v13 = (HKConcept *)[v12 copy];
    ontologyConcept = self->_ontologyConcept;
    self->_ontologyConcept = v13;
  }
  else
  {
    +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v9 inClass:objc_opt_class()];
  }

LABEL_7:
  return v10;
}

- (NSArray)codings
{
  return self->_codings;
}

- (HKInspectableValue)value
{
  return self->_value;
}

- (NSArray)referenceRanges
{
  return self->_referenceRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceRanges, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_codings, 0);

  objc_storeStrong((id *)&self->_ontologyConcept, 0);
}

@end