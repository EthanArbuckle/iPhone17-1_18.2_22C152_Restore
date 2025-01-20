@interface EFNSSetDifference
- (BOOL)hasChanges;
- (EFNSSetDifference)init;
- (EFNSSetDifference)initWithInsertedObjects:(id)a3 removedObjects:(id)a4;
- (NSSet)insertions;
- (NSSet)removals;
@end

@implementation EFNSSetDifference

- (EFNSSetDifference)initWithInsertedObjects:(id)a3 removedObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFNSSetDifference;
  v8 = [(EFNSSetDifference *)&v14 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (NSSet *)v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CAD0] set];
    }
    insertions = v8->_insertions;
    v8->_insertions = v9;

    if (v7)
    {
      v11 = (NSSet *)v7;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CAD0] set];
    }
    removals = v8->_removals;
    v8->_removals = v11;
  }
  return v8;
}

- (EFNSSetDifference)init
{
  return [(EFNSSetDifference *)self initWithInsertedObjects:0 removedObjects:0];
}

- (BOOL)hasChanges
{
  v3 = [(EFNSSetDifference *)self insertions];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(EFNSSetDifference *)self removals];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (NSSet)insertions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)removals
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_insertions, 0);
}

@end