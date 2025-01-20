@interface WFApplicationContext
+ (WFApplicationContext)sharedContext;
- (BOOL)canLoadShortcutsDatabase;
- (BOOL)canLoadShortcutsDatabaseEntitlementChecked;
- (BOOL)canOpenURL:(id)a3;
- (BOOL)inBackground;
- (BOOL)inactive;
- (BOOL)isIdleTimerDisabled;
- (BOOL)shouldReverseLayoutDirection;
- (NSArray)applicationBundleURLSchemes;
- (NSBundle)applicationBundle;
- (NSBundle)bundle;
- (NSLock)observersLock;
- (NSMutableDictionary)applicationStateObserversByEvent;
- (NSString)currentUserInterfaceType;
- (WFApplicationContext)init;
- (WFApplicationContextProvider)provider;
- (id)applicationOrNil;
- (id)keyWindow;
- (int64_t)applicationState;
- (int64_t)userInterfaceStyle;
- (void)_openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)addApplicationStateObserver:(id)a3 forEvent:(int64_t)a4;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)applicationWillResignActive;
- (void)dealloc;
- (void)handleApplicationStateEvent:(int64_t)a3;
- (void)openURL:(id)a3;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)openURL:(id)a3 userInterface:(id)a4 completionHandler:(id)a5;
- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 userInterface:(id)a5 completionHandler:(id)a6;
- (void)removeApplicationStateObserver:(id)a3 forEvent:(int64_t)a4;
- (void)setApplicationStateObserversByEvent:(id)a3;
- (void)setCanLoadShortcutsDatabaseEntitlementChecked:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setInBackground:(BOOL)a3;
- (void)setInactive:(BOOL)a3;
- (void)setProvider:(id)a3;
- (void)suspend;
@end

@implementation WFApplicationContext

- (void)setProvider:(id)a3
{
  v20 = (WFApplicationContextProvider *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(WFApplicationContextProvider *)v20 extensionApplicationContextProviderDelegate];

    if (!v6)
    {
      v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"WFApplicationContext.m" lineNumber:70 description:@"extensionApplicationContextProviderDelegate must be set on the extension context."];
    }
  }
  p_provider = &self->_provider;
  v9 = v20;
  if (self->_provider != v20)
  {
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    if (*p_provider)
    {
      v11 = [(WFApplicationContextProvider *)*p_provider notificationNameForApplicationStateEvent:0 applicationContext:self];
      v12 = [(WFApplicationContextProvider *)self->_provider notificationNameForApplicationStateEvent:1 applicationContext:self];
      v13 = [(WFApplicationContextProvider *)self->_provider notificationNameForApplicationStateEvent:2 applicationContext:self];
      v14 = [(WFApplicationContextProvider *)self->_provider notificationNameForApplicationStateEvent:3 applicationContext:self];
      if (v11) {
        [v10 removeObserver:self name:v11 object:0];
      }
      if (v12) {
        [v10 removeObserver:self name:v12 object:0];
      }
      if (v13) {
        [v10 removeObserver:self name:v13 object:0];
      }
      if (v14) {
        [v10 removeObserver:self name:v14 object:0];
      }
    }
    if (v20)
    {
      v15 = [(WFApplicationContextProvider *)v20 notificationNameForApplicationStateEvent:0 applicationContext:self];
      v16 = [(WFApplicationContextProvider *)v20 notificationNameForApplicationStateEvent:1 applicationContext:self];
      v17 = [(WFApplicationContextProvider *)v20 notificationNameForApplicationStateEvent:2 applicationContext:self];
      v18 = [(WFApplicationContextProvider *)v20 notificationNameForApplicationStateEvent:3 applicationContext:self];
      if (v15) {
        [v10 addObserver:self selector:sel_applicationDidBecomeActive name:v15 object:0];
      }
      if (v16) {
        [v10 addObserver:self selector:sel_applicationWillResignActive name:v16 object:0];
      }
      if (v17) {
        [v10 addObserver:self selector:sel_applicationDidEnterBackground name:v17 object:0];
      }
      if (v18) {
        [v10 addObserver:self selector:sel_applicationWillEnterForeground name:v18 object:0];
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v19 = [(WFApplicationContextProvider *)v20 currentApplicationStateForWFApplicationContext:self];
      }
      else {
        uint64_t v19 = 0;
      }
      [(WFApplicationContext *)self setInBackground:v19 == 2];
      [(WFApplicationContext *)self setInactive:v19 == 1];
    }
    objc_storeStrong((id *)&self->_provider, a3);

    v9 = v20;
  }
}

- (void)setInactive:(BOOL)a3
{
  self->_inactive = a3;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

+ (WFApplicationContext)sharedContext
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WFApplicationContext_sharedContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedContext_onceToken != -1) {
    dispatch_once(&sharedContext_onceToken, block);
  }
  v2 = (void *)sharedContext_sharedContext;
  return (WFApplicationContext *)v2;
}

- (void)handleApplicationStateEvent:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(WFApplicationContext *)self observersLock];
  [v5 lock];

  if (self->_applicationStateObserversByEvent) {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:self->_applicationStateObserversByEvent copyItems:1];
  }
  else {
    v6 = 0;
  }
  v7 = [(WFApplicationContext *)self observersLock];
  [v7 unlock];

  v8 = [NSNumber numberWithInteger:a3];
  v9 = [v6 objectForKey:v8];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "applicationContext:applicationStateDidChange:", self, a3, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)removeApplicationStateObserver:(id)a3 forEvent:(int64_t)a4
{
  id v12 = a3;
  v6 = [(WFApplicationContext *)self observersLock];
  [v6 lock];

  v7 = [(WFApplicationContext *)self applicationStateObserversByEvent];
  v8 = [NSNumber numberWithInteger:a4];
  v9 = [v7 objectForKey:v8];

  if ([v9 count] == 1 && objc_msgSend(v9, "containsObject:", v12))
  {
    id v10 = [NSNumber numberWithInteger:a4];
    [v7 removeObjectForKey:v10];
  }
  else
  {
    [v9 removeObject:v12];
  }
  uint64_t v11 = [(WFApplicationContext *)self observersLock];
  [v11 unlock];
}

- (void)addApplicationStateObserver:(id)a3 forEvent:(int64_t)a4
{
  id v12 = a3;
  v6 = [(WFApplicationContext *)self observersLock];
  [v6 lock];

  v7 = [(WFApplicationContext *)self applicationStateObserversByEvent];
  v8 = [NSNumber numberWithInteger:a4];
  v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    id v10 = [NSNumber numberWithInteger:a4];
    [v7 setObject:v9 forKey:v10];
  }
  [v9 addObject:v12];
  uint64_t v11 = [(WFApplicationContext *)self observersLock];
  [v11 unlock];
}

- (NSLock)observersLock
{
  return self->_observersLock;
}

- (NSMutableDictionary)applicationStateObserversByEvent
{
  applicationStateObserversByEvent = self->_applicationStateObserversByEvent;
  if (!applicationStateObserversByEvent)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_applicationStateObserversByEvent;
    self->_applicationStateObserversByEvent = v4;

    applicationStateObserversByEvent = self->_applicationStateObserversByEvent;
  }
  return applicationStateObserversByEvent;
}

- (id)applicationOrNil
{
  v3 = [(WFApplicationContext *)self provider];
  v4 = [v3 applicationForWFApplicationContext:self];

  return v4;
}

- (BOOL)shouldReverseLayoutDirection
{
  v3 = [(WFApplicationContext *)self provider];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(WFApplicationContext *)self provider];
    char v6 = [v5 shouldReverseLayoutDirection];

    return v6;
  }
  else
  {
    return MEMORY[0x270F84878]();
  }
}

- (WFApplicationContextProvider)provider
{
  provider = self->_provider;
  if (!provider)
  {
    char v4 = (WFApplicationContextProvider *)objc_opt_new();
    v5 = self->_provider;
    self->_provider = v4;

    provider = self->_provider;
  }
  return provider;
}

- (void)applicationWillEnterForeground
{
  self->_inBackground = 0;
  [(WFApplicationContext *)self handleApplicationStateEvent:3];
}

- (NSBundle)applicationBundle
{
  applicationBundle = self->_applicationBundle;
  if (!applicationBundle)
  {
    char v4 = [MEMORY[0x263F01878] bundleRecordWithBundleIdentifier:*MEMORY[0x263F85610] allowPlaceholder:0 error:0];
    v5 = v4;
    if (v4)
    {
      char v6 = (void *)MEMORY[0x263F086E0];
      v7 = [v4 URL];
      v8 = [v6 bundleWithURL:v7];
      v9 = self->_applicationBundle;
      self->_applicationBundle = v8;
    }
    applicationBundle = self->_applicationBundle;
  }
  return applicationBundle;
}

uint64_t __37__WFApplicationContext_sharedContext__block_invoke(uint64_t a1)
{
  sharedContext_sharedContext = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (WFApplicationContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFApplicationContext;
  v2 = [(WFApplicationContext *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    observersLock = v2->_observersLock;
    v2->_observersLock = (NSLock *)v3;

    [(NSLock *)v2->_observersLock setName:@"WFApplicationContext observer lock"];
    v5 = v2;
  }

  return v2;
}

- (void)applicationDidBecomeActive
{
  notify_post((const char *)WFApplicationActiveIdentifier);
  self->_inactive = 0;
  [(WFApplicationContext *)self handleApplicationStateEvent:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_applicationStateObserversByEvent, 0);
  objc_storeStrong((id *)&self->_applicationBundle, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)setCanLoadShortcutsDatabaseEntitlementChecked:(BOOL)a3
{
  self->_canLoadShortcutsDatabaseEntitlementChecked = a3;
}

- (BOOL)canLoadShortcutsDatabaseEntitlementChecked
{
  return self->_canLoadShortcutsDatabaseEntitlementChecked;
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (void)setApplicationStateObserversByEvent:(id)a3
{
}

- (BOOL)canLoadShortcutsDatabase
{
  if (![(WFApplicationContext *)self canLoadShortcutsDatabaseEntitlementChecked])
  {
    uint64_t v3 = SecTaskCreateFromSelf(0);
    if (v3)
    {
      char v4 = v3;
      CFBooleanRef v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v3, @"com.apple.rootless.storage.shortcuts", 0);
      if (v5)
      {
        CFBooleanRef v6 = v5;
        CFTypeID v7 = CFGetTypeID(v5);
        BOOL v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
        self->_canLoadShortcutsDatabase = v8;
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    [(WFApplicationContext *)self setCanLoadShortcutsDatabaseEntitlementChecked:1];
  }
  return self->_canLoadShortcutsDatabase;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  CFBooleanRef v5 = [(WFApplicationContext *)self provider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFApplicationContext *)self provider];
    [v7 setWfIdleTimerDisabled:v3];
  }
}

- (BOOL)isIdleTimerDisabled
{
  BOOL v3 = [(WFApplicationContext *)self provider];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  CFBooleanRef v5 = [(WFApplicationContext *)self provider];
  char v6 = [v5 wfIdleTimerDisabled];

  return v6;
}

- (void)suspend
{
  id v2 = [(WFApplicationContext *)self applicationOrNil];
  [v2 suspend];
}

- (int64_t)userInterfaceStyle
{
  BOOL v3 = [(WFApplicationContext *)self provider];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(WFApplicationContext *)self provider];
    int64_t v5 = [v4 userInterfaceStyle];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)keyWindow
{
  BOOL v3 = [(WFApplicationContext *)self provider];
  char v4 = [v3 keyWindowForWFApplicationContext:self];

  return v4;
}

- (NSString)currentUserInterfaceType
{
  BOOL v3 = [(WFApplicationContext *)self provider];
  char v4 = [v3 currentUserInterfaceTypeForWFApplicationContext:self];

  return (NSString *)v4;
}

- (NSBundle)bundle
{
  BOOL v3 = [(WFApplicationContext *)self provider];
  char v4 = [v3 bundleForWFApplicationContext:self];

  return (NSBundle *)v4;
}

- (NSArray)applicationBundleURLSchemes
{
  id v2 = [(WFApplicationContext *)self applicationBundle];
  BOOL v3 = WFURLSchemesInBundle(v2);

  return (NSArray *)v3;
}

- (void)_openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [WFAppLaunchRequest alloc];
  if (v8)
  {
    uint64_t v11 = [(INCAppLaunchRequest *)v10 initWithBundleIdentifier:v8 options:0 URL:v7 userActivity:0];
    id v12 = 0;
    if (v11)
    {
LABEL_3:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __72__WFApplicationContext__openURL_withBundleIdentifier_completionHandler___block_invoke;
      v14[3] = &unk_264287880;
      id v15 = v9;
      [(WFAppLaunchRequest *)v11 performWithCompletionHandler:v14];

      goto LABEL_9;
    }
  }
  else
  {
    id v16 = 0;
    uint64_t v11 = [(INCAppLaunchRequest *)v10 initWithURL:v7 error:&v16];
    id v12 = v16;
    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = getWFApplicationContextLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v18 = "-[WFApplicationContext _openURL:withBundleIdentifier:completionHandler:]";
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create app launch request: %{public}@", buf, 0x16u);
  }

  if (v9) {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v12);
  }
LABEL_9:
}

void __72__WFApplicationContext__openURL_withBundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    char v6 = getWFApplicationContextLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[WFApplicationContext _openURL:withBundleIdentifier:completionHandler:]_block_invoke";
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_ERROR, "%s Error launching app: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 | v11)
  {
    if (objc_opt_respondsToSelector())
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __85__WFApplicationContext_openURL_withBundleIdentifier_userInterface_completionHandler___block_invoke;
      v15[3] = &unk_264288328;
      id v18 = v13;
      v15[4] = self;
      id v16 = (id)v10;
      id v17 = (id)v11;
      [v12 openURL:v16 withBundleIdentifier:v17 completionHandler:v15];
    }
    else
    {
      [(WFApplicationContext *)self _openURL:v10 withBundleIdentifier:v11 completionHandler:v13];
    }
  }
  else
  {
    uint64_t v14 = getWFApplicationContextLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v20 = "-[WFApplicationContext openURL:withBundleIdentifier:userInterface:completionHandler:]";
      _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_ERROR, "%s Asked to open nil URL with nil bundle identifier", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
}

uint64_t __85__WFApplicationContext_openURL_withBundleIdentifier_userInterface_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), a3 == 0);
  }
  else {
    return [*(id *)(a1 + 32) _openURL:*(void *)(a1 + 40) withBundleIdentifier:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)openURL:(id)a3 userInterface:(id)a4 completionHandler:(id)a5
{
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
}

- (void)openURL:(id)a3
{
}

- (BOOL)canOpenURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v3 = (void *)MEMORY[0x263F01880];
  id v4 = a3;
  id v5 = [v3 defaultWorkspace];
  char v6 = [v5 applicationsAvailableForOpeningURL:v4];

  BOOL v7 = [v6 count] != 0;
  return v7;
}

- (int64_t)applicationState
{
  BOOL v3 = [(WFApplicationContext *)self provider];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFApplicationContext *)self provider];
    int64_t v6 = [v5 currentApplicationStateForWFApplicationContext:self];

    return v6;
  }
  else if ([(WFApplicationContext *)self inBackground])
  {
    return 2;
  }
  else
  {
    return [(WFApplicationContext *)self inactive];
  }
}

- (void)applicationDidEnterBackground
{
  self->_inBackground = 1;
  [(WFApplicationContext *)self handleApplicationStateEvent:2];
}

- (void)applicationWillResignActive
{
  self->_inactive = 1;
  [(WFApplicationContext *)self handleApplicationStateEvent:1];
}

- (void)dealloc
{
  [(WFApplicationContext *)self setProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)WFApplicationContext;
  [(WFApplicationContext *)&v3 dealloc];
}

@end