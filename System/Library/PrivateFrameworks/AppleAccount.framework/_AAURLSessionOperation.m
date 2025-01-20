@interface _AAURLSessionOperation
+ (id)operationWithCompletion:(id)a3;
- (NSData)data;
- (_AAURLSessionOperation)init;
- (_AAURLSessionOperation)initWithCompletion:(id)a3;
- (id)completion;
- (void)appendData:(id)a3;
- (void)invokeCompletionWithResponse:(id)a3 error:(id)a4;
@end

@implementation _AAURLSessionOperation

+ (id)operationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCompletion:v4];

  return v5;
}

- (_AAURLSessionOperation)init
{
  return 0;
}

- (_AAURLSessionOperation)initWithCompletion:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_AAURLSessionOperation;
  v5 = [(_AAURLSessionOperation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = (id)v6;

    mutableData = v5->_mutableData;
    v5->_mutableData = 0;
  }
  return v5;
}

- (NSData)data
{
  v2 = (void *)[(NSMutableData *)self->_mutableData copy];

  return (NSData *)v2;
}

- (void)appendData:(id)a3
{
  mutableData = self->_mutableData;
  if (mutableData)
  {
    [(NSMutableData *)mutableData appendData:a3];
  }
  else
  {
    self->_mutableData = (NSMutableData *)[a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)invokeCompletionWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = v6;
  id v8 = v7;
  if ((v12 == 0) != (v8 != 0))
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid exclusivity not satisfying: response ^ error" userInfo:0];
    objc_exception_throw(v11);
  }

  id completion = (void (**)(id, void *, id, id))self->_completion;
  objc_super v10 = [(_AAURLSessionOperation *)self data];
  completion[2](completion, v10, v12, v8);
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_mutableData, 0);
}

@end