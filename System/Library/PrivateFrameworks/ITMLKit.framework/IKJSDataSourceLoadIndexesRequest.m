@interface IKJSDataSourceLoadIndexesRequest
- (BOOL)isClosed;
- (IKJSDataSourceLoadIndexesRequest)initWithDataSource:(id)a3 range:(_NSRange)a4;
- (JSValue)dataSource;
- (_NSRange)range;
- (id)completion;
- (void)cancel;
- (void)close:(BOOL)a3;
- (void)dealloc;
- (void)setCompletion:(id)a3;
@end

@implementation IKJSDataSourceLoadIndexesRequest

- (IKJSDataSourceLoadIndexesRequest)initWithDataSource:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = [v7 appContext];
  v14.receiver = self;
  v14.super_class = (Class)IKJSDataSourceLoadIndexesRequest;
  v9 = [(IKJSObject *)&v14 initWithAppContext:v8];

  if (v9)
  {
    objc_storeWeak((id *)&v9->_dataSource, v7);
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    v10 = [(IKJSObject *)v9 appContext];
    v11 = [v10 jsContext];

    v12 = [v11 virtualMachine];
    [v12 addManagedReference:v7 withOwner:v9];
  }
  return v9;
}

- (void)dealloc
{
  [(IKJSDataSourceLoadIndexesRequest *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)IKJSDataSourceLoadIndexesRequest;
  [(IKJSDataSourceLoadIndexesRequest *)&v3 dealloc];
}

- (JSValue)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_super v3 = [WeakRetained exportValue];

  return (JSValue *)v3;
}

- (void)cancel
{
  if (![(IKJSDataSourceLoadIndexesRequest *)self isClosed])
  {
    self->_state = 1;
    [(IKJSEventListenerObject *)self invokeListeners:@"cancel" extraInfo:0];
    objc_super v3 = [(IKJSDataSourceLoadIndexesRequest *)self completion];

    if (v3)
    {
      v4 = [(IKJSDataSourceLoadIndexesRequest *)self completion];
      v4[2](v4, 0);
    }
  }
}

- (BOOL)isClosed
{
  return self->_state == 1;
}

- (void)close:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(IKJSDataSourceLoadIndexesRequest *)self isClosed])
  {
    v5 = [(IKJSDataSourceLoadIndexesRequest *)self completion];

    if (v5)
    {
      v6 = [(IKJSDataSourceLoadIndexesRequest *)self completion];
      v6[2](v6, v3);
    }
  }
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end