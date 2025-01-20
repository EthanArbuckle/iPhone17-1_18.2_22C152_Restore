@interface MPAsyncBlockOperation
- (MPAsyncBlockOperation)initWithStartHandler:(id)a3;
- (id)startHandler;
- (void)execute;
@end

@implementation MPAsyncBlockOperation

- (MPAsyncBlockOperation)initWithStartHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPAsyncBlockOperation;
  v5 = [(MPAsyncOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x19971E0F0](v4);
    id startHandler = v5->_startHandler;
    v5->_id startHandler = (id)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)execute
{
}

- (id)startHandler
{
  return self->_startHandler;
}

@end