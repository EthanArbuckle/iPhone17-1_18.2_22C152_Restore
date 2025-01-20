@interface CNAutocompleteQueryResponseUniqueResultFinder
+ (id)findUniqueResults:(id)a3 duplicateResultHandler:(id)a4;
- (CNAutocompleteQueryResponseUniqueResultFinder)initWithResults:(id)a3 duplicateResultHandler:(id)a4;
- (id)findUniqueResults;
- (void)generateHashes;
- (void)indexHashes;
- (void)removeDuplicateResults;
- (void)resolveDuplicatesWithinIndexes:(id)a3;
@end

@implementation CNAutocompleteQueryResponseUniqueResultFinder

+ (id)findUniqueResults:(id)a3 duplicateResultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithResults:v7 duplicateResultHandler:v6];

  v9 = [v8 findUniqueResults];

  return v9;
}

- (CNAutocompleteQueryResponseUniqueResultFinder)initWithResults:(id)a3 duplicateResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteQueryResponseUniqueResultFinder;
  v8 = [(CNAutocompleteQueryResponseUniqueResultFinder *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    uniqueResults = v8->_uniqueResults;
    v8->_uniqueResults = (NSMutableArray *)v9;

    uint64_t v11 = [v7 copy];
    id duplicateResultHandler = v8->_duplicateResultHandler;
    v8->_id duplicateResultHandler = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (id)findUniqueResults
{
  [(CNAutocompleteQueryResponseUniqueResultFinder *)self generateHashes];
  [(CNAutocompleteQueryResponseUniqueResultFinder *)self indexHashes];
  [(CNAutocompleteQueryResponseUniqueResultFinder *)self removeDuplicateResults];
  uniqueResults = self->_uniqueResults;
  uniqueResultIndexes = self->_uniqueResultIndexes;
  return (id)[(NSMutableArray *)uniqueResults objectsAtIndexes:uniqueResultIndexes];
}

- (void)generateHashes
{
  id v5 = [(NSMutableArray *)self->_uniqueResults _cn_map:CNAutocompleteResultStringForHashingTransform];
  v3 = (NSMutableArray *)[v5 mutableCopy];
  hashes = self->_hashes;
  self->_hashes = v3;
}

- (void)indexHashes
{
  v3 = [MEMORY[0x1E4F28E60] indexSet];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  hashes = self->_hashes;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __60__CNAutocompleteQueryResponseUniqueResultFinder_indexHashes__block_invoke;
  v17 = &unk_1E63DE890;
  id v6 = v4;
  v18 = v6;
  id v7 = v3;
  v19 = v7;
  [(NSMutableArray *)hashes enumerateObjectsUsingBlock:&v14];
  hashIndex = self->_hashIndex;
  self->_hashIndex = v6;
  uint64_t v9 = v6;

  firstIndexes = self->_firstIndexes;
  self->_firstIndexes = v7;
  uint64_t v11 = v7;

  v12 = (NSMutableIndexSet *)[(NSIndexSet *)self->_firstIndexes mutableCopy];
  uniqueResultIndexes = self->_uniqueResultIndexes;
  self->_uniqueResultIndexes = v12;
}

void __60__CNAutocompleteQueryResponseUniqueResultFinder_indexHashes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F28E60] indexSet];
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
    [*(id *)(a1 + 40) addIndex:a3];
  }
  [v5 addIndex:a3];
}

- (void)removeDuplicateResults
{
  v3 = self->_hashIndex;
  hashes = self->_hashes;
  firstIndexes = self->_firstIndexes;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CNAutocompleteQueryResponseUniqueResultFinder_removeDuplicateResults__block_invoke;
  v7[3] = &unk_1E63DE890;
  v8 = v3;
  uint64_t v9 = self;
  id v6 = v3;
  [(NSMutableArray *)hashes enumerateObjectsAtIndexes:firstIndexes options:0 usingBlock:v7];
}

void __71__CNAutocompleteQueryResponseUniqueResultFinder_removeDuplicateResults__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  [*(id *)(a1 + 40) resolveDuplicatesWithinIndexes:v3];
}

- (void)resolveDuplicatesWithinIndexes:(id)a3
{
  id v11 = a3;
  BOOL v4 = (unint64_t)[v11 count] >= 2;
  id v5 = v11;
  if (v4)
  {
    uint64_t v6 = [v11 firstIndex];
    id v7 = [(NSMutableArray *)self->_uniqueResults objectAtIndex:v6];
    uint64_t v8 = [v11 indexGreaterThanIndex:v6];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v8; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v11 indexGreaterThanIndex:i])
      {
        v10 = [(NSMutableArray *)self->_uniqueResults objectAtIndexedSubscript:i];
        if ([v7 isEqual:v10]) {
          (*((void (**)(void))self->_duplicateResultHandler + 2))();
        }
        else {
          [(NSMutableIndexSet *)self->_uniqueResultIndexes addIndex:i];
        }
      }
    }

    id v5 = v11;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_duplicateResultHandler, 0);
  objc_storeStrong((id *)&self->_uniqueResultIndexes, 0);
  objc_storeStrong((id *)&self->_firstIndexes, 0);
  objc_storeStrong((id *)&self->_hashIndex, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_uniqueResults, 0);
}

@end