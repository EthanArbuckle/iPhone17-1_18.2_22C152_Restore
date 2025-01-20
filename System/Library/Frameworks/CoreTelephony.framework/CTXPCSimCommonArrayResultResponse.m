@interface CTXPCSimCommonArrayResultResponse
+ (BOOL)supportsSecureCoding;
- (CTXPCSimCommonArrayResultResponse)initWithCoder:(id)a3;
- (CTXPCSimCommonArrayResultResponse)initWithResult:(id)a3;
- (NSArray)result;
- (void)encodeWithCoder:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation CTXPCSimCommonArrayResultResponse

- (CTXPCSimCommonArrayResultResponse)initWithResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCSimCommonArrayResultResponse;
  v6 = [(CTXPCMessage *)&v9 initWithNamedArguments:MEMORY[0x1E4F1CC08]];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_result, a3);
  }

  return v7;
}

- (CTXPCSimCommonArrayResultResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTXPCSimCommonArrayResultResponse;
  id v5 = [(CTXPCMessage *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"result"];
    v10 = v5->_result;
    v5->_result = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CTXPCSimCommonArrayResultResponse;
  [(CTXPCMessage *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_result forKey:@"result"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end