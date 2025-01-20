@interface HUTableViewController
- (BOOL)isViewLayingOut;
- (BOOL)sectionContentInsetFollowsLayoutMargins;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (HUTableViewController)initWithCoder:(id)a3;
- (HUTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HUTableViewController)initWithStyle:(int64_t)a3;
- (NSHashTable)childViewControllersAtViewWillAppearTime;
- (NSHashTable)childViewControllersAtViewWillDisappearTime;
- (NSMapTable)installedChildViewControllersKeyedByCell;
- (void)contentSizeCategoryDidChange;
- (void)didUpdateRequiredHeightForCell:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setChildViewControllersAtViewWillAppearTime:(id)a3;
- (void)setChildViewControllersAtViewWillDisappearTime:(id)a3;
- (void)setInstalledChildViewControllersKeyedByCell:(id)a3;
- (void)setSectionContentInsetFollowsLayoutMargins:(BOOL)a3;
- (void)setViewLayingOut:(BOOL)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HUTableViewController

- (HUTableViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTableViewController;
  v3 = [(HUTableViewController *)&v7 initWithStyle:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    installedChildViewControllersKeyedByCell = v3->_installedChildViewControllersKeyedByCell;
    v3->_installedChildViewControllersKeyedByCell = (NSMapTable *)v4;

    v3->_sectionContentInsetFollowsLayoutMargins = 1;
  }
  return v3;
}

- (HUTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_super v7 = NSStringFromSelector(sel_initWithStyle_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTableViewController.m", 41, @"%s is unavailable; use %@ instead",
    "-[HUTableViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUTableViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithStyle_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTableViewController.m", 46, @"%s is unavailable; use %@ instead",
    "-[HUTableViewController initWithCoder:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUTableViewController;
  [(HUTableViewController *)&v8 viewDidLoad];
  v3 = [(HUTableViewController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  double v4 = *MEMORY[0x1E4F43D18];
  v5 = [(HUTableViewController *)self tableView];
  [v5 setRowHeight:v4];

  v6 = [(HUTableViewController *)self tableView];
  [v6 setKeyboardDismissMode:1];

  objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];
}

- (void)contentSizeCategoryDidChange
{
  id v2 = [(HUTableViewController *)self tableView];
  [v2 setNeedsLayout];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: viewWillAppear", buf, 0xCu);
  }

  [(HUTableViewController *)self setChildViewControllersAtViewWillDisappearTime:0];
  v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [(HUTableViewController *)self setChildViewControllersAtViewWillAppearTime:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = [(HUTableViewController *)self childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13 = [(HUTableViewController *)self childViewControllersAtViewWillAppearTime];
        [v13 addObject:v12];

        [v12 beginAppearanceTransition:1 animated:v3];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HUTableViewController;
  [(HUTableViewController *)&v16 viewDidAppear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v7 = [(HUTableViewController *)self childViewControllersAtViewWillAppearTime];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
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
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) endAppearanceTransition];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)HUTableViewController;
  -[HUTableViewController viewWillDisappear:](&v18, sel_viewWillDisappear_);
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: viewWillDisappear", buf, 0xCu);
  }

  [(HUTableViewController *)self setChildViewControllersAtViewWillAppearTime:0];
  v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [(HUTableViewController *)self setChildViewControllersAtViewWillDisappearTime:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = [(HUTableViewController *)self childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        long long v13 = [(HUTableViewController *)self childViewControllersAtViewWillDisappearTime];
        [v13 addObject:v12];

        [v12 beginAppearanceTransition:0 animated:v3];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HUTableViewController;
  [(HUTableViewController *)&v16 viewDidDisappear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v7 = [(HUTableViewController *)self childViewControllersAtViewWillDisappearTime];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
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
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) endAppearanceTransition];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUTableViewController;
  [(HUTableViewController *)&v5 viewWillLayoutSubviews];
  BOOL v3 = [(HUTableViewController *)self sectionContentInsetFollowsLayoutMargins];
  double v4 = [(HUTableViewController *)self tableView];
  [v4 _setSectionContentInsetFollowsLayoutMargins:v3];

  [(HUTableViewController *)self setViewLayingOut:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUTableViewController;
  [(HUTableViewController *)&v3 viewDidLayoutSubviews];
  [(HUTableViewController *)self setViewLayingOut:0];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(HUTableViewController *)self isViewLayingOut])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v5 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
    v6 = [v5 keyEnumerator];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) viewController];
          int v12 = [v11 isEqual:v4];

          if (v12)
          {
            long long v13 = [(HUTableViewController *)self tableView];
            [v13 reloadData];

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)setSectionContentInsetFollowsLayoutMargins:(BOOL)a3
{
  if (self->_sectionContentInsetFollowsLayoutMargins != a3)
  {
    self->_sectionContentInsetFollowsLayoutMargins = a3;
    id v3 = [(HUTableViewController *)self tableView];
    [v3 setNeedsLayout];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [v7 viewController];
    if (v8)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v9 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
      uint64_t v10 = (void *)[v9 copy];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v23 = v6;
        id obj = v10;
        char v13 = 0;
        uint64_t v14 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(id *)(*((void *)&v25 + 1) + 8 * i);
            long long v17 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
            objc_super v18 = [v17 objectForKey:v16];

            if (v18 == v8 && v16 != v7)
            {
              __int16 v20 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
              [v20 removeObjectForKey:v16];

              [v16 setViewController:0];
              char v13 = 1;
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v12);

        id v6 = v23;
        if (v13)
        {
          [v7 addToParentViewController:self];
          v21 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
          [v21 setObject:v8 forKey:v7];

          goto LABEL_19;
        }
      }
      else
      {
      }
      [v8 beginAppearanceTransition:1 animated:0];
      [v7 addToParentViewController:self];
      uint64_t v22 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
      [v22 setObject:v8 forKey:v7];

      [v8 endAppearanceTransition];
    }
LABEL_19:
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v14;
  if (isKindOfClass)
  {
    id v8 = v14;
    uint64_t v9 = [v8 viewController];
    uint64_t v10 = [v9 parentViewController];
    if (v10 == self)
    {
      uint64_t v11 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
      uint64_t v12 = [v11 objectForKey:v8];

      if (v12 == v9)
      {
        [v9 beginAppearanceTransition:0 animated:0];
        [v8 removeFromParentViewController];
        char v13 = [(HUTableViewController *)self installedChildViewControllersKeyedByCell];
        [v13 removeObjectForKey:v8];

        [v9 endAppearanceTransition];
      }
    }
    else
    {
    }
    id v7 = v14;
  }
}

- (void)didUpdateRequiredHeightForCell:(id)a3
{
  if (![(HUTableViewController *)self isViewLayingOut])
  {
    id v4 = [(HUTableViewController *)self tableView];
    [v4 beginUpdates];

    id v5 = [(HUTableViewController *)self tableView];
    [v5 endUpdates];
  }
}

- (BOOL)sectionContentInsetFollowsLayoutMargins
{
  return self->_sectionContentInsetFollowsLayoutMargins;
}

- (NSHashTable)childViewControllersAtViewWillAppearTime
{
  return self->_childViewControllersAtViewWillAppearTime;
}

- (void)setChildViewControllersAtViewWillAppearTime:(id)a3
{
}

- (NSHashTable)childViewControllersAtViewWillDisappearTime
{
  return self->_childViewControllersAtViewWillDisappearTime;
}

- (void)setChildViewControllersAtViewWillDisappearTime:(id)a3
{
}

- (NSMapTable)installedChildViewControllersKeyedByCell
{
  return self->_installedChildViewControllersKeyedByCell;
}

- (void)setInstalledChildViewControllersKeyedByCell:(id)a3
{
}

- (BOOL)isViewLayingOut
{
  return self->_viewLayingOut;
}

- (void)setViewLayingOut:(BOOL)a3
{
  self->_viewLayingOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedChildViewControllersKeyedByCell, 0);
  objc_storeStrong((id *)&self->_childViewControllersAtViewWillDisappearTime, 0);

  objc_storeStrong((id *)&self->_childViewControllersAtViewWillAppearTime, 0);
}

@end