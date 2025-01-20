@interface QLStateManagerProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (QLPreviewControllerStateProtocolHostOnly)stateManager;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setStateManager:(id)a3;
@end

@implementation QLStateManagerProxy

- (BOOL)respondsToSelector:(SEL)a3
{
  return 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  p_stateManager = &self->_stateManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_stateManager);
    v8 = [v7 methodSignatureForSelector:a3];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)QLStateManagerProxy;
    v8 = [(QLStateManagerProxy *)&v10 methodSignatureForSelector:sel_dropMethod];
  }

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v7 = a3;
  p_stateManager = &self->_stateManager;
  id WeakRetained = objc_loadWeakRetained((id *)p_stateManager);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_stateManager);
    [v7 invokeWithTarget:v6];
  }
}

- (QLPreviewControllerStateProtocolHostOnly)stateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);

  return (QLPreviewControllerStateProtocolHostOnly *)WeakRetained;
}

- (void)setStateManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end