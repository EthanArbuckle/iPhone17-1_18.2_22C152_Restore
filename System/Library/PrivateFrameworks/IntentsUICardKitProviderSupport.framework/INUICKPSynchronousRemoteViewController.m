@interface INUICKPSynchronousRemoteViewController
+ (void)requestInstanceWithInfo:(id)a3 configuration:(id)a4 synchronousRemoteViewControllerDelegate:(id)a5 reply:(id)a6;
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSize;
- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate;
- (INUICKPInterfaceSectionOrganizing)interfaceSectionOrganizer;
- (INUICKPSynchronousRemoteViewControllerDelegate)delegate;
- (INUIRemoteViewController)remoteViewController;
- (NSSet)cachedRepresentedParameters;
- (id)_interaction;
- (id)_minimumSizesBySystemVersion;
- (id)interfaceSectionsForRemoteViewController:(id)a3;
- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3;
- (void)loadView;
- (void)remoteViewControllerServiceDidTerminate:(id)a3;
- (void)setCardSectionViewControllingDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterfaceSectionOrganizer:(id)a3;
- (void)setRemoteViewController:(id)a3;
@end

@implementation INUICKPSynchronousRemoteViewController

+ (void)requestInstanceWithInfo:(id)a3 configuration:(id)a4 synchronousRemoteViewControllerDelegate:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setDelegate:v12];

  v15 = (void *)MEMORY[0x263F10338];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke;
  v19[3] = &unk_264B95CE0;
  id v21 = v10;
  id v22 = v11;
  id v20 = v14;
  id v16 = v10;
  id v17 = v14;
  id v18 = v11;
  [v15 requestRemoteViewControllerWithRequestInfo:v13 reply:v19];
}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_2;
    v9[3] = &unk_264B95CB8;
    id v10 = a1[4];
    id v11 = v5;
    id v12 = a1[5];
    id v13 = a1[6];
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
  else
  {
    v8 = (void (**)(id, void, void *))a1[6];
    if (v8) {
      v8[2](v8, 0, v7);
    }
  }
}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_2(id *a1)
{
  [a1[4] setRemoteViewController:a1[5]];
  [a1[5] setInheritsSecurity:1];
  [a1[5] setServiceViewShouldShareTouchesWithHost:1];
  objc_initWeak(&location, a1[5]);
  id v3 = a1[4];
  id v2 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_3;
  v4[3] = &unk_264B95C90;
  objc_copyWeak(&v8, &location);
  id v5 = a1[6];
  id v7 = a1[7];
  id v6 = a1[4];
  [v2 setDelegate:v3 completion:v4];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_4;
    v4[3] = &unk_264B95C68;
    id v6 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    [WeakRetained setIdealConfiguration:v3 animated:0 completion:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __126__INUICKPSynchronousRemoteViewController_requestInstanceWithInfo_configuration_synchronousRemoteViewControllerDelegate_reply___block_invoke_4(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  return MEMORY[0x270F9A790]();
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(INUICKPSynchronousRemoteView);
  [(INUICKPSynchronousRemoteView *)v3 setDelegate:self];
  [(INUICKPSynchronousRemoteViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = (INUIRemoteViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  id v11 = v5;
  if (remoteViewController != v5)
  {
    [(INUIRemoteViewController *)remoteViewController removeFromParentViewController];
    id v8 = [(INUIRemoteViewController *)*p_remoteViewController view];
    [v8 removeFromSuperview];

    [(INUIRemoteViewController *)*p_remoteViewController didMoveToParentViewController:0];
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    if (*p_remoteViewController)
    {
      -[INUICKPSynchronousRemoteViewController addChildViewController:](self, "addChildViewController:");
      v9 = [(INUICKPSynchronousRemoteViewController *)self view];
      id v10 = [(INUIRemoteViewController *)*p_remoteViewController view];
      [v9 addSubview:v10];

      [(INUIRemoteViewController *)*p_remoteViewController didMoveToParentViewController:self];
    }
  }
}

- (NSSet)cachedRepresentedParameters
{
  id v2 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
  uint64_t v3 = [v2 configuration];
  v4 = [v3 parameters];

  return (NSSet *)v4;
}

- (id)_interaction
{
  id v2 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
  uint64_t v3 = [v2 requestInfo];
  v4 = [v3 interaction];

  return v4;
}

- (id)_minimumSizesBySystemVersion
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(INUICKPSynchronousRemoteViewController *)self delegate];
  [v3 boundingWidthForSynchronousRemoteViewController:self];
  double v5 = v4;

  v10[0] = &unk_26E537320;
  id v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v5, 120.0);
  v10[1] = &unk_26E537338;
  v11[0] = v6;
  id v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v5, 20.0);
  v11[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (void)remoteViewControllerServiceDidTerminate:(id)a3
{
  double v4 = (void *)*MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
    -[INUICKPSynchronousRemoteViewController remoteViewControllerServiceDidTerminate:](v4, self);
  }
}

- (id)maximumSizesBySystemVersionForRemoteViewController:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  double v4 = [(INUICKPSynchronousRemoteViewController *)self delegate];
  [v4 boundingWidthForSynchronousRemoteViewController:self];
  double v6 = v5;

  v13[0] = &unk_26E537320;
  id v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v6, 200.0);
  v13[1] = &unk_26E537338;
  v14[0] = v7;
  id v8 = (void *)MEMORY[0x263F08D40];
  v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 bounds];
  id v10 = objc_msgSend(v8, "valueWithCGSize:", v6, CGRectGetHeight(v16));
  v14[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (id)interfaceSectionsForRemoteViewController:(id)a3
{
  uint64_t v3 = [(INUICKPSynchronousRemoteViewController *)self interfaceSectionOrganizer];
  double v4 = [v3 organizedInterfaceSections];

  return v4;
}

- (CGSize)preferredContentSize
{
  uint64_t v3 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
  double v4 = v3;
  if (v3)
  {
    [v3 preferredContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v9 = [(INUICKPSynchronousRemoteViewController *)self _minimumSizesBySystemVersion];
    _INUIUtilitiesBestFittingSizeForSizeBySystemVersionDictionary();
    double v6 = v10;
    double v8 = v11;
  }
  double v12 = v6;
  double v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cardSectionViewControllingDelegate);
  return (CRKCardSectionViewControllingDelegate *)WeakRetained;
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
}

- (INUIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (INUICKPInterfaceSectionOrganizing)interfaceSectionOrganizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interfaceSectionOrganizer);
  return (INUICKPInterfaceSectionOrganizing *)WeakRetained;
}

- (void)setInterfaceSectionOrganizer:(id)a3
{
}

- (INUICKPSynchronousRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (INUICKPSynchronousRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_interfaceSectionOrganizer);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->cardSectionViewControllingDelegate);
}

- (void)remoteViewControllerServiceDidTerminate:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  double v4 = [a2 _interaction];
  double v5 = [a2 cachedRepresentedParameters];
  int v6 = 138412546;
  double v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_230990000, v3, OS_LOG_TYPE_ERROR, "IntentsUI remote view controller did terminate\n    Interaction: %@\n    Parameters: %@", (uint8_t *)&v6, 0x16u);
}

@end