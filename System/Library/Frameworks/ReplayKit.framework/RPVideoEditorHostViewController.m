@interface RPVideoEditorHostViewController
- (RPPreviewViewController)previewViewController;
- (RPVideoEditorExtensionHostContext)hostContext;
- (void)extensionDidFinishWithActivityTypes:(id)a3;
- (void)setHostContext:(id)a3;
- (void)setPreviewViewController:(id)a3;
@end

@implementation RPVideoEditorHostViewController

- (void)extensionDidFinishWithActivityTypes:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPVideoEditorHostViewController:extensionsDidFinish", v6, 2u);
  }
  v5 = [(RPVideoEditorHostViewController *)self previewViewController];
  [v5 extensionDidFinishWithActivityTypes:v4];
}

- (RPPreviewViewController)previewViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewViewController);

  return (RPPreviewViewController *)WeakRetained;
}

- (void)setPreviewViewController:(id)a3
{
}

- (RPVideoEditorExtensionHostContext)hostContext
{
  return self->_hostContext;
}

- (void)setHostContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostContext, 0);

  objc_destroyWeak((id *)&self->_previewViewController);
}

@end