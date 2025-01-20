@interface BlockTask
- (void)main;
@end

@implementation BlockTask

- (void)main
{
  (*((void (**)(void))self->_block + 2))();
  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
}

@end