@interface AXSpringBoardServerAlertManager
- (BOOL)isShowingAXUIViewService:(id)a3;
- (NSMutableDictionary)handlesByService;
- (void)hideAXUIViewService:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)scheduleShowAXUIViewService:(id)a3 withData:(id)a4;
- (void)setHandlesByService:(id)a3;
- (void)showAXUIViewService:(id)a3 withData:(id)a4;
- (void)showAXUIViewService:(id)a3 withData:(id)a4 withPreviousViewDismissal:(BOOL)a5;
@end

@implementation AXSpringBoardServerAlertManager

- (void)showAXUIViewService:(id)a3 withData:(id)a4 withPreviousViewDismissal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v5
    && ([(AXSpringBoardServerAlertManager *)self handlesByService],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = [(AXSpringBoardServerAlertManager *)self handlesByService];
    v12 = [v11 allKeys];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
          v18 = [(AXSpringBoardServerAlertManager *)self handlesByService];
          v19 = [v18 objectForKeyedSubscript:v17];

          [v19 invalidate];
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [(AXSpringBoardServerAlertManager *)self scheduleShowAXUIViewService:v8 withData:v9];
  }
  else
  {
    [(AXSpringBoardServerAlertManager *)self showAXUIViewService:v8 withData:v9];
  }
}

- (void)scheduleShowAXUIViewService:(id)a3 withData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 250000000);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__AXSpringBoardServerAlertManager_scheduleShowAXUIViewService_withData___block_invoke;
  v11[3] = &unk_2647F1200;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_after(v8, MEMORY[0x263EF83A0], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __72__AXSpringBoardServerAlertManager_scheduleShowAXUIViewService_withData___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "handlesByService", 0);
  BOOL v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = objc_loadWeakRetained(v2);
        id v12 = [v11 handlesByService];
        id v13 = [v12 objectForKeyedSubscript:v10];

        if (![v13 isValid])
        {
          id v14 = objc_loadWeakRetained(v2);
          [v14 showAXUIViewService:*(void *)(a1 + 32) withData:*(void *)(a1 + 40)];

          goto LABEL_11;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v5 = objc_loadWeakRetained(v2);
  [v5 scheduleShowAXUIViewService:*(void *)(a1 + 32) withData:*(void *)(a1 + 40)];
LABEL_11:
}

- (void)showAXUIViewService:(id)a3 withData:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "sb_alertDefinition");
  id v9 = objc_alloc_init(MEMORY[0x263F79408]);
  [v9 setUserInfo:v6];
  uint64_t v10 = AXLogUIViewService();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v8 serviceName];
    id v12 = [v8 viewControllerClassName];
    int v19 = 138412546;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    long long v22 = v12;
    _os_log_impl(&dword_226EBC000, v10, OS_LOG_TYPE_INFO, "Activating remote alert service: %@, class: %@", (uint8_t *)&v19, 0x16u);
  }
  id v13 = AXLogUIViewService();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AXSpringBoardServerAlertManager showAXUIViewService:withData:]((uint64_t)v6, v13);
  }

  id v14 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v8 configurationContext:v9];
  [v14 registerObserver:self];
  [v14 activateWithContext:0];
  long long v15 = [(AXSpringBoardServerAlertManager *)self handlesByService];

  if (!v15)
  {
    long long v16 = [MEMORY[0x263EFF9A0] dictionary];
    [(AXSpringBoardServerAlertManager *)self setHandlesByService:v16];
  }
  long long v17 = [(AXSpringBoardServerAlertManager *)self handlesByService];
  long long v18 = [MEMORY[0x263F08D40] valueWithPointer:v7];

  [v17 setObject:v14 forKeyedSubscript:v18];
}

- (void)hideAXUIViewService:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = AXLogUIViewService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_226EBC000, v5, OS_LOG_TYPE_INFO, "Hiding remote alert service: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(AXSpringBoardServerAlertManager *)self handlesByService];
  id v7 = [MEMORY[0x263F08D40] valueWithPointer:v4];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  [v8 invalidate];
}

- (BOOL)isShowingAXUIViewService:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXSpringBoardServerAlertManager *)self handlesByService];
  id v6 = [MEMORY[0x263F08D40] valueWithPointer:v4];

  id v7 = [v5 objectForKeyedSubscript:v6];
  char v8 = [v7 isActive];

  return v8;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = AXLogUIViewService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_INFO, "Remote alert handle did activate: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = AXLogUIViewService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_INFO, "Remote alert handle did deactivate: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = AXLogUIViewService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_226EBC000, v7, OS_LOG_TYPE_INFO, "Remote alert handle did invalidate: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v6)
  {
    char v8 = AXLogUIViewService();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AXSpringBoardServerAlertManager remoteAlertHandle:didInvalidateWithError:]((uint64_t)v6, v8);
    }
  }
}

- (NSMutableDictionary)handlesByService
{
  return self->_handlesByService;
}

- (void)setHandlesByService:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)showAXUIViewService:(uint64_t)a1 withData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226EBC000, a2, OS_LOG_TYPE_DEBUG, "withData: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteAlertHandle:(uint64_t)a1 didInvalidateWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226EBC000, a2, OS_LOG_TYPE_ERROR, "Remote alert handle did invalidate with error: %@", (uint8_t *)&v2, 0xCu);
}

@end