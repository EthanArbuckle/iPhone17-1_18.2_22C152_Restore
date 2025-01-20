@interface INCLocalExtensionRegistry
+ (id)sharedInstance;
- (INCLocalExtensionRegistry)init;
- (id)localExtensionForIdentifier:(id)a3;
- (id)localExtensions;
- (void)deregisterLocalExtension:(id)a3;
- (void)registerLocalExtension:(id)a3;
@end

@implementation INCLocalExtensionRegistry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance_sLocalExtensionRegistry;
  return v2;
}

- (id)localExtensionForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_localExtensionsByIdentifier objectForKey:a3];
}

- (void).cxx_destruct
{
}

- (id)localExtensions
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_localExtensionsByIdentifier allValues];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)deregisterLocalExtension:(id)a3
{
  id v4 = a3;
  v5 = [v4 localExtensionIdentifier];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  v10 = [(NSMutableDictionary *)self->_localExtensionsByIdentifier objectForKey:v9];
  v11 = v10;
  if (v10 && [v10 isEqual:v4])
  {
    [(NSMutableDictionary *)self->_localExtensionsByIdentifier removeObjectForKey:v9];
  }
  else
  {
    localExtensionsByIdentifier = self->_localExtensionsByIdentifier;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__INCLocalExtensionRegistry_deregisterLocalExtension___block_invoke;
    v16[3] = &unk_1E62BB0A0;
    id v17 = v4;
    v13 = [(NSMutableDictionary *)localExtensionsByIdentifier keysOfEntriesPassingTest:v16];
    v14 = self->_localExtensionsByIdentifier;
    v15 = [v13 allObjects];
    [(NSMutableDictionary *)v14 removeObjectsForKeys:v15];
  }
}

uint64_t __54__INCLocalExtensionRegistry_deregisterLocalExtension___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqual:*(void *)(a1 + 32)];
}

- (void)registerLocalExtension:(id)a3
{
  id v9 = a3;
  id v4 = [v9 localExtensionIdentifier];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  [(NSMutableDictionary *)self->_localExtensionsByIdentifier setObject:v9 forKey:v8];
}

- (INCLocalExtensionRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)INCLocalExtensionRegistry;
  v2 = [(INCLocalExtensionRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    localExtensionsByIdentifier = v2->_localExtensionsByIdentifier;
    v2->_localExtensionsByIdentifier = v3;
  }
  return v2;
}

uint64_t __43__INCLocalExtensionRegistry_sharedInstance__block_invoke()
{
  sharedInstance_sLocalExtensionRegistry = objc_alloc_init(INCLocalExtensionRegistry);
  return MEMORY[0x1F41817F8]();
}

@end