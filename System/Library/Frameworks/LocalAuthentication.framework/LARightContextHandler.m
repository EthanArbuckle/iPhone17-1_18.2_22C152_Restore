@interface LARightContextHandler
- (LAContext)context;
- (LARightContextHandler)init;
- (LARightContextHandler)initWithDelegate:(id)a3;
- (LARightContextHandlerDelegate)delegate;
- (void)contextDidBecomeInvalid:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation LARightContextHandler

- (LARightContextHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)LARightContextHandler;
  v2 = [(LARightContextHandler *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(LAContext);
    [(LARightContextHandler *)v2 setContext:v3];
  }
  return v2;
}

- (LARightContextHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(LARightContextHandler *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setContext:(id)a3
{
  objc_super v5 = (LAContext *)a3;
  context = self->_context;
  if (context != v5)
  {
    v7 = v5;
    if (context)
    {
      [(LAContext *)context removeContextObserver:self];
      [(LAContext *)self->_context invalidate];
    }
    objc_storeStrong((id *)&self->_context, a3);
    context = (LAContext *)[(LAContext *)self->_context addContextObserver:self];
    objc_super v5 = v7;
  }

  MEMORY[0x1F41817F8](context, v5);
}

- (void)contextDidBecomeInvalid:(id)a3
{
  if (self->_context == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained rightContextDidBecomeInvalid];
  }
}

- (LARightContextHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LARightContextHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LAContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end