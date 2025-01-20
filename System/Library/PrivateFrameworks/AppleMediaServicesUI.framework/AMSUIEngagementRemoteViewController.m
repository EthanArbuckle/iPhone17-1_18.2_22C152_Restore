@interface AMSUIEngagementRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (AMSUIEngagementTaskHostInterface)delegate;
- (AMSUIEngagementTaskRemoteInterface)remoteProxy;
- (CGSize)preferredContentSizeOverride;
- (NSValue)internalPreferredContentSizeOverride;
- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5;
- (void)preferredContentSizeDidChange:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalPreferredContentSizeOverride:(id)a3;
- (void)setPreferredContentSizeOverride:(CGSize)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation AMSUIEngagementRemoteViewController

- (AMSUIEngagementTaskRemoteInterface)remoteProxy
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__AMSUIEngagementRemoteViewController_remoteProxy__block_invoke;
  v4[3] = &unk_2643E3570;
  v4[4] = self;
  v2 = [(_UIRemoteViewController *)self serviceViewControllerProxyWithErrorHandler:v4];
  return (AMSUIEngagementTaskRemoteInterface *)v2;
}

void __50__AMSUIEngagementRemoteViewController_remoteProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote proxy. Error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIEngagementRemoteViewController;
  [(_UIRemoteViewController *)&v8 viewServiceDidTerminateWithError:v4];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__AMSUIEngagementRemoteViewController_viewServiceDidTerminateWithError___block_invoke;
  v6[3] = &unk_2643E34D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AMSUIEngagementRemoteViewController *)self engagementTaskDidFinishWithResult:0 error:v5 completion:v6];
}

void __72__AMSUIEngagementRemoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v2)
  {
    id v2 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = AMSLogKey();
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_21C134000, v3, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] View service termination handled. Error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCEC9A8];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCADBA0];
}

- (void)engagementTaskDidFinishWithResult:(id)a3 error:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(AMSUIEngagementRemoteViewController *)self delegate];
  if (v10)
  {
    __int16 v11 = (void *)v10;
    uint64_t v12 = [(AMSUIEngagementRemoteViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(AMSUIEngagementRemoteViewController *)self delegate];
      [v14 engagementTaskDidFinishWithResult:v15 error:v8 completion:v9];
    }
  }
}

- (void)preferredContentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(AMSUIEngagementRemoteViewController *)self delegate];
  if (v6)
  {
    int v7 = (void *)v6;
    id v8 = [(AMSUIEngagementRemoteViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(AMSUIEngagementRemoteViewController *)self delegate];
      objc_msgSend(v10, "preferredContentSizeDidChange:", width, height);
    }
  }
}

- (AMSUIEngagementTaskHostInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIEngagementTaskHostInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)preferredContentSizeOverride
{
  double width = self->_preferredContentSizeOverride.width;
  double height = self->_preferredContentSizeOverride.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSizeOverride:(CGSize)a3
{
  self->_preferredContentSizeOverride = a3;
}

- (NSValue)internalPreferredContentSizeOverride
{
  return self->_internalPreferredContentSizeOverride;
}

- (void)setInternalPreferredContentSizeOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPreferredContentSizeOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end