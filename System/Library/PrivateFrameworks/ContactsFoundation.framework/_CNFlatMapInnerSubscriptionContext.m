@interface _CNFlatMapInnerSubscriptionContext
- (CNCancelable)token;
- (CNSuspendableSchedulerDecorator)decorator;
- (_CNFlatMapInnerSubscriptionContext)initWithDecorator:(id)a3 token:(id)a4;
@end

@implementation _CNFlatMapInnerSubscriptionContext

- (_CNFlatMapInnerSubscriptionContext)initWithDecorator:(id)a3 token:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNFlatMapInnerSubscriptionContext;
  v9 = [(_CNFlatMapInnerSubscriptionContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_decorator, a3);
    objc_storeStrong((id *)&v10->_token, a4);
    v11 = v10;
  }

  return v10;
}

- (CNSuspendableSchedulerDecorator)decorator
{
  return self->_decorator;
}

- (CNCancelable)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_decorator, 0);
}

@end