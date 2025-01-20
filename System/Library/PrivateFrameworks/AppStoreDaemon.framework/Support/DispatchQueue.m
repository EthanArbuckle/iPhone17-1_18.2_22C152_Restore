@interface DispatchQueue
- (void)scheduleBlock:(id)a3;
@end

@implementation DispatchQueue

- (void)scheduleBlock:(id)a3
{
  if (self) {
    dispatch_async((dispatch_queue_t)self->_queue, a3);
  }
}

- (void).cxx_destruct
{
}

@end