@interface MCAPNInfo
- (NSNumber)proxyPort;
- (NSString)apnName;
- (NSString)password;
- (NSString)proxy;
- (NSString)username;
- (id)defaultsRepresentation;
- (id)description;
- (id)strippedDefaultsRepresentation;
- (void)setApnName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setProxy:(id)a3;
- (void)setProxyPort:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MCAPNInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = v3;
  if (self->_apnName) {
    [v3 appendFormat:@"APN Name      : %@\n", self->_apnName];
  }
  if (self->_username) {
    [v4 appendFormat:@"Username      : %@\n", self->_username];
  }
  if (self->_password) {
    [v4 appendFormat:@"Password      : (set)\n"];
  }
  if (self->_proxy) {
    [v4 appendFormat:@"Proxy         : %@\n", self->_proxy];
  }
  if (self->_proxyPort) {
    [v4 appendFormat:@"Proxy Port    : %@\n", self->_proxyPort];
  }
  return v4;
}

- (id)strippedDefaultsRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  apnName = self->_apnName;
  if (apnName)
  {
    v9 = @"apn";
    v10[0] = apnName;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v5 = (void *)[v4 mutableCopy];

    username = self->_username;
    if (username) {
      [v5 setObject:username forKeyedSubscript:@"username"];
    }
    v7 = (void *)[v5 copy];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)defaultsRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  apnName = self->_apnName;
  if (apnName) {
    [v3 setObject:apnName forKey:@"apn"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"username"];
  }
  password = self->_password;
  if (password) {
    [v4 setObject:password forKey:@"password"];
  }
  if (self->_proxy)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    [v8 setObject:v9 forKey:*MEMORY[0x1E4F41E48]];

    v10 = [MEMORY[0x1E4F28ED0] numberWithInt:1];
    [v8 setObject:v10 forKey:*MEMORY[0x1E4F41E60]];

    [v8 setObject:self->_proxy forKey:*MEMORY[0x1E4F41E58]];
    [v8 setObject:self->_proxy forKey:*MEMORY[0x1E4F41E70]];
    proxyPort = self->_proxyPort;
    if (proxyPort)
    {
      [v8 setObject:proxyPort forKey:*MEMORY[0x1E4F41E50]];
      [v8 setObject:self->_proxyPort forKey:*MEMORY[0x1E4F41E68]];
    }
    [v4 setObject:v8 forKey:@"ProxyConfiguration"];
  }
  return v4;
}

- (NSString)apnName
{
  return self->_apnName;
}

- (void)setApnName:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (NSNumber)proxyPort
{
  return self->_proxyPort;
}

- (void)setProxyPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyPort, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_apnName, 0);
}

@end