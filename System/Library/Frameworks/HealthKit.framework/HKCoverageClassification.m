@interface HKCoverageClassification
+ (BOOL)supportsSecureCoding;
+ (id)coverageClassificationWithTypeCodings:(id)a3 value:(id)a4 name:(id)a5;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKConcept)type;
- (HKCoverageClassification)init;
- (HKCoverageClassification)initWithCoder:(id)a3;
- (HKCoverageClassification)initWithTypeCodings:(id)a3 value:(id)a4 name:(id)a5;
- (HKMedicalCodingCollection)typeCodingCollection;
- (NSArray)typeCodings;
- (NSString)description;
- (NSString)name;
- (NSString)value;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_setType:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCoverageClassification

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8 = @"type";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:&v8 count:1];
  v6 = +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v5, v4, v8, v9);

  return v6;
}

+ (id)coverageClassificationWithTypeCodings:(id)a3 value:(id)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithTypeCodings:v10 value:v9 name:v8];

  return v11;
}

- (HKCoverageClassification)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKCoverageClassification)initWithTypeCodings:(id)a3 value:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKCoverageClassification.m", 62, @"Invalid parameter not satisfying: %@", @"typeCodings" object file lineNumber description];
  }
  if (![v9 count])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HKCoverageClassification.m", 63, @"Invalid parameter not satisfying: %@", @"[typeCodings count] > 0" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)HKCoverageClassification;
  v12 = [(HKCoverageClassification *)&v25 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    typeCodings = v12->_typeCodings;
    v12->_typeCodings = (NSArray *)v13;

    uint64_t v15 = [v10 copy];
    value = v12->_value;
    v12->_value = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    name = v12->_name;
    v12->_name = (NSString *)v17;

    if (v12->_typeCodings)
    {
      v19 = [(HKCoverageClassification *)v12 typeCodingCollection];
      uint64_t v20 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v19];
      type = v12->_type;
      v12->_type = (HKConcept *)v20;
    }
  }

  return v12;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HKCoverageClassification *)self typeCodings];
  v7 = [(HKCoverageClassification *)self type];
  id v8 = [(HKCoverageClassification *)self value];
  id v9 = [(HKCoverageClassification *)self name];
  id v10 = [v3 stringWithFormat:@"<%@:%p typeCoding = %@, type = %@, value = %@, name = %@>", v5, self, v6, v7, v8, v9, 0];

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCoverageClassification)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKCoverageClassification;
  v5 = [(HKCoverageClassification *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TypeCodings"];
    typeCodings = v5->_typeCodings;
    v5->_typeCodings = (NSArray *)v9;

    if (!v5->_typeCodings)
    {
      uint64_t v17 = 0;
      goto LABEL_6;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    value = v5->_value;
    v5->_value = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Type"];
    type = v5->_type;
    v5->_type = (HKConcept *)v15;
  }
  uint64_t v17 = v5;
LABEL_6:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKCoverageClassification *)self typeCodings];
  [v4 encodeObject:v5 forKey:@"TypeCodings"];

  v6 = [(HKCoverageClassification *)self value];
  [v4 encodeObject:v6 forKey:@"Value"];

  v7 = [(HKCoverageClassification *)self name];
  [v4 encodeObject:v7 forKey:@"Name"];

  id v8 = [(HKCoverageClassification *)self type];
  [v4 encodeObject:v8 forKey:@"Type"];
}

- (HKMedicalCodingCollection)typeCodingCollection
{
  v2 = [(HKCoverageClassification *)self typeCodings];
  v3 = +[HKMedicalCodingCollection collectionWithCodings:v2];

  return (HKMedicalCodingCollection *)v3;
}

- (HKConcept)type
{
  type = self->_type;
  if (type)
  {
    v3 = type;
  }
  else
  {
    id v4 = [(HKCoverageClassification *)self typeCodingCollection];
    v3 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v4];
  }

  return v3;
}

- (void)_setType:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      -[HKFHIRIdentifierElement _setType:](v5);
    }
  }
  v6 = (HKConcept *)[v4 copy];
  type = self->_type;
  self->_type = v6;
}

- (unint64_t)hash
{
  v3 = [(HKCoverageClassification *)self typeCodings];
  uint64_t v4 = [v3 hash];
  v5 = [(HKCoverageClassification *)self value];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HKCoverageClassification *)self name];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKCoverageClassification *)a3;
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
      uint64_t v6 = [(HKCoverageClassification *)self typeCodings];
      uint64_t v7 = [(HKCoverageClassification *)v5 typeCodings];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        unint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKCoverageClassification *)v5 typeCodings];
        if (!v9) {
          goto LABEL_19;
        }
        id v10 = (void *)v9;
        uint64_t v11 = [(HKCoverageClassification *)self typeCodings];
        v12 = [(HKCoverageClassification *)v5 typeCodings];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_20;
        }
      }
      uint64_t v6 = [(HKCoverageClassification *)self value];
      uint64_t v15 = [(HKCoverageClassification *)v5 value];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        unint64_t v8 = (void *)v15;
        uint64_t v16 = [(HKCoverageClassification *)v5 value];
        if (!v16) {
          goto LABEL_19;
        }
        uint64_t v17 = (void *)v16;
        v18 = [(HKCoverageClassification *)self value];
        objc_super v19 = [(HKCoverageClassification *)v5 value];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_20;
        }
      }
      uint64_t v6 = [(HKCoverageClassification *)self name];
      uint64_t v21 = [(HKCoverageClassification *)v5 name];
      if (v6 == (void *)v21)
      {

LABEL_24:
        BOOL v14 = 1;
        goto LABEL_21;
      }
      unint64_t v8 = (void *)v21;
      uint64_t v22 = [(HKCoverageClassification *)v5 name];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(HKCoverageClassification *)self name];
        objc_super v25 = [(HKCoverageClassification *)v5 name];
        char v26 = [v24 isEqualToString:v25];

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

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"type"])
  {
    uint64_t v7 = +[HKMedicalCodingCollection collectionWithCodings:self->_typeCodings];
    unint64_t v8 = +[HKIndexableObject indexableObjectWithObject:v7];
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_msgSend(v10, "hk_assignError:code:format:", a4, 3, @"%@ does not support codings for key path %@", v12, v6);

    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v9 isEqualToString:@"type"];
  if (v10)
  {
    BOOL v11 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], self->_typeCodings != 0, (uint64_t)v9, (uint64_t)a5);

    if (!v11)
    {
      LOBYTE(v10) = 0;
      goto LABEL_7;
    }
    v12 = [v8 firstObject];
    id v9 = [v12 object];
    int v13 = (HKConcept *)[v9 copy];
    type = self->_type;
    self->_type = v13;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v16);
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, @"%@ does not support restoring concepts for key path %@", v12, v9);
  }

LABEL_7:
  return v10;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)typeCodings
{
  return self->_typeCodings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_typeCodings, 0);
}

@end