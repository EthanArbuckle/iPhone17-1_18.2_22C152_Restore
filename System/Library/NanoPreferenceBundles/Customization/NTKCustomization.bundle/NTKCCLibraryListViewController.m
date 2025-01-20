@interface NTKCCLibraryListViewController
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (NSMutableArray)faceVCs;
- (NTKCCLibraryListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NTKPersistentFaceCollection)library;
- (UITableView)tableView;
- (id)_viewControllerForFace:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadFaces;
- (void)_removeViewControllerForFace:(id)a3;
- (void)_updateTitle;
- (void)dealloc;
- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollection:(id)a3 didSelectFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollectionDidLoad:(id)a3;
- (void)faceCollectionDidReorderFaces:(id)a3;
- (void)faceConfigurationDidChange:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFaceVCs:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKCCLibraryListViewController

- (NTKCCLibraryListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCCLibraryListViewController;
  v4 = [(NTKCCLibraryListViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NTKCompanionFaceCollectionsManager sharedInstance];
    v6 = +[CLKDevice currentDevice];
    v7 = [v5 sharedFaceCollectionForDevice:v6 forCollectionIdentifier:NTKCollectionIdentifierLibraryFaces];
    [(NTKCCLibraryListViewController *)v4 setLibrary:v7];

    [(NTKPersistentFaceCollection *)v4->_library addObserver:v4];
    [(NTKCCLibraryListViewController *)v4 _reloadFaces];
    [(NTKCCLibraryListViewController *)v4 _updateTitle];
  }
  return v4;
}

- (void)dealloc
{
  [(NTKPersistentFaceCollection *)self->_library removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKCCLibraryListViewController;
  [(NTKCCLibraryListViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCCLibraryListViewController;
  [(NTKCCLibraryListViewController *)&v12 viewDidLoad];
  id v3 = objc_alloc((Class)UITableView);
  v4 = [(NTKCCLibraryListViewController *)self view];
  [v4 bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:style:", 0);
  [(NTKCCLibraryListViewController *)self setTableView:v5];

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:0];
  [(UITableView *)self->_tableView setEstimatedRowHeight:120.0];
  v6 = BPSBackgroundColor();
  [(UITableView *)self->_tableView setBackgroundColor:v6];

  v7 = NTKCSeparatorColor();
  [(UITableView *)self->_tableView setSeparatorColor:v7];

  [(UITableView *)self->_tableView setIndicatorStyle:2];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
  tableView = self->_tableView;
  uint64_t v9 = objc_opt_class();
  v10 = +[NTKCCLibraryListCell reuseIdentifier];
  [(UITableView *)tableView registerClass:v9 forCellReuseIdentifier:v10];

  v11 = [(NTKCCLibraryListViewController *)self view];
  [v11 addSubview:self->_tableView];

  [(UITableView *)self->_tableView contentInset];
  [(UITableView *)self->_tableView setContentInset:4.0];
  if ([(NTKCCLibraryListViewController *)self isEditing]) {
    [(UITableView *)self->_tableView setEditing:1 animated:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCLibraryListViewController;
  [(NTKCCLibraryListViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(NTKCCLibraryListViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCCLibraryListViewController;
  [(NTKCCLibraryListViewController *)&v9 viewWillAppear:a3];
  if ([(NTKCCLibraryListViewController *)self isMovingToParentViewController])
  {
    id v4 = [(NTKPersistentFaceCollection *)self->_library selectedFaceIndex];
    unint64_t v5 = [(UITableView *)self->_tableView numberOfRowsInSection:0];
    if ((unint64_t)v4 >= v5)
    {
      uint64_t v6 = v5;
      v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_14C5C((uint64_t)v4, v6, v7);
      }
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_12480;
      v8[3] = &unk_24E50;
      v8[4] = self;
      v8[5] = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKCCLibraryListViewController;
  -[NTKCCLibraryListViewController setEditing:animated:](&v7, "setEditing:animated:");
  [(UITableView *)self->_tableView setEditing:v5 animated:v4];
}

- (void)_reloadFaces
{
  library = self->_library;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_125E0;
  v3[3] = &unk_247C0;
  v3[4] = self;
  [(NTKPersistentFaceCollection *)library enumerateFacesUsingBlock:v3];
}

- (void)_updateTitle
{
  id v3 = NTKCCustomizationLocalizedString();
  id v5 = [v3 stringByAppendingString:@" (%d)"];

  BOOL v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, [(NTKPersistentFaceCollection *)self->_library numberOfFaces]);
  [(NTKCCLibraryListViewController *)self setTitle:v4];
}

- (id)_viewControllerForFace:(id)a3
{
  id v4 = a3;
  faceVCs = self->_faceVCs;
  if (!faceVCs)
  {
    uint64_t v6 = objc_opt_new();
    [(NTKCCLibraryListViewController *)self setFaceVCs:v6];

    faceVCs = self->_faceVCs;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v7 = faceVCs;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      objc_super v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      objc_msgSend(v12, "face", (void)v16);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v4) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v14 = v12;

    if (v14) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  id v14 = [objc_alloc((Class)NTKCompanionFaceViewController) initWithFace:v4];
  [(NSMutableArray *)self->_faceVCs addObject:v14];
LABEL_14:

  return v14;
}

- (void)_removeViewControllerForFace:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_faceVCs;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "face", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    objc_super v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_faceVCs removeObject:v12];
    id v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NTKPersistentFaceCollection *)self->_library numberOfFaces];
    int v8 = 134217984;
    id v9 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Library List: number of faces %ld", (uint8_t *)&v8, 0xCu);
  }

  return (int64_t)[(NTKPersistentFaceCollection *)self->_library numberOfFaces];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Library List: cellForRowAtIndexPath %@", (uint8_t *)&v16, 0xCu);
  }

  tableView = self->_tableView;
  int v8 = +[NTKCCLibraryListCell reuseIdentifier];
  id v9 = [(UITableView *)tableView dequeueReusableCellWithIdentifier:v8 forIndexPath:v5];

  uint64_t v10 = -[NTKPersistentFaceCollection faceAtIndex:](self->_library, "faceAtIndex:", [v5 row]);
  id v11 = [(NTKPersistentFaceCollection *)self->_library selectedFaceIndex];
  objc_super v12 = [v10 name];
  [v9 setFaceName:v12];

  long long v13 = [(NTKCCLibraryListViewController *)self _viewControllerForFace:v10];
  long long v14 = [v13 faceView];
  [v9 setFaceView:v14];

  objc_msgSend(v9, "setCurrentFace:", objc_msgSend(v5, "row") == v11);

  return v9;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return (unint64_t)[(NTKPersistentFaceCollection *)self->_library numberOfFaces] > 1;
}

- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = NTKCCustomizationLocalizedString();
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  long long v13 = sub_12D88;
  long long v14 = &unk_24EC8;
  long long v15 = self;
  id v16 = v5;
  id v7 = v5;
  int v8 = +[UITableViewRowAction rowActionWithStyle:0 title:v6 handler:&v11];

  id v17 = v8;
  id v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1, v11, v12, v13, v14, v15);

  return v9;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (([v7 isEqual:v9] & 1) == 0)
  {
    int v8 = -[NTKPersistentFaceCollection faceAtIndex:](self->_library, "faceAtIndex:", [v9 row]);
    -[NTKPersistentFaceCollection moveFace:toIndex:suppressingCallbackToObserver:](self->_library, "moveFace:toIndex:suppressingCallbackToObserver:", v8, [v7 row], self);
    NTKCCAnalyticsIncrement();
  }
}

- (void)faceCollection:(id)a3 didSelectFace:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  int v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v7;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Library List: from library did select face (%@) at index %ld", buf, 0x16u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(UITableView *)self->_tableView visibleCells];
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v14 currentFace]) {
          [v14 setCurrentFace:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  tableView = self->_tableView;
  id v16 = +[NSIndexPath indexPathForRow:a5 inSection:0];
  id v17 = [(UITableView *)tableView cellForRowAtIndexPath:v16];

  [v17 setCurrentFace:1];
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  int v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v7;
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Library List: from library did add face (%@), inserting row %ld", buf, 0x16u);
  }

  [(NTKCCLibraryListViewController *)self _updateTitle];
  tableView = self->_tableView;
  id v10 = +[NSIndexPath indexPathForRow:a5 inSection:0];
  uint64_t v12 = v10;
  id v11 = +[NSArray arrayWithObjects:&v12 count:1];
  [(UITableView *)tableView insertRowsAtIndexPaths:v11 withRowAnimation:100];
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  int v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v7;
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Library List: from library did remove face (%@), deleting row %ld", buf, 0x16u);
  }

  [(NTKCCLibraryListViewController *)self _removeViewControllerForFace:v7];
  [(NTKCCLibraryListViewController *)self _updateTitle];
  tableView = self->_tableView;
  id v10 = +[NSIndexPath indexPathForRow:a5 inSection:0];
  uint64_t v12 = v10;
  id v11 = +[NSArray arrayWithObjects:&v12 count:1];
  [(UITableView *)tableView deleteRowsAtIndexPaths:v11 withRowAnimation:100];
}

- (void)faceCollectionDidReorderFaces:(id)a3
{
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Library List: collection did reorder, reloading section", v7, 2u);
  }

  tableView = self->_tableView;
  id v6 = +[NSIndexSet indexSetWithIndex:0];
  [(UITableView *)tableView reloadSections:v6 withRowAnimation:100];
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Library List: collection did load, reloading data", v5, 2u);
  }

  [(NTKCCLibraryListViewController *)self _updateTitle];
  [(UITableView *)self->_tableView reloadData];
}

- (void)faceConfigurationDidChange:(id)a3
{
  library = self->_library;
  id v5 = a3;
  id v6 = [(NTKPersistentFaceCollection *)library indexOfFace:v5];
  tableView = self->_tableView;
  int v8 = +[NSIndexPath indexPathForRow:v6 inSection:0];
  id v10 = [(UITableView *)tableView cellForRowAtIndexPath:v8];

  id v9 = [v5 name];

  [v10 setFaceName:v9];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NTKPersistentFaceCollection)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (NSMutableArray)faceVCs
{
  return self->_faceVCs;
}

- (void)setFaceVCs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceVCs, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end