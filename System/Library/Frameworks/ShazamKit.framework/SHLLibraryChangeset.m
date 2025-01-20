@interface SHLLibraryChangeset
- (NSArray)groupIDsToDelete;
- (NSArray)groupsToAdd;
- (NSArray)groupsToDelete;
- (NSArray)trackIDsToDelete;
- (NSArray)tracksToAdd;
- (NSArray)tracksToDelete;
- (NSMutableSet)groupSetToAdd;
- (NSMutableSet)groupSetToDelete;
- (NSMutableSet)trackSetToAdd;
- (NSMutableSet)trackSetToDelete;
- (SHLLibraryChangeset)init;
- (id)description;
- (void)addGroups:(id)a3;
- (void)addTracks:(id)a3;
- (void)deleteGroups:(id)a3;
- (void)deleteTracks:(id)a3;
- (void)mergeChangeset:(id)a3;
- (void)setGroupSetToAdd:(id)a3;
- (void)setGroupSetToDelete:(id)a3;
- (void)setTrackSetToAdd:(id)a3;
- (void)setTrackSetToDelete:(id)a3;
@end

@implementation SHLLibraryChangeset

- (SHLLibraryChangeset)init
{
  v12.receiver = self;
  v12.super_class = (Class)SHLLibraryChangeset;
  v2 = [(SHLLibraryChangeset *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    trackSetToAdd = v2->_trackSetToAdd;
    v2->_trackSetToAdd = (NSMutableSet *)v3;

    uint64_t v5 = +[NSMutableSet set];
    trackSetToDelete = v2->_trackSetToDelete;
    v2->_trackSetToDelete = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableSet set];
    groupSetToAdd = v2->_groupSetToAdd;
    v2->_groupSetToAdd = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableSet set];
    groupSetToDelete = v2->_groupSetToDelete;
    v2->_groupSetToDelete = (NSMutableSet *)v9;
  }
  return v2;
}

- (NSArray)tracksToAdd
{
  v2 = [(SHLLibraryChangeset *)self trackSetToAdd];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)tracksToDelete
{
  v2 = [(SHLLibraryChangeset *)self trackSetToDelete];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)groupsToAdd
{
  v2 = [(SHLLibraryChangeset *)self groupSetToAdd];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)groupsToDelete
{
  v2 = [(SHLLibraryChangeset *)self groupSetToDelete];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)trackIDsToDelete
{
  v2 = [(SHLLibraryChangeset *)self trackSetToDelete];
  uint64_t v3 = NSStringFromSelector("identifier");
  v4 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", v3];
  uint64_t v5 = [v2 valueForKeyPath:v4];

  v6 = [v5 allObjects];

  return (NSArray *)v6;
}

- (NSArray)groupIDsToDelete
{
  v2 = [(SHLLibraryChangeset *)self groupSetToDelete];
  uint64_t v3 = NSStringFromSelector("identifier");
  v4 = +[NSString stringWithFormat:@"@distinctUnionOfObjects.%@", v3];
  uint64_t v5 = [v2 valueForKeyPath:v4];

  v6 = [v5 allObjects];

  return (NSArray *)v6;
}

- (void)addTracks:(id)a3
{
  id v9 = a3;
  v4 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:");
  uint64_t v5 = [(SHLLibraryChangeset *)self trackSetToDelete];
  [v4 intersectSet:v5];

  if ([v4 count])
  {
    uint64_t v7 = +[NSString stringWithFormat:@"Should not try to save and delete tracks at the same time: %@", v4];
    id v8 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v7];

    objc_exception_throw(v8);
  }
  v6 = [(SHLLibraryChangeset *)self trackSetToAdd];
  [v6 addObjectsFromArray:v9];
}

- (void)deleteTracks:(id)a3
{
  id v9 = a3;
  v4 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:");
  uint64_t v5 = [(SHLLibraryChangeset *)self trackSetToAdd];
  [v4 intersectSet:v5];

  if ([v4 count])
  {
    uint64_t v7 = +[NSString stringWithFormat:@"Should not try to save and delete tracks at the same time: %@", v4];
    id v8 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v7];

    objc_exception_throw(v8);
  }
  v6 = [(SHLLibraryChangeset *)self trackSetToDelete];
  [v6 addObjectsFromArray:v9];
}

- (void)addGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableSet setWithArray:v4];
  v6 = [(SHLLibraryChangeset *)self groupSetToDelete];
  [v5 intersectSet:v6];

  if ([v5 count])
  {
    v16 = +[NSString stringWithFormat:@"Should not try to save and delete groups at the same time: %@", v5];
    id v17 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v16];

    objc_exception_throw(v17);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [(SHLLibraryChangeset *)self groupSetToAdd];
        [v13 addObject:v12];

        v14 = [(SHLLibraryChangeset *)self trackSetToAdd];
        v15 = [v12 tracksToSave];
        [v14 addObjectsFromArray:v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)deleteGroups:(id)a3
{
  id v9 = a3;
  id v4 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:");
  uint64_t v5 = [(SHLLibraryChangeset *)self groupSetToAdd];
  [v4 intersectSet:v5];

  if ([v4 count])
  {
    id v7 = +[NSString stringWithFormat:@"Should not try to save and delete groups at the same time: %@", v4];
    id v8 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v7];

    objc_exception_throw(v8);
  }
  v6 = [(SHLLibraryChangeset *)self groupSetToDelete];
  [v6 addObjectsFromArray:v9];
}

- (void)mergeChangeset:(id)a3
{
  if (self != a3)
  {
    id v5 = a3;
    v6 = [v5 tracksToAdd];
    [(SHLLibraryChangeset *)self addTracks:v6];

    id v7 = [v5 tracksToDelete];
    [(SHLLibraryChangeset *)self deleteTracks:v7];

    id v8 = [v5 groupsToAdd];
    [(SHLLibraryChangeset *)self addGroups:v8];

    id v9 = [v5 groupsToDelete];

    [(SHLLibraryChangeset *)self deleteGroups:v9];
  }
}

- (id)description
{
  uint64_t v3 = [(SHLLibraryChangeset *)self trackSetToAdd];
  id v4 = [v3 count];
  id v5 = [(SHLLibraryChangeset *)self tracksToDelete];
  id v6 = [v5 count];
  id v7 = [(SHLLibraryChangeset *)self groupsToAdd];
  id v8 = [v7 count];
  id v9 = [(SHLLibraryChangeset *)self groupsToDelete];
  uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"T: +%lu -%lu G: +%lu -%lu", v4, v6, v8, [v9 count]);

  return v10;
}

- (NSMutableSet)trackSetToAdd
{
  return self->_trackSetToAdd;
}

- (void)setTrackSetToAdd:(id)a3
{
}

- (NSMutableSet)trackSetToDelete
{
  return self->_trackSetToDelete;
}

- (void)setTrackSetToDelete:(id)a3
{
}

- (NSMutableSet)groupSetToAdd
{
  return self->_groupSetToAdd;
}

- (void)setGroupSetToAdd:(id)a3
{
}

- (NSMutableSet)groupSetToDelete
{
  return self->_groupSetToDelete;
}

- (void)setGroupSetToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSetToDelete, 0);
  objc_storeStrong((id *)&self->_groupSetToAdd, 0);
  objc_storeStrong((id *)&self->_trackSetToDelete, 0);

  objc_storeStrong((id *)&self->_trackSetToAdd, 0);
}

@end