@interface NWInterface
+ (BOOL)supportsSecureCoding;
+ (NWInterface)interfaceWithProtocolBufferData:(id)a3;
+ (id)descriptionForSubtype:(int64_t)a3;
+ (id)descriptionForType:(int64_t)a3;
- (BOOL)hasDNS;
- (BOOL)hasNAT64;
- (BOOL)isConstrained;
- (BOOL)isDeepEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpensive;
- (BOOL)isIPv4Routable;
- (BOOL)isIPv6Routable;
- (BOOL)isShallowEqual:(id)a3;
- (BOOL)isUltraConstrained;
- (BOOL)supportsMulticast;
- (NSString)interfaceName;
- (NSString)privateDescription;
- (NSString)typeString;
- (NWInterface)delegateInterface;
- (NWInterface)initWithCoder:(id)a3;
- (NWInterface)initWithInterface:(id)a3;
- (NWInterface)initWithInterfaceIndex:(unint64_t)a3;
- (NWInterface)initWithInterfaceIndex:(unint64_t)a3 interfaceName:(id)a4;
- (NWInterface)initWithInterfaceName:(id)a3;
- (OS_nw_interface)internalInterface;
- (id)copyLocalAddressForDefaultIPv4;
- (id)copyLocalAddressForDefaultIPv6;
- (id)copyLocalAddressForRemoteAddress:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)ipv4Broadcast;
- (id)ipv4Netmask;
- (int64_t)mtu;
- (int64_t)subtype;
- (int64_t)type;
- (unint64_t)generation;
- (unint64_t)hash;
- (unint64_t)interfaceIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setInternalInterface:(id)a3;
@end

@implementation NWInterface

- (void).cxx_destruct
{
}

- (int64_t)type
{
  v2 = [(NWInterface *)self internalInterface];
  int64_t type = nw_interface_get_type(v2);

  return type;
}

- (OS_nw_interface)internalInterface
{
  return (OS_nw_interface *)objc_getProperty(self, a2, 8, 1);
}

- (NWInterface)initWithInterfaceName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = nw_interface_create_with_name((char *)[v4 UTF8String]);
    if (v6)
    {
      self = [(NWInterface *)self initWithInterface:v6];
      v7 = self;
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v20 = "-[NWInterface initWithInterfaceName:]";
        __int16 v21 = 2114;
        v22 = v5;
        _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_ERROR, "%{public}s nw_interface_create_with_name(%{public}@) failed", buf, 0x16u);
      }

      v7 = 0;
    }

    goto LABEL_8;
  }
  v10 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWInterface initWithInterfaceName:]";
  v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v11, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v12 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v14 = "%{public}s called with null interfaceName";
LABEL_22:
        _os_log_impl(&dword_1830D4000, v12, v13, v14, buf, 0xCu);
      }
    }
    else
    {
      if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v12 = __nwlog_obj();
        os_log_type_t v13 = type;
        BOOL v16 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136446466;
            v20 = "-[NWInterface initWithInterfaceName:]";
            __int16 v21 = 2082;
            v22 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s called with null interfaceName, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v16) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v14 = "%{public}s called with null interfaceName, no backtrace";
        goto LABEL_22;
      }
      v12 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWInterface initWithInterfaceName:]";
        v14 = "%{public}s called with null interfaceName, backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:
  }
LABEL_24:
  if (v11) {
    free(v11);
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (NWInterface)initWithInterface:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWInterface;
    v6 = [(NWInterface *)&v23 init];
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalInterface, a3);
      goto LABEL_4;
    }
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWInterface initWithInterface:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      BOOL v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      BOOL v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      BOOL v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    v7 = 0;
    goto LABEL_4;
  }
  v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWInterface initWithInterface:]";
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
        v27 = "-[NWInterface initWithInterface:]";
        os_log_type_t v13 = "%{public}s called with null interface";
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
            v27 = "-[NWInterface initWithInterface:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null interface, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        os_log_type_t v13 = "%{public}s called with null interface, no backtrace";
        goto LABEL_29;
      }
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWInterface initWithInterface:]";
        os_log_type_t v13 = "%{public}s called with null interface, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v10) {
    free(v10);
  }

  v7 = 0;
LABEL_4:

  return v7;
}

- (void)setInternalInterface:(id)a3
{
}

- (id)createProtocolBufferObject
{
  v3 = objc_alloc_init(NWPBInterface);
  v4 = [(NWInterface *)self interfaceName];
  id v5 = v4;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_name, v4);

    unsigned int v6 = [(NWInterface *)self interfaceIndex];
    *(unsigned char *)&v3->_has |= 4u;
    v3->_index = v6;
  }
  else
  {

    [(NWInterface *)self interfaceIndex];
  }
  v7 = [(NWInterface *)self delegateInterface];
  unsigned int v8 = [v7 interfaceIndex];
  if (v3)
  {
    *(unsigned char *)&v3->_has |= 1u;
    v3->_delegateIndex = v8;

    unsigned int v9 = [(NWInterface *)self mtu];
    *(unsigned char *)&v3->_has |= 8u;
    v3->_mtu = v9;
    unsigned int v10 = [(NWInterface *)self generation];
    *(unsigned char *)&v3->_has |= 2u;
    v3->_generation = v10;
    int v11 = [(NWInterface *)self type];
    *(unsigned char *)&v3->_has |= 0x20u;
    v3->_os_log_type_t type = v11;
    int v12 = [(NWInterface *)self subtype];
    *(unsigned char *)&v3->_has |= 0x10u;
    v3->_subos_log_type_t type = v12;
    BOOL v13 = [(NWInterface *)self isExpensive];
    *(unsigned char *)&v3->_has |= 0x40u;
    v3->_expensive = v13;
  }
  else
  {

    [(NWInterface *)self mtu];
    [(NWInterface *)self generation];
    [(NWInterface *)self type];
    [(NWInterface *)self subtype];
    [(NWInterface *)self isExpensive];
  }
  return v3;
}

- (NSString)typeString
{
  v2 = [(NWInterface *)self internalInterface];
  v3 = +[NWInterface descriptionForType:nw_interface_get_type(v2)];

  return (NSString *)v3;
}

- (BOOL)isDeepEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(NWInterface *)self internalInterface];
  unsigned int v6 = [v4 internalInterface];

  LOBYTE(v4) = nw_interface_deep_compare(v5, v6);
  return (char)v4;
}

- (BOOL)isShallowEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(NWInterface *)self internalInterface];
  unsigned int v6 = [v4 internalInterface];

  LOBYTE(v4) = nw_interface_shallow_compare(v5, v6);
  return (char)v4;
}

- (id)ipv4Broadcast
{
  v2 = [(NWInterface *)self internalInterface];
  nw_endpoint_t v3 = nw_interface_copy_ipv4_broadcast_endpoint(v2);

  if (v3)
  {
    id v4 = +[NWEndpoint endpointWithCEndpoint:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)ipv4Netmask
{
  v2 = [(NWInterface *)self internalInterface];
  nw_endpoint_t v3 = nw_interface_copy_ipv4_netmask_endpoint(v2);

  if (v3)
  {
    id v4 = +[NWEndpoint endpointWithCEndpoint:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NWInterface)delegateInterface
{
  v2 = [(NWInterface *)self internalInterface];
  nw_endpoint_t v3 = nw_interface_copy_delegate_interface(v2);

  if (v3) {
    id v4 = [[NWInterface alloc] initWithInterfaceIndex:v3->index];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)generation
{
  v2 = [(NWInterface *)self internalInterface];
  unint64_t generation = nw_interface_get_generation(v2);

  return generation;
}

- (int64_t)mtu
{
  v2 = [(NWInterface *)self internalInterface];
  int64_t mtu = (int)nw_interface_get_mtu(v2);

  return mtu;
}

- (BOOL)isIPv6Routable
{
  v2 = [(NWInterface *)self internalInterface];
  char is_ipv6_routable = nw_interface_is_ipv6_routable(v2);

  return is_ipv6_routable;
}

- (BOOL)isIPv4Routable
{
  v2 = [(NWInterface *)self internalInterface];
  char is_ipv4_routable = nw_interface_is_ipv4_routable(v2);

  return is_ipv4_routable;
}

- (BOOL)hasNAT64
{
  v2 = [(NWInterface *)self internalInterface];
  char has_nat64 = nw_interface_has_nat64(v2);

  return has_nat64;
}

- (BOOL)hasDNS
{
  v2 = [(NWInterface *)self internalInterface];
  char has_dns = nw_interface_has_dns(v2);

  return has_dns;
}

- (BOOL)supportsMulticast
{
  v2 = [(NWInterface *)self internalInterface];
  char v3 = nw_interface_supports_multicast(v2);

  return v3;
}

- (BOOL)isUltraConstrained
{
  v2 = [(NWInterface *)self internalInterface];
  char is_ultra_constrained = nw_interface_is_ultra_constrained(v2);

  return is_ultra_constrained;
}

- (BOOL)isConstrained
{
  v2 = [(NWInterface *)self internalInterface];
  char is_constrained = nw_interface_is_constrained(v2);

  return is_constrained;
}

- (BOOL)isExpensive
{
  v2 = [(NWInterface *)self internalInterface];
  char is_expensive = nw_interface_is_expensive(v2);

  return is_expensive;
}

- (int64_t)subtype
{
  v2 = [(NWInterface *)self internalInterface];
  subos_log_type_t type = nw_interface_get_subtype(v2);

  return subtype;
}

- (unint64_t)interfaceIndex
{
  v2 = [(NWInterface *)self internalInterface];
  if (v2) {
    unint64_t v3 = v2[2];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSString)interfaceName
{
  v2 = [(NWInterface *)self internalInterface];

  if (v2)
  {
    unint64_t v3 = [NSString stringWithUTF8String:v2 + 104];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)privateDescription
{
  id v2 = [(NWInterface *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [(NWInterface *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unsigned int v8 = +[NWInterface descriptionForType:[(NWInterface *)self type]];
  [v7 appendPrettyObject:v8 withName:@"type" indent:v5 showFullContent:1];

  unsigned int v9 = +[NWInterface descriptionForSubtype:[(NWInterface *)self subtype]];
  [v7 appendPrettyObject:v9 withName:@"subtype" indent:v5 showFullContent:1];

  if (v4)
  {
    unsigned int v10 = [(NWInterface *)self interfaceName];
    [v7 appendPrettyObject:v10 withName:@"interfaceName" indent:v5 showFullContent:1];

    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface interfaceIndex](self, "interfaceIndex"), @"interfaceIndex", v5);
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface generation](self, "generation"), @"generation", v5);
    objc_msgSend(v7, "appendPrettyInt:withName:indent:", -[NWInterface mtu](self, "mtu"), @"mtu", v5);
    int v11 = [(NWInterface *)self ipv4Netmask];
    [v7 appendPrettyObject:v11 withName:@"ipv4Netmask" indent:v5 showFullContent:1];

    int v12 = [(NWInterface *)self ipv4Broadcast];
    [v7 appendPrettyObject:v12 withName:@"ipv4Broadcast" indent:v5 showFullContent:1];

    if ([(NWInterface *)self supportsMulticast]) {
      [v7 appendPrettyBOOL:1 withName:@"supportsMulticast" indent:v5];
    }
    if ([(NWInterface *)self hasDNS]) {
      [v7 appendPrettyBOOL:1 withName:@"hasDNS" indent:v5];
    }
    if ([(NWInterface *)self hasNAT64]) {
      [v7 appendPrettyBOOL:1 withName:@"hasNAT64" indent:v5];
    }
    if ([(NWInterface *)self isIPv4Routable]) {
      [v7 appendPrettyBOOL:1 withName:@"ipv4Routable" indent:v5];
    }
    if ([(NWInterface *)self isIPv6Routable]) {
      [v7 appendPrettyBOOL:1 withName:@"ipv6Routable" indent:v5];
    }
  }
  if ([(NWInterface *)self isExpensive]) {
    [v7 appendPrettyBOOL:1 withName:@"expensive" indent:v5];
  }
  if ([(NWInterface *)self isConstrained]) {
    [v7 appendPrettyBOOL:1 withName:@"constrained" indent:v5];
  }
  if ([(NWInterface *)self isUltraConstrained]) {
    [v7 appendPrettyBOOL:1 withName:@"ultraConstrained" indent:v5];
  }
  return v7;
}

- (NWInterface)initWithInterfaceIndex:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
    unsigned int v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v19 = 0;
    if (__nwlog_fault(v8, &type, &v19))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        unsigned int v9 = (id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        int v11 = "%{public}s called with null interfaceIndex";
LABEL_23:
        os_log_type_t v17 = v9;
        os_log_type_t v18 = v10;
        goto LABEL_24;
      }
      if (!v19)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        unsigned int v9 = (id)gLogObj;
        os_log_type_t v10 = type;
        if (!os_log_type_enabled(v9, type)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        int v11 = "%{public}s called with null interfaceIndex, backtrace limit exceeded";
        goto LABEL_23;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      unsigned int v9 = (id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v9, type);
      if (!backtrace_string)
      {
        if (!v15)
        {
LABEL_25:

          if (!v8) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        int v11 = "%{public}s called with null interfaceIndex, no backtrace";
        os_log_type_t v17 = v9;
        os_log_type_t v18 = v14;
LABEL_24:
        _os_log_impl(&dword_1830D4000, v17, v18, v11, buf, 0xCu);
        goto LABEL_25;
      }
      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
        __int16 v23 = 2082;
        char v24 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v9, v14, "%{public}s called with null interfaceIndex, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v8)
    {
LABEL_19:
      unsigned int v6 = 0;
      goto LABEL_20;
    }
LABEL_18:
    free(v8);
    goto LABEL_19;
  }
  int v4 = a3;
  uint64_t v5 = nw_interface_create_with_index(a3);
  if (v5)
  {
    self = [(NWInterface *)self initWithInterface:v5];
    unsigned int v6 = self;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    int v12 = (id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      BOOL v22 = "-[NWInterface initWithInterfaceIndex:]";
      __int16 v23 = 1024;
      LODWORD(v24) = v4;
      _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_ERROR, "%{public}s nw_interface_create_with_index(%u) failed", buf, 0x12u);
    }

    unsigned int v6 = 0;
  }

LABEL_20:
  return v6;
}

- (unint64_t)hash
{
  id v2 = [(NWInterface *)self internalInterface];
  unint64_t shallow_hash = nw_interface_get_shallow_hash(v2);

  return shallow_hash;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (NWInterface *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(NWInterface *)self internalInterface];
      unsigned int v6 = [(NWInterface *)v4 internalInterface];
      BOOL v7 = nw_interface_shallow_compare(v5, v6);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = +[NWInterface allocWithZone:a3];
  uint64_t v5 = [(NWInterface *)self internalInterface];
  unsigned int v6 = [(NWInterface *)v4 initWithInterface:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NWInterface *)self internalInterface];
  unsigned int v6 = nw_interface_copy_dictionary(v5);

  if (v6)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = v6;
    unsigned int v9 = [v7 dictionary];
    *(void *)applier = MEMORY[0x1E4F143A8];
    *(void *)&applier[8] = 3221225472;
    *(void *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    v34 = &unk_1E52480D0;
    id v10 = v9;
    id v35 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      [v4 encodeObject:v10 forKey:@"dictionary"];
LABEL_39:

      goto LABEL_40;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    os_log_type_t v17 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (!__nwlog_fault((const char *)v17, &type, &v31))
    {
LABEL_37:
      if (v17) {
        free(v17);
      }
      goto LABEL_39;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v18 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        BOOL v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed";
LABEL_34:
        v29 = v18;
        os_log_type_t v30 = v19;
LABEL_35:
        _os_log_impl(&dword_1830D4000, v29, v30, v20, applier, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v18 = (id)gLogObj;
        os_log_type_t v25 = type;
        BOOL v26 = os_log_type_enabled(v18, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)applier = 136446466;
            *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(void *)&applier[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v18, v25, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_37;
        }
        if (!v26) {
          goto LABEL_36;
        }
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        BOOL v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace";
        v29 = v18;
        os_log_type_t v30 = v25;
        goto LABEL_35;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v18 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
        BOOL v20 = "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded";
        goto LABEL_34;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
  int v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v31 = 0;
  if (!__nwlog_fault(v12, &type, &v31)) {
    goto LABEL_17;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v13 = (id)gLogObj;
    os_log_type_t v14 = type;
    if (!os_log_type_enabled(v13, type)) {
      goto LABEL_28;
    }
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    BOOL v15 = "%{public}s nw_interface_copy_dictionary failed";
LABEL_26:
    v27 = v13;
    os_log_type_t v28 = v14;
LABEL_27:
    _os_log_impl(&dword_1830D4000, v27, v28, v15, applier, 0xCu);
    goto LABEL_28;
  }
  if (!v31)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    BOOL v13 = (id)gLogObj;
    os_log_type_t v14 = type;
    if (!os_log_type_enabled(v13, type)) {
      goto LABEL_28;
    }
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    BOOL v15 = "%{public}s nw_interface_copy_dictionary failed, backtrace limit exceeded";
    goto LABEL_26;
  }
  __int16 v21 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  BOOL v13 = (id)gLogObj;
  os_log_type_t v22 = type;
  BOOL v23 = os_log_type_enabled(v13, type);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)applier = 136446466;
      *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
      *(_WORD *)&applier[12] = 2082;
      *(void *)&applier[14] = v21;
      _os_log_impl(&dword_1830D4000, v13, v22, "%{public}s nw_interface_copy_dictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
    }

    free(v21);
LABEL_17:
    if (!v12) {
      goto LABEL_40;
    }
    goto LABEL_29;
  }
  if (v23)
  {
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWInterface encodeWithCoder:]";
    BOOL v15 = "%{public}s nw_interface_copy_dictionary failed, no backtrace";
    v27 = v13;
    os_log_type_t v28 = v22;
    goto LABEL_27;
  }
LABEL_28:

  if (v12) {
LABEL_29:
  }
    free(v12);
LABEL_40:
}

- (NWInterface)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NWInterface;
  uint64_t v5 = [(NWInterface *)&v53 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    int v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    BOOL v13 = [v4 decodeObjectOfClasses:v12 forKey:@"dictionary"];
    os_log_type_t v14 = v13;
    if (v13)
    {
      xpc_object_t XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      id v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        os_log_type_t v17 = nw_interface_create_from_dictionary(XPCDictionaryFromNSDictionary);
        [(NWInterface *)v5 setInternalInterface:v17];

        os_log_type_t v18 = [(NWInterface *)v5 internalInterface];

        if (v18)
        {
          os_log_type_t v19 = v5;
LABEL_39:

          goto LABEL_40;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v33 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        BOOL v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
        {
LABEL_36:
          if (!v26)
          {
LABEL_38:
            os_log_type_t v19 = 0;
            goto LABEL_39;
          }
LABEL_37:
          free(v26);
          goto LABEL_38;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s nw_interface_create_from_dictionary failed";
          goto LABEL_56;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s nw_interface_create_from_dictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v38 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWInterface initWithCoder:]";
            __int16 v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s nw_interface_create_from_dictionary failed, dumping backtrace:%{public}s";
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        if (!v38)
        {
LABEL_58:

          if (!v26) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v29 = "%{public}s nw_interface_create_from_dictionary failed, no backtrace";
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v25 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        BOOL v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51)) {
          goto LABEL_36;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed";
LABEL_56:
          v42 = v27;
          os_log_type_t v43 = v28;
LABEL_57:
          _os_log_impl(&dword_1830D4000, v42, v43, v29, buf, 0xCu);
          goto LABEL_58;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWInterface initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v36 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWInterface initWithCoder:]";
            __int16 v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, dumping backtrace:%{public}s";
LABEL_34:
            _os_log_impl(&dword_1830D4000, v27, v35, v37, buf, 0x16u);
          }
LABEL_35:

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, no backtrace";
      }
      v42 = v27;
      os_log_type_t v43 = v35;
      goto LABEL_57;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v20 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v55 = "-[NWInterface initWithCoder:]";
    __int16 v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v51 = 0;
    if (__nwlog_fault(v21, &type, &v51))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (!os_log_type_enabled(v22, type)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        char v24 = "%{public}s decodeObjectOfClasses:forKey failed";
LABEL_44:
        v40 = v22;
        os_log_type_t v41 = v23;
        goto LABEL_45;
      }
      if (!v51)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (!os_log_type_enabled(v22, type)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        char v24 = "%{public}s decodeObjectOfClasses:forKey failed, backtrace limit exceeded";
        goto LABEL_44;
      }
      os_log_type_t v30 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v22 = (id)gLogObj;
      os_log_type_t v31 = type;
      BOOL v32 = os_log_type_enabled(v22, type);
      if (!v30)
      {
        if (!v32)
        {
LABEL_46:

          if (!v21) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        char v24 = "%{public}s decodeObjectOfClasses:forKey failed, no backtrace";
        v40 = v22;
        os_log_type_t v41 = v31;
LABEL_45:
        _os_log_impl(&dword_1830D4000, v40, v41, v24, buf, 0xCu);
        goto LABEL_46;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446466;
        v55 = "-[NWInterface initWithCoder:]";
        __int16 v56 = 2082;
        v57 = v30;
        _os_log_impl(&dword_1830D4000, v22, v31, "%{public}s decodeObjectOfClasses:forKey failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v30);
    }
    if (!v21)
    {
LABEL_21:
      os_log_type_t v19 = 0;
LABEL_40:

      goto LABEL_41;
    }
LABEL_20:
    free(v21);
    goto LABEL_21;
  }
  v44 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v55 = "-[NWInterface initWithCoder:]";
  v45 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v51 = 0;
  if (__nwlog_fault(v45, &type, &v51))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v46 = __nwlog_obj();
      os_log_type_t v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v48 = "%{public}s [super init] failed";
LABEL_76:
        _os_log_impl(&dword_1830D4000, v46, v47, v48, buf, 0xCu);
      }
    }
    else
    {
      if (v51)
      {
        v49 = (char *)__nw_create_backtrace_string();
        v46 = __nwlog_obj();
        os_log_type_t v47 = type;
        BOOL v50 = os_log_type_enabled(v46, type);
        if (v49)
        {
          if (v50)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWInterface initWithCoder:]";
            __int16 v56 = 2082;
            v57 = v49;
            _os_log_impl(&dword_1830D4000, v46, v47, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_78;
        }
        if (!v50) {
          goto LABEL_77;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v48 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_76;
      }
      v46 = __nwlog_obj();
      os_log_type_t v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWInterface initWithCoder:]";
        v48 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_76;
      }
    }
LABEL_77:
  }
LABEL_78:
  if (v45) {
    free(v45);
  }
  os_log_type_t v19 = 0;
LABEL_41:

  return v19;
}

+ (NWInterface)interfaceWithProtocolBufferData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [[NWPBInterface alloc] initWithData:v3];

  if (v4)
  {
    uint64_t v5 = v4->_name;
    id v6 = [(NSString *)v5 UTF8String];
    if ((*(unsigned char *)&v4->_has & 0x20) != 0)
    {
      int v7 = v4->_type;
      if ((*(unsigned char *)&v4->_has & 0x10) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      int v7 = 0;
      if ((*(unsigned char *)&v4->_has & 0x10) != 0)
      {
LABEL_4:
        subos_log_type_t type = v4->_subtype;
LABEL_11:
        os_log_type_t v14 = nw_interface_create_static(v6, v4->_index, v7, subtype, v4->_generation, v4->_delegateIndex, v4->_expensive, 0, v4->_mtu, 0, 0);
        if (v14) {
          BOOL v15 = [[NWInterface alloc] initWithInterface:v14];
        }
        else {
          BOOL v15 = 0;
        }

        goto LABEL_23;
      }
    }
    subos_log_type_t type = 0;
    goto LABEL_11;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  id v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
  uint64_t v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v22 = 0;
  if (__nwlog_fault(v10, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446210;
      id v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
      BOOL v13 = "%{public}s [NWPBInterface initWithData:] failed";
LABEL_28:
      id v20 = v11;
      os_log_type_t v21 = v12;
      goto LABEL_29;
    }
    if (!v22)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446210;
      id v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
      BOOL v13 = "%{public}s [NWPBInterface initWithData:] failed, backtrace limit exceeded";
      goto LABEL_28;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v11 = (id)gLogObj;
    os_log_type_t v17 = type;
    BOOL v18 = os_log_type_enabled(v11, type);
    if (!backtrace_string)
    {
      if (!v18)
      {
LABEL_30:

        if (!v10) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136446210;
      id v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
      BOOL v13 = "%{public}s [NWPBInterface initWithData:] failed, no backtrace";
      id v20 = v11;
      os_log_type_t v21 = v17;
LABEL_29:
      _os_log_impl(&dword_1830D4000, v20, v21, v13, buf, 0xCu);
      goto LABEL_30;
    }
    if (v18)
    {
      *(_DWORD *)buf = 136446466;
      id v25 = "+[NWInterface interfaceWithProtocolBufferData:]";
      __int16 v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v11, v17, "%{public}s [NWPBInterface initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v10) {
LABEL_21:
  }
    free(v10);
LABEL_22:
  BOOL v15 = 0;
LABEL_23:

  return v15;
}

+ (id)descriptionForSubtype:(int64_t)a3
{
  if ((int)a3 <= 1001)
  {
    if (!a3)
    {
      id v3 = "other";
      return (id)[NSString stringWithUTF8String:v3];
    }
    if (a3 == 1001)
    {
      id v3 = "wifi_infrastructure";
      return (id)[NSString stringWithUTF8String:v3];
    }
LABEL_13:
    id v3 = "unknown";
    return (id)[NSString stringWithUTF8String:v3];
  }
  if (a3 == 1002)
  {
    id v3 = "wifi_awdl";
    return (id)[NSString stringWithUTF8String:v3];
  }
  if (a3 == 4001)
  {
    id v3 = "coprocessor";
    return (id)[NSString stringWithUTF8String:v3];
  }
  if (a3 != 5001) {
    goto LABEL_13;
  }
  id v3 = "companion";
  return (id)[NSString stringWithUTF8String:v3];
}

+ (id)descriptionForType:(int64_t)a3
{
  if (a3 > 4) {
    id v3 = "unknown";
  }
  else {
    id v3 = off_1E524BC28[a3];
  }
  return (id)[NSString stringWithUTF8String:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyLocalAddressForDefaultIPv4
{
  id v3 = +[NWAddressEndpoint endpointWithHostname:@"0.0.0.0" port:@"0"];
  id v4 = [(NWInterface *)self copyLocalAddressForRemoteAddress:v3];

  return v4;
}

- (id)copyLocalAddressForDefaultIPv6
{
  id v3 = +[NWAddressEndpoint endpointWithHostname:@"::" port:@"0"];
  id v4 = [(NWInterface *)self copyLocalAddressForRemoteAddress:v3];

  return v4;
}

- (id)copyLocalAddressForRemoteAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NWInterface *)self internalInterface];
  id v6 = [v4 internalEndpoint];

  nw_endpoint_t v7 = nw_interface_copy_local_address_for_remote_address(v5, v6);
  if (v7)
  {
    uint64_t v8 = +[NWEndpoint endpointWithCEndpoint:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (NWInterface)initWithInterfaceIndex:(unint64_t)a3 interfaceName:(id)a4
{
  *(void *)&v37[13] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  nw_endpoint_t v7 = v6;
  if (a3)
  {
    if (v6)
    {
      uint64_t v8 = nw_interface_create_with_index_and_name(a3, (unsigned __int8 *)[v6 UTF8String]);
      if (v8)
      {
        self = [(NWInterface *)self initWithInterface:v8];
        id v9 = self;
LABEL_19:

        goto LABEL_20;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v10 = (id)gLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
        __int16 v36 = 1024;
        *(_DWORD *)v37 = a3;
        v37[2] = 2114;
        *(void *)&v37[3] = v7;
        _os_log_impl(&dword_1830D4000, v10, OS_LOG_TYPE_ERROR, "%{public}s nw_interface_create_with_index_and_name failed for index, name (%u, %{public}@)", buf, 0x1Cu);
      }

      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      os_log_type_t v12 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v32 = 0;
      if (__nwlog_fault(v12, &type, &v32))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v13 = (id)gLogObj;
          os_log_type_t v14 = type;
          if (!os_log_type_enabled(v13, type)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          BOOL v15 = "%{public}s nw_interface_create_with_index_and_name failed";
LABEL_23:
          id v20 = v13;
          os_log_type_t v21 = v14;
          goto LABEL_24;
        }
        if (!v32)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          BOOL v13 = (id)gLogObj;
          os_log_type_t v14 = type;
          if (!os_log_type_enabled(v13, type)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          BOOL v15 = "%{public}s nw_interface_create_with_index_and_name failed, backtrace limit exceeded";
          goto LABEL_23;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v13 = (id)gLogObj;
        os_log_type_t v17 = type;
        BOOL v18 = os_log_type_enabled(v13, type);
        if (!backtrace_string)
        {
          if (!v18)
          {
LABEL_25:

            if (!v12) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          BOOL v15 = "%{public}s nw_interface_create_with_index_and_name failed, no backtrace";
          id v20 = v13;
          os_log_type_t v21 = v17;
LABEL_24:
          _os_log_impl(&dword_1830D4000, v20, v21, v15, buf, 0xCu);
          goto LABEL_25;
        }
        if (v18)
        {
          *(_DWORD *)buf = 136446466;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v36 = 2082;
          *(void *)v37 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v13, v17, "%{public}s nw_interface_create_with_index_and_name failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
      }
      if (!v12)
      {
LABEL_18:
        id v9 = 0;
        goto LABEL_19;
      }
LABEL_17:
      free(v12);
      goto LABEL_18;
    }
    v27 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
    os_log_type_t v23 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (__nwlog_fault(v23, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        char v24 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v26 = "%{public}s called with null interfaceName";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (!v32)
      {
        char v24 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v26 = "%{public}s called with null interfaceName, backtrace limit exceeded";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      uint64_t v28 = (char *)__nw_create_backtrace_string();
      char v24 = __nwlog_obj();
      os_log_type_t v25 = type;
      BOOL v31 = os_log_type_enabled(v24, type);
      if (!v28)
      {
        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v26 = "%{public}s called with null interfaceName, no backtrace";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (!v31) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 136446466;
      os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      __int16 v36 = 2082;
      *(void *)v37 = v28;
      os_log_type_t v30 = "%{public}s called with null interfaceName, dumping backtrace:%{public}s";
LABEL_45:
      _os_log_impl(&dword_1830D4000, v24, v25, v30, buf, 0x16u);
LABEL_46:

      free(v28);
    }
  }
  else
  {
    char v22 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
    os_log_type_t v23 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v32 = 0;
    if (__nwlog_fault(v23, &type, &v32))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        char v24 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v26 = "%{public}s called with null interfaceIndex";
LABEL_55:
          _os_log_impl(&dword_1830D4000, v24, v25, v26, buf, 0xCu);
        }
LABEL_56:

        goto LABEL_57;
      }
      if (!v32)
      {
        char v24 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v24, type))
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v26 = "%{public}s called with null interfaceIndex, backtrace limit exceeded";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      uint64_t v28 = (char *)__nw_create_backtrace_string();
      char v24 = __nwlog_obj();
      os_log_type_t v25 = type;
      BOOL v29 = os_log_type_enabled(v24, type);
      if (!v28)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446210;
          os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
          __int16 v26 = "%{public}s called with null interfaceIndex, no backtrace";
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (!v29) {
        goto LABEL_46;
      }
      *(_DWORD *)buf = 136446466;
      os_log_type_t v35 = "-[NWInterface(Private) initWithInterfaceIndex:interfaceName:]";
      __int16 v36 = 2082;
      *(void *)v37 = v28;
      os_log_type_t v30 = "%{public}s called with null interfaceIndex, dumping backtrace:%{public}s";
      goto LABEL_45;
    }
  }
LABEL_57:
  if (v23) {
    free(v23);
  }
  id v9 = 0;
LABEL_20:

  return v9;
}

@end