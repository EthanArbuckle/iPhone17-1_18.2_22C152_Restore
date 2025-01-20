@interface DSAlternateDeviceAccessDelegate
- (BOOL)isNetworkReachable;
- (DSAlternateDeviceAccessDelegate)initWithPresentingViewController:(id)a3;
- (LAContext)authContext;
- (NSArray)navigationOrder;
- (UINavigationController)navigationController;
- (id)deepLinkForCurrentFlowAndPane;
- (void)deepLinkForCurrentFlowAndPane;
- (void)displayNetworkError;
- (void)exitFlowForRatchetWait;
- (void)finishFlow;
- (void)goToCustomizeSharing;
- (void)isNetworkReachable;
- (void)learnMorePressedForController:(id)a3 withURL:(id)a4;
- (void)pushNextPane;
- (void)pushPaneAfterPaneType:(Class)a3;
- (void)pushPaneType:(Class)a3;
- (void)quickExit;
- (void)sendSummaryAnalyticsWithEventName:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNavigationOrder:(id)a3;
- (void)setUpNavigation;
- (void)startFlowWithType:(int64_t)a3;
- (void)tearDown;
@end

@implementation DSAlternateDeviceAccessDelegate

- (DSAlternateDeviceAccessDelegate)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSAlternateDeviceAccessDelegate;
  v5 = [(DSAlternateDeviceAccessDelegate *)&v9 init];
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.DigitalSeparation", "DSAlternateDeviceAccessDelegate");
    v7 = (void *)DSLog_14;
    DSLog_14 = (uint64_t)v6;

    [(DSAlternateDeviceAccessDelegate *)v5 setNavigationController:v4];
    [(DSAlternateDeviceAccessDelegate *)v5 setUpNavigation];
  }

  return v5;
}

- (void)setUpNavigation
{
  v3 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
  id v4 = [v3 navigationItem];
  [v4 setHidesBackButton:1];

  v5 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
  os_log_t v6 = [v5 navigationBar];
  [v6 setHidden:1];

  v8 = objc_alloc_init(DSNavigationManager);
  v7 = [(DSNavigationManager *)v8 navigationOrderForFlowType:2];
  [(DSAlternateDeviceAccessDelegate *)self setNavigationOrder:v7];
}

- (void)tearDown
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
  id v4 = [v3 visibleViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DSAlternateDeviceAccessDelegate *)self finishFlow];
  }
  else
  {
    v5 = DSLog_14;
    if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_INFO))
    {
      os_log_t v6 = @"nothing";
      if (v4) {
        os_log_t v6 = v4;
      }
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_235BFC000, v5, OS_LOG_TYPE_INFO, "Navigation controller is showing %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)pushPaneAfterPaneType:(Class)a3
{
  v5 = [(DSAlternateDeviceAccessDelegate *)self navigationOrder];
  uint64_t v6 = [v5 indexOfObject:a3];
  unint64_t v7 = v6 + 1;
  BOOL v8 = v6 == -1;

  if (v8) {
    goto LABEL_12;
  }
  uint64_t v9 = [(DSAlternateDeviceAccessDelegate *)self navigationOrder];
  unint64_t v10 = [v9 count];

  if (v7 >= v10
    || ([(DSAlternateDeviceAccessDelegate *)self navigationOrder],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 objectAtIndex:v7],
        v11,
        !v12))
  {
LABEL_12:
    if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
      -[DSAlternateDeviceAccessDelegate pushPaneAfterPaneType:]();
    }
    [(DSAlternateDeviceAccessDelegate *)self finishFlow];
  }
  else
  {
    [(DSAlternateDeviceAccessDelegate *)self pushPaneType:v12];
  }
}

- (void)startFlowWithType:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    id v4 = [(DSAlternateDeviceAccessDelegate *)self navigationOrder];
    uint64_t v5 = [v4 firstObject];

    if (v5)
    {
      [(DSAlternateDeviceAccessDelegate *)self pushPaneType:v5];
      id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      unint64_t v7 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
      BOOL v8 = [v7 viewControllers];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v13 conformsToProtocol:&unk_26E932160]) {
              [v6 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      v14 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
      [v14 setViewControllers:v6];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
        -[DSAlternateDeviceAccessDelegate startFlowWithType:]();
      }
      [(DSAlternateDeviceAccessDelegate *)self finishFlow];
    }
  }
  else
  {
    v16 = DSLog_14;
    if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
      -[DSAlternateDeviceAccessDelegate startFlowWithType:](a3, v16);
    }
  }
}

- (void)pushPaneType:(Class)a3
{
  id v5 = objc_alloc_init(a3);
  [v5 setDelegate:self];
  id v4 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)goToCustomizeSharing
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/SAFETY_CHECK/DEVICE_ACCESS/"];
  [v3 openSensitiveURL:v2 withOptions:MEMORY[0x263EFFA78]];
}

- (void)finishFlow
{
  id v3 = [(DSAlternateDeviceAccessDelegate *)self navigationController];
  v2 = [v3 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)deepLinkForCurrentFlowAndPane
{
  if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
    -[DSAlternateDeviceAccessDelegate deepLinkForCurrentFlowAndPane]();
  }
  return &stru_26E9097D0;
}

- (BOOL)isNetworkReachable
{
  if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
    -[DSAlternateDeviceAccessDelegate isNetworkReachable]();
  }
  return 1;
}

- (void)displayNetworkError
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented displayNetworkError", v2, v3, v4, v5, v6);
}

- (void)exitFlowForRatchetWait
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented exitFlowForRatchetWait", v2, v3, v4, v5, v6);
}

- (void)learnMorePressedForController:(id)a3 withURL:(id)a4
{
  if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
    -[DSAlternateDeviceAccessDelegate learnMorePressedForController:withURL:]();
  }
}

- (void)pushNextPane
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented pushNextPane", v2, v3, v4, v5, v6);
}

- (void)quickExit
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented quickExit", v2, v3, v4, v5, v6);
}

- (void)sendSummaryAnalyticsWithEventName:(id)a3
{
  if (os_log_type_enabled((os_log_t)DSLog_14, OS_LOG_TYPE_ERROR)) {
    -[DSAlternateDeviceAccessDelegate sendSummaryAnalyticsWithEventName:]();
  }
}

- (LAContext)authContext
{
  return self->authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (NSArray)navigationOrder
{
  return self->_navigationOrder;
}

- (void)setNavigationOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationOrder, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->authContext, 0);
}

- (void)pushPaneAfterPaneType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "Failed to find the next pane type, bailing on presentation", v2, v3, v4, v5, v6);
}

- (void)startFlowWithType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "Can't parse starting class from navigation order, this should never happen!", v2, v3, v4, v5, v6);
}

- (void)startFlowWithType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235BFC000, a2, OS_LOG_TYPE_ERROR, "DSAlternateDeviceAccessDelegate can't handle %ld", (uint8_t *)&v2, 0xCu);
}

- (void)deepLinkForCurrentFlowAndPane
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented deepLinkForCurrentFlowAndPane", v2, v3, v4, v5, v6);
}

- (void)isNetworkReachable
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented isNetworkReachable", v2, v3, v4, v5, v6);
}

- (void)learnMorePressedForController:withURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented learnMorePressedForController:", v2, v3, v4, v5, v6);
}

- (void)sendSummaryAnalyticsWithEventName:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235BFC000, v0, v1, "DSAlternateDeviceAccessDelegate has not implemented sendSummaryAnalyticsWithEventName", v2, v3, v4, v5, v6);
}

@end