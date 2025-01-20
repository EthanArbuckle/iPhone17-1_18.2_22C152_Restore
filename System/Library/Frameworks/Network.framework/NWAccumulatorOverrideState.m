@interface NWAccumulatorOverrideState
- (NSString)name;
- (NSString)state;
- (NWAccumulatorOverrideState)init;
- (id)description;
- (void)setName:(id)a3;
- (void)setState:(id)a3;
- (void)updateWithState:(id)a3;
@end

@implementation NWAccumulatorOverrideState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setState:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)updateWithState:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__NWAccumulatorOverrideState_updateWithState___block_invoke;
    v13[3] = &unk_1E524B9A0;
    v13[4] = self;
    id v14 = v4;
    os_unfair_lock_lock(&self->_lock);
    __46__NWAccumulatorOverrideState_updateWithState___block_invoke((uint64_t)v13);
    os_unfair_lock_unlock(&self->_lock);

    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWAccumulatorOverrideState updateWithState:]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v16 = OS_LOG_TYPE_ERROR;
  char v15 = 0;
  if (__nwlog_fault(v7, &v16, &v15))
  {
    if (v16 == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = v16;
      if (os_log_type_enabled(v8, v16))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWAccumulatorOverrideState updateWithState:]";
        v10 = "%{public}s called with null state";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v15)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v8 = __nwlog_obj();
        os_log_type_t v9 = v16;
        BOOL v12 = os_log_type_enabled(v8, v16);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v18 = "-[NWAccumulatorOverrideState updateWithState:]";
            __int16 v19 = 2082;
            v20 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s called with null state, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v12) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWAccumulatorOverrideState updateWithState:]";
        v10 = "%{public}s called with null state, no backtrace";
        goto LABEL_17;
      }
      v8 = __nwlog_obj();
      os_log_type_t v9 = v16;
      if (os_log_type_enabled(v8, v16))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWAccumulatorOverrideState updateWithState:]";
        v10 = "%{public}s called with null state, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v7) {
    free(v7);
  }
LABEL_3:
}

void __46__NWAccumulatorOverrideState_updateWithState___block_invoke(uint64_t a1)
{
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(NWAccumulatorOverrideState *)self name];
  v5 = [(NWAccumulatorOverrideState *)self state];
  v6 = (void *)[v3 initWithFormat:@"<NWAccumulatorOverrideState %@, state: %@>", v4, v5];

  return v6;
}

- (NWAccumulatorOverrideState)init
{
  v3.receiver = self;
  v3.super_class = (Class)NWAccumulatorOverrideState;
  result = [(NWAccumulatorOverrideState *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end