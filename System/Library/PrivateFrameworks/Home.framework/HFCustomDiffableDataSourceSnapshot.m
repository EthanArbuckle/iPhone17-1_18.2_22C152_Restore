@interface HFCustomDiffableDataSourceSnapshot
- (NSArray)sections;
- (id)itemIdentifiers;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfSections;
- (void)setSections:(id)a3;
@end

@implementation HFCustomDiffableDataSourceSnapshot

- (id)itemIdentifiers
{
  v2 = [(HFCustomDiffableDataSourceSnapshot *)self sections];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_224);

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HFCustomDiffableDataSourceSnapshot *)self sections];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__HFCustomDiffableDataSourceSnapshot_itemIdentifiersInSectionWithIdentifier___block_invoke;
  v9[3] = &unk_26409BB28;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_flatMap:", v9);

  return v7;
}

uint64_t __53__HFCustomDiffableDataSourceSnapshot_itemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (void)setSections:(id)a3
{
}

id __77__HFCustomDiffableDataSourceSnapshot_itemIdentifiersInSectionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  v5 = [*(id *)(a1 + 32) identifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    v7 = [v3 items];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfSections
{
  v2 = [(HFCustomDiffableDataSourceSnapshot *)self sections];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)numberOfItems
{
  v2 = [(HFCustomDiffableDataSourceSnapshot *)self itemIdentifiers];
  int64_t v3 = [v2 count];

  return v3;
}

- (void).cxx_destruct
{
}

@end