@interface MPShuffleableSectionedIdentifierList
+ (BOOL)supportsSecureCoding;
+ (int64_t)enumerationCandidateDequeueQuota;
+ (int64_t)initialCandidateDequeueQuota;
+ (void)setEnumerationCandidateDequeueQuota:(int64_t)a3;
+ (void)setInitialCandidateDequeueQuota:(int64_t)a3;
- (BOOL)hasSection:(id)a3;
- (MPShuffleableSectionedIdentifierList)initWithCoder:(id)a3;
- (NSString)debugDescription;
- (NSString)shuffleStartingItemIdentifier;
- (NSString)shuffleStartingSectionIdentifier;
- (id)_candidateItemsWithExclusiveAccessToken:(id)a3;
- (id)_shuffledListWithExclusiveAccessToken:(id)a3;
- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5 withExclusiveAccessToken:(id)a6;
- (id)orderedSectionIdentifiers;
- (int64_t)_itemCountWithExclusiveAccessToken:(id)a3;
- (int64_t)shuffleType;
- (void)_dequeueCandidatesWithQuota:(int64_t)a3 withExclusiveAccessToken:(id)a4;
- (void)addDataSource:(id)a3 section:(id)a4 afterHeadOfSection:(id)a5;
- (void)addDataSource:(id)a3 section:(id)a4 afterItem:(id)a5 inSection:(id)a6 completion:(id)a7;
- (void)addDataSource:(id)a3 section:(id)a4 afterTailOfSection:(id)a5 completion:(id)a6;
- (void)addDataSource:(id)a3 section:(id)a4 beforeTailOfSection:(id)a5 completion:(id)a6;
- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterItem:(id)a6 inSection:(id)a7 completion:(id)a8;
- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterTailOfSection:(id)a6 completion:(id)a7;
- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 beforeTailOfSection:(id)a6 completion:(id)a7;
- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 completion:(id)a5;
- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 sequentially:(BOOL)a5 completion:(id)a6;
- (void)addDataSourceAtStart:(id)a3 section:(id)a4 completion:(id)a5;
- (void)addDataSourceAtStart:(id)a3 section:(id)a4 sequentially:(BOOL)a5 completion:(id)a6;
- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5;
- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4;
- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4;
- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4;
- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4;
- (void)didDequeueShuffledItemsInSSIL:(id)a3;
- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4;
- (void)moveItem:(id)a3 fromSection:(id)a4 afterHeadOfSection:(id)a5;
- (void)moveItem:(id)a3 fromSection:(id)a4 afterItem:(id)a5 inSection:(id)a6;
- (void)moveItem:(id)a3 fromSection:(id)a4 afterTailOfSection:(id)a5;
- (void)moveItemToEnd:(id)a3 fromSection:(id)a4;
- (void)moveItemToStart:(id)a3 fromSection:(id)a4;
- (void)removeItem:(id)a3 fromSection:(id)a4;
- (void)replaceDataSource:(id)a3 forSection:(id)a4 completion:(id)a5;
- (void)safelyReshuffleAfterItem:(id)a3 inSection:(id)a4;
- (void)setShuffleStartingItemIdentifier:(id)a3;
- (void)setShuffleStartingSectionIdentifier:(id)a3;
- (void)setShuffleType:(int64_t)a3;
- (void)setShuffleType:(int64_t)a3 startingItem:(id)a4 inSection:(id)a5;
- (void)setShuffleType:(int64_t)a3 startingItem:(id)a4 inSection:(id)a5 randomSource:(id)a6;
@end

@implementation MPShuffleableSectionedIdentifierList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_itemCountWithExclusiveAccessToken:(id)a3
{
  id v4 = a3;
  v5 = [(MPShuffleableSectionedIdentifierList *)self _shuffledListWithExclusiveAccessToken:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = (id)[v5 itemCount];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
    id v7 = [(MPSectionedIdentifierList *)&v10 _itemCountWithExclusiveAccessToken:v4];
  }
  int64_t v8 = (int64_t)v7;

  return v8;
}

- (id)enumeratorWithOptions:(unint64_t)a3 startPosition:(id)a4 endPosition:(id)a5 withExclusiveAccessToken:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [(MPShuffleableSectionedIdentifierList *)self _shuffledListWithExclusiveAccessToken:v10];
  v14 = v13;
  if ((a3 & 0x1000000) != 0 || !v13)
  {
    v18.receiver = self;
    v18.super_class = (Class)MPShuffleableSectionedIdentifierList;
    uint64_t v15 = [(MPSectionedIdentifierList *)&v18 enumeratorWithOptions:a3 startPosition:v12 endPosition:v11 withExclusiveAccessToken:v10];
  }
  else
  {
    uint64_t v15 = [v13 enumeratorWithOptions:a3 startPosition:v12 endPosition:v11];
  }
  v16 = (void *)v15;

  return v16;
}

- (id)_shuffledListWithExclusiveAccessToken:(id)a3
{
  [a3 assertHasExclusiveAccessForOwner:self];
  shuffledList = self->_shuffledList;

  return shuffledList;
}

void __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke(id *a1, uint64_t a2)
{
  v3 = [a1[4] _shuffledListWithExclusiveAccessToken:a2];
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_2;
    v5[3] = &unk_1E57F6B30;
    id v6 = v3;
    id v7 = a1[5];
    id v8 = a1[6];
    [v6 performWithExclusiveAccess:v5];
  }
}

- (MPShuffleableSectionedIdentifierList)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPShuffleableSectionedIdentifierList;
  v5 = [(MPSectionedIdentifierList *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_shuffleType = [v4 decodeIntegerForKey:@"st"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sl"];
    shuffledList = v5->_shuffledList;
    v5->_shuffledList = (_MPSSILImplementation *)v6;

    [(MPSectionedIdentifierList *)v5->_shuffledList setDelegate:v5];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ssi"];
    shuffleStartingSectionIdentifier = v5->_shuffleStartingSectionIdentifier;
    v5->_shuffleStartingSectionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sii"];
    shuffleStartingItemIdentifier = v5->_shuffleStartingItemIdentifier;
    v5->_shuffleStartingItemIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)replaceDataSource:(id)a3 forSection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke;
  v14[3] = &unk_1E57F6B30;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = a5;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v14];
  v13.receiver = self;
  v13.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v13 replaceDataSource:v10 forSection:v11 completion:v12];
}

- (BOOL)hasSection:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"🔀"])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__MPShuffleableSectionedIdentifierList_hasSection___block_invoke;
    v9[3] = &unk_1E57EE898;
    v9[4] = self;
    unsigned __int8 v5 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPShuffleableSectionedIdentifierList;
    unsigned __int8 v5 = [(MPSectionedIdentifierList *)&v8 hasSection:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleStartingItemIdentifier, 0);
  objc_storeStrong((id *)&self->_shuffleStartingSectionIdentifier, 0);

  objc_storeStrong((id *)&self->_shuffledList, 0);
}

- (void)setShuffleStartingItemIdentifier:(id)a3
{
}

- (NSString)shuffleStartingItemIdentifier
{
  return self->_shuffleStartingItemIdentifier;
}

- (void)setShuffleStartingSectionIdentifier:(id)a3
{
}

- (NSString)shuffleStartingSectionIdentifier
{
  return self->_shuffleStartingSectionIdentifier;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)addDataSource:(id)a3 section:(id)a4 afterHeadOfSection:(id)a5
{
}

- (void)_dequeueCandidatesWithQuota:(int64_t)a3 withExclusiveAccessToken:(id)a4
{
  id v5 = [(MPShuffleableSectionedIdentifierList *)self _shuffledListWithExclusiveAccessToken:a4];
  [v5 dequeueCandidatesWithQuota:a3];
}

- (id)_candidateItemsWithExclusiveAccessToken:(id)a3
{
  v3 = [(MPShuffleableSectionedIdentifierList *)self _shuffledListWithExclusiveAccessToken:a3];
  id v4 = [v3 candidateItems];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (void)didDequeueShuffledItemsInSSIL:(id)a3
{
  id v4 = [(MPSectionedIdentifierList *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didDequeueShuffledItemsInSectionedIdentifierList:self];
  }
}

- (void)dataSourceReloadItems:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MPShuffleableSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke;
  v11[3] = &unk_1E57F6B30;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v11];
  v10.receiver = self;
  v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v10 dataSourceReloadItems:v9 inSection:v8];
}

void __72__MPShuffleableSectionedIdentifierList_dataSourceReloadItems_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 dataSourceReloadItems:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
}

- (void)dataSourceRemoveItems:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__MPShuffleableSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke;
  v11[3] = &unk_1E57F6B30;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v11];
  v10.receiver = self;
  v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v10 dataSourceRemoveItems:v9 fromSection:v8];
}

void __74__MPShuffleableSectionedIdentifierList_dataSourceRemoveItems_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 dataSourceRemoveItems:*(void *)(a1 + 40) fromSection:*(void *)(a1 + 48)];
}

- (void)dataSourceInsertItemsAtTail:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 388, @"Invalid insertion (no item identifiers) in section: %@", v8 object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke;
  v13[3] = &unk_1E57F6B30;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v13];
  v12.receiver = self;
  v12.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v12 dataSourceInsertItemsAtTail:v10 inSection:v9];
}

void __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtTail_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 dataSourceInsertItemsAtTail:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
}

- (void)dataSourceInsertItems:(id)a3 afterItem:(id)a4 inSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 count])
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 380, @"Invalid insertion (no item identifiers) in section: %@", v11 object file lineNumber description];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__MPShuffleableSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke;
  v17[3] = &unk_1E57F6CC0;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v17];
  v16.receiver = self;
  v16.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v16 dataSourceInsertItems:v14 afterItem:v13 inSection:v12];
}

void __82__MPShuffleableSectionedIdentifierList_dataSourceInsertItems_afterItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 dataSourceInsertItems:*(void *)(a1 + 40) afterItem:*(void *)(a1 + 48) inSection:*(void *)(a1 + 56)];
}

- (void)dataSourceInsertItemsAtHead:(id)a3 inSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MPShuffleableSectionedIdentifierList.m", 372, @"Invalid insertion (no item identifiers) in section: %@", v8 object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke;
  v13[3] = &unk_1E57F6B30;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v13];
  v12.receiver = self;
  v12.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v12 dataSourceInsertItemsAtHead:v10 inSection:v9];
}

void __78__MPShuffleableSectionedIdentifierList_dataSourceInsertItemsAtHead_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 dataSourceInsertItemsAtHead:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
}

- (void)removeItem:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MPShuffleableSectionedIdentifierList_removeItem_fromSection___block_invoke;
  v11[3] = &unk_1E57F6B30;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v11];
  v10.receiver = self;
  v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v10 removeItem:v9 fromSection:v8];
}

void __63__MPShuffleableSectionedIdentifierList_removeItem_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 removeItem:*(void *)(a1 + 40) fromSection:*(void *)(a1 + 48)];
}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterTailOfSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke;
  v16[3] = &unk_1E57EE988;
  v16[4] = self;
  id v12 = v11;
  id v17 = v12;
  SEL v20 = a2;
  id v13 = v9;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  if (![(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v16])
  {
    v15.receiver = self;
    v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
    [(MPSectionedIdentifierList *)&v15 moveItem:v13 fromSection:v14 afterTailOfSection:v12];
  }
}

BOOL __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  id v4 = v3;
  if (v3)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke_2;
    id v13 = &unk_1E57F6C98;
    id v5 = v3;
    id v14 = v5;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 32);
    id v15 = v6;
    uint64_t v16 = v8;
    uint64_t v17 = v7;
    [v5 performWithExclusiveAccess:&v10];
    objc_msgSend(v5, "moveItem:fromSection:afterTailOfSection:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40), v10, v11, v12, v13);
  }
  return v4 != 0;
}

void __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterTailOfSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:a2] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"MPShuffleableSectionedIdentifierList.m", 343, @"Can only move after a section tail that is in the shuffled SIL: afterSectionIdentifier=%@", *(void *)(a1 + 40) object file lineNumber description];
  }
}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterHeadOfSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke;
  v16[3] = &unk_1E57EE988;
  v16[4] = self;
  id v12 = v11;
  id v17 = v12;
  SEL v20 = a2;
  id v13 = v9;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  if (![(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v16])
  {
    v15.receiver = self;
    v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
    [(MPSectionedIdentifierList *)&v15 moveItem:v13 fromSection:v14 afterHeadOfSection:v12];
  }
}

BOOL __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  id v4 = v3;
  if (v3)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke_2;
    id v13 = &unk_1E57F6C98;
    id v5 = v3;
    id v14 = v5;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 32);
    id v15 = v6;
    uint64_t v16 = v8;
    uint64_t v17 = v7;
    [v5 performWithExclusiveAccess:&v10];
    objc_msgSend(v5, "moveItem:fromSection:afterHeadOfSection:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40), v10, v11, v12, v13);
  }
  return v4 != 0;
}

void __80__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterHeadOfSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) _isSequentialSection:*(void *)(a1 + 40) withExclusiveAccessToken:a2] & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"MPShuffleableSectionedIdentifierList.m", 326, @"Can only move after a section head that is in the shuffled SIL: afterSectionIdentifier=%@", *(void *)(a1 + 40) object file lineNumber description];
  }
}

- (void)moveItem:(id)a3 fromSection:(id)a4 afterItem:(id)a5 inSection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke;
  v19[3] = &unk_1E57EE960;
  v19[4] = self;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  if (![(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v19])
  {
    v18.receiver = self;
    v18.super_class = (Class)MPShuffleableSectionedIdentifierList;
    [(MPSectionedIdentifierList *)&v18 moveItem:v14 fromSection:v15 afterItem:v16 inSection:v17];
  }
}

BOOL __81__MPShuffleableSectionedIdentifierList_moveItem_fromSection_afterItem_inSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  id v4 = v3;
  if (v3) {
    [v3 moveItem:*(void *)(a1 + 40) fromSection:*(void *)(a1 + 48) afterItem:*(void *)(a1 + 56) inSection:*(void *)(a1 + 64)];
  }

  return v4 != 0;
}

- (void)moveItemToEnd:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MPShuffleableSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke;
  v11[3] = &unk_1E57EE938;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  if (![(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v11])
  {
    v10.receiver = self;
    v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
    [(MPSectionedIdentifierList *)&v10 moveItemToEnd:v8 fromSection:v9];
  }
}

BOOL __66__MPShuffleableSectionedIdentifierList_moveItemToEnd_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  id v4 = v3;
  if (v3) {
    [v3 moveItemToEnd:*(void *)(a1 + 40) fromSection:*(void *)(a1 + 48)];
  }

  return v4 != 0;
}

- (void)moveItemToStart:(id)a3 fromSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__MPShuffleableSectionedIdentifierList_moveItemToStart_fromSection___block_invoke;
  v11[3] = &unk_1E57EE938;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  if (![(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnBOOL:v11])
  {
    v10.receiver = self;
    v10.super_class = (Class)MPShuffleableSectionedIdentifierList;
    [(MPSectionedIdentifierList *)&v10 moveItemToStart:v8 fromSection:v9];
  }
}

BOOL __68__MPShuffleableSectionedIdentifierList_moveItemToStart_fromSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  id v4 = v3;
  if (v3) {
    [v3 moveItemToStart:*(void *)(a1 + 40) fromSection:*(void *)(a1 + 48)];
  }

  return v4 != 0;
}

void __80__MPShuffleableSectionedIdentifierList_replaceDataSource_forSection_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _sectionHeadEntryMapWithExclusiveAccessToken:a2];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  [v4 setDataSource:*(void *)(a1 + 48)];
}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 sequentially:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__MPShuffleableSectionedIdentifierList_addDataSourceAtEnd_section_sequentially_completion___block_invoke;
  v16[3] = &unk_1E57EE8C0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  BOOL v19 = a5;
  id v12 = v11;
  id v13 = v10;
  id v14 = a6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v16];
  v15.receiver = self;
  v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v15 addDataSourceAtEnd:v13 section:v12 completion:v14];
}

void __91__MPShuffleableSectionedIdentifierList_addDataSourceAtEnd_section_sequentially_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 addDataSourceAtEnd:*(void *)(a1 + 40) section:*(void *)(a1 + 48) sequentially:*(unsigned __int8 *)(a1 + 56)];
}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 beforeTailOfSection:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_beforeTailOfSection_completion___block_invoke;
  v20[3] = &unk_1E57EE910;
  v20[4] = self;
  id v21 = v12;
  BOOL v24 = a5;
  id v22 = v13;
  id v23 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = a7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v20];
  v19.receiver = self;
  v19.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v19 addDataSource:v17 section:v16 beforeTailOfSection:v15 completion:v18];
}

void __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_beforeTailOfSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 addDataSource:*(void *)(a1 + 40) section:*(void *)(a1 + 48) sequentially:*(unsigned __int8 *)(a1 + 64) beforeTailOfSection:*(void *)(a1 + 56)];
}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterTailOfSection:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterTailOfSection_completion___block_invoke;
  v20[3] = &unk_1E57EE910;
  v20[4] = self;
  id v21 = v12;
  BOOL v24 = a5;
  id v22 = v13;
  id v23 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = a7;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v20];
  v19.receiver = self;
  v19.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v19 addDataSource:v17 section:v16 afterTailOfSection:v15 completion:v18];
}

void __105__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterTailOfSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 addDataSource:*(void *)(a1 + 40) section:*(void *)(a1 + 48) sequentially:*(unsigned __int8 *)(a1 + 64) afterTailOfSection:*(void *)(a1 + 56)];
}

- (void)addDataSource:(id)a3 section:(id)a4 sequentially:(BOOL)a5 afterItem:(id)a6 inSection:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterItem_inSection_completion___block_invoke;
  v24[3] = &unk_1E57EE8E8;
  v24[4] = self;
  id v25 = v14;
  BOOL v29 = a5;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = a8;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v24];
  v23.receiver = self;
  v23.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v23 addDataSource:v21 section:v20 afterItem:v19 inSection:v18 completion:v22];
}

void __106__MPShuffleableSectionedIdentifierList_addDataSource_section_sequentially_afterItem_inSection_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 addDataSource:*(void *)(a1 + 40) section:*(void *)(a1 + 48) sequentially:*(unsigned __int8 *)(a1 + 72) afterItem:*(void *)(a1 + 56) inSection:*(void *)(a1 + 64)];
}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 sequentially:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__MPShuffleableSectionedIdentifierList_addDataSourceAtStart_section_sequentially_completion___block_invoke;
  v16[3] = &unk_1E57EE8C0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  BOOL v19 = a5;
  id v12 = v11;
  id v13 = v10;
  id v14 = a6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v16];
  v15.receiver = self;
  v15.super_class = (Class)MPShuffleableSectionedIdentifierList;
  [(MPSectionedIdentifierList *)&v15 addDataSourceAtStart:v13 section:v12 completion:v14];
}

void __93__MPShuffleableSectionedIdentifierList_addDataSourceAtStart_section_sequentially_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  [v3 addDataSourceAtStart:*(void *)(a1 + 40) section:*(void *)(a1 + 48) sequentially:*(unsigned __int8 *)(a1 + 56)];
}

- (void)addDataSourceAtEnd:(id)a3 section:(id)a4 completion:(id)a5
{
}

- (void)addDataSource:(id)a3 section:(id)a4 beforeTailOfSection:(id)a5 completion:(id)a6
{
}

- (void)addDataSource:(id)a3 section:(id)a4 afterTailOfSection:(id)a5 completion:(id)a6
{
}

- (void)addDataSource:(id)a3 section:(id)a4 afterItem:(id)a5 inSection:(id)a6 completion:(id)a7
{
}

- (void)addDataSourceAtStart:(id)a3 section:(id)a4 completion:(id)a5
{
}

- (id)orderedSectionIdentifiers
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MPShuffleableSectionedIdentifierList_orderedSectionIdentifiers__block_invoke;
  v6[3] = &unk_1E57F6BA8;
  v6[4] = self;
  id v3 = [(MPSectionedIdentifierList *)self performWithExclusiveAccessAndReturnObject:v6];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MPShuffleableSectionedIdentifierList;
    id v3 = [(MPSectionedIdentifierList *)&v5 orderedSectionIdentifiers];
  }

  return v3;
}

id __65__MPShuffleableSectionedIdentifierList_orderedSectionIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  id v3 = [v2 orderedSectionIdentifiers];

  return v3;
}

BOOL __51__MPShuffleableSectionedIdentifierList_hasSection___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _shuffledListWithExclusiveAccessToken:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)safelyReshuffleAfterItem:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__MPShuffleableSectionedIdentifierList_safelyReshuffleAfterItem_inSection___block_invoke;
  v10[3] = &unk_1E57F6B30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v10];
}

void __75__MPShuffleableSectionedIdentifierList_safelyReshuffleAfterItem_inSection___block_invoke(void *a1, uint64_t a2)
{
  BOOL v3 = (void *)a1[4];
  if (v3[13])
  {
    id v4 = [v3 _shuffledListWithExclusiveAccessToken:a2];
    [v4 safelyReshuffleAfterItem:a1[5] inSection:a1[6]];
  }
}

- (void)setShuffleType:(int64_t)a3 startingItem:(id)a4 inSection:(id)a5 randomSource:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__MPShuffleableSectionedIdentifierList_setShuffleType_startingItem_inSection_randomSource___block_invoke;
  v17[3] = &unk_1E57F6A90;
  v17[4] = self;
  id v18 = v12;
  id v19 = v11;
  id v20 = v13;
  int64_t v21 = a3;
  SEL v22 = a2;
  id v14 = v13;
  id v15 = v11;
  id v16 = v12;
  [(MPSectionedIdentifierList *)self performWithExclusiveAccess:v17];
}

void __91__MPShuffleableSectionedIdentifierList_setShuffleType_startingItem_inSection_randomSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v27 = v3;
  if (v4[13] == *(void *)(a1 + 64))
  {
    objc_super v5 = (void *)v4[14];
    if (v5 == *(void **)(a1 + 40))
    {
      int v6 = [v5 isEqual:v4[14]];
      id v4 = *(void **)(a1 + 32);
      if (v6)
      {
        id v7 = (void *)v4[15];
        if (v7 == *(void **)(a1 + 48))
        {
          if ([v7 isEqual:v4[15]]) {
            goto LABEL_17;
          }
          id v4 = *(void **)(a1 + 32);
        }
      }
    }
  }
  v4[13] = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 64);
  if ((unint64_t)(v8 - 1) < 2)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 96);
    *(void *)(v15 + 96) = 0;

    uint64_t v17 = [*(id *)(a1 + 40) copy];
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(void **)(v18 + 112);
    *(void *)(v18 + 112) = v17;

    uint64_t v20 = [*(id *)(a1 + 48) copy];
    uint64_t v21 = *(void *)(a1 + 32);
    SEL v22 = *(void **)(v21 + 120);
    *(void *)(v21 + 120) = v20;

    uint64_t v23 = *(void *)(a1 + 48);
    if (v23)
    {
      id v14 = [*(id *)(a1 + 32) _itemEntry:v23 sectionIdentifier:*(void *)(a1 + 40) withExclusiveAccessToken:v27];
    }
    else
    {
      id v14 = 0;
    }
    BOOL v24 = [[_MPSSILImplementation alloc] initWithSectionedIdentifierList:*(void *)(a1 + 32) randomSource:*(void *)(a1 + 56) startingItemEntry:v14 withExclusiveAccessToken:v27];
    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = *(void **)(v25 + 96);
    *(void *)(v25 + 96) = v24;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setDelegate:");
  }
  else if (v8 == 1000)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"MPShuffleableSectionedIdentifierList.m" lineNumber:164 description:@"Unsupported shuffle type: MPShuffleTypeUserDefault"];
  }
  else
  {
    if (v8) {
      goto LABEL_17;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 96);
    *(void *)(v9 + 96) = 0;

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 120);
    *(void *)(v11 + 120) = 0;

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 112);
    *(void *)(v13 + 112) = 0;
  }

LABEL_17:
}

- (void)setShuffleType:(int64_t)a3 startingItem:(id)a4 inSection:(id)a5
{
}

- (void)setShuffleType:(int64_t)a3
{
}

- (void)encodeWithCoder:(id)a3 withExclusiveAccessToken:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MPShuffleableSectionedIdentifierList;
  id v6 = a4;
  id v7 = a3;
  [(MPSectionedIdentifierList *)&v8 encodeWithCoder:v7 withExclusiveAccessToken:v6];
  objc_msgSend(v6, "assertHasExclusiveAccessForOwner:", self, v8.receiver, v8.super_class);

  [v7 encodeInteger:self->_shuffleType forKey:@"st"];
  [v7 encodeObject:self->_shuffledList forKey:@"sl"];
  [v7 encodeObject:self->_shuffleStartingSectionIdentifier forKey:@"ssi"];
  [v7 encodeObject:self->_shuffleStartingSectionIdentifier forKey:@"sii"];
}

+ (void)setEnumerationCandidateDequeueQuota:(int64_t)a3
{
  __MPSSIL_enumerationCandidateDequeueQuota = a3;
}

+ (int64_t)enumerationCandidateDequeueQuota
{
  return __MPSSIL_enumerationCandidateDequeueQuota;
}

+ (void)setInitialCandidateDequeueQuota:(int64_t)a3
{
  __MPSSIL_initialCandidateDequeueQuota = a3;
}

+ (int64_t)initialCandidateDequeueQuota
{
  return __MPSSIL_initialCandidateDequeueQuota;
}

- (NSString)debugDescription
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  objc_super v8 = __Block_byref_object_copy__27618;
  uint64_t v9 = __Block_byref_object_dispose__27619;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke;
  v4[3] = &unk_1E57F9F20;
  v4[4] = self;
  v4[5] = &v5;
  +[MPSectionedIdentifierList _performWithoutRequiringExclusivity:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) enumeratorWithOptions:23];
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  id v3 = [*(id *)(v1 + 32) _debugDescriptionWithEnumerator:v2 lengths:&v45];
  uint64_t v4 = [v3 mutableCopy];
  uint64_t v5 = *(void *)(*(void *)(v1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void **)(v1 + 32);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke_2;
  v44[3] = &unk_1E57F6BA8;
  v44[4] = v7;
  objc_super v8 = [v7 performWithExclusiveAccessAndReturnObject:v44];
  if ([v8 count])
  {
    v33 = v2;
    [*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) appendString:@"\n┏◀ 🔀 Candidates"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v32 = v8;
    id obj = v8;
    uint64_t v36 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v41;
      uint64_t v9 = &stru_1EE680640;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
          context = (void *)MEMORY[0x19971DE60]();
          id v12 = NSString;
          uint64_t v13 = [v11 itemIdentifier];
          id v14 = [v12 stringWithFormat:@"- %@", v13];

          uint64_t v15 = [*(id *)(v1 + 32) annotationDelegate];
          id v16 = v9;
          if (objc_opt_respondsToSelector())
          {
            uint64_t v17 = [v11 itemIdentifier];
            uint64_t v18 = [v11 sectionIdentifier];
            id v19 = [v15 debugDescriptionForItem:v17 inSection:v18];

            if (v19) {
              id v16 = v19;
            }
            else {
              id v16 = v9;
            }
          }
          uint64_t v20 = *(void **)(*(void *)(*(void *)(v1 + 40) + 8) + 40);
          uint64_t v21 = [@"┣◉ ITEM" stringByPaddingToLength:(int)v45 withString:@" " startingAtIndex:0];
          SEL v22 = [v11 sectionIdentifier];
          [v22 stringByPaddingToLength:SHIDWORD(v45) withString:@" " startingAtIndex:0];
          uint64_t v23 = v38 = v15;
          [v14 stringByPaddingToLength:(int)v46 withString:@" " startingAtIndex:0];
          v37 = v14;
          v25 = uint64_t v24 = v1;
          [(__CFString *)v9 stringByPaddingToLength:SHIDWORD(v46) withString:@" " startingAtIndex:0];
          v27 = id v26 = v9;
          [v20 appendFormat:@"\n%@ %@ %@ %@ %@", v21, v23, v25, v27, v16, 0];

          uint64_t v9 = v26;
          uint64_t v1 = v24;

          ++v10;
        }
        while (v36 != v10);
        uint64_t v36 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v36);
    }

    [*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) appendString:@"\n┗◁ 🔀 Candidates"];
    objc_super v8 = v32;
    id v2 = v33;
  }
  if ([*(id *)(v1 + 32) shuffleType])
  {
    id v28 = [*(id *)(v1 + 32) enumeratorWithOptions:16777239];
    [*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) appendString:@"\n"];
    BOOL v29 = *(void **)(v1 + 32);
    v30 = *(void **)(*(void *)(*(void *)(v1 + 40) + 8) + 40);
    v31 = [v29 _debugDescriptionWithEnumerator:v28 lengths:0];
    [v30 appendString:v31];
  }
}

uint64_t __67__MPShuffleableSectionedIdentifierList_Debugging__debugDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _candidateItemsWithExclusiveAccessToken:a2];
}

@end