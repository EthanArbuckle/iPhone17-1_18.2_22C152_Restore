@interface CNContactListActionExecutor
- (BOOL)showEditAuthorizationPaneForAction:(id)a3 withActionType:(int64_t)a4;
- (CNContactListActionAuthorizationContext)authorizationContext;
- (CNContactListActionExecutor)initWithUndoManager:(id)a3;
- (CNUIEditAuthorizationController)editAuthorizationController;
- (NSUndoManager)undoManager;
- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4;
- (void)executeAction:(id)a3;
- (void)executeUndoableAction:(id)a3;
- (void)setAuthorizationContext:(id)a3;
- (void)setEditAuthorizationController:(id)a3;
- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4 forAction:(id)a5;
- (void)undoAction:(id)a3;
@end

@implementation CNContactListActionExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);

  objc_storeStrong((id *)&self->_undoManager, 0);
}

- (void)setAuthorizationContext:(id)a3
{
}

- (CNContactListActionAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setEditAuthorizationController:(id)a3
{
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  [(CNContactListActionExecutor *)self setEditAuthorizationController:0];
  if (a4 != 2) {
    return;
  }
  v6 = [(CNContactListActionExecutor *)self authorizationContext];
  uint64_t v7 = [v6 type];

  if (v7 == 2)
  {
    v10 = [(CNContactListActionExecutor *)self authorizationContext];
    v11 = [v10 action];
    if ([v11 conformsToProtocol:&unk_1ED9550A0]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v8 = v12;

    if (v8) {
      [v8 performUndoAction];
    }
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    id v8 = [(CNContactListActionExecutor *)self authorizationContext];
    v9 = [v8 action];
    [v9 performAction];

LABEL_11:
  }

  [(CNContactListActionExecutor *)self setAuthorizationContext:0];
}

- (void)showEditAuthorizationPane:(id)a3 animated:(BOOL)a4 forAction:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(CNUIEditAuthorizationController);
  [(CNContactListActionExecutor *)self setEditAuthorizationController:v10];

  v11 = [(CNContactListActionExecutor *)self editAuthorizationController];
  [v11 setDelegate:self];

  v12 = [(CNContactListActionExecutor *)self editAuthorizationController];
  [v12 setSender:v9];

  v13 = [(CNContactListActionExecutor *)self editAuthorizationController];
  [v13 setAnimated:v5];

  v14 = [v8 delegate];

  v15 = [v14 presentingViewControllerForActions];
  v16 = [(CNContactListActionExecutor *)self editAuthorizationController];
  [v16 setGuardedViewController:v15];

  id v17 = [(CNContactListActionExecutor *)self editAuthorizationController];
  [v17 presentAuthorizationUI];
}

- (BOOL)showEditAuthorizationPaneForAction:(id)a3 withActionType:(int64_t)a4
{
  id v6 = a3;
  int v7 = [v6 editRequiresAuthorization];
  if (v7)
  {
    id v8 = objc_alloc_init(CNContactListActionAuthorizationContext);
    [(CNContactListActionExecutor *)self setAuthorizationContext:v8];

    id v9 = [(CNContactListActionExecutor *)self authorizationContext];
    [v9 setAction:v6];

    v10 = [(CNContactListActionExecutor *)self authorizationContext];
    [v10 setType:a4];

    [(CNContactListActionExecutor *)self showEditAuthorizationPane:self animated:1 forAction:v6];
  }

  return v7;
}

- (void)undoAction:(id)a3
{
  id v4 = a3;
  if (!-[CNContactListActionExecutor showEditAuthorizationPaneForAction:withActionType:](self, "showEditAuthorizationPaneForAction:withActionType:"))[v4 performUndoAction]; {
}
  }

- (void)executeUndoableAction:(id)a3
{
  id v5 = a3;
  id v4 = [(CNContactListActionExecutor *)self undoManager];
  [v4 registerUndoWithTarget:self selector:sel_undoAction_ object:v5];

  if (!-[CNContactListActionExecutor showEditAuthorizationPaneForAction:withActionType:](self, "showEditAuthorizationPaneForAction:withActionType:", v5, 1))[v5 performAction]; {
}
  }

- (void)executeAction:(id)a3
{
  id v4 = a3;
  if (!-[CNContactListActionExecutor showEditAuthorizationPaneForAction:withActionType:](self, "showEditAuthorizationPaneForAction:withActionType:"))[v4 performAction]; {
}
  }

- (CNContactListActionExecutor)initWithUndoManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactListActionExecutor;
  id v6 = [(CNContactListActionExecutor *)&v10 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_undoManager, a3);
    id v8 = v7;
  }

  return v7;
}

@end