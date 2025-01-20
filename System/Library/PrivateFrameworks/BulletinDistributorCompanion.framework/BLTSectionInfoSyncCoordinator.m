@interface BLTSectionInfoSyncCoordinator
- (BLTSectionInfoSyncCoordinator)initWithAlertingSectionIDs:(id)a3 infoProvider:(id)a4;
- (NSMutableArray)alertingSectionIDs;
- (NSMutableDictionary)alertingSectionState;
- (id)description;
- (id)effectiveSectionInfoForSectionIDIndex:(unint64_t)a3;
- (id)infoProvider;
- (unint64_t)mostRecentIndex;
- (unint64_t)mostRecentIndexSinceSync;
- (unint64_t)performSyncForSectionID:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)sectionInfoSendCompleted:(unint64_t)a3;
- (void)setAlertingSectionIDs:(id)a3;
- (void)setAlertingSectionState:(id)a3;
- (void)setInfoProvider:(id)a3;
- (void)setMostRecentIndex:(unint64_t)a3;
- (void)setMostRecentIndexSinceSync:(unint64_t)a3;
@end

@implementation BLTSectionInfoSyncCoordinator

- (BLTSectionInfoSyncCoordinator)initWithAlertingSectionIDs:(id)a3 infoProvider:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)BLTSectionInfoSyncCoordinator;
  v8 = [(BLTSectionInfoSyncCoordinator *)&v31 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    id infoProvider = v8->_infoProvider;
    v8->_id infoProvider = (id)v9;

    uint64_t v11 = [v6 mutableCopy];
    alertingSectionIDs = v8->_alertingSectionIDs;
    v8->_alertingSectionIDs = (NSMutableArray *)v11;

    v13 = (void *)MEMORY[0x263EFF9A0];
    v14 = [NSDictionary sharedKeySetForKeys:v6];
    uint64_t v15 = [v13 dictionaryWithSharedKeySet:v14];
    alertingSectionState = v8->_alertingSectionState;
    v8->_alertingSectionState = (NSMutableDictionary *)v15;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v17 = v8->_alertingSectionIDs;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v22 = objc_opt_new();
          [(NSMutableDictionary *)v8->_alertingSectionState setObject:v22 forKeyedSubscript:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    objc_initWeak(&location, v8);
    v23 = BLTWorkQueue();
    objc_copyWeak(&v25, &location);
    v8->_stateHandler = os_state_add_handler();

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v8;
}

_DWORD *__73__BLTSectionInfoSyncCoordinator_initWithAlertingSectionIDs_infoProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v4 = [WeakRetained description];
  v5 = BLTStateDataWithTitleAndDescription(v3, (uint64_t)v4);

  return v5;
}

- (void)dealloc
{
  os_state_remove_handler();
  self->_stateHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)BLTSectionInfoSyncCoordinator;
  [(BLTSectionInfoSyncCoordinator *)&v3 dealloc];
}

- (unint64_t)performSyncForSectionID:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NSMutableDictionary *)self->_alertingSectionState objectForKeyedSubscript:v8];
  v12 = v11;
  if (!v11 || [v11 state] == 2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__BLTSectionInfoSyncCoordinator_performSyncForSectionID_queue_completion___block_invoke;
    block[3] = &unk_264683CA0;
    v26 = v10;
    dispatch_async(v9, block);
    unint64_t v13 = 3;
    v14 = v26;
    goto LABEL_4;
  }
  v16 = blt_settings_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_222F4C000, v16, OS_LOG_TYPE_DEFAULT, "Section %@ hasn't completed sync'ing", buf, 0xCu);
  }

  [v12 setClientCompletion:v10];
  [v12 setClientQueue:v9];
  if ([v12 state] == 1) {
    goto LABEL_17;
  }
  v17 = blt_settings_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl(&dword_222F4C000, v17, OS_LOG_TYPE_DEFAULT, "Moving %@ to front of send queue", buf, 0xCu);
  }

  p_unint64_t mostRecentIndex = &self->_mostRecentIndex;
  unint64_t mostRecentIndex = self->_mostRecentIndex;
  p_alertingSectionIDs = &self->_alertingSectionIDs;
  if (mostRecentIndex >= [(NSMutableArray *)self->_alertingSectionIDs count])
  {
    v24 = blt_settings_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[BLTSectionInfoSyncCoordinator performSyncForSectionID:queue:completion:]((uint64_t *)&self->_mostRecentIndex, (id *)&self->_alertingSectionIDs, v24);
    }

    goto LABEL_17;
  }
  uint64_t v21 = [(NSMutableArray *)*p_alertingSectionIDs indexOfObject:v8];
  if (v21 == *p_mostRecentIndex + 1)
  {
LABEL_17:
    unint64_t v13 = 2;
    goto LABEL_18;
  }
  uint64_t v22 = v21;
  v23 = -[NSMutableArray objectAtIndexedSubscript:](*p_alertingSectionIDs, "objectAtIndexedSubscript:");
  [(NSMutableArray *)*p_alertingSectionIDs setObject:v23 atIndexedSubscript:v22];

  [(NSMutableArray *)*p_alertingSectionIDs setObject:v8 atIndexedSubscript:*p_mostRecentIndex + 1];
  unint64_t v13 = 0;
LABEL_18:
  if (self->_mostRecentIndexSinceSync != self->_mostRecentIndex) {
    goto LABEL_5;
  }
  v14 = blt_settings_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222F4C000, v14, OS_LOG_TYPE_DEFAULT, "Section info sync coordinator has not completed sync'ing any sections since last call", buf, 2u);
  }
  unint64_t v13 = 1;
LABEL_4:

LABEL_5:
  self->_mostRecentIndexSinceSync = self->_mostRecentIndex;

  return v13;
}

uint64_t __74__BLTSectionInfoSyncCoordinator_performSyncForSectionID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)effectiveSectionInfoForSectionIDIndex:(unint64_t)a3
{
  self->_unint64_t mostRecentIndex = a3;
  alertingSectionState = self->_alertingSectionState;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_alertingSectionIDs, "objectAtIndexedSubscript:");
  id v7 = [(NSMutableDictionary *)alertingSectionState objectForKeyedSubscript:v6];
  [v7 setState:1];

  id infoProvider = (void (**)(id, void *))self->_infoProvider;
  uint64_t v9 = [(NSMutableArray *)self->_alertingSectionIDs objectAtIndexedSubscript:a3];
  id v10 = infoProvider[2](infoProvider, v9);

  return v10;
}

- (void)sectionInfoSendCompleted:(unint64_t)a3
{
  alertingSectionState = self->_alertingSectionState;
  v4 = [(NSMutableArray *)self->_alertingSectionIDs objectAtIndexedSubscript:a3];
  v5 = [(NSMutableDictionary *)alertingSectionState objectForKeyedSubscript:v4];

  if ([v5 state] != 2)
  {
    [v5 setState:2];
    uint64_t v6 = [v5 clientCompletion];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v5 clientQueue];

      if (v8)
      {
        uint64_t v9 = [v5 clientQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__BLTSectionInfoSyncCoordinator_sectionInfoSendCompleted___block_invoke;
        block[3] = &unk_264683BD8;
        id v11 = v5;
        dispatch_async(v9, block);
      }
    }
  }
}

void __58__BLTSectionInfoSyncCoordinator_sectionInfoSendCompleted___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) clientCompletion];
  v1[2]();
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_alertingSectionState withName:@"alertingSectionState"];
  id v5 = (id)[v3 appendObject:self->_alertingSectionIDs withName:@"alertingSectionIDs"];
  id v6 = (id)[v3 appendUnsignedInteger:self->_mostRecentIndex withName:@"mostRecentIndex"];
  id v7 = [v3 build];

  return v7;
}

- (id)infoProvider
{
  return self->_infoProvider;
}

- (void)setInfoProvider:(id)a3
{
}

- (NSMutableArray)alertingSectionIDs
{
  return self->_alertingSectionIDs;
}

- (void)setAlertingSectionIDs:(id)a3
{
}

- (NSMutableDictionary)alertingSectionState
{
  return self->_alertingSectionState;
}

- (void)setAlertingSectionState:(id)a3
{
}

- (unint64_t)mostRecentIndex
{
  return self->_mostRecentIndex;
}

- (void)setMostRecentIndex:(unint64_t)a3
{
  self->_unint64_t mostRecentIndex = a3;
}

- (unint64_t)mostRecentIndexSinceSync
{
  return self->_mostRecentIndexSinceSync;
}

- (void)setMostRecentIndexSinceSync:(unint64_t)a3
{
  self->_mostRecentIndexSinceSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingSectionState, 0);
  objc_storeStrong((id *)&self->_alertingSectionIDs, 0);
  objc_storeStrong(&self->_infoProvider, 0);
}

- (void)performSyncForSectionID:(uint64_t *)a1 queue:(id *)a2 completion:(NSObject *)a3 .cold.1(uint64_t *a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  uint64_t v5 = [*a2 count];
  int v6 = 134218240;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_222F4C000, a3, OS_LOG_TYPE_ERROR, "Most recent index (%lu) has completed section sync count (%lu)", (uint8_t *)&v6, 0x16u);
}

@end