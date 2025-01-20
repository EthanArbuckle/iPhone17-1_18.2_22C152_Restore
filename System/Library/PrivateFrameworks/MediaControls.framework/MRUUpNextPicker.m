@interface MRUUpNextPicker
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (MRUDiffableDataSource)diffableDataSource;
- (MRUUpNextDataSource)dataSource;
- (MRUUpNextPicker)initWithFrame:(CGRect)a3 dataSource:(id)a4;
- (UITableView)tableView;
- (id)reponseItemForIndexPath:(id)a3;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forMovie:(id)a4;
- (void)configureCell:(id)a3 forSong:(id)a4;
- (void)configureCell:(id)a3 forTVEpisode:(id)a4;
- (void)dataSource:(id)a3 didDeleteItemWithIdentifier:(id)a4;
- (void)dataSource:(id)a3 moveItemToTopWithIdentifier:(id)a4;
- (void)dataSource:(id)a3 moveItemWithIdentifier:(id)a4 aferIndentifier:(id)a5;
- (void)layoutSubviews;
- (void)setDiffableDataSource:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)upNextDataSource:(id)a3 didChangeResponseItemIDs:(id)a4;
- (void)updateDiffableDataSourceAnimated:(BOOL)a3;
@end

@implementation MRUUpNextPicker

- (MRUUpNextPicker)initWithFrame:(CGRect)a3 dataSource:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MRUUpNextPicker;
  v11 = -[MRUUpNextPicker initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a4);
    [(MRUUpNextDataSource *)v12->_dataSource setDelegate:v12];
    id v13 = objc_alloc(MEMORY[0x1E4FB1D00]);
    [(MRUUpNextPicker *)v12 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    tableView = v12->_tableView;
    v12->_tableView = (UITableView *)v14;

    [(UITableView *)v12->_tableView _setAllowsReorderingWhenNotEditing:1];
    [(UITableView *)v12->_tableView setDelegate:v12];
    [(MRUUpNextPicker *)v12 addSubview:v12->_tableView];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [(UITableView *)v12->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:v17];
    v18 = [MRUDiffableDataSource alloc];
    v19 = v12->_tableView;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __44__MRUUpNextPicker_initWithFrame_dataSource___block_invoke;
    v28 = &unk_1E5F101B0;
    v20 = v12;
    v29 = v20;
    id v30 = v17;
    id v21 = v17;
    uint64_t v22 = [(UITableViewDiffableDataSource *)v18 initWithTableView:v19 cellProvider:&v25];
    id v23 = v20[53];
    v20[53] = (id)v22;

    objc_msgSend(v20[53], "setDelegate:", v20, v25, v26, v27, v28);
    [v20[53] setSupportsEditing:1];
    [v20[53] setSupportsReordering:1];
    [v20 updateDiffableDataSourceAnimated:0];
  }
  return v12;
}

id __44__MRUUpNextPicker_initWithFrame_dataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v6 = *(void **)(*(void *)(a1 + 32) + 408);
  id v7 = a3;
  v8 = [v6 objectForKeyedSubscript:a4];
  v9 = [*(id *)(*(void *)(a1 + 32) + 416) dequeueReusableCellWithIdentifier:*(void *)(a1 + 40) forIndexPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) configureCell:v9 forSong:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) configureCell:v9 forTVEpisode:v8];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*(id *)(a1 + 32) configureCell:v9 forMovie:v8];
      }
    }
  }

  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUUpNextPicker;
  [(MRUUpNextPicker *)&v3 layoutSubviews];
  [(MRUUpNextPicker *)self bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [a3 cellForRowAtIndexPath:v5];
  if ([v6 isUserInteractionEnabled]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  [v7 scrollToRowAtIndexPath:v6 atScrollPosition:1 animated:0];

  id v8 = [(UITableViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v6];

  [(MRUUpNextDataSource *)self->_dataSource playItemWithIdentifier:v8 completion:0];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)dataSource:(id)a3 didDeleteItemWithIdentifier:(id)a4
{
}

- (void)dataSource:(id)a3 moveItemToTopWithIdentifier:(id)a4
{
}

- (void)dataSource:(id)a3 moveItemWithIdentifier:(id)a4 aferIndentifier:(id)a5
{
}

- (void)upNextDataSource:(id)a3 didChangeResponseItemIDs:(id)a4
{
}

- (void)updateDiffableDataSourceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_opt_new();
  [v6 appendSectionsWithIdentifiers:&unk_1F069F308];
  id v5 = [(MRUUpNextDataSource *)self->_dataSource responseItemIDs];
  [v6 appendItemsWithIdentifiers:v5];

  [(UITableViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v6 animatingDifferences:v3];
}

- (id)reponseItemForIndexPath:(id)a3
{
  v4 = [(UITableViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a3];
  id v5 = [(MRUUpNextDataSource *)self->_dataSource objectForKeyedSubscript:v4];

  return v5;
}

- (void)configureCell:(id)a3 forSong:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 title];
  id v8 = [v6 textLabel];
  [v8 setText:v7];

  v9 = [v5 album];
  id v10 = [v9 title];
  v11 = [v6 detailTextLabel];
  [v11 setText:v10];

  id v12 = [v5 artworkCatalog];

  [v6 setArtworkCatalog:v12];
}

- (void)configureCell:(id)a3 forTVEpisode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 title];
  id v8 = [v6 textLabel];
  [v8 setText:v7];

  v9 = [v5 show];
  id v10 = [v9 title];
  v11 = [v6 detailTextLabel];
  [v11 setText:v10];

  id v12 = [v5 artworkCatalog];

  [v6 setArtworkCatalog:v12];
}

- (void)configureCell:(id)a3 forMovie:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 title];
  id v8 = [v6 textLabel];
  [v8 setText:v7];

  id v9 = [v5 artworkCatalog];

  [v6 setArtworkCatalog:v9];
}

- (MRUUpNextDataSource)dataSource
{
  return self->_dataSource;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (MRUDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end