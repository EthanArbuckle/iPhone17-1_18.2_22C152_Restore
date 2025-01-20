@interface SORemoteExtensionViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (SORemoteExtensionViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation SORemoteExtensionViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9BF538];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9C3FD0];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SORemoteExtensionViewController;
  [(_UIRemoteViewController *)&v11 viewServiceDidTerminateWithError:v4];
  if (v4)
  {
    v5 = [v4 domain];
    if ([v5 isEqualToString:*MEMORY[0x263F1D8B8]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 1) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    if (SO_LOG_SORemoteExtensionViewController_once != -1) {
      dispatch_once(&SO_LOG_SORemoteExtensionViewController_once, &__block_literal_global_10);
    }
    v7 = SO_LOG_SORemoteExtensionViewController_log;
    if (os_log_type_enabled((os_log_t)SO_LOG_SORemoteExtensionViewController_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_INFO, "viewServiceDidTerminateWithError: %{public}@", buf, 0xCu);
    }
    v8 = [(SORemoteExtensionViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(SORemoteExtensionViewController *)self delegate];
      [v10 viewServiceDidTerminateWithError:v4];
    }
  }
LABEL_12:
}

- (SORemoteExtensionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SORemoteExtensionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end