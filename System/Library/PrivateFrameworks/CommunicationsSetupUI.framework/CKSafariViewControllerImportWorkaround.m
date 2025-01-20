@interface CKSafariViewControllerImportWorkaround
- (CKSafariViewControllerImportWorkaroundDelegate)delegate;
- (id)_safariViewControllerWithURL:(id)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CKSafariViewControllerImportWorkaround

- (id)_safariViewControllerWithURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F16988];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setEntersReaderIfAvailable:0];
  v7 = (void *)[objc_alloc(MEMORY[0x263F16980]) initWithURL:v5 configuration:v6];

  [v7 setDelegate:self];
  [v7 setModalPresentationStyle:2];

  return v7;
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSafariViewControllerImportWorkaround *)self delegate];
  [v5 safariViewControllerDidFinish:v4];
}

- (CKSafariViewControllerImportWorkaroundDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CKSafariViewControllerImportWorkaroundDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end