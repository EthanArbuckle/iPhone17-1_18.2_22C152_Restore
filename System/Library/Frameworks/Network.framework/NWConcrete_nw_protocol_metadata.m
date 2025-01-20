@interface NWConcrete_nw_protocol_metadata
- (id)initWithDefinition:(_OWORD *)a3 identifier:;
- (void)dealloc;
@end

@implementation NWConcrete_nw_protocol_metadata

- (void).cxx_destruct
{
}

- (id)initWithDefinition:(_OWORD *)a3 identifier:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v6 = a2;
  v7 = v6;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    v12 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (__nwlog_fault(v13, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v14 = __nwlog_obj();
        os_log_type_t v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null _definition", buf, 0xCu);
        }
      }
      else if (v29)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v14 = __nwlog_obj();
        os_log_type_t v21 = type;
        BOOL v22 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v22)
          {
            *(_DWORD *)buf = 136446466;
            v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
            __int16 v33 = 2082;
            v34 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v14, v21, "%{public}s called with null _definition, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_39;
        }
        if (v22)
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_1830D4000, v14, v21, "%{public}s called with null _definition, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v14 = __nwlog_obj();
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_1830D4000, v14, v26, "%{public}s called with null _definition, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_39:
    if (v13) {
      free(v13);
    }

    goto LABEL_47;
  }
  v28.receiver = a1;
  v28.super_class = (Class)NWConcrete_nw_protocol_metadata;
  v8 = (id *)objc_msgSendSuper2(&v28, sel_init);
  a1 = v8;
  if (!v8)
  {
    v16 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
    v17 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v29 = 0;
    if (__nwlog_fault(v17, &type, &v29))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v18 = __nwlog_obj();
        os_log_type_t v19 = type;
        if (os_log_type_enabled(v18, type))
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_1830D4000, v18, v19, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v29)
      {
        v23 = (char *)__nw_create_backtrace_string();
        v18 = __nwlog_obj();
        os_log_type_t v24 = type;
        BOOL v25 = os_log_type_enabled(v18, type);
        if (v23)
        {
          if (v25)
          {
            *(_DWORD *)buf = 136446466;
            v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
            __int16 v33 = 2082;
            v34 = v23;
            _os_log_impl(&dword_1830D4000, v18, v24, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v23);
          goto LABEL_45;
        }
        if (v25)
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_1830D4000, v18, v24, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v18 = __nwlog_obj();
        os_log_type_t v27 = type;
        if (os_log_type_enabled(v18, type))
        {
          *(_DWORD *)buf = 136446210;
          v32 = "-[NWConcrete_nw_protocol_metadata initWithDefinition:identifier:]";
          _os_log_impl(&dword_1830D4000, v18, v27, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_45:
    if (v17) {
      free(v17);
    }
LABEL_47:
    a1 = 0;
    goto LABEL_6;
  }
  objc_storeStrong(v8 + 1, a2);
  *((_OWORD *)a1 + 1) = *a3;
  v9 = (uint64_t (*)(void *))v7[18];
  if (v9)
  {
    a1[4] = (id)v9(v7);
  }
  else
  {
    uint64_t v11 = v7[10];
    if (v11 && *(void *)(v11 + 232))
    {
      a1[4] = a1 + 5;
      (*(void (**)(void *))(v7[10] + 232))(v7);
    }
  }
LABEL_6:

  return a1;
}

- (void)dealloc
{
  if (self->handle)
  {
    definition = self->definition;
    if (definition)
    {
      deallocate_metadata = (void (*)(void))definition->deallocate_metadata;
      if (deallocate_metadata
        || (extended_state = definition->extended_state) != 0
        && (deallocate_metadata = (void (*)(void))extended_state->var30) != 0)
      {
        deallocate_metadata();
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_protocol_metadata;
  [(NWConcrete_nw_protocol_metadata *)&v6 dealloc];
}

@end