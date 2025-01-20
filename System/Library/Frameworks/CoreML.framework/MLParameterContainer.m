@interface MLParameterContainer
+ (BOOL)supportsSecureCoding;
+ (id)parameterContainerFor:(id)a3 descriptions:(id)a4;
- (BOOL)setCurrentValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)validateParameterValue:(id)a3 givenConstraint:(id)a4;
- (MLParameterContainer)initWithCoder:(id)a3;
- (NSArray)parameterKeys;
- (NSDictionary)parameterDescriptions;
- (NSMutableDictionary)currentParameterValues;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentParameterValues:(id)a3;
- (void)setParameterDescriptions:(id)a3;
- (void)setParameterKeys:(id)a3;
@end

@implementation MLParameterContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDescriptions, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);

  objc_storeStrong((id *)&self->_currentParameterValues, 0);
}

- (void)setParameterDescriptions:(id)a3
{
}

- (NSDictionary)parameterDescriptions
{
  return self->_parameterDescriptions;
}

- (void)setParameterKeys:(id)a3
{
}

- (NSArray)parameterKeys
{
  return self->_parameterKeys;
}

- (void)setCurrentParameterValues:(id)a3
{
}

- (NSMutableDictionary)currentParameterValues
{
  return self->_currentParameterValues;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = NSString;
  v5 = [(MLParameterContainer *)self currentParameterValues];
  v6 = [v4 stringWithFormat:@"\ncurrentParameterValues: %@", v5];
  [v3 appendString:v6];

  v7 = NSString;
  v8 = [(MLParameterContainer *)self parameterKeys];
  v9 = [v7 stringWithFormat:@"\nparameterKeys: %@", v8];
  [v3 appendString:v9];

  v10 = NSString;
  v11 = [(MLParameterContainer *)self parameterDescriptions];
  v12 = [v10 stringWithFormat:@"\nparameterDescriptions: %@", v11];
  [v3 appendString:v12];

  return v3;
}

- (MLParameterContainer)initWithCoder:(id)a3
{
  v21[15] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v21[3] = objc_opt_class();
  v21[4] = objc_opt_class();
  v21[5] = objc_opt_class();
  v21[6] = objc_opt_class();
  v21[7] = objc_opt_class();
  v21[8] = objc_opt_class();
  v21[9] = objc_opt_class();
  v21[10] = objc_opt_class();
  v21[11] = objc_opt_class();
  v21[12] = objc_opt_class();
  v21[13] = objc_opt_class();
  v21[14] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:15];
  [v6 addObjectsFromArray:v7];

  v8 = [v5 allowedClasses];
  [v6 unionSet:v8];

  id v20 = 0;
  v9 = [v5 decodeTopLevelObjectOfClasses:v6 forKey:@"currentParameterValues" error:&v20];
  id v10 = v20;
  id v19 = v10;
  v11 = [v5 decodeTopLevelObjectOfClasses:v6 forKey:@"parameterKeys" error:&v19];
  id v12 = v19;

  id v18 = v12;
  v13 = [v5 decodeTopLevelObjectOfClasses:v6 forKey:@"parameterDescriptions" error:&v18];

  id v14 = v18;
  v15 = objc_alloc_init(MLParameterContainer);
  v16 = v15;
  if (v15)
  {
    [(MLParameterContainer *)v15 setCurrentParameterValues:v9];
    [(MLParameterContainer *)v16 setParameterKeys:v11];
    [(MLParameterContainer *)v16 setParameterDescriptions:v13];
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLParameterContainer *)self currentParameterValues];
  [v4 encodeObject:v5 forKey:@"currentParameterValues"];

  id v6 = [(MLParameterContainer *)self parameterKeys];
  [v4 encodeObject:v6 forKey:@"parameterKeys"];

  id v7 = [(MLParameterContainer *)self parameterDescriptions];
  [v4 encodeObject:v7 forKey:@"parameterDescriptions"];
}

- (BOOL)validateParameterValue:(id)a3 givenConstraint:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 enumeratedNumbers];

  if (v7)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v8 = objc_msgSend(v6, "enumeratedNumbers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) doubleValue];
          double v14 = v13;
          [v5 doubleValue];
          if (vabdd_f64(v14, v15) <= 0.0001)
          {

            BOOL v16 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = 0;
  }
  else
  {
    [v5 doubleValue];
    double v18 = v17;
    id v19 = [v6 minNumber];
    [v19 doubleValue];
    if (v18 >= v20)
    {
      [v5 doubleValue];
      double v22 = v21;
      v23 = [v6 maxNumber];
      [v23 doubleValue];
      BOOL v16 = v22 <= v24;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
LABEL_16:

  return v16;
}

- (BOOL)setCurrentValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v10 = [(MLParameterContainer *)self parameterKeys];
    int v11 = [v10 containsObject:v9];

    if (!v11) {
      goto LABEL_16;
    }
    id v12 = [(MLParameterContainer *)self parameterDescriptions];
    double v13 = [v12 objectForKeyedSubscript:v9];

    BOOL v14 = v13 == 0;
    if (v13)
    {
      uint64_t v15 = objc_opt_class();
      BOOL v16 = [v13 defaultValue];
      uint64_t v17 = objc_opt_class();

      if (v15 == v17) {
        goto LABEL_13;
      }
      double v18 = [v13 defaultValue];
      id v19 = objc_opt_class();
      LODWORD(v19) = [v19 isSubclassOfClass:objc_opt_class()];

      if (!v19)
      {
        double v21 = [v13 defaultValue];
        double v22 = objc_opt_class();
        LODWORD(v22) = [v22 isSubclassOfClass:objc_opt_class()];

        if (!v22) {
          goto LABEL_13;
        }
      }
      v23 = objc_opt_class();
      if ([v23 isSubclassOfClass:objc_opt_class()])
      {
LABEL_13:
        double v24 = [v13 numericConstraint];
        if (!v24
          || [(MLParameterContainer *)self validateParameterValue:v8 givenConstraint:v24])
        {
          v25 = [(MLParameterContainer *)self currentParameterValues];
          [v25 setObject:v8 forKeyedSubscript:v9];

LABEL_16:
          BOOL v14 = 1;
          goto LABEL_25;
        }
        if (a5)
        {
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"%@ is not a valid value given constraint %@ for key %@", v8, v24, v9];
        }

LABEL_20:
        BOOL v14 = 0;
        goto LABEL_25;
      }
      if (!a5)
      {
LABEL_24:

        goto LABEL_25;
      }
      long long v26 = (objc_class *)objc_opt_class();
      double v20 = NSStringFromClass(v26);
      long long v27 = [v13 defaultValue];
      long long v28 = (objc_class *)objc_opt_class();
      long long v29 = NSStringFromClass(v28);
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Parameter value type %@ does not conform with default value's type %@", v20, v29];
    }
    else
    {
      double v20 = [(MLParameterContainer *)self currentParameterValues];
      [v20 setObject:v8 forKeyedSubscript:v9];
    }

    goto LABEL_24;
  }
  if (!a5) {
    goto LABEL_20;
  }
  +[MLModelErrorUtils genericErrorWithFormat:@"Failed to set parameter value because of nil key"];
  BOOL v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parameterContainerFor:(id)a3 descriptions:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MLParameterContainer);
  id v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [(MLParameterContainer *)v7 setCurrentParameterValues:v8];

  [(MLParameterContainer *)v7 setParameterKeys:v5];
  [(MLParameterContainer *)v7 setParameterDescriptions:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v6, "objectForKeyedSubscript:", v14, (void)v19);
        BOOL v16 = [v15 defaultValue];
        uint64_t v17 = [(MLParameterContainer *)v7 currentParameterValues];
        [v17 setObject:v16 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v7;
}

@end