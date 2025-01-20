@interface GEOEnvironmentsController
- (GEOEnvironmentsControllerDelegate)delegate;
- (id)activeEnvironment;
- (id)environmentInfosForSection:(int64_t)a3;
- (id)initEnablingCustomEnvironments:(BOOL)a3;
- (void)addCustomEnvironment:(id)a3;
- (void)dealloc;
- (void)reloadEnvironments;
- (void)reloadEnvironments:(id)a3;
- (void)removeCustomEnvironment:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation GEOEnvironmentsController

- (id)initEnablingCustomEnvironments:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GEOEnvironmentsController;
  v4 = [(GEOEnvironmentsController *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_enableCustomEnvironments = a3;
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_reloadEnvironments name:@"GEONetworkDefaultsDidChangeNotification" object:0];

    v7 = v5;
  }

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOEnvironmentsController;
  [(GEOEnvironmentsController *)&v4 dealloc];
}

- (void)reloadEnvironments
{
}

- (void)reloadEnvironments:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = objc_alloc_init(GEODefaultEnvironmentInfo);
  v43[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  defaultEnvironmentInfos = self->_defaultEnvironmentInfos;
  self->_defaultEnvironmentInfos = v5;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v7 = self->_defaultEnvironmentInfos;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  objc_super v9 = &unk_1E53D8998;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __48__GEOEnvironmentsController_reloadEnvironments___block_invoke;
        v36[3] = &unk_1E53D8998;
        v36[4] = self;
        v36[5] = v13;
        [v13 reloadManifestDataWithCompletionHandler:v36];
      }
      uint64_t v10 = [(NSArray *)v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);
  }

  v28 = [MEMORY[0x1E4F1CA48] array];
  if (self->_enableCustomEnvironments)
  {
    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v15 = [v14 objectForKey:@"CustomEnvironments"];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          v19 = v9;
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          v21 = [GEOCustomEnvironmentInfo alloc];
          v22 = [v20 objectForKeyedSubscript:@"GEOResourceManifestEnvironment"];
          v23 = [v20 objectForKeyedSubscript:@"displayName"];
          v24 = [(GEOCustomEnvironmentInfo *)v21 initWithName:v22 displayName:v23 dictionaryRepresentation:v20];

          if (v24) {
            [(NSArray *)v28 addObject:v24];
          }
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __48__GEOEnvironmentsController_reloadEnvironments___block_invoke_2;
          v30[3] = v19;
          objc_super v9 = v19;
          v30[4] = self;
          v31 = v24;
          v25 = v24;
          [(GEOEnvironmentInfo *)v25 reloadManifestDataWithCompletionHandler:v30];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v17);
    }
  }
  customEnvironmentInfos = self->_customEnvironmentInfos;
  self->_customEnvironmentInfos = v28;
}

void __48__GEOEnvironmentsController_reloadEnvironments___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) containsObject:*(void *)(a1 + 40)])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [WeakRetained environmentsController:*(void *)(a1 + 32) didUpdateEnvironmentInfo:*(void *)(a1 + 40) inSection:0];
  }
}

void __48__GEOEnvironmentsController_reloadEnvironments___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [WeakRetained environmentsController:*(void *)(a1 + 32) didUpdateEnvironmentInfo:*(void *)(a1 + 40) inSection:1];
  }
}

- (id)environmentInfosForSection:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = 8;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    return v5;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 16;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)addCustomEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_customEnvironmentInfos];
  [(NSArray *)v5 addObject:v4];
  customEnvironmentInfos = self->_customEnvironmentInfos;
  self->_customEnvironmentInfos = v5;
  v7 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained environmentsController:self didUpdateEnvironmentsSection:1];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__GEOEnvironmentsController_addCustomEnvironment___block_invoke;
  v10[3] = &unk_1E53D8998;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v9 reloadManifestDataWithCompletionHandler:v10];
}

void __50__GEOEnvironmentsController_addCustomEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained environmentsController:*(void *)(a1 + 32) didUpdateEnvironmentInfo:*(void *)(a1 + 40) inSection:1];
}

- (void)removeCustomEnvironment:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  customEnvironmentInfos = self->_customEnvironmentInfos;
  id v6 = a3;
  v7 = [v4 arrayWithArray:customEnvironmentInfos];
  [(NSArray *)v7 removeObject:v6];

  uint64_t v8 = self->_customEnvironmentInfos;
  self->_customEnvironmentInfos = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained environmentsController:self didUpdateEnvironmentsSection:1];
}

- (id)activeEnvironment
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_defaultEnvironmentInfos];
  [v3 addObjectsFromArray:self->_customEnvironmentInfos];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", (void)v10))
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (GEOEnvironmentsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOEnvironmentsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customEnvironmentInfos, 0);

  objc_storeStrong((id *)&self->_defaultEnvironmentInfos, 0);
}

@end