@interface RPPreviewViewController
+ (void)loadPreviewViewControllerWithMovieURL:(id)a3 attachmentURL:(id)a4 overrideShareMessage:(id)a5 overrideTintColor:(id)a6 completion:(id)a7;
+ (void)loadPreviewViewControllerWithMovieURL:(id)a3 completion:(id)a4;
+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5;
- (BOOL)wasStatusBarHidden;
- (NSURL)movieURL;
- (RPVideoEditorHostViewController)hostViewController;
- (id)previewControllerDelegate;
- (void)extensionDidFinishWithActivityTypes:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setMovieURL:(id)a3;
- (void)setPreviewControllerDelegate:(id)previewControllerDelegate;
- (void)setWasStatusBarHidden:(BOOL)a3;
- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RPPreviewViewController

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RPPreviewViewController;
  [(RPPreviewViewController *)&v7 viewWillAppear:a3];
  v4 = +[RPScreenRecorder sharedRecorder];
  [v4 setWindowRotationLocked:1];

  v5 = [MEMORY[0x263F1C408] sharedApplication];
  -[RPPreviewViewController setWasStatusBarHidden:](self, "setWasStatusBarHidden:", [v5 isStatusBarHidden]);

  v6 = [MEMORY[0x263F1C408] sharedApplication];
  [v6 setStatusBarHidden:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RPPreviewViewController;
  [(RPPreviewViewController *)&v3 viewDidAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RPPreviewViewController *)self wasStatusBarHidden];
  v6 = [MEMORY[0x263F1C408] sharedApplication];
  [v6 setStatusBarHidden:v5];

  v7.receiver = self;
  v7.super_class = (Class)RPPreviewViewController;
  [(RPPreviewViewController *)&v7 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RPPreviewViewController;
  [(RPPreviewViewController *)&v4 viewDidDisappear:a3];
  BOOL v3 = +[RPScreenRecorder sharedRecorder];
  [v3 setWindowRotationLocked:0];
}

+ (void)loadPreviewViewControllerWithMovieURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() loadPreviewViewControllerWithMovieURL:v6 attachmentURL:0 overrideShareMessage:0 overrideTintColor:0 completion:v5];
}

+ (void)loadPreviewViewControllerWithMovieURL:(id)a3 attachmentURL:(id)a4 overrideShareMessage:(id)a5 overrideTintColor:(id)a6 completion:(id)a7
{
  v73[1] = *MEMORY[0x263EF8340];
  id v61 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, void))a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPVideoPreviewViewController:loadPreviewViewControllerWithCompletion", buf, 2u);
  }
  id v66 = 0;
  v62 = [MEMORY[0x263F08800] extensionWithIdentifier:@"com.apple.ReplayKit.RPVideoEditorExtension" error:&v66];
  id v15 = v66;
  if (v15 || !v62)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[RPPreviewViewController loadPreviewViewControllerWithMovieURL:attachmentURL:overrideShareMessage:overrideTintColor:completion:](v15);
    }
    v14[2](v14, 0);
  }
  else
  {
    v60 = [MEMORY[0x263EFF980] array];
    v16 = (void *)MEMORY[0x263F01A08];
    if (v11)
    {
      id v17 = objc_alloc_init(MEMORY[0x263F08810]);
      v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPVideoEditorExtensionFileAttachmentKey" attributes:0];
      [v17 setAttributedTitle:v18];

      id v19 = objc_alloc(MEMORY[0x263F088E0]);
      v20 = [v11 path];
      v21 = (void *)[v19 initWithItem:v20 typeIdentifier:*v16];
      v73[0] = v21;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:1];
      v22 = v14;
      v24 = id v23 = v13;
      [v17 setAttachments:v24];

      id v13 = v23;
      v14 = v22;

      [v60 addObject:v17];
    }
    if (v12)
    {
      id v25 = objc_alloc_init(MEMORY[0x263F08810]);
      v26 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPVideoEditorExtensionOverrideShareMessageKey" attributes:0];
      [v25 setAttributedTitle:v26];

      id v27 = objc_alloc(MEMORY[0x263F088E0]);
      v28 = (void *)[v27 initWithItem:v12 typeIdentifier:*MEMORY[0x263F01A08]];
      v72 = v28;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
      [v25 setAttachments:v29];

      [v60 addObject:v25];
    }
    v30 = (uint64_t *)MEMORY[0x263F01A08];
    id v59 = v11;
    v57 = v14;
    id v58 = v13;
    if (v13)
    {
      id v31 = objc_alloc_init(MEMORY[0x263F08810]);
      v32 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPVideoEditorExtensionOverrideTintColorKey" attributes:0];
      [v31 setAttributedTitle:v32];

      id v33 = objc_alloc(MEMORY[0x263F088E0]);
      uint64_t v34 = *v30;
      v35 = (void *)[v33 initWithItem:v13 typeIdentifier:*v30];
      v71 = v35;
      v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
      [v31 setAttachments:v36];

      [v60 addObject:v31];
    }
    else
    {
      uint64_t v34 = *MEMORY[0x263F01A08];
    }
    v55 = [MEMORY[0x263F086E0] mainBundle];
    [v55 load];
    v37 = [v55 infoDictionary];
    v56 = [v37 objectForKey:*MEMORY[0x263EFFA90]];

    id v38 = objc_alloc_init(MEMORY[0x263F08810]);
    v39 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPVideoEditorExtensionAppNameKey" attributes:0];
    [v38 setAttributedTitle:v39];

    v40 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithItem:v56 typeIdentifier:v34];
    v70 = v40;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
    [v38 setAttachments:v41];

    [v60 addObject:v38];
    id v42 = objc_alloc_init(MEMORY[0x263F08810]);
    v43 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPVideoEditorExtensionMovieURLKey" attributes:0];
    [v42 setAttributedTitle:v43];

    id v44 = objc_alloc(MEMORY[0x263F088E0]);
    v45 = [v61 path];
    v46 = (void *)[v44 initWithItem:v45 typeIdentifier:v34];
    v69 = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
    [v42 setAttachments:v47];

    [v60 addObject:v42];
    id v48 = objc_alloc_init(MEMORY[0x263F08810]);
    v49 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"RPVideoEditorExtensionBundleIdentifierKey" attributes:0];
    [v48 setAttributedTitle:v49];

    id v50 = objc_alloc(MEMORY[0x263F088E0]);
    v51 = [v55 bundleIdentifier];
    v52 = (void *)[v50 initWithItem:v51 typeIdentifier:v34];
    v68 = v52;
    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
    [v48 setAttachments:v53];

    [v60 addObject:v48];
    v54 = objc_opt_class();
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke;
    v63[3] = &unk_26451DD78;
    id v64 = v61;
    v14 = v57;
    v65 = v57;
    [v54 viewControllerForExtension:v62 inputItems:v60 completionHandler:v63];

    id v11 = v59;
    id v13 = v58;
    id v15 = 0;
  }
}

void __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke_2;
  block[3] = &unk_26451D758;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke_2(uint64_t a1)
{
  id v15 = objc_alloc_init(RPPreviewViewController);
  [(RPPreviewViewController *)v15 setMovieURL:*(void *)(a1 + 32)];
  id v2 = *(id *)(a1 + 40);
  [v2 setPreviewViewController:v15];
  [(RPPreviewViewController *)v15 setHostViewController:v2];
  id v3 = [(RPPreviewViewController *)v15 view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v2 view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(RPPreviewViewController *)v15 addChildViewController:v2];
  id v13 = [(RPPreviewViewController *)v15 view];
  v14 = [v2 view];
  [v13 addSubview:v14];

  [v2 didMoveToParentViewController:v15];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPPreviewViewController:viewControllerForExtension", buf, 2u);
  }
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke;
    v10[3] = &unk_26451DD00;
    id v11 = v7;
    id v12 = v9;
    [v11 instantiateViewControllerWithInputItems:v8 connectionHandler:v10];
  }
}

void __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  double v10 = [*(id *)(a1 + 32) _extensionContextForUUID:a2];
  [v10 setHostViewController:v9];
  [v9 setHostContext:v10];
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_cold_1(v8);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
    }
  }
}

- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewControllerDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke;
    block[3] = &unk_26451D7A8;
    void block[4] = self;
    id v12 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  id v8 = objc_loadWeakRetained((id *)&self->_previewControllerDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke_2;
    v10[3] = &unk_26451D7F0;
    void v10[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  [WeakRetained previewController:v2 didFinishWithActivityTypes:v3];
}

void __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [WeakRetained previewControllerDidFinish:*(void *)(a1 + 32)];
}

- (void)extensionDidFinishWithActivityTypes:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPPreviewViewController:extensionDidFinish", buf, 2u);
  }
  id v5 = [(RPPreviewViewController *)self previewControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke;
    block[3] = &unk_26451D7A8;
    void block[4] = self;
    id v11 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  char v7 = [(RPPreviewViewController *)self previewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke_2;
    v9[3] = &unk_26451D7F0;
    v9[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) previewControllerDelegate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  [v4 previewController:v2 didFinishWithActivityTypes:v3];
}

void __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewControllerDelegate];
  [v2 previewControllerDidFinish:*(void *)(a1 + 32)];
}

- (id)previewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewControllerDelegate);

  return WeakRetained;
}

- (void)setPreviewControllerDelegate:(id)previewControllerDelegate
{
}

- (BOOL)wasStatusBarHidden
{
  return self->_wasStatusBarHidden;
}

- (void)setWasStatusBarHidden:(BOOL)a3
{
  self->_wasStatusBarHidden = a3;
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (void)setMovieURL:(id)a3
{
}

- (RPVideoEditorHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);

  objc_destroyWeak((id *)&self->_previewControllerDelegate);
}

+ (void)loadPreviewViewControllerWithMovieURL:(void *)a1 attachmentURL:overrideShareMessage:overrideTintColor:completion:.cold.1(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = [a1 code];
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error getting extension: %i", (uint8_t *)v1, 8u);
}

void __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = [a1 code];
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error instantiating remote view controller for extension: %i", (uint8_t *)v1, 8u);
}

@end