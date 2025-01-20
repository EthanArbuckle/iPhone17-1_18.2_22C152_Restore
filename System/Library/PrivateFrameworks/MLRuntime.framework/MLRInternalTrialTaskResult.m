@interface MLRInternalTrialTaskResult
+ (BOOL)supportsSecureCoding;
- (MLRInternalTrialTaskResult)initWithCoder:(id)a3;
- (MLRInternalTrialTaskResult)initWithJSONResult:(id)a3;
- (NSDictionary)JSONResult;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRInternalTrialTaskResult

- (MLRInternalTrialTaskResult)initWithJSONResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLRInternalTrialTaskResult;
  v6 = [(MLRInternalTrialTaskResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_JSONResult, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  JSONResult = self->_JSONResult;
  if (JSONResult) {
    [a3 encodeObject:JSONResult forKey:@"JSONResult"];
  }
}

- (MLRInternalTrialTaskResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = [v5 decodeObjectOfClasses:v10 forKey:@"JSONResult"];

  v12 = [(MLRInternalTrialTaskResult *)self initWithJSONResult:v11];
  return v12;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (void).cxx_destruct
{
}

@end