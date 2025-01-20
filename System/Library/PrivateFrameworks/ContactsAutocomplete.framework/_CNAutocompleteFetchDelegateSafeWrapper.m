@interface _CNAutocompleteFetchDelegateSafeWrapper
- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5;
- (_CNAutocompleteFetchDelegateSafeWrapper)initWithDelegate:(id)a3;
- (id)autocompleteFetch:(id)a3 willAdjustResults:(id)a4;
- (id)resultComparatorForAutocompleteFetch:(id)a3;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetch:(id)a3 willSortResults:(id)a4;
- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3;
- (void)autocompleteFetchDidEndNetworkActivity:(id)a3;
- (void)autocompleteFetchDidFinish:(id)a3;
@end

@implementation _CNAutocompleteFetchDelegateSafeWrapper

- (_CNAutocompleteFetchDelegateSafeWrapper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CNAutocompleteFetchDelegateSafeWrapper;
  v5 = [(_CNAutocompleteFetchDelegateSafeWrapper *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 autocompleteFetch:v11 didReceiveResults:v6];
  }
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 autocompleteFetch:v11 didFailWithError:v6];
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 autocompleteFetchDidFinish:v8];
  }
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 autocompleteFetchDidBeginNetworkActivity:v8];
  }
}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 autocompleteFetchDidEndNetworkActivity:v8];
  }
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    char v15 = [v14 autocompleteFetch:v8 shouldExpectSupplementalResultsForRequest:v9 completionHandler:v10];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)autocompleteFetch:(id)a3 willAdjustResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = CNALoggingContextDebug();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v15 = 0;
      _os_log_impl(&dword_1BEF57000, v11, OS_LOG_TYPE_DEFAULT, "Asking delegate to adjust results", v15, 2u);
    }

    id v12 = objc_loadWeakRetained((id *)p_delegate);
    char v13 = [v12 autocompleteFetch:v6 willAdjustResults:v7];
  }
  else
  {
    char v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

- (void)autocompleteFetch:(id)a3 willSortResults:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 autocompleteFetch:v11 willSortResults:v6];
  }
}

- (id)resultComparatorForAutocompleteFetch:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = [v8 resultComparatorForAutocompleteFetch:v4];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end