@interface NEDNSProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEnabled;
- (NEDNSProxy)init;
- (NEDNSProxy)initWithCoder:(id)a3;
- (NEDNSProxyProviderProtocol)protocol;
- (NEPerApp)perApp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPerApp:(id)a3;
- (void)setProtocol:(id)a3;
@end

@implementation NEDNSProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perApp, 0);

  objc_storeStrong((id *)&self->_protocol, 0);
}

- (void)setPerApp:(id)a3
{
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProtocol:(id)a3
{
}

- (NEDNSProxyProviderProtocol)protocol
{
  return (NEDNSProxyProviderProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)description
{
  return [(NEDNSProxy *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSProxy isEnabled](self, "isEnabled"), @"enabled", v5, a4);
  v8 = [(NEDNSProxy *)self protocol];
  [v7 appendPrettyObject:v8 withName:@"protocol" andIndent:v5 options:a4];

  v9 = [(NEDNSProxy *)self perApp];
  [v7 appendPrettyObject:v9 withName:@"per-app" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEDNSProxy *)self protocol];
  char v6 = v5 != 0;

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing protocol", v4);
  }
  uint64_t v7 = [(NEDNSProxy *)self protocol];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(NEDNSProxy *)self protocol];
    char v10 = [v9 checkValidityAndCollectErrors:v4];

    if (v5) {
      char v6 = v10;
    }
    else {
      char v6 = 0;
    }
  }
  uint64_t v11 = [(NEDNSProxy *)self perApp];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(NEDNSProxy *)self perApp];
    char v14 = [v13 checkValidityAndCollectErrors:v4];

    v6 &= v14;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEDNSProxy allocWithZone:a3] init];
  [(NEDNSProxy *)v4 setEnabled:[(NEDNSProxy *)self isEnabled]];
  uint64_t v5 = [(NEDNSProxy *)self protocol];
  [(NEDNSProxy *)v4 setProtocol:v5];

  char v6 = [(NEDNSProxy *)self perApp];
  [(NEDNSProxy *)v4 setPerApp:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSProxy isEnabled](self, "isEnabled"), @"Enabled");
  uint64_t v5 = [(NEDNSProxy *)self protocol];
  [v4 encodeObject:v5 forKey:@"Protocol"];

  id v6 = [(NEDNSProxy *)self perApp];
  [v4 encodeObject:v6 forKey:@"PerApp"];
}

- (NEDNSProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEDNSProxy;
  uint64_t v5 = [(NEDNSProxy *)&v11 init];
  if (v5)
  {
    v5->_enabled = [v4 decodeBoolForKey:@"Enabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Protocol"];
    protocol = v5->_protocol;
    v5->_protocol = (NEDNSProxyProviderProtocol *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PerApp"];
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v8;
  }
  return v5;
}

- (NEDNSProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)NEDNSProxy;
  v2 = [(NEDNSProxy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NEDNSProxy *)v2 setEnabled:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end