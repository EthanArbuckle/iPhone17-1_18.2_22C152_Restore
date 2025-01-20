@interface ATXActionPredictableParameters
- (ATXActionPredictableParameters)init;
- (ATXActionPredictableParameters)initWithParameterKeys:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXActionPredictableParameters:(id)a3;
- (NSSet)parameterKeys;
- (unint64_t)hash;
@end

@implementation ATXActionPredictableParameters

- (ATXActionPredictableParameters)init
{
  v3 = objc_opt_new();
  v4 = [(ATXActionPredictableParameters *)self initWithParameterKeys:v3];

  return v4;
}

- (ATXActionPredictableParameters)initWithParameterKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionPredictableParameters;
  v5 = [(ATXActionPredictableParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    parameterKeys = v5->_parameterKeys;
    v5->_parameterKeys = (NSSet *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_parameterKeys hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXActionPredictableParameters *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActionPredictableParameters *)self isEqualToATXActionPredictableParameters:v5];

  return v6;
}

- (BOOL)isEqualToATXActionPredictableParameters:(id)a3
{
  id v4 = [a3 parameterKeys];
  v5 = [(ATXActionPredictableParameters *)self parameterKeys];
  char v6 = [v4 isEqualToSet:v5];

  return v6;
}

- (NSSet)parameterKeys
{
  return self->_parameterKeys;
}

- (void).cxx_destruct
{
}

@end