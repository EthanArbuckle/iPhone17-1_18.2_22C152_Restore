@interface _GEOURLManifestListenerCallbackWithQueue
- (_GEOURLManifestListenerCallbackWithQueue)initWithQueue:(id)a3 handler:(id)a4;
- (void)performHandler:(BOOL)a3;
@end

@implementation _GEOURLManifestListenerCallbackWithQueue

- (_GEOURLManifestListenerCallbackWithQueue)initWithQueue:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)_GEOURLManifestListenerCallbackWithQueue;
    v9 = [(_GEOURLManifestListenerCallbackWithQueue *)&v16 init];
    if (v9)
    {
      uint64_t v10 = [v8 copy];
      id handler = v9->_handler;
      v9->_id handler = (id)v10;

      objc_storeStrong((id *)&v9->_queue, a3);
      uint64_t v12 = voucher_copy();
      voucher = v9->_voucher;
      v9->_voucher = (OS_voucher *)v12;

      v9->_qos = qos_class_self();
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)performHandler:(BOOL)a3
{
  if (self->_queue)
  {
    v4 = (void *)[self->_handler copy];
    queue = self->_queue;
    v9 = v4;
    id v6 = v4;
    id v7 = (void *)dispatch_block_create_with_voucher_and_qos_class();
    dispatch_async(queue, v7);
  }
  else
  {
    id v8 = (void (*)(void))*((void *)self->_handler + 2);
    v8();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end