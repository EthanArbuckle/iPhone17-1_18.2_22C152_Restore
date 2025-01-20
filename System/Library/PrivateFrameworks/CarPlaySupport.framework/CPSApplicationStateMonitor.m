@interface CPSApplicationStateMonitor
- (BOOL)_sceneIsForeground:(id)a3;
- (BOOL)canPostManeuverNotification;
- (BOOL)canPostNavigationAlertNotification;
- (BOOL)isApplicationActive;
- (BOOL)templateApplicationSceneIsActive;
- (CARObserverHashTable)stateObservers;
- (CPSApplicationStateMonitor)init;
- (NSString)bundleIdentifier;
- (UIWindowScene)windowSceneForGuidanceWidgetScene;
- (UIWindowScene)windowSceneForMapWidgetScene;
- (UIWindowScene)windowSceneForTemplateApplicationScene;
- (void)_notifyObserversForeground:(BOOL)a3;
- (void)_observeScene:(id)a3;
- (void)_sceneActivated:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)addApplicationStateObserver:(id)a3;
- (void)dealloc;
- (void)removeApplicationStateObserver:(id)a3;
- (void)setStateObservers:(id)a3;
- (void)setWindowSceneForGuidanceWidgetScene:(id)a3;
- (void)setWindowSceneForMapWidgetScene:(id)a3;
- (void)setWindowSceneForTemplateApplicationScene:(id)a3;
@end

@implementation CPSApplicationStateMonitor

- (CPSApplicationStateMonitor)init
{
  SEL v11 = a2;
  v12 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CPSApplicationStateMonitor;
  v9 = [(CPSApplicationStateMonitor *)&v10 init];
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.carplaysupport.observerqueue", 0);
    stateObserverQueue = v12->_stateObserverQueue;
    v12->_stateObserverQueue = (OS_dispatch_queue *)v2;

    id v4 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v5 = [v4 initWithProtocol:&unk_26DF50158 callbackQueue:v12->_stateObserverQueue];
    stateObservers = v12->_stateObservers;
    v12->_stateObservers = (CARObserverHashTable *)v5;
  }
  v8 = v12;
  objc_storeStrong((id *)&v12, 0);
  return v8;
}

- (void)_observeScene:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:v7 selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x263F1D590] object:location[0]];

  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:v7 selector:sel__sceneActivated_ name:*MEMORY[0x263F1D568] object:location[0]];

  id v5 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:v7 selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x263F1D578] object:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForGuidanceWidgetScene:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_windowSceneForGuidanceWidgetScene);
  BOOL v6 = WeakRetained == location[0];

  if (!v6)
  {
    objc_storeWeak((id *)&v8->_windowSceneForGuidanceWidgetScene, location[0]);
    id v4 = v8;
    id v5 = objc_loadWeakRetained((id *)&v8->_windowSceneForGuidanceWidgetScene);
    -[CPSApplicationStateMonitor _observeScene:](v4, "_observeScene:");
  }
  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForMapWidgetScene:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_windowSceneForMapWidgetScene);
  BOOL v6 = WeakRetained == location[0];

  if (!v6)
  {
    objc_storeWeak((id *)&v8->_windowSceneForMapWidgetScene, location[0]);
    id v4 = v8;
    id v5 = objc_loadWeakRetained((id *)&v8->_windowSceneForMapWidgetScene);
    -[CPSApplicationStateMonitor _observeScene:](v4, "_observeScene:");
  }
  objc_storeStrong(location, 0);
}

- (void)setWindowSceneForTemplateApplicationScene:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_windowSceneForTemplateApplicationScene);
  BOOL v6 = WeakRetained == location[0];

  if (!v6)
  {
    objc_storeWeak((id *)&v8->_windowSceneForTemplateApplicationScene, location[0]);
    id v4 = v8;
    id v5 = objc_loadWeakRetained((id *)&v8->_windowSceneForTemplateApplicationScene);
    -[CPSApplicationStateMonitor _observeScene:](v4, "_observeScene:");
  }
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)CPSApplicationStateMonitor;
  [(CPSApplicationStateMonitor *)&v3 dealloc];
}

- (void)addApplicationStateObserver:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CARObserverHashTable *)v4->_stateObservers addObserver:location[0]];
  objc_storeStrong(location, 0);
}

- (void)removeApplicationStateObserver:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CARObserverHashTable *)v4->_stateObservers removeObserver:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)isApplicationActive
{
  SEL v4 = [(CPSApplicationStateMonitor *)self windowSceneForTemplateApplicationScene];
  BOOL v5 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  BOOL v6 = [(CPSApplicationStateMonitor *)self windowSceneForGuidanceWidgetScene];
  BOOL v7 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  v8 = [(CPSApplicationStateMonitor *)self windowSceneForMapWidgetScene];
  BOOL v9 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  char v10 = 1;
  if (!v5)
  {
    char v10 = 1;
    if (!v7) {
      char v10 = v9;
    }
  }
  return v10 & 1;
}

- (BOOL)_sceneIsForeground:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    BOOL v4 = 1;
    if ([location[0] activationState]) {
      BOOL v4 = [location[0] activationState] == 1;
    }
    BOOL v6 = v4;
  }
  else
  {
    BOOL v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)canPostManeuverNotification
{
  return ![(CPSApplicationStateMonitor *)self isApplicationActive];
}

- (BOOL)canPostNavigationAlertNotification
{
  BOOL v4 = [(CPSApplicationStateMonitor *)self windowSceneForTemplateApplicationScene];
  int v5 = !-[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");

  return v5 & 1;
}

- (BOOL)templateApplicationSceneIsActive
{
  BOOL v4 = [(CPSApplicationStateMonitor *)self windowSceneForTemplateApplicationScene];
  char v5 = 0;
  if (v4)
  {
    BOOL v6 = [(CPSApplicationStateMonitor *)self windowSceneForTemplateApplicationScene];
    char v5 = 1;
    int v3 = -[CPSApplicationStateMonitor _sceneIsForeground:](self, "_sceneIsForeground:");
  }
  else
  {
    int v3 = 0;
  }
  if (v5) {

  }
  return v3 != 0;
}

- (void)_notifyObserversForeground:(BOOL)a3
{
}

- (void)_sceneWillEnterForeground:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSApplicationStateMonitor *)v4 _notifyObserversForeground:[(CPSApplicationStateMonitor *)v4 isApplicationActive]];
  objc_storeStrong(location, 0);
}

- (void)_sceneActivated:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSApplicationStateMonitor *)v4 _notifyObserversForeground:[(CPSApplicationStateMonitor *)v4 isApplicationActive]];
  objc_storeStrong(location, 0);
}

- (void)_sceneDidEnterBackground:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSApplicationStateMonitor *)v4 _notifyObserversForeground:[(CPSApplicationStateMonitor *)v4 isApplicationActive]];
  objc_storeStrong(location, 0);
}

- (UIWindowScene)windowSceneForTemplateApplicationScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForTemplateApplicationScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIWindowScene)windowSceneForMapWidgetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForMapWidgetScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIWindowScene)windowSceneForGuidanceWidgetScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneForGuidanceWidgetScene);

  return (UIWindowScene *)WeakRetained;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CARObserverHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end