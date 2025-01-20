@interface _SFLinkRedirectionResolver
- (SFSafariViewController)safariViewController;
- (_SFLinkRedirectionResolver)initWithURL:(id)a3 completionHandler:(id)a4;
- (void)safariViewController:(id)a3 didResolveRedirectionWithURL:(id)a4 appLink:(id)a5;
@end

@implementation _SFLinkRedirectionResolver

- (_SFLinkRedirectionResolver)initWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFLinkRedirectionResolver;
  v8 = [(_SFLinkRedirectionResolver *)&v15 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1AD0C36A0](v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v9;

    v11 = [[SFLinkRedirectionViewController alloc] initWithURL:v6];
    redirectionViewController = v8->_redirectionViewController;
    v8->_redirectionViewController = v11;

    [(SFSafariViewController *)v8->_redirectionViewController setDelegate:v8];
    v13 = v8;
  }

  return v8;
}

- (SFSafariViewController)safariViewController
{
  return (SFSafariViewController *)self->_redirectionViewController;
}

- (void)safariViewController:(id)a3 didResolveRedirectionWithURL:(id)a4 appLink:(id)a5
{
  id completionHandler = (void (**)(id, id, id, void))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a4, a5, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectionViewController, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end