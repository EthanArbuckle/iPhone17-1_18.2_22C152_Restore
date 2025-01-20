@interface NWEndpoint
+ (BOOL)supportsResolverCallback;
+ (BOOL)supportsSecureCoding;
+ (Class)copyClassForEndpointType:(int)a3;
+ (NWEndpoint)endpointWithCEndpoint:(id)a3;
+ (NWEndpoint)endpointWithInternalEndpoint:(id)a3;
+ (NWEndpoint)endpointWithProtocolBufferData:(id)a3;
+ (unsigned)endpointType;
- (BOOL)isEqual:(id)a3;
- (NSData)txtRecord;
- (NSString)parentEndpointDomain;
- (NSString)privateDescription;
- (NWEndpoint)initWithCoder:(id)a3;
- (NWEndpoint)initWithEncodedData:(id)a3;
- (NWEndpoint)initWithEndpoint:(id)a3;
- (NWInterface)interface;
- (OS_nw_endpoint)internalEndpoint;
- (id)copyCEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)encodedData;
- (int64_t)remoteInterfaceType;
- (unint64_t)hash;
- (unsigned)alternatePort;
- (void)encodeWithCoder:(id)a3;
- (void)resolveEndpointWithCompletionHandler:(id)a3;
- (void)setAlternatePort:(unsigned __int16)a3;
- (void)setInterface:(id)a3;
- (void)setInternalEndpoint:(id)a3;
- (void)setRemoteInterfaceType:(int64_t)a3;
- (void)setTxtRecord:(id)a3;
@end

@implementation NWEndpoint

- (void).cxx_destruct
{
}

+ (NWEndpoint)endpointWithInternalEndpoint:(id)a3
{
  v3 = a3;
  v4 = +[NWEndpoint copyClassForEndpointType:nw_endpoint_get_type(v3)];
  v5 = (void *)[[v4 alloc] initWithEndpoint:v3];

  return (NWEndpoint *)v5;
}

- (NWEndpoint)initWithEndpoint:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWEndpoint;
    v6 = [(NWEndpoint *)&v23 init];
    if (v6)
    {
      v7 = v6;
      objc_storeStrong((id *)&v6->_internalEndpoint, a3);
      goto LABEL_4;
    }
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWEndpoint initWithEndpoint:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          v27 = "-[NWEndpoint initWithEndpoint:]";
          __int16 v28 = 2082;
          v29 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    v7 = 0;
    goto LABEL_4;
  }
  v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWEndpoint initWithEndpoint:]";
  v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        v19 = (char *)__nw_create_backtrace_string();
        v11 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v27 = "-[NWEndpoint initWithEndpoint:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null internalEndpoint, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint, no backtrace";
        goto LABEL_29;
      }
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWEndpoint initWithEndpoint:]";
        v13 = "%{public}s called with null internalEndpoint, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v10) {
    free(v10);
  }

  v7 = 0;
LABEL_4:

  return v7;
}

+ (Class)copyClassForEndpointType:(int)a3
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

+ (NWEndpoint)endpointWithCEndpoint:(id)a3
{
  return +[NWEndpoint endpointWithInternalEndpoint:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [(NWEndpoint *)self internalEndpoint];
    v7 = [v5 internalEndpoint];

    char is_equal = nw_endpoint_is_equal(v6, v7, 1);
  }
  else
  {
    char is_equal = 0;
  }

  return is_equal;
}

- (id)description
{
  id v2 = [(NWEndpoint *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (NSData)txtRecord
{
  id v2 = [(NWEndpoint *)self internalEndpoint];
  nw_txt_record_t v3 = nw_endpoint_copy_txt_record(v2);

  if (!v3 || ((isa = v3[1].isa, Class v5 = v3[2].isa, isa) ? (v6 = v5 == 0) : (v6 = 1), v6)) {
    v7 = 0;
  }
  else {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:isa length:v5];
  }

  return (NSData *)v7;
}

- (NSString)parentEndpointDomain
{
  id v2 = [(NWEndpoint *)self internalEndpoint];
  BOOL parent_endpoint_domain = nw_endpoint_get_parent_endpoint_domain((uint64_t)v2);

  if (parent_endpoint_domain)
  {
    id v4 = [NSString stringWithUTF8String:parent_endpoint_domain];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)copyCEndpoint
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NWEndpoint)initWithCoder:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NWEndpoint;
  Class v5 = [(NWEndpoint *)&v53 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    os_log_type_t v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"dictionary"];
    v14 = v13;
    if (v13)
    {
      xpc_object_t XPCDictionaryFromNSDictionary = NWUtilsCreateXPCDictionaryFromNSDictionary(v13);
      v16 = XPCDictionaryFromNSDictionary;
      if (XPCDictionaryFromNSDictionary)
      {
        os_log_type_t v17 = nw_endpoint_create_from_dictionary(XPCDictionaryFromNSDictionary);
        [(NWEndpoint *)v5 setInternalEndpoint:v17];

        v18 = [(NWEndpoint *)v5 internalEndpoint];

        if (v18)
        {
          v19 = v5;
LABEL_39:

          goto LABEL_40;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v33 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51))
        {
LABEL_36:
          if (!v26)
          {
LABEL_38:
            v19 = 0;
            goto LABEL_39;
          }
LABEL_37:
          free(v26);
          goto LABEL_38;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWEndpoint initWithCoder:]";
          v29 = "%{public}s nw_endpoint_create_from_dictionary failed";
          goto LABEL_56;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWEndpoint initWithCoder:]";
          v29 = "%{public}s nw_endpoint_create_from_dictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v38 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v38)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWEndpoint initWithCoder:]";
            __int16 v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s nw_endpoint_create_from_dictionary failed, dumping backtrace:%{public}s";
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        if (!v38)
        {
LABEL_58:

          if (!v26) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v29 = "%{public}s nw_endpoint_create_from_dictionary failed, no backtrace";
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v25 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v26 = (void *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v51 = 0;
        if (!__nwlog_fault((const char *)v26, &type, &v51)) {
          goto LABEL_36;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWEndpoint initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed";
LABEL_56:
          v42 = v27;
          os_log_type_t v43 = v28;
LABEL_57:
          _os_log_impl(&dword_1830D4000, v42, v43, v29, buf, 0xCu);
          goto LABEL_58;
        }
        if (!v51)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v27 = (id)gLogObj;
          os_log_type_t v28 = type;
          if (!os_log_type_enabled(v27, type)) {
            goto LABEL_58;
          }
          *(_DWORD *)buf = 136446210;
          v55 = "-[NWEndpoint initWithCoder:]";
          v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, backtrace limit exceeded";
          goto LABEL_56;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v27 = (id)gLogObj;
        os_log_type_t v35 = type;
        BOOL v36 = os_log_type_enabled(v27, type);
        if (backtrace_string)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWEndpoint initWithCoder:]";
            __int16 v56 = 2082;
            v57 = backtrace_string;
            v37 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, dumping backtrace:%{public}s";
LABEL_34:
            _os_log_impl(&dword_1830D4000, v27, v35, v37, buf, 0x16u);
          }
LABEL_35:

          free(backtrace_string);
          goto LABEL_36;
        }
        if (!v36) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v29 = "%{public}s NWUtilsCreateXPCDictionaryFromNSDictionary failed, no backtrace";
      }
      v42 = v27;
      os_log_type_t v43 = v35;
      goto LABEL_57;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v20 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v55 = "-[NWEndpoint initWithCoder:]";
    v21 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v51 = 0;
    if (__nwlog_fault(v21, &type, &v51))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (!os_log_type_enabled(v22, type)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        char v24 = "%{public}s decodeObjectOfClasses:forKey failed";
LABEL_44:
        v40 = v22;
        os_log_type_t v41 = v23;
        goto LABEL_45;
      }
      if (!v51)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v22 = (id)gLogObj;
        os_log_type_t v23 = type;
        if (!os_log_type_enabled(v22, type)) {
          goto LABEL_46;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        char v24 = "%{public}s decodeObjectOfClasses:forKey failed, backtrace limit exceeded";
        goto LABEL_44;
      }
      uint64_t v30 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v22 = (id)gLogObj;
      os_log_type_t v31 = type;
      BOOL v32 = os_log_type_enabled(v22, type);
      if (!v30)
      {
        if (!v32)
        {
LABEL_46:

          if (!v21) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        char v24 = "%{public}s decodeObjectOfClasses:forKey failed, no backtrace";
        v40 = v22;
        os_log_type_t v41 = v31;
LABEL_45:
        _os_log_impl(&dword_1830D4000, v40, v41, v24, buf, 0xCu);
        goto LABEL_46;
      }
      if (v32)
      {
        *(_DWORD *)buf = 136446466;
        v55 = "-[NWEndpoint initWithCoder:]";
        __int16 v56 = 2082;
        v57 = v30;
        _os_log_impl(&dword_1830D4000, v22, v31, "%{public}s decodeObjectOfClasses:forKey failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v30);
    }
    if (!v21)
    {
LABEL_21:
      v19 = 0;
LABEL_40:

      goto LABEL_41;
    }
LABEL_20:
    free(v21);
    goto LABEL_21;
  }
  v44 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v55 = "-[NWEndpoint initWithCoder:]";
  v45 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v51 = 0;
  if (__nwlog_fault(v45, &type, &v51))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v46 = __nwlog_obj();
      os_log_type_t v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v48 = "%{public}s [super init] failed";
LABEL_76:
        _os_log_impl(&dword_1830D4000, v46, v47, v48, buf, 0xCu);
      }
    }
    else
    {
      if (v51)
      {
        v49 = (char *)__nw_create_backtrace_string();
        v46 = __nwlog_obj();
        os_log_type_t v47 = type;
        BOOL v50 = os_log_type_enabled(v46, type);
        if (v49)
        {
          if (v50)
          {
            *(_DWORD *)buf = 136446466;
            v55 = "-[NWEndpoint initWithCoder:]";
            __int16 v56 = 2082;
            v57 = v49;
            _os_log_impl(&dword_1830D4000, v46, v47, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_78;
        }
        if (!v50) {
          goto LABEL_77;
        }
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v48 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_76;
      }
      v46 = __nwlog_obj();
      os_log_type_t v47 = type;
      if (os_log_type_enabled(v46, type))
      {
        *(_DWORD *)buf = 136446210;
        v55 = "-[NWEndpoint initWithCoder:]";
        v48 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_76;
      }
    }
LABEL_77:
  }
LABEL_78:
  if (v45) {
    free(v45);
  }
  v19 = 0;
LABEL_41:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  Class v5 = [(NWEndpoint *)self internalEndpoint];
  id v6 = (void *)[v5 copyDictionary];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
    id v8 = v6;
    uint64_t v9 = [v7 dictionary];
    *(void *)applier = MEMORY[0x1E4F143A8];
    *(void *)&applier[8] = 3221225472;
    *(void *)&applier[16] = __NWUtilsCreateNSDictionaryFromXPCDictionary_block_invoke;
    uint64_t v30 = &unk_1E52480D0;
    id v10 = v9;
    id v31 = v10;
    xpc_dictionary_apply(v8, applier);

    if (v10)
    {
      [v4 encodeObject:v10 forKey:@"dictionary"];
LABEL_18:

      goto LABEL_19;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v15 = (id)gLogObj;
    *(_DWORD *)applier = 136446210;
    *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (__nwlog_fault(v16, &type, &v27))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v17 = (id)gLogObj;
        os_log_type_t v18 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)applier = 136446210;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed", applier, 0xCu);
        }
      }
      else if (v27)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v17 = (id)gLogObj;
        os_log_type_t v23 = type;
        BOOL v24 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v24)
          {
            *(_DWORD *)applier = 136446466;
            *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
            *(_WORD *)&applier[12] = 2082;
            *(void *)&applier[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v17, v23, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
          }

          free(backtrace_string);
          if (!v16) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }
        if (v24)
        {
          *(_DWORD *)applier = 136446210;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl(&dword_1830D4000, v17, v23, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, no backtrace", applier, 0xCu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v17 = (id)gLogObj;
        os_log_type_t v26 = type;
        if (os_log_type_enabled(v17, type))
        {
          *(_DWORD *)applier = 136446210;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          _os_log_impl(&dword_1830D4000, v17, v26, "%{public}s NWUtilsCreateNSDictionaryFromXPCDictionary failed, backtrace limit exceeded", applier, 0xCu);
        }
      }
    }
    if (!v16) {
      goto LABEL_18;
    }
LABEL_17:
    free(v16);
    goto LABEL_18;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v11 = (id)gLogObj;
  *(_DWORD *)applier = 136446210;
  *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
  os_log_type_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (__nwlog_fault(v12, &type, &v27))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s nw_endpoint_copy_dictionary failed", applier, 0xCu);
      }
    }
    else if (v27)
    {
      v19 = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      os_log_type_t v20 = type;
      BOOL v21 = os_log_type_enabled(v13, type);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)applier = 136446466;
          *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
          *(_WORD *)&applier[12] = 2082;
          *(void *)&applier[14] = v19;
          _os_log_impl(&dword_1830D4000, v13, v20, "%{public}s nw_endpoint_copy_dictionary failed, dumping backtrace:%{public}s", applier, 0x16u);
        }

        free(v19);
        if (v12) {
          goto LABEL_10;
        }
        goto LABEL_19;
      }
      if (v21)
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_1830D4000, v13, v20, "%{public}s nw_endpoint_copy_dictionary failed, no backtrace", applier, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      os_log_type_t v25 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)applier = 136446210;
        *(void *)&applier[4] = "-[NWEndpoint encodeWithCoder:]";
        _os_log_impl(&dword_1830D4000, v13, v25, "%{public}s nw_endpoint_copy_dictionary failed, backtrace limit exceeded", applier, 0xCu);
      }
    }
  }
  if (v12) {
LABEL_10:
  }
    free(v12);
LABEL_19:
}

- (OS_nw_endpoint)internalEndpoint
{
  return self->_internalEndpoint;
}

- (void)setInternalEndpoint:(id)a3
{
}

- (unint64_t)hash
{
  id v2 = [(NWEndpoint *)self internalEndpoint];
  unint64_t v3 = [v2 getHash];

  return v3;
}

- (id)createProtocolBufferObject
{
  unint64_t v3 = objc_alloc_init(NWPBEndpoint);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(NWPBServiceEndpoint);
    if (v3) {
      objc_storeStrong((id *)&v3->_service, v4);
    }

    Class v5 = [(NWEndpoint *)self name];
    if (v3)
    {
      id v6 = v3->_service;
      uint64_t v7 = v6;
      if (v6) {
        objc_storeStrong((id *)&v6->_name, v5);
      }
    }
    else
    {
      uint64_t v7 = 0;
    }

    id v8 = [(NWEndpoint *)self type];
    if (v3)
    {
      uint64_t v9 = v3->_service;
      id v10 = v9;
      if (v9) {
        objc_storeStrong((id *)&v9->_type, v8);
      }
    }
    else
    {
      id v10 = 0;
    }

    id v11 = [(NWEndpoint *)self domain];
    if (v3)
    {
      os_log_type_t v12 = v3->_service;
      if (v12)
      {
        uint64_t v13 = 8;
LABEL_28:
        objc_storeStrong((id *)((char *)&v12->super.super.isa + v13), v11);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
LABEL_37:
    os_log_type_t v12 = 0;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_30;
    }
    os_log_type_t v18 = objc_alloc_init(NWPBAddressEndpoint);
    if (v3) {
      objc_storeStrong((id *)&v3->_address, v18);
    }

    id v11 = [(NWEndpoint *)self addressData];
    if (v3)
    {
      os_log_type_t v12 = v3->_address;
      if (v12)
      {
        uint64_t v13 = 8;
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    goto LABEL_37;
  }
  os_log_type_t v14 = objc_alloc_init(NWPBHostEndpoint);
  if (v3) {
    objc_storeStrong((id *)&v3->_host, v14);
  }

  id v15 = [(NWEndpoint *)self hostname];
  if (v3)
  {
    v16 = v3->_host;
    os_log_type_t v17 = v16;
    if (v16) {
      objc_storeStrong((id *)&v16->_hostname, v15);
    }
  }
  else
  {
    os_log_type_t v17 = 0;
  }

  id v11 = [(NWEndpoint *)self port];
  if (!v3) {
    goto LABEL_37;
  }
  os_log_type_t v12 = v3->_host;
  if (v12)
  {
    uint64_t v13 = 16;
    goto LABEL_28;
  }
LABEL_29:

LABEL_30:
  if ([(NWEndpoint *)self isMemberOfClass:objc_opt_class()])
  {
    v19 = [(NWEndpoint *)self txtRecord];
    if (v3) {
      objc_storeStrong((id *)&v3->_txtRecord, v19);
    }
  }
  os_log_type_t v20 = [(NWEndpoint *)self interface];
  BOOL v21 = (void *)[v20 createProtocolBufferObject];
  if (v3) {
    objc_storeStrong((id *)&v3->_interface, v21);
  }

  return v3;
}

- (void)setAlternatePort:(unsigned __int16)a3
{
  id v4 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_set_alternate_port(v4, a3);
}

- (unsigned)alternatePort
{
  id v2 = [(NWEndpoint *)self internalEndpoint];
  unsigned __int16 alternate_port = nw_endpoint_get_alternate_port(v2);

  return alternate_port;
}

- (void)setTxtRecord:(id)a3
{
  id v6 = a3;
  if ([v6 bytes] && objc_msgSend(v6, "length"))
  {
    id v4 = nw_txt_record_create_with_bytes((const uint8_t *)[v6 bytes], objc_msgSend(v6, "length"));
    Class v5 = [(NWEndpoint *)self internalEndpoint];
    nw_endpoint_set_txt_record(v5, v4);
  }
  else
  {
    id v4 = [(NWEndpoint *)self internalEndpoint];
    nw_endpoint_set_txt_record(v4, 0);
  }
}

- (void)setRemoteInterfaceType:(int64_t)a3
{
  int v3 = a3;
  id v4 = [(NWEndpoint *)self internalEndpoint];
  nw_endpoint_set_remote_interface_type(v4, v3);
}

- (int64_t)remoteInterfaceType
{
  id v2 = [(NWEndpoint *)self internalEndpoint];
  remote_interface_os_log_type_t type = nw_endpoint_get_remote_interface_type(v2);

  return remote_interface_type;
}

- (void)setInterface:(id)a3
{
  id v4 = a3;
  id v6 = [(NWEndpoint *)self internalEndpoint];
  Class v5 = [v4 internalInterface];

  nw_endpoint_set_interface(v6, v5);
}

- (NWInterface)interface
{
  id v2 = [(NWEndpoint *)self internalEndpoint];
  id v3 = nw_endpoint_copy_interface(v2);

  if (v3) {
    id v4 = [[NWInterface alloc] initWithInterface:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSString)privateDescription
{
  id v2 = [(NWEndpoint *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  id v4 = NSString;
  Class v5 = [(NWEndpoint *)self internalEndpoint];
  id v6 = [v4 stringWithUTF8String:nw_endpoint_get_description(v5)];

  return v6;
}

- (id)encodedData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v2 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWEndpoint encodedData]";
  id v3 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v3, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v4 = (id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWEndpoint encodedData]";
      id v6 = "%{public}s encodedData must be overridden";
LABEL_15:
      id v11 = v4;
      os_log_type_t v12 = v5;
      goto LABEL_16;
    }
    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v4 = (id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWEndpoint encodedData]";
      id v6 = "%{public}s encodedData must be overridden, backtrace limit exceeded";
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v4 = (id)gLogObj;
    os_log_type_t v8 = type;
    BOOL v9 = os_log_type_enabled(v4, type);
    if (!backtrace_string)
    {
      if (!v9)
      {
LABEL_17:

        if (!v3) {
          return 0;
        }
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWEndpoint encodedData]";
      id v6 = "%{public}s encodedData must be overridden, no backtrace";
      id v11 = v4;
      os_log_type_t v12 = v8;
LABEL_16:
      _os_log_impl(&dword_1830D4000, v11, v12, v6, buf, 0xCu);
      goto LABEL_17;
    }
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWEndpoint encodedData]";
      __int16 v17 = 2082;
      os_log_type_t v18 = backtrace_string;
      _os_log_impl(&dword_1830D4000, v4, v8, "%{public}s encodedData must be overridden, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
  }
  if (v3) {
LABEL_11:
  }
    free(v3);
  return 0;
}

- (NWEndpoint)initWithEncodedData:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v12 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
    char v13 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v44 = 0;
    if (__nwlog_fault(v13, &type, &v44))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v14 = (id)gLogObj;
        os_log_type_t v15 = type;
        if (!os_log_type_enabled(v14, type)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        v16 = "%{public}s called with null internalEndpoint";
LABEL_31:
        uint64_t v30 = v14;
        os_log_type_t v31 = v15;
        goto LABEL_32;
      }
      if (!v44)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v14 = (id)gLogObj;
        os_log_type_t v15 = type;
        if (!os_log_type_enabled(v14, type)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        v16 = "%{public}s called with null internalEndpoint, backtrace limit exceeded";
        goto LABEL_31;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      os_log_type_t v14 = (id)gLogObj;
      os_log_type_t v25 = type;
      BOOL v26 = os_log_type_enabled(v14, type);
      if (!backtrace_string)
      {
        if (!v26)
        {
LABEL_33:

          if (!v13) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        v16 = "%{public}s called with null internalEndpoint, no backtrace";
        uint64_t v30 = v14;
        os_log_type_t v31 = v25;
LABEL_32:
        _os_log_impl(&dword_1830D4000, v30, v31, v16, buf, 0xCu);
        goto LABEL_33;
      }
      if (v26)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        __int16 v48 = 2082;
        v49 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v14, v25, "%{public}s called with null internalEndpoint, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v13)
    {
LABEL_23:

      os_log_type_t v18 = 0;
      goto LABEL_46;
    }
LABEL_22:
    free(v13);
    goto LABEL_23;
  }
  v43.receiver = self;
  v43.super_class = (Class)NWEndpoint;
  os_log_type_t v5 = [(NWEndpoint *)&v43 init];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    int v8 = [v7 supportsResolverCallback];
    unsigned int v9 = [v7 endpointType];
    id v10 = (void *)[v4 _createDispatchData];
    if (v8)
    {
      id v11 = v42;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __34__NWEndpoint_initWithEncodedData___block_invoke;
      v42[3] = &__block_descriptor_40_e100_v32__0__NSObject_OS_nw_endpoint__8__NSObject_OS_dispatch_queue__16___v____NSObject_OS_nw_array__B_24lu32l8;
      v42[4] = v7;
    }
    else
    {
      id v11 = 0;
    }
    id custom = nw_endpoint_create_custom(v9, v10, v11);

    if (custom)
    {
      [(NWEndpoint *)v6 setInternalEndpoint:custom];
      os_log_type_t v18 = v6;
LABEL_45:

      goto LABEL_46;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v19 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
    os_log_type_t v20 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v44 = 0;
    if (!__nwlog_fault((const char *)v20, &type, &v44))
    {
LABEL_42:
      if (v20) {
        free(v20);
      }
      os_log_type_t v18 = 0;
      goto LABEL_45;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v21 = (id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        os_log_type_t v23 = "%{public}s nw_endpoint_create_custom failed";
LABEL_39:
        uint64_t v32 = v21;
        os_log_type_t v33 = v22;
LABEL_40:
        _os_log_impl(&dword_1830D4000, v32, v33, v23, buf, 0xCu);
      }
    }
    else
    {
      if (v44)
      {
        char v27 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v21 = (id)gLogObj;
        os_log_type_t v28 = type;
        BOOL v29 = os_log_type_enabled(v21, type);
        if (v27)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
            __int16 v48 = 2082;
            v49 = v27;
            _os_log_impl(&dword_1830D4000, v21, v28, "%{public}s nw_endpoint_create_custom failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_42;
        }
        if (!v29) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        os_log_type_t v23 = "%{public}s nw_endpoint_create_custom failed, no backtrace";
        uint64_t v32 = v21;
        os_log_type_t v33 = v28;
        goto LABEL_40;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v21 = (id)gLogObj;
      os_log_type_t v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        os_log_type_t v23 = "%{public}s nw_endpoint_create_custom failed, backtrace limit exceeded";
        goto LABEL_39;
      }
    }
LABEL_41:

    goto LABEL_42;
  }
  os_log_type_t v35 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
  BOOL v36 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v44 = 0;
  if (!__nwlog_fault(v36, &type, &v44)) {
    goto LABEL_64;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    v37 = __nwlog_obj();
    os_log_type_t v38 = type;
    if (os_log_type_enabled(v37, type))
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
      v39 = "%{public}s [super init] failed";
LABEL_62:
      _os_log_impl(&dword_1830D4000, v37, v38, v39, buf, 0xCu);
    }
  }
  else if (v44)
  {
    v40 = (char *)__nw_create_backtrace_string();
    v37 = __nwlog_obj();
    os_log_type_t v38 = type;
    BOOL v41 = os_log_type_enabled(v37, type);
    if (v40)
    {
      if (v41)
      {
        *(_DWORD *)buf = 136446466;
        os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
        __int16 v48 = 2082;
        v49 = v40;
        _os_log_impl(&dword_1830D4000, v37, v38, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(v40);
      goto LABEL_64;
    }
    if (v41)
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
      v39 = "%{public}s [super init] failed, no backtrace";
      goto LABEL_62;
    }
  }
  else
  {
    v37 = __nwlog_obj();
    os_log_type_t v38 = type;
    if (os_log_type_enabled(v37, type))
    {
      *(_DWORD *)buf = 136446210;
      os_log_type_t v47 = "-[NWEndpoint initWithEncodedData:]";
      v39 = "%{public}s [super init] failed, backtrace limit exceeded";
      goto LABEL_62;
    }
  }

LABEL_64:
  if (v36) {
    free(v36);
  }
  os_log_type_t v18 = 0;
LABEL_46:

  return v18;
}

void __34__NWEndpoint_initWithEncodedData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = *(objc_class **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 alloc];
  id v12 = nw_endpoint_copy_custom_data(v10);

  id v13 = v12;
  os_log_type_t v14 = v13;
  if (v13) {
    id v15 = v13;
  }

  v16 = (void *)[v11 initWithEncodedData:v14];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __34__NWEndpoint_initWithEncodedData___block_invoke_2;
  v19[3] = &unk_1E523FD40;
  id v20 = v7;
  id v21 = v8;
  id v17 = v8;
  id v18 = v7;
  [v16 resolveEndpointWithCompletionHandler:v19];
}

void __34__NWEndpoint_initWithEncodedData___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 count])
  {
    BOOL v6 = nw_array_create();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v20 + 1) + 8 * v11) internalEndpoint];
          nw_array_append(v6, v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NWEndpoint_initWithEncodedData___block_invoke_3;
  block[3] = &unk_1E523FD18;
  id v13 = *(NSObject **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v17 = (id)v6;
  id v18 = v14;
  char v19 = a3;
  id v15 = (id)v6;
  dispatch_async(v13, block);
}

uint64_t __34__NWEndpoint_initWithEncodedData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void)resolveEndpointWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  if (!v4)
  {
    *(_DWORD *)buf = 136446210;
    char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v10, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        id v13 = "%{public}s called with null completionHandler";
LABEL_36:
        long long v22 = v11;
        os_log_type_t v23 = v12;
        goto LABEL_37;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v11 = (id)gLogObj;
        os_log_type_t v12 = type;
        if (!os_log_type_enabled(v11, type)) {
          goto LABEL_38;
        }
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        id v13 = "%{public}s called with null completionHandler, backtrace limit exceeded";
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v11 = (id)gLogObj;
      os_log_type_t v18 = type;
      BOOL v19 = os_log_type_enabled(v11, type);
      if (!backtrace_string)
      {
        if (!v19)
        {
LABEL_38:

          if (!v10) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
        *(_DWORD *)buf = 136446210;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        id v13 = "%{public}s called with null completionHandler, no backtrace";
        long long v22 = v11;
        os_log_type_t v23 = v18;
LABEL_37:
        _os_log_impl(&dword_1830D4000, v22, v23, v13, buf, 0xCu);
        goto LABEL_38;
      }
      if (v19)
      {
        *(_DWORD *)buf = 136446466;
        char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
        __int16 v28 = 2082;
        BOOL v29 = (NWEndpoint *)backtrace_string;
        _os_log_impl(&dword_1830D4000, v11, v18, "%{public}s called with null completionHandler, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v10) {
      goto LABEL_25;
    }
LABEL_24:
    free(v10);
    goto LABEL_25;
  }
  *(_DWORD *)buf = 136446466;
  char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
  __int16 v28 = 2114;
  BOOL v29 = self;
  BOOL v6 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v6, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446466;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      BOOL v29 = self;
      uint64_t v9 = "%{public}s Endpoint %{public}@ does not support custom resolution";
LABEL_28:
      long long v20 = v7;
      os_log_type_t v21 = v8;
      goto LABEL_29;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v7 = (id)gLogObj;
      os_log_type_t v8 = type;
      if (!os_log_type_enabled(v7, type)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446466;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      BOOL v29 = self;
      uint64_t v9 = "%{public}s Endpoint %{public}@ does not support custom resolution, backtrace limit exceeded";
      goto LABEL_28;
    }
    id v14 = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v7 = (id)gLogObj;
    os_log_type_t v15 = type;
    BOOL v16 = os_log_type_enabled(v7, type);
    if (!v14)
    {
      if (!v16)
      {
LABEL_30:

        if (!v6) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136446466;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      BOOL v29 = self;
      uint64_t v9 = "%{public}s Endpoint %{public}@ does not support custom resolution, no backtrace";
      long long v20 = v7;
      os_log_type_t v21 = v15;
LABEL_29:
      _os_log_impl(&dword_1830D4000, v20, v21, v9, buf, 0x16u);
      goto LABEL_30;
    }
    if (v16)
    {
      *(_DWORD *)buf = 136446722;
      char v27 = "-[NWEndpoint resolveEndpointWithCompletionHandler:]";
      __int16 v28 = 2114;
      BOOL v29 = self;
      __int16 v30 = 2082;
      os_log_type_t v31 = v14;
      _os_log_impl(&dword_1830D4000, v7, v15, "%{public}s Endpoint %{public}@ does not support custom resolution, dumping backtrace:%{public}s", buf, 0x20u);
    }

    free(v14);
  }
  if (v6) {
LABEL_16:
  }
    free(v6);
LABEL_17:
  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NWEndpoint *)self internalEndpoint];
  BOOL v6 = (void *)[v4 initWithEndpoint:v5];

  return v6;
}

+ (NWEndpoint)endpointWithProtocolBufferData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [[NWPBEndpoint alloc] initWithData:v3];

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v17 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
    os_log_type_t v18 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault((const char *)v18, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v19 = (id)gLogObj;
        os_log_type_t v20 = type;
        if (!os_log_type_enabled(v19, type)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        os_log_type_t v21 = "%{public}s [NWPBEndpoint initWithData:] failed";
LABEL_32:
        BOOL v36 = v19;
        os_log_type_t v37 = v20;
        goto LABEL_33;
      }
      if (!v39)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        BOOL v19 = (id)gLogObj;
        os_log_type_t v20 = type;
        if (!os_log_type_enabled(v19, type)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        os_log_type_t v21 = "%{public}s [NWPBEndpoint initWithData:] failed, backtrace limit exceeded";
        goto LABEL_32;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v19 = (id)gLogObj;
      os_log_type_t v32 = type;
      BOOL v33 = os_log_type_enabled(v19, type);
      if (!backtrace_string)
      {
        if (!v33)
        {
LABEL_34:

          if (!v18) {
            goto LABEL_36;
          }
LABEL_35:
          free(v18);
          goto LABEL_36;
        }
        *(_DWORD *)buf = 136446210;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        os_log_type_t v21 = "%{public}s [NWPBEndpoint initWithData:] failed, no backtrace";
        BOOL v36 = v19;
        os_log_type_t v37 = v32;
LABEL_33:
        _os_log_impl(&dword_1830D4000, v36, v37, v21, buf, 0xCu);
        goto LABEL_34;
      }
      if (v33)
      {
        *(_DWORD *)buf = 136446466;
        v42 = "+[NWEndpoint endpointWithProtocolBufferData:]";
        __int16 v43 = 2082;
        char v44 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v19, v32, "%{public}s [NWPBEndpoint initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v18) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  service = v4->_service;
  if (!service)
  {
    host = v4->_host;
    if (host)
    {
      BOOL v6 = host;
      id v7 = v6[1];
      os_log_type_t v23 = v4->_host;
      uint64_t v9 = v23;
      if (v23) {
        port = v23->_port;
      }
      else {
        port = 0;
      }
      uint64_t v11 = port;
      BOOL v16 = +[NWHostEndpoint endpointWithHostname:v7 port:v11];
      goto LABEL_16;
    }
    address = v4->_address;
    if (address)
    {
      os_log_type_t v35 = address;
      BOOL v6 = (id *)v35[1];

      BOOL v16 = +[NWAddressEndpoint endpointWithAddress:](NWAddressEndpoint, "endpointWithAddress:", [v6 bytes]);
      goto LABEL_17;
    }
LABEL_36:
    BOOL v16 = 0;
    goto LABEL_37;
  }
  BOOL v6 = service;
  id v7 = v6[2];
  os_log_type_t v8 = v4->_service;
  uint64_t v9 = v8;
  if (v8) {
    uint64_t v10 = v8->_type;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10;
  os_log_type_t v12 = v4->_service;
  id v13 = v12;
  if (v12) {
    domain = v12->_domain;
  }
  else {
    domain = 0;
  }
  os_log_type_t v15 = domain;
  BOOL v16 = +[NWBonjourServiceEndpoint endpointWithName:v7 type:v11 domain:v15];

LABEL_16:
LABEL_17:

  txtRecord = v4->_txtRecord;
  if (txtRecord)
  {
    BOOL v26 = txtRecord;
    [v16 setTxtRecord:v26];
  }
  interface = v4->_interface;
  if (interface)
  {
    __int16 v28 = interface;
    BOOL v29 = [(NWPBInterface *)v28 data];
    __int16 v30 = +[NWInterface interfaceWithProtocolBufferData:v29];
    [v16 setInterface:v30];
  }
LABEL_37:

  return (NWEndpoint *)v16;
}

+ (BOOL)supportsResolverCallback
{
  return 0;
}

+ (unsigned)endpointType
{
  return 0;
}

@end