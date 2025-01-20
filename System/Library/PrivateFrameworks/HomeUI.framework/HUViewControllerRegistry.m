@interface HUViewControllerRegistry
+ (id)sharedInstance;
- (Class)viewControllerClassForIdentifier:(id)a3;
- (HUViewControllerRegistry)init;
- (NSMutableDictionary)viewControllerClassesByIdentifier;
- (void)registerViewControllerClass:(Class)a3 forIdentifier:(id)a4;
@end

@implementation HUViewControllerRegistry

- (void)registerViewControllerClass:(Class)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(HUViewControllerRegistry *)self viewControllerClassesByIdentifier];
  [v7 setObject:a3 forKeyedSubscript:v6];
}

- (NSMutableDictionary)viewControllerClassesByIdentifier
{
  return self->_viewControllerClassesByIdentifier;
}

void __42__HUViewControllerRegistry_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HUViewControllerRegistry);
  v1 = (void *)qword_1EBA478B0;
  qword_1EBA478B0 = (uint64_t)v0;
}

- (HUViewControllerRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)HUViewControllerRegistry;
  v2 = [(HUViewControllerRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    viewControllerClassesByIdentifier = v2->_viewControllerClassesByIdentifier;
    v2->_viewControllerClassesByIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_627 != -1) {
    dispatch_once(&_MergedGlobals_627, &__block_literal_global_4_0);
  }
  v2 = (void *)qword_1EBA478B0;

  return v2;
}

- (Class)viewControllerClassForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HUViewControllerRegistry *)self viewControllerClassesByIdentifier];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

- (void).cxx_destruct
{
}

@end