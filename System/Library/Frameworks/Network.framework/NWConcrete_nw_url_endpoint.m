@interface NWConcrete_nw_url_endpoint
- (BOOL)initWithURL:(void *)a1;
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (const)hostname;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)port;
- (unsigned)type;
- (void)dealloc;
@end

@implementation NWConcrete_nw_url_endpoint

- (void)dealloc
{
  url_ref = self->url_ref;
  if (url_ref)
  {
    CFRelease(url_ref);
    self->url_ref = 0;
  }
  url = self->url;
  if (url)
  {
    free(url);
    self->url = 0;
  }
  scheme = self->scheme;
  if (scheme)
  {
    free(scheme);
    self->scheme = 0;
  }
  hostname = self->hostname;
  if (hostname)
  {
    free(hostname);
    self->hostname = 0;
  }
  path = self->path;
  if (path)
  {
    free(path);
    self->path = 0;
  }
  sanitized_url = self->sanitized_url;
  if (sanitized_url)
  {
    free(sanitized_url);
    self->sanitized_url = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_url_endpoint;
  [(NWConcrete_nw_endpoint *)&v9 dealloc];
}

- (id)copyEndpoint
{
  v3 = objc_alloc_init(NWConcrete_nw_url_endpoint);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__NWConcrete_nw_url_endpoint_copyEndpoint__block_invoke;
  v7[3] = &unk_1E524B9A0;
  v4 = v3;
  v8 = v4;
  objc_super v9 = self;
  nw_synchronize(&self->lock, (uint64_t)v7);
  v5 = v4;

  return v5;
}

- (unsigned)type
{
  return 4;
}

- (BOOL)initWithURL:(void *)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v49.receiver = a1;
  v49.super_class = (Class)NWConcrete_nw_url_endpoint;
  v3 = objc_msgSendSuper2(&v49, sel_init);
  id v4 = v3;
  if (!v3)
  {
    v25 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
    v26 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v47 = 0;
    if (__nwlog_fault(v26, &type, &v47))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v27 = __nwlog_obj();
        os_log_type_t v28 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_1830D4000, v27, v28, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v47)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v27 = __nwlog_obj();
        os_log_type_t v34 = type;
        BOOL v35 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v35)
          {
            *(_DWORD *)buf = 136446466;
            v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
            __int16 v52 = 2082;
            v53 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v27, v34, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_74;
        }
        if (v35)
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_1830D4000, v27, v34, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v27 = __nwlog_obj();
        os_log_type_t v45 = type;
        if (os_log_type_enabled(v27, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_1830D4000, v27, v45, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_74:
    if (v26) {
      free(v26);
    }
    return 0;
  }
  if (!a2)
  {
    v29 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
    v30 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v47 = 0;
    if (__nwlog_fault(v30, &type, &v47))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v31 = __nwlog_obj();
        os_log_type_t v32 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_1830D4000, v31, v32, "%{public}s called with null _url", buf, 0xCu);
        }
      }
      else if (v47)
      {
        v36 = (char *)__nw_create_backtrace_string();
        v31 = __nwlog_obj();
        os_log_type_t v37 = type;
        BOOL v38 = os_log_type_enabled(v31, type);
        if (v36)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
            __int16 v52 = 2082;
            v53 = v36;
            _os_log_impl(&dword_1830D4000, v31, v37, "%{public}s called with null _url, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v36);
          goto LABEL_79;
        }
        if (v38)
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_1830D4000, v31, v37, "%{public}s called with null _url, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v31 = __nwlog_obj();
        os_log_type_t v46 = type;
        if (os_log_type_enabled(v31, type))
        {
          *(_DWORD *)buf = 136446210;
          v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
          _os_log_impl(&dword_1830D4000, v31, v46, "%{public}s called with null _url, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_79:
    if (v30) {
      free(v30);
    }

    return 0;
  }
  v3[75] = 0;
  CFURLRef v5 = CFURLCopyAbsoluteURL(a2);
  *((void *)v4 + 29) = v5;
  if (!v5)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (char *)*((void *)v4 + 31);
      *(_DWORD *)buf = 136446467;
      v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
      __int16 v52 = 2085;
      v53 = v17;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s failed to create url from %{sensitive}s", buf, 0x16u);
    }
    goto LABEL_24;
  }
  CFIndex v6 = CFURLGetBytes(v5, 0, 0);
  BOOL v7 = nw_calloc_type<unsigned char>(v6 + 1);
  *((void *)v4 + 31) = v7;
  CFURLGetBytes(a2, (UInt8 *)v7, v6);
  CFRange v8 = CFURLGetByteRangeForComponent((CFURLRef)*((void *)v4 + 29), kCFURLComponentScheme, 0);
  if (v8.location == -1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = (char *)*((void *)v4 + 31);
      *(_DWORD *)buf = 136446467;
      v51 = "-[NWConcrete_nw_url_endpoint initWithURL:]";
      __int16 v52 = 2085;
      v53 = v18;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_ERROR, "%{public}s failed to get scheme from %{sensitive}s", buf, 0x16u);
    }
LABEL_24:

    return 0;
  }
  uint64_t v9 = *((void *)v4 + 31);
  if (!v9)
  {
    v39 = __nwlog_obj();
    os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    v51 = "strict_strndup";
    v40 = (void *)_os_log_send_and_compose_impl();

    BOOL result = __nwlog_abort((uint64_t)v40);
    if (result) {
      goto LABEL_82;
    }
    free(v40);
  }
  v10 = strndup((const char *)(v9 + v8.location), v8.length);
  if (!v10)
  {
    v41 = __nwlog_obj();
    os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 136446210;
    v51 = "strict_strndup";
    v42 = (void *)_os_log_send_and_compose_impl();

    BOOL result = __nwlog_abort((uint64_t)v42);
    if (result) {
      goto LABEL_82;
    }
    free(v42);
    *((void *)v4 + 32) = 0;

    return 0;
  }
  *((void *)v4 + 32) = v10;
  CFRange v11 = CFURLGetByteRangeForComponent((CFURLRef)*((void *)v4 + 29), kCFURLComponentHost, 0);
  if (v11.location == -1) {
    CFIndex location = 0;
  }
  else {
    CFIndex location = v11.location;
  }
  if (v11.location == -1) {
    CFIndex length = 0;
  }
  else {
    CFIndex length = v11.length;
  }
  uint64_t v14 = *((void *)v4 + 31);
  v15 = (const char *)(v14 + location);
  if (length <= 1)
  {
    if (!v14)
    {
      v19 = __nwlog_obj();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v51 = "strict_strndup";
      v20 = (void *)_os_log_send_and_compose_impl();

      BOOL result = __nwlog_abort((uint64_t)v20);
      if (result) {
        goto LABEL_82;
      }
      free(v20);
    }
  }
  else
  {
    if (*v15 == 91)
    {
      if (*(unsigned char *)(length + location + v14 - 1) == 93)
      {
        ++location;
        length -= 2;
      }
      else
      {
        CFIndex length = v11.length;
      }
    }
    else
    {
      CFIndex length = v11.length;
    }
    v15 = (const char *)(v14 + location);
  }
  v22 = strndup(v15, length);
  if (v22)
  {
    *((void *)v4 + 33) = v22;
    *((unsigned char *)v4 + 297) &= ~1u;
    SInt32 v23 = CFURLGetPortNumber(*((CFURLRef *)v4 + 29));
    if (v23 == -1)
    {
      v24 = (const char *)*((void *)v4 + 32);
      if (v24)
      {
        if (nw_utilities_port_for_string(v24, (_WORD *)v4 + 120)) {
          *((unsigned char *)v4 + 297) |= 1u;
        }
        else {
          *((_WORD *)v4 + 120) = 0;
        }
      }
    }
    else
    {
      *((_WORD *)v4 + 120) = bswap32(v23) >> 16;
    }
    return (BOOL)v4;
  }
  v43 = __nwlog_obj();
  os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v51 = "strict_strndup";
  v44 = (void *)_os_log_send_and_compose_impl();

  BOOL result = __nwlog_abort((uint64_t)v44);
  if (!result)
  {
    free(v44);
    *((void *)v4 + 33) = 0;

    return 0;
  }
LABEL_82:
  __break(1u);
  return result;
}

- (unint64_t)getHash
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  url = self->url;
  CC_LONG v4 = strlen(url);
  CC_SHA256_Update(&v7, url, v4);
  CC_SHA256_Final(md, &v7);
  int8x16_t v5 = veorq_s8(*(int8x16_t *)md, v9);
  return (unint64_t)veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  CFIndex v6 = (CFTypeRef *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_url_endpoint;
  BOOL v7 = [(NWConcrete_nw_endpoint *)&v9 isEqualToEndpoint:v6 matchFlags:v4]
    && CFEqual(v6[29], self->url_ref) != 0;

  return v7;
}

- (char)createDescription:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  url = self->url;
  if (a3)
  {
    char v13 = 0;
    v12 = 0;
    size_t v5 = strlen(url);
    __nwlog_salted_hash(url, v5, (char *)&v12);
    url = __str;
    snprintf(__str, 0xDuLL, "%s%s", "URL#", (const char *)&v12);
  }
  CFIndex v6 = self;
  BOOL v7 = v6->super.interface;

  CFRange v8 = v7 + 104;
  objc_super v9 = "@";
  v12 = 0;
  if (!v7)
  {
    objc_super v9 = "";
    CFRange v8 = "";
  }
  asprintf(&v12, "%s%s%s", url, v9, v8);
  uint64_t v10 = v12;

  return v10;
}

- (id)copyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)NWConcrete_nw_url_endpoint;
  id v3 = [(NWConcrete_nw_endpoint *)&v8 copyDictionary];
  uint64_t v4 = v3;
  if (v3)
  {
    url = self->url;
    if (url) {
      xpc_dictionary_set_string(v3, "url", url);
    }
    id v6 = v4;
  }

  return v4;
}

- (unsigned)port
{
  return self->port;
}

- (const)hostname
{
  return self->hostname;
}

@end