@interface NWConcrete_nw_resolver_config
- (NSString)description;
- (NWConcrete_nw_resolver_config)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_resolver_config

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_resolver_config;
  [(NWConcrete_nw_resolver_config *)&v2 dealloc];
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 9) = 0;
  *((_DWORD *)self + 22) = 0;
  return self;
}

- (NWConcrete_nw_resolver_config)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_resolver_config;
  objc_super v2 = [(NWConcrete_nw_resolver_config *)&v16 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    goto LABEL_3;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_resolver_config init]";
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
        v18 = "-[NWConcrete_nw_resolver_config init]";
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
          v18 = "-[NWConcrete_nw_resolver_config init]";
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
        v18 = "-[NWConcrete_nw_resolver_config init]";
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
        v18 = "-[NWConcrete_nw_resolver_config init]";
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
  m_obj = self->agent_fd.m_obj;
  if ((*((unsigned char *)&self->agent_fd + 8) & 1) != 0 && m_obj)
  {
    self->agent_fd.m_obj = 0;

    m_obj = self->agent_fd.m_obj;
  }
  self->agent_fd.m_obj = 0;

  v4 = self->kernel_event_wrapper.m_obj;
  if ((*((unsigned char *)&self->kernel_event_wrapper + 8) & 1) != 0 && v4)
  {
    self->kernel_event_wrapper.m_obj = 0;

    v4 = self->kernel_event_wrapper.m_obj;
  }
  self->kernel_event_wrapper.m_obj = 0;

  v5 = self->kernel_event_source.m_obj;
  if ((*((unsigned char *)&self->kernel_event_source + 8) & 1) != 0 && v5)
  {
    self->kernel_event_source.m_obj = 0;

    v5 = self->kernel_event_source.m_obj;
  }
  self->kernel_event_source.m_obj = 0;

  v6 = self->dictionary.m_obj;
  if ((*((unsigned char *)&self->dictionary + 8) & 1) != 0 && v6)
  {
    self->dictionary.m_obj = 0;

    v6 = self->dictionary.m_obj;
  }
  self->dictionary.m_obj = 0;

  v7 = self->dictionary.m_obj;
}

- (NSString)description
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x13812000000;
  v38 = __Block_byref_object_copy__53705;
  v39 = __Block_byref_object_dispose__53706;
  v40 = &unk_18405C45D;
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v41);
  v3 = v36;
  unsigned int v4 = nw_resolver_config_get_class(self);
  v5 = v3 + 6;
  if (v4 > 4) {
    v6 = "unknown";
  }
  else {
    v6 = off_1E5244118[v4];
  }
  size_t v7 = strlen(v6);
  v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v5, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)" ", 1);
  unsigned int protocol = nw_resolver_config_get_protocol(self);
  if (protocol > 3) {
    v10 = "unknown";
  }
  else {
    v10 = off_1E5244140[protocol];
  }
  size_t v11 = strlen(v10);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v5, (uint64_t)v10, v11);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v36 + 6, (uint64_t)"servers = [ ", 12);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __44__NWConcrete_nw_resolver_config_description__block_invoke;
  v34[3] = &unk_1E5246E30;
  v34[4] = &v35;
  nw_resolver_config_enumerate_name_servers(self, v34);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v36 + 6, (uint64_t)"] domains = [ ", 14);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __44__NWConcrete_nw_resolver_config_description__block_invoke_2;
  v33[3] = &unk_1E5246E30;
  v33[4] = &v35;
  nw_resolver_config_enumerate_search_domains(self, v33);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v36 + 6, (uint64_t)"]", 1);
  provider_name = (const char *)nw_resolver_config_get_provider_name(self);
  uint64_t provider_path = nw_resolver_config_get_provider_path(self);
  if (provider_name)
  {
    char v14 = (const char *)provider_path;
    v15 = v36 + 6;
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v36 + 6, (uint64_t)" provider = ", 12);
    if (v14)
    {
      size_t v16 = strlen(provider_name);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)provider_name, v16);
    }
    else
    {
      char v14 = provider_name;
    }
    size_t v17 = strlen(v14);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)v14, v17);
  }
  v18 = v36;
  int v19 = *((_DWORD *)v36 + 38);
  if ((v19 & 0x10) != 0)
  {
    unint64_t v22 = v36[18];
    unint64_t v23 = v36[13];
    if (v22 < v23)
    {
      v36[18] = v23;
      unint64_t v22 = v23;
    }
    v24 = (const void **)(v18 + 12);
  }
  else
  {
    if ((v19 & 8) == 0)
    {
      size_t v20 = 0;
      HIBYTE(v32) = 0;
      uint64_t v21 = __p;
      goto LABEL_27;
    }
    v24 = (const void **)(v36 + 9);
    unint64_t v22 = v36[11];
  }
  v25 = *v24;
  size_t v20 = v22 - (void)*v24;
  if (v20 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (v20 >= 0x17)
  {
    uint64_t v26 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v26 = v20 | 7;
    }
    uint64_t v27 = v26 + 1;
    uint64_t v21 = operator new(v26 + 1);
    __p[1] = (void *)v20;
    int64_t v32 = v27 | 0x8000000000000000;
    __p[0] = v21;
    goto LABEL_26;
  }
  HIBYTE(v32) = v22 - *(unsigned char *)v24;
  uint64_t v21 = __p;
  if (v20) {
LABEL_26:
  }
    memmove(v21, v25, v20);
LABEL_27:
  *((unsigned char *)v21 + v20) = 0;
  if (v32 >= 0) {
    v28 = __p;
  }
  else {
    v28 = (void **)__p[0];
  }
  v29 = (__CFString *)CFStringCreateWithCString(0, (const char *)v28, 0x8000100u);
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[0]);
  }
  _Block_object_dispose(&v35, 8);
  v41[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v41 + *(void *)(v41[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v41[1] = MEMORY[0x1E4FBA470] + 16;
  if (v42 < 0) {
    operator delete((void *)v41[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x185316200](&v43);

  return (NSString *)v29;
}

@end