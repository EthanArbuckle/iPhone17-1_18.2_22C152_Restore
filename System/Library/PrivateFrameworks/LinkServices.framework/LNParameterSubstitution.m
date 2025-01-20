@interface LNParameterSubstitution
+ (BOOL)supportsSecureCoding;
- (LNParameterSubstitution)initWithCoder:(id)a3;
- (LNParameterSubstitution)initWithParameterIdentifier:(id)a3 substitutionValues:(id)a4;
- (NSArray)substitutionValues;
- (NSString)parameterIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNParameterSubstitution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutionValues, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

- (NSArray)substitutionValues
{
  return self->_substitutionValues;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNParameterSubstitution *)self parameterIdentifier];
  [v4 encodeObject:v5 forKey:@"parameterIdentifier"];

  id v6 = [(LNParameterSubstitution *)self substitutionValues];
  [v4 encodeObject:v6 forKey:@"substitutionValues"];
}

- (LNParameterSubstitution)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterIdentifier"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"substitutionValues"];

    if (v9)
    {
      self = [(LNParameterSubstitution *)self initWithParameterIdentifier:v5 substitutionValues:v9];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LNParameterSubstitution)initWithParameterIdentifier:(id)a3 substitutionValues:(id)a4
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
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNParameterSubstitution.m", 18, @"Invalid parameter not satisfying: %@", @"parameterIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNParameterSubstitution.m", 19, @"Invalid parameter not satisfying: %@", @"substitutionValues" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNParameterSubstitution;
  v10 = [(LNParameterSubstitution *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    parameterIdentifier = v10->_parameterIdentifier;
    v10->_parameterIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    substitutionValues = v10->_substitutionValues;
    v10->_substitutionValues = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end