@interface LACDTOMutablePolicyEvaluationResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuccess;
- (LACDTOMutablePolicyEvaluationResult)initWithIdentifier:(id)a3;
- (NSDictionary)result;
- (NSError)error;
- (NSString)description;
- (NSString)identifier;
- (void)setError:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation LACDTOMutablePolicyEvaluationResult

- (LACDTOMutablePolicyEvaluationResult)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACDTOMutablePolicyEvaluationResult;
  v5 = [(LACDTOMutablePolicyEvaluationResult *)&v8 init];
  v6 = v5;
  if (v5) {
    [(LACDTOMutablePolicyEvaluationResult *)v5 setIdentifier:v4];
  }

  return v6;
}

- (BOOL)isSuccess
{
  v2 = [(LACDTOMutablePolicyEvaluationResult *)self result];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  v18[3] = *MEMORY[0x263EF8340];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = NSString;
  v5 = [(LACDTOMutablePolicyEvaluationResult *)self identifier];
  v6 = [v4 stringWithFormat:@"identifier: %@", v5];
  v18[0] = v6;
  v7 = NSString;
  objc_super v8 = [(LACDTOMutablePolicyEvaluationResult *)self result];
  v9 = [v7 stringWithFormat:@"result: %@", v8];
  v18[1] = v9;
  v10 = NSString;
  v11 = [(LACDTOMutablePolicyEvaluationResult *)self error];
  v12 = [v10 stringWithFormat:@"error: %@", v11];
  v18[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v14 = [v13 componentsJoinedByString:@"; "];
  v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_270435F60])
  {
    id v5 = v4;
    v6 = [(LACDTOMutablePolicyEvaluationResult *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      objc_super v8 = (void *)v7;
      v9 = [(LACDTOMutablePolicyEvaluationResult *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(LACDTOMutablePolicyEvaluationResult *)self result];
    uint64_t v14 = [v5 result];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(LACDTOMutablePolicyEvaluationResult *)self result];
      v17 = [v5 result];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(LACDTOMutablePolicyEvaluationResult *)self error];
    uint64_t v20 = [v5 error];
    if (v19 == (void *)v20)
    {
      char v12 = 1;
      v21 = v19;
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(LACDTOMutablePolicyEvaluationResult *)self error];
      v23 = [v5 error];
      char v12 = [v22 isEqual:v23];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end