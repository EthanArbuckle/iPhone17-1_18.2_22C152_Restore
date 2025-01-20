@interface NWUDPListener
- (NSError)error;
- (NWEndpoint)endpoint;
- (NWEndpoint)localEndpoint;
- (NWParameters)parameters;
- (NWUDPListener)initWithParameters:(id)a3 delegate:(id)a4;
- (NWUDPListenerDelegate)delegate;
- (OS_nw_listener)internalListener;
- (void)handleConnection:(id)a3;
- (void)handleError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setError:(id)a3;
- (void)setInternalListener:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation NWUDPListener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_internalListener, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_localEndpoint, 0);
}

- (void)setDelegate:(id)a3
{
}

- (NWUDPListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NWUDPListenerDelegate *)WeakRetained;
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
  return self->_error;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (NWEndpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (NWUDPListener)initWithParameters:(id)a3 delegate:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v34 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v67 = "-[NWUDPListener initWithParameters:delegate:]";
    v35 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    os_log_type_t v65 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v35, &location, &v65))
    {
      if (location == 17)
      {
        v36 = __nwlog_obj();
        os_log_type_t v37 = location;
        if (os_log_type_enabled(v36, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v36, v37, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v65)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v36 = __nwlog_obj();
        os_log_type_t v47 = location;
        BOOL v48 = os_log_type_enabled(v36, (os_log_type_t)location);
        if (backtrace_string)
        {
          if (v48)
          {
            *(_DWORD *)buf = 136446466;
            v67 = "-[NWUDPListener initWithParameters:delegate:]";
            __int16 v68 = 2082;
            v69 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v36, v47, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_72;
        }
        if (v48)
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v36, v47, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v36 = __nwlog_obj();
        os_log_type_t v55 = location;
        if (os_log_type_enabled(v36, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v36, v55, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_72:
    if (v35) {
      free(v35);
    }
    goto LABEL_74;
  }
  if (!v7)
  {
    v38 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v67 = "-[NWUDPListener initWithParameters:delegate:]";
    v39 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    os_log_type_t v65 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v39, &location, &v65))
    {
      if (location == 17)
      {
        v40 = __nwlog_obj();
        os_log_type_t v41 = location;
        if (os_log_type_enabled(v40, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v40, v41, "%{public}s called with null delegate", buf, 0xCu);
        }
      }
      else if (v65)
      {
        v49 = (char *)__nw_create_backtrace_string();
        v40 = __nwlog_obj();
        os_log_type_t v50 = location;
        BOOL v51 = os_log_type_enabled(v40, (os_log_type_t)location);
        if (v49)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v67 = "-[NWUDPListener initWithParameters:delegate:]";
            __int16 v68 = 2082;
            v69 = v49;
            _os_log_impl(&dword_1830D4000, v40, v50, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_78;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v40, v50, "%{public}s called with null delegate, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v40 = __nwlog_obj();
        os_log_type_t v56 = location;
        if (os_log_type_enabled(v40, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v40, v56, "%{public}s called with null delegate, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_78:
    if (v39) {
      free(v39);
    }
LABEL_74:

LABEL_86:
    v24 = 0;
    goto LABEL_17;
  }
  v64.receiver = self;
  v64.super_class = (Class)NWUDPListener;
  id v9 = [(NWUDPListener *)&v64 init];
  if (!v9)
  {
    v42 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v67 = "-[NWUDPListener initWithParameters:delegate:]";
    v43 = (char *)_os_log_send_and_compose_impl();

    LOBYTE(location) = 16;
    os_log_type_t v65 = OS_LOG_TYPE_DEFAULT;
    if (__nwlog_fault(v43, &location, &v65))
    {
      if (location == 17)
      {
        v44 = __nwlog_obj();
        os_log_type_t v45 = location;
        if (os_log_type_enabled(v44, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v44, v45, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v65)
      {
        v52 = (char *)__nw_create_backtrace_string();
        v44 = __nwlog_obj();
        os_log_type_t v53 = location;
        BOOL v54 = os_log_type_enabled(v44, (os_log_type_t)location);
        if (v52)
        {
          if (v54)
          {
            *(_DWORD *)buf = 136446466;
            v67 = "-[NWUDPListener initWithParameters:delegate:]";
            __int16 v68 = 2082;
            v69 = v52;
            _os_log_impl(&dword_1830D4000, v44, v53, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v52);
          goto LABEL_84;
        }
        if (v54)
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v44, v53, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v44 = __nwlog_obj();
        os_log_type_t v57 = location;
        if (os_log_type_enabled(v44, (os_log_type_t)location))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          _os_log_impl(&dword_1830D4000, v44, v57, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_84:
    if (v43) {
      free(v43);
    }
    goto LABEL_86;
  }
  objc_initWeak(&location, v9);
  v10 = [v6 internalParameters];
  v11 = nw_parameters_copy_default_protocol_stack(v10);

  options = nw_udp_create_options();
  nw_protocol_stack_set_transport_protocol(v11, options);

  v13 = [v6 internalParameters];
  nw_parameters_set_data_mode(v13, 1u);

  v14 = [v6 internalParameters];
  nw_listener_t v15 = nw_listener_create(v14);
  v16 = (void *)*((void *)v9 + 3);
  *((void *)v9 + 3) = v15;

  v17 = *((void *)v9 + 3);
  if (v17)
  {
    if (NWCopyInternalQueue_init_once != -1) {
      dispatch_once(&NWCopyInternalQueue_init_once, &__block_literal_global_63972);
    }
    v18 = (id)NWCopyInternalQueue_nwQueue;
    nw_listener_set_queue(v17, v18);

    v19 = *((void *)v9 + 3);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__NWUDPListener_initWithParameters_delegate___block_invoke;
    handler[3] = &unk_1E524B440;
    objc_copyWeak(&v61, &location);
    nw_listener_set_state_changed_handler(v19, handler);
    v20 = *((void *)v9 + 3);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __45__NWUDPListener_initWithParameters_delegate___block_invoke_2;
    v58[3] = &unk_1E524B418;
    objc_copyWeak(&v59, &location);
    nw_listener_set_new_connection_handler(v20, v58);
    uint64_t v21 = [v6 copy];
    v22 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = v21;

    objc_storeWeak((id *)v9 + 6, v8);
    v23 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = 0;

    nw_listener_start(*((nw_listener_t *)v9 + 3));
    v24 = (NWUDPListener *)v9;
    objc_destroyWeak(&v59);
    objc_destroyWeak(&v61);
    goto LABEL_16;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v25 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v67 = "-[NWUDPListener initWithParameters:delegate:]";
  v26 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v65 = OS_LOG_TYPE_ERROR;
  char v62 = 0;
  if (__nwlog_fault(v26, &v65, &v62))
  {
    if (v65 == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v27 = (id)gLogObj;
      os_log_type_t v28 = v65;
      if (os_log_type_enabled(v27, v65))
      {
        *(_DWORD *)buf = 136446210;
        v67 = "-[NWUDPListener initWithParameters:delegate:]";
        _os_log_impl(&dword_1830D4000, v27, v28, "%{public}s nw_listener_create failed", buf, 0xCu);
      }
    }
    else if (v62)
    {
      v30 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v27 = (id)gLogObj;
      os_log_type_t v31 = v65;
      BOOL v32 = os_log_type_enabled(v27, v65);
      if (v30)
      {
        if (v32)
        {
          *(_DWORD *)buf = 136446466;
          v67 = "-[NWUDPListener initWithParameters:delegate:]";
          __int16 v68 = 2082;
          v69 = v30;
          _os_log_impl(&dword_1830D4000, v27, v31, "%{public}s nw_listener_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v30);
        if (!v26) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446210;
        v67 = "-[NWUDPListener initWithParameters:delegate:]";
        _os_log_impl(&dword_1830D4000, v27, v31, "%{public}s nw_listener_create failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v27 = (id)gLogObj;
      os_log_type_t v33 = v65;
      if (os_log_type_enabled(v27, v65))
      {
        *(_DWORD *)buf = 136446210;
        v67 = "-[NWUDPListener initWithParameters:delegate:]";
        _os_log_impl(&dword_1830D4000, v27, v33, "%{public}s nw_listener_create failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
  if (v26) {
LABEL_14:
  }
    free(v26);
LABEL_15:
  v24 = 0;
LABEL_16:

  objc_destroyWeak(&location);
LABEL_17:

  return v24;
}

void __45__NWUDPListener_initWithParameters_delegate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      id v7 = [WeakRetained internalListener];
      unsigned int port = nw_listener_get_port(v7);

      if (port)
      {
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u", port);
        v10 = +[NWAddressEndpoint endpointWithHostname:@"0.0.0.0" port:v9];
        [v6 setLocalEndpoint:v10];
      }
    }
    [v6 handleError:v11];
  }
}

void __45__NWUDPListener_initWithParameters_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleConnection:v5];
  }
}

- (void)handleError:(id)a3
{
  if (a3)
  {
    CFErrorRef v4 = nw_error_copy_cf_error((nw_error_t)a3);
    [(NWUDPListener *)self setError:v4];
  }
  else
  {
    -[NWUDPListener setError:](self, "setError:");
  }
}

- (void)handleConnection:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NWUDPListener *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = [[NWUDPSession alloc] initWithConnection:v4];
    [v5 handleSession:v6];
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v6 = (NWUDPSession *)(id)gLogObj;
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446210;
      v8 = "-[NWUDPListener handleConnection:]";
      _os_log_impl(&dword_1830D4000, &v6->super, OS_LOG_TYPE_ERROR, "%{public}s UDP listener received connection, but delegate is nil", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end