@interface WFFilePickerViewController
- (BOOL)allowsMultipleSelection;
- (BOOL)caseInsensitiveArray:(id)a3 isEqualToArray:(id)a4;
- (BOOL)fileListView:(id)a3 shouldDisplayCheckmarkForFile:(id)a4;
- (BOOL)fileListView:(id)a3 shouldSelectFile:(id)a4;
- (BOOL)hideSearchBar;
- (BOOL)loading;
- (NSArray)files;
- (NSError)error;
- (NSMutableOrderedSet)selectedFiles;
- (NSString)path;
- (UISearchController)searchController;
- (WFFilePickerViewController)initWithPath:(id)a3 selectedFiles:(id)a4 service:(id)a5 mode:(int64_t)a6 allowsMultipleSelection:(BOOL)a7 pickCompletionHandler:(id)a8 saveCompletionHandler:(id)a9;
- (WFFileStorageService)service;
- (WFRemoteFileListView)fileListView;
- (WFRemoteFileStatusView)statusView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)initForPickingFilesAtPath:(id)a3 service:(id)a4 allowsMultipleSelection:(BOOL)a5 completionHandler:(id)a6;
- (id)initForSavingFilesAtPath:(id)a3 service:(id)a4 completionHandler:(id)a5;
- (id)pickCompletionHandler;
- (id)saveCompletionHandler;
- (int64_t)mode;
- (void)cancel;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didDismissSearchController:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)fileListView:(id)a3 didSelectFile:(id)a4;
- (void)finish;
- (void)loadFiles;
- (void)loadView;
- (void)navigateToSubdirectoryAtPath:(id)a3;
- (void)setError:(id)a3;
- (void)setFiles:(id)a3;
- (void)setHideSearchBar:(BOOL)a3;
- (void)setLoading:(BOOL)a3;
- (void)setSelectedFiles:(id)a3;
- (void)setStatusViewToEmpty;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateStatusViewAnimated:(BOOL)a3;
- (void)updateToolbar;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFFilePickerViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusView);
  objc_destroyWeak((id *)&self->_fileListView);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_selectedFiles, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong(&self->_pickCompletionHandler, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (WFRemoteFileStatusView)statusView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusView);
  return (WFRemoteFileStatusView *)WeakRetained;
}

- (WFRemoteFileListView)fileListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileListView);
  return (WFRemoteFileListView *)WeakRetained;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSelectedFiles:(id)a3
{
}

- (NSMutableOrderedSet)selectedFiles
{
  return self->_selectedFiles;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setFiles:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (id)saveCompletionHandler
{
  return self->_saveCompletionHandler;
}

- (id)pickCompletionHandler
{
  return self->_pickCompletionHandler;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)hideSearchBar
{
  return self->_hideSearchBar;
}

- (NSString)path
{
  return self->_path;
}

- (WFFileStorageService)service
{
  return self->_service;
}

- (void)didDismissSearchController:(id)a3
{
  v4 = [a3 searchBar];
  [v4 setText:0];

  id v5 = [(WFFilePickerViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)didPresentSearchController:(id)a3
{
  id v3 = [(WFFilePickerViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 searchBar];
  v6 = [v5 text];
  v7 = [v4 searchResultsController];

  if ([v6 length])
  {
    v8 = [(WFFilePickerViewController *)self service];
    v9 = [(WFFilePickerViewController *)self path];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke;
    v11[3] = &unk_264900158;
    id v12 = v8;
    id v13 = v5;
    id v14 = v6;
    id v15 = v7;
    id v10 = v8;
    [v10 searchFiles:v14 inPath:v9 completionHandler:v11];
  }
  else
  {
    [v7 setFiles:0];
  }
}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke(id *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F33708];
  id v4 = a1[4];
  id v5 = a2;
  v6 = [v4 associatedAppDescriptor];
  v7 = [v3 locationWithAppDescriptor:v6];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[4];
  WFContentCollectionFromStorageServiceResult();
}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_3;
  v6[3] = &unk_264900108;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v5 = a2;
  objc_msgSend(v5, "getObjectRepresentations:forClass:", v6, objc_msgSend(v4, "objectRepresentationClass"));
}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_4;
  v5[3] = &unk_264900F78;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __69__WFFilePickerViewController_updateSearchResultsForSearchController___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) text];
  int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v4 setFiles:v5];
  }
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = objc_msgSend(a4, "identifier", a3);
  if (v6)
  {
    v17 = v6;
    if ([v6 conformsToProtocol:&unk_26DF9DC18])
    {
      id v7 = [WFFilePickerViewController alloc];
      id v8 = [v17 wfPath];
      id v9 = [(WFFilePickerViewController *)self selectedFiles];
      id v10 = [(WFFilePickerViewController *)self service];
      int64_t v11 = [(WFFilePickerViewController *)self mode];
      BOOL v12 = [(WFFilePickerViewController *)self allowsMultipleSelection];
      id v13 = [(WFFilePickerViewController *)self pickCompletionHandler];
      id v14 = [(WFFilePickerViewController *)self saveCompletionHandler];
      id v15 = [(WFFilePickerViewController *)v7 initWithPath:v8 selectedFiles:v9 service:v10 mode:v11 allowsMultipleSelection:v12 pickCompletionHandler:v13 saveCompletionHandler:v14];

      v16 = [(WFFilePickerViewController *)self navigationController];
      [v16 pushViewController:v15 animated:0];
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(WFFilePickerViewController *)self fileListView];
  id v8 = objc_msgSend(v7, "fileAtPoint:", x, y);
  id v9 = (void *)MEMORY[0x263F82610];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__WFFilePickerViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v13[3] = &unk_2649000C0;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  int64_t v11 = [v9 configurationWithIdentifier:v10 previewProvider:v13 actionProvider:&__block_literal_global_234];

  return v11;
}

WFFilePickerViewController *__84__WFFilePickerViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) wfIsDirectory])
  {
    v2 = [WFFilePickerViewController alloc];
    int v3 = [*(id *)(a1 + 32) wfPath];
    id v4 = [*(id *)(a1 + 40) selectedFiles];
    uint64_t v5 = [*(id *)(a1 + 40) service];
    uint64_t v6 = [*(id *)(a1 + 40) mode];
    uint64_t v7 = [*(id *)(a1 + 40) allowsMultipleSelection];
    id v8 = [*(id *)(a1 + 40) pickCompletionHandler];
    id v9 = [*(id *)(a1 + 40) saveCompletionHandler];
    id v10 = [(WFFilePickerViewController *)v2 initWithPath:v3 selectedFiles:v4 service:v5 mode:v6 allowsMultipleSelection:v7 pickCompletionHandler:v8 saveCompletionHandler:v9];

    [(WFFilePickerViewController *)v10 setHideSearchBar:1];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

uint64_t __84__WFFilePickerViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2()
{
  return 0;
}

- (BOOL)fileListView:(id)a3 shouldSelectFile:(id)a4
{
  return (objc_msgSend(a4, "wfIsDirectory", a3) & 1) != 0 || -[WFFilePickerViewController mode](self, "mode") == 0;
}

- (BOOL)fileListView:(id)a3 shouldDisplayCheckmarkForFile:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(WFFilePickerViewController *)self selectedFiles];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) wfIsEqualToFile:v5])
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)fileListView:(id)a3 didSelectFile:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 wfIsDirectory])
  {
    uint64_t v8 = [(WFFilePickerViewController *)self searchController];
    [v8 setActive:0];

    uint64_t v9 = [v7 wfPath];
    [(WFFilePickerViewController *)self navigateToSubdirectoryAtPath:v9];
  }
  else if ([(WFFilePickerViewController *)self mode] != 1)
  {
    if ([(WFFilePickerViewController *)self allowsMultipleSelection])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = [(WFFilePickerViewController *)self selectedFiles];
      int64_t v11 = (void *)[v10 copy];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v16 wfIsEqualToFile:v7])
            {
              v18 = [(WFFilePickerViewController *)self selectedFiles];
              [v18 removeObject:v16];

              goto LABEL_16;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      int64_t v11 = [(WFFilePickerViewController *)self selectedFiles];
      [v11 addObject:v7];
LABEL_16:

      [v6 updateCheckmarkForFile:v7];
      [(WFFilePickerViewController *)self updateToolbar];
    }
    else
    {
      uint64_t v17 = [(WFFilePickerViewController *)self selectedFiles];
      [v17 addObject:v7];

      [(WFFilePickerViewController *)self finish];
    }
  }
}

- (void)navigateToSubdirectoryAtPath:(id)a3
{
  id v35 = a3;
  id v5 = [(WFFilePickerViewController *)self navigationController];
  id v6 = [v5 topViewController];
  if (!v5)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"WFFilePickerViewController.m" lineNumber:307 description:@"View controller must be part of a navigation stack"];
  }
  id v7 = [v6 path];
  uint64_t v8 = [v7 pathComponents];
  uint64_t v9 = [v35 stringByStandardizingPath];
  id v10 = [v9 pathComponents];

  unint64_t v11 = [v8 count];
  if (v11 <= [v10 count])
  {
    uint64_t v12 = objc_msgSend(v10, "subarrayWithRange:", 0, objc_msgSend(v8, "count"));
    BOOL v13 = [(WFFilePickerViewController *)self caseInsensitiveArray:v12 isEqualToArray:v8];

    if (v13)
    {
      v32 = v7;
      v33 = v6;
      v34 = v5;
      uint64_t v14 = objc_opt_new();
      v31 = v8;
      unint64_t v15 = [v8 count];
      if (v15 < [v10 count])
      {
        v36 = v14;
        do
        {
          v16 = NSString;
          uint64_t v17 = objc_msgSend(v10, "subarrayWithRange:", 0, ++v15);
          v37 = [v16 pathWithComponents:v17];

          v18 = [WFFilePickerViewController alloc];
          long long v19 = [(WFFilePickerViewController *)self selectedFiles];
          long long v20 = [(WFFilePickerViewController *)self service];
          int64_t v21 = [(WFFilePickerViewController *)self mode];
          BOOL v22 = [(WFFilePickerViewController *)self allowsMultipleSelection];
          v23 = [(WFFilePickerViewController *)self pickCompletionHandler];
          [(WFFilePickerViewController *)self saveCompletionHandler];
          uint64_t v24 = self;
          v26 = v25 = v10;
          v27 = [(WFFilePickerViewController *)v18 initWithPath:v37 selectedFiles:v19 service:v20 mode:v21 allowsMultipleSelection:v22 pickCompletionHandler:v23 saveCompletionHandler:v26];

          id v10 = v25;
          self = v24;

          uint64_t v14 = v36;
          [v36 addObject:v27];
        }
        while (v15 < [v10 count]);
      }
      if ([v14 count] == 1)
      {
        v28 = [v14 firstObject];
        id v5 = v34;
        [v34 pushViewController:v28 animated:1];
      }
      else
      {
        id v5 = v34;
        v28 = [v34 viewControllers];
        v29 = [v28 arrayByAddingObjectsFromArray:v14];
        [v34 setViewControllers:v29 animated:0];
      }
      id v7 = v32;
      id v6 = v33;

      uint64_t v8 = v31;
    }
  }
}

- (BOOL)caseInsensitiveArray:(id)a3 isEqualToArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      uint64_t v8 = 0;
      while (1)
      {
        uint64_t v9 = [v5 objectAtIndex:v8];
        id v10 = [v6 objectAtIndex:v8];
        uint64_t v11 = [v9 localizedStandardCompare:v10];
        BOOL v12 = v11 == 0;

        if (v11) {
          break;
        }
        if (++v8 >= (unint64_t)[v5 count]) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)updateToolbar
{
  v17[3] = *MEMORY[0x263EF8340];
  int64_t v3 = [(WFFilePickerViewController *)self mode];
  if (v3 || [(WFFilePickerViewController *)self allowsMultipleSelection])
  {
    id v4 = [(WFFilePickerViewController *)self navigationController];
    int v5 = [v4 isToolbarHidden];

    if (v5)
    {
      id v6 = [(WFFilePickerViewController *)self navigationController];
      [v6 setToolbarHidden:0 animated:0];
    }
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:self action:0];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:0 style:0 target:self action:sel_finish];
    uint64_t v9 = [MEMORY[0x263F825C8] colorWithRed:0.063 green:0.478 blue:0.969 alpha:1.0];
    [v8 setTintColor:v9];

    if (v3)
    {
      id v10 = @"Save Here";
    }
    else
    {
      uint64_t v11 = [(WFFilePickerViewController *)self selectedFiles];
      uint64_t v12 = [v11 count];

      [v8 setEnabled:v12 != 0];
      if (v12 != 1)
      {
        unint64_t v15 = NSString;
        BOOL v13 = WFLocalizedString(@"Get Selected Files (%lu)");
        v16 = objc_msgSend(v15, "localizedStringWithFormat:", v13, v12);
        [v8 setTitle:v16];

        goto LABEL_10;
      }
      id v10 = @"Get Selected File (1)";
    }
    BOOL v13 = WFLocalizedString(v10);
    [v8 setTitle:v13];
LABEL_10:

    v17[0] = v7;
    v17[1] = v8;
    v17[2] = v7;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    [(WFFilePickerViewController *)self setToolbarItems:v14 animated:0];
  }
}

- (void)setStatusViewToEmpty
{
  BOOL v3 = [(WFFilePickerViewController *)self mode] == 0;
  id v4 = [(WFFilePickerViewController *)self statusView];
  [v4 setEmptyWithLabel:v3];
}

- (void)updateStatusViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(WFFilePickerViewController *)self error];
  id v6 = [(WFFilePickerViewController *)self files];
  uint64_t v7 = [(WFFilePickerViewController *)self statusView];
  uint64_t v8 = [(WFFilePickerViewController *)self fileListView];
  uint64_t v9 = [v6 count];
  BOOL v10 = v9 == 0;
  int v11 = [v7 isHidden];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke;
  aBlock[3] = &unk_264900F78;
  id v12 = v5;
  id v28 = v12;
  id v13 = v7;
  id v29 = v13;
  v30 = self;
  id v14 = v6;
  id v31 = v14;
  unint64_t v15 = _Block_copy(aBlock);
  v16 = v15;
  if (((v9 != 0) ^ v11))
  {
    if (v3)
    {
      uint64_t v17 = (void *)MEMORY[0x263F82E00];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_2;
      v24[3] = &unk_264900E88;
      id v25 = v13;
      id v26 = v8;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_3;
      v19[3] = &unk_264900098;
      id v20 = v25;
      BOOL v23 = v9 == 0;
      id v21 = v26;
      id v22 = v16;
      [v17 animateWithDuration:v24 animations:v19 completion:0.15];
    }
    else
    {
      (*((void (**)(void *))v15 + 2))(v15);
      [v13 setAlpha:(double)v10];
      double v18 = 0.0;
      if (v9) {
        double v18 = 1.0;
      }
      [v8 setAlpha:v18];
      [v13 setHidden:v9 != 0];
      [v8 setHidden:v10];
    }
  }
  else
  {
    (*((void (**)(void *))v15 + 2))(v15);
  }
}

uint64_t __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    return objc_msgSend(v2, "setError:");
  }
  else if ([*(id *)(a1 + 48) loading])
  {
    id v4 = *(void **)(a1 + 40);
    return [v4 setLoading];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 56) count];
    if (!result)
    {
      int v5 = *(void **)(a1 + 48);
      return [v5 setStatusViewToEmpty];
    }
  }
  return result;
}

uint64_t __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 56) == 0];
  [*(id *)(a1 + 40) setHidden:*(unsigned __int8 *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = (void *)MEMORY[0x263F82E00];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_4;
  v3[3] = &unk_264900CF0;
  id v4 = *(id *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v3 animations:0.15];
}

uint64_t __55__WFFilePickerViewController_updateStatusViewAnimated___block_invoke_4(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 48);
  [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  id v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:v3];
}

- (void)loadFiles
{
  if (![(WFFilePickerViewController *)self loading])
  {
    double v3 = [(WFFilePickerViewController *)self files];

    if (!v3)
    {
      [(WFFilePickerViewController *)self setLoading:1];
      [(WFFilePickerViewController *)self setError:0];
      [(WFFilePickerViewController *)self updateStatusViewAnimated:0];
      id v4 = [(WFFilePickerViewController *)self service];
      id v5 = [(WFFilePickerViewController *)self path];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __39__WFFilePickerViewController_loadFiles__block_invoke;
      v7[3] = &unk_2649008F0;
      id v8 = v4;
      uint64_t v9 = self;
      id v6 = v4;
      [v6 retrieveFilesAtPath:v5 options:1 progress:0 completionHandler:v7];
    }
  }
}

void __39__WFFilePickerViewController_loadFiles__block_invoke(int8x16_t *a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263F33708];
  id v4 = (void *)a1[2].i64[0];
  id v5 = a2;
  id v6 = [v4 associatedAppDescriptor];
  uint64_t v7 = [v3 locationWithAppDescriptor:v6];
  int8x16_t v9 = a1[2];
  id v8 = (id)v9.i64[0];
  WFContentCollectionFromStorageServiceResult();
}

void __39__WFFilePickerViewController_loadFiles__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__WFFilePickerViewController_loadFiles__block_invoke_4;
    v9[3] = &unk_264900048;
    id v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    objc_msgSend(v5, "getObjectRepresentations:forClass:", v9, objc_msgSend(v8, "objectRepresentationClass"));
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__WFFilePickerViewController_loadFiles__block_invoke_3;
    block[3] = &unk_264900E88;
    block[4] = *(void *)(a1 + 32);
    id v11 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __39__WFFilePickerViewController_loadFiles__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoading:0];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 updateStatusViewAnimated:0];
}

void __39__WFFilePickerViewController_loadFiles__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([*(id *)(a1 + 32) mode] == 1)
  {
    uint64_t v8 = objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_1555);

    id v6 = (id)v8;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__WFFilePickerViewController_loadFiles__block_invoke_6;
  block[3] = &unk_264900940;
  block[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __39__WFFilePickerViewController_loadFiles__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoading:0];
  [*(id *)(a1 + 32) setFiles:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 32) fileListView];
  [v2 setFiles:*(void *)(a1 + 40)];

  double v3 = [*(id *)(a1 + 32) view];
  [v3 setNeedsLayout];

  id v4 = *(void **)(a1 + 32);
  return [v4 updateStatusViewAnimated:1];
}

uint64_t __39__WFFilePickerViewController_loadFiles__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 wfIsDirectory];
}

- (void)finish
{
  if ([(WFFilePickerViewController *)self mode])
  {
    double v3 = [(WFFilePickerViewController *)self saveCompletionHandler];
    if (!v3) {
      goto LABEL_7;
    }
    id v4 = [(WFFilePickerViewController *)self path];
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
  else
  {
    double v3 = [(WFFilePickerViewController *)self pickCompletionHandler];
    if (!v3) {
      goto LABEL_7;
    }
    id v4 = [(WFFilePickerViewController *)self selectedFiles];
    id v5 = [v4 array];
    ((void (**)(void, void *))v3)[2](v3, v5);
  }
LABEL_7:

  [(WFFilePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)cancel
{
  if ([(WFFilePickerViewController *)self mode]) {
    [(WFFilePickerViewController *)self saveCompletionHandler];
  }
  else {
  uint64_t v3 = [(WFFilePickerViewController *)self pickCompletionHandler];
  }
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }

  [(WFFilePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)setHideSearchBar:(BOOL)a3
{
  BOOL hideSearchBar = self->_hideSearchBar;
  self->_BOOL hideSearchBar = a3;
  if (hideSearchBar != a3 && [(WFFilePickerViewController *)self isViewLoaded])
  {
    id v5 = [(WFFilePickerViewController *)self view];
    [v5 setNeedsLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFFilePickerViewController;
  [(WFFilePickerViewController *)&v4 viewWillAppear:a3];
  [(WFFilePickerViewController *)self updateToolbar];
}

- (void)viewWillLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)WFFilePickerViewController;
  [(WFFilePickerViewController *)&v27 viewWillLayoutSubviews];
  BOOL v3 = [(WFFilePickerViewController *)self hideSearchBar];
  objc_super v4 = [(WFFilePickerViewController *)self view];
  [v4 safeAreaInsets];
  double v6 = v5;

  id v7 = [(WFFilePickerViewController *)self searchController];
  uint64_t v8 = [v7 searchBar];
  [v8 setHidden:v3];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  unint64_t v15 = [v8 superview];
  v16 = [(WFFilePickerViewController *)self view];
  double Height = 0.0;
  if (![v15 isEqual:v16]) {
    double v6 = 0.0;
  }

  double v18 = (void *)MEMORY[0x263F82E00];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__WFFilePickerViewController_viewWillLayoutSubviews__block_invoke;
  v21[3] = &unk_264900000;
  id v22 = v8;
  CGFloat v23 = v10;
  double v24 = v6;
  CGFloat v25 = v12;
  CGFloat v26 = v14;
  id v19 = v8;
  [v18 performWithoutAnimation:v21];
  if (!v3)
  {
    v28.origin.double x = v10;
    v28.origin.double y = v6;
    v28.size.width = v12;
    v28.size.height = v14;
    double Height = CGRectGetHeight(v28);
  }
  id v20 = [(WFFilePickerViewController *)self fileListView];
  objc_msgSend(v20, "setContentInset:", Height, 0.0, 0.0, 0.0);
  objc_msgSend(v20, "setVerticalScrollIndicatorInsets:", Height, 0.0, 0.0, 0.0);
}

uint64_t __52__WFFilePickerViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)loadView
{
  v21.receiver = self;
  v21.super_class = (Class)WFFilePickerViewController;
  [(WFFilePickerViewController *)&v21 loadView];
  BOOL v3 = [(WFFilePickerViewController *)self view];
  objc_super v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(WFFilePickerViewController *)self files];
  CGFloat v14 = [WFRemoteFileListView alloc];
  unint64_t v15 = [MEMORY[0x263F82928] currentCollation];
  v16 = -[WFRemoteFileListView initWithFrame:collation:](v14, "initWithFrame:collation:", v15, v6, v8, v10, v12);

  [(WFRemoteFileListView *)v16 setAutoresizingMask:18];
  [(WFRemoteFileListView *)v16 setDelegate:self];
  [(WFRemoteFileListView *)v16 setHidden:1];
  [(WFRemoteFileListView *)v16 setFiles:v13];
  [v3 addSubview:v16];
  objc_storeWeak((id *)&self->_fileListView, v16);
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:self];
  [(WFRemoteFileListView *)v16 addInteraction:v17];
  double v18 = -[WFRemoteFileStatusView initWithFrame:]([WFRemoteFileStatusView alloc], "initWithFrame:", v6, v8, v10, v12);
  [(WFRemoteFileStatusView *)v18 setDelegate:self];
  [(WFRemoteFileStatusView *)v18 setAutoresizingMask:18];
  [v3 addSubview:v18];
  objc_storeWeak((id *)&self->_statusView, v18);
  id v19 = [(WFFilePickerViewController *)self searchController];
  id v20 = [v19 searchBar];

  v22.origin.double x = v6;
  v22.origin.double y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, CGRectGetWidth(v22), 56.0);
  [v20 setAutoresizingMask:2];
  [v3 addSubview:v20];
  [(WFFilePickerViewController *)self loadFiles];
  [(WFFilePickerViewController *)self updateStatusViewAnimated:0];
  [(WFFilePickerViewController *)self updateToolbar];
}

- (WFFilePickerViewController)initWithPath:(id)a3 selectedFiles:(id)a4 service:(id)a5 mode:(int64_t)a6 allowsMultipleSelection:(BOOL)a7 pickCompletionHandler:(id)a8 saveCompletionHandler:(id)a9
{
  v16 = (__CFString *)a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  if (!v18)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"WFFilePickerViewController.m", 50, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)WFFilePickerViewController;
  objc_super v21 = [(WFFilePickerViewController *)&v38 initWithNibName:0 bundle:0];
  CGRect v22 = v21;
  if (v21)
  {
    if (v16) {
      CGFloat v23 = v16;
    }
    else {
      CGFloat v23 = @"/";
    }
    objc_storeStrong((id *)&v21->_path, v23);
    objc_storeStrong((id *)&v22->_service, a5);
    v22->_mode = a6;
    v22->_allowsMultipleSelection = a7;
    double v24 = v17;
    if (!v17) {
      double v24 = objc_opt_new();
    }
    objc_storeStrong((id *)&v22->_selectedFiles, v24);
    if (!v17) {

    }
    CGFloat v25 = _Block_copy(v19);
    id pickCompletionHandler = v22->_pickCompletionHandler;
    v22->_id pickCompletionHandler = v25;

    objc_super v27 = _Block_copy(v20);
    id saveCompletionHandler = v22->_saveCompletionHandler;
    v22->_id saveCompletionHandler = v27;

    id v29 = [[WFFilePickerResultsViewController alloc] initWithFileListDelegate:v22];
    v30 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:v29];
    [v30 setSearchResultsUpdater:v22];
    objc_storeStrong((id *)&v22->_searchController, v30);
    if ([(NSString *)v22->_path isEqualToString:@"/"])
    {
      id v31 = [(WFFilePickerViewController *)v22 service];
      [(id)objc_opt_class() serviceName];
    }
    else
    {
      id v31 = [(WFFilePickerViewController *)v22 path];
      [v31 lastPathComponent];
    v32 = };
    [(WFFilePickerViewController *)v22 setTitle:v32];

    v33 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v22 action:sel_cancel];
    v34 = [(WFFilePickerViewController *)v22 navigationItem];
    [v34 setRightBarButtonItem:v33];

    id v35 = v22;
  }

  return v22;
}

- (id)initForSavingFilesAtPath:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  return [(WFFilePickerViewController *)self initWithPath:a3 selectedFiles:0 service:a4 mode:1 allowsMultipleSelection:0 pickCompletionHandler:0 saveCompletionHandler:a5];
}

- (id)initForPickingFilesAtPath:(id)a3 service:(id)a4 allowsMultipleSelection:(BOOL)a5 completionHandler:(id)a6
{
  return [(WFFilePickerViewController *)self initWithPath:a3 selectedFiles:0 service:a4 mode:0 allowsMultipleSelection:a5 pickCompletionHandler:a6 saveCompletionHandler:0];
}

@end