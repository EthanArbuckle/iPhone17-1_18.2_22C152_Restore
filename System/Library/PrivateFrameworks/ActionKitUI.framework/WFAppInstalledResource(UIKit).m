@interface WFAppInstalledResource(UIKit)
- (id)recoveryCompletionHandler;
- (uint64_t)appSearchViewControllerDidCancel:()UIKit;
- (void)appSearchViewController:()UIKit didFinishWithApp:;
- (void)attemptRecoveryFromError:()UIKit optionIndex:userInterface:completionHandler:;
- (void)setRecoveryCompletionHandler:()UIKit;
@end

@implementation WFAppInstalledResource(UIKit)

- (void)appSearchViewController:()UIKit didFinishWithApp:
{
  id v6 = a3;
  v7 = [a4 correspondingApplicationRecord];
  v8 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithApplicationRecord:v7];
  [a1 updateDescriptorsWithSelectedApp:v8];
  [a1 notifyDelegateWithUpdatedDescriptor:v8];
  [a1 refreshAvailabilityWithNotification];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__WFAppInstalledResource_UIKit__appSearchViewController_didFinishWithApp___block_invoke;
  v9[3] = &unk_264900E20;
  v9[4] = a1;
  [v6 dismissViewControllerAnimated:1 completion:v9];
}

- (uint64_t)appSearchViewControllerDidCancel:()UIKit
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__WFAppInstalledResource_UIKit__appSearchViewControllerDidCancel___block_invoke;
  v4[3] = &unk_264900E20;
  v4[4] = a1;
  return [a3 dismissViewControllerAnimated:1 completion:v4];
}

- (void)attemptRecoveryFromError:()UIKit optionIndex:userInterface:completionHandler:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v9 code])
  {
    if ([v9 code] == 1)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x263F87738]) initWithAppSearchType:0];
      [v12 setDelegate:a1];
      [a1 setRecoveryCompletionHandler:v11];
      v13 = WFViewControllerFromUserInterface();
      [v13 presentViewController:v12 animated:1 completion:0];
    }
    else if (v11)
    {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __102__WFAppInstalledResource_UIKit__attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke;
    v14[3] = &unk_2648FFDE0;
    id v16 = v11;
    id v15 = v10;
    [a1 fetchiTunesStoreObjectForAppWithCompletionBlock:v14];
  }
}

- (void)setRecoveryCompletionHandler:()UIKit
{
  id v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, sel_recoveryCompletionHandler, v4, (void *)1);
}

- (id)recoveryCompletionHandler
{
  return objc_getAssociatedObject(a1, sel_recoveryCompletionHandler);
}

@end