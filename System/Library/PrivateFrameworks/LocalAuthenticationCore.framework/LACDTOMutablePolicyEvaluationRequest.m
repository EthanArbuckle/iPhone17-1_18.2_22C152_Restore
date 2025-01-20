@interface LACDTOMutablePolicyEvaluationRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractiveRatchetEvaluation;
- (LACDTOEnvironment)environment;
- (LACDTOMutablePolicyEvaluationRequest)initWithIdentifier:(id)a3;
- (NSDictionary)options;
- (NSDictionary)payload;
- (NSString)description;
- (NSString)identifier;
- (int64_t)policy;
- (unint64_t)hash;
- (void)setEnvironment:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPolicy:(int64_t)a3;
@end

@implementation LACDTOMutablePolicyEvaluationRequest

- (LACDTOMutablePolicyEvaluationRequest)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACDTOMutablePolicyEvaluationRequest;
  v5 = [(LACDTOMutablePolicyEvaluationRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    [(LACDTOMutablePolicyEvaluationRequest *)v5 setIdentifier:v4];
  }

  return v6;
}

- (BOOL)isInteractiveRatchetEvaluation
{
  options = self->_options;
  id v4 = [NSNumber numberWithInteger:1000];
  v5 = [(NSDictionary *)options objectForKeyedSubscript:v4];
  BOOL v6 = ([v5 BOOLValue] & 1) == 0 && self->_policy == 1026;

  return v6;
}

- (NSString)description
{
  v21[4] = *MEMORY[0x263EF8340];
  v19 = NSString;
  uint64_t v18 = objc_opt_class();
  v3 = NSString;
  v20 = [(LACDTOMutablePolicyEvaluationRequest *)self identifier];
  id v4 = [v3 stringWithFormat:@"identifier: %@", v20];
  v21[0] = v4;
  v5 = NSString;
  BOOL v6 = NSStringFromLACPolicy([(LACDTOMutablePolicyEvaluationRequest *)self policy]);
  v7 = [v5 stringWithFormat:@"policy: %@", v6];
  v21[1] = v7;
  objc_super v8 = NSString;
  v9 = [(LACDTOMutablePolicyEvaluationRequest *)self options];
  v10 = [v8 stringWithFormat:@"options: %@", v9];
  v21[2] = v10;
  v11 = NSString;
  v12 = [(LACDTOMutablePolicyEvaluationRequest *)self environment];
  v13 = [v11 stringWithFormat:@"environment: %@", v12];
  v21[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  v15 = [v14 componentsJoinedByString:@"; "];
  v16 = [v19 stringWithFormat:@"<%@ %p; %@>", v18, self, v15];

  return (NSString *)v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_27043A1B8])
  {
    id v5 = v4;
    BOOL v6 = [(LACDTOMutablePolicyEvaluationRequest *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      objc_super v8 = (void *)v7;
      v9 = [(LACDTOMutablePolicyEvaluationRequest *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_10;
      }
    }
    int64_t v13 = [(LACDTOMutablePolicyEvaluationRequest *)self policy];
    if (v13 == [v5 policy])
    {
      v14 = [(LACDTOMutablePolicyEvaluationRequest *)self options];
      uint64_t v15 = [v5 options];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(LACDTOMutablePolicyEvaluationRequest *)self options];
        uint64_t v18 = [v5 options];
        int v19 = [v17 isEqualToDictionary:v18];

        if (!v19) {
          goto LABEL_10;
        }
      }
      v20 = [(LACDTOMutablePolicyEvaluationRequest *)self environment];
      uint64_t v21 = [v5 environment];
      if (v20 == (void *)v21)
      {
        char v12 = 1;
        v22 = v20;
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(LACDTOMutablePolicyEvaluationRequest *)self environment];
        v24 = [v5 environment];
        char v12 = [v23 isEqual:v24];
      }
      goto LABEL_16;
    }
LABEL_10:
    char v12 = 0;
LABEL_16:

    goto LABEL_17;
  }
  char v12 = 0;
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3 = [(LACDTOMutablePolicyEvaluationRequest *)self policy];
  id v4 = [(LACDTOMutablePolicyEvaluationRequest *)self options];
  uint64_t v5 = [v4 hash] ^ v3;
  BOOL v6 = [(LACDTOMutablePolicyEvaluationRequest *)self identifier];
  uint64_t v7 = [v6 hash];
  objc_super v8 = [(LACDTOMutablePolicyEvaluationRequest *)self environment];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (LACDTOEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
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
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end