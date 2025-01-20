@interface NWTCPListener
- (NSError)error;
- (NSString)launchdKey;
- (NWEndpoint)endpoint;
- (NWEndpoint)localEndpoint;
- (NWParameters)parameters;
- (NWTCPListener)initWithBonjourServiceEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5;
- (NWTCPListener)initWithLaunchdKey:(id)a3 parameters:(id)a4 delegate:(id)a5;
- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4;
- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4 launchdKey:(id)a5 bonjourEndpoint:(id)a6;
- (NWTCPListenerDelegate)delegate;
- (OS_nw_listener)internalListener;
- (void)cancel;
- (void)handleError:(id)a3;
- (void)handleNewConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setError:(id)a3;
- (void)setInternalListener:(id)a3;
- (void)setLaunchdKey:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setParameters:(id)a3;
- (void)startInternal;
@end

@implementation NWTCPListener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_launchdKey, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_internalListener, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_localEndpoint, 0);
}

- (void)setDelegate:(id)a3
{
}

- (NWTCPListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NWTCPListenerDelegate *)WeakRetained;
}

- (void)setLaunchdKey:(id)a3
{
}

- (NSString)launchdKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 40, 1);
}

- (void)setParameters:(id)a3
{
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalListener:(id)a3
{
}

- (OS_nw_listener)internalListener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalEndpoint:(id)a3
{
}

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void)cancel
{
  v3 = [(NWTCPListener *)self internalListener];

  if (v3)
  {
    v4 = [(NWTCPListener *)self internalListener];
    nw_listener_cancel(v4);

    [(NWTCPListener *)self setInternalListener:0];
  }
}

- (NWTCPListener)initWithBonjourServiceEndpoint:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  v5 = self;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = [(NWTCPListener *)self initWithParameters:a4 delegate:a5 launchdKey:0 bonjourEndpoint:a3];
    v6 = v5;
    goto LABEL_3;
  }
  v8 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
  v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v15 = 0;
  if (__nwlog_fault(v9, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v10 = __nwlog_obj();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        v12 = "%{public}s called with null bonjourServiceEndpoint";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v10, v11, v12, buf, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v10 = __nwlog_obj();
        os_log_type_t v11 = type;
        BOOL v14 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136446466;
            v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
            __int16 v19 = 2082;
            v20 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s called with null bonjourServiceEndpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v14) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        v12 = "%{public}s called with null bonjourServiceEndpoint, no backtrace";
        goto LABEL_17;
      }
      v10 = __nwlog_obj();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWTCPListener initWithBonjourServiceEndpoint:parameters:delegate:]";
        v12 = "%{public}s called with null bonjourServiceEndpoint, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v9) {
    free(v9);
  }
  v6 = 0;
LABEL_3:

  return v6;
}

- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4
{
  return [(NWTCPListener *)self initWithParameters:a3 delegate:a4 launchdKey:0 bonjourEndpoint:0];
}

- (NWTCPListener)initWithLaunchdKey:(id)a3 parameters:(id)a4 delegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (a3)
  {
    self = [(NWTCPListener *)self initWithParameters:a4 delegate:a5 launchdKey:v9 bonjourEndpoint:0];
    v10 = self;
    goto LABEL_3;
  }
  v12 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
  v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v19 = 0;
  if (__nwlog_fault(v13, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      BOOL v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        v16 = "%{public}s called with null launchdKey";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v14, v15, v16, buf, 0xCu);
      }
    }
    else
    {
      if (v19)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        BOOL v14 = __nwlog_obj();
        os_log_type_t v15 = type;
        BOOL v18 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
            __int16 v23 = 2082;
            v24 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null launchdKey, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v18) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        v16 = "%{public}s called with null launchdKey, no backtrace";
        goto LABEL_17;
      }
      BOOL v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        v22 = "-[NWTCPListener initWithLaunchdKey:parameters:delegate:]";
        v16 = "%{public}s called with null launchdKey, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v13) {
    free(v13);
  }
  v10 = 0;
LABEL_3:

  return v10;
}

- (NWTCPListener)initWithParameters:(id)a3 delegate:(id)a4 launchdKey:(id)a5 bonjourEndpoint:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v10 = a4;
  id v70 = a5;
  id v11 = a6;
  if (!v10)
  {
    v51 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
    v52 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v72 = 0;
    if (__nwlog_fault(v52, &type, &v72))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v53 = __nwlog_obj();
        os_log_type_t v54 = type;
        if (os_log_type_enabled(v53, type))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_1830D4000, v53, v54, "%{public}s called with null delegate", buf, 0xCu);
        }
      }
      else
      {
        if (v72)
        {
          backtrace_string = (char *)__nw_create_backtrace_string();
          v60 = __nwlog_obj();
          os_log_type_t v61 = type;
          BOOL v62 = os_log_type_enabled(v60, type);
          if (backtrace_string)
          {
            if (v62)
            {
              *(_DWORD *)buf = 136446466;
              v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
              __int16 v76 = 2082;
              v77 = backtrace_string;
              _os_log_impl(&dword_1830D4000, v60, v61, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(backtrace_string);
          }
          else
          {
            if (v62)
            {
              *(_DWORD *)buf = 136446210;
              v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
              _os_log_impl(&dword_1830D4000, v60, v61, "%{public}s called with null delegate, no backtrace", buf, 0xCu);
            }
          }
          goto LABEL_86;
        }
        v53 = __nwlog_obj();
        os_log_type_t v67 = type;
        if (os_log_type_enabled(v53, type))
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_1830D4000, v53, v67, "%{public}s called with null delegate, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_86:
    if (v52) {
      free(v52);
    }
    goto LABEL_47;
  }
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1ECFABF70])
  {
    v71.receiver = self;
    v71.super_class = (Class)NWTCPListener;
    v12 = [(NWTCPListener *)&v71 init];
    if (v12)
    {
      if (v69)
      {
        secure_tcp = [v69 copyCParameters];
        BOOL v14 = nw_parameters_copy_default_protocol_stack(secure_tcp);
        nw_protocol_options_t v15 = nw_protocol_stack_copy_transport_protocol(v14);
        BOOL v16 = v15 == 0;

        if (v16)
        {
          if (nw_protocol_setup_tcp_definition(void)::onceToken != -1) {
            dispatch_once(&nw_protocol_setup_tcp_definition(void)::onceToken, &__block_literal_global_64304);
          }
          options = nw_protocol_create_options((void *)g_tcp_definition);
          nw_protocol_stack_set_transport_protocol(v14, &options->super);
        }
        BOOL v18 = v70;
        if (v70) {
          goto LABEL_10;
        }
      }
      else
      {
        secure_tcp = nw_parameters_create_secure_tcp(&__block_literal_global_19196, &__block_literal_global_98);
        BOOL v18 = v70;
        if (v70)
        {
LABEL_10:
          nw_listener_t v19 = (nw_listener_t)nw_listener_create_with_launchd_key(secure_tcp, (const char *)[v18 UTF8String]);
          goto LABEL_24;
        }
      }
      nw_listener_t v19 = nw_listener_create(secure_tcp);
LABEL_24:
      v28 = v19;
      [(NWTCPListener *)v12 setInternalListener:v19];

      v29 = [(NWTCPListener *)v12 internalListener];
      LODWORD(v28) = v29 == 0;

      if (!v28)
      {
        if (v11)
        {
          v30 = [v11 name];
          v31 = [v11 type];
          v32 = [v11 domain];
          bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)[v30 UTF8String], (const char *)objc_msgSend(v31, "UTF8String"), (const char *)objc_msgSend(v32, "UTF8String"));
          v34 = [(NWTCPListener *)v12 internalListener];
          nw_listener_set_advertise_descriptor(v34, bonjour_service);
        }
        v35 = [[NWParameters alloc] initWithParameters:secure_tcp];
        parameters = v12->_parameters;
        v12->_parameters = v35;

        objc_storeWeak((id *)&v12->_delegate, v10);
        error = v12->_error;
        v12->_error = 0;

        localEndpoint = v12->_localEndpoint;
        v12->_localEndpoint = 0;

        objc_storeStrong((id *)&v12->_launchdKey, a5);
        [(NWTCPListener *)v12 startInternal];
        v39 = v12;
        goto LABEL_58;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v40 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
      v41 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v72 = 0;
      if (__nwlog_fault(v41, &type, &v72))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v42 = (id)gLogObj;
          os_log_type_t v43 = type;
          if (os_log_type_enabled(v42, type))
          {
            *(_DWORD *)buf = 136446210;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            _os_log_impl(&dword_1830D4000, v42, v43, "%{public}s nw_listener_create failed", buf, 0xCu);
          }
LABEL_32:

          goto LABEL_55;
        }
        if (!v72)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v42 = (id)gLogObj;
          os_log_type_t v49 = type;
          if (os_log_type_enabled(v42, type))
          {
            *(_DWORD *)buf = 136446210;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            _os_log_impl(&dword_1830D4000, v42, v49, "%{public}s nw_listener_create failed, backtrace limit exceeded", buf, 0xCu);
          }
          goto LABEL_32;
        }
        v45 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v46 = (id)gLogObj;
        os_log_type_t v47 = type;
        BOOL v48 = os_log_type_enabled(v46, type);
        if (v45)
        {
          if (v48)
          {
            *(_DWORD *)buf = 136446466;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            __int16 v76 = 2082;
            v77 = v45;
            _os_log_impl(&dword_1830D4000, v46, v47, "%{public}s nw_listener_create failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v45);
          if (!v41) {
            goto LABEL_57;
          }
          goto LABEL_56;
        }
        if (v48)
        {
          *(_DWORD *)buf = 136446210;
          v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
          _os_log_impl(&dword_1830D4000, v46, v47, "%{public}s nw_listener_create failed, no backtrace", buf, 0xCu);
        }
      }
LABEL_55:
      if (!v41)
      {
LABEL_57:
        v39 = 0;
LABEL_58:

        goto LABEL_59;
      }
LABEL_56:
      free(v41);
      goto LABEL_57;
    }
    v55 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
    v56 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v72 = 0;
    if (!__nwlog_fault(v56, &type, &v72)) {
      goto LABEL_95;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v57 = __nwlog_obj();
      os_log_type_t v58 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_1830D4000, v57, v58, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else
    {
      if (v72)
      {
        v63 = (char *)__nw_create_backtrace_string();
        v64 = __nwlog_obj();
        os_log_type_t v65 = type;
        BOOL v66 = os_log_type_enabled(v64, type);
        if (v63)
        {
          if (v66)
          {
            *(_DWORD *)buf = 136446466;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            __int16 v76 = 2082;
            v77 = v63;
            _os_log_impl(&dword_1830D4000, v64, v65, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v63);
        }
        else
        {
          if (v66)
          {
            *(_DWORD *)buf = 136446210;
            v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
            _os_log_impl(&dword_1830D4000, v64, v65, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
          }
        }
        goto LABEL_95;
      }
      v57 = __nwlog_obj();
      os_log_type_t v68 = type;
      if (os_log_type_enabled(v57, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_1830D4000, v57, v68, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

LABEL_95:
    if (v56) {
      free(v56);
    }
    goto LABEL_48;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v20 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
  uint64_t v21 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v72 = 0;
  if (__nwlog_fault(v21, &type, &v72))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol", buf, 0xCu);
      }
LABEL_15:

      goto LABEL_45;
    }
    if (!v72)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      os_log_type_t v44 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        _os_log_impl(&dword_1830D4000, v22, v44, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_15;
    }
    v24 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    uint64_t v25 = (id)gLogObj;
    os_log_type_t v26 = type;
    BOOL v27 = os_log_type_enabled(v25, type);
    if (v24)
    {
      if (v27)
      {
        *(_DWORD *)buf = 136446466;
        v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
        __int16 v76 = 2082;
        v77 = v24;
        _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v24);
      if (!v21) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    if (v27)
    {
      *(_DWORD *)buf = 136446210;
      v75 = "-[NWTCPListener initWithParameters:delegate:launchdKey:bonjourEndpoint:]";
      _os_log_impl(&dword_1830D4000, v25, v26, "%{public}s Delegate does not conform to NWTCPListenerDelegate protocol, no backtrace", buf, 0xCu);
    }
  }
LABEL_45:
  if (v21) {
LABEL_46:
  }
    free(v21);
LABEL_47:

LABEL_48:
  v39 = 0;
LABEL_59:

  return v39;
}

- (void)startInternal
{
  objc_initWeak(&location, self);
  v3 = [(NWTCPListener *)self internalListener];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __30__NWTCPListener_startInternal__block_invoke;
  handler[3] = &unk_1E524B418;
  objc_copyWeak(&v11, &location);
  nw_listener_set_new_connection_handler(v3, handler);

  v4 = [(NWTCPListener *)self internalListener];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__NWTCPListener_startInternal__block_invoke_2;
  v8[3] = &unk_1E524B440;
  objc_copyWeak(&v9, &location);
  nw_listener_set_state_changed_handler(v4, v8);

  v5 = [(NWTCPListener *)self internalListener];
  if (NWCopyInternalQueue_init_once != -1) {
    dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
  }
  v6 = (id)NWCopyInternalQueue_nwQueue;
  nw_listener_set_queue(v5, v6);

  v7 = [(NWTCPListener *)self internalListener];
  nw_listener_start(v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __30__NWTCPListener_startInternal__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleNewConnection:v5];
  }
}

void __30__NWTCPListener_startInternal__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      v7 = [WeakRetained internalListener];
      unsigned int port = nw_listener_get_port(v7);

      if (port)
      {
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u", port);
        id v10 = +[NWAddressEndpoint endpointWithHostname:@"0.0.0.0" port:v9];
        [v6 setLocalEndpoint:v10];
      }
    }
    if (v11) {
      [v6 handleError:v11];
    }
  }
}

- (void)handleError:(id)a3
{
  CFErrorRef v4 = nw_error_copy_cf_error((nw_error_t)a3);
  [(NWTCPListener *)self setError:v4];
}

- (void)handleNewConnection:(id)a3
{
  id v4 = a3;
  v6 = [[NWTCPConnection alloc] initWithAcceptedInternalConnection:v4];

  id v5 = [(NWTCPListener *)self delegate];
  [v5 handleConnection:v6];
}

@end