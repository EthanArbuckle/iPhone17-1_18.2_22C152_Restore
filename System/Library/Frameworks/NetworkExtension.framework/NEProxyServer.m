@interface NEProxyServer
+ (BOOL)supportsSecureCoding;
- (BOOL)authenticationRequired;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)needToUpdateKeychain;
- (NEProxyServer)initWithAddress:(NSString *)address port:(NSInteger)port;
- (NEProxyServer)initWithCoder:(id)a3;
- (NEProxyServer)initWithType:(int64_t)a3 address:(id)a4 port:(int64_t)a5;
- (NSInteger)port;
- (NSString)address;
- (NSString)password;
- (NSString)username;
- (id)copyPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)type;
- (void)copyProtectionSpace;
- (void)encodeWithCoder:(id)a3;
- (void)removeFromKeychain;
- (void)setAuthenticationRequired:(BOOL)authenticationRequired;
- (void)setPassword:(NSString *)password;
- (void)setType:(int64_t)a3;
- (void)setUsername:(NSString *)username;
- (void)syncWithKeychain;
@end

@implementation NEProxyServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setPassword:(NSString *)password
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAuthenticationRequired:(BOOL)authenticationRequired
{
  self->_authenticationRequired = authenticationRequired;
}

- (BOOL)authenticationRequired
{
  return self->_authenticationRequired;
}

- (NSInteger)port
{
  return self->_port;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)copyPassword
{
  v2 = -[NEProxyServer copyProtectionSpace](self);
  if (v2)
  {
    v3 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
    v4 = [v3 defaultCredentialForProtectionSpace:v2];

    if (v4)
    {
      v5 = [v4 password];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)copyProtectionSpace
{
  v1 = a1;
  if (a1)
  {
    unint64_t v2 = [a1 type] - 1;
    if (v2 <= 4 && ((0x17u >> v2) & 1) != 0)
    {
      id v3 = **((id **)&unk_1E5992C00 + v2);
      if (v3)
      {
        v5 = [v1 address];
        uint64_t v6 = [v5 length];

        if (v6)
        {
          id v7 = objc_alloc(MEMORY[0x1E4F290B8]);
          v8 = [v1 address];
          uint64_t v9 = [v1 port];
          v1 = (void *)[v7 initWithProxyHost:v8 port:v9 type:v3 realm:0 authenticationMethod:*MEMORY[0x1E4F28970]];

          goto LABEL_6;
        }
      }
    }
    else
    {
      id v3 = 0;
    }
    v1 = 0;
LABEL_6:
  }
  return v1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = [(NEProxyServer *)self type] - 2;
  if (v8 > 4) {
    uint64_t v9 = @"http";
  }
  else {
    uint64_t v9 = off_1E5992BD8[v8];
  }
  [v7 appendPrettyObject:v9 withName:@"type" andIndent:v5 options:a4];
  v10 = [(NEProxyServer *)self address];
  unint64_t v11 = a4 | 1;
  [v7 appendPrettyObject:v10 withName:@"address" andIndent:v5 options:a4 | 1];

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", (int)-[NEProxyServer port](self, "port"), @"port", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxyServer authenticationRequired](self, "authenticationRequired"), @"authenticationRequired", v5, a4);
  v12 = [(NEProxyServer *)self username];
  [v7 appendPrettyObject:v12 withName:@"username" andIndent:v5 options:v11];

  v13 = [(NEProxyServer *)self password];
  [v7 appendPrettyObject:v13 withName:@"password" andIndent:v5 options:v11];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEProxyServer *)self address];

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing proxy server address", v4);
  }

  return v5 != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NEProxyServer allocWithZone:a3];
  int64_t v5 = [(NEProxyServer *)self type];
  uint64_t v6 = [(NEProxyServer *)self address];
  id v7 = [(NEProxyServer *)v4 initWithType:v5 address:v6 port:[(NEProxyServer *)self port]];

  [(NEProxyServer *)v7 setAuthenticationRequired:[(NEProxyServer *)self authenticationRequired]];
  unint64_t v8 = [(NEProxyServer *)self username];
  [(NEProxyServer *)v7 setUsername:v8];

  uint64_t v9 = [(NEProxyServer *)self password];
  [(NEProxyServer *)v7 setPassword:v9];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProxyServer type](self, "type"), @"Type");
  int64_t v5 = [(NEProxyServer *)self address];
  [v4 encodeObject:v5 forKey:@"Address"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProxyServer port](self, "port"), @"Port");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxyServer authenticationRequired](self, "authenticationRequired"), @"AuthenticationRequired");
  uint64_t v6 = [(NEProxyServer *)self username];
  [v4 encodeObject:v6 forKey:@"Username"];

  id v7 = [(NEProxyServer *)self password];
  [v4 encodeObject:v7 forKey:@"Password"];
}

- (NEProxyServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEProxyServer;
  int64_t v5 = [(NEProxyServer *)&v13 init];
  if (v5)
  {
    v5->_type = (int)[v4 decodeInt32ForKey:@"Type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    v5->_port = (int)[v4 decodeInt32ForKey:@"Port"];
    v5->_authenticationRequired = [v4 decodeBoolForKey:@"AuthenticationRequired"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Username"];
    username = v5->_username;
    v5->_username = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Password"];
    password = v5->_password;
    v5->_password = (NSString *)v10;
  }
  return v5;
}

- (NEProxyServer)initWithType:(int64_t)a3 address:(id)a4 port:(int64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NEProxyServer;
  uint64_t v9 = [(NEProxyServer *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    uint64_t v11 = [v8 copy];
    address = v10->_address;
    v10->_address = (NSString *)v11;

    v10->_port = a5;
  }

  return v10;
}

- (NEProxyServer)initWithAddress:(NSString *)address port:(NSInteger)port
{
  return [(NEProxyServer *)self initWithType:1 address:address port:port];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)syncWithKeychain
{
  if (!a1) {
    return;
  }
  id v11 = -[NEProxyServer copyProtectionSpace](a1);
  if (!v11) {
    goto LABEL_13;
  }
  if ([a1 authenticationRequired])
  {
    unint64_t v2 = [a1 password];
    if ([v2 length])
    {
      id v3 = [a1 username];
      uint64_t v4 = [v3 length];

      if (v4)
      {
        id v5 = objc_alloc(MEMORY[0x1E4F29098]);
        uint64_t v6 = [a1 username];
        id v7 = [a1 password];
        id v8 = (void *)[v5 initWithUser:v6 password:v7 persistence:2];

        if (v8)
        {
          uint64_t v9 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
          [v9 setDefaultCredential:v8 forProtectionSpace:v11];
LABEL_12:

          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  if (([a1 authenticationRequired] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
    id v8 = [v10 defaultCredentialForProtectionSpace:v11];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
      [v9 removeCredential:v8 forProtectionSpace:v11];
      goto LABEL_12;
    }
  }
LABEL_13:
  [a1 setPassword:0];
}

- (BOOL)needToUpdateKeychain
{
  BOOL v1 = (BOOL)a1;
  if (a1)
  {
    unint64_t v2 = [a1 password];
    if (v2)
    {
      id v3 = [(id)v1 password];
      BOOL v1 = [v3 length] != 0;
    }
    else
    {
      BOOL v1 = 0;
    }
  }
  return v1;
}

- (void)removeFromKeychain
{
  if (a1)
  {
    BOOL v1 = -[NEProxyServer copyProtectionSpace](a1);
    if (v1)
    {
      id v5 = v1;
      unint64_t v2 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
      id v3 = [v2 defaultCredentialForProtectionSpace:v5];

      if (v3)
      {
        uint64_t v4 = [MEMORY[0x1E4F290A0] sharedCredentialStorage];
        [v4 removeCredential:v3 forProtectionSpace:v5];
      }
      BOOL v1 = v5;
    }
  }
}

@end