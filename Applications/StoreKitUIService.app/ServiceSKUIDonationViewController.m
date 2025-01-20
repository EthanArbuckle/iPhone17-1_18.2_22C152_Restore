@interface ServiceSKUIDonationViewController
- (ServiceAccountPageEmbeddedParent)embeddedParent;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setEmbeddedParent:(id)a3;
@end

@implementation ServiceSKUIDonationViewController

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ServiceSKUIDonationViewController *)self embeddedParent];
  [v5 dismissHostViewController];

  v6.receiver = self;
  v6.super_class = (Class)ServiceSKUIDonationViewController;
  [(ServiceSKUIDonationViewController *)&v6 dismissAnimated:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(ServiceSKUIDonationViewController *)self embeddedParent];
  [v7 dismissHostViewController];

  v8.receiver = self;
  v8.super_class = (Class)ServiceSKUIDonationViewController;
  [(ServiceSKUIDonationViewController *)&v8 dismissViewControllerAnimated:v4 completion:v6];
}

- (ServiceAccountPageEmbeddedParent)embeddedParent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedParent);

  return (ServiceAccountPageEmbeddedParent *)WeakRetained;
}

- (void)setEmbeddedParent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end