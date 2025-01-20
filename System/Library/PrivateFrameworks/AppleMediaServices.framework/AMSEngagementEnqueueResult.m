@interface AMSEngagementEnqueueResult
+ (BOOL)supportsSecureCoding;
+ (id)archiveClasses;
- (AMSEngagementEnqueueResult)initWithCoder:(id)a3;
- (AMSEngagementRequest)request;
- (NSArray)actions;
- (NSDictionary)data;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setData:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation AMSEngagementEnqueueResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setRequest:(id)a3
{
}

- (void)setActions:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSEngagementEnqueueResult *)self actions];
  [v4 encodeObject:v5 forKey:@"kCodingKeyActions"];

  v6 = [(AMSEngagementEnqueueResult *)self data];
  [v4 encodeObject:v6 forKey:@"kCodingKeyData"];

  id v7 = [(AMSEngagementEnqueueResult *)self request];
  [v4 encodeObject:v7 forKey:@"kCodingKeyRequest"];
}

- (NSArray)actions
{
  return self->_actions;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (AMSEngagementEnqueueResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSEngagementEnqueueResult;
  v5 = [(AMSEngagementEnqueueResult *)&v15 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kCodingKeyActions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"kCodingKeyData"];
    data = v5->_data;
    v5->_data = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyRequest"];
    request = v5->_request;
    v5->_request = (AMSEngagementRequest *)v12;
  }
  return v5;
}

+ (id)archiveClasses
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end