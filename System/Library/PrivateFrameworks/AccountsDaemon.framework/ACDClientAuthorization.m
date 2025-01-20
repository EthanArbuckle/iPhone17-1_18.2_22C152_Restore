@interface ACDClientAuthorization
- (ACDClient)client;
- (BOOL)isGranted;
- (NSDictionary)options;
- (NSSet)grantedPermissions;
- (id)initForClient:(id)a3;
- (void)setClient:(id)a3;
- (void)setGrantedPermissions:(id)a3;
- (void)setIsGranted:(BOOL)a3;
- (void)setOptions:(id)a3;
@end

@implementation ACDClientAuthorization

- (id)initForClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDClientAuthorization;
  v6 = [(ACDClientAuthorization *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (BOOL)isGranted
{
  return self->_isGranted;
}

- (void)setIsGranted:(BOOL)a3
{
  self->_isGranted = a3;
}

- (ACDClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSSet)grantedPermissions
{
  return self->_grantedPermissions;
}

- (void)setGrantedPermissions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_grantedPermissions, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end