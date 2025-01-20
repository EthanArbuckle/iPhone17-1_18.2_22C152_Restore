@interface CSPresentationViewController
- (BOOL)canHostAnApp;
- (BOOL)handleAppearanceUpdateFromController:(id)a3 animationSettings:(id *)a4;
- (BOOL)handleEvent:(id)a3;
- (BOOL)handlesRotationIndependentOfCoverSheet;
- (BOOL)hasContent;
- (BOOL)isHostingAnApp;
- (BOOL)isPresentingContent;
- (BOOL)isTransitioning;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSPresentationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSPresentationViewControllerDelegate)presentationDelegate;
- (NSArray)contentViewControllers;
- (NSArray)presentedViewControllers;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)participantState;
- (void)_didTransitionViewController:(id)a3 toPresented:(BOOL)a4;
- (void)_reflowPresentationWithAnimationSettings:(id)a3;
- (void)_updateContentViewControllersAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updatePresentationForViewController:(id)a3 presentation:(id)a4 animationSettings:(id)a5;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)aggregatePresentation:(id)a3;
- (void)dismissContentViewController:(id)a3 animated:(BOOL)a4;
- (void)dismissContentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissContentViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)dismissPresentationAnimated:(BOOL)a3;
- (void)dismissPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentContentViewController:(id)a3 animated:(BOOL)a4;
- (void)presentContentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentContentViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)rebuildEverythingForReason:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)updatePresentationAnimated:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CSPresentationViewController

- (void)aggregateBehavior:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v23 aggregateBehavior:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_activeContentViewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 unionBehavior:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_contentViewControllers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v4, "addRestrictedCapabilities:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "restrictedCapabilities", (void)v15));
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v12);
  }

  if (![(NSMutableArray *)self->_contentViewControllers count]) {
    [v4 addRestrictedCapabilities:0x8000000];
  }
}

- (BOOL)isHostingAnApp
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_activeContentViewControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v7 = objc_opt_class();
          id v8 = v6;
          if (v7) {
            id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          }
          else {
            id v9 = 0;
          }
          id v10 = v9;

          char v11 = objc_msgSend(v10, "isHostingAnApp", (void)v13);
          if (v11)
          {
            LOBYTE(v3) = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v3;
}

- (CSPresentationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CSPresentationViewController;
  uint64_t v4 = [(CSCoverSheetViewControllerBase *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    contentViewControllers = v4->_contentViewControllers;
    v4->_contentViewControllers = (NSMutableArray *)v5;
  }
  return v4;
}

- (NSArray)contentViewControllers
{
  v2 = (void *)[(NSMutableArray *)self->_contentViewControllers copy];

  return (NSArray *)v2;
}

- (NSArray)presentedViewControllers
{
  v2 = (void *)[(NSArray *)self->_activeContentViewControllers copy];

  return (NSArray *)v2;
}

- (BOOL)hasContent
{
  v2 = [(CSPresentationViewController *)self contentViewControllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isPresentingContent
{
  v2 = [(CSPresentationViewController *)self presentedViewControllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isTransitioning
{
  return self->_transitioning != 0;
}

- (void)presentContentViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)presentContentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = a4;
    id v12 = a3;
    objc_super v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a5;
    id v10 = a3;
    char v11 = [v8 arrayWithObjects:&v12 count:1];

    -[CSPresentationViewController presentContentViewControllers:animated:completion:](self, "presentContentViewControllers:animated:completion:", v11, v5, v9, v12, v13);
  }
}

- (void)presentContentViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v22 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  objc_super v8 = (void (**)(void))a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  long long v20 = v8;
  char v11 = 0;
  uint64_t v12 = *(void *)v25;
  id v21 = v7;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v7);
      }
      long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if ((-[NSMutableArray containsObject:](self->_contentViewControllers, "containsObject:", v14, v20) & 1) == 0)
      {
        long long v15 = SBLogDashBoard();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          long long v16 = (objc_class *)objc_opt_class();
          objc_super v23 = NSStringFromClass(v16);
          long long v17 = [MEMORY[0x1E4F4F718] descriptionForObject:v14];
          uint64_t v18 = NSStringFromBOOL();
          *(_DWORD *)buf = 138543874;
          v29 = v23;
          __int16 v30 = 2112;
          v31 = v17;
          __int16 v32 = 2114;
          uint64_t v33 = v18;
          long long v19 = (void *)v18;
          _os_log_debug_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Adding content view controller %@ (animated: %{public}@)", buf, 0x20u);

          id v7 = v21;
        }

        [(NSMutableArray *)self->_contentViewControllers insertObject:v14 atIndex:0];
        [v14 rebuildBehavior];
        char v11 = 1;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  }
  while (v10);
  objc_super v8 = v20;
  if (v11)
  {
    [(NSMutableArray *)self->_contentViewControllers sortWithOptions:16 usingComparator:&__block_literal_global_15];
    [(CSPresentationViewController *)self _updateContentViewControllersAnimated:v22 completion:v20];
  }
  else
  {
LABEL_14:
    if (v8) {
      v8[2](v8);
    }
  }
}

uint64_t __82__CSPresentationViewController_presentContentViewControllers_animated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "presentationPriority"));
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "presentationPriority"));
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [v4 presentationType];
    uint64_t v10 = [v5 presentationType];
    char v11 = [NSNumber numberWithInteger:v10];
    uint64_t v12 = [NSNumber numberWithInteger:v9];
    uint64_t v8 = [v11 compare:v12];
  }
  return v8;
}

- (void)dismissContentViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)dismissContentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = a4;
    id v12 = a3;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a5;
    id v10 = a3;
    char v11 = [v8 arrayWithObjects:&v12 count:1];

    -[CSPresentationViewController dismissContentViewControllers:animated:completion:](self, "dismissContentViewControllers:animated:completion:", v11, v5, v9, v12, v13);
  }
}

- (void)dismissContentViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v22 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  long long v20 = v8;
  char v11 = 0;
  uint64_t v12 = *(void *)v25;
  id v21 = v7;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
      if (-[NSMutableArray containsObject:](self->_contentViewControllers, "containsObject:", v14, v20))
      {
        long long v15 = SBLogDashBoard();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          long long v16 = (objc_class *)objc_opt_class();
          objc_super v23 = NSStringFromClass(v16);
          long long v17 = [MEMORY[0x1E4F4F718] descriptionForObject:v14];
          uint64_t v18 = NSStringFromBOOL();
          *(_DWORD *)buf = 138543874;
          v29 = v23;
          __int16 v30 = 2112;
          v31 = v17;
          __int16 v32 = 2114;
          uint64_t v33 = v18;
          long long v19 = (void *)v18;
          _os_log_debug_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Removing content view controller %@ (animated: %{public}@)", buf, 0x20u);

          id v7 = v21;
        }

        [(NSMutableArray *)self->_contentViewControllers removeObject:v14];
        char v11 = 1;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  }
  while (v10);
  uint64_t v8 = v20;
  if (v11)
  {
    [(CSPresentationViewController *)self _updateContentViewControllersAnimated:v22 completion:v20];
  }
  else
  {
LABEL_14:
    if (v8) {
      v8[2](v8);
    }
  }
}

- (void)dismissPresentationAnimated:(BOOL)a3
{
}

- (void)dismissPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  uint64_t v8 = SBLogDashBoard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSPresentationViewController dismissPresentationAnimated:completion:]((uint64_t)self, (uint64_t)a2, v8);
  }

  [(NSMutableArray *)self->_contentViewControllers removeAllObjects];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CSPresentationViewController_dismissPresentationAnimated_completion___block_invoke;
  v10[3] = &unk_1E6AD8B20;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(CSPresentationViewController *)self _updateContentViewControllersAnimated:v4 completion:v10];
}

uint64_t __71__CSPresentationViewController_dismissPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CSPresentationViewController;
  objc_msgSendSuper2(&v3, sel_dismiss);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updatePresentationAnimated:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.35];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(CSPresentationViewController *)self _reflowPresentationWithAnimationSettings:v4];
}

- (void)viewDidLoad
{
  objc_super v3 = [(CSPresentationViewController *)self view];
  uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  [v3 setAutoresizingMask:18];
  [v3 setAutoresizesSubviews:1];
  v5.receiver = self;
  v5.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidLoad];
  [(CSPresentationViewController *)self _updateContentViewControllersAnimated:0 completion:0];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v19 viewWillLayoutSubviews];
  objc_super v3 = [(CSPresentationViewController *)self view];
  [v3 bounds];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v18 = 0;
  activeContentViewControllers = self->_activeContentViewControllers;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CSPresentationViewController_viewWillLayoutSubviews__block_invoke;
  v10[3] = &unk_1E6ADA210;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  uint64_t v16 = v8;
  uint64_t v12 = v17;
  id v9 = v3;
  id v11 = v9;
  [(NSArray *)activeContentViewControllers enumerateObjectsWithOptions:2 usingBlock:v10];

  _Block_object_dispose(v17, 8);
}

void __54__CSPresentationViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 view];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v4 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "insertSubview:aboveSubview:", v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)aggregateAppearance:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v14 aggregateAppearance:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_activeContentViewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "unionAppearance:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)aggregatePresentation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v14 aggregatePresentation:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_activeContentViewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "unionPresentation:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)rebuildEverythingForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  ++self->_mutatingPresentation;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_activeContentViewControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) rebuildEverythingForReason:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  --self->_mutatingPresentation;
  v10.receiver = self;
  v10.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v10 rebuildEverythingForReason:v4];
}

- (int64_t)participantState
{
  v4.receiver = self;
  v4.super_class = (Class)CSPresentationViewController;
  if ((id)[(CSCoverSheetViewControllerBase *)&v4 participantState] == (id)2
    && ([(CSPresentationViewController *)self isPresentingContent] || self->_transitioning))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)handleAppearanceUpdateFromController:(id)a3 animationSettings:(id *)a4
{
  uint64_t v6 = (CSPresentationViewController *)a3;
  uint64_t v7 = v6;
  if (self->_mutatingPresentation)
  {
    BOOL v8 = 0;
  }
  else
  {
    if (v6 != self)
    {
      uint64_t v9 = SBLogDashBoard();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CSPresentationViewController handleAppearanceUpdateFromController:animationSettings:]();
      }

      if (*a4)
      {
        id v10 = *a4;
        *a4 = v10;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.35];
        *a4 = v11;

        id v10 = *a4;
      }
      [(CSPresentationViewController *)self _reflowPresentationWithAnimationSettings:v10];
    }
    v13.receiver = self;
    v13.super_class = (Class)CSPresentationViewController;
    BOOL v8 = [(CSCoverSheetViewControllerBase *)&v13 handleAppearanceUpdateFromController:v7 animationSettings:a4]|| [(NSArray *)self->_activeContentViewControllers containsObject:v7];
  }

  return v8;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSPresentationViewController;
  if ([(CSCoverSheetViewControllerBase *)&v28 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
LABEL_25:
    char v17 = [v4 isConsumable];
  }
  else
  {
    if ([v4 isConsumable])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v5 = self->_activeContentViewControllers;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v5);
            }
            if ([*(id *)(*((void *)&v24 + 1) + 8 * i) handleEvent:v4])
            {

              goto LABEL_25;
            }
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_contentViewControllers];
      id v11 = [(CSPresentationViewController *)self childViewControllers];
      [v10 removeObjectsInArray:v11];

      long long v12 = SBLogDashBoard();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_super v19 = [MEMORY[0x1E4F4F718] descriptionForObject:self];
        *(_DWORD *)buf = 138543874;
        v31 = v19;
        __int16 v32 = 2114;
        id v33 = v4;
        __int16 v34 = 2112;
        uint64_t v35 = v10;
        _os_log_debug_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ - Sending event %{public}@ to non-active content view controllers: %@", buf, 0x20u);
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v5 = v10;
      uint64_t v13 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "handleEvent:", v4, (void)v20);
          }
          uint64_t v14 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v14);
      }
    }
    char v17 = 0;
  }

  return v17;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSPresentationViewController;
  if ([(CSCoverSheetViewControllerBase *)&v14 wouldHandleButtonEvent:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = self->_activeContentViewControllers;
    uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "wouldHandleButtonEvent:", v4, (void)v10))
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (BOOL)canHostAnApp
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_activeContentViewControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v7 = objc_opt_class();
          id v8 = v6;
          if (v7) {
            id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          }
          else {
            id v9 = 0;
          }
          id v10 = v9;

          char v11 = objc_msgSend(v10, "canHostAnApp", (void)v13);
          if (v11)
          {
            LOBYTE(v3) = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v3;
}

- (id)hostedAppSceneHandle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_activeContentViewControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = objc_opt_class();
        id v9 = v7;
        if (v8) {
          id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;

        long long v12 = objc_msgSend(v11, "hostedAppSceneHandle", (void)v14);

        if (v12) {
          break;
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    long long v12 = 0;
  }

  return v12;
}

- (id)hostedAppSceneHandles
{
  v2 = [(NSArray *)self->_activeContentViewControllers bs_compactMap:&__block_literal_global_35];
  uint64_t v3 = objc_msgSend(v2, "bs_flatten");

  return v3;
}

id __53__CSPresentationViewController_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = objc_opt_class();
    id v4 = v2;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v5 = v4;
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v7 = v5;

    uint64_t v6 = [v7 hostedAppSceneHandles];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = self->_activeContentViewControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v7 = objc_opt_class();
          id v8 = v6;
          if (v7) {
            id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          }
          else {
            id v9 = 0;
          }
          id v10 = v9;

          char v11 = objc_msgSend(v10, "handlesRotationIndependentOfCoverSheet", (void)v13);
          if (v11)
          {
            LOBYTE(v3) = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v3;
}

- (NSString)description
{
  return (NSString *)[(CSPresentationViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(CSPresentationViewController *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSPresentationViewController isPresentingContent](self, "isPresentingContent"), @"presentingContent");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(CSPresentationViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSPresentationViewController *)self succinctDescriptionBuilder];
  if ([(CSPresentationViewController *)self isPresentingContent]
    || ([(CSPresentationViewController *)self viewIfLoaded],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__CSPresentationViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E6AD88C0;
    id v9 = v5;
    id v10 = self;
    [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];
  }

  return v5;
}

void __70__CSPresentationViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F4F718];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) valueForKey:@"presenter"];
  uint64_t v5 = [v2 descriptionForObject:v4];
  id v6 = (id)[v3 appendObject:v5 withName:@"presenter"];

  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) viewIfLoaded];
  id v9 = (id)[v7 appendObject:v8 withName:@"view"];

  id v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _appearState];
  char v11 = SBFStringForAppearState();
  id v12 = (id)[v10 appendObject:v11 withName:@"appearState"];

  long long v13 = *(void **)(a1 + 32);
  long long v14 = [*(id *)(a1 + 40) presentedViewControllers];
  [v13 appendArraySection:v14 withName:@"presentedViewControllers" skipIfEmpty:1];

  long long v15 = *(void **)(a1 + 32);
  long long v16 = [*(id *)(a1 + 40) contentViewControllers];
  [v15 appendArraySection:v16 withName:@"contentViewControllers" skipIfEmpty:1];

  long long v17 = *(void **)(a1 + 32);
  uint64_t v18 = +[CSAppearance appearanceForProvider:*(void *)(a1 + 40)];
  id v19 = (id)[v17 appendObject:v18 withName:@"appearance"];

  long long v20 = *(void **)(a1 + 32);
  long long v21 = +[CSBehavior behaviorForProvider:*(void *)(a1 + 40)];
  id v22 = (id)[v20 appendObject:v21 withName:@"behavior"];

  long long v23 = *(void **)(a1 + 32);
  id v25 = +[CSPresentation presentationForProvider:*(void *)(a1 + 40)];
  id v24 = (id)[v23 appendObject:v25 withName:@"presentation"];
}

- (void)_updateContentViewControllersAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v8 = self->_contentViewControllers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v104 objects:v114 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v105;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v105 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v104 + 1) + 8 * v12);
      [v7 addObject:v13];
      if ([v13 presentationType] == 2) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v104 objects:v114 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v14 = [MEMORY[0x1E4F1CA80] setWithArray:self->_activeContentViewControllers];
  long long v15 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
  if (([v14 isEqual:v15] & 1) == 0
    && [(CSPresentationViewController *)self isViewLoaded])
  {
    ++self->_mutatingPresentation;
    ++self->_transitioning;
    [v15 minusSet:v14];
    long long v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    [v14 minusSet:v16];

    long long v17 = (NSArray *)[v7 copy];
    activeContentViewControllers = self->_activeContentViewControllers;
    self->_activeContentViewControllers = v17;

    id v19 = [MEMORY[0x1E4F1CA80] set];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke;
    v100[3] = &unk_1E6ADA258;
    id v79 = v19;
    id v101 = v79;
    v102 = self;
    v103 = v6;
    uint64_t v20 = MEMORY[0x1D9487300](v100);
    uint64_t v21 = [v15 count];
    uint64_t v22 = [v14 count];
    v67 = (void *)v20;
    v78 = [MEMORY[0x1E4F4F6B8] sentinelWithQueue:MEMORY[0x1E4F14428] signalCount:v21 + v22 + 1 signalHandler:v20];
    v73 = v15;
    v70 = v7;
    v71 = v6;
    BOOL v69 = v4;
    if (v4)
    {
      long long v23 = (void *)MEMORY[0x1E4F4F680];
      id v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      v77 = [v23 settingsWithDuration:v24 timingFunction:0.4];

      id v25 = (void *)MEMORY[0x1E4F4F680];
      long long v26 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
      long long v27 = [v25 settingsWithDuration:v26 timingFunction:0.4];

      if (v27)
      {
        id v74 = v27;
        v72 = v74;
LABEL_18:
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        v68 = v14;
        obuint64_t j = v14;
        uint64_t v28 = [obj countByEnumeratingWithState:&v96 objects:v113 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v97;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v97 != v30) {
                objc_enumerationMutation(obj);
              }
              __int16 v32 = *(void **)(*((void *)&v96 + 1) + 8 * i);
              id v33 = SBLogDashBoard();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                v42 = (objc_class *)objc_opt_class();
                v43 = NSStringFromClass(v42);
                v44 = [MEMORY[0x1E4F4F718] descriptionForObject:v32];
                *(_DWORD *)buf = 138543618;
                v110 = v43;
                __int16 v111 = 2112;
                v112 = v44;
                _os_log_debug_impl(&dword_1D839D000, v33, OS_LOG_TYPE_DEBUG, "%{public}@: Dismissing content view controller %@", buf, 0x16u);
              }
              __int16 v34 = NSString;
              uint64_t v35 = [v32 appearanceIdentifier];
              v36 = [v34 stringWithFormat:@"Dismissing: %@", v35];

              [v79 addObject:v36];
              uint64_t v37 = (void *)[v77 mutableCopy];
              [v32 presentationPreferredFrameRateRange];
              objc_msgSend(v37, "setPreferredFrameRateRange:");
              objc_msgSend(v37, "setHighFrameRateReason:", objc_msgSend(v32, "presentationFrameRateRangeReason"));
              [v32 willTransitionToPresented:0];
              [v32 setPresenter:0];
              v91[0] = MEMORY[0x1E4F143A8];
              BOOL v38 = v37 != 0;
              v91[1] = 3221225472;
              v91[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_82;
              v91[3] = &unk_1E6ADA2D0;
              v91[4] = v32;
              id v92 = v37;
              v93 = self;
              id v39 = v78;
              id v94 = v39;
              id v40 = v36;
              id v95 = v40;
              id v41 = v37;
              if ((-[CSPresentationViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", v32, v38, v91) & 1) == 0)[v39 signalWithContext:v40]; {
            }
              }
            uint64_t v29 = [obj countByEnumeratingWithState:&v96 objects:v113 count:16];
          }
          while (v29);
        }

        v45 = [(CSCoverSheetViewControllerBase *)self presentationCoordinateSpace];
        v46 = +[CSPresentation presentationWithCoordinateSpace:v45];

        [v46 setIdentifier:@"PresentationAggregation"];
        v90.receiver = self;
        v90.super_class = (Class)CSPresentationViewController;
        [(CSCoverSheetViewControllerBase *)&v90 aggregatePresentation:v46];
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        obja = self->_activeContentViewControllers;
        uint64_t v47 = [(NSArray *)obja countByEnumeratingWithState:&v86 objects:v108 count:16];
        long long v15 = v73;
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v87;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v87 != v49) {
                objc_enumerationMutation(obja);
              }
              v51 = *(void **)(*((void *)&v86 + 1) + 8 * j);
              if ([v15 containsObject:v51])
              {
                v52 = SBLogDashBoard();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  v61 = (objc_class *)objc_opt_class();
                  v62 = NSStringFromClass(v61);
                  v63 = [MEMORY[0x1E4F4F718] descriptionForObject:v51];
                  *(_DWORD *)buf = 138412546;
                  v110 = v62;
                  __int16 v111 = 2112;
                  v112 = v63;
                  _os_log_debug_impl(&dword_1D839D000, v52, OS_LOG_TYPE_DEBUG, "%@: Presenting content view controller %@", buf, 0x16u);
                }
                v53 = NSString;
                v54 = [v51 appearanceIdentifier];
                v55 = [v53 stringWithFormat:@"Presenting: %@", v54];

                [v79 addObject:v55];
                v85[0] = MEMORY[0x1E4F143A8];
                v85[1] = 3221225472;
                v85[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_93;
                v85[3] = &unk_1E6AD88C0;
                v85[4] = v51;
                v85[5] = self;
                [MEMORY[0x1E4F42FF0] performWithoutAnimation:v85];
                v56 = (void *)[v72 mutableCopy];
                [v51 presentationPreferredFrameRateRange];
                objc_msgSend(v56, "setPreferredFrameRateRange:");
                objc_msgSend(v56, "setHighFrameRateReason:", objc_msgSend(v51, "presentationFrameRateRangeReason"));
                BOOL v57 = v56 != 0;
                v80[0] = MEMORY[0x1E4F143A8];
                v80[1] = 3221225472;
                v80[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2_94;
                v80[3] = &unk_1E6ADA320;
                v80[4] = v51;
                v80[5] = self;
                id v81 = v46;
                id v82 = v56;
                id v58 = v78;
                id v83 = v58;
                id v59 = v55;
                id v84 = v59;
                id v60 = v56;
                if ((-[CSPresentationViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v51, v57, v80) & 1) == 0)[v58 signalWithContext:v59]; {

                }
                long long v15 = v73;
              }
              else
              {
                [(CSPresentationViewController *)self _updatePresentationForViewController:v51 presentation:v46 animationSettings:v74];
              }
            }
            uint64_t v48 = [(NSArray *)obja countByEnumeratingWithState:&v86 objects:v108 count:16];
          }
          while (v48);
        }

        [(CSPresentationViewController *)self _updatePresentationForViewController:self presentation:v46 animationSettings:v74];
        --self->_mutatingPresentation;
        [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
        if (v69)
        {
          v64 = (void *)MEMORY[0x1E4F4F680];
          v65 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
          v66 = [v64 settingsWithDuration:v65 timingFunction:0.4];
        }
        else
        {
          v66 = 0;
        }
        uint64_t v7 = v70;
        id v6 = v71;
        long long v14 = v68;
        [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self withAnimationSettings:v66 completion:0];
        [v78 signal];

        goto LABEL_47;
      }
    }
    else
    {
      v77 = 0;
    }
    id v74 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.35];
    v72 = 0;
    goto LABEL_18;
  }
  [(CSCoverSheetViewControllerBase *)self updateBehaviorForController:self];
  if (v6) {
    v6[2](v6);
  }
LABEL_47:
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFailed])
  {
    BOOL v4 = NSString;
    uint64_t v5 = [*(id *)(a1 + 32) allObjects];
    id v6 = [v5 componentsJoinedByString:@"; "];
    uint64_t v7 = [v4 stringWithFormat:@"CSPresentationViewController: content transition completion was not called with missing signals: %@", v6];

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], v7, 0);
  }
  else if ([v3 isComplete])
  {
    --*(void *)(*(void *)(a1 + 40) + 1056);
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
  uint64_t v9 = [v3 context];
  if (v9)
  {
    uint64_t v10 = SBLogDashBoard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) removeObject:v9];
  }
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) view];
  uint64_t v5 = [*(id *)(a1 + 32) presentationTransition];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5 == 1)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2;
    v21[3] = &unk_1E6ADA280;
    uint64_t v8 = *(void **)(a1 + 56);
    v21[4] = *(void *)(a1 + 48);
    v21[5] = v7;
    id v24 = v3;
    id v22 = v8;
    id v23 = *(id *)(a1 + 64);
    id v9 = v3;
    [v7 performCustomTransitionToVisible:0 withAnimationSettings:v6 completion:v21];

    id v10 = v24;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F4F898];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3;
    v19[3] = &unk_1E6AD87F8;
    id v20 = v4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4;
    v14[3] = &unk_1E6ADA2A8;
    uint64_t v12 = *(void *)(a1 + 32);
    v14[4] = *(void *)(a1 + 48);
    v14[5] = v12;
    id v15 = v20;
    id v18 = v3;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    id v13 = v3;
    [v11 animateWithSettings:v6 actions:v19 completion:v14];

    id v10 = v20;
  }
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 1072) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) _didTransitionViewController:*(void *)(a1 + 40) toPresented:0];
  }
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 signalWithContext:v3];
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setUserInteractionEnabled:0];
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 1072) containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 48) setAlpha:1.0];
    [*(id *)(a1 + 48) setUserInteractionEnabled:1];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    [*(id *)(a1 + 32) _didTransitionViewController:*(void *)(a1 + 40) toPresented:0];
  }
  id v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);

  return [v2 signalWithContext:v3];
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_93(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");

  [v3 setAutoresizingMask:18];
  [v3 setAutoresizesSubviews:1];
  [v3 setAlpha:1.0];
  [v3 layoutIfNeeded];
  [*(id *)(a1 + 32) rebuildBehavior];
  [*(id *)(a1 + 32) setPresenter:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) willTransitionToPresented:1];
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) view];
  uint64_t v5 = [*(id *)(a1 + 40) view];
  [v5 addSubview:v4];

  [*(id *)(a1 + 32) rebuildAppearance];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [v10 resetScrollForStaticPresentation];
  [*(id *)(a1 + 40) _updatePresentationForViewController:*(void *)(a1 + 32) presentation:*(void *)(a1 + 48) animationSettings:0];
  if ([*(id *)(a1 + 32) presentationTransition] == 1)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3_96;
    v29[3] = &unk_1E6ADA280;
    int8x16_t v19 = *(int8x16_t *)(a1 + 32);
    int8x16_t v30 = vextq_s8(v19, v19, 8uLL);
    id v33 = v3;
    uint64_t v11 = *(void *)(a1 + 56);
    id v31 = *(id *)(a1 + 64);
    id v32 = *(id *)(a1 + 72);
    id v12 = v3;
    [(id)v19.i64[0] performCustomTransitionToVisible:1 withAnimationSettings:v11 completion:v29];

    id v13 = v33;
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F42FF0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4_97;
    v27[3] = &unk_1E6AD87F8;
    id v15 = v4;
    id v28 = v15;
    [v14 performWithoutAnimation:v27];
    id v16 = (void *)MEMORY[0x1E4F4F898];
    uint64_t v17 = *(void *)(a1 + 56);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_5;
    v25[3] = &unk_1E6AD87F8;
    id v26 = v15;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_6;
    v20[3] = &unk_1E6ADA2F8;
    int8x16_t v21 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    id v24 = v3;
    id v22 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 72);
    id v18 = v3;
    [v16 animateWithSettings:v17 actions:v25 completion:v20];

    id v13 = v28;
  }
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3_96(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1072) containsObject:*(void *)(a1 + 40)])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) _didTransitionViewController:*(void *)(a1 + 40) toPresented:1];
  }
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 signalWithContext:v3];
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4_97(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1072) containsObject:*(void *)(a1 + 40)])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    [*(id *)(a1 + 32) _didTransitionViewController:*(void *)(a1 + 40) toPresented:1];
  }
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 signalWithContext:v3];
}

- (void)_didTransitionViewController:(id)a3 toPresented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 didTransitionToPresented:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  [WeakRetained presentationViewController:self didTransitionViewController:v6 toPresented:v4];
}

- (void)_reflowPresentationWithAnimationSettings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  ++self->_mutatingPresentation;
  uint64_t v5 = [(CSCoverSheetViewControllerBase *)self presentationCoordinateSpace];
  id v6 = +[CSPresentation presentationWithCoordinateSpace:v5];

  [v6 setIdentifier:@"PresentationAggregation"];
  v16.receiver = self;
  v16.super_class = (Class)CSPresentationViewController;
  [(CSCoverSheetViewControllerBase *)&v16 aggregatePresentation:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_activeContentViewControllers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CSPresentationViewController _updatePresentationForViewController:presentation:animationSettings:](self, "_updatePresentationForViewController:presentation:animationSettings:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), v6, v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }

  [(CSPresentationViewController *)self _updatePresentationForViewController:self presentation:v6 animationSettings:v4];
  --self->_mutatingPresentation;
}

- (void)_updatePresentationForViewController:(id)a3 presentation:(id)a4 animationSettings:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"CSPresentationViewController.m", 629, @"Invalid parameter not satisfying: %@", @"presentation" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v53 = [MEMORY[0x1E4F28B00] currentHandler];
  [v53 handleFailureInMethod:a2, self, @"CSPresentationViewController.m", 630, @"Invalid parameter not satisfying: %@", @"viewController" object file lineNumber description];

LABEL_3:
  long long v12 = SBLogDashBoard();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    v55 = self;
    id v59 = v11;
    long long v14 = SBLogDashBoard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v41 = objc_opt_class();
      id v42 = v41;
      v43 = objc_opt_class();
      v44 = (void *)MEMORY[0x1E4F4F718];
      id v45 = v43;
      v46 = [v44 succinctDescriptionForObject:v10];
      *(_DWORD *)buf = 138412802;
      v75 = v41;
      __int16 v76 = 2112;
      v77 = v43;
      __int16 v78 = 2112;
      uint64_t v79 = (uint64_t)v46;
      _os_log_debug_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEBUG, "%@ updating %@ with %@", buf, 0x20u);
    }
    id v54 = v9;

    long long v15 = (void *)MEMORY[0x1E4F1CA80];
    objc_super v16 = [v10 regions];
    uint64_t v57 = [v15 setWithArray:v16];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v17 = [v10 regions];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v69;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v69 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v68 + 1) + 8 * v21);
          id v23 = SBLogDashBoard();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v22;
            _os_log_debug_impl(&dword_1D839D000, v23, OS_LOG_TYPE_DEBUG, "    %@", buf, 0xCu);
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v19);
    }

    id v24 = (void *)v57;
    id v11 = v59;
    id v9 = v54;
    self = v55;
  }
  else
  {
    id v24 = 0;
  }
  id v25 = (void *)MEMORY[0x1E4F4F898];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __100__CSPresentationViewController__updatePresentationForViewController_presentation_animationSettings___block_invoke;
  v65[3] = &unk_1E6AD88C0;
  id v26 = (CSPresentationViewController *)v9;
  v66 = v26;
  id v27 = v10;
  id v67 = v27;
  [v25 animateWithSettings:v11 actions:v65];
  if (v26 != self)
  {
    [v27 unionPresentation:v26];
    id v28 = SBLogDashBoard();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);

    if (v29)
    {
      id v60 = v11;
      int8x16_t v30 = (void *)MEMORY[0x1E4F1CA80];
      id v56 = v27;
      id v31 = [v27 regions];
      id v32 = [v30 setWithArray:v31];

      id v58 = v24;
      [v32 minusSet:v24];
      id v33 = SBLogDashBoard();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v47 = objc_opt_class();
        id v48 = v47;
        uint64_t v49 = objc_opt_class();
        id v50 = v49;
        uint64_t v51 = [v32 count];
        *(_DWORD *)buf = 138412802;
        v75 = v47;
        __int16 v76 = 2112;
        v77 = v49;
        __int16 v78 = 2048;
        uint64_t v79 = v51;
        _os_log_debug_impl(&dword_1D839D000, v33, OS_LOG_TYPE_DEBUG, "%@ aggregated %@ by adding %ld regions", buf, 0x20u);
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v34 = v32;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v72 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v62;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v62 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v61 + 1) + 8 * v38);
            id v40 = SBLogDashBoard();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v75 = v39;
              _os_log_debug_impl(&dword_1D839D000, v40, OS_LOG_TYPE_DEBUG, "    %@", buf, 0xCu);
            }

            ++v38;
          }
          while (v36 != v38);
          uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v72 count:16];
        }
        while (v36);
      }

      id v24 = v58;
      id v11 = v60;
      id v27 = v56;
    }
  }
}

uint64_t __100__CSPresentationViewController__updatePresentationForViewController_presentation_animationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForPresentation:*(void *)(a1 + 40)];
}

- (CSPresentationViewControllerDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (CSPresentationViewControllerDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_activeContentViewControllers, 0);

  objc_storeStrong((id *)&self->_contentViewControllers, 0);
}

- (void)dismissPresentationAnimated:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = _SBFLoggingMethodProem();
  int v5 = 138543362;
  id v6 = v4;
  _os_log_debug_impl(&dword_1D839D000, a3, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)handleAppearanceUpdateFromController:animationSettings:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  id v2 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_5(&dword_1D839D000, v3, v4, "%{public}@ reflowing for appearance update from %{public}@", v5, v6, v7, v8, 2u);
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_cold_1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_5(&dword_1D839D000, v2, v3, "%{public}@: Got signal: %@", v4, v5, v6, v7, 2u);
}

@end