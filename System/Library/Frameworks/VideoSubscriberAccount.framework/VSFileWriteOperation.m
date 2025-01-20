@interface VSFileWriteOperation
- (NSError)error;
- (VSFileWriteOperation)init;
- (VSOptional)data;
- (VSOptional)destination;
- (void)executionDidBegin;
- (void)setData:(id)a3;
- (void)setDestination:(id)a3;
- (void)setError:(id)a3;
@end

@implementation VSFileWriteOperation

- (VSFileWriteOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSFileWriteOperation;
  v2 = [(VSFileWriteOperation *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    data = v2->_data;
    v2->_data = v3;

    v5 = objc_alloc_init(VSOptional);
    destination = v2->_destination;
    v2->_destination = v5;
  }
  return v2;
}

- (void)executionDidBegin
{
  v3 = [(VSFileWriteOperation *)self data];
  v4 = [v3 forceUnwrapObject];
  v5 = [(VSFileWriteOperation *)self destination];
  v6 = [v5 forceUnwrapObject];
  id v9 = 0;
  char v7 = [v4 writeToURL:v6 options:1 error:&v9];
  id v8 = v9;

  if ((v7 & 1) == 0) {
    [(VSFileWriteOperation *)self setError:v8];
  }
  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (VSOptional)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (VSOptional)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end