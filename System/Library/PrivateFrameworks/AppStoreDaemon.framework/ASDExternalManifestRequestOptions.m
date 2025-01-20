@interface ASDExternalManifestRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDExternalManifestRequestOptions)initWithCoder:(id)a3;
- (ASDExternalManifestRequestOptions)initWithURL:(id)a3;
- (BOOL)shouldHideUserPrompts;
- (NSURL)manifestURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldHideUserPrompts:(BOOL)a3;
@end

@implementation ASDExternalManifestRequestOptions

- (ASDExternalManifestRequestOptions)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestRequestOptions;
  v5 = [(ASDExternalManifestRequestOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDExternalManifestRequestOptions allocWithZone:](ASDExternalManifestRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSURL *)self->_manifestURL copyWithZone:a3];
  manifestURL = v5->_manifestURL;
  v5->_manifestURL = (NSURL *)v6;

  v5->_shouldHideUserPrompts = self->_shouldHideUserPrompts;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDExternalManifestRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestRequestOptions;
  v5 = [(ASDRequestOptions *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestURL"];
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v6;

    v5->_shouldHideUserPrompts = [v4 decodeBoolForKey:@"shouldHideUserPrompts"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ASDExternalManifestRequestOptions *)self manifestURL];
  [v5 encodeObject:v4 forKey:@"manifestURL"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ASDExternalManifestRequestOptions shouldHideUserPrompts](self, "shouldHideUserPrompts"), @"shouldHideUserPrompts");
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (BOOL)shouldHideUserPrompts
{
  return self->_shouldHideUserPrompts;
}

- (void)setShouldHideUserPrompts:(BOOL)a3
{
  self->_shouldHideUserPrompts = a3;
}

- (void).cxx_destruct
{
}

@end