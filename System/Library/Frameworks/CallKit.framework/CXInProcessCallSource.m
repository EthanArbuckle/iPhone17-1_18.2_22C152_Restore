@interface CXInProcessCallSource
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isPermittedToUsePrivateAPI;
- (BOOL)isPermittedToUsePublicAPI;
- (CXInProcessCallSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (CXInProcessCallSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 fallbackLocalizedName:(id)a5;
- (CXInProcessProvider)provider;
- (id)bundleIdentifier;
- (id)bundleURL;
- (id)localizedName;
- (void)setProvider:(id)a3;
@end

@implementation CXInProcessCallSource

- (CXInProcessCallSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return [(CXInProcessCallSource *)self initWithIdentifier:a3 bundleIdentifier:a4 fallbackLocalizedName:0];
}

- (CXInProcessCallSource)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 fallbackLocalizedName:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CXInProcessCallSource;
  v10 = [(CXCallSource *)&v23 initWithIdentifier:a3];
  if (v10)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F223C8], "cx_applicationRecordForBundleIdentifier:", v8);
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 bundleIdentifier];
      bundleIdentifier = v10->_bundleIdentifier;
      v10->_bundleIdentifier = (NSString *)v13;

      uint64_t v15 = [v12 URL];
      bundleURL = v10->_bundleURL;
      v10->_bundleURL = (NSURL *)v15;

      v17 = [v12 localizedName];
      uint64_t v18 = [v17 copy];
      localizedName = v10->_localizedName;
      v10->_localizedName = (NSString *)v18;
    }
    else
    {
      v20 = CXDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v8;
        _os_log_impl(&dword_1A6E3A000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot find application record for bundle identifier: %@", buf, 0xCu);
      }

      v21 = (NSString *)v9;
      v17 = v10->_localizedName;
      v10->_localizedName = v21;
    }
  }
  return v10;
}

- (void)setProvider:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallSource *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CXInProcessCallSource_setProvider___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__CXInProcessCallSource_setProvider___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 setConnected:1];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  *(_OWORD *)retstr->var0 = v3;
  *(_OWORD *)&retstr->var0[4] = v3;
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)auditTokenForTask(*MEMORY[0x1E4F14960], retstr);
}

- (BOOL)isPermittedToUsePublicAPI
{
  return 1;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  return 1;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)bundleURL
{
  return self->_bundleURL;
}

- (id)localizedName
{
  return self->_localizedName;
}

- (CXInProcessProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end