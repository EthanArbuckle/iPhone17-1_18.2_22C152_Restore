@interface SLAssistantCommit
- (void)_cleanupHandler;
- (void)_finishWithCompletion:(id)a3 result:(id)a4;
- (void)dealloc;
- (void)performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation SLAssistantCommit

- (void)_cleanupHandler
{
  if (self->_handlerDelegate)
  {
    if (self->_handlerObject)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SLAssistantServiceHandler *)self->_handlerObject setDelegate:0];
      }
    }

    self->_handlerDelegate = 0;
  }

  self->_handlerObject = 0;
}

- (void)dealloc
{
  [(SLAssistantCommit *)self _cleanupHandler];
  v3.receiver = self;
  v3.super_class = (Class)SLAssistantCommit;
  [(SLAssistantCommit *)&v3 dealloc];
}

- (void)_finishWithCompletion:(id)a3 result:(id)a4
{
  [(SLAssistantCommit *)self _cleanupHandler];
  v6 = (void (*)(id, id))*((void *)a3 + 2);

  v6(a3, a4);
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  [(SLAssistantCommit *)self _cleanupHandler];
  id v6 = [(SLAssistantCommit *)self identifier];
  handlerObject = self->_handlerObject;
  if (handlerObject)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_3980;
    v11[3] = &unk_8198;
    v11[4] = self;
    v11[5] = a3;
    [(SLAssistantServiceHandler *)handlerObject performPostRequestWithObject:self completion:v11];
  }
  else
  {
    id v10 = v6;
    _SLLog();
    id v8 = [+[SACommandFailed commandFailedWithReason:@"Received object of unknown type.", v10] dictionary];
    v9 = (void (*)(id, id))*((void *)a3 + 2);
    v9(a3, v8);
  }
}

- (void)performWithCompletion:(id)a3
{
}

@end