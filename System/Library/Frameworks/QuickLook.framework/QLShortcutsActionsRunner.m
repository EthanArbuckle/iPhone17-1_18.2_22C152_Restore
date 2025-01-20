@interface QLShortcutsActionsRunner
- (void)runAction:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation QLShortcutsActionsRunner

- (void)runAction:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = _Block_copy(a5);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v10;

  id v12 = (id)[objc_alloc(MEMORY[0x263F85230]) initWithContextualAction:v9 actionContext:v8];
  [v12 setDelegate:self];
  [v12 start];
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
}

- (void).cxx_destruct
{
}

@end