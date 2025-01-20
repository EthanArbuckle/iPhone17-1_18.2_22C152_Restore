@interface NWConcrete_nw_address_endpoint
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (char)initWithAddress:(const char *)a3 overridePort:;
- (const)hostname;
- (id)copyDictionary;
- (id)copyEndpoint;
- (id)echConfig;
- (unint64_t)getHash;
- (unsigned)port;
- (unsigned)priority;
- (unsigned)type;
- (void)dealloc;
- (void)setEchConfig:(id)a3;
- (void)setPriority:(unsigned __int16)a3;
@end

@implementation NWConcrete_nw_address_endpoint

- (void).cxx_destruct
{
}

- (unsigned)type
{
  return 1;
}

- (void)dealloc
{
  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_address_endpoint;
  [(NWConcrete_nw_endpoint *)&v4 dealloc];
}

- (unint64_t)getHash
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v5, 0, sizeof(v5));
  CC_SHA256_Init(&v5);
  CC_SHA256_Update(&v5, &self->address, self->address.ss_len);
  CC_SHA256_Update(&v5, &self->ethernet_address, 6u);
  CC_SHA256_Final(md, &v5);
  int8x16_t v3 = veorq_s8(*(int8x16_t *)md, v7);
  return (unint64_t)veor_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_address_endpoint;
  if ([(NWConcrete_nw_endpoint *)&v16 isEqualToEndpoint:v6 matchFlags:v4])
  {
    int8x16_t v7 = v6;
    if (self->original_fd == *((_DWORD *)v7 + 96))
    {
      size_t ss_len = self->address.ss_len;
      if (ss_len == *((unsigned __int8 *)v7 + 232))
      {
        int ss_family = self->address.ss_family;
        if (ss_family == *((unsigned __int8 *)v7 + 233))
        {
          if (ss_family == 30)
          {
            if (*(unsigned __int16 *)self->address.__ss_pad1 == *((unsigned __int16 *)v7 + 117)
              && *(_DWORD *)&self->address.__ss_pad1[2] == *((_DWORD *)v7 + 59))
            {
              BOOL v12 = *(_OWORD *)&self->address.__ss_align == v7[15];
              if ((v4 & 1) == 0 || *(_OWORD *)&self->address.__ss_align != v7[15]) {
                goto LABEL_18;
              }
              if (*(_DWORD *)&self->address.__ss_pad2[8] == *((_DWORD *)v7 + 64)) {
                goto LABEL_22;
              }
            }
          }
          else
          {
            if (ss_family != 2)
            {
              int v14 = memcmp(&self->address, (char *)v7 + 232, ss_len);
              BOOL v12 = v14 == 0;
              if ((v4 & 1) == 0 || v14) {
                goto LABEL_18;
              }
              goto LABEL_22;
            }
            if (*(unsigned __int16 *)self->address.__ss_pad1 == *((unsigned __int16 *)v7 + 117))
            {
              int v10 = *(_DWORD *)&self->address.__ss_pad1[2];
              int v11 = *((_DWORD *)v7 + 59);
              BOOL v12 = v10 == v11;
              if ((v4 & 1) == 0 || v10 != v11) {
                goto LABEL_18;
              }
LABEL_22:
              BOOL v12 = *(_DWORD *)self->ethernet_address.octet == *((_DWORD *)v7 + 90)
                 && *(unsigned __int16 *)&self->ethernet_address.octet[4] == *((unsigned __int16 *)v7 + 182);
              goto LABEL_18;
            }
          }
        }
      }
    }
    BOOL v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (char)createDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  __s1[0] = 0;
  v46 = 0;
  CC_SHA256_CTX v5 = (char *)nw_endpoint_copy_interface(self);
  p_address = &self->address;
  int ss_family = self->address.ss_family;
  if (ss_family == 30 || ss_family == 2)
  {
    char v54 = 0;
    uint64_t v53 = 0;
    __s1[0] = 0;
    if (ss_family == 30)
    {
      p_ss_align = &self->address.__ss_align;
      int ss_align_low = LOBYTE(self->address.__ss_align);
      *(void *)__str = 0;
      uint64_t v51 = 0;
      __int16 v52 = 0;
      if (ss_align_low == 254 && (BYTE1(self->address.__ss_align) & 0xC0) == 0x80)
      {
        unsigned int v24 = *(_DWORD *)&self->address.__ss_pad2[8];
        if (v24)
        {
          v25 = nw_interface_create_with_index(v24);
          if (v25) {
            snprintf(__str, 0x12uLL, "%%%s");
          }
          else {
            snprintf(__str, 0x12uLL, "%%%u");
          }
        }
      }
      if (v3
        && (*(_DWORD *)p_ss_align
         || HIDWORD(self->address.__ss_align)
         || *(_DWORD *)self->address.__ss_pad2
         || (*(_DWORD *)&self->address.__ss_pad2[4] | 0x1000000) != 0x1000000))
      {
        __nwlog_salted_hash(p_ss_align, 16, (char *)&v53);
        snprintf(__s1, 0x64uLL, "IPv6#%s%s.");
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v26 = (id)gLogObj;
      *(void *)v47 = 0x1004120302;
      *(_WORD *)&v47[8] = 2098;
      *(void *)&v47[10] = &self->address.__ss_align;
      __int16 v48 = 2082;
      v49 = __str;
      BOOL v12 = (char *)_os_log_send_and_compose_impl();

      if (v12 == __s1) {
        goto LABEL_59;
      }
      if (!v12)
      {
        v44 = __nwlog_obj();
        os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
        *(_DWORD *)v47 = 136446210;
        *(void *)&v47[4] = "_strict_strlcpy";
        v45 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v45);
        if (result) {
          goto LABEL_73;
        }
        free(v45);
      }
      uint64_t v27 = 0;
      while (1)
      {
        int v28 = __s1[v27];
        v12[v27] = v28;
        if (!v28) {
          break;
        }
        if (++v27 == 99)
        {
LABEL_56:
          v12[99] = 0;
          break;
        }
      }
    }
    else
    {
      if (ss_family != 2)
      {
LABEL_59:
        unsigned int alternate_port = nw_endpoint_get_alternate_port(self);
        unsigned int v30 = [(NWConcrete_nw_address_endpoint *)self port];
        v31 = v5 + 104;
        unsigned int v32 = __rev16(v30);
        v33 = "/";
        if (!alternate_port) {
          v33 = "";
        }
        unsigned int v34 = __rev16(alternate_port);
        v35 = "@";
        if (!v5)
        {
          v35 = "";
          v31 = "";
        }
        asprintf(&v46, "%s%u%s%.0u%s%s", __s1, v32, v33, v34, v35, v31);
        goto LABEL_64;
      }
      int v9 = *(_DWORD *)&self->address.__ss_pad1[2];
      *(_DWORD *)__str = v9;
      if (v3 && v9 && v9 != 16777343)
      {
        __nwlog_salted_hash(__str, 4, (char *)&v53);
        snprintf(__s1, 0x64uLL, "IPv4#%s:");
        goto LABEL_59;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v11 = (id)gLogObj;
      *(_DWORD *)v47 = 67240192;
      *(_DWORD *)&v47[4] = v9;
      BOOL v12 = (char *)_os_log_send_and_compose_impl();

      if (v12 == __s1) {
        goto LABEL_59;
      }
      if (!v12)
      {
        v40 = __nwlog_obj();
        os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
        *(_DWORD *)v47 = 136446210;
        *(void *)&v47[4] = "_strict_strlcpy";
        v41 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v41);
        if (result) {
          goto LABEL_73;
        }
        free(v41);
      }
      uint64_t v13 = 0;
      while (1)
      {
        int v14 = __s1[v13];
        v12[v13] = v14;
        if (!v14) {
          break;
        }
        if (++v13 == 99) {
          goto LABEL_56;
        }
      }
    }
    if (v12) {
      free(v12);
    }
    goto LABEL_59;
  }
  if (ss_family == 1 || !v3)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v16 = (id)gLogObj;
    int ss_len = p_address->ss_len;
    *(_DWORD *)v47 = 68157954;
    *(_DWORD *)&v47[4] = ss_len;
    *(_WORD *)&v47[8] = 2098;
    *(void *)&v47[10] = &self->address;
    v18 = (char *)_os_log_send_and_compose_impl();

    if (v18 != __s1)
    {
      if (!v18)
      {
        v42 = __nwlog_obj();
        os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
        *(_DWORD *)v47 = 136446210;
        *(void *)&v47[4] = "_strict_strlcpy";
        v43 = (void *)_os_log_send_and_compose_impl();

        result = (char *)__nwlog_abort((uint64_t)v43);
        if (result) {
          goto LABEL_73;
        }
        free(v43);
      }
      uint64_t v19 = 0;
      while (1)
      {
        int v20 = __s1[v19];
        v18[v19] = v20;
        if (!v20) {
          break;
        }
        if (++v19 == 99)
        {
          v18[99] = 0;
          break;
        }
      }
      if (v18) {
        free(v18);
      }
    }
    if (!__s1[0])
    {
LABEL_42:
      asprintf(&v46, "<af:%u>", p_address->ss_family);
      goto LABEL_64;
    }
  }
  else
  {
    v47[8] = 0;
    *(void *)v47 = 0;
    __nwlog_salted_hash(p_address, p_address->ss_len, v47);
    snprintf(__s1, 0x64uLL, "sockaddr#%s", v47);
    if (!__s1[0]) {
      goto LABEL_42;
    }
  }
  v21 = strdup(__s1);
  if (v21)
  {
LABEL_35:
    v46 = v21;
LABEL_64:
    v36 = v46;

    return v36;
  }
  v38 = __nwlog_obj();
  os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
  *(_DWORD *)v47 = 136446210;
  *(void *)&v47[4] = "strict_strdup";
  v39 = (void *)_os_log_send_and_compose_impl();

  result = (char *)__nwlog_abort((uint64_t)v39);
  if (!result)
  {
    free(v39);
    goto LABEL_35;
  }
LABEL_73:
  __break(1u);
  return result;
}

- (unsigned)port
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_address = &self->address;
  int ss_family = self->address.ss_family;
  if (ss_family == 30 || ss_family == 2) {
    return *(_WORD *)self->address.__ss_pad1;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  CC_SHA256_CTX v5 = (id)gLogObj;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = p_address->ss_family;
    int v7 = 136446466;
    uint64_t v8 = "-[NWConcrete_nw_address_endpoint port]";
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_INFO, "%{public}s Can't fetch port for address family: %u", (uint8_t *)&v7, 0x12u);
  }

  return 0;
}

- (void)setPriority:(unsigned __int16)a3
{
  self->priority = a3;
}

- (char)initWithAddress:(const char *)a3 overridePort:
{
  *(void *)&v59[13] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v55.receiver = a1;
  v55.super_class = (Class)NWConcrete_nw_address_endpoint;
  CC_SHA256_CTX v5 = (char *)objc_msgSendSuper2(&v55, sel_init);
  if (!v5)
  {
    v45 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    v46 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v46, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v47 = __nwlog_obj();
        os_log_type_t v48 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v47, v48, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v53)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v47 = __nwlog_obj();
        os_log_type_t v50 = type;
        BOOL v51 = os_log_type_enabled(v47, type);
        if (backtrace_string)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            __int16 v58 = 2082;
            *(void *)v59 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v47, v50, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_108;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v47, v50, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v47 = __nwlog_obj();
        os_log_type_t v52 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v47, v52, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_108:
    if (v46) {
      free(v46);
    }
    return 0;
  }
  unsigned int v6 = *a2;
  if ((v6 + 127) <= 0x80u)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    int v8 = *a2;
    *(_DWORD *)buf = 136446466;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    __int16 v58 = 1024;
    *(_DWORD *)v59 = v8;
    __int16 v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v9, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v10 = (id)gLogObj;
        os_log_type_t v11 = type;
        if (os_log_type_enabled(v10, type))
        {
          int v12 = *a2;
          *(_DWORD *)buf = 136446466;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          __int16 v58 = 1024;
          *(_DWORD *)v59 = v12;
          _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s Invalid sockaddr length: %u", buf, 0x12u);
        }
      }
      else if (v53)
      {
        id v16 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v10 = (id)gLogObj;
        os_log_type_t v17 = type;
        BOOL v18 = os_log_type_enabled(v10, type);
        if (v16)
        {
          if (v18)
          {
            int v19 = *a2;
            *(_DWORD *)buf = 136446722;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            __int16 v58 = 1024;
            *(_DWORD *)v59 = v19;
            v59[2] = 2082;
            *(void *)&v59[3] = v16;
            _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s Invalid sockaddr length: %u, dumping backtrace:%{public}s", buf, 0x1Cu);
          }

          free(v16);
          if (!v9) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        if (v18)
        {
          int v22 = *a2;
          *(_DWORD *)buf = 136446466;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          __int16 v58 = 1024;
          *(_DWORD *)v59 = v22;
          _os_log_impl(&dword_1830D4000, v10, v17, "%{public}s Invalid sockaddr length: %u, no backtrace", buf, 0x12u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        int v10 = (id)gLogObj;
        os_log_type_t v20 = type;
        if (os_log_type_enabled(v10, type))
        {
          int v21 = *a2;
          *(_DWORD *)buf = 136446466;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          __int16 v58 = 1024;
          *(_DWORD *)v59 = v21;
          _os_log_impl(&dword_1830D4000, v10, v20, "%{public}s Invalid sockaddr length: %u, backtrace limit exceeded", buf, 0x12u);
        }
      }
    }
    if (!v9)
    {
LABEL_35:

      return 0;
    }
LABEL_34:
    free(v9);
    goto LABEL_35;
  }
  int v13 = a2[1];
  if (v13 != 30)
  {
    unsigned int v14 = *a2;
    if (v13 != 2) {
      goto LABEL_43;
    }
    if (v6 >= 0x11)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v15 = (id)gLogObj;
      unsigned int v14 = 16;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
        __int16 v58 = 1024;
        *(_DWORD *)v59 = v6;
        v59[2] = 2048;
        unsigned int v14 = 16;
        *(void *)&v59[3] = 16;
        _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_ERROR, "%{public}s Changing endpoint address length from %u to %lu, too long for family AF_INET", buf, 0x1Cu);
      }
LABEL_38:

      if (a2[1] != 30) {
        goto LABEL_43;
      }
      goto LABEL_39;
    }
    if (v6 == 16)
    {
      unsigned int v14 = 16;
      goto LABEL_43;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v29 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    unsigned int v30 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v30, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v31 = (id)gLogObj;
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v31, v32, "%{public}s sockaddr_in too small", buf, 0xCu);
        }
      }
      else if (v53)
      {
        v37 = (char *)__nw_create_backtrace_string();
        v31 = __nwlog_obj();
        os_log_type_t v38 = type;
        BOOL v39 = os_log_type_enabled(v31, type);
        if (v37)
        {
          if (v39)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            __int16 v58 = 2082;
            *(void *)v59 = v37;
            _os_log_impl(&dword_1830D4000, v31, v38, "%{public}s sockaddr_in too small, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v37);
          goto LABEL_83;
        }
        if (v39)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v31, v38, "%{public}s sockaddr_in too small, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v31 = __nwlog_obj();
        os_log_type_t v43 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v31, v43, "%{public}s sockaddr_in too small, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_83:
    if (v30) {
      free(v30);
    }
    goto LABEL_35;
  }
  if (v6 >= 0x1D)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
      __int16 v58 = 1024;
      *(_DWORD *)v59 = v6;
      v59[2] = 2048;
      unsigned int v14 = 28;
      *(void *)&v59[3] = 28;
      _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_ERROR, "%{public}s Changing endpoint address length from %u to %lu, too long for family AF_INET6", buf, 0x1Cu);
    }
    else
    {
      unsigned int v14 = 28;
    }
    goto LABEL_38;
  }
  if (v6 != 28)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v33 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
    unsigned int v34 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v53 = 0;
    if (__nwlog_fault(v34, &type, &v53))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v35 = (id)gLogObj;
        os_log_type_t v36 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v35, v36, "%{public}s sockaddr_in6 too small", buf, 0xCu);
        }
      }
      else if (v53)
      {
        v40 = (char *)__nw_create_backtrace_string();
        v35 = __nwlog_obj();
        os_log_type_t v41 = type;
        BOOL v42 = os_log_type_enabled(v35, type);
        if (v40)
        {
          if (v42)
          {
            *(_DWORD *)buf = 136446466;
            v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
            __int16 v58 = 2082;
            *(void *)v59 = v40;
            _os_log_impl(&dword_1830D4000, v35, v41, "%{public}s sockaddr_in6 too small, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v40);
          goto LABEL_89;
        }
        if (v42)
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v35, v41, "%{public}s sockaddr_in6 too small, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v35 = __nwlog_obj();
        os_log_type_t v44 = type;
        if (os_log_type_enabled(v35, type))
        {
          *(_DWORD *)buf = 136446210;
          v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
          _os_log_impl(&dword_1830D4000, v35, v44, "%{public}s sockaddr_in6 too small, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_89:
    if (v34) {
      free(v34);
    }
    goto LABEL_35;
  }
  unsigned int v14 = 28;
LABEL_39:
  if (!*((_DWORD *)a2 + 2) && !*((_DWORD *)a2 + 3) && *((_DWORD *)a2 + 4) == -65536)
  {
    __int16 v23 = *((_WORD *)a2 + 1);
    int v24 = *((_DWORD *)a2 + 5);
    *((_WORD *)v5 + 116) = 528;
    *((_WORD *)v5 + 117) = v23;
    *((_DWORD *)v5 + 59) = v24;
    *((void *)v5 + 30) = 0;
    LOBYTE(v14) = 16;
    goto LABEL_44;
  }
LABEL_43:
  memcpy(v5 + 232, a2, v14);
LABEL_44:
  v5[232] = v14;
  if (v5[233] == 2 && *((void *)v5 + 30))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v25 = (id)gLogObj;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v57 = "-[NWConcrete_nw_address_endpoint initWithAddress:overridePort:]";
      _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_ERROR, "%{public}s Fixing endpoint address with non-zero sin_zero field", buf, 0xCu);
    }

    *((void *)v5 + 30) = 0;
  }
  if (a3)
  {
    unsigned int v26 = strtol(a3, 0, 0);
    int v27 = v5[233];
    if (v27 == 30 || v27 == 2) {
      *((_WORD *)v5 + 117) = bswap32(v26) >> 16;
    }
  }
  return v5;
}

- (id)copyEndpoint
{
  nw_endpoint_t address_with_ethernet = nw_endpoint_create_address_with_ethernet((const sockaddr *)&self->address, (int *)&self->ethernet_address);
  LODWORD(address_with_ethernet[48].isa) = self->original_fd;
  objc_storeStrong((id *)&address_with_ethernet[46].isa, self->ech_config);
  return address_with_ethernet;
}

- (unsigned)priority
{
  return self->priority;
}

- (id)copyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_address_endpoint;
  id v3 = [(NWConcrete_nw_endpoint *)&v6 copyDictionary];
  uint64_t v4 = v3;
  if (v3) {
    xpc_dictionary_set_data(v3, "address", &self->address, self->address.ss_len);
  }
  return v4;
}

- (void)setEchConfig:(id)a3
{
}

- (id)echConfig
{
  return self->ech_config;
}

- (const)hostname
{
  if ((*((unsigned char *)self + 390) & 1) == 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __42__NWConcrete_nw_address_endpoint_hostname__block_invoke;
    v4[3] = &unk_1E524BAA8;
    v4[4] = self;
    nw_endpoint_locked(self, v4);
  }
  return self->hostname;
}

@end