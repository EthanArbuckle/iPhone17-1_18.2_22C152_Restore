@interface _BMXPCConnection
- (id)_errorDescription;
- (id)_initWithConnection:(id)a3 queue:(id)a4 flags:(unint64_t)a5;
- (id)bm_transport;
- (void)_setTargetUserIdentifier:(unsigned int)a3;
@end

@implementation _BMXPCConnection

- (id)bm_transport
{
  return self->_transport;
}

- (id)_initWithConnection:(id)a3 queue:(id)a4 flags:(unint64_t)a5
{
  v8 = (_xpc_connection_s *)a3;
  id v9 = a4;
  v10 = [[_BMXPCTransport alloc] initWithConnection:v8];
  v16.receiver = self;
  v16.super_class = (Class)_BMXPCConnection;
  v11 = (id *)[(_BMXPCConnection *)&v16 _initWithCustomTransport:v10];
  v12 = v11;
  if (v11)
  {
    if (v9) {
      [v11 _setQueue:v9];
    }
    name = xpc_connection_get_name(v8);
    if (name)
    {
      v14 = [NSString stringWithUTF8String:name];
    }
    else
    {
      v14 = 0;
    }
    objc_storeStrong(v12 + 20, v14);
    if (name) {

    }
    objc_storeStrong(v12 + 21, v10);
    v12[22] = (id)a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
}

- (id)_errorDescription
{
  uint64_t v3 = [(_BMXPCTransport *)self->_transport processIdentifier];
  if (self->_flags)
  {
    if (v3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @" from pid %d", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_1F0B3A038;
    }
    serviceName = self->_serviceName;
    if (serviceName && [(NSString *)serviceName length])
    {
      [NSString stringWithFormat:@"connection%@ on mach service named %@", v4, self->_serviceName];
    }
    else
    {
      if ((self->_flags & 4) != 0) {
        v6 = @"serviceListener";
      }
      else {
        v6 = @"anonymousListener";
      }
      [NSString stringWithFormat:@"connection%@ on %@", v4, v6];
    }
  }
  else
  {
    if (v3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @" with pid %d", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_1F0B3A038;
    }
    if ((self->_flags & 2) != 0) {
      [NSString stringWithFormat:@"connection to service%@ created from an endpoint", v4, v9];
    }
    else {
      [NSString stringWithFormat:@"connection to service%@ named %@", v4, self->_serviceName];
    }
  v7 = };

  return v7;
}

@end