@interface NWConcrete_nw_activity
- (NSString)description;
- (char)initWithToken:(void *)a1;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_activity

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((_DWORD *)self + 20) = 0;
  *((void *)self + 11) = 0;
  *((_DWORD *)self + 26) = 0;
  return self;
}

- (void).cxx_destruct
{
  m_obj = self->description_cache.description.m_obj;
  if ((*((unsigned char *)&self->description_cache.description + 8) & 1) != 0 && m_obj)
  {
    self->description_cache.description.m_obj = 0;

    m_obj = self->description_cache.description.m_obj;
  }
  self->description_cache.description.m_obj = 0;

  v4 = self->parent.m_obj;
  if ((*((unsigned char *)&self->parent + 8) & 1) != 0 && v4)
  {
    self->parent.m_obj = 0;

    v4 = self->parent.m_obj;
  }
  self->parent.m_obj = 0;

  v5 = self->parent.m_obj;
}

- (NSString)description
{
  void (**v3)(void **__return_ptr, void *);
  unfair_mutex *p_mutex;
  NSString *m_obj;
  void **v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void v12[5];
  void *__p[2];
  char v14;
  uint64_t vars8;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__NWConcrete_nw_activity_description__block_invoke;
  v12[3] = &unk_1E52448B0;
  v12[4] = self;
  v3 = (void (**)(void **__return_ptr, void *))_Block_copy(v12);
  p_mutex = &self->description_cache.mutex;
  os_unfair_lock_lock(&self->description_cache.mutex.m_mutex);
  m_obj = self->description_cache.description.m_obj;
  if (!m_obj)
  {
    v3[2](__p, v3);
    if (v14 >= 0) {
      v6 = __p;
    }
    else {
      v6 = (void **)__p[0];
    }
    v7 = (NSString *)CFStringCreateWithCString(0, (const char *)v6, 0x8000100u);
    v8 = self->description_cache.description.m_obj;
    if ((*((unsigned char *)&self->description_cache.description + 8) & 1) != 0 && v8)
    {
      self->description_cache.description.m_obj = 0;

      v8 = self->description_cache.description.m_obj;
    }
    self->description_cache.description.m_obj = 0;

    v9 = self->description_cache.description.m_obj;
    self->description_cache.description.m_obj = v7;

    *((unsigned char *)&self->description_cache.description + 8) |= 1u;
    if (v14 < 0) {
      operator delete(__p[0]);
    }
    m_obj = self->description_cache.description.m_obj;
  }
  v10 = m_obj;
  os_unfair_lock_unlock(&p_mutex->m_mutex);

  return v10;
}

- (void)dealloc
{
  underlying_error_domain_string = self->underlying_error_domain_string;
  if (underlying_error_domain_string)
  {
    free(underlying_error_domain_string);
    self->underlying_error_domain_string = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_activity;
  [(NWConcrete_nw_activity *)&v4 dealloc];
}

- (char)initWithToken:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v17.receiver = a1;
  v17.super_class = (Class)NWConcrete_nw_activity;
  v3 = (char *)objc_msgSendSuper2(&v17, sel_init);
  objc_super v4 = v3;
  if (!v3)
  {
    v7 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
    v8 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v15 = 0;
    if (__nwlog_fault(v8, &type, &v15))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v9 = __nwlog_obj();
        os_log_type_t v10 = type;
        if (os_log_type_enabled(v9, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
          _os_log_impl(&dword_1830D4000, v9, v10, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v15)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v9 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v13 = os_log_type_enabled(v9, type);
        if (backtrace_string)
        {
          if (v13)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
            *(_WORD *)&v19[8] = 2082;
            *(void *)&v19[10] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v9, v12, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_26;
        }
        if (v13)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
          _os_log_impl(&dword_1830D4000, v9, v12, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v9 = __nwlog_obj();
        os_log_type_t v14 = type;
        if (os_log_type_enabled(v9, type))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)v19 = "-[NWConcrete_nw_activity initWithToken:]";
          _os_log_impl(&dword_1830D4000, v9, v14, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_26:
    if (v8) {
      free(v8);
    }
    return 0;
  }
  *(_OWORD *)(v3 + 8) = *a2;
  v3[140] |= 6u;
  if (nw_activity_should_log(v3))
  {
    if (__nwlog_activity_log::onceToken != -1) {
      dispatch_once(&__nwlog_activity_log::onceToken, &__block_literal_global_16_44861);
    }
    v5 = (id)gactivityLogObj;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)v19 = 16;
      *(_WORD *)&v19[4] = 2098;
      *(void *)&v19[6] = v4 + 8;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEFAULT, "Create activity <nw_activity [%{public,uuid_t}.16P] (lightweight)>", buf, 0x12u);
    }
  }
  return v4;
}

@end