@interface DDRemoteActionViewControllerProvider
- (DDRemoteActionContext)actionContext;
- (DDRemoteActionViewControllerProvider)initWithContext:(id)a3;
- (void)createViewControllerWithCompletionHandler:(id)a3;
@end

@implementation DDRemoteActionViewControllerProvider

- (DDRemoteActionViewControllerProvider)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DDRemoteActionViewControllerProvider;
  v6 = [(DDRemoteActionViewControllerProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"DDRemoteAction.m" lineNumber:532 description:@"This method should never be called in the class DDRemoteActionViewControllerProvider. This method should be overriden."];
}

- (DDRemoteActionContext)actionContext
{
  return (DDRemoteActionContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end