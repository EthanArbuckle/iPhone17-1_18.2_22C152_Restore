@interface ASORemoteViewController
- (ASORemoteViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation ASORemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASORemoteViewController;
  [(_UIRemoteViewController *)&v11 viewServiceDidTerminateWithError:v4];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v4 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "View service did terminate with error: %@", buf, 0xCu);
  }
  uint64_t v6 = [(ASORemoteViewController *)self delegate];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(ASORemoteViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(ASORemoteViewController *)self delegate];
      [v10 viewServiceDidTerminateWithError:v4];
    }
  }
}

- (ASORemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASORemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end