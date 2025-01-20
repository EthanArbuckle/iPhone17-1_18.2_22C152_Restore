@interface CRKDictionaryRowTableEntries
- (CRKDictionaryRowTableEntries)initWithDictionaryObjects:(id)a3 keys:(id)a4;
- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (unint64_t)columnCount;
- (unint64_t)rowCount;
@end

@implementation CRKDictionaryRowTableEntries

- (CRKDictionaryRowTableEntries)initWithDictionaryObjects:(id)a3 keys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CRKDictionaryRowTableEntries.m", 22, @"Invalid parameter not satisfying: %@", @"objects" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"CRKDictionaryRowTableEntries.m", 23, @"Invalid parameter not satisfying: %@", @"keys" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)CRKDictionaryRowTableEntries;
  v10 = [(CRKDictionaryRowTableEntries *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    mObjects = v10->mObjects;
    v10->mObjects = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    mKeys = v10->mKeys;
    v10->mKeys = (NSArray *)v13;
  }
  return v10;
}

- (unint64_t)rowCount
{
  return [(NSArray *)self->mObjects count];
}

- (unint64_t)columnCount
{
  return [(NSArray *)self->mKeys count];
}

- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  v6 = [(NSArray *)self->mKeys objectAtIndexedSubscript:a4];
  id v7 = [(NSArray *)self->mObjects objectAtIndexedSubscript:a3];
  id v8 = [CRKRightPaddingTableEntry alloc];
  uint64_t v9 = [v7 valueForKeyPath:v6];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = (void *)v9;
  }
  else {
    uint64_t v11 = &unk_26D81A348;
  }
  v12 = [(CRKRightPaddingTableEntry *)v8 initWithObject:v11];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mKeys, 0);

  objc_storeStrong((id *)&self->mObjects, 0);
}

@end