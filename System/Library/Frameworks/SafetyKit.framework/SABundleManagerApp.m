@interface SABundleManagerApp
- (NSDate)authorizationDate;
- (NSString)bundleId;
- (NSString)name;
- (NSString)pairedBundleId;
- (SABundleManagerApp)initWithBundleId:(id)a3 deviceType:(int64_t)a4;
- (id)getLocalizedName;
- (int64_t)deviceType;
- (void)getLocalizedName;
- (void)getLocalizedNameForPairedDeviceWithCompletion:(id)a3;
- (void)setAuthorizationDate:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setPairedBundleId:(id)a3;
@end

@implementation SABundleManagerApp

- (SABundleManagerApp)initWithBundleId:(id)a3 deviceType:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SABundleManagerApp;
  v7 = [(SABundleManagerApp *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SABundleManagerApp *)v7 setBundleId:v6];
    [(SABundleManagerApp *)v8 setDeviceType:a4];
  }

  return v8;
}

- (id)getLocalizedName
{
  v3 = [(SABundleManagerApp *)self bundleId];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F086E0];
    v5 = [(SABundleManagerApp *)self bundleId];
    id v6 = [v4 bundleWithIdentifier:v5];

    if (!v6)
    {
      v7 = sa_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SABundleManagerApp getLocalizedName](v7);
      }
    }
    v3 = [v6 objectForInfoDictionaryKey:@"CFBundleName"];
  }

  return v3;
}

- (void)getLocalizedNameForPairedDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SABundleManagerApp *)self name];

  if (!v5)
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke;
    v16[3] = &unk_2651C93A0;
    objc_copyWeak(&v18, &location);
    id v17 = v4;
    v7 = (void (**)(void, void))MEMORY[0x245698E90](v16);
    v8 = [(SABundleManagerApp *)self bundleId];

    if (v8)
    {
      int64_t v9 = [(SABundleManagerApp *)self deviceType];
      if (!v9)
      {
        v11 = [(SABundleManagerApp *)self bundleId];
        v12 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2;
        v13[3] = &unk_2651C93C8;
        id v10 = v11;
        id v14 = v10;
        v15 = v7;
        [v12 fetchWatchAppBundleIDForCompanionAppBundleID:v10 completion:v13];

        goto LABEL_9;
      }
      if (v9 == 1)
      {
        id v10 = [(SABundleManagerApp *)self bundleId];
        +[SABundleManager getRemoteApplicationNameWithBundleId:v10 withCompletion:v7];
LABEL_9:
      }
    }
    else
    {
      v7[2](v7, 0);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  id v6 = [(SABundleManagerApp *)self name];
  (*((void (**)(id, void *))v4 + 2))(v4, v6);

LABEL_11:
}

void __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setName:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = sa_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2_cold_1(a1);
    }
  }
  if (v5) {
    +[SABundleManager getRemoteApplicationNameWithBundleId:v5 withCompletion:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)pairedBundleId
{
  return self->_pairedBundleId;
}

- (void)setPairedBundleId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDate)authorizationDate
{
  return self->_authorizationDate;
}

- (void)setAuthorizationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pairedBundleId, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)getLocalizedName
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_245182000, log, OS_LOG_TYPE_ERROR, "Unable to get Bundle for app with previous authorization: %@", (uint8_t *)&v1, 0xCu);
}

void __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_245182000, v1, v2, "Unable to get remote app bundleId for fromBundleId: %@, error: %@", (void)v3, DWORD2(v3));
}

@end