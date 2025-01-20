@interface MPLibraryAddStatusObserver
- (ICUserIdentity)userIdentity;
- (MPLibraryAddStatusObserver)init;
- (MPLibraryAddStatusObserver)initWithUserIdentity:(id)a3;
- (MPLibraryAddStatusObserverConfiguration)configuration;
- (MPModelObject)identifyingModelObject;
- (id)statusBlock;
- (int64_t)_calculateCurrentStatus;
- (int64_t)currentStatus;
- (void)_allowsExplicitContentDidChangeNotification:(id)a3;
- (void)_cloudLibraryEnabledDidChangeNotification:(id)a3;
- (void)_subscriptionStatusDidChangeNotification:(id)a3;
- (void)_transientStateDidChangeNotification:(id)a3;
- (void)_updateCurrentStatus;
- (void)_updateInProgressDidChangeNotification:(id)a3;
- (void)configureWithModelObject:(id)a3;
- (void)dealloc;
- (void)setConfiguration:(MPLibraryAddStatusObserverConfiguration)a3 identifyingModelObject:(id)a4;
- (void)setStatusBlock:(id)a3;
@end

@implementation MPLibraryAddStatusObserver

- (MPLibraryAddStatusObserver)init
{
  v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  v4 = [(MPLibraryAddStatusObserver *)self initWithUserIdentity:v3];

  return v4;
}

- (MPLibraryAddStatusObserver)initWithUserIdentity:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPLibraryAddStatusObserver;
  v5 = [(MPLibraryAddStatusObserver *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    uint64_t v8 = +[MPCloudController controllerWithUserIdentity:v5->_userIdentity];
    cloudController = v5->_cloudController;
    v5->_cloudController = (MPCloudController *)v8;

    uint64_t v10 = +[MPCloudServiceStatusController cloudServiceStatusControllerWithUserIdentity:v5->_userIdentity];
    cloudServiceStatusController = v5->_cloudServiceStatusController;
    v5->_cloudServiceStatusController = (MPCloudServiceStatusController *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v13 = +[MPRestrictionsMonitor sharedRestrictionsMonitor];
    [v12 addObserver:v5 selector:sel__allowsExplicitContentDidChangeNotification_ name:@"MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification" object:v13];

    [v12 addObserver:v5 selector:sel__cloudLibraryEnabledDidChangeNotification_ name:@"MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification" object:v5->_cloudServiceStatusController];
    [v12 addObserver:v5 selector:sel__subscriptionStatusDidChangeNotification_ name:@"MPCloudServiceStatusControllerSubscriptionStatusDidChangeNotification" object:v5->_cloudServiceStatusController];
    [v12 addObserver:v5 selector:sel__updateInProgressDidChangeNotification_ name:@"MPCloudControllerIsUpdateInProgressDidChangeNotification" object:v5->_cloudController];
    v14 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
    [v12 addObserver:v5 selector:sel__transientStateDidChangeNotification_ name:@"MPModelLibraryTransientStateControllerDidChangeNotification" object:v14];
  }
  return v5;
}

- (void)setStatusBlock:(id)a3
{
  if (self->_statusBlock != a3)
  {
    id v4 = (void *)[a3 copy];
    id statusBlock = self->_statusBlock;
    self->_id statusBlock = v4;

    self->_needsStatusUpdate = 1;
  }
}

- (void)configureWithModelObject:(id)a3
{
  id v4 = a3;
  -[MPLibraryAddStatusObserver setConfiguration:identifyingModelObject:](self, "setConfiguration:identifyingModelObject:", [v4 libraryAddStatusObserverConfiguration] & 0xFFFFFFFFFFLL, v4);
}

- (void)setConfiguration:(MPLibraryAddStatusObserverConfiguration)a3 identifyingModelObject:(id)a4
{
  uint64_t v5 = *(void *)&a3.isValidContentType;
  v7 = (MPModelObject *)a4;
  unint64_t v8 = ((*(unsigned int *)&self->_configuration.isValidContentType | ((unint64_t)self->_configuration.isLibraryAddEligible << 32)) ^ v5) & 0x101010101;
  if (v8)
  {
    *(_DWORD *)&self->_configuration.isValidContentType = v5;
    self->_configuration.isLibraryAddEligible = BYTE4(v5);
  }
  identifyingModelObject = self->_identifyingModelObject;
  v11 = v7;
  if (identifyingModelObject != v7 && ![(MPModelObject *)identifyingModelObject isEqual:v7])
  {
    objc_storeStrong((id *)&self->_identifyingModelObject, a4);
    p_needsStatusUpdate = &self->_needsStatusUpdate;
    if (!self->_needsStatusUpdate) {
      goto LABEL_10;
    }
LABEL_9:
    BOOL *p_needsStatusUpdate = 0;
    goto LABEL_10;
  }
  p_needsStatusUpdate = &self->_needsStatusUpdate;
  if (self->_needsStatusUpdate) {
    goto LABEL_9;
  }
  if (v8) {
LABEL_10:
  }
    [(MPLibraryAddStatusObserver *)self _updateCurrentStatus];
}

- (void)_updateCurrentStatus
{
  int64_t v3 = [(MPLibraryAddStatusObserver *)self _calculateCurrentStatus];
  if (self->_currentStatus != v3)
  {
    self->_currentStatus = v3;
    id statusBlock = self->_statusBlock;
    if (statusBlock)
    {
      uint64_t v5 = (void (*)(void))*((void *)statusBlock + 2);
      v5();
    }
  }
}

- (int64_t)_calculateCurrentStatus
{
  if (!self->_identifyingModelObject) {
    goto LABEL_35;
  }
  int64_t v3 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
  int64_t v4 = [v3 transientAddStateForModelObject:self->_identifyingModelObject];

  if (v4 == 1) {
    return v4;
  }
  if (!v4)
  {
LABEL_35:
    if (self->_configuration.isLibraryAdded) {
      return 1;
    }
  }
  if (!self->_configuration.isValidContentType) {
    return 8;
  }
  if (!self->_configuration.isLibraryAddEligible) {
    return 7;
  }
  uint64_t v5 = +[MPRestrictionsMonitor sharedRestrictionsMonitor];
  char v6 = [v5 allowsExplicitContent];

  if ((v6 & 1) == 0 && !self->_configuration.hasCleanContent && self->_configuration.hasExplicitContent) {
    return 4;
  }
  v7 = self->_cloudController;
  if ([(MPCloudController *)v7 isUpdateInProgress]
    && [(MPCloudController *)v7 isInitialImport])
  {
    int64_t v4 = 6;
  }
  else
  {
    unint64_t v8 = self->_cloudServiceStatusController;
    v9 = [(MPCloudServiceStatusController *)v8 musicSubscriptionStatus];
    __int16 v10 = [v9 capabilities];

    if ((v10 & 0x101) != 0)
    {
      if ((v10 & 0x101) == 1)
      {
        int64_t v4 = 9;
      }
      else if ([(MPCloudServiceStatusController *)v8 isCloudLibraryEnabled])
      {
        if ((v6 & 1) == 0 && self->_configuration.hasExplicitContent && self->_configuration.hasCleanContent)
        {
          int64_t v4 = 3;
        }
        else if ((v10 & 0x200) != 0)
        {
          int64_t v4 = 2;
        }
        else
        {
          int64_t v4 = 10;
        }
      }
      else
      {
        int64_t v4 = 5;
      }
    }
    else
    {
      int64_t v4 = 10;
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_identifyingModelObject, 0);
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_cloudServiceStatusController, 0);

  objc_storeStrong((id *)&self->_cloudController, 0);
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MPModelObject)identifyingModelObject
{
  return self->_identifyingModelObject;
}

- (MPLibraryAddStatusObserverConfiguration)configuration
{
  return (MPLibraryAddStatusObserverConfiguration)(*(unsigned int *)&self->_configuration.isValidContentType | ((unint64_t)self->_configuration.isLibraryAddEligible << 32));
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)_updateInProgressDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MPLibraryAddStatusObserver__updateInProgressDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__MPLibraryAddStatusObserver__updateInProgressDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStatus];
}

- (void)_transientStateDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MPLibraryAddStatusObserver__transientStateDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__MPLibraryAddStatusObserver__transientStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStatus];
}

- (void)_subscriptionStatusDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MPLibraryAddStatusObserver__subscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__MPLibraryAddStatusObserver__subscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStatus];
}

- (void)_cloudLibraryEnabledDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__MPLibraryAddStatusObserver__cloudLibraryEnabledDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__MPLibraryAddStatusObserver__cloudLibraryEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStatus];
}

- (void)_allowsExplicitContentDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MPLibraryAddStatusObserver__allowsExplicitContentDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__MPLibraryAddStatusObserver__allowsExplicitContentDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStatus];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MPLibraryAddStatusObserver;
  [(MPLibraryAddStatusObserver *)&v2 dealloc];
}

@end