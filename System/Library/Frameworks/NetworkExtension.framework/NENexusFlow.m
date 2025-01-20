@interface NENexusFlow
- (NSUUID)clientIdentifier;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (nw_protocol)protocol;
- (unint64_t)state;
- (void)dealloc;
- (void)setProtocol:(nw_protocol *)a3;
- (void)setState:(unint64_t)a3;
- (void)setupFlowProtocolWithUUID:(void *)a1;
@end

@implementation NENexusFlow

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);

  objc_storeStrong((id *)&self->_nexusInstance, 0);
}

- (void)setProtocol:(nw_protocol *)a3
{
  self->_protocol = a3;
}

- (nw_protocol)protocol
{
  return self->_protocol;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUUID)clientIdentifier
{
  return 0;
}

- (NWParameters)parameters
{
  return 0;
}

- (NWEndpoint)endpoint
{
  return 0;
}

- (void)dealloc
{
  if ([(NENexusFlow *)self protocol])
  {
    free([(NENexusFlow *)self protocol]);
    [(NENexusFlow *)self setProtocol:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)NENexusFlow;
  [(NENexusFlow *)&v3 dealloc];
}

- (void)setupFlowProtocolWithUUID:(void *)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A0040C9AB51B7uLL);
  if (v4)
  {
    v5 = v4;
    v4[2] = &NENexusFlowIdentifier;
    v4[3] = &NENexusFlowCallbacks;
    [v3 getUUIDBytes:v4];
    v5[5] = a1;
    [a1 setProtocol:v5];
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 64;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "calloc(%zu) failed", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end