@interface CRKOrderedOneToManyKVOAccumulatorResults
- (BOOL)isEmpty;
- (NSArray)moves;
- (NSIndexSet)deletions;
- (NSIndexSet)insertions;
- (NSIndexSet)replacements;
- (id)description;
- (id)resultsByExcludingLocalDeletions:(id)a3;
- (int64_t)netCountChange;
- (void)setDeletions:(id)a3;
- (void)setInsertions:(id)a3;
- (void)setMoves:(id)a3;
- (void)setReplacements:(id)a3;
@end

@implementation CRKOrderedOneToManyKVOAccumulatorResults

- (BOOL)isEmpty
{
  v3 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self insertions];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self deletions];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self replacements];
      if ([v6 count])
      {
        BOOL v4 = 0;
      }
      else
      {
        v7 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self moves];
        BOOL v4 = [v7 count] == 0;
      }
    }
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self insertions];
  v5 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self deletions];
  v6 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self replacements];
  v7 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self moves];
  v8 = [v3 stringWithFormat:@"insertions: %@\ndeletions: %@\nreplacements: %@\nmoves: %@", v4, v5, v6, v7];

  return v8;
}

- (int64_t)netCountChange
{
  v3 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self insertions];
  uint64_t v4 = [v3 count];
  v5 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self deletions];
  int64_t v6 = v4 - [v5 count];

  return v6;
}

- (id)resultsByExcludingLocalDeletions:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  int64_t v6 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self deletions];
  v7 = (void *)[v6 mutableCopy];

  [v7 removeIndexes:v4];
  v8 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self insertions];
  [v5 setInsertions:v8];

  v9 = (void *)[v7 copy];
  [v5 setDeletions:v9];

  v10 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self replacements];
  [v5 setReplacements:v10];

  v11 = [(CRKOrderedOneToManyKVOAccumulatorResults *)self moves];
  [v5 setMoves:v11];

  return v5;
}

- (NSIndexSet)insertions
{
  return self->_insertions;
}

- (void)setInsertions:(id)a3
{
}

- (NSIndexSet)deletions
{
  return self->_deletions;
}

- (void)setDeletions:(id)a3
{
}

- (NSIndexSet)replacements
{
  return self->_replacements;
}

- (void)setReplacements:(id)a3
{
}

- (NSArray)moves
{
  return self->_moves;
}

- (void)setMoves:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moves, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
  objc_storeStrong((id *)&self->_deletions, 0);

  objc_storeStrong((id *)&self->_insertions, 0);
}

@end