@interface _MFTableViewModelDiff
- (NSIndexSet)changedRows;
- (NSIndexSet)deletedRows;
- (NSIndexSet)insertedRows;
- (void)setChangedRows:(id)a3;
- (void)setDeletedRows:(id)a3;
- (void)setInsertedRows:(id)a3;
@end

@implementation _MFTableViewModelDiff

- (NSIndexSet)changedRows
{
  return self->_changedRows;
}

- (void)setChangedRows:(id)a3
{
}

- (NSIndexSet)deletedRows
{
  return self->_deletedRows;
}

- (void)setDeletedRows:(id)a3
{
}

- (NSIndexSet)insertedRows
{
  return self->_insertedRows;
}

- (void)setInsertedRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedRows, 0);
  objc_storeStrong((id *)&self->_deletedRows, 0);

  objc_storeStrong((id *)&self->_changedRows, 0);
}

@end