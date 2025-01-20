@interface LSSharedWebCredentialsAppLinkPlugIn
@end

@implementation LSSharedWebCredentialsAppLinkPlugIn

uint64_t __101___LSSharedWebCredentialsAppLinkPlugIn_bindingWithContext_forServiceDetails_callingBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (((*(unsigned __int16 *)(*(void *)(a3 + 8) + 189) | (*(unsigned __int8 *)(*(void *)(a3 + 8) + 191) << 16)) & 0x100001) != 0) {
    return 0;
  }
  v7 = (void *)_CSStringCopyCFString();
  v8 = v7;
  if (v7 && ([v7 isEqual:*(void *)(a1 + 32)] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v9 = +[_LSLazyPropertyList lazyPropertyListWithContext:a2 unit:*(unsigned int *)(*(void *)(a3 + 8) + 140)];
    v10 = [v9 _applicationIdentifier];
    uint64_t v3 = [v10 isEqual:*(void *)(a1 + 40)];
  }
  return v3;
}

void __74___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_forSWCResults___block_invoke(uint64_t a1, unsigned int *a2, void *a3)
{
  id v5 = a3;
  id v6 = [[LSApplicationRecord alloc] _initWithContext:*(void *)(a1 + 56) bundleID:*a2 bundleData:*((void *)a2 + 1) error:0];
  id v11 = v6;
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) URLComponents];
    v8 = [v7 URL];
    uint64_t v9 = +[LSAppLink _appLinkWithURL:v8 applicationRecord:v6 plugInClass:objc_opt_class()];

    if (v9)
    {
      long long v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)(v9 + 32) = *(_OWORD *)a2;
      *(_OWORD *)(v9 + 48) = v10;
      objc_storeStrong((id *)(v9 + 64), *((id *)a2 + 4));
      objc_storeStrong((id *)(v9 + 72), *((id *)a2 + 5));
      [(id)v9 setServiceDetails:v5];
      [*(id *)(a1 + 40) addObject:v9];
      std::vector<LSApplicationRecord * {__strong}>::emplace_back<LSApplicationRecord * {__strong}&>((char **)(*(void *)(*(void *)(a1 + 48) + 8) + 48), &v11);
    }
  }
}

void __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *(void ***)(a1 + 56);
  id v10 = 0;
  char v11 = 0;
  id v12 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v9, v2, 0);

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) appLinksWithContext:v3 forSWCResults:*(void *)(a1 + 40)];
    id v5 = (void *)v4;
    if (v4) {
      id v6 = (void *)v4;
    }
    else {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
  }
  if (v9 && v11) {
    _LSContextDestroy(v9);
  }
  id v7 = v10;
  uint64_t v9 = 0;
  id v10 = 0;

  char v11 = 0;
  id v8 = v12;
  id v12 = 0;
}

uint64_t __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end