@interface DOCRemoteUIBarButtonItemRegistry
+ (id)shared;
- (DOCRemoteUIBarButtonItemRegistry)init;
- (id)barButtonItemPresentedInNavigationBar:(id)a3 uuid:(id)a4;
- (void)registerInstance:(id)a3;
@end

@implementation DOCRemoteUIBarButtonItemRegistry

+ (id)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)shared_sharedInstance;
  return v2;
}

uint64_t __42__DOCRemoteUIBarButtonItemRegistry_shared__block_invoke()
{
  v0 = objc_alloc_init(DOCRemoteUIBarButtonItemRegistry);
  uint64_t v1 = shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DOCRemoteUIBarButtonItemRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)DOCRemoteUIBarButtonItemRegistry;
  v2 = [(DOCRemoteUIBarButtonItemRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    instancesByUUID = v2->_instancesByUUID;
    v2->_instancesByUUID = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)registerInstance:(id)a3
{
  id v4 = a3;
  id v9 = [v4 uuid];
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_instancesByUUID, "objectForKeyedSubscript:");
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  }
  v8 = v7;

  [v8 addPointer:v4];
  [(NSMutableDictionary *)self->_instancesByUUID setObject:v8 forKeyedSubscript:v9];
}

- (id)barButtonItemPresentedInNavigationBar:(id)a3 uuid:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_instancesByUUID objectForKeyedSubscript:a4];
  if ([v7 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "_doc_ipi_view", (void)v15);
          if ([v13 isDescendantOfView:v6])
          {
            id v9 = v12;

            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end