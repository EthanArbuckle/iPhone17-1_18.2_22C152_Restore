@interface MessageListRecentSectionDataSource
- (BOOL)isLocalMailboxSearchScope;
- (BOOL)shouldHideFollowUp;
- (EFCancelable)hideFollowUpUserDefaultsObserver;
- (EFCancelable)localMailboxSearchScopeUserDefaultsObserver;
- (MessageListRecentSectionDataSource)initWithConfiguration:(id)a3;
- (MessageListRecentSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9 headerType:(unint64_t)a10;
- (NSDictionary)snippetHintsByGlobalMessageID;
- (id)_indexPathsForSelectedItems;
- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6;
- (id)sectionForCollection:(id)a3;
- (uint64_t)_isExpandedItemID:(void *)a1;
- (uint64_t)_needsFlushSeparatorForItemID:(void *)a3 snapshot:(char)a4 useSplitViewStyling:;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5;
- (void)cellRegistration;
- (void)collection:(id)a3 shouldHighlightSnippetHints:(id)a4;
- (void)setHideFollowUp:(BOOL)a3;
- (void)setHideFollowUpUserDefaultsObserver:(id)a3;
- (void)setLocalMailboxSearchScope:(BOOL)a3;
- (void)setLocalMailboxSearchScopeUserDefaultsObserver:(id)a3;
- (void)setSnippetHintsByGlobalMessageID:(id)a3;
@end

@implementation MessageListRecentSectionDataSource

- (id)sectionForCollection:(id)a3
{
  if (EMBlackPearlIsFeatureEnabled())
  {
    v4 = [(MessageListSectionDataSource *)self section];
    if ([v4 isEqualToString:@"MessageListSectionRecentUnseen"]) {
      v5 = @"MessageListSectionRecentUnseen";
    }
    else {
      v5 = 0;
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = -[MessageListRecentSectionDataSource cellRegistration](self);
  v13 = [v11 dequeueConfiguredReusableCellWithRegistration:v12 forIndexPath:v10 item:v9];

  return v13;
}

- (void)cellRegistration
{
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[28];
    if (!v2)
    {
      v3 = [a1 delegate];
      v4 = [v3 sectionListCellClassForMessageListSectionDataSource:v1];

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v1);
      v5 = (void *)MEMORY[0x1E4FB1578];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__MessageListRecentSectionDataSource_cellRegistration__block_invoke;
      v9[3] = &unk_1E6D11CC0;
      objc_copyWeak(&v10, &location);
      uint64_t v6 = [v5 registrationWithCellClass:v4 configurationHandler:v9];
      v7 = (void *)v1[28];
      v1[28] = v6;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);

      v2 = (void *)v1[28];
    }
    a1 = v2;
  }
  return a1;
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 88));
    if (v7)
    {
      unsigned int v27 = a3;
      v8 = [v5 itemID];
      [v7 setItemID:v8];

      id v9 = [MEMORY[0x1E4F60D70] futureWithResult:v5];
      [v7 setMessageListItemFuture:v9];

      if ([*(id *)(a1 + 40) isOutgoingMailbox]) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = [*(id *)(a1 + 40) containsFollowUpMailbox];
      }
      [*(id *)(a1 + 32) setOutgoingMailbox:v10];
      objc_msgSend(*(id *)(a1 + 32), "setInbox:", objc_msgSend(*(id *)(a1 + 40), "containsInbox"));
      objc_msgSend(*(id *)(a1 + 32), "setCanShowReadLaterDate:", objc_msgSend(*(id *)(a1 + 40), "canShowReadLaterDate"));
      objc_msgSend(*(id *)(a1 + 32), "setSearchResult:", objc_msgSend(*(id *)(a1 + 40), "isSearch"));
      objc_msgSend(*(id *)(a1 + 32), "setNumberOfPreviewLines:", objc_msgSend(WeakRetained, "numberOfPreviewLines"));
      id v11 = [WeakRetained collectionView];
      objc_msgSend(*(id *)(a1 + 32), "setVisible:", objc_msgSend(v11, "mui_isIndexPathVisible:", *(void *)(a1 + 48)));

      v12 = [WeakRetained threadHelper];
      v25 = v12;
      if (v12)
      {
        uint64_t v13 = objc_msgSend(v12, "styleForMessageListItem:", v5, v12);
        if (v13 == 1)
        {
          [v7 setDisclosureDelegate:WeakRetained];
          v14 = [WeakRetained messageList];
          v15 = [v14 expandedThreadItemIDs];
          int v16 = [v15 containsObject:*(void *)(a1 + 56)];

          uint64_t v13 = 1;
          if (v16) {
            [*(id *)(a1 + 32) setDisclosureEnabled:1];
          }
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      uint64_t v17 = objc_msgSend(*(id *)(a1 + 64), "selectedBucketForMessageListRecentSectionDataSource:", WeakRetained, v25);
      v18 = [v5 category];
      [*(id *)(a1 + 32) setCategory:v18];

      [*(id *)(a1 + 32) setShouldShowHighImpact:v17 == 1];
      v19 = [v5 displayMessageObjectID];
      v20 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v19, "globalMessageID"));
      v21 = [WeakRetained snippetHintsByGlobalMessageID];
      v22 = [v21 objectForKeyedSubscript:v20];
      v23 = (void *)[v22 copy];

      v24 = [WeakRetained log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2_cold_1((uint64_t)v23, (uint64_t)v20, v24);
      }

      [*(id *)(a1 + 32) setMessageListItem:v5 style:v13 hintsBySnippetZone:v23];
      objc_msgSend(*(id *)(a1 + 32), "setShouldDisplayUnreadAndVIP:", objc_msgSend(*(id *)(a1 + 40), "shouldDisplayUnreadAndVIP"));
      [*(id *)(a1 + 32) setShouldAnnotateReplyOrForward:0];
      objc_msgSend(*(id *)(a1 + 32), "setShowsAccessory:showingDetail:", objc_msgSend(*(id *)(a1 + 40), "isOutgoingMailbox") ^ 1, objc_msgSend(*(id *)(a1 + 64), "messageListRecentSectionDataSourceIsInExpandedEnvironment:", WeakRetained));
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      [*(id *)(a1 + 64) messageListSectionDataSource:WeakRetained didConfigureCell:v7 atIndexPath:*(void *)(a1 + 48) item:v5 itemWasCached:v27 duration:CACurrentMediaTime() - *(double *)(a1 + 96)];
    }
  }
}

- (NSDictionary)snippetHintsByGlobalMessageID
{
  return self->_snippetHintsByGlobalMessageID;
}

- (uint64_t)_needsFlushSeparatorForItemID:(void *)a3 snapshot:(char)a4 useSplitViewStyling:
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = 0;
  if (a1 && (a4 & 1) == 0)
  {
    uint64_t v10 = [a1 threadHelper];
    uint64_t v9 = [v10 needsFlushSeparatorForItemID:v7 snapshot:v8];
  }
  return v9;
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id val = a3;
  id v39 = a4;
  id v8 = a5;
  CFTimeInterval v9 = CACurrentMediaTime();
  uint64_t v10 = [(MessageListSectionDataSource *)self state];
  id v11 = [val cellHelper];
  v12 = [(MessageListSectionDataSource *)self layoutValuesHelper];
  uint64_t v13 = [v11 cellView];
  [v13 setLayoutValuesHelper:v12];

  objc_msgSend(v11, "setCompact:", objc_msgSend(v10, "isCompact"));
  objc_msgSend(v11, "setExpanded:", -[MessageListRecentSectionDataSource _isExpandedItemID:](self, v8));
  objc_msgSend(v11, "setHideFollowUp:", -[MessageListRecentSectionDataSource shouldHideFollowUp](self, "shouldHideFollowUp"));
  objc_msgSend(v11, "setLocalMailboxSearchScope:", -[MessageListRecentSectionDataSource isLocalMailboxSearchScope](self, "isLocalMailboxSearchScope"));
  v14 = [(MessageListSectionDataSource *)self state];
  LODWORD(v13) = [v14 isSearch];

  if (v13)
  {
    [v11 setSenderSpecificCell:0];
  }
  else
  {
    v15 = [(MessageListSectionDataSource *)self state];
    objc_msgSend(v11, "setSenderSpecificCell:", objc_msgSend(v15, "isSenderSpecificMailbox"));
  }
  int v16 = [(MessageListSectionDataSource *)self contactStore];
  [v11 setContactStore:v16];

  uint64_t v17 = [(MessageListSectionDataSource *)self brandIndicatorProvider];
  [v11 setBrandIndicatorProvider:v17];

  v41 = [(MessageListSectionDataSource *)self messageList];
  v40 = [(MessageListSectionDataSource *)self itemHelper];
  v18 = [(MessageListSectionDataSource *)self provider];
  v42 = [v18 snapshotForMessageListSectionDataSource:self];

  v19 = [(MessageListSectionDataSource *)self messageList];
  uint64_t v20 = objc_msgSend(v40, "cellGroupingForItemID:snapshot:isThreaded:", v8, v42, objc_msgSend(v19, "isThreaded"));

  [val setBackgroundViewConfigurationGrouping:v20];
  if (([v10 useSplitViewStyling] & 1) == 0) {
    objc_msgSend(val, "setNeedsFlushSeparator:", -[MessageListRecentSectionDataSource _needsFlushSeparatorForItemID:snapshot:useSplitViewStyling:](self, v8, v42, objc_msgSend(v10, "useSplitViewStyling")));
  }
  v21 = [val messageListItemFuture];

  if (v21)
  {
    v22 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [val messageListItemFuture];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v23;
      _os_log_impl(&dword_1DDCDB000, v22, OS_LOG_TYPE_DEFAULT, "Canceling messageListItemFuture to prepare for re-use: %@", buf, 0xCu);
    }
    v24 = [val messageListItemFuture];
    [v24 cancel];

    [val setMessageListItemFuture:0];
  }
  v25 = [(MessageListSectionDataSource *)self delegate];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke;
  aBlock[3] = &unk_1E6D11CE8;
  objc_copyWeak(&v62, (id *)buf);
  objc_copyWeak(&v63, &location);
  id v26 = v10;
  id v60 = v26;
  id v27 = v8;
  id v61 = v27;
  v28 = _Block_copy(aBlock);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2;
  v50[3] = &unk_1E6D11D10;
  objc_copyWeak(&v57, (id *)buf);
  objc_copyWeak(v58, &location);
  id v29 = v11;
  id v51 = v29;
  id v30 = v26;
  id v52 = v30;
  id v31 = v39;
  id v53 = v31;
  id v32 = v27;
  id v54 = v32;
  id v33 = v25;
  id v55 = v33;
  v34 = v28;
  id v56 = v34;
  v58[1] = *(id *)&v9;
  v35 = (void (**)(void *, void *, uint64_t))_Block_copy(v50);
  v36 = [v41 messageListItemForItemID:v32];
  v37 = [v36 resultIfAvailable];

  if (v37)
  {
    v35[2](v35, v37, 1);
  }
  else
  {
    v34[2](v34);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_10;
    v44[3] = &unk_1E6D11D38;
    v49 = v35;
    v44[4] = self;
    id v45 = v32;
    id v46 = v31;
    id v47 = v41;
    id v48 = v33;
    id v38 = [(MessageListSectionDataSource *)self messageListItemForItemID:v45 indexPath:v46 receiver:val completion:v44];
  }
  objc_destroyWeak(v58);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (BOOL)isLocalMailboxSearchScope
{
  return self->_localMailboxSearchScope;
}

- (uint64_t)_isExpandedItemID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1 messageList];
    if ([v4 isThreaded]) {
      uint64_t v5 = [v4 anyExpandedThreadContainsItemID:v3];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 56));
    if (v3)
    {
      objc_msgSend(v3, "setEditing:animated:", objc_msgSend(*(id *)(a1 + 32), "isEditing"), 0);
      v4 = [v10 selectionModelProvider];
      uint64_t v5 = [v4 selectionModelForMessageListSectionDataSource:v10];

      if (([v5 isMultipleSelectionActive] & 1) == 0 && v5)
      {
        [v5 configureSelectionForItemID:*(void *)(a1 + 40)];
        uint64_t v6 = [v10 provider];
        id v7 = [v6 messageListSectionDataSource:v10 indexPathForItemIdentifier:*(void *)(a1 + 40)];

        if (v7)
        {
          id v8 = [v10 _indexPathsForSelectedItems];
          int v9 = [v8 containsObject:v7];
        }
        else
        {
          int v9 = 0;
        }
        objc_msgSend(v3, "setSelected:", objc_msgSend(v5, "isSelectedItemID:", *(void *)(a1 + 40)) | v9);
        [v3 setNeedsUpdateConfiguration];
      }
    }

    id WeakRetained = v10;
  }
}

void __54__MessageListRecentSectionDataSource_cellRegistration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _configureCell:v9 atIndexPath:v8 itemID:v7];
}

- (void)collection:(id)a3 shouldHighlightSnippetHints:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = _os_feature_enabled_impl();
  if (v5 && v6)
  {
    id v7 = [(MessageListSectionDataSource *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 count];
      id v9 = (void *)MEMORY[0x1E4F60E00];
      id v10 = [v5 allValues];
      id v11 = [v10 firstObject];
      v12 = [v9 partiallyRedactedDictionary:v11];
      int v13 = 134218242;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      int v16 = v12;
      _os_log_impl(&dword_1DDCDB000, v7, OS_LOG_TYPE_DEFAULT, "[Snippet Hints] [Committed Search] Received (%ld) items: %@", (uint8_t *)&v13, 0x16u);
    }
    [(MessageListRecentSectionDataSource *)self setSnippetHintsByGlobalMessageID:v5];
  }
}

- (void)setSnippetHintsByGlobalMessageID:(id)a3
{
}

- (MessageListRecentSectionDataSource)initWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MessageListRecentSectionDataSource;
  id v3 = [(MessageListSectionDataSource *)&v6 initWithConfiguration:a3];
  v4 = v3;
  if (v3)
  {
    -[MessageListRecentSectionDataSource cellRegistration](v3);
  }
  return v4;
}

- (MessageListRecentSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9 headerType:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v46.receiver = self;
  v46.super_class = (Class)MessageListRecentSectionDataSource;
  id v38 = v17;
  id v23 = v17;
  v24 = v18;
  v25 = v20;
  id v26 = [(MessageListSectionDataSource *)&v46 initWithIdentifier:v16 section:v23 collectionView:v24 messageList:v19 initialLoadCompletedPromise:v20 layoutValuesHelper:v21 state:v22 headerType:a10];
  if (v26)
  {
    id v37 = v16;
    id v27 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v28 = *MEMORY[0x1E4F600F0];
    -[MessageListRecentSectionDataSource setHideFollowUp:](v26, "setHideFollowUp:", [v27 BOOLForKey:*MEMORY[0x1E4F600F0]]);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v26);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __156__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke;
    v42[3] = &unk_1E6D11C98;
    objc_copyWeak(&v44, &location);
    id v29 = v27;
    id v43 = v29;
    uint64_t v30 = objc_msgSend(v29, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v28, 1, 1, v42);
    hideFollowUpUserDefaultsObserver = v26->_hideFollowUpUserDefaultsObserver;
    v26->_hideFollowUpUserDefaultsObserver = (EFCancelable *)v30;

    id v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    -[MessageListRecentSectionDataSource setLocalMailboxSearchScope:](v26, "setLocalMailboxSearchScope:", [v32 BOOLForKey:@"LocalMailboxSearchOnly"]);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __156__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke_2;
    v39[3] = &unk_1E6D11C98;
    objc_copyWeak(&v41, &location);
    id v33 = v32;
    id v40 = v33;
    uint64_t v34 = objc_msgSend(v33, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", @"LocalMailboxSearchOnly", 1, 1, v39);
    localMailboxSearchScopeUserDefaultsObserver = v26->_localMailboxSearchScopeUserDefaultsObserver;
    v26->_localMailboxSearchScopeUserDefaultsObserver = (EFCancelable *)v34;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);

    id v16 = v37;
  }

  return v26;
}

- (void)setLocalMailboxSearchScope:(BOOL)a3
{
  self->_localMailboxSearchScope = a3;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

void __156__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "setHideFollowUp:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E4F600F0]));
  }
}

void __156__MessageListRecentSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_headerType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "setLocalMailboxSearchScope:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", @"LocalMailboxSearchOnly"));
  }
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = v5;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    int v7 = objc_msgSend(v5, "ef_isCancelledError");
    uint64_t v8 = [*(id *)(a1 + 32) log];
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        id v11 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        v12 = objc_msgSend(v6, "ef_publicDescription");
        int v13 = 138543874;
        uint64_t v14 = v10;
        __int16 v15 = 2114;
        id v16 = v11;
        __int16 v17 = 2114;
        id v18 = v12;
        _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "Cancel messageListItem for itemID=%{public}@, indexPath=%{public}@, error=%{public}@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_10_cold_1(a1, v6, v9);
      }

      [*(id *)(a1 + 64) messageListSectionDataSource:*(void *)(a1 + 32) didFailToConfigureCellAtIndexPath:*(void *)(a1 + 48) error:v6];
    }
  }
}

- (id)_indexPathsForSelectedItems
{
  v2 = [(MessageListSectionDataSource *)self collectionView];
  id v3 = [v2 indexPathsForSelectedItems];

  return v3;
}

- (EFCancelable)hideFollowUpUserDefaultsObserver
{
  return self->_hideFollowUpUserDefaultsObserver;
}

- (void)setHideFollowUpUserDefaultsObserver:(id)a3
{
}

- (EFCancelable)localMailboxSearchScopeUserDefaultsObserver
{
  return self->_localMailboxSearchScopeUserDefaultsObserver;
}

- (void)setLocalMailboxSearchScopeUserDefaultsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMailboxSearchScopeUserDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_hideFollowUpUserDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_snippetHintsByGlobalMessageID, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F60E00] partiallyRedactedDictionary:a1];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_DEBUG, "Found hints: %@, for id: %@", (uint8_t *)&v6, 0x16u);
}

void __72__MessageListRecentSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_10_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = objc_msgSend(a2, "ef_publicDescription");
  int v10 = 138544130;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  int v13 = v7;
  __int16 v14 = 2048;
  uint64_t v15 = v8;
  __int16 v16 = 2112;
  __int16 v17 = v9;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "Failed to obtain messageListItem for itemID:%{public}@ at indexPath:%{public}@ in messageList:%p with error:%@", (uint8_t *)&v10, 0x2Au);
}

@end