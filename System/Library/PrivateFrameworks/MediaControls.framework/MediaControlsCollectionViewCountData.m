@interface MediaControlsCollectionViewCountData
- (BOOL)hasPendingChanges;
- (BOOL)validateCountForNumberOfItems:(int64_t)a3;
- (MediaControlsCollectionViewCountData)init;
- (MediaControlsCollectionViewCountData)initWithNumberOfItems:(int64_t)a3;
- (NSIndexSet)deletedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)updatedIndexes;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfItems;
- (void)applyChanges;
- (void)deleteItemAtIndex:(int64_t)a3;
- (void)deleteItemsAtIndexes:(id)a3;
- (void)insertItemAtIndex:(int64_t)a3;
- (void)insertItemsAtIndexes:(id)a3;
- (void)moveItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4;
- (void)reloadItemAtIndex:(int64_t)a3;
- (void)reloadItemsAtIndexes:(id)a3;
- (void)setHasPendingChanges:(BOOL)a3;
- (void)setNumberOfItems:(int64_t)a3;
@end

@implementation MediaControlsCollectionViewCountData

- (MediaControlsCollectionViewCountData)init
{
  v10.receiver = self;
  v10.super_class = (Class)MediaControlsCollectionViewCountData;
  v2 = [(MediaControlsCollectionViewCountData *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    insertedIndexes = v2->_insertedIndexes;
    v2->_insertedIndexes = v3;

    v5 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    deletedIndexes = v2->_deletedIndexes;
    v2->_deletedIndexes = v5;

    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    updatedIndexes = v2->_updatedIndexes;
    v2->_updatedIndexes = v7;
  }
  return v2;
}

- (MediaControlsCollectionViewCountData)initWithNumberOfItems:(int64_t)a3
{
  result = [(MediaControlsCollectionViewCountData *)self init];
  if (result) {
    result->_numberOfItems = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MediaControlsCollectionViewCountData alloc];
  int64_t numberOfItems = self->_numberOfItems;

  return [(MediaControlsCollectionViewCountData *)v4 initWithNumberOfItems:numberOfItems];
}

- (NSIndexSet)insertedIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_insertedIndexes copy];

  return (NSIndexSet *)v2;
}

- (NSIndexSet)deletedIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_deletedIndexes copy];

  return (NSIndexSet *)v2;
}

- (NSIndexSet)updatedIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_updatedIndexes copy];

  return (NSIndexSet *)v2;
}

- (void)insertItemAtIndex:(int64_t)a3
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_insertedIndexes addIndex:a3];
}

- (void)insertItemsAtIndexes:(id)a3
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_insertedIndexes addIndexes:a3];
}

- (void)deleteItemAtIndex:(int64_t)a3
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_deletedIndexes addIndex:a3];
}

- (void)deleteItemsAtIndexes:(id)a3
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_deletedIndexes addIndexes:a3];
}

- (void)moveItemAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_deletedIndexes addIndex:a3];
  insertedIndexes = self->_insertedIndexes;

  [(NSMutableIndexSet *)insertedIndexes addIndex:a4];
}

- (void)reloadItemAtIndex:(int64_t)a3
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_updatedIndexes addIndex:a3];
}

- (void)reloadItemsAtIndexes:(id)a3
{
  self->_hasPendingChanges = 1;
  [(NSMutableIndexSet *)self->_updatedIndexes addIndexes:a3];
}

- (void)applyChanges
{
  uint64_t v3 = [(NSMutableIndexSet *)self->_insertedIndexes count];
  self->_numberOfItems += v3 - [(NSMutableIndexSet *)self->_deletedIndexes count];
  [(NSMutableIndexSet *)self->_insertedIndexes removeAllIndexes];
  [(NSMutableIndexSet *)self->_deletedIndexes removeAllIndexes];
  [(NSMutableIndexSet *)self->_updatedIndexes removeAllIndexes];
  self->_hasPendingChanges = 0;
}

- (BOOL)validateCountForNumberOfItems:(int64_t)a3
{
  uint64_t v5 = [(NSMutableIndexSet *)self->_insertedIndexes count];
  return v5 - [(NSMutableIndexSet *)self->_deletedIndexes count] + self->_numberOfItems == a3;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_int64_t numberOfItems = a3;
}

- (BOOL)hasPendingChanges
{
  return self->_hasPendingChanges;
}

- (void)setHasPendingChanges:(BOOL)a3
{
  self->_hasPendingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);

  objc_storeStrong((id *)&self->_insertedIndexes, 0);
}

@end