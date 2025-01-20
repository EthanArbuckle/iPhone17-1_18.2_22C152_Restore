@interface CRKTable
+ (CRKTable)tableWithHeaders:(id)a3 keyPaths:(id)a4 objects:(id)a5;
+ (id)parsableTableWithKeyValuePairs:(id)a3;
- (CRKTable)initWithEntries:(id)a3;
- (NSString)stringValue;
- (id)columnLengths;
- (unint64_t)lengthOfLongestObjectInColumn:(unint64_t)a3;
@end

@implementation CRKTable

+ (CRKTable)tableWithHeaders:(id)a3 keyPaths:(id)a4 objects:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[CRKDictionaryRowTableEntries alloc] initWithDictionaryObjects:v9 keys:v8];
  if (v7)
  {
    v11 = [CRKTableEntriesWithRowSpacer alloc];
    v12 = [[CRKRepeatedCharacterTableEntry alloc] initWithCharacter:45];
    v22 = [(CRKTableEntriesWithRowSpacer *)v11 initWithOrigin:v10 index:0 spacerEntry:v12];

    v13 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[CRKRightPaddingTableEntry alloc] initWithObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    v10 = [[CRKTableEntriesWithAddedRow alloc] initWithOrigin:v22 index:0 entries:v13];
  }
  v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntries:v10];

  return (CRKTable *)v20;
}

+ (id)parsableTableWithKeyValuePairs:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 valueForKey:@"value"];
  v5 = [[CRKListTableEntries alloc] initWithArray:v4];
  v6 = [CRKTableEntriesWithColumnSpacer alloc];
  id v7 = [[CRKRightPaddingTableEntry alloc] initWithObject:@"\t"];
  id v8 = [(CRKTableEntriesWithColumnSpacer *)v6 initWithOrigin:v5 index:0 spacerEntry:v7];

  id v9 = [v3 valueForKey:@"key"];
  v10 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [[CRKRightPaddingTableEntry alloc] initWithObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [[CRKTableEntriesWithAddedColumn alloc] initWithOrigin:v8 index:0 entries:v10];
  v18 = [CRKTableEntriesWithColumnSpacer alloc];
  v19 = [[CRKRightPaddingTableEntry alloc] initWithObject:@"\t"];
  v20 = [(CRKTableEntriesWithColumnSpacer *)v18 initWithOrigin:v17 index:0 spacerEntry:v19];

  v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntries:v20];

  return v21;
}

- (CRKTable)initWithEntries:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKTable.m", 63, @"Invalid parameter not satisfying: %@", @"entries" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CRKTable;
  id v7 = [(CRKTable *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->mEntries, a3);
  }

  return v8;
}

- (NSString)stringValue
{
  id v3 = objc_opt_new();
  v4 = [(CRKTable *)self columnLengths];
  if ([(CRKTableEntries *)self->mEntries rowCount])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = objc_opt_new();
      if ([(CRKTableEntries *)self->mEntries columnCount])
      {
        unint64_t v7 = 0;
        do
        {
          id v8 = [(CRKTableEntries *)self->mEntries entryAtRow:v5 column:v7];
          id v9 = [v4 objectAtIndexedSubscript:v7];
          uint64_t v10 = [v9 unsignedIntegerValue];

          objc_super v11 = [v8 stringValueWithLength:v10];
          if ([v11 length] != v10)
          {
            uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
            uint64_t v16 = [NSNumber numberWithUnsignedInteger:v10];
            uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
            [v17 handleFailureInMethod:a2, self, @"CRKTable.m", 84, @"Invalid entry width. Required: %@, Found: %@.", v16, v12 object file lineNumber description];
          }
          [v6 addObject:v11];

          ++v7;
        }
        while (v7 < [(CRKTableEntries *)self->mEntries columnCount]);
      }
      uint64_t v13 = [v6 componentsJoinedByString:@" "];
      [v3 addObject:v13];

      ++v5;
    }
    while (v5 < [(CRKTableEntries *)self->mEntries rowCount]);
  }
  uint64_t v14 = [v3 componentsJoinedByString:@"\n"];

  return (NSString *)v14;
}

- (id)columnLengths
{
  id v3 = objc_opt_new();
  if ([(CRKTableEntries *)self->mEntries columnCount])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKTable lengthOfLongestObjectInColumn:](self, "lengthOfLongestObjectInColumn:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(CRKTableEntries *)self->mEntries columnCount]);
  }

  return v3;
}

- (unint64_t)lengthOfLongestObjectInColumn:(unint64_t)a3
{
  unint64_t v5 = 0;
  if ([(CRKTableEntries *)self->mEntries rowCount])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [(CRKTableEntries *)self->mEntries entryAtRow:v6 column:a3];
      id v8 = [v7 rawStringValue];
      unint64_t v9 = [v8 length];

      if (v5 <= v9) {
        unint64_t v5 = v9;
      }
      ++v6;
    }
    while (v6 < [(CRKTableEntries *)self->mEntries rowCount]);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end