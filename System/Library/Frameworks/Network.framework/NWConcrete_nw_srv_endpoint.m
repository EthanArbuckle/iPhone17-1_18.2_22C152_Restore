@interface NWConcrete_nw_srv_endpoint
- (BOOL)initWithName:(void *)a1;
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (const)domainForPolicy;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)type;
- (void)dealloc;
@end

@implementation NWConcrete_nw_srv_endpoint

- (unint64_t)getHash
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  name = self->name;
  CC_LONG v4 = strlen(name);
  CC_SHA256_Update(&v7, name, v4);
  CC_SHA256_Final(md, &v7);
  int8x16_t v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (id)copyEndpoint
{
  v3 = [NWConcrete_nw_srv_endpoint alloc];
  name = self->name;

  return (id)-[NWConcrete_nw_srv_endpoint initWithName:](v3, name);
}

- (BOOL)initWithName:(void *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v28.receiver = a1;
  v28.super_class = (Class)NWConcrete_nw_srv_endpoint;
  id v3 = objc_msgSendSuper2(&v28, sel_init);
  if (!v3)
  {
    v8 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
    int8x16_t v9 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (__nwlog_fault(v9, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        uint64_t v10 = __nwlog_obj();
        os_log_type_t v11 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v26)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        uint64_t v10 = __nwlog_obj();
        os_log_type_t v19 = type;
        BOOL v20 = os_log_type_enabled(v10, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
            __int16 v31 = 2082;
            v32 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v10, v19, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_42;
        }
        if (v20)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_1830D4000, v10, v19, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v10 = __nwlog_obj();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v10, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_1830D4000, v10, v24, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_42:
    if (v9) {
      free(v9);
    }
    return 0;
  }
  if (!a2)
  {
    v12 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v26 = 0;
    if (__nwlog_fault(v13, &type, &v26))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v14 = __nwlog_obj();
        os_log_type_t v15 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s called with null _name", buf, 0xCu);
        }
      }
      else if (v26)
      {
        v21 = (char *)__nw_create_backtrace_string();
        v14 = __nwlog_obj();
        os_log_type_t v22 = type;
        BOOL v23 = os_log_type_enabled(v14, type);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
            __int16 v31 = 2082;
            v32 = v21;
            _os_log_impl(&dword_1830D4000, v14, v22, "%{public}s called with null _name, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v21);
          goto LABEL_47;
        }
        if (v23)
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_1830D4000, v14, v22, "%{public}s called with null _name, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v14 = __nwlog_obj();
        os_log_type_t v25 = type;
        if (os_log_type_enabled(v14, type))
        {
          *(_DWORD *)buf = 136446210;
          v30 = "-[NWConcrete_nw_srv_endpoint initWithName:]";
          _os_log_impl(&dword_1830D4000, v14, v25, "%{public}s called with null _name, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_47:
    if (v13) {
      free(v13);
    }

    return 0;
  }
  CC_LONG v4 = strdup(a2);
  if (v4)
  {
LABEL_5:
    *((void *)v3 + 29) = v4;
    size_t v5 = strlen(v4);
    if (v5 >= 7)
    {
      unint64_t v6 = v5;
      if (!strcmp(&v4[v5 - 6], ".local") || v6 >= 8 && !strcmp(&v4[v6 - 7], ".local.")) {
        *((unsigned char *)v3 + 231) |= 1u;
      }
    }
    return (BOOL)v3;
  }
  v16 = __nwlog_obj();
  os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v30 = "strict_strdup";
  v17 = (void *)_os_log_send_and_compose_impl();

  BOOL result = __nwlog_abort((uint64_t)v17);
  if (!result)
  {
    free(v17);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  unint64_t v6 = (const char **)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_srv_endpoint;
  BOOL v7 = [(NWConcrete_nw_endpoint *)&v9 isEqualToEndpoint:v6 matchFlags:v4]
    && strcmp(self->name, v6[29]) == 0;

  return v7;
}

- (char)createDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  name = self->name;
  unint64_t v6 = (char *)nw_endpoint_copy_interface(self);
  if (v3)
  {
    char v13 = 0;
    v12 = 0;
    BOOL v7 = __nwlog_salted_hostname_hash(self->name, (char *)&v12);
    name = __str;
    snprintf(__str, 0xDuLL, "%s%s", "SRV#", v7);
  }
  v8 = "@";
  v12 = 0;
  objc_super v9 = "";
  if (v6) {
    objc_super v9 = v6 + 104;
  }
  else {
    v8 = "";
  }
  asprintf(&v12, "%s%s%s", name, v8, v9);
  uint64_t v10 = v12;

  return v10;
}

- (const)domainForPolicy
{
  return self->name;
}

- (id)copyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_srv_endpoint;
  id v3 = [(NWConcrete_nw_endpoint *)&v8 copyDictionary];
  uint64_t v4 = v3;
  if (v3)
  {
    name = self->name;
    if (name) {
      xpc_dictionary_set_string(v3, "srv_name", name);
    }
    id v6 = v4;
  }

  return v4;
}

- (unsigned)type
{
  return 5;
}

- (void)dealloc
{
  name = self->name;
  if (name)
  {
    free(name);
    self->name = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_srv_endpoint;
  [(NWConcrete_nw_endpoint *)&v4 dealloc];
}

@end