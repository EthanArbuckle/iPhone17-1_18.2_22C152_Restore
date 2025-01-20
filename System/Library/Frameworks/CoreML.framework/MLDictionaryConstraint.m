@interface MLDictionaryConstraint
+ (BOOL)supportsSecureCoding;
+ (MLDictionaryConstraint)constraintWithInt64Keys;
+ (MLDictionaryConstraint)constraintWithStringKeys;
- (BOOL)isAllowedValue:(id)a3 error:(id *)a4;
- (MLDictionaryConstraint)initWithCoder:(id)a3;
- (MLDictionaryConstraint)initWithKeyType:(int64_t)a3;
- (MLFeatureType)keyType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLDictionaryConstraint

- (MLFeatureType)keyType
{
  return self->_keyType;
}

- (MLDictionaryConstraint)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"keyType"];

  return [(MLDictionaryConstraint *)self initWithKeyType:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLDictionaryConstraint keyType](self, "keyType"), @"keyType");
}

- (id)description
{
  if (self->_keyType == 3) {
    v2 = @"String";
  }
  else {
    v2 = @"Int64";
  }
  return (id)[NSString stringWithFormat:@"%@ → Double", v2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[MLDictionaryConstraint allocWithZone:a3];
  int64_t keyType = self->_keyType;

  return [(MLDictionaryConstraint *)v4 initWithKeyType:keyType];
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 isUndefined] & 1) != 0
    || ([v6 dictionaryValue], v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    if (a4)
    {
      v16 = @"MLDictionaryConstraint cannot check undefined values";
LABEL_17:
      +[MLModelErrorUtils featureTypeErrorWithFormat:v16];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_26;
  }
  if ([v6 type] != 6)
  {
    if (a4)
    {
      v16 = @"MLDictionaryConstraint only allows Dictionary values";
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  v8 = [v6 dictionaryValue];
  objc_opt_class();
  if (self->_keyType == 3) {
    objc_opt_class();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }

    if (a4)
    {
      v15 = +[MLFeatureTypeUtils descriptionForType:self->_keyType];
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Dicitonary keys are not all expected type %@", v15];
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    BOOL v14 = 0;
  }
  else
  {
LABEL_14:
    BOOL v14 = 1;
    v15 = v9;
LABEL_23:
  }
LABEL_26:

  return v14;
}

- (MLDictionaryConstraint)initWithKeyType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLDictionaryConstraint;
  result = [(MLDictionaryConstraint *)&v5 init];
  if (result) {
    result->_int64_t keyType = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MLDictionaryConstraint)constraintWithInt64Keys
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeyType:1];

  return (MLDictionaryConstraint *)v2;
}

+ (MLDictionaryConstraint)constraintWithStringKeys
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeyType:3];

  return (MLDictionaryConstraint *)v2;
}

@end