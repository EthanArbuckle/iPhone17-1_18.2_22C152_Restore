@interface FTRegUtilities
+ (id)serviceWithType:(int64_t)a3;
+ (id)standaloneAuthorizationControllerWithRegController:(id)a3 authID:(id)a4 token:(id)a5;
+ (id)standaloneNewPasswordControllerWithRegController:(id)a3 appleID:(id)a4;
+ (void)authorizationController:(id)a3 authorizedAccount:(BOOL)a4;
+ (void)changePasswordControllerDidCancel:(id)a3;
+ (void)changePasswordControllerDidFinish:(id)a3 withAppleID:(id)a4 authID:(id)a5 authToken:(id)a6;
@end

@implementation FTRegUtilities

+ (id)serviceWithType:(int64_t)a3
{
  v3 = FTCServiceNameForServiceType();
  v4 = [MEMORY[0x263F4A610] serviceWithInternalName:v3];

  return v4;
}

+ (id)standaloneAuthorizationControllerWithRegController:(id)a3 authID:(id)a4 token:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[CNFRegAccountAuthorizationController alloc] initWithRegController:v10 authID:v9 token:v8];

  [(CNFRegAccountAuthorizationController *)v11 setDelegate:a1];
  v12 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v11];
  v13 = +[CNFRegAppearanceController globalAppearanceController];
  objc_msgSend(v12, "setModalPresentationStyle:", objc_msgSend(v13, "modalPresentationStyle"));
  uint64_t v14 = [v13 navigationBarStyle];
  v15 = [v12 navigationBar];
  [v15 setBarStyle:v14];

  uint64_t v16 = [v13 navigationBarIsTranslucent];
  v17 = [v12 navigationBar];
  [v17 setTranslucent:v16];

  return v12;
}

+ (id)standaloneNewPasswordControllerWithRegController:(id)a3 appleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CNFRegChangeAccountPasswordController alloc] initWithRegController:v7 appleID:v6];

  [(CNFRegChangeAccountPasswordController *)v8 setDelegate:a1];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
  id v10 = +[CNFRegAppearanceController globalAppearanceController];
  objc_msgSend(v9, "setModalPresentationStyle:", objc_msgSend(v10, "modalPresentationStyle"));
  uint64_t v11 = [v10 navigationBarStyle];
  v12 = [v9 navigationBar];
  [v12 setBarStyle:v11];

  uint64_t v13 = [v10 navigationBarIsTranslucent];
  uint64_t v14 = [v9 navigationBar];
  [v14 setTranslucent:v13];

  return v9;
}

+ (void)changePasswordControllerDidCancel:(id)a3
{
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

+ (void)changePasswordControllerDidFinish:(id)a3 withAppleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 length] && objc_msgSend(v12, "length"))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v9;
    uint64_t v13 = [v9 regController];
    uint64_t v14 = [v13 appleIDAccounts];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v20 = [v19 loginDisplayString];
          int v21 = [v20 isEqualToString:v10];

          if (v21) {
            [v19 updateAuthorizationCredentials:v11 token:v12];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    id v9 = v23;
  }
  v22 = [v9 presentingViewController];
  [v22 dismissViewControllerAnimated:1 completion:0];
}

+ (void)authorizationController:(id)a3 authorizedAccount:(BOOL)a4
{
  id v4 = [a3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

@end