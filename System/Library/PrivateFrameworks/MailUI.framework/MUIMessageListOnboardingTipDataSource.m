@interface MUIMessageListOnboardingTipDataSource
- (MUIMessageListOnboardingTipDataSource)initWithConfiguration:(id)a3;
- (MUIMessageListOnboardingTipDataSource)initWithConfiguration:(id)a3 bucket:(int64_t)a4;
- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6;
- (int64_t)selectedBucket;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5;
- (void)_hideOnboardingTip;
- (void)_learnMoreTip;
- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4;
- (void)setSelectedBucket:(int64_t)a3;
@end

@implementation MUIMessageListOnboardingTipDataSource

- (MUIMessageListOnboardingTipDataSource)initWithConfiguration:(id)a3 bucket:(int64_t)a4
{
  id v6 = a3;
  [(MUIMessageListOnboardingTipDataSource *)self setSelectedBucket:a4];
  v7 = [(MUIMessageListOnboardingTipDataSource *)self initWithConfiguration:v6];

  return v7;
}

- (MUIMessageListOnboardingTipDataSource)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MUIMessageListOnboardingTipDataSource;
  v5 = [(MessageListSectionDataSource *)&v20 initWithConfiguration:v4];
  if (v5)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    id v6 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v7 = objc_opt_class();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __63__MUIMessageListOnboardingTipDataSource_initWithConfiguration___block_invoke;
    v17 = &unk_1E6D11CC0;
    objc_copyWeak(&v18, &location);
    uint64_t v8 = [v6 registrationWithCellClass:v7 configurationHandler:&v14];
    cellRegistration = v5->_cellRegistration;
    v5->_cellRegistration = (UICollectionViewCellRegistration *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F60400]);
    uint64_t v11 = objc_msgSend(v10, "initAsEphemeralID:", 1, v14, v15, v16, v17);
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (EMObjectID *)v11;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __63__MUIMessageListOnboardingTipDataSource_initWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureCell:v9 atIndexPath:v8 itemID:v7];
}

- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__MUIMessageListOnboardingTipDataSource_beginObservingAnimated_nextUpdateNeedsCleanSnapshot___block_invoke;
  v4[3] = &unk_1E6D119B8;
  v4[4] = self;
  [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:a3 cleanSnapshot:1 prepare:0 update:v4 completion:0];
}

id __93__MUIMessageListOnboardingTipDataSource_beginObservingAnimated_nextUpdateNeedsCleanSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 232);
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v5 indexOfItemIdentifier:v8] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v9 = (void *)v9[29];
    }
    v16 = v9;
    id v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = v9;
    v12 = [v10 arrayWithObjects:&v16 count:1];

    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v6, v16, v17);
    uint64_t v13 = +[MessageListSectionDataSourceChange added:1 isFirstChange:1];
  }
  else
  {
    uint64_t v13 = +[MessageListSectionDataSourceChange skipped];
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  id v6 = a3;
  objc_msgSend(v6, "configureForBucket:", -[MUIMessageListOnboardingTipDataSource selectedBucket](self, "selectedBucket"));
  uint64_t v7 = [v6 cancelButton];
  [v7 addTarget:self action:sel__hideOnboardingTip forControlEvents:64];

  id v8 = [v6 learnMoreButton];

  [v8 addTarget:self action:sel__learnMoreTip forControlEvents:64];
}

- (void)_learnMoreTip
{
  id v5 = [(MessageListSectionDataSource *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"MUIMessageListOnboardingTipDataSource-BlackPearlUI.m", 72, @"Learn More tapped, but delegate doesn't implement the necessary method" object file lineNumber description];
  }
  [v5 learnMoreForMessageListSectionDataSource:self];
}

- (void)_hideOnboardingTip
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__MUIMessageListOnboardingTipDataSource__hideOnboardingTip__block_invoke;
  v2[3] = &unk_1E6D119B8;
  v2[4] = self;
  [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:1 cleanSnapshot:0 prepare:0 update:v2 completion:0];
}

id __59__MUIMessageListOnboardingTipDataSource__hideOnboardingTip__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 232);
  }
  else {
    uint64_t v6 = 0;
  }
  if ([v3 indexOfItemIdentifier:v6] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = +[MessageListSectionDataSourceChange skipped];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v8) {
      id v8 = (void *)v8[29];
    }
    uint64_t v14 = v8;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = v8;
    uint64_t v11 = [v9 arrayWithObjects:&v14 count:1];

    objc_msgSend(v4, "deleteItemsWithIdentifiers:", v11, v14, v15);
    uint64_t v7 = +[MessageListSectionDataSourceChange removed:1];
  }
  v12 = (void *)v7;

  return v12;
}

- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6
{
  if (self) {
    cellRegistration = self->_cellRegistration;
  }
  else {
    cellRegistration = 0;
  }
  return (id)objc_msgSend(a3, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", cellRegistration, a4, a5, a6);
}

- (int64_t)selectedBucket
{
  return self->_selectedBucket;
}

- (void)setSelectedBucket:(int64_t)a3
{
  self->_selectedBucket = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
}

@end