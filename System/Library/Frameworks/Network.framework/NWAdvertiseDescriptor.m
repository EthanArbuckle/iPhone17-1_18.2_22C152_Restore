@interface NWAdvertiseDescriptor
- (NSData)txtRecord;
- (NSString)bonjourServiceDomain;
- (NSString)bonjourServiceName;
- (NSString)bonjourServiceType;
- (NWAdvertiseDescriptor)initWithDescriptor:(id)a3;
- (NWAdvertiseDescriptor)initWithName:(id)a3 type:(id)a4 domain:(id)a5;
- (OS_nw_advertise_descriptor)internalDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)privateDescription;
- (void)setInternalDescriptor:(id)a3;
- (void)setTxtRecord:(id)a3;
@end

@implementation NWAdvertiseDescriptor

- (void).cxx_destruct
{
}

- (void)setInternalDescriptor:(id)a3
{
}

- (OS_nw_advertise_descriptor)internalDescriptor
{
  return self->_internalDescriptor;
}

- (void)setTxtRecord:(id)a3
{
  id v5 = a3;
  v4 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  nw_advertise_descriptor_set_txt_record(v4, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
}

- (NSData)txtRecord
{
  uint64_t v7 = 0;
  v2 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  uint64_t txt_record = nw_advertise_descriptor_get_txt_record(v2, &v7);

  if (txt_record)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v5 = (void *)[v4 initWithBytes:txt_record length:v7];
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (id)privateDescription
{
  return [(NWAdvertiseDescriptor *)self descriptionWithIndent:0 showFullContent:1];
}

- (id)description
{
  return [(NWAdvertiseDescriptor *)self descriptionWithIndent:0 showFullContent:0];
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  id v4 = NSString;
  id v5 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  v6 = [v4 stringWithFormat:@"%@", v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  v6 = (void *)[v4 initWithDescriptor:v5];

  return v6;
}

- (NWAdvertiseDescriptor)initWithDescriptor:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v23.receiver = self;
    v23.super_class = (Class)NWAdvertiseDescriptor;
    v6 = [(NWAdvertiseDescriptor *)&v23 init];
    if (v6)
    {
      uint64_t v7 = v6;
      objc_storeStrong((id *)&v6->_internalDescriptor, a3);
      goto LABEL_4;
    }
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
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
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
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
          v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
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
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
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
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
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
  v9 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
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
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor";
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
            v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
            __int16 v28 = 2082;
            v29 = v19;
            _os_log_impl(&dword_1830D4000, v11, v12, "%{public}s called with null internalDescriptor, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v19);
          goto LABEL_31;
        }
        if (!v20) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor, no backtrace";
        goto LABEL_29;
      }
      v11 = __nwlog_obj();
      os_log_type_t v12 = type;
      if (os_log_type_enabled(v11, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWAdvertiseDescriptor initWithDescriptor:]";
        v13 = "%{public}s called with null internalDescriptor, backtrace limit exceeded";
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

- (NSString)bonjourServiceName
{
  v2 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  uint64_t bonjour_name = nw_advertise_descriptor_get_bonjour_name(v2);

  if (bonjour_name) {
    BOOL v4 = nw_nsstring(bonjour_name);
  }
  else {
    BOOL v4 = 0;
  }

  return (NSString *)(id)v4;
}

- (NSString)bonjourServiceType
{
  v2 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  bonjour_os_log_type_t type = nw_advertise_descriptor_get_bonjour_type(v2);

  if (bonjour_type) {
    BOOL v4 = nw_nsstring(bonjour_type);
  }
  else {
    BOOL v4 = 0;
  }

  return (NSString *)(id)v4;
}

- (NSString)bonjourServiceDomain
{
  v2 = [(NWAdvertiseDescriptor *)self internalDescriptor];
  uint64_t bonjour_domain = nw_advertise_descriptor_get_bonjour_domain(v2);

  if (bonjour_domain) {
    BOOL v4 = nw_nsstring(bonjour_domain);
  }
  else {
    BOOL v4 = 0;
  }

  return (NSString *)(id)v4;
}

- (NWAdvertiseDescriptor)initWithName:(id)a3 type:(id)a4 domain:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v30.receiver = self;
    v30.super_class = (Class)NWAdvertiseDescriptor;
    v11 = [(NWAdvertiseDescriptor *)&v30 init];
    if (v11)
    {
      os_log_type_t v12 = v11;
      nw_advertise_descriptor_t bonjour_service = nw_advertise_descriptor_create_bonjour_service((const char *)[v8 UTF8String], (const char *)objc_msgSend(v9, "UTF8String"), (const char *)objc_msgSend(v10, "UTF8String"));
      internalDescriptor = v12->_internalDescriptor;
      v12->_internalDescriptor = (OS_nw_advertise_descriptor *)bonjour_service;

      goto LABEL_4;
    }
    v21 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
    BOOL v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (!__nwlog_fault(v22, &type, &v31)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      objc_super v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v25 = "%{public}s [super init] failed";
LABEL_36:
        _os_log_impl(&dword_1830D4000, v23, v24, v25, buf, 0xCu);
      }
    }
    else if (v31)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      objc_super v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      BOOL v29 = os_log_type_enabled(v23, type);
      if (backtrace_string)
      {
        if (v29)
        {
          *(_DWORD *)buf = 136446466;
          v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
          __int16 v35 = 2082;
          v36 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v23, v24, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v29)
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v25 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_36;
      }
    }
    else
    {
      objc_super v23 = __nwlog_obj();
      os_log_type_t v24 = type;
      if (os_log_type_enabled(v23, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        v25 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_36;
      }
    }

LABEL_38:
    if (v22) {
      free(v22);
    }
    os_log_type_t v12 = 0;
    goto LABEL_4;
  }
  v16 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
  os_log_type_t v17 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v31 = 0;
  if (__nwlog_fault(v17, &type, &v31))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v18 = __nwlog_obj();
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        BOOL v20 = "%{public}s called with null type";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v18, v19, v20, buf, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        v26 = (char *)__nw_create_backtrace_string();
        v18 = __nwlog_obj();
        os_log_type_t v19 = type;
        BOOL v27 = os_log_type_enabled(v18, type);
        if (v26)
        {
          if (v27)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
            __int16 v35 = 2082;
            v36 = v26;
            _os_log_impl(&dword_1830D4000, v18, v19, "%{public}s called with null type, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v26);
          goto LABEL_31;
        }
        if (!v27) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        BOOL v20 = "%{public}s called with null type, no backtrace";
        goto LABEL_29;
      }
      v18 = __nwlog_obj();
      os_log_type_t v19 = type;
      if (os_log_type_enabled(v18, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWAdvertiseDescriptor initWithName:type:domain:]";
        BOOL v20 = "%{public}s called with null type, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:
  }
LABEL_31:
  if (v17) {
    free(v17);
  }

  os_log_type_t v12 = 0;
LABEL_4:

  return v12;
}

@end