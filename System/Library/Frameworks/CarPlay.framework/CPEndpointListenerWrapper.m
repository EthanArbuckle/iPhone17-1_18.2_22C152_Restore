@interface CPEndpointListenerWrapper
- (CPEndpointListenerWrapper)initWithXPCDictionary:(id)a3;
- (CPEndpointListenerWrapper)initWithXPCEndpoint:(id)a3;
- (OS_xpc_object)endpoint;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setEndpoint:(id)a3;
@end

@implementation CPEndpointListenerWrapper

- (CPEndpointListenerWrapper)initWithXPCEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPEndpointListenerWrapper;
  v6 = [(CPEndpointListenerWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endpoint, a3);
  }

  return v7;
}

- (CPEndpointListenerWrapper)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPEndpointListenerWrapper;
  id v5 = [(CPEndpointListenerWrapper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = xpc_dictionary_get_value(v4, "endpoint");
    endpoint = v5->_endpoint;
    v5->_endpoint = (OS_xpc_object *)v6;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end