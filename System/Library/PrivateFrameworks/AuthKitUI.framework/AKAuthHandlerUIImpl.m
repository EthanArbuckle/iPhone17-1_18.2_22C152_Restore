@interface AKAuthHandlerUIImpl
- (id)buildReauthenticationContextFromContext:(id)a3 error:(id *)a4;
@end

@implementation AKAuthHandlerUIImpl

- (id)buildReauthenticationContextFromContext:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 _updateWithValuesFromContext:v4];
  [v5 setIsUsernameEditable:0];
  [v5 setShouldSkipSettingsLaunchAlert:1];
  [v5 setNeedsNewChildAccount:0];
  [v5 setAuthenticationType:0];
  [v5 setShouldOfferSecurityUpgrade:0];
  [v5 setNeedsRepair:0];
  v6 = [v4 presentingViewController];
  v7 = [v6 presentedViewController];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 presentingViewController];
  }
  v10 = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v10 topViewController], v11 = objc_claimAutoreleasedReturnValue(),
                                                v11,
                                                v11))
  {
    v12 = [v10 topViewController];
    [v5 setPresentingViewController:v12];
  }
  else
  {
    [v5 setPresentingViewController:v10];
  }

  return v5;
}

@end