@interface FPItemCollectionItemIDBasedDiffs
- (BOOL)containsChanges;
- (NSMutableArray)deletedItemIDs;
- (NSMutableArray)updatedItems;
- (NSMutableDictionary)replacedItemsByFormerID;
- (void)setDeletedItemIDs:(id)a3;
- (void)setReplacedItemsByFormerID:(id)a3;
- (void)setUpdatedItems:(id)a3;
@end

@implementation FPItemCollectionItemIDBasedDiffs

- (BOOL)containsChanges
{
  v3 = [(FPItemCollectionItemIDBasedDiffs *)self deletedItemIDs];
  uint64_t v4 = [v3 count];
  v5 = [(FPItemCollectionItemIDBasedDiffs *)self updatedItems];
  uint64_t v6 = [v5 count] + v4;
  v7 = [(FPItemCollectionItemIDBasedDiffs *)self replacedItemsByFormerID];
  LOBYTE(v6) = v6 + [v7 count] != 0;

  return v6;
}

- (NSMutableArray)deletedItemIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeletedItemIDs:(id)a3
{
}

- (NSMutableArray)updatedItems
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUpdatedItems:(id)a3
{
}

- (NSMutableDictionary)replacedItemsByFormerID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReplacedItemsByFormerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedItemsByFormerID, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);

  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
}

@end