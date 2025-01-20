@interface NENexusPathFlow
- (id)clientIdentifier;
- (id)endpoint;
- (id)initWithPath:(id *)a1;
- (id)parameters;
@end

@implementation NENexusPathFlow

- (void).cxx_destruct
{
}

- (id)clientIdentifier
{
  if (self)
  {
    self = (NENexusPathFlow *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (id)[(NENexusPathFlow *)self clientID];
}

- (id)parameters
{
  if (self)
  {
    self = (NENexusPathFlow *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return [(NENexusPathFlow *)self parameters];
}

- (id)endpoint
{
  if (self)
  {
    self = (NENexusPathFlow *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return [(NENexusPathFlow *)self endpoint];
}

- (id)initWithPath:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)NENexusPathFlow;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (v5)
    {
      a1 = v5;
      objc_storeStrong(v5 + 5, a2);
      v6 = [v4 clientID];
      -[NENexusFlow setupFlowProtocolWithUUID:](a1, v6);
    }
    else
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v8[0] = 0;
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v8, 2u);
      }
      a1 = 0;
    }
  }
  return a1;
}

@end