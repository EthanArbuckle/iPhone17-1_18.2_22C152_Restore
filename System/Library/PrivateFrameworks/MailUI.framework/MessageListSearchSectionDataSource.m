@interface MessageListSearchSectionDataSource
- (BOOL)hasSupplementaryViewOfKind:(id)a3;
- (BOOL)shouldShowSupplementaryViewOfKindIfEmpty:(id)a3 isIndexing:(BOOL)a4;
- (MessageListSearchSectionDataSource)initWithConfiguration:(id)a3;
- (MessageListSearchSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 searchProgressView:(id)a6 messageList:(id)a7 initialLoadCompletedPromise:(id)a8 layoutValuesHelper:(id)a9 state:(id)a10;
- (UICollectionViewSupplementaryRegistration)indexedFooterRegistration;
- (UICollectionViewSupplementaryRegistration)serverFooterRegistration;
- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5;
- (void)setIndexedFooterRegistration:(id)a3;
- (void)setServerFooterRegistration:(id)a3;
@end

@implementation MessageListSearchSectionDataSource

- (MessageListSearchSectionDataSource)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 section];
  v7 = [v4 collectionView];
  v8 = [v4 searchProgressView];
  v9 = [v4 messageList];
  v10 = [v4 initialLoadCompletedPromise];
  v11 = [v4 layoutValuesHelper];
  v12 = [v4 state];
  v13 = [(MessageListSearchSectionDataSource *)self initWithIdentifier:v5 section:v6 collectionView:v7 searchProgressView:v8 messageList:v9 initialLoadCompletedPromise:v10 layoutValuesHelper:v11 state:v12];

  if (v13)
  {
    v14 = [v4 delegate];
    [(MessageListSectionDataSource *)v13 setDelegate:v14];

    v15 = [v4 selectionModelProvider];
    [(MessageListSectionDataSource *)v13 setSelectionModelProvider:v15];

    v16 = [v4 contactStore];
    [(MessageListSectionDataSource *)v13 setContactStore:v16];
  }
  return v13;
}

- (MessageListSearchSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 searchProgressView:(id)a6 messageList:(id)a7 initialLoadCompletedPromise:(id)a8 layoutValuesHelper:(id)a9 state:(id)a10
{
  id v16 = a3;
  v17 = (__CFString *)a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v47.receiver = self;
  v47.super_class = (Class)MessageListSearchSectionDataSource;
  v40 = v18;
  id v24 = v18;
  v25 = v20;
  v26 = v21;
  v27 = [(MessageListRecentSectionDataSource *)&v47 initWithIdentifier:v16 section:v17 collectionView:v24 messageList:v25 initialLoadCompletedPromise:v21 layoutValuesHelper:v22 state:v23 headerType:2];
  if (!v27) {
    goto LABEL_12;
  }
  id v39 = v16;
  v28 = (void *)MEMORY[0x1E4FB15F8];
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = *MEMORY[0x1E4FB2760];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke;
  v45[3] = &unk_1E6D11D60;
  id v38 = v19;
  id v46 = v19;
  v31 = [v28 registrationWithSupplementaryClass:v29 elementKind:v30 configurationHandler:v45];
  if (_os_feature_enabled_impl())
  {
    if (@"MessageListSectionIndexedSearch" != v17)
    {
      id v16 = v39;
      if (@"MessageListSectionServerSearch" == v17) {
        [(MessageListSearchSectionDataSource *)v27 setServerFooterRegistration:v31];
      }
      goto LABEL_9;
    }
    v32 = [MEMORY[0x1E4FB15F8] registrationWithSupplementaryClass:objc_opt_class() elementKind:v30 configurationHandler:&__block_literal_global_6];
    [(MessageListSearchSectionDataSource *)v27 setIndexedFooterRegistration:v32];
  }
  else
  {
    [(MessageListSearchSectionDataSource *)v27 setIndexedFooterRegistration:v31];
  }
  id v16 = v39;
LABEL_9:
  if (_os_feature_enabled_impl())
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v27);
    v37 = (void *)MEMORY[0x1E4FB15F8];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = *MEMORY[0x1E4FB2770];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke_3;
    v41[3] = &unk_1E6D11DA8;
    objc_copyWeak(&v43, &location);
    id v42 = v22;
    v35 = [v37 registrationWithSupplementaryClass:v33 elementKind:v34 configurationHandler:v41];
    [(MessageListSectionDataSource *)v27 setHeaderRegistration:v35];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    id v16 = v39;
  }

  id v19 = v38;
LABEL_12:

  return v27;
}

void __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 removeFromSuperview];
  [v4 addSubview:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(*(id *)(a1 + 32), "mf_pinToView:usingLayoutMargins:", v4, 1);
}

void __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained section];
    v6 = MUITitleFromSection(v5);
    [v7 setTitle:v6];

    [v7 setLayoutValuesHelper:*(void *)(a1 + 32)];
  }
}

- (BOOL)hasSupplementaryViewOfKind:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FB2760]])
  {
    BOOL v5 = 1;
  }
  else if (_os_feature_enabled_impl() {
         && [v4 isEqualToString:*MEMORY[0x1E4FB2770]])
  }
  {
    v6 = [(MessageListSectionDataSource *)self section];
    BOOL v5 = v6 == @"MessageListSectionServerSearch";
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowSupplementaryViewOfKindIfEmpty:(id)a3 isIndexing:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4FB2760];
  if ([v6 isEqualToString:*MEMORY[0x1E4FB2760]]
    && ([(MessageListSectionDataSource *)self section],
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == @"MessageListSectionServerSearch"))
  {
    a4 = 1;
  }
  else if ([v6 isEqualToString:v7])
  {
    v9 = [(MessageListSectionDataSource *)self section];
    if (v9 != @"MessageListSectionIndexedSearch") {
      a4 = 0;
    }
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2760]])
  {
    v11 = [(MessageListSectionDataSource *)self section];
    if (v11 == @"MessageListSectionIndexedSearch") {
      [(MessageListSearchSectionDataSource *)self indexedFooterRegistration];
    }
    else {
    v15 = [(MessageListSearchSectionDataSource *)self serverFooterRegistration];
    }

    v13 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v15 forIndexPath:v10];
  }
  else if (_os_feature_enabled_impl() {
         && [v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  }
  {
    v12 = [(MessageListSectionDataSource *)self headerRegistration];
    v13 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v12 forIndexPath:v10];
  }
  else
  {
    v14 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218754;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_error_impl(&dword_1DDCDB000, v14, OS_LOG_TYPE_ERROR, "%p: unable to configure supplementary view for collectionView:%{public}@ of elementKind:%{public}@ at indexPath:%{public}@", (uint8_t *)&v17, 0x2Au);
    }

    v13 = 0;
  }

  return v13;
}

- (UICollectionViewSupplementaryRegistration)indexedFooterRegistration
{
  return self->_indexedFooterRegistration;
}

- (void)setIndexedFooterRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)serverFooterRegistration
{
  return self->_serverFooterRegistration;
}

- (void)setServerFooterRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverFooterRegistration, 0);
  objc_storeStrong((id *)&self->_indexedFooterRegistration, 0);
}

@end