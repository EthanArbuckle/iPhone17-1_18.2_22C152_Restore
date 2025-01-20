@interface _CATBlockTaskOperation
- (_CATBlockTaskOperation)initWithBlock:(id)a3 request:(id)a4;
- (void)main;
@end

@implementation _CATBlockTaskOperation

- (_CATBlockTaskOperation)initWithBlock:(id)a3 request:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CATBlockTaskOperation;
  v7 = [(CATTaskOperation *)&v11 initWithRequest:a4];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x216693330](v6);
    id mBlock = v7->mBlock;
    v7->id mBlock = (id)v8;
  }
  return v7;
}

- (void)main
{
  id mBlock = (void (**)(id, void *, id *))self->mBlock;
  v4 = [(CATTaskOperation *)self request];
  id v7 = 0;
  v5 = mBlock[2](mBlock, v4, &v7);
  id v6 = v7;

  if (v6) {
    [(CATOperation *)self endOperationWithError:v6];
  }
  else {
    [(CATOperation *)self endOperationWithResultObject:v5];
  }
}

- (void).cxx_destruct
{
}

@end