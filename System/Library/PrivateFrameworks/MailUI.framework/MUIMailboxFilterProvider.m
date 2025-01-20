@interface MUIMailboxFilterProvider
- (BOOL)_isInbox;
- (BOOL)_isMailboxOfSmartMailboxType:(int64_t)a3;
- (Class)mailboxFilterClass;
- (EMFocus)focus;
- (MUIMailboxFilter)senderFilter;
- (MUIMailboxFilterGroup)accountsFilterGroup;
- (MUIMailboxFilterGroup)individualVIPFilterGroup;
- (MUIMailboxFilterProvider)initWithFilterContext:(id)a3 mailboxFilterClass:(Class)a4;
- (NSArray)accountFilters;
- (NSArray)accountsInSmartMailboxScope;
- (NSArray)allFilters;
- (NSArray)defaultFilters;
- (NSArray)filtersGroups;
- (NSArray)focusFilters;
- (NSArray)mailboxes;
- (id)_accountsInSmartMailboxScope;
- (id)_addressedGroup;
- (id)_andFilterGroup;
- (id)_flagsFilterGroup;
- (id)groupContainingFilter:(id)a3;
- (id)reduce:(id)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_vipsDidChange:(id)a3;
- (void)dealloc;
- (void)setAccountFilters:(id)a3;
- (void)setAccountsFilterGroup:(id)a3;
- (void)setAccountsInSmartMailboxScope:(id)a3;
- (void)setFiltersGroups:(id)a3;
- (void)setFocus:(id)a3;
- (void)setMailboxFilterClass:(Class)a3;
- (void)setSenderFilter:(id)a3;
@end

@implementation MUIMailboxFilterProvider

- (MUIMailboxFilterProvider)initWithFilterContext:(id)a3 mailboxFilterClass:(Class)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUIMailboxFilterProvider;
  v7 = [(MUIMailboxFilterProvider *)&v15 init];
  if (v7)
  {
    v8 = [v6 mailboxes];
    uint64_t v9 = [v8 copy];
    mailboxes = v7->_mailboxes;
    v7->_mailboxes = (NSArray *)v9;

    uint64_t v11 = [v6 focus];
    focus = v7->_focus;
    v7->_focus = (EMFocus *)v11;

    if (!a4) {
      a4 = (Class)objc_opt_class();
    }
    objc_storeStrong((id *)&v7->_mailboxFilterClass, a4);
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v7 selector:sel__vipsDidChange_ name:*MEMORY[0x1E4F601C8] object:0];
    [v13 addObserver:v7 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MUIMailboxFilterProvider;
  [(MUIMailboxFilterProvider *)&v4 dealloc];
}

- (NSArray)filtersGroups
{
  filtersGroups = self->_filtersGroups;
  if (!filtersGroups)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(MUIMailboxFilterProvider *)self accountsFilterGroup];
    objc_msgSend(v4, "ef_addOptionalObject:", v5);

    id v6 = [(MUIMailboxFilterProvider *)self _flagsFilterGroup];
    objc_msgSend(v4, "ef_addOptionalObject:", v6);

    v7 = [(MUIMailboxFilterProvider *)self _addressedGroup];
    objc_msgSend(v4, "ef_addOptionalObject:", v7);

    v8 = [(MUIMailboxFilterProvider *)self _andFilterGroup];
    objc_msgSend(v4, "ef_addOptionalObject:", v8);

    uint64_t v9 = (NSArray *)[v4 copy];
    v10 = self->_filtersGroups;
    self->_filtersGroups = v9;

    filtersGroups = self->_filtersGroups;
  }
  return filtersGroups;
}

- (NSArray)allFilters
{
  v2 = [(MUIMailboxFilterProvider *)self filtersGroups];
  v3 = objc_msgSend(v2, "ef_flatMap:", &__block_literal_global_23);

  return (NSArray *)v3;
}

uint64_t __38__MUIMailboxFilterProvider_allFilters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 filters];
}

- (NSArray)defaultFilters
{
  id v4 = [(MUIMailboxFilterProvider *)self mailboxFilterClass];
  BOOL v5 = [(MUIMailboxFilterProvider *)self _isMailboxOfSmartMailboxType:2];
  id v6 = [v4 alloc];
  if (v5) {
    uint64_t v7 = [v6 initForFlaggedMessages];
  }
  else {
    uint64_t v7 = [v6 initForUnreadMessages];
  }
  v8 = (void *)v7;
  uint64_t v9 = [(MUIMailboxFilterProvider *)self allFilters];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__MUIMailboxFilterProvider_defaultFilters__block_invoke;
  v17[3] = &unk_1E6D12F18;
  id v10 = v8;
  id v18 = v10;
  uint64_t v11 = objc_msgSend(v9, "ef_filter:", v17);

  if (![v11 count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MUIMailboxFilterProvider.m" lineNumber:95 description:@"Should always return a default filter"];
  }
  v12 = [(MUIMailboxFilterProvider *)self focus];
  if (v12)
  {
    v13 = [(MUIMailboxFilterProvider *)self focusFilters];
    if ([v13 count])
    {
      v14 = objc_msgSend(v11, "ef_filter:", &__block_literal_global_16_0);

      uint64_t v11 = [v14 arrayByAddingObjectsFromArray:v13];
    }
  }

  return (NSArray *)v11;
}

uint64_t __42__MUIMailboxFilterProvider_defaultFilters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  LODWORD(v2) = [v3 isEqualToFilter:v2];
  int v4 = [v3 hasMailboxPredicate];

  return v2 | v4;
}

uint64_t __42__MUIMailboxFilterProvider_defaultFilters__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasMailboxPredicate] ^ 1;
}

- (id)groupContainingFilter:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MUIMailboxFilterProvider *)self individualVIPFilterGroup];
  id v6 = [v5 filters];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = [(MUIMailboxFilterProvider *)self filtersGroups];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__MUIMailboxFilterProvider_groupContainingFilter___block_invoke;
    v11[3] = &unk_1E6D12F60;
    id v12 = v4;
    objc_msgSend(v9, "ef_firstObjectPassingTest:", v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

uint64_t __50__MUIMailboxFilterProvider_groupContainingFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 filters];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)reduce:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(v4, "ef_partition:", &__block_literal_global_19);
  id v6 = [(MUIMailboxFilterProvider *)self accountFilters];
  uint64_t v7 = [v6 count];
  id v8 = [v5 first];
  uint64_t v9 = [v8 count];

  if (v7 == v9)
  {
    uint64_t v10 = [v5 second];

    id v4 = (id)v10;
  }

  return v4;
}

uint64_t __35__MUIMailboxFilterProvider_reduce___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasMailboxPredicate];
}

- (NSArray)accountFilters
{
  if (!self->_accountFilters)
  {
    id v3 = [(MUIMailboxFilterProvider *)self mailboxes];
    if ([v3 count] == 1)
    {
      id v4 = [(MUIMailboxFilterProvider *)self mailboxes];
      BOOL v5 = [v4 firstObject];
      int v6 = [v5 isSmartMailbox];

      if (!v6) {
        goto LABEL_6;
      }
      id v3 = [(MUIMailboxFilterProvider *)self _accountsInSmartMailboxScope];
      uint64_t v7 = [(MUIMailboxFilterProvider *)self mailboxes];
      id v8 = [v7 firstObject];

      uint64_t v9 = [(MUIMailboxFilterProvider *)self mailboxFilterClass];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __42__MUIMailboxFilterProvider_accountFilters__block_invoke;
      v15[3] = &unk_1E6D12F88;
      id v16 = v8;
      v17 = v9;
      id v10 = v8;
      objc_msgSend(v3, "ef_map:", v15);
      uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      accountFilters = self->_accountFilters;
      self->_accountFilters = v11;
    }
  }
LABEL_6:
  v13 = self->_accountFilters;
  return v13;
}

id __42__MUIMailboxFilterProvider_accountFilters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(objc_class **)(a1 + 40);
  id v4 = a2;
  BOOL v5 = (void *)[[v3 alloc] initWithAccount:v4 iconFromSmartMailbox:*(void *)(a1 + 32)];

  return v5;
}

- (id)_accountsInSmartMailboxScope
{
  if (!self->_accountsInSmartMailboxScope)
  {
    id v3 = [(MUIMailboxFilterProvider *)self mailboxes];
    if ([v3 count] == 1)
    {
      id v4 = [(MUIMailboxFilterProvider *)self mailboxes];
      BOOL v5 = [v4 firstObject];
      int v6 = [v5 isSmartMailbox];

      if (!v6) {
        goto LABEL_6;
      }
      uint64_t v7 = [(MUIMailboxFilterProvider *)self mailboxes];
      id v3 = [v7 firstObject];

      char v25 = 0;
      id v8 = [v3 mailboxScope];
      uint64_t v9 = [v3 repository];
      id v10 = [v8 allMailboxObjectIDsWithMailboxTypeResolver:v9 forExclusion:&v25];

      uint64_t v11 = (void *)MEMORY[0x1E4F60D70];
      id v12 = [v3 repository];
      v13 = [v10 allObjects];
      v14 = [v12 mailboxesForObjectIDs:v13];
      objc_super v15 = [v11 join:v14];
      id v16 = [v15 result];

      v17 = (void *)MEMORY[0x1E4F1CAD0];
      id v18 = objc_msgSend(v16, "ef_compactMapSelector:", sel_account);
      v19 = [v17 setWithArray:v18];
      v20 = [v19 allObjects];

      v21 = [v20 sortedArrayUsingComparator:&__block_literal_global_27];

      accountsInSmartMailboxScope = self->_accountsInSmartMailboxScope;
      self->_accountsInSmartMailboxScope = v21;
    }
  }
LABEL_6:
  v23 = self->_accountsInSmartMailboxScope;
  return v23;
}

uint64_t __56__MUIMailboxFilterProvider__accountsInSmartMailboxScope__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 name];
  int v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (MUIMailboxFilterGroup)accountsFilterGroup
{
  if (!self->_accountsFilterGroup)
  {
    self->_accountsFilterGroup = 0;
    id v3 = [(MUIMailboxFilterProvider *)self accountFilters];

    if (v3)
    {
      id v4 = _EFLocalizedString();
      BOOL v5 = [(MUIMailboxFilterProvider *)self accountFilters];
      int v6 = +[MUIMailboxFilterGroup groupWithName:v4 combinator:1 selectionCardinality:0 filters:v5];
      accountsFilterGroup = self->_accountsFilterGroup;
      self->_accountsFilterGroup = v6;
    }
  }
  id v8 = self->_accountsFilterGroup;
  return v8;
}

- (NSArray)focusFilters
{
}

- (id)_flagsFilterGroup
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(MUIMailboxFilterProvider *)self mailboxFilterClass];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__MUIMailboxFilterProvider__flagsFilterGroup__block_invoke;
  aBlock[3] = &unk_1E6D12FD0;
  aBlock[4] = self;
  id v11 = v3;
  id v12 = v4;
  id v5 = v3;
  int v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v6[2](v6, 2);
  v6[2](v6, 1);
  uint64_t v7 = _EFLocalizedString();
  id v8 = +[MUIMailboxFilterGroup groupWithName:v7 combinator:1 selectionCardinality:1 filters:v5];

  return v8;
}

void __45__MUIMailboxFilterProvider__flagsFilterGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) _isMailboxOfSmartMailboxType:a2] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = (id)[objc_alloc(*(Class *)(a1 + 48)) initForSmartMailboxType:a2];
    objc_msgSend(v4, "ef_addOptionalObject:", v5);
  }
}

- (BOOL)_isMailboxOfSmartMailboxType:(int64_t)a3
{
  id v4 = [(MUIMailboxFilterProvider *)self mailboxes];
  if ([v4 count] == 1
    && ([v4 objectAtIndexedSubscript:0],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isSmartMailbox],
        v5,
        v6))
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    BOOL v8 = [v7 smartMailboxType] == a3;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_addressedGroup
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MUIMailboxFilterProvider *)self mailboxFilterClass];
  id v3 = (void *)[[v2 alloc] initForToMeMessages];
  v9[0] = v3;
  id v4 = (void *)[[v2 alloc] initForCCMeMessages];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  int v6 = _EFLocalizedString();
  uint64_t v7 = +[MUIMailboxFilterGroup groupWithName:v6 combinator:1 selectionCardinality:1 filters:v5];

  return v7;
}

- (id)_andFilterGroup
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(MUIMailboxFilterProvider *)self mailboxFilterClass];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__MUIMailboxFilterProvider__andFilterGroup__block_invoke;
  aBlock[3] = &unk_1E6D12FD0;
  aBlock[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v12 = v4;
  int v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v6[2](v6, 4);
  v6[2](v6, 0);
  v6[2](v6, 6);
  uint64_t v7 = [(MUIMailboxFilterProvider *)self senderFilter];
  objc_msgSend(v5, "ef_addOptionalObject:", v7);

  if ([v5 count])
  {
    BOOL v8 = +[MUIMailboxFilterGroup groupWithName:0 combinator:0 selectionCardinality:1 filters:v5];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __43__MUIMailboxFilterProvider__andFilterGroup__block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) _isMailboxOfSmartMailboxType:a2] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = (id)[objc_alloc(*(Class *)(a1 + 48)) initForSmartMailboxType:a2];
    objc_msgSend(v4, "ef_addOptionalObject:", v5);
  }
}

- (BOOL)_isInbox
{
  id v3 = [(MUIMailboxFilterProvider *)self mailboxes];
  uint64_t v4 = [v3 count];

  if (v4 != 1) {
    return 1;
  }
  id v5 = [(MUIMailboxFilterProvider *)self mailboxes];
  int v6 = [v5 lastObject];
  char v7 = [v6 isInboxMailbox];

  return v7;
}

- (void)setSenderFilter:(id)a3
{
  id v6 = a3;
  if ((EFObjectsAreEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_senderFilter, a3);
    filtersGroups = self->_filtersGroups;
    self->_filtersGroups = 0;
  }
}

- (MUIMailboxFilterGroup)individualVIPFilterGroup
{
  return 0;
}

- (void)_vipsDidChange:(id)a3
{
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  self->_filtersGroups = 0;
  MEMORY[0x1F41817F8]();
}

- (MUIMailboxFilter)senderFilter
{
  return self->_senderFilter;
}

- (void)setFiltersGroups:(id)a3
{
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setAccountFilters:(id)a3
{
}

- (NSArray)accountsInSmartMailboxScope
{
  return self->_accountsInSmartMailboxScope;
}

- (void)setAccountsInSmartMailboxScope:(id)a3
{
}

- (EMFocus)focus
{
  return self->_focus;
}

- (void)setFocus:(id)a3
{
}

- (void)setAccountsFilterGroup:(id)a3
{
}

- (Class)mailboxFilterClass
{
  return self->_mailboxFilterClass;
}

- (void)setMailboxFilterClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxFilterClass, 0);
  objc_storeStrong((id *)&self->_accountsFilterGroup, 0);
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong((id *)&self->_accountsInSmartMailboxScope, 0);
  objc_storeStrong((id *)&self->_accountFilters, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_filtersGroups, 0);
  objc_storeStrong((id *)&self->_senderFilter, 0);
}

@end