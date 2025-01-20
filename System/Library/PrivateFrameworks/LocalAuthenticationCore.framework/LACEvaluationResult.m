@interface LACEvaluationResult
+ (id)resultWithFailure:(id)a3;
+ (id)resultWithNext:(id)a3;
+ (id)resultWithSuccess:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LACEvaluationRequest)request;
- (LACEvaluationResult)initWithValue:(id)a3 error:(id)a4 request:(id)a5;
- (NSDictionary)value;
- (NSError)error;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LACEvaluationResult

- (NSDictionary)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (LACEvaluationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)resultWithFailure:(id)a3
{
  id v3 = a3;
  v4 = [[LACEvaluationResult alloc] initWithValue:0 error:v3 request:0];

  return v4;
}

+ (id)resultWithNext:(id)a3
{
  id v3 = a3;
  v4 = [[LACEvaluationResult alloc] initWithValue:0 error:0 request:v3];

  return v4;
}

- (LACEvaluationResult)initWithValue:(id)a3 error:(id)a4 request:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LACEvaluationResult;
  v12 = [(LACEvaluationResult *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_value, a3);
    objc_storeStrong((id *)&v13->_error, a4);
    objc_storeStrong((id *)&v13->_request, a5);
    if (v9)
    {
      uint64_t v14 = 2;
LABEL_8:
      v13->_rawValue = v14;
      goto LABEL_9;
    }
    if (v10)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
    if (v11)
    {
      uint64_t v14 = 1;
      goto LABEL_8;
    }
  }
LABEL_9:

  return v13;
}

+ (id)resultWithSuccess:(id)a3
{
  id v3 = a3;
  v4 = [[LACEvaluationResult alloc] initWithValue:v3 error:0 request:0];

  return v4;
}

- (id)description
{
  v12[3] = *MEMORY[0x263EF8340];
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [NSString stringWithFormat:@"value: %@", self->_value];
  v12[0] = v5;
  v6 = [NSString stringWithFormat:@"error: %@", self->_error];
  v12[1] = v6;
  v7 = [NSString stringWithFormat:@"request: %@", self->_request];
  v12[2] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
  id v9 = [v8 componentsJoinedByString:@"; "];
  id v10 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = v4;
    int64_t v8 = [(LACEvaluationResult *)self rawValue];
    if (v8 != [v7 rawValue])
    {
LABEL_14:
      BOOL v15 = 0;
LABEL_17:

      goto LABEL_18;
    }
    int64_t v9 = [(LACEvaluationResult *)self rawValue];
    if (v9 == 2)
    {
      id v10 = [(LACEvaluationResult *)self value];
      uint64_t v16 = [v7 value];
      if (v10 == (void *)v16) {
        goto LABEL_15;
      }
      v12 = (void *)v16;
      v13 = [(LACEvaluationResult *)self value];
      uint64_t v14 = [v7 value];
    }
    else
    {
      if (v9 != 1)
      {
        if (v9) {
          goto LABEL_16;
        }
        id v10 = [(LACEvaluationResult *)self error];
        uint64_t v11 = [v7 error];
        if (v10 != (void *)v11)
        {
          v12 = (void *)v11;
          v13 = [(LACEvaluationResult *)self error];
          uint64_t v14 = [v7 error];
          goto LABEL_13;
        }
LABEL_15:

        goto LABEL_16;
      }
      id v10 = [(LACEvaluationResult *)self request];
      uint64_t v17 = [v7 request];
      if (v10 == (void *)v17) {
        goto LABEL_15;
      }
      v12 = (void *)v17;
      v13 = [(LACEvaluationResult *)self request];
      uint64_t v14 = [v7 request];
    }
LABEL_13:
    v18 = (void *)v14;
    char v19 = [v13 isEqual:v14];

    if ((v19 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v15 = 1;
    goto LABEL_17;
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

@end