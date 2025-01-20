@interface FPItemCollectionIndexPathBasedDiffs
- (BOOL)containsChanges;
- (NSMutableArray)movedDestinationIndexPaths;
- (NSMutableArray)movedSourceIndexPaths;
- (NSMutableIndexSet)deletedIndexes;
- (NSMutableIndexSet)insertedIndexes;
- (NSMutableIndexSet)updatedIndexes;
- (void)setDeletedIndexes:(id)a3;
- (void)setInsertedIndexes:(id)a3;
- (void)setMovedDestinationIndexPaths:(id)a3;
- (void)setMovedSourceIndexPaths:(id)a3;
- (void)setUpdatedIndexes:(id)a3;
@end

@implementation FPItemCollectionIndexPathBasedDiffs

- (BOOL)containsChanges
{
  v3 = [(FPItemCollectionIndexPathBasedDiffs *)self movedSourceIndexPaths];
  uint64_t v4 = [v3 count];
  v5 = [(FPItemCollectionIndexPathBasedDiffs *)self movedDestinationIndexPaths];
  uint64_t v6 = [v5 count] + v4;
  v7 = [(FPItemCollectionIndexPathBasedDiffs *)self deletedIndexes];
  uint64_t v8 = [v7 count];
  v9 = [(FPItemCollectionIndexPathBasedDiffs *)self insertedIndexes];
  uint64_t v10 = v6 + v8 + [v9 count];
  v11 = [(FPItemCollectionIndexPathBasedDiffs *)self updatedIndexes];
  LOBYTE(v10) = v10 + [v11 count] != 0;

  return v10;
}

- (NSMutableArray)movedSourceIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMovedSourceIndexPaths:(id)a3
{
}

- (NSMutableArray)movedDestinationIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMovedDestinationIndexPaths:(id)a3
{
}

- (NSMutableIndexSet)deletedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeletedIndexes:(id)a3
{
}

- (NSMutableIndexSet)insertedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInsertedIndexes:(id)a3
{
}

- (NSMutableIndexSet)updatedIndexes
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdatedIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_movedDestinationIndexPaths, 0);

  objc_storeStrong((id *)&self->_movedSourceIndexPaths, 0);
}

@end