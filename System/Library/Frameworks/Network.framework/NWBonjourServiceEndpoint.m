@interface NWBonjourServiceEndpoint
+ (NWBonjourServiceEndpoint)endpointWithName:(NSString *)name type:(NSString *)type domain:(NSString *)domain;
+ (unsigned)endpointType;
- (NSString)domain;
- (NSString)name;
- (NSString)type;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
@end

@implementation NWBonjourServiceEndpoint

+ (NWBonjourServiceEndpoint)endpointWithName:(NSString *)name type:(NSString *)type domain:(NSString *)domain
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v7 = domain;
  v8 = type;
  v9 = name;
  nw_endpoint_t bonjour_service = nw_endpoint_create_bonjour_service([(NSString *)v9 UTF8String], [(NSString *)v8 UTF8String], [(NSString *)v7 UTF8String]);
  nw_endpoint_t v11 = bonjour_service;
  if (!bonjour_service)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t typea = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (!__nwlog_fault(v16, &typea, &v29)) {
      goto LABEL_37;
    }
    if (typea == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      os_log_type_t v18 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s nw_endpoint_create_bonjour_service failed", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (!v29)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      os_log_type_t v26 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_1830D4000, v17, v26, "%{public}s nw_endpoint_create_bonjour_service failed, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    os_log_type_t v22 = typea;
    BOOL v23 = os_log_type_enabled(v17, typea);
    if (!backtrace_string)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_1830D4000, v17, v22, "%{public}s nw_endpoint_create_bonjour_service failed, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v23)
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
      __int16 v33 = 2082;
      v34 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v17, v22, "%{public}s nw_endpoint_create_bonjour_service failed, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_23;
  }
  v12 = bonjour_service;
  int v13 = [v12 type];

  if (v13 == 3)
  {
    v14 = +[NWEndpoint endpointWithInternalEndpoint:v12];
    goto LABEL_40;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v19 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
  v16 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t typea = OS_LOG_TYPE_ERROR;
  char v29 = 0;
  if (__nwlog_fault(v16, &typea, &v29))
  {
    if (typea == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      os_log_type_t v20 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_1830D4000, v17, v20, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!v29)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      os_log_type_t v27 = typea;
      if (os_log_type_enabled(v17, typea))
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_1830D4000, v17, v27, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_36;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    os_log_type_t v24 = typea;
    BOOL v25 = os_log_type_enabled(v17, typea);
    if (!backtrace_string)
    {
      if (v25)
      {
        *(_DWORD *)buf = 136446210;
        v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
        _os_log_impl(&dword_1830D4000, v17, v24, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type, no backtrace", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (v25)
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[NWBonjourServiceEndpoint endpointWithName:type:domain:]";
      __int16 v33 = 2082;
      v34 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v17, v24, "%{public}s NWBonjourServiceEndpoint created endpoint of wrong type, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_23:

    free(backtrace_string);
    if (!v16) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_37:
  if (v16) {
LABEL_38:
  }
    free(v16);
LABEL_39:
  v14 = 0;
LABEL_40:

  return (NWBonjourServiceEndpoint *)v14;
}

+ (unsigned)endpointType
{
  return 3;
}

- (NSString)domain
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWEndpoint *)self internalEndpoint];
  bonjour_service_domain = nw_endpoint_get_bonjour_service_domain(v2);

  if (bonjour_service_domain)
  {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_domain);
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  id v19 = "-[NWBonjourServiceEndpoint domain]";
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
      id v19 = "-[NWBonjourServiceEndpoint domain]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed";
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
      id v19 = "-[NWBonjourServiceEndpoint domain]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed, backtrace limit exceeded";
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
      id v19 = "-[NWBonjourServiceEndpoint domain]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_domain failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[NWBonjourServiceEndpoint domain]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_endpoint_get_bonjour_service_domain failed, dumping backtrace:%{public}s", buf, 0x16u);
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

  return (NSString *)(id)v4;
}

- (NSString)type
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWEndpoint *)self internalEndpoint];
  bonjour_service_os_log_type_t type = nw_endpoint_get_bonjour_service_type(v2);

  if (bonjour_service_type)
  {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_type);
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  id v19 = "-[NWBonjourServiceEndpoint type]";
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
      id v19 = "-[NWBonjourServiceEndpoint type]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed";
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
      id v19 = "-[NWBonjourServiceEndpoint type]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed, backtrace limit exceeded";
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
      id v19 = "-[NWBonjourServiceEndpoint type]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_type failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[NWBonjourServiceEndpoint type]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_endpoint_get_bonjour_service_type failed, dumping backtrace:%{public}s", buf, 0x16u);
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

  return (NSString *)(id)v4;
}

- (NSString)name
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWEndpoint *)self internalEndpoint];
  bonjour_service_name = nw_endpoint_get_bonjour_service_name(v2);

  if (bonjour_service_name)
  {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_name);
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  id v19 = "-[NWBonjourServiceEndpoint name]";
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
      id v19 = "-[NWBonjourServiceEndpoint name]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed";
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
      id v19 = "-[NWBonjourServiceEndpoint name]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed, backtrace limit exceeded";
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
      id v19 = "-[NWBonjourServiceEndpoint name]";
      v9 = "%{public}s nw_endpoint_get_bonjour_service_name failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      id v19 = "-[NWBonjourServiceEndpoint name]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_endpoint_get_bonjour_service_name failed, dumping backtrace:%{public}s", buf, 0x16u);
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

  return (NSString *)(id)v4;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = [(NWEndpoint *)self parentEndpointDomain];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    os_log_type_t v8 = [(NWBonjourServiceEndpoint *)self name];
    [v7 appendPrettyObject:v8 withName:@"name" indent:v4 showFullContent:1];

    v9 = [(NWBonjourServiceEndpoint *)self type];
    [v7 appendPrettyObject:v9 withName:@"type" indent:v4 showFullContent:1];

    v10 = [(NWBonjourServiceEndpoint *)self domain];
    [v7 appendPrettyObject:v10 withName:@"domain" indent:v4 showFullContent:1];

    os_log_type_t v11 = [(NWEndpoint *)self interface];
    [v7 appendPrettyObject:v11 withName:@"interface" indent:v4 showFullContent:1];

    BOOL v12 = [(NWEndpoint *)self parentEndpointDomain];
    [v7 appendPrettyObject:v12 withName:@"parentEndpointDomain" indent:v4 showFullContent:1];
  }
  else
  {
    int v13 = NSString;
    BOOL v12 = [(NWEndpoint *)self internalEndpoint];
    id v7 = [v13 stringWithUTF8String:nw_endpoint_get_description(v12)];
  }

  return v7;
}

@end