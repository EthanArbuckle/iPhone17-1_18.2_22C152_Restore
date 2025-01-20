@interface CUTUnsafePromiseSeal
- (CUTUnsafePromise)promise;
- (CUTUnsafePromiseSeal)init;
- (void)failWithError:(id)a3;
- (void)fulfillWithValue:(id)a3;
- (void)setPromise:(id)a3;
@end

@implementation CUTUnsafePromiseSeal

- (CUTUnsafePromiseSeal)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUTUnsafePromiseSeal;
  v2 = [(CUTUnsafePromiseSeal *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_CUTUnsafePromise);
    promise = v2->_promise;
    v2->_promise = &v3->super;
  }
  return v2;
}

- (void)fulfillWithValue:(id)a3
{
  id v4 = a3;
  id v6 = [(CUTUnsafePromiseSeal *)self promise];
  v5 = [[CUTResult alloc] initWithSuccess:v4];

  [v6 _fulfillWithResult:v5];
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  id v6 = [(CUTUnsafePromiseSeal *)self promise];
  v5 = [[CUTResult alloc] initWithError:v4];

  [v6 _fulfillWithResult:v5];
}

- (CUTUnsafePromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

@end