@interface NWBonjourBrowseDescriptor
+ (id)descriptorWithType:(id)a3 domain:(id)a4;
+ (unsigned)descriptorType;
- (NSString)domain;
- (NSString)type;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
@end

@implementation NWBonjourBrowseDescriptor

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  v5 = NSString;
  v6 = [(NWBonjourBrowseDescriptor *)self type];
  v7 = [(NWBonjourBrowseDescriptor *)self domain];
  v8 = [v5 stringWithFormat:@"%@.%@", v6, v7];

  return v8;
}

+ (id)descriptorWithType:(id)a3 domain:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  nw_browse_descriptor_t bonjour_service = nw_browse_descriptor_create_bonjour_service((const char *)[v6 UTF8String], (const char *)objc_msgSend(v5, "UTF8String"));
  if (bonjour_service)
  {
    v8 = +[NWBrowseDescriptor descriptorWithInternalDescriptor:bonjour_service];
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v9 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
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
      v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
      v13 = "%{public}s nw_browse_descriptor_create_bonjour_service failed";
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
      v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
      v13 = "%{public}s nw_browse_descriptor_create_bonjour_service failed, backtrace limit exceeded";
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
      v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
      v13 = "%{public}s nw_browse_descriptor_create_bonjour_service failed, no backtrace";
      v18 = v11;
      os_log_type_t v19 = v15;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v18, v19, v13, buf, 0xCu);
      goto LABEL_22;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446466;
      v23 = "+[NWBonjourBrowseDescriptor descriptorWithType:domain:]";
      __int16 v24 = 2082;
      v25 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v11, v15, "%{public}s nw_browse_descriptor_create_bonjour_service failed, dumping backtrace:%{public}s", buf, 0x16u);
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

  return v8;
}

- (NSString)domain
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(NWBrowseDescriptor *)self internalDescriptor];
  bonjour_service_domain = nw_browse_descriptor_get_bonjour_service_domain(v2);

  if (bonjour_service_domain)
  {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_domain);
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  os_log_type_t v19 = "-[NWBonjourBrowseDescriptor domain]";
  id v6 = (char *)_os_log_send_and_compose_impl();

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
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor domain]";
      id v9 = "%{public}s nw_browse_descriptor_get_service_domain failed";
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
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor domain]";
      id v9 = "%{public}s nw_browse_descriptor_get_service_domain failed, backtrace limit exceeded";
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
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor domain]";
      id v9 = "%{public}s nw_browse_descriptor_get_service_domain failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor domain]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_browse_descriptor_get_service_domain failed, dumping backtrace:%{public}s", buf, 0x16u);
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
  v2 = [(NWBrowseDescriptor *)self internalDescriptor];
  bonjour_service_os_log_type_t type = nw_browse_descriptor_get_bonjour_service_type(v2);

  if (bonjour_service_type)
  {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_type);
    goto LABEL_15;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  os_log_type_t v19 = "-[NWBonjourBrowseDescriptor type]";
  id v6 = (char *)_os_log_send_and_compose_impl();

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
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor type]";
      id v9 = "%{public}s nw_browse_descriptor_get_service_type failed";
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
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor type]";
      id v9 = "%{public}s nw_browse_descriptor_get_service_type failed, backtrace limit exceeded";
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
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor type]";
      id v9 = "%{public}s nw_browse_descriptor_get_service_type failed, no backtrace";
      v14 = v7;
      os_log_type_t v15 = v11;
LABEL_21:
      _os_log_impl(&dword_1830D4000, v14, v15, v9, buf, 0xCu);
      goto LABEL_22;
    }
    if (v12)
    {
      *(_DWORD *)buf = 136446466;
      os_log_type_t v19 = "-[NWBonjourBrowseDescriptor type]";
      __int16 v20 = 2082;
      v21 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s nw_browse_descriptor_get_service_type failed, dumping backtrace:%{public}s", buf, 0x16u);
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

+ (unsigned)descriptorType
{
  return 1;
}

@end