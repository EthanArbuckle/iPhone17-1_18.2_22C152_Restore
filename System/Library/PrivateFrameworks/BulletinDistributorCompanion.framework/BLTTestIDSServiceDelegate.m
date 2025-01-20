@interface BLTTestIDSServiceDelegate
- (IDSServiceDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation BLTTestIDSServiceDelegate

- (IDSServiceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end