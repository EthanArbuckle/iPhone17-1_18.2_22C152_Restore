@interface MPSectionedIdentifierListEnumerator
- (MPSectionedIdentifierList)sectionedIdentifierList;
- (MPSectionedIdentifierListEntry)endEntry;
- (MPSectionedIdentifierListEnumerator)initWithSectionedIdentifierList:(id)a3 options:(unint64_t)a4 startEntry:(id)a5 endEntry:(id)a6 withExclusiveAccessToken:(id)a7;
- (NSMutableArray)contexts;
- (NSMutableArray)nextEmittableEnumerationResults;
- (id)nextObject;
- (id)nextObjectWithExclusiveAccessToken:(id)a3;
- (unint64_t)options;
- (void)setContexts:(id)a3;
- (void)setEndEntry:(id)a3;
- (void)setNextEmittableEnumerationResults:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation MPSectionedIdentifierListEnumerator

void __49__MPSectionedIdentifierListEnumerator_nextObject__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) nextObjectWithExclusiveAccessToken:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)nextObjectWithExclusiveAccessToken:(id)a3
{
  id v4 = a3;
  [v4 assertHasExclusiveAccessForOwner:self->_sectionedIdentifierList];
  unint64_t options = self->_options;
  uint64_t v31 = (options >> 1) & 1;
  if ([(NSMutableArray *)self->_nextEmittableEnumerationResults count])
  {
    v6 = [(NSMutableArray *)self->_nextEmittableEnumerationResults firstObject];
    [(NSMutableArray *)self->_nextEmittableEnumerationResults removeObjectAtIndex:0];
    if (options)
    {
      v7 = [(MPSectionedIdentifierListEnumerator *)self sectionedIdentifierList];
      v8 = [v7 _endEntryWithExclusiveAccessToken:v4];

      if (v6 == v8)
      {
        nextEmittableEnumerationResults = self->_nextEmittableEnumerationResults;
        v10 = +[_MPSectionedIdentifierListProxyEntry endEntry];
        [(NSMutableArray *)nextEmittableEnumerationResults addObject:v10];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v6;
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      int v13 = [v11 isDataSourceRemoved];
      if ((v13 & 1) == 0 && (isKindOfClass & 1) != 0 && (options & 0x20) == 0) {
        int v13 = [v11 isRemoved];
      }
    }
    else
    {
      int v13 = 0;
      int isKindOfClass = 0;
    }
    if (((options | isKindOfClass) & 1) != 0
      && v31 | v13 ^ 1
      && ((options & 0x20) == 0
       || (_MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v6, v4) & 1) != 0))
    {
      goto LABEL_47;
    }
  }
  if ([(NSMutableArray *)self->_contexts count])
  {
    uint64_t v30 = 32;
    while (1)
    {
      v14 = [(NSMutableArray *)self->_contexts lastObject];
      uint64_t v15 = [v14 nextObject];
      v16 = (void *)v15;
      endEntry = self->_endEntry;
      if (endEntry && v15 == (void)endEntry) {
        break;
      }
      if (v15)
      {
        if ((self->_options & 0x10) == 0) {
          [(MPSectionedIdentifierList *)self->_sectionedIdentifierList _enumerator:self didEncounterEntry:v15 withExclusiveAccessToken:v4];
        }
        contexts = self->_contexts;
        v20 = [v16 nextEntries];
        v21 = [v20 reverseObjectEnumerator];
        [(NSMutableArray *)contexts addObject:v21];

        if (options)
        {
          v22 = [(MPSectionedIdentifierListEnumerator *)self sectionedIdentifierList];
          v23 = [v22 _endEntryWithExclusiveAccessToken:v4];

          if (v16 == v23)
          {
            v24 = *(Class *)((char *)&self->super.super.isa + v30);
            v25 = +[_MPSectionedIdentifierListProxyEntry endEntry];
            [v24 addObject:v25];
          }
        }
        objc_opt_class();
        int v26 = objc_opt_isKindOfClass();
        int v27 = [v16 isDataSourceRemoved];
        if ((v27 & 1) == 0 && (v26 & 1) != 0 && (options & 0x20) == 0) {
          int v27 = [v16 isRemoved];
        }
        if (((options | v26) & 1) != 0
          && v31 | v27 ^ 1
          && ((options & 0x20) == 0
           || _MPSectionedIdentifierListEnumeratorShouldEmitAsDataSourceEntry(self->_sectionedIdentifierList, v16, v4)))
        {
          v28 = v16;
          v16 = v28;
          goto LABEL_45;
        }
      }
      else
      {
        [(NSMutableArray *)self->_contexts removeLastObject];
      }

      if (![(NSMutableArray *)self->_contexts count]) {
        goto LABEL_40;
      }
    }
    [(NSMutableArray *)self->_contexts removeAllObjects];
    [*(id *)((char *)&self->super.super.isa + v30) removeAllObjects];
    if ((self->_options & 0x40) == 0)
    {
      v6 = 0;
      goto LABEL_46;
    }
    v28 = self->_endEntry;
LABEL_45:
    v6 = v28;
LABEL_46:
  }
  else
  {
LABEL_40:
    v6 = 0;
  }
LABEL_47:

  return v6;
}

- (MPSectionedIdentifierList)sectionedIdentifierList
{
  return self->_sectionedIdentifierList;
}

- (MPSectionedIdentifierListEnumerator)initWithSectionedIdentifierList:(id)a3 options:(unint64_t)a4 startEntry:(id)a5 endEntry:(id)a6 withExclusiveAccessToken:(id)a7
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  unint64_t v14 = (unint64_t)a5;
  unint64_t v15 = (unint64_t)a6;
  id v16 = a7;
  char v69 = a4;
  if ((a4 & 8) != 0)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEnumerator.m" lineNumber:45 description:@"Cannot instantiate forward enumerator with MPSectionedIdentifierListEnumerationOptionReverse set"];
  }
  if (v14 == v15 && v14 | v15)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2 object:self file:@"MPSectionedIdentifierListEnumerator.m" lineNumber:46 description:@"endEntry cannot be the same as the startingEntry"];
  }
  v72.receiver = self;
  v72.super_class = (Class)MPSectionedIdentifierListEnumerator;
  v17 = [(MPSectionedIdentifierListEnumerator *)&v72 init];
  v18 = v17;
  if (v17)
  {
    p_sectionedIdentifierList = (id *)&v17->_sectionedIdentifierList;
    objc_storeStrong((id *)&v17->_sectionedIdentifierList, a3);
    v18->_unint64_t options = a4;
    v67 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    nextEmittableEnumerationResults = v18->_nextEmittableEnumerationResults;
    v18->_nextEmittableEnumerationResults = (NSMutableArray *)v19;

    v21 = v18;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    contexts = v18->_contexts;
    v18->_contexts = (NSMutableArray *)v22;

    objc_storeStrong((id *)&v18->_endEntry, a6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [(id)v14 previousEntry];

      if (!v24)
      {
        v25 = [*p_sectionedIdentifierList valueForKey:@"_startEntries"];
        if (([v25 containsObject:v14] & 1) == 0)
        {

          unint64_t v14 = 0;
        }
      }
    }
    unint64_t options = v18->_options;
    if (v14)
    {
      id v61 = v13;
      int v27 = p_sectionedIdentifierList;
      if ((v69 & 0x10) == 0) {
        [*p_sectionedIdentifierList _enumerator:v18 didEncounterEntry:v14 withExclusiveAccessToken:v16];
      }
      char v59 = options;
      unint64_t v60 = v14;
      id v63 = v16;
      v28 = (__CFString *)(id)v14;
      uint64_t v62 = *MEMORY[0x1E4F778C8];
      v64 = v28;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(__CFString *)v28 sectionHeadEntry];
        }
        else {
        uint64_t v29 = [(__CFString *)v28 previousEntry];
        }
        uint64_t v30 = (__CFString *)v29;
        if ((v69 & 0x10) == 0 && v29) {
          [*v27 _enumerator:v21 didEncounterEntry:v29 withExclusiveAccessToken:v63];
        }
        uint64_t v31 = [(__CFString *)v30 nextEntries];
        v32 = v31;
        if (v31)
        {
          v33 = v31;
        }
        else
        {
          v33 = [*v27 valueForKey:@"_startEntries"];
        }
        v34 = v33;

        v35 = [(__CFString *)v34 reverseObjectEnumerator];
        v36 = [v35 nextObjectIdenticalTo:v28];
        if (!v36)
        {
          dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
          v68 = (void *)MEMORY[0x1E4F77950];
          v73[0] = @"startEntry";
          v73[1] = @"innerEntry";
          v74[0] = v64;
          v74[1] = v28;
          if (v30) {
            v38 = v30;
          }
          else {
            v38 = @"@";
          }
          v73[2] = @"previousEntry";
          v73[3] = @"previousEntry.nextEntries";
          if (v34) {
            v39 = v34;
          }
          else {
            v39 = @"@";
          }
          v74[2] = v38;
          v74[3] = v39;
          v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:4];
          v75[0] = v40;
          v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __124__MPSectionedIdentifierListEnumerator_initWithSectionedIdentifierList_options_startEntry_endEntry_withExclusiveAccessToken___block_invoke;
          v70[3] = &unk_1E57F9EA8;
          dispatch_semaphore_t v71 = v37;
          v42 = v37;
          [v68 snapshotWithDomain:v62 type:@"Bug" subType:@"Invalid-SIL" context:@"innerEntry.previousEntry.nextEntries" triggerThresholdValues:&stru_1EE680640 events:v41 completion:v70];

          v21 = v67;
          dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);

          v43 = [MEMORY[0x1E4F28B00] currentHandler];
          [v43 handleFailureInMethod:a2 object:v67 file:@"MPSectionedIdentifierListEnumerator.m" lineNumber:106 description:@"innerEntry not found in innerEntry.previousEntry.nextEntries"];

          int v27 = p_sectionedIdentifierList;
        }
        [(NSMutableArray *)v21->_contexts insertObject:v35 atIndex:0];

        if (!v30) {
          break;
        }
        v28 = v30;
        if ([(__CFString *)v30 entryType] == 2)
        {
          v28 = v30;
          if (![(__CFString *)v30 branchDepth]) {
            break;
          }
        }
      }
      v44 = v21->_contexts;
      v45 = [(__CFString *)v64 nextEntries];
      v46 = [v45 reverseObjectEnumerator];
      [(NSMutableArray *)v44 addObject:v46];

      objc_opt_class();
      id v47 = v61;
      if (objc_opt_isKindOfClass() & 1) != 0 || (v59) {
        [(NSMutableArray *)v67->_nextEmittableEnumerationResults addObject:v64];
      }
      unint64_t v14 = v60;
      id v16 = v63;
    }
    else
    {
      id v47 = v13;
      v48 = v18->_contexts;
      [*p_sectionedIdentifierList _startEntriesWithExclusiveAccessToken:v16];
      v50 = char v49 = options;
      v51 = [v50 reverseObjectEnumerator];
      [(NSMutableArray *)v48 addObject:v51];

      if ((v49 & 1) == 0) {
        goto LABEL_43;
      }
      v52 = v18->_nextEmittableEnumerationResults;
      v53 = +[_MPSectionedIdentifierListProxyEntry startEntry];
      [(NSMutableArray *)v52 addObject:v53];

      v54 = [*p_sectionedIdentifierList _endEntryWithExclusiveAccessToken:v16];

      if (v54) {
        goto LABEL_43;
      }
      v56 = v18->_nextEmittableEnumerationResults;
      uint64_t v30 = +[_MPSectionedIdentifierListProxyEntry endEntry];
      [(NSMutableArray *)v56 addObject:v30];
    }

    v18 = v67;
LABEL_43:
    _MPSectionedIdentifierListEnumeratorAdjustForStartItemInclusionIfNeeded(v18, v69, (void *)v14, v16);
    id v13 = v47;
  }

  return v18;
}

- (id)nextObject
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6582;
  v10 = __Block_byref_object_dispose__6583;
  id v11 = 0;
  sectionedIdentifierList = self->_sectionedIdentifierList;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__MPSectionedIdentifierListEnumerator_nextObject__block_invoke;
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
  objc_storeStrong((id *)&self->_contexts, 0);

  objc_storeStrong((id *)&self->_sectionedIdentifierList, 0);
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

intptr_t __124__MPSectionedIdentifierListEnumerator_initWithSectionedIdentifierList_options_startEntry_endEntry_withExclusiveAccessToken___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end