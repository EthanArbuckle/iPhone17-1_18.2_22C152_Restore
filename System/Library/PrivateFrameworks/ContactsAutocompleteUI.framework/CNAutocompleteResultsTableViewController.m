@interface CNAutocompleteResultsTableViewController
+ (BOOL)avatarsAreHidden;
+ (BOOL)shouldUseTransparentCell;
+ (id)log;
+ (void)dispatchMainIfNecessary:(id)a3;
- (BOOL)attemptDisambiguationToggleAtSelectedRowIsExpand:(BOOL)a3;
- (BOOL)collapseSelectedRecipient;
- (BOOL)confirmSelectedRecipient;
- (BOOL)expandSelectedRecipient;
- (BOOL)hasPerformedRecipientExpansion;
- (BOOL)inDisambiguationMode;
- (BOOL)isDeferringTableViewUpdates;
- (BOOL)recipientIsDisambiguationRecipient:(id)a3;
- (BOOL)recipientIsExpanded:(id)a3;
- (BOOL)recipientIsExpandedChild:(id)a3;
- (BOOL)recipientIsExpandedParent:(id)a3;
- (BOOL)shouldHideInfoButton;
- (BOOL)shouldShowCheckmarkForRecipient:(id)a3 preferredRecipient:(id)a4;
- (BOOL)supportsInfoButton;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)updateCell:(id)a3 withPreferredRecipient:(id)a4 isInvalidation:(BOOL)a5;
- (BOOL)updatePreferredRecipientForCell:(id)a3 isInvalidation:(BOOL)a4;
- (BOOL)willProvideOverrideImageDataForCell:(id)a3 completionBlock:(id)a4;
- (CNAutocompleteResultsTableViewController)initWithOptions:(id)a3;
- (CNAutocompleteResultsTableViewController)initWithStyle:(int64_t)a3;
- (CNAutocompleteResultsTableViewControllerDelegate)delegate;
- (CNAutocompleteSearchControllerOptions)options;
- (CNAvatarViewControllerSettings)sharedAvatarViewControllerSettings;
- (NSArray)recipients;
- (NSMutableSet)expandedIdentifiers;
- (double)_tableViewHeaderHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)trailingButtonMidlineInsetFromLayoutMargin;
- (id)_combinedResults;
- (id)_flattenedIndexPaths;
- (id)_indexPathForRecipient:(id)a3;
- (id)_parentRecipientForRecipientAtIndexPath:(id)a3;
- (id)_recipientAtIndexPath:(id)a3;
- (id)_unifiedRecipientForRecipientAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)unificationIdentifierForRecipient:(id)a3;
- (id)visibleRecipients;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3;
- (void)_updateTableViewModelAnimated:(BOOL)a3;
- (void)callEndDisplayingRowForRecipientIndex:(id)a3;
- (void)didHover:(id)a3;
- (void)didTapDisambiguationChevronForCell:(id)a3;
- (void)didTapInfoButtonForCell:(id)a3;
- (void)didToggleDisambiguationAtIndexPath:(id)a3;
- (void)endDisplayOfVisibleCellsExcludingIndexPath:(id)a3;
- (void)invalidateAddressTintColors;
- (void)invalidatePreferredRecipients;
- (void)invalidateSearchResultRecipient:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectNextSearchResult;
- (void)selectPreviousSearchResult;
- (void)selectRowAtIndexPath:(id)a3;
- (void)setDeferTableViewUpdates:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedIdentifiers:(id)a3;
- (void)setHasPerformedRecipientExpansion:(BOOL)a3;
- (void)setInDisambiguationMode:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPreferredRecipient:(id)a3 forRecipient:(id)a4;
- (void)setRecipients:(id)a3;
- (void)setSharedAvatarViewControllerSettings:(id)a3;
- (void)setShouldHideInfoButton:(BOOL)a3;
- (void)setSupportsInfoButton:(BOOL)a3;
- (void)setTintColor:(id)a3 forRecipient:(id)a4;
- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackgroundAndSeparatorsForCell:(id)a3 atIndexPath:(id)a4;
- (void)updateLabelColorForCell:(id)a3;
- (void)updateRecipients:(id)a3 disambiguatingRecipient:(id)a4;
- (void)viewLayoutMarginsDidChange;
@end

@implementation CNAutocompleteResultsTableViewController

+ (BOOL)avatarsAreHidden
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  BOOL v4 = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4F43778]) == NSOrderedDescending;

  return v4;
}

+ (id)log
{
  if (log_cn_once_token_2 != -1) {
    dispatch_once(&log_cn_once_token_2, &__block_literal_global_0);
  }
  v2 = (void *)log_cn_once_object_2;

  return v2;
}

uint64_t __47__CNAutocompleteResultsTableViewController_log__block_invoke()
{
  log_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts.autocomplete.ui", "tableview controller");

  return MEMORY[0x1F41817F8]();
}

- (CNAutocompleteResultsTableViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(CNAutocompleteResultsTableViewController *)self init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 copy];
    options = v6->_options;
    v6->_options = (CNAutocompleteSearchControllerOptions *)v7;
  }
  return v6;
}

- (CNAutocompleteResultsTableViewController)initWithStyle:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CNAutocompleteResultsTableViewController;
  id v4 = -[CNAutocompleteResultsTableViewController initWithStyle:](&v17, sel_initWithStyle_);
  if (v4)
  {
    v5 = [CNAutocompleteResultsTableView alloc];
    v6 = -[CNAutocompleteResultsTableView initWithFrame:style:](v5, "initWithFrame:style:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNAutocompleteResultsTableViewController *)v4 setTableView:v6];

    uint64_t v7 = objc_opt_new();
    [(CNAutocompleteResultsTableViewController *)v4 setExpandedIdentifiers:v7];

    v8 = [(CNAutocompleteResultsTableViewController *)v4 view];
    [v8 setPreservesSuperviewLayoutMargins:1];

    [(CNAutocompleteResultsTableViewController *)v4 setShouldHideInfoButton:0];
    -[CNAutocompleteResultsTableViewController setSupportsInfoButton:](v4, "setSupportsInfoButton:", [MEMORY[0x1E4F5A450] isDevicePasscodeProtected] ^ 1);
    [(CNAutocompleteResultsTableViewController *)v4 setClearsSelectionOnViewWillAppear:0];
    v9 = [(CNAutocompleteResultsTableViewController *)v4 view];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel_didHover_];
    [v9 addGestureRecognizer:v10];

    v11 = (void *)MEMORY[0x1E4F1BB50];
    v12 = CNAutocompleteSharedLocalOnlyContactStore();
    v13 = [v11 settingsWithContactStore:v12 cacheSize:50 threeDTouchEnabled:0];
    [(CNAutocompleteResultsTableViewController *)v4 setSharedAvatarViewControllerSettings:v13];

    v14 = [(CNAutocompleteResultsTableViewController *)v4 tableView];
    [v14 setAutoresizingMask:2];

    v15 = [(CNAutocompleteResultsTableViewController *)v4 tableView];
    [v15 setSectionHeaderTopPadding:0.0];
  }
  return v4;
}

- (void)didHover:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 state];
  if ((unint64_t)(v4 - 1) > 1)
  {
    if (v4 == 3) {
      [(CNAutocompleteResultsTableViewController *)self selectRowAtIndexPath:0];
    }
  }
  else
  {
    v5 = [(CNAutocompleteResultsTableViewController *)self view];
    [v14 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    v10 = [(CNAutocompleteResultsTableViewController *)self tableView];
    v11 = objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);

    v12 = [(CNAutocompleteResultsTableViewController *)self tableView];
    v13 = [v12 cellForRowAtIndexPath:v11];

    if (!v13)
    {

      v11 = 0;
    }
    [(CNAutocompleteResultsTableViewController *)self selectRowAtIndexPath:v11];
  }
}

- (void)selectRowAtIndexPath:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v4 = [(CNAutocompleteResultsTableViewController *)self tableView];
    [v4 scrollToRowAtIndexPath:v6 atScrollPosition:0 animated:1];
  }
  v5 = [(CNAutocompleteResultsTableViewController *)self tableView];
  [v5 selectRowAtIndexPath:v6 animated:0 scrollPosition:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteResultsTableViewController;
  id v4 = a3;
  [(CNAutocompleteResultsTableViewController *)&v9 traitCollectionDidChange:v4];
  v5 = [(CNAutocompleteResultsTableViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqual:v7];
  if ((v4 & 1) == 0)
  {
    double v8 = [(CNAutocompleteResultsTableViewController *)self tableView];
    [v8 _purgeReuseQueues];
  }
}

- (void)_updateTableViewModelAnimated:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_deferTableViewUpdates)
  {
    self->_tableViewNeedsReload = 1;
  }
  else
  {
    BOOL v4 = a3;
    v5 = [(CNAutocompleteResultsTableViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0
      && ([(CNAutocompleteResultsTableViewController *)self tableView],
          double v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isHidden],
          v7,
          (v8 & 1) == 0))
    {
      objc_super v9 = [(CNAutocompleteResultsTableViewController *)self visibleRecipients];
    }
    else
    {
      objc_super v9 = 0;
    }
    p_tableViewModel = &self->_tableViewModel;
    tableViewModel = self->_tableViewModel;
    if (!tableViewModel)
    {
      v12 = [[_CNAutocompleteResultsTableViewModel alloc] initWithNumberOfSections:3];
      v13 = *p_tableViewModel;
      *p_tableViewModel = v12;

      tableViewModel = *p_tableViewModel;
    }
    id v14 = tableViewModel;
    v15 = [[_CNAutocompleteResultsTableViewModel alloc] initWithNumberOfSections:[(_CNAutocompleteResultsTableViewModel *)v14 numberOfSections]];
    [(_CNAutocompleteResultsTableViewModel *)v15 setObject:self->_searchResults atIndexedSubscript:0];
    [(_CNAutocompleteResultsTableViewModel *)v15 setObject:self->_suggestedSearchResults atIndexedSubscript:1];
    [(_CNAutocompleteResultsTableViewModel *)v15 setObject:self->_serverSearchResults atIndexedSubscript:2];
    self->_ignoreDidEndDisplayingCell = 1;
    if (v4)
    {
      v16 = [(_CNAutocompleteResultsTableViewModel *)v14 computeDiffForModel:v15];
      objc_storeStrong((id *)&self->_tableViewModel, v15);
      objc_super v17 = [(CNAutocompleteResultsTableViewController *)self tableView];
      [v17 beginUpdates];

      v18 = [v16 insertedRows];
      uint64_t v19 = [v18 count];

      if (v19)
      {
        v20 = [(CNAutocompleteResultsTableViewController *)self tableView];
        v21 = [v16 insertedRows];
        [v20 insertSections:v21 withRowAnimation:100];
      }
      v22 = [v16 deletedRows];
      uint64_t v23 = [v22 count];

      if (v23)
      {
        v24 = [(CNAutocompleteResultsTableViewController *)self tableView];
        v25 = [v16 deletedRows];
        [v24 deleteSections:v25 withRowAnimation:3];
      }
      v26 = [v16 changedRows];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        v28 = [(CNAutocompleteResultsTableViewController *)self tableView];
        v29 = [v16 changedRows];
        [v28 reloadSections:v29 withRowAnimation:0];
      }
      v30 = [(CNAutocompleteResultsTableViewController *)self tableView];
      [v30 endUpdates];
    }
    else
    {
      objc_storeStrong((id *)&self->_tableViewModel, v15);
      v16 = [(CNAutocompleteResultsTableViewController *)self tableView];
      [v16 reloadData];
    }

    self->_ignoreDidEndDisplayingCell = 0;
    if ((v6 & 1) != 0 && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      v31 = [(CNAutocompleteResultsTableViewController *)self visibleRecipients];
      v32 = objc_msgSend(v31, "_cn_indexBy:", &__block_literal_global_80);

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __74__CNAutocompleteResultsTableViewController__updateTableViewModelAnimated___block_invoke_2;
      v46[3] = &unk_1E6128188;
      id v33 = v32;
      id v47 = v33;
      v41 = v9;
      v34 = objc_msgSend(v9, "_cn_filter:", v46);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v43 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v40 = [(CNAutocompleteResultsTableViewController *)self delegate];
            [v40 autocompleteResultsController:self didEndDisplayingRowForRecipient:v39];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v36);
      }

      objc_super v9 = v41;
    }
  }
}

uint64_t __74__CNAutocompleteResultsTableViewController__updateTableViewModelAnimated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringForEqualityTesting];
}

BOOL __74__CNAutocompleteResultsTableViewController__updateTableViewModelAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 stringForEqualityTesting];
  BOOL v4 = [v2 objectForKey:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)visibleRecipients
{
  v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
  BOOL v4 = [v3 indexPathsForVisibleRows];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CNAutocompleteResultsTableViewController_visibleRecipients__block_invoke;
  v8[3] = &unk_1E6128248;
  v8[4] = self;
  BOOL v5 = objc_msgSend(v4, "_cn_map:", v8);
  char v6 = objc_msgSend(v5, "_cn_flatten");

  return v6;
}

uint64_t __61__CNAutocompleteResultsTableViewController_visibleRecipients__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recipientAtIndexPath:a2];
}

- (void)setDeferTableViewUpdates:(BOOL)a3
{
  BOOL deferTableViewUpdates = self->_deferTableViewUpdates;
  if (deferTableViewUpdates != a3)
  {
    self->_BOOL deferTableViewUpdates = a3;
    BOOL deferTableViewUpdates = a3;
  }
  if (!deferTableViewUpdates && self->_tableViewNeedsReload)
  {
    self->_tableViewNeedsReload = 0;
    [(CNAutocompleteResultsTableViewController *)self _updateTableViewModelAnimated:0];
  }
}

- (void)setRecipients:(id)a3
{
}

- (id)unificationIdentifierForRecipient:(id)a3
{
  id v3 = a3;
  if ([v3 isGroup])
  {
    BOOL v4 = [v3 address];
  }
  else
  {
    BOOL v5 = [v3 autocompleteResult];
    char v6 = [v5 identifier];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v3 address];
    }
    BOOL v4 = v8;
  }

  return v4;
}

- (void)updateRecipients:(id)a3 disambiguatingRecipient:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    -[CNAutocompleteResultsTableViewController updateRecipients:disambiguatingRecipient:]();
  }
  id v8 = (NSArray *)[v6 copy];
  recipients = self->_recipients;
  self->_recipients = v8;

  [(CNAutocompleteResultsTableViewController *)self setInDisambiguationMode:v7 != 0];
  [(CNAutocompleteResultsTableViewController *)self setHasPerformedRecipientExpansion:0];
  v10 = [(CNAutocompleteResultsTableViewController *)self expandedIdentifiers];
  [v10 removeAllObjects];

  uint64_t v11 = [(CNAutocompleteResultsTableViewController *)self unificationIdentifierForRecipient:v7];
  if (v11)
  {
    v12 = [(CNAutocompleteResultsTableViewController *)self expandedIdentifiers];
    [v12 addObject:v11];
  }
  long long v45 = self;
  objc_msgSend(MEMORY[0x1E4F1CA48], "array", v11);
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  v13 = [MEMORY[0x1E4F1CA48] array];
  id v49 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v6;
  uint64_t v14 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v63;
    id v47 = v13;
    id v48 = v7;
    uint64_t v46 = *(void *)v63;
    do
    {
      uint64_t v17 = 0;
      uint64_t v51 = v15;
      do
      {
        if (*(void *)v63 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(id *)(*((void *)&v62 + 1) + 8 * v17);
        char v19 = [v18 isSuggestedRecipient];
        v20 = v13;
        if ((v19 & 1) == 0)
        {
          int v21 = [v18 isDirectoryServerResult];
          v20 = v50;
          if (v21) {
            v20 = v49;
          }
        }
        id v22 = v20;
        [v22 addObject:v18];
        if (v18 == v7)
        {
          uint64_t v23 = [v7 sortedChildren];
          [v22 addObjectsFromArray:v23];
        }
        if ([v18 isGroup])
        {
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          v24 = [v18 children];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v59 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                long long v54 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                v30 = [v29 children];
                v31 = [v30 arrayByAddingObject:v29];

                uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v66 count:16];
                if (v32)
                {
                  uint64_t v33 = v32;
                  uint64_t v34 = *(void *)v55;
                  do
                  {
                    for (uint64_t j = 0; j != v33; ++j)
                    {
                      if (*(void *)v55 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      [*(id *)(*((void *)&v54 + 1) + 8 * j) setIsMemberOfGroup:1];
                    }
                    uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v66 count:16];
                  }
                  while (v33);
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v67 count:16];
            }
            while (v26);
          }

          v13 = v47;
          id v7 = v48;
          uint64_t v16 = v46;
          uint64_t v15 = v51;
        }

        ++v17;
      }
      while (v17 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v15);
  }

  objc_storeStrong((id *)&v45->_searchResults, v50);
  objc_storeStrong((id *)&v45->_suggestedSearchResults, v13);
  objc_storeStrong((id *)&v45->_serverSearchResults, v49);
  uint64_t v36 = [(CNAutocompleteResultsTableViewController *)v45 tableView];
  uint64_t v37 = [v36 indexPathForSelectedRow];

  [(CNAutocompleteResultsTableViewController *)v45 _updateTableViewModelAnimated:0];
  v38 = [(CNAutocompleteResultsTableViewController *)v45 tableView];
  [v38 layoutIfNeeded];

  if (v37
    && (-[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](v45->_tableViewModel, "objectAtIndexedSubscript:", [v37 section]), uint64_t v39 = objc_claimAutoreleasedReturnValue(), v40 = objc_msgSend(v39, "count"), v41 = objc_msgSend(v37, "row"), v39, v40 > v41))
  {
    [(CNAutocompleteResultsTableViewController *)v45 selectRowAtIndexPath:v37];
    long long v42 = v44;
  }
  else
  {
    long long v42 = v44;
    if ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode])
    {
      tableViewModel = v45->_tableViewModel;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __85__CNAutocompleteResultsTableViewController_updateRecipients_disambiguatingRecipient___block_invoke;
      v53[3] = &unk_1E6128270;
      v53[4] = v45;
      [(_CNAutocompleteResultsTableViewModel *)tableViewModel enumerateSections:v53];
    }
  }
}

uint64_t __85__CNAutocompleteResultsTableViewController_updateRecipients_disambiguatingRecipient___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    id v8 = [*(id *)(a1 + 32) tableView];
    objc_super v9 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:a2];
    [v8 scrollToRowAtIndexPath:v9 atScrollPosition:0 animated:0];

    uint64_t result = [*(id *)(a1 + 32) selectNextSearchResult];
    *a4 = 1;
  }
  return result;
}

- (id)_flattenedIndexPaths
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  tableViewModel = self->_tableViewModel;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CNAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke;
  v6[3] = &unk_1E61281D8;
  v6[4] = &v7;
  [(_CNAutocompleteResultsTableViewModel *)tableViewModel enumerateSections:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__CNAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:a2];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
    }
  }
}

- (void)selectNextSearchResult
{
  id v7 = [(CNAutocompleteResultsTableViewController *)self _flattenedIndexPaths];
  if ([v7 count])
  {
    id v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
    id v4 = [v3 indexPathForSelectedRow];

    if (v4)
    {
      unint64_t v5 = [v7 indexOfObject:v4] + 1;
      if (v5 >= [v7 count])
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v6 = [v7 objectAtIndex:v5];

      id v4 = (void *)v6;
    }
    else
    {
      id v4 = [v7 firstObject];
    }
    [(CNAutocompleteResultsTableViewController *)self selectRowAtIndexPath:v4];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)selectPreviousSearchResult
{
  id v7 = [(CNAutocompleteResultsTableViewController *)self _flattenedIndexPaths];
  if ([v7 count])
  {
    id v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
    id v4 = [v3 indexPathForSelectedRow];

    if (v4)
    {
      uint64_t v5 = [v7 indexOfObject:v4];
      if (!v5)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v6 = [v7 objectAtIndex:v5 - 1];

      id v4 = (void *)v6;
    }
    else
    {
      id v4 = [v7 lastObject];
    }
    [(CNAutocompleteResultsTableViewController *)self selectRowAtIndexPath:v4];
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)confirmSelectedRecipient
{
  id v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
  id v4 = [v3 indexPathForSelectedRow];

  if (v4
    && ([(CNAutocompleteResultsTableViewController *)self tableView],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isHidden],
        v5,
        (v6 & 1) == 0))
  {
    [(CNAutocompleteResultsTableViewController *)self _selectSearchResultsRecipientAtIndexPath:v4];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)expandSelectedRecipient
{
  return [(CNAutocompleteResultsTableViewController *)self attemptDisambiguationToggleAtSelectedRowIsExpand:1];
}

- (BOOL)collapseSelectedRecipient
{
  return [(CNAutocompleteResultsTableViewController *)self attemptDisambiguationToggleAtSelectedRowIsExpand:0];
}

- (BOOL)attemptDisambiguationToggleAtSelectedRowIsExpand:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CNAutocompleteResultsTableViewController *)self tableView];
  char v6 = [v5 indexPathForSelectedRow];

  BOOL v7 = [(CNAutocompleteResultsTableViewController *)self tableView];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  if (!v3)
  {
    if (![v8 canCollapseRecipient]) {
      goto LABEL_3;
    }
LABEL_5:
    [(CNAutocompleteResultsTableViewController *)self didToggleDisambiguationAtIndexPath:v6];
    BOOL v9 = 1;
    goto LABEL_6;
  }
  if ([v8 canExpandRecipient]) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(_CNAutocompleteResultsTableViewModel *)self->_tableViewModel numberOfSections];
}

- (id)_combinedResults
{
  v8[3] = *MEMORY[0x1E4F143B8];
  searchResults = self->_searchResults;
  suggestedSearchResults = self->_suggestedSearchResults;
  serverSearchResults = self->_serverSearchResults;
  if (!searchResults) {
    searchResults = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
  if (!suggestedSearchResults) {
    suggestedSearchResults = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
  v8[0] = searchResults;
  v8[1] = suggestedSearchResults;
  if (serverSearchResults) {
    uint64_t v5 = serverSearchResults;
  }
  else {
    uint64_t v5 = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
  v8[2] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (id)_indexPathForRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  tableViewModel = self->_tableViewModel;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CNAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke;
  v9[3] = &unk_1E6128298;
  uint64_t v11 = &v17;
  id v6 = v4;
  id v10 = v6;
  id v12 = &v13;
  [(_CNAutocompleteResultsTableViewModel *)tableViewModel enumerateSections:v9];
  BOOL v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v18[3] inSection:v14[3]];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __67__CNAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 indexOfObject:a1[4]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  if (*(void *)(*(void *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)_recipientAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_CNAutocompleteResultsTableViewModel *)self->_tableViewModel numberOfSections];
  if (v5 <= [v4 section])
  {
    BOOL v9 = 0;
  }
  else
  {
    id v6 = -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", [v4 section]);
    unint64_t v7 = [v6 count];
    if (v7 <= [v4 row])
    {
      BOOL v9 = 0;
    }
    else
    {
      id v8 = -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", [v4 section]);
      BOOL v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    }
  }

  return v9;
}

- (id)_unifiedRecipientForRecipientAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v4];
  uint64_t v6 = [v4 row];
  if (v6 < 0)
  {
LABEL_7:
    id v16 = 0;
  }
  else
  {
    uint64_t v7 = v6;
    while (1)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v7, objc_msgSend(v4, "section"));
      BOOL v9 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v8];

      id v10 = [(CNAutocompleteResultsTableViewController *)self unificationIdentifierForRecipient:v9];
      uint64_t v11 = [(CNAutocompleteResultsTableViewController *)self unificationIdentifierForRecipient:v5];
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
        id v16 = 0;
        goto LABEL_10;
      }
      uint64_t v13 = [v9 children];
      uint64_t v14 = [v13 count];

      if (v14) {
        break;
      }

      if (v7-- <= 0) {
        goto LABEL_7;
      }
    }
    id v16 = v9;
LABEL_10:
  }

  return v16;
}

- (id)_parentRecipientForRecipientAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v4];
  if ([v5 isMemberOfGroup])
  {
    uint64_t v6 = [v4 row];
    if (v6 < 0)
    {
LABEL_7:
      BOOL v9 = 0;
    }
    else
    {
      uint64_t v7 = v6;
      while (1)
      {
        id v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v7, objc_msgSend(v4, "section"));
        BOOL v9 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v8];

        if (![v9 isMemberOfGroup]) {
          break;
        }

        if (v7-- <= 0) {
          goto LABEL_7;
        }
      }
    }
  }
  else
  {
    BOOL v9 = [(CNAutocompleteResultsTableViewController *)self _unifiedRecipientForRecipientAtIndexPath:v4];
  }

  return v9;
}

- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v4];
    uint64_t v7 = v6;
    if (![(CNComposeRecipient *)v6 isGroup])
    {
      id v8 = [(CNAutocompleteResultsTableViewController *)self _unifiedRecipientForRecipientAtIndexPath:v4];
      BOOL v9 = [v8 children];

      uint64_t v7 = v6;
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v7 = [[CNUnifiedComposeRecipient alloc] initWithChildren:v9 defaultChild:v6];
      }
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v10 = [(CNUnifiedComposeRecipient *)v7 children];
      uint64_t v11 = [v10 arrayByAddingObject:v7];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v110 objects:v114 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v111 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v110 + 1) + 8 * i) setIsMemberOfGroup:0];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v110 objects:v114 count:16];
        }
        while (v13);
      }
    }
    BOOL v16 = [(CNAutocompleteResultsTableViewController *)self recipientIsExpanded:v6];
    uint64_t v17 = [(CNAutocompleteResultsTableViewController *)self tableView];
    id v18 = [v17 cellForRowAtIndexPath:v4];

    if ([(CNAutocompleteResultsTableViewController *)self recipientIsDisambiguationRecipient:v6])
    {
      id v19 = v18;
      if (v19) {
        BOOL v20 = v16;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        int v21 = [(CNAutocompleteResultsTableViewController *)self tableView];
        [v21 setUserInteractionEnabled:0];

        id v22 = [(CNAutocompleteResultsTableViewController *)self _unifiedRecipientForRecipientAtIndexPath:v4];
        uint64_t v23 = [v22 children];
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke;
        v108[3] = &unk_1E6128188;
        id v109 = v22;
        id v94 = v22;
        uint64_t v24 = objc_msgSend(v23, "_cn_firstObjectPassingTest:", v108);

        uint64_t v25 = [(CNAutocompleteResultsTableViewController *)self _indexPathForRecipient:v24];
        v92 = (void *)v25;
        v93 = (void *)v24;
        if (v24)
        {
          uint64_t v26 = v25;
          uint64_t v27 = [(CNAutocompleteResultsTableViewController *)self tableView];
          v28 = [v27 cellForRowAtIndexPath:v26];

          v91 = v28;
          if (v28)
          {
            [v28 setCheckmarkVisible:0];
            v29 = [(CNAutocompleteResultsTableViewController *)self view];
            v30 = [v28 checkmarkView];
            [v30 bounds];
            double v32 = v31;
            double v34 = v33;
            double v36 = v35;
            double v38 = v37;
            uint64_t v39 = [v28 checkmarkView];
            objc_msgSend(v29, "convertRect:fromView:", v39, v32, v34, v36, v38);
            double v41 = v40;
            double MinY = v42;
            double v45 = v44;
            double v47 = v46;
          }
          else
          {
            uint64_t v48 = v26;
            id v49 = [(CNAutocompleteResultsTableViewController *)self view];
            v90 = [v19 checkmarkView];
            [v90 bounds];
            double v51 = v50;
            double v53 = v52;
            double v55 = v54;
            double v57 = v56;
            long long v58 = [v19 checkmarkView];
            objc_msgSend(v49, "convertRect:fromView:", v58, v51, v53, v55, v57);
            double v41 = v59;
            double v45 = v60;
            double v47 = v61;

            v29 = [(CNAutocompleteResultsTableViewController *)self tableView];
            [v29 rectForRowAtIndexPath:v48];
            double MinY = CGRectGetMinY(v116);
          }
        }
        else
        {
          double v41 = *MEMORY[0x1E4F1DB20];
          double MinY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          double v45 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          double v47 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        }
        long long v62 = [(CNAutocompleteResultsTableViewController *)self view];
        long long v63 = [v19 checkmarkView];
        [v63 bounds];
        double v65 = v64;
        double v67 = v66;
        double v69 = v68;
        double v71 = v70;
        v72 = [v19 checkmarkView];
        objc_msgSend(v62, "convertRect:fromView:", v72, v65, v67, v69, v71);
        double v74 = v73;
        double v76 = v75;
        double v78 = v77;
        double v80 = v79;

        v81 = +[CNAutocompleteDisambiguatingTableViewCell createCheckmarkView];
        objc_msgSend(v81, "setFrame:", v41, MinY, v45, v47);
        v82 = [(CNAutocompleteResultsTableViewController *)self view];
        [v82 addSubview:v81];

        v117.origin.x = v41;
        v117.origin.y = MinY;
        v117.size.width = v45;
        v117.size.height = v47;
        BOOL IsNull = CGRectIsNull(v117);
        if (IsNull) {
          double v84 = v80;
        }
        else {
          double v84 = v47;
        }
        if (IsNull) {
          double v85 = v78;
        }
        else {
          double v85 = v45;
        }
        if (IsNull) {
          double v86 = v76;
        }
        else {
          double v86 = MinY;
        }
        if (IsNull) {
          double v87 = v74;
        }
        else {
          double v87 = v41;
        }
        objc_msgSend(v81, "setFrame:", v87, v86, v85, v84);
        v118.origin.x = v41;
        v118.origin.y = MinY;
        v118.size.width = v45;
        v118.size.height = v47;
        [v81 setAlpha:(double)!CGRectIsNull(v118)];
        v88 = (void *)MEMORY[0x1E4F42FF0];
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_2;
        v102[3] = &unk_1E61282C0;
        id v103 = v81;
        double v104 = v74;
        double v105 = v76;
        double v106 = v78;
        double v107 = v80;
        v95[0] = MEMORY[0x1E4F143A8];
        v95[1] = 3221225472;
        v95[2] = __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_3;
        v95[3] = &unk_1E61282E8;
        id v96 = v103;
        id v19 = v19;
        id v97 = v19;
        v98 = self;
        id v99 = WeakRetained;
        v100 = v7;
        id v101 = v4;
        id v89 = v103;
        [v88 _animateUsingDefaultTimingWithOptions:0 animations:v102 completion:v95];

        goto LABEL_39;
      }
    }
    else
    {
      id v19 = 0;
    }
    objc_msgSend(WeakRetained, "autocompleteResultsController:didSelectRecipient:atIndex:", self, v7, objc_msgSend(v4, "row"));
LABEL_39:
    [(CNAutocompleteResultsTableViewController *)self endDisplayOfVisibleCellsExcludingIndexPath:v4];
  }
}

uint64_t __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 address];
  id v4 = [*(id *)(a1 + 32) address];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:1.0];
}

uint64_t __85__CNAutocompleteResultsTableViewController__selectSearchResultsRecipientAtIndexPath___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) setCheckmarkVisible:1];
  v2 = [*(id *)(a1 + 48) tableView];
  [v2 setUserInteractionEnabled:1];

  [*(id *)(a1 + 48) setInDisambiguationMode:0];
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = [*(id *)(a1 + 72) row];

  return [v3 autocompleteResultsController:v4 didSelectRecipient:v5 atIndex:v6];
}

- (void)endDisplayOfVisibleCellsExcludingIndexPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNAutocompleteResultsTableViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(CNAutocompleteResultsTableViewController *)self tableView];
    id v8 = [v7 indexPathsForVisibleRows];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v13 isEqual:v4] & 1) == 0) {
            [(CNAutocompleteResultsTableViewController *)self callEndDisplayingRowForRecipientIndex:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)invalidateSearchResultRecipient:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CNAutocompleteResultsTableViewController *)self _indexPathForRecipient:a3];
  if ([v4 row] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(CNAutocompleteResultsTableViewController *)self tableView];
    [v5 beginUpdates];

    char v6 = [(CNAutocompleteResultsTableViewController *)self tableView];
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v6 deleteRowsAtIndexPaths:v7 withRowAnimation:2];

    id v8 = -[_CNAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", [v4 section]);
    objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v4, "row"));

    uint64_t v9 = [(CNAutocompleteResultsTableViewController *)self tableView];
    [v9 endUpdates];
  }
}

- (void)didTapDisambiguationChevronForCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAutocompleteResultsTableViewController *)self tableView];
  id v7 = [v5 indexPathForCell:v4];

  char v6 = v7;
  if (v7)
  {
    [(CNAutocompleteResultsTableViewController *)self didToggleDisambiguationAtIndexPath:v7];
    char v6 = v7;
  }
}

- (void)didToggleDisambiguationAtIndexPath:(id)a3
{
  id v4 = a3;
  [(CNAutocompleteResultsTableViewController *)self setHasPerformedRecipientExpansion:1];
  double v47 = v4;
  uint64_t v5 = [(CNAutocompleteResultsTableViewController *)self _parentRecipientForRecipientAtIndexPath:v4];
  char v6 = [(CNAutocompleteResultsTableViewController *)self _indexPathForRecipient:v5];
  double v45 = [(CNAutocompleteResultsTableViewController *)self unificationIdentifierForRecipient:v5];
  BOOL v7 = [(CNAutocompleteResultsTableViewController *)self recipientIsExpanded:v5];
  id v8 = [(CNAutocompleteResultsTableViewController *)self delegate];
  if (v7)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(CNAutocompleteResultsTableViewController *)self delegate];
      [v10 autocompleteResultsController:self willCollapseSelectedRecipient:v5];
      uint64_t v11 = 2;
LABEL_6:

      goto LABEL_9;
    }
    uint64_t v11 = 2;
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v10 = [(CNAutocompleteResultsTableViewController *)self delegate];
      [v10 autocompleteResultsController:self willExpandSelectedRecipient:v5];
      uint64_t v11 = 3;
      goto LABEL_6;
    }
    uint64_t v11 = 3;
  }
LABEL_9:
  BOOL v48 = v7;
  BOOL v44 = !v7;
  uint64_t v13 = [(CNAutocompleteResultsTableViewController *)self tableView];
  long long v14 = [v13 cellForRowAtIndexPath:v6];

  id v49 = v14;
  [v14 setActionType:v11 animated:1];
  uint64_t v15 = [v6 row] + 1;
  long long v16 = [v5 children];
  uint64_t v17 = [v16 count];

  id v18 = [(CNAutocompleteResultsTableViewController *)self delegate];
  int v19 = objc_opt_respondsToSelector();

  BOOL v20 = objc_opt_new();
  if (v17)
  {
    int v21 = v48 & v19;
    uint64_t v22 = v15;
    uint64_t v23 = v17;
    do
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v22, objc_msgSend(v6, "section"));
      [v20 addObject:v24];
      if (v21) {
        [(CNAutocompleteResultsTableViewController *)self callEndDisplayingRowForRecipientIndex:v24];
      }

      ++v22;
      --v23;
    }
    while (v23);
  }
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v15, v17);
  uint64_t v26 = -[_CNAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", [v6 section]);
  if (v48) {
    self->_ignoreDidEndDisplayingCell = 1;
  }
  uint64_t v27 = [(CNAutocompleteResultsTableViewController *)self tableView];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke;
  v51[3] = &unk_1E6128310;
  BOOL v57 = v44;
  v51[4] = self;
  id v46 = v45;
  id v52 = v46;
  id v28 = v26;
  id v53 = v28;
  id v29 = v5;
  id v54 = v29;
  id v30 = v25;
  id v55 = v30;
  id v31 = v20;
  id v56 = v31;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke_2;
  v50[3] = &unk_1E6128338;
  v50[4] = self;
  [v27 performBatchUpdates:v51 completion:v50];

  double v32 = [(CNAutocompleteResultsTableViewController *)self delegate];
  if (v48)
  {
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      double v34 = [(CNAutocompleteResultsTableViewController *)self delegate];
      [v34 autocompleteResultsController:self didCollapseSelectedRecipient:v29];
    }
    if ((v48 & [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode]) == 1) {
      [(CNAutocompleteResultsTableViewController *)self selectRowAtIndexPath:v6];
    }
  }
  else
  {
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      double v36 = [(CNAutocompleteResultsTableViewController *)self delegate];
      [v36 autocompleteResultsController:self didExpandSelectedRecipient:v29];
    }
    [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode];
  }
  double v37 = v49;
  if (v49) {
    [(CNAutocompleteResultsTableViewController *)self updateBackgroundAndSeparatorsForCell:v49 atIndexPath:v6];
  }
  if ([v6 row] >= 1)
  {
    double v38 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v39 = [v6 row];
    if (v39 <= 1) {
      uint64_t v40 = 1;
    }
    else {
      uint64_t v40 = v39;
    }
    double v41 = objc_msgSend(v38, "indexPathForRow:inSection:", v40 - 1, objc_msgSend(v6, "section"));
    double v42 = [(CNAutocompleteResultsTableViewController *)self tableView];
    long long v43 = [v42 cellForRowAtIndexPath:v41];

    if (v43) {
      [(CNAutocompleteResultsTableViewController *)self updateBackgroundAndSeparatorsForCell:v43 atIndexPath:v41];
    }

    double v37 = v49;
  }
}

void __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  BOOL v3 = [*(id *)(a1 + 32) expandedIdentifiers];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2)
  {
    [v3 addObject:v5];

    char v6 = *(void **)(a1 + 48);
    BOOL v7 = [*(id *)(a1 + 56) sortedChildren];
    [v6 insertObjects:v7 atIndexes:*(void *)(a1 + 64)];

    id v8 = [*(id *)(a1 + 32) tableView];
    [v8 insertRowsAtIndexPaths:*(void *)(a1 + 72) withRowAnimation:3];
  }
  else
  {
    [v3 removeObject:v5];

    [*(id *)(a1 + 48) removeObjectsAtIndexes:*(void *)(a1 + 64)];
    id v8 = [*(id *)(a1 + 32) tableView];
    [v8 deleteRowsAtIndexPaths:*(void *)(a1 + 72) withRowAnimation:3];
  }
}

uint64_t __79__CNAutocompleteResultsTableViewController_didToggleDisambiguationAtIndexPath___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1057) = 0;
  return result;
}

- (BOOL)willProvideOverrideImageDataForCell:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNAutocompleteResultsTableViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(CNAutocompleteResultsTableViewController *)self delegate];
    uint64_t v11 = [v6 recipient];
    char v12 = [v10 autocompleteResultsController:self willOverrideImageDataForRecipient:v11 completion:v7];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (double)_tableViewHeaderHeight
{
  int v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  [v2 _bodyLeading];
  double v4 = v3;

  return v4 * 0.444444444 + v4 * 2.44444444;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 1
    || ([(_CNAutocompleteResultsTableViewModel *)self->_tableViewModel sectionAtIndex:a4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    char v12 = 0;
    goto LABEL_13;
  }
  if (a4 == 2)
  {
    char v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = v9;
    uint64_t v11 = @"FOUND_ON_SERVERS";
  }
  else
  {
    if (a4 != 1)
    {
      uint64_t v13 = 0;
      goto LABEL_10;
    }
    char v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = v9;
    uint64_t v11 = @"FOUND_IN_MAIL";
  }
  uint64_t v13 = [v9 localizedStringForKey:v11 value:&stru_1F0EC0C28 table:@"Localized"];

LABEL_10:
  uint64_t v14 = MEMORY[0x1E4F1DB28];
  double v15 = *MEMORY[0x1E4F1DB28];
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [v6 frame];
  double v18 = v17;
  [(CNAutocompleteResultsTableViewController *)self _tableViewHeaderHeight];
  char v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v15, v16, v18, v19);
  BOOL v20 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v12 setBackgroundColor:v20];

  int v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v15, v16, *(double *)(v14 + 16), *(double *)(v14 + 24));
  uint64_t v23 = [v13 localizedUppercaseString];
  [v22 setText:v23];

  [v22 setFont:v21];
  uint64_t v24 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [v22 setTextColor:v24];

  [v22 setAdjustsFontSizeToFitWidth:1];
  [v21 _bodyLeading];
  double v26 = v25 * -0.444444444;
  objc_msgSend(v12, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v28 = v27;
  [v12 frame];
  double v30 = v29 - v28 + v26;
  [v6 layoutMargins];
  double v32 = v31;
  [v12 frame];
  double v34 = v33;
  [v6 layoutMargins];
  double v36 = v34 - v35;
  [v6 layoutMargins];
  double v38 = v36 - v37;
  if (objc_msgSend(MEMORY[0x1E4F42FF0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute")) == 1)
  {
    [v6 bounds];
    double MaxX = CGRectGetMaxX(v43);
    v44.origin.x = v32;
    v44.origin.y = v30;
    v44.size.width = v38;
    v44.size.height = v28;
    double v40 = MaxX - CGRectGetWidth(v44);
    v45.origin.x = v32;
    v45.origin.y = v30;
    v45.size.width = v38;
    v45.size.height = v28;
    double v32 = v40 - CGRectGetMinX(v45);
  }
  objc_msgSend(v22, "setFrame:", v32, v30, v38, v28);
  [v12 addSubview:v22];

LABEL_13:

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4
    && ([(_CNAutocompleteResultsTableViewModel *)self->_tableViewModel sectionAtIndex:a4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    [(CNAutocompleteResultsTableViewController *)self _tableViewHeaderHeight];
    double v10 = v9;
  }
  else
  {
    double v10 = 2.22507386e-308;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.22507386e-308;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(_CNAutocompleteResultsTableViewModel *)self->_tableViewModel objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)viewLayoutMarginsDidChange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteResultsTableViewController;
  [(CNAutocompleteResultsTableViewController *)&v16 viewLayoutMarginsDidChange];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
  double v4 = [v3 indexPathsForVisibleRows];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        double v10 = [(CNAutocompleteResultsTableViewController *)self tableView];
        uint64_t v11 = [v10 cellForRowAtIndexPath:v9];

        if (v11) {
          [(CNAutocompleteResultsTableViewController *)self updateBackgroundAndSeparatorsForCell:v11 atIndexPath:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a5;
  -[CNAutocompleteResultsTableViewController updateBackgroundAndSeparatorsForCell:atIndexPath:](self, "updateBackgroundAndSeparatorsForCell:atIndexPath:", a4);
  uint64_t v7 = [(CNAutocompleteResultsTableViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v11];
    double v10 = [(CNAutocompleteResultsTableViewController *)self delegate];
    [v10 autocompleteResultsController:self willDisplayRowForRecipient:v9];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = v6;
  if (!self->_ignoreDidEndDisplayingCell)
  {
    id v10 = v6;
    char v8 = [(CNAutocompleteResultsTableViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    id v7 = v10;
    if (v9)
    {
      id v6 = (id)[(CNAutocompleteResultsTableViewController *)self callEndDisplayingRowForRecipientIndex:v10];
      id v7 = v10;
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)callEndDisplayingRowForRecipientIndex:(id)a3
{
  double v4 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:a3];
  if (v4)
  {
    uint64_t v5 = [(CNAutocompleteResultsTableViewController *)self delegate];
    [v5 autocompleteResultsController:self didEndDisplayingRowForRecipient:v4];
  }
  else
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNAutocompleteResultsTableViewController callEndDisplayingRowForRecipientIndex:](v6);
    }
  }
}

+ (BOOL)shouldUseTransparentCell
{
  v6[2] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F28B50] mainBundle];
  double v3 = [v2 bundleIdentifier];

  v6[0] = @"com.apple.siri";
  v6[1] = @"com.apple.Spotlight";
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  LOBYTE(v2) = [v4 containsObject:v3];

  return (char)v2;
}

- (void)updateBackgroundAndSeparatorsForCell:(id)a3 atIndexPath:(id)a4
{
  id v48 = a3;
  id v9 = a4;
  uint64_t v10 = [v48 recipient];
  BOOL v45 = [(CNAutocompleteResultsTableViewController *)self recipientIsExpandedParent:v10];
  double v47 = (void *)v10;
  BOOL v11 = [(CNAutocompleteResultsTableViewController *)self recipientIsExpandedChild:v10];
  uint64_t v44 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  uint64_t v46 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
  long long v12 = [(CNAutocompleteResultsTableViewController *)self view];
  long long v13 = [v12 backgroundColor];
  if (!v13)
  {
    uint64_t v42 = [MEMORY[0x1E4F428B8] clearColor];
    if (!v42)
    {
      int v14 = 0;
      CGRect v43 = 0;
LABEL_7:
      int v15 = [(id)objc_opt_class() shouldUseTransparentCell];
      if (!v14) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  double v4 = [(CNAutocompleteResultsTableViewController *)self view];
  uint64_t v5 = [v4 backgroundColor];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  if ([v5 isEqual:v6])
  {
    int v14 = 1;
    goto LABEL_7;
  }
  int v15 = 0;
LABEL_8:

LABEL_9:
  if (!v13)
  {

    objc_super v16 = (void *)v44;
    if (v15) {
      goto LABEL_11;
    }
LABEL_13:
    double v19 = (void *)v46;
    BOOL v20 = v45;
    if (v11)
    {
      [v48 setBackgroundColor:v16];
    }
    else
    {
      int v21 = [(CNAutocompleteResultsTableViewController *)self view];
      uint64_t v22 = [v21 backgroundColor];
      [v48 setBackgroundColor:v22];
    }
    goto LABEL_16;
  }

  objc_super v16 = (void *)v44;
  if (!v15) {
    goto LABEL_13;
  }
LABEL_11:
  double v17 = objc_msgSend(MEMORY[0x1E4F428B8], "clearColor", v43);
  uint64_t v18 = [v48 backgroundView];
  [v18 setBackgroundColor:v17];

  double v19 = (void *)v46;
  BOOL v20 = v45;
LABEL_16:
  if (v20) {
    uint64_t v23 = v19;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = objc_msgSend(v48, "contentView", v43);
  [v24 setBackgroundColor:v23];

  double v25 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v26 = [v9 row] + 1;
  uint64_t v27 = [v9 section];

  double v28 = [v25 indexPathForRow:v26 inSection:v27];
  double v29 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v28];

  if (v11) {
    int v30 = ![(CNAutocompleteResultsTableViewController *)self recipientIsExpandedChild:v29];
  }
  else {
    int v30 = 0;
  }
  int v31 = [(CNAutocompleteResultsTableViewController *)self recipientIsExpandedParent:v29] | v30;
  if (v31 == 1)
  {
    double v32 = *MEMORY[0x1E4F437F8];
    double v33 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v34 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v35 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    double v36 = v48;
  }
  else
  {
    double v35 = *MEMORY[0x1E4F43D18];
    double v28 = [(CNAutocompleteResultsTableViewController *)self view];
    [v28 layoutMargins];
    double v38 = v37;
    [(id)objc_opt_class() additionalSeparatorInset];
    double v36 = v48;
    double v33 = v38 + v39;
    double v34 = v35;
    double v32 = v35;
  }
  objc_msgSend(v36, "setSeparatorInset:", v32, v33, v34, v35);
  if ((v31 & 1) == 0) {

  }
  if (v20)
  {
    double v40 = [MEMORY[0x1E4F428B8] clearColor];
    [v48 setSeparatorColor:v40];
  }
  else
  {
    double v40 = [(CNAutocompleteResultsTableViewController *)self tableView];
    double v41 = [v40 separatorColor];
    [v48 setSeparatorColor:v41];
  }
}

- (BOOL)recipientIsExpandedParent:(id)a3
{
  id v4 = a3;
  if ([(CNAutocompleteResultsTableViewController *)self recipientIsExpanded:v4])
  {
    uint64_t v5 = [v4 children];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)recipientIsExpandedChild:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfGroup])
  {
    BOOL v5 = 1;
  }
  else if ([(CNAutocompleteResultsTableViewController *)self recipientIsExpanded:v4])
  {
    BOOL v6 = [v4 children];
    BOOL v5 = [v6 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)recipientIsExpanded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNAutocompleteResultsTableViewController *)self expandedIdentifiers];
  BOOL v6 = [(CNAutocompleteResultsTableViewController *)self unificationIdentifierForRecipient:v4];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (BOOL)recipientIsDisambiguationRecipient:(id)a3
{
  id v4 = a3;
  if ([(CNAutocompleteResultsTableViewController *)self recipientIsExpanded:v4])
  {
    BOOL v5 = [v4 children];
    if ([v5 count]) {
      LOBYTE(v6) = 0;
    }
    else {
      int v6 = [v4 isMemberOfGroup] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v7];
  BOOL v9 = [(CNAutocompleteResultsTableViewController *)self recipientIsExpanded:v8];
  if ([(CNAutocompleteResultsTableViewController *)self recipientIsDisambiguationRecipient:v8])
  {
    uint64_t v10 = +[CNAutocompleteDisambiguatingTableViewCell identifier];
    BOOL v11 = [v6 dequeueReusableCellWithIdentifier:v10];

    if (!v11)
    {
      long long v12 = [CNAutocompleteDisambiguatingTableViewCell alloc];
      long long v13 = +[CNAutocompleteDisambiguatingTableViewCell identifier];
      BOOL v11 = [(CNAutocompleteDisambiguatingTableViewCell *)v12 initWithStyle:0 reuseIdentifier:v13];
    }
    int v14 = [v8 address];
    int v15 = [(CNAutocompleteResultsTableViewController *)self _unifiedRecipientForRecipientAtIndexPath:v7];
    objc_super v16 = [v15 address];
    -[CNAutocompleteDisambiguatingTableViewCell setCheckmarkVisible:](v11, "setCheckmarkVisible:", [v14 isEqualToString:v16]);

LABEL_22:
    goto LABEL_31;
  }
  if ([v8 isMemberOfGroup])
  {
    double v17 = +[CNAutocompleteGroupExpansionTableViewCell identifier];
    BOOL v11 = [v6 dequeueReusableCellWithIdentifier:v17];

    if (!v11)
    {
      uint64_t v18 = [CNAutocompleteGroupExpansionTableViewCell alloc];
      double v19 = +[CNAutocompleteGroupExpansionTableViewCell identifier];
      BOOL v11 = [(CNAutocompleteGroupExpansionTableViewCell *)v18 initWithStyle:0 reuseIdentifier:v19];
    }
    if ([(CNAutocompleteResultsTableViewController *)self supportsInfoButton]) {
      uint64_t v20 = [(CNAutocompleteResultsTableViewController *)self shouldHideInfoButton] ^ 1;
    }
    else {
      uint64_t v20 = 0;
    }
    [(CNAutocompleteDisambiguatingTableViewCell *)v11 setActionType:v20 animated:0];
    [(CNAutocompleteDisambiguatingTableViewCell *)v11 setDelegate:self];
    int v14 = [(CNAutocompleteResultsTableViewController *)self sharedAvatarViewControllerSettings];
    [(CNAutocompleteDisambiguatingTableViewCell *)v11 setupAvatarViewControllerWithSettings:v14];
    goto LABEL_22;
  }
  int v21 = +[CNComposeRecipientTableViewCell identifier];
  BOOL v11 = [v6 dequeueReusableCellWithIdentifier:v21];

  if (!v11)
  {
    uint64_t v22 = [CNComposeRecipientTableViewCell alloc];
    uint64_t v23 = +[CNComposeRecipientTableViewCell identifier];
    BOOL v11 = [(CNComposeRecipientTableViewCell *)v22 initWithStyle:0 reuseIdentifier:v23];
  }
  [(CNAutocompleteDisambiguatingTableViewCell *)v11 setDelegate:self];
  uint64_t v24 = [(CNAutocompleteResultsTableViewController *)self sharedAvatarViewControllerSettings];
  [(CNAutocompleteDisambiguatingTableViewCell *)v11 setupAvatarViewControllerWithSettings:v24];

  if ([(CNAutocompleteResultsTableViewController *)self inDisambiguationMode]
    && ![v8 isGroup]
    || ([v8 isMemberOfGroup] & 1) != 0)
  {
LABEL_25:
    uint64_t v25 = 1;
    goto LABEL_26;
  }
  if ([(CNAutocompleteResultsTableViewController *)self inDisambiguationMode]
    || ![v8 showsChevronButton])
  {
    if (([v8 isSuggestedRecipient] & 1) == 0
      && ([v8 isRemovableFromSearchResults] & 1) == 0)
    {
      if ([v8 kind] == 6 || objc_msgSend(v8, "kind") == 7) {
        uint64_t v25 = 4;
      }
      else {
        uint64_t v25 = 0;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v9) {
    uint64_t v25 = 3;
  }
  else {
    uint64_t v25 = 2;
  }
LABEL_26:
  if ((![(CNAutocompleteResultsTableViewController *)self supportsInfoButton]
     || [(CNAutocompleteResultsTableViewController *)self shouldHideInfoButton])
    && v25 == 1)
  {
    uint64_t v25 = 0;
  }
  [(CNAutocompleteDisambiguatingTableViewCell *)v11 setActionType:v25 animated:0];
LABEL_31:
  [(CNAutocompleteDisambiguatingTableViewCell *)v11 setRecipient:v8];
  [(CNComposeTableViewCell *)v11 setLabelColor:0];
  uint64_t v26 = [v8 address];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    double v28 = [(CNAutocompleteResultsTableViewController *)self unificationIdentifierForRecipient:v8];
    if (!v28) {
      LOBYTE(v9) = 0;
    }

    if (v9) {
      goto LABEL_36;
    }
  }
  if (![(CNAutocompleteResultsTableViewController *)self updatePreferredRecipientForCell:v11 isInvalidation:0])LABEL_36:[(CNAutocompleteResultsTableViewController *)self updateLabelColorForCell:v11]; {
  [(CNAutocompleteResultsTableViewController *)self trailingButtonMidlineInsetFromLayoutMargin];
  }
  [(CNComposeTableViewCell *)v11 setTrailingButtonMidlineInsetFromLayoutMargin:"setTrailingButtonMidlineInsetFromLayoutMargin:"];

  return v11;
}

- (void)setTintColor:(id)a3 forRecipient:(id)a4
{
  id v9 = a3;
  id v6 = [(CNAutocompleteResultsTableViewController *)self _indexPathForRecipient:a4];
  id v7 = [(CNAutocompleteResultsTableViewController *)self tableView];
  char v8 = [v7 cellForRowAtIndexPath:v6];

  if (v8) {
    [v8 setLabelColor:v9];
  }
}

- (void)setPreferredRecipient:(id)a3 forRecipient:(id)a4
{
  id v12 = a3;
  id v6 = [(CNAutocompleteResultsTableViewController *)self _indexPathForRecipient:a4];
  id v7 = [(CNAutocompleteResultsTableViewController *)self tableView];
  char v8 = [v7 cellForRowAtIndexPath:v6];

  if (v8)
  {
    id v9 = [v8 recipient];
    if (([v9 isGroup] & 1) == 0)
    {
      uint64_t v10 = [v9 children];
      unint64_t v11 = [v10 count];

      if (v12)
      {
        if (v11 >= 2) {
          [(CNAutocompleteResultsTableViewController *)self updateCell:v8 withPreferredRecipient:v12 isInvalidation:1];
        }
      }
    }
  }
}

- (void)invalidateAddressTintColors
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CNAutocompleteResultsTableViewController *)self updateLabelColorForCell:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)invalidatePreferredRecipients
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(CNAutocompleteResultsTableViewController *)self tableView];
  id v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CNAutocompleteResultsTableViewController *)self updatePreferredRecipientForCell:*(void *)(*((void *)&v9 + 1) + 8 * v8++) isInvalidation:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)dispatchMainIfNecessary:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  id v4 = [v3 currentThread];
  int v5 = [v4 isMainThread];

  if (v5) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)updateLabelColorForCell:(id)a3
{
  id v4 = a3;
  int v5 = [v4 recipient];
  if ([v5 kind] == 6 || objc_msgSend(v5, "kind") == 7)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemRedColor];
    [v4 setLabelColor:v6];
  }
  else
  {
    uint64_t v7 = [(CNAutocompleteResultsTableViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      long long v9 = [(CNAutocompleteResultsTableViewController *)self delegate];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke;
      v10[3] = &unk_1E6128398;
      v10[4] = self;
      id v11 = v5;
      id v12 = v4;
      [v9 autocompleteResultsController:self tintColorForRecipient:v11 completion:v10];
    }
  }
}

void __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke_2;
  void v6[3] = &unk_1E6128370;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v4 dispatchMainIfNecessary:v6];
}

void __68__CNAutocompleteResultsTableViewController_updateLabelColorForCell___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) recipient];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 setLabelColor:v5];
  }
}

- (BOOL)updatePreferredRecipientForCell:(id)a3 isInvalidation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 recipient];
  if (([v7 isGroup] & 1) == 0)
  {
    id v8 = [v7 children];
    unint64_t v9 = [v8 count];

    if (v9 >= 2)
    {
      long long v10 = [(CNAutocompleteResultsTableViewController *)self delegate];
      char v11 = objc_opt_respondsToSelector();

      id v12 = [(CNAutocompleteResultsTableViewController *)self delegate];
      long long v13 = v12;
      if (v11)
      {
        id v14 = [v12 autocompleteResultsController:self preferredRecipientForRecipient:v7];

        if (v7 == v14)
        {
          int v15 = 0;
        }
        else
        {
          id v14 = v14;
          int v15 = v14;
        }
        goto LABEL_11;
      }
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v14 = [(CNAutocompleteResultsTableViewController *)self delegate];
        double v17 = [v7 children];
        int v15 = [v14 autocompleteResultsController:self preferredRecipientForRecipients:v17];

LABEL_11:
        BOOL v18 = [(CNAutocompleteResultsTableViewController *)self updateCell:v6 withPreferredRecipient:v15 isInvalidation:v4];

        goto LABEL_9;
      }
    }
  }
  BOOL v18 = 0;
LABEL_9:

  return v18;
}

- (BOOL)updateCell:(id)a3 withPreferredRecipient:(id)a4 isInvalidation:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = [v8 recipient];
  char v11 = [v10 children];
  id v12 = (void *)[v11 mutableCopy];

  int v13 = [v12 containsObject:v9];
  if (v13)
  {
    [v12 removeObject:v9];
    objc_msgSend(v12, "_cn_insertNonNilObject:atIndex:", v9, 0);
    id v14 = [[CNUnifiedComposeRecipient alloc] initWithChildren:v12 defaultChild:v9];
    int v15 = [(CNAutocompleteResultsTableViewController *)self _indexPathForRecipient:v10];
    char v16 = -[_CNAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", [v15 section]);
    objc_msgSend(v16, "replaceObjectAtIndex:withObject:", objc_msgSend(v15, "row"), v14);

    [v8 setRecipient:v14];
    [(CNAutocompleteResultsTableViewController *)self updateLabelColorForCell:v8];
    if ([(CNAutocompleteResultsTableViewController *)self hasPerformedRecipientExpansion]&& v5)
    {
      int v31 = v15;
      double v32 = v14;
      double v33 = v12;
      char v34 = v13;
      double v35 = v10;
      id v36 = v8;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      double v17 = [(CNAutocompleteResultsTableViewController *)self tableView];
      BOOL v18 = [v17 indexPathsForVisibleRows];

      obuint64_t j = v18;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (!v19) {
        goto LABEL_19;
      }
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      while (1)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v24 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v23];
          if ([(CNAutocompleteResultsTableViewController *)self shouldShowCheckmarkForRecipient:v24 preferredRecipient:v9])
          {
            uint64_t v25 = [(CNAutocompleteResultsTableViewController *)self tableView];
            uint64_t v26 = [v25 cellForRowAtIndexPath:v23];

            uint64_t v27 = [v24 address];
            if (v27 || ([v9 address], (double v37 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              double v28 = [v24 address];
              double v29 = [v9 address];
              objc_msgSend(v26, "setCheckmarkVisible:", objc_msgSend(v28, "isEqual:", v29));

              if (!v27) {
LABEL_15:
              }

              goto LABEL_17;
            }
            [v26 setCheckmarkVisible:1];
            double v37 = 0;
            goto LABEL_15;
          }
LABEL_17:
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (!v20)
        {
LABEL_19:

          long long v10 = v35;
          id v8 = v36;
          LOBYTE(v13) = v34;
          id v14 = v32;
          id v12 = v33;
          int v15 = v31;
          break;
        }
      }
    }
  }
  return v13;
}

- (BOOL)shouldShowCheckmarkForRecipient:(id)a3 preferredRecipient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CNAutocompleteResultsTableViewController *)self tableView];
  int v10 = [v9 isUserInteractionEnabled];

  if (v10)
  {
    if (([v7 isMemberOfGroup] & 1) == 0)
    {
      char v11 = [v7 children];
      uint64_t v12 = [v11 count];

      if (!v12)
      {
        int v15 = [v7 contact];
        char v16 = [v15 identifier];
        if (v16
          || ([v8 contact],
              uint64_t v21 = objc_claimAutoreleasedReturnValue(),
              [v21 identifier],
              (BOOL v4 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v17 = [v7 contact];
          BOOL v18 = [v17 identifier];
          uint64_t v19 = [v8 contact];
          uint64_t v20 = [v19 identifier];
          char v13 = [v18 isEqual:v20];

          if (v16)
          {
LABEL_12:

            goto LABEL_5;
          }
        }
        else
        {
          char v13 = 1;
        }

        goto LABEL_12;
      }
    }
  }
  char v13 = 0;
LABEL_5:

  return v13;
}

- (void)didTapInfoButtonForCell:(id)a3
{
  id v5 = [a3 recipient];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained autocompleteResultsController:self didRequestInfoAboutRecipient:v5];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  [(CNAutocompleteResultsTableViewController *)self _selectSearchResultsRecipientAtIndexPath:v6];
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(CNAutocompleteResultsTableViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CNAutocompleteResultsTableViewController *)self _recipientAtIndexPath:v5];
    if ([v8 isRemovableFromSearchResults])
    {
      id v9 = (void *)MEMORY[0x1E4F42900];
      int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v11 = [v10 localizedStringForKey:@"REMOVE_TITLE" value:&stru_1F0EC0C28 table:@"Localized"];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
      v17[3] = &unk_1E6128438;
      id v18 = v8;
      uint64_t v19 = self;
      id v20 = v5;
      uint64_t v12 = [v9 contextualActionWithStyle:1 title:v11 handler:v17];

      char v13 = (void *)MEMORY[0x1E4F42E68];
      v21[0] = v12;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      int v15 = [v13 configurationWithActions:v14];
    }
    else
    {
      int v15 = 0;
    }
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

void __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v27 = a4;
  id v6 = (void *)MEMORY[0x1E4F42728];
  char v7 = (void *)MEMORY[0x1E4F28B50];
  id v8 = a3;
  id v9 = [v7 bundleForClass:objc_opt_class()];
  if ([a1[4] isGroup]) {
    int v10 = @"REMOVE_RECENT_GROUP_CONFIRM";
  }
  else {
    int v10 = @"REMOVE_RECENT_CONFIRM";
  }
  char v11 = [v9 localizedStringForKey:v10 value:&stru_1F0EC0C28 table:@"Localized"];
  uint64_t v12 = [v6 alertControllerWithTitle:v11 message:0 preferredStyle:0];

  char v13 = [v12 popoverPresentationController];
  [v13 setSourceView:v8];

  id v14 = [v12 popoverPresentationController];
  [v14 setPermittedArrowDirections:3];

  int v15 = (void *)MEMORY[0x1E4F42720];
  char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v17 = [v16 localizedStringForKey:@"REMOVE_RECENT" value:&stru_1F0EC0C28 table:@"Localized"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
  v30[3] = &unk_1E61283E8;
  int8x16_t v26 = *((int8x16_t *)a1 + 2);
  id v18 = (id)v26.i64[0];
  int8x16_t v31 = vextq_s8(v26, v26, 8uLL);
  id v32 = a1[6];
  id v19 = v27;
  id v33 = v19;
  id v20 = [v15 actionWithTitle:v17 style:2 handler:v30];
  [v12 addAction:v20];

  uint64_t v21 = (void *)MEMORY[0x1E4F42720];
  uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_1F0EC0C28 table:@"Localized"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_4;
  v28[3] = &unk_1E6128410;
  id v29 = v19;
  id v24 = v19;
  uint64_t v25 = [v21 actionWithTitle:v23 style:1 handler:v28];
  [v12 addAction:v25];

  [a1[5] presentViewController:v12 animated:1 completion:0];
}

void __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  [v2 autocompleteResultsController:*(void *)(a1 + 32) didAskToRemoveRecipient:*(void *)(a1 + 40)];

  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "sectionAtIndex:", objc_msgSend(*(id *)(a1 + 48), "section"));
  objc_msgSend(v3, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 48), "row"));

  BOOL v4 = [*(id *)(a1 + 32) tableView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_3;
  v8[3] = &unk_1E61283C0;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  [v4 performBatchUpdates:v8 completion:0];

  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 1, v5, v6, v7);
}

void __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) tableView];
  v4[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 deleteRowsAtIndexPaths:v3 withRowAnimation:2];
}

uint64_t __105__CNAutocompleteResultsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  BOOL v4 = [(CNAutocompleteResultsTableViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAutocompleteResultsTableViewController *)self delegate];
    [v6 autocompleteResultsControllerWillBeginToScroll:self];
  }
}

- (CNAutocompleteResultsTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAutocompleteResultsTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (BOOL)isDeferringTableViewUpdates
{
  return self->_deferTableViewUpdates;
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
}

- (NSMutableSet)expandedIdentifiers
{
  return self->_expandedIdentifiers;
}

- (void)setExpandedIdentifiers:(id)a3
{
}

- (BOOL)inDisambiguationMode
{
  return self->_inDisambiguationMode;
}

- (void)setInDisambiguationMode:(BOOL)a3
{
  self->_inDisambiguationMode = a3;
}

- (BOOL)hasPerformedRecipientExpansion
{
  return self->_hasPerformedRecipientExpansion;
}

- (void)setHasPerformedRecipientExpansion:(BOOL)a3
{
  self->_hasPerformedRecipientExpansion = a3;
}

- (BOOL)supportsInfoButton
{
  return self->_supportsInfoButton;
}

- (void)setSupportsInfoButton:(BOOL)a3
{
  self->_supportsInfoButton = a3;
}

- (BOOL)shouldHideInfoButton
{
  return self->_shouldHideInfoButton;
}

- (void)setShouldHideInfoButton:(BOOL)a3
{
  self->_shouldHideInfoButton = a3;
}

- (CNAvatarViewControllerSettings)sharedAvatarViewControllerSettings
{
  return self->_sharedAvatarViewControllerSettings;
}

- (void)setSharedAvatarViewControllerSettings:(id)a3
{
}

- (CNAutocompleteSearchControllerOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sharedAvatarViewControllerSettings, 0);
  objc_storeStrong((id *)&self->_expandedIdentifiers, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_serverSearchResults, 0);
  objc_storeStrong((id *)&self->_suggestedSearchResults, 0);

  objc_storeStrong((id *)&self->_searchResults, 0);
}

- (void)updateRecipients:disambiguatingRecipient:.cold.1()
{
}

- (void)callEndDisplayingRowForRecipientIndex:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B5AF5000, log, OS_LOG_TYPE_ERROR, "Prevented didEndDisplayingRowForRecipient on nil recipient", v1, 2u);
}

@end