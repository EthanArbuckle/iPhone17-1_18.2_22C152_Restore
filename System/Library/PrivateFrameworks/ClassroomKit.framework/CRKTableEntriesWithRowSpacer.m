@interface CRKTableEntriesWithRowSpacer
- (CRKTableEntriesWithRowSpacer)initWithOrigin:(id)a3 index:(unint64_t)a4 spacerEntry:(id)a5;
- (id)entryAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (unint64_t)columnCount;
- (unint64_t)rowCount;
@end

@implementation CRKTableEntriesWithRowSpacer

- (CRKTableEntriesWithRowSpacer)initWithOrigin:(id)a3 index:(unint64_t)a4 spacerEntry:(id)a5
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
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CRKTableEntriesWithRowSpacer.m", 22, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"CRKTableEntriesWithRowSpacer.m", 23, @"Invalid parameter not satisfying: %@", @"spacerEntry" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)CRKTableEntriesWithRowSpacer;
  v13 = [(CRKTableEntriesWithRowSpacer *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mOrigin, a3);
    v14->mIndex = a4;
    objc_storeStrong((id *)&v14->mSpacerEntry, a5);
  }

  return v14;
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
      v6 = self->mSpacerEntry;
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
  objc_storeStrong((id *)&self->mSpacerEntry, 0);

  objc_storeStrong((id *)&self->mOrigin, 0);
}

@end