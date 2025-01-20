@interface ATXTimeEventSource
+ (BOOL)supportsSecureCoding;
- (ATXTimeEventSource)initWithCoder:(id)a3;
- (ATXTimeEventSource)initWithType:(int64_t)a3;
- (ATXTimeEventSource)initWithType:(int64_t)a3 bundleId:(id)a4 url:(id)a5;
- (NSString)bundleId;
- (NSURL)url;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeEventSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeEventSource)initWithType:(int64_t)a3
{
  return [(ATXTimeEventSource *)self initWithType:a3 bundleId:0 url:0];
}

- (ATXTimeEventSource)initWithType:(int64_t)a3 bundleId:(id)a4 url:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXTimeEventSource;
  v10 = [(ATXTimeEventSource *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    bundleId = v11->_bundleId;
    v11->_bundleId = (NSString *)v12;

    objc_storeStrong((id *)&v11->_url, a5);
  }

  return v11;
}

- (ATXTimeEventSource)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"sourceType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];

  id v8 = [(ATXTimeEventSource *)self initWithType:v5 bundleId:v6 url:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXTimeEventSource type](self, "type"), @"sourceType");
  uint64_t v5 = [(ATXTimeEventSource *)self bundleId];
  [v4 encodeObject:v5 forKey:@"bundleId"];

  id v6 = [(ATXTimeEventSource *)self url];
  [v4 encodeObject:v6 forKey:@"url"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end