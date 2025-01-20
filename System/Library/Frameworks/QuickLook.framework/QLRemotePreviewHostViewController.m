@interface QLRemotePreviewHostViewController
- (NSExtension)extension;
- (QLRemoteItemViewController)remoteItemViewController;
- (id)request;
- (void)setExtension:(id)a3;
- (void)setRemoteItemViewController:(id)a3;
- (void)setRequest:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation QLRemotePreviewHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4 = a3;
  v5 = [(QLRemotePreviewHostViewController *)self remoteItemViewController];
  [v5 viewServiceDidTerminateWithError:v4];

  extension = self->_extension;
  id request = self->_request;

  [(NSExtension *)extension cancelExtensionRequestWithIdentifier:request];
}

- (QLRemoteItemViewController)remoteItemViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteItemViewController);

  return (QLRemoteItemViewController *)WeakRetained;
}

- (void)setRemoteItemViewController:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (id)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_destroyWeak((id *)&self->_remoteItemViewController);
}

@end