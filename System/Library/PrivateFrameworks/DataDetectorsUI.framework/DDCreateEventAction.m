@interface DDCreateEventAction
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)prepareViewControllerForActionController:(id)a3;
@end

@implementation DDCreateEventAction

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  objc_msgSend(a3, "setEditViewDelegate:", 0, a4);
  v5 = [(DDAddEventAction *)self viewController];
  [v5 setAction:0];

  [(DDAddEventAction *)self setViewController:0];
  uint64_t v6 = [(DDAction *)self delegate];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(DDAction *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(DDAction *)self delegate];
      [v10 actionDidFinish:self];
    }
  }
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3 = +[DDRemoteActionViewController prepareViewController:@"DDEventEditViewController" forAction:self actionController:a3];
}

@end