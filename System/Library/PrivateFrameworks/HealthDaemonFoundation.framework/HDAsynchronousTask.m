@interface HDAsynchronousTask
- (void)setQueue:(uint64_t)a1;
@end

@implementation HDAsynchronousTask

- (void)setQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_checkpointHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end