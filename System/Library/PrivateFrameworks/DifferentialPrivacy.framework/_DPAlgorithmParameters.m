@interface _DPAlgorithmParameters
+ (BOOL)allowDPMechanismNone:(id)a3;
+ (id)algorithmParametersForKey:(id)a3;
+ (id)algorithmParametersFromDictionary:(id)a3;
+ (id)allAlgorithmNames;
+ (id)parametersFromFile:(id)a3;
- (NSDictionary)parameterDictionary;
- (_DPAlgorithmParameters)init;
- (_DPAlgorithmParameters)initWithDictionary:(id)a3;
- (id)description;
@end

@implementation _DPAlgorithmParameters

- (_DPAlgorithmParameters)init
{
  return 0;
}

- (_DPAlgorithmParameters)initWithDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DPAlgorithmParameters;
  v6 = [(_DPAlgorithmParameters *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_parameterDictionary, a3);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (id)algorithmParametersFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

+ (id)algorithmParametersForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[_DPStrings algorithmParametersPath];
  v6 = [a1 parametersFromFile:v5];

  v7 = [v6 objectForKeyedSubscript:v4];

  v8 = [v7 parameterDictionary];

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: { parametersDictionary=%@ }", v5, self->_parameterDictionary];

  return v6;
}

+ (id)parametersFromFile:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45___DPAlgorithmParameters_parametersFromFile___block_invoke;
  v9[3] = &unk_1E6C43EF0;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = parametersFromFile__onceToken_0;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&parametersFromFile__onceToken_0, v9);
  }
  id v7 = (id)allParameters;

  return v7;
}

+ (id)allAlgorithmNames
{
  v3 = +[_DPStrings keyNamesPath];
  id v4 = [a1 parametersFromFile:v3];

  uint64_t v5 = [v4 allKeys];

  return v5;
}

+ (BOOL)allowDPMechanismNone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"DPMechanismNoneAllowed"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSDictionary)parameterDictionary
{
  return self->_parameterDictionary;
}

- (void).cxx_destruct
{
}

@end