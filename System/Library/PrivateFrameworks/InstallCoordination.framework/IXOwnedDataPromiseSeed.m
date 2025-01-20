@interface IXOwnedDataPromiseSeed
+ (BOOL)supportsSecureCoding;
- (Class)clientPromiseClass;
- (IXOwnedDataPromiseSeed)initWithCoder:(id)a3;
- (NSString)sandboxExtensionToken;
- (NSURL)stagingBaseDir;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setStagingBaseDir:(id)a3;
@end

@implementation IXOwnedDataPromiseSeed

- (IXOwnedDataPromiseSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IXOwnedDataPromiseSeed;
  v5 = [(IXDataPromiseSeed *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagingBaseDir"];
    stagingBaseDir = v5->_stagingBaseDir;
    v5->_stagingBaseDir = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtensionToken"];
    sandboxExtensionToken = v5->_sandboxExtensionToken;
    v5->_sandboxExtensionToken = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IXOwnedDataPromiseSeed;
  id v4 = a3;
  [(IXDataPromiseSeed *)&v7 encodeWithCoder:v4];
  v5 = [(IXOwnedDataPromiseSeed *)self stagingBaseDir];
  [v4 encodeObject:v5 forKey:@"stagingBaseDir"];

  uint64_t v6 = [(IXOwnedDataPromiseSeed *)self sandboxExtensionToken];
  [v4 encodeObject:v6 forKey:@"sandboxExtensionToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IXOwnedDataPromiseSeed;
  id v4 = [(IXDataPromiseSeed *)&v8 copyWithZone:a3];
  v5 = [(IXOwnedDataPromiseSeed *)self stagingBaseDir];
  [v4 setStagingBaseDir:v5];

  uint64_t v6 = [(IXOwnedDataPromiseSeed *)self sandboxExtensionToken];
  [v4 setSandboxExtensionToken:v6];

  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (NSURL)stagingBaseDir
{
  return self->_stagingBaseDir;
}

- (void)setStagingBaseDir:(id)a3
{
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);

  objc_storeStrong((id *)&self->_stagingBaseDir, 0);
}

@end