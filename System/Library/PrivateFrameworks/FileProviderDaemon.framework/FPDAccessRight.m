@interface FPDAccessRight
- (FPDAccessRight)init;
- (FPDAccessRight)initWithURL:(id)a3 connection:(id)a4 manager:(id)a5;
- (FPDAccessRight)initWithURL:(id)a3 entitlements:(id)a4 connection:(id)a5 manager:(id)a6;
- (FPDDomain)domain;
- (FPDExtension)provider;
- (unint64_t)level;
- (void)_computeAccessForURL:(id)a3 entitlements:(id)a4 connection:(id)a5;
@end

@implementation FPDAccessRight

- (void)_computeAccessForURL:(id)a3 entitlements:(id)a4 connection:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] && objc_msgSend(v10, "fp_hasOneOfEntitlements:logLevel:", v9, 0))
  {
    unint64_t v11 = 4;
LABEL_8:
    self->_accessLevel = v11;
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "fp_hasSandboxAccessToFile:accessType:logLevel:", v8, *MEMORY[0x1E4F25910], 0))
  {
    unint64_t v11 = 3;
    goto LABEL_8;
  }
  if (objc_msgSend(v10, "fp_hasSandboxAccessToFile:accessType:logLevel:", v8, *MEMORY[0x1E4F25900], 0))
  {
    unint64_t v11 = 1;
    goto LABEL_8;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v13 = objc_msgSend(WeakRetained, "providedItemsURLs", 0);

  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(v10, "fp_hasSandboxAccessToFile:logLevel:", *(void *)(*((void *)&v18 + 1) + 8 * v17), 0))self->_accessLevel = 2; {
        ++v17;
        }
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

LABEL_9:
}

- (FPDAccessRight)initWithURL:(id)a3 entitlements:(id)a4 connection:(id)a5 manager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FPDAccessRight;
  uint64_t v14 = [(FPDAccessRight *)&v21 init];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_accessLevel = 0;
    uint64_t v16 = [v13 domainForURL:v10 reason:0];
    objc_storeWeak((id *)&v15->_domain, v16);

    id WeakRetained = objc_loadWeakRetained((id *)&v15->_domain);
    long long v18 = [WeakRetained provider];

    if ([v18 isAppExtensionReachable])
    {
      long long v19 = [v18 asAppExtensionBackedProvider];
      objc_storeWeak((id *)&v15->_provider, v19);
    }
    [(FPDAccessRight *)v15 _computeAccessForURL:v10 entitlements:v11 connection:v12];
  }
  return v15;
}

- (FPDAccessRight)initWithURL:(id)a3 connection:(id)a4 manager:(id)a5
{
  return [(FPDAccessRight *)self initWithURL:a3 entitlements:MEMORY[0x1E4F1CBF0] connection:a4 manager:a5];
}

- (FPDAccessRight)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"should not call this"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDAccessRight init]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDAccessRight.m", 71, (const char *)[v2 UTF8String]);
}

- (unint64_t)level
{
  return self->_accessLevel;
}

- (FPDExtension)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (FPDExtension *)WeakRetained;
}

- (FPDDomain)domain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domain);
  return (FPDDomain *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_domain);
  objc_destroyWeak((id *)&self->_provider);
}

@end