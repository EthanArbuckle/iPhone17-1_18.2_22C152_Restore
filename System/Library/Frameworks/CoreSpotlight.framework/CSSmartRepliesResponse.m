@interface CSSmartRepliesResponse
+ (BOOL)supportsSecureCoding;
- (CSSmartRepliesResponse)initWithCoder:(id)a3;
- (CSSmartRepliesResponse)initWithResponses:(id)a3;
- (NSArray)responses;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResponses:(id)a3;
@end

@implementation CSSmartRepliesResponse

- (CSSmartRepliesResponse)initWithResponses:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSSmartRepliesResponse;
  v5 = [(CSSmartRepliesResponse *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CSSmartRepliesResponse *)v5 setResponses:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSmartRepliesResponse *)self responses];
  [v4 encodeObject:v5 forKey:@"responses"];
}

- (CSSmartRepliesResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSmartRepliesResponse;
  id v5 = [(CSSmartRepliesResponse *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"responses"];
    [(CSSmartRepliesResponse *)v5 setResponses:v9];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSSmartRepliesResponse alloc];
  id v5 = [(CSSmartRepliesResponse *)self responses];
  v6 = [(CSSmartRepliesResponse *)v4 initWithResponses:v5];

  return v6;
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end