@interface MUIMailboxFilterViewModel
- (BOOL)isFilterAvailable;
- (BOOL)isFilterEnabled;
- (EFObserver)selectedFiltersObservable;
- (MUIMailboxFilter)senderFilter;
- (MUIMailboxFilterContext)filterContext;
- (MUIMailboxFilterProvider)provider;
- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4;
- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4 selectedFilters:(id)a5 isFilteringAvailable:(BOOL)a6;
- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4 selectedFilters:(id)a5 sortedFilters:(id)a6 isFilteringAvailable:(BOOL)a7;
- (NSArray)reducedSelectedFilters;
- (NSArray)selectedFilters;
- (NSFormatter)formatter;
- (id)_compoundPredicateForFilters:(id)a3;
- (id)predicateForSelectedFilters;
- (id)selectedFiltersDescription;
- (void)_notifySelectedFiltersObserver;
- (void)reselectFocusFilters;
- (void)setFilterAvailable:(BOOL)a3;
- (void)setFilterContext:(id)a3;
- (void)setFilterEnabled:(BOOL)a3;
- (void)setFormatter:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSelectedFilters:(id)a3;
- (void)setSenderFilter:(id)a3;
@end

@implementation MUIMailboxFilterViewModel

- (MUIMailboxFilterContext)filterContext
{
  return self->_filterContext;
}

- (void)setFilterContext:(id)a3
{
}

- (EFObserver)selectedFiltersObservable
{
  return self->_selectedFiltersObservable;
}

- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4 selectedFilters:(id)a5 sortedFilters:(id)a6 isFilteringAvailable:(BOOL)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"MUIMailboxFilterViewModel.m", 38, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"MUIMailboxFilterViewModel.m", 39, @"Invalid parameter not satisfying: %@", @"formatter" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)MUIMailboxFilterViewModel;
  v18 = [(MUIMailboxFilterViewModel *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_provider, a3);
    objc_storeStrong((id *)&v19->_formatter, a4);
    uint64_t v20 = [v16 copy];
    selectedFilters = v19->_selectedFilters;
    v19->_selectedFilters = (NSArray *)v20;

    uint64_t v22 = [MEMORY[0x1E4F60DD8] observableObserver];
    selectedFiltersObservable = v19->_selectedFiltersObservable;
    v19->_selectedFiltersObservable = (EFObserver *)v22;

    v19->_filterAvailable = a7;
  }

  return v19;
}

- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4 selectedFilters:(id)a5 isFilteringAvailable:(BOOL)a6
{
  return [(MUIMailboxFilterViewModel *)self initWithProvider:a3 formatter:a4 selectedFilters:a5 sortedFilters:0 isFilteringAvailable:a6];
}

- (BOOL)isFilterEnabled
{
  return self->_filterEnabled && [(MUIMailboxFilterViewModel *)self isFilterAvailable];
}

- (MUIMailboxFilterViewModel)initWithProvider:(id)a3 formatter:(id)a4
{
  return [(MUIMailboxFilterViewModel *)self initWithProvider:a3 formatter:a4 selectedFilters:0 isFilteringAvailable:0];
}

- (id)selectedFiltersDescription
{
  v3 = [(MUIMailboxFilterViewModel *)self formatter];
  v4 = [(MUIMailboxFilterViewModel *)self reducedSelectedFilters];
  v5 = [v3 stringForObjectValue:v4];

  return v5;
}

- (void)setFilterEnabled:(BOOL)a3
{
  if (self->_filterEnabled != a3)
  {
    self->_filterEnabled = a3;
    if (!a3) {
      [(MUIMailboxFilterViewModel *)self setSenderFilter:0];
    }
  }
}

- (NSArray)reducedSelectedFilters
{
  v3 = [(MUIMailboxFilterViewModel *)self provider];
  v4 = [(MUIMailboxFilterViewModel *)self selectedFilters];
  v5 = [v3 reduce:v4];

  return (NSArray *)v5;
}

- (MUIMailboxFilter)senderFilter
{
  v2 = [(MUIMailboxFilterViewModel *)self provider];
  v3 = [v2 senderFilter];

  return (MUIMailboxFilter *)v3;
}

- (void)setSenderFilter:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MUIMailboxFilterViewModel *)self provider];
  v6 = [v5 senderFilter];

  if ((EFObjectsAreEqual() & 1) == 0)
  {
    v7 = [(MUIMailboxFilterViewModel *)self provider];
    [v7 setSenderFilter:v4];

    if (v4)
    {
      if ([(MUIMailboxFilterViewModel *)self isFilterEnabled])
      {
        v8 = [(MUIMailboxFilterViewModel *)self selectedFilters];
        v9 = [v8 arrayByAddingObject:v4];
        [(MUIMailboxFilterViewModel *)self setSelectedFilters:v9];
      }
      else
      {
        v10[0] = v4;
        v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
        [(MUIMailboxFilterViewModel *)self setSelectedFilters:v8];
      }
    }
    else if (v6)
    {
      [(MUIMailboxFilterViewModel *)self setSelectedFilters:MEMORY[0x1E4F1CBF0]];
    }
  }
}

- (NSArray)selectedFilters
{
  if (![(NSArray *)self->_selectedFilters count])
  {
    v3 = [(MUIMailboxFilterViewModel *)self provider];
    id v4 = [v3 defaultFilters];
    selectedFilters = self->_selectedFilters;
    self->_selectedFilters = v4;
  }
  v6 = self->_selectedFilters;
  return v6;
}

- (void)setSelectedFilters:(id)a3
{
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  v5 = (NSArray *)v4;
  p_selectedFilters = &self->_selectedFilters;
  if (self->_selectedFilters != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_selectedFilters, v4);
    p_selectedFilters = (NSArray **)[(MUIMailboxFilterViewModel *)self _notifySelectedFiltersObserver];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_selectedFilters, v5);
}

- (void)reselectFocusFilters
{
  v3 = [(MUIMailboxFilterViewModel *)self provider];
  id v7 = [v3 focusFilters];

  if ([v7 count])
  {
    id v4 = [(MUIMailboxFilterViewModel *)self selectedFilters];
    v5 = objc_msgSend(v4, "ef_filter:", &__block_literal_global_25);

    v6 = [v5 arrayByAddingObjectsFromArray:v7];

    [(MUIMailboxFilterViewModel *)self setSelectedFilters:v6];
  }
}

uint64_t __49__MUIMailboxFilterViewModel_reselectFocusFilters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasMailboxPredicate] ^ 1;
}

- (id)predicateForSelectedFilters
{
  if ([(MUIMailboxFilterViewModel *)self isFilterAvailable])
  {
    v3 = [(MUIMailboxFilterViewModel *)self selectedFilters];
    id v4 = [(MUIMailboxFilterViewModel *)self _compoundPredicateForFilters:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_compoundPredicateForFilters:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke;
    v17[3] = &unk_1E6D13018;
    v17[4] = self;
    v6 = objc_msgSend(v5, "ef_groupBy:", v17);
    id v7 = [v6 allKeys];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke_2;
    id v15 = &unk_1E6D13060;
    id v16 = v6;
    id v8 = v6;
    v9 = objc_msgSend(v7, "ef_map:", &v12);

    v10 = objc_msgSend(MEMORY[0x1E4F28BA0], "andPredicateWithSubpredicates:", v9, v12, v13, v14, v15);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 provider];
  v5 = [v4 groupContainingFilter:v3];

  return v5;
}

id __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 objectForKeyedSubscript:v3];
  v5 = objc_msgSend(v4, "ef_map:", &__block_literal_global_16_1);
  uint64_t v6 = [v3 combinator];

  if (v6) {
    [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
  }
  else {
  id v7 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  }

  return v7;
}

uint64_t __58__MUIMailboxFilterViewModel__compoundPredicateForFilters___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 predicate];
}

- (void)_notifySelectedFiltersObserver
{
  id v4 = [(MUIMailboxFilterViewModel *)self selectedFiltersObservable];
  id v3 = [(MUIMailboxFilterViewModel *)self selectedFilters];
  [v4 observerDidReceiveResult:v3];
}

- (MUIMailboxFilterProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)isFilterAvailable
{
  return self->_filterAvailable;
}

- (void)setFilterAvailable:(BOOL)a3
{
  self->_filterAvailable = a3;
}

- (NSFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedFiltersObservable, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_filterContext, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_selectedFilters, 0);
}

@end