@interface AMSContentInfo
+ (BOOL)supportsSecureCoding;
- (AMSContentInfo)initWithCoder:(id)a3;
- (NSDate)created;
- (NSDate)expires;
- (NSString)cacheKey;
- (NSString)path;
- (NSString)version;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setCreated:(id)a3;
- (void)setExpires:(id)a3;
- (void)setPath:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation AMSContentInfo

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSContentInfo *)self cacheKey];
  [v4 encodeObject:v5 forKey:@"cacheKey"];

  v6 = [(AMSContentInfo *)self created];
  [v4 encodeObject:v6 forKey:@"created"];

  v7 = [(AMSContentInfo *)self expires];
  [v4 encodeObject:v7 forKey:@"expires"];

  v8 = [(AMSContentInfo *)self path];
  [v4 encodeObject:v8 forKey:@"path"];

  id v9 = [(AMSContentInfo *)self version];
  [v4 encodeObject:v9 forKey:@"version"];
}

- (AMSContentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSContentInfo;
  v5 = [(AMSContentInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheKey"];
    cacheKey = v5->_cacheKey;
    v5->_cacheKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"created"];
    created = v5->_created;
    v5->_created = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expires"];
    expires = v5->_expires;
    v5->_expires = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
}

- (NSDate)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
}

@end