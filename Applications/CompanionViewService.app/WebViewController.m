@interface WebViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)didDismissSafari;
- (id)_url;
- (void)_presentWebsite;
- (void)cancel;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setDidDismissSafari:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WebViewController

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WebViewController;
  [(WebViewController *)&v5 viewDidAppear:a3];
  v4 = [(BaseViewController *)self viewServiceHost];
  [v4 setAllowsAlertStacking:1];

  [(WebViewController *)self _presentWebsite];
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_presentWebsite
{
  id v3 = objc_alloc((Class)SFSafariViewController);
  v4 = [(WebViewController *)self _url];
  id v5 = [v3 initWithURL:v4];

  [v5 setDelegate:self];
  [v5 setModalPresentationStyle:5];
  [(WebViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)cancel
{
  if (!self->_didDismissSafari) {
    [(WebViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)safariViewControllerDidFinish:(id)a3
{
  self->_didDismissSafari = 1;
  id v3 = [(BaseViewController *)self viewServiceHost];
  [v3 invalidate];
}

- (id)_url
{
  id v3 = [(BaseViewController *)self presentationContext];
  v4 = [v3 tvProviderRequest];

  if (v4)
  {
    id v5 = [(BaseViewController *)self presentationContext];
    v6 = [v5 tvProviderRequest];
    v7 = [v6 providerURL];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)didDismissSafari
{
  return self->_didDismissSafari;
}

- (void)setDidDismissSafari:(BOOL)a3
{
  self->_didDismissSafari = a3;
}

@end