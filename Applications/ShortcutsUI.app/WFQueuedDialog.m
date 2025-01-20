@interface WFQueuedDialog
- (BOOL)isFollowUp;
- (WFDialogRequest)request;
- (WFQueuedDialog)initWithRequest:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (WFWorkflowRunningContext)context;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setIsFollowUp:(BOOL)a3;
@end

@implementation WFQueuedDialog

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setIsFollowUp:(BOOL)a3
{
  self->_isFollowUp = a3;
}

- (BOOL)isFollowUp
{
  return self->_isFollowUp;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (WFDialogRequest)request
{
  return self->_request;
}

- (WFQueuedDialog)initWithRequest:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFQueuedDialog;
  v12 = [(WFQueuedDialog *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    id v14 = [v11 copy];
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    v13->_isFollowUp = 0;
    v16 = v13;
  }

  return v13;
}

@end