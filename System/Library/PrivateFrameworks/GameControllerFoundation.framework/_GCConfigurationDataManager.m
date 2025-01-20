@interface _GCConfigurationDataManager
- (_GCConfigurationDataManager)init;
- (_GCConfigurationDataManager)initWithProvider:(id)a3;
- (id)configurationBundleLocatorForType:(id)a3;
- (id)serviceFor:(id)a3 client:(id)a4;
@end

@implementation _GCConfigurationDataManager

- (_GCConfigurationDataManager)initWithProvider:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_GCConfigurationDataManager;
  id v3 = a3;
  v4 = [(_GCConfigurationDataManager *)&v10 init];
  objc_storeWeak((id *)&v4->_provider, v3);

  dispatch_workloop_t v5 = dispatch_workloop_create("Workloop.GameController.ConfigurationData");
  workloop = v4->_workloop;
  v4->_workloop = (OS_dispatch_workloop *)v5;

  uint64_t v7 = objc_opt_new();
  locators = v4->_locators;
  v4->_locators = (NSMutableDictionary *)v7;

  return v4;
}

- (_GCConfigurationDataManager)init
{
  return 0;
}

- (id)configurationBundleLocatorForType:(id)a3
{
  id v4 = a3;
  dispatch_workloop_t v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_locators objectForKey:v4];
  if (!v6)
  {
    v6 = [[_GCConfigurationBundleLocator alloc] initWithConfigurationType:v4 provider:v5];
    [(NSMutableDictionary *)v5->_locators setObject:v6 forKey:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  if (&unk_26BEED6B8 == a3)
  {
    v9 = self->_workloop;
  }
  else
  {
    p_provider = &self->_provider;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_provider);
    v9 = [WeakRetained serviceFor:v7 client:v6];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locators, 0);
  objc_storeStrong((id *)&self->_workloop, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end