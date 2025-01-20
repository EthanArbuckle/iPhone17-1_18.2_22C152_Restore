@interface HKAllergyReaction
+ (BOOL)supportsSecureCoding;
+ (id)allergyReactionWithManifestationCodings:(id)a3 onsetDate:(id)a4 severityCoding:(id)a5;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKAllergyReaction)init;
- (HKAllergyReaction)initWithCoder:(id)a3;
- (HKAllergyReaction)initWithManifestationCodings:(id)a3 onsetDate:(id)a4 severityCoding:(id)a5;
- (HKConcept)severity;
- (HKMedicalCoding)severityCoding;
- (HKMedicalCodingCollection)severityCodingCollection;
- (HKMedicalDate)onsetDate;
- (NSArray)manifestationCodingCollections;
- (NSArray)manifestationCodings;
- (NSArray)manifestations;
- (NSString)description;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAllergyReaction

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"manifestations";
  v8[1] = @"severity";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v8 count:2];
  v6 = +[HKConceptIndexUtilities keyPaths:v5 prefix:v4];

  return v6;
}

+ (id)allergyReactionWithManifestationCodings:(id)a3 onsetDate:(id)a4 severityCoding:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithManifestationCodings:v10 onsetDate:v9 severityCoding:v8];

  return v11;
}

- (HKAllergyReaction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKAllergyReaction)initWithManifestationCodings:(id)a3 onsetDate:(id)a4 severityCoding:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HKAllergyReaction.m", 63, @"Invalid parameter not satisfying: %@", @"manifestationCodings" object file lineNumber description];
  }
  if (![v9 count])
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HKAllergyReaction.m", 64, @"Invalid parameter not satisfying: %@", @"[manifestationCodings count] > 0" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)HKAllergyReaction;
  v12 = [(HKAllergyReaction *)&v28 init];
  if (v12)
  {
    uint64_t v13 = objc_msgSend(v9, "hk_map:", &__block_literal_global_109);
    manifestationCodings = v12->_manifestationCodings;
    v12->_manifestationCodings = (NSArray *)v13;

    uint64_t v15 = [v10 copy];
    onsetDate = v12->_onsetDate;
    v12->_onsetDate = (HKMedicalDate *)v15;

    uint64_t v17 = [v11 copy];
    severityCoding = v12->_severityCoding;
    v12->_severityCoding = (HKMedicalCoding *)v17;

    v19 = [(HKAllergyReaction *)v12 manifestationCodingCollections];
    uint64_t v20 = objc_msgSend(v19, "hk_map:", &__block_literal_global_31);
    manifestations = v12->_manifestations;
    v12->_manifestations = (NSArray *)v20;

    if (v12->_severityCoding)
    {
      v22 = [(HKAllergyReaction *)v12 severityCodingCollection];
      uint64_t v23 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v22];
      severity = v12->_severity;
      v12->_severity = (HKConcept *)v23;
    }
  }

  return v12;
}

id __75__HKAllergyReaction_initWithManifestationCodings_onsetDate_severityCoding___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

id __75__HKAllergyReaction_initWithManifestationCodings_onsetDate_severityCoding___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HKAllergyReaction *)self manifestationCodings];
  v7 = [(HKAllergyReaction *)self manifestations];
  id v8 = [(HKAllergyReaction *)self severityCoding];
  id v9 = [(HKAllergyReaction *)self severity];
  id v10 = [v3 stringWithFormat:@"<%@:%p manifestationCodings = %@, manifestations = %@, severityCoding = %@, severity = %@>", v5, self, v6, v7, v8, v9, 0];

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAllergyReaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKAllergyReaction;
  v5 = [(HKAllergyReaction *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ManifestationCodings"];
    manifestationCodings = v5->_manifestationCodings;
    v5->_manifestationCodings = (NSArray *)v9;

    if (!v5->_manifestationCodings)
    {
      uint64_t v20 = 0;
      goto LABEL_6;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OnsetDate"];
    onsetDate = v5->_onsetDate;
    v5->_onsetDate = (HKMedicalDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SeverityCoding"];
    severityCoding = v5->_severityCoding;
    v5->_severityCoding = (HKMedicalCoding *)v13;

    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"Manifestations"];
    manifestations = v5->_manifestations;
    v5->_manifestations = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Severity"];
    severity = v5->_severity;
    v5->_severity = (HKConcept *)v18;
  }
  uint64_t v20 = v5;
LABEL_6:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKAllergyReaction *)self manifestationCodings];
  [v4 encodeObject:v5 forKey:@"ManifestationCodings"];

  v6 = [(HKAllergyReaction *)self onsetDate];
  [v4 encodeObject:v6 forKey:@"OnsetDate"];

  uint64_t v7 = [(HKAllergyReaction *)self severityCoding];
  [v4 encodeObject:v7 forKey:@"SeverityCoding"];

  id v8 = [(HKAllergyReaction *)self manifestations];
  [v4 encodeObject:v8 forKey:@"Manifestations"];

  id v9 = [(HKAllergyReaction *)self severity];
  [v4 encodeObject:v9 forKey:@"Severity"];
}

- (HKMedicalCodingCollection)severityCodingCollection
{
  v3 = [(HKAllergyReaction *)self severityCoding];

  if (v3)
  {
    id v4 = [(HKAllergyReaction *)self severityCoding];
    v5 = +[HKMedicalCodingCollection collectionWithCoding:v4];
  }
  else
  {
    v5 = 0;
  }

  return (HKMedicalCodingCollection *)v5;
}

- (NSArray)manifestationCodingCollections
{
  v2 = [(HKAllergyReaction *)self manifestationCodings];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_58);

  return (NSArray *)v3;
}

HKMedicalCodingCollection *__51__HKAllergyReaction_manifestationCodingCollections__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKMedicalCodingCollection collectionWithCodings:a2];
}

- (NSArray)manifestationCodings
{
  return self->_manifestationCodings;
}

- (NSArray)manifestations
{
  manifestations = self->_manifestations;
  if (manifestations)
  {
    v3 = manifestations;
  }
  else
  {
    id v4 = [(HKAllergyReaction *)self manifestationCodingCollections];
    objc_msgSend(v4, "hk_map:", &__block_literal_global_60_1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __35__HKAllergyReaction_manifestations__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:a2];
}

- (HKMedicalCoding)severityCoding
{
  return self->_severityCoding;
}

- (HKConcept)severity
{
  if (self->_severityCoding)
  {
    severity = self->_severity;
    if (severity)
    {
      v3 = severity;
    }
    else
    {
      id v4 = [(HKAllergyReaction *)self severityCodingCollection];
      v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)hash
{
  v3 = [(HKAllergyReaction *)self manifestationCodings];
  uint64_t v4 = [v3 hash];
  v5 = [(HKAllergyReaction *)self onsetDate];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(HKAllergyReaction *)self severityCoding];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKAllergyReaction *)a3;
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
      uint64_t v6 = [(HKAllergyReaction *)self manifestationCodings];
      uint64_t v7 = [(HKAllergyReaction *)v5 manifestationCodings];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        unint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKAllergyReaction *)v5 manifestationCodings];
        if (!v9) {
          goto LABEL_29;
        }
        id v10 = (void *)v9;
        uint64_t v11 = [(HKAllergyReaction *)self manifestationCodings];
        v12 = [(HKAllergyReaction *)v5 manifestationCodings];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_30;
        }
      }
      uint64_t v6 = [(HKAllergyReaction *)self onsetDate];
      uint64_t v15 = [(HKAllergyReaction *)v5 onsetDate];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        unint64_t v8 = (void *)v15;
        uint64_t v16 = [(HKAllergyReaction *)v5 onsetDate];
        if (!v16) {
          goto LABEL_29;
        }
        uint64_t v17 = (void *)v16;
        uint64_t v18 = [(HKAllergyReaction *)self onsetDate];
        v19 = [(HKAllergyReaction *)v5 onsetDate];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_30;
        }
      }
      uint64_t v6 = [(HKAllergyReaction *)self severityCoding];
      uint64_t v21 = [(HKAllergyReaction *)v5 severityCoding];
      if (v6 == (void *)v21)
      {
      }
      else
      {
        unint64_t v8 = (void *)v21;
        uint64_t v22 = [(HKAllergyReaction *)v5 severityCoding];
        if (!v22) {
          goto LABEL_29;
        }
        uint64_t v23 = (void *)v22;
        v24 = [(HKAllergyReaction *)self severityCoding];
        v25 = [(HKAllergyReaction *)v5 severityCoding];
        int v26 = [v24 isEqual:v25];

        if (!v26) {
          goto LABEL_30;
        }
      }
      uint64_t v6 = [(HKAllergyReaction *)self manifestations];
      uint64_t v27 = [(HKAllergyReaction *)v5 manifestations];
      if (v6 == (void *)v27)
      {
      }
      else
      {
        unint64_t v8 = (void *)v27;
        uint64_t v28 = [(HKAllergyReaction *)v5 manifestations];
        if (!v28) {
          goto LABEL_29;
        }
        v29 = (void *)v28;
        v30 = [(HKAllergyReaction *)self manifestations];
        v31 = [(HKAllergyReaction *)v5 manifestations];
        int v32 = [v30 isEqualToArray:v31];

        if (!v32) {
          goto LABEL_30;
        }
      }
      uint64_t v6 = [(HKAllergyReaction *)self severity];
      uint64_t v33 = [(HKAllergyReaction *)v5 severity];
      if (v6 == (void *)v33)
      {

LABEL_34:
        BOOL v14 = 1;
        goto LABEL_31;
      }
      unint64_t v8 = (void *)v33;
      uint64_t v34 = [(HKAllergyReaction *)v5 severity];
      if (v34)
      {
        v35 = (void *)v34;
        v36 = [(HKAllergyReaction *)self severity];
        v37 = [(HKAllergyReaction *)v5 severity];
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

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"manifestations"])
  {
    uint64_t v7 = [(HKAllergyReaction *)self manifestationCodingCollections];
    unint64_t v8 = +[HKConceptIndexUtilities indexedCodingsForCodingCollections:v7 context:v6 error:a4];
LABEL_6:

    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"severity"])
  {
    if (self->_severityCoding)
    {
      uint64_t v7 = +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:");
      uint64_t v9 = +[HKIndexableObject indexableObjectWithObject:v7];
      v11[0] = v9;
      unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

      goto LABEL_6;
    }
    unint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
    unint64_t v8 = 0;
  }
LABEL_9:

  return v8;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isEqualToString:@"severity"])
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], self->_severityCoding != 0, (uint64_t)v9, (uint64_t)a5))
    {
      id v10 = [v8 firstObject];
      uint64_t v11 = [v10 object];
      v12 = (HKConcept *)[v11 copy];
      severity = self->_severity;
      self->_severity = v12;

      BOOL v14 = 1;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  if (![v9 isEqualToString:@"manifestations"])
  {
    +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v9 inClass:objc_opt_class()];
    goto LABEL_9;
  }
  uint64_t v15 = +[HKConceptIndexUtilities conceptsForIndexedConcepts:v8 expectedCount:[(NSArray *)self->_manifestationCodings count] context:v9 error:a5];
  BOOL v14 = v15 != 0;
  if (v15) {
    objc_storeStrong((id *)&self->_manifestations, v15);
  }

LABEL_10:
  return v14;
}

- (HKMedicalDate)onsetDate
{
  return self->_onsetDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onsetDate, 0);
  objc_storeStrong((id *)&self->_manifestations, 0);
  objc_storeStrong((id *)&self->_severity, 0);
  objc_storeStrong((id *)&self->_manifestationCodings, 0);

  objc_storeStrong((id *)&self->_severityCoding, 0);
}

@end