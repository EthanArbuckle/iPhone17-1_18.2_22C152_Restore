@interface MPMediaControls
- (BOOL)_shouldUpdateStyleForCurrentConfigurationStyle:(int64_t)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MPMediaControls)init;
- (MPMediaControls)initWithConfiguration:(id)a3;
- (MPMediaControls)initWithConfiguration:(id)a3 shouldObserveRoutingContextUIDChanges:(BOOL)a4;
- (MPMediaControls)initWithRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4;
- (MPMediaControlsConfiguration)configuration;
- (NSString)routeUID;
- (NSXPCConnection)connection;
- (NSXPCListener)listener;
- (UIView)sourceView;
- (double)preferredWidth;
- (id)_dismissalReasonString:(unint64_t)a3;
- (id)customRowDidTapHandler;
- (id)dismissHandler;
- (id)dismissHandlerWithReason;
- (int64_t)_mediaControlsStyleForRouteSharingPolicy:(unint64_t)a3;
- (unint64_t)_MPRouteSharingPolicyToAVRouteSharingPolicy:(unint64_t)a3;
- (void)_audioSessionRoutingContextDidChangeNotification;
- (void)_reset;
- (void)_updateAudioSessionRoutingContext;
- (void)addCustomRowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5;
- (void)dealloc;
- (void)didEnterBackground:(id)a3;
- (void)dismiss;
- (void)openConnection;
- (void)present;
- (void)setConnection:(id)a3;
- (void)setCustomRowDidTapHandler:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDismissHandlerWithReason:(id)a3;
- (void)setDismissalReason:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setRouteUID:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setTappedCustomRowIdentifier:(id)a3;
- (void)startPrewarming;
- (void)stopPrewarming;
@end

@implementation MPMediaControls

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandlerWithReason, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong(&self->_customRowDidTapHandler, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);

  objc_storeStrong((id *)&self->_tappedCustomRowIdentifier, 0);
}

- (void)setDismissHandlerWithReason:(id)a3
{
}

- (id)dismissHandlerWithReason
{
  return self->_dismissHandlerWithReason;
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setListener:(id)a3
{
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setCustomRowDidTapHandler:(id)a3
{
}

- (id)customRowDidTapHandler
{
  return self->_customRowDidTapHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (BOOL)_shouldUpdateStyleForCurrentConfigurationStyle:(int64_t)a3
{
  return (unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFFBLL;
}

- (id)_dismissalReasonString:(unint64_t)a3
{
  if (a3) {
    return @"MPMediaControlsDismissalReasonUserCancelled";
  }
  else {
    return @"MPMediaControlsDismissalReasonUnknown";
  }
}

- (unint64_t)_MPRouteSharingPolicyToAVRouteSharingPolicy:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (int64_t)_mediaControlsStyleForRouteSharingPolicy:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 infoDictionary];
  v7 = [v6 objectForKeyedSubscript:@"SupportsSharedQueue"];
  int v8 = [v7 BOOLValue];

  if ([(MPMediaControls *)self _shouldUpdateStyleForCurrentConfigurationStyle:[(MPMediaControlsConfiguration *)self->_configuration style]])
  {
    int64_t v9 = 2;
    if (v8) {
      int64_t v9 = 3;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      return v9;
    }
    else {
      return 1;
    }
  }
  else
  {
    configuration = self->_configuration;
    return [(MPMediaControlsConfiguration *)configuration style];
  }
}

- (void)_audioSessionRoutingContextDidChangeNotification
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(MPMediaControls *)self _updateAudioSessionRoutingContext];
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(MPMediaControlsConfiguration *)self->_configuration routingContextUID];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_INFO, "Updating remote view controller routing context UID : %{public}@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v5 updateMediaControlsWithConfiguration:self->_configuration];
}

- (void)_updateAudioSessionRoutingContext
{
  id v4 = [MEMORY[0x1E4F153E0] sharedInstance];
  v3 = [v4 routingContextUID];
  [(MPMediaControlsConfiguration *)self->_configuration setRoutingContextUID:v3];

  -[MPMediaControlsConfiguration setStyle:](self->_configuration, "setStyle:", -[MPMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", [v4 routeSharingPolicy]));
}

- (void)_reset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F15180] object:0];

  id dismissHandler = self->_dismissHandler;
  if (dismissHandler) {
    dispatch_async(MEMORY[0x1E4F14428], dismissHandler);
  }
  if (self->_dismissHandlerWithReason)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__MPMediaControls__reset__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if (self->_customRowDidTapHandler && self->_tappedCustomRowIdentifier)
  {
    v5 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
      *(_DWORD *)buf = 138412290;
      v10 = tappedCustomRowIdentifier;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "MediaControls custom row did tap, rowIdentifier: %@", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __25__MPMediaControls__reset__block_invoke_72;
    v7[3] = &unk_1E57F9EA8;
    v7[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __25__MPMediaControls__reset__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 96) + 16))();
}

uint64_t __25__MPMediaControls__reset__block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

- (void)setTappedCustomRowIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with tapped custom row identifier : %@", (uint8_t *)&v7, 0xCu);
  }

  tappedCustomRowIdentifier = self->_tappedCustomRowIdentifier;
  self->_tappedCustomRowIdentifier = v4;
}

- (void)setDismissalReason:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [(MPMediaControls *)self _dismissalReasonString:a3];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "MediaControls dismissed with reason : %@", (uint8_t *)&v7, 0xCu);
  }
  self->_dismissalReason = a3;
}

- (void)openConnection
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_INFO, "Connection established to remote view controller.", v3, 2u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_INFO, "Received request to accept new connection.", (uint8_t *)buf, 2u);
  }

  objc_storeStrong((id *)&self->_connection, a4);
  uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE78E048];
  [v7 setRemoteObjectInterface:v9];

  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE764548];
  [v7 setExportedInterface:v10];

  [v7 setExportedObject:self];
  objc_initWeak(buf, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MPMediaControls_listener_shouldAcceptNewConnection___block_invoke;
  v12[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v13, buf);
  [v7 setInvalidationHandler:v12];
  [v7 resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

  return 1;
}

void __54__MPMediaControls_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_INFO, "Connection to remote view controller invalidated.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reset];
}

- (NSXPCListener)listener
{
  listener = self->_listener;
  if (!listener)
  {
    id v4 = [MEMORY[0x1E4F29290] anonymousListener];
    v5 = self->_listener;
    self->_listener = v4;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener activate];
    listener = self->_listener;
  }

  return listener;
}

- (void)didEnterBackground:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  id v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.MediaRemoteUI"];

  id v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "App is MediaRemoteUI Not dismissing remote view controller for entering background.", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing remote view controller due to app entering background.", v8, 2u);
    }

    MRMediaRemoteDismissMediaControlsCommand();
  }
}

- (void)dismiss
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing remote view controller at app's request.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (void)present
{
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Present remote view controller.", buf, 2u);
  }

  [(MPMediaControls *)self startPrewarming];
  MRMediaRemotePresentMediaControlsCommand();
}

uint64_t __26__MPMediaControls_present__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    id v4 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      uint64_t v6 = a2;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "Error occurred while attempting to present remote view controller. %@", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(v3 + 32) _reset];
  }
  return result;
}

- (void)stopPrewarming
{
  v2 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Stop prewarming remote view controller.", v3, 2u);
  }

  MRMediaRemoteDismissMediaControlsCommand();
}

- (void)startPrewarming
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_shouldObserveRoutingContextUIDChanges) {
    [(MPMediaControls *)self _updateAudioSessionRoutingContext];
  }
  [(MPMediaControlsConfiguration *)self->_configuration sourceRect];
  if (CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28])
    || ([(MPMediaControlsConfiguration *)self->_configuration sourceRect],
        CGRectEqualToRect(v29, *MEMORY[0x1E4F1DB20])))
  {
    uint64_t v3 = [(UIView *)self->_sourceView superview];
    [(UIView *)self->_sourceView frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(UIView *)self->_sourceView window];
    id v13 = [v12 screen];
    v14 = [v13 coordinateSpace];
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v14, v5, v7, v9, v11);
    -[MPMediaControlsConfiguration setSourceRect:](self->_configuration, "setSourceRect:");
  }
  v15 = (void *)MEMORY[0x1E4F28DB0];
  v16 = [(MPMediaControls *)self configuration];
  v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];

  v18 = [(MPMediaControls *)self configuration];
  [v18 style];

  v19 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(MPMediaControls *)self configuration];
    v21 = [v20 description];
    int v25 = 138543362;
    v26 = v21;
    _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "Start prewarming remote view controller. Configuration : %{public}@", (uint8_t *)&v25, 0xCu);
  }
  v22 = [(MPMediaControls *)self listener];
  v23 = [v22 endpoint];
  v24 = [v23 _endpoint];
  MRMediaRemotePrewarmMediaControlsCommand();
}

- (void)addCustomRowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "MediaControls - Adding Custom Row with type:%@, titleOverride: %@, identifier: %@", (uint8_t *)&v17, 0x20u);
  }

  v12 = [(MPMediaControlsConfiguration *)self->_configuration customRows];

  if (!v12)
  {
    configuration = self->_configuration;
    v14 = [MEMORY[0x1E4F1CA48] array];
    [(MPMediaControlsConfiguration *)configuration setCustomRows:v14];
  }
  v15 = +[MPMediaControlsCustomRow rowWithType:v8 titleOverride:v9 identifier:v10];
  v16 = [(MPMediaControlsConfiguration *)self->_configuration customRows];
  [v16 addObject:v15];
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
  -[MPMediaControlsConfiguration setPreferredWidth:](self->_configuration, "setPreferredWidth:");
}

- (void)setRouteUID:(id)a3
{
  objc_storeStrong((id *)&self->_routeUID, a3);
  id v5 = a3;
  [(MPMediaControlsConfiguration *)self->_configuration setRouteUID:v5];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPMediaControls;
  [(MPMediaControls *)&v3 dealloc];
}

- (MPMediaControls)initWithConfiguration:(id)a3 shouldObserveRoutingContextUIDChanges:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPMediaControls;
  id v8 = [(MPMediaControls *)&v21 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel_didEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    double v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v11 bundleIdentifier];
    if ([v12 isEqualToString:@"com.apple.springboard"])
    {
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28B50] mainBundle];
      v14 = [v13 bundleIdentifier];
      char v15 = [v14 isEqualToString:@"com.apple.MediaRemoteUI"];

      if ((v15 & 1) == 0) {
        v9->_shouldObserveRoutingContextUIDChanges = a4;
      }
    }
    if (v9->_shouldObserveRoutingContextUIDChanges)
    {
      v16 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = [(MPMediaControls *)v9 configuration];
        id v18 = [v17 presentingAppBundleID];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v18;
        _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_INFO, "Started observing routing context UID changes for app bundle: %{public}@", buf, 0xCu);
      }
      __int16 v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v9 selector:sel__audioSessionRoutingContextDidChangeNotification name:*MEMORY[0x1E4F15180] object:0];
    }
  }

  return v9;
}

- (MPMediaControls)initWithRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(MPMediaControls *)self _MPRouteSharingPolicyToAVRouteSharingPolicy:a3];
  id v8 = objc_alloc_init(MPMediaControlsConfiguration);
  id v9 = [MEMORY[0x1E4F28B50] mainBundle];
  id v10 = [v9 bundleIdentifier];
  [(MPMediaControlsConfiguration *)v8 setPresentingAppBundleID:v10];

  [(MPMediaControlsConfiguration *)v8 setRoutingContextUID:v6];
  [(MPMediaControlsConfiguration *)v8 setStyle:[(MPMediaControls *)self _mediaControlsStyleForRouteSharingPolicy:v7]];
  double v11 = [(MPMediaControls *)self initWithConfiguration:v8 shouldObserveRoutingContextUIDChanges:0];

  return v11;
}

- (MPMediaControls)initWithConfiguration:(id)a3
{
  return [(MPMediaControls *)self initWithConfiguration:a3 shouldObserveRoutingContextUIDChanges:1];
}

- (MPMediaControls)init
{
  objc_super v3 = objc_alloc_init(MPMediaControlsConfiguration);
  double v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];
  [(MPMediaControlsConfiguration *)v3 setPresentingAppBundleID:v5];

  id v6 = [MEMORY[0x1E4F28F80] processInfo];
  -[MPMediaControlsConfiguration setPresentingAppProcessIdentifier:](v3, "setPresentingAppProcessIdentifier:", [v6 processIdentifier]);

  unint64_t v7 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v8 = [v7 routingContextUID];
  [(MPMediaControlsConfiguration *)v3 setRoutingContextUID:v8];

  -[MPMediaControlsConfiguration setStyle:](v3, "setStyle:", -[MPMediaControls _mediaControlsStyleForRouteSharingPolicy:](self, "_mediaControlsStyleForRouteSharingPolicy:", [v7 routeSharingPolicy]));
  id v9 = [(MPMediaControls *)self initWithConfiguration:v3 shouldObserveRoutingContextUIDChanges:1];

  return v9;
}

@end