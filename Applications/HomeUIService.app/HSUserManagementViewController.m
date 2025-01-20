@interface HSUserManagementViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)didNotifyFinishLoading;
- (HMHome)home;
- (HMHomeManager)homeManager;
- (HSUserManagementViewController)initWithRootViewController:(id)a3;
- (NSUUID)homeUUID;
- (void)_notifyHostAndDismissWithError:(id)a3;
- (void)_notifyRemoteReadyToDisplayIfNeeded;
- (void)_updateHome;
- (void)_updateViewControllers;
- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4;
- (void)addPeopleViewControllerDidCancel:(id)a3;
- (void)controllerDidDismissWithError:(id)a3;
- (void)controllerDidSendInvitations:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setDidNotifyFinishLoading:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomeUUID:(id)a3;
@end

@implementation HSUserManagementViewController

- (HSUserManagementViewController)initWithRootViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HSUserManagementViewController;
  v3 = [(HSUserManagementViewController *)&v9 initWithRootViewController:a3];
  if (v3)
  {
    id v4 = objc_alloc((Class)HMHomeManager);
    v5 = +[HMHomeManagerConfiguration defaultPrivateConfiguration];
    v6 = (HMHomeManager *)[v4 initWithHomeMangerConfiguration:v5];
    homeManager = v3->_homeManager;
    v3->_homeManager = v6;

    [(HMHomeManager *)v3->_homeManager setDelegate:v3];
    v3->_didNotifyFinishLoading = 0;
  }
  return v3;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface hm_userManagementRemoteHostInterface];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface hm_userManagementRemoteServiceInterface];
}

- (void)setHomeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_homeUUID, a3);

  [(HSUserManagementViewController *)self _updateHome];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
}

- (void)_updateHome
{
  uint64_t v3 = [(HSUserManagementViewController *)self homeUUID];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(HSUserManagementViewController *)self home];

    if (!v5)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v6 = [(HSUserManagementViewController *)self homeManager];
      v7 = [v6 homes];

      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            v13 = [v12 uuid];
            v14 = [(HSUserManagementViewController *)self homeUUID];
            unsigned int v15 = [v13 isEqual:v14];

            if (v15)
            {
              [(HSUserManagementViewController *)self setHome:v12];
              goto LABEL_13;
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }
  [(HSUserManagementViewController *)self _updateViewControllers];
  [(HSUserManagementViewController *)self _notifyRemoteReadyToDisplayIfNeeded];
}

- (void)_notifyRemoteReadyToDisplayIfNeeded
{
  uint64_t v3 = [(HSUserManagementViewController *)self home];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(HSUserManagementViewController *)self didNotifyFinishLoading];

    if ((v5 & 1) == 0)
    {
      v6 = [(HSUserManagementViewController *)self _remoteViewControllerProxy];
      [v6 userManagementDidLoad];

      [(HSUserManagementViewController *)self setDidNotifyFinishLoading:1];
    }
  }
}

- (void)_updateViewControllers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(HSUserManagementViewController *)self viewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&OBJC_PROTOCOL___HUUserManagementDelegate])
        {
          id v9 = v8;
          uint64_t v10 = [(HSUserManagementViewController *)self home];
          [v9 updateHome:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)addPeopleViewControllerDidCancel:(id)a3
{
}

- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4
{
  id v5 = [(HSUserManagementViewController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(HSUserManagementViewController *)self _notifyHostAndDismissWithError:0];
  }
}

- (void)controllerDidDismissWithError:(id)a3
{
}

- (void)controllerDidSendInvitations:(id)a3
{
  id v4 = [(HSUserManagementViewController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(HSUserManagementViewController *)self _notifyHostAndDismissWithError:0];
  }
}

- (void)_notifyHostAndDismissWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HSUserManagementViewController *)self _remoteViewControllerProxy];
  [v5 userManagementDidFinishWithError:v4];
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (BOOL)didNotifyFinishLoading
{
  return self->_didNotifyFinishLoading;
}

- (void)setDidNotifyFinishLoading:(BOOL)a3
{
  self->_didNotifyFinishLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end