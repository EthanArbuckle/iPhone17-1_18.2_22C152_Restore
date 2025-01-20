@interface BNBannerSourceListenerPresentableViewController
- (BNBannerSourceListenerPresentableDelegate)delegate;
- (BNBannerSourceListenerPresentableViewController)initWithPresentable:(id)a3;
- (BNBannerSourceListenerPresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5;
- (BNPresentable)presentable;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isPresentableContextInterfaceAvailable;
- (BOOL)bannerSourcePresentableContext:(id)a3 isConnectingProcessAuthorized:(id)a4 error:(id *)a5;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isReady;
- (BOOL)isTouchOutsideDismissalEnabled;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (NSUUID)uniquePresentableIdentifier;
- (UIView)contentView;
- (id)_initWithPresentableIdentification:(id)a3 presentableBehavior:(int64_t)a4 contentBehavior:(int64_t)a5 serviceDomain:(id)a6 readyCompletion:(id)a7;
- (id)presentableDescription;
- (id)readyCompletion;
- (int)bannerAppearState;
- (int64_t)contentBehavior;
- (int64_t)presentableBehavior;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_setBannerAppearState:(int)a3 forPresentable:(id)a4 reason:(id)a5;
- (void)_setContentView:(id)a3;
- (void)_setReadyCompletion:(id)a3;
- (void)_setUserInteractionWillBegin:(BOOL)a3 forPresentable:(id)a4;
- (void)addPresentableObserver:(id)a3;
- (void)bannerSourcePresentableContextDraggingDismissalEnabledDidChange:(id)a3;
- (void)bannerSourcePresentableContextDraggingInteractionEnabledDidChange:(id)a3;
- (void)bannerSourcePresentableContextTouchOutsideDismissalEnabledDidChange:(id)a3;
- (void)dealloc;
- (void)handleTemplateContentEvent:(int64_t)a3;
- (void)invalidate;
- (void)loadView;
- (void)makeReadyIfPossible;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)removePresentableObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostNeedsUpdate;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidLoad;
@end

@implementation BNBannerSourceListenerPresentableViewController

- (id)_initWithPresentableIdentification:(id)a3 presentableBehavior:(int64_t)a4 contentBehavior:(int64_t)a5 serviceDomain:(id)a6 readyCompletion:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)BNBannerSourceListenerPresentableViewController;
  v16 = [(BNBannerSourceListenerPresentableViewController *)&v30 initWithNibName:0 bundle:0];
  if (v16)
  {
    if (!v13)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, v16, @"BNBannerSourceListenerPresentableViewController.m", 30, @"Invalid parameter not satisfying: %@", @"presentableIdentification" object file lineNumber description];
    }
    v17 = [v13 requesterIdentifier];
    uint64_t v18 = [v17 copy];
    requesterIdentifier = v16->_requesterIdentifier;
    v16->_requesterIdentifier = (NSString *)v18;

    v20 = [v13 requestIdentifier];
    uint64_t v21 = [v20 copy];
    requestIdentifier = v16->_requestIdentifier;
    v16->_requestIdentifier = (NSString *)v21;

    v23 = [v13 uniquePresentableIdentifier];
    uint64_t v24 = [v23 copy];
    uniquePresentableIdentifier = v16->_uniquePresentableIdentifier;
    v16->_uniquePresentableIdentifier = (NSUUID *)v24;

    v16->_presentableBehavior = a4;
    v16->_contentBehavior = a5;
    uint64_t v26 = [v14 copy];
    serviceDomain = v16->_serviceDomain;
    v16->_serviceDomain = (NSString *)v26;

    v16->_draggingDismissalEnabled = kBNPresentableContextIsDraggingDismissalEnabledDefault;
    v16->_draggingInteractionEnabled = kBNPresentableContextIsDraggingInteractionEnabledDefault;
    v16->_touchOutsideDismissalEnabled = kBNPresentableContextIsTouchOutsideDismissalEnabledDefault;
    [(BNBannerSourceListenerPresentableViewController *)v16 _setReadyCompletion:v15];
  }

  return v16;
}

- (BNBannerSourceListenerPresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BNBannerSourceListenerPresentableViewController.m", 47, @"Invalid parameter not satisfying: %@", @"serviceDomain" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"BNBannerSourceListenerPresentableViewController.m", 46, @"Invalid parameter not satisfying: %@", @"presentableSpecification" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"BNBannerSourceListenerPresentableViewController.m", 48, @"Invalid parameter not satisfying: %@", @"readyCompletion" object file lineNumber description];

LABEL_4:
  v12 = BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v9;
    _os_log_impl(&dword_1BEC04000, v12, OS_LOG_TYPE_DEFAULT, "Hosted presentable initialized with presentable specification: %{public}@", buf, 0xCu);
  }
  id v13 = -[BNBannerSourceListenerPresentableViewController _initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:](self, "_initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:", v9, [v9 presentableBehavior], objc_msgSend(v9, "contentBehavior"), v10, v11);

  return v13;
}

- (BNBannerSourceListenerPresentableViewController)initWithPresentable:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BNBannerSourceListenerPresentableViewController.m", 54, @"Invalid parameter not satisfying: %@", @"presentable" object file lineNumber description];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v6 providesTemplateContent] & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = BNEffectivePresentableDescription(v6);
    [v14 handleFailureInMethod:a2, self, @"BNBannerSourceListenerPresentableViewController.m", 55, @"This initializer can only be used with host-side template content-providing presentables: %@", v15 object file lineNumber description];
  }
  v7 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    id v9 = BNEffectivePresentableDescription(v6);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_DEFAULT, "Hosted presentable initialized with template presentable: %{public}@", buf, 0xCu);
  }
  id v10 = -[BNBannerSourceListenerPresentableViewController _initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:](self, "_initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:", v6, [v6 presentableBehavior], 1, 0, 0);
  id v11 = (BNBannerSourceListenerPresentableViewController *)v10;
  if (v10)
  {
    v12 = v10 + 127;
    objc_storeStrong(v10 + 127, a3);
    if (objc_opt_respondsToSelector()) {
      [*v12 setPresentableContext:v11];
    }
    [(BNBannerSourceListenerPresentableViewController *)v11 setHostNeedsUpdate];
  }

  return v11;
}

- (void)loadView
{
  v3 = objc_alloc_init(BNBannerSourceListenerPresentableViewControllerView);
  [(BNBannerSourceListenerPresentableViewControllerView *)v3 setDelegate:self];
  [(BNBannerSourceListenerPresentableViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v4 viewDidLoad];
  v3 = [(BNBannerSourceListenerPresentableViewController *)self view];
  [v3 setClipsToBounds:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  [(BNBannerSourceListenerPresentableViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListenerPresentableViewController;
  [(BNBannerSourceListenerPresentableViewController *)&v3 dealloc];
}

- (BOOL)isReady
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);
  if (!self->_presentable
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v6 bannerSourceListenerPresentableShouldEnablePresentableContextInterface:self])
  {
    objc_super v4 = [[BNBannerSourcePresentableContext alloc] initWithPresentableIdentification:self contentBehavior:self->_contentBehavior serviceDomain:self->_serviceDomain];
    presentableContext = self->_presentableContext;
    self->_presentableContext = v4;

    [(BNBannerSourcePresentableContext *)self->_presentableContext setDelegate:self];
  }
}

- (void)makeReadyIfPossible
{
  uint64_t v3 = [(BNBannerSourceListenerPresentableViewController *)self readyCompletion];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    BOOL v5 = [(BNBannerSourceListenerPresentableViewController *)self isReady];

    if (v5)
    {
      uint64_t v7 = [(BNBannerSourceListenerPresentableViewController *)self readyCompletion];
      [(BNBannerSourceListenerPresentableViewController *)self _setReadyCompletion:0];
      id v6 = (void *)v7;
      if (v7)
      {
        (*(void (**)(uint64_t, BNBannerSourceListenerPresentableViewController *, void))(v7 + 16))(v7, self, 0);
        id v6 = (void *)v7;
      }
    }
  }
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  p_presentable = (void **)&self->_presentable;
  if (self->_presentable)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return;
    }
  }
  else
  {
    p_presentable = (void **)&self->_presentableContext;
  }
  BOOL v5 = *p_presentable;
  [v5 handleTemplateContentEvent:a3];
}

- (void)invalidate
{
  [(BNBannerSourcePresentableContext *)self->_presentableContext invalidate];
  presentableContext = self->_presentableContext;
  self->_presentableContext = 0;
}

- (id)presentableDescription
{
  return BNPresentableDescription(self, 0);
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return 0;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = BNEffectivePresentableDescription(v4);
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "Hosted presentable will appear as banner: %{public}@", buf, 0xCu);
  }
  [(BNBannerSourceListenerPresentableViewController *)self _setBannerAppearState:1 forPresentable:v4 reason:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__BNBannerSourceListenerPresentableViewController_presentableWillAppearAsBanner___block_invoke;
  v9[3] = &unk_1E63B9810;
  id v10 = v4;
  id v8 = v4;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableWillAppearAsBanner_ usingBlock:v9];
}

uint64_t __81__BNBannerSourceListenerPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillAppearAsBanner:*(void *)(a1 + 32)];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = BNEffectivePresentableDescription(v4);
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "Hosted presentable did appear as banner: %{public}@", buf, 0xCu);
  }
  [(BNBannerSourceListenerPresentableViewController *)self _setBannerAppearState:2 forPresentable:v4 reason:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__BNBannerSourceListenerPresentableViewController_presentableDidAppearAsBanner___block_invoke;
  v9[3] = &unk_1E63B9810;
  id v10 = v4;
  id v8 = v4;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableDidAppearAsBanner_ usingBlock:v9];
}

uint64_t __80__BNBannerSourceListenerPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableDidAppearAsBanner:*(void *)(a1 + 32)];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = BNEffectivePresentableDescription(v6);
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Hosted presentable will disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);
  }
  [(BNBannerSourceListenerPresentableViewController *)self _setBannerAppearState:3 forPresentable:v6 reason:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__BNBannerSourceListenerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
  v13[3] = &unk_1E63B97C0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableWillDisappearAsBanner_withReason_ usingBlock:v13];
}

uint64_t __95__BNBannerSourceListenerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = BNEffectivePresentableDescription(v6);
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Hosted presentable did disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);
  }
  [(BNBannerSourceListenerPresentableViewController *)self _setBannerAppearState:0 forPresentable:v6 reason:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__BNBannerSourceListenerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v13[3] = &unk_1E63B97C0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableDidDisappearAsBanner_withReason_ usingBlock:v13];
}

uint64_t __94__BNBannerSourceListenerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableDidDisappearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = BNEffectivePresentableDescription(v6);
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Hosted presentable will NOT appear as banner: %{public}@ (%{public}@)", buf, 0x16u);
  }
  if (self->_presentable)
  {
    if (objc_opt_respondsToSelector()) {
      [(BNPresentable *)self->_presentable presentableWillNotAppearAsBanner:self->_presentable withReason:v7];
    }
  }
  else
  {
    [(BNBannerSourcePresentableContext *)self->_presentableContext handlePresentableWillNotAppearWithReason:v7];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__BNBannerSourceListenerPresentableViewController_presentableWillNotAppearAsBanner_withReason___block_invoke;
  v13[3] = &unk_1E63B97C0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_presentableWillNotAppearAsBanner_withReason_ usingBlock:v13];
}

uint64_t __95__BNBannerSourceListenerPresentableViewController_presentableWillNotAppearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillNotAppearAsBanner:*(void *)(a1 + 32) withReason:*(void *)(a1 + 40)];
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4 = a3;
  [(BNBannerSourceListenerPresentableViewController *)self _setUserInteractionWillBegin:1 forPresentable:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99__BNBannerSourceListenerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E63B9810;
  id v7 = v4;
  id v5 = v4;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_userInteractionWillBeginForBannerForPresentable_ usingBlock:v6];
}

uint64_t __99__BNBannerSourceListenerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInteractionWillBeginForBannerForPresentable:*(void *)(a1 + 32)];
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4 = a3;
  [(BNBannerSourceListenerPresentableViewController *)self _setUserInteractionWillBegin:0 forPresentable:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__BNBannerSourceListenerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E63B9810;
  id v7 = v4;
  id v5 = v4;
  [(BNBannerSourceListenerPresentableViewController *)self _enumerateObserversRespondingToSelector:sel_userInteractionDidEndForBannerForPresentable_ usingBlock:v6];
}

uint64_t __96__BNBannerSourceListenerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userInteractionDidEndForBannerForPresentable:*(void *)(a1 + 32)];
}

- (void)addPresentableObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      id v7 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      id v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSHashTable *)observers addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removePresentableObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (BOOL)bannerSourcePresentableContext:(id)a3 isConnectingProcessAuthorized:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v9 = [WeakRetained bannerSourceListenerPresentable:self isConnectingProcessAuthorized:v7 error:a5];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)bannerSourcePresentableContextDraggingDismissalEnabledDidChange:(id)a3
{
  self->_draggingDismissalEnabled = [a3 isDraggingDismissalEnabled];
}

- (void)bannerSourcePresentableContextDraggingInteractionEnabledDidChange:(id)a3
{
  self->_draggingInteractionEnabled = [a3 isDraggingInteractionEnabled];
}

- (void)bannerSourcePresentableContextTouchOutsideDismissalEnabledDidChange:(id)a3
{
  self->_touchOutsideDismissalEnabled = [a3 isTouchOutsideDismissalEnabled];
}

- (void)setHostNeedsUpdate
{
  if (objc_opt_respondsToSelector()) {
    char v3 = [(BNPresentable *)self->_presentable isDraggingDismissalEnabled];
  }
  else {
    char v3 = kBNPresentableContextIsDraggingDismissalEnabledDefault != 0;
  }
  self->_draggingDismissalEnabled = v3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [(BNPresentable *)self->_presentable isDraggingInteractionEnabled];
  }
  else {
    char v4 = kBNPresentableContextIsDraggingInteractionEnabledDefault != 0;
  }
  self->_draggingInteractionEnabled = v4;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(BNPresentable *)self->_presentable isTouchOutsideDismissalEnabled];
  }
  else {
    char v5 = kBNPresentableContextIsTouchOutsideDismissalEnabledDefault != 0;
  }
  self->_touchOutsideDismissalEnabled = v5;
}

- (void)_setBannerAppearState:(int)a3 forPresentable:(id)a4 reason:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v8 = a5;
  self->_bannerAppearState = v6;
  if (self->_presentable)
  {
    switch((int)v6)
    {
      case 0:
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableDidDisappearAsBanner:self->_presentable withReason:v8];
        }
        break;
      case 1:
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableWillAppearAsBanner:self->_presentable];
        }
        break;
      case 2:
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableDidAppearAsBanner:self->_presentable];
        }
        break;
      case 3:
        if (objc_opt_respondsToSelector()) {
          [(BNPresentable *)self->_presentable presentableWillDisappearAsBanner:self->_presentable withReason:v8];
        }
        break;
      default:
        break;
    }
  }
  else
  {
    [(BNBannerSourcePresentableContext *)self->_presentableContext updatePresentableAppearState:v6 reason:v8];
  }
}

- (void)_setUserInteractionWillBegin:(BOOL)a3 forPresentable:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_presentable)
  {
    if (v4)
    {
      if (objc_opt_respondsToSelector()) {
        [(BNPresentable *)self->_presentable userInteractionWillBeginForBannerForPresentable:self->_presentable];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [(BNPresentable *)self->_presentable userInteractionDidEndForBannerForPresentable:self->_presentable];
    }
  }
  else
  {
    [(BNBannerSourcePresentableContext *)self->_presentableContext updateUserInteractionWillBegin:v4];
  }
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (NSUUID)uniquePresentableIdentifier
{
  return self->_uniquePresentableIdentifier;
}

- (int)bannerAppearState
{
  return self->_bannerAppearState;
}

- (BNBannerSourceListenerPresentableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerSourceListenerPresentableDelegate *)WeakRetained;
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (int64_t)presentableBehavior
{
  return self->_presentableBehavior;
}

- (BOOL)isDraggingDismissalEnabled
{
  return self->_draggingDismissalEnabled;
}

- (BOOL)isDraggingInteractionEnabled
{
  return self->_draggingInteractionEnabled;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return self->_touchOutsideDismissalEnabled;
}

- (int64_t)contentBehavior
{
  return self->_contentBehavior;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniquePresentableIdentifier, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_serviceDomain, 0);
  objc_storeStrong(&self->_readyCompletion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_presentableContext, 0);
}

- (void)_setContentView:(id)a3
{
}

- (id)readyCompletion
{
  v2 = (void *)MEMORY[0x1C1899380](self->_readyCompletion, a2);
  return v2;
}

- (void)_setReadyCompletion:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  id readyCompletion = self->_readyCompletion;
  self->_id readyCompletion = v4;
  MEMORY[0x1F41817F8](v4, readyCompletion);
}

- (BOOL)_isPresentableContextInterfaceAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_presentableContext)
  {
    char v4 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained bannerSourceListenerPresentableShouldEnablePresentableContextInterface:self];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v5 = (void (**)(id, void))a4;
  if (v5 && [(NSHashTable *)self->_observers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

@end