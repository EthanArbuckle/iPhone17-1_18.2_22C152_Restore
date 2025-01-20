@interface _SFICSPreviewViewController
- (_SFICSPreviewViewController)initWithFilePath:(id)a3 sourceURL:(id)a4;
- (id)beforeDismissHandler;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_done:(id)a3;
- (void)_ensureLeftBarButtonItemsIncludesActivityItem:(id)a3;
- (void)_ensureLeftBarButtonItemsIncludesDoneItem:(id)a3;
- (void)_presentActivityViewController:(id)a3;
- (void)_updateNavigationBarItems;
- (void)icsPreviewControllerWantsDismissal:(id)a3;
- (void)setBeforeDismissHandler:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _SFICSPreviewViewController

- (_SFICSPreviewViewController)initWithFilePath:(id)a3 sourceURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    id v9 = v7;
    id v10 = v8;
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v12 = (void *)getEKEventStoreClass_softClass;
    uint64_t v38 = getEKEventStoreClass_softClass;
    if (!getEKEventStoreClass_softClass)
    {
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      v32 = __getEKEventStoreClass_block_invoke;
      v33 = &unk_1E5C723B0;
      v34 = &v35;
      __getEKEventStoreClass_block_invoke((uint64_t)&v30);
      v12 = (void *)v36[3];
    }
    id obj = a4;
    id v28 = v8;
    v13 = v12;
    _Block_object_dispose(&v35, 8);
    id v14 = objc_alloc_init(v13);
    v15 = [MEMORY[0x1E4F74230] sharedConnection];
    if ([v15 isURLManaged:v10]) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }

    [v14 setSourceAccountManagement:v16];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v17 = (void *)getEKICSPreviewControllerClass_softClass;
    uint64_t v38 = getEKICSPreviewControllerClass_softClass;
    if (!getEKICSPreviewControllerClass_softClass)
    {
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      v32 = __getEKICSPreviewControllerClass_block_invoke;
      v33 = &unk_1E5C723B0;
      v34 = &v35;
      __getEKICSPreviewControllerClass_block_invoke((uint64_t)&v30);
      v17 = (void *)v36[3];
    }
    v18 = v17;
    _Block_object_dispose(&v35, 8);
    v19 = (void *)[[v18 alloc] initWithData:v11 eventStore:v14];
    [v19 setAllowsEditing:1];
    [v19 setAllowsImport:1];

    if (v19)
    {
      v20 = [v19 viewController];
      v29.receiver = self;
      v29.super_class = (Class)_SFICSPreviewViewController;
      self = [(_SFICSPreviewViewController *)&v29 initWithRootViewController:v20];

      id v8 = v28;
      if (self)
      {
        objc_storeStrong((id *)&self->_filePath, a3);
        objc_storeStrong((id *)&self->_sourceURL, obj);
        objc_storeStrong((id *)&self->_icsController, v19);
        [(EKICSPreviewController *)self->_icsController setPreviewDelegate:self];
        v21 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__presentActivityViewController_];
        activityBarButtonItem = self->_activityBarButtonItem;
        self->_activityBarButtonItem = v21;

        v23 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
        doneBarButtonItem = self->_doneBarButtonItem;
        self->_doneBarButtonItem = v23;

        self = self;
        v25 = self;
      }
      else
      {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
      id v8 = v28;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFICSPreviewViewController;
  [(_SFICSPreviewViewController *)&v4 viewWillAppear:a3];
  [(_SFICSPreviewViewController *)self _updateNavigationBarItems];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFICSPreviewViewController;
  [(_SFICSPreviewViewController *)&v5 viewWillDisappear:a3];
  if (self->_beforeDismissHandler)
  {
    if ([(_SFICSPreviewViewController *)self isBeingDismissed])
    {
      (*((void (**)(void))self->_beforeDismissHandler + 2))();
      id beforeDismissHandler = self->_beforeDismissHandler;
      self->_id beforeDismissHandler = 0;
    }
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_SFICSPreviewViewController;
  [(_SFICSPreviewViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_super v4 = [(_SFICSPreviewViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFICSPreviewViewController;
  objc_super v5 = -[_SFICSPreviewViewController popViewControllerAnimated:](&v9, sel_popViewControllerAnimated_);
  if ((_SFDeviceIsPad() & 1) == 0 && !v5)
  {
    v6 = [(_SFICSPreviewViewController *)self topViewController];
    id v7 = [(_SFICSPreviewViewController *)self bottomViewController];

    if (v6 == v7) {
      [(_SFICSPreviewViewController *)self dismissViewControllerAnimated:v3 completion:0];
    }
  }

  return v5;
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
}

- (void)_presentActivityViewController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [[_SFOpenInOtherAppActivityViewController alloc] initWithFilePath:self->_filePath UTI:@"com.apple.ical.ics" sourceURL:self->_sourceURL];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  objc_super v9 = __62___SFICSPreviewViewController__presentActivityViewController___block_invoke;
  id v10 = &unk_1E5C737A8;
  objc_copyWeak(&v11, &location);
  [(_SFOpenInOtherAppActivityViewController *)v5 setCompletionWithItemsHandler:&v7];
  -[_SFOpenInOtherAppActivityViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7, v7, v8, v9, v10);
  v6 = [(_SFOpenInOtherAppActivityViewController *)v5 popoverPresentationController];
  [v6 setBarButtonItem:v4];

  [(_SFICSPreviewViewController *)self presentViewController:v5 animated:1 completion:0];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_done:(id)a3
{
}

- (void)_ensureLeftBarButtonItemsIncludesActivityItem:(id)a3
{
  id v6 = a3;
  if (+[_SFOpenInOtherAppActivityViewController canOpenWithFilePath:self->_filePath UTI:@"com.apple.ical.ics" sourceURL:self->_sourceURL])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    objc_super v5 = [v6 leftBarButtonItem];
    if (v5) {
      [v4 addObject:v5];
    }
    if (([v4 containsObject:self->_activityBarButtonItem] & 1) == 0) {
      [v4 insertObject:self->_activityBarButtonItem atIndex:0];
    }
    [v6 setLeftBarButtonItems:v4];
  }
}

- (void)_ensureLeftBarButtonItemsIncludesDoneItem:(id)a3
{
  id v6 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = [v6 leftBarButtonItem];
  if (v5) {
    [v4 addObject:v5];
  }
  if (([v4 containsObject:self->_doneBarButtonItem] & 1) == 0) {
    [v4 insertObject:self->_doneBarButtonItem atIndex:0];
  }
  [v6 setLeftBarButtonItems:v4];
}

- (void)_updateNavigationBarItems
{
  BOOL v3 = [(_SFICSPreviewViewController *)self bottomViewController];
  id v4 = [v3 navigationItem];
  [v3 view];

  [(_SFICSPreviewViewController *)self _ensureLeftBarButtonItemsIncludesActivityItem:v4];
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2050000000;
  objc_super v5 = (void *)getEKEventViewControllerClass_softClass;
  uint64_t v11 = getEKEventViewControllerClass_softClass;
  if (!getEKEventViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getEKEventViewControllerClass_block_invoke;
    v7[3] = &unk_1E5C723B0;
    v7[4] = &v8;
    __getEKEventViewControllerClass_block_invoke((uint64_t)v7);
    objc_super v5 = (void *)v9[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v8, 8);
  if (objc_opt_isKindOfClass()) {
    [v3 setShowsDoneButton:1];
  }
  else {
    [(_SFICSPreviewViewController *)self _ensureLeftBarButtonItemsIncludesDoneItem:v4];
  }
}

- (id)beforeDismissHandler
{
  return self->_beforeDismissHandler;
}

- (void)setBeforeDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beforeDismissHandler, 0);
  objc_storeStrong((id *)&self->_icsController, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);

  objc_storeStrong((id *)&self->_filePath, 0);
}

@end