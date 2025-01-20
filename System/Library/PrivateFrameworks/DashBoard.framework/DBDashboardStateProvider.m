@interface DBDashboardStateProvider
- (BOOL)connectionReady;
- (CARObserverHashTable)observers;
- (DBDashboard)dashboard;
- (DBDashboardStateProvider)initWithDashboard:(id)a3;
- (NSString)activeBundleIdentifier;
- (unint64_t)lockoutState;
- (unint64_t)pageType;
- (void)_refreshObservations;
- (void)addObserver:(id)a3;
- (void)homeViewController:(id)a3 didChangeToPageIndex:(int64_t)a4 firstIconPageIndex:(int64_t)a5 minimumPageIndex:(int64_t)a6;
- (void)removeObserver:(id)a3;
- (void)setActiveBundleIdentifier:(id)a3;
- (void)setConnectionReady:(BOOL)a3;
- (void)setLockoutState:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setPageType:(unint64_t)a3;
- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
@end

@implementation DBDashboardStateProvider

- (DBDashboardStateProvider)initWithDashboard:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DBDashboardStateProvider;
  v5 = [(DBDashboardStateProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dashboard, v4);
    objc_storeStrong((id *)&v6->_activeBundleIdentifier, @"com.apple.CarPlay.dashboard");
    uint64_t v7 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1E32D8];
    observers = v6->_observers;
    v6->_observers = (CARObserverHashTable *)v7;
  }
  return v6;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardStateProvider *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardStateProvider *)self observers];
  [v5 removeObserver:v4];
}

- (void)setConnectionReady:(BOOL)a3
{
  if (self->_connectionReady != a3)
  {
    BOOL v3 = a3;
    id v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DBDashboardStateProvider setConnectionReady:]();
    }

    self->_connectionReady = v3;
    [(DBDashboardStateProvider *)self _refreshObservations];
    v6 = [(DBDashboardStateProvider *)self observers];
    [v6 dashboardStateProvider:self didChangeConnectionReady:v3];
  }
}

- (void)setLockoutState:(unint64_t)a3
{
  if (self->_lockoutState != a3)
  {
    id v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DBDashboardStateProvider setLockoutState:]();
    }

    self->_lockoutState = a3;
    v6 = [(DBDashboardStateProvider *)self observers];
    [v6 dashboardStateProvider:self didChangeLockoutState:self->_lockoutState];
  }
}

- (void)setPageType:(unint64_t)a3
{
  p_pageType = &self->_pageType;
  if (self->_pageType != a3)
  {
    v6 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(DBDashboardStateProvider *)p_pageType setPageType:v6];
    }

    self->_pageType = a3;
    uint64_t v7 = [(DBDashboardStateProvider *)self observers];
    [v7 dashboardStateProvider:self didChangeHomeScreenPageType:self->_pageType];
  }
}

- (void)setActiveBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (!+[DBComparison isValue:self->_activeBundleIdentifier equalTo:v4])
  {
    id v5 = DBLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(DBDashboardStateProvider *)&self->_activeBundleIdentifier setActiveBundleIdentifier:v5];
    }

    v6 = (NSString *)[v4 copy];
    activeBundleIdentifier = self->_activeBundleIdentifier;
    self->_activeBundleIdentifier = v6;

    v8 = [(DBDashboardStateProvider *)self observers];
    [v8 dashboardStateProvider:self didChangeActiveBundleIdentifier:self->_activeBundleIdentifier];
  }
}

- (void)_refreshObservations
{
  BOOL v3 = [(DBDashboardStateProvider *)self dashboard];
  id v4 = [v3 workspace];
  id v5 = [v4 state];

  if (v5)
  {
    v6 = [(DBDashboardStateProvider *)self dashboard];
    uint64_t v7 = [v6 workspace];
    v8 = [v7 state];
    v9 = [v8 activeBundleIdentifier];
    activeBundleIdentifier = self->_activeBundleIdentifier;
    self->_activeBundleIdentifier = v9;
  }
  id v12 = [(DBDashboardStateProvider *)self dashboard];
  v11 = [v12 workspace];
  [v11 addObserver:self];
}

- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  objc_msgSend(a5, "activeBundleIdentifier", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(DBDashboardStateProvider *)self setActiveBundleIdentifier:v6];
}

- (void)homeViewController:(id)a3 didChangeToPageIndex:(int64_t)a4 firstIconPageIndex:(int64_t)a5 minimumPageIndex:(int64_t)a6
{
  if (a4 == a6) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(DBDashboardStateProvider *)self setPageType:v6];
}

- (BOOL)connectionReady
{
  return self->_connectionReady;
}

- (unint64_t)lockoutState
{
  return self->_lockoutState;
}

- (unint64_t)pageType
{
  return self->_pageType;
}

- (NSString)activeBundleIdentifier
{
  return self->_activeBundleIdentifier;
}

- (DBDashboard)dashboard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dashboard);
  return (DBDashboard *)WeakRetained;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dashboard);
  objc_storeStrong((id *)&self->_activeBundleIdentifier, 0);
}

- (void)setConnectionReady:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "_hasHandledConnect=%@ hasHandledConnect=%@");
}

- (void)setLockoutState:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, v0, v1, "_hasFinishedConnecting=%@ hasFinishedConnecting=%@");
}

- (void)setPageType:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*a1 == 1) {
    id v5 = @"TodayView";
  }
  else {
    id v5 = @"Unknown";
  }
  if (*a1 == 2) {
    uint64_t v6 = @"AppIcons";
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = v6;
  if (a2 == 1) {
    v8 = @"TodayView";
  }
  else {
    v8 = @"Unknown";
  }
  if (a2 == 2) {
    v8 = @"AppIcons";
  }
  v9 = v8;
  int v10 = 138412546;
  v11 = v7;
  __int16 v12 = 2112;
  v13 = v9;
  _os_log_debug_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_DEBUG, "_pageType=%@ pageType=%@", (uint8_t *)&v10, 0x16u);
}

- (void)setActiveBundleIdentifier:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)BOOL v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_22D6F0000, a2, a3, "_activeBundleIdentifier=%@ activeBundleIdentifier=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end