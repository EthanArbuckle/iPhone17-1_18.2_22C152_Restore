@interface AMUIPosterExtensionSwitcherItem
+ (id)itemWithProviderBundleIdentifier:(void *)a3 configurations:(void *)a4 posterCategoryViewControllerDelegate:(void *)a5 dateProvider:;
- (AMUIPosterExtensionSwitcherItem)initWithProviderBundleIdentifier:(id)a3 configurations:(id)a4 posterCategoryViewControllerDelegate:(id)a5 dateProvider:(id)a6;
- (NSObject)identifier;
- (UIView)itemView;
- (id)posterCategoryViewController;
- (uint64_t)configurations;
- (uint64_t)dateProvider;
- (uint64_t)setConfigurations:(uint64_t)result;
- (void)dealloc;
- (void)invalidate;
- (void)setDateProvider:(uint64_t)a1;
- (void)switcherItemDidAppear:(id)a3;
- (void)switcherItemDidDisappear:(id)a3;
- (void)switcherItemWillAppear:(id)a3;
- (void)switcherItemWillDisappear:(id)a3;
@end

@implementation AMUIPosterExtensionSwitcherItem

+ (id)itemWithProviderBundleIdentifier:(void *)a3 configurations:(void *)a4 posterCategoryViewControllerDelegate:(void *)a5 dateProvider:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  v12 = (void *)[objc_alloc((Class)self) initWithProviderBundleIdentifier:v11 configurations:v10 posterCategoryViewControllerDelegate:v9 dateProvider:v8];

  return v12;
}

- (uint64_t)setConfigurations:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = [a2 copy];
    v4 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = v3;

    v5 = *(void **)(v2 + 8);
    uint64_t v6 = *(void *)(v2 + 16);
    return [v5 setConfigurations:v6];
  }
  return result;
}

- (id)posterCategoryViewController
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = a1[1];
    if (!v3)
    {
      v4 = objc_alloc_init(AMUIPosterCategoryViewController);
      id v5 = v2[1];
      v2[1] = v4;

      [v2[1] setConfigurations:v2[2]];
      id v6 = v2[1];
      id WeakRetained = objc_loadWeakRetained(v2 + 5);
      [v6 setDelegate:WeakRetained];

      [v2[1] setDateProvider:v2[3]];
      id v3 = v2[1];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDateProvider:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    [*(id *)(a1 + 8) setDateProvider:*(void *)(a1 + 24)];
  }
}

- (uint64_t)configurations
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (AMUIPosterExtensionSwitcherItem)initWithProviderBundleIdentifier:(id)a3 configurations:(id)a4 posterCategoryViewControllerDelegate:(id)a5 dateProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMUIPosterExtensionSwitcherItem;
  v14 = [(AMUIPosterExtensionSwitcherItem *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    providerBundleIdentifier = v14->_providerBundleIdentifier;
    v14->_providerBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    configurations = v14->_configurations;
    v14->_configurations = (NSArray *)v17;

    objc_storeWeak((id *)&v14->_posterCategoryViewControllerDelegate, v12);
    objc_storeStrong((id *)&v14->_dateProvider, a6);
  }

  return v14;
}

- (void)dealloc
{
  [(AMUIPosterExtensionSwitcherItem *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterExtensionSwitcherItem;
  [(AMUIPosterExtensionSwitcherItem *)&v3 dealloc];
}

- (NSObject)identifier
{
  if (self) {
    self = (AMUIPosterExtensionSwitcherItem *)self->_providerBundleIdentifier;
  }
  return self;
}

- (UIView)itemView
{
  uint64_t v2 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController]((id *)&self->super.isa);
  objc_super v3 = [v2 view];

  id v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:1];

  return (UIView *)v3;
}

- (void)invalidate
{
  [(AMUIPosterCategoryViewController *)self->_posterCategoryViewController invalidate];
  posterCategoryViewController = self->_posterCategoryViewController;
  self->_posterCategoryViewController = 0;
}

- (void)switcherItemWillAppear:(id)a3
{
  id v4 = a3;
  id v7 = [(AMUIPosterExtensionSwitcherItem *)self itemView];
  id v5 = [v4 traitCollection];

  [v5 displayCornerRadius];
  objc_msgSend(v7, "_setContinuousCornerRadius:");

  id v6 = [(AMUIPosterExtensionSwitcherItem *)self itemView];
  [v6 setClipsToBounds:1];
}

- (void)switcherItemDidAppear:(id)a3
{
  id v3 = [(AMUIPosterExtensionSwitcherItem *)self itemView];
  [v3 setClipsToBounds:0];
}

- (void)switcherItemWillDisappear:(id)a3
{
  id v3 = [(AMUIPosterExtensionSwitcherItem *)self itemView];
  [v3 setClipsToBounds:1];
}

- (void)switcherItemDidDisappear:(id)a3
{
  id v3 = [(AMUIPosterExtensionSwitcherItem *)self itemView];
  [v3 setClipsToBounds:0];
}

- (uint64_t)dateProvider
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_posterCategoryViewControllerDelegate);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_configurations, 0);

  objc_storeStrong((id *)&self->_posterCategoryViewController, 0);
}

@end