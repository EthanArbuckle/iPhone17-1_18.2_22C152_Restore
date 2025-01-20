@interface AEPackageTransport
- (AEPackageTransport)init;
- (AEPackageTransportDelegate)delegate;
- (BOOL)shouldHideReviewController;
- (NSMutableDictionary)_stagedPackagesByIdentifier;
- (NSMutableOrderedSet)_allOrderedPackageIdentifiers;
- (NSSet)expectedPackageIdentifiers;
- (id)_orderedStagedIdentifiersIncludingPendingIdentifier:(id)a3;
- (id)orderedStagedIdentifiers;
- (id)packagesWithLivePhotoContent;
- (id)stagedPackageForIdentifier:(id)a3;
- (id)stagedPackages;
- (int64_t)expectedPackageCount;
- (unint64_t)proposedStagedIndexForPendingIdentifier:(id)a3;
- (void)_addPackageToStaging:(id)a3;
- (void)_removePackageFromStagingWithIdentifier:(id)a3;
- (void)addPendingPackageIdentifier:(id)a3;
- (void)performChanges:(id)a3;
- (void)removePendingPackageIdentifier:(id)a3;
- (void)reportError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldHideReviewController:(BOOL)a3;
- (void)stagePackage:(id)a3;
- (void)stagePackages:(id)a3;
- (void)stagePackages:(id)a3 andNotify:(BOOL)a4;
- (void)unstagePackageWithIdentifier:(id)a3;
- (void)unstagePackageWithIdentifier:(id)a3 andNotify:(BOOL)a4;
- (void)unstagePackagesWithIdentifiers:(id)a3;
@end

@implementation AEPackageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stagedPackagesByIdentifier, 0);
  objc_storeStrong((id *)&self->__allOrderedPackageIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableDictionary)_stagedPackagesByIdentifier
{
  return self->__stagedPackagesByIdentifier;
}

- (NSMutableOrderedSet)_allOrderedPackageIdentifiers
{
  return self->__allOrderedPackageIdentifiers;
}

- (void)setShouldHideReviewController:(BOOL)a3
{
  self->_shouldHideReviewController = a3;
}

- (BOOL)shouldHideReviewController
{
  return self->_shouldHideReviewController;
}

- (void)setDelegate:(id)a3
{
}

- (AEPackageTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AEPackageTransportDelegate *)WeakRetained;
}

- (void)removePendingPackageIdentifier:(id)a3
{
  id v7 = a3;
  v4 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  if ([v4 containsObject:v7])
  {
    v5 = [(AEPackageTransport *)self _stagedPackagesByIdentifier];
    v6 = [v5 objectForKey:v7];

    if (v6) {
      goto LABEL_5;
    }
    v4 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
    [v4 removeObject:v7];
  }

LABEL_5:
}

- (void)addPendingPackageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  [v5 addObject:v4];
}

- (NSSet)expectedPackageIdentifiers
{
  v2 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  v3 = (void *)[v2 copy];
  id v4 = [v3 set];

  return (NSSet *)v4;
}

- (int64_t)expectedPackageCount
{
  v2 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  int64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)proposedStagedIndexForPendingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AEPackageTransport *)self _orderedStagedIdentifiersIncludingPendingIdentifier:v4];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)stagedPackages
{
  v2 = (void *)MEMORY[0x263EFFA08];
  int64_t v3 = [(AEPackageTransport *)self _stagedPackagesByIdentifier];
  id v4 = [v3 allValues];
  id v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)stagedPackageForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AEPackageTransport *)self _stagedPackagesByIdentifier];
  unint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)orderedStagedIdentifiers
{
  v2 = [(AEPackageTransport *)self _orderedStagedIdentifiersIncludingPendingIdentifier:0];
  int64_t v3 = [v2 array];

  return v3;
}

- (id)_orderedStagedIdentifiersIncludingPendingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9C0];
  unint64_t v6 = [(AEPackageTransport *)self _stagedPackagesByIdentifier];
  id v7 = [v6 allKeys];
  v8 = [v5 setWithArray:v7];

  if (v4) {
    [v8 addObject:v4];
  }
  v9 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  v10 = (void *)[v9 mutableCopy];

  [v10 intersectSet:v8];
  v11 = (void *)[v10 copy];

  return v11;
}

- (void)unstagePackagesWithIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__AEPackageTransport_unstagePackagesWithIdentifiers___block_invoke;
  v16[3] = &unk_26489BC68;
  id v5 = v4;
  id v17 = v5;
  v18 = self;
  [(AEPackageTransport *)self performChanges:v16];
  unint64_t v6 = [(AEPackageTransport *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "packageTransport:didUnstagePackageWithIdentifier:", self, *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

void __53__AEPackageTransport_unstagePackagesWithIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_removePackageFromStagingWithIdentifier:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)unstagePackageWithIdentifier:(id)a3 andNotify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __61__AEPackageTransport_unstagePackageWithIdentifier_andNotify___block_invoke;
  uint64_t v12 = &unk_26489BC68;
  long long v13 = self;
  id v7 = v6;
  id v14 = v7;
  [(AEPackageTransport *)self performChanges:&v9];
  if (v4)
  {
    long long v8 = [(AEPackageTransport *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 packageTransport:self didUnstagePackageWithIdentifier:v7];
    }
  }
}

uint64_t __61__AEPackageTransport_unstagePackageWithIdentifier_andNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePackageFromStagingWithIdentifier:*(void *)(a1 + 40)];
}

- (void)unstagePackageWithIdentifier:(id)a3
{
}

- (void)stagePackages:(id)a3 andNotify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __46__AEPackageTransport_stagePackages_andNotify___block_invoke;
  uint64_t v12 = &unk_26489BC68;
  id v7 = v6;
  id v13 = v7;
  id v14 = self;
  [(AEPackageTransport *)self performChanges:&v9];
  if (v4)
  {
    long long v8 = [(AEPackageTransport *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 packageTransport:self didStagePackages:v7];
    }
  }
}

void __46__AEPackageTransport_stagePackages_andNotify___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_addPackageToStaging:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stagePackages:(id)a3
{
}

- (void)stagePackage:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  long long v10 = __35__AEPackageTransport_stagePackage___block_invoke;
  uint64_t v11 = &unk_26489BC68;
  uint64_t v12 = self;
  id v5 = v4;
  id v13 = v5;
  [(AEPackageTransport *)self performChanges:&v8];
  uint64_t v6 = [(AEPackageTransport *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v14[0] = v5;
    long long v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [v6 packageTransport:self didStagePackages:v7];
  }
}

uint64_t __35__AEPackageTransport_stagePackage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addPackageToStaging:*(void *)(a1 + 40)];
}

- (void)reportError:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [v3 localizedDescription];
    int v6 = 138543362;
    long long v7 = v5;
    _os_log_impl(&dword_22B526000, v4, OS_LOG_TYPE_ERROR, "AssetExplorer reported error to transport: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_removePackageFromStagingWithIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(AEPackageTransport *)self _stagedPackagesByIdentifier];
  [v6 removeObjectForKey:v4];
  id v5 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  [v5 removeObject:v4];

  [(AEPackageTransport *)self signalChange:1];
}

- (void)_addPackageToStaging:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AEPackageTransport *)self _stagedPackagesByIdentifier];
  id v6 = [(AEPackageTransport *)self _allOrderedPackageIdentifiers];
  long long v7 = [v4 identifier];
  uint64_t v8 = [v5 objectForKey:v7];
  if (!v8)
  {
    uint64_t v9 = [v4 sidecarNumberForKey:@"AEPackageTransportSidecarProposedOrderKey"];
    unint64_t v10 = [v9 unsignedIntegerValue];
    if (v9)
    {
      unint64_t v11 = v10;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL && v10 <= [v6 count])
      {
        [v6 insertObject:v7 atIndex:v11];

        goto LABEL_9;
      }
      uint64_t v12 = PLAssetExplorerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543874;
        long long v15 = v7;
        __int16 v16 = 2050;
        unint64_t v17 = v11;
        __int16 v18 = 2050;
        uint64_t v19 = [v6 count];
        _os_log_impl(&dword_22B526000, v12, OS_LOG_TYPE_ERROR, "Package staging request index for %{public}@ is out of bounds (index: %{public}lu; package count: %{public}lu)",
          (uint8_t *)&v14,
          0x20u);
      }
    }
    [v6 addObject:v7];
  }
LABEL_9:
  id v13 = (void *)[v4 copy];
  [v5 setObject:v13 forKey:v7];

  [(AEPackageTransport *)self signalChange:1];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AEPackageTransport;
  [(AEPackageTransport *)&v3 performChanges:a3];
}

- (AEPackageTransport)init
{
  v8.receiver = self;
  v8.super_class = (Class)AEPackageTransport;
  id v2 = [(AEPackageTransport *)&v8 init];
  if (v2)
  {
    objc_super v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    allOrderedPackageIdentifiers = v2->__allOrderedPackageIdentifiers;
    v2->__allOrderedPackageIdentifiers = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    stagedPackagesByIdentifier = v2->__stagedPackagesByIdentifier;
    v2->__stagedPackagesByIdentifier = v5;
  }
  return v2;
}

- (id)packagesWithLivePhotoContent
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [(AEPackageTransport *)self stagedPackages];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsLivePhotoContent", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

@end