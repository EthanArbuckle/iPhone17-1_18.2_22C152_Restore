@interface _SFPasswordViewController
- (_SFPasswordViewController)init;
- (_SFPasswordViewControllerDelegate)delegate;
- (id)_connectToServiceWithCompletion:(id)a3;
- (id)_remoteViewController;
- (void)_addRemoteView;
- (void)_addRemoteViewAsChild;
- (void)_connectToService;
- (void)_dismissPasswordViewController;
- (void)serviceProxyWillQueueInvocation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _SFPasswordViewController

- (_SFPasswordViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFPasswordViewController;
  v2 = [(_SFPasswordViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_SFPasswordViewController *)v2 _setUpServiceProxyIfNeeded];
    [(_SFPasswordViewController *)v3 _connectToService];
    v4 = v3;
  }

  return v3;
}

- (void)_addRemoteViewAsChild
{
  [(_SFPasswordViewController *)self _addRemoteView];
  id v3 = [(_SFPasswordViewController *)self _remoteViewController];
  [(_SFPasswordViewController *)self addChildViewController:v3];
}

- (void)_addRemoteView
{
  id v3 = [(_SFPasswordViewController *)self _remoteViewController];
  if (v3)
  {
    v8 = v3;
    int v4 = [(_SFPasswordViewController *)self isViewLoaded];
    id v3 = v8;
    if (v4)
    {
      v5 = [v8 view];
      objc_super v6 = [(_SFPasswordViewController *)self view];
      [v6 addSubview:v5];

      v7 = [(_SFPasswordViewController *)self view];
      [v7 bounds];
      objc_msgSend(v5, "setFrame:");

      [v5 setAutoresizingMask:18];
      id v3 = v8;
    }
  }
}

- (id)_remoteViewController
{
  return 0;
}

- (id)_connectToServiceWithCompletion:(id)a3
{
  return 0;
}

- (void)_connectToService
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_cancelViewServiceRequest invoke];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46___SFPasswordViewController__connectToService__block_invoke;
  v6[3] = &unk_1E5C724D8;
  v6[4] = self;
  int v4 = [(_SFPasswordViewController *)self _connectToServiceWithCompletion:v6];
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;
}

- (void)_dismissPasswordViewController
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59___SFPasswordViewController__dismissPasswordViewController__block_invoke;
  v4[3] = &unk_1E5C724D8;
  v4[4] = self;
  id v3 = (void *)MEMORY[0x1AD0C36A0](v4, a2);
  [(_SFPasswordViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  if (!self->_cancelViewServiceRequest) {
    [(_SFPasswordViewController *)self _connectToService];
  }
}

- (_SFPasswordViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFPasswordViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
}

@end