@interface PHPickerViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)_popViewController;
- (NSCopying)_extensionRequestIdentifier;
- (NSExtension)_extension;
- (PHPickerConfiguration)configuration;
- (PHPickerViewController)init;
- (PHPickerViewController)initWithCoder:(NSCoder *)coder;
- (PHPickerViewController)initWithConfiguration:(PHPickerConfiguration *)configuration;
- (PHPickerViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (PUPickerExtensionHostContext)_extensionContext;
- (PUPickerRemoteViewController)_remoteViewController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_overlayStorage;
- (id)childViewControllerForStatusBarHidden;
- (id)delegate;
- (void)_addOrReplaceChildUnavailableViewController:(unint64_t)a3 error:(id)a4;
- (void)_addOrReplaceChildViewController:(id)a3;
- (void)_cancelExistingExtensionRequestIfPossible;
- (void)_finishPickingWithResults:(id)a3;
- (void)_handleRemoteViewControllerConnection:(id)a3 extension:(id)a4 extensionRequestIdentifier:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)_pickerDidFinishPicking:(id)a3;
- (void)_pickerDidPerformCancelAction;
- (void)_pickerDidPerformConfirmationAction;
- (void)_pickerDidSetModalInPresentation:(BOOL)a3;
- (void)_pickerDidSetOnboardingHeaderDismissed:(BOOL)a3;
- (void)_pickerDidSetOnboardingOverlayDismissed:(BOOL)a3;
- (void)_pickerUnavailableViewControllerCancelButtonTapped:(id)a3;
- (void)_pickerUnavailableViewControllerRetryButtonTapped:(id)a3;
- (void)_searchWithString:(id)a3;
- (void)_setExtension:(id)a3;
- (void)_setExtensionContext:(id)a3;
- (void)_setExtensionRequestIdentifier:(id)a3;
- (void)_setOverlayStorage:(id)a3;
- (void)_setRemoteViewController:(id)a3;
- (void)_setup:(id)a3;
- (void)_setupExtension:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)_updateSelectedAssetsWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)deselectAssetsWithIdentifiers:(NSArray *)identifiers;
- (void)moveAssetWithIdentifier:(NSString *)identifier afterAssetWithIdentifier:(NSString *)afterIdentifier;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)scrollToInitialPosition;
- (void)setDelegate:(id)delegate;
- (void)setModalInPresentation:(BOOL)a3;
- (void)updatePickerUsingConfiguration:(PHPickerUpdateConfiguration *)configuration;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation PHPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong(&self->__overlayStorage, 0);
  objc_storeStrong((id *)&self->__remoteViewController, 0);
  objc_storeStrong((id *)&self->__extensionContext, 0);
  objc_storeStrong((id *)&self->__extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->__extension, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_setOverlayStorage:(id)a3
{
}

- (id)_overlayStorage
{
  return self->__overlayStorage;
}

- (void)_setRemoteViewController:(id)a3
{
}

- (PUPickerRemoteViewController)_remoteViewController
{
  return self->__remoteViewController;
}

- (void)_setExtensionContext:(id)a3
{
}

- (PUPickerExtensionHostContext)_extensionContext
{
  return self->__extensionContext;
}

- (void)_setExtensionRequestIdentifier:(id)a3
{
}

- (NSCopying)_extensionRequestIdentifier
{
  return self->__extensionRequestIdentifier;
}

- (void)_setExtension:(id)a3
{
}

- (NSExtension)_extension
{
  return self->__extension;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (PHPickerConfiguration)configuration
{
  return self->_configuration;
}

- (id)childViewControllerForStatusBarHidden
{
  v2 = [(PHPickerViewController *)self childViewControllers];
  v3 = [v2 firstObject];

  return v3;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  v2 = [(PHPickerViewController *)self childViewControllers];
  v3 = [v2 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    if (!v4)
    {
      NSStringFromClass(v5);
      objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (PHPickerViewController *)_PFAssertFailHandler();
      [(PHPickerViewController *)v9 _pickerDidPerformConfirmationAction];
      return result;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (_UIRemoteViewController *)v4;
}

- (void)_pickerDidPerformConfirmationAction
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3 = [(PHPickerViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v3 _pickerDidPerformConfirmationAction:self];
    }
    else
    {
      id v4 = PLPickerGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_217C33000, v4, OS_LOG_TYPE_ERROR, "PHPickerViewControllerDelegate_Private doesn't respond to _pickerDidPerformConfirmationAction:", v7, 2u);
      }
    }
  }
  else
  {
    v5 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v5 _pickerDidPerformCancelAction];
  }
}

- (void)_pickerDidPerformCancelAction
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v3 = [(PHPickerViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v3 _pickerDidPerformCancelAction:self];
    }
    else
    {
      id v4 = PLPickerGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_217C33000, v4, OS_LOG_TYPE_ERROR, "PHPickerViewControllerDelegate_Private doesn't respond to _pickerDidPerformCancelAction:", v8, 2u);
      }
    }
  }
  else
  {
    v5 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v5 _pickerDidFinishPicking:v7];
  }
}

- (void)_pickerDidFinishPicking:(id)a3
{
  id v8 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (v8) {
      id v4 = v8;
    }
    else {
      id v4 = (id)MEMORY[0x263EFFA68];
    }
    [(PHPickerViewController *)self _finishPickingWithResults:v4];
  }
  else
  {
    v5 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v5 _pickerDidSetModalInPresentation:v7];
  }
}

- (void)_pickerDidSetModalInPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v8.receiver = self;
    v8.super_class = (Class)PHPickerViewController;
    [(PHPickerViewController *)&v8 setModalInPresentation:v3];
  }
  else
  {
    v5 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v5 _pickerDidSetOnboardingHeaderDismissed:v7];
  }
}

- (void)_pickerDidSetOnboardingHeaderDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHPickerViewController *)self configuration];
  v5 = [v4 _purposedLimitedLibraryApplicationIdentifier];

  SEL v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v8 = v6;
  if (v5) {
    BOOL v7 = @"com.apple.photos.picker.limitedlibrary.header";
  }
  else {
    BOOL v7 = @"com.apple.photos.picker.header";
  }
  [v6 setBool:v3 forKey:v7];
}

- (void)_pickerDidSetOnboardingOverlayDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setBool:v3 forKey:@"com.apple.photos.picker.overlay"];
}

- (void)_pickerUnavailableViewControllerRetryButtonTapped:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    id v4 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v4 _pickerUnavailableViewControllerCancelButtonTapped:v6];
    return;
  }
  [v7 updateReason:1 error:0];
  [(PHPickerViewController *)self _setup:0];
}

- (void)_pickerUnavailableViewControllerCancelButtonTapped:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    _PFAssertFailHandler();
    goto LABEL_16;
  }
  if (!v4)
  {
LABEL_16:
    uint64_t v17 = _PFAssertFailHandler();
    __77__PHPickerViewController__pickerUnavailableViewControllerCancelButtonTapped___block_invoke(v17);
    return;
  }
  SEL v5 = [(PHPickerViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = (void *)MEMORY[0x263EFF9D8];
    id v7 = [(PHPickerViewController *)self configuration];
    uint64_t v8 = [v7 preselectedAssetIdentifiers];
    v9 = (void *)v8;
    SEL v10 = (void *)MEMORY[0x263EFFA68];
    if (v8) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = MEMORY[0x263EFFA68];
    }
    v12 = [v6 orderedSetWithArray:v11];

    v13 = PFMap();
    v14 = (void *)[v13 copy];

    if (v14) {
      v15 = v14;
    }
    else {
      v15 = v10;
    }
    [v5 picker:self didFinishPicking:v15];
  }
  else
  {
    v16 = PLPickerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217C33000, v16, OS_LOG_TYPE_ERROR, "PHPickerViewControllerDelegate doesn't respond to picker:didFinishPicking:", buf, 2u);
    }
  }
}

id __77__PHPickerViewController__pickerUnavailableViewControllerCancelButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = objc_alloc_init(PUPhotosFileProviderItemProvider);
  id v4 = [[PHPickerResult alloc] _initWithItemProvider:v3 assetIdentifier:v2];

  return v4;
}

- (void)_addOrReplaceChildViewController:(id)a3
{
  v29[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  SEL v5 = [(PHPickerViewController *)self childViewControllers];
  unint64_t v6 = [v5 count];

  if (v6 >= 2) {
    _PFAssertFailHandler();
  }
  id v7 = [(PHPickerViewController *)self childViewControllers];
  uint64_t v8 = [v7 firstObject];

  if (v8)
  {
    [v8 willMoveToParentViewController:0];
    v9 = [v8 view];
    [v9 removeFromSuperview];

    [v8 removeFromParentViewController];
  }
  [v4 preferredContentSize];
  -[PHPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(PHPickerViewController *)self addChildViewController:v4];
  [(PHPickerViewController *)self view];
  SEL v10 = v28 = v8;
  uint64_t v11 = [v4 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 bounds];
  objc_msgSend(v11, "setFrame:");
  [v10 addSubview:v11];
  v22 = (void *)MEMORY[0x263F08938];
  v27 = [v11 topAnchor];
  v26 = [v10 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  v24 = [v11 bottomAnchor];
  v23 = [v10 bottomAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v29[1] = v21;
  v20 = [v11 leadingAnchor];
  v12 = [v10 leadingAnchor];
  v13 = [v20 constraintEqualToAnchor:v12];
  v29[2] = v13;
  v14 = [v11 trailingAnchor];
  v15 = [v10 trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v29[3] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  [v22 activateConstraints:v17];

  [v4 didMoveToParentViewController:self];
  v18 = [v4 contentScrollViewForEdge:1];
  v19 = [v4 contentScrollViewForEdge:4];
  [(PHPickerViewController *)self setContentScrollView:v18 forEdge:1];
  [(PHPickerViewController *)self setContentScrollView:v19 forEdge:4];
  [(PHPickerViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)_addOrReplaceChildUnavailableViewController:(unint64_t)a3 error:(id)a4
{
  id v10 = a4;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    unint64_t v6 = [(PHPickerViewController *)self configuration];
    id v7 = +[PUPickerUnavailableViewController unavailableViewController:a3 configuration:v6 error:v10 delegate:self];

    [(PHPickerViewController *)self _addOrReplaceChildViewController:v7];
  }
  else
  {
    uint64_t v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 _cancelExistingExtensionRequestIfPossible];
  }
}

- (void)_cancelExistingExtensionRequestIfPossible
{
  id v7 = [(PHPickerViewController *)self _extensionRequestIdentifier];
  if (v7)
  {
    BOOL v3 = [(PHPickerViewController *)self _extension];
    [v3 setRequestCancellationBlock:0];

    id v4 = [(PHPickerViewController *)self _extension];
    [v4 setRequestInterruptionBlock:0];

    SEL v5 = [(PHPickerViewController *)self _extension];
    [v5 setRequestCompletionBlock:0];

    unint64_t v6 = [(PHPickerViewController *)self _extension];
    [v6 cancelExtensionRequestWithIdentifier:v7];
  }
  [(PHPickerViewController *)self _setExtension:0];
  [(PHPickerViewController *)self _setExtensionRequestIdentifier:0];
  [(PHPickerViewController *)self _setExtensionContext:0];
  [(PHPickerViewController *)self _setRemoteViewController:0];
}

- (void)_finishPickingWithResults:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    SEL v5 = [(PHPickerViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      if (v4) {
        id v6 = v4;
      }
      else {
        id v6 = (id)MEMORY[0x263EFFA68];
      }
      [v5 picker:self didFinishPicking:v6];
    }
    else
    {
      id v7 = PLPickerGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_217C33000, v7, OS_LOG_TYPE_ERROR, "PHPickerViewControllerDelegate doesn't respond to picker:didFinishPicking:", v15, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 _handleRemoteViewControllerConnection:v10 extension:v11 extensionRequestIdentifier:v12 error:v13 completionHandler:v14];
  }
}

- (void)_handleRemoteViewControllerConnection:(id)a3 extension:(id)a4 extensionRequestIdentifier:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(void))a7;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    _PFAssertFailHandler();
LABEL_24:
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    objc_claimAutoreleasedReturnValue();
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    objc_claimAutoreleasedReturnValue();
    _PFAssertFailHandler();
    goto LABEL_25;
  }
  if (v13) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if (!v12 || !v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (v18) {
      [v13 cancelExtensionRequestWithIdentifier:v14];
    }
    [(PHPickerViewController *)self _addOrReplaceChildUnavailableViewController:0 error:v15];
    if (v16) {
      v16[2](v16);
    }
    goto LABEL_20;
  }
  [(PHPickerViewController *)self _cancelExistingExtensionRequestIfPossible];
  objc_initWeak(location, self);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke;
  v48[3] = &unk_2642C5838;
  objc_copyWeak(&v50, location);
  id v19 = v13;
  id v49 = v19;
  [v19 setRequestCancellationBlock:v48];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_3;
  v45[3] = &unk_2642C5888;
  objc_copyWeak(&v47, location);
  id v20 = v19;
  id v46 = v20;
  [v20 setRequestInterruptionBlock:v45];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_5;
  v42[3] = &unk_2642C58B0;
  id v36 = v15;
  objc_copyWeak(&v44, location);
  id v21 = v20;
  id v43 = v21;
  [v21 setRequestCompletionBlock:v42];
  [(PHPickerViewController *)self _setExtension:v21];
  [(PHPickerViewController *)self _setExtensionRequestIdentifier:v14];
  id v22 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  v23 = [v21 _extensionContextForUUID:v22];

  if (v23)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PHPickerViewController *)self _setExtensionContext:v23];

      v24 = [(PHPickerViewController *)self _extensionContext];
      [v24 setDelegate:self];

      id v25 = v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PHPickerViewController *)self _setRemoteViewController:v25];

        v26 = [(PHPickerViewController *)self _extensionContext];
        v27 = [v26 _auxiliaryConnection];
        v28 = [v27 exportedInterface];
        +[PUPickerExtensionContext setAllowedClassesForExtensionAuxiliaryHostInterface:v28];

        objc_initWeak(&from, v25);
        v29 = [(PHPickerViewController *)self _extensionContext];
        v30 = [v29 _auxiliaryConnection];
        v31 = [v30 remoteObjectProxy];

        objc_msgSend(v31, "_hostModalInPresentationDidChange:", -[PHPickerViewController isModalInPresentation](self, "isModalInPresentation"));
        v32 = [(PHPickerViewController *)self configuration];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_7;
        v37[3] = &unk_2642C5900;
        objc_copyWeak(&v39, location);
        objc_copyWeak(&v40, &from);
        v38 = v16;
        [v31 _updateConfiguration:v32 completionHandler:v37];
        id v15 = v36;

        objc_destroyWeak(&v40);
        objc_destroyWeak(&v39);

        objc_destroyWeak(&from);
        objc_destroyWeak(&v44);

        objc_destroyWeak(&v47);
        objc_destroyWeak(&v50);
        objc_destroyWeak(location);
LABEL_20:

        return;
      }
    }
    goto LABEL_24;
  }
  v33 = (objc_class *)objc_opt_class();
  NSStringFromClass(v33);
  objc_claimAutoreleasedReturnValue();
  _PFAssertFailHandler();
LABEL_25:
  __break(1u);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_2;
  block[3] = &unk_2642C5810;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_4;
  v2[3] = &unk_2642C5860;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_6;
  v2[3] = &unk_2642C5860;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_7(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_8;
  block[3] = &unk_2642C58D8;
  objc_copyWeak(&v4, a1 + 5);
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

uint64_t __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_8(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addOrReplaceChildViewController:v4];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = objc_loadWeakRetained(v2);
  [v5 postNotificationName:@"PPT_PickerFinishedLoading" object:v6];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_6(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _extension];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 _finishPickingWithResults:MEMORY[0x263EFFA68]];
  }
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _extension];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 _addOrReplaceChildUnavailableViewController:2 error:0];
  }
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained _extension];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 _addOrReplaceChildUnavailableViewController:0 error:*(void *)(a1 + 40)];
  }
}

- (void)_setupExtension:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke;
  v14[3] = &unk_2642C57E8;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_2;
    v11[3] = &unk_2642C57C0;
    objc_copyWeak(&v14, &location);
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    +[PUPickerRemoteViewController requestViewControllerForExtension:proposedSize:completionHandler:](PUPickerRemoteViewController, "requestViewControllerForExtension:proposedSize:completionHandler:", v2, v11, v5, v7);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    [v8 _handleRemoteViewControllerConnection:0 extension:0 extensionRequestIdentifier:0 error:v9 completionHandler:v10];
  }
}

void __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_3;
  v13[3] = &unk_2642C5798;
  objc_copyWeak(&v19, a1 + 6);
  id v14 = v8;
  id v15 = a1[4];
  id v16 = v7;
  id v17 = v9;
  id v18 = a1[5];
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v19);
}

void __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleRemoteViewControllerConnection:*(void *)(a1 + 32) extension:*(void *)(a1 + 40) extensionRequestIdentifier:*(void *)(a1 + 48) error:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)_setup:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = *MEMORY[0x263F07FE0];
  v13[0] = @"com.apple.mobileslideshow.photospicker";
  double v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_initWeak(&location, self);
  double v6 = (void *)MEMORY[0x263F08800];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__PHPickerViewController__setup___block_invoke;
  v8[3] = &unk_2642C5770;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 extensionsWithMatchingAttributes:v5 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __33__PHPickerViewController__setup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [v7 firstObject];

  [WeakRetained _setupExtension:v8 error:v6 completionHandler:*(void *)(a1 + 32)];
}

- (BOOL)_popViewController
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v2 = [(PHPickerViewController *)self _extensionContext];
  id v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_711];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__PHPickerViewController__popViewController__block_invoke_712;
  v6[3] = &unk_2642C5748;
  v6[4] = &v7;
  [v4 _popViewControllerWithReply:v6];
  LOBYTE(v2) = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __44__PHPickerViewController__popViewController__block_invoke_712(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__PHPickerViewController__popViewController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PLPickerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_217C33000, v3, OS_LOG_TYPE_ERROR, "Error getting synchronous remote object proxy: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_searchWithString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    id v5 = [(PHPickerViewController *)self _extensionContext];
    uint64_t v6 = [v5 _auxiliaryConnection];
    uint64_t v7 = [v6 remoteObjectProxy];

    [v7 _searchWithString:v11];
  }
  else
  {
    id v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 _updateSelectedAssetsWithIdentifiers:v10];
  }
}

- (void)_updateSelectedAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [(PHPickerViewController *)self _extensionContext];
    uint64_t v6 = [v5 _auxiliaryConnection];
    uint64_t v7 = [v6 remoteObjectProxy];

    [v7 _updateSelectedAssetsWithIdentifiers:v12];
  }
  else
  {
    id v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 _moveAssetWithIdentifier:v10 afterIdentifier:v11];
  }
}

- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    id v5 = [(PHPickerViewController *)self _extensionContext];
    uint64_t v6 = [v5 _auxiliaryConnection];
    uint64_t v7 = [v6 remoteObjectProxy];

    [v7 _stopActivityIndicatorsForAssetsWithIdentifiers:v11];
  }
  else
  {
    id v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 _startActivityIndicatorsForAssetsWithIdentifiers:v10];
  }
}

- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    id v5 = [(PHPickerViewController *)self _extensionContext];
    uint64_t v6 = [v5 _auxiliaryConnection];
    uint64_t v7 = [v6 remoteObjectProxy];

    [v7 _startActivityIndicatorsForAssetsWithIdentifiers:v11];
  }
  else
  {
    id v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 setModalInPresentation:v10];
  }
}

- (void)setModalInPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHPickerViewController;
  -[PHPickerViewController setModalInPresentation:](&v8, sel_setModalInPresentation_);
  id v5 = [(PHPickerViewController *)self _extensionContext];
  uint64_t v6 = [v5 _auxiliaryConnection];
  uint64_t v7 = [v6 remoteObjectProxy];

  [v7 _hostModalInPresentationDidChange:v3];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHPickerViewController;
  id v4 = a3;
  [(PHPickerViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[PHPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)dealloc
{
  [(PHPickerViewController *)self _cancelExistingExtensionRequestIfPossible];
  v3.receiver = self;
  v3.super_class = (Class)PHPickerViewController;
  [(PHPickerViewController *)&v3 dealloc];
}

- (PHPickerViewController)initWithCoder:(NSCoder *)coder
{
  objc_super v3 = coder;
  id v4 = (PHPickerViewController *)_PFAssertFailHandler();
  return [(PHPickerViewController *)v4 initWithNibName:v6 bundle:v7];
}

- (PHPickerViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  SEL v5 = nibNameOrNil;
  double v6 = nibBundleOrNil;
  double v7 = (PHPickerViewController *)_PFAssertFailHandler();
  return [(PHPickerViewController *)v7 init];
}

- (PHPickerViewController)init
{
  id v2 = (PHPickerViewController *)_PFAssertFailHandler();
  [(PHPickerViewController *)v2 zoomOut];
  return result;
}

- (void)zoomOut
{
  id v2 = [(PHPickerViewController *)self _extensionContext];
  SEL v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxy];

  [v4 _zoomOutContent];
}

- (void)zoomIn
{
  id v2 = [(PHPickerViewController *)self _extensionContext];
  SEL v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxy];

  [v4 _zoomInContent];
}

- (void)scrollToInitialPosition
{
  id v2 = [(PHPickerViewController *)self _extensionContext];
  SEL v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxy];

  [v4 _scrollContentToInitialPosition];
}

- (void)moveAssetWithIdentifier:(NSString *)identifier afterAssetWithIdentifier:(NSString *)afterIdentifier
{
  id v13 = identifier;
  double v6 = afterIdentifier;
  if (v13)
  {
    double v7 = [(PHPickerViewController *)self _extensionContext];
    SEL v8 = [v7 _auxiliaryConnection];
    objc_super v9 = [v8 remoteObjectProxy];

    [v9 _moveAssetWithIdentifier:v13 afterIdentifier:v6];
  }
  else
  {
    BOOL v10 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v10 deselectAssetsWithIdentifiers:v12];
  }
}

- (void)deselectAssetsWithIdentifiers:(NSArray *)identifiers
{
  id v4 = identifiers;
  if (!v4)
  {
    _PFAssertFailHandler();
    goto LABEL_7;
  }
  SEL v11 = v4;
  if (![(NSArray *)v4 count])
  {
LABEL_7:
    SEL v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 updatePickerUsingConfiguration:v10];
    return;
  }
  SEL v5 = [(PHPickerViewController *)self _extensionContext];
  double v6 = [v5 _auxiliaryConnection];
  double v7 = [v6 remoteObjectProxy];

  [v7 _deselectAssetsWithIdentifiers:v11];
}

- (void)updatePickerUsingConfiguration:(PHPickerUpdateConfiguration *)configuration
{
  id v4 = configuration;
  if (!v4)
  {
    _PFAssertFailHandler();
    goto LABEL_8;
  }
  SEL v11 = v4;
  if ([(PHPickerUpdateConfiguration *)v4 selectionLimit] < 0)
  {
LABEL_8:
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  if ([(PHPickerUpdateConfiguration *)v11 minimumSelectionLimit] < 0)
  {
LABEL_9:
    SEL v8 = (PHPickerViewController *)_PFAssertFailHandler();
    [(PHPickerViewController *)v8 initWithConfiguration:v10];
    return;
  }
  SEL v5 = [(PHPickerViewController *)self _extensionContext];
  double v6 = [v5 _auxiliaryConnection];
  double v7 = [v6 remoteObjectProxy];

  [v7 _updatePickerUsingUpdateConfiguration:v11];
}

- (PHPickerViewController)initWithConfiguration:(PHPickerConfiguration *)configuration
{
  id v4 = configuration;
  if (!v4)
  {
    _PFAssertFailHandler();
LABEL_26:
    _PFAssertFailHandler();
    goto LABEL_27;
  }
  SEL v5 = v4;
  double v6 = [(PHPickerConfiguration *)v4 photoLibrary];
  if (v6)
  {
  }
  else if ([(PHPickerConfiguration *)v5 _onlyReturnsIdentifiers])
  {
LABEL_38:
    _PFAssertFailHandler();
    goto LABEL_39;
  }
  if ([(PHPickerConfiguration *)v5 preferredAssetRepresentationMode] < 0) {
    goto LABEL_26;
  }
  if ([(PHPickerConfiguration *)v5 preferredAssetRepresentationMode] >= (PHPickerConfigurationAssetRepresentationModeCompatible|PHPickerConfigurationAssetRepresentationModeCurrent))
  {
LABEL_27:
    _PFAssertFailHandler();
    goto LABEL_28;
  }
  if ([(PHPickerConfiguration *)v5 selection] < 0)
  {
LABEL_28:
    _PFAssertFailHandler();
    goto LABEL_29;
  }
  if ([(PHPickerConfiguration *)v5 selection] >= 4)
  {
LABEL_29:
    _PFAssertFailHandler();
    goto LABEL_30;
  }
  if ([(PHPickerConfiguration *)v5 selectionLimit] < 0)
  {
LABEL_30:
    _PFAssertFailHandler();
    goto LABEL_31;
  }
  if ([(PHPickerConfiguration *)v5 minimumSelectionLimit] < 0)
  {
LABEL_31:
    _PFAssertFailHandler();
    goto LABEL_32;
  }
  double v7 = [(PHPickerConfiguration *)v5 preselectedAssetIdentifiers];

  if (!v7)
  {
LABEL_32:
    _PFAssertFailHandler();
    goto LABEL_33;
  }
  SEL v8 = [(PHPickerConfiguration *)v5 photoLibrary];
  if (v8)
  {

    goto LABEL_15;
  }
  SEL v9 = [(PHPickerConfiguration *)v5 preselectedAssetIdentifiers];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
LABEL_15:
    if (([(PHPickerConfiguration *)v5 mode] & 0x8000000000000000) == 0)
    {
      if ([(PHPickerConfiguration *)v5 mode] < 2)
      {
        if (([(PHPickerConfiguration *)v5 _sourceType] & 0x8000000000000000) == 0)
        {
          if ([(PHPickerConfiguration *)v5 _sourceType] < 7)
          {
            v22.receiver = self;
            v22.super_class = (Class)PHPickerViewController;
            SEL v11 = [(PHPickerViewController *)&v22 initWithNibName:0 bundle:0];
            if (!v11)
            {
LABEL_24:

              return v11;
            }
            if ([(PHPickerViewController *)v11 isMemberOfClass:objc_opt_class()])
            {
              uint64_t v12 = [(PHPickerConfiguration *)v5 copy];
              id v13 = v11->_configuration;
              v11->_configuration = (PHPickerConfiguration *)v12;

              id v14 = PLServicesLocalizedFrameworkString();
              [(PHPickerViewController *)v11 setTitle:v14];

              [(PHPickerViewController *)v11 setModalPresentationStyle:2];
              [(PHPickerViewController *)v11 _addOrReplaceChildUnavailableViewController:1 error:0];
              id v15 = 0;
              if (![(PHPickerConfiguration *)v5 _alwaysShowLoadingPlaceholder])
              {
                [(PHPickerViewController *)v11 _beginDelayingPresentation:0 cancellationHandler:3.0];
                objc_initWeak(&location, v11);
                aBlock[0] = MEMORY[0x263EF8330];
                aBlock[1] = 3221225472;
                aBlock[2] = __48__PHPickerViewController_initWithConfiguration___block_invoke;
                aBlock[3] = &unk_2642C5700;
                char v20 = 0;
                objc_copyWeak(&v19, &location);
                id v15 = _Block_copy(aBlock);
                objc_destroyWeak(&v19);
                objc_destroyWeak(&location);
              }
              [(PHPickerViewController *)v11 _setup:v15];

              goto LABEL_24;
            }
            goto LABEL_37;
          }
LABEL_36:
          _PFAssertFailHandler();
LABEL_37:
          _PFAssertFailHandler();
          goto LABEL_38;
        }
LABEL_35:
        _PFAssertFailHandler();
        goto LABEL_36;
      }
LABEL_34:
      _PFAssertFailHandler();
      goto LABEL_35;
    }
LABEL_33:
    _PFAssertFailHandler();
    goto LABEL_34;
  }
LABEL_39:
  uint64_t v17 = _PFAssertFailHandler();
  __48__PHPickerViewController_initWithConfiguration___block_invoke(v17);
  return result;
}

void __48__PHPickerViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _endDelayingPresentation];
  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

@end