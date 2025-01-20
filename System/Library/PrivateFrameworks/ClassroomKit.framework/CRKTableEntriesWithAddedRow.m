@interface CRKTableEntriesWithAddedRow
- (CRKTableEntriesWithAddedRow)initWithOrigin:(id)a3 index:(unint64_t)a4 entries:(id)a5;
- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (unint64_t)columnCount;
- (unint64_t)rowCount;
@end

@implementation CRKTableEntriesWithAddedRow

- (CRKTableEntriesWithAddedRow)initWithOrigin:(id)a3 index:(unint64_t)a4 entries:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CRKTableEntriesWithAddedRow.m", 22, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"CRKTableEntriesWithAddedRow.m", 23, @"Invalid parameter not satisfying: %@", @"entries" object file lineNumber description];

LABEL_3:
  if ([v10 rowCount] < a4)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = [NSNumber numberWithUnsignedInteger:a4];
    [v21 handleFailureInMethod:a2, self, @"CRKTableEntriesWithAddedRow.m", 24, @"Invalid row index %@", v22 object file lineNumber description];
  }
  uint64_t v13 = [v10 columnCount];
  if (v13 != [v12 count])
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "columnCount"));
    [v23 handleFailureInMethod:a2, self, @"CRKTableEntriesWithAddedRow.m", 25, @"Attempt to add a row of width %@ to a table of width %@", v24, v25 object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)CRKTableEntriesWithAddedRow;
  v14 = [(CRKTableEntriesWithAddedRow *)&v26 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mOrigin, a3);
    v15->mIndex = a4;
    uint64_t v16 = [v12 copy];
    mEntries = v15->mEntries;
    v15->mEntries = (NSArray *)v16;
  }
  return v15;
}

- (unint64_t)rowCount
{
  return [(CRKTableEntries *)self->mOrigin rowCount] + 1;
}

- (unint64_t)columnCount
{
  return [(CRKTableEntries *)self->mOrigin columnCount];
}

- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  unint64_t mIndex = self->mIndex;
  if (mIndex <= a3)
  {
    if (mIndex == a3)
    {
      v6 = [(NSArray *)self->mEntries objectAtIndexedSubscript:a4];
      goto LABEL_7;
    }
    mOrigin = self->mOrigin;
    --a3;
  }
  else
  {
    mOrigin = self->mOrigin;
  }
  v6 = [(CRKTableEntries *)mOrigin entryAtRow:a3 column:a4];
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEntries, 0);

  objc_storeStrong((id *)&self->mOrigin, 0);
}

@end