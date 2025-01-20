@interface MPSectionedIdentifierListReverseEnumerator
- (MPSectionedIdentifierList)sectionedIdentifierList;
- (MPSectionedIdentifierListEntry)endEntry;
- (MPSectionedIdentifierListReverseEnumerator)initWithSectionedIdentifierList:(id)a3 options:(unint64_t)a4 startEntry:(id)a5 endEntry:(id)a6 withExclusiveAccessToken:(id)a7;
- (NSMutableArray)contexts;
- (NSMutableArray)entriesToEmit;
- (NSMutableArray)nextEmittableEnumerationResults;
- (id)_startEntryProxy;
- (id)nextObject;
- (id)nextObjectWithExclusiveAccessToken:(id)a3;
- (unint64_t)options;
- (void)setContexts:(id)a3;
- (void)setEndEntry:(id)a3;
- (void)setEntriesToEmit:(id)a3;
- (void)setNextEmittableEnumerationResults:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation MPSectionedIdentifierListReverseEnumerator

- (id)nextObjectWithExclusiveAccessToken:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 assertHasExclusiveAccessForOwner:self->_sectionedIdentifierList];
  unint64_t options = self->_options;
  unint64_t v6 = 0x1E935F000uLL;
  unint64_t v7 = 0x1E935F000uLL;
  uint64_t v41 = *MEMORY[0x1E4F778C8];
  char v46 = options;
  id v47 = v4;
  while (1)
  {
    uint64_t v8 = [(NSMutableArray *)self->_contexts count];
    uint64_t v9 = *(int *)(v6 + 2440);
    if (!v8 && ![*(id *)((char *)&self->super.super.isa + v9) count])
    {
      v10 = 0;
      goto LABEL_57;
    }
    if ([*(id *)((char *)&self->super.super.isa + v9) count])
    {
      v10 = [*(id *)((char *)&self->super.super.isa + v9) firstObject];
      [*(id *)((char *)&self->super.super.isa + v9) removeObjectAtIndex:0];
      if ((options & 0x20) == 0
        || (_MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v10, v4) & 1) != 0)
      {
        goto LABEL_57;
      }
    }
    v11 = [(NSMutableArray *)self->_contexts lastObject];
    v12 = [v11 nextObject];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 nextEntries];
      v15 = [v14 objectEnumerator];

      [(NSMutableArray *)self->_contexts addObject:v15];
      [*(id *)((char *)&self->super.super.isa + *(int *)(v7 + 2448)) addObject:v13];

      goto LABEL_45;
    }
    uint64_t v16 = *(int *)(v7 + 2448);
    v17 = [*(id *)((char *)&self->super.super.isa + v16) lastObject];
    contexts = self->_contexts;
    if (v17 == self->_endEntry) {
      break;
    }
    [(NSMutableArray *)contexts removeLastObject];
    [*(id *)((char *)&self->super.super.isa + v16) removeLastObject];
    unint64_t v19 = self->_options;
    if (v17 == (MPSectionedIdentifierListEntry *)self->_startEntryProxy)
    {
      if (v19) {
        endEntry = v17;
      }
      else {
        endEntry = 0;
      }
      id v4 = v47;
      goto LABEL_54;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v21 = [(MPSectionedIdentifierListEntry *)v17 previousEntry];
    v48 = v21;
    if (isKindOfClass)
    {
      v22 = [(MPSectionedIdentifierListEntry *)v17 sectionHeadEntry];
LABEL_16:
      v23 = v22;
      v49 = [(__CFString *)v22 nextEntries];
      goto LABEL_17;
    }
    if (v21)
    {
      v22 = v21;
      goto LABEL_16;
    }
    v23 = [(MPSectionedIdentifierListReverseEnumerator *)self _startEntryProxy];
    v49 = [(MPSectionedIdentifierList *)self->_sectionedIdentifierList _startEntriesWithExclusiveAccessToken:v47];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = v17;
      if ([(MPSectionedIdentifierListEntry *)v37 isShuffledHead])
      {
        uint64_t v45 = [(__CFString *)v49 arrayByAddingObject:v37];

        v49 = (__CFString *)v45;
      }
    }
LABEL_17:
    if ([*(id *)((char *)&self->super.super.isa + v16) indexOfObjectIdenticalTo:v23] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)((char *)&self->super.super.isa + v16) addObject:v23];
      v24 = [(__CFString *)v49 objectEnumerator];
      v25 = [v24 nextObjectIdenticalTo:v17];
      if (!v25)
      {
        dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
        v44 = (void *)MEMORY[0x1E4F77950];
        v52[0] = @"entryToEmit";
        v52[1] = @"nextEntryToEmit";
        v53[0] = v17;
        v53[1] = v23;
        if (v49) {
          v27 = v49;
        }
        else {
          v27 = @"@";
        }
        v52[2] = @"nextEntries";
        v52[3] = @"previousEntry";
        v28 = v48;
        if (!v48) {
          v28 = @"@";
        }
        v53[2] = v27;
        v53[3] = v28;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];
        v54[0] = v43;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __81__MPSectionedIdentifierListReverseEnumerator_nextObjectWithExclusiveAccessToken___block_invoke;
        v50[3] = &unk_1E57F9EA8;
        dispatch_semaphore_t v51 = v26;
        v30 = v26;
        [v44 snapshotWithDomain:v41 type:@"Bug" subType:@"Invalid-SIL" context:@"entryToEmit.previousEntry.nextEntries-2" triggerThresholdValues:&stru_1EE680640 events:v29 completion:v50];

        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEnumerator.m" lineNumber:340 description:@"entryToEmit not found in entryToEmit.previousEntry.nextEntries"];

        v25 = 0;
      }
      [(NSMutableArray *)self->_contexts addObject:v24];
    }
    objc_opt_class();
    int v32 = objc_opt_isKindOfClass();
    int v33 = v32;
    if ((v19 & 1) == 0 && (v32 & 1) == 0)
    {
      char v34 = 1;
      LOBYTE(options) = v46;
      id v4 = v47;
      goto LABEL_44;
    }
    unint64_t v35 = self->_options;
    char v36 = [(MPSectionedIdentifierListEntry *)v17 isDataSourceRemoved];
    LOBYTE(options) = v46;
    if (v36 & 1) != 0 || ((v33 ^ 1))
    {
      id v4 = v47;
      if ((v35 & 2) != 0) {
        goto LABEL_41;
      }
    }
    else
    {
      id v4 = v47;
      if ((v46 & 0x20) == 0) {
        char v36 = [(MPSectionedIdentifierListEntry *)v17 isRemoved];
      }
      if ((v35 & 2) != 0) {
        goto LABEL_41;
      }
    }
    if (v36) {
      goto LABEL_35;
    }
LABEL_41:
    if ((v46 & 0x20) != 0
      && !_MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v17, v4))
    {
LABEL_35:
      char v34 = 1;
      goto LABEL_44;
    }
    v40 = v17;
    char v34 = 0;
LABEL_44:

    unint64_t v6 = 0x1E935F000;
    unint64_t v7 = 0x1E935F000;
    if ((v34 & 1) == 0) {
      goto LABEL_56;
    }
LABEL_45:
  }
  [(NSMutableArray *)contexts removeAllObjects];
  [*(id *)((char *)&self->super.super.isa + v9) removeAllObjects];
  [*(id *)((char *)&self->super.super.isa + v16) removeAllObjects];
  if ((self->_options & 0x40) == 0)
  {
    v40 = 0;
    goto LABEL_55;
  }
  endEntry = self->_endEntry;
LABEL_54:
  v40 = endEntry;
LABEL_55:

LABEL_56:
  v10 = v40;
LABEL_57:

  return v10;
}

void __56__MPSectionedIdentifierListReverseEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) nextObjectWithExclusiveAccessToken:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (MPSectionedIdentifierListReverseEnumerator)initWithSectionedIdentifierList:(id)a3 options:(unint64_t)a4 startEntry:(id)a5 endEntry:(id)a6 withExclusiveAccessToken:(id)a7
{
  id v13 = a3;
  unint64_t v14 = (unint64_t)a5;
  unint64_t v15 = (unint64_t)a6;
  id v16 = a7;
  if (v14 == v15 && v14 | v15)
  {
    unint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEnumerator.m" lineNumber:234 description:@"endEntry cannot be the same as the startingEntry"];
  }
  v39.receiver = self;
  v39.super_class = (Class)MPSectionedIdentifierListReverseEnumerator;
  v17 = [(MPSectionedIdentifierListReverseEnumerator *)&v39 init];
  v18 = v17;
  if (v17)
  {
    p_sectionedIdentifierList = (id *)&v17->_sectionedIdentifierList;
    objc_storeStrong((id *)&v17->_sectionedIdentifierList, a3);
    v18->_unint64_t options = a4;
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    nextEmittableEnumerationResults = v18->_nextEmittableEnumerationResults;
    v18->_nextEmittableEnumerationResults = (NSMutableArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    contexts = v18->_contexts;
    v18->_contexts = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    entriesToEmit = v18->_entriesToEmit;
    v18->_entriesToEmit = (NSMutableArray *)v23;

    objc_storeStrong((id *)&v18->_endEntry, a6);
    if ((a4 & 0x10) == 0 && !v14) {
      [*p_sectionedIdentifierList _reverseEnumeratorWillStartAtEnd:v18 withExclusiveAccessToken:v16];
    }
    unint64_t options = v18->_options;
    dispatch_semaphore_t v26 = v18->_contexts;
    v27 = objc_msgSend(MEMORY[0x1E4F1CBF0], "objectEnumerator", v13);
    [(NSMutableArray *)v26 addObject:v27];

    if (v14)
    {
      id v28 = (id)v14;
    }
    else
    {
      id v28 = [*p_sectionedIdentifierList _endEntryWithExclusiveAccessToken:v16];
      if (!v28) {
        goto LABEL_12;
      }
    }
    [(NSMutableArray *)v18->_entriesToEmit addObject:v28];
LABEL_12:
    if (!v14 && (options & 1) != 0)
    {
      v29 = v18->_nextEmittableEnumerationResults;
      v30 = +[_MPSectionedIdentifierListProxyEntry endEntry];
      [(NSMutableArray *)v29 addObject:v30];

      v31 = [*p_sectionedIdentifierList _endEntryWithExclusiveAccessToken:v16];

      if (!v31)
      {
        int v32 = v18->_nextEmittableEnumerationResults;
        int v33 = +[_MPSectionedIdentifierListProxyEntry startEntry];
        [(NSMutableArray *)v32 addObject:v33];
      }
    }
    _MPSectionedIdentifierListEnumeratorAdjustForStartItemInclusionIfNeeded(v18, a4, (void *)v14, v16);

    id v13 = v36;
  }

  return v18;
}

- (id)_startEntryProxy
{
  startEntryProxy = self->_startEntryProxy;
  if (!startEntryProxy)
  {
    uint64_t v4 = +[_MPSectionedIdentifierListProxyEntry startEntry];
    v5 = self->_startEntryProxy;
    self->_startEntryProxy = v4;

    startEntryProxy = self->_startEntryProxy;
  }

  return startEntryProxy;
}

- (id)nextObject
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6582;
  v10 = __Block_byref_object_dispose__6583;
  id v11 = 0;
  sectionedIdentifierList = self->_sectionedIdentifierList;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MPSectionedIdentifierListReverseEnumerator_nextObject__block_invoke;
  v5[3] = &unk_1E57F6C48;
  v5[4] = self;
  v5[5] = &v6;
  [(MPSectionedIdentifierList *)sectionedIdentifierList performWithExclusiveAccess:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEntry, 0);
  objc_storeStrong((id *)&self->_nextEmittableEnumerationResults, 0);
  objc_storeStrong((id *)&self->_entriesToEmit, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_sectionedIdentifierList, 0);

  objc_storeStrong((id *)&self->_startEntryProxy, 0);
}

- (void)setEndEntry:(id)a3
{
}

- (MPSectionedIdentifierListEntry)endEntry
{
  return self->_endEntry;
}

- (void)setNextEmittableEnumerationResults:(id)a3
{
}

- (NSMutableArray)nextEmittableEnumerationResults
{
  return self->_nextEmittableEnumerationResults;
}

- (void)setEntriesToEmit:(id)a3
{
}

- (NSMutableArray)entriesToEmit
{
  return self->_entriesToEmit;
}

- (void)setContexts:(id)a3
{
}

- (NSMutableArray)contexts
{
  return self->_contexts;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (MPSectionedIdentifierList)sectionedIdentifierList
{
  return self->_sectionedIdentifierList;
}

intptr_t __81__MPSectionedIdentifierListReverseEnumerator_nextObjectWithExclusiveAccessToken___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end