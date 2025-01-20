@interface LNActionExecutorPassthroughDelegate
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (LNActionExecutorDelegate)delegate;
- (LNActionExecutorPassthroughDelegate)initWithShowOutputActionDelegate:(id)a3 performCompletionHandler:(id)a4;
- (id)completionHandler;
- (void)executor:(id)a3 continueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 environmentForViewSnippetWithCompletion:(id)a4;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
- (void)executor:(id)a3 preferredContentSizeForViewSnippetWithCompletion:(id)a4;
@end

@implementation LNActionExecutorPassthroughDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (LNActionExecutorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LNActionExecutorDelegate *)WeakRetained;
}

- (void)executor:(id)a3 continueInAppWithRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v9 executor:v10 needsContinueInAppWithRequest:v6];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [v6 respondWithError:v9];
  }
}

- (void)executor:(id)a3 preferredContentSizeForViewSnippetWithCompletion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  v7 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v9 executor:v10 preferredContentSizeForViewSnippetWithCompletion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)executor:(id)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  v7 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v9 executor:v10 environmentForViewSnippetWithCompletion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    char v11 = [v10 executor:v6 shouldRunShowOutputAction:v7];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v12 executor:v13 didCompleteExecutionWithResult:v8 error:v9];
  }
}

- (void)executor:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v12 executor:v13 didFinishWithResult:v8 error:v9];
  }
}

- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v12 executor:v14 didPerformActionWithResult:v8 error:v9];
  }
  id v13 = [(LNActionExecutorPassthroughDelegate *)self completionHandler];
  ((void (**)(void, id, id))v13)[2](v13, v8, v9);
}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  id v7 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v9 executor:v10 needsAppProtectionUnlockWithCompletionHandler:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(LNActionExecutorPassthroughDelegate *)self delegate];
    [v9 executor:v10 needsActionConfirmationWithRequest:v6];
  }
  else
  {
    [v6 respondWithConfirmation:1];
  }
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  [v8 executor:v7 needsValueWithRequest:v6];
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  [v8 executor:v7 needsDisambiguationWithRequest:v6];
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNActionExecutorPassthroughDelegate *)self delegate];
  [v8 executor:v7 needsConfirmationWithRequest:v6];
}

- (LNActionExecutorPassthroughDelegate)initWithShowOutputActionDelegate:(id)a3 performCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LNActionExecutorPassthroughDelegate;
  id v8 = [(LNActionExecutorPassthroughDelegate *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    id v10 = _Block_copy(v7);
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v10;

    v12 = v9;
  }

  return v9;
}

@end