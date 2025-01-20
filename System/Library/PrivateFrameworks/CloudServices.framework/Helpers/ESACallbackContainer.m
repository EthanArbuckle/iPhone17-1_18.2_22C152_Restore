@interface ESACallbackContainer
- (ESACallbackContainer)initWithCallback:(id)a3;
- (void)operationLogger:(id)a3 didUpdateWithResult:(id)a4;
@end

@implementation ESACallbackContainer

- (ESACallbackContainer)initWithCallback:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ESACallbackContainer;
  v5 = [(ESACallbackContainer *)&v10 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id callback = v5->_callback;
    v5->_id callback = v6;

    v8 = v5;
  }

  return v5;
}

- (void)operationLogger:(id)a3 didUpdateWithResult:(id)a4
{
}

- (void).cxx_destruct
{
}

@end