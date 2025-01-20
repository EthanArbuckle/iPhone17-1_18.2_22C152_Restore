@interface LARatchetViewController
+ (id)makeViewControllerWithOptions:(id)a3;
+ (id)makeViewControllerWithOptions:(id)a3 configuration:(id)a4;
- (BOOL)isInViewHierarchy;
- (LARatchetViewController)initWithOptions:(id)a3 configuration:(id)a4;
- (LARatchetViewControllerConfiguration)configuration;
- (LARatchetViewControllerDelegate)delegate;
- (NSDictionary)options;
- (id)internalOptions;
- (id)pageViewController;
- (id)presentationContext;
- (id)subscriptions;
- (id)viewModel;
- (void)clean;
- (void)dealloc;
- (void)evaluateAndPresentViewController;
- (void)evaluateAndShowViewController;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setIsInViewHierarchy:(BOOL)a3;
- (void)setSubscriptions:(id)a3;
- (void)setViewModel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation LARatchetViewController

- (LARatchetViewController)initWithOptions:(id)a3 configuration:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LARatchetViewController;
  v8 = [(LARatchetViewController *)&v19 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_isInViewHierarchy = 0;
    v10 = [v6 objectForKeyedSubscript:&unk_26F32BB90];
    objc_storeWeak((id *)&v9->_presentationContext, v10);

    v11 = (void *)[v6 mutableCopy];
    [v11 removeObjectForKey:&unk_26F32BB90];
    objc_storeStrong((id *)&v9->_options, v11);
    uint64_t v12 = [MEMORY[0x263F10488] optionsForRatchetArmOptions:v6];
    internalOptions = v9->_internalOptions;
    v9->_internalOptions = (NSDictionary *)v12;

    v14 = v7;
    if (!v7) {
      v14 = objc_opt_new();
    }
    objc_storeStrong((id *)&v9->_configuration, v14);
    if (!v7) {

    }
    objc_storeWeak((id *)&v9->_delegate, 0);
    uint64_t v15 = [objc_alloc(MEMORY[0x263F829F8]) initWithTransitionStyle:1 navigationOrientation:0 options:0];
    pageViewController = v9->_pageViewController;
    v9->_pageViewController = (UIPageViewController *)v15;

    v17 = LACLogDTO();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_23F450000, v17, OS_LOG_TYPE_DEFAULT, "%@ created with options: %@ configuration: %@", buf, 0x20u);
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(LARatchetViewController *)self viewModel];
  [v3 stopWithReason:@"Instance was deallocated" invalidate:0];

  [(LARatchetViewController *)self clean];
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_23F450000, v4, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)LARatchetViewController;
  [(LARatchetViewController *)&v5 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LARatchetViewController;
  [(LARatchetViewController *)&v4 viewDidAppear:a3];
  [(LARatchetViewController *)self setIsInViewHierarchy:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LARatchetViewController;
  [(LARatchetViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(LARatchetViewController *)self viewModel];
  [v4 stopWithReason:@"View did disappear" invalidate:0];
}

- (BOOL)isInViewHierarchy
{
  return self->_isInViewHierarchy;
}

- (void)setIsInViewHierarchy:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_isInViewHierarchy != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = LACLogDTO();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(LARatchetViewController *)(uint64_t)self setIsInViewHierarchy:v5];
    }

    self->_isInViewHierarchy = v3;
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        uint64_t v8 = LACLogDTO();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = objc_loadWeakRetained((id *)&self->_delegate);
          int v11 = 138412546;
          id v12 = v9;
          __int16 v13 = 2112;
          v14 = self;
          _os_log_impl(&dword_23F450000, v8, OS_LOG_TYPE_DEFAULT, "%@ informed that %@ appeared", (uint8_t *)&v11, 0x16u);
        }
        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        [v10 ratchetViewControllerDidAppear:self];
      }
    }
  }
}

- (id)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (id)pageViewController
{
  return self->_pageViewController;
}

- (id)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (id)internalOptions
{
  return self->_internalOptions;
}

- (id)presentationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContext);

  return WeakRetained;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = [MEMORY[0x263F10488] ratchetResultForResult:v12];
    int v11 = [MEMORY[0x263F10488] ratchetErrorForError:v6];
    [v9 ratchetViewController:self didFinishWithResult:v10 error:v11];
  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (LARatchetViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (LARatchetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LARatchetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_presentationContext);
  objc_storeStrong((id *)&self->_internalOptions, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

+ (id)makeViewControllerWithOptions:(id)a3
{
  sub_23F474598();
  swift_getObjCClassMetadata();
  id v3 = sub_23F46F868();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)makeViewControllerWithOptions:(id)a3 configuration:(id)a4
{
  uint64_t v5 = sub_23F474598();
  swift_getObjCClassMetadata();
  id v6 = a4;
  id v7 = sub_23F46F980(v5, v6);

  swift_bridgeObjectRelease();

  return v7;
}

- (void)evaluateAndShowViewController
{
}

- (void)evaluateAndPresentViewController
{
}

- (void)invalidate
{
  v2 = self;
  sub_23F4702D0();
}

- (void)clean
{
  v2 = self;
  sub_23F470594();
}

- (void)setIsInViewHierarchy:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_23F450000, log, OS_LOG_TYPE_DEBUG, "%@ is in view hierarchy %d", (uint8_t *)&v3, 0x12u);
}

@end