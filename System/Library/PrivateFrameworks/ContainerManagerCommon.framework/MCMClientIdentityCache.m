@interface MCMClientIdentityCache
- (MCMCache)cache;
- (MCMClientIdentityCache)init;
- (id)clientIdentityWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5 error:(id *)a6 generator:(id)a7;
- (void)flush;
@end

@implementation MCMClientIdentityCache

- (id)clientIdentityWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5 error:(id *)a6 generator:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v12 = (void (**)(id, id *))a7;
  id v13 = a5;
  v14 = [MCMClientIdentityIndex alloc];
  long long v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  long long v31 = v15;
  long long v16 = *(_OWORD *)&a4->var0[4];
  v29[0] = *(_OWORD *)a4->var0;
  v29[1] = v16;
  v17 = [(MCMClientIdentityIndex *)v14 initWithAuditToken:buf proximateAuditToken:v29 personaUniqueString:v13];

  if (!v17)
  {
    v22 = container_log_handle_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v26 = *(_OWORD *)&a3->var0[4];
      *(_OWORD *)buf = *(_OWORD *)a3->var0;
      long long v31 = v26;
      int pid = container_audit_token_get_pid();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Could not generate client identity index for pid %d", buf, 8u);
    }

    id v20 = 0;
LABEL_7:
    if (a6)
    {
      id v20 = v20;
      v21 = 0;
      v19 = 0;
      *a6 = v20;
    }
    else
    {
      v21 = 0;
      v19 = 0;
    }
    goto LABEL_13;
  }
  v18 = [(MCMClientIdentityCache *)self cache];
  v19 = [v18 objectForKey:v17];

  if (v19)
  {
    id v20 = 0;
    v21 = 0;
    goto LABEL_13;
  }
  id v28 = 0;
  v19 = v12[2](v12, &v28);
  id v20 = v28;
  if (!v19) {
    goto LABEL_7;
  }
  v21 = [v19 clientIdentityByChangingCached:1];
  if (v21)
  {
    v23 = [(MCMClientIdentityCache *)self cache];
    [v23 setObject:v21 forKey:v17];
  }
LABEL_13:
  id v24 = v19;

  return v24;
}

- (MCMCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  p_cache = &self->_cache;

  objc_storeStrong((id *)p_cache, 0);
}

- (void)flush
{
  id v2 = [(MCMClientIdentityCache *)self cache];
  [v2 removeAllObjects];
}

- (MCMClientIdentityCache)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMClientIdentityCache;
  id v2 = [(MCMClientIdentityCache *)&v6 init];
  if (v2)
  {
    v3 = [[MCMLRUCache alloc] initWithName:@"perPersonaClients" maxCount:30];
    cache = v2->_cache;
    v2->_cache = (MCMCache *)v3;
  }
  return v2;
}

@end