@interface BLTSectionInfoObserver
- (BLTSectionInfoObserver)init;
- (BLTSectionInfoObserver)initWithSettingsGateway:(id)a3;
- (BLTSectionInfoObserverDelegate)delegate;
- (id)sectionInfoForSectionID:(id)a3;
- (void)_getUniversalSectionIDs:(id)a3 sectionIDEnumerator:(id)a4 completion:(id)a5;
- (void)_reloadSectionInfosWithCompletion:(id)a3;
- (void)_settingsGatewayReconnected:(id)a3;
- (void)dealloc;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)observer:(id)a3 removeSection:(id)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)reloadWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateSectionInfoBySectionIDs:(id)a3 completion:(id)a4;
@end

@implementation BLTSectionInfoObserver

- (BLTSectionInfoObserver)init
{
  return [(BLTSectionInfoObserver *)self initWithSettingsGateway:0];
}

- (BLTSectionInfoObserver)initWithSettingsGateway:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLTSectionInfoObserver;
  v6 = [(BLTSectionInfoObserver *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settingsGateway, a3);
    if (v7->_settingsGateway)
    {
      v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 addObserver:v7 selector:sel__settingsGatewayReconnected_ name:@"BLTSettingsGatewayReconnected" object:v7->_settingsGateway];
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bulletindistributor.sectioninfoobserver", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[BLTBBObserver surrogateWithQueue:v7->_queue calloutQueue:v7->_queue];
    observer = v7->_observer;
    v7->_observer = (BBObserver *)v12;

    [(BBObserver *)v7->_observer setObserverFeed:513];
    [(BBObserver *)v7->_observer setDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(BBObserver *)self->_observer invalidate];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BLTSectionInfoObserver;
  [(BLTSectionInfoObserver *)&v4 dealloc];
}

- (void)_settingsGatewayReconnected:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__BLTSectionInfoObserver__settingsGatewayReconnected___block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__BLTSectionInfoObserver__settingsGatewayReconnected___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.bbobserver" code:1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  if (!a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__BLTSectionInfoObserver_observer_noteServerConnectionStateChanged___block_invoke;
    block[3] = &unk_264683BD8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __68__BLTSectionInfoObserver_observer_noteServerConnectionStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1)
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.bulletindistributor.bbobserver" code:1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

- (id)sectionInfoForSectionID:(id)a3
{
  v3 = [(BBSettingsGateway *)self->_settingsGateway sectionInfoForSectionID:a3];
  if (v3)
  {
    objc_super v4 = objc_alloc_init(BLTSectionInfoItem);
    [(BLTSectionInfoItem *)v4 setSectionInfo:v3];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)reloadWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__BLTSectionInfoObserver_reloadWithCompletion___block_invoke;
  v6[3] = &unk_264684748;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BLTSectionInfoObserver *)self _reloadSectionInfosWithCompletion:v6];
}

void __47__BLTSectionInfoObserver_reloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  if (v5 && [v5 code] == 1)
  {
    [*(id *)(a1 + 32) reloadWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    }
  }
}

- (void)_getUniversalSectionIDs:(id)a3 sectionIDEnumerator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_queue_t v10 = (void (**)(void))a5;
  v11 = [v9 nextObject];
  uint64_t v12 = v11;
  if (v11)
  {
    observer = self->_observer;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __81__BLTSectionInfoObserver__getUniversalSectionIDs_sectionIDEnumerator_completion___block_invoke;
    v14[3] = &unk_264684770;
    id v15 = v11;
    id v16 = v8;
    v17 = self;
    id v18 = v9;
    v19 = v10;
    [(BBObserver *)observer getUniversalSectionIDForSectionID:v15 withCompletion:v14];
  }
  else if (v10)
  {
    v10[2](v10);
  }
}

void __81__BLTSectionInfoObserver__getUniversalSectionIDs_sectionIDEnumerator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(BLTSectionInfoSectionIDs);
  [(BLTSectionInfoSectionIDs *)v4 setSectionID:*(void *)(a1 + 32)];
  [(BLTSectionInfoSectionIDs *)v4 setUniversalSectionID:v3];

  [*(id *)(a1 + 40) addObject:v4];
  [*(id *)(a1 + 48) _getUniversalSectionIDs:*(void *)(a1 + 40) sectionIDEnumerator:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)updateSectionInfoBySectionIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[BLTTransaction transactionWithDescription:@"BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:"];
  settingsGateway = self->_settingsGateway;
  if (!settingsGateway) {
    -[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:]();
  }
  dispatch_queue_t v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [(BBSettingsGateway *)settingsGateway allSectionIDs];
  uint64_t v12 = [v10 setWithArray:v11];

  v13 = (void *)[v6 mutableCopy];
  int v14 = [v6 isSubsetOfSet:v12];
  if ((v14 & 1) == 0)
  {
    id v15 = (void *)[v6 mutableCopy];
    [v15 minusSet:v12];
    [v13 minusSet:v15];
    id v16 = blt_settings_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      -[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:]((uint64_t)v15, v16);
    }
  }
  v17 = [MEMORY[0x263EFF980] array];
  id v18 = [v13 objectEnumerator];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__BLTSectionInfoObserver_updateSectionInfoBySectionIDs_completion___block_invoke;
  v20[3] = &unk_264683E78;
  v20[4] = self;
  id v21 = v17;
  id v22 = v8;
  id v19 = v17;
  [(BLTSectionInfoObserver *)self _getUniversalSectionIDs:v19 sectionIDEnumerator:v18 completion:v20];

  if (v7) {
    v7[2](v7, v14 ^ 1u);
  }
}

void __67__BLTSectionInfoObserver_updateSectionInfoBySectionIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sectionInfoObserver:*(void *)(a1 + 32) updatedSectionInfoForSectionIDs:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48)];
}

- (void)_reloadSectionInfosWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke;
  v7[3] = &unk_264684118;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v5) {
    __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_1();
  }
  id v6 = [v5 allSectionIDs];
  id v7 = blt_settings_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_222F4C000, v8, OS_LOG_TYPE_DEFAULT, "Reloaded %@ section IDs", buf, 0xCu);
    }
    dispatch_queue_t v10 = [MEMORY[0x263EFF980] array];
    v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v6 objectEnumerator];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_22;
    v13[3] = &unk_264683BB0;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v10;
    id v8 = v10;
    [v11 _getUniversalSectionIDs:v8 sectionIDEnumerator:v12 completion:v13];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_2(v8);
  }
}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_22(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), 0);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;
  }
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[BLTTransaction transactionWithDescription:@"BLTSectionInfoObserver observer:updateSectionInfo:"];
  if (!self->_settingsGateway) {
    -[BLTSectionInfoObserver observer:updateSectionInfo:]();
  }
  id v9 = (void *)v8;
  dispatch_queue_t v10 = [v7 sectionID];
  v11 = blt_settings_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_impl(&dword_222F4C000, v11, OS_LOG_TYPE_DEFAULT, "Received updated section info for %@", buf, 0xCu);
  }

  uint64_t v12 = [(BBSettingsGateway *)self->_settingsGateway sectionInfoForSectionID:v10];

  if (v12)
  {
    v13 = [v12 sectionID];
    observer = self->_observer;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__BLTSectionInfoObserver_observer_updateSectionInfo___block_invoke;
    v16[3] = &unk_264684798;
    id v17 = v13;
    id v18 = self;
    id v19 = v9;
    id v15 = v13;
    [(BBObserver *)observer getUniversalSectionIDForSectionID:v15 withCompletion:v16];
  }
  else
  {
    id v15 = blt_settings_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BLTSectionInfoObserver observer:updateSectionInfo:]((uint64_t)v10, v15);
    }
  }
}

void __53__BLTSectionInfoObserver_observer_updateSectionInfo___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(BLTSectionInfoSectionIDs);
  [(BLTSectionInfoSectionIDs *)v4 setSectionID:a1[4]];
  [(BLTSectionInfoSectionIDs *)v4 setUniversalSectionID:v3];

  id v5 = blt_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v6;
    _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_DEFAULT, "Loaded actual section info for %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  uint64_t v8 = a1[5];
  dispatch_queue_t v10 = v4;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  [WeakRetained sectionInfoObserver:v8 updatedSectionInfoForSectionIDs:v9 transaction:a1[6]];
}

- (void)observer:(id)a3 removeSection:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = +[BLTTransaction transactionWithDescription:@"BLTSectionInfoObserver observer:updateSectionInfo:"];
  id v7 = blt_settings_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_222F4C000, v7, OS_LOG_TYPE_DEFAULT, "Received removeSection from BB for %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    observer = self->_observer;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__BLTSectionInfoObserver_observer_removeSection___block_invoke;
    v11[3] = &unk_264684798;
    v11[4] = self;
    id v12 = v5;
    id v13 = v6;
    [(BBObserver *)observer getUniversalSectionIDForSectionID:v12 withCompletion:v11];
  }
}

void __49__BLTSectionInfoObserver_observer_removeSection___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  [WeakRetained sectionInfoObserver:a1[4] removedSectionWithSectionID:a1[5] transaction:a1[6]];
}

- (BLTSectionInfoObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSectionInfoObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong(&self->_reloadSectionInfoCompletion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)updateSectionInfoBySectionIDs:completion:.cold.1()
{
  __assert_rtn("-[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:]", "BLTSectionInfoObserver.m", 124, "_settingsGateway != nil");
}

- (void)updateSectionInfoBySectionIDs:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, (os_log_type_t)0x90u, "Asked to update section IDs that BulletinBoard does not know: %@", (uint8_t *)&v2, 0xCu);
}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[BLTSectionInfoObserver _reloadSectionInfosWithCompletion:]_block_invoke", "BLTSectionInfoObserver.m", 147, "_settingsGateway != nil");
}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Settings gateway failed to get section IDs!", v1, 2u);
}

- (void)observer:updateSectionInfo:.cold.1()
{
  __assert_rtn("-[BLTSectionInfoObserver observer:updateSectionInfo:]", "BLTSectionInfoObserver.m", 172, "_settingsGateway != nil");
}

- (void)observer:(uint64_t)a1 updateSectionInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Retrieved nil sectionInfo from BB updated section info: %@", (uint8_t *)&v2, 0xCu);
}

@end