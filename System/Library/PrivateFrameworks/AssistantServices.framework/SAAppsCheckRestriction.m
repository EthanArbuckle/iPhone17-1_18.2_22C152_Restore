@interface SAAppsCheckRestriction
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsCheckRestriction

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void, void *))a4;
  id v8 = objc_alloc_init((Class)SACommandFailed);
  v9 = [(SAAppsCheckRestriction *)self launchId];
  if (!v9)
  {
    v13 = 0;
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v10 = [off_1005814E8() serviceWithDefaultShellEndpoint];
  v11 = v10;
  if (v10)
  {
    uint64_t v15 = 0;
    if ([v10 canOpenApplication:v9 reason:&v15])
    {
      id v12 = objc_alloc_init((Class)SACommandSucceeded);

      id v8 = v12;
    }
    v13 = 0;
  }
  else
  {
    v13 = +[AFError errorWithCode:13];
  }

  if (v7)
  {
LABEL_10:
    v14 = [v6 createResponseWithReplyCommand:v8];
    v7[2](v7, v14, 0, v13);
  }
LABEL_11:
}

@end