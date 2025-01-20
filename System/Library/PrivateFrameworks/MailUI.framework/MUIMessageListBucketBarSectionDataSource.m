@interface MUIMessageListBucketBarSectionDataSource
- (MUIMessageListBucketBarSectionDataSource)initWithConfiguration:(id)a3 bucketsViewController:(id)a4;
- (id)bucketsViewController;
- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6;
- (void)_configureCell:(id)a3;
- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4;
- (void)setLayoutConstraints:(uint64_t)a1;
- (void)stopObserving;
@end

@implementation MUIMessageListBucketBarSectionDataSource

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

- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__MUIMessageListBucketBarSectionDataSource_beginObservingAnimated_nextUpdateNeedsCleanSnapshot___block_invoke;
  v4[3] = &unk_1E6D119B8;
  v4[4] = self;
  [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:a3 cleanSnapshot:0 prepare:0 update:v4 completion:0];
}

id __96__MUIMessageListBucketBarSectionDataSource_beginObservingAnimated_nextUpdateNeedsCleanSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 224);
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v5 indexOfItemIdentifier:v8] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *(void **)(a1 + 32);
    if (v9) {
      v9 = (void *)v9[28];
    }
    v16 = v9;
    v10 = (void *)MEMORY[0x1E4F1C978];
    v11 = v9;
    v12 = [v10 arrayWithObjects:&v16 count:1];

    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v6, v16, v17);
    uint64_t v13 = +[MessageListSectionDataSourceChange added:1 isFirstChange:1];
  }
  else
  {
    uint64_t v13 = +[MessageListSectionDataSourceChange skipped];
  }
  v14 = (void *)v13;

  return v14;
}

void __88__MUIMessageListBucketBarSectionDataSource_initWithConfiguration_bucketsViewController___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _configureCell:v3];
}

- (void)_configureCell:(id)a3
{
  v36[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = -[MUIMessageListBucketBarSectionDataSource bucketsViewController]((id *)&self->super.super.isa);
  id v6 = [v5 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self) {
    layoutConstraints = self->_layoutConstraints;
  }
  else {
    layoutConstraints = 0;
  }
  uint64_t v8 = layoutConstraints;
  if ([(NSArray *)v8 count]) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v8];
  }
  v35 = v8;
  v9 = [v4 contentView];

  if (v6 != v9)
  {
    v10 = [(MessageListSectionDataSource *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v11 = [v10 parentViewControllerForBucketBarSectionDataSource:self];
      [v5 willMoveToParentViewController:v11];
    }
    else
    {
      v11 = 0;
    }
    [v11 addChildViewController:v5];
    v12 = [v4 contentView];
    [v12 addSubview:v6];

    if (v11) {
      [v5 didMoveToParentViewController:v11];
    }
  }
  v33 = [v6 topAnchor];
  v34 = [v4 contentView];
  v32 = [v34 topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v36[0] = v31;
  v29 = [v6 leadingAnchor];
  v30 = [v4 contentView];
  v26 = [v30 leadingAnchor];
  v25 = [v29 constraintEqualToAnchor:v26];
  v36[1] = v25;
  v22 = [v6 bottomAnchor];
  v23 = [v4 contentView];
  uint64_t v13 = [v23 bottomAnchor];
  v14 = [v22 constraintEqualToAnchor:v13 constant:-8.0];
  v36[2] = v14;
  [v6 trailingAnchor];
  v15 = v27 = self;
  v16 = [v4 contentView];
  uint64_t v17 = [v16 trailingAnchor];
  [v15 constraintEqualToAnchor:v17];
  v18 = v28 = v4;
  v36[3] = v18;
  v19 = [v6 heightAnchor];
  [v5 preferredHeight];
  objc_msgSend(v19, "constraintEqualToConstant:");
  v20 = v24 = v5;
  v36[4] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];

  [MEMORY[0x1E4F28DC8] activateConstraints:v21];
  -[MUIMessageListBucketBarSectionDataSource setLayoutConstraints:]((uint64_t)v27, v21);
}

- (void)setLayoutConstraints:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (id)bucketsViewController
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 29);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (MUIMessageListBucketBarSectionDataSource)initWithConfiguration:(id)a3 bucketsViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MUIMessageListBucketBarSectionDataSource;
  uint64_t v8 = [(MessageListSectionDataSource *)&v23 initWithConfiguration:v6];
  if (v8)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v9 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v10 = objc_opt_class();
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __88__MUIMessageListBucketBarSectionDataSource_initWithConfiguration_bucketsViewController___block_invoke;
    v20 = &unk_1E6D11CC0;
    objc_copyWeak(&v21, &location);
    uint64_t v11 = [v9 registrationWithCellClass:v10 configurationHandler:&v17];
    cellRegistration = v8->_cellRegistration;
    v8->_cellRegistration = (UICollectionViewCellRegistration *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F60400]);
    uint64_t v14 = objc_msgSend(v13, "initAsEphemeralID:", 1, v17, v18, v19, v20);
    itemIdentifier = v8->_itemIdentifier;
    v8->_itemIdentifier = (EMObjectID *)v14;

    objc_storeWeak((id *)&v8->_bucketsViewController, v7);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)stopObserving
{
  -[MUIMessageListBucketBarSectionDataSource bucketsViewController]((id *)&self->super.super.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 willMoveToParentViewController:0];
  v2 = [v3 view];
  [v2 removeFromSuperview];

  [v3 removeFromParentViewController];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_destroyWeak((id *)&self->_bucketsViewController);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
}

@end