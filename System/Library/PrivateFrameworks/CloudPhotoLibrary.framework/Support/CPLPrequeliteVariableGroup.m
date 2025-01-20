@interface CPLPrequeliteVariableGroup
+ (CPLPrequeliteVariableGroup)variableGroupWithVariables:(id)a3;
+ (CPLPrequeliteVariableGroup)variableGroupWithVariablesAndGroups:(id)a3;
- (BOOL)shouldNotCacheValue;
- (CPLPrequeliteVariableGroup)initWithVariables:(id)a3;
- (NSArray)variables;
- (PQLInjecting)definitionInjection;
- (PQLInjecting)injectionForDefaultValues;
- (PQLInjecting)injectionForDefaultValuesUpdate;
- (PQLInjecting)namesInjection;
- (id)_defaultValuesObject;
- (id)injectionForUpdates:(id)a3;
- (id)injectionForValues:(id)a3;
- (id)valuesInSet:(id)a3;
- (id)valuesInSet:(id)a3 startingAtIndex:(int)a4;
- (void)setShouldNotCacheValue:(BOOL)a3;
@end

@implementation CPLPrequeliteVariableGroup

+ (CPLPrequeliteVariableGroup)variableGroupWithVariables:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithVariables:v4];

  return (CPLPrequeliteVariableGroup *)v5;
}

+ (CPLPrequeliteVariableGroup)variableGroupWithVariablesAndGroups:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v5 addObject:v11];
        }
        else
        {
          v12 = objc_msgSend(v11, "variables", (void)v15);
          [v5 addObjectsFromArray:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [a1 variableGroupWithVariables:v5];

  return (CPLPrequeliteVariableGroup *)v13;
}

- (CPLPrequeliteVariableGroup)initWithVariables:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CPLPrequeliteVariableGroup;
  id v5 = [(CPLPrequeliteVariableGroup *)&v41 init];
  if (v5)
  {
    id v6 = (NSArray *)[v4 copy];
    variables = v5->_variables;
    v34 = v5;
    v5->_variables = v6;

    id v8 = objc_alloc_init((Class)NSMutableData);
    uint64_t v9 = (NSData *)objc_alloc_init((Class)NSMutableData);
    v10 = (NSData *)objc_alloc_init((Class)NSMutableData);
    v11 = (NSData *)objc_alloc_init((Class)NSMutableData);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v35 = v4;
    id obj = v4;
    id v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      char v14 = 1;
      uint64_t v15 = *(void *)v38;
      do
      {
        long long v16 = 0;
        do
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v16);
          if (v14)
          {
            long long v18 = v9;
            v19 = "?";
            uint64_t v20 = 1;
          }
          else
          {
            objc_msgSend(v8, "appendBytes:length:", ", ", 2);
            -[NSData appendBytes:length:](v9, "appendBytes:length:", ", ?", 3);
            -[NSData appendBytes:length:](v10, "appendBytes:length:", ", ", 2);
            long long v18 = v11;
            v19 = ", ";
            uint64_t v20 = 2;
          }
          [(NSData *)v18 appendBytes:v19 length:v20];
          v21 = [v17 sql];
          [v8 appendData:v21];

          v22 = [v17 sql];
          [(NSData *)v10 appendData:v22];

          [(NSData *)v10 appendBytes:" = ?" length:4];
          v23 = [v17 columnDefinition];
          v24 = [v23 sql];
          [(NSData *)v11 appendData:v24];

          char v14 = 0;
          long long v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        id v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        char v14 = 0;
      }
      while (v13);
    }

    v25 = (PQLInjecting *)[objc_alloc((Class)PQLRawInjection) initWithData:v8];
    id v5 = v34;
    namesInjection = v34->_namesInjection;
    v34->_namesInjection = v25;

    sqlForValues = v34->_sqlForValues;
    v34->_sqlForValues = v9;
    v28 = v9;

    sqlForUpdates = v34->_sqlForUpdates;
    v34->_sqlForUpdates = v10;
    v30 = v10;

    v31 = (PQLInjecting *)[objc_alloc((Class)PQLRawInjection) initWithData:v11];
    definitionInjection = v34->_definitionInjection;
    v34->_definitionInjection = v31;

    id v4 = v35;
  }

  return v5;
}

- (void)setShouldNotCacheValue:(BOOL)a3
{
  BOOL v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_variables;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setShouldNotCacheValue:", v3, (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  self->_shouldNotCacheValue = v3;
}

- (id)_defaultValuesObject
{
  p_id defaultValuesObject = &self->_defaultValuesObject;
  id defaultValuesObject = self->_defaultValuesObject;
  if (defaultValuesObject)
  {
    id v4 = defaultValuesObject;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = self->_variables;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "defaultValue", (void)v16);
          if (v12)
          {
            if (!v8) {
              id v8 = objc_alloc_init((Class)NSMutableDictionary);
            }
            long long v13 = [v11 variableName];
            [v8 setObject:v12 forKeyedSubscript:v13];
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }

    if (v8) {
      char v14 = v8;
    }
    else {
      char v14 = &__NSDictionary0__struct;
    }
    objc_storeStrong(p_defaultValuesObject, v14);
    id v4 = *p_defaultValuesObject;
  }
  return v4;
}

- (id)injectionForValues:(id)a3
{
  id v4 = a3;
  id v5 = [[_CPLObjectInjection alloc] initWithVariables:self->_variables object:v4 sql:self->_sqlForValues];

  return v5;
}

- (PQLInjecting)injectionForDefaultValues
{
  BOOL v3 = [(CPLPrequeliteVariableGroup *)self _defaultValuesObject];
  id v4 = [(CPLPrequeliteVariableGroup *)self injectionForValues:v3];

  return (PQLInjecting *)v4;
}

- (id)valuesInSet:(id)a3 startingAtIndex:(int)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_variables, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_variables;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = a4;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        char v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "valueFromSet:atIndex:", v6, (char *)i + v11, (void)v17);
        if (v15) {
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v11 = (v11 + i);
    }
    while (v10);
  }

  return v7;
}

- (id)valuesInSet:(id)a3
{
  return [(CPLPrequeliteVariableGroup *)self valuesInSet:a3 startingAtIndex:0];
}

- (id)injectionForUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [[_CPLObjectInjection alloc] initWithVariables:self->_variables object:v4 sql:self->_sqlForUpdates];

  return v5;
}

- (PQLInjecting)injectionForDefaultValuesUpdate
{
  BOOL v3 = [(CPLPrequeliteVariableGroup *)self _defaultValuesObject];
  id v4 = [(CPLPrequeliteVariableGroup *)self injectionForUpdates:v3];

  return (PQLInjecting *)v4;
}

- (NSArray)variables
{
  return self->_variables;
}

- (BOOL)shouldNotCacheValue
{
  return self->_shouldNotCacheValue;
}

- (PQLInjecting)namesInjection
{
  return self->_namesInjection;
}

- (PQLInjecting)definitionInjection
{
  return self->_definitionInjection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionInjection, 0);
  objc_storeStrong((id *)&self->_namesInjection, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong(&self->_defaultValuesObject, 0);
  objc_storeStrong((id *)&self->_sqlForUpdates, 0);
  objc_storeStrong((id *)&self->_sqlForValues, 0);
}

@end