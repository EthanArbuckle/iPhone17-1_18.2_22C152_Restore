@interface NWBrowseDescriptor
+ (BOOL)supportsBrowseCallback;
+ (Class)copyClassForDescriptorType:(int)a3;
+ (NWBrowseDescriptor)descriptorWithInternalDescriptor:(id)a3;
+ (NWBrowseDescriptor)descriptorWithProtocolBufferData:(id)a3;
+ (unsigned)descriptorType;
- (NSString)bonjourServiceDomain;
- (NSString)bonjourServiceType;
- (NSString)privateDescription;
- (NWBrowseDescriptor)initWithDescriptor:(id)a3;
- (NWBrowseDescriptor)initWithEncodedData:(id)a3;
- (OS_nw_browse_descriptor)internalDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtocolBufferObject;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)encodedData;
- (void)browseWithCompletionHandler:(id)a3;
- (void)setInternalDescriptor:(id)a3;
@end

@implementation NWBrowseDescriptor

- (void).cxx_destruct
{
}

- (void)setInternalDescriptor:(id)a3
{
}

- (OS_nw_browse_descriptor)internalDescriptor
{
  return self->_internalDescriptor;
}

- (id)createProtocolBufferObject
{
  v3 = objc_alloc_init(NWPBBrowseDescriptor);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = objc_alloc_init(NWPBServiceBrowse);
    if (v3) {
      objc_storeStrong((id *)&v3->_service, v4);
    }

    v5 = [(NWBrowseDescriptor *)self type];
    if (v3)
    {
      v6 = v3->_service;
      v7 = v6;
      if (v6) {
        objc_storeStrong((id *)&v6->_type, v5);
      }
    }
    else
    {
      v7 = 0;
    }

    v8 = [(NWBrowseDescriptor *)self domain];
    if (v3)
    {
      v9 = v3->_service;
      v10 = v9;
      if (v9) {
        objc_storeStrong((id *)&v9->_domain, v8);
      }
    }
    else
    {
      v10 = 0;
    }
  }
  return v3;
}

- (id)encodedData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v2 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWBrowseDescriptor encodedData]";
  v3 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v3, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWBrowseDescriptor encodedData]";
      v6 = "%{public}s encodedData must be overridden";
LABEL_15:
      v11 = v4;
      os_log_type_t v12 = v5;
      goto LABEL_16;
    }
    if (!v13)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      os_log_type_t v5 = type;
      if (!os_log_type_enabled(v4, type)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "-[NWBrowseDescriptor encodedData]";
      v6 = "%{public}s encodedData must be overridden, backtrace limit exceeded";
      goto LABEL_15;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
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
      v16 = "-[NWBrowseDescriptor encodedData]";
      v6 = "%{public}s encodedData must be overridden, no backtrace";
      v11 = v4;
      os_log_type_t v12 = v8;
LABEL_16:
      _os_log_impl(&dword_1830D4000, v11, v12, v6, buf, 0xCu);
      goto LABEL_17;
    }
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWBrowseDescriptor encodedData]";
      __int16 v17 = 2082;
      v18 = backtrace_string;
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

- (NWBrowseDescriptor)initWithEncodedData:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v40.receiver = self;
    v40.super_class = (Class)NWBrowseDescriptor;
    os_log_type_t v5 = [(NWBrowseDescriptor *)&v40 init];
    if (v5)
    {
      v6 = v5;
      v7 = objc_opt_class();
      int v8 = [v7 supportsBrowseCallback];
      unsigned int v9 = [v7 descriptorType];
      v10 = (void *)[v4 _createDispatchData];
      if (v8)
      {
        v11 = v39;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __42__NWBrowseDescriptor_initWithEncodedData___block_invoke;
        v39[3] = &__block_descriptor_40_e76_v24__0__NSObject_OS_nw_browse_descriptor__8___v____NSObject_OS_nw_array___16lu32l8;
        v39[4] = v7;
      }
      else
      {
        v11 = 0;
      }
      custom = nw_browse_descriptor_create_custom(v9, v10, v11);

      if (custom)
      {
        [(NWBrowseDescriptor *)v6 setInternalDescriptor:custom];
        char v13 = v6;
LABEL_20:

        goto LABEL_21;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v14 = (id)gLogObj;
      *(_DWORD *)buf = 136446210;
      v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
      v15 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t type = OS_LOG_TYPE_ERROR;
      char v41 = 0;
      if (__nwlog_fault(v15, &type, &v41))
      {
        if (type == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v16 = (id)gLogObj;
          os_log_type_t v17 = type;
          if (!os_log_type_enabled(v16, type)) {
            goto LABEL_26;
          }
          *(_DWORD *)buf = 136446210;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v18 = "%{public}s nw_browse_descriptor_create_custom failed";
LABEL_24:
          v23 = v16;
          os_log_type_t v24 = v17;
          goto LABEL_25;
        }
        if (!v41)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v16 = (id)gLogObj;
          os_log_type_t v17 = type;
          if (!os_log_type_enabled(v16, type)) {
            goto LABEL_26;
          }
          *(_DWORD *)buf = 136446210;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v18 = "%{public}s nw_browse_descriptor_create_custom failed, backtrace limit exceeded";
          goto LABEL_24;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v16 = (id)gLogObj;
        os_log_type_t v20 = type;
        BOOL v21 = os_log_type_enabled(v16, type);
        if (!backtrace_string)
        {
          if (!v21)
          {
LABEL_26:

            if (!v15) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
          *(_DWORD *)buf = 136446210;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          v18 = "%{public}s nw_browse_descriptor_create_custom failed, no backtrace";
          v23 = v16;
          os_log_type_t v24 = v20;
LABEL_25:
          _os_log_impl(&dword_1830D4000, v23, v24, v18, buf, 0xCu);
          goto LABEL_26;
        }
        if (v21)
        {
          *(_DWORD *)buf = 136446466;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          __int16 v45 = 2082;
          v46 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v20, "%{public}s nw_browse_descriptor_create_custom failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
      }
      if (!v15)
      {
LABEL_19:
        char v13 = 0;
        goto LABEL_20;
      }
LABEL_18:
      free(v15);
      goto LABEL_19;
    }
    v30 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
    v31 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v41 = 0;
    if (!__nwlog_fault(v31, &type, &v41)) {
      goto LABEL_63;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v32 = __nwlog_obj();
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v34 = "%{public}s [super init] failed";
LABEL_61:
        _os_log_impl(&dword_1830D4000, v32, v33, v34, buf, 0xCu);
      }
    }
    else if (v41)
    {
      v37 = (char *)__nw_create_backtrace_string();
      v32 = __nwlog_obj();
      os_log_type_t v33 = type;
      BOOL v38 = os_log_type_enabled(v32, type);
      if (v37)
      {
        if (v38)
        {
          *(_DWORD *)buf = 136446466;
          v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
          __int16 v45 = 2082;
          v46 = v37;
          _os_log_impl(&dword_1830D4000, v32, v33, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v37);
        goto LABEL_63;
      }
      if (v38)
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v34 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_61;
      }
    }
    else
    {
      v32 = __nwlog_obj();
      os_log_type_t v33 = type;
      if (os_log_type_enabled(v32, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v34 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_61;
      }
    }

LABEL_63:
    if (v31) {
      free(v31);
    }
    char v13 = 0;
    goto LABEL_21;
  }
  v25 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
  v26 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v41 = 0;
  if (__nwlog_fault(v26, &type, &v41))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v27 = __nwlog_obj();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v29 = "%{public}s called with null encodedData";
LABEL_54:
        _os_log_impl(&dword_1830D4000, v27, v28, v29, buf, 0xCu);
      }
    }
    else
    {
      if (v41)
      {
        v35 = (char *)__nw_create_backtrace_string();
        v27 = __nwlog_obj();
        os_log_type_t v28 = type;
        BOOL v36 = os_log_type_enabled(v27, type);
        if (v35)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136446466;
            v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
            __int16 v45 = 2082;
            v46 = v35;
            _os_log_impl(&dword_1830D4000, v27, v28, "%{public}s called with null encodedData, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v35);
          goto LABEL_56;
        }
        if (!v36) {
          goto LABEL_55;
        }
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v29 = "%{public}s called with null encodedData, no backtrace";
        goto LABEL_54;
      }
      v27 = __nwlog_obj();
      os_log_type_t v28 = type;
      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 136446210;
        v44 = "-[NWBrowseDescriptor initWithEncodedData:]";
        v29 = "%{public}s called with null encodedData, backtrace limit exceeded";
        goto LABEL_54;
      }
    }
LABEL_55:
  }
LABEL_56:
  if (v26) {
    free(v26);
  }

  char v13 = 0;
LABEL_21:

  return v13;
}

void __42__NWBrowseDescriptor_initWithEncodedData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(objc_class **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 alloc];
  id v9 = nw_browse_descriptor_copy_custom_data(v7);

  id v10 = v9;
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }

  char v13 = (void *)[v8 initWithEncodedData:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_2;
  v15[3] = &unk_1E5249F20;
  id v16 = v5;
  id v14 = v5;
  [v13 browseWithCompletionHandler:v15];
}

void __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    BOOL v4 = nw_array_create();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) internalEndpoint];
          nw_array_append(v4, v10);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  if (nw_context_copy_implicit_context::onceToken != -1) {
    dispatch_once(&nw_context_copy_implicit_context::onceToken, &__block_literal_global_18);
  }
  id v11 = (id)nw_context_copy_implicit_context::implicit_context;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_3;
  v14[3] = &unk_1E524B950;
  id v12 = *(id *)(a1 + 32);
  id v15 = (id)v4;
  id v16 = v12;
  id v13 = (id)v4;
  nw_queue_context_async(v11, v14);
}

uint64_t __42__NWBrowseDescriptor_initWithEncodedData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)browseWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v5 = (id)gLogObj;
  if (v4)
  {
    *(_DWORD *)buf = 136446466;
    os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
    __int16 v25 = 2114;
    v26 = self;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v21 = 0;
    if (__nwlog_fault(v6, &type, &v21))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        __int16 v25 = 2114;
        v26 = self;
        id v9 = "%{public}s Descriptor %{public}@ does not support custom resolution";
LABEL_17:
        id v13 = v7;
        os_log_type_t v14 = v8;
        goto LABEL_18;
      }
      if (!v21)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v7 = (id)gLogObj;
        os_log_type_t v8 = type;
        if (!os_log_type_enabled(v7, type)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        __int16 v25 = 2114;
        v26 = self;
        id v9 = "%{public}s Descriptor %{public}@ does not support custom resolution, backtrace limit exceeded";
        goto LABEL_17;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v7 = (id)gLogObj;
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v7, type);
      if (!backtrace_string)
      {
        if (!v12)
        {
LABEL_19:

          if (!v6) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
        *(_DWORD *)buf = 136446466;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        __int16 v25 = 2114;
        v26 = self;
        id v9 = "%{public}s Descriptor %{public}@ does not support custom resolution, no backtrace";
        id v13 = v7;
        os_log_type_t v14 = v11;
LABEL_18:
        _os_log_impl(&dword_1830D4000, v13, v14, v9, buf, 0x16u);
        goto LABEL_19;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446722;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        __int16 v25 = 2114;
        v26 = self;
        __int16 v27 = 2082;
        os_log_type_t v28 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v7, v11, "%{public}s Descriptor %{public}@ does not support custom resolution, dumping backtrace:%{public}s", buf, 0x20u);
      }

      free(backtrace_string);
    }
    if (!v6)
    {
LABEL_13:
      v4[2](v4, 0);
      goto LABEL_14;
    }
LABEL_12:
    free(v6);
    goto LABEL_13;
  }
  *(_DWORD *)buf = 136446210;
  os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
  id v15 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v21 = 0;
  if (__nwlog_fault(v15, &type, &v21))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        long long v18 = "%{public}s called with null completionHandler";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else
    {
      if (v21)
      {
        long long v19 = (char *)__nw_create_backtrace_string();
        id v16 = __nwlog_obj();
        os_log_type_t v17 = type;
        BOOL v20 = os_log_type_enabled(v16, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
            __int16 v25 = 2082;
            v26 = (NWBrowseDescriptor *)v19;
            _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s called with null completionHandler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_38;
        }
        if (!v20) {
          goto LABEL_37;
        }
        *(_DWORD *)buf = 136446210;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        long long v18 = "%{public}s called with null completionHandler, no backtrace";
        goto LABEL_36;
      }
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        os_log_type_t v24 = "-[NWBrowseDescriptor browseWithCompletionHandler:]";
        long long v18 = "%{public}s called with null completionHandler, backtrace limit exceeded";
        goto LABEL_36;
      }
    }
LABEL_37:
  }
LABEL_38:
  if (v15) {
    free(v15);
  }
LABEL_14:
}

- (NSString)privateDescription
{
  id v2 = [(NWBrowseDescriptor *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [(NWBrowseDescriptor *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NWBrowseDescriptor *)self internalDescriptor];
  uint64_t v6 = (void *)[v4 initWithDescriptor:v5];

  return v6;
}

- (NWBrowseDescriptor)initWithDescriptor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWBrowseDescriptor;
    uint64_t v6 = [(NWBrowseDescriptor *)&v23 init];
    if (v6)
    {
      uint64_t v7 = v6;
      objc_storeStrong((id *)&v6->_internalDescriptor, a3);
      goto LABEL_4;
    }
    os_log_type_t v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
    id v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (!__nwlog_fault(v15, &type, &v24)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        long long v18 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v24)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      BOOL v22 = os_log_type_enabled(v16, type);
      if (backtrace_string)
      {
        if (v22)
        {
          *(_DWORD *)buf = 136446466;
          __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
          __int16 v28 = 2082;
          uint64_t v29 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v22)
      {
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        long long v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      id v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        long long v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v15) {
      free(v15);
    }
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  id v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
  id v10 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v24 = 0;
  if (__nwlog_fault(v10, &type, &v24))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        id v13 = "%{public}s called with null internalDescriptor";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v11, v12, v13, buf, 0xCu);
      }
    }
    else
    {
      if (v24)
      {
        long long v19 = (char *)__nw_create_backtrace_string();
        os_log_type_t v11 = __nwlog_obj();
        os_log_type_t v12 = type;
        BOOL v20 = os_log_type_enabled(v11, type);
        if (v19)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
            __int16 v28 = 2082;
            uint64_t v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null internalDescriptor, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        id v13 = "%{public}s called with null internalDescriptor, no backtrace";
        goto LABEL_29;
      }
      os_log_type_t v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "-[NWBrowseDescriptor initWithDescriptor:]";
        id v13 = "%{public}s called with null internalDescriptor, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v10) {
    free(v10);
  }

  uint64_t v7 = 0;
LABEL_4:

  return v7;
}

- (NSString)bonjourServiceType
{
  id v2 = [(NWBrowseDescriptor *)self internalDescriptor];
  bonjour_service_os_log_type_t type = nw_browse_descriptor_get_bonjour_service_type(v2);

  if (bonjour_service_type) {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_type);
  }
  else {
    BOOL v4 = 0;
  }

  return (NSString *)(id)v4;
}

- (NSString)bonjourServiceDomain
{
  id v2 = [(NWBrowseDescriptor *)self internalDescriptor];
  bonjour_service_domain = nw_browse_descriptor_get_bonjour_service_domain(v2);

  if (bonjour_service_domain) {
    BOOL v4 = nw_nsstring((uint64_t)bonjour_service_domain);
  }
  else {
    BOOL v4 = 0;
  }

  return (NSString *)(id)v4;
}

+ (NWBrowseDescriptor)descriptorWithProtocolBufferData:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [[NWPBBrowseDescriptor alloc] initWithData:v3];

  if (!v4)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    __int16 v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
    os_log_type_t v14 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v24 = 0;
    if (__nwlog_fault(v14, &type, &v24))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v15 = (id)gLogObj;
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v15, type)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        os_log_type_t v17 = "%{public}s [NWPBBrowseDescriptor initWithData:] failed";
LABEL_23:
        BOOL v22 = v15;
        os_log_type_t v23 = v16;
        goto LABEL_24;
      }
      if (!v24)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        id v15 = (id)gLogObj;
        os_log_type_t v16 = type;
        if (!os_log_type_enabled(v15, type)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        os_log_type_t v17 = "%{public}s [NWPBBrowseDescriptor initWithData:] failed, backtrace limit exceeded";
        goto LABEL_23;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v15 = (id)gLogObj;
      os_log_type_t v19 = type;
      BOOL v20 = os_log_type_enabled(v15, type);
      if (!backtrace_string)
      {
        if (!v20)
        {
LABEL_25:

          if (!v14) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136446210;
        __int16 v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        os_log_type_t v17 = "%{public}s [NWPBBrowseDescriptor initWithData:] failed, no backtrace";
        BOOL v22 = v15;
        os_log_type_t v23 = v19;
LABEL_24:
        _os_log_impl(&dword_1830D4000, v22, v23, v17, buf, 0xCu);
        goto LABEL_25;
      }
      if (v20)
      {
        *(_DWORD *)buf = 136446466;
        __int16 v27 = "+[NWBrowseDescriptor descriptorWithProtocolBufferData:]";
        __int16 v28 = 2082;
        uint64_t v29 = backtrace_string;
        _os_log_impl(&dword_1830D4000, v15, v19, "%{public}s [NWPBBrowseDescriptor initWithData:] failed, dumping backtrace:%{public}s", buf, 0x16u);
      }

      free(backtrace_string);
    }
    if (!v14) {
      goto LABEL_17;
    }
LABEL_16:
    free(v14);
    goto LABEL_17;
  }
  service = v4->_service;
  if (service)
  {
    uint64_t v6 = service;
    id v7 = v6[2];
    os_log_type_t v8 = v4->_service;
    id v9 = v8;
    if (v8) {
      domain = v8->_domain;
    }
    else {
      domain = 0;
    }
    os_log_type_t v11 = domain;
    os_log_type_t v12 = +[NWBonjourBrowseDescriptor descriptorWithType:v7 domain:v11];

    goto LABEL_18;
  }
LABEL_17:
  os_log_type_t v12 = 0;
LABEL_18:

  return (NWBrowseDescriptor *)v12;
}

+ (BOOL)supportsBrowseCallback
{
  return 0;
}

+ (NWBrowseDescriptor)descriptorWithInternalDescriptor:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NWBrowseDescriptor copyClassForDescriptorType:nw_browse_descriptor_get_type(v3)];
  id v5 = (void *)[[v4 alloc] initWithDescriptor:v3];

  return (NWBrowseDescriptor *)v5;
}

+ (Class)copyClassForDescriptorType:(int)a3
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)descriptorType
{
  return 0;
}

@end