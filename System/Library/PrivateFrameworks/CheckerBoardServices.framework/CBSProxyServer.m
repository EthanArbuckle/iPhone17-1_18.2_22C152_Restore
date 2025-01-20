@interface CBSProxyServer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CBSProxyServer)init;
- (CBSProxyServer)initWithCoder:(id)a3;
- (CBSProxyServer)initWithServer:(id)a3 port:(id)a4 token:(id)a5;
- (NSNumber)port;
- (NSString)server;
- (NSString)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPort:(id)a3;
- (void)setServer:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation CBSProxyServer

- (CBSProxyServer)init
{
  return [(CBSProxyServer *)self initWithServer:&stru_26F239D58 port:&unk_26F23BE80 token:0];
}

- (CBSProxyServer)initWithServer:(id)a3 port:(id)a4 token:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CBSProxyServer;
  v12 = [(CBSProxyServer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_server, a3);
    objc_storeStrong((id *)&v13->_port, a4);
    objc_storeStrong((id *)&v13->_token, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CBSProxyServer *)self server];
  v7 = [(CBSProxyServer *)self port];
  v8 = [(CBSProxyServer *)self token];
  id v9 = [v3 stringWithFormat:@"<%@: %p server = %@, port = %@, token = %@>", v5, self, v6, v7, v8];;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBSProxyServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CBSProxyServer;
  v5 = [(CBSProxyServer *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"server"];
    server = v5->_server;
    v5->_server = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"port"];
    port = v5->_port;
    v5->_port = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CBSProxyServer *)self server];
  [v4 encodeObject:v5 forKey:@"server"];

  uint64_t v6 = [(CBSProxyServer *)self port];
  [v4 encodeObject:v6 forKey:@"port"];

  id v7 = [(CBSProxyServer *)self token];
  [v4 encodeObject:v7 forKey:@"token"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CBSProxyServer);
  v5 = [(CBSProxyServer *)self server];
  uint64_t v6 = [v5 copy];
  server = v4->_server;
  v4->_server = (NSString *)v6;

  uint64_t v8 = [(CBSProxyServer *)self port];
  uint64_t v9 = [v8 copy];
  port = v4->_port;
  v4->_port = (NSNumber *)v9;

  id v11 = [(CBSProxyServer *)self token];
  uint64_t v12 = [v11 copy];
  token = v4->_token;
  v4->_token = (NSString *)v12;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CBSProxyServer *)a3;
  char v5 = self == v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v4;
    id v7 = [(CBSProxyServer *)self server];
    uint64_t v8 = [(CBSProxyServer *)v6 server];
    char v9 = [v7 isEqualToString:v8];

    uint64_t v10 = [(CBSProxyServer *)self port];
    id v11 = [(CBSProxyServer *)v6 port];
    char v12 = [v10 isEqualToNumber:v11];

    objc_super v13 = [(CBSProxyServer *)self token];
    if (v13 || ([(CBSProxyServer *)v6 token], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(CBSProxyServer *)self token];
      objc_super v15 = [(CBSProxyServer *)v6 token];
      char v16 = [v14 isEqualToString:v15];

      if (v13)
      {
LABEL_8:

        char v5 = v9 & v12 & v16;
        goto LABEL_9;
      }
    }
    else
    {
      char v16 = 1;
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end