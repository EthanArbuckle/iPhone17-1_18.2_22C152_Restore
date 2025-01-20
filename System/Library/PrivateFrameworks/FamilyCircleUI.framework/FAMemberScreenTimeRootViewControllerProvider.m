@interface FAMemberScreenTimeRootViewControllerProvider
+ (void)requestRootViewControllerForDSID:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
@end

@implementation FAMemberScreenTimeRootViewControllerProvider

+ (void)requestRootViewControllerForDSID:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v10 = (void *)getSTRootViewControllerProviderClass_softClass;
  uint64_t v16 = getSTRootViewControllerProviderClass_softClass;
  if (!getSTRootViewControllerProviderClass_softClass)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getSTRootViewControllerProviderClass_block_invoke;
    v12[3] = &unk_264348998;
    v12[4] = &v13;
    __getSTRootViewControllerProviderClass_block_invoke((uint64_t)v12);
    v10 = (void *)v14[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v13, 8);
  [v11 requestRootViewControllerForDSID:v7 presentingViewController:v8 completionHandler:v9];
}

@end