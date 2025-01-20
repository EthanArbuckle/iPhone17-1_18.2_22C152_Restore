@interface INIntentTestResult
- (BOOL)resolvedAllParametersSuccesfully;
- (INIntent)resolvedIntent;
- (INIntentResponse)confirmResponse;
- (INIntentResponse)handleResponse;
- (INIntentTestResult)initWithResolvedIntent:(id)a3 resolvedParameters:(id)a4 resolvedAllParametersSuccesfully:(BOOL)a5 confirmResponse:(id)a6 handleResponse:(id)a7;
- (NSDictionary)resolvedParameters;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
@end

@implementation INIntentTestResult

- (id)dictionaryRepresentation
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"resolvedIntent";
  resolvedIntent = self->_resolvedIntent;
  v4 = resolvedIntent;
  if (!resolvedIntent)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v4;
  v14[1] = @"resolvedParameters";
  resolvedParameters = self->_resolvedParameters;
  v6 = resolvedParameters;
  if (!resolvedParameters)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v6;
  v14[2] = @"resolvedAllParametersSuccesfully";
  v7 = [NSNumber numberWithBool:self->_resolvedAllParametersSuccesfully];
  v15[2] = v7;
  v14[3] = @"confirmResponse";
  confirmResponse = self->_confirmResponse;
  v9 = confirmResponse;
  if (!confirmResponse)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v9;
  v14[4] = @"handleResponse";
  handleResponse = self->_handleResponse;
  v11 = handleResponse;
  if (!handleResponse)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (handleResponse)
  {
    if (confirmResponse) {
      goto LABEL_11;
    }
  }
  else
  {

    if (confirmResponse) {
      goto LABEL_11;
    }
  }

LABEL_11:
  if (resolvedParameters)
  {
    if (resolvedIntent) {
      goto LABEL_13;
    }
  }
  else
  {

    if (resolvedIntent) {
      goto LABEL_13;
    }
  }

LABEL_13:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleResponse, 0);
  objc_storeStrong((id *)&self->_confirmResponse, 0);
  objc_storeStrong((id *)&self->_resolvedParameters, 0);

  objc_storeStrong((id *)&self->_resolvedIntent, 0);
}

- (INIntentResponse)handleResponse
{
  return self->_handleResponse;
}

- (INIntentResponse)confirmResponse
{
  return self->_confirmResponse;
}

- (BOOL)resolvedAllParametersSuccesfully
{
  return self->_resolvedAllParametersSuccesfully;
}

- (NSDictionary)resolvedParameters
{
  return self->_resolvedParameters;
}

- (INIntent)resolvedIntent
{
  return self->_resolvedIntent;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INIntentTestResult;
  v6 = [(INIntentTestResult *)&v11 description];
  v7 = [(INIntentTestResult *)self dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INIntentTestResult *)self descriptionAtIndent:0];
}

- (INIntentTestResult)initWithResolvedIntent:(id)a3 resolvedParameters:(id)a4 resolvedAllParametersSuccesfully:(BOOL)a5 confirmResponse:(id)a6 handleResponse:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)INIntentTestResult;
  v16 = [(INIntentTestResult *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    resolvedIntent = v16->_resolvedIntent;
    v16->_resolvedIntent = (INIntent *)v17;

    uint64_t v19 = [v13 copy];
    resolvedParameters = v16->_resolvedParameters;
    v16->_resolvedParameters = (NSDictionary *)v19;

    v16->_resolvedAllParametersSuccesfully = a5;
    objc_storeStrong((id *)&v16->_confirmResponse, a6);
    objc_storeStrong((id *)&v16->_handleResponse, a7);
  }

  return v16;
}

@end