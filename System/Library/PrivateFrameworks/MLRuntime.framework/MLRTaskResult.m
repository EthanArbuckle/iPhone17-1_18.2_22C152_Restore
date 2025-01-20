@interface MLRTaskResult
+ (BOOL)supportsSecureCoding;
- (MLRTaskResult)initWithCoder:(id)a3;
- (MLRTaskResult)initWithJSONResult:(id)a3 unprivatizedVector:(id)a4;
- (NSData)vector;
- (NSDictionary)JSONResult;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLRTaskResult

- (MLRTaskResult)initWithJSONResult:(id)a3 unprivatizedVector:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MLRTaskResult;
  v9 = [(MLRTaskResult *)&v16 init];
  if (v9)
  {
    if (v7 && ([MEMORY[0x263F08900] isValidJSONObject:v7] & 1) == 0)
    {
      v12 = (void *)MEMORY[0x263EFF940];
      uint64_t v13 = *MEMORY[0x263EFF4A0];
      v14 = [NSString stringWithFormat:@"JSONResult must be valid JSON object, JSONResult=(%@)", v7];
      id v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];

      objc_exception_throw(v15);
    }
    objc_storeStrong((id *)&v9->_vector, a4);
    objc_storeStrong((id *)&v9->_JSONResult, a3);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@\nJSONResult:\n\t%@\n", v5, self->_JSONResult];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  JSONResult = self->_JSONResult;
  id v7 = v4;
  if (JSONResult)
  {
    [v4 encodeObject:JSONResult forKey:@"JSONResult"];
    id v4 = v7;
  }
  vector = self->_vector;
  if (vector)
  {
    [v7 encodeObject:vector forKey:@"vector"];
    id v4 = v7;
  }
}

- (MLRTaskResult)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = [v5 decodeObjectOfClasses:v10 forKey:@"JSONResult"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"vector"];

  uint64_t v13 = [(MLRTaskResult *)self initWithJSONResult:v11 unprivatizedVector:v12];
  return v13;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSData)vector
{
  return self->_vector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);

  objc_storeStrong((id *)&self->_JSONResult, 0);
}

@end