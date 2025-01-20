@interface NWHostEndpoint
+ (NWHostEndpoint)endpointWithHostname:(NSString *)hostname port:(NSString *)port;
+ (unsigned)endpointType;
- (NSString)hostname;
- (NSString)port;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
@end

@implementation NWHostEndpoint

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = [(NWEndpoint *)self txtRecord];
  if (v7)
  {
  }
  else
  {
    v8 = [(NWEndpoint *)self parentEndpointDomain];

    if (!v8)
    {
      v16 = NSString;
      v14 = [(NWEndpoint *)self internalEndpoint];
      id v9 = [v16 stringWithUTF8String:nw_endpoint_get_description(v14)];
      goto LABEL_5;
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v10 = [(NWHostEndpoint *)self hostname];
  [v9 appendPrettyObject:v10 withName:@"hostname" indent:v5 showFullContent:1];

  v11 = [(NWHostEndpoint *)self port];
  [v9 appendPrettyObject:v11 withName:@"port" indent:v5 showFullContent:1];

  v12 = [(NWEndpoint *)self interface];
  [v9 appendPrettyObject:v12 withName:@"interface" indent:v5 showFullContent:v4];

  v13 = [(NWEndpoint *)self txtRecord];
  [v9 appendPrettyObject:v13 withName:@"txtRecord" indent:v5 showFullContent:v4];

  v14 = [(NWEndpoint *)self parentEndpointDomain];
  [v9 appendPrettyObject:v14 withName:@"parentEndpointDomain" indent:v5 showFullContent:1];
LABEL_5:

  return v9;
}

+ (NWHostEndpoint)endpointWithHostname:(NSString *)hostname port:(NSString *)port
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = port;
  v6 = hostname;
  nw_endpoint_t host = nw_endpoint_create_host([(NSString *)v6 UTF8String], [(NSString *)v5 UTF8String]);
  if (host)
  {
    v8 = +[NWEndpoint endpointWithInternalEndpoint:host];
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v10, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
      v13 = "%{public}s nw_endpoint_create_host failed";
LABEL_20:
      v18 = v11;
      os_log_type_t v19 = v12;
      goto LABEL_21;
    }
    if (!v20)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v11 = (id)gLogObj;
      os_log_type_t v12 = type;
      if (!os_log_type_enabled(v11, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
      v13 = "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v11, type);
    if (!backtrace_string)
    {
      if (!v16)
      {
LABEL_22:

        if (!v10) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446210;
      v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
      v13 = "%{public}s nw_endpoint_create_host failed, no backtrace";
      v18 = v11;
      os_log_type_t v19 = v15;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v18, v19, v13, buf, 0xCu);
      goto LABEL_22;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v23 = "+[NWHostEndpoint endpointWithHostname:port:]";
      __int16 v24 = 2082;
      v25 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v11, v15, "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v10) {
LABEL_13:
  }
    free(v10);
LABEL_14:
  v8 = 0;
LABEL_15:

  return (NWHostEndpoint *)v8;
}

+ (unsigned)endpointType
{
  return 2;
}

- (NSString)port
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWEndpoint *)self internalEndpoint];
  v3 = nw_endpoint_copy_port_string(v2);

  if (v3)
  {
    BOOL v4 = [NSString stringWithUTF8String:v3];
    free(v3);
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  os_log_type_t v19 = "-[NWHostEndpoint port]";
  v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v6, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      os_log_type_t v19 = "-[NWHostEndpoint port]";
      id v9 = "%{public}s nw_endpoint_copy_port_string failed";
LABEL_20:
      v14 = v7;
      os_log_type_t v15 = v8;
      goto LABEL_21;
    }
    if (!v16)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136446210;
      os_log_type_t v19 = "-[NWHostEndpoint port]";
      id v9 = "%{public}s nw_endpoint_copy_port_string failed, backtrace limit exceeded";
      goto LABEL_20;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
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
      os_log_type_t v19 = "-[NWHostEndpoint port]";
      id v9 = "%{public}s nw_endpoint_copy_port_string failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v19 = "-[NWHostEndpoint port]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_endpoint_copy_port_string failed, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v6) {
LABEL_13:
  }
    free(v6);
LABEL_14:
  BOOL v4 = 0;
LABEL_15:

  return (NSString *)v4;
}

- (NSString)hostname
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_type_t v4 = nw_endpoint_get_type(v3);

  id v5 = [(NWEndpoint *)self internalEndpoint];
  v6 = v5;
  if (v4 == nw_endpoint_type_address)
  {
    address = nw_endpoint_get_address(v5);
    if (address)
    {
      os_log_type_t v8 = 0;
      if (!getnameinfo(address, address->sa_len, (char *)buf, 0x46u, 0, 0, 10))
      {
        os_log_type_t v8 = [NSString stringWithUTF8String:buf];
      }
    }
    else
    {
      os_log_type_t v8 = 0;
    }
    goto LABEL_26;
  }
  hostname = nw_endpoint_get_hostname(v5);

  if (hostname)
  {
    os_log_type_t v8 = [NSString stringWithUTF8String:hostname];
    goto LABEL_26;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v10 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  __int16 v24 = "-[NWHostEndpoint hostname]";
  os_log_type_t v11 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v21 = 0;
  if (__nwlog_fault(v11, &type, &v21))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v24 = "-[NWHostEndpoint hostname]";
        v14 = "%{public}s nw_endpoint_get_hostname failed";
LABEL_20:
        v18 = v12;
        os_log_type_t v19 = v13;
LABEL_21:
        _os_log_impl(&dword_1830D4000, v18, v19, v14, buf, 0xCu);
      }
    }
    else
    {
      if (v21)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v12 = (id)gLogObj;
        os_log_type_t v16 = type;
        BOOL v17 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v17)
          {
            *(_DWORD *)buf = 136446466;
            __int16 v24 = "-[NWHostEndpoint hostname]";
            __int16 v25 = 2082;
            uint64_t v26 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v16, "%{public}s nw_endpoint_get_hostname failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_23;
        }
        if (!v17) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v24 = "-[NWHostEndpoint hostname]";
        v14 = "%{public}s nw_endpoint_get_hostname failed, no backtrace";
        v18 = v12;
        os_log_type_t v19 = v16;
        goto LABEL_21;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v12 = (id)gLogObj;
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v12, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v24 = "-[NWHostEndpoint hostname]";
        v14 = "%{public}s nw_endpoint_get_hostname failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_22:
  }
LABEL_23:
  if (v11) {
    free(v11);
  }
  os_log_type_t v8 = 0;
LABEL_26:

  return (NSString *)v8;
}

@end