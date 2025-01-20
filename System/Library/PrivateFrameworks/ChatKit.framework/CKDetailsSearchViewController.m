@interface CKDetailsSearchViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)searchComplete;
- (BOOL)shouldInsetResultsForSearchController:(id)a3;
- (BOOL)wantsSpaceKeyCommandActive;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKConversation)conversation;
- (CKDetailsSearchControllerDelegate)detailsDelegate;
- (CKDetailsSearchResultsFooterCell)footerSizingCell;
- (CKDetailsSearchResultsTitleHeaderCell)titleSizingCell;
- (CKDetailsSearchViewController)initWithSearchControllerClasses:(id)a3;
- (CKQLPreviewController)previewController;
- (CKQLPreviewControllerDataSource)qlPreviewDataSource;
- (CKSearchController)associatedDetailsSubsectionSearchController;
- (CKSearchIndexingFooterCell)sizingIndexingFooterCell;
- (Class)_searchResultsHeaderClass;
- (NSArray)chatGUIDs;
- (NSDate)lastUserSelectedCellTime;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)deleteButton;
- (UIBarButtonItem)flexibleItem;
- (UIBarButtonItem)saveButton;
- (UIBarButtonItem)selectButton;
- (UICollectionViewCell)lastUserSelectedCell;
- (UIEdgeInsets)parentMarginInsetsForSearchController:(id)a3;
- (id)_newSnapshotForCurrentControllerState;
- (id)_searchControllerForIndexPath:(id)a3;
- (id)_selectedIndexPaths;
- (id)footerBoundryItemsForController:(id)a3 withEnvironment:(id)a4;
- (id)globalLayoutConfiguration;
- (id)headerBoundryItemsForController:(id)a3 withEnvironment:(id)a4;
- (id)layoutSectionForController:(id)a3 withEnvironment:(id)a4;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (id)searchBarForSearchViewController:(id)a3;
- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4;
- (id)searchControllerChatGUIDsForDetailsSearch:(id)a3;
- (id)sizeAttributeForController:(id)a3 sizingAttribute:(id)a4;
- (void)_cancelEditing:(id)a3;
- (void)_configureIndexingCell:(id)a3;
- (void)_deleteAttachmentsAtIndexPaths:(id)a3;
- (void)_deleteSelectedAttachments:(id)a3;
- (void)_presentResult:(id)a3 withFullScreenViewController:(id)a4;
- (void)_registerCells;
- (void)_saveSelectedAttachments:(id)a3;
- (void)_selectButtonTapped:(id)a3;
- (void)_updateToolbar;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)deleteChatItemWithTransferGUID:(id)a3 fromMessageItem:(id)a4;
- (void)deleteMessageItem:(id)a3;
- (void)deleteTransferGUID:(id)a3;
- (void)handleSpacePressed;
- (void)loadView;
- (void)presentQuickLookView:(id)a3;
- (void)rekickZKWSearchForAttachmentBatchUpdate;
- (void)reloadData;
- (void)searchController:(id)a3 requestsItemDeletionAtIndexPath:(id)a4;
- (void)searchControllerContentsDidChange:(id)a3;
- (void)searchDetailsFooterCellShowAllTapped:(id)a3;
- (void)searchDetailsShowAllButtonTapped:(id)a3;
- (void)searchEnded;
- (void)searchResultsTitleCellShowAllButtonTapped:(id)a3;
- (void)searchViewController:(id)a3 requestsPushOfSearchController:(id)a4;
- (void)searchWithText:(id)a3;
- (void)setAssociatedDetailsSubsectionSearchController:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setChatGUIDs:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDetailsDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFlexibleItem:(id)a3;
- (void)setFooterSizingCell:(id)a3;
- (void)setLastUserSelectedCell:(id)a3;
- (void)setLastUserSelectedCellTime:(id)a3;
- (void)setPreviewController:(id)a3;
- (void)setQlPreviewDataSource:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setSearchComplete:(BOOL)a3;
- (void)setSelectButton:(id)a3;
- (void)setSizingIndexingFooterCell:(id)a3;
- (void)setTitleSizingCell:(id)a3;
- (void)setupDetailsSearchController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKDetailsSearchViewController

- (CKDetailsSearchViewController)initWithSearchControllerClasses:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKDetailsSearchViewController;
  v3 = [(CKSearchViewController *)&v6 initWithSearchControllerClasses:a3];
  v4 = v3;
  if (v3) {
    [(CKSearchViewController *)v3 setDelegate:v3];
  }
  return v4;
}

- (void)loadView
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(CKDetailsSearchViewController *)self conversation];
  int v4 = [v3 isGroupConversation];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [(CKSearchViewController *)self searchControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4 ^ 1u;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) setSuppressAvatars:v8];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }

  v30.receiver = self;
  v30.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v30 loadView];
  if (CKIsRunningInMacCatalyst())
  {
    v11 = [(CKSearchViewController *)self collectionView];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      v13 = [(CKSearchViewController *)self collectionView];
      [v13 _setShouldDeriveVisibleBoundsFromContainingScrollView:1];
    }
  }
  unint64_t v14 = [(CKSearchViewController *)self mode];
  BOOL v15 = v14 != 4;
  BOOL v16 = v14 == 4;
  v17 = [(CKSearchViewController *)self collectionView];
  [v17 setScrollEnabled:v16];

  v18 = [(CKSearchViewController *)self collectionView];
  [v18 setShowsVerticalScrollIndicator:CKIsRunningInMacCatalyst() == 0];

  v19 = [(CKSearchViewController *)self collectionView];
  [v19 setLockContentOffset:v15];

  unint64_t v20 = [(CKSearchViewController *)self mode];
  v21 = [(CKSearchViewController *)self collectionView];
  v22 = +[CKUIBehavior sharedBehaviors];
  v23 = [v22 theme];
  v24 = v23;
  if (v20 == 4) {
    [v23 spotlightSearchBackgroundColor];
  }
  else {
  v25 = [v23 detailsCollectionViewBackgroundColor];
  }
  [v21 setBackgroundColor:v25];

  v26 = [(CKSearchViewController *)self collectionView];
  [v26 setContentInsetAdjustmentBehavior:2];

  v27 = [(CKSearchViewController *)self collectionView];
  [v27 setAllowsMultipleSelection:1];

  v28 = [(CKSearchViewController *)self collectionView];
  v29 = [v28 collectionViewLayout];
  [v29 registerClass:objc_opt_class() forDecorationViewOfKind:@"backgroundDecorationView"];
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v16 viewDidLayoutSubviews];
  BOOL v3 = [(CKSearchViewController *)self mode] == 4;
  int v4 = [(CKSearchViewController *)self collectionView];
  [v4 setScrollEnabled:v3];

  v5 = [(CKSearchViewController *)self collectionView];
  [v5 adjustedContentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  char v12 = [(CKDetailsSearchViewController *)self navigationController];
  v13 = [v12 navigationBar];
  [v13 bounds];
  double MaxY = CGRectGetMaxY(v17);

  BOOL v15 = [(CKSearchViewController *)self collectionView];
  objc_msgSend(v15, "setContentInset:", MaxY, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v10 viewWillAppear:a3];
  if ([(CKSearchViewController *)self mode] == 4)
  {
    int v4 = [(CKDetailsSearchViewController *)self selectButton];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F427C0]);
      double v6 = CKFrameworkBundle();
      double v7 = [v6 localizedStringForKey:@"SELECT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__selectButtonTapped_];

      double v9 = [(CKDetailsSearchViewController *)self navigationItem];
      [v9 setRightBarButtonItem:v8];

      [(CKDetailsSearchViewController *)self setSelectButton:v8];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsSearchViewController;
  [(CKViewController *)&v4 viewWillDisappear:a3];
  if ([(CKSearchViewController *)self mode] == 4) {
    [(CKDetailsSearchViewController *)self setEditing:0];
  }
}

- (void)rekickZKWSearchForAttachmentBatchUpdate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CKSpotlightQueryUtilities detailsSearchControllers];
  objc_super v4 = [(CKSearchViewController *)self searchControllers];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v3 count];

  if (v5 != v6)
  {
    double v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_alloc_init(*(Class *)(*((void *)&v15 + 1) + 8 * v12));
          unint64_t v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "setDelegate:", self, (void)v15);
            [v7 addObject:v14];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(CKSearchViewController *)self setSearchControllers:v7];
  }
  [(CKSearchViewController *)self _searchImmediately];
}

- (void)reloadData
{
  v4.receiver = self;
  v4.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v4 reloadData];
  BOOL v3 = [(CKDetailsSearchViewController *)self detailsDelegate];
  [v3 detailsSearchControllerContentDidChange:self];
}

- (void)handleSpacePressed
{
  BOOL v3 = [(CKSearchViewController *)self collectionView];
  objc_super v4 = [v3 indexPathsForSelectedItems];
  id v5 = [v4 firstObject];

  [(CKDetailsSearchViewController *)self presentQuickLookView:v5];
}

- (void)presentQuickLookView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v21 = v4;
    uint64_t v5 = [v4 section];
    uint64_t v6 = [(CKSearchViewController *)self searchControllers];
    double v7 = [v6 objectAtIndex:v5];

    id v8 = [v7 results];
    uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v21, "row"));

    if ([(id)objc_opt_class() supportsQuicklookForResult:v9])
    {
      uint64_t v10 = objc_alloc_init(CKQLPreviewControllerDataSource);
      [(CKDetailsSearchViewController *)self setQlPreviewDataSource:v10];

      uint64_t v11 = [(CKDetailsSearchViewController *)self previewController];
      uint64_t v12 = [(CKDetailsSearchViewController *)self qlPreviewDataSource];
      [v11 setDataSource:v12];

      id v13 = [(CKDetailsSearchViewController *)self previewController];
      [v13 setDelegate:self];

      unint64_t v14 = [(CKDetailsSearchViewController *)self qlPreviewDataSource];
      long long v15 = [v7 results];
      [v14 setPreviewItems:v15];

      long long v16 = [(CKDetailsSearchViewController *)self previewController];
      [v16 reloadData];

      long long v17 = [(CKDetailsSearchViewController *)self previewController];
      objc_msgSend(v17, "setCurrentPreviewItemIndex:", objc_msgSend(v21, "row"));

      long long v18 = [(CKDetailsSearchViewController *)self previewController];
      [v18 refreshCurrentPreviewItem];

      if (CKIsRunningInMacCatalyst())
      {
        v19 = [(CKDetailsSearchViewController *)self previewController];
        [v19 presentPreview];
      }
      else
      {
        v19 = [(CKDetailsSearchViewController *)self navigationController];
        uint64_t v20 = [(CKDetailsSearchViewController *)self previewController];
        [v19 pushViewController:v20 animated:1];
      }
    }

    id v4 = v21;
  }
}

- (BOOL)wantsSpaceKeyCommandActive
{
  BOOL v3 = [(CKSearchViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 firstObject];

  if (v5)
  {
    uint64_t v6 = [v5 section];
    double v7 = [(CKSearchViewController *)self searchControllers];
    id v8 = [v7 objectAtIndex:v6];

    uint64_t v9 = [v8 results];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "row"));

    char v11 = [(id)objc_opt_class() supportsQuicklookForResult:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "QuickLook did request preview view for transition to item of class %@", (uint8_t *)&buf, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    long long v34 = __Block_byref_object_copy__71;
    v35 = __Block_byref_object_dispose__71;
    id v36 = 0;
    uint64_t v12 = [(CKSearchViewController *)self searchControllers];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __80__CKDetailsSearchViewController_previewController_transitionViewForPreviewItem___block_invoke;
    v25 = &unk_1E562BE90;
    id v13 = v11;
    id v26 = v13;
    p_long long buf = &buf;
    [v12 enumerateObjectsUsingBlock:&v22];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      unint64_t v14 = [(CKSearchViewController *)self collectionView];
      long long v15 = [v14 cellForItemAtIndexPath:*(void *)(*((void *)&buf + 1) + 40)];
    }
    else
    {
      long long v15 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v28 = 138412546;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        long long v31 = v15;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "> For an item at indexPath {%@}, we are returning preview view {%@}.", v28, 0x16u);
      }
    }
    uint64_t v20 = v26;
    id v17 = v15;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "> Item is not of type CKSpotlightQueryResult. Returning nil.", (uint8_t *)&buf, 2u);
      }
    }
    id v17 = 0;
  }

  return v17;
}

void __80__CKDetailsSearchViewController_previewController_transitionViewForPreviewItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = [a2 results];
  uint64_t v7 = [v11 indexOfObject:*(void *)(a1 + 32)];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:a3];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v42 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Did select item at index path %@", buf, 0xCu);
    }
  }
  unint64_t v9 = [v7 section];
  uint64_t v10 = [(CKSearchViewController *)self searchControllers];
  BOOL v11 = v9 < [v10 count];

  if (v11)
  {
    uint64_t v12 = [v6 cellForItemAtIndexPath:v7];
    id v13 = [(CKSearchViewController *)self collectionView];
    int v14 = objc_msgSend(v13, "_ck_isEditing");

    if (v14)
    {
      [(CKDetailsSearchViewController *)self _updateToolbar];
LABEL_35:

      goto LABEL_36;
    }
    long long v15 = [(CKSearchViewController *)self searchControllers];
    long long v16 = [v15 objectAtIndex:v9];

    id v17 = [v16 results];
    long long v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row"));

    if (!CKIsRunningInMacCatalyst()
      || ![(id)objc_opt_class() supportsMacSelection])
    {
      unint64_t v31 = [v7 row];
      long long v32 = [v16 results];
      LODWORD(v31) = v31 < [v32 count];

      if (v31)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v33 = [v12 linkMetadata];
          [v18 setLinkMetadata:v33];
        }
        if (([v16 handleSelectionForResult:v18] & 1) == 0
          && [(id)objc_opt_class() supportsMenuInteraction])
        {
          long long v34 = [v16 previewViewControllerForResult:v18];
          if (v34)
          {
            if ([(id)objc_opt_class() previewControllerPresentsModally]) {
              [(CKDetailsSearchViewController *)self presentViewController:v34 animated:1 completion:0];
            }
            else {
              [(CKDetailsSearchViewController *)self _presentResult:v18 withFullScreenViewController:v34];
            }
          }
        }
      }
      goto LABEL_34;
    }
    uint64_t v19 = [(CKDetailsSearchViewController *)self lastUserSelectedCellTime];
    if (!v19) {
      goto LABEL_33;
    }
    uint64_t v20 = [(CKDetailsSearchViewController *)self lastUserSelectedCell];
    int v21 = [v12 isEqual:v20];

    if (!v21
      || ([(CKDetailsSearchViewController *)self lastUserSelectedCellTime],
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          [v22 timeIntervalSinceNow],
          double v24 = v23,
          v22,
          fabs(v24) >= cellDoubleClickInterval()))
    {
LABEL_33:
      v38 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v39);
      [(CKDetailsSearchViewController *)self setLastUserSelectedCellTime:v38];

      [(CKDetailsSearchViewController *)self setLastUserSelectedCell:v12];
LABEL_34:

      goto LABEL_35;
    }
    v25 = [v18 item];
    id v26 = [v25 attributeSet];

    v40 = [v26 messageType];
    if ([v40 isEqualToString:@"lnk"])
    {
      v27 = [v18 item];
      v28 = [v27 attributeSet];
      uint64_t v29 = [v28 URL];

      if (v29)
      {
        __int16 v30 = [MEMORY[0x1E4F42738] sharedApplication];
        [v30 openURL:v29 withCompletionHandler:0];
LABEL_31:
      }
    }
    else
    {
      uint64_t v29 = [v26 contentURL];
      if (v29)
      {
        v35 = [(CKSearchViewController *)self searchControllers];
        __int16 v30 = objc_msgSend(v35, "objectAtIndex:", objc_msgSend(v7, "section"));

        id v36 = [v30 results];
        v39 = objc_msgSend(v36, "objectAtIndex:", objc_msgSend(v7, "row"));

        if ([(id)objc_opt_class() supportsQuicklookForResult:v39])
        {
          [(CKDetailsSearchViewController *)self presentQuickLookView:v7];
        }
        else
        {
          uint64_t v37 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          [v37 openURL:v29 configuration:0 completionHandler:0];
        }
        goto LABEL_31;
      }
    }

    goto LABEL_33;
  }
LABEL_36:
}

- (void)_presentResult:(id)a3 withFullScreenViewController:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setDelegate:self];
    [v5 setModalPresentationStyle:0];
    [(CKDetailsSearchViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (id)layoutSectionForController:(id)a3 withEnvironment:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)CKDetailsSearchViewController;
  id v5 = [(CKSearchViewController *)&v29 layoutSectionForController:a3 withEnvironment:a4];
  id v6 = [MEMORY[0x1E4F42600] backgroundDecorationItemWithElementKind:@"backgroundDecorationView"];
  if ([(CKSearchViewController *)self mode] != 4)
  {
    v30[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v5 setDecorationItems:v7];
  }
  if ([(CKSearchViewController *)self mode] == 4
    && ([(CKSearchViewController *)self searchControllers],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    uint64_t v10 = [(CKSearchViewController *)self searchControllers];
    BOOL v11 = [v10 firstObject];

    [v11 additionalGroupInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    if ([v11 applyLayoutMarginsToLayoutGroup])
    {
      uint64_t v20 = [(CKSearchViewController *)self collectionView];
      [v20 marginInsets];
      double v15 = v15 + v21;

      uint64_t v22 = [(CKSearchViewController *)self collectionView];
      [v22 marginInsets];
      double v19 = v19 + v23;
    }
  }
  else
  {
    BOOL v11 = +[CKUIBehavior sharedBehaviors];
    [v11 searchDetailsResultsInsets];
    double v13 = v24;
    double v15 = v25;
    double v17 = v26;
    double v19 = v27;
  }

  objc_msgSend(v5, "setContentInsets:", v13, v15, v17, v19);

  return v5;
}

- (UIEdgeInsets)parentMarginInsetsForSearchController:(id)a3
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  [v3 searchDetailsSectionMarginInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  double v5 = [(CKSearchViewController *)self collectionView];
  int v6 = objc_msgSend(v5, "_ck_isEditing");

  if (v6)
  {
    [(CKDetailsSearchViewController *)self _updateToolbar];
  }
}

- (void)searchWithText:(id)a3
{
  id v4 = a3;
  [(CKDetailsSearchViewController *)self setSearchComplete:0];
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v5 searchWithText:v4];
}

- (void)searchEnded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Search ended", buf, 2u);
    }
  }
  [(CKSearchViewController *)self setSearchInProgress:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(CKSearchViewController *)self searchControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 cancelCurrentSearch];
        [v8 searchEnded];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)searchControllerContentsDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_reloadData object:0];
  uint64_t v5 = [(CKSearchViewController *)self searchCompleteControllerSet];
  [v5 addObject:objc_opt_class()];

  uint64_t v6 = [(CKSearchViewController *)self searchCompleteControllerSet];
  unint64_t v7 = [v6 count];

  double v8 = [(CKSearchViewController *)self searchControllers];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    [(CKDetailsSearchViewController *)self setSearchComplete:1];
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v16 = [(CKSearchViewController *)self searchCompleteControllerSet];
        uint64_t v17 = [v16 count];
        id v18 = (id)objc_opt_class();
        double v19 = [(CKSearchViewController *)self searchControllers];
        int v23 = 134218498;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        id v26 = v18;
        __int16 v27 = 2048;
        uint64_t v28 = [v19 count];
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, updating now", (uint8_t *)&v23, 0x20u);
      }
    }
    uint64_t v20 = [(CKSearchViewController *)self collectionViewLayout];
    double v21 = [(CKDetailsSearchViewController *)self globalLayoutConfiguration];
    uint64_t v22 = (void *)[v21 copy];
    [v20 setConfiguration:v22];

    [(CKDetailsSearchViewController *)self reloadData];
  }
  else if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = [(CKSearchViewController *)self searchCompleteControllerSet];
      uint64_t v12 = [v11 count];
      id v13 = (id)objc_opt_class();
      double v14 = [(CKSearchViewController *)self searchControllers];
      int v23 = 134218498;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = [v14 count];
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%lu (%@) of %lu controllers checked in, not updating", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)_registerCells
{
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v11 _registerCells];
  BOOL v3 = [(CKSearchViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[CKDetailsSearchResultsTitleHeaderCell supplementaryViewType];
  uint64_t v6 = +[CKDetailsSearchResultsTitleHeaderCell reuseIdentifier];
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v6];

  unint64_t v7 = [(CKSearchViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
  long long v10 = +[CKDetailsSearchResultsFooterCell reuseIdentifier];
  [v7 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v10];
}

- (id)_newSnapshotForCurrentControllerState
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(CKSearchViewController *)self mode] == 4)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = [(CKSearchViewController *)self searchControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [(id)objc_opt_class() sectionIdentifier];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v7);
    }
  }
  else
  {
    objc_super v11 = [(CKSearchViewController *)self searchControllers];
    uint64_t v5 = (void *)[v11 mutableCopy];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [(CKSearchViewController *)self searchControllers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v17 hasMoreResults])
          {
            id v18 = [(id)objc_opt_class() sectionIdentifier];
            [v4 addObject:v18];
          }
          else
          {
            [v5 removeObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v14);
    }

    [(CKSearchViewController *)self setSearchControllers:v5];
  }

  [v3 appendSectionsWithIdentifiers:v4];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__CKDetailsSearchViewController__newSnapshotForCurrentControllerState__block_invoke;
  v23[3] = &unk_1E56286F0;
  v23[4] = self;
  id v19 = v3;
  id v24 = v19;
  [v4 enumerateObjectsUsingBlock:v23];
  uint64_t v20 = v24;
  id v21 = v19;

  return v21;
}

void __70__CKDetailsSearchViewController__newSnapshotForCurrentControllerState__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) searchControllers];
  unint64_t v7 = [v6 count];

  if (v7 >= a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "searchControllers", 0);
    id v10 = (id)[v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = [(id)objc_opt_class() sectionIdentifier];
          int v15 = [v14 isEqualToString:v5];

          if (v15)
          {
            id v10 = v13;
            goto LABEL_16;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    double v16 = [v10 results];
    if ([v16 count])
    {
      uint64_t v17 = [*(id *)(a1 + 32) _identifiersToAppendForResults:v16];
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v24 = v5;
          __int16 v25 = 2112;
          long long v26 = v17;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Section %@ appending %@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 40) appendItemsWithIdentifiers:v17 intoSectionWithIdentifier:v5];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKSearchController - Allocated search controllers and section counts do not match!!", buf, 2u);
    }
  }
}

- (id)sizeAttributeForController:(id)a3 sizingAttribute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 headerOverrideClass])
  {
    uint64_t v8 = objc_alloc_init(CKPhotosSearchResultsModeHeaderReusableView);
  }
  else
  {
    uint64_t v8 = [(CKDetailsSearchViewController *)self titleSizingCell];
  }
  unint64_t v9 = v8;
  id v10 = [(CKPhotosSearchResultsModeHeaderReusableView *)v8 preferredLayoutAttributesFittingAttributes:v7];

  if (CKIsRunningInMacCatalyst())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [CKPhotosSearchResultsTitleHeaderCell alloc];
      uint64_t v12 = -[CKPhotosSearchResultsTitleHeaderCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v13 = [(id)objc_opt_class() sectionTitle];
      [(CKPhotosSearchResultsTitleHeaderCell *)v12 setTitle:v13];

      uint64_t v14 = [(CKPhotosSearchResultsTitleHeaderCell *)v12 preferredLayoutAttributesFittingAttributes:v7];

      id v10 = (void *)v14;
    }
  }

  return v10;
}

- (id)headerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 wantsHeaderSection])
  {
    id v7 = [(CKDetailsSearchViewController *)self view];
    [v7 bounds];
    double Width = CGRectGetWidth(v21);

    unint64_t v9 = objc_opt_new();
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, Width, 1.79769313e308);
    id v10 = [(CKDetailsSearchViewController *)self sizeAttributeForController:v5 sizingAttribute:v9];
    [v10 frame];
    double Height = CGRectGetHeight(v22);
    uint64_t v12 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    uint64_t v13 = [MEMORY[0x1E4F42608] absoluteDimension:Height];
    uint64_t v14 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v12 heightDimension:v13];
    if ([v5 headerOverrideClass]) {
      int v15 = (objc_class *)[v5 headerOverrideClass];
    }
    else {
      int v15 = [(CKDetailsSearchViewController *)self _searchResultsHeaderClass];
    }
    double v16 = (void *)MEMORY[0x1E4F425F8];
    uint64_t v17 = [(objc_class *)v15 supplementaryViewType];
    id v18 = [v16 boundarySupplementaryItemWithLayoutSize:v14 elementKind:v17 alignment:1];

    [v6 addObject:v18];
  }

  return v6;
}

- (id)footerBoundryItemsForController:(id)a3 withEnvironment:(id)a4
{
  return 0;
}

- (id)globalLayoutConfiguration
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F42878] defaultConfiguration];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [(CKSearchViewController *)self searchControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v28 + 1) + 8 * i) hasMoreResults])
        {
          int v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v9 = 1;
LABEL_11:

  if ([(CKSearchViewController *)self _needsIndexing]) {
    BOOL v10 = [(CKDetailsSearchViewController *)self searchComplete];
  }
  else {
    BOOL v10 = 0;
  }
  unint64_t v11 = [(CKSearchViewController *)self mode];
  if (v11 == 4) {
    int v12 = 1;
  }
  else {
    int v12 = v9;
  }
  if (v10 && v12)
  {
    if (v11 == 4) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 1;
    }
    uint64_t v14 = [(CKDetailsSearchViewController *)self view];
    [v14 bounds];
    double Width = CGRectGetWidth(v36);

    double v16 = objc_opt_new();
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, 1.79769313e308);
    uint64_t v17 = [(CKDetailsSearchViewController *)self sizingIndexingFooterCell];
    id v18 = [v17 preferredLayoutAttributesFittingAttributes:v16];

    [v18 frame];
    double Height = CGRectGetHeight(v37);
    long long v20 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
    CGRect v21 = [MEMORY[0x1E4F42608] absoluteDimension:Height];
    CGRect v22 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v20 heightDimension:v21];
    int v23 = (void *)MEMORY[0x1E4F425F8];
    id v24 = +[CKSearchIndexingFooterCell supplementaryViewType];
    __int16 v25 = [v23 boundarySupplementaryItemWithLayoutSize:v22 elementKind:v24 alignment:v13];

    long long v32 = v25;
    long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v3 setBoundarySupplementaryItems:v26];
  }
  [v3 setInterSectionSpacing:16.0];

  return v3;
}

- (void)_configureIndexingCell:(id)a3
{
  id v10 = a3;
  [v10 setTitleLabelHidden:1];
  if ([(CKSearchViewController *)self _needsIndexing])
  {
    if ([(CKSearchViewController *)self mode] == 3)
    {
      id v4 = CKFrameworkBundle();
      [v4 localizedStringForKey:@"DETAILS_INDEXING_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      uint64_t v6 = [(CKSearchViewController *)self searchControllers];
      id v4 = [v6 firstObject];

      [(id)objc_opt_class() indexingString];
    uint64_t v5 = };
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v10 setSubtitleString:v5];
  if ([(CKSearchViewController *)self mode] != 4)
  {
    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    uint64_t v8 = [v7 theme];
    int v9 = [v8 spotlightSearchBackgroundColor];
    [v10 setBackgroundColor:v9];
  }
}

- (CKDetailsSearchResultsTitleHeaderCell)titleSizingCell
{
  titleSizingCell = self->_titleSizingCell;
  if (!titleSizingCell)
  {
    id v4 = [CKDetailsSearchResultsTitleHeaderCell alloc];
    uint64_t v5 = -[CKDetailsSearchResultsTitleHeaderCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_titleSizingCell;
    self->_titleSizingCell = v5;

    titleSizingCell = self->_titleSizingCell;
  }

  return titleSizingCell;
}

- (CKDetailsSearchResultsFooterCell)footerSizingCell
{
  footerSizingCell = self->_footerSizingCell;
  if (!footerSizingCell)
  {
    id v4 = [CKDetailsSearchResultsFooterCell alloc];
    uint64_t v5 = -[CKDetailsSearchResultsFooterCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_footerSizingCell;
    self->_footerSizingCell = v5;

    [(CKDetailsSearchResultsFooterCell *)self->_footerSizingCell setTitle:@"Test"];
    footerSizingCell = self->_footerSizingCell;
  }

  return footerSizingCell;
}

- (CKSearchIndexingFooterCell)sizingIndexingFooterCell
{
  sizingIndexingFooterCell = self->_sizingIndexingFooterCell;
  if (!sizingIndexingFooterCell)
  {
    id v4 = [CKSearchIndexingFooterCell alloc];
    uint64_t v5 = -[CKSearchIndexingFooterCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_sizingIndexingFooterCell;
    self->_sizingIndexingFooterCell = v5;

    [(CKDetailsSearchViewController *)self _configureIndexingCell:self->_sizingIndexingFooterCell];
    sizingIndexingFooterCell = self->_sizingIndexingFooterCell;
  }

  return sizingIndexingFooterCell;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(CKDetailsSearchViewController *)self searchComplete])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v6 = [(CKSearchViewController *)self searchControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v41 + 1) + 8 * i) hasMoreResults])
          {

            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    unint64_t v11 = [(CKDetailsSearchViewController *)self globalLayoutConfiguration];
    id v12 = v11;
    double v13 = 0.0;
    if (v11)
    {
      uint64_t v14 = [v11 boundarySupplementaryItems];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        double v16 = [(CKDetailsSearchViewController *)self view];
        [v16 bounds];
        double v17 = CGRectGetWidth(v49);

        id v18 = objc_opt_new();
        objc_msgSend(v18, "setFrame:", 0.0, 0.0, v17, 1.79769313e308);
        long long v19 = [(CKDetailsSearchViewController *)self sizingIndexingFooterCell];
        long long v20 = [v19 preferredLayoutAttributesFittingAttributes:v18];

        [v20 frame];
        double v13 = CGRectGetHeight(v50);
      }
    }
  }
  else
  {
LABEL_14:
    CGRect v21 = [(CKSearchViewController *)self collectionView];
    [v21 setNeedsLayout];

    CGRect v22 = [(CKSearchViewController *)self collectionView];
    [v22 layoutIfNeeded];

    int v23 = [(CKSearchViewController *)self collectionView];
    [v23 contentSize];
    double v13 = v24;

    if (v13 == 0.0)
    {
      __int16 v25 = [(CKSearchViewController *)self collectionView];
      objc_msgSend(v25, "sizeThatFits:", width, height);
      double v13 = v26;
    }
    long long v27 = [(CKSearchViewController *)self collectionView];
    long long v28 = +[CKDetailsSearchResultsFooterCell supplementaryViewType];
    id v12 = [v27 visibleSupplementaryViewsOfKind:v28];

    if ([v12 count])
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v12 = v12;
      uint64_t v29 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v38;
        double v32 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * j), "frame", (void)v37);
            double MaxY = CGRectGetMaxY(v51);
            if (MaxY >= v32) {
              double v32 = MaxY;
            }
          }
          uint64_t v30 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v30);
      }
      else
      {
        double v32 = 0.0;
      }

      if (v32 < v13) {
        double v13 = v32;
      }
    }
  }

  double v35 = width;
  double v36 = v13;
  result.double height = v36;
  result.double width = v35;
  return result;
}

- (Class)_searchResultsHeaderClass
{
  return (Class)objc_opt_class();
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v11 collectionView:a3 willDisplaySupplementaryView:v10 forElementKind:a5 atIndexPath:a6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setDelegate:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setDetailsViewDelegate:self];
    }
  }
}

- (void)searchResultsTitleCellShowAllButtonTapped:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst()) {
    [(CKDetailsSearchViewController *)self _searchResultHeaderButtonTapped:v4];
  }
}

- (void)searchDetailsFooterCellShowAllTapped:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  BOOL v3 = [v13 sectionIdentifier];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CKSearchViewController *)self searchControllers];
  id v5 = (id)[v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          uint64_t v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v20 = v8;
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Controller check %@", buf, 0xCu);
          }
        }
        id v10 = [(id)objc_opt_class() sectionIdentifier];
        int v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v5 = v8;
          goto LABEL_15;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      long long v20 = v3;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Section id %@ controller %@", buf, 0x16u);
    }
  }
  if (v5) {
    [(CKDetailsSearchViewController *)self setupDetailsSearchController:v5];
  }
}

- (void)searchDetailsShowAllButtonTapped:(id)a3
{
  unint64_t v4 = [a3 sectionIndex];
  id v5 = [(CKSearchViewController *)self searchControllers];
  unint64_t v6 = [v5 count];

  if (v4 < v6)
  {
    uint64_t v7 = [(CKSearchViewController *)self searchControllers];
    id v8 = [v7 objectAtIndex:v4];

    [(CKDetailsSearchViewController *)self setupDetailsSearchController:v8];
  }
}

- (void)setupDetailsSearchController:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  unint64_t v6 = [[CKDetailsSearchViewController alloc] initWithSearchControllerClasses:v5];
  uint64_t v7 = [(CKDetailsSearchViewController *)self conversation];
  [(CKDetailsSearchViewController *)v6 setConversation:v7];

  [(CKSearchViewController *)v6 setMode:4];
  id v8 = [(CKSearchViewController *)self delegate];
  [(CKSearchViewController *)v6 setDelegate:v8];

  uint64_t v9 = [(CKDetailsSearchViewController *)self detailsDelegate];
  [(CKDetailsSearchViewController *)v6 setDetailsDelegate:v9];

  [(CKDetailsSearchViewController *)v6 setAssociatedDetailsSubsectionSearchController:v4];
  id v10 = [(CKDetailsSearchViewController *)self detailsDelegate];
  [v10 detailsSearchController:self requestsPushOfSearchController:v6];

  [(CKDetailsSearchViewController *)v6 searchWithText:&stru_1EDE4CA38];
}

- (void)deleteTransferGUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v12 deleteTransferGUID:v4];
  BOOL v5 = [v4 length] == 0;
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Unable to find transfer guid to delete: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Found transfer guid to delete: %@", buf, 0xCu);
      }
    }
    id v8 = [(CKDetailsSearchViewController *)self conversation];
    uint64_t v9 = [v8 chat];
    id v13 = v4;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [v9 deleteTransfers:v10];
  }
}

- (void)deleteChatItemWithTransferGUID:(id)a3 fromMessageItem:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_12;
    }
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKDetailsSearchViewController: Transfer guid is nil. Transfer deletion will not continue.", buf, 2u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!v7)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_12;
    }
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKDetailsSearchViewController: messageItem not provided. Transfer deletion will not continue for guid: %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v8 = [(CKDetailsSearchViewController *)self conversation];
  uint64_t v9 = [v8 chat];
  id v12 = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v9 deleteChatItemsWithTransferGUIDs:v10 fromMessageItem:v7];

LABEL_12:
}

- (void)deleteMessageItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchViewController;
  [(CKSearchViewController *)&v11 deleteMessageItem:v4];
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Found message to delete: %@", buf, 0xCu);
      }
    }
    id v7 = [(CKDetailsSearchViewController *)self conversation];
    id v8 = [v7 chat];
    id v12 = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v8 deleteIMMessageItems:v9];
  }
  else if (v5)
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Unable to find message to delete.", buf, 2u);
    }
  }
}

- (id)searchController:(id)a3 conversationsForExistingChatsWithGUIDs:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CKDetailsSearchViewController *)self conversation];
  int v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)searchViewController:(id)a3 requestsPushOfSearchController:(id)a4
{
  id v5 = a4;
  id v6 = [(CKDetailsSearchViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (id)searchBarForSearchViewController:(id)a3
{
  return 0;
}

- (BOOL)shouldInsetResultsForSearchController:(id)a3
{
  return 0;
}

- (void)searchController:(id)a3 requestsItemDeletionAtIndexPath:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v8 = a4;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a4;
    id v7 = [v5 arrayWithObjects:&v8 count:1];

    -[CKDetailsSearchViewController _deleteAttachmentsAtIndexPaths:](self, "_deleteAttachmentsAtIndexPaths:", v7, v8, v9);
  }
}

- (id)searchControllerChatGUIDsForDetailsSearch:(id)a3
{
  uint64_t v4 = [(CKDetailsSearchViewController *)self chatGUIDs];

  if (!v4)
  {
    id v5 = [(CKDetailsSearchViewController *)self conversation];
    id v6 = [v5 chat];

    id v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    id v8 = [v7 allGUIDsForChat:v6];

    [(CKDetailsSearchViewController *)self setChatGUIDs:v8];
  }

  return [(CKDetailsSearchViewController *)self chatGUIDs];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKSearchViewController *)self collectionView];
  int v6 = objc_msgSend(v5, "_ck_isEditing");

  if (v6 == v3) {
    return;
  }
  id v7 = [(CKSearchViewController *)self collectionView];
  objc_msgSend(v7, "_ck_setEditing:", v3);

  id v8 = [(CKSearchViewController *)self collectionView];
  [v8 reloadData];

  if ([(CKSearchViewController *)self mode] != 4)
  {
    objc_super v11 = [(CKDetailsSearchViewController *)self parentViewController];
    id v29 = [v11 navigationItem];

    if (!v3) {
      goto LABEL_4;
    }
LABEL_7:
    if (!self->_saveButton)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F427C0]);
      id v13 = CKFrameworkBundle();
      id v14 = [v13 localizedStringForKey:@"SEARCH_SAVE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v15 = (UIBarButtonItem *)[v12 initWithTitle:v14 style:0 target:self action:sel__saveSelectedAttachments_];
      saveButton = self->_saveButton;
      self->_saveButton = v15;
    }
    if (!self->_deleteButton)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F427C0]);
      long long v18 = CKFrameworkBundle();
      long long v19 = [v18 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      long long v20 = (UIBarButtonItem *)[v17 initWithTitle:v19 style:0 target:self action:sel__deleteSelectedAttachments_];
      deleteButton = self->_deleteButton;
      self->_deleteButton = v20;
    }
    id v22 = [(CKDetailsSearchViewController *)self navigationController];
    [v22 setToolbarHidden:0 animated:1];

    int v23 = [(CKDetailsSearchViewController *)self cancelButton];

    if (!v23)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F427C0]);
      __int16 v25 = CKFrameworkBundle();
      double v26 = [v25 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      long long v27 = (void *)[v24 initWithTitle:v26 style:0 target:self action:sel__cancelEditing_];

      [(CKDetailsSearchViewController *)self setCancelButton:v27];
    }
    uint64_t v10 = [(CKDetailsSearchViewController *)self cancelButton];
    goto LABEL_14;
  }
  id v29 = [(CKDetailsSearchViewController *)self navigationItem];
  if (v3) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = [(CKDetailsSearchViewController *)self navigationController];
  [v9 setToolbarHidden:1 animated:1];

  uint64_t v10 = [(CKDetailsSearchViewController *)self selectButton];
LABEL_14:
  long long v28 = (void *)v10;
  [v29 setRightBarButtonItem:v10 animated:1];

  [(CKDetailsSearchViewController *)self _updateToolbar];
}

- (id)_selectedIndexPaths
{
  v2 = [(CKSearchViewController *)self collectionView];
  BOOL v3 = [v2 indexPathsForSelectedItems];

  return v3;
}

- (void)_updateToolbar
{
  v20[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKDetailsSearchViewController *)self _selectedIndexPaths];
  uint64_t v4 = [v3 count];
  id v5 = [(CKDetailsSearchViewController *)self saveButton];
  BOOL v6 = v4 != 0;
  [v5 setEnabled:v6];

  id v7 = [(CKDetailsSearchViewController *)self deleteButton];
  [v7 setEnabled:v6];

  id v8 = [(CKDetailsSearchViewController *)self flexibleItem];

  if (!v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:5 target:0 action:0];
    [(CKDetailsSearchViewController *)self setFlexibleItem:v9];
  }
  uint64_t v10 = [(CKSearchViewController *)self searchControllers];
  objc_super v11 = [v10 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v13 = [(CKDetailsSearchViewController *)self navigationController];
  id v14 = [v13 toolbar];
  if (isKindOfClass)
  {
    uint64_t v15 = [(CKDetailsSearchViewController *)self saveButton];
    v20[0] = v15;
    uint64_t v16 = [(CKDetailsSearchViewController *)self flexibleItem];
    v20[1] = v16;
    id v17 = [(CKDetailsSearchViewController *)self deleteButton];
    v20[2] = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    [v14 setItems:v18];
  }
  else
  {
    uint64_t v15 = [(CKDetailsSearchViewController *)self flexibleItem];
    uint64_t v16 = [(CKDetailsSearchViewController *)self deleteButton];
    v19[1] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [v14 setItems:v17];
  }
}

- (void)_selectButtonTapped:(id)a3
{
}

- (void)_cancelEditing:(id)a3
{
}

- (void)_saveSelectedAttachments:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(CKDetailsSearchViewController *)self _selectedIndexPaths];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [(CKDetailsSearchViewController *)self _searchControllerForIndexPath:v9];
        if (v10)
        {
          unint64_t v11 = [v9 row];
          id v12 = [v10 results];
          unint64_t v13 = [v12 count];

          if (v11 < v13)
          {
            id v14 = [v10 results];
            uint64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v9, "row"));

            [v10 saveAttachmentForResult:v15];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [(CKDetailsSearchViewController *)self setEditing:0];
}

- (void)_deleteSelectedAttachments:(id)a3
{
  id v4 = [(CKDetailsSearchViewController *)self _selectedIndexPaths];
  [(CKDetailsSearchViewController *)self _deleteAttachmentsAtIndexPaths:v4];
}

- (void)_deleteAttachmentsAtIndexPaths:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_34;
  }
  uint64_t v5 = CKFrameworkBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];

  uint64_t v7 = [v4 firstObject];
  id v8 = [(CKDetailsSearchViewController *)self _searchControllerForIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((unint64_t)[v4 count] >= 2)
    {
      char isKindOfClass = 1;
      goto LABEL_6;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((unint64_t)[v4 count] <= 1)
  {
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v34 = CKFrameworkBundle();
      v46 = [v34 localizedStringForKey:@"DELETE_ATTACHMENT" value:&stru_1EDE4CA38 table:@"ChatKit"];

      if (CKIsRunningInMacCatalyst())
      {
        __int16 v25 = CKFrameworkBundle();
        unint64_t v11 = v25;
        double v26 = @"DELETE_SINGLE_ATTACHMENT";
        goto LABEL_24;
      }
LABEL_35:
      uint64_t v33 = 0;
      goto LABEL_26;
    }
LABEL_13:
    id v24 = CKFrameworkBundle();
    v46 = [v24 localizedStringForKey:@"DELETE_LINK" value:&stru_1EDE4CA38 table:@"ChatKit"];

    if (CKIsRunningInMacCatalyst())
    {
      __int16 v25 = CKFrameworkBundle();
      unint64_t v11 = v25;
      double v26 = @"DELETE_SINGLE_LINK";
LABEL_24:
      uint64_t v33 = [v25 localizedStringForKey:v26 value:&stru_1EDE4CA38 table:@"ChatKit"];
      goto LABEL_25;
    }
    goto LABEL_35;
  }
LABEL_6:
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  unint64_t v11 = CKLocalizedStringForNumber(v10);

  id v12 = NSString;
  unint64_t v13 = CKFrameworkBundle();
  id v14 = v13;
  if ((isKindOfClass & 1) == 0)
  {
    long long v27 = [v13 localizedStringForKey:@"DELETE_ATTACHMENTS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    long long v28 = objc_msgSend(v12, "stringWithFormat:", v27, v11);

    id v29 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v30 = [v29 userInterfaceLayoutDirection];

    if (v30 == 1) {
      uint64_t v31 = @"\u200F";
    }
    else {
      uint64_t v31 = @"\u200E";
    }
    uint64_t v32 = [(__CFString *)v31 stringByAppendingString:v28];

    v46 = (void *)v32;
    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v21 = CKFrameworkBundle();
      id v22 = v21;
      int v23 = @"DELETE_MULTIPLE_ATTACHMENTS";
      goto LABEL_20;
    }
LABEL_21:
    uint64_t v33 = 0;
    goto LABEL_25;
  }
  uint64_t v15 = [v13 localizedStringForKey:@"DELETE_LINKS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  long long v16 = objc_msgSend(v12, "stringWithFormat:", v15, v11);

  long long v17 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v18 = [v17 userInterfaceLayoutDirection];

  if (v18 == 1) {
    long long v19 = @"\u200F";
  }
  else {
    long long v19 = @"\u200E";
  }
  uint64_t v20 = [(__CFString *)v19 stringByAppendingString:v16];

  v46 = (void *)v20;
  if (!CKIsRunningInMacCatalyst()) {
    goto LABEL_21;
  }
  uint64_t v21 = CKFrameworkBundle();
  id v22 = v21;
  int v23 = @"DELETE_MULTIPLE_LINKS";
LABEL_20:
  uint64_t v33 = [v21 localizedStringForKey:v23 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_25:
LABEL_26:
  if (CKIsRunningInMacCatalyst())
  {
    double v35 = CKFrameworkBundle();
    double v36 = [v35 localizedStringForKey:@"DELETE_WARNING" value:&stru_1EDE4CA38 table:@"ChatKit"];

    uint64_t v37 = 1;
  }
  else
  {
    uint64_t v37 = 0;
    double v36 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke;
  aBlock[3] = &unk_1E5620AF8;
  id v52 = v4;
  v53 = self;
  long long v38 = _Block_copy(aBlock);
  v45 = (void *)v33;
  long long v39 = +[CKAlertController alertControllerWithTitle:v33 message:v36 preferredStyle:v37];
  if (!CKIsRunningInMacCatalyst())
  {
    uint64_t v40 = v6;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_2;
    v49[3] = &unk_1E5621380;
    id v50 = v38;
    long long v41 = +[CKAlertAction actionWithTitle:v46 style:2 handler:v49];
    [v39 addAction:v41];

    uint64_t v6 = v40;
  }
  long long v42 = (void *)v6;
  long long v43 = +[CKAlertAction actionWithTitle:v6 style:1 handler:&__block_literal_global_237];
  [v39 addAction:v43];

  if (CKIsRunningInMacCatalyst())
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_4;
    v47[3] = &unk_1E5621380;
    id v48 = v38;
    long long v44 = +[CKAlertAction actionWithTitle:v46 style:2 handler:v47];
    [v39 addAction:v44];
  }
  [(CKDetailsSearchViewController *)self presentViewController:v39 animated:1 completion:0];

LABEL_34:
}

uint64_t __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "_searchControllerForIndexPath:", v7, (void)v16);
        if (v8)
        {
          unint64_t v9 = [v7 row];
          uint64_t v10 = [v8 results];
          unint64_t v11 = [v10 count];

          if (v9 < v11)
          {
            id v12 = [v8 results];
            unint64_t v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v7, "row"));

            [v8 deleteAttachmentForResult:v13];
            id v14 = [*(id *)(a1 + 40) associatedDetailsSubsectionSearchController];
            [v14 deleteAttachmentForResult:v13];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) setEditing:0];
}

uint64_t __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__CKDetailsSearchViewController__deleteAttachmentsAtIndexPaths___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_searchControllerForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKSearchViewController *)self searchControllers];
  uint64_t v6 = [v4 section];

  uint64_t v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (CKQLPreviewController)previewController
{
  previewController = self->_previewController;
  if (!previewController)
  {
    if (!CKIsRunningInMacCatalyst())
    {
      id v4 = objc_alloc_init(CKQLPreviewController);
      uint64_t v5 = self->_previewController;
      self->_previewController = v4;
    }
    [(QLPreviewController *)self->_previewController setDelegate:self];
    previewController = self->_previewController;
  }

  return previewController;
}

- (CKDetailsSearchControllerDelegate)detailsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsDelegate);

  return (CKDetailsSearchControllerDelegate *)WeakRetained;
}

- (void)setDetailsDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (BOOL)searchComplete
{
  return self->_searchComplete;
}

- (void)setSearchComplete:(BOOL)a3
{
  self->_searchComplete = a3;
}

- (CKSearchController)associatedDetailsSubsectionSearchController
{
  return self->_associatedDetailsSubsectionSearchController;
}

- (void)setAssociatedDetailsSubsectionSearchController:(id)a3
{
}

- (NSArray)chatGUIDs
{
  return self->_chatGUIDs;
}

- (void)setChatGUIDs:(id)a3
{
}

- (CKQLPreviewControllerDataSource)qlPreviewDataSource
{
  return self->_qlPreviewDataSource;
}

- (void)setQlPreviewDataSource:(id)a3
{
}

- (void)setPreviewController:(id)a3
{
}

- (void)setTitleSizingCell:(id)a3
{
}

- (void)setFooterSizingCell:(id)a3
{
}

- (void)setSizingIndexingFooterCell:(id)a3
{
}

- (UIBarButtonItem)selectButton
{
  return self->_selectButton;
}

- (void)setSelectButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)flexibleItem
{
  return self->_flexibleItem;
}

- (void)setFlexibleItem:(id)a3
{
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (UIBarButtonItem)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (NSDate)lastUserSelectedCellTime
{
  return self->_lastUserSelectedCellTime;
}

- (void)setLastUserSelectedCellTime:(id)a3
{
}

- (UICollectionViewCell)lastUserSelectedCell
{
  return self->_lastUserSelectedCell;
}

- (void)setLastUserSelectedCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserSelectedCell, 0);
  objc_storeStrong((id *)&self->_lastUserSelectedCellTime, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_flexibleItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_sizingIndexingFooterCell, 0);
  objc_storeStrong((id *)&self->_footerSizingCell, 0);
  objc_storeStrong((id *)&self->_titleSizingCell, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_qlPreviewDataSource, 0);
  objc_storeStrong((id *)&self->_chatGUIDs, 0);
  objc_storeStrong((id *)&self->_associatedDetailsSubsectionSearchController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_destroyWeak((id *)&self->_detailsDelegate);
}

@end