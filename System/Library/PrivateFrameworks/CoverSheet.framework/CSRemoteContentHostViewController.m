@interface CSRemoteContentHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (CGRect)_customContentBounds;
- (CGRect)contentFrame;
- (CSRemoteContentHostDelegate)delegate;
- (SBSRemoteContentDefinition)definition;
- (SBSRemoteContentPreferences)contentPreferences;
- (void)_fetchContentPreferences;
- (void)_fetchInlinePresentationContentFrame;
- (void)_updateContentFrame:(CGRect)a3;
- (void)_updateContentPreferences:(id)a3;
- (void)configureWithDefinition:(id)a3;
- (void)didDismissForDismissType:(int64_t)a3;
- (void)getContentBoundsWithReplyBlock:(id)a3;
- (void)hostDidChangeContentBounds;
- (void)presentAlert:(id)a3 replyBlock:(id)a4;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentPreferences:(id)a3;
- (void)setDefinition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation CSRemoteContentHostViewController

- (void)configureWithDefinition:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_definition = &self->_definition;
  objc_storeStrong((id *)&self->_definition, a3);
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_contentFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_contentFrame.size = v7;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  [(CSRemoteContentHostViewController *)self _customContentBounds];
  BSSerializeCGRectToXPCDictionaryWithKey();
  v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  v10 = [(SBSRemoteContentDefinition *)self->_definition userInfo];
  v11 = [(SBSRemoteContentDefinition *)self->_definition xpcEndpoint];
  [v9 configureWithUserInfo:v10 contentBounds:v8 endpoint:v11];

  v12 = SBLogDashBoard();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(SBSRemoteContentDefinition *)*p_definition userInfo];
    v14 = [(SBSRemoteContentDefinition *)*p_definition xpcEndpoint];
    int v15 = 138412546;
    v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[RemoteContent] CSRemoteContentHostViewController configuring with user info: %@, endpoint: %@", (uint8_t *)&v15, 0x16u);
  }
  [(CSRemoteContentHostViewController *)self _fetchContentPreferences];
}

- (SBSRemoteContentPreferences)contentPreferences
{
  return self->_contentPreferences;
}

- (void)didDismissForDismissType:(int64_t)a3
{
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 didDismissForDismissType:a3];
}

- (void)hostDidChangeContentBounds
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v2 didChangeContentBounds];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSRemoteContentHostViewController *)self view];
  [v4 setHidden:v3];
}

- (void)getContentBoundsWithReplyBlock:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, id))a3;
    id v5 = xpc_dictionary_create(0, 0, 0);
    [(CSRemoteContentHostViewController *)self _customContentBounds];
    BSSerializeCGRectToXPCDictionaryWithKey();
    v4[2](v4, v5);
  }
}

- (void)presentAlert:(id)a3 replyBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  CGSize v7 = (void *)MEMORY[0x1E4F42728];
  xpc_object_t v8 = [v5 title];
  v9 = [v5 message];
  v10 = objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, objc_msgSend(v5, "preferredStyle"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v22 = v5;
  id obj = [v5 actions];
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E4F42720];
        __int16 v17 = [v15 title];
        uint64_t v18 = [v15 style];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __61__CSRemoteContentHostViewController_presentAlert_replyBlock___block_invoke;
        v24[3] = &unk_1E6ADAD28;
        id v19 = v6;
        v24[4] = v15;
        id v25 = v19;
        v20 = [v16 actionWithTitle:v17 style:v18 handler:v24];
        [v10 addAction:v20];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  [(CSRemoteContentHostViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __61__CSRemoteContentHostViewController_presentAlert_replyBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogDashBoard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[RemoteContent] CSRemoteContentHostViewController client process terminated: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CGSize v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained remoteContentHostViewController:self didTerminateWithError:v4];
  }
  else
  {
    xpc_object_t v8 = SBLogDashBoard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[RemoteContent] unhandled termination for nil delegate", (uint8_t *)&v9, 2u);
    }
  }
}

+ (id)serviceViewControllerInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F30DFDC0];
  [v2 setXPCType:MEMORY[0x1E4F14590] forSelector:sel_getInlinePresentationContentFrameWithReplyBlock_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F30C60C0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_fetchContentPreferences
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__CSRemoteContentHostViewController__fetchContentPreferences__block_invoke;
  v5[3] = &unk_1E6ADAD50;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  BOOL v3 = (void *)MEMORY[0x1D9487300](v5);
  id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v4 getContentPreferencesWithReplyBlock:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__CSRemoteContentHostViewController__fetchContentPreferences__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained _updateContentPreferences:v3];
  }
  else
  {
    id v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Ignoring nil remote preferences", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_updateContentPreferences:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_contentPreferences, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didChangeRemotePreferences:v6];
  if ([WeakRetained prefersInlineForPreferences:v6]) {
    [(CSRemoteContentHostViewController *)self _fetchInlinePresentationContentFrame];
  }
}

- (CGRect)_customContentBounds
{
  uint64_t v3 = [(CSRemoteContentHostViewController *)self interfaceOrientation];
  +[CSContentCutoutBoundsCalculator modalContentCutoutBoundsForInterfaceOrientation:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ((unint64_t)(v3 - 1) <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteContentComplicationHeightInset];
    double v14 = v13;

    double v7 = v7 + v14;
    double v11 = v11 - v14;
  }
  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_fetchInlinePresentationContentFrame
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__CSRemoteContentHostViewController__fetchInlinePresentationContentFrame__block_invoke;
  v4[3] = &unk_1E6ADAD78;
  objc_copyWeak(&v5, &location);
  [v3 getInlinePresentationContentFrameWithReplyBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__CSRemoteContentHostViewController__fetchInlinePresentationContentFrame__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BSDeserializeCGRectFromXPCDictionaryWithKey();
    objc_msgSend(WeakRetained, "_updateContentFrame:");
  }
}

- (void)_updateContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_contentFrame = &self->_contentFrame;
  if (!CGRectEqualToRect(self->_contentFrame, a3))
  {
    p_contentFrame->origin.double x = x;
    p_contentFrame->origin.double y = y;
    p_contentFrame->size.double width = width;
    p_contentFrame->size.double height = height;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didChangeRemoteHostContentFrame:", x, y, width, height);
  }
}

- (CSRemoteContentHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSRemoteContentHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContentPreferences:(id)a3
{
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (SBSRemoteContentDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_contentPreferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end