@interface IDSDaemonResponseHandler
- (BOOL)isSync;
- (IDSDaemonResponseHandler)initWithBlock:(id)a3 queue:(id)a4;
- (IDSDaemonResponseHandler)initWithBlock:(id)a3 queue:(id)a4 isSync:(BOOL)a5;
- (OS_dispatch_queue)queue;
- (id)block;
@end

@implementation IDSDaemonResponseHandler

- (IDSDaemonResponseHandler)initWithBlock:(id)a3 queue:(id)a4
{
  return [(IDSDaemonResponseHandler *)self initWithBlock:a3 queue:a4 isSync:0];
}

- (IDSDaemonResponseHandler)initWithBlock:(id)a3 queue:(id)a4 isSync:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSDaemonResponseHandler;
  v10 = [(IDSDaemonResponseHandler *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v12 = [v8 copy];
    id block = v11->_block;
    v11->_id block = (id)v12;

    v11->_isSync = a5;
  }

  return v11;
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isSync
{
  return self->_isSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end