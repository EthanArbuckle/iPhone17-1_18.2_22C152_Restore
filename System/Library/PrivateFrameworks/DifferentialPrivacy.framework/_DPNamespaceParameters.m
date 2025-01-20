@interface _DPNamespaceParameters
+ (id)allNamespaceNames;
+ (id)initParametersForNamespace:(id)a3;
+ (id)namespaceParametersFromDictionary:(id)a3;
+ (id)parametersFromFile:(id)a3;
- (NSArray)allowedDataTypes;
- (_DPNamespaceParameters)init;
- (_DPNamespaceParameters)initWithDictionary:(id)a3;
- (_DPPrivacyBudget)budget;
- (id)description;
- (void)setAllowedDataTypes:(id)a3;
@end

@implementation _DPNamespaceParameters

- (_DPNamespaceParameters)init
{
  return 0;
}

- (_DPNamespaceParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DPNamespaceParameters;
  v5 = [(_DPNamespaceParameters *)&v13 init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 objectForKeyedSubscript:@"BudgetKeyName"];
  if (v6)
  {
    v7 = +[_DPPrivacyBudget budgetWithName:v6];
    if (v7)
    {
      v8 = v7;
      objc_storeStrong((id *)&v5->_budget, v7);
      v9 = [v4 objectForKeyedSubscript:@"DataTypes"];
      v10 = v9;
      if (v9 && [(NSArray *)v9 count])
      {
        allowedDataTypes = v5->_allowedDataTypes;
        v5->_allowedDataTypes = v10;

LABEL_7:
        v6 = v5;
        goto LABEL_10;
      }
    }
    v6 = 0;
  }
LABEL_10:

  return v6;
}

+ (id)namespaceParametersFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

+ (id)initParametersForNamespace:(id)a3
{
  id v4 = a3;
  v5 = +[_DPStrings namespaceParametersPath];
  v6 = [a1 parametersFromFile:v5];

  v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_DPPrivacyBudget *)self->_budget description];
  v7 = [(NSArray *)self->_allowedDataTypes componentsJoinedByString:@", "];
  v8 = [v3 stringWithFormat:@"%@: { %@, allowedDataTypes=%@}", v5, v6, v7];

  return v8;
}

+ (id)parametersFromFile:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45___DPNamespaceParameters_parametersFromFile___block_invoke;
  v9[3] = &unk_1E6C43EF0;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = parametersFromFile__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&parametersFromFile__onceToken, v9);
  }
  id v7 = (id)parametersFromFile__allParameters;

  return v7;
}

+ (id)allNamespaceNames
{
  v3 = +[_DPStrings namespaceParametersPath];
  id v4 = [a1 parametersFromFile:v3];

  uint64_t v5 = [v4 allKeys];

  return v5;
}

- (_DPPrivacyBudget)budget
{
  return self->_budget;
}

- (NSArray)allowedDataTypes
{
  return self->_allowedDataTypes;
}

- (void)setAllowedDataTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedDataTypes, 0);
  objc_storeStrong((id *)&self->_budget, 0);
}

@end