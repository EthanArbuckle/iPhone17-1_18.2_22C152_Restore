@interface HKCodedValueCollection
+ (BOOL)supportsSecureCoding;
+ (id)codedValueCollectionWithCodedValues:(id)a3;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKCodedValueCollection)init;
- (HKCodedValueCollection)initWithCodedValues:(id)a3;
- (HKCodedValueCollection)initWithCoder:(id)a3;
- (NSArray)codedValues;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCodedValueCollection

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  id v3 = a3;
  v4 = +[HKCodedValue indexableKeyPathsWithPrefix:@"codedValues"];
  v5 = +[HKConceptIndexUtilities keyPaths:v4 prefix:v3];

  return v5;
}

+ (id)codedValueCollectionWithCodedValues:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCodedValues:v4];

  return v5;
}

- (HKCodedValueCollection)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKCodedValueCollection)initWithCodedValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKCodedValueCollection;
  v5 = [(HKCodedValueCollection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    codedValues = v5->_codedValues;
    v5->_codedValues = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCodedValueCollection)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCodedValueCollection;
  v5 = [(HKCodedValueCollection *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CodedValues"];
    codedValues = v5->_codedValues;
    v5->_codedValues = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKCodedValueCollection *)self codedValues];
  [v4 encodeObject:v5 forKey:@"CodedValues"];
}

- (unint64_t)hash
{
  v2 = [(HKCodedValueCollection *)self codedValues];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKCodedValueCollection *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(HKCodedValueCollection *)self codedValues];
      v7 = [(HKCodedValueCollection *)v5 codedValues];
      if (v6 == v7)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        v8 = [(HKCodedValueCollection *)v5 codedValues];
        if (v8)
        {
          uint64_t v9 = [(HKCodedValueCollection *)self codedValues];
          v10 = [(HKCodedValueCollection *)v5 codedValues];
          int v11 = [v9 isEqual:v10] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 1;
        }
      }
      char v12 = v11 ^ 1;
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"codedValues"])
    {
      if (self->_codedValues)
      {
        uint64_t v9 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v6 error:a4];
        if (v9)
        {
          v10 = [(NSArray *)self->_codedValues codingsForKeyPath:v9 error:a4];
        }
        else
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      goto LABEL_11;
    }
    +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  int v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  if (![v10 isEqualToString:@"codedValues"])
  {
    +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v9 inClass:objc_opt_class()];
LABEL_7:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  char v12 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v9 error:a5];
  if (v12)
  {
    codedValues = self->_codedValues;
    if (codedValues) {
      BOOL v14 = [(NSArray *)codedValues applyConcepts:v8 forKeyPath:v12 error:a5];
    }
    else {
      BOOL v14 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
    }
    BOOL v15 = v14;
  }
  else
  {
    BOOL v15 = 0;
  }

LABEL_12:
  return v15;
}

- (NSArray)codedValues
{
  return self->_codedValues;
}

- (void).cxx_destruct
{
}

@end