@interface HKFHIRIdentifierElement
+ (BOOL)supportsSecureCoding;
+ (id)identifierWithTypeCodings:(id)a3 value:(id)a4;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKConcept)type;
- (HKFHIRIdentifierElement)init;
- (HKFHIRIdentifierElement)initWithCoder:(id)a3;
- (HKFHIRIdentifierElement)initWithTypeCodings:(id)a3 value:(id)a4;
- (HKMedicalCodingCollection)typeCodingCollection;
- (NSArray)typeCodings;
- (NSString)description;
- (NSString)value;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)_setType:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRIdentifierElement

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

+ (id)identifierWithTypeCodings:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTypeCodings:v7 value:v6];

  return v8;
}

- (HKFHIRIdentifierElement)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRIdentifierElement)initWithTypeCodings:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKFHIRIdentifierElement.m", 57, @"Invalid parameter not satisfying: %@", @"typeCodings" object file lineNumber description];
  }
  if (![v7 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKFHIRIdentifierElement.m", 58, @"Invalid parameter not satisfying: %@", @"[typeCodings count] > 0" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)HKFHIRIdentifierElement;
  uint64_t v9 = [(HKFHIRIdentifierElement *)&v20 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    typeCodings = v9->_typeCodings;
    v9->_typeCodings = (NSArray *)v10;

    uint64_t v12 = [v8 copy];
    value = v9->_value;
    v9->_value = (NSString *)v12;

    if (v9->_typeCodings)
    {
      v14 = [(HKFHIRIdentifierElement *)v9 typeCodingCollection];
      uint64_t v15 = +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:v14];
      type = v9->_type;
      v9->_type = (HKConcept *)v15;
    }
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(HKFHIRIdentifierElement *)self typeCodings];
  id v7 = [(HKFHIRIdentifierElement *)self type];
  id v8 = [(HKFHIRIdentifierElement *)self value];
  uint64_t v9 = [v3 stringWithFormat:@"<%@:%p typeCoding = %@, type = %@, value = %@>", v5, self, v6, v7, v8, 0];

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFHIRIdentifierElement)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKFHIRIdentifierElement;
  v5 = [(HKFHIRIdentifierElement *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TypeCodings"];
    typeCodings = v5->_typeCodings;
    v5->_typeCodings = (NSArray *)v9;

    if (!v5->_typeCodings)
    {
      uint64_t v15 = 0;
      goto LABEL_6;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    value = v5->_value;
    v5->_value = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Type"];
    type = v5->_type;
    v5->_type = (HKConcept *)v13;
  }
  uint64_t v15 = v5;
LABEL_6:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKFHIRIdentifierElement *)self typeCodings];
  [v4 encodeObject:v5 forKey:@"TypeCodings"];

  id v6 = [(HKFHIRIdentifierElement *)self value];
  [v4 encodeObject:v6 forKey:@"Value"];

  id v7 = [(HKFHIRIdentifierElement *)self type];
  [v4 encodeObject:v7 forKey:@"Type"];
}

- (HKMedicalCodingCollection)typeCodingCollection
{
  v2 = [(HKFHIRIdentifierElement *)self typeCodings];
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
    id v4 = [(HKFHIRIdentifierElement *)self typeCodingCollection];
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
  id v6 = (HKConcept *)[v4 copy];
  type = self->_type;
  self->_type = v6;
}

- (unint64_t)hash
{
  v3 = [(HKFHIRIdentifierElement *)self typeCodings];
  uint64_t v4 = [v3 hash];
  v5 = [(HKFHIRIdentifierElement *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKFHIRIdentifierElement *)a3;
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
      unint64_t v6 = [(HKFHIRIdentifierElement *)self typeCodings];
      uint64_t v7 = [(HKFHIRIdentifierElement *)v5 typeCodings];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(HKFHIRIdentifierElement *)v5 typeCodings];
        if (!v9) {
          goto LABEL_14;
        }
        uint64_t v10 = (void *)v9;
        uint64_t v11 = [(HKFHIRIdentifierElement *)self typeCodings];
        uint64_t v12 = [(HKFHIRIdentifierElement *)v5 typeCodings];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      unint64_t v6 = [(HKFHIRIdentifierElement *)self value];
      uint64_t v15 = [(HKFHIRIdentifierElement *)v5 value];
      if (v6 == (void *)v15)
      {

LABEL_17:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      id v8 = (void *)v15;
      uint64_t v16 = [(HKFHIRIdentifierElement *)v5 value];
      if (v16)
      {
        objc_super v17 = (void *)v16;
        v18 = [(HKFHIRIdentifierElement *)self value];
        v19 = [(HKFHIRIdentifierElement *)v5 value];
        char v20 = [v18 isEqualToString:v19];

        if (v20) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"type"])
  {
    uint64_t v7 = +[HKMedicalCodingCollection collectionWithCodings:self->_typeCodings];
    id v8 = +[HKIndexableObject indexableObjectWithObject:v7];
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
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
    uint64_t v12 = [v8 firstObject];
    id v9 = [v12 object];
    int v13 = (HKConcept *)[v9 copy];
    type = self->_type;
    self->_type = v13;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v16);
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, @"%@ does not support restoring concepts for key path %@", v12, v9);
  }

LABEL_7:
  return v10;
}

- (NSString)value
{
  return self->_value;
}

- (NSArray)typeCodings
{
  return self->_typeCodings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_typeCodings, 0);
}

- (void)_setType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property type for record type HKCoverageClassification.", v1, 2u);
}

@end