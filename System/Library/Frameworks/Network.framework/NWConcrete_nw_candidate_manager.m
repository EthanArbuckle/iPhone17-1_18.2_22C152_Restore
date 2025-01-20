@interface NWConcrete_nw_candidate_manager
- (NSString)description;
- (id)init:(id)a3;
@end

@implementation NWConcrete_nw_candidate_manager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ids_path_evaluator, 0);
  objc_storeStrong(&self->new_connection_handler, 0);
  objc_storeStrong(&self->state_handler, 0);
  objc_storeStrong((id *)&self->candidates, 0);
  objc_storeStrong((id *)&self->connection, 0);
  objc_storeStrong(&self->modify_ids_parameters, 0);
  objc_storeStrong(&self->remove_eligible_details, 0);
  objc_storeStrong(&self->add_eligible_details, 0);
  objc_storeStrong((id *)&self->original_remote_endpoint, 0);
  objc_storeStrong((id *)&self->hostname_resolvers, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->awdl_endpoint, 0);
  objc_storeStrong((id *)&self->awdl_service_resolver, 0);
  objc_storeStrong((id *)&self->service_resolver, 0);
  objc_storeStrong((id *)&self->service, 0);
  objc_storeStrong((id *)&self->ids_candidates, 0);
  objc_storeStrong((id *)&self->ids_resolve_registrations, 0);

  objc_storeStrong((id *)&self->ids_endpoint, 0);
}

- (NSString)description
{
  parameters = self->parameters;
  if (parameters)
  {
    v4 = parameters;
    if ((*((void *)v4 + 12) & 0x8000) != 0) {
      v5 = "server ";
    }
    else {
      v5 = "client ";
    }
  }
  else
  {
    v5 = "";
  }
  service = self->service;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  unint64_t log_id = self->log_id;
  if (service)
  {
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(service);
    bonjour_service_type = nw_endpoint_get_bonjour_service_type((nw_endpoint_t)self->service);
    v10 = (__CFString *)CFStringCreateWithFormat(v7, 0, @"[CM%zu %s%s.%s]", log_id, v5, bonjour_service_name, bonjour_service_type);
  }
  else
  {
    v10 = (__CFString *)CFStringCreateWithFormat(v7, 0, @"[CM%zu %s]", self->log_id, v5);
  }

  return (NSString *)v10;
}

- (id)init:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_candidate_manager init:]";
    v11 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (__nwlog_fault(v11, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v12 = __nwlog_obj();
        os_log_type_t v13 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_1830D4000, v12, v13, "%{public}s called with null _parameters", buf, 0xCu);
        }
      }
      else if (v27)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v12 = __nwlog_obj();
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v12, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_candidate_manager init:]";
            __int16 v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v12, v19, "%{public}s called with null _parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_34;
        }
        if (v20)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_1830D4000, v12, v19, "%{public}s called with null _parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v12 = __nwlog_obj();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v12, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_1830D4000, v12, v24, "%{public}s called with null _parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_34:
    if (v11) {
      free(v11);
    }

    goto LABEL_42;
  }
  v26.receiver = self;
  v26.super_class = (Class)NWConcrete_nw_candidate_manager;
  v6 = [(NWConcrete_nw_candidate_manager *)&v26 init];
  if (!v6)
  {
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_candidate_manager init:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (__nwlog_fault(v15, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v16 = __nwlog_obj();
        os_log_type_t v17 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v27)
      {
        v21 = (char *)__nw_create_backtrace_string();
        v16 = __nwlog_obj();
        os_log_type_t v22 = type;
        BOOL v23 = os_log_type_enabled(v16, type);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_candidate_manager init:]";
            __int16 v31 = 2082;
            v32 = v21;
            _os_log_impl(&dword_1830D4000, v16, v22, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v21);
          goto LABEL_40;
        }
        if (v23)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_1830D4000, v16, v22, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v16 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v16, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_candidate_manager init:]";
          _os_log_impl(&dword_1830D4000, v16, v25, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_40:
    if (v15) {
      free(v15);
    }
LABEL_42:
    v6 = 0;
    goto LABEL_4;
  }
  v6->unint64_t log_id = nw_candidate_manager_get_next_id();
  objc_storeStrong((id *)&v6->parameters, a3);
  BOOL v7 = nw_array_create();
  candidates = v6->candidates;
  v6->candidates = (OS_nw_array *)v7;

LABEL_4:
  return v6;
}

@end