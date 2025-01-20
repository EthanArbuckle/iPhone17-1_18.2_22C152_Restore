@interface NENexusFlowDivertFlow
- (id)clientIdentifier;
- (id)endpoint;
- (id)parameters;
- (void)dealloc;
@end

@implementation NENexusFlowDivertFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalParameters, 0);
  objc_storeStrong((id *)&self->_internalEndpoint, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

- (id)clientIdentifier
{
  if (self)
  {
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return self;
}

- (id)parameters
{
  if (self)
  {
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 56, 1);
    uint64_t v2 = vars8;
  }
  return self;
}

- (id)endpoint
{
  if (self)
  {
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 48, 1);
    uint64_t v2 = vars8;
  }
  return self;
}

- (void)dealloc
{
  if (self)
  {
    flowDivertFlow = self->_flowDivertFlow;
    if (flowDivertFlow)
    {
      CFRelease(flowDivertFlow);
      self->_flowDivertFlow = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NENexusFlowDivertFlow;
  [(NENexusFlow *)&v4 dealloc];
}

@end