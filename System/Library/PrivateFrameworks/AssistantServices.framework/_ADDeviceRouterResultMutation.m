@interface _ADDeviceRouterResultMutation
- (BOOL)isDirty;
- (_ADDeviceRouterResultMutation)initWithBase:(id)a3;
- (id)getCommandRelayProxyIdentifier;
- (id)getContextIdentifier;
- (id)getError;
- (id)getPeerInfo;
- (int64_t)getProximity;
- (void)setCommandRelayProxyIdentifier:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setPeerInfo:(id)a3;
- (void)setProximity:(int64_t)a3;
@end

@implementation _ADDeviceRouterResultMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_commandRelayProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setError:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getError
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_error;
  }
  else
  {
    v2 = [(ADDeviceRouterResult *)self->_base error];
  }
  return v2;
}

- (void)setCommandRelayProxyIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getCommandRelayProxyIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_commandRelayProxyIdentifier;
  }
  else
  {
    v2 = [(ADDeviceRouterResult *)self->_base commandRelayProxyIdentifier];
  }
  return v2;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getProximity
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_proximity;
  }
  else {
    return [(ADDeviceRouterResult *)self->_base proximity];
  }
}

- (void)setContextIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getContextIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_contextIdentifier;
  }
  else
  {
    v2 = [(ADDeviceRouterResult *)self->_base contextIdentifier];
  }
  return v2;
}

- (void)setPeerInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getPeerInfo
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_peerInfo;
  }
  else
  {
    v2 = [(ADDeviceRouterResult *)self->_base peerInfo];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADDeviceRouterResultMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADDeviceRouterResultMutation;
  v6 = [(_ADDeviceRouterResultMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end