@interface AUAudioUnitViewService
- (AURemoteExtensionContext)auRemoteExtensionContext;
- (CGSize)determineViewSize:(id)a3;
- (void)connectChildView;
- (void)dealloc;
- (void)initializeBlankView;
- (void)loadView;
- (void)setAUContainerViewConstraints:(id)a3 childView:(id)a4 auViewSize:(CGSize)a5;
- (void)setAuRemoteExtensionContext:(id)a3;
@end

@implementation AUAudioUnitViewService

- (CGSize)determineViewSize:(id)a3
{
  id v3 = a3;
  [v3 preferredContentSize];
  unsigned int v5 = v4;
  [v3 preferredContentSize];
  unsigned int v7 = v6;
  if (!v5)
  {
    v10 = [v3 view];
    [v10 frame];
    double v8 = v11;

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [v3 view];
    [v12 frame];
    double v9 = v13;

    goto LABEL_6;
  }
  double v8 = (double)v5;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  double v9 = (double)v7;
LABEL_6:

  double v14 = (double)v8;
  double v15 = (double)v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setAUContainerViewConstraints:(id)a3 childView:(id)a4 auViewSize:(CGSize)a5
{
  id v6 = a3;
  _NSDictionaryOfVariableBindings(&cfstr_Childview.isa, a4, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v9];
  [v6 addConstraints:v7];

  double v8 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v9];
  [v6 addConstraints:v8];
}

- (void)connectChildView
{
  objc_initWeak(&location, self);
  id v3 = [(AUAudioUnitViewService *)self auRemoteExtensionContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__AUAudioUnitViewService_connectChildView__block_invoke;
  v4[3] = &unk_2644B0158;
  objc_copyWeak(&v5, &location);
  [v3 requestViewControllerWithCompletionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__AUAudioUnitViewService_connectChildView__block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v16 && WeakRetained)
  {
    [WeakRetained addChildViewController:v16];
    objc_storeStrong(WeakRetained + 122, a2);
    id v5 = [v16 view];
    [WeakRetained determineViewSize:v16];
    double v7 = v6;
    double v9 = v8;
    objc_msgSend(WeakRetained, "setPreferredContentSize:");
    v10 = [WeakRetained view];
    double v11 = [v10 window];
    objc_msgSend(WeakRetained, "resizeWindow:size:", v11, v7, v9);

    v12 = [WeakRetained view];
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, v7, v9);

    double v13 = [WeakRetained view];
    [v13 addSubview:v5];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v14 = [WeakRetained view];
    objc_msgSend(WeakRetained, "setAUContainerViewConstraints:childView:auViewSize:", v14, v5, v7, v9);

    double v15 = [WeakRetained view];
    [WeakRetained markViewForRedraw:v15];

    [WeakRetained markViewForRedraw:v5];
  }
}

- (void)initializeBlankView
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(AUAudioUnitViewService *)self setView:v3];
}

- (void)loadView
{
  [(AUAudioUnitViewService *)self initializeBlankView];
  id v3 = [(AUAudioUnitViewService *)self extensionContext];
  [(AUAudioUnitViewService *)self setAuRemoteExtensionContext:v3];

  double v4 = [(AUAudioUnitViewService *)self auRemoteExtensionContext];
  [v4 setViewService:self];

  [(AUAudioUnitViewService *)self connectChildView];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(AUAudioUnitViewService *)self childViewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) view];
        [v8 removeFromSuperview];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitViewService;
  [(AUAudioUnitViewService *)&v9 dealloc];
}

- (AURemoteExtensionContext)auRemoteExtensionContext
{
  return self->_auRemoteExtensionContext;
}

- (void)setAuRemoteExtensionContext:(id)a3
{
  self->_auRemoteExtensionContext = (AURemoteExtensionContext *)a3;
}

- (void).cxx_destruct
{
}

@end