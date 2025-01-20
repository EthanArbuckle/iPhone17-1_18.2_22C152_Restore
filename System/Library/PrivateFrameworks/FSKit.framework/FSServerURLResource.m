@interface FSServerURLResource
+ (BOOL)supportsSecureCoding;
+ (id)resourceWithURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FSServerURLResource)initWithCoder:(id)a3;
- (FSServerURLResource)initWithURL:(id)a3;
- (NSURL)url;
- (id)getResourceID;
- (id)makeProxy;
- (int64_t)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FSServerURLResource

- (FSServerURLResource)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSServerURLResource;
  v6 = [(FSServerURLResource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

+ (id)resourceWithURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FSServerURLResource;
  id v4 = a3;
  [(FSResource *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, @"FSResource.URL", v5.receiver, v5.super_class);
}

- (FSServerURLResource)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)FSServerURLResource;
  objc_super v5 = [(FSResource *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSResource.URL"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (int64_t)kind
{
  return 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = +[FSResource dynamicCast:a3];
  objc_super v5 = v4;
  if (v4)
  {
    url = self->_url;
    v7 = [v4 url];
    char v8 = [(NSURL *)url isEqual:v7];
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
  v3 = [(NSURL *)self->_url path];
  id v4 = [v2 stringWithFormat:@"FSServerURLResource:%@", v3];

  return v4;
}

- (id)makeProxy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(FSServerURLResource *)self url];
  objc_super v5 = (void *)[v3 initWithURL:v4];

  return v5;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end