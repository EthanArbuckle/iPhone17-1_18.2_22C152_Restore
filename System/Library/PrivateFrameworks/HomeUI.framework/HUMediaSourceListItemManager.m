@interface HUMediaSourceListItemManager
- (NSArray)mediaSourceItems;
- (NSArray)sources;
- (NSSet)containers;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)initForMediaProfileContainers:(id)a3 delegate:(id)a4 forTarget:(unint64_t)a5;
- (unint64_t)target;
- (void)setContainers:(id)a3;
- (void)setSources:(id)a3;
@end

@implementation HUMediaSourceListItemManager

- (id)initForMediaProfileContainers:(id)a3 delegate:(id)a4 forTarget:(unint64_t)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HUMediaSourceListItemManager;
  id v20 = a4;
  val = -[HFItemManager initWithDelegate:](&v32, sel_initWithDelegate_);
  if (val)
  {
    objc_storeStrong((id *)&val->_containers, a3);
    v8 = +[HUMediaSourceItem appleMusicSource];
    v34[0] = v8;
    v9 = +[HUMediaSourceItem soundScapesSource];
    v34[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    sources = val->_sources;
    val->_sources = (NSArray *)v10;

    objc_initWeak(&location, val);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v12 = [(HUMediaSourceListItemManager *)val sources];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v17 = [v16 resolveForMediaProfiles:v24 forTarget:a5];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __81__HUMediaSourceListItemManager_initForMediaProfileContainers_delegate_forTarget___block_invoke;
          v25[3] = &unk_1E6387B88;
          objc_copyWeak(v26, &location);
          v25[4] = v16;
          v26[1] = (id)a2;
          id v18 = (id)[v17 addCompletionBlock:v25];
          objc_destroyWeak(v26);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v13);
    }

    objc_destroyWeak(&location);
  }

  return val;
}

void __81__HUMediaSourceListItemManager_initForMediaProfileContainers_delegate_forTarget___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  id v3 = (id)[WeakRetained updateResultsForItems:v2 senderSelector:*(void *)(a1 + 48)];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C8]);
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(HUMediaSourceListItemManager *)self sources];
  v7 = [v5 setWithArray:v6];
  v8 = (void *)[v4 initWithItems:v7];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F692E8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithIdentifier:@"HUMediaSourceListItemManager"];
  v6 = [v4 allObjects];

  v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_227];
  [v5 setItems:v7];

  [v5 setHeaderTitle:0];
  [v5 setFooterTitle:0];
  v10[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

uint64_t __65__HUMediaSourceListItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 bundleIdentifier];
  v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (NSArray)mediaSourceItems
{
  return self->_mediaSourceItems;
}

- (unint64_t)target
{
  return self->_target;
}

- (NSSet)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (NSArray)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_containers, 0);

  objc_storeStrong((id *)&self->_mediaSourceItems, 0);
}

@end