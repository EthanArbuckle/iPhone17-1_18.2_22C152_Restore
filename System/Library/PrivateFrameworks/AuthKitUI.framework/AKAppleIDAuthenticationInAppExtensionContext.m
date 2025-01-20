@interface AKAppleIDAuthenticationInAppExtensionContext
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
@end

@implementation AKAppleIDAuthenticationInAppExtensionContext

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9
    && ([v9 userInfo],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKeyedSubscript:@"statusCode"],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqual:&unk_1F1F03768],
        v12,
        v11,
        v13))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __101__AKAppleIDAuthenticationInAppExtensionContext_remoteUIController_didFinishLoadWithError_forRequest___block_invoke;
    block[3] = &unk_1E648F2C8;
    block[4] = self;
    id v16 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AKAppleIDAuthenticationInAppExtensionContext;
    [(AKAppleIDAuthenticationInAppContext *)&v14 remoteUIController:v8 didFinishLoadWithError:v9 forRequest:v10];
  }
}

uint64_t __101__AKAppleIDAuthenticationInAppExtensionContext_remoteUIController_didFinishLoadWithError_forRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeWithError:*(void *)(a1 + 40)];
}

@end