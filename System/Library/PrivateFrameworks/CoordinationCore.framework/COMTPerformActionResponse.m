@interface COMTPerformActionResponse
+ (BOOL)supportsSecureCoding;
- (COMTPerformActionResponse)initWithCoder:(id)a3;
- (COMTPerformActionResponse)initWithResults:(id)a3;
- (NSDictionary)results;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTPerformActionResponse

- (COMTPerformActionResponse)initWithResults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTPerformActionResponse;
  v5 = [(COMessageChannelResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    results = v5->_results;
    v5->_results = (NSDictionary *)v6;
  }
  return v5;
}

- (COMTPerformActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)COMTPerformActionResponse;
  v5 = [(COMessageChannelResponse *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"RR"];
    uint64_t v16 = [v15 copy];
    results = v5->_results;
    v5->_results = (NSDictionary *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTPerformActionResponse;
  id v4 = a3;
  [(COMessageChannelResponse *)&v6 encodeWithCoder:v4];
  v5 = [(COMTPerformActionResponse *)self results];
  [v4 encodeObject:v5 forKey:@"RR"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end