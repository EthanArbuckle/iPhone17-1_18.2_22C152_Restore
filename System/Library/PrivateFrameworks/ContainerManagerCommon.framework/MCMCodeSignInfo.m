@interface MCMCodeSignInfo
- (MCMCodeSignInfo)initWithAuditToken:(id *)a3;
- (MCMCodeSignInfo)initWithURL:(id)a3 error:(unint64_t *)a4;
- (NSDictionary)entitlements;
- (NSString)identifier;
- (unsigned)platform;
@end

@implementation MCMCodeSignInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_entitlements, 0);
}

- (unsigned)platform
{
  return self->_platform;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (MCMCodeSignInfo)initWithAuditToken:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];

  long long v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v4;
  int pid = container_audit_token_get_pid();
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v6;
  uint64_t v7 = container_audit_token_copy_codesign_identifier();
  uint64_t __s = v7;
  if (!v7)
  {
    v19 = container_log_handle_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, "[pid:%d] could not get codesign identifier", buf, 8u);
    }

    v12 = 0;
    v14 = 0;
    v9 = 0;
    goto LABEL_16;
  }
  v8 = (void *)v7;
  v9 = [NSString stringWithUTF8String:v7];
  free(v8);
  memset_s(&__s, 8uLL, 0, 8uLL);
  long long v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v10;
  uint64_t v11 = container_audit_token_copy_entitlement();
  if (!v11)
  {
    v20 = container_log_handle_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = pid;
      _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "[%@ (pid:%d)] could not get entitlements (assuming none)", buf, 0x12u);
    }

    v12 = 0;
    goto LABEL_15;
  }
  v12 = (void *)v11;
  uint64_t v13 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v13)
  {
    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = pid;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "[%@ (pid:%d)] could not translate entitlements (assuming none)", buf, 0x12u);
    }

LABEL_15:
    v14 = 0;
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  v14 = (void *)v13;
  long long v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v15;
  unsigned int platform = container_audit_token_get_platform();
  v24.receiver = 0;
  v24.super_class = (Class)MCMCodeSignInfo;
  v17 = [(MCMCodeSignInfo *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, v9);
    objc_storeStrong((id *)&v18->_entitlements, v14);
    v18->_unsigned int platform = platform;
  }
LABEL_17:
  v22 = v18;

  return v22;
}

- (MCMCodeSignInfo)initWithURL:(id)a3 error:(unint64_t *)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)MCMCodeSignInfo;

  if (a4) {
    *a4 = 72;
  }
  return 0;
}

@end