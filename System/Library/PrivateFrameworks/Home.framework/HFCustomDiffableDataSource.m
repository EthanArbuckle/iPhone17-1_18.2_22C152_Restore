@interface HFCustomDiffableDataSource
- (HFCustomDiffableDataSource)init;
- (HFCustomDiffableDataSourceSnapshot)snapshot;
- (NSArray)sections;
- (id)_indexPathForItem:(id)a3 inDisplayedItemsArray:(id)a4;
- (id)indexPathForItemIdentifier:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)supplementaryViewProvider;
- (unint64_t)_sectionForItem:(id)a3;
- (unint64_t)_sectionForItem:(id)a3 assertOnNotFound:(BOOL)a4;
- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6;
- (void)setSections:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setSupplementaryViewProvider:(id)a3;
@end

@implementation HFCustomDiffableDataSource

- (HFCustomDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (HFCustomDiffableDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFCustomDiffableDataSource;
  v2 = [(HFCustomDiffableDataSource *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(HFCustomDiffableDataSourceSnapshot);
    snapshot = v2->_snapshot;
    v2->_snapshot = v3;
  }
  return v2;
}

- (void)setSections:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCustomDiffableDataSource *)self snapshot];
  [v5 setSections:v4];
}

- (NSArray)sections
{
  v2 = [(HFCustomDiffableDataSource *)self snapshot];
  v3 = [v2 sections];

  return (NSArray *)v3;
}

- (void)applySnapshot:(id)a3 toSection:(id)a4 animatingDifferences:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = NSStringFromSelector(a2);
  [v9 handleFailureInMethod:a2, self, @"HFCustomDiffableDataSource.m", 95, @"%@:%@ Should NOT be called, this ItemManager does not support diffable", self, v8 object file lineNumber description];
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  objc_super v6 = [(HFCustomDiffableDataSource *)self sections];
  uint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = [(HFCustomDiffableDataSource *)self sections];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

    v10 = [v9 items];
    if ([v4 item] < 0 || (uint64_t v11 = objc_msgSend(v4, "item"), v11 >= objc_msgSend(v10, "count")))
    {
      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    }
  }
  return v12;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFCustomDiffableDataSource *)self _sectionForItem:v4 assertOnNotFound:0];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = 0;
  }
  else
  {
    unint64_t v7 = v5;
    v8 = [(HFCustomDiffableDataSource *)self sections];
    id v9 = [v8 objectAtIndexedSubscript:v7];

    v10 = [v9 items];
    objc_super v6 = [(HFCustomDiffableDataSource *)self _indexPathForItem:v4 inDisplayedItemsArray:v10];
  }
  return v6;
}

- (unint64_t)_sectionForItem:(id)a3
{
  return [(HFCustomDiffableDataSource *)self _sectionForItem:a3 assertOnNotFound:1];
}

- (unint64_t)_sectionForItem:(id)a3 assertOnNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [(HFCustomDiffableDataSource *)self sections];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __63__HFCustomDiffableDataSource__sectionForItem_assertOnNotFound___block_invoke;
  v16 = &unk_264095B68;
  id v9 = v7;
  id v17 = v9;
  unint64_t v10 = [v8 indexOfObjectPassingTest:&v13];

  if (v4 && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HFCustomDiffableDataSource.m", 142, @"Could not find section for item: %@", v9, v13, v14, v15, v16 object file lineNumber description];
  }
  return v10;
}

uint64_t __63__HFCustomDiffableDataSource__sectionForItem_assertOnNotFound___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 items];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)_indexPathForItem:(id)a3 inDisplayedItemsArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && (unint64_t v8 = [(HFCustomDiffableDataSource *)self _sectionForItem:v6],
        uint64_t v9 = [v7 indexOfObjectIdenticalTo:v6],
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v10 = [MEMORY[0x263F088C8] indexPathForItem:v9 inSection:v8];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)supplementaryViewProvider
{
  return 0;
}

- (void)setSupplementaryViewProvider:(id)a3
{
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong(&self->supplementaryViewProvider, 0);
}

@end