@interface STWebpageController
- (BOOL)URLIsBlocked;
- (BOOL)URLIsPictureInPicture;
- (BOOL)URLIsPlayingVideo;
- (BOOL)URLIsPlayingVideoPictureInPicture;
- (BOOL)URLIsVisibleInForeground;
- (BOOL)setBundleIdentifier:(NSString *)bundleIdentifier error:(NSError *)error;
- (BOOL)suppressUsageRecording;
- (NSString)bundleIdentifier;
- (NSURL)URL;
- (STWebRemoteViewController)remoteViewController;
- (STWebService)serviceProxy;
- (STWebpageController)init;
- (int64_t)currentUsageState;
- (int64_t)defaultUsageState;
- (void)_URLIsBlockedDidChangeFrom:(id)a3 to:(id)a4;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_changeUsageState:(int64_t)a3 errorHandler:(id)a4;
- (void)_delayedSetURLIsBlocked:(id)a3;
- (void)_didChangePlaybackState:(id)a3;
- (void)_didStopPictureInPicture:(id)a3;
- (void)_setURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 errorHandler:(id)a6;
- (void)_startReportingWebUsage;
- (void)_willStartPictureInPicture:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBundleIdentifier:(id)a3;
- (void)setCurrentUsageState:(int64_t)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setSuppressUsageRecording:(BOOL)suppressUsageRecording;
- (void)setURL:(NSURL *)URL;
- (void)setURLIsBlocked:(BOOL)a3;
- (void)setURLIsPictureInPicture:(BOOL)URLIsPictureInPicture;
- (void)setURLIsPlayingVideo:(BOOL)URLIsPlayingVideo;
- (void)setURLIsVisibleInForeground:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation STWebpageController

- (STWebpageController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STWebpageController;
  v2 = [(STWebpageController *)&v6 init];
  uint64_t v3 = +[STWebService clientBundleIdentifier];
  bundleIdentifier = v2->_bundleIdentifier;
  v2->_bundleIdentifier = (NSString *)v3;

  v2->_currentUsageState = 0;
  return v2;
}

- (void)dealloc
{
  [(STWebpageController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STWebpageController;
  [(STWebpageController *)&v3 dealloc];
}

- (void)invalidate
{
  [(STWebRemoteViewController *)self->_remoteViewController removeObserver:self forKeyPath:@"URLIsBlocked" context:"KVOContextSTWebpageController"];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;
}

- (void)loadView
{
  v4 = objc_opt_new();
  [v4 setUserInteractionEnabled:0];
  [(STWebpageController *)self setView:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__STWebpageController_loadView__block_invoke;
  v6[3] = &unk_2646E73C8;
  id v7 = v4;
  SEL v8 = a2;
  v6[4] = self;
  id v5 = v4;
  +[STWebRemoteViewController instantiateWebViewControllerWithConnectionHandler:v6];
}

void __31__STWebpageController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v15 = v5;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x263F08690];
    id v13 = a3;
    v14 = [v12 currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"STWebpageController.m", 140, @"Fatal error occured %@", v13 object file lineNumber description];

    id v5 = 0;
  }
  [*(id *)(a1 + 32) setRemoteViewController:v5];
  [v15 addObserver:*(void *)(a1 + 32) forKeyPath:@"URLIsBlocked" options:3 context:"KVOContextSTWebpageController"];
  [*(id *)(a1 + 32) addChildViewController:v15];
  objc_super v6 = [v15 view];
  id v7 = _NSDictionaryOfVariableBindings(&cfstr_Blockingview.isa, v6, 0);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 40) addSubview:v6];
  SEL v8 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[blockingView]|" options:0 metrics:0 views:v7];
  v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[blockingView]|" options:0 metrics:0 views:v7];
  v10 = (void *)MEMORY[0x263F08938];
  v11 = [v8 arrayByAddingObjectsFromArray:v9];
  [v10 activateConstraints:v11];

  [v15 didMoveToParentViewController:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _startReportingWebUsage];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)STWebpageController;
  [(STWebpageController *)&v5 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__willStartPictureInPicture_ name:*MEMORY[0x263EFA970] object:0];
  [v3 addObserver:self selector:sel__didStopPictureInPicture_ name:*MEMORY[0x263EFA958] object:0];
  [v3 addObserver:self selector:sel__didChangePlaybackState_ name:*MEMORY[0x263EFA960] object:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2249CB000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebpageController.viewDidLoad", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STWebpageController;
  [(STWebpageController *)&v6 viewDidAppear:a3];
  [(STWebpageController *)self setCurrentUsageState:2];
  [(STWebpageController *)self setURLIsVisibleInForeground:1];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
  [v4 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_2249CB000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebpageController.viewDidAppear", v5, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(STWebpageController *)self URLIsPlayingVideoPictureInPicture]) {
    [(STWebpageController *)self setCurrentUsageState:0];
  }
  [(STWebpageController *)self setURLIsVisibleInForeground:0];
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F1D038] object:0];
  [v5 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2249CB000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebpageController.viewDidDisappear", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)STWebpageController;
  [(STWebpageController *)&v6 viewDidDisappear:v3];
}

- (void)setSuppressUsageRecording:(BOOL)suppressUsageRecording
{
  if (self->_suppressUsageRecording != suppressUsageRecording)
  {
    self->_suppressUsageRecording = suppressUsageRecording;
    objc_super v5 = [(STWebpageController *)self URL];
    if (objc_msgSend(v5, "_lp_isHTTPFamilyURL"))
    {
      objc_super v6 = [(STWebpageController *)self bundleIdentifier];
      int64_t v7 = [(STWebpageController *)self currentUsageState];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__STWebpageController_setSuppressUsageRecording___block_invoke;
      v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
      BOOL v9 = suppressUsageRecording;
      [(STWebpageController *)self _setURL:v5 bundleIdentifier:v6 usageState:v7 errorHandler:v8];
    }
  }
}

void __49__STWebpageController_setSuppressUsageRecording___block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __49__STWebpageController_setSuppressUsageRecording___block_invoke_cold_1(a1, a2);
  }
}

- (void)setURL:(NSURL *)URL
{
  v4 = URL;
  objc_super v5 = self->_URL;
  if (v5 != v4)
  {
    v11 = v4;
    if (([(NSURL *)v5 isEqual:v4] & 1) == 0)
    {
      objc_super v6 = (NSURL *)[(NSURL *)v11 copy];
      int64_t v7 = self->_URL;
      self->_URL = v6;

      if ([(NSURL *)v11 _lp_isHTTPFamilyURL]) {
        SEL v8 = v11;
      }
      else {
        SEL v8 = 0;
      }
      BOOL v9 = v8;
      v10 = [(STWebpageController *)self bundleIdentifier];
      [(STWebpageController *)self _setURL:v9 bundleIdentifier:v10 usageState:[(STWebpageController *)self currentUsageState] errorHandler:&__block_literal_global_0];
    }
  }

  MEMORY[0x270F9A758]();
}

void __30__STWebpageController_setURL___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __30__STWebpageController_setURL___block_invoke_cold_1();
  }
}

- (void)setURLIsPlayingVideo:(BOOL)URLIsPlayingVideo
{
  if (self->_URLIsPlayingVideo != URLIsPlayingVideo)
  {
    self->_URLIsPlayingVideo = URLIsPlayingVideo;
    if ([(STWebpageController *)self URLIsPictureInPicture])
    {
      if (URLIsPlayingVideo) {
        int64_t v5 = 2;
      }
      else {
        int64_t v5 = [(STWebpageController *)self defaultUsageState];
      }
      [(STWebpageController *)self setCurrentUsageState:v5];
    }
  }
}

- (void)setURLIsPictureInPicture:(BOOL)URLIsPictureInPicture
{
  if (self->_URLIsPictureInPicture != URLIsPictureInPicture)
  {
    self->_URLIsPictureInPicture = URLIsPictureInPicture;
    if ([(STWebpageController *)self URLIsPlayingVideo])
    {
      if (URLIsPictureInPicture) {
        int64_t v5 = 2;
      }
      else {
        int64_t v5 = [(STWebpageController *)self defaultUsageState];
      }
      [(STWebpageController *)self setCurrentUsageState:v5];
    }
  }
}

- (BOOL)setBundleIdentifier:(NSString *)bundleIdentifier error:(NSError *)error
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_super v6 = bundleIdentifier;
  int64_t v7 = +[STWebService clientBundleIdentifier];
  if ([(NSString *)v6 isEqualToString:v7]
    || ([MEMORY[0x263F318B0] supportedWebBrowserBundleIdentifiersForDeviceFamily:102],
        SEL v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 containsObject:v7],
        v8,
        v9))
  {
    [(STWebpageController *)self setBundleIdentifier:v6];
    LOBYTE(error) = 1;
  }
  else if (error)
  {
    v11 = +[STScreenTimeBundle bundle];
    v12 = [v11 localizedStringForKey:@"UnsupportedWebBrowserError" value:&stru_26D7C1938 table:0];

    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F67300];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = v12;
    id v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *error = [v13 errorWithDomain:v14 code:100 userInfo:v15];

    LOBYTE(error) = 0;
  }

  return (char)error;
}

- (void)setBundleIdentifier:(id)a3
{
  id v8 = a3;
  v4 = [(STWebpageController *)self bundleIdentifier];
  if (([v4 isEqualToString:v8] & 1) == 0)
  {
    int64_t v5 = (NSString *)[v8 copy];
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;

    int64_t v7 = [(STWebpageController *)self URL];
    if (![(STWebpageController *)self suppressUsageRecording]
      && objc_msgSend(v7, "_lp_isHTTPFamilyURL"))
    {
      [(STWebpageController *)self _setURL:v7 bundleIdentifier:v8 usageState:[(STWebpageController *)self currentUsageState] errorHandler:&__block_literal_global_53];
    }
  }
}

void __43__STWebpageController_setBundleIdentifier___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __43__STWebpageController_setBundleIdentifier___block_invoke_cold_1();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextSTWebpageController")
  {
    if ([a3 isEqualToString:@"URLIsBlocked"])
    {
      v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v12 = [MEMORY[0x263EFF9D0] null];

      if (v11 == v12)
      {

        v11 = 0;
      }
      id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v14)
      {

        id v13 = 0;
      }
      [(STWebpageController *)self _URLIsBlockedDidChangeFrom:v11 to:v13];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STWebpageController;
    [(STWebpageController *)&v15 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_URLIsBlockedDidChangeFrom:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [v8 BOOLValue];
  if (v7 != [v6 BOOLValue])
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedSetURLIsBlocked_ object:v8];
    [(STWebpageController *)self performSelector:sel__delayedSetURLIsBlocked_ withObject:v6 afterDelay:(double)arc4random_uniform(0x3Cu) + 1.0];
  }
}

- (void)_delayedSetURLIsBlocked:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];

  [(STWebpageController *)self setURLIsBlocked:v4];
}

- (int64_t)currentUsageState
{
  if ([(STWebpageController *)self suppressUsageRecording]) {
    return 0;
  }
  else {
    return self->_currentUsageState;
  }
}

- (void)setCurrentUsageState:(int64_t)a3
{
  if (self->_currentUsageState != a3)
  {
    self->_currentUsageState = a3;
    if (![(STWebpageController *)self suppressUsageRecording])
    {
      int64_t v5 = [(STWebpageController *)self URL];
      int v6 = objc_msgSend(v5, "_lp_isHTTPFamilyURL");

      if (v6)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __44__STWebpageController_setCurrentUsageState___block_invoke;
        v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v7[4] = a3;
        [(STWebpageController *)self _changeUsageState:a3 errorHandler:v7];
      }
    }
  }
}

void __44__STWebpageController_setCurrentUsageState___block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __44__STWebpageController_setCurrentUsageState___block_invoke_cold_1(a1, a2);
  }
}

- (int64_t)defaultUsageState
{
  if ([(STWebpageController *)self URLIsVisibleInForeground]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)_startReportingWebUsage
{
  id v5 = [(STWebpageController *)self URL];
  if (![(STWebpageController *)self suppressUsageRecording]
    && objc_msgSend(v5, "_lp_isHTTPFamilyURL"))
  {
    BOOL v3 = [(STWebpageController *)self serviceProxy];
    uint64_t v4 = [(STWebpageController *)self bundleIdentifier];
    objc_msgSend(v3, "setURL:bundleIdentifier:usageState:replyHandler:", v5, v4, -[STWebpageController currentUsageState](self, "currentUsageState"), &__block_literal_global_62);
  }
}

void __46__STWebpageController__startReportingWebUsage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __46__STWebpageController__startReportingWebUsage__block_invoke_cold_1();
  }
}

- (void)_setURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 errorHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(STWebpageController *)self serviceProxy];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__STWebpageController__setURL_bundleIdentifier_usageState_errorHandler___block_invoke;
  v15[3] = &unk_2646E7430;
  id v16 = v10;
  id v14 = v10;
  [v13 setURL:v12 bundleIdentifier:v11 usageState:a5 replyHandler:v15];
}

uint64_t __72__STWebpageController__setURL_bundleIdentifier_usageState_errorHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_changeUsageState:(int64_t)a3 errorHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(STWebpageController *)self serviceProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__STWebpageController__changeUsageState_errorHandler___block_invoke;
  v9[3] = &unk_2646E7430;
  id v10 = v6;
  id v8 = v6;
  [v7 changeUsageState:a3 replyHandler:v9];
}

uint64_t __54__STWebpageController__changeUsageState_errorHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (STWebService)serviceProxy
{
  id v2 = [(STWebpageController *)self remoteViewController];
  BOOL v3 = [v2 serviceViewControllerProxyWithErrorHandler:&__block_literal_global_64];

  return (STWebService *)v3;
}

void __35__STWebpageController_serviceProxy__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    __35__STWebpageController_serviceProxy__block_invoke_cold_1();
  }
}

- (BOOL)URLIsPlayingVideoPictureInPicture
{
  BOOL v3 = [(STWebpageController *)self URLIsPlayingVideo];
  if (v3)
  {
    LOBYTE(v3) = [(STWebpageController *)self URLIsPictureInPicture];
  }
  return v3;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  [(STWebpageController *)self setURLIsVisibleInForeground:1];

  [(STWebpageController *)self setCurrentUsageState:2];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(STWebpageController *)self setURLIsVisibleInForeground:0];
  if (![(STWebpageController *)self URLIsPlayingVideoPictureInPicture])
  {
    [(STWebpageController *)self setCurrentUsageState:0];
  }
}

- (void)_willStartPictureInPicture:(id)a3
{
  id v4 = a3;
  [(STWebpageController *)self setURLIsPictureInPicture:1];
  [(STWebpageController *)self _didChangePlaybackState:v4];
}

- (void)_didStopPictureInPicture:(id)a3
{
  [(STWebpageController *)self setURLIsPlayingVideo:0];

  [(STWebpageController *)self setURLIsPictureInPicture:0];
}

- (void)_didChangePlaybackState:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263EFA968]];

  -[STWebpageController setURLIsPlayingVideo:](self, "setURLIsPlayingVideo:", [v5 BOOLValue]);
}

- (BOOL)suppressUsageRecording
{
  return self->_suppressUsageRecording;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)URLIsPlayingVideo
{
  return self->_URLIsPlayingVideo;
}

- (BOOL)URLIsPictureInPicture
{
  return self->_URLIsPictureInPicture;
}

- (BOOL)URLIsBlocked
{
  return self->_URLIsBlocked;
}

- (void)setURLIsBlocked:(BOOL)a3
{
  self->_URLIsBlocked = a3;
}

- (STWebRemoteViewController)remoteViewController
{
  return (STWebRemoteViewController *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setRemoteViewController:(id)a3
{
}

- (BOOL)URLIsVisibleInForeground
{
  return self->_URLIsVisibleInForeground;
}

- (void)setURLIsVisibleInForeground:(BOOL)a3
{
  self->_URLIsVisibleInForeground = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

void __49__STWebpageController_setSuppressUsageRecording___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 32);
  v3[0] = 67240450;
  v3[1] = v2;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_2249CB000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to set suppressUsageRecording: %{public}d with error: %{public}@", (uint8_t *)v3, 0x12u);
}

void __30__STWebpageController_setURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to set URL: %{public}@", v1, v2, v3, v4, v5);
}

void __43__STWebpageController_setBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to set bundleIdentifier: %{public}@", v1, v2, v3, v4, v5);
}

void __44__STWebpageController_setCurrentUsageState___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134218242;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_2249CB000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to change to usage state %ld: %{public}@", (uint8_t *)&v3, 0x16u);
}

void __46__STWebpageController__startReportingWebUsage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to start recording usage: %{public}@", v1, v2, v3, v4, v5);
}

void __35__STWebpageController_serviceProxy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2249CB000, &_os_log_internal, v0, "Failed to get web service proxy: %{public}@", v1, v2, v3, v4, v5);
}

@end