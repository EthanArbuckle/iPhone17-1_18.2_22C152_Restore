@interface IKDOMXPathExpression
- (IKDOMXPathExpression)initWithAppContext:(id)a3 evaluatingBlock:(id)a4;
- (id)evaluate:(id)a3 :(int64_t)a4 :(id)a5;
- (id)evaluatingBlock;
- (void)setEvaluatingBlock:(id)a3;
@end

@implementation IKDOMXPathExpression

- (IKDOMXPathExpression)initWithAppContext:(id)a3 evaluatingBlock:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKDOMXPathExpression;
  v7 = [(IKJSObject *)&v11 initWithAppContext:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id evaluatingBlock = v7->_evaluatingBlock;
    v7->_id evaluatingBlock = (id)v8;
  }
  return v7;
}

- (id)evaluate:(id)a3 :(int64_t)a4 :(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(IKDOMXPathExpression *)self evaluatingBlock];
  v9 = ((void (**)(void, id, int64_t))v8)[2](v8, v7, a4);

  return v9;
}

- (id)evaluatingBlock
{
  return self->_evaluatingBlock;
}

- (void)setEvaluatingBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end