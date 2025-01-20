@interface MCMResultQuery
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)extensionsPolicyUsesProxiedClient;
- (BOOL)extensionsUseProxiedClient;
- (BOOL)includeCreator;
- (BOOL)includeInfo;
- (BOOL)includePath;
- (BOOL)includeUserManagedAssetsRelPath;
- (BOOL)issueSandboxExtensions;
- (BOOL)issuedAnyExtensions;
- (BOOL)legacyExtensionPolicy;
- (BOOL)legacyPersonaPolicy;
- (MCMClientIdentity)clientIdentity;
- (MCMResultQuery)initWithContainers:(id)a3 clientIdentity:(id)a4 issueSandboxExtensions:(BOOL)a5 includePath:(BOOL)a6 includeInfo:(BOOL)a7 legacyPersonaPolicy:(BOOL)a8 legacyExtensionPolicy:(BOOL)a9 includeUserManagedAssetsRelPath:(BOOL)a10 includeCreator:(BOOL)a11 extensionsUseProxiedClient:(BOOL)a12 extensionsPolicyUsesProxiedClient:(BOOL)a13;
- (NSArray)containers;
- (void)_compileContainerDataForIndex:(unint64_t)a3 container:(container_object_s *)a4 infos:(id)a5 tokens:(id)a6;
- (void)setIssuedAnyExtensions:(BOOL)a3;
@end

@implementation MCMResultQuery

- (MCMResultQuery)initWithContainers:(id)a3 clientIdentity:(id)a4 issueSandboxExtensions:(BOOL)a5 includePath:(BOOL)a6 includeInfo:(BOOL)a7 legacyPersonaPolicy:(BOOL)a8 legacyExtensionPolicy:(BOOL)a9 includeUserManagedAssetsRelPath:(BOOL)a10 includeCreator:(BOOL)a11 extensionsUseProxiedClient:(BOOL)a12 extensionsPolicyUsesProxiedClient:(BOOL)a13
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MCMResultQuery;
  v22 = [(MCMResultBase *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_containers, a3);
    objc_storeStrong((id *)&v23->_clientIdentity, a4);
    v23->_issueSandboxExtensions = a5;
    v23->_includePath = a6;
    v23->_includeInfo = a7;
    v23->_legacyPersonaPolicy = a8;
    v23->_legacyExtensionPolicy = a9;
    v23->_includeUserManagedAssetsRelPath = a10;
    v23->_includeCreator = a11;
    v23->_extensionsUseProxiedClient = a12;
    *(_WORD *)&v23->_extensionsPolicyUsesProxiedClient = a13;
  }

  return v23;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MCMResultQuery;
  BOOL v5 = [(MCMResultBase *)&v33 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];
    BOOL v7 = v6 == 0;

    if (v7)
    {
      v8 = [(MCMResultQuery *)self containers];
      unint64_t v9 = [v8 count];

      if (v9 <= 1) {
        size_t v10 = 1;
      }
      else {
        size_t v10 = v9;
      }
      v11 = (char *)malloc_type_calloc(v10, 8uLL, 0x2004093837F09uLL);
      if ([(MCMResultQuery *)self includeInfo]) {
        xpc_object_t v12 = xpc_array_create(0, 0);
      }
      else {
        xpc_object_t v12 = 0;
      }
      xpc_object_t v13 = xpc_array_create(0, 0);
      if (v9)
      {
        uint64_t v14 = 0;
        v15 = v11;
        do
        {
          [(MCMResultQuery *)self _compileContainerDataForIndex:v14++ container:v15 infos:v12 tokens:v13];
          v15 += 8;
        }
        while (v9 != v14);
      }
      if (v12) {
        xpc_dictionary_set_value(v4, "ReplyContainerInfos", v12);
      }
      if (v13) {
        xpc_dictionary_set_value(v4, "ReplyContainerTokens", v13);
      }
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x2020000000;
      uint64_t v32 = 0;
      [(MCMResultQuery *)self includePath];
      [(MCMResultQuery *)self includeUserManagedAssetsRelPath];
      [(MCMResultQuery *)self includeCreator];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      v16 = (const void *)container_frozenset_create();
      size_t v17 = v30[3];
      if (v17)
      {
        v18 = dispatch_data_create(v16, v17, 0, (dispatch_block_t)*MEMORY[0x1E4F14408]);
        xpc_object_t v19 = xpc_data_create_with_dispatch_data(v18);
        xpc_dictionary_set_value(v4, "ReplyContainerSet", v19);
      }
      container_frozenset_destroy();
      container_free_array_of_containers();
      BOOL v20 = [(MCMResultQuery *)self includeInfo];
      BOOL v21 = [(MCMResultQuery *)self includePath];
      BOOL v22 = [(MCMResultQuery *)self includeUserManagedAssetsRelPath];
      BOOL v23 = [(MCMResultQuery *)self includeCreator];
      uint64_t v24 = 2;
      if (!v20) {
        uint64_t v24 = 0;
      }
      uint64_t v25 = v24 | v21;
      if (v22) {
        v25 |= 4uLL;
      }
      if (v23) {
        uint64_t v26 = v25 | 0x20;
      }
      else {
        uint64_t v26 = v25;
      }
      if ([(MCMResultQuery *)self issuedAnyExtensions])
      {
        if ([(MCMResultQuery *)self extensionsUseProxiedClient]) {
          v26 |= 0x10uLL;
        }
        else {
          v26 |= 8uLL;
        }
      }
      xpc_dictionary_set_uint64(v4, "ReplyFlags", v26);
      _Block_object_dispose(&v29, 8);
    }
  }

  return v5;
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (void)_compileContainerDataForIndex:(unint64_t)a3 container:(container_object_s *)a4 infos:(id)a5 tokens:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  xpc_object_t v12 = [(MCMResultQuery *)self containers];
  xpc_object_t v13 = [v12 objectAtIndexedSubscript:a3];

  id v34 = 0;
  uint64_t v14 = (container_object_s *)[v13 createLibsystemContainerWithError:&v34];
  id v15 = v34;
  *a4 = v14;
  if (!v14)
  {
    uint64_t v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[MCMResultQuery _compileContainerDataForIndex:container:infos:tokens:]";
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_fault_impl(&dword_1D7739000, v25, OS_LOG_TYPE_FAULT, "%s: failed to create container: %@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  v16 = &selRef_weakObjectsHashTable;
  if (v10)
  {
    if (![v13 conformsToProtocol:&unk_1F2F1ADA0]
      || ([v13 info],
          size_t v17 = objc_claimAutoreleasedReturnValue(),
          v18 = (void *)_CFXPCCreateXPCObjectFromCFObject(),
          v17,
          !v18))
    {
      v18 = xpc_null_create();
    }
    xpc_array_append_value(v10, v18);
  }
  if (v11)
  {
    *(void *)buf = 0;
    xpc_object_t v19 = 0;
    if ([(MCMResultQuery *)self issueSandboxExtensions])
    {
      id v33 = v15;
      BOOL v20 = [(MCMResultQuery *)self clientIdentity];
      BOOL v21 = [v13 containerIdentity];
      BOOL v22 = [v13 containerPath];
      xpc_object_t v19 = (char *)objc_msgSend(v20, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v21, v22, -[MCMResultQuery legacyExtensionPolicy](self, "legacyExtensionPolicy"), -[MCMResultQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient"), -[MCMResultQuery extensionsPolicyUsesProxiedClient](self, "extensionsPolicyUsesProxiedClient"), 0);
      *(void *)buf = v19;

      if (v19)
      {
        [(MCMResultQuery *)self setIssuedAnyExtensions:1];
        xpc_object_t v23 = xpc_string_create(v19);
        if (v23)
        {
          uint64_t v24 = v23;
          xpc_array_append_value(v11, v23);

          id v15 = v33;
          v16 = &selRef_weakObjectsHashTable;
LABEL_16:
          free(v19);
          memset_s(buf, 8uLL, 0, 8uLL);
          goto LABEL_17;
        }
      }
      id v15 = v33;
      v16 = &selRef_weakObjectsHashTable;
    }
    xpc_object_t v26 = xpc_null_create();
    xpc_array_append_value(v11, v26);

    if (!v19) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_17:
  v27 = [v13 containerPath];
  id v28 = [v27 containerDataURL];
  [v28 fileSystemRepresentation];
  container_object_set_path();

  if ([v13 conformsToProtocol:v16[174]])
  {
    uint64_t v25 = v13;
    if ([(MCMResultQuery *)self includeUserManagedAssetsRelPath])
    {
      uint64_t v29 = [v25 userManagedAssetsDirName];
      if (v29)
      {
        id v30 = [@"Library" stringByAppendingPathComponent:v29];
        [v30 fileSystemRepresentation];
        container_object_set_user_managed_assets_relative_path();
      }
    }
    if ([(MCMResultQuery *)self includeCreator])
    {
      uint64_t v31 = [v25 creator];
      uint64_t v32 = v31;
      if (v31)
      {
        [v31 UTF8String];
        container_object_set_creator_codesign_identifier();
      }
    }
LABEL_26:
  }
}

- (NSArray)containers
{
  return self->_containers;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (BOOL)includePath
{
  return self->_includePath;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)issuedAnyExtensions
{
  return self->_issuedAnyExtensions;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setIssuedAnyExtensions:(BOOL)a3
{
  self->_issuedAnyExtensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);

  objc_storeStrong((id *)&self->_containers, 0);
}

mach_vm_address_t __40__MCMResultQuery_encodeResultOntoReply___block_invoke(uint64_t a1, uint64_t a2)
{
  kern_return_t v4;
  kern_return_t v5;
  NSObject *v6;
  mach_vm_address_t address;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  mach_vm_size_t v12;
  __int16 v13;
  kern_return_t v14;
  uint64_t v15;

  id v15 = *MEMORY[0x1E4F143B8];
  address = 0;
  mach_vm_size_t v3 = (a2 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
  id v4 = mach_vm_allocate(*MEMORY[0x1E4F14960], &address, v3, 1);
  if (v4)
  {
    BOOL v5 = v4;
    v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v10 = "-[MCMResultQuery encodeResultOntoReply:]_block_invoke";
      id v11 = 2048;
      xpc_object_t v12 = v3 >> 10;
      xpc_object_t v13 = 1024;
      uint64_t v14 = v5;
      _os_log_fault_impl(&dword_1D7739000, v6, OS_LOG_TYPE_FAULT, "%s: mach_vm_allocate() failed to allocate %llu KB: %d", buf, 0x1Cu);
    }

    return 0;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
    return address;
  }
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

@end