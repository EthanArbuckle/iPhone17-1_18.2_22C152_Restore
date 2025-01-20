@interface AMSUIPurchaseQueue
- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5;
- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5;
- (void)purchase:(id)a3 handleSceneBundleIdentifierRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleWindowRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIPurchaseQueue

- (void)purchase:(id)a3 handleSceneBundleIdentifierRequest:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(AMSPurchaseQueue *)self config];
  v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AMSPurchaseQueue *)self config];
    v14 = [v13 delegate];
    [v14 purchase:v15 handleSceneBundleIdentifierRequest:v8 purchaseQueue:self completion:v9];

    id v9 = v14;
  }
  else
  {
    v13 = AMSError();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (void)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(AMSPurchaseQueue *)self config];
  v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AMSPurchaseQueue *)self config];
    v14 = [v13 delegate];
    [v14 purchase:v15 handleSceneIdentifierRequest:v8 purchaseQueue:self completion:v9];

    id v9 = v14;
  }
  else
  {
    v13 = AMSError();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(AMSPurchaseQueue *)self config];
  v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AMSPurchaseQueue *)self config];
    v14 = [v13 delegate];
    id v15 = [v14 purchase:v8 handleSceneIdentifierRequest:v9 purchaseQueue:self error:a5];
  }
  else if (a5)
  {
    AMSError();
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)purchase:(id)a3 handleWindowRequest:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(AMSPurchaseQueue *)self config];
  v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AMSPurchaseQueue *)self config];
    v14 = [v13 delegate];
    [v14 purchase:v15 handleWindowRequest:v8 purchaseQueue:self completion:v9];

    id v9 = v14;
  }
  else
  {
    v13 = AMSError();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(AMSPurchaseQueue *)self config];
  v11 = [v10 delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(AMSPurchaseQueue *)self config];
    v14 = [v13 delegate];
    id v15 = [v14 purchase:v8 handleWindowRequest:v9 purchaseQueue:self error:a5];
  }
  else if (a5)
  {
    AMSError();
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

@end