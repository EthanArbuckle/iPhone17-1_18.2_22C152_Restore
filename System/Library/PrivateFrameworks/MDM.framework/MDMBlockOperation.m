@interface MDMBlockOperation
+ (MDMBlockOperation)blockOperationWithBlock:(id)a3;
- (BOOL)isAsynchronous;
- (id)block;
- (void)main;
- (void)setBlock:(id)a3;
@end

@implementation MDMBlockOperation

+ (MDMBlockOperation)blockOperationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setBlock:v3];

  return (MDMBlockOperation *)v4;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v3 = (void *)MEMORY[0x230FC61D0](self, a2);
  v4 = objc_opt_new();
  [v4 setOperation:self];
  v5 = [(MDMBlockOperation *)self block];
  ((void (**)(void, void *))v5)[2](v5, v4);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end