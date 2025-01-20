@interface SHLLibraryBatch
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChanges;
- (NSSet)deletions;
- (NSSet)insertions;
- (SHLLibraryBatch)initWithCoder:(id)a3;
- (SHLLibraryBatch)initWithInsertions:(id)a3 deletions:(id)a4;
- (id)differenceOfBatch:(id)a3;
- (id)subdivideIntoBatchesOfSize:(int64_t)a3;
- (int64_t)numberOfItems;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHLLibraryBatch

- (SHLLibraryBatch)initWithInsertions:(id)a3 deletions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHLLibraryBatch;
  v9 = [(SHLLibraryBatch *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_insertions, a3);
    objc_storeStrong((id *)&v10->_deletions, a4);
  }

  return v10;
}

- (SHLLibraryBatch)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"libraryBatchInsertions"];
  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"libraryBatchDeletions"];

  objc_super v12 = [(SHLLibraryBatch *)self initWithInsertions:v8 deletions:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  insertions = self->_insertions;
  id v5 = a3;
  [v5 encodeObject:insertions forKey:@"libraryBatchInsertions"];
  [v5 encodeObject:self->_deletions forKey:@"libraryBatchDeletions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)differenceOfBatch:(id)a3
{
  id v4 = a3;
  id v5 = [(SHLLibraryBatch *)self insertions];
  id v6 = [v5 mutableCopy];

  id v7 = [(SHLLibraryBatch *)self deletions];
  id v8 = [v7 mutableCopy];

  uint64_t v9 = [v4 insertions];
  [v6 minusSet:v9];

  v10 = [v4 deletions];

  [v8 minusSet:v10];
  v11 = [SHLLibraryBatch alloc];
  id v12 = [v6 copy];
  id v13 = [v8 copy];
  v14 = [(SHLLibraryBatch *)v11 initWithInsertions:v12 deletions:v13];

  return v14;
}

- (id)subdivideIntoBatchesOfSize:(int64_t)a3
{
  id v5 = +[NSMutableArray array];
  id v6 = [(SHLLibraryBatch *)self insertions];
  id v7 = [v6 allObjects];
  id v8 = [v7 mutableCopy];

  uint64_t v9 = [(SHLLibraryBatch *)self deletions];
  v10 = [v9 allObjects];
  id v11 = [v10 mutableCopy];
  while (1)
  {

    if (![v8 count] && !objc_msgSend(v11, "count")) {
      break;
    }
    uint64_t v9 = +[NSMutableArray arrayWithCapacity:a3];
    v10 = +[NSMutableArray arrayWithCapacity:a3];
    do
    {
      id v12 = (char *)[v9 count];
      id v13 = [v10 count];
      if ([v8 count] && &v12[(void)v13] < (char *)a3)
      {
        v14 = [v8 firstObject];
        [v8 removeObjectAtIndex:0];
        [v9 addObject:v14];
      }
      v15 = (char *)[v9 count];
      id v16 = [v10 count];
      if ([v11 count] && &v15[(void)v16] < (char *)a3)
      {
        v17 = [v11 firstObject];
        [v11 removeObjectAtIndex:0];
        [v10 addObject:v17];
      }
      v18 = (char *)[v9 count];
      id v19 = [v10 count];
      if ([v8 count]) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = [v11 count] == 0;
      }
    }
    while (&v18[(void)v19] < (char *)a3 && !v20);
    id v21 = [v9 copy];
    v22 = +[NSSet setWithArray:v21];

    id v23 = [v10 copy];
    v24 = +[NSSet setWithArray:v23];

    v25 = [[SHLLibraryBatch alloc] initWithInsertions:v22 deletions:v24];
    [v5 addObject:v25];
  }
  id v26 = [v5 copy];

  return v26;
}

- (BOOL)hasChanges
{
  return [(SHLLibraryBatch *)self numberOfItems] > 0;
}

- (int64_t)numberOfItems
{
  v3 = [(SHLLibraryBatch *)self insertions];
  id v4 = (char *)[v3 count];
  id v5 = [(SHLLibraryBatch *)self deletions];
  id v6 = &v4[(void)[v5 count]];

  return (int64_t)v6;
}

- (NSSet)insertions
{
  return self->_insertions;
}

- (NSSet)deletions
{
  return self->_deletions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletions, 0);

  objc_storeStrong((id *)&self->_insertions, 0);
}

@end