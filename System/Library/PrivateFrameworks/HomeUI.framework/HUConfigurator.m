@interface HUConfigurator
- (HUConfigurationViewController)currentViewController;
- (HUConfigurator)initWithConfiguratorDelegate:(id)a3 initialViewController:(id)a4;
- (HUConfiguratorDelegate)configuratorDelegate;
- (NSArray)displayedViewControllers;
- (id)_nextViewControllerForResults:(id)a3;
- (void)_addViewControllerToDisplay:(id)a3;
- (void)_removeDisplayedViewController;
- (void)pushViewControllerForResults:(id)a3;
- (void)setConfiguratorDelegate:(id)a3;
- (void)viewController:(id)a3 didFinishWithConfigurationResults:(id)a4;
@end

@implementation HUConfigurator

- (HUConfigurator)initWithConfiguratorDelegate:(id)a3 initialViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUConfigurator;
  v8 = [(HUConfigurator *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_configuratorDelegate, v6);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    displayedViewControllers = v9->_displayedViewControllers;
    v9->_displayedViewControllers = v10;

    [(HUConfigurator *)v9 _addViewControllerToDisplay:v7];
  }

  return v9;
}

- (HUConfigurationViewController)currentViewController
{
  v2 = [(HUConfigurator *)self displayedViewControllers];
  v3 = [v2 lastObject];

  return (HUConfigurationViewController *)v3;
}

- (void)pushViewControllerForResults:(id)a3
{
  v4 = [(HUConfigurator *)self _nextViewControllerForResults:a3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HUConfigurator_pushViewControllerForResults___block_invoke;
  v6[3] = &unk_1E63850B8;
  v6[4] = self;
  id v5 = (id)[v4 addCompletionBlock:v6];
}

void __47__HUConfigurator_pushViewControllerForResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v11 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v11;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = v5;
  if ([v6 conformsToProtocol:&unk_1F19D4CF8]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    [v9 _addViewControllerToDisplay:v8];
    v10 = [*(id *)(a1 + 32) configuratorDelegate];
    [v10 configuratorDidUpdateViewController:*(void *)(a1 + 32)];
  }
  else
  {
    v10 = [v9 configuratorDelegate];
    [v10 configuratorDidFinish:*(void *)(a1 + 32)];
  }
}

- (void)viewController:(id)a3 didFinishWithConfigurationResults:(id)a4
{
}

- (id)_nextViewControllerForResults:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithNoResult", a3);
}

- (void)_addViewControllerToDisplay:(id)a3
{
}

- (void)_removeDisplayedViewController
{
  if ((unint64_t)[(NSMutableArray *)self->_displayedViewControllers count] >= 2)
  {
    displayedViewControllers = self->_displayedViewControllers;
    [(NSMutableArray *)displayedViewControllers removeLastObject];
  }
}

- (HUConfiguratorDelegate)configuratorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuratorDelegate);

  return (HUConfiguratorDelegate *)WeakRetained;
}

- (void)setConfiguratorDelegate:(id)a3
{
}

- (NSArray)displayedViewControllers
{
  return &self->_displayedViewControllers->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configuratorDelegate);

  objc_storeStrong((id *)&self->_displayedViewControllers, 0);
}

@end