@interface NWDatagramConnection
+ (NWDatagramConnection)connectionWithConnectedSocket:(int)a3;
- (BOOL)readDatagramsWithMinimumCount:(unint64_t)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)writeDatagrams:(id)a3 completionHandler:(id)a4;
@end

@implementation NWDatagramConnection

- (BOOL)writeDatagrams:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  size_t v8 = [v6 count];
  if (!v8)
  {
LABEL_30:
    char v18 = 0;
    goto LABEL_31;
  }
  unint64_t v9 = v8;
  v10 = malloc_type_calloc(v8, 8uLL, 0x80040B8603338uLL);
  if (!v10)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
    __int16 v38 = 1024;
    int v39 = v9;
    __int16 v40 = 2048;
    uint64_t v41 = 8;
    v20 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v34 = 0;
    if (!__nwlog_fault(v20, &type, &v34)) {
      goto LABEL_28;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = 8;
        v23 = "%{public}s calloc(%u, %zu) failed";
LABEL_25:
        v29 = v21;
        os_log_type_t v30 = v22;
LABEL_26:
        _os_log_impl(&dword_1830D4000, v29, v30, v23, buf, 0x1Cu);
      }
    }
    else
    {
      if (v34)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v21 = (id)gLogObj;
        os_log_type_t v27 = type;
        BOOL v28 = os_log_type_enabled(v21, type);
        if (backtrace_string)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446978;
            v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
            __int16 v38 = 1024;
            int v39 = v9;
            __int16 v40 = 2048;
            uint64_t v41 = 8;
            __int16 v42 = 2082;
            v43 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v21, v27, "%{public}s calloc(%u, %zu) failed, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          goto LABEL_28;
        }
        if (!v28) {
          goto LABEL_27;
        }
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = 8;
        v23 = "%{public}s calloc(%u, %zu) failed, no backtrace";
        v29 = v21;
        os_log_type_t v30 = v27;
        goto LABEL_26;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v21 = (id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446722;
        v37 = "-[NWDatagramConnection writeDatagrams:completionHandler:]";
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = 8;
        v23 = "%{public}s calloc(%u, %zu) failed, backtrace limit exceeded";
        goto LABEL_25;
      }
    }
LABEL_27:

LABEL_28:
    if (v20) {
      free(v20);
    }
    goto LABEL_30;
  }
  v11 = v10;
  for (uint64_t i = 0; i != v9; ++i)
  {
    v14 = [v6 objectAtIndexedSubscript:i];
    v15 = v14;
    if (v14) {
      v14 = (void *)[v14 _createDispatchData];
    }
    v13 = (void *)v11[i];
    v11[i] = v14;
  }
  v16 = [(NWConnection *)self internalConnection];
  v17 = v16;
  if (v7 == &__block_literal_global_14208)
  {
    char v18 = nw_connection_write_multiple(v16, (uint64_t)v11, v9, &__block_literal_global_45);
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__NWDatagramConnection_writeDatagrams_completionHandler___block_invoke;
    v32[3] = &unk_1E5249818;
    id v33 = v7;
    char v18 = nw_connection_write_multiple(v17, (uint64_t)v11, v9, v32);
  }
  uint64_t v24 = 0;
  if (v9 <= 1) {
    unint64_t v9 = 1;
  }
  do
  {
    v25 = (void *)v11[v24];
    v11[v24] = 0;

    ++v24;
  }
  while (v9 != v24);
  free(v11);
LABEL_31:

  return v18;
}

void __57__NWDatagramConnection_writeDatagrams_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a2 userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)readDatagramsWithMinimumCount:(unint64_t)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  unint64_t v9 = [(NWConnection *)self internalConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__NWDatagramConnection_readDatagramsWithMinimumCount_maximumCount_completionHandler___block_invoke;
  v12[3] = &unk_1E52497E0;
  id v13 = v8;
  id v10 = v8;
  LOBYTE(v5) = nw_connection_read_multiple(v9, v6, v5, v12);

  return v5;
}

void __85__NWDatagramConnection_readDatagramsWithMinimumCount_maximumCount_completionHandler___block_invoke(uint64_t a1, id *a2, unsigned int a3, int a4)
{
  id v11 = [MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    uint64_t v8 = a3;
    do
    {
      if (*a2)
      {
        id v9 = *a2;

        [v11 addObject:v9];
      }
      ++a2;
      --v8;
    }
    while (v8);
  }
  if (a4)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a4 userInfo:0];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (NWDatagramConnection)connectionWithConnectedSocket:(int)a3
{
  uint64_t v3 = [(NWConnection *)[NWDatagramConnection alloc] initWithConnectedSocket:*(void *)&a3];

  return v3;
}

@end