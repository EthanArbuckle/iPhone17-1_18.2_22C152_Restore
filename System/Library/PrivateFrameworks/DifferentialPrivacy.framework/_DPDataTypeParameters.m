@interface _DPDataTypeParameters
+ (id)allDataTypeNames;
+ (id)dataTypeParametersFromDictionary:(id)a3;
+ (id)initParametersForDataType:(id)a3;
+ (id)parametersFromFile:(id)a3;
- (_DPDataTypeParameters)init;
- (_DPDataTypeParameters)initWithDictionary:(id)a3;
- (_DPPrivacyBudget)budget;
- (float)localPrivacyBudget;
- (id)description;
@end

@implementation _DPDataTypeParameters

- (_DPDataTypeParameters)init
{
  return 0;
}

- (_DPDataTypeParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPDataTypeParameters;
  v5 = [(_DPDataTypeParameters *)&v14 init];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = [v4 objectForKeyedSubscript:@"LocalPrivacyBudget"];
  v7 = v6;
  if (v6)
  {
    [(_DPDataTypeParameters *)v6 floatValue];
    v5->_localPrivacyBudget = v8;
    uint64_t v9 = [v4 objectForKeyedSubscript:@"BudgetKeyName"];
    if (v9)
    {
      v10 = (void *)v9;
      uint64_t v11 = +[_DPPrivacyBudget budgetWithName:v9];
      if (v11)
      {
        budget = v5->_budget;
        v5->_budget = (_DPPrivacyBudget *)v11;

LABEL_6:
        v7 = v5;
        goto LABEL_9;
      }
    }
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (id)dataTypeParametersFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

+ (id)initParametersForDataType:(id)a3
{
  id v4 = a3;
  v5 = +[_DPStrings dataTypeParametersPath];
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
  v7 = [v3 stringWithFormat:@"%@: %@, localPrivacyBudget=%f}", v5, v6, self->_localPrivacyBudget];

  return v7;
}

+ (id)parametersFromFile:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44___DPDataTypeParameters_parametersFromFile___block_invoke;
  v9[3] = &unk_1E6C43EF0;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = parametersFromFile__onceToken_1;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&parametersFromFile__onceToken_1, v9);
  }
  id v7 = (id)parametersFromFile__allParameters_0;

  return v7;
}

+ (id)allDataTypeNames
{
  v3 = +[_DPStrings dataTypeParametersPath];
  id v4 = [a1 parametersFromFile:v3];

  uint64_t v5 = [v4 allKeys];

  return v5;
}

- (float)localPrivacyBudget
{
  return self->_localPrivacyBudget;
}

- (_DPPrivacyBudget)budget
{
  return self->_budget;
}

- (void).cxx_destruct
{
}

@end