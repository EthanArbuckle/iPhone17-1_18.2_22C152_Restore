@interface MSServerMediator
- (MSAccountsImplementer)accountsInterfaceDelegate;
- (MSProxyConnectionDelegate)connectionDelegate;
- (MSServerMediator)initWithAccountsDelegate:(id)a3;
- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5;
- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6;
- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5;
- (void)getDefaultMediaServiceForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4;
- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)getSupportedThirdPartyMediaServices:(id)a3;
- (void)openConnection;
- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5;
- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6;
- (void)setAccountsInterfaceDelegate:(id)a3;
- (void)setConnectionDelegate:(id)a3;
- (void)setVersion:(unint64_t)a3 completion:(id)a4;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)thirdPartyMusicAvailable:(id)a3 completion:(id)a4;
- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7;
@end

@implementation MSServerMediator

- (MSServerMediator)initWithAccountsDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSServerMediator;
  v5 = [(MSServerMediator *)&v8 init];
  if (v5)
  {
    v6 = _MSLogingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MSServerMediator initWithAccountsDelegate:]";
      _os_log_impl(&dword_225D52000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_accountsInterfaceDelegate, v4);
  }

  return v5;
}

- (void)openConnection
{
  v3 = [(MSServerMediator *)self connectionDelegate];

  if (v3)
  {
    id v4 = [(MSServerMediator *)self connectionDelegate];
    [v4 openConnection];
  }
}

- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9 && v10)
  {
    uint64_t v11 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v11 getDefaultMediaService:v12 homeUserID:v8 completion:v9];
  }
}

- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v12 && v13)
  {
    v14 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v14 updateDefaultMediaService:v15 homeID:v10 homeUserID:v11 completion:v12];
  }
}

- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9 && v10)
  {
    id v11 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v11 getAvailableServices:v12 userIdentifier:v8 completion:v9];
  }
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (!v8)
  {
    id v10 = _MSLogingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MSServerMediator getMediaServiceChoicesForSharedUser:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mediasetup.errorDomain" code:1 userInfo:0];
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
  if (v7)
  {
    id v9 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v9 getMediaServiceChoicesForSharedUser:v6 completion:v7];
LABEL_7:
  }
}

- (void)getMediaServiceChoicesForAllUsers:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  v5 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (!v5)
  {
    v7 = _MSLogingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSServerMediator getMediaServiceChoicesForSharedUser:completion:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mediasetup.errorDomain" code:1 userInfo:0];
    v4[2](v4, 0, v6);
    goto LABEL_7;
  }
  if (v4)
  {
    id v6 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v6 getMediaServiceChoicesForAllUsers:v4];
LABEL_7:
  }
}

- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9 && v10)
  {
    uint64_t v11 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v11 getCachedAvailableServices:v12 userIdentifier:v8 completion:v9];
  }
}

- (void)thirdPartyMusicAvailable:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v6 && v7)
  {
    id v8 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v8 thirdPartyMusicAvailable:v9 completion:v6];
  }
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v12 && v13)
  {
    uint64_t v14 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v14 getCachedServiceInfo:v15 homeUserID:v10 endpointID:v11 completion:v12];
  }
}

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v12 && v13)
  {
    uint64_t v14 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v14 requestAuthRenewalForMediaService:v15 homeUserID:v10 parentNetworkActivity:v11 completion:v12];
  }
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9 && v10)
  {
    id v11 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v11 addMediaService:v12 usingSetupBundles:v8 completion:v9];
  }
}

- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v12 && v13)
  {
    uint64_t v14 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v14 removeMediaService:v15 homeID:v10 homeUserID:v11 completion:v12];
  }
}

- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v15 && v16)
  {
    uint64_t v17 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v17 updateProperty:v18 homeID:v12 homeUserID:v13 withOptions:v14 completion:v15];
  }
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9 && v10)
  {
    id v11 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v11 getServiceConfigurationInfo:v12 serviceID:v8 completion:v9];
  }
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9 && v10)
  {
    id v11 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v11 getResolvedServiceInfo:v12 sharedUserID:v8 completion:v9];
  }
}

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  id v6 = a3;
  id v4 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v6 && v4)
  {
    v5 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v5 getDefaultMediaServiceForAllUsers:v6];
  }
}

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v6 && v7)
  {
    id v8 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v8 getPublicInfoForBundleID:v9 completion:v6];
  }
}

- (void)setVersion:(unint64_t)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v8 && v6)
  {
    v7 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v7 setVersion:a3 completion:v8];
  }
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  id v9 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v9)
  {
    id v10 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v10 overrideAppleMusicSubscriptionStatus:v6 homeUserIDS:v11 completion:v8];
  }
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v6 && v7)
  {
    id v8 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v8 getResolvedServiceInfo:v9 completion:v6];
  }
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v6 && v7)
  {
    id v8 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v8 activeServiceApplicationInformationForSharedUserID:v9 completionHandler:v6];
  }
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (v12 && v13)
  {
    id v14 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v14 switchUserAccountInfo:v15 homeID:v10 homeUserID:v11 completion:v12];
  }
}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  v5 = [(MSServerMediator *)self accountsInterfaceDelegate];

  if (!v5)
  {
    v7 = _MSLogingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MSServerMediator getMediaServiceChoicesForSharedUser:completion:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mediasetup.errorDomain" code:1 userInfo:0];
    v4[2](v4, 0, v6);
    goto LABEL_7;
  }
  if (v4)
  {
    id v6 = [(MSServerMediator *)self accountsInterfaceDelegate];
    [v6 getSupportedThirdPartyMediaServices:v4];
LABEL_7:
  }
}

- (MSAccountsImplementer)accountsInterfaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountsInterfaceDelegate);

  return (MSAccountsImplementer *)WeakRetained;
}

- (void)setAccountsInterfaceDelegate:(id)a3
{
}

- (MSProxyConnectionDelegate)connectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionDelegate);

  return (MSProxyConnectionDelegate *)WeakRetained;
}

- (void)setConnectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);

  objc_destroyWeak((id *)&self->_accountsInterfaceDelegate);
}

- (void)getMediaServiceChoicesForSharedUser:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end