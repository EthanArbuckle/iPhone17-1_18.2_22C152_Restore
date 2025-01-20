@interface FSGenericURLResource
+ (BOOL)supportsSecureCoding;
+ (id)resourceWithURL:(id)a3;
+ (id)secureResourceWithURL:(id)a3 readonly:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (FSGenericURLResource)initWithCoder:(id)a3;
- (FSGenericURLResource)initWithURL:(id)a3;
- (FSGenericURLResource)initWithURL:(id)a3 readonly:(BOOL)a4;
- (NSSecurityScopedURLWrapper)urlWrapper;
- (NSURL)URL;
- (id)getResourceID;
- (id)initAsSecureURL:(id)a3 readonly:(BOOL)a4;
- (id)makeProxy;
- (int64_t)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setUrlWrapper:(id)a3;
@end

@implementation FSGenericURLResource

- (FSGenericURLResource)initWithURL:(id)a3
{
  return [(FSGenericURLResource *)self initWithURL:a3 readonly:0];
}

- (FSGenericURLResource)initWithURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSGenericURLResource;
  v8 = [(FSGenericURLResource *)&v13 init];
  if (v8)
  {
    v9 = (void *)MEMORY[0x25332B5A0](v7);
    if (v9)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263F08B18]) initWithURL:v7 readonly:v4 extensionClass:0];
      urlWrapper = v8->_urlWrapper;
      v8->_urlWrapper = (NSSecurityScopedURLWrapper *)v10;
    }
    objc_storeStrong((id *)&v8->_URL, a3);
  }
  return v8;
}

- (id)initAsSecureURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FSGenericURLResource;
  id v7 = [(FSGenericURLResource *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08B18]) initWithURL:v6 readonly:v4 extensionClass:0];
    urlWrapper = v7->_urlWrapper;
    v7->_urlWrapper = (NSSecurityScopedURLWrapper *)v8;

    uint64_t v10 = v7->_urlWrapper;
    if (v10)
    {
      uint64_t v11 = [(NSSecurityScopedURLWrapper *)v10 url];
      URL = v7->_URL;
      v7->_URL = (NSURL *)v11;
    }
    else
    {
      URL = v7;
      id v7 = 0;
    }
  }
  return v7;
}

+ (id)resourceWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FSGenericURLResource;
  id v4 = a3;
  [(FSResource *)&v7 encodeWithCoder:v4];
  urlWrapper = self->_urlWrapper;
  if (urlWrapper)
  {
    id v6 = @"FSResource.Wrapper";
  }
  else
  {
    urlWrapper = self->_URL;
    id v6 = @"FSResource.URL";
  }
  objc_msgSend(v4, "encodeObject:forKey:", urlWrapper, v6, v7.receiver, v7.super_class);
}

- (FSGenericURLResource)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)FSGenericURLResource;
  v5 = [(FSResource *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSResource.Wrapper"];
    urlWrapper = v5->_urlWrapper;
    v5->_urlWrapper = (NSSecurityScopedURLWrapper *)v6;

    uint64_t v8 = v5->_urlWrapper;
    if (v8) {
      [(NSSecurityScopedURLWrapper *)v8 url];
    }
    else {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSResource.URL"];
    }
    URL = v5->_URL;
    v5->_URL = (NSURL *)v9;
  }
  return v5;
}

- (int64_t)kind
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = +[FSResource dynamicCast:a3];
  v5 = v4;
  if (v4)
  {
    URL = self->_URL;
    objc_super v7 = [v4 URL];
    char v8 = [(NSURL *)URL isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)getResourceID
{
  v2 = NSString;
  v3 = [(NSURL *)self->_URL absoluteString];
  id v4 = [v2 stringWithFormat:@"FSGenericURLResource:%@", v3];

  return v4;
}

- (id)makeProxy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(FSGenericURLResource *)self URL];
  v5 = (void *)[v3 initWithURL:v4];

  uint64_t v6 = (void *)v5[3];
  v5[3] = 0;

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSSecurityScopedURLWrapper)urlWrapper
{
  return (NSSecurityScopedURLWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrlWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (id)secureResourceWithURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = (void *)[objc_alloc((Class)a1) initAsSecureURL:v6 readonly:v4];

  return v7;
}

@end