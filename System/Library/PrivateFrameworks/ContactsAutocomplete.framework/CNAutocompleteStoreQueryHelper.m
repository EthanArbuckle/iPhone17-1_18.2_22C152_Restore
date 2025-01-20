@interface CNAutocompleteStoreQueryHelper
- (CNAutocompleteFetchDelegate)delegate;
- (CNAutocompleteProbeProvider)probeProvider;
- (CNAutocompleteSearchProvider)searchProvider;
- (CNAutocompleteStoreQueryContext)queryContext;
- (CNAutocompleteStoreQueryHelper)initWithSearchProvider:(id)a3 delegate:(id)a4 probeProvider:(id)a5 scheduler:(id)a6 userSession:(id)a7;
- (CNAutocompleteUserSession)userSession;
- (CNScheduler)scheduler;
- (id)executeFetchRequest:(id)a3 delegate:(id)a4 delegateToken:(id)a5;
@end

@implementation CNAutocompleteStoreQueryHelper

- (CNAutocompleteStoreQueryHelper)initWithSearchProvider:(id)a3 delegate:(id)a4 probeProvider:(id)a5 scheduler:(id)a6 userSession:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNAutocompleteStoreQueryHelper;
  v18 = [(CNAutocompleteStoreQueryHelper *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchProvider, a3);
    objc_storeWeak((id *)&v19->_delegate, v14);
    v20 = objc_alloc_init(CNAutocompleteStoreQueryContext);
    queryContext = v19->_queryContext;
    v19->_queryContext = v20;

    objc_storeStrong((id *)&v19->_probeProvider, a5);
    objc_storeStrong((id *)&v19->_scheduler, a6);
    objc_storeStrong((id *)&v19->_userSession, a7);
    v22 = v19;
  }

  return v19;
}

- (id)executeFetchRequest:(id)a3 delegate:(id)a4 delegateToken:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(CNAutocompleteStoreQueryHelper *)self delegate];
  }
  v12 = v11;
  id v13 = [(CNAutocompleteStoreQueryHelper *)self searchProvider];
  id v14 = [(CNAutocompleteStoreQueryHelper *)self probeProvider];
  id v15 = [(CNAutocompleteStoreQueryHelper *)self scheduler];
  id v16 = [(CNAutocompleteStoreQueryHelper *)self userSession];
  id v17 = +[CNAutocompleteQuery queryWithRequest:v8 searchProvider:v13 delegate:v12 probeProvider:v14 scheduler:v15 userSession:v16 delegateToken:v10];

  v18 = CNALoggingContextDebug();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl(&dword_1BEF57000, v18, OS_LOG_TYPE_DEFAULT, "Query: %@", buf, 0xCu);
  }

  v19 = [(CNAutocompleteStoreQueryHelper *)self queryContext];
  v20 = [v17 executeWithContext:v19];

  return v20;
}

- (CNAutocompleteSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (CNAutocompleteFetchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CNAutocompleteFetchDelegate *)WeakRetained;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (CNAutocompleteStoreQueryContext)queryContext
{
  return self->_queryContext;
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (CNAutocompleteUserSession)userSession
{
  return self->_userSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_probeProvider, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchProvider, 0);
}

@end