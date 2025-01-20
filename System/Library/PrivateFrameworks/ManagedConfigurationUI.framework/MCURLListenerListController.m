@interface MCURLListenerListController
+ (id)originalURLSender;
+ (void)setOriginalURLSender:(id)a3;
- (void)_presentNextController:(id)a3 withCompletion:(id)a4;
- (void)_pushProfileDetailsForProfileWithID:(id)a3 withCompletion:(id)a4;
- (void)_showSheetToInstallConfigurationProfileFromInstallationQueueWithCompletion:(id)a3;
- (void)_showSheetToInstallConfigurationProfileFromPurgatoryWithCompletion:(id)a3;
- (void)_showSheetToInstallConfigurationProfileWithData:(id)a3 withCompletion:(id)a4;
- (void)handleURL:(id)a3;
@end

@implementation MCURLListenerListController

+ (id)originalURLSender
{
  return (id)sOriginalURLSender;
}

+ (void)setOriginalURLSender:(id)a3
{
  sOriginalURLSender = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)_showSheetToInstallConfigurationProfileFromPurgatoryWithCompletion:(id)a3
{
  id v6 = a3;
  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  v5 = objc_msgSend(v4, "peekProfileDataFromPurgatoryForDeviceType:", objc_msgSend(MEMORY[0x1E4F74220], "thisDeviceType"));

  if (v5) {
    [(MCURLListenerListController *)self _showSheetToInstallConfigurationProfileWithData:v5 withCompletion:v6];
  }
}

- (void)_showSheetToInstallConfigurationProfileFromInstallationQueueWithCompletion:(id)a3
{
  id v6 = a3;
  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  v5 = [v4 popProfileDataFromHeadOfInstallationQueue];

  if (v5) {
    [(MCURLListenerListController *)self _showSheetToInstallConfigurationProfileWithData:v5 withCompletion:v6];
  }
}

- (void)_showSheetToInstallConfigurationProfileWithData:(id)a3 withCompletion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = [[MCInstallProfileViewController alloc] initWithInstallableProfileData:v6 fromSource:2];

  v8 = [[MCUINavigationViewController alloc] initWithRootViewController:v7];
  if (MCUIIsiPad()) {
    [(MCUINavigationViewController *)v8 setModalPresentationStyle:2];
  }
  [(MCURLListenerListController *)self _presentNextController:v8 withCompletion:v9];
}

- (void)_presentNextController:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__MCURLListenerListController__presentNextController_withCompletion___block_invoke;
  v10[3] = &unk_1E6EAD968;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __69__MCURLListenerListController__presentNextController_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_pushProfileDetailsForProfileWithID:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    id v8 = [(MCURLListenerListController *)self specifier];
    id v9 = [v8 name];
    int v10 = [v9 isEqualToString:v6];

    if (!v10)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = [(MCURLListenerListController *)self specifiers];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(char **)(*((void *)&v25 + 1) + 8 * i);
            v17 = [v16 name];
            int v18 = [v17 isEqualToString:v6];

            if (v18)
            {
              uint64_t v19 = *(void *)&v16[*MEMORY[0x1E4F92F30]];
              if (v19 == objc_opt_class())
              {
                v22 = [MEMORY[0x1E4F74230] sharedConnection];
                v20 = [v22 installedProfileWithIdentifier:v6];

                v23 = [[MCRemoveProfileViewController alloc] initWithProfile:v20];
                v24 = [(MCURLListenerListController *)self navigationController];
                [v24 pushViewController:v23 animated:1];
              }
              else
              {
                v20 = CreateDetailControllerInstanceWithClass();
                v21 = [(MCURLListenerListController *)self rootController];
                [v20 setRootController:v21];

                [v20 setParentController:self];
                [v20 setSpecifier:v16];
                [(MCURLListenerListController *)self showController:v20 animate:0];
              }

              goto LABEL_16;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      NSLog(&cfstr_ErrorCouldNotF.isa, v6);
    }
  }
LABEL_16:
  if (v7) {
    v7[2](v7);
  }
}

- (void)handleURL:(id)a3
{
  id v7 = a3;
  v4 = [v7 objectForKey:@"sender"];
  v5 = [v7 objectForKey:@"path"];
  [(id)objc_opt_class() setOriginalURLSender:v4];
  NSLog(&cfstr_Mcurllistenerl.isa, v5, v4);
  if ([v5 isEqualToString:*MEMORY[0x1E4F742A0]])
  {
    [(MCURLListenerListController *)self _showSheetToInstallConfigurationProfileFromInstallationQueueWithCompletion:0];
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F74298]])
  {
    [(MCURLListenerListController *)self _showSheetToInstallConfigurationProfileFromPurgatoryWithCompletion:0];
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F74290]])
  {
    id v6 = [v7 objectForKey:@"profileID"];
    [(MCURLListenerListController *)self _pushProfileDetailsForProfileWithID:v6 withCompletion:0];
  }
  else
  {
    NSLog(&cfstr_Mcurllistenerl_0.isa, v5, v4);
  }
}

@end