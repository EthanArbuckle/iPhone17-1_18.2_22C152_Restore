@interface NETransparentProxyProviderProtocol
+ (BOOL)supportsSecureCoding;
- (NETransparentProxyProviderProtocol)init;
- (NETransparentProxyProviderProtocol)initWithCoder:(id)a3;
- (NETransparentProxyProviderProtocol)initWithPluginType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)order;
- (void)encodeWithCoder:(id)a3;
- (void)setOrder:(unint64_t)a3;
@end

@implementation NETransparentProxyProviderProtocol

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v11.receiver = self;
  v11.super_class = (Class)NETransparentProxyProviderProtocol;
  v8 = [(NETunnelProviderProtocol *)&v11 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NETransparentProxyProviderProtocol order](self, "order"), @"order", v5, a4 & 0xFFFFFFFFFFFFFFF7);

  return v9;
}

- (NETransparentProxyProviderProtocol)initWithPluginType:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NETransparentProxyProviderProtocol;
  v3 = [(NETunnelProviderProtocol *)&v6 initWithPluginType:a3];
  v4 = v3;
  if (v3) {
    [(NETransparentProxyProviderProtocol *)v3 setOrder:0x7FFFFFFFLL];
  }
  return v4;
}

- (NETransparentProxyProviderProtocol)init
{
  v5.receiver = self;
  v5.super_class = (Class)NETransparentProxyProviderProtocol;
  v2 = [(NETunnelProviderProtocol *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NETransparentProxyProviderProtocol *)v2 setOrder:0x7FFFFFFFLL];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NETransparentProxyProviderProtocol;
  id v4 = [(NETunnelProviderProtocol *)&v6 copyWithZone:a3];
  if (v4) {
    objc_msgSend(v4, "setOrder:", -[NETransparentProxyProviderProtocol order](self, "order"));
  }
  return v4;
}

- (NETransparentProxyProviderProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NETransparentProxyProviderProtocol;
  objc_super v5 = [(NETunnelProviderProtocol *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_order = [v4 decodeIntegerForKey:@"Order"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NETransparentProxyProviderProtocol;
  id v4 = a3;
  [(NETunnelProviderProtocol *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[NETransparentProxyProviderProtocol order](self, "order", v5.receiver, v5.super_class), @"Order");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end