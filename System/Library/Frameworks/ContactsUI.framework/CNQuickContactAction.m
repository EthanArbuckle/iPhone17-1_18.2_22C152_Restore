@interface CNQuickContactAction
- (CNContactAction)contactAction;
- (CNQuickContactAction)initWithContactAction:(id)a3;
- (CNQuickContactActionDelegate)delegate;
- (id)completionBlock;
- (id)contactViewCache;
- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5;
- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5;
- (void)actionDidFinish:(id)a3;
- (void)actionDidUpdate:(id)a3;
- (void)actionWasCanceled:(id)a3;
- (void)performWithCompletionBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContactAction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNQuickContactAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contactAction, 0);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setDelegate:(id)a3
{
}

- (CNQuickContactActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNQuickContactActionDelegate *)WeakRetained;
}

- (void)setContactAction:(id)a3
{
}

- (CNContactAction)contactAction
{
  return self->_contactAction;
}

- (id)contactViewCache
{
  return 0;
}

- (void)actionWasCanceled:(id)a3
{
  v4 = [(CNQuickContactAction *)self completionBlock];

  if (v4)
  {
    v5 = [(CNQuickContactAction *)self completionBlock];
    v5[2]();
  }
  id v6 = [(CNQuickAction *)self previousStyle];
  +[CNContactStyle setCurrentStyle:v6];
}

- (void)actionDidFinish:(id)a3
{
  v4 = [(CNQuickContactAction *)self completionBlock];

  if (v4)
  {
    v5 = [(CNQuickContactAction *)self completionBlock];
    v5[2]();
  }
  id v6 = [(CNQuickAction *)self manager];
  [v6 actionPerformed:self];

  id v7 = [(CNQuickAction *)self previousStyle];
  +[CNContactStyle setCurrentStyle:v7];
}

- (void)action:(id)a3 dismissViewController:(id)a4 sender:(id)a5
{
}

- (void)action:(id)a3 presentViewController:(id)a4 sender:(id)a5
{
  id v9 = a4;
  id v6 = [(CNQuickContactAction *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    [v9 setModalPresentationStyle:5];
    v8 = [(CNQuickContactAction *)self delegate];
    [v8 contactAction:self presentViewController:v9];
  }
}

- (void)actionDidUpdate:(id)a3
{
  v4 = [(CNQuickContactAction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNQuickContactAction *)self delegate];
    [v6 contactActionDidUpdate:self];
  }
}

- (void)performWithCompletionBlock:(id)a3
{
  id v4 = a3;
  char v5 = +[CNContactStyle currentStyle];
  [(CNQuickAction *)self setPreviousStyle:v5];

  id v6 = +[CNContactStyle defaultStyle];
  +[CNContactStyle setCurrentStyle:v6];

  [(CNQuickContactAction *)self setCompletionBlock:v4];
  id v7 = [(CNQuickContactAction *)self contactAction];
  [v7 performActionWithSender:self];
}

- (CNQuickContactAction)initWithContactAction:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNQuickContactAction;
  id v3 = a3;
  id v4 = [(CNQuickAction *)&v6 init];
  objc_msgSend(v3, "setDelegate:", v4, v6.receiver, v6.super_class);
  [(CNQuickContactAction *)v4 setContactAction:v3];

  return v4;
}

@end