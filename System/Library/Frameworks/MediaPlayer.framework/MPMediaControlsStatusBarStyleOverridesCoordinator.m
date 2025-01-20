@interface MPMediaControlsStatusBarStyleOverridesCoordinator
- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5;
- (MPMediaControlsStatusBarStyleOverridesCoordinator)init;
- (void)presentMediaControls;
- (void)presentMediaControlsWithCompletion:(id)a3;
@end

@implementation MPMediaControlsStatusBarStyleOverridesCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_statusBarStyleOverride, 0);
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  return 1;
}

- (void)presentMediaControlsWithCompletion:(id)a3
{
  id v4 = a3;
  if (MRAVOutputContextGetSharedAudioPresentationContext()) {
    v5 = (void *)MRAVOutputContextCopyUniqueIdentifier();
  }
  else {
    v5 = 0;
  }
  v6 = objc_alloc_init(MPMediaControlsConfiguration);
  [(MPMediaControlsConfiguration *)v6 setRoutingContextUID:v5];
  [(MPMediaControlsConfiguration *)v6 setStyle:6];
  [(MPMediaControlsConfiguration *)v6 setAllowsNowPlayingApplicationLaunch:1];
  v7 = [[MPMediaControls alloc] initWithConfiguration:v6];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v7;

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __88__MPMediaControlsStatusBarStyleOverridesCoordinator_presentMediaControlsWithCompletion___block_invoke;
  v14 = &unk_1E57F9140;
  v15 = self;
  id v16 = v4;
  v9 = self->_mediaControls;
  id v10 = v4;
  [(MPMediaControls *)v9 setDismissHandler:&v11];
  [(MPMediaControls *)self->_mediaControls present];
}

uint64_t __88__MPMediaControlsStatusBarStyleOverridesCoordinator_presentMediaControlsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)presentMediaControls
{
}

- (MPMediaControlsStatusBarStyleOverridesCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPMediaControlsStatusBarStyleOverridesCoordinator;
  uint64_t v2 = [(MPMediaControlsStatusBarStyleOverridesCoordinator *)&v6 init];
  if (v2)
  {
    v3 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init(MEMORY[0x1E4FA6C18]);
    coordinator = v2->_coordinator;
    v2->_coordinator = v3;

    [(SBSStatusBarStyleOverridesCoordinator *)v2->_coordinator setDelegate:v2];
    [(SBSStatusBarStyleOverridesCoordinator *)v2->_coordinator setRegisteredStyleOverrides:12582912 reply:&__block_literal_global_6366];
  }
  return v2;
}

void __57__MPMediaControlsStatusBarStyleOverridesCoordinator_init__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "Could not register tap handler for status bar override", v3, 2u);
    }
  }
}

@end