@interface DBUserAlertServer
- (DBAppAlertPresenting)appPresenter;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBSystemAlertPresenting)systemPresenter;
- (DBUserAlertServer)initWithSafeAreaInsets:(UIEdgeInsets)a3 environmentConfiguration:(id)a4;
- (NSMutableArray)pendingSystemAlerts;
- (NSMutableDictionary)pendingAlertsForAppBundleID;
- (UIEdgeInsets)safeAreaInsets;
- (URTAlertService)service;
- (id)alertForBundleID:(id)a3;
- (void)_dismissAlert:(id)a3;
- (void)_dismissAlert:(id)a3 overApplication:(id)a4;
- (void)_dismissAppAlert:(id)a3;
- (void)_dismissSystemAlert:(id)a3;
- (void)_presentAlert:(id)a3 overApplication:(id)a4;
- (void)_presentSystemAlert:(id)a3;
- (void)alertService:(id)a3 wantsDismissalForAlert:(id)a4;
- (void)alertService:(id)a3 wantsPresentationForAlert:(id)a4 preferredPresentationStyle:(int64_t)a5;
- (void)invalidate;
- (void)setAppPresenter:(id)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setSystemPresenter:(id)a3;
- (void)updateAlertSceneFramesWithSafeAreaInsets:(UIEdgeInsets)a3;
@end

@implementation DBUserAlertServer

- (DBUserAlertServer)initWithSafeAreaInsets:(UIEdgeInsets)a3 environmentConfiguration:(id)a4
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DBUserAlertServer;
  v11 = [(DBUserAlertServer *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_safeAreaInsets.CGFloat top = top;
    v11->_safeAreaInsets.CGFloat left = left;
    v11->_safeAreaInsets.CGFloat bottom = bottom;
    v11->_safeAreaInsets.CGFloat right = right;
    objc_storeStrong((id *)&v11->_environmentConfiguration, a4);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingSystemAlerts = v12->_pendingSystemAlerts;
    v12->_pendingSystemAlerts = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingAlertsForAppBundleID = v12->_pendingAlertsForAppBundleID;
    v12->_pendingAlertsForAppBundleID = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F84198]) initWithDomain:@"com.apple.CarPlay.UserAlerts"];
    service = v12->_service;
    v12->_service = (URTAlertService *)v17;

    [(URTAlertService *)v12->_service setDelegate:v12];
  }

  return v12;
}

- (void)invalidate
{
  [(DBUserAlertServer *)self setSystemPresenter:0];
  [(DBUserAlertServer *)self setAppPresenter:0];
  v3 = [(DBUserAlertServer *)self pendingSystemAlerts];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_4];

  v4 = [(DBUserAlertServer *)self pendingSystemAlerts];
  [v4 removeAllObjects];

  v5 = [(DBUserAlertServer *)self pendingAlertsForAppBundleID];
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_90];

  v6 = [(DBUserAlertServer *)self pendingAlertsForAppBundleID];
  [v6 removeAllObjects];

  id v7 = [(DBUserAlertServer *)self service];
  [v7 invalidate];
}

uint64_t __31__DBUserAlertServer_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

uint64_t __31__DBUserAlertServer_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateObjectsUsingBlock:&__block_literal_global_92];
}

uint64_t __31__DBUserAlertServer_invalidate__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (id)alertForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(DBUserAlertServer *)self pendingAlertsForAppBundleID];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)updateAlertSceneFramesWithSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  -[DBUserAlertServer setSafeAreaInsets:](self, "setSafeAreaInsets:");
  v8 = [(DBUserAlertServer *)self environmentConfiguration];
  [v8 currentSafeViewAreaFrame];
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  uint64_t v13 = *MEMORY[0x263F00148];
  uint64_t v14 = *(void *)(MEMORY[0x263F00148] + 8);
  v15 = [(DBUserAlertServer *)self pendingAlertsForAppBundleID];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__DBUserAlertServer_updateAlertSceneFramesWithSafeAreaInsets___block_invoke;
  v16[3] = &__block_descriptor_96_e41_v32__0__NSString_8__NSMutableArray_16_B24l;
  v16[4] = v13;
  v16[5] = v14;
  v16[6] = v10;
  v16[7] = v12;
  *(CGFloat *)&v16[8] = top;
  *(CGFloat *)&v16[9] = left;
  *(CGFloat *)&v16[10] = bottom;
  *(CGFloat *)&v16[11] = right;
  [v15 enumerateKeysAndObjectsUsingBlock:v16];
}

uint64_t __62__DBUserAlertServer_updateAlertSceneFramesWithSafeAreaInsets___block_invoke(_OWORD *a1, uint64_t a2, void *a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__DBUserAlertServer_updateAlertSceneFramesWithSafeAreaInsets___block_invoke_2;
  v6[3] = &__block_descriptor_96_e28_v32__0__DBUserAlert_8Q16_B24l;
  long long v3 = a1[3];
  long long v7 = a1[2];
  long long v8 = v3;
  long long v4 = a1[5];
  long long v9 = a1[4];
  long long v10 = v4;
  return [a3 enumerateObjectsUsingBlock:v6];
}

uint64_t __62__DBUserAlertServer_updateAlertSceneFramesWithSafeAreaInsets___block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "setSceneFrame:safeAreaInsets:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

- (void)alertService:(id)a3 wantsPresentationForAlert:(id)a4 preferredPresentationStyle:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "alertService:wantsPresentationForAlert: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__DBUserAlertServer_alertService_wantsPresentationForAlert_preferredPresentationStyle___block_invoke;
  block[3] = &unk_2649B4138;
  uint64_t v12 = self;
  int64_t v13 = a5;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__DBUserAlertServer_alertService_wantsPresentationForAlert_preferredPresentationStyle___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [DBUserAlert alloc];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) safeAreaInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  int64_t v13 = [*(id *)(a1 + 40) environmentConfiguration];
  uint64_t v14 = -[DBUserAlert initWithAlert:preferredPresentationStyle:safeAreaInsets:environmentConfiguration:](v2, "initWithAlert:preferredPresentationStyle:safeAreaInsets:environmentConfiguration:", v4, v3, v13, v6, v8, v10, v12);

  id v15 = [*(id *)(a1 + 32) allowedApplicationBundleIDs];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "allowedApplicationBundleIDs", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * v21);
          v23 = [*(id *)(a1 + 40) pendingAlertsForAppBundleID];
          id v24 = [v23 objectForKeyedSubscript:v22];

          if (!v24)
          {
            id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
            v25 = [*(id *)(a1 + 40) pendingAlertsForAppBundleID];
            [v25 setObject:v24 forKeyedSubscript:v22];
          }
          [v24 addObject:v14];
          if ([v24 count] == 1) {
            [*(id *)(a1 + 40) _presentAlert:v14 overApplication:v22];
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }
  }
  else
  {
    v26 = [*(id *)(a1 + 40) pendingSystemAlerts];
    [v26 addObject:v14];

    v27 = [*(id *)(a1 + 40) pendingSystemAlerts];
    uint64_t v28 = [v27 count];

    if (v28 == 1) {
      [*(id *)(a1 + 40) _presentSystemAlert:v14];
    }
  }
}

- (void)alertService:(id)a3 wantsDismissalForAlert:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = DBLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "alertService:wantsDismissalForAlert: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__DBUserAlertServer_alertService_wantsDismissalForAlert___block_invoke;
  v8[3] = &unk_2649B3D30;
  id v9 = v5;
  double v10 = self;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __57__DBUserAlertServer_alertService_wantsDismissalForAlert___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allowedApplicationBundleIDs];
  uint64_t v3 = [v2 count];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v3)
  {
    return [v4 _dismissAppAlert:v5];
  }
  else
  {
    return [v4 _dismissAlert:v5];
  }
}

- (void)_dismissAppAlert:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v4 allowedApplicationBundleIDs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    double v8 = 0;
    uint64_t v25 = *(void *)v29;
    *(void *)&long long v6 = 138412290;
    long long v22 = v6;
    id v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        double v11 = [(DBUserAlertServer *)self pendingAlertsForAppBundleID];
        id v12 = [v11 objectForKeyedSubscript:v10];

        if (v12)
        {
          uint64_t v13 = [v12 firstObject];
          uint64_t v14 = [v13 alert];
          int v15 = [v14 isEqual:v4];

          if (v15)
          {
            [v12 removeObject:v13];
            [(DBUserAlertServer *)self _dismissAlert:v13 overApplication:v10];
            uint64_t v16 = v13;

            uint64_t v17 = [v12 firstObject];
            if (v17)
            {
              [(DBUserAlertServer *)self _presentAlert:v17 overApplication:v10];
            }
            else
            {
              uint64_t v21 = [(DBUserAlertServer *)self pendingAlertsForAppBundleID];
              [v21 removeObjectForKey:v10];
            }
          }
          else
          {
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __38__DBUserAlertServer__dismissAppAlert___block_invoke;
            v26[3] = &unk_2649B4640;
            id v27 = v4;
            uint64_t v18 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v26);
            if (v18)
            {
              uint64_t v19 = DBLogForCategory(0);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v22;
                id v33 = v4;
                _os_log_impl(&dword_22D6F0000, v19, OS_LOG_TYPE_DEFAULT, "Removing pending alert from the queue: %@", buf, 0xCu);
              }

              [v12 removeObject:v18];
              uint64_t v20 = v18;

              double v8 = v20;
            }

            uint64_t v17 = v27;
            uint64_t v16 = v8;
          }

          double v8 = v16;
          id v4 = v24;
        }
        else
        {
          uint64_t v13 = DBLogForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            id v33 = v4;
            _os_log_error_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_ERROR, "Received dismissal request for unknown alert: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0;
  }

  [v8 invalidate];
}

uint64_t __38__DBUserAlertServer__dismissAppAlert___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 alert];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_dismissAlert:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DBUserAlertServer *)self pendingSystemAlerts];
  long long v6 = [v5 firstObject];

  uint64_t v7 = [v6 alert];
  int v8 = [v7 isEqual:v4];

  id v9 = [(DBUserAlertServer *)self pendingSystemAlerts];
  uint64_t v10 = v9;
  if (v8)
  {
    [v9 removeObject:v6];

    [(DBUserAlertServer *)self _dismissSystemAlert:v6];
    id v11 = v6;
    id v12 = [(DBUserAlertServer *)self pendingSystemAlerts];
    uint64_t v13 = [v12 firstObject];

    if (v13) {
      [(DBUserAlertServer *)self _presentSystemAlert:v13];
    }
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__DBUserAlertServer__dismissAlert___block_invoke;
    v18[3] = &unk_2649B4640;
    id v14 = v4;
    id v19 = v14;
    objc_msgSend(v10, "bs_firstObjectPassingTest:", v18);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      int v15 = DBLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v14;
        _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, "Removing pending alert from the queue: %@", buf, 0xCu);
      }

      uint64_t v16 = [(DBUserAlertServer *)self pendingSystemAlerts];
      [v16 removeObject:v11];

      id v17 = v11;
    }
  }
  [v11 invalidate];
}

uint64_t __35__DBUserAlertServer__dismissAlert___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 alert];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_presentSystemAlert:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v6 = [v4 alert];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "presenting system alert: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(DBUserAlertServer *)self systemPresenter];
  if (objc_opt_respondsToSelector()) {
    [v7 alertServer:self wantsSystemPresentationForAlert:v4];
  }
}

- (void)_dismissSystemAlert:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = DBLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    long long v6 = [v4 alert];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "dismissing system alert: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(DBUserAlertServer *)self systemPresenter];
  if (objc_opt_respondsToSelector()) {
    [v7 alertServer:self wantsSystemDismissalForAlert:v4];
  }
}

- (void)_presentAlert:(id)a3 overApplication:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 alert];
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "presenting alert: %@ over: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(DBUserAlertServer *)self appPresenter];
  if (objc_opt_respondsToSelector()) {
    [v10 alertServer:self wantsAppPresentationForAlert:v6 bundleID:v7];
  }
}

- (void)_dismissAlert:(id)a3 overApplication:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = DBLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 alert];
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "dismissing alert: %@ over: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(DBUserAlertServer *)self appPresenter];
  if (objc_opt_respondsToSelector()) {
    [v10 alertServer:self wantsAppDismissalForAlert:v6 bundleID:v7];
  }
}

- (DBSystemAlertPresenting)systemPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPresenter);
  return (DBSystemAlertPresenting *)WeakRetained;
}

- (void)setSystemPresenter:(id)a3
{
}

- (DBAppAlertPresenting)appPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPresenter);
  return (DBAppAlertPresenting *)WeakRetained;
}

- (void)setAppPresenter:(id)a3
{
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (URTAlertService)service
{
  return self->_service;
}

- (NSMutableArray)pendingSystemAlerts
{
  return self->_pendingSystemAlerts;
}

- (NSMutableDictionary)pendingAlertsForAppBundleID
{
  return self->_pendingAlertsForAppBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAlertsForAppBundleID, 0);
  objc_storeStrong((id *)&self->_pendingSystemAlerts, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_destroyWeak((id *)&self->_appPresenter);
  objc_destroyWeak((id *)&self->_systemPresenter);
}

@end