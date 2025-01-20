@interface _XPCInternalRequestToken
- (AMSProcessInfo)processInfo;
- (ASDSupportedDialogHandlers)supportedDialogHandlers;
- (BOOL)isInternal;
- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4;
- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4;
- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4;
@end

@implementation _XPCInternalRequestToken

- (BOOL)isInternal
{
  return 1;
}

- (void)deliverAlertPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithDescription();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)deliverAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = [v15 options];
  v8 = [v7 proxyAppBundleID];
  if (!v8)
  {
    v8 = [v7 proxyAppName];
    if (!v8)
    {
      v9 = [(_XPCInternalRequestToken *)self processInfo];

      if (!v9) {
        goto LABEL_6;
      }
      v8 = [(_XPCInternalRequestToken *)self processInfo];
      v10 = [v8 bundleIdentifier];
      sub_1002EB0FC(v15, v10);
    }
  }

LABEL_6:
  id v11 = objc_alloc((Class)AMSAuthenticateTask);
  v12 = sub_10030B11C();
  id v13 = [v11 initWithRequest:v15 bag:v12];

  v14 = [v13 performAuthentication];
  [v14 addFinishBlock:v6];
}

- (void)deliverDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v6];

  v7 = [v8 present];
  [v7 addFinishBlock:v5];
}

- (void)deliverEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithDescription();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)deliverViewPresentationRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithDescription();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (AMSProcessInfo)processInfo
{
  return (AMSProcessInfo *)sub_1000169A4();
}

- (ASDSupportedDialogHandlers)supportedDialogHandlers
{
  id v2 = [objc_alloc((Class)ASDSupportedDialogHandlers) initForInternalClient];
  return (ASDSupportedDialogHandlers *)v2;
}

@end