@interface CPSTVProviderRequest
+ (BOOL)supportsSecureCoding;
- (CPSTVProviderRequest)initWithCoder:(id)a3;
- (NSString)providerCode;
- (NSString)providerName;
- (NSURL)providerURL;
- (UIImage)providerImage;
- (id)description;
- (int64_t)authType;
- (void)encodeWithCoder:(id)a3;
- (void)setProviderCode:(id)a3;
- (void)setProviderImage:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setProviderURL:(id)a3;
@end

@implementation CPSTVProviderRequest

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_providerURL withName:@"providerURL" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_providerImage withName:@"providerImage" skipIfNil:1];
  [v3 appendString:self->_providerName withName:@"providerName" skipIfEmpty:1];
  [v3 appendString:self->_providerCode withName:@"providerCode" skipIfEmpty:1];
  v6 = [v3 build];

  return v6;
}

- (int64_t)authType
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSTVProviderRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_providerURL, @"providerURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_providerImage forKey:@"providerImage"];
  [v4 encodeObject:self->_providerName forKey:@"providerName"];
  [v4 encodeObject:self->_providerCode forKey:@"providerCode"];
}

- (CPSTVProviderRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPSTVProviderRequest;
  objc_super v5 = [(CPSAuthenticationRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"providerURL"];
    providerURL = v5->_providerURL;
    v5->_providerURL = (NSURL *)v7;

    getUIImageClass();
    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"providerImage"];
    providerImage = v5->_providerImage;
    v5->_providerImage = (UIImage *)v10;

    v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"providerName"];
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v13;

    v15 = self;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"providerCode"];
    providerCode = v5->_providerCode;
    v5->_providerCode = (NSString *)v16;
  }
  return v5;
}

- (NSURL)providerURL
{
  return self->_providerURL;
}

- (void)setProviderURL:(id)a3
{
}

- (UIImage)providerImage
{
  return self->_providerImage;
}

- (void)setProviderImage:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)providerCode
{
  return self->_providerCode;
}

- (void)setProviderCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerCode, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
}

@end