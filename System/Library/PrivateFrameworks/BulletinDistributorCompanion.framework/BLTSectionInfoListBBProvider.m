@interface BLTSectionInfoListBBProvider
- (BLTSectionInfoListBBProvider)init;
- (BLTSectionInfoListBBProvider)initWithSettingsGateway:(id)a3;
- (BLTSectionInfoListProviderDelegate)delegate;
- (id)sectionInfoForSectionID:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)dealloc;
- (void)reloadSection:(id)a3 completion:(id)a4;
- (void)reloadWithCompletion:(id)a3;
- (void)sectionInfoObserver:(id)a3 removedSectionWithSectionID:(id)a4 transaction:(id)a5;
- (void)sectionInfoObserver:(id)a3 updatedSectionInfoForSectionIDs:(id)a4 transaction:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation BLTSectionInfoListBBProvider

- (BLTSectionInfoListBBProvider)init
{
  return [(BLTSectionInfoListBBProvider *)self initWithSettingsGateway:0];
}

- (BLTSectionInfoListBBProvider)initWithSettingsGateway:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLTSectionInfoListBBProvider;
  v5 = [(BLTSectionInfoListBBProvider *)&v14 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.bulletindistributor.sectioninfolistbbprovider", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = [[BLTSectionInfoObserver alloc] initWithSettingsGateway:v4];
    observer = v5->_observer;
    v5->_observer = v9;

    [(BLTSectionInfoObserver *)v5->_observer setDelegate:v5];
    uint64_t v11 = [MEMORY[0x263F01880] defaultWorkspace];
    appWorkspace = v5->_appWorkspace;
    v5->_appWorkspace = (LSApplicationWorkspace *)v11;

    [(LSApplicationWorkspace *)v5->_appWorkspace addObserver:v5];
  }

  return v5;
}

- (void)dealloc
{
  [(LSApplicationWorkspace *)self->_appWorkspace removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BLTSectionInfoListBBProvider;
  [(BLTSectionInfoListBBProvider *)&v3 dealloc];
}

- (void)reloadWithCompletion:(id)a3
{
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  observer = self->_observer;
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [(BLTSectionInfoObserver *)observer updateSectionInfoBySectionIDs:v8 completion:v7];
}

- (id)sectionInfoForSectionID:(id)a3
{
  return [(BLTSectionInfoObserver *)self->_observer sectionInfoForSectionID:a3];
}

- (void)sectionInfoObserver:(id)a3 updatedSectionInfoForSectionIDs:(id)a4 transaction:(id)a5
{
  p_delegate = &self->_delegate;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained updateSectionInfoForSectionIDs:v8 transaction:v7];
}

- (void)sectionInfoObserver:(id)a3 removedSectionWithSectionID:(id)a4 transaction:(id)a5
{
  p_delegate = &self->_delegate;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained removedSectionWithSectionID:v8 transaction:v7];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "bundleIdentifier", (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    [(BLTSectionInfoObserver *)self->_observer updateSectionInfoBySectionIDs:v5 completion:0];
  }
}

- (BLTSectionInfoListProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSectionInfoListProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end