@interface JTViewController
- (BOOL)debuggingUIEnabled;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (JTView)view;
- (NSMutableArray)suspendInteractionTags;
- (NSMutableDictionary)suspendedChildViewControllerRequests;
- (UIViewController)viewControllerDrivingStatusAppearance;
- (void)logSuspendedChildViewControllersToString:(id)a3 indentLevel:(int)a4;
- (void)logSuspendedViewControllers;
- (void)resumeInteractionForChildViewControllersWithTag:(id)a3;
- (void)resumeInteractionWithTag:(id)a3;
- (void)setChildViewControllerInteractionEnabledWithRequest:(id)a3 enabled:(BOOL)a4;
- (void)setDebuggingUIEnabled:(BOOL)a3;
- (void)setSuspendInteractionTags:(id)a3;
- (void)setSuspendedChildViewControllerRequests:(id)a3;
- (void)setView:(id)a3;
- (void)setViewControllerDrivingStatusAppearance:(id)a3;
- (void)suspendChildViewControllersInteractionWithTag:(id)a3 timeout:(double)a4 excluding:(id)a5;
- (void)suspendInteractionWithTag:(id)a3;
- (void)timeoutInteractionSuspended:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation JTViewController

- (NSMutableDictionary)suspendedChildViewControllerRequests
{
  suspendedChildViewControllerRequests = self->_suspendedChildViewControllerRequests;
  if (!suspendedChildViewControllerRequests)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = self->_suspendedChildViewControllerRequests;
    self->_suspendedChildViewControllerRequests = v4;

    suspendedChildViewControllerRequests = self->_suspendedChildViewControllerRequests;
  }
  return suspendedChildViewControllerRequests;
}

- (NSMutableArray)suspendInteractionTags
{
  suspendInteractionTags = self->_suspendInteractionTags;
  if (!suspendInteractionTags)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = self->_suspendInteractionTags;
    self->_suspendInteractionTags = v4;

    suspendInteractionTags = self->_suspendInteractionTags;
  }
  return suspendInteractionTags;
}

- (void)logSuspendedViewControllers
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "\n%@", v2, v3, v4, v5, v6);
}

- (void)logSuspendedChildViewControllersToString:(id)a3 indentLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(JTViewController *)self suspendInteractionTags];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [(JTViewController *)self suspendInteractionTags];
    [v6 appendFormat:@"%*s%@ suspend count %lu\n", v4, " ", v10, objc_msgSend(v11, "count")];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v12 = [(JTViewController *)self suspendInteractionTags];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          [v6 appendFormat:@"%*s suspended with tag \"%@\"\n", v4, " ", *(void *)(*((void *)&v28 + 1) + 8 * v16++)];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v14);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v17 = [(JTViewController *)self childViewControllers];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    uint64_t v21 = (v4 + 1);
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v24 + 1) + 8 * v22);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v23 logSuspendedChildViewControllersToString:v6 indentLevel:v21];
        }
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }
}

- (void)suspendInteractionWithTag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JTViewController *)self suspendInteractionTags];
  [v5 addObject:v4];

  id v6 = [(JTViewController *)self view];
  LODWORD(v5) = [v6 isUserInteractionEnabled];

  if (v5)
  {
    id v7 = [(JTViewController *)self view];
    [v7 setUserInteractionEnabled:0];
  }
}

- (void)resumeInteractionWithTag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JTViewController *)self suspendInteractionTags];
  [v5 removeObject:v4];

  id v8 = [(JTViewController *)self suspendInteractionTags];
  if (![v8 count])
  {
    id v6 = [(JTViewController *)self view];
    char v7 = [v6 isUserInteractionEnabled];

    if (v7) {
      return;
    }
    id v8 = [(JTViewController *)self view];
    [v8 setUserInteractionEnabled:1];
  }
}

- (JTView)view
{
  v4.receiver = self;
  v4.super_class = (Class)JTViewController;
  uint64_t v2 = [(JTViewController *)&v4 view];
  return (JTView *)v2;
}

- (void)setView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)JTViewController;
  [(JTViewController *)&v3 setView:a3];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)JTViewController;
  [(JTViewController *)&v8 viewDidLoad];
  if ([(JTViewController *)self debuggingUIEnabled])
  {
    objc_super v3 = [(JTViewController *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v5 = [(JTViewController *)self debuggingUIEnabled];
      id v6 = [(JTViewController *)self view];
      [v6 setDebuggingUIEnabled:v5];
    }
    char v7 = [(JTViewController *)self view];
    [v7 layoutIfNeeded];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JTViewController;
  [(JTViewController *)&v4 viewDidAppear:a3];
  [(JTViewController *)self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JTViewController;
  [(JTViewController *)&v4 viewDidDisappear:a3];
  [(JTViewController *)self resignFirstResponder];
}

- (void)suspendChildViewControllersInteractionWithTag:(id)a3 timeout:(double)a4 excluding:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(JTViewController *)self suspendedChildViewControllerRequests];
  v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    v12 = JFXLog_core();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[JTViewController suspendChildViewControllersInteractionWithTag:timeout:excluding:]();
    }
  }
  else
  {
    v11 = +[JTSuspendedInteractionRequest requestWithTag:v8 excludedViewControllers:v9];
    [(JTViewController *)self setChildViewControllerInteractionEnabledWithRequest:v11 enabled:0];
    uint64_t v13 = [(JTViewController *)self suspendedChildViewControllerRequests];
    [v13 setObject:v11 forKeyedSubscript:v8];

    if (a4 != 0.0) {
      [(JTViewController *)self performSelector:sel_timeoutInteractionSuspended_ withObject:v8 afterDelay:a4];
    }
  }
}

- (void)resumeInteractionForChildViewControllersWithTag:(id)a3
{
  id v4 = a3;
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_timeoutInteractionSuspended_ object:v4];
  BOOL v5 = [(JTViewController *)self suspendedChildViewControllerRequests];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [(JTViewController *)self setChildViewControllerInteractionEnabledWithRequest:v6 enabled:1];
    char v7 = [(JTViewController *)self suspendedChildViewControllerRequests];
    [v7 removeObjectForKey:v4];
  }
  else
  {
    char v7 = JFXLog_core();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[JTViewController resumeInteractionForChildViewControllersWithTag:]();
    }
  }
}

- (void)timeoutInteractionSuspended:(id)a3
{
  id v4 = a3;
  BOOL v5 = JFXLog_core();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[JTViewController timeoutInteractionSuspended:]();
  }

  [(JTViewController *)self resumeInteractionForChildViewControllersWithTag:v4];
}

- (void)setChildViewControllerInteractionEnabledWithRequest:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = (void *)MEMORY[0x263EFF980];
  id v8 = [(JTViewController *)self childViewControllers];
  id v9 = [v7 arrayWithArray:v8];

  v10 = [v6 excludedChildViewControllers];

  if (v10)
  {
    v11 = [v6 excludedChildViewControllers];
    [v9 removeObjectsInArray:v11];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = [v6 tag];
          if (v4) {
            [v17 resumeInteractionWithTag:v18];
          }
          else {
            [v17 suspendInteractionWithTag:v18];
          }
        }
        else
        {
          uint64_t v18 = JFXLog_core();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v24 = v17;
            _os_log_debug_impl(&dword_234C41000, v18, OS_LOG_TYPE_DEBUG, "expected %@ to be a JTViewController", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)prefersStatusBarHidden
{
  objc_super v3 = [(JTViewController *)self viewControllerDrivingStatusAppearance];
  if (v3)
  {
    BOOL v4 = [(JTViewController *)self viewControllerDrivingStatusAppearance];
    LOBYTE(v5) = [v4 prefersStatusBarHidden];
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F1C5C0] currentDevice];
    int v5 = objc_msgSend(v4, "jfx_hasTrueDepthFrontCamera") ^ 1;
  }

  return v5;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  uint64_t v3 = [(JTViewController *)self viewControllerDrivingStatusAppearance];
  if (!v3) {
    return 0;
  }
  BOOL v4 = (void *)v3;
  int v5 = [(JTViewController *)self viewControllerDrivingStatusAppearance];
  NSSelectorFromString(&cfstr_Prefershomeind.isa);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  char v7 = [(JTViewController *)self viewControllerDrivingStatusAppearance];
  BOOL v8 = [v7 performSelector:NSSelectorFromString(&cfstr_Prefershomeind.isa)] != 0;

  return v8;
}

- (BOOL)debuggingUIEnabled
{
  return self->_debuggingUIEnabled;
}

- (void)setDebuggingUIEnabled:(BOOL)a3
{
  self->_debuggingUIEnabled = a3;
}

- (UIViewController)viewControllerDrivingStatusAppearance
{
  return self->_viewControllerDrivingStatusAppearance;
}

- (void)setViewControllerDrivingStatusAppearance:(id)a3
{
}

- (void)setSuspendedChildViewControllerRequests:(id)a3
{
}

- (void)setSuspendInteractionTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendInteractionTags, 0);
  objc_storeStrong((id *)&self->_suspendedChildViewControllerRequests, 0);
  objc_storeStrong((id *)&self->_viewControllerDrivingStatusAppearance, 0);
}

- (void)suspendChildViewControllersInteractionWithTag:timeout:excluding:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "child view controllers already suspended with tag \"%@\"", v2, v3, v4, v5, v6);
}

- (void)resumeInteractionForChildViewControllersWithTag:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "child view controllers were not suspended with tag \"%@\"", v2, v3, v4, v5, v6);
}

- (void)timeoutInteractionSuspended:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "suspend interaction tag \"%@\" timed out", v2, v3, v4, v5, v6);
}

@end