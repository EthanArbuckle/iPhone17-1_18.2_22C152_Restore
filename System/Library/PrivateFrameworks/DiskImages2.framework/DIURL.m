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
  v8 = [NSString stringWithFormat:@"plugin://%@/", a3];
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
  char v3 = [v2 isEqualToString:@"plugin"];

  return v3;
}

- (NSString)pluginName
{
  if ([(DIURL *)self isPlugin])
  {
    char v3 = [(DIURL *)self host];
  }
  else
  {
    char v3 = 0;
  }
  return (NSString *)v3;
}

- (id)path
{
  if ([(DIURL *)self isPlugin])
  {
    char v3 = [(DIURL *)self description];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIURL;
    char v3 = [(DIURL *)&v5 path];
  }
  return v3;
}

- (id)description
{
  char v3 = (PluginsManager *)[(DIURL *)self isPlugin];
  if (v3)
  {
    uint64_t v4 = PluginsManager::get(v3);
    id v5 = [(DIURL *)self pluginName];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
    id v6 = [(DIURL *)self pluginParams];
    id v7 = (void *)PluginsManager::copy_plugin_description(v4, (uint64_t)__p, (uint64_t)v6);

    if (v18 < 0) {
      operator delete(__p[0]);
    }

    v8 = [NSURL URLWithString:v7];
    v9 = [v8 scheme];

    if (!v9)
    {
      v10 = NSURL;
      objc_super v11 = [NSString stringWithFormat:@"plugin://%@", v7];
      uint64_t v12 = [v10 URLWithString:v11];

      v8 = (void *)v12;
    }
    uint64_t v13 = [v8 absoluteString];
  }
  else
  {
    id v7 = [MEMORY[0x263F08BA0] componentsWithURL:self resolvingAgainstBaseURL:1];
    v14 = [(DIURL *)self password];

    if (v14) {
      [v7 setPassword:0];
    }
    v8 = [v7 URL];
    uint64_t v13 = [v8 absoluteString];
  }
  v15 = (void *)v13;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIURL;
  id v5 = [(DIURL *)&v20 initWithCoder:v4];
  if (v5)
  {
    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v19, "setWithObjects:", v18, v17, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
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
  id v5 = [(DIURL *)self pluginParams];
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