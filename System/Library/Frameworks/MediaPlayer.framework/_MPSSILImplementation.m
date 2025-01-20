@interface _MPSSILImplementation
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSequentialSection:(id)a3 withExclusiveAccessToken:(id)a4;
- (MPRandomDistribution)randomDistribution;
- (NSMutableArray)candidateItems;
- (_MPSSILImplementation)initWithCoder:(id)a3;
- (_MPSSILImplementation)initWithSectionedIdentifierList:(id)a3 randomSource:(id)a4 startingItemEntry:(id)a5 withExclusiveAccessToken:(id)a6;
- (id)_createShuffleCloneForItem:(id)a3 inSection:(id)a4 withExclusiveAccessToken:(id)a5;
- (id)orderedSectionIdentifiers;
- (int64_t)itemCount;
- (void)_addShuffleSection:(id)a3 dataSource:(id)a4 withExclusiveAccessToken:(id)a5;
- (void)_appendShuffledItems:(id)a3 withExclusiveAccessToken:(id)a4;
- (void)_beforeInitWithCoder:(id)a3;
- (void)_dequeueCandidatesWithQuota:(int64_t)a3 withExclusiveAccessToken:(id)a4;
- (void)_enumerator:(id)a3 didEncounterEntry:(id)a4 withExclusiveAccessToken:(id)a5;
- (void)_reverseEnumeratorWillStartAtEnd:(id)a3 withExclusiveAccessToken:(id)a4;
- (void)_updateOrderedSectionIDsWithExclusiveAccessToken:(id)a3;
- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterItem:(id)a6 inSection:(id)a7;
- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterTailOfSection:(id)a6;
- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 beforeTailOfSection:(id)a6;
- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 sequentially:(BOOL)a5;
- (void)addDataSourceAtStart:(id)a3 section:(id)a4 sequentially:(BOOL)a5;
- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5;
- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4;
- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4;
- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4;
- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4;
- (void)dequeueCandidatesWithQuota:(int64_t)a3;
- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4;
- (void)safelyReshuffleAfterItem:(id)a3 inSection:(id)a4;
- (void)setCandidateItems:(id)a3;
@end

@implementation _MPSSILImplementation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateItems, 0);
  objc_storeStrong((id *)&self->_randomDistribution, 0);

  objc_storeStrong((id *)&self->_orderedSectionIDs, 0);
}

- (void)setCandidateItems:(id)a3
{
}

- (NSMutableArray)candidateItems
{
  return self->_candidateItems;
}

- (MPRandomDistribution)randomDistribution
{
  return self->_randomDistribution;
}

- (void)_dequeueCandidatesWithQuota:(int64_t)a3 withExclusiveAccessToken:(id)a4
{
  id v22 = a4;
  [v22 assertHasExclusiveAccessForOwner:self];
  v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
  if (a3 >= 1)
  {
    do
    {
      if (![(NSMutableArray *)self->_candidateItems count]) {
        break;
      }
      unint64_t v6 = [(MPRandomDistribution *)self->_randomDistribution nextIntWithUpperBound:[(NSMutableArray *)self->_candidateItems count]];
      v7 = [(NSMutableArray *)self->_candidateItems objectAtIndexedSubscript:v6];
      [(NSMutableArray *)self->_candidateItems removeObjectAtIndex:v6];
      v8 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v22];
      v9 = [v7 sectionIdentifier];
      v10 = [v8 objectForKeyedSubscript:v9];
      v11 = [v10 dataSource];

      if (([v7 isRemoved] & 1) != 0
        || (objc_opt_respondsToSelector() & 1) != 0
        && ([v7 sectionIdentifier],
            v17 = objc_claimAutoreleasedReturnValue(),
            [v7 itemIdentifier],
            v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v11 section:v17 shouldShuffleExcludeItem:v18],
            v18,
            v17,
            (v19 & 1) != 0))
      {
        v12 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v22];
        v13 = [v7 sectionIdentifier];
        v14 = [v12 objectForKeyedSubscript:v13];
        v15 = [v14 identifiersItemEntryMap];
        v16 = [v7 itemIdentifier];
        [v15 setObject:0 forKeyedSubscript:v16];
      }
      else
      {
        [v21 addObject:v7];
        --a3;
      }
    }
    while (a3 > 0);
  }
  if ([v21 count])
  {
    [(_MPSSILImplementation *)self _appendShuffledItems:v21 withExclusiveAccessToken:v22];
    v20 = [(MPSectionedIdentifierList *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v20 didDequeueShuffledItemsInSSIL:self];
    }
  }
}

- (id)_createShuffleCloneForItem:(id)a3 inSection:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 assertHasExclusiveAccessForOwner:self];
  v11 = +[MPSectionedIdentifierListItemEntry itemEntryWithSectionIdentifier:v9 itemIdentifier:v10];
  [v11 setHostedSectionIdentifier:@"🔀"];
  v12 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v8];

  v13 = [v12 objectForKeyedSubscript:v9];

  v14 = [v13 identifiersItemEntryMap];
  [v14 setObject:v11 forKeyedSubscript:v10];

  return v11;
}

- (void)_appendShuffledItems:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  id v8 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v7];
  id v9 = [v8 objectForKeyedSubscript:@"🔀"];

  [v7 assertHasExclusiveAccessForOwner:self];
  self->super._itemCount += [v15 count];
  id v10 = +[MPSectionedIdentifierListPosition positionForTailOfSection:@"🔀"];
  v11 = [(MPSectionedIdentifierList *)self enumeratorWithOptions:11 startPosition:v10 endPosition:0 withExclusiveAccessToken:v7];

  v12 = [v11 nextObjectWithExclusiveAccessToken:v7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 855, @"MPSSIL unexpected enumeration result: %@", objc_opt_class() object file lineNumber description];
  }
  [(MPSectionedIdentifierList *)self _addBranchToEntry:v12 entries:v15 withExclusiveAccessToken:v7];
  v13 = [v15 lastObject];
  [v9 setLastItemEntry:v13];
}

- (void)_addShuffleSection:(id)a3 dataSource:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 assertHasExclusiveAccessForOwner:self];
  id v12 = +[MPSectionedIdentifierListHeadEntry headEntryWithSectionIdentifier:v10];
  [v12 setDataSource:v9];

  [v12 setShuffledHead:1];
  v11 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v8];

  [v11 setObject:v12 forKeyedSubscript:v10];
}

- (void)_reverseEnumeratorWillStartAtEnd:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v5 = a4;
  [v5 assertHasExclusiveAccessForOwner:self];
  [(_MPSSILImplementation *)self _dequeueCandidatesWithQuota:[(NSMutableArray *)self->_candidateItems count] withExclusiveAccessToken:v5];
}

- (BOOL)_isSequentialSection:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 assertHasExclusiveAccessForOwner:self];
  id v8 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v6];
  id v9 = [v8 objectForKeyedSubscript:v7];

  id v10 = [v9 previousEntry];
  if (v10)
  {
    char v11 = 1;
  }
  else
  {
    id v12 = [(MPSectionedIdentifierList *)self _startEntriesWithExclusiveAccessToken:v6];
    char v11 = [v12 containsObject:v9];
  }
  return v11;
}

- (void)_enumerator:(id)a3 didEncounterEntry:(id)a4 withExclusiveAccessToken:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  [v7 assertHasExclusiveAccessForOwner:self];
  id v8 = [v10 nextEntries];
  uint64_t v9 = [v8 indexOfObjectPassingTest:&__block_literal_global_5300];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL && [v10 branchDepth] <= 1) {
    [(_MPSSILImplementation *)self _dequeueCandidatesWithQuota:+[MPShuffleableSectionedIdentifierList enumerationCandidateDequeueQuota] withExclusiveAccessToken:v7];
  }
}

- (void)_updateOrderedSectionIDsWithExclusiveAccessToken:(id)a3
{
  id v13 = a3;
  [v13 assertHasExclusiveAccessForOwner:self];
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(MPSectionedIdentifierList *)self enumeratorWithOptions:17 startPosition:0 endPosition:0 withExclusiveAccessToken:v13];
  uint64_t v6 = [v5 nextObjectWithExclusiveAccessToken:v13];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      if ([v7 entryType] == 2)
      {
        id v8 = [v7 trackingEntryResult];
        uint64_t v9 = [v8 sectionIdentifier];
        [v4 addObject:v9];
      }
      uint64_t v10 = [v5 nextObjectWithExclusiveAccessToken:v13];

      id v7 = (void *)v10;
    }
    while (v10);
  }
  char v11 = (NSArray *)[v4 copy];
  orderedSectionIDs = self->_orderedSectionIDs;
  self->_orderedSectionIDs = v11;
}

- (id)orderedSectionIdentifiers
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___MPSSILImplementation_orderedSectionIdentifiers__block_invoke;
  v4[3] = &unk_1E57F6BA8;
  v4[4] = self;
  v2 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v4];

  return v2;
}

- (int64_t)itemCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___MPSSILImplementation_itemCount__block_invoke;
  v4[3] = &unk_1E57F6C48;
  v4[4] = self;
  void v4[5] = &v5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57___MPSSILImplementation_dataSourceReloadItems_inSection___block_invoke;
  v10[3] = &unk_1E57F6B30;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v10];
}

- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59___MPSSILImplementation_dataSourceRemoveItems_fromSection___block_invoke;
  v13[3] = &unk_1E57F6CC0;
  id v9 = v6;
  id v14 = v9;
  id v15 = self;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v13];
  if ([v11 count])
  {
    v12.receiver = self;
    v12.super_class = (Class)_MPSSILImplementation;
    [(MPSectionedIdentifierList *)&v12 dataSourceRemoveItems:v11 fromSection:v10];
  }
}

- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 701, @"Invalid insertion (no item identifiers) in section: %@", v8 object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___MPSSILImplementation_dataSourceInsertItemsAtTail_inSection___block_invoke;
  v13[3] = &unk_1E57EE938;
  void v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  if ([(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v13])
  {
    v12.receiver = self;
    v12.super_class = (Class)_MPSSILImplementation;
    [(MPSectionedIdentifierList *)&v12 dataSourceInsertItemsAtTail:v10 inSection:v9];
  }
}

- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 count])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 682, @"Invalid insertion (no item identifiers) in section: %@", v11 object file lineNumber description];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67___MPSSILImplementation_dataSourceInsertItems_afterItem_inSection___block_invoke;
  v16[3] = &unk_1E57EE938;
  v16[4] = self;
  id v12 = v11;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  if ([(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v16])
  {
    v15.receiver = self;
    v15.super_class = (Class)_MPSSILImplementation;
    [(MPSectionedIdentifierList *)&v15 dataSourceInsertItems:v13 afterItem:v10 inSection:v12];
  }
}

- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 663, @"Invalid insertion (no item identifiers) in section: %@", v8 object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63___MPSSILImplementation_dataSourceInsertItemsAtHead_inSection___block_invoke;
  v13[3] = &unk_1E57EE938;
  void v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  if ([(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v13])
  {
    v12.receiver = self;
    v12.super_class = (Class)_MPSSILImplementation;
    [(MPSectionedIdentifierList *)&v12 dataSourceInsertItemsAtHead:v10 inSection:v9];
  }
}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 sequentially:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___MPSSILImplementation_addDataSourceAtEnd_section_sequentially___block_invoke;
  v12[3] = &unk_1E57EE8C0;
  BOOL v15 = a5;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v12];
}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 beforeTailOfSection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80___MPSSILImplementation_addDataSource_section_sequentially_beforeTailOfSection___block_invoke;
  v16[3] = &unk_1E57EE910;
  BOOL v20 = a5;
  v16[4] = self;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v16];
}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterTailOfSection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79___MPSSILImplementation_addDataSource_section_sequentially_afterTailOfSection___block_invoke;
  v16[3] = &unk_1E57EE910;
  BOOL v20 = a5;
  v16[4] = self;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v16];
}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterItem:(id)a6 inSection:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80___MPSSILImplementation_addDataSource_section_sequentially_afterItem_inSection___block_invoke;
  v20[3] = &unk_1E57EE8E8;
  BOOL v25 = a5;
  v20[4] = self;
  id v21 = v15;
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v15;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v20];
}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 sequentially:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67___MPSSILImplementation_addDataSourceAtStart_section_sequentially___block_invoke;
  v12[3] = &unk_1E57EE8C0;
  BOOL v15 = a5;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v12];
}

- (void)safelyReshuffleAfterItem:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60___MPSSILImplementation_safelyReshuffleAfterItem_inSection___block_invoke;
  v10[3] = &unk_1E57F6B30;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v10];
}

- (void)dequeueCandidatesWithQuota:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52___MPSSILImplementation_dequeueCandidatesWithQuota___block_invoke;
  v3[3] = &unk_1E57EEA00;
  v3[4] = self;
  v3[5] = a3;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v3];
}

- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPSSILImplementation;
  id v7 = a3;
  [(MPSectionedIdentifierList *)&v16 encodeWithCoder:v7 withExclusiveAccessToken:v6];
  [v6 assertHasExclusiveAccessForOwner:self];
  [v7 encodeObject:self->_candidateItems forKey:@"cani"];
  [v7 encodeObject:self->_randomDistribution forKey:@"rand"];
  id v8 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v6];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count") - 1);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66___MPSSILImplementation_encodeWithCoder_withExclusiveAccessToken___block_invoke;
  v13[3] = &unk_1E57EE9D8;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v10 = v9;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
  id v12 = (void *)[v10 copy];
  [v7 encodeObject:v12 forKey:@"ssh"];

  [v7 encodeObject:self->_orderedSectionIDs forKey:@"osi"];
}

- (void)_beforeInitWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MPSSILImplementation;
  [(MPSectionedIdentifierList *)&v22 _beforeInitWithCoder:v4];
  uint64_t v5 = objc_alloc_init(_MPSSILImplementationInitToken);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ssh"];

  id v10 = [(MPSectionedIdentifierList *)self _sectionHeadEntryMapWithExclusiveAccessToken:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_super v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v17 = [v16 sectionIdentifier];
        [v10 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }
}

- (_MPSSILImplementation)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_MPSSILImplementation;
  uint64_t v5 = [(MPSectionedIdentifierList *)&v37 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v32 = v4;
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"cani"];
    candidateItems = v5->_candidateItems;
    v5->_candidateItems = (NSMutableArray *)v9;

    v30 = objc_alloc_init(_MPSSILImplementationInitToken);
    id v11 = -[MPSectionedIdentifierList _sectionHeadEntryMapWithExclusiveAccessToken:](v5, "_sectionHeadEntryMapWithExclusiveAccessToken:");
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v31 = v5;
    uint64_t v12 = v5->_candidateItems;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v18 = [v17 sectionIdentifier];
          long long v19 = [v11 objectForKeyedSubscript:v18];
          long long v20 = [v19 identifiersItemEntryMap];
          long long v21 = [v17 itemIdentifier];
          [v20 setObject:v17 forKeyedSubscript:v21];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v14);
    }

    id v4 = v32;
    uint64_t v22 = [v32 decodeObjectOfClass:objc_opt_class() forKey:@"rand"];
    uint64_t v5 = v31;
    randomDistribution = v31->_randomDistribution;
    v31->_randomDistribution = (MPRandomDistribution *)v22;

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v32 decodeObjectOfClasses:v26 forKey:@"osi"];
    orderedSectionIDs = v31->_orderedSectionIDs;
    v31->_orderedSectionIDs = (NSArray *)v27;

    if (!v31->_orderedSectionIDs) {
      [(_MPSSILImplementation *)v31 _updateOrderedSectionIDsWithExclusiveAccessToken:v30];
    }
  }
  return v5;
}

- (_MPSSILImplementation)initWithSectionedIdentifierList:(id)a3 randomSource:(id)a4 startingItemEntry:(id)a5 withExclusiveAccessToken:(id)a6
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (MPARC4RandomSource *)a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 identifier];
  v56.receiver = self;
  v56.super_class = (Class)_MPSSILImplementation;
  uint64_t v15 = [(MPSectionedIdentifierList *)&v56 initWithIdentifier:v14];

  v52 = v15;
  if (v15)
  {
    v49 = v11;
    objc_super v16 = objc_alloc_init(_MPSSILImplementationInitToken);
    uint64_t v17 = +[MPSectionedIdentifierListHeadEntry headEntryWithSectionIdentifier:@"🔀"];
    long long v18 = [(MPSectionedIdentifierList *)v15 _sectionHeadEntryMapWithExclusiveAccessToken:v16];
    [v18 setObject:v17 forKeyedSubscript:@"🔀"];

    v48 = (void *)v17;
    [(MPSectionedIdentifierList *)v52 _insertDataSourceHead:v17 afterEntry:0 withExclusiveAccessToken:v16];
    v58[0] = @"🔀";
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    orderedSectionIDs = v52->_orderedSectionIDs;
    v52->_orderedSectionIDs = (NSArray *)v19;

    [v13 assertHasExclusiveAccessForOwner:v10];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "_itemCountWithExclusiveAccessToken:", v13));
    candidateItems = v52->_candidateItems;
    v52->_candidateItems = (NSMutableArray *)v21;

    id v23 = [v10 _sectionHeadEntryMapWithExclusiveAccessToken:v13];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __113___MPSSILImplementation_initWithSectionedIdentifierList_randomSource_startingItemEntry_withExclusiveAccessToken___block_invoke;
    v53[3] = &unk_1E57EE9B0;
    uint64_t v24 = v52;
    v54 = v24;
    uint64_t v25 = v16;
    v55 = v25;
    [v23 enumerateKeysAndObjectsUsingBlock:v53];

    id v50 = v10;
    v26 = [v10 enumeratorWithOptions:0x1000000 startPosition:0 endPosition:0 withExclusiveAccessToken:v13];
    uint64_t v27 = [v26 nextObjectWithExclusiveAccessToken:v13];
    v51 = v25;
    if (v27)
    {
      v28 = (void *)v27;
      while ([v28 entryType] != 3)
      {
LABEL_13:
        uint64_t v37 = [v26 nextObjectWithExclusiveAccessToken:v13];

        v28 = (void *)v37;
        if (!v37) {
          goto LABEL_14;
        }
      }
      v29 = [v28 itemResult];
      v30 = [v29 itemIdentifier];

      v31 = [v28 itemResult];
      v32 = [v31 sectionIdentifier];

      long long v33 = [v12 sectionIdentifier];
      if ([v32 isEqual:v33])
      {
        long long v34 = [v12 itemIdentifier];
        char v35 = [v30 isEqual:v34];

        uint64_t v25 = v51;
        if (v35)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
      }
      long long v36 = [(_MPSSILImplementation *)v24 _createShuffleCloneForItem:v30 inSection:v32 withExclusiveAccessToken:v25];
      if (v36) {
        [(NSMutableArray *)v52->_candidateItems addObject:v36];
      }

      goto LABEL_12;
    }
LABEL_14:
    v38 = [MPRandomDistribution alloc];
    id v11 = v49;
    uint64_t v39 = v49;
    if (!v49) {
      uint64_t v39 = objc_alloc_init(MPARC4RandomSource);
    }
    uint64_t v40 = [(MPRandomDistribution *)v38 initWithRandomSource:v39 lowestValue:0 highestValue:0x7FFFFFFFLL];
    randomDistribution = v24->_randomDistribution;
    v24->_randomDistribution = (MPRandomDistribution *)v40;

    if (!v49) {
    uint64_t v42 = +[MPShuffleableSectionedIdentifierList initialCandidateDequeueQuota];
    }
    if (v12)
    {
      v43 = [v12 itemIdentifier];
      v44 = [v12 sectionIdentifier];
      v45 = [(_MPSSILImplementation *)v24 _createShuffleCloneForItem:v43 inSection:v44 withExclusiveAccessToken:v51];

      uint64_t v25 = v51;
      v57 = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
      [(_MPSSILImplementation *)v24 _appendShuffledItems:v46 withExclusiveAccessToken:v51];

      if (v42 >= 2) {
        [(_MPSSILImplementation *)v24 _dequeueCandidatesWithQuota:v42 - 1 withExclusiveAccessToken:v51];
      }
    }
    else
    {
      [(_MPSSILImplementation *)v24 _dequeueCandidatesWithQuota:v42 withExclusiveAccessToken:v25];
    }

    id v10 = v50;
  }

  return v52;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end