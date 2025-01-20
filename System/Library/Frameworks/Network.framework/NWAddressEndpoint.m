@interface NWAddressEndpoint
+ (id)endpointWithAddress:(const sockaddr *)a3;
+ (id)endpointWithHostname:(id)a3 port:(id)a4;
+ (unsigned)endpointType;
- (NSData)addressData;
- (NSString)addressString;
- (NSString)addressStringNoPort;
- (const)address;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)ethernetAddress;
- (unint64_t)addressFamily;
@end

@implementation NWAddressEndpoint

+ (id)endpointWithAddress:(const sockaddr *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  nw_endpoint_t address = nw_endpoint_create_address(a3);
  nw_endpoint_t v4 = address;
  if (!address)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v8 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v25 = "+[NWAddressEndpoint endpointWithAddress:]";
    v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (!__nwlog_fault(v9, &type, &v22)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s nw_endpoint_create_address failed", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v22)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_1830D4000, v10, v19, "%{public}s nw_endpoint_create_address failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v10, type);
    if (!backtrace_string)
    {
      if (v16)
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_1830D4000, v10, v15, "%{public}s nw_endpoint_create_address failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v25 = "+[NWAddressEndpoint endpointWithAddress:]";
      __int16 v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v10, v15, "%{public}s nw_endpoint_create_address failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v5 = address;
  int v6 = [v5 type];

  if (v6 == 1)
  {
    v7 = +[NWEndpoint endpointWithInternalEndpoint:v5];
    goto LABEL_40;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v12 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v25 = "+[NWAddressEndpoint endpointWithAddress:]";
  v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v22 = 0;
  if (__nwlog_fault(v9, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_1830D4000, v10, v13, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v22)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v10 = (id)gLogObj;
      os_log_type_t v20 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_1830D4000, v10, v20, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    os_log_type_t v17 = type;
    BOOL v18 = os_log_type_enabled(v10, type);
    if (!backtrace_string)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136446210;
        v25 = "+[NWAddressEndpoint endpointWithAddress:]";
        _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v18)
    {
      *(_DWORD *)buf = 136446466;
      v25 = "+[NWAddressEndpoint endpointWithAddress:]";
      __int16 v26 = 2082;
      v27 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s NWAddressEndpoint sockaddr created a non-address endpoint, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v9) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_37:
  if (v9) {
LABEL_38:
  }
    free(v9);
LABEL_39:
  v7 = 0;
LABEL_40:

  return v7;
}

+ (id)endpointWithHostname:(id)a3 port:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  nw_endpoint_t host = nw_endpoint_create_host((const char *)[v5 UTF8String], (const char *)objc_msgSend(v6, "UTF8String"));
  nw_endpoint_t v8 = host;
  if (!host)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
    os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (!__nwlog_fault(v13, &type, &v26)) {
      goto LABEL_37;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s nw_endpoint_create_host failed", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v26)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_1830D4000, v14, v23, "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    os_log_type_t v19 = type;
    BOOL v20 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136446210;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        _os_log_impl(&dword_1830D4000, v14, v19, "%{public}s nw_endpoint_create_host failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v20)
    {
      *(_DWORD *)buf = 136446466;
      v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
      __int16 v30 = 2082;
      v31 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v14, v19, "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v9 = host;
  int v10 = [v9 type];

  if (v10 == 1)
  {
    os_log_type_t v11 = +[NWEndpoint endpointWithInternalEndpoint:v9];
    goto LABEL_40;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v16 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
  __int16 v30 = 2114;
  v31 = (char *)v5;
  os_log_type_t v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v26 = 0;
  if (__nwlog_fault(v13, &type, &v26))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        __int16 v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl(&dword_1830D4000, v14, v17, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@", buf, 0x16u);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v26)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v14 = (id)gLogObj;
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        __int16 v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl(&dword_1830D4000, v14, v24, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@, backtrace limit exceeded", buf, 0x16u);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    os_log_type_t v21 = type;
    BOOL v22 = os_log_type_enabled(v14, type);
    if (!backtrace_string)
    {
      if (v22)
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
        __int16 v30 = 2114;
        v31 = (char *)v5;
        _os_log_impl(&dword_1830D4000, v14, v21, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@, no backtrace", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (v22)
    {
      *(_DWORD *)buf = 136446722;
      v29 = "+[NWAddressEndpoint endpointWithHostname:port:]";
      __int16 v30 = 2114;
      v31 = (char *)v5;
      __int16 v32 = 2082;
      v33 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v14, v21, "%{public}s NWAddressEndpoint created with non-address hostname %{public}@, dumping backtrace:%{public}s", buf, 0x20u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v13) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_37:
  if (v13) {
LABEL_38:
  }
    free(v13);
LABEL_39:
  os_log_type_t v11 = 0;
LABEL_40:

  return v11;
}

+ (unsigned)endpointType
{
  return 1;
}

- (unint64_t)addressFamily
{
  v2 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_t address = nw_endpoint_get_address(v2);

  if (address) {
    return address->sa_family;
  }
  else {
    return 0;
  }
}

- (const)address
{
  v2 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_t address = nw_endpoint_get_address(v2);

  return address;
}

- (NSString)addressStringNoPort
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_t address = nw_endpoint_get_address(v2);
  if (address)
  {
    nw_endpoint_t v4 = 0;
    if (!getnameinfo(address, address->sa_len, v6, 0x46u, 0, 0, 10))
    {
      nw_endpoint_t v4 = [NSString stringWithUTF8String:v6];
    }
  }
  else
  {
    nw_endpoint_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)addressString
{
  v2 = [(NWEndpoint *)self internalEndpoint];
  v3 = [NSString stringWithUTF8String:nw_endpoint_get_description(v2)];
  if (!v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    nw_endpoint_t v4 = (id)gLogObj;
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    id v5 = (void *)_os_log_send_and_compose_impl();

    result = (NSString *)__nwlog_abort((uint64_t)v5);
    if (result)
    {
      __break(1u);
      return result;
    }
    free(v5);
  }

  return (NSString *)v3;
}

- (NSData)addressData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_t address = nw_endpoint_get_address(v2);

  if (address)
  {
    nw_endpoint_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:address length:address->sa_len];
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
  id v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
      v9 = "%{public}s nw_endpoint_get_address failed";
LABEL_20:
      v14 = v7;
      os_log_type_t v15 = v8;
      goto LABEL_21;
    }
    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
      v9 = "%{public}s nw_endpoint_get_address failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v7 = (id)gLogObj;
    os_log_type_t v11 = type;
    BOOL v12 = os_log_type_enabled(v7, type);
    if (!backtrace_string)
    {
      if (!v12)
      {
LABEL_22:

        if (!v6) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446210;
      os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
      v9 = "%{public}s nw_endpoint_get_address failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v19 = "-[NWAddressEndpoint addressData]";
      __int16 v20 = 2082;
      os_log_type_t v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_endpoint_get_address failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v6) {
LABEL_13:
  }
    free(v6);
LABEL_14:
  nw_endpoint_t v4 = 0;
LABEL_15:

  return (NSData *)v4;
}

- (id)ethernetAddress
{
  v2 = [(NWEndpoint *)self internalEndpoint];
  ethernet_nw_endpoint_t address = nw_endpoint_get_ethernet_address(v2);

  if (ethernet_address)
  {
    nw_endpoint_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%x:%x:%x:%x:%x:%x", *ethernet_address, ethernet_address[1], ethernet_address[2], ethernet_address[3], ethernet_address[4], ethernet_address[5]);
  }
  else
  {
    nw_endpoint_t v4 = 0;
  }

  return v4;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [(NWAddressEndpoint *)self ethernetAddress];
  uint64_t v7 = [(NWEndpoint *)self parentEndpointDomain];
  uint64_t v8 = v7 | v6;

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    int v10 = [(NWAddressEndpoint *)self addressString];
    [v9 appendPrettyObject:v10 withName:@"address" indent:v4 showFullContent:1];

    [v9 appendPrettyObject:v6 withName:@"ethernetAddress" indent:v4 showFullContent:1];
    os_log_type_t v11 = [(NWEndpoint *)self interface];
    [v9 appendPrettyObject:v11 withName:@"interface" indent:v4 showFullContent:1];

    BOOL v12 = [(NWEndpoint *)self parentEndpointDomain];
    [v9 appendPrettyObject:v12 withName:@"parentEndpointDomain" indent:v4 showFullContent:1];
  }
  else
  {
    id v9 = [(NWAddressEndpoint *)self addressString];
  }

  return v9;
}

@end