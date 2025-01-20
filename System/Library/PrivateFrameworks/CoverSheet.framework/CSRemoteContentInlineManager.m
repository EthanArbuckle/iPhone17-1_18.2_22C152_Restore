@interface CSRemoteContentInlineManager
- (BOOL)isInlineRemoteContentHidden;
- (BOOL)isInlineRemoteContentVisible;
- (CSRemoteContentInlineManager)initWithItemDestination:(id)a3;
- (CSRemoteContentInlineProviding)remoteContentInlineProvider;
- (void)_presentInlineRemoteContent:(id)a3 animatePresentation:(BOOL)a4 retryOnFailure:(BOOL)a5;
- (void)dealloc;
- (void)presentInlineRemoteContent:(id)a3 animatePresentation:(BOOL)a4;
- (void)removeInlineRemoteContentWithAnimatedDismissal:(BOOL)a3;
- (void)setInlineRemoteContentHidden:(BOOL)a3;
- (void)setRemoteContentInlineProvider:(id)a3;
@end

@implementation CSRemoteContentInlineManager

- (CSRemoteContentInlineManager)initWithItemDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSRemoteContentInlineManager;
  v6 = [(CSRemoteContentInlineManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemDestination, a3);
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);
  [WeakRetained removeRemoteContentInlineProvidingManager:self];

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentInlineManager;
  [(CSRemoteContentInlineManager *)&v4 dealloc];
}

- (void)setRemoteContentInlineProvider:(id)a3
{
  p_remoteContentInlineProvider = &self->_remoteContentInlineProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_remoteContentInlineProvider, v5);
  [v5 addRemoteContentInlineProvidingManager:self];
}

- (BOOL)isInlineRemoteContentVisible
{
  return self->_remoteInlineViewController && !self->_inlineRemoteContentHidden;
}

- (void)presentInlineRemoteContent:(id)a3 animatePresentation:(BOOL)a4
{
}

- (void)_presentInlineRemoteContent:(id)a3 animatePresentation:(BOOL)a4 retryOnFailure:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (self->_item)
  {
    v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Already had remote item; dismissing before adding",
        buf,
        0xCu);
    }

    [(CSRemoteContentInlineManager *)self removeInlineRemoteContentWithAnimatedDismissal:0];
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __95__CSRemoteContentInlineManager__presentInlineRemoteContent_animatePresentation_retryOnFailure___block_invoke;
      block[3] = &unk_1E6AD88C0;
      block[4] = self;
      id v19 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_remoteInlineViewController, a3);
    self->_inlineRemoteContentHidden = 0;
    v11 = [CSAdjunctListItem alloc];
    v12 = NSString;
    v13 = [MEMORY[0x1E4F29128] UUID];
    v14 = [v13 UUIDString];
    v15 = [v12 stringWithFormat:@"%@ - %@", @"remote content inline identifier", v14];
    v16 = [(CSAdjunctListItem *)v11 initWithIdentifier:v15];
    item = self->_item;
    self->_item = v16;

    [(CSAdjunctListItem *)self->_item setAnimatePresentation:v6];
    [(CSAdjunctListItem *)self->_item setContentHost:v9];
    [(CSItemDestination *)self->_itemDestination addOrUpdateItem:self->_item];
  }
}

uint64_t __95__CSRemoteContentInlineManager__presentInlineRemoteContent_animatePresentation_retryOnFailure___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentInlineRemoteContent:*(void *)(a1 + 40) animatePresentation:0 retryOnFailure:0];
}

- (void)removeInlineRemoteContentWithAnimatedDismissal:(BOOL)a3
{
  item = self->_item;
  if (item)
  {
    [(CSAdjunctListItem *)item setAnimateDismissal:a3];
    itemDestination = self->_itemDestination;
    BOOL v6 = [(CSAdjunctListItem *)self->_item identifier];
    [(CSItemDestination *)itemDestination removeItemForIdentifier:v6];
  }
  remoteInlineViewController = self->_remoteInlineViewController;
  self->_remoteInlineViewController = 0;

  v8 = self->_item;
  self->_item = 0;
}

- (void)setInlineRemoteContentHidden:(BOOL)a3
{
  if (self->_inlineRemoteContentHidden != a3)
  {
    BOOL v3 = a3;
    self->_inlineRemoteContentHidden = a3;
    objc_super v4 = [(CSAdjunctListItem *)self->_item itemView];
    id v6 = v4;
    double v5 = 1.0;
    if (v3) {
      double v5 = 0.0;
    }
    [v4 setAlpha:v5];
  }
}

- (BOOL)isInlineRemoteContentHidden
{
  return self->_inlineRemoteContentHidden && self->_remoteInlineViewController != 0;
}

- (CSRemoteContentInlineProviding)remoteContentInlineProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);

  return (CSRemoteContentInlineProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteContentInlineProvider);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_remoteInlineViewController, 0);

  objc_storeStrong((id *)&self->_itemDestination, 0);
}

@end