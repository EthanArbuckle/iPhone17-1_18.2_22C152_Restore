@interface BLSetAutomaticDownloadKindsOperation
- (ACAccount)account;
- (BLPurchaseUIHelper)uiHelper;
- (BLSetAutomaticDownloadKindsOperation)initWithEnabledMediaKinds:(id)a3 account:(id)a4;
- (BLUIHostServiceProtocol)uiHostProxy;
- (NSMutableSet)enabledMediaKinds;
- (NSSet)resultingEnabledMediaKinds;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)run;
- (void)setAccount:(id)a3;
- (void)setEnabledMediaKinds:(id)a3;
- (void)setResultingEnabledMediaKinds:(id)a3;
- (void)setUiHelper:(id)a3;
- (void)setUiHostProxy:(id)a3;
@end

@implementation BLSetAutomaticDownloadKindsOperation

- (BLSetAutomaticDownloadKindsOperation)initWithEnabledMediaKinds:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSetAutomaticDownloadKindsOperation;
  v9 = [(BLOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enabledMediaKinds, a3);
    objc_storeStrong((id *)&v10->_account, a4);
  }

  return v10;
}

- (void)run
{
  v3 = +[BUBag defaultBag];
  id v4 = objc_alloc((Class)AMSAutomaticDownloadKindsSetTask);
  v5 = [(BLSetAutomaticDownloadKindsOperation *)self enabledMediaKinds];
  v6 = [v5 allObjects];
  id v7 = [(BLSetAutomaticDownloadKindsOperation *)self account];
  id v8 = [v4 initWithEnabledMediaKinds:v6 account:v7 bag:v3 presentationDelegate:self];

  v9 = [v8 perform];
  id v15 = 0;
  v10 = [v9 resultWithError:&v15];
  id v11 = v15;

  if (v11)
  {
    [(BLOperation *)self setError:v11];
  }
  else
  {
    [(BLOperation *)self setSuccess:1];
    id v12 = objc_alloc((Class)NSSet);
    v13 = [v10 enabledMediaKinds];
    id v14 = [v12 initWithArray:v13];
    [(BLSetAutomaticDownloadKindsOperation *)self setResultingEnabledMediaKinds:v14];
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];
  [v10 handleDialogRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];
  [v10 handleEngagementRequest:v9 completion:v8];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];
  [v10 handleAuthenticateRequest:v9 completion:v8];
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];
  [v8 handleAuthenticateRequest:v7 completion:v6];
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];
  [v8 handleDialogRequest:v7 completion:v6];
}

- (void)setUiHostProxy:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_uiHostProxy, a3);
  v5 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];

  if (!v5)
  {
    id v6 = objc_alloc_init(BLPurchaseUIHelper);
    [(BLSetAutomaticDownloadKindsOperation *)self setUiHelper:v6];
  }
  id v7 = [(BLSetAutomaticDownloadKindsOperation *)self uiHelper];
  [v7 setUiHostProxy:v8];
}

- (BLUIHostServiceProtocol)uiHostProxy
{
  return self->_uiHostProxy;
}

- (NSSet)resultingEnabledMediaKinds
{
  return self->_resultingEnabledMediaKinds;
}

- (void)setResultingEnabledMediaKinds:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSMutableSet)enabledMediaKinds
{
  return self->_enabledMediaKinds;
}

- (void)setEnabledMediaKinds:(id)a3
{
}

- (BLPurchaseUIHelper)uiHelper
{
  return self->_uiHelper;
}

- (void)setUiHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiHelper, 0);
  objc_storeStrong((id *)&self->_enabledMediaKinds, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_resultingEnabledMediaKinds, 0);

  objc_storeStrong((id *)&self->_uiHostProxy, 0);
}

@end