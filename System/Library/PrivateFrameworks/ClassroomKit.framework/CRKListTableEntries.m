@interface CRKListTableEntries
- (CRKListTableEntries)initWithArray:(id)a3;
- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (unint64_t)columnCount;
- (unint64_t)rowCount;
@end

@implementation CRKListTableEntries

- (CRKListTableEntries)initWithArray:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKListTableEntries.m", 21, @"Invalid parameter not satisfying: %@", @"array" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CRKListTableEntries;
  v6 = [(CRKListTableEntries *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    mArray = v6->mArray;
    v6->mArray = (NSArray *)v7;
  }
  return v6;
}

- (unint64_t)rowCount
{
  return [(NSArray *)self->mArray count];
}

- (unint64_t)columnCount
{
  return 1;
}

- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  v6 = [CRKRightPaddingTableEntry alloc];
  uint64_t v7 = [(NSArray *)self->mArray objectAtIndexedSubscript:a3];
  v8 = [(CRKRightPaddingTableEntry *)v6 initWithObject:v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end