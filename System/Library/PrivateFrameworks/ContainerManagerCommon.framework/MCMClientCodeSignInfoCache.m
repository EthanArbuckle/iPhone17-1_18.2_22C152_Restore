@interface MCMClientCodeSignInfoCache
- (MCMCache)cache;
- (MCMClientCodeSignInfoCache)init;
- (id)codeSignInfoForCDHash:(id)a3 identifier:(id)a4 error:(id *)a5 generator:(id)a6;
- (void)flush;
@end

@implementation MCMClientCodeSignInfoCache

- (id)codeSignInfoForCDHash:(id)a3 identifier:(id)a4 error:(id *)a5 generator:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = (void (**)(id, id *))a6;
  id v12 = a3;
  v13 = [[MCMClientCodeSignIndex alloc] initWithCDHash:v12 identifier:v10];

  if (!v13)
  {
    v18 = container_log_handle_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, "Could not generate code sign index for [%@]", buf, 0xCu);
    }

    id v16 = 0;
LABEL_7:
    if (a5)
    {
      id v16 = v16;
      v17 = 0;
      v15 = 0;
      *a5 = v16;
    }
    else
    {
      v17 = 0;
      v15 = 0;
    }
    goto LABEL_13;
  }
  v14 = [(MCMClientCodeSignInfoCache *)self cache];
  v15 = [v14 objectForKey:v13];

  if (v15)
  {
    id v16 = 0;
    v17 = 0;
    goto LABEL_13;
  }
  id v24 = 0;
  v15 = v11[2](v11, &v24);
  id v16 = v24;
  if (!v15) {
    goto LABEL_7;
  }
  v19 = [v15 clientCodeSignInfoByChangingCached:1];
  v17 = v19;
  if (v19)
  {
    v20 = [v19 entitlements];
    [v20 prune];

    v21 = [(MCMClientCodeSignInfoCache *)self cache];
    [v21 setObject:v17 forKey:v13];
  }
LABEL_13:
  id v22 = v15;

  return v22;
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
  id v2 = [(MCMClientCodeSignInfoCache *)self cache];
  [v2 removeAllObjects];
}

- (MCMClientCodeSignInfoCache)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMClientCodeSignInfoCache;
  id v2 = [(MCMClientCodeSignInfoCache *)&v6 init];
  if (v2)
  {
    v3 = [[MCMLRUCache alloc] initWithName:@"clientCodeSignInfo" maxCount:30];
    cache = v2->_cache;
    v2->_cache = (MCMCache *)v3;
  }
  return v2;
}

@end