@interface NWConcrete_nw_storage
- (NWConcrete_nw_storage)init;
- (void)dealloc;
@end

@implementation NWConcrete_nw_storage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->flush_queue, 0);
  objc_storeStrong((id *)&self->canvas_cache, 0);
  objc_storeStrong((id *)&self->providers, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

- (void)dealloc
{
  os_unfair_lock_lock((os_unfair_lock_t)&storages_lock);
  tqe_next = self->chain.entry.tqe_next;
  tqe_prev = self->chain.entry.tqe_prev;
  if (tqe_next)
  {
    tqe_next->entry.tqe_prev = tqe_prev;
    tqe_prev = self->chain.entry.tqe_prev;
  }
  else
  {
    qword_1E8F684C0 = (uint64_t)self->chain.entry.tqe_prev;
  }
  *tqe_prev = tqe_next;
  os_unfair_lock_unlock((os_unfair_lock_t)&storages_lock);
  path = self->path;
  if (path)
  {
    free(path);
    self->path = 0;
  }
  sqlite3_finalize(self->load_stmt);
  sqlite3_finalize(self->save_stmt);
  sqlite3_finalize(self->delete_stmt);
  sqlite3_close(self->db);
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_storage;
  [(NWConcrete_nw_storage *)&v6 dealloc];
}

- (NWConcrete_nw_storage)init
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)NWConcrete_nw_storage;
  v2 = [(NWConcrete_nw_storage *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.network.storage", v3);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v4;

    objc_super v6 = (OS_nw_dictionary *)nw_dictionary_create();
    providers = v2->providers;
    v2->providers = v6;

    v8 = (OS_nw_dictionary *)nw_dictionary_create();
    canvas_cache = v2->canvas_cache;
    v2->canvas_cache = v8;

    BOOL v10 = nw_array_create();
    flush_queue = v2->flush_queue;
    v2->flush_queue = (OS_nw_array *)v10;

    long long v28 = xmmword_1ECF66DD0;
    long long v29 = *(_OWORD *)&off_1ECF66DE0;
    long long v30 = xmmword_1ECF66DF0;
    *(_OWORD *)buf = xmmword_1ECF66D90;
    *(_OWORD *)&buf[16] = *(_OWORD *)&off_1ECF66DA0;
    long long v26 = xmmword_1ECF66DB0;
    long long v27 = *(_OWORD *)&off_1ECF66DC0;
    nw_storage_register_provider(v2, "h3_0rtt", (long long *)buf);
    long long v28 = xmmword_1ECF66E40;
    long long v29 = *(_OWORD *)&off_1ECF66E50;
    long long v30 = xmmword_1ECF66E60;
    *(_OWORD *)buf = xmmword_1ECF66E00;
    *(_OWORD *)&buf[16] = *(_OWORD *)&off_1ECF66E10;
    long long v26 = xmmword_1ECF66E20;
    long long v27 = *(_OWORD *)&off_1ECF66E30;
    nw_storage_register_provider(v2, "dns_cache", (long long *)buf);
    if (init_once != -1) {
      dispatch_once(&init_once, &__block_literal_global_66_45276);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&storages_lock);
    v2->chain.entry.tqe_next = 0;
    v12 = (nw_storage_chain **)qword_1E8F684C0;
    v2->chain.entry.tqe_prev = (nw_storage_chain **)qword_1E8F684C0;
    *v12 = &v2->chain;
    qword_1E8F684C0 = (uint64_t)&v2->chain;
    os_unfair_lock_unlock((os_unfair_lock_t)&storages_lock);
    v13 = v2;
    goto LABEL_5;
  }
  v15 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  *(void *)&buf[4] = "-[NWConcrete_nw_storage init]";
  v16 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v22 = 0;
  if (__nwlog_fault(v16, &type, &v22))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "-[NWConcrete_nw_storage init]";
        v19 = "%{public}s [super init] failed";
LABEL_19:
        _os_log_impl(&dword_1830D4000, v17, v18, v19, buf, 0xCu);
      }
    }
    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v17 = __nwlog_obj();
        os_log_type_t v18 = type;
        BOOL v21 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "-[NWConcrete_nw_storage init]";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_21;
        }
        if (!v21) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "-[NWConcrete_nw_storage init]";
        v19 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_19;
      }
      v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&buf[4] = "-[NWConcrete_nw_storage init]";
        v19 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_19;
      }
    }
LABEL_20:
  }
LABEL_21:
  if (v16) {
    free(v16);
  }
LABEL_5:

  return v2;
}

@end