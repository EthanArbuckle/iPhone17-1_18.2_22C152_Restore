@interface _ADRapportLinkConfigurationMutation
- (BOOL)isDirty;
- (_ADRapportLinkConfigurationMutation)initWithBase:(id)a3;
- (id)getConnectionOptions;
- (id)getDiscoveryOptions;
- (id)getTransportOptions;
- (int64_t)getEnablesProximityTracking;
- (void)setConnectionOptions:(id)a3;
- (void)setDiscoveryOptions:(id)a3;
- (void)setEnablesProximityTracking:(int64_t)a3;
- (void)setTransportOptions:(id)a3;
@end

@implementation _ADRapportLinkConfigurationMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionOptions, 0);
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_discoveryOptions, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setEnablesProximityTracking:(int64_t)a3
{
  self->_enablesProximityTracking = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getEnablesProximityTracking
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_enablesProximityTracking;
  }
  else {
    return [(ADRapportLinkConfiguration *)self->_base enablesProximityTracking];
  }
}

- (void)setConnectionOptions:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getConnectionOptions
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_connectionOptions;
  }
  else
  {
    v2 = [(ADRapportLinkConfiguration *)self->_base connectionOptions];
  }
  return v2;
}

- (void)setTransportOptions:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getTransportOptions
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_transportOptions;
  }
  else
  {
    v2 = [(ADRapportLinkConfiguration *)self->_base transportOptions];
  }
  return v2;
}

- (void)setDiscoveryOptions:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getDiscoveryOptions
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_discoveryOptions;
  }
  else
  {
    v2 = [(ADRapportLinkConfiguration *)self->_base discoveryOptions];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADRapportLinkConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADRapportLinkConfigurationMutation;
  v6 = [(_ADRapportLinkConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end