@interface CKAbstractReviewViewController
- (CKAbstractReviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIBarButtonItem)cancelEditingBarButtonItem;
- (UIBarButtonItem)deleteBarButtonItem;
- (UITableView)tableView;
- (UIView)topLineView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_handleCancel;
- (void)_handleDelete;
- (void)_updateNavigationItemState;
- (void)dealloc;
- (void)loadView;
- (void)setCancelEditingBarButtonItem:(id)a3;
- (void)setDeleteBarButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setTableView:(id)a3;
- (void)setTopLineView:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CKAbstractReviewViewController

- (CKAbstractReviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKAbstractReviewViewController;
  v4 = [(CKAbstractReviewViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(UITableView *)self->_tableView setDataSource:0];
  [(UITableView *)self->_tableView setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)CKAbstractReviewViewController;
  [(CKAbstractReviewViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(CKAbstractReviewViewController *)self setTableView:v8];

  objc_msgSend((id)-[CKAbstractReviewViewController tableViewCellClass](self, "tableViewCellClass"), "requestedHeight");
  double v10 = v9;
  v11 = [(CKAbstractReviewViewController *)self tableView];
  [v11 setRowHeight:v10];

  v12 = [(CKAbstractReviewViewController *)self tableView];
  objc_msgSend(v12, "setSeparatorInset:", 0.0, 66.0, 0.0, 0.0);

  v13 = [(CKAbstractReviewViewController *)self tableView];
  [v13 setAllowsSelection:1];

  v14 = [(CKAbstractReviewViewController *)self tableView];
  [v14 setAllowsMultipleSelection:0];

  v15 = [(CKAbstractReviewViewController *)self tableView];
  [v15 setAllowsMultipleSelectionDuringEditing:1];

  v16 = [(CKAbstractReviewViewController *)self tableView];
  uint64_t v17 = [(CKAbstractReviewViewController *)self tableViewCellClass];
  v18 = [(CKAbstractReviewViewController *)self tableViewCellReuseIdentifier];
  [v16 registerClass:v17 forCellReuseIdentifier:v18];

  v19 = [(CKAbstractReviewViewController *)self tableView];
  uint64_t v20 = objc_opt_class();
  v21 = +[CKStorageLoadingCell reuseIdentifier];
  [v19 registerClass:v20 forCellReuseIdentifier:v21];

  v22 = [(CKAbstractReviewViewController *)self tableView];
  objc_msgSend(v22, "setContentInset:", 35.0, 0.0, 0.0, 0.0);

  v23 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v24 = [(CKAbstractReviewViewController *)self tableView];
  [v24 setBackgroundColor:v23];

  v25 = [(CKAbstractReviewViewController *)self tableView];
  [v25 setDataSource:self];

  v26 = [(CKAbstractReviewViewController *)self tableView];
  [v26 setDelegate:self];

  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
  [(CKAbstractReviewViewController *)self setTopLineView:v27];

  v28 = [(CKAbstractReviewViewController *)self tableView];
  v29 = [v28 separatorColor];
  v30 = [(CKAbstractReviewViewController *)self topLineView];
  [v30 setBackgroundColor:v29];

  v31 = [(CKAbstractReviewViewController *)self tableView];
  v32 = [(CKAbstractReviewViewController *)self topLineView];
  [v31 addSubview:v32];

  v33 = [(CKAbstractReviewViewController *)self navigationBarTitle];
  [(CKAbstractReviewViewController *)self setTitle:v33];

  id v34 = [(CKAbstractReviewViewController *)self tableView];
  [(CKAbstractReviewViewController *)self setView:v34];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKAbstractReviewViewController;
  [(CKAbstractReviewViewController *)&v4 viewWillAppear:a3];
  [(CKAbstractReviewViewController *)self _updateNavigationItemState];
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CKAbstractReviewViewController;
  [(CKAbstractReviewViewController *)&v8 viewWillLayoutSubviews];
  id v3 = [(CKAbstractReviewViewController *)self tableView];
  [v3 frame];
  double v5 = v4;
  if (CKPixelWidth_once != -1) {
    dispatch_once(&CKPixelWidth_once, &__block_literal_global_1);
  }
  double v6 = *(double *)&CKPixelWidth_sPixel;
  double v7 = [(CKAbstractReviewViewController *)self topLineView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v5, v6);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAbstractReviewViewController;
  -[CKAbstractReviewViewController setEditing:animated:](&v8, sel_setEditing_animated_);
  double v7 = [(CKAbstractReviewViewController *)self tableView];
  [v7 setEditing:v5 animated:v4];

  [(CKAbstractReviewViewController *)self _updateNavigationItemState];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CKAbstractReviewViewController *)self tableView];

  if (a4 || v7 != v6) {
    return 0;
  }

  return [(CKAbstractReviewViewController *)self numberOfModelObjects];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[CKAbstractReviewViewController modelObjectAtIndex:](self, "modelObjectAtIndex:", [v5 row]);
  id v7 = +[CKStorageLoadingCell reuseIdentifier];
  int v8 = [v6 isEqual:v7];

  double v9 = [(CKAbstractReviewViewController *)self tableView];
  if (v8)
  {
    double v10 = +[CKStorageLoadingCell reuseIdentifier];
    v11 = [v9 dequeueReusableCellWithIdentifier:v10 forIndexPath:v5];
  }
  else
  {
    v12 = [(CKAbstractReviewViewController *)self tableViewCellReuseIdentifier];
    v11 = [v9 dequeueReusableCellWithIdentifier:v12 forIndexPath:v5];

    [v11 setModelObject:v6];
  }

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(CKAbstractReviewViewController *)self tableView];
  v11 = (void *)v10;
  if (v9 && a4 == 1 && (id)v10 == v8 && ![v9 section])
  {
    unint64_t v12 = [v9 row];
    unint64_t v13 = [(CKAbstractReviewViewController *)self numberOfModelObjects];

    if (v12 < v13)
    {
      v14 = -[CKAbstractReviewViewController modelObjectAtIndex:](self, "modelObjectAtIndex:", [v9 row]);
      [(CKAbstractReviewViewController *)self deleteModelObjectAndUnderlyingData:v14];
      v15 = [(CKAbstractReviewViewController *)self tableView];
      v17[0] = v9;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      [v15 deleteRowsAtIndexPaths:v16 withRowAnimation:100];
    }
  }
  else
  {
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ((-[CKAbstractReviewViewController isEditing](self, "isEditing") & 1) == 0 && ![v5 section]) {
    -[CKAbstractReviewViewController didSelectModelObjectAtIndex:](self, "didSelectModelObjectAtIndex:", [v5 row]);
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  BOOL v4 = [(CKAbstractReviewViewController *)self tableView];
  id v5 = [(CKAbstractReviewViewController *)self tableView];
  id v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:0];

  [(CKAbstractReviewViewController *)self reloadModelData];
  id v7 = [(CKAbstractReviewViewController *)self tableView];
  [v7 reloadData];
}

- (void)_handleCancel
{
}

- (void)_handleDelete
{
  id v3 = [(CKAbstractReviewViewController *)self tableView];
  BOOL v4 = [v3 indexPathsForSelectedRows];
  if ([v4 count])
  {
    int v5 = [(CKAbstractReviewViewController *)self isEditing];

    if (v5)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = __Block_byref_object_copy__0;
      v18 = __Block_byref_object_dispose__0;
      id v19 = 0;
      id v19 = [MEMORY[0x1E4F1CA48] array];
      id v6 = [(CKAbstractReviewViewController *)self tableView];
      id v7 = [v6 indexPathsForSelectedRows];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __47__CKAbstractReviewViewController__handleDelete__block_invoke;
      v13[3] = &unk_1E5620D28;
      v13[4] = self;
      v13[5] = &v14;
      [v7 enumerateObjectsUsingBlock:v13];

      id v8 = (void *)v15[5];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47__CKAbstractReviewViewController__handleDelete__block_invoke_2;
      v12[3] = &unk_1E5620D50;
      v12[4] = self;
      [v8 enumerateObjectsUsingBlock:v12];
      id v9 = [(CKAbstractReviewViewController *)self tableView];
      uint64_t v10 = [(CKAbstractReviewViewController *)self tableView];
      v11 = [v10 indexPathsForSelectedRows];
      [v9 deleteRowsAtIndexPaths:v11 withRowAnimation:100];

      _Block_object_dispose(&v14, 8);
    }
  }
  else
  {
  }
  [(CKAbstractReviewViewController *)self setEditing:0 animated:1];
}

void __47__CKAbstractReviewViewController__handleDelete__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (![v5 section])
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "modelObjectAtIndex:", objc_msgSend(v5, "row"));
    [v3 addObject:v4];
  }
}

uint64_t __47__CKAbstractReviewViewController__handleDelete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteModelObjectAndUnderlyingData:a2];
}

- (void)_updateNavigationItemState
{
  id v3 = [(CKAbstractReviewViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = [(CKAbstractReviewViewController *)self navigationItem];
  }
  else
  {
    id v5 = [(CKAbstractReviewViewController *)self parentViewController];
    id v14 = [v5 navigationItem];
  }
  uint64_t v6 = [(CKAbstractReviewViewController *)self isEditing];
  if (v6)
  {
    id v7 = [(CKAbstractReviewViewController *)self cancelEditingBarButtonItem];

    if (!v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancel];
      [(CKAbstractReviewViewController *)self setCancelEditingBarButtonItem:v8];
    }
    id v9 = [(CKAbstractReviewViewController *)self deleteBarButtonItem];

    if (!v9)
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:16 target:self action:sel__handleDelete];
      [(CKAbstractReviewViewController *)self setDeleteBarButtonItem:v10];
    }
    v11 = [(CKAbstractReviewViewController *)self cancelEditingBarButtonItem];
    [v14 setLeftBarButtonItem:v11];

    uint64_t v12 = [(CKAbstractReviewViewController *)self deleteBarButtonItem];
  }
  else
  {
    [v14 setLeftBarButtonItem:0];
    uint64_t v12 = [(CKAbstractReviewViewController *)self editButtonItem];
  }
  unint64_t v13 = (void *)v12;
  [v14 setRightBarButtonItem:v12];

  [v14 setHidesBackButton:v6 animated:1];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIView)topLineView
{
  return self->_topLineView;
}

- (void)setTopLineView:(id)a3
{
}

- (UIBarButtonItem)cancelEditingBarButtonItem
{
  return self->_cancelEditingBarButtonItem;
}

- (void)setCancelEditingBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)deleteBarButtonItem
{
  return self->_deleteBarButtonItem;
}

- (void)setDeleteBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelEditingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end