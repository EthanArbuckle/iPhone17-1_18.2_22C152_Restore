@interface SKStoreProductActivityViewController
- (SKStoreProductActivityViewController)init;
- (SKStoreProductActivityViewController)initWithCoder:(id)a3;
- (SKStoreProductActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKStoreProductActivityViewController)initWithParameters:(id)a3;
- (SKStoreProductActivityViewControllerDelegate)delegate;
- (void)_addRemoteView;
- (void)_didFinishWithResult:(unint64_t)a3 error:(id)a4;
- (void)_requestRemoteViewController;
- (void)_viewTapped:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SKStoreProductActivityViewController

- (SKStoreProductActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[SKStoreProductActivityViewController initWithParameters:](self, "initWithParameters:", MEMORY[0x1E4F1CC08], a4);
}

- (SKStoreProductActivityViewController)initWithCoder:(id)a3
{
  return [(SKStoreProductActivityViewController *)self initWithParameters:MEMORY[0x1E4F1CC08]];
}

- (SKStoreProductActivityViewController)init
{
  return [(SKStoreProductActivityViewController *)self initWithParameters:MEMORY[0x1E4F1CC08]];
}

- (SKStoreProductActivityViewController)initWithParameters:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SKStoreProductActivityViewController;
  v5 = [(SKStoreProductActivityViewController *)&v19 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[SKInvocationQueueProxy alloc] initWithProtocol:&unk_1F08F1848];
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = (SKUIServiceProductActivityViewController *)v6;

    uint64_t v8 = [v4 copy];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v8;

    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [v10 UUIDString];
    v12 = [v11 componentsSeparatedByString:@"-"];
    uint64_t v13 = [v12 firstObject];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v13;

    [(SKStoreProductActivityViewController *)v5 setModalPresentationStyle:17];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      v16 = v5->_logKey;
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2114;
      v23 = v16;
      id v17 = v15;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Start.", buf, 0x16u);
    }
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v9 = v3;
    __int16 v10 = 2114;
    v11 = logKey;
    id v5 = v3;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Dealloc.", buf, 0x16u);
  }
  id v6 = (id)[(_UIAsyncInvocation *)self->_cancelRequest invoke];
  [(SKUIServiceProductActivityViewController *)self->_serviceProxy setInvocationTarget:0];
  [(SKRemoteProductActivityViewController *)self->_remoteViewController setProductActivityViewController:0];
  v7.receiver = self;
  v7.super_class = (Class)SKStoreProductActivityViewController;
  [(SKStoreProductActivityViewController *)&v7 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SKStoreProductActivityViewController;
  [(SKStoreProductActivityViewController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  id v4 = [(SKStoreProductActivityViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(SKStoreProductActivityViewController *)self _requestRemoteViewController];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__viewTapped_];
  id v6 = [(SKStoreProductActivityViewController *)self view];
  [v6 setUserInteractionEnabled:1];

  objc_super v7 = [(SKStoreProductActivityViewController *)self view];
  [v7 addGestureRecognizer:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    v14 = logKey;
    id v7 = v5;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Will disappear.", buf, 0x16u);
  }
  v10.receiver = self;
  v10.super_class = (Class)SKStoreProductActivityViewController;
  [(SKStoreProductActivityViewController *)&v10 viewWillDisappear:v3];
  serviceProxy = self->_serviceProxy;
  v9 = [NSNumber numberWithBool:v3];
  [(SKUIServiceProductActivityViewController *)serviceProxy finishImmediately:v9];
}

- (void)_didFinishWithResult:(unint64_t)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)v23 = 138543618;
    *(void *)&v23[4] = v7;
    *(_WORD *)&v23[12] = 2114;
    *(void *)&v23[14] = logKey;
    id v9 = v7;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@] Finished.", v23, 0x16u);
  }
  if (([(SKStoreProductActivityViewController *)self isBeingDismissed] & 1) == 0)[(SKStoreProductActivityViewController *)self dismissViewControllerAnimated:0 completion:0]; {
  objc_super v10 = [(SKStoreProductActivityViewController *)self presentingViewController];
  }
  if (v6)
  {
    v11 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v12 = [v6 localizedDescription];
    __int16 v13 = [v11 alertControllerWithTitle:v12 message:0 preferredStyle:1];

    v14 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"OK" value:&stru_1F08A7B80 table:0];
    id v17 = [v14 actionWithTitle:v16 style:0 handler:0];
    [v13 addAction:v17];

    [v10 presentViewController:v13 animated:1 completion:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_super v19 = WeakRetained;
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->_delegate);
      [v22 productActivityViewController:self didFinishWithResult:a3];
    }
  }
}

- (void)_requestRemoteViewController
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SKStoreProductActivityViewController__requestRemoteViewController__block_invoke;
  v5[3] = &unk_1E5FA9D18;
  v5[4] = self;
  BOOL v3 = +[_UIRemoteViewController requestViewController:@"ServiceProductActivityViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v5];
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v3;
}

void __68__SKStoreProductActivityViewController__requestRemoteViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v7 = *(id **)(a1 + 32);
  id v11 = v6;
  if (v6)
  {
    objc_storeStrong(v7 + 124, a2);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setProductActivityViewController:");
    objc_super v8 = [*(id *)(*(void *)(a1 + 32) + 992) serviceViewControllerProxy];
    [*(id *)(*(void *)(a1 + 32) + 976) setInvocationTarget:v8];

    [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 992)];
    [*(id *)(a1 + 32) _addRemoteView];
    [*(id *)(*(void *)(a1 + 32) + 976) setupProductWithParameters:*(void *)(*(void *)(a1 + 32) + 1000)];
  }
  else
  {
    [v7 _didFinishWithResult:0 error:a3];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 984);
  *(void *)(v9 + 984) = 0;
}

- (void)_addRemoteView
{
  if (self->_remoteViewController
    && [(SKStoreProductActivityViewController *)self isViewLoaded])
  {
    id v5 = [(SKRemoteProductActivityViewController *)self->_remoteViewController view];
    BOOL v3 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v3];

    id v4 = [(SKStoreProductActivityViewController *)self view];
    [v4 addSubview:v5];
    [v4 bounds];
    objc_msgSend(v5, "setFrame:");
    [v5 setAutoresizingMask:18];
  }
}

- (void)_viewTapped:(id)a3
{
}

- (SKStoreProductActivityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKStoreProductActivityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end