@interface TKHostTokenRegistryTransaction
- (NSDictionary)tokenExtensions;
- (TKHostTokenRegistryTransaction)initWithRegistry:(id)a3 name:(id)a4;
- (id)keychainItemsModified:(id)a3;
- (id)markModified;
- (void)commit;
- (void)dealloc;
@end

@implementation TKHostTokenRegistryTransaction

- (TKHostTokenRegistryTransaction)initWithRegistry:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TKHostTokenRegistryTransaction;
  v8 = [(TKHostTokenRegistryTransaction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_registry, v6);
    objc_storeStrong((id *)&v9->_name, a4);
  }

  return v9;
}

- (void)commit
{
  p_registry = &self->_registry;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  if (!WeakRetained)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TKHostTokenRegistry.m", 61, @"An attempt to double-commit registry transaction %@", self->_name object file lineNumber description];
  }
  id v6 = objc_loadWeakRetained((id *)p_registry);
  [v6 commitTransaction];

  objc_storeWeak((id *)p_registry, 0);
}

- (id)markModified
{
  p_registry = &self->_registry;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  if (!WeakRetained)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TKHostTokenRegistry.m", 67, @"An attempt to modify committed registry transaction %@", self->_name object file lineNumber description];
  }
  id v6 = objc_loadWeakRetained((id *)p_registry);
  [v6 markModified];

  return self;
}

- (id)keychainItemsModified:(id)a3
{
  p_registry = &self->_registry;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_registry);

  if (!WeakRetained)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TKHostTokenRegistry.m", 73, @"An attempt to modify committed registry transaction %@", self->_name object file lineNumber description];
  }
  id v8 = objc_loadWeakRetained((id *)p_registry);
  [v8 keychainItemsModified:v6];

  return self;
}

- (NSDictionary)tokenExtensions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);
  v3 = [WeakRetained tokenExtensions];

  return (NSDictionary *)v3;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  if (WeakRetained)
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"TKHostTokenRegistry.m", 83, @"Destroying uncommitted registry transaction %@", self->_name object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)TKHostTokenRegistryTransaction;
  [(TKHostTokenRegistryTransaction *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_registry);
}

@end