@interface DIURL
+ (BOOL)supportsSecureCoding;
+ (id)newDIURLWithNSURL:(id)a3;
+ (id)newDIURLWithPluginName:(id)a3 params:(id)a4;
- (BOOL)isPlugin;
- (DIURL)initWithCoder:(id)a3;
- (DIURL)initWithPluginName:(id)a3 params:(id)a4;
- (NSDictionary)pluginParams;
- (NSString)pluginName;
- (id)description;
- (id)path;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIURL

+ (id)newDIURLWithNSURL:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (DIURL *)[v3 copy];
  }
  else
  {
    v5 = [DIURL alloc];
    v6 = [v3 absoluteString];
    v4 = [(DIURL *)v5 initWithString:v6];
  }
  return v4;
}

+ (id)newDIURLWithPluginName:(id)a3 params:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[DIURL alloc] initWithPluginName:v5 params:v6];

  return v7;
}

- (DIURL)initWithPluginName:(id)a3 params:(id)a4
{
  id v7 = a4;
  v8 = +[NSString stringWithFormat:@"plugin://%@/", a3];
  v11.receiver = self;
  v11.super_class = (Class)DIURL;
  v9 = [(DIURL *)&v11 initWithString:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_pluginParams, a4);
  }

  return v9;
}

- (BOOL)isPlugin
{
  v2 = [(DIURL *)self scheme];
  unsigned __int8 v3 = [v2 isEqualToString:@"plugin"];

  return v3;
}

- (NSString)pluginName
{
  if ([(DIURL *)self isPlugin])
  {
    unsigned __int8 v3 = [(DIURL *)self host];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  return (NSString *)v3;
}

- (id)path
{
  if ([(DIURL *)self isPlugin])
  {
    unsigned __int8 v3 = [(DIURL *)self description];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIURL;
    unsigned __int8 v3 = [(DIURL *)&v5 path];
  }
  return v3;
}

- (id)description
{
  if ([(DIURL *)self isPlugin])
  {
    uint64_t v3 = sub_10007361C();
    id v4 = [(DIURL *)self pluginName];
    sub_100004890(__p, (char *)[v4 UTF8String]);
    objc_super v5 = [(DIURL *)self pluginParams];
    id v6 = (void *)sub_100074E70(v3, (uint64_t)__p, (uint64_t)v5);

    if (v16 < 0) {
      operator delete(__p[0]);
    }

    id v7 = +[NSURL URLWithString:v6];
    v8 = [v7 scheme];

    if (!v8)
    {
      v9 = +[NSString stringWithFormat:@"plugin://%@", v6];
      uint64_t v10 = +[NSURL URLWithString:v9];

      id v7 = (void *)v10;
    }
    uint64_t v11 = [v7 absoluteString];
  }
  else
  {
    id v6 = +[NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:1];
    v12 = [(DIURL *)self password];

    if (v12) {
      [v6 setPassword:0];
    }
    id v7 = [v6 URL];
    uint64_t v11 = [v7 absoluteString];
  }
  v13 = (void *)v11;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DIURL;
  objc_super v5 = [(DIURL *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v17, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"pluginParams"];
    pluginParams = v5->_pluginParams;
    v5->_pluginParams = (NSDictionary *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIURL;
  [(DIURL *)&v6 encodeWithCoder:v4];
  objc_super v5 = [(DIURL *)self pluginParams];
  [v4 encodeObject:v5 forKey:@"pluginParams"];
}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void).cxx_destruct
{
}

@end