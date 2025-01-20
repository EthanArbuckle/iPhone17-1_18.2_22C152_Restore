@interface CNPropertyStaticIdentityAction
- (CNContactContentViewControllerDelegate)contactDelegate;
- (void)dealloc;
- (void)performActionForItem:(id)a3 sender:(id)a4;
- (void)setContactDelegate:(id)a3;
@end

@implementation CNPropertyStaticIdentityAction

- (void).cxx_destruct
{
}

- (void)setContactDelegate:(id)a3
{
}

- (CNContactContentViewControllerDelegate)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return (CNContactContentViewControllerDelegate *)WeakRetained;
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyStaticIdentityAction;
  [(CNPropertyStaticIdentityAction *)&v3 dealloc];
}

@end