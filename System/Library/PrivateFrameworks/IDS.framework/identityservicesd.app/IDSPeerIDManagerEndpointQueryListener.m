@interface IDSPeerIDManagerEndpointQueryListener
- (IDSPeerIDManagerEndpointQueryListener)initWithQueryCompletionBlock:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)queryCompletionBlock;
@end

@implementation IDSPeerIDManagerEndpointQueryListener

- (IDSPeerIDManagerEndpointQueryListener)initWithQueryCompletionBlock:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSPeerIDManagerEndpointQueryListener;
  v8 = [(IDSPeerIDManagerEndpointQueryListener *)&v12 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id queryCompletionBlock = v8->_queryCompletionBlock;
    v8->_id queryCompletionBlock = v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (id)queryCompletionBlock
{
  return self->_queryCompletionBlock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_queryCompletionBlock, 0);
}

@end