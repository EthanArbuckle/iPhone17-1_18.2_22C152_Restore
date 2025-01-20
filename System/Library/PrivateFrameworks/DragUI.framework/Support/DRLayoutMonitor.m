@interface DRLayoutMonitor
- (BOOL)containsSceneIdentifier:(id)a3;
- (DRLayoutMonitor)initWithDisplayIdentity:(id)a3;
- (FBSDisplayIdentity)displayIdentity;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSSet)sceneIdentifiers;
- (void)dealloc;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setSceneIdentifiers:(id)a3;
- (void)updateSceneIdentifiersWithLayout:(id)a3;
@end

@implementation DRLayoutMonitor

- (DRLayoutMonitor)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DRLayoutMonitor;
  v6 = [(DRLayoutMonitor *)&v19 init];
  if (v6)
  {
    if ([v5 isMainDisplay])
    {
      v7 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    }
    else
    {
      v8 = SBSCreateLayoutServiceEndpointForExternalDisplay();
      v7 = +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:v8];
    }
    objc_initWeak(&location, v6);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100011B7C;
    v16 = &unk_100054ED0;
    objc_copyWeak(&v17, &location);
    [v7 setTransitionHandler:&v13];
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v7, v13, v14, v15, v16);
    displayLayoutMonitor = v6->_displayLayoutMonitor;
    v6->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v9;

    objc_storeStrong((id *)&v6->_displayIdentity, a3);
    v11 = [(FBSDisplayLayoutMonitor *)v6->_displayLayoutMonitor currentLayout];
    [(DRLayoutMonitor *)v6 updateSceneIdentifiersWithLayout:v11];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (BOOL)containsSceneIdentifier:(id)a3
{
  v3 = self;
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = [(NSSet *)v3->_sceneIdentifiers containsObject:v5];

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (void)updateSceneIdentifiersWithLayout:(id)a3
{
  id v4 = a3;
  id v5 = [v4 elements];
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v5 count]);
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = objc_msgSend(v4, "elements", 0);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) identifier];
        [(NSSet *)v6 addObject:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_lock(&self->_lock);
  sceneIdentifiers = self->_sceneIdentifiers;
  self->_sceneIdentifiers = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DRLayoutMonitor;
  [(DRLayoutMonitor *)&v3 dealloc];
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (NSSet)sceneIdentifiers
{
  return self->_sceneIdentifiers;
}

- (void)setSceneIdentifiers:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end