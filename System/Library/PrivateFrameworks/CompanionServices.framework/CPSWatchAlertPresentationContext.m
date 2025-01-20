@interface CPSWatchAlertPresentationContext
- (CPSRestrictedAccessRequest)restrictedAccessRequest;
- (CPSStoreAuthenticationRequest)storeAuthenticationRequest;
- (CPSSystemAuthenticationRequest)systemAuthenticationRequest;
- (CPSWatchAlertPresentationContext)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (NSString)deviceName;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setRestrictedAccessRequest:(id)a3;
- (void)setStoreAuthenticationRequest:(id)a3;
- (void)setSystemAuthenticationRequest:(id)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation CPSWatchAlertPresentationContext

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_systemAuthenticationRequest withName:@"systemAuthenticationRequest"];
  id v5 = (id)[v3 appendObject:self->_restrictedAccessRequest withName:@"restrictedAccessRequest"];
  id v6 = (id)[v3 appendObject:self->_storeAuthenticationRequest withName:@"storeAuthenticationRequest"];
  id v7 = (id)[v3 appendObject:self->_xpcEndpoint withName:@"xpcEndpoint"];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (CPSWatchAlertPresentationContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSWatchAlertPresentationContext;
  id v5 = [(CPSWatchAlertPresentationContext *)&v16 init];
  if (v5)
  {
    id v6 = [MEMORY[0x263F29D08] coderWithMessage:v4];
    uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"systemAuthenticationRequest"];
    systemAuthenticationRequest = v5->_systemAuthenticationRequest;
    v5->_systemAuthenticationRequest = (CPSSystemAuthenticationRequest *)v7;

    uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"restrictedAccessRequest"];
    restrictedAccessRequest = v5->_restrictedAccessRequest;
    v5->_restrictedAccessRequest = (CPSRestrictedAccessRequest *)v9;

    uint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"storeAuthenticationRequest"];
    storeAuthenticationRequest = v5->_storeAuthenticationRequest;
    v5->_storeAuthenticationRequest = (CPSStoreAuthenticationRequest *)v11;

    uint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"xpcEndpoint"];
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v13;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = [MEMORY[0x263F29D08] coderWithMessage:a3];
  [v4 encodeObject:self->_systemAuthenticationRequest forKey:@"systemAuthenticationRequest"];
  [v4 encodeObject:self->_restrictedAccessRequest forKey:@"restrictedAccessRequest"];
  [v4 encodeObject:self->_storeAuthenticationRequest forKey:@"storeAuthenticationRequest"];
  [v4 encodeObject:self->_xpcEndpoint forKey:@"xpcEndpoint"];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (CPSSystemAuthenticationRequest)systemAuthenticationRequest
{
  return self->_systemAuthenticationRequest;
}

- (void)setSystemAuthenticationRequest:(id)a3
{
}

- (CPSRestrictedAccessRequest)restrictedAccessRequest
{
  return self->_restrictedAccessRequest;
}

- (void)setRestrictedAccessRequest:(id)a3
{
}

- (CPSStoreAuthenticationRequest)storeAuthenticationRequest
{
  return self->_storeAuthenticationRequest;
}

- (void)setStoreAuthenticationRequest:(id)a3
{
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_restrictedAccessRequest, 0);
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end