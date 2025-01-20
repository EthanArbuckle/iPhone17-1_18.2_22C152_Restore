@interface HUStaticConfigurator
- (HUStaticConfigurator)initWithConfiguratorDelegate:(id)a3 contentViewControllers:(id)a4;
- (HUStaticConfigurator)initWithConfiguratorDelegate:(id)a3 viewControllers:(id)a4;
- (NSArray)staticViewControllers;
- (id)_nextViewControllerForResults:(id)a3;
- (void)setStaticViewControllers:(id)a3;
@end

@implementation HUStaticConfigurator

- (HUStaticConfigurator)initWithConfiguratorDelegate:(id)a3 viewControllers:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__HUStaticConfigurator_initWithConfiguratorDelegate_viewControllers___block_invoke;
  v14[3] = &unk_1E6392570;
  v8 = self;
  v15 = v8;
  id v9 = a3;
  objc_msgSend(v7, "na_each:", v14);
  v10 = [v7 firstObject];
  v13.receiver = v8;
  v13.super_class = (Class)HUStaticConfigurator;
  v11 = [(HUConfigurator *)&v13 initWithConfiguratorDelegate:v9 initialViewController:v10];

  if (v11) {
    objc_storeStrong((id *)&v11->_staticViewControllers, a4);
  }

  return v11;
}

uint64_t __69__HUStaticConfigurator_initWithConfiguratorDelegate_viewControllers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

- (HUStaticConfigurator)initWithConfiguratorDelegate:(id)a3 contentViewControllers:(id)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HUStaticConfigurator_initWithConfiguratorDelegate_contentViewControllers___block_invoke;
  v11[3] = &unk_1E6392598;
  v6 = self;
  v12 = v6;
  id v7 = a3;
  v8 = objc_msgSend(a4, "na_map:", v11);
  id v9 = [(HUStaticConfigurator *)v6 initWithConfiguratorDelegate:v7 viewControllers:v8];

  return v9;
}

HUConfigurationWrapperViewController *__76__HUStaticConfigurator_initWithConfiguratorDelegate_contentViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[HUConfigurationWrapperViewController alloc] initWithContentViewController:v3 configurationDelegate:*(void *)(a1 + 32)];

  return v4;
}

- (id)_nextViewControllerForResults:(id)a3
{
  v4 = [(HUStaticConfigurator *)self staticViewControllers];
  v5 = [(HUConfigurator *)self currentViewController];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(HUConfigurator *)self currentViewController];
    v8 = [(HUStaticConfigurator *)self staticViewControllers];
    NSLog(&cfstr_Currentviewcon.isa, v7, v8);
  }
  unint64_t v9 = v6 + 1;
  v10 = [(HUStaticConfigurator *)self staticViewControllers];
  unint64_t v11 = [v10 count];

  if (v9 < v11
    && ([(HUStaticConfigurator *)self staticViewControllers],
        v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectAtIndexedSubscript:v9],
        objc_super v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v13];
  }
  else
  {
    v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v14;
}

- (NSArray)staticViewControllers
{
  return self->_staticViewControllers;
}

- (void)setStaticViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end