@interface CRKConcreteNetworkInterface
- (CRKConcreteNetworkInterface)initWithUnderlyingInterface:(id)a3;
- (CRKNetworkEndpoint)ipv4Endpoint;
- (CRKNetworkEndpoint)ipv6Endpoint;
- (NSString)name;
- (OS_nw_interface)underlyingInterface;
- (id)makeLocalEndpointForRemoteEndpointWithHost:(id)a3 port:(id)a4;
@end

@implementation CRKConcreteNetworkInterface

- (CRKConcreteNetworkInterface)initWithUnderlyingInterface:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkInterface;
  v6 = [(CRKConcreteNetworkInterface *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingInterface, a3);
  }

  return v7;
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__CRKConcreteNetworkInterface_name__block_invoke;
    v7[3] = &unk_2646F4EE0;
    v7[4] = self;
    __35__CRKConcreteNetworkInterface_name__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_name;
    self->_name = v4;

    name = self->_name;
  }

  return name;
}

uint64_t __35__CRKConcreteNetworkInterface_name__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) underlyingInterface];
  name = nw_interface_get_name(v1);

  v3 = NSString;

  return [v3 stringWithUTF8String:name];
}

- (CRKNetworkEndpoint)ipv4Endpoint
{
  p_ipv4Endpoint = &self->_ipv4Endpoint;
  ipv4Endpoint = self->_ipv4Endpoint;
  if (!ipv4Endpoint)
  {
    objc_storeStrong((id *)p_ipv4Endpoint, [(CRKConcreteNetworkInterface *)self makeLocalEndpointForRemoteEndpointWithHost:@"0.0.0.0" port:@"0"]);
    ipv4Endpoint = self->_ipv4Endpoint;
  }

  return ipv4Endpoint;
}

uint64_t __43__CRKConcreteNetworkInterface_ipv4Endpoint__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeLocalEndpointForRemoteEndpointWithHost:@"0.0.0.0" port:@"0"];
}

- (CRKNetworkEndpoint)ipv6Endpoint
{
  p_ipv6Endpoint = &self->_ipv6Endpoint;
  ipv6Endpoint = self->_ipv6Endpoint;
  if (!ipv6Endpoint)
  {
    objc_storeStrong((id *)p_ipv6Endpoint, [(CRKConcreteNetworkInterface *)self makeLocalEndpointForRemoteEndpointWithHost:@"::" port:@"0"]);
    ipv6Endpoint = self->_ipv6Endpoint;
  }

  return ipv6Endpoint;
}

uint64_t __43__CRKConcreteNetworkInterface_ipv6Endpoint__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeLocalEndpointForRemoteEndpointWithHost:@"::" port:@"0"];
}

- (id)makeLocalEndpointForRemoteEndpointWithHost:(id)a3 port:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (const char *)[v6 UTF8String];
  id v9 = v7;
  v10 = (const char *)[v9 UTF8String];

  nw_endpoint_t host = nw_endpoint_create_host(v8, v10);
  if (host)
  {
    v12 = [(CRKConcreteNetworkInterface *)self underlyingInterface];
    v13 = (void *)nw_interface_copy_local_address_for_remote_address();

    if (v13) {
      v14 = [[CRKConcreteNetworkEndpoint alloc] initWithUnderlyingEndpoint:v13];
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (OS_nw_interface)underlyingInterface
{
  return self->_underlyingInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingInterface, 0);
  objc_storeStrong((id *)&self->_ipv6Endpoint, 0);
  objc_storeStrong((id *)&self->_ipv4Endpoint, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end