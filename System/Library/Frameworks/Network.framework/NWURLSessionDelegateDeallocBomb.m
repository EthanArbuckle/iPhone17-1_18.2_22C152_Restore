@interface NWURLSessionDelegateDeallocBomb
- (uint64_t)disarm;
- (void)dealloc;
@end

@implementation NWURLSessionDelegateDeallocBomb

- (void).cxx_destruct
{
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self || !self->__disarmed)
  {
    uint64_t v12 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (self)
    {
      if (self->__method) {
        method = self->__method;
      }
      else {
        method = 0;
      }
      Name = sel_getName(method);
      object = self->__object;
    }
    else
    {
      Name = sel_getName(0);
      object = 0;
    }
    v6 = object;
    v7 = objc_opt_class();
    if (self)
    {
      v8 = self->__object;
      v9 = self->__object;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    int v13 = 136315906;
    v14 = Name;
    __int16 v15 = 2112;
    v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    __int16 v19 = 2048;
    v20 = v9;
    id v10 = v7;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  v11.receiver = self;
  v11.super_class = (Class)NWURLSessionDelegateDeallocBomb;
  [(NWURLSessionDelegateDeallocBomb *)&v11 dealloc];
}

- (uint64_t)disarm
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 8))
    {
      os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      v2 = 0;
      if (*(void *)(v1 + 24)) {
        v2 = *(const char **)(v1 + 24);
      }
      sel_getName(v2);
      id v3 = *(id *)(v1 + 16);
      v6 = objc_opt_class();
      id v4 = *(id *)(v1 + 16);
      id v5 = v6;
      _os_log_send_and_compose_impl();

      _os_crash_msg();
      __break(1u);
    }
    *(unsigned char *)(result + 8) = 1;
  }
  return result;
}

@end