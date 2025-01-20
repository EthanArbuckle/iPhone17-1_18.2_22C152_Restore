@interface _COMediaSystemLeaderObserver
- (OS_dispatch_queue)dispatchQueue;
- (_COMediaSystemLeaderObserver)initWithDispatchQueue:(id)a3 block:(id)a4;
- (id)block;
@end

@implementation _COMediaSystemLeaderObserver

- (_COMediaSystemLeaderObserver)initWithDispatchQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_COMediaSystemLeaderObserver;
  v9 = [(_COMediaSystemLeaderObserver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    uint64_t v11 = [v8 copy];
    id block = v10->_block;
    v10->_id block = (id)v11;
  }
  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end