@interface ISIconCacheConfiguration
+ (BOOL)supportsSecureCoding;
- (ISIconCacheConfiguration)initWithCoder:(id)a3;
- (NSString)salt;
- (NSString)sandboxExtension;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
- (void)setSalt:(id)a3;
- (void)setSandboxExtension:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ISIconCacheConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setUrl:(id)a3
{
}

- (void)setSandboxExtension:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_url forKey:@"url"];
  [v4 encodeObject:self->_sandboxExtension forKey:@"sandboxExtension"];
  [v4 encodeObject:self->_salt forKey:@"salt"];
}

- (ISIconCacheConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ISIconCacheConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtension"];
    sandboxExtension = v5->_sandboxExtension;
    v5->_sandboxExtension = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salt"];
    salt = v5->_salt;
    v5->_salt = (NSString *)v10;
  }
  return v5;
}

- (NSString)sandboxExtension
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSalt:(id)a3
{
}

@end