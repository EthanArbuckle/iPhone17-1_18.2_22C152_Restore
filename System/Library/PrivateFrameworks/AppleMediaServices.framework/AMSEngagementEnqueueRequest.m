@interface AMSEngagementEnqueueRequest
+ (BOOL)supportsSecureCoding;
+ (id)archiveClasses;
- (AMSEngagementEnqueueRequest)initWithCoder:(id)a3;
- (AMSProcessInfo)clientInfo;
- (NSArray)destinations;
- (NSArray)events;
- (NSString)logKey;
- (double)timeout;
- (void)encodeWithCoder:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setEvents:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AMSEngagementEnqueueRequest

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void)setDestinations:(id)a3
{
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setLogKey:(id)a3
{
}

- (void)setClientInfo:(id)a3
{
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(AMSEngagementEnqueueRequest *)self clientInfo];
  [v8 encodeObject:v4 forKey:@"kCodingKeyClientInfo"];

  v5 = [(AMSEngagementEnqueueRequest *)self destinations];
  [v8 encodeObject:v5 forKey:@"kCodingKeyDestinations"];

  v6 = [(AMSEngagementEnqueueRequest *)self events];
  [v8 encodeObject:v6 forKey:@"kCodingKeyEvents"];

  v7 = [(AMSEngagementEnqueueRequest *)self logKey];
  [v8 encodeObject:v7 forKey:@"kCodingKeyLogKey"];

  [(AMSEngagementEnqueueRequest *)self timeout];
  objc_msgSend(v8, "encodeDouble:forKey:", @"kCodingKeyTimeoOut");
}

- (NSString)logKey
{
  return self->_logKey;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (double)timeout
{
  return self->_timeout;
}

- (AMSEngagementEnqueueRequest)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSEngagementEnqueueRequest;
  v5 = [(AMSEngagementEnqueueRequest *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyClientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kCodingKeyDestinations"];
    destinations = v5->_destinations;
    v5->_destinations = (NSArray *)v11;

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_PLISTClasses");
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kCodingKeyEvents"];
    events = v5->_events;
    v5->_events = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyLogKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v16;

    [v4 decodeDoubleForKey:@"kCodingKeyTimeoOut"];
    v5->_timeout = v18;
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

@end