@interface GKNavigationController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (BOOL)hasEmbeddedPopoverNavigationStack;
- (BOOL)shouldAutorotate;
- (GKNavigationController)init;
- (GKNavigationController)initWithCoder:(id)a3;
- (GKNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (GKNavigationController)initWithRootViewController:(id)a3;
- (NSMutableArray)deferredTransitions;
- (id)_gkViewControllersForRestoringPopover;
- (id)popEmbeddedPopoverViewControllers;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)targetViewControllerForAction:(SEL)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_deferTransitionOfType:(int)a3 withViewController:(id)a4 animated:(BOOL)a5;
- (void)_gkPushPresentedViewControllerForCompactSizeClass:(id)a3;
- (void)_gkRestorePopoverWithViewControllers:(id)a3 completion:(id)a4;
- (void)_performDeferredTransition;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDeferredTransitions:(id)a3;
- (void)setupGKNavigationController;
- (void)willShowViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation GKNavigationController

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (GKNavigationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKNavigationController;
  v2 = [(GKNavigationController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKNavigationController *)v2 setupGKNavigationController];
  }
  return v3;
}

- (GKNavigationController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKNavigationController;
  v3 = [(GKNavigationController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GKNavigationController *)v3 setupGKNavigationController];
  }
  return v4;
}

- (GKNavigationController)initWithRootViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKNavigationController;
  v3 = [(GKNavigationController *)&v6 initWithRootViewController:a3];
  v4 = v3;
  if (v3) {
    [(GKNavigationController *)v3 setupGKNavigationController];
  }
  return v4;
}

- (GKNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GKNavigationController;
  v4 = [(GKNavigationController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(GKNavigationController *)v4 setupGKNavigationController];
  }
  return v5;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v4 = objc_alloc_init((Class)a1);

  return v4;
}

- (void)setupGKNavigationController
{
  v3 = [(GKNavigationController *)self navigationBar];
  id v4 = [v3 delegate];

  if (v4 != self)
  {
    objc_super v5 = [(GKNavigationController *)self navigationBar];
    [v5 setDelegate:self];
  }
  objc_super v6 = [MEMORY[0x1E4F1CA48] array];
  [(GKNavigationController *)self setDeferredTransitions:v6];

  [(GKNavigationController *)self setRestorationClass:objc_opt_class()];

  [(GKNavigationController *)self _setClipUnderlapWhileTransitioning:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(GKNavigationController *)self traitCollection];
  if ([v3 userInterfaceIdiom] || *MEMORY[0x1E4F63830]) {
    goto LABEL_13;
  }
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5)
  {

    return 2;
  }
  objc_super v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (v9 >= 414.0 && v11 >= 736.0)
  {
LABEL_13:
  }
  else
  {

    unint64_t v6 = 2;
    if (v9 < 736.0 || v11 < 414.0) {
      return v6;
    }
  }
  v13 = [(GKNavigationController *)self topViewController];
  v14 = v13;
  if (v13)
  {
    id v15 = (id)[v13 supportedInterfaceOrientations];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GKNavigationController;
    id v15 = [(GKNavigationController *)&v17 supportedInterfaceOrientations];
  }
  unint64_t v6 = (unint64_t)v15;

  return v6;
}

- (BOOL)shouldAutorotate
{
  v3 = [(GKNavigationController *)self traitCollection];
  if ([v3 userInterfaceIdiom] || *MEMORY[0x1E4F63830]) {
    goto LABEL_13;
  }
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5)
  {

    return 0;
  }
  objc_super v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if (v9 >= 414.0 && v11 >= 736.0)
  {
LABEL_13:

LABEL_14:
    v13.receiver = self;
    v13.super_class = (Class)GKNavigationController;
    return [(GKNavigationController *)&v13 shouldAutorotate];
  }

  BOOL result = 0;
  if (v9 >= 736.0 && v11 >= 414.0) {
    goto LABEL_14;
  }
  return result;
}

- (BOOL)hasEmbeddedPopoverNavigationStack
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(GKNavigationController *)self viewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v6 hasEmbeddedPopoverNavigationStack]) {
            goto LABEL_13;
          }
        }
        else
        {
          objc_super v7 = [v6 _gkSourcePresentingViewController];

          if (v7)
          {
LABEL_13:
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v3;
}

- (id)popEmbeddedPopoverViewControllers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = [(GKNavigationController *)self viewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v4)
  {
LABEL_16:
    objc_super v13 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v25;
LABEL_3:
  uint64_t v8 = 0;
  uint64_t v9 = v6;
  v6 += v5;
  while (1)
  {
    if (*(void *)v25 != v7) {
      objc_enumerationMutation(v3);
    }
    long long v10 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 popEmbeddedPopoverViewControllers];
      if (v11)
      {
        objc_super v13 = (void *)v11;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    long long v12 = [v10 _gkSourcePresentingViewController];

    if (v12) {
      break;
    }
LABEL_10:
    ++v9;
    if (v5 == ++v8)
    {
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v5) {
        goto LABEL_3;
      }
      goto LABEL_16;
    }
  }
  uint64_t v14 = [(GKNavigationController *)self viewControllers];
  id v15 = [v14 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_super v17 = [(GKNavigationController *)self viewControllers];
  uint64_t v18 = [v17 count] - (isKindOfClass & 1) - v9;

  if (v18 < 1) {
    goto LABEL_16;
  }
  v19 = [(GKNavigationController *)self viewControllers];
  objc_super v13 = objc_msgSend(v19, "subarrayWithRange:", v9, v18);

  if (v9)
  {
    v20 = [(GKNavigationController *)self viewControllers];
    v21 = [v20 objectAtIndexedSubscript:v9 - 1];
    id v22 = [(GKNavigationController *)self popToViewController:v21 animated:0];
  }
LABEL_17:

  return v13;
}

- (void)_gkPushPresentedViewControllerForCompactSizeClass:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = objc_msgSend(v4, "viewControllers", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          [(GKNavigationController *)self pushViewController:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)_gkViewControllersForRestoringPopover
{
  if ([(GKNavigationController *)self hasEmbeddedPopoverNavigationStack])
  {
    uint64_t v3 = [(GKNavigationController *)self popEmbeddedPopoverViewControllers];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_gkRestorePopoverWithViewControllers:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    uint64_t v6 = [v8 firstObject];
    uint64_t v7 = [v6 _gkSourcePresentingViewController];

    if (v7) {
      [v7 _gkRestorePopoverWithViewControllers:v8 completion:v5];
    }
  }
}

- (id)targetViewControllerForAction:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(GKNavigationController *)self viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 targetViewControllerForAction:a3];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          continue;
        }
        id v10 = v9;
      }
      long long v11 = v10;
      if (v10) {
        goto LABEL_14;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);
LABEL_13:
  long long v11 = 0;
LABEL_14:

  return v11;
}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)GKNavigationController;
  [(GKNavigationController *)&v4 willShowViewController:a3 animated:a4];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKNavigationController;
  [(GKNavigationController *)&v5 didShowViewController:a3 animated:a4];
  [(GKNavigationController *)self _performDeferredTransition];
}

- (void)_performDeferredTransition
{
  id v11 = [(GKNavigationController *)self deferredTransitions];
  if ([v11 count])
  {
    char v3 = [(GKNavigationController *)self _isTransitioning];

    if ((v3 & 1) == 0)
    {
      objc_super v4 = [(GKNavigationController *)self deferredTransitions];
      objc_super v5 = [v4 lastObject];

      uint64_t v6 = [(GKNavigationController *)self deferredTransitions];
      [v6 removeObject:v5];

      switch([v5 type])
      {
        case 0u:
          v15.receiver = self;
          v15.super_class = (Class)GKNavigationController;
          id v7 = -[GKNavigationController popViewControllerAnimated:](&v15, sel_popViewControllerAnimated_, [v5 animated]);
          goto LABEL_10;
        case 1u:
          id v8 = [v5 viewController];
          v14.receiver = self;
          v14.super_class = (Class)GKNavigationController;
          id v9 = -[GKNavigationController popToViewController:animated:](&v14, sel_popToViewController_animated_, v8, [v5 animated]);
          goto LABEL_12;
        case 2u:
          v13.receiver = self;
          v13.super_class = (Class)GKNavigationController;
          id v7 = -[GKNavigationController popToRootViewControllerAnimated:](&v13, sel_popToRootViewControllerAnimated_, [v5 animated]);
LABEL_10:
          id v10 = v7;
          break;
        case 3u:
          id v8 = [v5 viewController];
          v12.receiver = self;
          v12.super_class = (Class)GKNavigationController;
          -[GKNavigationController pushViewController:animated:](&v12, sel_pushViewController_animated_, v8, [v5 animated]);
LABEL_12:

          break;
        default:
          break;
      }
    }
  }
  else
  {
  }
}

- (void)_deferTransitionOfType:(int)a3 withViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v10 = (id)objc_opt_new();
  [v10 setViewController:v8];

  [v10 setType:v6];
  [v10 setAnimated:v5];
  id v9 = [(GKNavigationController *)self deferredTransitions];
  [v9 addObject:v10];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GKNavigationController *)self _isTransitioning])
  {
    [(GKNavigationController *)self _deferTransitionOfType:0 withViewController:0 animated:v3];
    BOOL v5 = (NSObject **)MEMORY[0x1E4F63860];
    uint64_t v6 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v7 = (id)GKOSLoggers();
      uint64_t v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[GKNavigationController popViewControllerAnimated:](v6);
    }
    id v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKNavigationController;
    id v8 = [(GKNavigationController *)&v10 popViewControllerAnimated:v3];
  }

  return v8;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(GKNavigationController *)self _isTransitioning])
  {
    [(GKNavigationController *)self _deferTransitionOfType:1 withViewController:v6 animated:v4];

    id v7 = (NSObject **)MEMORY[0x1E4F63860];
    id v8 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v9 = (id)GKOSLoggers();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[GKNavigationController popToViewController:animated:](v8);
    }
    objc_super v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)GKNavigationController;
    objc_super v10 = [(GKNavigationController *)&v12 popToViewController:v6 animated:v4];
  }

  return v10;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(GKNavigationController *)self _isTransitioning])
  {
    [(GKNavigationController *)self _deferTransitionOfType:2 withViewController:0 animated:v3];
    BOOL v5 = (NSObject **)MEMORY[0x1E4F63860];
    id v6 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v7 = (id)GKOSLoggers();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[GKNavigationController popToRootViewControllerAnimated:](v6);
    }
    id v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKNavigationController;
    id v8 = [(GKNavigationController *)&v10 popToRootViewControllerAnimated:v3];
  }

  return v8;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(GKNavigationController *)self _isTransitioning])
  {
    [(GKNavigationController *)self _deferTransitionOfType:3 withViewController:v6 animated:v4];

    id v7 = (NSObject **)MEMORY[0x1E4F63860];
    id v8 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v9 = (id)GKOSLoggers();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[GKNavigationController pushViewController:animated:](v8);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKNavigationController;
    [(GKNavigationController *)&v10 pushViewController:v6 animated:v4];
  }
}

- (NSMutableArray)deferredTransitions
{
  return self->_deferredTransitions;
}

- (void)setDeferredTransitions:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)popViewControllerAnimated:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1_3() callStackSymbols];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1AF250000, v4, v5, "Deferring popViewController:animated:\n%@", v6, v7, v8, v9, v10);
}

- (void)popToViewController:(void *)a1 animated:.cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1_3() callStackSymbols];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1AF250000, v4, v5, "Deferring popToViewController:animated:\n%@", v6, v7, v8, v9, v10);
}

- (void)popToRootViewControllerAnimated:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1_3() callStackSymbols];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1AF250000, v4, v5, "Deferring popToRootViewControllerAnimated:\n%@", v6, v7, v8, v9, v10);
}

- (void)pushViewController:(void *)a1 animated:.cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = [(id)OUTLINED_FUNCTION_1_3() callStackSymbols];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1AF250000, v4, v5, "Deferring pushViewController:animated:\n%@", v6, v7, v8, v9, v10);
}

@end