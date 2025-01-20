@interface _SFSafariViewControllerPrewarmingSession
+ (_SFSafariViewControllerPrewarmingSession)sharedSession;
+ (_SFSafariViewControllerPrewarmingSession)sharedSessionIfExists;
+ (id)_sharedSessionCreateIfNeeded:(BOOL)a3;
- (BOOL)_hasValidTokens;
- (SFBrowserRemoteViewController)remoteViewController;
- (_SFSafariViewControllerPrewarmingSession)init;
- (id)_validTokens;
- (id)prewarmConnectionsToURLs:(id)a3;
- (void)_connectToService;
- (void)_disconnectFromService;
- (void)_resume;
- (void)_suspend;
- (void)dealloc;
- (void)remoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)restart;
- (void)serviceProxyWillQueueInvocation:(id)a3;
- (void)tokenWithIDDidInvalidate:(unint64_t)a3;
@end

@implementation _SFSafariViewControllerPrewarmingSession

+ (id)_sharedSessionCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedSessionCreateIfNeeded__onceToken != -1) {
    dispatch_once(&_sharedSessionCreateIfNeeded__onceToken, &__block_literal_global_26);
  }
  v3 = (void *)_sharedSessionCreateIfNeeded__sharedSession;

  return v3;
}

+ (_SFSafariViewControllerPrewarmingSession)sharedSession
{
  return (_SFSafariViewControllerPrewarmingSession *)[a1 _sharedSessionCreateIfNeeded:1];
}

+ (_SFSafariViewControllerPrewarmingSession)sharedSessionIfExists
{
  return (_SFSafariViewControllerPrewarmingSession *)[a1 _sharedSessionCreateIfNeeded:0];
}

- (_SFSafariViewControllerPrewarmingSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)_SFSafariViewControllerPrewarmingSession;
  v2 = [(_SFSafariViewControllerPrewarmingSession *)&v10 init];
  if (v2)
  {
    v3 = [[SFQueueingServiceViewControllerProxy alloc] initWithProtocol:&unk_1EFC3D740];
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = (SFServiceViewControllerProtocol *)v3;

    [(SFServiceViewControllerProtocol *)v2->_serviceProxy setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    tokens = v2->_tokens;
    v2->_tokens = (NSHashTable *)v5;

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__suspend name:*MEMORY[0x1E4FB2640] object:0];
    [v7 addObserver:v2 selector:sel__resume name:*MEMORY[0x1E4FB2730] object:0];
    v8 = v2;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_SFSafariViewControllerPrewarmingSession;
  [(_SFSafariViewControllerPrewarmingSession *)&v4 dealloc];
}

- (id)prewarmConnectionsToURLs:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  v6 = [SFSafariViewControllerPrewarmingToken alloc];
  if (v5)
  {
    v7 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];
    v8 = [(SFSafariViewControllerPrewarmingToken *)v6 initWithURLs:v7];

    [(NSHashTable *)self->_tokens addObject:v8];
    if (!self->_suspended)
    {
      if (!self->_remoteViewController && !self->_cancelViewServiceRequest) {
        [(_SFSafariViewControllerPrewarmingSession *)self _connectToService];
      }
      serviceProxy = self->_serviceProxy;
      v13[0] = v8;
      objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [(SFServiceViewControllerProtocol *)serviceProxy requestPrewarmingWithTokens:v10];
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v8 = [(SFSafariViewControllerPrewarmingToken *)v6 initWithURLs:v11];
  }

  return v8;
}

- (void)tokenWithIDDidInvalidate:(unint64_t)a3
{
  if (self->_remoteViewController) {
    [(SFServiceViewControllerProtocol *)self->_serviceProxy invalidatePrewarmingTokenWithID:a3];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___SFSafariViewControllerPrewarmingSession_tokenWithIDDidInvalidate___block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)restart
{
  [(_SFSafariViewControllerPrewarmingSession *)self _suspend];

  [(_SFSafariViewControllerPrewarmingSession *)self _resume];
}

- (void)_suspend
{
  v3 = WBS_LOG_CHANNEL_PREFIXPrewarming();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Suspending", v4, 2u);
  }
  self->_suspended = 1;
  [(_SFSafariViewControllerPrewarmingSession *)self _disconnectFromService];
}

- (void)_resume
{
  v3 = WBS_LOG_CHANNEL_PREFIXPrewarming();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1A690B000, v3, OS_LOG_TYPE_INFO, "Resuming", v5, 2u);
  }
  self->_suspended = 0;
  id v4 = [(_SFSafariViewControllerPrewarmingSession *)self _validTokens];
  if ([v4 count])
  {
    [(_SFSafariViewControllerPrewarmingSession *)self _connectToService];
    [(SFServiceViewControllerProtocol *)self->_serviceProxy requestPrewarmingWithTokens:v4];
  }
}

- (BOOL)_hasValidTokens
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_tokens;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isValid", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_validTokens
{
  v2 = [(NSHashTable *)self->_tokens allObjects];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_103);

  return v3;
}

- (void)_disconnectFromService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = 0;

  [(SFServiceViewControllerProtocol *)self->_serviceProxy setTarget:0];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;
}

- (void)_connectToService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke;
  v8[3] = &unk_1E5C751F0;
  v8[4] = self;
  uint64_t v4 = +[SFBrowserRemoteViewController requestViewControllerWithConnectionHandler:v8];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;

  serviceProxy = self->_serviceProxy;
  long long v7 = objc_alloc_init(SFSafariViewControllerConfiguration);
  [(SFServiceViewControllerProtocol *)serviceProxy setConfiguration:v7];
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest) {
    [(_SFSafariViewControllerPrewarmingSession *)self _connectToService];
  }
}

- (void)remoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  v6 = (SFBrowserRemoteViewController *)a3;
  id v7 = a4;
  if (self->_remoteViewController == v6)
  {
    objc_initWeak(&location, self);
    [(_SFSafariViewControllerPrewarmingSession *)self _suspend];
    dispatch_time_t v8 = dispatch_time(0, 1500000000);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98___SFSafariViewControllerPrewarmingSession_remoteViewController_viewServiceDidTerminateWithError___block_invoke;
    v9[3] = &unk_1E5C725B8;
    objc_copyWeak(&v10, &location);
    dispatch_after(v8, MEMORY[0x1E4F14428], v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (SFBrowserRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end