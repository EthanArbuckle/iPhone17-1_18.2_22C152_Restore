@interface CNAutocompleteFetchBlockDelegate
- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)adjustmentHandler;
- (id)autocompleteFetch:(id)a3 willAdjustResults:(id)a4;
- (id)beganNetworkActivityHandler;
- (id)comparatorHandler;
- (id)endedNetworkActivityHandler;
- (id)errorHandler;
- (id)finishHandler;
- (id)resultComparatorForAutocompleteFetch:(id)a3;
- (id)resultHandler;
- (id)supplementalResultHandler;
- (id)willSortHandler;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetch:(id)a3 willSortResults:(id)a4;
- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3;
- (void)autocompleteFetchDidEndNetworkActivity:(id)a3;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)setAdjustmentHandler:(id)a3;
- (void)setBeganNetworkActivityHandler:(id)a3;
- (void)setComparatorHandler:(id)a3;
- (void)setEndedNetworkActivityHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFinishHandler:(id)a3;
- (void)setResultHandler:(id)a3;
- (void)setSupplementalResultHandler:(id)a3;
- (void)setWillSortHandler:(id)a3;
@end

@implementation CNAutocompleteFetchBlockDelegate

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(CNAutocompleteFetchBlockDelegate *)self resultHandler];

  if (v7)
  {
    v8 = [(CNAutocompleteFetchBlockDelegate *)self resultHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  id v6 = a3;
  v4 = [(CNAutocompleteFetchBlockDelegate *)self finishHandler];

  if (v4)
  {
    v5 = [(CNAutocompleteFetchBlockDelegate *)self finishHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(CNAutocompleteFetchBlockDelegate *)self errorHandler];

  if (v7)
  {
    v8 = [(CNAutocompleteFetchBlockDelegate *)self errorHandler];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  id v6 = a3;
  v4 = [(CNAutocompleteFetchBlockDelegate *)self beganNetworkActivityHandler];

  if (v4)
  {
    v5 = [(CNAutocompleteFetchBlockDelegate *)self beganNetworkActivityHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  id v6 = a3;
  v4 = [(CNAutocompleteFetchBlockDelegate *)self endedNetworkActivityHandler];

  if (v4)
  {
    v5 = [(CNAutocompleteFetchBlockDelegate *)self endedNetworkActivityHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(CNAutocompleteFetchBlockDelegate *)self supplementalResultHandler];
  char v12 = ((uint64_t (**)(void, id, id, id))v11)[2](v11, v10, v9, v8);

  return v12;
}

- (id)autocompleteFetch:(id)a3 willAdjustResults:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteFetchBlockDelegate *)self adjustmentHandler];
  v7 = ((void (**)(void, id))v6)[2](v6, v5);

  return v7;
}

- (void)autocompleteFetch:(id)a3 willSortResults:(id)a4
{
  id v7 = a4;
  id v5 = [(CNAutocompleteFetchBlockDelegate *)self willSortHandler];

  if (v5)
  {
    id v6 = [(CNAutocompleteFetchBlockDelegate *)self willSortHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (id)resultComparatorForAutocompleteFetch:(id)a3
{
  v4 = [(CNAutocompleteFetchBlockDelegate *)self comparatorHandler];

  if (v4)
  {
    id v5 = [(CNAutocompleteFetchBlockDelegate *)self comparatorHandler];
    id v6 = v5[2]();
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_autocompleteFetch_didReceiveResults_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self resultHandler];
LABEL_20:
    BOOL v3 = v4 != 0;

    return v3;
  }
  if (sel_autocompleteFetchDidFinish_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self finishHandler];
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_didFailWithError_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self errorHandler];
    goto LABEL_20;
  }
  if (sel_autocompleteFetchDidBeginNetworkActivity_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self beganNetworkActivityHandler];
    goto LABEL_20;
  }
  if (sel_autocompleteFetchDidEndNetworkActivity_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self endedNetworkActivityHandler];
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self supplementalResultHandler];
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_willAdjustResults_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self adjustmentHandler];
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_willSortResults_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self willSortHandler];
    goto LABEL_20;
  }
  if (sel_resultComparatorForAutocompleteFetch_ == a3)
  {
    v4 = [(CNAutocompleteFetchBlockDelegate *)self comparatorHandler];
    goto LABEL_20;
  }
  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteFetchBlockDelegate;
  return -[CNAutocompleteFetchBlockDelegate respondsToSelector:](&v6, sel_respondsToSelector_);
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setResultHandler:(id)a3
{
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorHandler:(id)a3
{
}

- (id)finishHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFinishHandler:(id)a3
{
}

- (id)beganNetworkActivityHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBeganNetworkActivityHandler:(id)a3
{
}

- (id)endedNetworkActivityHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEndedNetworkActivityHandler:(id)a3
{
}

- (id)supplementalResultHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSupplementalResultHandler:(id)a3
{
}

- (id)adjustmentHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setAdjustmentHandler:(id)a3
{
}

- (id)willSortHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setWillSortHandler:(id)a3
{
}

- (id)comparatorHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setComparatorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparatorHandler, 0);
  objc_storeStrong(&self->_willSortHandler, 0);
  objc_storeStrong(&self->_adjustmentHandler, 0);
  objc_storeStrong(&self->_supplementalResultHandler, 0);
  objc_storeStrong(&self->_endedNetworkActivityHandler, 0);
  objc_storeStrong(&self->_beganNetworkActivityHandler, 0);
  objc_storeStrong(&self->_finishHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end