@interface NLParameter
+ (BOOL)supportsSecureCoding;
+ (id)parameterWithName:(id)a3 type:(int64_t)a4 minimumValue:(double)a5 maximumValue:(double)a6;
- (BOOL)isEqual:(id)a3;
- (NLParameter)initWithCoder:(id)a3;
- (NLParameter)initWithName:(id)a3 type:(int64_t)a4 minimumValue:(double)a5 maximumValue:(double)a6;
- (NSString)name;
- (double)maximumValue;
- (double)minimumValue;
- (id)_dictionaryRepresentation;
- (id)_hyperTuneDictionary;
- (id)_initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (id)_shortDescription;
- (id)description;
- (int64_t)parameterType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NLParameter

+ (id)parameterWithName:(id)a3 type:(int64_t)a4 minimumValue:(double)a5 maximumValue:(double)a6
{
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 type:a4 minimumValue:a5 maximumValue:a6];

  return v11;
}

- (NLParameter)initWithName:(id)a3 type:(int64_t)a4 minimumValue:(double)a5 maximumValue:(double)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLParameter;
  v11 = [(NLParameter *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v11->_parameterType = a4;
    v11->_minimumValue = a5;
    v11->_maximumValue = a6;
  }

  return v11;
}

- (id)_shortDescription
{
  int64_t v3 = [(NLParameter *)self parameterType];
  v4 = NSString;
  v5 = [(NLParameter *)self name];
  [(NLParameter *)self minimumValue];
  double v7 = v6;
  [(NLParameter *)self maximumValue];
  if (v3) {
    [v4 stringWithFormat:@"%@/integral(%lld - %lld)", v5, (uint64_t)v7, (uint64_t)v8];
  }
  else {
  v9 = [v4 stringWithFormat:@"%@/continuous(%.3g - %.3g)", v5, *(void *)&v7, *(void *)&v8];
  }

  return v9;
}

- (id)description
{
  int64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NLParameter;
  v4 = [(NLParameter *)&v8 description];
  v5 = [(NLParameter *)self _shortDescription];
  double v6 = [v3 stringWithFormat:@"%@(%@)", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = [(NLParameter *)self name];
  uint64_t v4 = [v3 hash];
  int64_t v5 = v4 ^ ([(NLParameter *)self parameterType] << 16);
  [(NLParameter *)self minimumValue];
  uint64_t v7 = v5 ^ (uint64_t)(v6 * 1000.0);
  [(NLParameter *)self maximumValue];
  unint64_t v9 = v7 ^ (uint64_t)(v8 * 1000.0);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NLParameter *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_10;
  }
  if (!v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  double v6 = [(NLParameter *)self name];
  uint64_t v7 = [(NLParameter *)v5 name];
  if ([v6 isEqual:v7])
  {
    int64_t v8 = [(NLParameter *)self parameterType];
    if (v8 == [(NLParameter *)v5 parameterType])
    {
      [(NLParameter *)self minimumValue];
      double v10 = v9;
      [(NLParameter *)v5 minimumValue];
      if (v10 == v11)
      {
        [(NLParameter *)self maximumValue];
        double v14 = v13;
        [(NLParameter *)v5 maximumValue];
        double v16 = v15;

        if (v14 != v16) {
          goto LABEL_8;
        }
LABEL_10:
        BOOL v12 = 1;
        goto LABEL_11;
      }
    }
  }

LABEL_8:
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLParameter requires keyed coding" userInfo:0];
    objc_exception_throw(v5);
  }
  uint64_t v4 = [(NLParameter *)self name];
  [v6 encodeObject:v4 forKey:@"NLName"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[NLParameter parameterType](self, "parameterType"), @"NLParameterType");
  [(NLParameter *)self minimumValue];
  objc_msgSend(v6, "encodeDouble:forKey:", @"NLMinimumValue");
  [(NLParameter *)self maximumValue];
  objc_msgSend(v6, "encodeDouble:forKey:", @"NLMaximumValue");
}

- (NLParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLParameter requires keyed coding" userInfo:0];
    objc_exception_throw(v12);
  }
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NLName"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"NLParameterType"];
  [v4 decodeDoubleForKey:@"NLMinimumValue"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"NLMaximumValue"];
  double v10 = [(NLParameter *)self initWithName:v5 type:v6 minimumValue:v8 maximumValue:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NLParameter *)self parameterType];
  id v4 = @"Integral";
  if (!v3) {
    id v4 = @"Continuous";
  }
  v13[0] = @"Name";
  id v5 = v4;
  uint64_t v6 = [(NLParameter *)self name];
  v14[0] = v6;
  v14[1] = v5;
  v13[1] = @"ParameterType";
  v13[2] = @"MinimumValue";
  double v7 = NSNumber;
  [(NLParameter *)self minimumValue];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v14[2] = v8;
  v13[3] = @"MaximumValue";
  double v9 = NSNumber;
  [(NLParameter *)self maximumValue];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  v14[3] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (id)_initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  double v8 = [v7 objectForKey:@"Name"];
  double v9 = [v7 objectForKey:@"ParameterType"];
  double v10 = [v7 objectForKey:@"MinimumValue"];
  double v11 = [v7 objectForKey:@"MaximumValue"];
  if (v8)
  {
    id v4 = (NLParameter *)0x1E4F29000;
    objc_opt_class();
    int v12 = 1;
    if (objc_opt_isKindOfClass())
    {
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (([v9 isEqualToString:@"Continuous"] & 1) != 0
           || [v9 isEqualToString:@"Integral"]))
        {
          if (v10)
          {
            id v4 = (NLParameter *)0x1E4F28000;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v11)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v13 = [v9 isEqualToString:@"Continuous"] ^ 1;
                  [v10 doubleValue];
                  double v15 = v14;
                  [v11 doubleValue];
                  self = [(NLParameter *)self initWithName:v8 type:v13 minimumValue:v15 maximumValue:v16];
                  int v12 = 0;
                  id v4 = self;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    int v12 = 1;
  }

  if (v12)
  {
LABEL_15:
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"Invalid parameter bundle";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a4 = [v17 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v18];
    }
    id v4 = 0;
  }

  return v4;
}

- (id)_hyperTuneDictionary
{
  v17[5] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NLParameter *)self parameterType];
  id v4 = (void **)MEMORY[0x1E4F78E90];
  if (v3) {
    id v4 = (void **)MEMORY[0x1E4F78E98];
  }
  id v5 = *v4;
  v16[0] = *MEMORY[0x1E4F78E88];
  id v6 = v5;
  id v7 = [(NLParameter *)self name];
  uint64_t v8 = *MEMORY[0x1E4F78EA0];
  v17[0] = v7;
  v17[1] = v6;
  uint64_t v9 = *MEMORY[0x1E4F78E80];
  v16[1] = v8;
  v16[2] = v9;
  double v10 = NSNumber;
  [(NLParameter *)self minimumValue];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  v17[2] = v11;
  v16[3] = *MEMORY[0x1E4F78E78];
  int v12 = NSNumber;
  [(NLParameter *)self maximumValue];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  v16[4] = *MEMORY[0x1E4F78E70];
  v17[3] = v13;
  v17[4] = &unk_1EFB3A9B8;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)parameterType
{
  return self->_parameterType;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (void).cxx_destruct
{
}

@end