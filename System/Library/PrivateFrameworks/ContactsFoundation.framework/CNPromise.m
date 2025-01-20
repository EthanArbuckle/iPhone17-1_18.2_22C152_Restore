@interface CNPromise
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (CNFuture)future;
- (CNPromise)init;
- (CNPromise)initWithSchedulerProvider:(id)a3;
- (id)BOOLErrorCompletionHandlerAdapter;
- (id)completionHandlerAdapterWithDefaultValue:(id)a3;
- (id)errorOnlyCompletionHandlerAdapter;
@end

@implementation CNPromise

- (void).cxx_destruct
{
}

- (CNPromise)init
{
  v3 = +[CNSchedulerProvider defaultProvider];
  v4 = [(CNPromise *)self initWithSchedulerProvider:v3];

  return v4;
}

- (CNFuture)future
{
  return (CNFuture *)objc_getProperty(self, a2, 8, 1);
}

- (CNPromise)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPromise;
  v5 = [(CNPromise *)&v10 init];
  if (v5)
  {
    v6 = [[CNFuture alloc] initWithSchedulerProvider:v4];
    future = v5->_future;
    v5->_future = v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)finishWithResult:(id)a3
{
  return [(CNFuture *)self->_future finishWithResult:a3];
}

- (BOOL)finishWithError:(id)a3
{
  return [(CNFuture *)self->_future finishWithError:a3];
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return [(CNFuture *)self->_future finishWithResult:a3 error:a4];
}

- (id)completionHandlerAdapterWithDefaultValue:(id)a3
{
  return CNPromiseCompletionHandlerWithDefaultValue(self, a3);
}

- (id)BOOLErrorCompletionHandlerAdapter
{
  return [(CNFuture *)self->_future BOOLErrorCompletionHandlerAdapter];
}

- (id)errorOnlyCompletionHandlerAdapter
{
  return [(CNFuture *)self->_future errorOnlyCompletionHandlerAdapter];
}

@end