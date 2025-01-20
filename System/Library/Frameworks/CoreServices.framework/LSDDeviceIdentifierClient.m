@interface LSDDeviceIdentifierClient
@end

@implementation LSDDeviceIdentifierClient

void __68___LSDDeviceIdentifierClient_getIdentifierOfType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v17 = a2;
  id v7 = a3;
  if (a4) {
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 == 1)
  {
    if ([*(id *)(a1 + 32) canAccessAdvertisingIdentifier])
    {
      uint64_t v8 = *(void *)(a1 + 48);
      goto LABEL_5;
    }
LABEL_11:
    uint64_t v16 = *(void *)(a1 + 40);
    v12 = objc_msgSend(MEMORY[0x1E4F29128], "_LS_nullUUID");
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v12);
    goto LABEL_12;
  }
LABEL_5:
  if (v8 == 2
    && ([*(id *)(a1 + 32) XPCConnection],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 _xpcConnection],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = _LSCheckEntitlementForXPCConnection(v10, @"com.apple.lsapplicationproxy.deviceidentifierforvendor"),
        v10,
        v9,
        !v11)
    || !v17
    || !v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  v12 = +[_LSDeviceIdentifierManager sharedInstance];
  v13 = [(id)getUMUserManagerClass() sharedManager];
  v14 = [v13 currentPersona];
  v15 = [v12 cacheForPersona:v14];
  [v15 getIdentifierOfType:*(void *)(a1 + 48) vendorName:v17 bundleIdentifier:v7 completionHandler:*(void *)(a1 + 40)];

LABEL_12:
LABEL_13:
}

void __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v36 = a3;
  v5 = [*(id *)(a1 + 32) XPCConnection];
  v6 = [v5 _xpcConnection];
  uint64_t v7 = _LSCopyBundleURLForXPCConnection(v6, 0);

  v37 = (void *)v7;
  if (!v7)
  {
    v12 = 0;
    v13 = 0;
LABEL_25:
    v21 = [*(id *)(a1 + 32) XPCConnection];
    v22 = [v21 _xpcConnection];
    CFURLRef v23 = _LSCopyExecutableURLForXPCConnection(v22);

    if (v23)
    {
      v24 = [(__CFURL *)v23 lastPathComponent];
      if (v24)
      {
        uint64_t v25 = [NSString stringWithFormat:@"Path:%@", v24, v35];

        v12 = (void *)v25;
      }
      uint64_t v26 = [(__CFURL *)v23 path];

      v13 = (void *)v26;
    }
    else
    {
      v24 = _LSDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_182959000, v24, OS_LOG_TYPE_DEFAULT, "Not enough info to create vendorName and bundleIdentifier", v44, 2u);
      }
    }

    goto LABEL_32;
  }
  id v47 = 0;
  *(void *)v44 = 0;
  id v45 = 0;
  char v46 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)v44, v8, 0);

  if (!v9)
  {
    v15 = _LSDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)v44, v16, 0);

      if (v17) {
        id v18 = 0;
      }
      else {
        id v18 = v47;
      }
      *(_DWORD *)buf = 138543362;
      id v49 = v18;
      _os_log_impl(&dword_182959000, v15, OS_LOG_TYPE_DEFAULT, "Failed to reach database with error %{public}@", buf, 0xCu);
    }
    LOBYTE(v7) = 0;
    v13 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = [*(id *)(a1 + 32) findAppBundleForExecutableURL:v7 withContext:v9];
  if (v10)
  {
    uint64_t v11 = _LSBundleGet(*v9, v10);
    if (v11)
    {
      v12 = +[_LSDDeviceIdentifierService vendorNameForDeviceIdentifiersWithContext:v9 bundleUnit:v10 bundleData:v11];
      v13 = (void *)_CSStringCopyCFString();
      v14 = [*(id *)(a1 + 32) XPCConnection];
      v15 = v14;
      if (v14) {
        [v14 auditToken];
      }
      else {
        memset(&v43, 0, sizeof(v43));
      }
      if ((*(unsigned char *)(v11 + 179) & 0x18) != 0) {
        LOBYTE(v7) = softLinkba_is_process_extension(&v43) ^ 1;
      }
      else {
        LOBYTE(v7) = 0;
      }
LABEL_19:

      goto LABEL_20;
    }
  }
  LOBYTE(v7) = 0;
  v13 = 0;
  v12 = 0;
LABEL_20:
  if (*(void *)v44 && v46) {
    _LSContextDestroy(*(void ***)v44);
  }
  id v19 = v45;
  *(void *)v44 = 0;
  id v45 = 0;

  char v46 = 0;
  id v20 = v47;
  id v47 = 0;

  if (!v12 || !v13) {
    goto LABEL_25;
  }
LABEL_32:
  v27 = +[_LSDeviceIdentifierManager sharedInstance];
  v28 = [(id)getUMUserManagerClass() sharedManager];
  v29 = [v28 currentPersona];
  v30 = [v27 cacheForPersona:v29];
  v31 = [v30 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke_56;
  block[3] = &unk_1E522E768;
  id v32 = *(id *)(a1 + 40);
  id v40 = v13;
  id v41 = v32;
  id v39 = v12;
  char v42 = v7;
  id v33 = v13;
  id v34 = v12;
  dispatch_async(v31, block);
}

uint64_t __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

void __90___LSDDeviceIdentifierClient_urlContainsDeviceIdentifierForAdvertising_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [a2 UUIDString];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "containsString:"));
}

@end