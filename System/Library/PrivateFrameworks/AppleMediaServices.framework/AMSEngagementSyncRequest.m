@interface AMSEngagementSyncRequest
+ (BOOL)supportsSecureCoding;
+ (id)archiveClasses;
- (AMSEngagementSyncRequest)initWithCoder:(id)a3;
- (NSArray)apps;
- (NSDictionary)context;
- (NSString)logKey;
- (NSString)origin;
- (double)timeout;
- (void)encodeWithCoder:(id)a3;
- (void)setApps:(id)a3;
- (void)setContext:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AMSEngagementSyncRequest

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(AMSEngagementSyncRequest *)self apps];
  [v8 encodeObject:v4 forKey:@"kCodingKeyApps"];

  v5 = [(AMSEngagementSyncRequest *)self context];
  [v8 encodeObject:v5 forKey:@"kCodingKeyContext"];

  v6 = [(AMSEngagementSyncRequest *)self logKey];
  [v8 encodeObject:v6 forKey:@"kCodingKeyLogKey"];

  v7 = [(AMSEngagementSyncRequest *)self origin];
  [v8 encodeObject:v7 forKey:@"kCodingKeyOrigin"];

  [(AMSEngagementSyncRequest *)self timeout];
  objc_msgSend(v8, "encodeDouble:forKey:", @"kCodingKeyTimeout");
}

- (AMSEngagementSyncRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSEngagementSyncRequest;
  v5 = [(AMSEngagementSyncRequest *)&v20 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCodingKeyApps"];
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kCodingKeyContext"];
    context = v5->_context;
    v5->_context = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyLogKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyOrigin"];
    origin = v5->_origin;
    v5->_origin = (NSString *)v16;

    [v4 decodeDoubleForKey:@"kCodingKeyTimeout"];
    v5->_timeout = v18;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end