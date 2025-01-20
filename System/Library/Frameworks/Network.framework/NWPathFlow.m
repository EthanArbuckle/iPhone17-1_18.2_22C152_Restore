@interface NWPathFlow
- (BOOL)isAssigned;
- (BOOL)isDefunct;
- (BOOL)isDirect;
- (BOOL)isLocal;
- (BOOL)isViable;
- (BOOL)supportsIPv4;
- (BOOL)supportsIPv6;
- (NSUUID)flowID;
- (NSUUID)nexusAgent;
- (NSUUID)nexusInstance;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (NWInterface)interface;
- (NWPathFlow)initWithPathFlow:(id)a3;
- (OS_nw_path_flow)internalPathFlow;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)privateDescription;
- (unsigned)nexusPort;
@end

@implementation NWPathFlow

- (void).cxx_destruct
{
}

- (OS_nw_path_flow)internalPathFlow
{
  return (OS_nw_path_flow *)objc_getProperty(self, a2, 8, 1);
}

- (id)privateDescription
{
  id v2 = [(NWPathFlow *)self descriptionWithIndent:0 showFullContent:1];

  return v2;
}

- (id)description
{
  id v2 = [(NWPathFlow *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = [(NWPathFlow *)self flowID];
  [v7 appendPrettyObject:v8 withName:@"flowID" indent:v5 showFullContent:v4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isViable](self, "isViable"), @"isViable", v5);
  objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isAssigned](self, "isAssigned"), @"isAssigned", v5);
  if ([(NWPathFlow *)self isLocal]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isLocal](self, "isLocal"), @"isLocal", v5);
  }
  if ([(NWPathFlow *)self isDirect]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isDirect](self, "isDirect"), @"isDirect", v5);
  }
  if ([(NWPathFlow *)self isDefunct]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow isDefunct](self, "isDefunct"), @"isDefunct", v5);
  }
  if ([(NWPathFlow *)self supportsIPv4]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow supportsIPv4](self, "supportsIPv4"), @"supportsIPv4", v5);
  }
  if ([(NWPathFlow *)self supportsIPv6]) {
    objc_msgSend(v7, "appendPrettyBOOL:withName:indent:", -[NWPathFlow supportsIPv6](self, "supportsIPv6"), @"supportsIPv6", v5);
  }
  v9 = [(NWPathFlow *)self interface];
  [v7 appendPrettyObject:v9 withName:@"interface" indent:v5 showFullContent:v4];

  v10 = [(NWPathFlow *)self localEndpoint];
  [v7 appendPrettyObject:v10 withName:@"localEndpoint" indent:v5 showFullContent:v4];

  v11 = [(NWPathFlow *)self remoteEndpoint];
  [v7 appendPrettyObject:v11 withName:@"remoteEndpoint" indent:v5 showFullContent:v4];

  v12 = [(NWPathFlow *)self nexusAgent];
  if (v12)
  {
    [v7 appendPrettyObject:v12 withName:@"nexusAgent" indent:v5 showFullContent:v4];
    v13 = [(NWPathFlow *)self nexusInstance];
    [v7 appendPrettyObject:v13 withName:@"nexusInstance" indent:v5 showFullContent:v4];

    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWPathFlow nexusPort](self, "nexusPort"), @"nexusPort", v5);
  }

  return v7;
}

- (BOOL)supportsIPv6
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  BOOL has_ipv6 = nw_path_flow_has_ipv6(v2);

  return has_ipv6;
}

- (BOOL)supportsIPv4
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  has_ipBOOL v4 = nw_path_flow_has_ipv4(v2);

  return has_ipv4;
}

- (BOOL)isDefunct
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  char is_defunct = nw_path_flow_is_defunct(v2);

  return is_defunct;
}

- (BOOL)isDirect
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  char is_direct = nw_path_flow_is_direct(v2);

  return is_direct;
}

- (BOOL)isLocal
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  char is_local = nw_path_flow_is_local(v2);

  return is_local;
}

- (BOOL)isAssigned
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  char is_assigned = nw_path_flow_is_assigned(v2);

  return is_assigned;
}

- (BOOL)isViable
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  char is_viable = nw_path_flow_is_viable(v2);

  return is_viable;
}

- (unsigned)nexusPort
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = 0;
  id v2 = [(NWPathFlow *)self internalPathFlow];
  int nexus_instance = nw_path_flow_get_nexus_instance(v2, &v6, &v5);

  if (nexus_instance) {
    return v5;
  }
  else {
    return 0;
  }
}

- (NSUUID)nexusInstance
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v6 = 0uLL;
  id v2 = [(NWPathFlow *)self internalPathFlow];
  int nexus_instance = nw_path_flow_get_nexus_instance(v2, &v6, 0);

  BOOL v4 = 0;
  if (nexus_instance) {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v6];
  }

  return (NSUUID *)v4;
}

- (NSUUID)nexusAgent
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v6 = 0uLL;
  id v2 = [(NWPathFlow *)self internalPathFlow];
  int nexus_agent_uuid = nw_path_flow_get_nexus_agent_uuid(v2, &v6);

  BOOL v4 = 0;
  if (nexus_agent_uuid) {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v6];
  }

  return (NSUUID *)v4;
}

- (NSUUID)flowID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v6 = 0uLL;
  id v2 = [(NWPathFlow *)self internalPathFlow];
  int id = nw_path_flow_get_id(v2, &v6);

  BOOL v4 = 0;
  if (id) {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v6];
  }

  return (NSUUID *)v4;
}

- (NWEndpoint)remoteEndpoint
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  id v3 = nw_path_flow_copy_remote_endpoint(v2);

  if (v3)
  {
    BOOL v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWEndpoint)localEndpoint
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  id v3 = nw_path_flow_copy_local_endpoint(v2);

  if (v3)
  {
    BOOL v4 = +[NWEndpoint endpointWithInternalEndpoint:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NWEndpoint *)v4;
}

- (NWInterface)interface
{
  id v2 = [(NWPathFlow *)self internalPathFlow];
  id v3 = nw_path_flow_copy_interface(v2);

  if (v3) {
    BOOL v4 = [[NWInterface alloc] initWithInterface:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (NWPathFlow)initWithPathFlow:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWPathFlow;
    long long v6 = [(NWPathFlow *)&v23 init];
    if (v6)
    {
      uint64_t v7 = v6;
      objc_storeStrong((id *)&v6->_internalPathFlow, a3);
      goto LABEL_4;
    }
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWPathFlow initWithPathFlow:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWPathFlow initWithPathFlow:]";
          __int16 v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWPathFlow initWithPathFlow:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        v11 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWPathFlow initWithPathFlow:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null pathFlow, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow, no backtrace";
        goto LABEL_29;
      }
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWPathFlow initWithPathFlow:]";
        v13 = "%{public}s called with null pathFlow, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v10) {
    free(v10);
  }

  uint64_t v7 = 0;
LABEL_4:

  return v7;
}

@end