@interface MKPlaceCardRemoteUIHostViewController
- (MKPlaceCardContentSizeDelegate)placeCardContentSizeDelegate;
- (MKPlaceCardRemoteUIHostViewController)initWithSceneIdentifier:(id)a3 remoteObjectInterface:(id)a4 placeholderView:(id)a5;
- (int64_t)_mapkit_userInterfaceStyle;
- (void)_configureConnection:(id)a3;
- (void)_resolvePreferredContentSizeIfNeeded;
- (void)_startSession;
- (void)dealloc;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)setPlaceCardContentSizeDelegate:(id)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MKPlaceCardRemoteUIHostViewController

- (MKPlaceCardRemoteUIHostViewController)initWithSceneIdentifier:(id)a3 remoteObjectInterface:(id)a4 placeholderView:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MKPlaceCardRemoteUIHostViewController;
  v12 = [(_EXHostViewController *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v13->_remoteObjectInterface, a4);
    [(_EXHostViewController *)v13 setDelegate:v13];
    [(_EXHostViewController *)v13 setPlaceholderView:v11];
    v18[0] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v15 = (id)[(MKPlaceCardRemoteUIHostViewController *)v13 registerForTraitChanges:v14 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    [(MKPlaceCardRemoteUIHostViewController *)v13 _startSession];
  }

  return v13;
}

- (void)dealloc
{
  [(_EXHostViewController *)self setSession:0];
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceCardRemoteUIHostViewController;
  [(_EXHostViewController *)&v3 dealloc];
}

- (void)_startSession
{
  objc_super v3 = [MEMORY[0x1E4F25858] mkRemoteUIIdentity];
  if (v3)
  {
    objc_initWeak(location, self);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F25870]) initWithExtensionIdentity:v3];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F258B8]) initWithSceneIdentifier:self->_sceneIdentifier];
    [v5 setInvalidationHandler:&__block_literal_global_70];
    v6 = (void *)MEMORY[0x1E4F258B0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__MKPlaceCardRemoteUIHostViewController__startSession__block_invoke_10;
    v8[3] = &unk_1E54BC390;
    objc_copyWeak(&v9, location);
    [v6 sessionWithProcessConfiguration:v4 configuration:v5 completion:v8];
    objc_destroyWeak(&v9);

    objc_destroyWeak(location);
  }
  else
  {
    v7 = MKGetMKRemoteUILog_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_ERROR, "host connection identity crisis", (uint8_t *)location, 2u);
    }
  }
}

void __54__MKPlaceCardRemoteUIHostViewController__startSession__block_invoke()
{
  v0 = MKGetMKRemoteUILog_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18BAEC000, v0, OS_LOG_TYPE_INFO, "host connection session invalidated", v1, 2u);
  }
}

void __54__MKPlaceCardRemoteUIHostViewController__startSession__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 133, a2);
    id v13 = 0;
    v7 = [v4 _makeXPCConnectionWithError:&v13];
    id v8 = v13;
    id v9 = v8;
    if (!v7 || v8)
    {
      v12 = MKGetMKRemoteUILog_0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v9;
        _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "host connection error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      [v7 setRemoteObjectInterface:v6[131]];
      objc_storeStrong(v6 + 134, v7);
      id v10 = MKGetMKRemoteUILog_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_DEBUG, "host connection resume", buf, 2u);
      }

      [v7 resume];
      id v11 = MKGetMKRemoteUILog_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_INFO, "host connection _configureConnection", buf, 2u);
      }

      [v6 _configureConnection:v7];
      [v6 _resolvePreferredContentSizeIfNeeded];
    }
  }
}

- (void)_resolvePreferredContentSizeIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_preferredWidth > 0.0 && self->_connection)
  {
    objc_super v3 = MKGetMKRemoteUILog_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      double preferredWidth = self->_preferredWidth;
      *(_DWORD *)buf = 134217984;
      double v10 = preferredWidth;
      _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "host connection resolve preferred content size %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v5 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    double v6 = self->_preferredWidth;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke;
    v7[3] = &unk_1E54BC3B8;
    objc_copyWeak(&v8, (id *)buf);
    [v5 fetchPreferredContentSizeForWidth:v7 completionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v6 = MKGetMKRemoteUILog_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&a2, *(void *)&a3];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "host connection content size completion %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke_12;
  block[3] = &unk_1E54B89E8;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)&a2;
  v9[2] = *(id *)&a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v9);
}

void __77__MKPlaceCardRemoteUIHostViewController__resolvePreferredContentSizeIfNeeded__block_invoke_12(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained placeCardContentSizeDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [v3 placeCardContentSizeDelegate];
      objc_msgSend(v6, "placeCardPreferredContentSizeDidChange:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
    v7 = MKGetMKRemoteUILog_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "host set session", v8, 2u);
    }

    [v3 setSession:v3[133]];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MKPlaceCardRemoteUIHostViewController;
  [(MKPlaceCardRemoteUIHostViewController *)&v10 viewDidAppear:a3];
  id v4 = MKGetMKRemoteUILog_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    char v5 = [(MKPlaceCardRemoteUIHostViewController *)self view];
    [v5 bounds];
    id v8 = [NSString stringWithFormat:@"{%.1f, %.1f}", v6, v7];
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v8;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "host view did appear %@", buf, 0xCu);
  }
  id v9 = [(MKPlaceCardRemoteUIHostViewController *)self view];
  [v9 bounds];
  self->_double preferredWidth = CGRectGetWidth(v14);

  [(MKPlaceCardRemoteUIHostViewController *)self _resolvePreferredContentSizeIfNeeded];
}

- (void)hostViewControllerDidActivate:(id)a3
{
  objc_super v3 = MKGetMKRemoteUILog_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18BAEC000, v3, OS_LOG_TYPE_DEBUG, "host VC did activate", v4, 2u);
  }
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  char v5 = MKGetMKRemoteUILog_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_DEBUG, "host connection invalidate: VC will deactivate", v7, 2u);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_configureConnection:(id)a3
{
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v13 = a3;
  uint64_t v6 = [a4 userInterfaceStyle];
  uint64_t v7 = [(MKPlaceCardRemoteUIHostViewController *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v6 != v8)
  {
    id v9 = [v13 traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    if (v10 == 2) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2 * (v10 != 1);
    }
    uint64_t v12 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v12 updateInterfaceStyle:v11];
  }
}

- (int64_t)_mapkit_userInterfaceStyle
{
  v2 = [(MKPlaceCardRemoteUIHostViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    return 1;
  }
  else {
    return 2 * (v3 != 1);
  }
}

- (MKPlaceCardContentSizeDelegate)placeCardContentSizeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCardContentSizeDelegate);

  return (MKPlaceCardContentSizeDelegate *)WeakRetained;
}

- (void)setPlaceCardContentSizeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeCardContentSizeDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);

  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end