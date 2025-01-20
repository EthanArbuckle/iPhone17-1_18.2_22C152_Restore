@interface NLParameterBundle
+ (BOOL)supportsSecureCoding;
+ (id)parameterBundleWithContentsOfURL:(id)a3 error:(id *)a4;
+ (id)parameterBundleWithParameters:(id)a3 values:(id)a4 metadata:(id)a5;
- (BOOL)getContinuousParameterValueForName:(id)a3 value:(double *)a4;
- (BOOL)getIntegralParameterValueForName:(id)a3 value:(int64_t *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NLParameterBundle)initWithCoder:(id)a3;
- (NLParameterBundle)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (NLParameterBundle)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (NLParameterBundle)initWithParameters:(id)a3 values:(id)a4 metadata:(id)a5;
- (NSArray)parameterNames;
- (NSArray)parameters;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)metadata;
- (NSDictionary)parameterValues;
- (id)description;
- (id)parameterForName:(id)a3;
- (id)parameterValueForName:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NLParameterBundle

+ (id)parameterBundleWithParameters:(id)a3 values:(id)a4 metadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithParameters:v10 values:v9 metadata:v8];

  return v11;
}

+ (id)parameterBundleWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithContentsOfURL:v6 error:a4];

  return v7;
}

- (NLParameterBundle)initWithParameters:(id)a3 values:(id)a4 metadata:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)NLParameterBundle;
  v11 = [(NLParameterBundle *)&v37 init];
  if (v11)
  {
    v31 = v9;
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v19 = [v18 name];
          BOOL v20 = [(NSArray *)v12 containsObject:v19];

          if (!v20)
          {
            v21 = [v18 name];
            [(NSArray *)v12 addObject:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v15);
    }

    uint64_t v22 = [v13 copy];
    parameters = v11->_parameters;
    v11->_parameters = (NSArray *)v22;

    parameterNames = v11->_parameterNames;
    v11->_parameterNames = v12;
    v25 = v12;

    id v9 = v31;
    uint64_t v26 = [v31 copy];
    parameterValues = v11->_parameterValues;
    v11->_parameterValues = (NSDictionary *)v26;

    uint64_t v28 = [v10 copy];
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v28;

    id v8 = v32;
  }

  return v11;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(NLParameterBundle *)self parameters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) _dictionaryRepresentation];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  v19[0] = v3;
  v18[0] = @"Parameters";
  v18[1] = @"ParameterValues";
  id v10 = [(NLParameterBundle *)self parameterValues];
  v19[1] = v10;
  v18[2] = @"Metadata";
  v11 = [(NLParameterBundle *)self metadata];
  v19[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  return (NSDictionary *)v12;
}

- (NLParameterBundle)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 objectForKey:@"Parameters"];
    id v8 = [v6 objectForKey:@"ParameterValues"];
    id v9 = [v6 objectForKey:@"Metadata"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v9)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v21 = v8;
                uint64_t v22 = v9;
                id v10 = [MEMORY[0x1E4F1CA48] array];
                long long v23 = 0u;
                long long v24 = 0u;
                long long v25 = 0u;
                long long v26 = 0u;
                id v11 = v7;
                uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
                if (v12)
                {
                  uint64_t v13 = v12;
                  uint64_t v14 = *(void *)v24;
                  while (2)
                  {
                    uint64_t v15 = 0;
                    do
                    {
                      if (*(void *)v24 != v14) {
                        objc_enumerationMutation(v11);
                      }
                      id v16 = [[NLParameter alloc] _initWithDictionaryRepresentation:*(void *)(*((void *)&v23 + 1) + 8 * v15) error:0];
                      if (!v16)
                      {

                        id v8 = v21;
                        id v9 = v22;
                        goto LABEL_18;
                      }
                      long long v17 = v16;
                      [v10 addObject:v16];

                      ++v15;
                    }
                    while (v13 != v15);
                    uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
                    if (v13) {
                      continue;
                    }
                    break;
                  }
                }

                self = [(NLParameterBundle *)self initWithParameters:v10 values:v21 metadata:v22];
                v18 = self;
                goto LABEL_21;
              }
            }
          }
        }
      }
    }
LABEL_18:
  }
  if (!a4)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = *MEMORY[0x1E4F28568];
  uint64_t v28 = @"Invalid parameter bundle";
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v19 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v11];
  v18 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_23:
  return v18;
}

- (NLParameterBundle)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:a4];
  if (v6
    && ([MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:a4],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = (void *)v7;
    self = [(NLParameterBundle *)self initWithDictionaryRepresentation:v7 error:a4];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NLParameterBundle *)self dictionaryRepresentation];
  id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:a4];
  id v9 = v8;
  if (v8) {
    char v10 = [v8 writeToURL:v6 options:1 error:a4];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(NLParameterBundle *)self parameters];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = NSString;
        char v10 = [v8 _shortDescription];
        id v11 = [v8 name];
        uint64_t v12 = [(NLParameterBundle *)self parameterValueForName:v11];
        uint64_t v13 = [v9 stringWithFormat:@"%@ = %@", v10, v12];

        [v3 addObject:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v14 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)NLParameterBundle;
  uint64_t v15 = [(NLParameterBundle *)&v20 description];
  id v16 = [v3 componentsJoinedByString:@", "];
  long long v17 = [v14 stringWithFormat:@"%@(%@)", v15, v16];

  return v17;
}

- (unint64_t)hash
{
  v3 = [(NLParameterBundle *)self parameters];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NLParameterBundle *)self parameterValues];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NLParameterBundle *)self metadata];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NLParameterBundle *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_7;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [(NLParameterBundle *)self parameters];
  uint64_t v7 = [(NLParameterBundle *)v5 parameters];
  if (![v6 isEqual:v7])
  {
LABEL_9:

    goto LABEL_10;
  }
  unint64_t v8 = [(NLParameterBundle *)self parameterValues];
  id v9 = [(NLParameterBundle *)v5 parameterValues];
  if (![v8 isEqual:v9])
  {

    goto LABEL_9;
  }
  char v10 = [(NLParameterBundle *)self metadata];
  id v11 = [(NLParameterBundle *)v5 metadata];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (([v8 allowsKeyedCoding] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLParameter requires keyed coding" userInfo:0];
    objc_exception_throw(v7);
  }
  uint64_t v4 = [(NLParameterBundle *)self parameters];
  [v8 encodeObject:v4 forKey:@"NLParameters"];

  uint64_t v5 = [(NLParameterBundle *)self parameterValues];
  [v8 encodeObject:v5 forKey:@"NLParameterValues"];

  uint64_t v6 = [(NLParameterBundle *)self metadata];
  [v8 encodeObject:v6 forKey:@"NLMetadata"];
}

- (NLParameterBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NLParameter requires keyed coding" userInfo:0];
    objc_exception_throw(v11);
  }
  uint64_t v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NLParameters"];
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"NLParameterValues"];
  id v8 = [v4 decodePropertyListForKey:@"NLMetadata"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v8 = 0;
    }
  }
  id v9 = [(NLParameterBundle *)self initWithParameters:v5 values:v7 metadata:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)parameterForName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NLParameterBundle *)self parameters];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 name];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)parameterValueForName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NLParameterBundle *)self parameterForName:v4];
  if (v5)
  {
    id v6 = [(NLParameterBundle *)self parameterValues];
    uint64_t v7 = [v6 objectForKey:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)getContinuousParameterValueForName:(id)a3 value:(double *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NLParameterBundle *)self parameterForName:v6];
  id v8 = v7;
  if (v7 && ![v7 parameterType])
  {
    char v10 = [(NLParameterBundle *)self parameterValueForName:v6];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a4)
      {
        [v10 doubleValue];
        *(void *)a4 = v11;
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)getIntegralParameterValueForName:(id)a3 value:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NLParameterBundle *)self parameterForName:v6];
  id v8 = v7;
  if (v7 && [v7 parameterType] == 1)
  {
    BOOL v9 = [(NLParameterBundle *)self parameterValueForName:v6];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a4) {
        *a4 = [v9 integerValue];
      }
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSArray)parameterNames
{
  return self->_parameterNames;
}

- (NSDictionary)parameterValues
{
  return self->_parameterValues;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);
  objc_storeStrong((id *)&self->_parameterNames, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end