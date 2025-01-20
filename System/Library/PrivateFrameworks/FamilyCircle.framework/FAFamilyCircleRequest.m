@interface FAFamilyCircleRequest
- (FAFamilyCircleRequest)init;
- (FAFamilyCircleRequest)initWithConnectionProvider:(id)a3;
- (FAFamilyCircleRequestConnectionProvider)connectionProvider;
- (NSString)passwordOrToken;
- (NSString)usernameOrDSID;
- (id)requestOptions;
- (id)serviceConnection;
- (id)serviceRemoteObjectWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectWithErrorHandler:(id)a3;
- (void)setConnectionProvider:(id)a3;
- (void)setPasswordOrToken:(id)a3;
- (void)setUsernameOrDSID:(id)a3;
@end

@implementation FAFamilyCircleRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_passwordOrToken, 0);
  objc_storeStrong((id *)&self->_usernameOrDSID, 0);
}

- (FAFamilyCircleRequest)init
{
  v3 = +[_FAFamilyCircleRequestConnectionProvider sharedInstance];
  v4 = [(FAFamilyCircleRequest *)self initWithConnectionProvider:v3];

  return v4;
}

- (FAFamilyCircleRequest)initWithConnectionProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FAFamilyCircleRequest;
  v6 = [(FAFamilyCircleRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (id)serviceRemoteObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FAFamilyCircleRequest *)self serviceConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)serviceConnection
{
  v2 = [(FAFamilyCircleRequest *)self connectionProvider];
  v3 = [v2 serviceConnection];

  return v3;
}

- (FAFamilyCircleRequestConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (id)requestOptions
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(FAFamilyCircleRequest *)self usernameOrDSID];
  [v3 setObject:v4 forKeyedSubscript:@"Username"];

  id v5 = [(FAFamilyCircleRequest *)self passwordOrToken];
  [v3 setObject:v5 forKeyedSubscript:@"Password"];

  v6 = [MEMORY[0x1E4F28F80] processInfo];
  v7 = [v6 processName];
  [v3 setObject:v7 forKeyedSubscript:@"ClientProcess"];

  v8 = (void *)[v3 copy];
  return v8;
}

- (NSString)usernameOrDSID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)passwordOrToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)synchronousRemoteObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FAFamilyCircleRequest *)self serviceConnection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)setUsernameOrDSID:(id)a3
{
}

- (void)setPasswordOrToken:(id)a3
{
}

- (void)setConnectionProvider:(id)a3
{
}

@end