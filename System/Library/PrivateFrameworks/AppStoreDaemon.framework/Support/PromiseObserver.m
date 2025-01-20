@interface PromiseObserver
@end

@implementation PromiseObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong(&self->_errorBlock, 0);
  objc_storeStrong(&self->_valueBlock, 0);
}

@end