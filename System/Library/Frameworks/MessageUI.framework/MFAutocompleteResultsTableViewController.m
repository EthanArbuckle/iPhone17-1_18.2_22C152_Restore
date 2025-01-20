@interface MFAutocompleteResultsTableViewController
- (BOOL)areCellAnimationsEnabled;
- (BOOL)confirmSelectedRecipient;
- (BOOL)containsRecipient:(id)a3;
- (BOOL)isDeferringTableViewUpdates;
- (BOOL)shouldDimIrrelevantInformation;
- (BOOL)shouldHighlightCompleteMatches;
- (Class)recipientTableViewCellClass;
- (MFAutocompleteResultsTableViewController)initWithStyle:(int64_t)a3;
- (MFAutocompleteResultsTableViewControllerDelegate)delegate;
- (NSArray)allRecipients;
- (NSArray)contactRecipients;
- (NSArray)directoryServerRecipients;
- (NSArray)suggestedRecipients;
- (UIColor)cellBackgroundColor;
- (double)_tableViewHeaderHeight;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_combinedResults;
- (id)_flattenedIndexPaths;
- (id)_indexPathForRecipient:(id)a3;
- (id)_recipientAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfResults;
- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3;
- (void)_updateTableViewModelAnimated:(BOOL)a3;
- (void)clear;
- (void)dealloc;
- (void)invalidateSearchResultRecipient:(id)a3;
- (void)loadView;
- (void)presentSearchResults:(id)a3;
- (void)resetScrollPosition;
- (void)selectNextSearchResult;
- (void)selectPreviousSearchResult;
- (void)setCellAnimationsEnabled:(BOOL)a3;
- (void)setCellBackgroundColor:(id)a3;
- (void)setDeferTableViewUpdates:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldDimIrrelevantInformation:(BOOL)a3;
- (void)setShouldHighlightCompleteMatches:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation MFAutocompleteResultsTableViewController

- (void)dealloc
{
  v3 = [(MFAutocompleteResultsTableViewController *)self tableView];
  [v3 setDataSource:0];

  v4 = [(MFAutocompleteResultsTableViewController *)self tableView];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)MFAutocompleteResultsTableViewController;
  [(MFAutocompleteResultsTableViewController *)&v5 dealloc];
}

- (MFAutocompleteResultsTableViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFAutocompleteResultsTableViewController;
  v3 = [(MFAutocompleteResultsTableViewController *)&v6 initWithStyle:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] mailAutoCompleteTableViewCellBackgroundColorForPopoverDisplay];
    [(MFAutocompleteResultsTableViewController *)v3 setCellBackgroundColor:v4];

    [(MFAutocompleteResultsTableViewController *)v3 setShouldDimIrrelevantInformation:1];
    [(MFAutocompleteResultsTableViewController *)v3 setShouldHighlightCompleteMatches:1];
    [(MFAutocompleteResultsTableViewController *)v3 setDeferTableViewUpdates:0];
  }
  return v3;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setAutoresizingMask:2];
  [v4 setShowsHorizontalScrollIndicator:0];
  [v4 setShowsVerticalScrollIndicator:1];
  [v4 setDataSource:self];
  [v4 setDelegate:self];
  [v4 _setMarginWidth:16.0];
  +[MFRecipientTableViewCell height];
  objc_msgSend(v4, "setEstimatedRowHeight:");
  [v4 setRowHeight:*MEMORY[0x1E4FB2F28]];
  objc_msgSend(v4, "setContentInset:", -1.0, 0.0, -1.0, 0.0);
  [(MFAutocompleteResultsTableViewController *)self setView:v4];
}

- (void)_updateTableViewModelAnimated:(BOOL)a3
{
  if (self->_deferTableViewUpdates)
  {
    self->_tableViewNeedsReload = 1;
  }
  else
  {
    BOOL v4 = a3;
    p_tableViewModel = &self->_tableViewModel;
    tableViewModel = self->_tableViewModel;
    if (!tableViewModel)
    {
      v7 = [[_MFAutocompleteResultsTableViewModel alloc] initWithNumberOfSections:3];
      v8 = *p_tableViewModel;
      *p_tableViewModel = v7;

      tableViewModel = *p_tableViewModel;
    }
    v25 = tableViewModel;
    v9 = [[_MFAutocompleteResultsTableViewModel alloc] initWithNumberOfSections:[(_MFAutocompleteResultsTableViewModel *)v25 numberOfSections]];
    [(_MFAutocompleteResultsTableViewModel *)v9 setObject:self->_searchResults atIndexedSubscript:0];
    [(_MFAutocompleteResultsTableViewModel *)v9 setObject:self->_suggestedSearchResults atIndexedSubscript:1];
    [(_MFAutocompleteResultsTableViewModel *)v9 setObject:self->_serverSearchResults atIndexedSubscript:2];
    if (v4)
    {
      v10 = [(_MFAutocompleteResultsTableViewModel *)v25 computeDiffForModel:v9];
      objc_storeStrong((id *)&self->_tableViewModel, v9);
      v11 = [(MFAutocompleteResultsTableViewController *)self tableView];
      [v11 beginUpdates];

      v12 = [v10 insertedRows];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        v14 = [(MFAutocompleteResultsTableViewController *)self tableView];
        v15 = [v10 insertedRows];
        [v14 insertSections:v15 withRowAnimation:100];
      }
      v16 = [v10 deletedRows];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        v18 = [(MFAutocompleteResultsTableViewController *)self tableView];
        v19 = [v10 deletedRows];
        [v18 deleteSections:v19 withRowAnimation:3];
      }
      v20 = [v10 changedRows];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        v22 = [(MFAutocompleteResultsTableViewController *)self tableView];
        v23 = [v10 changedRows];
        [v22 reloadSections:v23 withRowAnimation:0];
      }
      v24 = [(MFAutocompleteResultsTableViewController *)self tableView];
      [v24 endUpdates];
    }
    else
    {
      objc_storeStrong((id *)&self->_tableViewModel, v9);
      v10 = [(MFAutocompleteResultsTableViewController *)self tableView];
      [v10 reloadData];
    }
  }
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
    [(MFAutocompleteResultsTableViewController *)self _updateTableViewModelAnimated:0];
  }
}

- (void)presentSearchResults:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MFAutocompleteResultsTableViewController.m" lineNumber:240 description:@"Current thread must be main"];
  }
  objc_super v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        char v14 = objc_msgSend(v13, "isSuggestedRecipient", (void)v23);
        v15 = v7;
        if ((v14 & 1) == 0)
        {
          if ([v13 isDirectoryServerResult]) {
            v15 = v8;
          }
          else {
            v15 = v6;
          }
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  objc_storeStrong((id *)&self->_searchResults, v6);
  objc_storeStrong((id *)&self->_suggestedSearchResults, v7);
  objc_storeStrong((id *)&self->_serverSearchResults, v8);
  v16 = [(MFAutocompleteResultsTableViewController *)self tableView];
  uint64_t v17 = [v16 indexPathForSelectedRow];

  BOOL cellAnimationsEnabled = self->_cellAnimationsEnabled;
  if (self->_cellAnimationsEnabled)
  {
    v16 = [(MFAutocompleteResultsTableViewController *)self _combinedResults];
    BOOL v19 = [v16 count] != 0;
  }
  else
  {
    BOOL v19 = 0;
  }
  -[MFAutocompleteResultsTableViewController _updateTableViewModelAnimated:](self, "_updateTableViewModelAnimated:", v19, (void)v23);
  if (cellAnimationsEnabled) {

  }
  if (v17)
  {
    v20 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v20 scrollToRowAtIndexPath:v17 atScrollPosition:0 animated:1];

    uint64_t v21 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v21 selectRowAtIndexPath:v17 animated:0 scrollPosition:0];
  }
}

- (id)_flattenedIndexPaths
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  tableViewModel = self->_tableViewModel;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__MFAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke;
  v6[3] = &unk_1E5F795A0;
  v6[4] = &v7;
  [(_MFAutocompleteResultsTableViewModel *)tableViewModel enumerateSections:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __64__MFAutocompleteResultsTableViewController__flattenedIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:a2];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
    }
  }
}

- (void)selectNextSearchResult
{
  id v9 = [(MFAutocompleteResultsTableViewController *)self _flattenedIndexPaths];
  if ([v9 count])
  {
    id v3 = [(MFAutocompleteResultsTableViewController *)self tableView];
    id v4 = [v3 indexPathForSelectedRow];

    if (v4)
    {
      uint64_t v5 = [v9 indexOfObject:v4];
      if (v5 + 1 >= (unint64_t)[v9 count])
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v6 = objc_msgSend(v9, "objectAtIndex:");

      id v4 = (void *)v6;
    }
    else
    {
      id v4 = [v9 firstObject];
    }
    uint64_t v7 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v7 scrollToRowAtIndexPath:v4 atScrollPosition:0 animated:1];

    v8 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v8 selectRowAtIndexPath:v4 animated:0 scrollPosition:0];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)selectPreviousSearchResult
{
  id v9 = [(MFAutocompleteResultsTableViewController *)self _flattenedIndexPaths];
  if ([v9 count])
  {
    id v3 = [(MFAutocompleteResultsTableViewController *)self tableView];
    id v4 = [v3 indexPathForSelectedRow];

    if (v4)
    {
      uint64_t v5 = [v9 indexOfObject:v4];
      if (!v5)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v6 = [v9 objectAtIndex:v5 - 1];

      id v4 = (void *)v6;
    }
    else
    {
      id v4 = [v9 lastObject];
    }
    uint64_t v7 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v7 scrollToRowAtIndexPath:v4 atScrollPosition:0 animated:1];

    v8 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v8 selectRowAtIndexPath:v4 animated:0 scrollPosition:0];

    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)confirmSelectedRecipient
{
  id v3 = [(MFAutocompleteResultsTableViewController *)self tableView];
  id v4 = [v3 indexPathForSelectedRow];

  if (v4) {
    [(MFAutocompleteResultsTableViewController *)self _selectSearchResultsRecipientAtIndexPath:v4];
  }

  return v4 != 0;
}

- (void)resetScrollPosition
{
  id v2 = [(MFAutocompleteResultsTableViewController *)self tableView];
  objc_msgSend(v2, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)clear
{
  searchResults = self->_searchResults;
  self->_searchResults = 0;

  suggestedSearchResults = self->_suggestedSearchResults;
  self->_suggestedSearchResults = 0;

  serverSearchResults = self->_serverSearchResults;
  self->_serverSearchResults = 0;

  [(MFAutocompleteResultsTableViewController *)self _updateTableViewModelAnimated:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(_MFAutocompleteResultsTableViewModel *)self->_tableViewModel numberOfSections];
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
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

- (NSArray)allRecipients
{
  id v2 = [(MFAutocompleteResultsTableViewController *)self _combinedResults];
  id v3 = objc_msgSend(v2, "ef_flatten");

  return (NSArray *)v3;
}

- (BOOL)containsRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFAutocompleteResultsTableViewController *)self _combinedResults];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MFAutocompleteResultsTableViewController_containsRecipient___block_invoke;
  v9[3] = &unk_1E5F795F0;
  id v6 = v4;
  id v10 = v6;
  char v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

uint64_t __62__MFAutocompleteResultsTableViewController_containsRecipient___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsObject:*(void *)(a1 + 32)];
}

- (unint64_t)numberOfResults
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(MFAutocompleteResultsTableViewController *)self _combinedResults];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MFAutocompleteResultsTableViewController_numberOfResults__block_invoke;
  v5[3] = &unk_1E5F79618;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__MFAutocompleteResultsTableViewController_numberOfResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];
}

- (id)_indexPathForRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  tableViewModel = self->_tableViewModel;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__MFAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke;
  v9[3] = &unk_1E5F79640;
  uint64_t v11 = &v17;
  id v6 = v4;
  id v10 = v6;
  id v12 = &v13;
  [(_MFAutocompleteResultsTableViewModel *)tableViewModel enumerateSections:v9];
  char v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v18[3] inSection:v14[3]];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __67__MFAutocompleteResultsTableViewController__indexPathForRecipient___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v7 indexOfObject:a1[4]];
  if (*(void *)(*(void *)(a1[5] + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    *a4 = 1;
  }
}

- (id)_recipientAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", [v4 section]);
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

  return v6;
}

- (void)_selectSearchResultsRecipientAtIndexPath:(id)a3
{
  id v6 = a3;
  id v4 = -[MFAutocompleteResultsTableViewController _recipientAtIndexPath:](self, "_recipientAtIndexPath:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "autocompleteResultsController:didSelectRecipient:atIndex:", self, v4, objc_msgSend(v6, "row"));
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained autocompleteResultsController:self didSelectRecipient:v4];
  }
}

- (void)invalidateSearchResultRecipient:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MFAutocompleteResultsTableViewController *)self _indexPathForRecipient:v4];
  if ([v5 row] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v6 beginUpdates];

    id v7 = [(MFAutocompleteResultsTableViewController *)self tableView];
    v11[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:2];

    uint64_t v9 = -[_MFAutocompleteResultsTableViewModel sectionAtIndex:](self->_tableViewModel, "sectionAtIndex:", [v5 section]);
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v5, "row"));

    id v10 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v10 endUpdates];
  }
}

- (void)setCellBackgroundColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_cellBackgroundColor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
    id v6 = [(MFAutocompleteResultsTableViewController *)self tableView];
    [v6 setBackgroundColor:v7];

    uint64_t v5 = v7;
  }
}

- (double)_tableViewHeaderHeight
{
  id v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v2 _bodyLeading];
  double v4 = v3;

  return v4 * 0.444444444 + v4 * 2.44444444;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 1
    || ([(_MFAutocompleteResultsTableViewModel *)self->_tableViewModel sectionAtIndex:a4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  if (a4 == 2)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"FOUND_ON_SERVERS" value:&stru_1F0817A00 table:@"Main"];
  }
  else
  {
    if (a4 != 1)
    {
      id v12 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"FOUND_IN_MAIL" value:&stru_1F0817A00 table:@"Main"];
  }
  id v12 = (void *)v10;

LABEL_10:
  [v6 frame];
  double v14 = v13;
  [(MFAutocompleteResultsTableViewController *)self _tableViewHeaderHeight];
  double v16 = v15;
  id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  uint64_t v18 = MEMORY[0x1E4F1DB28];
  double v19 = *MEMORY[0x1E4F1DB28];
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  uint64_t v11 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v14, v16);
  uint64_t v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v19, v20, *(double *)(v18 + 16), *(double *)(v18 + 24));
  long long v23 = [v12 localizedUppercaseString];
  [v22 setText:v23];

  [v22 setFont:v21];
  long long v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
  [v22 setTextColor:v24];

  [v22 sizeToFit];
  [v21 _bodyLeading];
  double v26 = v25;
  [v22 frame];
  CGFloat v28 = v27;
  double v30 = v29;
  double v32 = v31;
  [v6 layoutMargins];
  double v34 = v33;
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute")) == 1)
  {
    [v6 bounds];
    double MaxX = CGRectGetMaxX(v40);
    v41.origin.x = v34;
    v41.origin.y = v28;
    v41.size.width = v30;
    v41.size.height = v32;
    double Width = CGRectGetWidth(v41);
    v42.origin.x = v34;
    v42.origin.y = v28;
    v42.size.width = v30;
    v42.size.height = v32;
    double v34 = MaxX - Width - CGRectGetMinX(v42);
  }
  [v11 frame];
  objc_msgSend(v22, "setFrame:", v34, v37 - v32 - v26 * 0.444444444, v30, v32);
  [v11 addSubview:v22];

LABEL_13:

  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4
    && ([(_MFAutocompleteResultsTableViewModel *)self->_tableViewModel sectionAtIndex:a4],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    [(MFAutocompleteResultsTableViewController *)self _tableViewHeaderHeight];
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
  double v4 = [(_MFAutocompleteResultsTableViewModel *)self->_tableViewModel objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 _setShouldHaveFullLengthTopSeparator:0];
  [v5 _setShouldHaveFullLengthBottomSeparator:0];
}

- (Class)recipientTableViewCellClass
{
  return (Class)objc_opt_class();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", [v7 section]);
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  double v10 = +[MFRecipientTableViewCell identifier];
  uint64_t v11 = [v6 dequeueReusableCellWithIdentifier:v10];

  if (!v11)
  {
    id v12 = objc_alloc([(MFAutocompleteResultsTableViewController *)self recipientTableViewCellClass]);
    double v13 = +[MFRecipientTableViewCell identifier];
    uint64_t v11 = (void *)[v12 initWithStyle:0 reuseIdentifier:v13];
  }
  [v11 setBackgroundColor:self->_cellBackgroundColor];
  [v11 setShouldHighlightCompleteMatches:self->_shouldHighlightCompleteMatches];
  [v11 setShouldDimIrrelevantInformation:self->_shouldDimIrrelevantInformation];
  if ([v9 showsAccessoryButton]) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 0;
  }
  [v11 setAccessoryType:v14];
  double v15 = [v11 recipient];

  if (v15 != v9) {
    [v11 setRecipient:v9];
  }

  return v11;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = -[_MFAutocompleteResultsTableViewModel objectAtIndexedSubscript:](self->_tableViewModel, "objectAtIndexedSubscript:", [v8 section]);
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained autocompleteResultsController:self didRequestInfoAboutRecipient:v6];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  [(MFAutocompleteResultsTableViewController *)self _selectSearchResultsRecipientAtIndexPath:v6];
}

- (NSArray)contactRecipients
{
  return &self->_searchResults->super;
}

- (NSArray)suggestedRecipients
{
  return &self->_suggestedSearchResults->super;
}

- (NSArray)directoryServerRecipients
{
  return &self->_serverSearchResults->super;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (MFAutocompleteResultsTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFAutocompleteResultsTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)areCellAnimationsEnabled
{
  return self->_cellAnimationsEnabled;
}

- (void)setCellAnimationsEnabled:(BOOL)a3
{
  self->_BOOL cellAnimationsEnabled = a3;
}

- (BOOL)isDeferringTableViewUpdates
{
  return self->_deferTableViewUpdates;
}

- (BOOL)shouldHighlightCompleteMatches
{
  return self->_shouldHighlightCompleteMatches;
}

- (void)setShouldHighlightCompleteMatches:(BOOL)a3
{
  self->_shouldHighlightCompleteMatches = a3;
}

- (BOOL)shouldDimIrrelevantInformation
{
  return self->_shouldDimIrrelevantInformation;
}

- (void)setShouldDimIrrelevantInformation:(BOOL)a3
{
  self->_shouldDimIrrelevantInformation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_serverSearchResults, 0);
  objc_storeStrong((id *)&self->_suggestedSearchResults, 0);

  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end