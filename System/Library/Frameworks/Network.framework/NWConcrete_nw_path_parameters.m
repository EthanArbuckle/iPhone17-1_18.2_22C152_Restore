@interface NWConcrete_nw_path_parameters
- (NWConcrete_nw_path_parameters)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_path_parameters

- (void)dealloc
{
  v3 = *(void **)&self->joinable_path_value.fallback_mode;
  if (v3)
  {
    free(v3);
    *(void *)&self->joinable_path_value.fallback_mode = 0;
  }
  account_id = self->account_id;
  if (account_id)
  {
    free(account_id);
    self->account_id = 0;
  }
  attribution_context = self->attribution_context;
  if (attribution_context)
  {
    free(attribution_context);
    self->attribution_context = 0;
  }
  required_interface = self->required_interface;
  if (required_interface)
  {
    v7 = *(void **)required_interface;
    *(void *)required_interface = 0;

    v8 = self->required_interface;
    v9 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = 0;

    v10 = self->required_interface;
    v11 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = 0;

    v12 = self->required_interface;
    v13 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = 0;

    v14 = self->required_interface;
    v15 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = 0;

    v16 = self->required_interface;
    v17 = (void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = 0;

    v18 = self->required_interface;
    v19 = (void *)*((void *)v18 + 6);
    *((void *)v18 + 6) = 0;

    v20 = self->required_interface;
    v21 = (void *)*((void *)v20 + 7);
    *((void *)v20 + 7) = 0;

    v22 = self->required_interface;
    v23 = (void *)*((void *)v22 + 8);
    *((void *)v22 + 8) = 0;

    v24 = self->required_interface;
    v25 = (void *)*((void *)v24 + 9);
    *((void *)v24 + 9) = 0;

    v26 = self->required_interface;
    v27 = (void *)*((void *)v26 + 10);
    *((void *)v26 + 10) = 0;

    v28 = self->required_interface;
    v29 = (void *)*((void *)v28 + 11);
    *((void *)v28 + 11) = 0;

    v30 = self->required_interface;
    v31 = (void *)*((void *)v30 + 12);
    *((void *)v30 + 12) = 0;

    v32 = self->required_interface;
    v33 = (void *)*((void *)v32 + 13);
    *((void *)v32 + 13) = 0;

    v34 = self->required_interface;
    v35 = (void *)*((void *)v34 + 14);
    *((void *)v34 + 14) = 0;

    v36 = self->required_interface;
    v37 = (void *)*((void *)v36 + 15);
    *((void *)v36 + 15) = 0;

    v38 = self->required_interface;
    v39 = (void *)*((void *)v38 + 16);
    *((void *)v38 + 16) = 0;

    v40 = self->required_interface;
    v41 = (void *)*((void *)v40 + 17);
    *((void *)v40 + 17) = 0;

    v42 = self->required_interface;
    if (v42)
    {
      free(v42);
      self->required_interface = 0;
    }
  }
  v43.receiver = self;
  v43.super_class = (Class)NWConcrete_nw_path_parameters;
  [(NWConcrete_nw_path_parameters *)&v43 dealloc];
}

- (NWConcrete_nw_path_parameters)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_path_parameters;
  v2 = [(NWConcrete_nw_path_parameters *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path_parameters init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_path_parameters init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path_parameters init]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->local_address, 0);
  objc_storeStrong((id *)&self->internet_options, 0);
  objc_storeStrong((id *)&self->transport_options, 0);
  objc_storeStrong((id *)&self->context, 0);

  objc_storeStrong((id *)&self->attributed_bundle, 0);
}

@end