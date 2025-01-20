@interface CNContactViewServiceErrorViewController
- (CNContactViewControllerPPTDelegate)pptDelegate;
- (CNContactViewHostProtocol)delegate;
- (void)setDelegate:(id)a3;
- (void)setPptDelegate:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
@end

@implementation CNContactViewServiceErrorViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);

  objc_destroyWeak((id *)&self->pptDelegate);
}

- (void)setDelegate:(id)a3
{
}

- (CNContactViewHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (CNContactViewHostProtocol *)WeakRetained;
}

- (void)setPptDelegate:(id)a3
{
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pptDelegate);

  return (CNContactViewControllerPPTDelegate *)WeakRetained;
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
}

@end