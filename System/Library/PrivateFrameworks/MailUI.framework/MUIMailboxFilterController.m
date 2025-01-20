@interface MUIMailboxFilterController
- (MUIMailboxFilterController)initWithMailboxes:(id)a3 focus:(id)a4 baseStoragePath:(id)a5 defaultsRepresentationProvider:(id)a6 filterRepresentationProvider:(id)a7 mailboxFilterClass:(Class)a8 filterProviderClass:(Class)a9 isFilteringAvailable:(BOOL)a10;
- (MUIMailboxFilterPersistedStore)store;
- (MUIMailboxFilterViewModel)viewModel;
- (void)reselectFocusedAccounts;
- (void)updateWithFilterContext:(id)a3;
@end

@implementation MUIMailboxFilterController

- (void)updateWithFilterContext:(id)a3
{
  id v9 = a3;
  v4 = [(MUIMailboxFilterController *)self viewModel];
  id v5 = [v4 filterContext];

  if (v5 != v9)
  {
    v6 = [(MUIMailboxFilterController *)self store];
    v7 = [v6 filterViewModelForContext:v9];
    viewModel = self->_viewModel;
    self->_viewModel = v7;
  }
}

- (MUIMailboxFilterPersistedStore)store
{
  return self->_store;
}

- (MUIMailboxFilterController)initWithMailboxes:(id)a3 focus:(id)a4 baseStoragePath:(id)a5 defaultsRepresentationProvider:(id)a6 filterRepresentationProvider:(id)a7 mailboxFilterClass:(Class)a8 filterProviderClass:(Class)a9 isFilteringAvailable:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v28.receiver = self;
  v28.super_class = (Class)MUIMailboxFilterController;
  v21 = [(MUIMailboxFilterController *)&v28 init];
  if (v21)
  {
    v22 = [[MUIMailboxFilterContext alloc] initWithMailboxes:v16 focus:v17 isFilteringAvailable:a10];
    v23 = [[MUIMailboxFilterPersistedStore alloc] initWithBaseStoragePath:v18 defaultsRepresentationProvider:v19 filterRepresentationProvider:v20 mailboxFilterClass:a8 filterProviderClass:a9];
    store = v21->_store;
    v21->_store = v23;

    uint64_t v25 = [(MUIMailboxFilterPersistedStore *)v21->_store filterViewModelForContext:v22];
    viewModel = v21->_viewModel;
    v21->_viewModel = (MUIMailboxFilterViewModel *)v25;
  }
  return v21;
}

- (MUIMailboxFilterViewModel)viewModel
{
  return self->_viewModel;
}

- (void)reselectFocusedAccounts
{
  id v2 = [(MUIMailboxFilterController *)self viewModel];
  [v2 reselectFocusFilters];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end