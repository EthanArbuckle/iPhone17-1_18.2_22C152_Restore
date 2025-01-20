@interface MRUDiffableDataSource
- (BOOL)supportsEditing;
- (BOOL)supportsReordering;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (MRUDiffableDataSourceDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setSupportsEditing:(BOOL)a3;
- (void)setSupportsReordering:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation MRUDiffableDataSource

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return self->_supportsReordering;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v12 = [(UITableViewDiffableDataSource *)self itemIdentifierForIndexPath:a4];
  v8 = [(UITableViewDiffableDataSource *)self itemIdentifierForIndexPath:v7];
  v9 = [(UITableViewDiffableDataSource *)self snapshot];
  v10 = [(MRUDiffableDataSource *)self delegate];
  uint64_t v11 = [v7 item];

  if (v11)
  {
    if (v8 && ([v12 isEqualToString:v8] & 1) == 0)
    {
      [v9 moveItemWithIdentifier:v12 afterItemWithIdentifier:v8];
      [(UITableViewDiffableDataSource *)self applySnapshot:v9 animatingDifferences:0];
      [v10 dataSource:self moveItemWithIdentifier:v12 aferIndentifier:v8];
    }
  }
  else
  {
    [v9 moveItemWithIdentifier:v12 beforeItemWithIdentifier:v8];
    [(UITableViewDiffableDataSource *)self applySnapshot:v9 animatingDifferences:0];
    [v10 dataSource:self moveItemToTopWithIdentifier:v12];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return self->_supportsEditing;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    v6 = [(UITableViewDiffableDataSource *)self itemIdentifierForIndexPath:a5];
    if (v6)
    {
      id v7 = [(UITableViewDiffableDataSource *)self snapshot];
      v10[0] = v6;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [v7 deleteItemsWithIdentifiers:v8];

      [(UITableViewDiffableDataSource *)self applySnapshot:v7 animatingDifferences:0];
      v9 = [(MRUDiffableDataSource *)self delegate];
      [v9 dataSource:self didDeleteItemWithIdentifier:v6];
    }
  }
}

- (MRUDiffableDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUDiffableDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)supportsReordering
{
  return self->_supportsReordering;
}

- (void)setSupportsReordering:(BOOL)a3
{
  self->_supportsReordering = a3;
}

- (BOOL)supportsEditing
{
  return self->_supportsEditing;
}

- (void)setSupportsEditing:(BOOL)a3
{
  self->_supportsEditing = a3;
}

- (void).cxx_destruct
{
}

@end