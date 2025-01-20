@interface MUIMessageListHelpMailLearnSectionDataSource
- (MUIMessageListHelpMailLearnSectionDataSource)initWithConfiguration:(id)a3;
- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5;
- (void)_hideHelpMailLearn;
- (void)_hideHelpMailLearnUntilDate:(id)a3;
- (void)_showFeedbackView;
- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4;
@end

@implementation MUIMessageListHelpMailLearnSectionDataSource

- (MUIMessageListHelpMailLearnSectionDataSource)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MUIMessageListHelpMailLearnSectionDataSource;
  v5 = [(MessageListSectionDataSource *)&v20 initWithConfiguration:v4];
  if (v5)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v6 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v7 = objc_opt_class();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __70__MUIMessageListHelpMailLearnSectionDataSource_initWithConfiguration___block_invoke;
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

void __70__MUIMessageListHelpMailLearnSectionDataSource_initWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
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
  v4[2] = __100__MUIMessageListHelpMailLearnSectionDataSource_beginObservingAnimated_nextUpdateNeedsCleanSnapshot___block_invoke;
  v4[3] = &unk_1E6D119B8;
  v4[4] = self;
  [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:a3 cleanSnapshot:1 prepare:0 update:v4 completion:0];
}

id __100__MUIMessageListHelpMailLearnSectionDataSource_beginObservingAnimated_nextUpdateNeedsCleanSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v9 = (void *)v9[28];
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

- (void)_hideHelpMailLearnUntilDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "em_userDefaults");
  [v6 setObject:v5 forKey:*MEMORY[0x1E4F60198]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearnUntilDate___block_invoke;
  v7[3] = &unk_1E6D119B8;
  v7[4] = self;
  [(MessageListSectionDataSource *)self _performDataSourceUpdateAnimated:1 cleanSnapshot:0 prepare:0 update:v7 completion:0];
}

id __76__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearnUntilDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 224);
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
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8) {
      uint64_t v8 = (void *)v8[28];
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

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 helpMailLearnButton];
  [v7 addTarget:self action:sel__showFeedbackView forControlEvents:64];

  id v8 = [v6 cancelButton];

  [v8 addTarget:self action:sel__hideHelpMailLearn forControlEvents:64];
}

- (void)_showFeedbackView
{
  id v7 = [(MessageListSectionDataSource *)self delegate];
  id v3 = [(MessageListSectionDataSource *)self delegate];
  id v4 = [v3 presentingViewControllerForHelpMailLearnSectionDataSource:self];

  uint64_t v5 = [v7 feedbackListViewModelForHelpMailLearnSectionDataSource:self];
  id v6 = +[FeedbackListViewController createWithViewModel:v5];
  [v4 presentViewController:v6 animated:1 completion:0];
}

- (void)_hideHelpMailLearn
{
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v5 = _EFLocalizedString();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearn__block_invoke;
  v20[3] = &unk_1E6D13128;
  v20[4] = self;
  id v6 = [v4 actionWithTitle:v5 style:0 handler:v20];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = _EFLocalizedString();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearn__block_invoke_2;
  v19[3] = &unk_1E6D13128;
  v19[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v19];

  id v10 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v11 = _EFLocalizedString();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearn__block_invoke_3;
  v18[3] = &unk_1E6D13128;
  v18[4] = self;
  v12 = [v10 actionWithTitle:v11 style:2 handler:v18];

  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = _EFLocalizedString();
  uint64_t v15 = [v13 actionWithTitle:v14 style:1 handler:0];

  [v3 addAction:v6];
  [v3 addAction:v9];
  [v3 addAction:v12];
  [v3 addAction:v15];
  v16 = [(MessageListSectionDataSource *)self delegate];
  uint64_t v17 = [v16 presentingViewControllerForHelpMailLearnSectionDataSource:self];

  [v17 presentViewController:v3 animated:1 completion:0];
}

void __66__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearn__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_tomorrowMorning");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _hideHelpMailLearnUntilDate:v2];
}

void __66__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearn__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_nextWeekMorning");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _hideHelpMailLearnUntilDate:v2];
}

void __66__MUIMessageListHelpMailLearnSectionDataSource__hideHelpMailLearn__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v1 _hideHelpMailLearnUntilDate:v2];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
}

@end