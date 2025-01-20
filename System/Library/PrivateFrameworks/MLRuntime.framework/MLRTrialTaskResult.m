@interface MLRTrialTaskResult
- (BOOL)submitForTask:(id)a3 error:(id *)a4;
- (MLRTrialTaskResult)initWithJSONResult:(id)a3;
- (NSDictionary)JSONResult;
- (id)description;
@end

@implementation MLRTrialTaskResult

- (MLRTrialTaskResult)initWithJSONResult:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLRTrialTaskResult;
  v6 = [(MLRTrialTaskResult *)&v13 init];
  if (v6)
  {
    if (v5 && ([MEMORY[0x263F08900] isValidJSONObject:v5] & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      v11 = [NSString stringWithFormat:@"JSONResult must be valid JSON object, JSONResult=(%@)", v5];
      id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

      objc_exception_throw(v12);
    }
    objc_storeStrong((id *)&v6->_JSONResult, a3);
    v7 = v6;
  }

  return v6;
}

- (BOOL)submitForTask:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@\nJSONResult:\n\t%@\n", v5, self->_JSONResult];

  return v6;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (void).cxx_destruct
{
}

@end