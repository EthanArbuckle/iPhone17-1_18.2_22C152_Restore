@interface FPXDomainContext
- (BOOL)shouldIngestDomainUserInfoUpdateWithOldVersion:(id)a3 newVersion:(id)a4;
- (BOOL)usesFPFS;
- (FPProviderDomain)providerDomain;
- (FPSpotlightIndexer)spotlightIndexer;
- (FPXDomainContext)initWithVendorInstance:(id)a3 domain:(id)a4 extensionContext:(id)a5 providerDomain:(id)a6 domainVersion:(id)a7;
- (FPXExtensionContext)extensionContext;
- (NSDictionary)userInfo;
- (NSFileProviderDomain)domain;
- (NSFileProviderDomainVersion)domainVersion;
- (NSFileProviderExtension)v2Instance;
- (NSFileProviderReplicatedExtension)vendorInstance;
- (OS_os_log)log;
- (id)currentResponseWithRequest:(id)a3;
- (id)instanceWithPrivateSelector:(SEL)a3;
- (id)internalErrorFromVendorError:(id)a3 callerDescription:(id)a4;
- (id)itemFromVendorItem:(id)a3;
- (id)itemIDFromVendorItemID:(id)a3;
- (id)itemIDsFromVendorItemIDs:(id)a3;
- (id)itemsFromVendorItems:(id)a3;
- (unint64_t)extensionCapabilities;
- (void)domainVersion;
- (void)invalidate;
- (void)prepareForDomainRemovalWithCompletionHandler:(id)a3;
- (void)retrieveUserInfoFromExtension;
- (void)setLog:(id)a3;
- (void)updateCapabilities;
- (void)userInfo;
@end

@implementation FPXDomainContext

- (id)itemIDsFromVendorItemIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__FPXDomainContext_itemIDsFromVendorItemIDs___block_invoke;
  v5[3] = &unk_1E5AF0940;
  v5[4] = self;
  v3 = objc_msgSend(a3, "fp_map:", v5);

  return v3;
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (NSFileProviderReplicatedExtension)vendorInstance
{
  return self->_vendorInstance;
}

- (FPXDomainContext)initWithVendorInstance:(id)a3 domain:(id)a4 extensionContext:(id)a5 providerDomain:(id)a6 domainVersion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)FPXDomainContext;
  v17 = [(FPXDomainContext *)&v28 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domain, a4);
    objc_storeStrong((id *)&v18->_providerDomain, a6);
    v19 = [[FPExceptionToErrorProxy alloc] initWithTarget:v12];
    vendorInstance = v18->_vendorInstance;
    v18->_vendorInstance = (NSFileProviderReplicatedExtension *)v19;

    objc_storeWeak((id *)&v18->_extensionContext, v14);
    v18->_usesFPFS = [v15 isUsingFPFS];
    objc_storeStrong((id *)&v18->_lastKnownDomainVersion, a7);
    v18->_selfPid = getpid();
    v21 = [v15 identifier];
    objc_msgSend(v21, "fp_obfuscatedProviderDomainID");
    id v22 = objc_claimAutoreleasedReturnValue();
    uint64_t v23 = fpfs_create_log_for_provider((char *)[v22 UTF8String]);
    log = v18->_log;
    v18->_log = (OS_os_log *)v23;

    [(FPXDomainContext *)v18 updateCapabilities];
    if ((v18->_extensionCapabilities & 1) != 0 && ([v15 isUsingFPFS] & 1) == 0)
    {
      v25 = [[FPSpotlightIndexer alloc] initWithDomain:v13 providerDomain:v15 log:v18->_log supportURL:0 dropIndexDelegate:0];
      spotlightIndexer = v18->_spotlightIndexer;
      v18->_spotlightIndexer = v25;

      [(FPSpotlightIndexer *)v18->_spotlightIndexer setDomainContext:v18];
    }
  }

  return v18;
}

- (void)updateCapabilities
{
  id v15 = [MEMORY[0x1E4F223A0] bundleRecordForCurrentProcess];
  if (!v15)
  {
    id v13 = [NSString stringWithFormat:@"FPXExtensionContext could not get the bundle record for the current process."];
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      [(NSXPCConnection(FPAdditions) *)(uint64_t)v13 fp_userInfo];
    }

    __assert_rtn("-[FPXDomainContext updateCapabilities]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXDomainContext.m", 80, (const char *)[v13 UTF8String]);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"FPXDomainContext.m", 82, @"FPXExtensionContext initialized from a bundle that is not a plugin. Bundle proxy is %@ instead", v15 object file lineNumber description];
    }
  }
  v4 = [v15 infoDictionary];
  v5 = [v4 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  objc_opt_class();
  v6 = objectForKeyOfClass(v5, @"NSExtensionFileProviderSupportsEnumeration");
  int v7 = [v6 BOOLValue];

  objc_opt_class();
  v8 = objectForKeyOfClass(v5, @"NSExtensionPointVersion");
  if (([v8 isEqualToString:@"2.0"] & 1) != 0 || v7) {
    self->_extensionCapabilities |= 1uLL;
  }
  v9 = [(FPXDomainContext *)self instanceWithPrivateSelector:sel_evictItemWithIdentifier_completionHandler_];

  if (v9) {
    self->_extensionCapabilities |= 2uLL;
  }
  objc_opt_class();
  v10 = objectForKeyOfClass(v5, @"NSExtensionFileProviderSupportsTagging");
  v11 = v10;
  if (!v10 || [v10 BOOLValue]) {
    self->_extensionCapabilities |= 4uLL;
  }
}

- (id)instanceWithPrivateSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector())
  {
    v4 = self->_vendorInstance;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSFileProviderReplicatedExtension *)self->_vendorInstance extension];
    if (objc_opt_respondsToSelector()) {
      goto LABEL_7;
    }
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (FPSpotlightIndexer)spotlightIndexer
{
  return self->_spotlightIndexer;
}

- (id)currentResponseWithRequest:(id)a3
{
  id v4 = a3;
  if ([(FPXDomainContext *)self usesFPFS])
  {
    v5 = objc_opt_new();
    v6 = [(FPXDomainContext *)self domainVersion];
    [v5 setDomainVersion:v6];
    if (v4)
    {
      int v7 = [v4 domainVersion];
      if ([(FPXDomainContext *)self shouldIngestDomainUserInfoUpdateWithOldVersion:v7 newVersion:v6])
      {
        v8 = [(FPXDomainContext *)self userInfo];
        [v5 setDomainUserInfo:v8];
      }
    }
    if ([(FPProviderDomain *)self->_providerDomain appliesChangesAtomically])
    {
      [v5 setExtensionPid:self->_selfPid];
      ++self->_sequenceNumber;
      objc_msgSend(v5, "setSequenceNumber:");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)usesFPFS
{
  return self->_usesFPFS;
}

- (id)internalErrorFromVendorError:(id)a3 callerDescription:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__FPXDomainContext_internalErrorFromVendorError_callerDescription___block_invoke;
  v6[3] = &unk_1E5AF5F70;
  v6[4] = self;
  id v4 = objc_msgSend(a3, "fp_internalErrorForVendorErrorWithCallerDescription:itemCreationBlock:", a4, v6);

  return v4;
}

- (id)itemFromVendorItem:(id)a3
{
  if (a3)
  {
    id v26 = a3;
    v5 = [(FPXDomainContext *)self extensionContext];

    if (!v5)
    {
      v6 = [(FPXDomainContext *)self extensionContext];

      if (!v6)
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"FPXDomainContext.m" lineNumber:133 description:@"there should be an extension context"];
      }
    }
    int v7 = [(FPXDomainContext *)self extensionContext];
    v8 = [v7 providerIdentifier];

    if (!v8)
    {
      v9 = [(FPXDomainContext *)self extensionContext];
      v10 = [v9 providerIdentifier];

      if (!v10)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"FPXDomainContext.m" lineNumber:134 description:@"there should be a provider identifier"];
      }
    }
    v11 = [FPItem alloc];
    v25 = [(FPXDomainContext *)self extensionContext];
    id v12 = [v25 providerIdentifier];
    id v13 = [(FPXDomainContext *)self domain];
    uint64_t v14 = [v13 identifier];
    id v15 = (void *)v14;
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    else {
      id v16 = @"NSFileProviderDomainDefaultIdentifier";
    }
    v17 = [(FPXDomainContext *)self domain];
    v18 = [v17 spotlightDomainIdentifier];
    unint64_t v19 = [(FPXDomainContext *)self extensionCapabilities];
    v20 = [(FPXDomainContext *)self extensionContext];
    v21 = -[FPItem initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:](v11, "initWithVendorItem:provider:domain:spotlightDomainIdentifier:extensionCapabilities:useFPFS:", v26, v12, v16, v18, v19, [v20 usesFPFS]);

    [(FPItem *)v21 setEnumerationOrigin:1];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (FPXExtensionContext)extensionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);

  return (FPXExtensionContext *)WeakRetained;
}

- (unint64_t)extensionCapabilities
{
  return self->_extensionCapabilities;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)prepareForDomainRemovalWithCompletionHandler:(id)a3
{
  id v4 = a3;
  spotlightIndexer = self->_spotlightIndexer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__FPXDomainContext_prepareForDomainRemovalWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5AF0790;
  id v8 = v4;
  id v6 = v4;
  [(FPSpotlightIndexer *)spotlightIndexer dropIndexAndInvalidateWithDropReason:1 completionHandler:v7];
}

uint64_t __65__FPXDomainContext_prepareForDomainRemovalWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__FPXDomainContext_internalErrorFromVendorError_callerDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemFromVendorItem:a2];
}

- (id)itemIDFromVendorItemID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [FPItemID alloc];
    id v6 = [(FPXDomainContext *)self extensionContext];
    int v7 = [v6 providerIdentifier];
    id v8 = [(FPXDomainContext *)self domain];
    uint64_t v9 = [v8 identifier];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = @"NSFileProviderDomainDefaultIdentifier";
    }
    id v12 = [(FPItemID *)v5 initWithProviderID:v7 domainIdentifier:v11 itemIdentifier:v4];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)itemsFromVendorItems:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__FPXDomainContext_itemsFromVendorItems___block_invoke;
  v5[3] = &unk_1E5AF5F98;
  v5[4] = self;
  v3 = objc_msgSend(a3, "fp_map:", v5);

  return v3;
}

uint64_t __41__FPXDomainContext_itemsFromVendorItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemFromVendorItem:a2];
}

uint64_t __45__FPXDomainContext_itemIDsFromVendorItemIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemIDFromVendorItemID:a2];
}

- (void)invalidate
{
  id v2 = [(FPXDomainContext *)self vendorInstance];
  [v2 invalidate];
}

- (NSFileProviderExtension)v2Instance
{
  if ([(FPXDomainContext *)self usesFPFS]) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self->_vendorInstance;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v3 = 0;
  }
  else
  {
    v3 = [(NSFileProviderReplicatedExtension *)self->_vendorInstance extension];
  }
LABEL_7:

  return (NSFileProviderExtension *)v3;
}

- (NSFileProviderDomainVersion)domainVersion
{
  if (![(FPXDomainContext *)self usesFPFS]
    || ![(NSFileProviderReplicatedExtension *)self->_vendorInstance conformsToProtocol:&unk_1EF6EE420])
  {
    id v6 = 0;
    goto LABEL_15;
  }
  v3 = [(NSFileProviderReplicatedExtension *)self->_vendorInstance domainVersion];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    lastKnownDomainVersion = self->_lastKnownDomainVersion;
    if (!lastKnownDomainVersion)
    {
LABEL_7:
      if (([v3 isEqual:lastKnownDomainVersion] & 1) == 0)
      {
        v5 = fp_current_or_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          [(FPXDomainContext *)(uint64_t *)&self->_lastKnownDomainVersion domainVersion];
        }

        objc_storeStrong((id *)&self->_lastKnownDomainVersion, v3);
        [(FPXDomainContext *)self retrieveUserInfoFromExtension];
      }
      id v6 = v3;
      goto LABEL_14;
    }
    if ((objc_msgSend(v3, "compare:") & 0x8000000000000000) == 0)
    {
      lastKnownDomainVersion = self->_lastKnownDomainVersion;
      goto LABEL_7;
    }
  }
  int v7 = [(FPXDomainContext *)self domain];
  id v8 = [v7 identifier];
  __FILEPROVIDER_BAD_DOMAIN_VERSION__(v8, self->_lastKnownDomainVersion, v3);

  id v6 = 0;
LABEL_14:

LABEL_15:

  return (NSFileProviderDomainVersion *)v6;
}

- (NSDictionary)userInfo
{
  if ([(FPXDomainContext *)self usesFPFS])
  {
    lastKnownUserInfo = self->_lastKnownUserInfo;
    if (lastKnownUserInfo) {
      goto LABEL_6;
    }
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[FPXDomainContext userInfo](v4);
    }

    [(FPXDomainContext *)self retrieveUserInfoFromExtension];
    lastKnownUserInfo = self->_lastKnownUserInfo;
    if (lastKnownUserInfo)
    {
LABEL_6:
      v5 = lastKnownUserInfo;
      goto LABEL_11;
    }
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FPXDomainContext userInfo](v6);
    }
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (void)retrieveUserInfoFromExtension
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating user info from extension, was previously %@", (uint8_t *)&v3, 0xCu);
}

- (BOOL)shouldIngestDomainUserInfoUpdateWithOldVersion:(id)a3 newVersion:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  int v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v6) {
      BOOL v9 = v5 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v6) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v5 == 0;
    }
    BOOL v8 = 1;
    if (v10 && !v9) {
      BOOL v8 = (unint64_t)[(id)v5 compare:v6] > 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (FPProviderDomain)providerDomain
{
  return self->_providerDomain;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightIndexer, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_vendorInstance, 0);
  objc_destroyWeak((id *)&self->_extensionContext);
  objc_storeStrong((id *)&self->_lastKnownUserInfo, 0);

  objc_storeStrong((id *)&self->_lastKnownDomainVersion, 0);
}

- (void)domainVersion
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Domain version updated from %@ to %@", (uint8_t *)&v4, 0x16u);
}

- (void)userInfo
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Updating user info from extension in userInfo", v1, 2u);
}

@end