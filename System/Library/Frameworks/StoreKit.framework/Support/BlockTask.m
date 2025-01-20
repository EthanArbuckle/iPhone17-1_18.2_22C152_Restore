@interface BlockTask
- (BlockTask)initWithBlock:(id)a3;
- (void)main;
@end

@implementation BlockTask

- (BlockTask)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BlockTask;
  v5 = [(Task *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = v6;
  }
  return v5;
}

- (void)main
{
  (*((void (**)(void))self->_block + 2))();

  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
}

@end