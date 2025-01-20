@interface PHCarPlaySceneDelegate
- (PHCarPlayRootContainerViewController)rootViewController;
- (TUHardwareControlsBroadcaster)hardwareControlsBroadcaster;
- (UIWindow)carPlayWindow;
- (id)instantiateRootViewController;
- (void)attachCarPlayToWindowScene:(id)a3;
- (void)detachCarPlay;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setCarPlayWindow:(id)a3;
- (void)setHardwareControlsBroadcaster:(id)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation PHCarPlaySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = PHDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CarPlay scene did connect to session: %@ options: %@", (uint8_t *)&v16, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PHCarPlaySceneDelegate *)self attachCarPlayToWindowScene:v8];
  }
  else
  {
    v12 = PHDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PHCarPlaySceneDelegate scene:willConnectToSession:options:]((uint64_t)v8, v12);
    }
  }
  v13 = [v10 URLContexts];
  id v14 = [v13 count];

  if (v14)
  {
    v15 = [v10 URLContexts];
    [(PHCarPlaySceneDelegate *)self scene:v8 openURLContexts:v15];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CarPlay scene did disconnect", v5, 2u);
  }

  [(PHCarPlaySceneDelegate *)self detachCarPlay];
}

- (void)attachCarPlayToWindowScene:(id)a3
{
  id v4 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to attach CarPlay to scene %@", (uint8_t *)&v12, 0xCu);
  }

  v6 = [(PHCarPlaySceneDelegate *)self carPlayWindow];

  if (!v6)
  {
    id v7 = [objc_alloc((Class)UIWindow) initWithWindowScene:v4];
    id v8 = [(PHCarPlaySceneDelegate *)self instantiateRootViewController];
    [(PHCarPlaySceneDelegate *)self setRootViewController:v8];

    id v9 = [(PHCarPlaySceneDelegate *)self rootViewController];
    [v7 setRootViewController:v9];

    [(PHCarPlaySceneDelegate *)self setCarPlayWindow:v7];
    id v10 = objc_alloc_init((Class)TUHardwareControlsBroadcaster);
    [(PHCarPlaySceneDelegate *)self setHardwareControlsBroadcaster:v10];
  }
  v11 = [(PHCarPlaySceneDelegate *)self carPlayWindow];
  [v11 makeKeyAndVisible];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCarPlaySceneDelegate openURLContexts: %@", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = [(PHCarPlaySceneDelegate *)self rootViewController];
        id v14 = [v13 mainMenuContainerViewController];
        v15 = [v12 URL];
        [v14 handleURL:v15];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)detachCarPlay
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHCarPlaySceneDelegate *)self carPlayWindow];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Detaching CarPlay window %@", (uint8_t *)&v5, 0xCu);
  }
  [(PHCarPlaySceneDelegate *)self setCarPlayWindow:0];
  [(PHCarPlaySceneDelegate *)self setHardwareControlsBroadcaster:0];
}

- (id)instantiateRootViewController
{
  v2 = objc_alloc_init(PHCarPlayRootContainerViewController);

  return v2;
}

- (UIWindow)carPlayWindow
{
  return self->_carPlayWindow;
}

- (void)setCarPlayWindow:(id)a3
{
}

- (PHCarPlayRootContainerViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (TUHardwareControlsBroadcaster)hardwareControlsBroadcaster
{
  return self->_hardwareControlsBroadcaster;
}

- (void)setHardwareControlsBroadcaster:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareControlsBroadcaster, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_carPlayWindow, 0);
}

- (void)scene:(uint64_t)a1 willConnectToSession:(NSObject *)a2 options:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type for CarPlay scene: %@", (uint8_t *)&v2, 0xCu);
}

@end